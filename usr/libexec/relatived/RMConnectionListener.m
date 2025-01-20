@interface RMConnectionListener
- (BOOL)isEndpointConnectionAllowed:(id)a3;
- (NSMutableArray)connections;
- (NSString)deprecatedEntitlement;
- (NSString)entitlement;
- (NSString)tccService;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 messageHandlerConstructor:(id)a5;
- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6;
- (id)_initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6;
- (id)messageHandlerConstructor;
- (void)endpointWasInterrupted:(id)a3;
- (void)endpointWasInvalidated:(id)a3;
- (void)invalidate;
- (void)setConnections:(id)a3;
- (void)setDeprecatedEntitlement:(id)a3;
- (void)setEntitlement:(id)a3;
- (void)setListener:(id)a3;
- (void)setMessageHandlerConstructor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTccService:(id)a3;
- (void)startListeningForService:(id)a3;
- (void)traverseEndpointsAsynchronously:(id)a3;
@end

@implementation RMConnectionListener

- (id)_initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RMConnectionListener;
  v14 = -[RMConnectionListener init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[RMConnectionListener setQueue:](v14, "setQueue:", v10);
    v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[RMConnectionListener setConnections:](v15, "setConnections:", v16);

    -[RMConnectionListener setMessageHandlerConstructor:](v15, "setMessageHandlerConstructor:", v13);
    -[RMConnectionListener setEntitlement:](v15, "setEntitlement:", v11);
    -[RMConnectionListener setTccService:](v15, "setTccService:", v12);
  }

  return v15;
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 messageHandlerConstructor:(id)a5
{
  return (RMConnectionListener *)-[RMConnectionListener _initWithQueue:entitlement:tccService:messageHandlerConstructor:]( self,  "_initWithQueue:entitlement:tccService:messageHandlerConstructor:",  a3,  a4,  0LL,  a5);
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12)
    {
      v14 = v13;
      v15 = -[RMConnectionListener _initWithQueue:entitlement:tccService:messageHandlerConstructor:]( self,  "_initWithQueue:entitlement:tccService:messageHandlerConstructor:",  v10,  v11,  v12,  v13);

      return v15;
    }
  }

  else
  {
    sub_1000111F4();
  }

  sub_100011310();
  return (RMConnectionListener *)sub_10000BFBC();
}

- (BOOL)isEndpointConnectionAllowed:(id)a3
{
  v4 = (id *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
    LODWORD(v5) = sub_100008D1C(v4, v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener tccService](self, "tccService"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

    if (!v8) {
      sub_10001142C();
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener tccService](self, "tccService"));
    LODWORD(v7) = sub_1000093F0((BOOL)v4, v9);
  }

  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001CBE0);
  }
  id v10 = (os_log_s *)qword_100023968;
  if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "NO";
    if ((_DWORD)v5) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    if ((_DWORD)v7) {
      id v11 = "YES";
    }
    int v28 = 136446466;
    v29 = v12;
    __int16 v30 = 2082;
    *(void *)v31 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client status: Entitled: %{public}s Authorized: %{public}s",  (uint8_t *)&v28,  0x16u);
  }

  if (((v5 | v7) & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

    if (v13)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
      if (!v14
        || (v15 = (void *)v14,
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement")),
            v16,
            v15,
            !v16)
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement")),
            BOOL v18 = sub_100008D1C(v4, v17),
            v17,
            !v18))
      {
        BOOL v26 = 0;
        goto LABEL_26;
      }

      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001CBE0);
      }
      v19 = (void *)qword_100023968;
      if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = sub_10000944C(v4);
        v22 = (char *)objc_claimAutoreleasedReturnValue(v21);
        unsigned int v23 = sub_10000947C(v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
        int v28 = 138544131;
        v29 = v22;
        __int16 v30 = 1025;
        *(_DWORD *)v31 = v23;
        *(_WORD *)&v31[4] = 2114;
        *(void *)&v31[6] = v24;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Client %{public}@ (%{private}d) uses deprecated entitlement %{public}@: please use %{public}@ instead",  (uint8_t *)&v28,  0x26u);
      }
    }
  }

  BOOL v26 = 1;
LABEL_26:

  return v26;
}

- (void)startListeningForService:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v5, v6, 1uLL);
  -[RMConnectionListener setListener:](self, "setListener:", mach_service);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  if (!v8) {
    sub_100011548((uint64_t)v4);
  }
  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001CBE0);
  }
  v9 = (os_log_s *)qword_100023968;
  if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Registering handler for service: %{private}@",  buf,  0xCu);
  }

  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000C51C;
  handler[3] = &unk_10001CB58;
  handler[4] = self;
  xpc_connection_set_event_handler(v10, handler);

  id v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  xpc_connection_resume(v11);

  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001CBE0);
  }
  id v12 = (os_log_s *)qword_100023968;
  if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Listener started for service: %{private}@",  buf,  0xCu);
  }
}

- (void)traverseEndpointsAsynchronously:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CA2C;
  v7[3] = &unk_10001CB80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)invalidate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
  id v5 = [v4 copy];

  [v5 enumerateObjectsUsingBlock:&stru_10001CBC0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
  [v6 removeAllObjects];

  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  xpc_connection_cancel(v7);

  -[RMConnectionListener setListener:](self, "setListener:", 0LL);
}

- (void)endpointWasInterrupted:(id)a3
{
  id v3 = a3;
  if (qword_100023960 != -1) {
    goto LABEL_13;
  }
  while (1)
  {
    id v4 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_100018551;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Interruption events shouldn't be received by the daemon, event:%{public, location:e scape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CBE0);
    }
    id v5 = (os_log_s *)qword_100023968;
    if (os_signpost_enabled((os_log_t)qword_100023968))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_100018551;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Interruption events shouldn't be received by the daemon",  "{msg%{public}.0s:Interruption events shouldn't be received by the daemon, event:%{public, location:e scape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CBE0);
    }
    id v6 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_100018551;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Interruption events shouldn't be received by the daemon, event:%{public, location:e scape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  191,  "-[RMConnectionListener endpointWasInterrupted:]");
LABEL_13:
    dispatch_once(&qword_100023960, &stru_10001CBE0);
  }

- (void)endpointWasInvalidated:(id)a3
{
  uint64_t v14 = (id *)a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  sub_100011120(v14, 0LL);
  id v5 = sub_1000101F0(v14);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
    int v8 = objc_alloc(&OBJC_CLASS___RMConnectionHandlerInternal);
    __int16 v9 = sub_1000101F0(v14);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    __int16 v11 = sub_10000BC80((id *)&v8->super.isa, v14, v10);
    [v7 removeObject:v11];
  }

  else
  {
    id v12 = (RMConnectionListener *)sub_1000116DC();
    -[RMConnectionListener deprecatedEntitlement](v12, v13);
  }

- (NSString)deprecatedEntitlement
{
  return self->_deprecatedEntitlement;
}

- (void)setDeprecatedEntitlement:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (id)messageHandlerConstructor
{
  return self->_messageHandlerConstructor;
}

- (void)setMessageHandlerConstructor:(id)a3
{
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
}

- (NSString)tccService
{
  return self->_tccService;
}

- (void)setTccService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end