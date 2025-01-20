@interface OSLogCurrentProcessEnumerator
- (OSLogCurrentProcessEnumerator)initWithOptions:(unint64_t)a3 predicate:(id)a4 position:(id)a5;
- (id)nextObject;
- (void)dealloc;
@end

@implementation OSLogCurrentProcessEnumerator

- (OSLogCurrentProcessEnumerator)initWithOptions:(unint64_t)a3 predicate:(id)a4 position:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___OSLogCurrentProcessEnumerator;
  v9 = -[OSLogCurrentProcessEnumerator init](&v23, sel_init);
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.OSLogService"];
    connectionToService = v9->_connectionToService;
    v9->_connectionToService = (NSXPCConnection *)v10;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6987E0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9->_connectionToService, "setRemoteObjectInterface:", v12);

    -[NSXPCConnection resume](v9->_connectionToService, "resume");
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0LL;
    v13 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v9->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_430);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_35;
    v16[3] = &unk_189F1E098;
    v16[4] = &v17;
    [v13 setUpWithPredicate:v7 reply:v16];

    if (v18[5]) {
      v14 = 0LL;
    }
    else {
      v14 = v9;
    }
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogCurrentProcessEnumerator;
  -[OSLogCurrentProcessEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0LL;
  v2 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_36);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_37;
  v5[3] = &unk_189F1E0E0;
  v5[4] = &v6;
  [v2 getNextOSLogEntryWithReply:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_37(uint64_t a1, void *a2)
{
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_1869F5000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_35( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl( &dword_1869F5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Caught error: %@",  (uint8_t *)&v5,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
}

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_1869F5000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }

@end