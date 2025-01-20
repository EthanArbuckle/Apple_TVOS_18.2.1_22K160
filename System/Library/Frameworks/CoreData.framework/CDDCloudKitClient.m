@interface CDDCloudKitClient
- (BOOL)_valid;
- (CDDCloudKitClient)initWithMachServiceName:(id)a3;
- (void)dealloc;
- (void)handleMessage:(id)a3 reply:(id)a4;
@end

@implementation CDDCloudKitClient

- (CDDCloudKitClient)initWithMachServiceName:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CDDCloudKitClient;
  v4 = -[CDDCloudKitClient init](&v15, sel_init);
  if (v4)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:a3 options:0];
    v4->_connection = v5;
    -[NSXPCConnection setRemoteObjectInterface:]( v5,  "setRemoteObjectInterface:",  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6A6DB8]);
    objc_initWeak(&location, v4);
    connection = v4->_connection;
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke;
    v12[3] = &unk_189EA8330;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v12);
    v8 = v4->_connection;
    v10[0] = v7;
    v10[1] = 3221225472LL;
    v10[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2;
    v10[3] = &unk_189EA8330;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v10);
    -[NSXPCConnection resume](v4->_connection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[9] = 1;
  }
}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[8] = 1;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CDDCloudKitClient;
  -[CDDCloudKitClient dealloc](&v3, sel_dealloc);
}

- (BOOL)_valid
{
  return !self->_interrupted && !self->_invalidated;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  v14 = __Block_byref_object_copy__26;
  objc_super v15 = __Block_byref_object_dispose__26;
  uint64_t v16 = 0LL;
  connection = self->_connection;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __41__CDDCloudKitClient_handleMessage_reply___block_invoke;
  v10[3] = &unk_189EAA020;
  void v10[4] = &v11;
  id v7 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v10);
  if (!v7 || ([v7 handleMessage:a3 reply:a4], v12[5]))
  {
    v8 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
    v9 = -[CDDCloudKitResponse initWithMessage:success:error:](v8, a3, 0, (void *)v12[5]);
    (*((void (**)(id, void *))a4 + 2))(a4, v9);
  }

  v12[5] = 0LL;
  _Block_object_dispose(&v11, 8);
}

id __41__CDDCloudKitClient_handleMessage_reply___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

@end