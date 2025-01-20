@interface FTConversationService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptConnection:(id)a3;
- (FTConversationService)initWithQueue:(id)a3;
- (FTConversationServiceConnectionManager)connectionManager;
- (FTPersistentDataSource)dataSource;
- (OS_dispatch_queue)queue;
@end

@implementation FTConversationService

- (FTConversationService)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FTConversationService;
  v6 = -[FTConversationService init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___FTPersistentDataSource);
    dataSource = v7->_dataSource;
    v7->_dataSource = v8;

    v10 = -[FTConversationServiceConnectionManager initWithDataSource:]( objc_alloc(&OBJC_CLASS___FTConversationServiceConnectionManager),  "initWithDataSource:",  v7->_dataSource);
    connectionManager = v7->_connectionManager;
    v7->_connectionManager = v10;
  }

  return v7;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 conversationServiceEntitlements]);
  else {
    unsigned __int8 v4 = [v3 containsObject:@"modify-conversation-links"];
  }

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = FTCServiceLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to accept connection %@",  (uint8_t *)&v17,  0xCu);
  }

  BOOL v8 = -[FTConversationService shouldAcceptConnection:](self, "shouldAcceptConnection:", v5);
  uint64_t v9 = FTCServiceLog();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Entitlement found; accepting connection %@",
        (uint8_t *)&v17,
        0xCu);
    }

    v12 = objc_alloc(&OBJC_CLASS___FTConversationServiceConnection);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationService queue](self, "queue"));
    v14 = -[FTConversationServiceConnection initWithConnection:queue:](v12, "initWithConnection:queue:", v5, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationService connectionManager](self, "connectionManager"));
    [v15 addConnection:v14];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D12C((uint64_t)v5, v11);
    }

    [v5 invalidate];
  }

  return v8;
}

- (FTConversationServiceConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (FTPersistentDataSource)dataSource
{
  return self->_dataSource;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end