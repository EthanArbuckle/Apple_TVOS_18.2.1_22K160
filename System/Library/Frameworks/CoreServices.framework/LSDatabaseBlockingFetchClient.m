@interface LSDatabaseBlockingFetchClient
- (LSDatabaseBlockingFetchClient)initWithXPCConnection:(id)a3;
- (void)getServerStoreBlockingWithCompletionHandler:(id)a3;
@end

@implementation LSDatabaseBlockingFetchClient

- (LSDatabaseBlockingFetchClient)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSDatabaseBlockingFetchClient;
  v6 = -[LSDatabaseBlockingFetchClient init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)getServerStoreBlockingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[LSDatabaseBlockingFetchClient getServerStoreBlockingWithCompletionHandler:]");
  if (getServerStoreBlockingWithCompletionHandler__onceToken != -1) {
    dispatch_once(&getServerStoreBlockingWithCompletionHandler__onceToken, &__block_literal_global_33_1);
  }
  +[LSDatabaseBlockingFetchServer sharedInstance](&OBJC_CLASS___LSDatabaseBlockingFetchServer, "sharedInstance");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isForManualRebuild];

  if (v6) {
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__();
  }
  else {
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  }
  v7 = self->_connection;
  _LSServer_DatabaseExecutionContext();
  v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_189D77848;
  v12 = v7;
  id v13 = v4;
  id v10 = v4;
  objc_super v9 = v7;
  -[LSDBExecutionContext syncRead:](v8, v11);
}

uint64_t __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return _LSBundleDisplayNameContextEnumerate( __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__,  v5,  v6,  v7,  v8);
}

void __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2( uint64_t a1)
{
}

- (void).cxx_destruct
{
}

@end