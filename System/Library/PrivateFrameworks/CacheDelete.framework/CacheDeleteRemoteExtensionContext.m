@interface CacheDeleteRemoteExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CacheDeleteRemoteExtensionContext)init;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
@end

@implementation CacheDeleteRemoteExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_11);
  }
  return (id)qword_18C4C42F0;
}

void __68__CacheDeleteRemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DA578];
  v1 = (void *)qword_18C4C42F0;
  qword_18C4C42F0 = v0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_18C4C42F8 != -1) {
    dispatch_once(&qword_18C4C42F8, &__block_literal_global_41_0);
  }
  return (id)qword_18C4C4300;
}

void __70__CacheDeleteRemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DBF08];
  v1 = (void *)qword_18C4C4300;
  qword_18C4C4300 = v0;
}

- (CacheDeleteRemoteExtensionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CacheDeleteRemoteExtensionContext;
  v2 = -[NSExtensionContext init](&v6, sel_init);
  if (v2)
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1874E4000, v3, OS_LOG_TYPE_DEFAULT, "ENTRY", v5, 2u);
    }
  }

  return v2;
}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1874E4000, v9, OS_LOG_TYPE_DEFAULT, "purgeable, urgency: %d", buf, 8u);
  }
  v10 = +[CacheDeleteServiceListener cacheDeleteServiceListener:options:]( &OBJC_CLASS___CacheDeleteServiceListener,  "cacheDeleteServiceListener:options:",  0LL,  0LL);
  if (v10)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke;
    v12[3] = &unk_18A0668D0;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePurgeable:v6 info:v7 replyBlock:v12];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_18A06C598);
  }
}

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  CDGetLogHandle((uint64_t)"client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEFAULT, "calling completeRequestReturningItems", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 32) serviceInfo];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extensionContext];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 completeRequestReturningItems:0 completionHandler:&__block_literal_global_62];
}

void __70__CacheDeleteRemoteExtensionContext_servicePurgeable_info_replyBlock___block_invoke_60( uint64_t a1,  int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1874E4000, v9, OS_LOG_TYPE_DEFAULT, "purge, urgency: %d", buf, 8u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:]( &OBJC_CLASS___CacheDeleteServiceListener,  "cacheDeleteServiceListener:options:",  0LL,  0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke;
    v12[3] = &unk_18A0668D0;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePurge:v6 info:v7 replyBlock:v12];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_18A06C5C0);
  }
}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) serviceInfo];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extensionContext];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 completeRequestReturningItems:0 completionHandler:&__block_literal_global_71_0];
}

void __66__CacheDeleteRemoteExtensionContext_servicePurge_info_replyBlock___block_invoke_70( uint64_t a1,  int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)serviceCancelPurge:(id)a3
{
  id v3 = (void (**)(void))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "cancelPurge", buf, 2u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:]( &OBJC_CLASS___CacheDeleteServiceListener,  "cacheDeleteServiceListener:options:",  0LL,  0LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke;
    v7[3] = &unk_18A066938;
    uint64_t v9 = v3;
    id v8 = v5;
    [v8 serviceCancelPurge:v7];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, v6, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v3[2](v3);
  }
}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 extensionContext];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 completeRequestReturningItems:0 completionHandler:&__block_literal_global_75];
}

void __56__CacheDeleteRemoteExtensionContext_serviceCancelPurge___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  CDGetLogHandle((uint64_t)"client");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v6;
    _os_log_impl(&dword_1874E4000, v9, OS_LOG_TYPE_DEFAULT, "periodic, urgency: %d", buf, 8u);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:]( &OBJC_CLASS___CacheDeleteServiceListener,  "cacheDeleteServiceListener:options:",  0LL,  0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke;
    v12[3] = &unk_18A0668D0;
    id v14 = v8;
    id v13 = v10;
    [v13 servicePeriodic:v6 info:v7 replyBlock:v12];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, v11, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    (*((void (**)(id, void *))v8 + 2))(v8, &unk_18A06C5E8);
  }
}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) serviceInfo];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extensionContext];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 completeRequestReturningItems:0 completionHandler:&__block_literal_global_77];
}

void __69__CacheDeleteRemoteExtensionContext_servicePeriodic_info_replyBlock___block_invoke_76( uint64_t a1,  int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  CDGetLogHandle((uint64_t)"client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1874E4000, v7, OS_LOG_TYPE_DEFAULT, "callback, urgency: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)[v5 mutableCopy];
  [v8 setObject:@"Unsupported callback" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
  v6[2](v6, v8);
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  CDGetLogHandle((uint64_t)"client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1874E4000, v7, OS_LOG_TYPE_DEFAULT, "notify: %@", buf, 0xCu);
  }

  +[CacheDeleteServiceListener cacheDeleteServiceListener:options:]( &OBJC_CLASS___CacheDeleteServiceListener,  "cacheDeleteServiceListener:options:",  0LL,  0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke;
    v10[3] = &unk_18A066938;
    v12 = v6;
    id v11 = v8;
    [v11 serviceNotify:v5 replyBlock:v10];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, v9, OS_LOG_TYPE_ERROR, "No Listener!!", buf, 2u);
    }

    v6[2](v6);
  }
}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 extensionContext];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 completeRequestReturningItems:0 completionHandler:&__block_literal_global_83];
}

void __62__CacheDeleteRemoteExtensionContext_serviceNotify_replyBlock___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2) {
      v4 = "YES";
    }
    int v5 = 136315138;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteRemoteExtensionContext completeRequestReturningItems completionHandler expired %s",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)servicePing:(id)a3
{
  id v3 = (void (**)(void))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

@end