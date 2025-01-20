@interface PKDServer
- (NSMutableArray)holds;
- (OS_dispatch_queue)mainQueue;
- (OS_dispatch_queue)xpcQueue;
- (OS_dispatch_source)sigSource;
- (OS_xpc_object)service;
- (PKDServer)init;
- (PKDServer)initWithConnection:(id)a3 queue:(id)a4 database:(id)a5 externalProviders:(id)a6;
- (PKDUserPrefs)userPrefs;
- (id)holdOnPlugIn:(id)a3;
- (id)initForService:(const char *)a3 database:(id)a4 externalProviders:(id)a5;
- (os_unfair_lock_s)holdLock;
- (unsigned)verbose;
- (void)addHold:(id)a3 silent:(BOOL)a4;
- (void)removedPlugIns:(id)a3;
- (void)run;
- (void)setHoldLock:(os_unfair_lock_s)a3;
- (void)setHolds:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setSigSource:(id)a3;
- (void)setUserPrefs:(id)a3;
- (void)setVerbose:(unsigned int)a3;
- (void)setXpcQueue:(id)a3;
- (void)stop;
- (void)terminatePlugIns:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)unholdClient:(id)a3;
- (void)unholdToken:(id)a3 silent:(BOOL)a4;
@end

@implementation PKDServer

- (PKDServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PKDServer;
  v2 = -[PKDServer init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___PKDExternalProviders);
    v2 = (PKDServer *) -[PKDServer initForService:database:externalProviders:]( v2,  "initForService:database:externalProviders:",  "com.apple.pluginkit.pkd",  0LL,  v3);
  }

  return v2;
}

- (id)initForService:(const char *)a3 database:(id)a4 externalProviders:(id)a5
{
  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = a5;
  id v12 = a4;
  v13 = dispatch_queue_create("xpc", v10);

  xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, v13, 1uLL);
  v15 = -[PKDServer initWithConnection:queue:database:externalProviders:]( self,  "initWithConnection:queue:database:externalProviders:",  mach_service,  v13,  v12,  v11);

  return v15;
}

- (PKDServer)initWithConnection:(id)a3 queue:(id)a4 database:(id)a5 externalProviders:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PKDServer;
  v14 = -[PKDatabase initWithDatabase:externalProviders:](&v34, "initWithDatabase:externalProviders:", v12, v13);
  v15 = v14;
  if (v14)
  {
    -[PKDServer setXpcQueue:](v14, "setXpcQueue:", v11);
    -[PKDServer setHoldLock:](v15, "setHoldLock:", 0LL);
    -[PKDServer setService:](v15, "setService:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[PKDServer setHolds:](v15, "setHolds:", v16);

    -[PKDatabase setDelegate:](v15, "setDelegate:", v15);
    service = v15->_service;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke;
    handler[3] = &unk_24B00;
    v18 = v15;
    v33 = v18;
    xpc_connection_set_event_handler(service, handler);
    v19 = objc_alloc_init(&OBJC_CLASS___PKDUserPrefs);
    -[PKDServer setUserPrefs:](v18, "setUserPrefs:", v19);

    dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
    -[PKDServer setSigSource:](v18, "setSigSource:", v20);

    objc_initWeak(&location, v18);
    v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PKDServer sigSource](v18, "sigSource"));
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_11;
    v28 = &unk_24B28;
    objc_copyWeak(&v30, &location);
    v22 = v18;
    v29 = v22;
    dispatch_source_set_event_handler(v21, &v25);

    v23 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[PKDServer sigSource](v22, "sigSource", v25, v26, v27, v28));
    dispatch_activate(v23);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      uint64_t v9 = pklog_handle_for_category(1LL, v5);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      v7 = v10;
      if (v3 == &_xpc_error_connection_invalid)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          id v12 = &_xpc_error_connection_invalid;
          _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "potentially unexpected error from xpc: %{public}@",  (uint8_t *)&v11,  0xCu);
        }
      }

      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_cold_1();
      }
    }

    else
    {
      uint64_t v6 = pklog_handle_for_category(1LL, v5);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_cold_2();
      }
    }

    goto LABEL_13;
  }

  v8 = -[PKDXpcClient initWithConnection:server:]( objc_alloc(&OBJC_CLASS___PKDXpcClient),  "initWithConnection:server:",  v3,  *(void *)(a1 + 32));
  if (!v8)
  {
    xpc_connection_cancel((xpc_connection_t)v3);
LABEL_13:
    v8 = 0LL;
  }
}

void __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stop];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) external]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 sys]);
  [v3 exit:0];
}

- (void)run
{
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[PKDServer service](self, "service"));
  xpc_connection_resume(v3);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 sys]);
  [v4 CFRunLoopRun];
}

- (void)removedPlugIns:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __28__PKDServer_removedPlugIns___block_invoke;
  v5[3] = &unk_24B50;
  id v6 = a3;
  id v4 = v6;
  -[PKDServer terminatePlugIns:synchronously:reply:](self, "terminatePlugIns:synchronously:reply:", v4, 0LL, v5);
}

void __28__PKDServer_removedPlugIns___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pklog_handle_for_category(11LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __28__PKDServer_removedPlugIns___block_invoke_cold_1(a1, v4);
  }
}

- (void)terminatePlugIns:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v35 = a4;
  id v6 = a3;
  id v33 = a5;
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_t v38 = dispatch_queue_create("killer", v8);

  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  queue = dispatch_queue_create("killer-waiter", v10);

  int v11 = dispatch_group_create();
  id v32 = [v6 count];
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    do
    {
      uint64_t v14 = 0LL;
      else {
        uint64_t v15 = (uint64_t)v12;
      }
      do
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v46 + 1) + 8 * v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "launchdIdentifier", v32));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v23 launchdVersion]);
        uint64_t v27 = pklog_handle_for_category(11LL, v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v24;
          __int16 v52 = 2114;
          v53 = v25;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: requesting termination from launchd, version [%{public}@]",  buf,  0x16u);
        }

        dispatch_group_enter(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDatabase external](self, "external"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 launch]);
        id v18 = v24;
        id v19 = [v18 UTF8String];
        id v20 = v25;
        id v21 = [v20 UTF8String];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke;
        v43[3] = &unk_24B78;
        id v44 = v18;
        v45 = v11;
        id v22 = v18;
        objc_msgSend(v17, "remove_external_service:version:targetq:callback:", v19, v21, v38, v43);

        ++v14;
      }

      while (v15 != v14);
      id v12 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }

    while (v12);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17;
  v39[3] = &unk_24BA0;
  id v42 = v32;
  v40 = v11;
  id v41 = v33;
  id v29 = v33;
  id v30 = v11;
  v31 = objc_retainBlock(v39);
  if (v35) {
    dispatch_sync(queue, v31);
  }
  else {
    dispatch_async(queue, v31);
  }
}

void __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 == 3)
  {
    uint64_t v8 = pklog_handle_for_category(11LL, a2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v9;
      dispatch_queue_attr_t v7 = "%@: launchd reported no running plugins on record";
      goto LABEL_7;
    }
  }

  else
  {
    int v3 = a2;
    if ((_DWORD)a2)
    {
      uint64_t v10 = pklog_handle_for_category(11LL, a2);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_cold_1(a1, v3, v5);
      }
    }

    else
    {
      uint64_t v4 = pklog_handle_for_category(11LL, a2);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v11 = 138412290;
        uint64_t v12 = v6;
        dispatch_queue_attr_t v7 = "%@: one or more plugins have been terminated";
LABEL_7:
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);
      }
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pklog_handle_for_category(11LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17_cold_2(a1, v4);
  }

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = pklog_handle_for_category(11LL, v5);
  dispatch_queue_attr_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17_cold_1(v7);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)holdOnPlugIn:(id)a3
{
  id v4 = a3;
  p_holdLock = &self->_holdLock;
  os_unfair_lock_lock(&self->_holdLock);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = PKSDKInfoKey;
    id v20 = p_holdLock;
    while (2)
    {
      uint64_t v10 = 0LL;
      else {
        uint64_t v11 = (uint64_t)v7;
      }
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 extensionPointName]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginKey:v9]);
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) != 0
          || (v16 = (void *)objc_claimAutoreleasedReturnValue([v12 blocked]),
              unsigned __int8 v17 = [v16 containsObject:v4],
              v16,
              (v17 & 1) != 0))
        {
          id v18 = v12;
          p_holdLock = v20;
          goto LABEL_15;
        }

        ++v10;
      }

      while (v11 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v18 = 0LL;
      p_holdLock = v20;
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v18 = 0LL;
  }

- (void)addHold:(id)a3 silent:(BOOL)a4
{
  p_holdLock = &self->_holdLock;
  id v7 = a3;
  os_unfair_lock_lock(p_holdLock);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
  [v8 addObject:v7];

  os_unfair_lock_unlock(p_holdLock);
  if (!a4) {
    PKAnnotationNotificationPost();
  }
}

- (void)unholdToken:(id)a3 silent:(BOOL)a4
{
  id v5 = a3;
  p_holdLock = &self->_holdLock;
  os_unfair_lock_lock(&self->_holdLock);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      uint64_t v10 = 0LL;
      else {
        uint64_t v11 = (uint64_t)v8;
      }
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
        unsigned int v14 = [v13 isEqual:v5];

        if (v14)
        {
          uint64_t v16 = pklog_handle_for_category(11LL, v15);
          unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
            *(_DWORD *)buf = 138543362;
            uint64_t v27 = v19;
            _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "releasing plugin hold %{public}@ at client's request",  buf,  0xCu);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
          [v20 removeObject:v12];

          if (!a4) {
            PKAnnotationNotificationPost();
          }
          goto LABEL_16;
        }

        ++v10;
      }

      while (v11 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)unholdClient:(id)a3
{
  id v4 = a3;
  p_holdLock = &self->_holdLock;
  os_unfair_lock_lock(&self->_holdLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __26__PKDServer_unholdClient___block_invoke;
  v10[3] = &unk_24BC8;
  id v11 = v4;
  id v9 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexesOfObjectsPassingTest:v10]);

  if ([v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
    [v8 removeObjectsAtIndexes:v7];

    PKAnnotationNotificationPost();
  }

  os_unfair_lock_unlock(p_holdLock);
}

BOOL __26__PKDServer_unholdClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v7 = pklog_handle_for_category(11LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      unsigned int v11 = [*(id *)(a1 + 32) pid];
      int v13 = 138543618;
      unsigned int v14 = v10;
      __int16 v15 = 1024;
      unsigned int v16 = v11;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "releasing plugin hold %{public}@ for dead client pid %d",  (uint8_t *)&v13,  0x12u);
    }
  }

  return v4 == v5;
}

- (void)stop
{
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[PKDServer service](self, "service"));
  xpc_connection_cancel(v3);

  os_unfair_lock_t lock = &self->_holdLock;
  os_unfair_lock_lock(&self->_holdLock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unsigned __int8 v17 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](self, "holds"));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0LL;
      else {
        uint64_t v9 = (uint64_t)v5;
      }
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        uint64_t v11 = pklog_handle_for_category(11LL, v6);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid", lock));
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
          *(_DWORD *)buf = 138543362;
          __int128 v23 = v14;
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "releasing plugin hold %{public}@ because server is stopping",  buf,  0xCu);
        }

        ++v8;
      }

      while (v9 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v5);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKDServer holds](v17, "holds"));
  [v15 removeAllObjects];

  PKAnnotationNotificationPost();
  os_unfair_lock_unlock(lock);
}

- (os_unfair_lock_s)holdLock
{
  return self->_holdLock;
}

- (void)setHoldLock:(os_unfair_lock_s)a3
{
  self->_holdLock = a3;
}

- (unsigned)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(unsigned int)a3
{
  self->_verbose = a3;
}

- (OS_dispatch_queue)xpcQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setXpcQueue:(id)a3
{
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (OS_xpc_object)service
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setService:(id)a3
{
}

- (PKDUserPrefs)userPrefs
{
  return (PKDUserPrefs *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setUserPrefs:(id)a3
{
}

- (OS_dispatch_source)sigSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSigSource:(id)a3
{
}

- (NSMutableArray)holds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setHolds:(id)a3
{
}

- (void).cxx_destruct
{
}

void __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_cold_1()
{
}

void __65__PKDServer_initWithConnection_queue_database_externalProviders___block_invoke_cold_2()
{
}

void __28__PKDServer_removedPlugIns___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "removal complete for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_3();
}

void __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_cold_1( uint64_t a1,  int a2,  os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%@: launchd error attempting to terminate plugins: error=%d",  (uint8_t *)&v4,  0x12u);
  OUTLINED_FUNCTION_1_3();
}

void __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "sending termination reply", v1, 2u);
}

void __50__PKDServer_terminatePlugIns_synchronously_reply___block_invoke_17_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "waiting for %d termination replies", (uint8_t *)v3, 8u);
}

@end