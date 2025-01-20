@interface BKTouchDeliveryPolicyServer
+ (id)sharedServer;
- (BKSTouchDeliveryPolicy)_policy;
- (BKTouchDeliveryPolicyServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldCancelTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4;
- (id)filterDestinations:(id)a3;
- (void)_queue_setPolicy:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)ipc_addPolicy:(id)a3;
- (void)run;
@end

@implementation BKTouchDeliveryPolicyServer

- (BKTouchDeliveryPolicyServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BKTouchDeliveryPolicyServer;
  v2 = -[BKTouchDeliveryPolicyServer init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[BKSTouchDeliveryPolicy policyByCombiningPolicies:]( &OBJC_CLASS___BKSTouchDeliveryPolicy,  "policyByCombiningPolicies:",  &__NSArray0__struct));
    policy = v2->_policy;
    v2->_policy = (BKSTouchDeliveryPolicy *)v3;

    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboardd.TouchDeliveryPolicyServer");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    assertionConnections = v2->_assertionConnections;
    v2->_assertionConnections = v7;

    v9 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v10 = -[NSXPCListener initWithMachServiceName:]( v9,  "initWithMachServiceName:",  BKSTouchDeliveryPolicyServerMachServiceName);
    listener = v2->_listener;
    v2->_listener = v10;

    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_queue);
    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKTouchDeliveryPolicyServer;
  -[BKTouchDeliveryPolicyServer dealloc](&v3, "dealloc");
}

- (void)run
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = BKLogTouchDeliveryPolicy();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = BSProcessDescriptionForPID([v5 processIdentifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138543362;
    objc_super v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "TDPS server connection from %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BKSTouchDeliveryPolicyServerInterface));
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:self];
  [v5 _setQueue:self->_queue];
  [v5 setDelegate:self];
  [v5 resume];

  return 1;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  if (sel_isEqual((SEL)[v7 selector], "ipc_addPolicy:"))
  {
    v20 = 0LL;
    [v7 getArgument:&v20 atIndex:2];
    uint64_t v8 = v20;
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_10007335C;
    v18 = &unk_1000B83D8;
    id v9 = v6;
    id v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 reducePolicyToObjectWithBlock:&v15]);
    if (objc_msgSend(v10, "BOOLValue", v15, v16, v17, v18))
    {
      [v7 invoke];
    }

    else
    {
      uint64_t v11 = BKLogTouchDeliveryPolicy();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = BSProcessDescriptionForPID([v9 processIdentifier]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "not allowing %{public}@ to include policies because it does not have appropriate permissions",  buf,  0xCu);
      }
    }
  }

  else
  {
    [v7 invoke];
  }
}

- (void)ipc_addPolicy:(id)a3
{
  id v4 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100072FC4;
  v11[3] = &unk_1000B83D8;
  v11[4] = self;
  id v5 = [v4 reducePolicyToObjectWithBlock:v11];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 policyIncludingPolicy:v4]);
  -[BKTouchDeliveryPolicyServer _queue_setPolicy:](self, "_queue_setPolicy:", v7);

  uint64_t v8 = BKLogTouchDeliveryPolicy();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
    *(_DWORD *)buf = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TDPS server got new policy %{public}@, [self _policy] is now %{public}@",  buf,  0x16u);
  }
}

- (id)filterDestinations:(id)a3
{
  id v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  id v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 8LL);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v31;
    while (1)
    {
      v10 = 0LL;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(_DWORD **)(*((void *)&v30 + 1) + 8LL * (void)v10);
        uint64_t v13 = BKLogTouchDeliveryPolicy();
        __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          if (v12)
          {
            int v19 = v12[2];
            if (v11) {
              goto LABEL_16;
            }
LABEL_22:
            int v20 = 0;
          }

          else
          {
            int v19 = 0;
            if (!v11) {
              goto LABEL_22;
            }
LABEL_16:
            int v20 = v11[2];
          }

          *(_DWORD *)buf = 67109376;
          int v35 = v19;
          __int16 v36 = 1024;
          int v37 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "host %X -> child %X", buf, 0xEu);
        }

        if (v11)
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_100072EDC;
          v27[3] = &unk_1000B84B0;
          uint64_t v8 = v11;
          id v28 = v8;
          v29 = v12;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v26 reducePolicyToObjectWithBlock:v27]);
          unsigned int v16 = [v15 BOOLValue];
          uint64_t v17 = BKLogTouchDeliveryPolicy();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            if (v12) {
              int v21 = v12[2];
            }
            else {
              int v21 = 0;
            }
            int v22 = v8[2];
            *(_DWORD *)buf = 67109632;
            int v35 = v21;
            __int16 v36 = 1024;
            int v37 = v22;
            __int16 v38 = 1024;
            unsigned int v39 = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%X -> %X: %{BOOL}u", buf, 0x14u);
          }

          if (!v16)
          {

            goto LABEL_27;
          }

          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }

        else
        {
          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }

        uint64_t v8 = v12;

        v10 = (char *)v10 + 1;
        uint64_t v11 = v8;
      }

      while (v7 != v10);
      id v23 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      id v7 = v23;
      if (!v23)
      {
LABEL_27:

        break;
      }
    }
  }

  return v5;
}

- (BOOL)shouldCancelTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100072D10;
  v10[3] = &unk_1000B8550;
  unsigned int v11 = a3;
  *(double *)&v10[4] = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reducePolicyToObjectWithBlock:v10]);
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BKSTouchDeliveryPolicy)_policy
{
  return (BKSTouchDeliveryPolicy *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)_queue_setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedServer
{
  if (qword_1000DC2C0 != -1) {
    dispatch_once(&qword_1000DC2C0, &stru_1000B8320);
  }
  return (id)qword_1000DC2B8;
}

@end