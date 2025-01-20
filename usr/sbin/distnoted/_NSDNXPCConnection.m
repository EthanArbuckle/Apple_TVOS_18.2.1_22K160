@interface _NSDNXPCConnection
- (NSString)serviceName;
- (OS_xpc_object)XPCConnection;
- (_NSDNXPCConnection)initWithEndpoint:(id)a3;
- (_NSDNXPCConnection)initWithPeerConnection:(id)a3;
- (_NSDNXPCConnection)initWithReceivedConnection:(id)a3;
- (_NSDNXPCConnection)initWithServiceName:(id)a3 privileged:(BOOL)a4;
- (_NSDNXPCConnection)initWithXPCConnection:(id)a3 type:(int)a4;
- (id)__invalidate;
- (id)handleMessage;
- (unsigned)euid;
- (void)__terminationImminent;
- (void)addInvalidationHandler:(id)a3;
- (void)addTerminationImminentHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 waitForAck:(BOOL)a4;
- (void)setHandleMessage:(id)a3;
- (void)start:(id)a3;
@end

@implementation _NSDNXPCConnection

- (_NSDNXPCConnection)initWithXPCConnection:(id)a3 type:(int)a4
{
  v4 = self;
  if (a3)
  {
    self->_invalidHandlers = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v4->_termImminentHandlers = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v4->_flavor = a4;
    v7 = (_xpc_connection_s *)xpc_retain(a3);
    v4->_conn = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100004D84;
    handler[3] = &unk_100008648;
    handler[4] = v7;
    handler[5] = v4;
    int v11 = a4;
    xpc_connection_set_event_handler(v7, handler);
    v8 = v4;
  }

  else
  {

    return 0LL;
  }

  return v4;
}

- (void)dealloc
{
  conn = self->_conn;
  if (conn) {
    xpc_release(conn);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSDNXPCConnection;
  -[_NSDNXPCConnection dealloc](&v4, "dealloc");
}

- (_NSDNXPCConnection)initWithServiceName:(id)a3 privileged:(BOOL)a4
{
  if (!a3) {
    return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", 0LL, 4LL);
  }
  BOOL v5 = a4;
  CFIndex maxBufLen = 0LL;
  v13.length = CFStringGetLength((CFStringRef)a3);
  v13.location = 0LL;
  CFStringGetBytes((CFStringRef)a3, v13, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen);
  v7 = (UInt8 *)malloc(maxBufLen + 1);
  v14.length = CFStringGetLength((CFStringRef)a3);
  v14.location = 0LL;
  CFStringGetBytes((CFStringRef)a3, v14, 0x8000100u, 0, 0, v7, maxBufLen, 0LL);
  v7[maxBufLen] = 0;
  if (v5) {
    uint64_t v8 = 2LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)v7, 0LL, v8);
  v10 = -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", mach_service, 4LL);
  if (mach_service) {
    xpc_release(mach_service);
  }
  free(v7);
  return v10;
}

- (_NSDNXPCConnection)initWithEndpoint:(id)a3
{
  xpc_connection_t v4 = xpc_connection_create_from_endpoint((xpc_endpoint_t)a3);
  BOOL v5 = -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", v4, 4LL);
  xpc_release(v4);
  return v5;
}

- (_NSDNXPCConnection)initWithReceivedConnection:(id)a3
{
  return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", a3, 5LL);
}

- (_NSDNXPCConnection)initWithPeerConnection:(id)a3
{
  return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", a3, 3LL);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unsigned)euid
{
  return xpc_connection_get_euid(self->_conn);
}

- (OS_xpc_object)XPCConnection
{
  return self->_conn;
}

- (id)handleMessage
{
  return self->_handleMessage;
}

- (void)setHandleMessage:(id)a3
{
  if (self->_started || self->_invalid)
  {
    __break(1u);
  }

  else
  {
    id v4 = [a3 copy];
    id handleMessage = self->_handleMessage;
    self->_id handleMessage = v4;
  }

- (id)__invalidate
{
  id handleMessage = self->_handleMessage;
  invalidHandlers = self->_invalidHandlers;
  self->_id handleMessage = 0LL;
  self->_invalidHandlers = 0LL;

  return invalidHandlers;
}

- (void)__terminationImminent
{
  termImminentHandlers = self->_termImminentHandlers;
  self->_termImminentHandlers = 0LL;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( termImminentHandlers,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(termImminentHandlers);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8LL * (void)v6) + 16LL))();
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( termImminentHandlers,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (invalid)
  {
    id v3 = 0LL;
  }

  else
  {
    id v3 = -[NSMutableArray copy](self->_invalidHandlers, "copy");

    self->_invalidHandlers = 0LL;
    conn = self->_conn;
    if (conn)
    {
      xpc_connection_cancel(conn);
      int started = self->_started;
      self->_int started = started + 1;
      if (!started) {
        xpc_connection_activate(self->_conn);
      }
    }
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i) + 16LL))();
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

- (void)addInvalidationHandler:(id)a3
{
  id v5 = [a3 copy];
  invalidHandlers = self->_invalidHandlers;
  id v7 = v5;
  -[NSMutableArray addObject:](invalidHandlers, "addObject:");
  if (!invalidHandlers) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)addTerminationImminentHandler:(id)a3
{
  id v4 = [a3 copy];
  -[NSMutableArray addObject:](self->_termImminentHandlers, "addObject:", v4);
}

- (void)start:(id)a3
{
  if (!self->_invalid)
  {
    int started = self->_started;
    self->_int started = started + 1;
    if (!started)
    {
      if (a3) {
        xpc_connection_set_target_queue(self->_conn, (dispatch_queue_t)a3);
      }
      xpc_connection_activate(self->_conn);
    }
  }

- (void)sendMessage:(id)a3
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v4 = self;
    id v5 = self;
    if (self->_conn)
    {
      xpc_transaction_begin();
      xpc_connection_send_message(self->_conn, a3);
      xpc_connection_send_barrier(self->_conn, &stru_100008620);
      id v5 = self;
    }
  }

  else
  {
    __break(1u);
  }

- (void)sendMessage:(id)a3 waitForAck:(BOOL)a4
{
  if (a3 && (BOOL v4 = a4, xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary))
  {
    xpc_dictionary_set_BOOL(a3, "com.apple.NSXPC.msg_needs_ack", 1);
    uint64_t v6 = self;
    conn = self->_conn;
    if (conn)
    {
      xpc_retain(self->_conn);
      xpc_transaction_begin();
      if (v4)
      {
        xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(conn, a3);
        if (v8) {
          xpc_release(v8);
        }
      }

      else
      {
        xpc_connection_send_message(conn, a3);
      }

      xpc_transaction_end();
      xpc_release(conn);
    }

    xpc_dictionary_set_value(a3, "com.apple.NSXPC.msg_needs_ack", 0LL);
  }

  else
  {
    __break(1u);
  }

@end