@interface NSXPCStoreConnection
- (id)initForStore:(id)a3;
- (id)sendMessage:(void *)a3 store:(void *)a4 error:;
- (uint64_t)createConnectionWithOptions:(uint64_t)a1;
- (void)dealloc;
- (void)disconnect;
- (void)performAndWait:(uint64_t)a1;
- (void)reconnect;
@end

@implementation NSXPCStoreConnection

- (uint64_t)createConnectionWithOptions:(uint64_t)a1
{
  v80[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = [a2 valueForKey:@"serviceName"];
  if (v4 || (uint64_t v4 = [a2 valueForKey:@"NSXPCStoreServiceName"]) != 0)
  {
    v5 = (void *)[a2 valueForKey:@"agentOrDaemon"];
    if (!v5) {
      v5 = (void *)[a2 valueForKey:@"NSXPCStoreDaemonize"];
    }
    char v6 = [v5 BOOLValue];
    id v7 = objc_alloc(MEMORY[0x189607B30]);
    if ((v6 & 1) != 0)
    {
      v8 = (void *)[v7 initWithMachServiceName:v4 options:2];
      if (!v8)
      {
        uint64_t v9 = [NSString stringWithUTF8String:"Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil"];
        _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, v4);
        uint64_t v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          v23 = "CoreData: Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil";
LABEL_14:
          v33 = (os_log_s *)v16;
          uint32_t v34 = 12;
LABEL_15:
          _os_log_fault_impl(&dword_186681000, v33, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&valueCallBacks, v34);
          goto LABEL_31;
        }

        goto LABEL_31;
      }
    }

    else
    {
      v8 = (void *)[v7 initWithServiceName:v4];
      if (!v8)
      {
        uint64_t v26 = [NSString stringWithUTF8String:"Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil"];
        _NSCoreDataLog(17LL, v26, v27, v28, v29, v30, v31, v32, v4);
        uint64_t v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          v23 = "CoreData: Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil";
          goto LABEL_14;
        }

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
    _NSCoreDataLog(8LL, (uint64_t)@"Connection interrupted.", v9, v10, v11, v12, v13, v14, a9);
  }
}

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
    _NSCoreDataLog(8LL, (uint64_t)@"Connection invalidated.", v9, v10, v11, v12, v13, v14, a9);
  }
}

- (id)initForStore:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnection;
  uint64_t v4 = -[NSXPCStoreConnection init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_store = (NSXPCStore *)a3;
    v4->_connection = (NSXPCConnection *)-[NSXPCStoreConnection createConnectionWithOptions:]( (uint64_t)v4,  (void *)[a3 options]);
    if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isFileURL")
      && (char v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "path")) != 0)
    {
      id v7 = (const __CFString *)[v6 lastPathComponent];
    }

    else
    {
      id v7 = @"nil";
    }

    v8 = (void *)[NSString stringWithFormat:@"NSXPCStoreConnection %p for %@", v5, v7];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = [a3 _persistentStoreCoordinator];
    if (v10)
    {
      unsigned int v11 = *(unsigned __int16 *)(v10 + 24);
    }

    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v8 UTF8String], v9);
    v5->_queue = (OS_dispatch_queue *)v12;
    dispatch_set_context(v12, v5);
    if (v9) {
      dispatch_release(v9);
    }
  }

  return v5;
}

- (void)reconnect
{
  if (a1)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __33__NSXPCStoreConnection_reconnect__block_invoke;
    v1[3] = &unk_189EA7758;
    v1[4] = a1;
    -[NSXPCStoreConnection performAndWait:](a1, (uint64_t)v1);
  }

void *__33__NSXPCStoreConnection_reconnect__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 24))
  {
    v2 = result;
    result = *(void **)(v1 + 16);
    if (result)
    {
      result = (void *)-[NSXPCStoreConnection createConnectionWithOptions:]( v1,  (void *)[result options]);
      *(void *)(v2[4] + 24LL) = result;
    }
  }

  return result;
}

- (void)performAndWait:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000LL;
    unsigned int v11 = __Block_byref_object_copy__2;
    dispatch_queue_t v12 = __Block_byref_object_dispose__2;
    uint64_t v13 = 0LL;
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __39__NSXPCStoreConnection_performAndWait___block_invoke;
    v7[3] = &unk_189EA77F8;
    v7[4] = a2;
    v7[5] = &v8;
    dispatch_sync(v4, v7);
    v5 = (void *)v9[5];
    if (v5)
    {
      id v6 = v5;
      objc_exception_throw((id)v9[5]);
      __break(1u);
    }

    else
    {
      _Block_object_dispose(&v8, 8);
    }
  }

- (void)disconnect
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      [v2 setInvalidationHandler:0];
      [*(id *)(a1 + 24) setInterruptionHandler:0];
      [*(id *)(a1 + 24) setUserInfo:0];
      [*(id *)(a1 + 24) invalidate];

      *(void *)(a1 + 24) = 0LL;
    }
  }

- (void)dealloc
{
  self->_store = 0LL;
  if (self->_connection)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __31__NSXPCStoreConnection_dealloc__block_invoke;
    block[3] = &unk_189EA7758;
    block[4] = self;
    dispatch_queue_t current_queue = dispatch_get_current_queue();
    if (dispatch_get_context(current_queue) == self) {
      -[NSXPCStoreConnection disconnect]((uint64_t)self);
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_queue, block);
    }
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnection;
  -[NSXPCStoreConnection dealloc](&v5, sel_dealloc);
}

void __31__NSXPCStoreConnection_dealloc__block_invoke(uint64_t a1)
{
}

- (id)sendMessage:(void *)a3 store:(void *)a4 error:
{
  id v4 = a1;
  if (a1)
  {
    if (a1[3])
    {
      uint64_t v35 = 0LL;
      v36 = &v35;
      uint64_t v37 = 0x3052000000LL;
      uint64_t v38 = __Block_byref_object_copy__2;
      uint64_t v39 = __Block_byref_object_dispose__2;
      uint64_t v40 = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x3052000000LL;
      uint64_t v32 = __Block_byref_object_copy__2;
      v33 = __Block_byref_object_dispose__2;
      uint64_t v34 = 0LL;
      uint64_t v8 = [a3 URL];
      uint64_t v25 = 0LL;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2020000000LL;
      char v28 = 0;
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke;
      v24[3] = &unk_189EA77D0;
      v24[8] = &v35;
      v24[9] = &v29;
      v24[4] = v4;
      v24[5] = v8;
      v24[6] = a2;
      v24[7] = a3;
      v24[10] = &v25;
      -[NSXPCStoreConnection performAndWait:]((uint64_t)v4, (uint64_t)v24);
      if (*((_BYTE *)v26 + 24))
      {
        if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
          _NSCoreDataLog(8LL, (uint64_t)@"Returning reply dict %@", v9, v10, v11, v12, v13, v14, v36[5]);
        }
      }

      else
      {
        if (a4)
        {
          uint64_t v15 = (void *)v30[5];
          if (v15)
          {
            *a4 = v15;
            v30[5] = 0LL;
          }
        }

        if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
          _NSCoreDataLog(8LL, (uint64_t)@"Failed send (no reply dict).", v16, v17, v18, v19, v20, v21, v23);
        }
      }

      if (*((_BYTE *)v26 + 24)) {
        id v4 = (id)v36[5];
      }
      else {
        id v4 = 0LL;
      }
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);
    }

    else
    {
      id v4 = 0LL;
      if (a4) {
        *a4 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134070,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"Connection is nil",  @"Reason"));
      }
    }
  }

  return v4;
}

uint64_t __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v11[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2;
  v11[3] = &unk_189EA7780;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  __int128 v12 = *(_OWORD *)(a1 + 64);
  v11[4] = v2;
  objc_super v5 = (void *)[v3 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = v4;
  v10[1] = 3221225472LL;
  v10[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_3;
  v10[3] = &unk_189EA77A8;
  uint64_t v6 = *(void *)(a1 + 80);
  v10[6] = *(void *)(a1 + 64);
  v10[7] = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  v10[4] = *(void *)(a1 + 56);
  v10[5] = v8;
  return [v5 handleRequest:v7 reply:v10];
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2(uint64_t *a1, void *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 40LL) = 0LL;
  *(void *)(*(void *)(a1[6] + 8) + 40LL) = a2;
  _NSCoreDataLog( 1LL,  (uint64_t)@"XPC: synchronousRemoteObjectProxyWithErrorHandler: store '%@' encountered error: %@",  v3,  v4,  v5,  v6,  v7,  v8,  a1[4]);
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_3( uint64_t *a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v6 = +[_NSXPCStoreUtilities classesForErrorArchive]();
    uint64_t v3 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v3,  a1[4],  v6);
  }

  id v7 = objc_alloc(MEMORY[0x189603F68]);
  if (!a2) {
    a2 = [MEMORY[0x189603FE8] null];
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = objc_msgSend( v7,  "initWithObjectsAndKeys:",  a2,  @"reply",  v3,  @"error",  0);
  *(_BYTE *)(*(void *)(a1[7] + 8) + 24LL) = 1;
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
    _NSCoreDataLog( 8LL,  (uint64_t)@"Created reply dict: %@",  v8,  v9,  v10,  v11,  v12,  v13,  *(void *)(*(void *)(a1[6] + 8) + 40LL));
  }
}

uint64_t __39__NSXPCStoreConnection_performAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end