@interface BluetoothHeadsetExtension
- (BOOL)didPeripheralConnection;
- (BOOL)leUarpBranchDone;
- (CBCentralManager)centralManager;
- (NSDictionary)cmOptions;
- (NSMutableArray)peripherals;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
- (void)cancelXPCConnection;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)handleXPCError:(id)a3;
- (void)handleXPCEvent:(id)a3;
- (void)handleXPCMsg:(id)a3;
- (void)leLogRequest;
- (void)sendXPCMsg:(id)a3 args:(id)a4;
- (void)setCentralManager:(id)a3;
- (void)setCmOptions:(id)a3;
- (void)setDidPeripheralConnection:(BOOL)a3;
- (void)setLeUarpBranchDone:(BOOL)a3;
- (void)setPeripherals:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation BluetoothHeadsetExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v50 = a3;
  NSLog(@"attachmentsForParameters: Invoked");
  v4 = (OS_dispatch_queue *)dispatch_queue_create("BluetoothHeadsetLogging", &_dispatch_queue_attr_concurrent);
  queue = self->_queue;
  self->_queue = v4;

  self->_didPeripheralConnection = 0;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = (void *)g_waitingBranchesGroup;
  g_waitingBranchesGroup = (uint64_t)v6;

  dispatch_group_t v8 = dispatch_group_create();
  v9 = (void *)g_waitingPeripheralsGroup;
  g_waitingPeripheralsGroup = (uint64_t)v8;

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  v11 = (void *)g_waitingForSerialsSema;
  g_waitingForSerialsSema = (uint64_t)v10;

  self->_leUarpBranchDone = 0;
  uint64_t v63 = CBCentralManagerOptionEnableFindMy;
  v64 = &__kCFBooleanTrue;
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
  cmOptions = self->_cmOptions;
  self->_cmOptions = v12;

  v14 = -[CBCentralManager initWithDelegate:queue:options:]( objc_alloc(&OBJC_CLASS___CBCentralManager),  "initWithDelegate:queue:options:",  self,  0LL,  self->_cmOptions);
  centralManager = self->_centralManager;
  self->_centralManager = v14;

  v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  peripherals = self->_peripherals;
  self->_peripherals = v16;

  v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19 = (void *)g_findMySerialNumbers;
  g_findMySerialNumbers = (uint64_t)v18;

  v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v21 = (void *)g_loggingFilenames;
  g_loggingFilenames = (uint64_t)v20;

  v22 = objc_autoreleasePoolPush();
  dispatch_group_enter((dispatch_group_t)g_waitingBranchesGroup);
  dispatch_group_enter((dispatch_group_t)g_waitingPeripheralsGroup);
  v60 = sessionEventCallback;
  v23 = getprogname();
  v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s-%u", v23, getpid());
  id v25 = objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = BTSessionAttachWithQueue([v25 UTF8String], &v60, 0, self->_queue);

  if ((_DWORD)v26)
  {
    NSLog(@"attachmentsForParameters: Failed to attach to bluetoothd with error 0x%08x", v26);
    dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
    v27 = (NSArray *)(id)g_loggingFilenames;
    objc_autoreleasePoolPop(v22);
  }

  else
  {
    dispatch_group_enter((dispatch_group_t)g_waitingBranchesGroup);
    v28 = (dispatch_group_s *)g_waitingPeripheralsGroup;
    dispatch_time_t v29 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_group_wait(v28, v29)) {
      NSLog(@"attachmentsForParameters: Timed out waiting for CBCentralManager didUpdateState callback");
    }
    v30 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000559C;
    block[3] = &unk_1000082F8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v30, block);
    NSLog(@"attachmentsForParameters: Awaiting logging response ... ");
    v31 = (dispatch_group_s *)g_waitingBranchesGroup;
    dispatch_time_t v32 = dispatch_time(0LL, 435000000000LL);
    if (dispatch_group_wait(v31, v32))
    {
      NSLog(@"attachmentsForParameters: Log Collection Timed Out");
      if (g_result) {
        NSLog(@"attachmentsForParameters: Wx Log Retrieval Timed Out");
      }
    }

    else
    {
      NSLog(@"attachmentsForParameters: Log Collection Completed");
    }

    BTAccessoryManagerDeregisterCustomMessageClient(g_accessoryManager, &g_accessoryDumpLogCompletionHandler);
    BTSessionDetachWithQueue(&g_session);
    if (g_result) {
      NSLog( @"attachmentsForParameters: Failed to register callback with error 0x%08x",  g_result);
    }
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v33 = self->_peripherals;
    id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v55,  v62,  16LL);
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v33);
          }
          -[CBCentralManager cancelPeripheralConnection:]( self->_centralManager,  "cancelPeripheralConnection:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)i));
        }

        id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v55,  v62,  16LL);
      }

      while (v35);
    }

    -[BluetoothHeadsetExtension cancelXPCConnection](self, "cancelXPCConnection");
    objc_autoreleasePoolPop(v22);
    v27 = objc_opt_new(&OBJC_CLASS___NSArray);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v38 = (id)g_loggingFilenames;
    id v39 = [v38 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = 0LL;
      uint64_t v42 = *(void *)v52;
      do
      {
        for (j = 0LL; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(v38);
          }
          uint64_t v44 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)j);
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v46 = [v45 fileExistsAtPath:v44];

          if (v46)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v44));
            uint64_t v48 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v27, "arrayByAddingObject:", v47));

            uint64_t v41 = (v41 + 1);
            NSLog(@"attachmentsForParameters: attaching %@", v44);
            v27 = (NSArray *)v48;
          }
        }

        id v40 = [v38 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }

      while (v40);
    }

    else
    {
      uint64_t v41 = 0LL;
    }

    NSLog( @"attachmentsForParameters: pId %u, passed %lu filename(s), attached %d",  productId,  [(id)g_loggingFilenames count],  v41);
  }

  return v27;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:&stru_100008338]);
  dispatch_group_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 0, a4));

  return v6;
}

- (void)cancelXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_cancel(xpcConnection);
    NSLog(@"cancelXPCConnection: %p", self->_xpcConnection);
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

- (void)handleXPCEvent:(id)a3
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BluetoothHeadsetExtension handleXPCMsg:](self, "handleXPCMsg:", v5);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    -[BluetoothHeadsetExtension handleXPCError:](self, "handleXPCError:", v5);
  }

  else
  {
    NSLog(@"handleXPCEvent: Unexpected XPC event: %@", v5);
  }
}

- (void)handleXPCMsg:(id)a3
{
  xpc_object_t xdict = a3;
  string = xpc_dictionary_get_string(xdict, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMsgArgs");
  dispatch_group_t v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothHeadsetExtension xpcConnection](self, "xpcConnection"));
  NSLog(@"handleXPCMsg: Received XPC message from %p: %s", v7, string);

  if (self->_leUarpBranchDone)
  {
    NSLog(@"handleXPCMsg: Received XPC message when already done");
  }

  else
  {
    if (!strcmp(string, "LoggingManagerBusy"))
    {
      NSLog(@"handleXPCMsg: BTLEServer LoggingManager busy, returning no files", v13);
    }

    else if (!strcmp(string, "InvalidUUIDs"))
    {
      NSLog( @"handleXPCMsg: BTLEServer LoggingManager does not have any valid UUIDs, returning no files",  v13);
    }

    else if (!strcmp(string, "RetrievedLogs"))
    {
      if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_array_get_count(v6))
        {
          size_t v8 = 0LL;
          do
          {
            v9 = xpc_array_get_string(v6, v8);
            if (v9)
            {
              dispatch_semaphore_t v10 = v9;
              NSLog(@"handleXPCMsg: Received %s", v9);
              v11 = (void *)g_loggingFilenames;
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
              [v11 addObject:v12];
            }

            else
            {
              NSLog(@"handleXPCMsg: Unexpected XPC object at index %d", v8);
            }

            ++v8;
          }

          while (xpc_array_get_count(v6) > v8);
        }
      }

      else
      {
        NSLog(@"handleXPCMsg: Invalid msgArgs", v13);
      }
    }

    else
    {
      NSLog(@"handleXPCMsg: Unexpected XPC message: %s", string);
    }

    self->_leUarpBranchDone = 1;
    dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
  }
}

- (void)handleXPCError:(id)a3
{
  if (a3 == &_xpc_error_connection_interrupted || a3 == &_xpc_error_connection_invalid)
  {
    if (self->_xpcConnection)
    {
      -[BluetoothHeadsetExtension cancelXPCConnection](self, "cancelXPCConnection");
      if (!self->_leUarpBranchDone)
      {
        self->_leUarpBranchDone = 1;
        dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
      }
    }
  }

  else
  {
    NSLog(@"handleXPCError: Unhandled XPC error");
  }

- (void)sendXPCMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v11 = v6;
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)[v11 UTF8String]);
  if (v7) {
    xpc_dictionary_set_value(v8, "kMsgArgs", v7);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothHeadsetExtension xpcConnection](self, "xpcConnection"));
  NSLog(@"sendXPCMsg: Sending XPC message to %p: %@", v9, v11);

  dispatch_semaphore_t v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BluetoothHeadsetExtension xpcConnection](self, "xpcConnection"));
  xpc_connection_send_message(v10, v8);
}

- (void)leLogRequest
{
  xpc_object_t empty = xpc_array_create_empty();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = self->_peripherals;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      xpc_object_t v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) identifier]);
        dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

        NSLog(@"leLogRequest: Asking for UUID %@", v10);
        id v11 = v10;
        xpc_object_t v12 = xpc_string_create((const char *)[v11 UTF8String]);
        xpc_array_append_value(empty, v12);

        xpc_object_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  -[BluetoothHeadsetExtension sendXPCMsg:args:](self, "sendXPCMsg:args:", @"RetrieveLogs", empty);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  NSLog(@"centralManager:didConnectPeripheral: UUID %@", v4);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a4 identifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  NSLog(@"centralManager:didFailToConnectPeripheral: UUID %@ error %@", v7, v6);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)5 && !self->_didPeripheralConnection)
  {
    self->_didPeripheralConnection = 1;
    NSLog(@"centralManagerDidUpdateState: Now on, awaiting signal");
    id v5 = (dispatch_semaphore_s *)g_waitingForSerialsSema;
    dispatch_time_t v6 = dispatch_time(0LL, 180000000000LL);
    if (dispatch_semaphore_wait(v5, v6))
    {
      NSLog(@"centralManagerDidUpdateState: Never got serial numbers");
    }

    else
    {
      NSLog(@"centralManagerDidUpdateState: Requesting UUIDs for serials: %@", g_findMySerialNumbers);
      if ([(id)g_findMySerialNumbers count])
      {
        uint64_t v7 = g_findMySerialNumbers;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        v8[2] = sub_100005EE4;
        v8[3] = &unk_100008360;
        v8[4] = self;
        id v9 = v4;
        [v9 retrievePeripheralsWithFindMySerialNumberStrings:v7 completion:v8];
      }
    }
  }
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSDictionary)cmOptions
{
  return self->_cmOptions;
}

- (void)setCmOptions:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)leUarpBranchDone
{
  return self->_leUarpBranchDone;
}

- (void)setLeUarpBranchDone:(BOOL)a3
{
  self->_leUarpBranchDone = a3;
}

- (BOOL)didPeripheralConnection
{
  return self->_didPeripheralConnection;
}

- (void)setDidPeripheralConnection:(BOOL)a3
{
  self->_didPeripheralConnection = a3;
}

- (void).cxx_destruct
{
}

@end