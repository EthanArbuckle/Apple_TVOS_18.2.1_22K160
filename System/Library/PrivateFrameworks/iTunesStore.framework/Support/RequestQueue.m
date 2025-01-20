@interface RequestQueue
- (ISOperationQueue)operationQueue;
- (RequestQueue)init;
- (id)operationForConnection:(id)a3;
- (void)_cancelRequest:(id)a3 connection:(id)a4;
- (void)_disconnectRequest:(id)a3 connection:(id)a4;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)cancelOperationForConnection:(id)a3;
- (void)dealloc;
- (void)disconnectOperationForConnection:(id)a3;
- (void)observeXPCServer:(id)a3;
- (void)setClient:(id)a3 forOperation:(id)a4;
- (void)setOperationQueue:(id)a3;
@end

@implementation RequestQueue

- (RequestQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RequestQueue;
  v2 = -[RequestQueue init](&v5, "init");
  if (v2)
  {
    v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.%@.%p",  objc_opt_class(v2),  v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v3, "UTF8String"), 0LL);
  }

  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RequestQueue;
  -[RequestQueue dealloc](&v4, "dealloc");
}

- (void)addOperation:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100056428;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000564F4;
  v8[3] = &unk_10034C538;
  v8[4] = a3;
  v8[5] = a5;
  [a3 setCompletionBlock:v8];
  -[RequestQueue addOperation:](self, "addOperation:", a3);
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100056658;
  v12[3] = &unk_10034C560;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  [a3 setCompletionBlock:v12];
  v11 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a5);
  objc_setAssociatedObject(a3, "com.apple.itunesstored.RequestQueue.client", v11, (void *)0x301);
  -[RequestQueue addOperation:](self, "addOperation:", a3);
}

- (void)cancelOperationForConnection:(id)a3
{
  id v4 = -[RequestQueue operationForConnection:](self, "operationForConnection:", a3);
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    v9 = (os_log_s *)[v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v12 = 138412546;
      uint64_t v13 = objc_opt_class(self);
      __int16 v14 = 2112;
      v15 = v5;
      uint64_t v10 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Cancel operation: %@",  &v12,  22);
      if (v10)
      {
        v11 = (void *)v10;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
        free(v11);
        SSFileLog(v6, @"%@");
      }
    }

    objc_setAssociatedObject(v5, "com.apple.itunesstored.RequestQueue.client", 0LL, (void *)0x301);
    [v5 cancel];
  }

- (void)disconnectOperationForConnection:(id)a3
{
  id v4 = -[RequestQueue operationForConnection:](self, "operationForConnection:", a3);
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    v9 = (os_log_s *)[v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v12 = 138412546;
      uint64_t v13 = objc_opt_class(self);
      __int16 v14 = 2112;
      v15 = v5;
      uint64_t v10 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Disconnect operation: %@",  &v12,  22);
      if (v10)
      {
        v11 = (void *)v10;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
        free(v11);
        SSFileLog(v6, @"%@");
      }
    }

    objc_setAssociatedObject(v5, "com.apple.itunesstored.RequestQueue.client", 0LL, (void *)0x301);
  }

- (void)observeXPCServer:(id)a3
{
}

- (id)operationForConnection:(id)a3
{
  id v4 = -[RequestQueue operationQueue](self, "operationQueue");
  if (!v4) {
    id v4 = (ISOperationQueue *)+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue");
  }
  id v5 = -[ISOperationQueue operations](v4, "operations");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id AssociatedObject = objc_getAssociatedObject(v10, "com.apple.itunesstored.RequestQueue.client");
        if (AssociatedObject)
        {
          id v12 = [AssociatedObject copyInputConnection];
          if (v12 == a3)
          {
            xpc_release(a3);
            return v10;
          }

          xpc_release(v12);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

- (ISOperationQueue)operationQueue
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100056C3C;
  uint64_t v10 = sub_100056C4C;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056C58;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (ISOperationQueue *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClient:(id)a3 forOperation:(id)a4
{
}

- (void)setOperationQueue:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100056CF8;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)_cancelRequest:(id)a3 connection:(id)a4
{
}

- (void)_disconnectRequest:(id)a3 connection:(id)a4
{
}

@end