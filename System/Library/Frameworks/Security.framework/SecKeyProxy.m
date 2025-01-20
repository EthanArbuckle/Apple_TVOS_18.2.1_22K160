@interface SecKeyProxy
+ (__SecIdentity)createIdentityFromEndpoint:(id)a3 error:(id *)a4;
+ (__SecKey)createItemFromEndpoint:(id)a3 certificate:(id *)a4 error:(id *)a5;
+ (__SecKey)createKeyFromEndpoint:(id)a3 error:(id *)a4;
+ (id)targetForKey:(__SecKey *)a3 error:(__CFError *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (SecKeyProxy)initWithIdentity:(__SecIdentity *)a3;
- (SecKeyProxy)initWithKey:(__SecKey *)a3;
- (SecKeyProxy)initWithKey:(__SecKey *)a3 certificate:(id)a4;
- (id)clientConnectionHandler;
- (id)clientDisconnectionHandler;
- (void)dealloc;
- (void)invalidate;
- (void)setClientConnectionHandler:(id)a3;
- (void)setClientDisconnectionHandler:(id)a3;
@end

@implementation SecKeyProxy

- (SecKeyProxy)initWithKey:(__SecKey *)a3 certificate:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SecKeyProxy;
  v8 = -[SecKeyProxy init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      CFRetain(a3);
      id key = v9->_key;
      v9->_id key = a3;
    }

    else
    {
      id key = v8->_key;
      v8->_id key = 0LL;
    }

    objc_storeStrong((id *)&v9->_certificate, a4);
    uint64_t v11 = [MEMORY[0x189607B50] anonymousListener];
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v11;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    v13 = v9->_listener;
    dispatch_queue_t v14 = dispatch_queue_create("SecKeyProxy", 0LL);
    -[NSXPCListener _setQueue:](v13, "_setQueue:", v14);

    -[NSXPCListener resume](v9->_listener, "resume");
  }

  return v9;
}

- (SecKeyProxy)initWithKey:(__SecKey *)a3
{
  return -[SecKeyProxy initWithKey:certificate:](self, "initWithKey:certificate:", a3, 0LL);
}

- (SecKeyProxy)initWithIdentity:(__SecIdentity *)a3
{
  unint64_t v5 = *((void *)a3 + 3);
  CFRetain((CFTypeRef)v5);
  unint64_t v6 = *((void *)a3 + 2);
  CFRetain((CFTypeRef)v6);
  if (v5 | v6)
  {
    CFDataRef v8 = SecCertificateCopyData((SecCertificateRef)v6);
    if (v8)
    {
      self = -[SecKeyProxy initWithKey:certificate:](self, "initWithKey:certificate:", v5, v8);
      id v7 = self;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C53D758];
  CFDataRef v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setExportedInterface:v8];

  v9 = -[SecKeyProxyTarget initWithKey:certificate:]( objc_alloc(&OBJC_CLASS___SecKeyProxyTarget),  "initWithKey:certificate:",  self->_key,  self->_certificate);
  [v7 setExportedObject:v9];
  v10 = -[NSXPCListener _queue](self->_listener, "_queue");
  [v7 _setQueue:v10];

  p_clientCount = &self->_clientCount;
  do
    unint64_t v12 = __ldaxr((unint64_t *)p_clientCount);
  while (__stlxr(v12 + 1, (unint64_t *)p_clientCount));
  v13 = self;
  objc_sync_enter(v13);
  -[SecKeyProxy clientConnectionHandler](v13, "clientConnectionHandler");
  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SecKeyProxy clientConnectionHandler](v13, "clientConnectionHandler");
    v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, BOOL))v15)[2](v15, v12 == 0);
  }

  objc_sync_exit(v13);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  v19 = __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke;
  v20 = &unk_189672C00;
  objc_copyWeak(&v21, &location);
  [v7 setInvalidationHandler:&v17];
  objc_msgSend(v7, "resume", v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return 1;
}

- (id)clientConnectionHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_clientConnectionHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)setClientConnectionHandler:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  unint64_t v5 = _Block_copy(v4);

  id clientConnectionHandler = obj->_clientConnectionHandler;
  obj->_id clientConnectionHandler = v5;

  objc_sync_exit(obj);
}

- (id)clientDisconnectionHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_clientDisconnectionHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)setClientDisconnectionHandler:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  unint64_t v5 = _Block_copy(v4);

  id clientDisconnectionHandler = obj->_clientDisconnectionHandler;
  obj->_id clientDisconnectionHandler = v5;

  objc_sync_exit(obj);
}

- (void)invalidate
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SecKeyProxy;
  -[SecKeyProxy dealloc](&v3, sel_dealloc);
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (void).cxx_destruct
{
}

void __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    do
      unint64_t v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    id v7 = WeakRetained;
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    [v4 clientDisconnectionHandler];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v4 clientDisconnectionHandler];
      id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, BOOL))v6)[2](v6, v3 == 1);
    }

    objc_sync_exit(v4);

    WeakRetained = v7;
  }
}

+ (id)targetForKey:(__SecKey *)a3 error:(__CFError *)a4
{
  id v4 = (void *)*((void *)a3 + 3);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__SecKeyProxy_targetForKey_error___block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = a4;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v6];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__SecKey)createItemFromEndpoint:(id)a3 certificate:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  CFDataRef v8 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v7];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C53D758];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setRemoteObjectInterface:v9];

  [v8 resume];
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__10627;
  v26 = __Block_byref_object_dispose__10628;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = __Block_byref_object_copy__10627;
  v20 = __Block_byref_object_dispose__10628;
  uint64_t v10 = MEMORY[0x1895F87A8];
  id v21 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke;
  v15[3] = &unk_189672C48;
  v15[4] = &v22;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472LL;
  v14[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2;
  v14[3] = &unk_189672C70;
  v14[4] = &v16;
  [v11 initializeWithReply:v14];

  if (v23[5])
  {
    [v8 invalidate];
    unint64_t v12 = 0LL;
    if (a5) {
      *a5 = (id) v23[5];
    }
  }

  else
  {
    if (a4) {
      *a4 = (id) v17[5];
    }
    unint64_t v12 = (__SecKey *)SecKeyCreate( *MEMORY[0x189604DB0],  (uint64_t)&SecRemoteKeyDescriptor,  (uint64_t)v8,  0LL,  0LL);
  }

  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

+ (__SecKey)createKeyFromEndpoint:(id)a3 error:(id *)a4
{
  return (__SecKey *)[a1 createItemFromEndpoint:a3 certificate:0 error:a4];
}

+ (__SecIdentity)createIdentityFromEndpoint:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v14 = 0LL;
  unint64_t v5 = (void *)[a1 createItemFromEndpoint:a3 certificate:&v14 error:a4];
  id v6 = (const __CFData *)v14;
  id v7 = v6;
  if (!v5) {
    goto LABEL_7;
  }
  if (!v6)
  {
    if (a4)
    {
      uint64_t v11 = (void *)MEMORY[0x189607870];
      uint64_t v12 = *MEMORY[0x189604F50];
      uint64_t v15 = *MEMORY[0x1896075E0];
      v16[0] = @"Attempt to create remote identity from key-only proxy";
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 errorWithDomain:v12 code:-50 userInfo:v9];
      uint64_t v10 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = (void *)MEMORY[0x189607870];
  uint64_t v4 = *MEMORY[0x189604F50];
  uint64_t v11 = *MEMORY[0x189607798];
  v12[0] = a2;
  unint64_t v5 = (void *)MEMORY[0x189603F68];
  id v6 = a2;
  [v5 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v3 errorWithDomain:v4 code:-25300 userInfo:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __34__SecKeyProxy_targetForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = v3;
    **(void **)(a1 + 32) = v3;
    id v3 = v4;
  }
}

@end