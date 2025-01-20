@interface CacheDeleteServiceListener
+ (id)cacheDeleteServiceListener:(id)a3 options:(id)a4;
- (BOOL)anonymous;
- (BOOL)legacyCallbacks;
- (CacheDeleteServiceInfo)serviceInfo;
- (CacheDeleteServiceListener)initWithName:(id)a3 options:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (id)callback;
- (id)cancel;
- (id)notify;
- (id)periodic;
- (id)purge;
- (id)purgeable;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)setCallback:(id)a3;
- (void)setCancel:(id)a3;
- (void)setNotify:(id)a3;
- (void)setNotifyCallback:(id)a3;
- (void)setPeriodic:(id)a3;
- (void)setPurge:(id)a3;
- (void)setPurgeable:(id)a3;
- (void)setPurgeable:(id)a3 purge:(id)a4 cancel:(id)a5 periodic:(id)a6 notify:(id)a7 callback:(id)a8 entitlements:(id)a9;
- (void)setQueue:(id)a3;
@end

@implementation CacheDeleteServiceListener

- (CacheDeleteServiceListener)initWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"CACHE_DELETE_LEGACY_CALLBACK"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"ANON"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"CACHE_DELETE_SERVICE_INFO"];
  v10 = (CacheDeleteServiceInfo *)objc_claimAutoreleasedReturnValue();

  serviceInfo = self->_serviceInfo;
  self->_serviceInfo = v10;

  if (self->_serviceInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[CacheDeleteServiceInfo extensionContext](self->_serviceInfo, "extensionContext");
      if (v12)
      {
        v13 = -[CacheDeleteServiceInfo extensionContext](self->_serviceInfo, "extensionContext");
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

LABEL_16:
        v16 = 0LL;
        goto LABEL_17;
      }
    }
  }

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      self->_anonymous = [v9 BOOLValue];
    }
  }

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      self->_legacyCallbacks = [v8 BOOLValue];
    }
  }

  if (!self->_anonymous)
  {
    char isKindOfClass = 0;
    goto LABEL_16;
  }

  CDGetLogHandle((uint64_t)"client");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1874E4000, v15, OS_LOG_TYPE_DEFAULT, "USING ANON Listener", buf, 2u);
  }

  [MEMORY[0x189607B50] anonymousListener];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = 0;
LABEL_17:
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CacheDeleteServiceListener;
  v17 = -[CacheDeleteListener initWithName:listener:protocol:exportedObj:isExtension:]( &v28,  sel_initWithName_listener_protocol_exportedObj_isExtension_,  v6,  v16,  &unk_18C6DBF08,  self,  isKindOfClass & 1);
  v18 = v17;
  if (v17)
  {
    v19 = "";
    if (v17->_anonymous)
    {
      uint64_t v20 = [v16 endpoint];
      endpoint = v18->_endpoint;
      v18->_endpoint = (NSXPCListenerEndpoint *)v20;

      if (v18->_anonymous) {
        v19 = "_ANON";
      }
    }

    id v22 = [NSString stringWithFormat:@"cache_delete.listener.%@%s", v6, v19];
    v23 = (const char *)[v22 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
    -[CacheDeleteServiceListener setQueue:](v18, "setQueue:", v25);

    v26 = v18;
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1874E4000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "super initWithName failed.", buf, 2u);
    }
  }

  return v18;
}

+ (id)cacheDeleteServiceListener:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = -[CacheDeleteServiceListener initWithName:options:]( objc_alloc(&OBJC_CLASS___CacheDeleteServiceListener),  "initWithName:options:",  v6,  v5);

    v8 = (void *)cacheDeleteServiceListener_options__listener;
    cacheDeleteServiceListener_options__listener = (uint64_t)v7;
  }

  return (id)cacheDeleteServiceListener_options__listener;
}

- (void)setPurgeable:(id)a3 purge:(id)a4 cancel:(id)a5 periodic:(id)a6 notify:(id)a7 callback:(id)a8 entitlements:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  -[CacheDeleteServiceListener queue](self, "queue");
  id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke;
  block[3] = &unk_18A066678;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  block[4] = self;
  id v31 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_sync(v22, block);
}

uint64_t __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) setPurgeable:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setPurge:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setCancel:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setPeriodic:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setNotify:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setCallback:*(void *)(a1 + 88)];
  return [*(id *)(a1 + 32) addRequiredEntitlement:*(void *)(a1 + 40)];
}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[v8 mutableCopy];
  [v10 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[CacheDeleteVolume validateVolumeAtPath:](&OBJC_CLASS___CacheDeleteVolume, "validateVolumeAtPath:", v11);
  if (!v12) {
    goto LABEL_8;
  }
  [v10 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  [v8 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = evaluateBoolProperty(v13);

  dispatch_qos_class_t v15 = v14 ? QOS_CLASS_UTILITY : QOS_CLASS_BACKGROUND;
  if (!-[CacheDeleteServiceListener legacyCallbacks](self, "legacyCallbacks")
    || (getRootVolume(),
        id v16 = (void *)objc_claimAutoreleasedReturnValue(),
        char v17 = [v12 isEqualToString:v16],
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v20 = MEMORY[0x1895F87A8];
    uint64_t v21 = 3221225472LL;
    id v22 = __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke;
    id v23 = &unk_18A0666A0;
    id v24 = self;
    id v25 = v10;
    int v27 = a3;
    id v26 = v9;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, &v20);
    -[CacheDeleteServiceListener queue](self, "queue", v20, v21, v22, v23, v24);
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v18);
  }

  else
  {
LABEL_8:
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

void __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) purgeable];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) purgeable];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)(*((uint64_t (**)(id, void, void))v14 + 2))( v14,  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    [*(id *)(a1 + 32) callback];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 56)];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      id v16 = @"CACHE_DELETE_PURGEABLE_OPERATION";
      uint64_t v17 = *(void *)(a1 + 40);
      dispatch_block_t v18 = @"CACHE_DELETE_OPERATIONS";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 32) callback];
      id v9 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
      v10 = (void *)((uint64_t (**)(void, void *))v9)[2](v9, v8);

      uint64_t v11 = *(void *)(a1 + 48);
      [v10 objectForKeyedSubscript:@"CACHE_DELETE_PURGEABLE_OPERATION"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1874E4000, v13, OS_LOG_TYPE_INFO, "purgeable callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = (void *)[a4 mutableCopy];
  [v9 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](&OBJC_CLASS___CacheDeleteVolume, "validateVolumeAtPath:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:@"CACHE_DELETE_QOS"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (([v9 setObject:v11 forKeyedSubscript:@"CACHE_DELETE_VOLUME"],
         !-[CacheDeleteServiceListener legacyCallbacks](self, "legacyCallbacks"))
     || (getRootVolume(),
         id v14 = (void *)objc_claimAutoreleasedReturnValue(),
         char v15 = [v11 isEqualToString:v14],
         v14,
         (v15 & 1) != 0)))
  {
    if (v13) {
      dispatch_qos_class_t v16 = [v13 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v16 = QOS_CLASS_UTILITY;
    }
    CDGetLogHandle((uint64_t)"client");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      dispatch_qos_class_t v29 = v16;
      _os_log_impl(&dword_1874E4000, v17, OS_LOG_TYPE_DEFAULT, "servicePurge QOS: %u", buf, 8u);
    }

    uint64_t v20 = MEMORY[0x1895F87A8];
    uint64_t v21 = 3221225472LL;
    id v22 = __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke;
    id v23 = &unk_18A0666A0;
    id v24 = self;
    id v25 = v9;
    int v27 = a3;
    id v26 = v8;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, &v20);
    -[CacheDeleteServiceListener queue](self, "queue", v20, v21, v22, v23, v24);
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v18);
  }

  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

void __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) purge];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) purge];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)(*((uint64_t (**)(id, void, void))v14 + 2))( v14,  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    [*(id *)(a1 + 32) callback];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 56)];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      dispatch_qos_class_t v16 = @"CACHE_DELETE_PURGE_OPERATION";
      uint64_t v17 = *(void *)(a1 + 40);
      dispatch_block_t v18 = @"CACHE_DELETE_OPERATIONS";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 32) callback];
      id v9 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
      v10 = (void *)((uint64_t (**)(void, void *))v9)[2](v9, v8);

      uint64_t v11 = *(void *)(a1 + 48);
      [v10 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_OPERATION"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1874E4000, v13, OS_LOG_TYPE_INFO, "purge callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

- (void)serviceCancelPurge:(id)a3
{
  v4 = (void (**)(void))a3;
  CDGetLogHandle((uint64_t)"client");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge", buf, 2u);
  }

  cancel = (void (**)(void))self->_cancel;
  if (cancel)
  {
    cancel[2]();
  }

  else
  {
    callback = (void (**)(id, void *))self->_callback;
    if (callback)
    {
      callback[2](callback, &unk_18A06C570);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_error_impl(&dword_1874E4000, v8, OS_LOG_TYPE_ERROR, "cancel callback is NULL", v11, 2u);
      }
    }
  }

  v4[2](v4);

  CDGetLogHandle((uint64_t)"client");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1874E4000, v9, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge end", v10, 2u);
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = MEMORY[0x1895F87A8];
  uint64_t v15 = 3221225472LL;
  dispatch_qos_class_t v16 = __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke;
  uint64_t v17 = &unk_18A0666A0;
  dispatch_block_t v18 = self;
  id v19 = v8;
  int v21 = a3;
  id v20 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v14);
  -[CacheDeleteServiceListener queue](self, "queue", v14, v15, v16, v17, v18);
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v13, v12);
}

void __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) periodic];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 periodic];
    v4 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    id v5 = (const void *)v4[2](v4, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));

    if (v5) {
      CFRelease(v5);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
  }

  else
  {
    [v3 callback];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v7 = (void *)[*(id *)(a1 + 40) mutableCopy];
      [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 56)];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v8 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      int v21 = v7;
      id v22 = @"CACHE_DELETE_OPERATIONS";
      id v20 = @"CACHE_DELETE_PERIODIC_OPERATION";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      CDGetLogHandle((uint64_t)"client");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17[0] = 67109378;
        v17[1] = 229;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_debug_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_DEBUG,  "[%d] FRAMEWORK operation: %@",  (uint8_t *)v17,  0x12u);
      }

      [*(id *)(a1 + 32) callback];
      dispatch_block_t v12 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
      v13 = (void *)((uint64_t (**)(void, void *))v12)[2](v12, v10);

      uint64_t v14 = *(void *)(a1 + 48);
      [v13 objectForKeyedSubscript:@"CACHE_DELETE_PERIODIC_OPERATION"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      dispatch_qos_class_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_1874E4000, v16, OS_LOG_TYPE_INFO, "periodic callback is NULL", (uint8_t *)v17, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

- (void)servicePing:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  CDGetLogHandle((uint64_t)"client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v8);
  id v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.cache_delete_notify", v9);

  -[CacheDeleteServiceListener queue](self, "queue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v10, v11);

  dispatch_activate(v10);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke;
  block[3] = &unk_18A0666C8;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v10, block);
}

uint64_t __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) notify];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 notify];
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(os_log_s *, void))v4 + 2))(v4, *(void *)(a1 + 40));
  }

  else
  {
    [v3 callback];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      id v13 = @"CACHE_DELETE_NOTIFICATION_OPERATION";
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = @"CACHE_DELETE_OPERATIONS";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      CDGetLogHandle((uint64_t)"client");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 67109378;
        LODWORD(v12[0]) = 263;
        WORD2(v12[0]) = 2112;
        *(void *)((char *)v12 + 6) = v4;
        _os_log_debug_impl( &dword_1874E4000,  v7,  OS_LOG_TYPE_DEBUG,  "[%d] FRAMEWORK operation: %@",  (uint8_t *)&v11,  0x12u);
      }

      [*(id *)(a1 + 32) callback];
      id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, os_log_s *))v8)[2](v8, v4);
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412290;
        v12[0] = v10;
        _os_log_error_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_ERROR,  "notify callback is NULL for %@",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)setNotifyCallback:(id)a3
{
  id v4 = a3;
  -[CacheDeleteServiceListener queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke;
  block[3] = &unk_18A065CD8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNotify:*(void *)(a1 + 40)];
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CacheDeleteServiceListener callback](self, "callback");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v6 objectForKeyedSubscript:@"CACHE_DELETE_QOS"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    evaluateNumberProperty(v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      dispatch_qos_class_t v11 = [v10 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v11 = QOS_CLASS_BACKGROUND;
    }
    uint64_t v12 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke;
    block[3] = &unk_18A0666C8;
    id v20 = v7;
    block[4] = self;
    id v19 = v6;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    -[CacheDeleteServiceListener queue](self, "queue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472LL;
    void v16[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2;
    v16[3] = &unk_18A0666F0;
    id v17 = v13;
    id v15 = v13;
    dispatch_async(v14, v16);
  }
}

void __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) callback];
  id v4 = (uint64_t (**)(id, void))objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void *)v4[2](v4, *(void *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)legacyCallbacks
{
  return self->_legacyCallbacks;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (CacheDeleteServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 72LL, 1);
}

- (id)purgeable
{
  return self->_purgeable;
}

- (void)setPurgeable:(id)a3
{
}

- (id)purge
{
  return self->_purge;
}

- (void)setPurge:(id)a3
{
}

- (id)periodic
{
  return self->_periodic;
}

- (void)setPeriodic:(id)a3
{
}

- (id)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
}

- (id)notify
{
  return self->_notify;
}

- (void)setNotify:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end