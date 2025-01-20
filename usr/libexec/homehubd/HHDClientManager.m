@interface HHDClientManager
- (BOOL)addClientWithConnection:(id)a3;
- (HHDClientManager)initWithQueue:(id)a3;
- (void)_handleConnectionInvalidation:(id)a3;
- (void)_handleRequestInvocation:(id)a3 replyTypeEncoding:(id)a4 error:(id)a5;
- (void)_handleRequestInvocation:(id)a3 replyTypeEncoding:(id)a4 replyLogging:(BOOL)a5 connection:(id)a6;
- (void)_removeClientWithConnection:(id)a3;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dispatchNotificationWithInvocation:(id)a3;
@end

@implementation HHDClientManager

- (HHDClientManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HHDClientManager;
  v6 = -[HHDClientManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    clientConnections = v7->_clientConnections;
    v7->_clientConnections = (NSMutableSet *)v8;
  }

  return v7;
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
}

- (BOOL)addClientWithConnection:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_clientConnections, "containsObject:", v4))
  {
    id v5 = sub_100004FB8();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      __int16 v25 = 2048;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Attempting to add duplicate client (conn=%p)",  buf,  0x16u);
    }

    BOOL v7 = 0;
  }

  else
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[HHDClientProxy clientProxyWithServiceRegistry:connection:]( &OBJC_CLASS___HHDClientProxy,  "clientProxyWithServiceRegistry:connection:",  self->_serviceRegistry,  v4));
    BOOL v7 = v6 != 0LL;
    if (v6)
    {
      if (qword_10002E570 != -1) {
        dispatch_once(&qword_10002E570, &stru_1000247A0);
      }
      [v4 setExportedInterface:qword_10002E568];
      [v4 setExportedObject:v6];
      if (qword_10002E580 != -1) {
        dispatch_once(&qword_10002E580, &stru_1000247C0);
      }
      [v4 setRemoteObjectInterface:qword_10002E578];
      [v4 _setQueue:self->_queue];
      [v4 setDelegate:self];
      objc_initWeak(&location, v4);
      objc_initWeak(&from, self);
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      v17 = sub_100004FF8;
      v18 = &unk_100024738;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, &from);
      [v4 setInvalidationHandler:&v15];
      -[NSMutableSet addObject:](self->_clientConnections, "addObject:", v4, v15, v16, v17, v18);
      id v8 = sub_100004FB8();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s processName](v6, "processName"));
          unsigned int v12 = [v4 processIdentifier];
          id v13 = -[NSMutableSet count](self->_clientConnections, "count");
          *(_DWORD *)buf = 138413058;
          v24 = &stru_100024E50;
          __int16 v25 = 2114;
          id v26 = v11;
          __int16 v27 = 1024;
          unsigned int v28 = v12;
          __int16 v29 = 2048;
          id v30 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@Added new client [name='%{public}@', pid=%d], client list size %ld",  buf,  0x26u);
        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)_handleConnectionInvalidation:(id)a3
{
  id v4 = a3;
  -[HHDClientManager _removeClientWithConnection:](self, "_removeClientWithConnection:", v4);
  id v5 = sub_100004FB8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProxy]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 processName]);
    unsigned int v9 = [v4 processIdentifier];
    id v10 = -[NSMutableSet count](self->_clientConnections, "count");
    int v11 = 138413058;
    unsigned int v12 = &stru_100024E50;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 1024;
    unsigned int v16 = v9;
    __int16 v17 = 2048;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@Client [name='%{public}@', pid=%d] disconnected, client list size %ld",  (uint8_t *)&v11,  0x26u);
  }
}

- (void)_removeClientWithConnection:(id)a3
{
}

- (void)_handleRequestInvocation:(id)a3 replyTypeEncoding:(id)a4 error:(id)a5
{
  id v15 = a5;
  id v7 = a4;
  id v8 = a3;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( NSMethodSignature,  "signatureWithObjCTypes:",  [v7 UTF8String]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v9));
  id v12 = objc_msgSend(v9, "getArgumentIndexForClass:", objc_opt_class(NSError, v11));
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = v12;
    [v10 retainArguments];
    [v10 setArgument:&v15 atIndex:v13];
  }

  uint64_t v14 = 0LL;
  objc_msgSend(v8, "getArgument:atIndex:", &v14, objc_msgSend(v8, "getBlockArgumentIndex"));

  [v10 setTarget:v14];
  [v10 invoke];
}

- (void)_handleRequestInvocation:(id)a3 replyTypeEncoding:(id)a4 replyLogging:(BOOL)a5 connection:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = v11;
  if (a5)
  {
    id v13 = [v11 getBlockArgumentIndex];
    id v25 = 0LL;
    [v12 getArgument:&v25 atIndex:v13];
    uint64_t v14 = NSStringFromSelector((SEL)[v12 selector]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = [v25 copy];
    id v17 = [v9 UTF8String];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000053D4;
    v20[3] = &unk_100024760;
    id v22 = v16;
    id v23 = v10;
    id v21 = v15;
    id v18 = v16;
    id v19 = v15;
    id v24 = (id)__NSMakeSpecialForwardingCaptureBlock(v17, v20);
    [v12 setArgument:&v24 atIndex:v13];
    [v12 invoke];
  }

  else
  {
    [v11 invoke];
  }
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    [v9 invoke];
  }

  else
  {
    BOOL v11 = +[SystemVariant isInternal](&OBJC_CLASS___SystemVariant, "isInternal");
    unsigned int v12 = [v8 processIdentifier];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProxy]);
    if (v11)
    {
      id v14 = sub_100004FB8();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 processName]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 invocationDescription]);
        int v27 = 138413314;
        unsigned int v28 = &stru_100024E50;
        __int16 v29 = 2114;
        id v30 = v16;
        __int16 v31 = 1024;
        unsigned int v32 = v12;
        __int16 v33 = 2048;
        id v34 = v8;
        __int16 v35 = 2112;
        v36 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@Client [name='%{public}@', pid=%d] (conn=%p) invoking %@",  (uint8_t *)&v27,  0x30u);
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 exportedInterface]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyBlockSignatureForSelector:", objc_msgSend(v10, "selector")));

    id v20 = (const char *)[v10 selector];
    if ([v13 clientEntitledForRequestWithSelector:v20])
    {
      if (v19) {
        -[HHDClientManager _handleRequestInvocation:replyTypeEncoding:replyLogging:connection:]( self,  "_handleRequestInvocation:replyTypeEncoding:replyLogging:connection:",  v10,  v19,  v11,  v8);
      }
      else {
        [v10 invoke];
      }
    }

    else
    {
      id v21 = sub_100004FB8();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 processName]);
        id v24 = NSStringFromSelector(v20);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        int v27 = 138413314;
        unsigned int v28 = &stru_100024E50;
        __int16 v29 = 2114;
        id v30 = v23;
        __int16 v31 = 1024;
        unsigned int v32 = v12;
        __int16 v33 = 2048;
        id v34 = v8;
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@Client [name='%{public}@', pid=%d] (conn=%p) entitlement failed for request: \"%@\"",  (uint8_t *)&v27,  0x30u);
      }

      if (v19)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  13LL,  0LL));
        -[HHDClientManager _handleRequestInvocation:replyTypeEncoding:error:]( self,  "_handleRequestInvocation:replyTypeEncoding:error:",  v10,  v19,  v26);
      }
    }
  }
}

- (void)dispatchNotificationWithInvocation:(id)a3
{
  id v4 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  int v27 = self;
  BOOL v5 = self->_clientConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v31;
    unsigned int v28 = v5;
    do
    {
      id v10 = 0LL;
      id v29 = v7;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v10);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientProxy]);
        id v13 = (const char *)[v4 selector];
        if ([v12 clientRegisteredForSelector:v13])
        {
          if ([v12 clientEntitledForNotificationWithSelector:v13])
          {
            ++v8;
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxy]);
            [v4 invokeWithTarget:v14];
          }

          else
          {
            id v15 = sub_100004FB8();
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 processName]);
              uint64_t v17 = v9;
              id v18 = v4;
              id v19 = v8;
              unsigned int v20 = [v11 processIdentifier];
              id v21 = NSStringFromSelector(v13);
              id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
              *(_DWORD *)buf = 138413314;
              __int16 v35 = &stru_100024E50;
              __int16 v36 = 2114;
              v37 = v16;
              __int16 v38 = 1024;
              *(_DWORD *)v39 = v20;
              id v8 = v19;
              id v4 = v18;
              uint64_t v9 = v17;
              id v7 = v29;
              *(_WORD *)&v39[4] = 2048;
              *(void *)&v39[6] = v11;
              *(_WORD *)&v39[14] = 2112;
              *(void *)&v39[16] = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@Client [name='%{public}@', pid=%d] (conn=%p) entitlement failed for notification: \"%@\"",  buf,  0x30u);

              BOOL v5 = v28;
            }
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  id v23 = sub_100004FB8();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = -[NSMutableSet count](v27->_clientConnections, "count");
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 invocationDescription]);
    *(_DWORD *)buf = 138413058;
    __int16 v35 = &stru_100024E50;
    __int16 v36 = 2048;
    v37 = v8;
    __int16 v38 = 2048;
    *(void *)v39 = v25;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@Sent notification to %zu (of %lu) clients: %@",  buf,  0x2Au);
  }
}

- (void).cxx_destruct
{
}

@end