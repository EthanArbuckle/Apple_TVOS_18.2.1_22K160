@interface NSXPCListener
+ (NSXPCListener)anonymousListener;
+ (NSXPCListener)serviceListener;
+ (id)_UUID;
+ (void)enableTransactions;
- (NSXPCListener)initWithMachServiceName:(NSString *)name;
- (NSXPCListener)initWithServiceName:(id)a3;
- (NSXPCListenerEndpoint)endpoint;
- (id)__initWithoutRemoteConnection;
- (id)_initShared;
- (id)_initWithRemoteName:(id)a3;
- (id)_queue;
- (id)_xpcConnection;
- (id)delegate;
- (id)description;
- (id)serviceName;
- (void)__receiveRemoteConnection:(id)a3;
- (void)_setQueue:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setDelegate:(id)delegate;
- (void)setOptions:(unint64_t)a3;
- (void)suspend;
@end

@implementation NSXPCListener

- (id)_initShared
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  v2 = -[NSXPCListener init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_remote = 0;
    v4 = (dispatch_object_s *)MEMORY[0x1895F8AE0];
    v3->_userQueue = (OS_dispatch_queue *)MEMORY[0x1895F8AE0];
    dispatch_retain(v4);
  }

  return v3;
}

+ (NSXPCListener)serviceListener
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32__NSXPCListener_serviceListener__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (_MergedGlobals_155 != -1) {
    dispatch_once(&_MergedGlobals_155, v3);
  }
  return (NSXPCListener *)qword_18C497310;
}

uint64_t __32__NSXPCListener_serviceListener__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _initShared];
  qword_18C497310 = result;
  return result;
}

+ (NSXPCListener)anonymousListener
{
  return  -[NSXPCListener initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithServiceName:",  &stru_189CA6A28);
}

- (NSXPCListener)initWithServiceName:(id)a3
{
  handler[5] = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  v5 = -[NSXPCListener init](&v20, sel_init);
  objc_super v6 = v5;
  if (!v5) {
    return v6;
  }
  if (a3)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v8 = qos_class_main();
    v9 = dispatch_queue_attr_make_with_qos_class(v7, v8, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSXPCListener.main", v9);
    if (![a3 isEqualToString:&stru_189CA6A28])
    {
      p_state = (unsigned __int8 *)&v6->_state;
      do
        unsigned __int8 v13 = __ldxr(p_state);
      while (__stxr(v13 | 8, p_state));
      v6->_serviceName = (NSString *)[a3 copy];
      atomic_store((unint64_t)v6, &_additionalListener);
      return v6;
    }

    v10 = xpc_connection_create(0LL, (dispatch_queue_t)v6->_userQueue);
    v6->_connection.xpc = v10;
    if (v10)
    {
      xpc_connection_set_target_queue(v10, (dispatch_queue_t)v6->_userQueue);
      xpc = v6->_connection.xpc;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = ___setupListenerConnection_block_invoke;
      handler[3] = &unk_189C9F968;
      handler[4] = v6;
      xpc_connection_set_event_handler(xpc, handler);
      return v6;
    }

    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Unable to create anonymous listener connection with name %@",  _NSMethodExceptionProem((objc_class *)v6, a2),  a3);
  }

  else
  {
    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: The name argument is required. To create an anonymous connection, use a zero-length string.",  _NSMethodExceptionProem((objc_class *)v5, a2),  v19);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v15 userInfo:0]);
  return -[NSXPCListener initWithMachServiceName:](v16, v17, v18);
}

- (NSXPCListener)initWithMachServiceName:(NSString *)name
{
  handler[5] = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  v5 = -[NSXPCListener init](&v18, sel_init);
  objc_super v6 = v5;
  if (!v5) {
    return v6;
  }
  if (name)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v8 = qos_class_main();
    v9 = dispatch_queue_attr_make_with_qos_class(v7, v8, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create( (const char *)objc_msgSend( (id)objc_msgSend( @"com.apple.NSXPCListener.service.",  "stringByAppendingString:",  name),  "UTF8String"),  v9);
    v6->_serviceName = (NSString *)-[NSString copy](name, "copy");
    mach_service = xpc_connection_create_mach_service( -[NSString UTF8String](name, "UTF8String"),  (dispatch_queue_t)v6->_userQueue,  1uLL);
    v6->_connection.xpc = mach_service;
    if (mach_service)
    {
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v6->_userQueue);
      xpc = v6->_connection.xpc;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = ___setupListenerConnection_block_invoke;
      handler[3] = &unk_189C9F968;
      handler[4] = v6;
      xpc_connection_set_event_handler(xpc, handler);
      return v6;
    }

    unsigned __int8 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Unable to create connection with name %@",  _NSMethodExceptionProem((objc_class *)v6, a2),  name);
  }

  else
  {
    unsigned __int8 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: The name argument is required.",  _NSMethodExceptionProem((objc_class *)v5, a2),  v17);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v13 userInfo:0]);
  return (NSXPCListener *)-[NSXPCListener _initWithRemoteName:](v14, v15, v16);
}

- (id)_initWithRemoteName:(id)a3
{
  v22[5] = *MEMORY[0x1895F89C0];
  _NSXPCConnectionInitRemoteXPC();
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  objc_super v6 = -[NSXPCListener init](&v21, sel_init);
  uint64_t v7 = v6;
  if (!v6) {
    return v7;
  }
  if (a3)
  {
    qos_class_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v9 = qos_class_main();
    v10 = dispatch_queue_attr_make_with_qos_class(v8, v9, 0);
    v7->_userQueue = (OS_dispatch_queue *)dispatch_queue_create( (const char *)objc_msgSend( (id)objc_msgSend( @"com.apple.NSXPCListener.remote.",  "stringByAppendingString:",  a3),  "UTF8String"),  v10);
    v7->_serviceName = (NSString *)[a3 copy];
    v7->_remote = 1;
    uint64_t v11 = ((uint64_t (*)(uint64_t, OS_dispatch_queue *, void))_xpc_remote_connection_create_remote_service_listener)( [a3 UTF8String],  v7->_userQueue,  0);
    v7->_connection.xpc = (OS_xpc_object *)v11;
    if (v11)
    {
      _xpc_remote_connection_set_target_queue(v11, v7->_userQueue);
      xpc = v7->_connection.xpc;
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = ___setupRemoteListenerConnection_block_invoke;
      v22[3] = &unk_189C9F968;
      v22[4] = v7;
      _xpc_remote_connection_set_event_handler(xpc, v22, v13, v14, v15);
      return v7;
    }

    uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Unable to create remote connection with name %@",  _NSMethodExceptionProem((objc_class *)v7, a2),  a3);
  }

  else
  {
    uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: The name argument is required.",  _NSMethodExceptionProem((objc_class *)v6, a2),  v20);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:0]);
  return -[NSXPCListener __initWithoutRemoteConnection](v18, v19);
}

- (id)__initWithoutRemoteConnection
{
  v14[5] = *MEMORY[0x1895F89C0];
  _NSXPCConnectionInitRemoteXPC();
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  v3 = -[NSXPCListener init](&v13, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v5 = qos_class_main();
    objc_super v6 = dispatch_queue_attr_make_with_qos_class(v4, v5, 0);
    dispatch_queue_t v7 = dispatch_queue_create( (const char *)[@"com.apple.NSXPCListener.remote.__initWithoutRemoteConnection" UTF8String],  v6);
    v3->_userQueue = (OS_dispatch_queue *)v7;
    v3->_serviceName = (NSString *)@"__initWithoutRemoteConnection";
    v3->_remote = 1;
    _xpc_remote_connection_set_target_queue(v3->_connection.xpc, v7);
    xpc = v3->_connection.xpc;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = ___setupRemoteListenerConnection_block_invoke;
    v14[3] = &unk_189C9F968;
    v14[4] = v3;
    _xpc_remote_connection_set_event_handler(xpc, v14, v9, v10, v11);
  }

  return v3;
}

- (void)__receiveRemoteConnection:(id)a3
{
  if (self->_remote) {
    service_connection_handler_make_remote_connection(self, (uint64_t)a3);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  userQueue = (dispatch_object_s *)self->_userQueue;
  if (userQueue) {
    dispatch_release(userQueue);
  }
  xpc = self->_connection.xpc;
  if (xpc) {
    xpc_release(xpc);
  }

  qos_class_t v5 = (void *)atomic_load((unint64_t *)&self->_delegate);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  -[NSXPCListener dealloc](&v6, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCListener;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ service: %@",  -[NSXPCListener description](&v3, sel_description),  self->_serviceName);
}

- (void)suspend
{
  if (self->_remote)
  {
    objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
    -[NSXPCListener resume](v4, v5);
  }

  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_suspend(xpc);
    }
  }

- (void)resume
{
  if (self->_remote)
  {
    uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    goto LABEL_14;
  }

  p_state = (unsigned __int8 *)&self->_state;
  do
    unsigned __int8 v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x10, p_state));
  if ((v4 & 0x10) == 0) {
    CFRetain(self);
  }
  if (+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener") == self) {
LABEL_14:
  }
    xpc_main((xpc_connection_handler_t)service_connection_handler);
  do
    unsigned __int8 v5 = __ldaxr(p_state);
  while (__stlxr(v5 & 0xF7, p_state));
  if ((v5 & 8) != 0)
  {
    -[NSString UTF8String](self->_serviceName, "UTF8String");
    xpc_handle_service();
  }

  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_resume(xpc);
    }
  }

- (void)activate
{
  p_state = (unsigned __int8 *)&self->_state;
  do
    unsigned __int8 v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x10, p_state));
  if ((v4 & 0x10) == 0) {
    CFRetain(self);
  }
  if (+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener") == self) {
    xpc_main((xpc_connection_handler_t)service_connection_handler);
  }
  do
    unsigned __int8 v5 = __ldaxr(p_state);
  while (__stlxr(v5 & 0xF7, p_state));
  if ((v5 & 8) != 0)
  {
    -[NSString UTF8String](self->_serviceName, "UTF8String");
    xpc_handle_service();
  }

  else
  {
    xpc = self->_connection.xpc;
    if (self->_remote)
    {
      if (xpc) {
        _xpc_remote_connection_activate(xpc);
      }
    }

    else if (xpc)
    {
      xpc_connection_activate(xpc);
    }
  }

- (void)invalidate
{
  p_state = (unsigned __int8 *)&self->_state;
  do
    unsigned __int8 v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x20, p_state));
  if ((v4 & 0x20) == 0)
  {
    xpc = self->_connection.xpc;
    if (self->_remote)
    {
      if (xpc) {
        _xpc_remote_connection_cancel(xpc);
      }
    }

    else if (xpc)
    {
      xpc_connection_cancel(xpc);
    }
  }

  do
    unsigned __int8 v6 = __ldaxr(p_state);
  while (__stlxr(v6 & 0xEF, p_state));
  if ((v6 & 0x10) != 0) {
    CFRelease(self);
  }
}

- (void)setDelegate:(id)delegate
{
  p_delegate = (unint64_t *)&self->_delegate;
  unsigned __int8 v5 = (void *)atomic_load((unint64_t *)&self->_delegate);
  id v6 = v5;
  if (delegate) {
    uint64_t v7 = +[NSValue valueWithWeakObject:](&OBJC_CLASS___NSValue, "valueWithWeakObject:", delegate);
  }
  else {
    uint64_t v7 = 0LL;
  }
  atomic_store((unint64_t)v7, p_delegate);
}

- (id)delegate
{
  v2 = (void *)atomic_load((unint64_t *)&self->_delegate);
  return (id)[v2 weakObjectValue];
}

- (id)serviceName
{
  return self->_serviceName;
}

- (NSXPCListenerEndpoint)endpoint
{
  if (self->_remote)
  {
    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Remote connections do not support this method.",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    id v4 = -[NSXPCListenerEndpoint _initWithConnection:]( objc_alloc(&OBJC_CLASS___NSXPCListenerEndpoint),  "_initWithConnection:",  self->_connection.xpc);
    if (v4) {
      return (NSXPCListenerEndpoint *)v4;
    }
    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: The listener connection must be resumed to create an endpoint.",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
  -[NSXPCListener setOptions:](v7, v8, v9);
  return result;
}

- (void)setOptions:(unint64_t)a3
{
  __int16 v3 = a3;
  if ((a3 & 0x100) != 0)
  {
    if (self->_remote) {
      goto LABEL_7;
    }
    xpc_connection_set_legacy();
  }

  if ((v3 & 0x1000) == 0) {
    return;
  }
  if (!self->_remote)
  {
    xpc_connection_set_privileged();
    return;
  }

- (void)_setQueue:(id)a3
{
  if (a3)
  {
    userQueue = self->_userQueue;
    if (userQueue) {
      BOOL v6 = userQueue == a3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      dispatch_retain((dispatch_object_t)a3);
      xpc = self->_connection.xpc;
      SEL v8 = (dispatch_object_s *)self->_userQueue;
      self->_userQueue = (OS_dispatch_queue *)a3;
      if (self->_remote)
      {
        if (xpc) {
          _xpc_remote_connection_set_target_queue(xpc, a3);
        }
      }

      else if (xpc)
      {
        xpc_connection_set_target_queue(xpc, (dispatch_queue_t)a3);
      }

      dispatch_release(v8);
    }
  }

  else
  {
    id v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: The queue parameter is NULL, which is invalid", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    -[NSXPCListener _queue](v10, v11);
  }

- (id)_queue
{
  return self->_userQueue;
}

- (id)_xpcConnection
{
  if (!self->_remote) {
    return self->_connection.xpc;
  }
  __int16 v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  +[NSXPCListener enableTransactions](v4, v5);
  return result;
}

+ (void)enableTransactions
{
  if (enableTransactions_onceToken != -1) {
    dispatch_once(&enableTransactions_onceToken, &__block_literal_global_87);
  }
}

+ (id)_UUID
{
  id result = getenv("LaunchInstanceID");
  if (result) {
    return  -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", result));
  }
  return result;
}

@end