@interface ICContentTasteRequestHandler
- (ICContentTasteRequestHandler)initWithConfiguration:(id)a3;
- (id)description;
- (void)_postContentTasteChanges:(id)a3 withCompletionHandler:(id)a4;
- (void)_postPendingContentTasteChangesByAddingChange:(id)a3 completionHandler:(id)a4;
- (void)_schedulePostingContentTasteForFailedItems;
- (void)_scheduleUpdatingContentTasteWithNewExpirationDate;
- (void)cancelAllOperationsAndClearPendingChangesWithCompletionHandler:(id)a3;
- (void)updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5;
- (void)updateContentTasteForReason:(int64_t)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation ICContentTasteRequestHandler

- (ICContentTasteRequestHandler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ICContentTasteRequestHandler;
  v5 = -[ICContentTasteRequestHandler init](&v23, "init");
  if (v5)
  {
    v6 = (ICConnectionConfiguration *)[v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](v5->_configuration, "userIdentity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountDSID]);

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.amp.iTunesCloud.ICContentTasteRequestHandler-%lu",  [v9 hash]));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.default", v10));
    defaultContentTasteRefreshIdentifier = v5->_defaultContentTasteRefreshIdentifier;
    v5->_defaultContentTasteRefreshIdentifier = (NSString *)v11;

    id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@.queue", v10));
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v16;

    v18 = v5->_operationQueue;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.operationQueue",  v10));
    -[NSOperationQueue setName:](v18, "setName:", v19);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v5->_operationQueue, "setQualityOfService:", 25LL);
    -[NSOperationQueue setUnderlyingQueue:](v5->_operationQueue, "setUnderlyingQueue:", v5->_queue);
    v20 = -[ICContentTastePendingChangesCoordinator initWithConfiguration:]( objc_alloc(&OBJC_CLASS___ICContentTastePendingChangesCoordinator),  "initWithConfiguration:",  v4);
    pendingChangesCoordinator = v5->_pendingChangesCoordinator;
    v5->_pendingChangesCoordinator = v20;

    v5->_backOffIndex = 0LL;
    v5->_retryState = 0LL;
    v5->_isHandlerValid = 1;
    -[ICContentTasteRequestHandler _schedulePostingContentTasteForFailedItems]( v5,  "_schedulePostingContentTasteForFailedItems");
  }

  return v5;
}

- (void)updateContentTasteForReason:(int64_t)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009136C;
  v11[3] = &unk_1001A4140;
  BOOL v14 = a4;
  id v12 = v8;
  int64_t v13 = a3;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000911CC;
  v13[3] = &unk_1001A4168;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)cancelAllOperationsAndClearPendingChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100090FC8;
  v7[3] = &unk_1001A6BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountDSID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p [dsid=%@]",  v5,  self,  v7));

  return v8;
}

- (void)_scheduleUpdatingContentTasteWithNewExpirationDate
{
  uint64_t v4 = v3;
  -[NSDate timeIntervalSinceNow](self->_responseExpirationDate, "timeIntervalSinceNow");
  double v6 = v5;
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (uint64_t)v6);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  -[NSDate timeIntervalSince1970](self->_responseExpirationDate, "timeIntervalSince1970");
  xpc_dictionary_set_double(v7, "MediaContentTasteResponseExpirationTimeKey", v8);
  id v9 = -[NSString UTF8String](self->_defaultContentTasteRefreshIdentifier, "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100090D38;
  handler[3] = &unk_1001A4190;
  id v12 = v7;
  int64_t v13 = self;
  uint64_t v14 = v4;
  id v10 = v7;
  xpc_activity_register(v9, XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)_schedulePostingContentTasteForFailedItems
{
  if (self->_retryState)
  {
    uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@  we already have a retry operation scheduled",  buf,  0xCu);
    }
  }

  else
  {
    self->_int64_t retryState = 1LL;
    uint64_t v4 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t backOffIndex = self->_backOffIndex;
      int v6 = dword_10013B530[backOffIndex];
      int64_t retryState = self->_retryState;
      *(_DWORD *)buf = 138544130;
      id v12 = self;
      __int16 v13 = 1024;
      int v14 = retryState;
      __int16 v15 = 1024;
      int v16 = backOffIndex;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@  setting retryState=%d, _backOffIndex%d, backOffSeconds=%d",  buf,  0x1Eu);
    }

    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * dword_10013B530[self->_backOffIndex]);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100090C6C;
    block[3] = &unk_1001A6B90;
    block[4] = self;
    dispatch_after(v8, queue, block);
  }

- (void)_postPendingContentTasteChangesByAddingChange:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  __int16 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  __int16 v15 = sub_100090858;
  int v16 = &unk_1001A41B8;
  id v17 = v7;
  int v18 = self;
  id v19 = v8;
  SEL v20 = a2;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 initWithStartHandler:&v13];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12, v13, v14, v15, v16);
}

- (void)_postContentTasteChanges:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v68 = self;
    __int16 v69 = 1024;
    *(_DWORD *)v70 = [v6 count];
    *(_WORD *)&v70[4] = 2114;
    *(void *)&v70[6] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ change count=%d, contentTasteChange=%{public}@",  buf,  0x1Cu);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v9 = v6;
  id v59 = [v9 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (!v59)
  {

    unsigned int v11 = 0;
    char v34 = 0;
    id v55 = 0LL;
    v32 = v9;
    goto LABEL_38;
  }

  id obj = v9;
  LOBYTE(v11) = 0;
  char v54 = 0;
  id v55 = 0LL;
  uint64_t v58 = *(void *)v64;
  *(void *)&__int128 v10 = 138543874LL;
  __int128 v49 = v10;
  id v57 = v7;
  do
  {
    id v12 = 0LL;
    do
    {
      if (*(void *)v64 != v58) {
        objc_enumerationMutation(obj);
      }
      __int16 v13 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "objectForKey:",  @"ContentTastePendingChangesCoordinatorOperationIdentifierKey",  v49));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKey:@"ContentTastePendingChangesCoordinatorPendingChangesKey"]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 objectForKey:@"ContentTastePendingChangesCoordinatorContentTasteItemKey"]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKey:@"ContentTastePendingChangesCoordinatorPendingChangesKey"]);
      int v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 objectForKey:@"ContentTastePendingChangesCoordinatorInvalidateCacheKey"]);
      id v19 = [v18 BOOLValue];

      if ((v11 & 1) != 0) {
        unsigned int v11 = 1;
      }
      else {
        unsigned int v11 = [v14 isEqualToString:@"ICContentTasteRequestHandlerRetryTaskIdentifier"];
      }
      SEL v20 = -[ICCloudContentTasteUpdateOperation initWithContentTasteUpdateItem:invalidateLocalCache:configuration:operationIdentifier:]( objc_alloc(&OBJC_CLASS___ICCloudContentTasteUpdateOperation),  "initWithContentTasteUpdateItem:invalidateLocalCache:configuration:operationIdentifier:",  v16,  v19,  self->_configuration,  v14);
      -[ICCloudContentTasteUpdateOperation main](v20, "main");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContentTasteUpdateOperation error](v20, "error"));
      v22 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_retainBlock(v7);
        *(_DWORD *)buf = 138544386;
        v68 = self;
        __int16 v69 = 2048;
        *(void *)v70 = v20;
        *(_WORD *)&v70[8] = 2114;
        *(void *)&v70[10] = v14;
        __int16 v71 = 2048;
        id v72 = v23;
        __int16 v73 = 2114;
        v74 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@  Operation=%p (identifier=%{public}@ finished with completion=%p, error=%{public}@",  buf,  0x34u);

        id v7 = v57;
      }

      -[ICContentTastePendingChangesCoordinator contentTasteUpdateOperation:finishedByInvalidatingCache:error:]( self->_pendingChangesCoordinator,  "contentTasteUpdateOperation:finishedByInvalidatingCache:error:",  v20,  v19,  v21);
      if (v21)
      {
        char v54 = 1;
        if (!v7) {
          goto LABEL_16;
        }
LABEL_15:
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100090848;
        block[3] = &unk_1001A6BB8;
        id v62 = v7;
        id v61 = v21;
        dispatch_async(v25, block);

        goto LABEL_16;
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue( -[ICCloudContentTasteUpdateOperation contentTasteUpdateResponse]( v20,  "contentTasteUpdateResponse"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 expirationDate]);

      id v28 = v55;
      if (v55)
      {
        if (v27)
        {
          [v27 timeIntervalSinceDate:v55];
          if (v29 > 3600.0)
          {
            id v28 = v27;

            v30 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
              id v56 = (id)objc_claimAutoreleasedReturnValue([v28 descriptionWithLocale:v52]);
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
              v50 = (void *)objc_claimAutoreleasedReturnValue([v28 descriptionWithLocale:v51]);
              *(_DWORD *)buf = v49;
              v68 = self;
              __int16 v69 = 2114;
              *(void *)v70 = v56;
              *(_WORD *)&v70[8] = 2114;
              *(void *)&v70[10] = v50;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@  response expiration date changed. previous date = %{public}@, updated date = %{public}@",  buf,  0x20u);
            }
          }
        }
      }

      else
      {
        id v28 = v27;
      }

      id v55 = v28;
      id v7 = v57;
      if (v57) {
        goto LABEL_15;
      }
LABEL_16:

      id v12 = (char *)v12 + 1;
    }

    while (v59 != v12);
    id v31 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
    id v59 = v31;
  }

  while (v31);
  v32 = obj;

  responseExpirationDate = self->_responseExpirationDate;
  char v34 = v54;
  if (!responseExpirationDate && v55
    || responseExpirationDate && v55 && (objc_msgSend(v55, "timeIntervalSinceDate:"), v35 > 3600.0))
  {
    v36 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_responseExpirationDate;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate descriptionWithLocale:](v37, "descriptionWithLocale:", v38));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v55 descriptionWithLocale:v40]);
      *(_DWORD *)buf = v49;
      v68 = self;
      __int16 v69 = 2114;
      *(void *)v70 = v39;
      *(_WORD *)&v70[8] = 2114;
      *(void *)&v70[10] = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@  response expiration date changed. old date = %{public}@, new date = %{public}@",  buf,  0x20u);

      id v7 = v57;
    }

    objc_storeStrong((id *)&self->_responseExpirationDate, v55);
    -[ICContentTasteRequestHandler _scheduleUpdatingContentTasteWithNewExpirationDate]( self,  "_scheduleUpdatingContentTasteWithNewExpirationDate");
    if ((v54 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_41:
    if (v11)
    {
      int64_t backOffIndex = self->_backOffIndex;
      if (backOffIndex <= 4) {
        self->_int64_t backOffIndex = backOffIndex + 1;
      }
    }

    v47 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v48 = self->_backOffIndex;
      *(_DWORD *)buf = 138544130;
      v68 = self;
      __int16 v69 = 1024;
      *(_DWORD *)v70 = 1;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v11;
      *(_WORD *)&v70[10] = 1024;
      *(_DWORD *)&v70[12] = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%{public}@  scheduleRetry=%{BOOL}u, isRetryTask=%{BOOL}u, _backOffIndex=%d",  buf,  0x1Eu);
    }

    -[ICContentTasteRequestHandler _schedulePostingContentTasteForFailedItems]( self,  "_schedulePostingContentTasteForFailedItems");
    goto LABEL_47;
  }

- (void).cxx_destruct
{
}

@end