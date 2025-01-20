@interface _LSDClient
- (NSXPCConnection)XPCConnection;
- (_LSDClient)initWithXPCConnection:(id)a3;
- (_LSDClient)initWithXPCConnection:(id)a3 queue:(id)a4;
- (void)handleXPCInvocation:(id)a3 isReply:(BOOL)a4;
- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDClient

- (_LSDClient)initWithXPCConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSDClient;
  v4 = -[_LSDClient init](&v6, sel_init);
  _LSAssertRunningInServer((uint64_t)"-[_LSDClient initWithXPCConnection:]");
  if (v4) {
    objc_storeStrong((id *)&v4->_XPCConnection, a3);
  }
  return v4;
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
}

- (NSXPCConnection)XPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

- (_LSDClient)initWithXPCConnection:(id)a3 queue:(id)a4
{
  v5 = -[_LSDClient initWithXPCConnection:](self, "initWithXPCConnection:", a3);
  objc_super v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_queue, a4);
  }
  return v6;
}

- (void)handleXPCInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (self->_queue)
  {
    -[_LSDClient willHandleInvocation:isReply:](self, "willHandleInvocation:isReply:", a3, a4);
    MEMORY[0x186E2AFD4]([a3 retainArguments]);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __51___LSDClient_Private__handleXPCInvocation_isReply___block_invoke;
    v12[3] = &unk_189D76A78;
    v12[4] = self;
    v12[5] = a3;
    BOOL v13 = v4;
    _LSServer_MakeServiceFloorBlock(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _LSDefaultLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        Name = class_getName(v9);
        v11 = sel_getName((SEL)[a3 selector]);
        -[_LSDClient(Private) handleXPCInvocation:isReply:].cold.1((uint64_t)v11, (uint64_t)v14, (uint64_t)Name, v8);
      }

      abort();
    }

    dispatch_async((dispatch_queue_t)self->_queue, v7);
  }

  else
  {
    -[_LSDClient willHandleInvocation:isReply:](self, "willHandleInvocation:isReply:", a3, a4);
    -[_LSDClient invokeServiceInvocation:isReply:](self, "invokeServiceInvocation:isReply:", a3, v4);
    -[_LSDClient didHandleInvocation:isReply:](self, "didHandleInvocation:isReply:", a3, v4);
  }

@end