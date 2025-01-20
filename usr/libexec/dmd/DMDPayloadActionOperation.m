@interface DMDPayloadActionOperation
+ (id)sharedDeclarationOperationQueue;
- (BOOL)isAsynchronous;
- (BOOL)isReady;
- (BOOL)requiresNetworkTether;
- (BOOL)requiresUnlockedKeychain;
- (DMDConfigurationDatabase)database;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDPayloadActionOperation)init;
- (DMDPayloadActionOperation)initWithDatabase:(id)a3 payloadMetadataObjectID:(id)a4 payloadIdentifier:(id)a5;
- (DMDPayloadContext)payloadContext;
- (DMDTaskOperationProvider)taskOperationProvider;
- (NSManagedObjectID)payloadMetadataObjectID;
- (NSMutableArray)subOperations;
- (NSMutableDictionary)stateDictionary;
- (NSString)payloadIdentifier;
- (OS_os_transaction)transaction;
- (void)addStatusEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4;
- (void)endOperationWithPayloadMetadata:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationWillStart;
- (void)performBackgroundContextBlock:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setPayloadContext:(id)a3;
- (void)setRequiresNetworkTether:(BOOL)a3;
- (void)setRequiresUnlockedKeychain:(BOOL)a3;
- (void)setStateDictionary:(id)a3;
- (void)setSubOperations:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDPayloadActionOperation

+ (id)sharedDeclarationOperationQueue
{
  if (qword_1000CCDF0 != -1) {
    dispatch_once(&qword_1000CCDF0, &stru_10009F028);
  }
  return (id)qword_1000CCDE8;
}

- (void)dealloc
{
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = nullsub_3;
  block[3] = &unk_10009E070;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, &_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
  -[DMDPayloadActionOperation dealloc](&v6, "dealloc");
}

- (DMDPayloadActionOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
  v2 = -[DMDPayloadActionOperation init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation description](v2, "description"));
    uint64_t v5 = os_transaction_create([v4 UTF8String]);
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }

  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isReady
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
  if (!-[DMDPayloadActionOperation isReady](&v8, "isReady")) {
    return 0;
  }
  if (-[DMDPayloadActionOperation requiresUnlockedKeychain](self, "requiresUnlockedKeychain"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation deviceStateProvider](self, "deviceStateProvider"));
    unsigned int v4 = [v3 isKeychainUnlocked];

    if (!v4) {
      return 0;
    }
  }

  if (!-[DMDPayloadActionOperation requiresNetworkTether](self, "requiresNetworkTether")) {
    return 1;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation deviceStateProvider](self, "deviceStateProvider"));
  unsigned __int8 v6 = [v5 isNetworkTethered];

  return v6;
}

- (void)operationWillStart
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
  -[DMDPayloadActionOperation operationWillStart](&v3, "operationWillStart");
}

- (void)setDeviceStateProvider:(id)a3
{
  unsigned int v4 = (DMDDeviceStateProvider *)a3;
  -[DMDDeviceStateProvider removeObserver:forKeyPath:]( self->_deviceStateProvider,  "removeObserver:forKeyPath:",  self,  @"isNetworkTethered");
  -[DMDDeviceStateProvider removeObserver:forKeyPath:]( self->_deviceStateProvider,  "removeObserver:forKeyPath:",  self,  @"isKeychainUnlocked");
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  unsigned __int8 v6 = v4;

  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:]( self->_deviceStateProvider,  "addObserver:forKeyPath:options:context:",  self,  @"isKeychainUnlocked",  0LL,  "DMDPayloadActionOperationObservationContext");
  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:]( self->_deviceStateProvider,  "addObserver:forKeyPath:options:context:",  self,  @"isNetworkTethered",  0LL,  "DMDPayloadActionOperationObservationContext");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "DMDPayloadActionOperationObservationContext")
  {
    -[DMDPayloadActionOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isReady", a4, a5);
    -[DMDPayloadActionOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isReady");
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
    -[DMDPayloadActionOperation observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (DMDPayloadActionOperation)initWithDatabase:(id)a3 payloadMetadataObjectID:(id)a4 payloadIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DMDPayloadActionOperation;
  v12 = -[DMDPayloadActionOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    v14 = (NSManagedObjectID *)[v10 copy];
    payloadMetadataObjectID = v13->_payloadMetadataObjectID;
    v13->_payloadMetadataObjectID = v14;

    v16 = (NSString *)[v11 copy];
    payloadIdentifier = v13->_payloadIdentifier;
    v13->_payloadIdentifier = v16;

    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    stateDictionary = v13->_stateDictionary;
    v13->_stateDictionary = v18;
  }

  return v13;
}

- (DMDPayloadContext)payloadContext
{
  payloadContext = self->_payloadContext;
  if (!payloadContext)
  {
    unsigned int v4 = objc_opt_new(&OBJC_CLASS___DMDPayloadContext);
    uint64_t v5 = self->_payloadContext;
    self->_payloadContext = v4;

    payloadContext = self->_payloadContext;
  }

  return payloadContext;
}

- (void)performBackgroundContextBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"DMDPayloadActionOperation.m", 123, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation database](self, "database"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100047D08;
  v9[3] = &unk_10009E2F0;
  id v10 = v5;
  id v7 = v5;
  [v6 performBackgroundTask:v9];
}

- (void)enqueueOperation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation subOperations](self, "subOperations"));

  if (!v5)
  {
    unsigned __int8 v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[DMDPayloadActionOperation setSubOperations:](self, "setSubOperations:", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation subOperations](self, "subOperations"));
  [v7 addObject:v4];

  id v8 = [(id)objc_opt_class(self) sharedDeclarationOperationQueue];
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v9 addOperation:v4];
}

- (void)addStatusEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation stateDictionary](self, "stateDictionary"));
  [v5 addEntriesFromDictionary:v4];
}

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  unsigned __int8 v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v8 handleFailureInMethod:a2, self, @"DMDPayloadActionOperation.m", 142, @"%@ must be implemented by subclasses", v7 object file lineNumber description];
}

- (void)endOperationWithPayloadMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation stateDictionary](self, "stateDictionary"));
  [v4 setStateDictionary:v5];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 incomingPayloadMetadataReferences]);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___DMDActivationPayloadMetadata);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
          [v11 updateStateDictionaryIfNeeded];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
  id v16 = 0LL;
  unsigned __int8 v14 = [v13 save:&v16];
  id v15 = v16;

  if ((v14 & 1) != 0) {
    -[DMDPayloadActionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }
  else {
    -[DMDPayloadActionOperation endOperationWithError:](self, "endOperationWithError:", v15);
  }
}

- (BOOL)requiresNetworkTether
{
  return self->_requiresNetworkTether;
}

- (void)setRequiresNetworkTether:(BOOL)a3
{
  self->_requiresNetworkTether = a3;
}

- (BOOL)requiresUnlockedKeychain
{
  return self->_requiresUnlockedKeychain;
}

- (void)setRequiresUnlockedKeychain:(BOOL)a3
{
  self->_requiresUnlockedKeychain = a3;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (NSManagedObjectID)payloadMetadataObjectID
{
  return self->_payloadMetadataObjectID;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadContext:(id)a3
{
}

- (NSMutableArray)subOperations
{
  return self->_subOperations;
}

- (void)setSubOperations:(id)a3
{
}

- (NSMutableDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end