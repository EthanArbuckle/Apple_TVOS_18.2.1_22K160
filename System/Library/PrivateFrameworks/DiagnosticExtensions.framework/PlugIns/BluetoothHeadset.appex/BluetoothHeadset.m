void sub_100004C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v8;
  void *v9;
  void *v10;
  char __s[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  if (a6)
  {
    productId = a6;
    NSLog(@"DumpLogCompletionHandler: received pId = %u", a6);
  }

  else
  {
    productId = 0;
    NSLog(@"DumpLogCompletionHandler: error, no productId retrieved");
  }

  if (a5)
  {
    v8 = 0LL;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)__s = 0u;
    v12 = 0u;
    do
    {
      __strcpy_chk(__s, a4 + v8, 256LL);
      v9 = (void *)g_loggingFilenames;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  __s,  4LL));
      [v9 addObject:v10];

      v8 = (int)(v8 + strlen(__s) + 1);
    }

    while (v8 < a5);
  }

  dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
}

void sessionEventCallback(uint64_t a1, int a2, int a3)
{
  if (!(a3 | a2))
  {
    g_session = a1;
    BTLocalDeviceGetDefault();
    BTAccessoryManagerGetDefault(g_session, &g_accessoryManager);
    uint64_t v3 = BTAccessoryManagerRegisterCustomMessageClient( g_accessoryManager,  &g_accessoryDumpLogCompletionHandler,  64LL,  0LL);
    g_result = v3;
    if ((_DWORD)v3)
    {
      NSLog(@"sessionEventCallback: BTAccessoryManagerAddTestCallbacks with error 0x%08x", v3);
      dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
    }

    else
    {
      NSLog(@"sessionEventCallback: BTAccessoryManagerAddTestCallbacks");
    }

    v4 = malloc(0x2EEuLL);
    if (v4)
    {
      v5 = v4;
      uint64_t v22 = 0LL;
      v6 = malloc(0x18uLL);
      *(_OWORD *)v6 = xmmword_100006A40;
      v6[2] = 0x20200000201ELL;
      uint64_t CaseSerialNumbersForAppleProductIds = BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds( g_accessoryManager,  v6,  6LL,  v5,  &v22,  750LL);
      id v8 = 0LL;
      if ((_DWORD)CaseSerialNumbersForAppleProductIds)
      {
        v9 = 0LL;
      }

      else
      {
        v9 = 0LL;
        if (v22)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5));
          id v21 = 0LL;
          v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v10,  0LL,  &v21));
          id v8 = v21;
        }
      }

      free(v5);
      if ((_DWORD)CaseSerialNumbersForAppleProductIds || v8)
      {
        NSLog( @"sessionEventCallback: BTAccessoryManagerGetCaseSerialNumbersForAppleProductId failed result %u dataLen %zu error %@",  CaseSerialNumbersForAppleProductIds,  v22,  v8);
      }

      else
      {
        NSLog( @"sessionEventCallback: BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds successful (%lu serial numbers retrieved)",  [v9 count]);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v17 + 1) + 8LL * (void)i);
              NSLog(@"sessionEventCallback: received serial number %@", v16);
              [(id)g_findMySerialNumbers addObject:v16];
            }

            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
          }

          while (v13);
        }

        dispatch_semaphore_signal((dispatch_semaphore_t)g_waitingForSerialsSema);
        if ([(id)g_findMySerialNumbers count]) {
          goto LABEL_23;
        }
      }

      dispatch_group_leave((dispatch_group_t)g_waitingPeripheralsGroup);
LABEL_23:
    }
  }
}

id sub_10000559C(uint64_t a1)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTLELoggingManager.xpc", 0LL, 0LL);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = mach_service;

  NSLog(@"attachmentsForParameters: XPC connection created: %@", *(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(_xpc_connection_s **)(v5 + 16);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100005658;
  handler[3] = &unk_1000082D0;
  handler[4] = v5;
  xpc_connection_set_event_handler(v6, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16LL));
  return [*(id *)(a1 + 32) leLogRequest];
}

id sub_100005658(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleXPCEvent:a2];
}

int64_t sub_1000056B4(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](a3, "modificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](v4, "modificationDate"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100005EE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
        NSLog(@"centralManagerDidUpdateState: Connecting to UUID %@", v10);

        [*(id *)(*(void *)(a1 + 32) + 40) addObject:v8];
        [*(id *)(a1 + 40) connectPeripheral:v8 options:0];
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  dispatch_group_leave((dispatch_group_t)g_waitingPeripheralsGroup);
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}