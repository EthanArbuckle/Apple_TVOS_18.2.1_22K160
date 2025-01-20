@interface NSProgressRegistrar
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSProgressRegistrar)initWithQueue:(id)a3 rootFileAccessNode:(id)a4;
- (void)_getRemoteProcessWithAuditToken:(id *)a3 canReadItemAtURL:(id)a4 completionHandler:(id)a5;
- (void)addPublisher:(id)a3 forID:(id)a4 acknowledgementAppBundleIDs:(id)a5 category:(id)a6 fileURL:(id)a7 initialValues:(id)a8 completionHandler:(id)a9;
- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 category:(id)a6 completionHandler:(id)a7;
- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 fileURL:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5;
- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5;
- (void)removePublisherForID:(id)a3;
- (void)removeSubscriberForID:(id)a3;
@end

@implementation NSProgressRegistrar

- (NSProgressRegistrar)initWithQueue:(id)a3 rootFileAccessNode:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSProgressRegistrar;
  v6 = -[NSProgressRegistrar init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_publishersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v7->_publisherTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v7->_subscribersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v7->_subscriberTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v7->_pendingFileSubscriberIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v7->_rootFileAccessNode = (NSFileAccessNode *)a4;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSProgressRegistrar;
  -[NSProgressRegistrar dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7[6] = *MEMORY[0x1895F89C0];
  [a4 setExportedObject:self];
  objc_msgSend( a4,  "setExportedInterface:",  +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  [a4 _setQueue:self->_queue];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_189C991F0;
  v7[4] = self;
  v7[5] = a4;
  [a4 setInvalidationHandler:v7];
  [a4 resume];
  return 1;
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 32LL);
  v18[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2;
  v18[3] = &unk_189C991A0;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[4] = v2;
  uint64_t v5 = (void *)[v3 keysOfEntriesPassingTest:v18];
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v17[0] = v4;
  v17[1] = 3221225472LL;
  v17[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3;
  v17[3] = &unk_189C991C8;
  v17[4] = v6;
  v8 = (void *)[v7 keysOfEntriesPassingTest:v17];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) removeSubscriberForID:*(void *)(*((void *)&v25 + 1) + 8 * v12++)];
      }

      while (v10 != v12);
      uint64_t v10 = [v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }

    while (v10);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t result = [v8 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 32) removePublisherForID:*(void *)(*((void *)&v20 + 1) + 8 * v16++)];
      }

      while (v14 != v16);
      uint64_t result = [v8 countByEnumeratingWithState:&v20 objects:v19 count:16];
      uint64_t v14 = result;
    }

    while (result);
  }

  return result;
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 isFromConnection:*(void *)(a1 + 32)];
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 isFromConnection:*(void *)(a1 + 32)];
}

- (void)addPublisher:(id)a3 forID:(id)a4 acknowledgementAppBundleIDs:(id)a5 category:(id)a6 fileURL:(id)a7 initialValues:(id)a8 completionHandler:(id)a9
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v16 = (os_log_s *)_NSProgressIPCDebugLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = (os_log_s *)_NSProgressIPCDebugLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      id v31 = a4;
      __int16 v32 = 2113;
      id v33 = a7;
      __int16 v34 = 2114;
      id v35 = a6;
      _os_log_debug_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEBUG,  "<NSProgressSubscriberProxy %p> Add publisher ID %{public}@ for URL %{private}@ in category %{public}@",  buf,  0x2Au);
    }
  }

  v18 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection");
  v19 = (NSProgressPublisherProxy *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a4);
  if (!v19)
  {
    v19 = -[NSProgressPublisherProxy initWithForwarder:onConnection:publisherID:values:]( objc_alloc(&OBJC_CLASS___NSProgressPublisherProxy),  "initWithForwarder:onConnection:publisherID:values:",  a3,  v18,  a4,  a8);
    -[NSMutableDictionary setObject:forKey:](self->_publishersByID, "setObject:forKey:", v19, a4);

    -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pub: %@ (%d cat: %@ URL: %@)",  a4,  -[NSXPCConnection processIdentifier](v18, "processIdentifier"),  a6,  a7),  "UTF8String");
    __int128 v20 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_publisherTransactionsByID, "setObject:forKey:", v20, a4);
  }

  __int128 v21 = (void *)[a5 mutableCopy];
  uint64_t v22 = MEMORY[0x1895F87A8];
  if (a6)
  {
    subscribersByID = self->_subscribersByID;
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke;
    v27[3] = &unk_189C99218;
    v27[4] = a6;
    v27[5] = v19;
    v27[6] = a4;
    v27[7] = a8;
    v27[8] = v21;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subscribersByID,  "enumerateKeysAndObjectsUsingBlock:",  v27);
    -[NSProgressPublisherProxy setCategory:](v19, "setCategory:", a6);
  }

  if (a7)
  {
    id v24 = -[NSFileAccessNode descendantForFileURL:](self->_rootFileAccessNode, "descendantForFileURL:", a7);
    if (v24)
    {
      id v25 = v24;
      v26[0] = v22;
      v26[1] = 3221225472LL;
      v26[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2;
      v26[3] = &unk_189C99240;
      v26[4] = v19;
      v26[5] = a4;
      v26[6] = a8;
      v26[7] = v21;
      [v24 forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:v26];
      -[NSProgressPublisherProxy setItemLocation:](v19, "setItemLocation:", v25);
    }
  }

  (*((void (**)(id, void *))a9 + 2))(a9, v21);
}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(void *)(a1 + 32));
  if ((_DWORD)result)
  {
    [a3 addPublisher:*(void *)(a1 + 40) forID:*(void *)(a1 + 48) withValues:*(void *)(a1 + 56) isOld:0];
    uint64_t result = objc_msgSend((id)objc_msgSend(a3, "appBundleID"), "lowercaseString");
    if (result) {
      return [*(id *)(a1 + 64) removeObject:result];
    }
  }

  return result;
}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "appBundleID"), "lowercaseString");
  if (result) {
    return [*(id *)(a1 + 56) removeObject:result];
  }
  return result;
}

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  v15[8] = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 observeUserInfoValue:a4 forKey:a5];
    uint64_t v11 = [v10 category];
    uint64_t v12 = MEMORY[0x1895F87A8];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke;
      v15[3] = &unk_189C99268;
      v15[4] = v11;
      v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subscribersByID,  "enumerateKeysAndObjectsUsingBlock:",  v15);
    }

    v14[0] = v12;
    v14[1] = 3221225472LL;
    v14[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2;
    v14[3] = &unk_189C99290;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    objc_msgSend( (id)objc_msgSend(v10, "itemLocation"),  "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:",  v14);
  }

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if ((_DWORD)result) {
    return [a3 observePublisherUserInfoForID:a1[5] value:a1[6] forKey:a1[7]];
  }
  return result;
}

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2( void *a1,  void *a2)
{
  return [a2 observePublisherUserInfoForID:a1[4] value:a1[5] forKey:a1[6]];
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  v15[8] = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 observeValues:a4 forKeys:a5];
    uint64_t v11 = [v10 category];
    uint64_t v12 = MEMORY[0x1895F87A8];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke;
      v15[3] = &unk_189C99268;
      v15[4] = v11;
      v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subscribersByID,  "enumerateKeysAndObjectsUsingBlock:",  v15);
    }

    v14[0] = v12;
    v14[1] = 3221225472LL;
    v14[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2;
    v14[3] = &unk_189C99290;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    objc_msgSend( (id)objc_msgSend(v10, "itemLocation"),  "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:",  v14);
  }

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if ((_DWORD)result) {
    return [a3 observePublisherForID:a1[5] values:a1[6] forKeys:a1[7]];
  }
  return result;
}

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2( void *a1,  void *a2)
{
  return [a2 observePublisherForID:a1[4] values:a1[5] forKeys:a1[6]];
}

- (void)removePublisherForID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (os_log_s *)_NSProgressIPCDebugLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (os_log_s *)_NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = a3;
      _os_log_debug_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEBUG,  "<NSProgressSubscriberProxy %p> Remove publisher ID %{public}@",  buf,  0x16u);
    }
  }

  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = [v7 category];
    if (v9)
    {
      subscribersByID = self->_subscribersByID;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __44__NSProgressRegistrar_removePublisherForID___block_invoke;
      v11[3] = &unk_189C992B8;
      v11[4] = v9;
      v11[5] = a3;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subscribersByID,  "enumerateKeysAndObjectsUsingBlock:",  v11);
    }

    [v8 setItemLocation:0];
    -[NSMutableDictionary removeObjectForKey:](self->_publishersByID, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_publisherTransactionsByID, "removeObjectForKey:", a3);
  }

uint64_t __44__NSProgressRegistrar_removePublisherForID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(void *)(a1 + 32));
  if ((_DWORD)result) {
    return [a3 removePublisherForID:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 category:(id)a6 completionHandler:(id)a7
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v13 = (os_log_s *)_NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v15 = (os_log_s *)_NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v24 = 134218754;
      *(void *)&v24[4] = self;
      *(_WORD *)&v24[12] = 2048;
      *(void *)&v24[14] = a3;
      *(_WORD *)&v24[22] = 2114;
      *(void *)&v24[24] = a4;
      __int16 v25 = 2114;
      id v26 = a6;
      _os_log_debug_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_DEBUG,  "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ in category %{public}@",  v24,  0x2Au);
    }
  }

  uint64_t v16 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v14);
  v17 = v16;
  if (v16) {
    -[NSXPCConnection auditToken](v16, "auditToken");
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  *(_OWORD *)buf = *(_OWORD *)v24;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v24[16];
  if (sandbox_check_by_audit_token())
  {
    v18 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = a6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a5;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = a4;
      _os_log_error_impl( &dword_182EB1000,  v18,  OS_LOG_TYPE_ERROR,  "sandboxing denied subscription to progress on category %@ (bundle id %@, %@)",  buf,  0x20u);
    }
  }

  v19 = (NSProgressSubscriberProxy *)-[NSMutableDictionary objectForKey:](self->_subscribersByID, "objectForKey:", a4);
  if (!v19)
  {
    v19 = -[NSProgressSubscriberProxy initWithForwarder:onConnection:subscriberID:appBundleID:]( objc_alloc(&OBJC_CLASS___NSProgressSubscriberProxy),  "initWithForwarder:onConnection:subscriberID:appBundleID:",  a3,  v17,  a4,  a5);
    -[NSProgressSubscriberProxy setCategory:](v19, "setCategory:", a6);
    -[NSMutableDictionary setObject:forKey:](self->_subscribersByID, "setObject:forKey:", v19, a4);

    -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sub: %@ (%d bundle: %@ cat: %@)",  a4,  -[NSXPCConnection processIdentifier](v17, "processIdentifier"),  a5,  a6),  "UTF8String");
    __int128 v20 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_subscriberTransactionsByID, "setObject:forKey:", v20, a4);
  }

  publishersByID = self->_publishersByID;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke;
  v22[3] = &unk_189C992E0;
  v22[4] = a6;
  v22[5] = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publishersByID, "enumerateKeysAndObjectsUsingBlock:", v22);
  (*((void (**)(id))a7 + 2))(a7);
}

uint64_t __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(void *)(a1 + 32));
  if ((_DWORD)result) {
    return objc_msgSend( *(id *)(a1 + 40),  "addPublisher:forID:withValues:isOld:",  a3,  objc_msgSend(a3, "publisherID"),  objc_msgSend(a3, "values"),  1);
  }
  return result;
}

- (void)_getRemoteProcessWithAuditToken:(id *)a3 canReadItemAtURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  int v9 = *MEMORY[0x1895F8608];
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  __int128 v10 = *(_OWORD *)&a3->var0[4];
  __int128 v39 = *(_OWORD *)a3->var0;
  __int128 v40 = v10;
  int v11 = sandbox_check_by_audit_token();
  int v12 = objc_msgSend( (id)objc_msgSend(a4, "lastPathComponent"),  "isEqualToString:",  @"f13c05f5-944f-4466-bc09-c73815293ab8");
  unsigned int v13 = v12;
  if (v11) {
    int v14 = 1;
  }
  else {
    int v14 = v12;
  }
  if (v14 != 1)
  {
    *((_BYTE *)v29 + 24) = 1;
LABEL_25:
    if (*((_BYTE *)v29 + 24)) {
      uint64_t v26 = 1LL;
    }
    else {
      uint64_t v26 = v13;
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v26);
    goto LABEL_29;
  }

  *(void *)&__int128 v39 = 0LL;
  *((void *)&v39 + 1) = &v39;
  *(void *)&__int128 v40 = 0x2020000000LL;
  *((void *)&v40 + 1) = [a4 fileSystemRepresentation];
  uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 24LL);
  if (v15)
  {
    __int128 v16 = *(_OWORD *)&a3->var0[4];
    __int128 v37 = *(_OWORD *)a3->var0;
    __int128 v38 = v16;
    uint64_t v27 = v15;
    BOOL v17 = sandbox_check_by_audit_token() == 0;
    *((_BYTE *)v29 + 24) = v17;
    if (v17) {
      goto LABEL_16;
    }
  }

  else if (*((_BYTE *)v29 + 24))
  {
    goto LABEL_16;
  }

  for (i = (void *)objc_msgSend(a4, "URLByDeletingLastPathComponent", v27);
        i;
        i = (void *)[i URLByDeletingLastPathComponent])
  {
    if ([i checkResourceIsReachableAndReturnError:0])
    {
      uint64_t v19 = [i fileSystemRepresentation];
      *(void *)(*((void *)&v39 + 1) + 24LL) = v19;
      if (v19)
      {
        __int128 v20 = *(_OWORD *)&a3->var0[4];
        __int128 v37 = *(_OWORD *)a3->var0;
        __int128 v38 = v20;
        uint64_t v27 = v19;
        *((_BYTE *)v29 + 24) = sandbox_check_by_audit_token() == 0;
      }

      break;
    }
  }

uint64_t __90__NSProgressRegistrar__getRemoteProcessWithAuditToken_canReadItemAtURL_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 fileSystemRepresentation];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = sandbox_check_by_audit_token() == 0;
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    BOOL v3 = 1LL;
  }
  else {
    BOOL v3 = *(_BYTE *)(a1 + 92) != 0;
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v3);
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 fileURL:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  unsigned int v13 = (os_log_s *)_NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (os_log_s *)_NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      id v22 = self;
      __int16 v23 = 2048;
      id v24 = a3;
      __int16 v25 = 2114;
      id v26 = a4;
      __int16 v27 = 2113;
      id v28 = a6;
      _os_log_debug_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_DEBUG,  "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ for URL %{private}@",  buf,  0x2Au);
    }
  }

  __int128 v16 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v14);
  if (a6)
  {
    BOOL v17 = v16;
    -[NSMutableSet addObject:](self->_pendingFileSubscriberIDs, "addObject:", a4);
    -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sub: %@ (%d bundle: %@ URL: %@)",  a4,  -[NSXPCConnection processIdentifier](v17, "processIdentifier"),  a5,  a6),  "UTF8String");
    uint64_t v18 = os_transaction_create();
    if (v17) {
      -[NSXPCConnection auditToken](v17, "auditToken");
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke;
    v19[3] = &unk_189C99380;
    v19[4] = self;
    v19[5] = a4;
    v19[6] = v18;
    v19[7] = a6;
    v19[8] = a5;
    v19[9] = a3;
    v19[10] = v17;
    v19[11] = a7;
    -[NSProgressRegistrar _getRemoteProcessWithAuditToken:canReadItemAtURL:completionHandler:]( self,  "_getRemoteProcessWithAuditToken:canReadItemAtURL:completionHandler:",  v20,  a6,  v19);
  }

  else
  {
    (*((void (**)(id))a7 + 2))(a7);
  }

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke( uint64_t a1,  int a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    if (a2)
    {
      uint64_t v4 = (NSProgressSubscriberProxy *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
      if (!v4)
      {
        uint64_t v4 = -[NSProgressSubscriberProxy initWithForwarder:onConnection:subscriberID:appBundleID:]( objc_alloc(&OBJC_CLASS___NSProgressSubscriberProxy),  "initWithForwarder:onConnection:subscriberID:appBundleID:",  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void *)(a1 + 64));
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v4 forKey:*(void *)(a1 + 40)];

        [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
      }

      uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) descendantForFileURL:*(void *)(a1 + 56)];
      uint64_t v6 = [v5 itemProvider];
      uint64_t v7 = MEMORY[0x1895F87A8];
      if (v6)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000LL;
        uint64_t v19 = __Block_byref_object_copy_;
        __int128 v20 = __Block_byref_object_dispose_;
        uint64_t v21 = 0LL;
        v8 = dispatch_semaphore_create(0LL);
        int v9 = (void *)[v5 itemProvider];
        uint64_t v10 = *(void *)(a1 + 56);
        void v17[5] = v7;
        v17[6] = 3221225472LL;
        v17[7] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_135;
        v17[8] = &unk_189C99330;
        v17[10] = v8;
        v17[11] = buf;
        v17[9] = v10;
        objc_msgSend(v9, "provideLogicalURLForURL:completionHandler:");
        dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v8);
        if (*(void *)(*(void *)&buf[8] + 40LL))
        {
          uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "descendantForFileURL:");

          if ((void *)v11 != v5)
          {
            [v5 removeSelfIfUseless];
            uint64_t v5 = (void *)v11;
          }
        }

        _Block_object_dispose(buf, 8);
      }

      if (v5)
      {
        v17[0] = v7;
        v17[1] = 3221225472LL;
        v17[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2;
        v17[3] = &unk_189C99358;
        v17[4] = v4;
        [v5 forEachProgressPublisherOfItemOrContainedItemPerformProcedure:v17];
        -[NSProgressSubscriberProxy setItemLocation:](v4, "setItemLocation:", v5);
      }

      return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
    }

    else
    {
      unsigned int v13 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 64);
        __int128 v16 = *(void (**)(uint64_t, uint64_t))(a1 + 40);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v19 = v16;
        _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "sandboxing denied subscription to progress on URL %@ (bundle id %@, %@)",  buf,  0x20u);
      }

      return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
    }
  }

  else
  {

    return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
  }

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_135( uint64_t a1,  void *a2)
{
  if ([a2 logicalURL] != *(void *)(a1 + 32)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[a2 logicalURL];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "addPublisher:forID:withValues:isOld:",  a2,  objc_msgSend(a2, "publisherID"),  objc_msgSend(a2, "values"),  1);
}

- (void)removeSubscriberForID:(id)a3
{
  v10[5] = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_subscribersByID, "objectForKey:", a3);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 appBundleID];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = (void *)[v6 itemLocation];
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __45__NSProgressRegistrar_removeSubscriberForID___block_invoke;
      v10[3] = &unk_189C99358;
      v10[4] = v8;
      [v9 forEachProgressPublisherOfItemOrContainedItemPerformProcedure:v10];
    }

    [v6 setItemLocation:0];
    -[NSMutableDictionary removeObjectForKey:](self->_subscribersByID, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_subscriberTransactionsByID, "removeObjectForKey:", a3);
  }

  -[NSMutableSet removeObject:](self->_pendingFileSubscriberIDs, "removeObject:", a3);
}

uint64_t __45__NSProgressRegistrar_removeSubscriberForID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appWithBundleID:*(void *)(a1 + 32) didAcknowledgeWithSuccess:0];
}

@end