}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

SASyncProxyClient

- (OSASyncProxyClient)initWithErrorHandler:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSASyncProxyClient;
  v5 = -[OSASyncProxyClient init](&v12, sel_init);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.OSASyncProxy.client" options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C74A918];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_connection, "resume");
    uint64_t v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v5->_connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v4);
    synchRemoteObjectProxy = v5->_synchRemoteObjectProxy;
    v5->_synchRemoteObjectProxy = (OSASyncProxyServices *)v9;
  }

  return v5;
}

- (OSASyncProxyClient)init
{
  return -[OSASyncProxyClient initWithErrorHandler:](self, "initWithErrorHandler:", &__block_literal_global);
}

void __26__OSASyncProxyClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    uint64_t v4 = a2;
    _os_log_impl( &dword_188CC9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Connection error to ProxiedCrashCopier. Error: %{public}@",  (uint8_t *)&v3,  0xCu);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSASyncProxyClient;
  -[OSASyncProxyClient dealloc](&v3, sel_dealloc);
}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[&unk_18A2F9A40 mutableCopy];
  [v11 addEntriesFromDictionary:v9];

  -[OSASyncProxyServices request:transferGroupWithOptions:onComplete:]( self->_synchRemoteObjectProxy,  "request:transferGroupWithOptions:onComplete:",  v10,  v11,  v8);
}

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[&unk_18A2F9A68 mutableCopy];
  v14 = v13;
  if (v11) {
    [v13 addEntriesFromDictionary:v11];
  }
  -[OSASyncProxyServices request:transferLog:withOptions:onComplete:]( self->_synchRemoteObjectProxy,  "request:transferLog:withOptions:onComplete:",  v15,  v10,  v14,  v12);
}

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logList:(id)a4
{
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
}

- (void)listDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end