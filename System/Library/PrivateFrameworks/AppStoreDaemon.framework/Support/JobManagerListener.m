@interface JobManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (JobManagerListener)init;
- (void)_handleLegacyNotifications:(id)a3;
- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)finishJobsWithIDs:(id)a3 replyBlock:(id)a4;
- (void)getJobsUsingReplyBlock:(id)a3;
- (void)getJobsWithIDs:(id)a3 usingReplyBlock:(id)a4;
- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)registerJobManagerWithOptions:(id)a3 replyBlock:(id)a4;
- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4;
@end

@implementation JobManagerListener

- (JobManagerListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___JobManagerListener;
  v2 = -[JobManagerListener init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.JobManagerListener", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    progress = v2->_progress;
    v2->_progress = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_handleLegacyNotifications:" name:@"LegacyNotifications" object:0];
  }

  return v2;
}

- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100279CF4;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)finishJobsWithIDs:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027A00C;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)getJobsUsingReplyBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027A228;
  block[3] = &unk_1003EA390;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)getJobsWithIDs:(id)a3 usingReplyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027A43C;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027A71C;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)registerJobManagerWithOptions:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027A974;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027AC64;
  v13[3] = &unk_1003EA5C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)_handleLegacyNotifications:(id)a3
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object", 0));
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"identifier"]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"kind"]);
        if ([v11 isEqualToString:@"import"])
        {
          v40 = v10;
          id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v40,  1LL));
          id v13 = v12;
          if (self)
          {
            dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472LL;
            v29 = sub_10027C93C;
            v30 = &unk_1003E9DC0;
            v31 = self;
            id v32 = v12;
            dispatch_async(dispatchQueue, &block);
          }
        }

        else if ([v11 isEqualToString:@"state"])
        {
          id v13 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"phase"]);
          v38 = v10;
          id v39 = v13;
          id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
          id v16 = v15;
          if (self)
          {
            v17 = (dispatch_queue_s *)self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472LL;
            v29 = sub_10027CED4;
            v30 = &unk_1003E9DC0;
            v31 = self;
            id v32 = v15;
            dispatch_async(v17, &block);
          }
        }

        else if ([v11 isEqualToString:@"finish"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"phase"]);
          v36 = v10;
          v37 = &off_10040CCE8;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
          sub_10027B1B0((uint64_t)self, v19);

          id v20 = v10;
          id v13 = v18;
          if (self)
          {
            v21 = (dispatch_queue_s *)self->_dispatchQueue;
            block = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472LL;
            v29 = sub_10027CA08;
            v30 = &unk_1003E97D0;
            v31 = self;
            id v32 = v20;
            id v33 = v13;
            dispatch_async(v21, &block);
          }
        }

        else
        {
          id v13 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"fraction"]);
          v34 = v10;
          id v35 = v13;
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
          sub_10027B1B0((uint64_t)self, v22);
        }

LABEL_21:
      }

      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v41 count:16];
    }

    while (v6);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  uint64_t v7 = ASDLogHandleForCategory(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = objc_opt_class(self, v9);
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    id v10 = *(id *)&buf[4];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%@]: Treating %i as legacy client", buf, 0x12u);
  }

  if (sub_1001D2660((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_5:
    id v11 = v5;
    id v12 = v11;
    if (self)
    {
      unsigned int v13 = [v11 processIdentifier];
      uint64_t v14 = ASDLogHandleForCategory(9LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_opt_class(self, v16);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        id v18 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[%{public}@]: Got connection from pid: %i",  buf,  0x12u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDJobManager));
      [v12 setExportedInterface:v19];
      [v12 setExportedObject:self];
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDJobManagerClient));
      [v12 setRemoteObjectInterface:v20];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v12);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10027C700;
      v30[3] = &unk_1003E9E60;
      objc_copyWeak(&v31, &location);
      unsigned int v32 = v13;
      [v12 setInterruptionHandler:v30];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10027C7E4;
      v36 = &unk_1003E9E88;
      objc_copyWeak(&v37, &location);
      objc_copyWeak(&v38, &from);
      unsigned int v39 = v13;
      [v12 setInvalidationHandler:buf];
      [v12 resume];
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10027B9D8;
    v27[3] = &unk_1003E9DC0;
    id v28 = v12;
    v29 = self;
    dispatch_async(dispatchQueue, v27);

    BOOL v22 = 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int128 v25 = (void *)objc_opt_class(self, v23);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      id v26 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[%@]: Connection denied for pid: %i for non entitled client",  buf,  0x12u);
    }

    BOOL v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
}

@end