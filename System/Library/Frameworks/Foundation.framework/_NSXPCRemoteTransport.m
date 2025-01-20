@interface _NSXPCRemoteTransport
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (_NSXPCRemoteTransport)initWithConnection:(id)a3;
- (_NSXPCRemoteTransport)initWithRemoteService:(id)a3 name:(id)a4 queue:(id)a5 mode:(unint64_t)a6;
- (id)sendMessageWithReplySync:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)sendBarrierBlock:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)suspend;
@end

@implementation _NSXPCRemoteTransport

- (_NSXPCRemoteTransport)initWithConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____NSXPCRemoteTransport;
  v4 = -[_NSXPCRemoteTransport init](&v11, sel_init);
  if (_MergedGlobals_112 != -1) {
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  }
  v5 = (OS_xpc_remote_connection *)xpc_retain(a3);
  v4->_connection = v5;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44___NSXPCRemoteTransport_initWithConnection___block_invoke;
  v10[3] = &unk_189C9F968;
  v10[4] = v4;
  _xpc_remote_connection_set_event_handler(v5, v10, v6, v7, v8);
  return v4;
}

- (_NSXPCRemoteTransport)initWithRemoteService:(id)a3 name:(id)a4 queue:(id)a5 mode:(unint64_t)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____NSXPCRemoteTransport;
  objc_super v11 = -[_NSXPCRemoteTransport init](&v19, sel_init);
  if (_MergedGlobals_112 != -1) {
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  }
  uint64_t v12 = off_18C496A08(a3, a5, a6);
  v11->_connection = (OS_xpc_remote_connection *)v12;
  if (!v12)
  {
    v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v11, a2), a4), 0 reason userInfo];
    objc_exception_throw(v17);
  }

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __63___NSXPCRemoteTransport_initWithRemoteService_name_queue_mode___block_invoke;
  v18[3] = &unk_189C9F968;
  v18[4] = v11;
  _xpc_remote_connection_set_event_handler(v12, v18, v13, v14, v15);
  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  xpc_release(self->_connection);
  _Block_release(self->_errorHandler);
  _Block_release(self->_messageHandler);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSXPCRemoteTransport;
  -[_NSXPCRemoteTransport dealloc](&v3, sel_dealloc);
}

- (void)setErrorHandler:(id)a3
{
  self->_errorHandler = _Block_copy(a3);
}

- (void)setMessageHandler:(id)a3
{
  self->_messageHandler = _Block_copy(a3);
}

- (void)sendMessage:(id)a3
{
}

- (id)sendMessageWithReplySync:(id)a3
{
  return (id)__NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REMOTE_REPLY__();
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
}

- (void)sendNotification:(id)a3
{
}

- (void)sendBarrierBlock:(id)a3
{
}

- (void)setTargetQueue:(id)a3
{
}

- (void)activate
{
}

- (void)suspend
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  -[_NSXPCRemoteTransport resume](v3, v4);
}

- (void)resume
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  -[_NSXPCRemoteTransport cancel](v3, v4);
}

- (void)cancel
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a3)), 0 reason userInfo];
  objc_exception_throw(v3);
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[_NSXPCRemoteTransport auditSessionIdentifier](v4, v5);
}

- (int)auditSessionIdentifier
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[_NSXPCRemoteTransport processIdentifier](v3, v4);
}

- (int)processIdentifier
{
  return 0;
}

- (unsigned)effectiveUserIdentifier
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[_NSXPCRemoteTransport effectiveGroupIdentifier](v3, v4);
}

- (unsigned)effectiveGroupIdentifier
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Remote connections do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[_NSClStr initWithCharacters:length:](v3, v4, v5, v6);
}

@end