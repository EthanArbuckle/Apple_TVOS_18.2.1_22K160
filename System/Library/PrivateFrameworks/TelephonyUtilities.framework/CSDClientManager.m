@interface CSDClientManager
- (BOOL)isClientAllowed:(id)a3;
- (BOOL)isLocalClientActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)supportsClientAssertions;
- (CSDClient)currentClient;
- (CSDClientManager)initWithSerialQueue:(id)a3;
- (NSArray)clients;
- (NSMapTable)clientsByObject;
- (NSString)machServiceName;
- (NSString)requiredConnectionCapability;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (id)_connectionEndedHandlerForXPCClient:(id)a3 withCustomBlock:(id)a4;
- (id)_updatedQOSBlockForBlock:(id)a3;
- (id)_xpcClientForConnection:(id)a3;
- (id)asynchronousExportedObjectProxy;
- (id)clientsEntitledForCapability:(id)a3;
- (id)clientsPassingTest:(id)a3;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)synchronousExportedObjectProxy;
- (void)_performBlock:(id)a3 onClients:(id)a4;
- (void)_performBlock:(id)a3 onClients:(id)a4 coalescedByIdentifier:(id)a5;
- (void)addClient:(id)a3;
- (void)addLocalClientObject:(id)a3;
- (void)dealloc;
- (void)filterClientsEntitledForCapability:(id)a3 andPerformBlock:(id)a4;
- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4;
- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4 coalescedByIdentifier:(id)a5;
- (void)handleInvocation:(id)a3 synchronously:(BOOL)a4;
- (void)invalidate;
- (void)performBlockOnClients:(id)a3;
- (void)performBlockOnClients:(id)a3 coalescedByIdentifier:(id)a4;
- (void)performBlockOnQueue:(id)a3;
- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4;
- (void)removeClient:(id)a3;
- (void)removeLocalClientObject:(id)a3;
- (void)setAsynchronousExportedObjectProxy:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalClientActive:(BOOL)a3;
- (void)setMachServiceName:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setRequiredConnectionCapability:(id)a3;
- (void)setSupportsClientAssertions:(BOOL)a3;
- (void)setSynchronousExportedObjectProxy:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)startListeningOnMachServiceWithName:(id)a3;
@end

@implementation CSDClientManager

- (CSDClientManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDClientManager;
  v6 = -[CSDClientManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific( (dispatch_queue_t)v7->_queue,  -[CSDClientManager queueContext](v7, "queueContext"),  -[CSDClientManager queueContext](v7, "queueContext"),  0LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    clientsByObject = v7->_clientsByObject;
    v7->_clientsByObject = (NSMapTable *)v8;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDClientManager;
  -[CSDClientManager dealloc](&v3, "dealloc");
}

- (BOOL)isLocalClientActive
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_localClientActive;
}

- (void)setLocalClientActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_localClientActive != v3) {
    self->_localClientActive = v3;
  }
}

- (NSXPCInterface)remoteObjectInterface
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
  v4 = (NSXPCInterface *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  remoteObjectInterface = self->_remoteObjectInterface;
  self->_remoteObjectInterface = v4;
}

- (NSXPCInterface)exportedInterface
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
  v4 = (NSXPCInterface *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  exportedInterface = self->_exportedInterface;
  self->_exportedInterface = v4;
}

- (id)interruptionHandler
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return objc_retainBlock(self->_interruptionHandler);
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_retainBlock(v4);
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v6;
}

- (id)invalidationHandler
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return objc_retainBlock(self->_invalidationHandler);
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_retainBlock(v4);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v6;
}

- (id)asynchronousExportedObjectProxy
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_asynchronousExportedObjectProxy;
}

- (void)setAsynchronousExportedObjectProxy:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id asynchronousExportedObjectProxy = self->_asynchronousExportedObjectProxy;
  self->_id asynchronousExportedObjectProxy = v4;
}

- (id)synchronousExportedObjectProxy
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_synchronousExportedObjectProxy;
}

- (void)setSynchronousExportedObjectProxy:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id synchronousExportedObjectProxy = self->_synchronousExportedObjectProxy;
  self->_id synchronousExportedObjectProxy = v4;
}

- (id)exportedObject
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  id v11 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_exportedObject != v11)
  {
    objc_storeStrong(&self->_exportedObject, a3);
    if (self->_exportedObject)
    {
      id v6 = -[CSDClientManagerExportedObjectProxy initWithExportedObject:]( objc_alloc(&OBJC_CLASS___CSDClientManagerExportedObjectProxy),  "initWithExportedObject:",  self->_exportedObject);
      -[CSDClientManagerExportedObjectProxy setClientManager:](v6, "setClientManager:", self);
      id asynchronousExportedObjectProxy = self->_asynchronousExportedObjectProxy;
      self->_id asynchronousExportedObjectProxy = v6;
      uint64_t v8 = v6;

      v9 = -[CSDClientManagerExportedObjectProxy initWithExportedObject:]( objc_alloc(&OBJC_CLASS___CSDClientManagerExportedObjectProxy),  "initWithExportedObject:",  self->_exportedObject);
      -[CSDClientManagerExportedObjectProxy setClientManager:](v9, "setClientManager:", self);
      -[CSDClientManagerExportedObjectProxy setSynchronous:](v9, "setSynchronous:", 1LL);
      id synchronousExportedObjectProxy = self->_synchronousExportedObjectProxy;
      self->_id synchronousExportedObjectProxy = v9;
    }
  }
}

- (NSArray)clients
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
  id v5 = NSAllMapTableValues(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSArray *)v6;
}

- (CSDClient)currentClient
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (!-[CSDClientManager isLocalClientActive](self, "isLocalClientActive"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

      if (v12)
      {
LABEL_17:

        return (CSDClient *)v12;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"We have an active XPC connection but no corresponding CSDClient"));
      NSLog(@"** TUAssertion failure: %@", v15);

      if (_TUAssertShouldCrashApplication())
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v16 handleFailureInMethod:a2 object:self file:@"CSDClientManager.m" lineNumber:136 description:@"We have an active XPC connection but no corresponding CSDClient"];
      }
    }

    v12 = 0LL;
    goto LABEL_17;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_4:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    v12 = 0LL;
  }

  return (CSDClient *)v12;
}

- (BOOL)isClientAllowed:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager requiredConnectionCapability](self, "requiredConnectionCapability"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager requiredConnectionCapability](self, "requiredConnectionCapability"));
    unsigned __int8 v8 = [v4 isEntitledForCapability:v7];
  }

  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)startListeningOnMachServiceWithName:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDClientManager setMachServiceName:](self, "setMachServiceName:", v4);
  id v6 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v4);

  -[CSDClientManager setXpcListener:](self, "setXpcListener:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager xpcListener](self, "xpcListener"));
  [v7 setDelegate:self];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager xpcListener](self, "xpcListener"));
  [v8 resume];
}

- (void)invalidate
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager xpcListener](self, "xpcListener"));
  [v4 invalidate];

  -[CSDClientManager setExportedObject:](self, "setExportedObject:", 0LL);
  -[CSDClientManager setAsynchronousExportedObjectProxy:](self, "setAsynchronousExportedObjectProxy:", 0LL);
  -[CSDClientManager setSynchronousExportedObjectProxy:](self, "setSynchronousExportedObjectProxy:", 0LL);
}

- (void)addLocalClientObject:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___CSDClient);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  id v8 = -[CSDClient initWithObject:queue:](v6, "initWithObject:queue:", v4, v7);

  -[CSDClientManager addClient:](self, "addClient:", v8);
}

- (void)removeLocalClientObject:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  -[CSDClientManager removeClient:](self, "removeClient:", v7);
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  [v7 setObject:v4 forKey:v6];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsByObject](self, "clientsByObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);

  [v7 removeObjectForKey:v6];
}

- (id)clientsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clients](self, "clients"));
  if (v4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10019E788;
    v10[3] = &unk_1003DC618;
    id v11 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v10));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v7]);

    id v6 = (void *)v8;
  }

  return v6;
}

- (id)clientsEntitledForCapability:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001545BC(v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsPassingTest:](self, "clientsPassingTest:", v7));
  return v8;
}

- (void)performBlockOnClients:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clients](self, "clients"));
  -[CSDClientManager _performBlock:onClients:coalescedByIdentifier:]( self,  "_performBlock:onClients:coalescedByIdentifier:",  v4,  v6,  0LL);
}

- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsPassingTest:](self, "clientsPassingTest:", v7));
  -[CSDClientManager _performBlock:onClients:coalescedByIdentifier:]( self,  "_performBlock:onClients:coalescedByIdentifier:",  v6,  v9,  0LL);
}

- (void)filterClientsEntitledForCapability:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001545BC(v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  -[CSDClientManager filterClientsUsingPredicate:andPerformBlock:]( self,  "filterClientsUsingPredicate:andPerformBlock:",  v10,  v6);
}

- (void)performBlockOnClients:(id)a3 coalescedByIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clients](self, "clients"));
  -[CSDClientManager _performBlock:onClients:coalescedByIdentifier:]( self,  "_performBlock:onClients:coalescedByIdentifier:",  v7,  v9,  v6);
}

- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4 coalescedByIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManager clientsPassingTest:](self, "clientsPassingTest:", v10));
  -[CSDClientManager _performBlock:onClients:coalescedByIdentifier:]( self,  "_performBlock:onClients:coalescedByIdentifier:",  v9,  v12,  v8);
}

- (void)performBlockOnQueue:(id)a3
{
}

- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4
{
  BOOL v4 = a4;
  block = (void (**)(void))a3;
  specific = dispatch_get_specific(-[CSDClientManager queueContext](self, "queueContext"));
  if (specific == -[CSDClientManager queueContext](self, "queueContext"))
  {
    block[2]();
  }

  else
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
    id v8 = v7;
    if (v4) {
      dispatch_sync(v7, block);
    }
    else {
      dispatch_async(v7, block);
    }
  }
}

- (void)_performBlock:(id)a3 onClients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "performBlock:", v6, (void)v14);
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (void)_performBlock:(id)a3 onClients:(id)a4 coalescedByIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (v10) {
          [v17 performBlock:v8 coalescedByIdentifier:v10];
        }
        else {
          objc_msgSend(v17, "performBlock:", v8, (void)v18);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }
}

- (id)_xpcClientForConnection:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___CSDXPCClient);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  id v8 = -[CSDXPCClient initWithConnection:queue:](v6, "initWithConnection:queue:", v4, v7);

  -[CSDXPCClient setSupportsClientAssertions:]( v8,  "setSupportsClientAssertions:",  -[CSDClientManager supportsClientAssertions](self, "supportsClientAssertions"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager remoteObjectInterface](self, "remoteObjectInterface"));
  [v4 setRemoteObjectInterface:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager exportedInterface](self, "exportedInterface"));
  [v4 setExportedInterface:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager exportedObject](self, "exportedObject"));
  [v4 setExportedObject:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager interruptionHandler](self, "interruptionHandler"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDClientManager _connectionEndedHandlerForXPCClient:withCustomBlock:]( self,  "_connectionEndedHandlerForXPCClient:withCustomBlock:",  v8,  v12));
  [v4 setInterruptionHandler:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager invalidationHandler](self, "invalidationHandler"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDClientManager _connectionEndedHandlerForXPCClient:withCustomBlock:]( self,  "_connectionEndedHandlerForXPCClient:withCustomBlock:",  v8,  v14));
  [v4 setInvalidationHandler:v15];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  [v4 _setQueue:v16];

  return v8;
}

- (id)_connectionEndedHandlerForXPCClient:(id)a3 withCustomBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10019F04C;
  v12[3] = &unk_1003DC668;
  v12[4] = self;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v9 = v6;
  id v10 = objc_retainBlock(v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

- (id)_updatedQOSBlockForBlock:(id)a3
{
  id v3 = a3;
  if (qos_class_self() >= QOS_CLASS_DEFAULT) {
    qos_class_t v4 = qos_class_self();
  }
  else {
    qos_class_t v4 = QOS_CLASS_DEFAULT;
  }
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v4, 0, v3);

  return v5;
}

- (void)handleInvocation:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_10019F25C;
  id v11 = &unk_1003D7758;
  id v12 = self;
  id v13 = a3;
  id v6 = v13;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager _updatedQOSBlockForBlock:](v12, "_updatedQOSBlockForBlock:", &v8));
  objc_msgSend(v6, "retainArguments", v8, v9, v10, v11, v12);
  -[CSDClientManager performBlockOnQueue:andWait:](self, "performBlockOnQueue:andWait:", v7, v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManager machServiceName](self, "machServiceName"));
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "machServiceName: %@ newConnection: %@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v19 = 0;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDClientManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019F47C;
  block[3] = &unk_1003D9238;
  block[4] = self;
  id v16 = v7;
  __int128 v17 = buf;
  id v12 = v7;
  dispatch_sync(v11, block);

  BOOL v13 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
  _Block_object_dispose(buf, 8);

  return v13;
}

- (NSString)requiredConnectionCapability
{
  return self->_requiredConnectionCapability;
}

- (void)setRequiredConnectionCapability:(id)a3
{
}

- (BOOL)supportsClientAssertions
{
  return self->_supportsClientAssertions;
}

- (void)setSupportsClientAssertions:(BOOL)a3
{
  self->_supportsClientAssertions = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)clientsByObject
{
  return self->_clientsByObject;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end