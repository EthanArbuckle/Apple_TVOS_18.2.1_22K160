@interface DBGLocalDataSourceConnection
+ (Class)matchingDataCoordinatorClass;
- (DBGDataSourceConnectionDelegate)delegate;
- (DBGLocalDataSourceConnection)initWithPid:(int)a3;
- (DBGLocalDataSourceConnection)initWithPid:(int)a3 agentConnection:(id)a4;
- (OS_dispatch_queue)captureQueue;
- (float)debugHierarchyVersion;
- (void)closeConnection;
- (void)dealloc;
- (void)performRequest:(id)a3;
- (void)retrieveDebugHierarchyConfiguration:(id)a3;
- (void)setCaptureQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DBGLocalDataSourceConnection

+ (Class)matchingDataCoordinatorClass
{
  return 0LL;
}

- (DBGLocalDataSourceConnection)initWithPid:(int)a3 agentConnection:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DBGLocalDataSourceConnection;
  v7 = -[DBGLocalDataSourceConnection init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_pid = a3;
    dispatch_queue_t v9 = dispatch_queue_create("LocalConnectionQueue", 0LL);
    connectionQueue = v8->_connectionQueue;
    v8->_connectionQueue = (OS_dispatch_queue *)v9;

    if (v6) {
      xpc_connection_t mach_service = (xpc_connection_t)v6;
    }
    else {
      xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.dt.ViewHierarchyAgent.xpc",  (dispatch_queue_t)v8->_connectionQueue,  0LL);
    }
    connection = v8->_connection;
    v8->_connection = mach_service;

    xpc_connection_set_event_handler(v8->_connection, &__block_literal_global_1);
    xpc_connection_activate(v8->_connection);
  }

  return v8;
}

- (DBGLocalDataSourceConnection)initWithPid:(int)a3
{
  return -[DBGLocalDataSourceConnection initWithPid:agentConnection:]( self,  "initWithPid:agentConnection:",  *(void *)&a3,  0LL);
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGLocalDataSourceConnection;
  -[DBGLocalDataSourceConnection dealloc](&v5, "dealloc");
}

- (float)debugHierarchyVersion
{
  return 4.0;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 temporaryDirectory]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v8]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  [v10 createFileAtPath:v11 contents:0 attributes:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v9,  0LL));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "action", "performRequest");
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  id v14 = objc_claimAutoreleasedReturnValue([v4 base64Encoded]);
  xpc_dictionary_set_string(empty, "request", (const char *)[v14 cStringUsingEncoding:4]);

  xpc_dictionary_set_fd(empty, "fd", (int)[v12 fileDescriptor]);
  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __47__DBGLocalDataSourceConnection_performRequest___block_invoke;
  v20[3] = &unk_20880;
  id v21 = v9;
  v22 = self;
  id v23 = v4;
  id v24 = v12;
  id v17 = v12;
  id v18 = v4;
  id v19 = v9;
  xpc_connection_send_message_with_reply(connection, empty, (dispatch_queue_t)connectionQueue, v20);
}

void __47__DBGLocalDataSourceConnection_performRequest___block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  *(void *)(a1 + 32),  0LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 readDataToEndOfFile]);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) captureQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __47__DBGLocalDataSourceConnection_performRequest___block_invoke_2;
    block[3] = &unk_20858;
    id v11 = *(id *)(a1 + 48);
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 40);
    id v8 = v6;
    dispatch_async(v7, block);

    [v5 closeFile];
    [*(id *)(a1 + 56) closeFile];
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v9 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }

  else
  {
    v3 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + 32LL);
    if (!v3) {
      return;
    }
    xpc_connection_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 40);
    objc_super v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;
  }
}

void __47__DBGLocalDataSourceConnection_performRequest___block_invoke_2(id *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1[6] delegate]);
  [v2 didReceiveData:a1[5] forRequest:a1[4]];

  if ([a1[5] length]) {
    uint64_t v3 = 3LL;
  }
  else {
    uint64_t v3 = -2LL;
  }
  [a1[4] setStatus:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] completion]);

  if (v4)
  {
    objc_super v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([a1[4] completion]);
    ((void (**)(void, id))v5)[2](v5, a1[4]);
  }

- (void)retrieveDebugHierarchyConfiguration:(id)a3
{
}

- (void)closeConnection
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "action", "finish");
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __47__DBGLocalDataSourceConnection_closeConnection__block_invoke;
  handler[3] = &unk_208A8;
  handler[4] = self;
  xpc_connection_send_message_with_reply(connection, empty, (dispatch_queue_t)connectionQueue, handler);
}

void __47__DBGLocalDataSourceConnection_closeConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;
}

- (DBGDataSourceConnectionDelegate)delegate
{
  return (DBGDataSourceConnectionDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)captureQueue
{
  return self->captureQueue;
}

- (void)setCaptureQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end