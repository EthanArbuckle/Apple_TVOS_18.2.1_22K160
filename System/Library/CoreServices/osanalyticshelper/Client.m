@interface Client
- (BOOL)entitled;
- (Client)initWithConnection:(id)a3 entitled:(BOOL)a4;
- (int)pid;
- (void)didWriteLog:(id)a3 filePath:(id)a4;
- (void)failedToWriteLog:(id)a3 error:(id)a4;
- (void)registerForEvents:(id)a3 replyHandler:(id)a4;
- (void)registerForWrites:(id)a3 replyHandler:(id)a4;
- (void)willWriteLog:(id)a3 details:(id)a4;
@end

@implementation Client

- (Client)initWithConnection:(id)a3 entitled:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___Client;
  v8 = -[Client init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_entitled = a4;
    objc_storeStrong((id *)&v8->_connection, a3);
    uint64_t v10 = os_transaction_create("com.apple.osanalytics.diagnosticmonitorclient");
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v10;

    eventTypes = v9->_eventTypes;
    v9->_eventTypes = 0LL;

    writeTypes = v9->_writeTypes;
    v9->_writeTypes = 0LL;
  }

  return v9;
}

- (int)pid
{
  return -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
}

- (void)willWriteLog:(id)a3 details:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  eventTypes = self->_eventTypes;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v14 bugType]);
  LODWORD(eventTypes) = -[NSSet containsObject:](eventTypes, "containsObject:", v8);

  if ((_DWORD)eventTypes)
  {
    id v9 = [[OSALogEvent alloc] initWithIdentity:v14 details:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v10 receivedLogEvent:v9];
  }

  writeTypes = self->_writeTypes;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v14 bugType]);
  LODWORD(writeTypes) = -[NSSet containsObject:](writeTypes, "containsObject:", v12);

  if ((_DWORD)writeTypes)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v13 willWriteLog:v14];
  }
}

- (void)didWriteLog:(id)a3 filePath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  writeTypes = self->_writeTypes;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v11 bugType]);
  LODWORD(writeTypes) = -[NSSet containsObject:](writeTypes, "containsObject:", v8);

  if ((_DWORD)writeTypes)
  {
    id v9 = [[OSALogWriteResult alloc] initWithIdentity:v11 filePath:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v10 didWriteLog:v9];
  }
}

- (void)failedToWriteLog:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  writeTypes = self->_writeTypes;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v11 bugType]);
  LODWORD(writeTypes) = -[NSSet containsObject:](writeTypes, "containsObject:", v8);

  if ((_DWORD)writeTypes)
  {
    id v9 = [[OSALogWriteResult alloc] initWithIdentity:v11 error:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v10 didWriteLog:v9];
  }
}

- (void)registerForEvents:(id)a3 replyHandler:(id)a4
{
  id v10 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_10000E9BC(v10);
  if (self->_entitled)
  {
    objc_storeStrong((id *)&self->_eventTypes, a3);
    v7[2](v7, 0LL);
  }

  else
  {
    id v8 = sub_10000EB50();
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, v9);

    id v7 = (void (**)(id, void))v9;
  }
}

- (void)registerForWrites:(id)a3 replyHandler:(id)a4
{
  id v10 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_10000E9BC(v10);
  if (self->_entitled)
  {
    objc_storeStrong((id *)&self->_writeTypes, a3);
    v7[2](v7, 0LL);
  }

  else
  {
    id v8 = sub_10000EB50();
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, v9);

    id v7 = (void (**)(id, void))v9;
  }
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void).cxx_destruct
{
}

@end