@interface NEIPCWrapper
- (void)cancel;
@end

@implementation NEIPCWrapper

void __43__NEIPCWrapper_initWithSession_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NEIPC);
    v6 = *(void **)(a1 + 32);
    id v7 = objc_initWeak(&location, v6);
    if (v6) {
      id Property = objc_getProperty(v6, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = Property;
    v22[1] = 3221225472LL;
    v22[2] = __43__NEIPCWrapper_initWithSession_identifier___block_invoke_2;
    v22[3] = &unk_18A08FB78;
    v22[0] = MEMORY[0x1895F87A8];
    objc_copyWeak(&v23, &location);
    v11 = (_xpc_endpoint_s *)v3;
    id v12 = v10;
    v13 = v22;
    if (v5)
    {
      v14 = v5;
      objc_sync_enter(v14);
      objc_setProperty_atomic_copy(v14, v15, v13, 8LL);
      xpc_connection_t v16 = xpc_connection_create_from_endpoint(v11);
      objc_setProperty_atomic(v14, v17, v16, 16LL);

      -[NEIPC setupMessageHandlingWithQueue:](v14, v12);
      objc_sync_exit(v14);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 24);
    *(void *)(v18 + 24) = v5;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  else
  {
    -[NEIPCWrapper cancel](*(void **)(a1 + 32));
  }

  v21 = *(dispatch_object_s **)(a1 + 32);
  if (v21) {
    v21 = (dispatch_object_s *)objc_getProperty(v21, v20, 8LL, 1);
  }
  dispatch_resume(v21);
  objc_sync_exit(v4);
}

void __43__NEIPCWrapper_initWithSession_identifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NEIPCWrapper cancel](WeakRetained);
  }

- (void)cancel
{
  if (a1)
  {
    id v2 = (id)wrapperMap;
    objc_sync_enter(v2);
    id v3 = (void *)wrapperMap;
    id v5 = objc_getProperty(a1, v4, 32LL, 1);
    [v3 removeObjectForKey:v5];

    objc_sync_exit(v2);
    obj = a1;
    objc_sync_enter(obj);
    v6 = (void *)obj[3];
    obj[3] = 0LL;

    objc_sync_exit(obj);
  }

- (void).cxx_destruct
{
}

void __40__NEIPCWrapper_sharedWrapperForSession___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  v1 = (void *)wrapperMap;
  wrapperMap = (uint64_t)v0;
}

@end