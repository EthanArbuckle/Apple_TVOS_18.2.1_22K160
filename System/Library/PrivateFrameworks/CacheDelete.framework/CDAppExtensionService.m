@interface CDAppExtensionService
- (CDAppExtensionService)initWithInfo:(id)a3 extension:(id)a4;
- (NSCopying)requestId;
- (NSExtension)extension;
- (void)invalidateConnection;
- (void)obtainXPCConnection:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation CDAppExtensionService

- (CDAppExtensionService)initWithInfo:(id)a3 extension:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CDAppExtensionService;
  v7 = -[CDXPCService initWithInfo:](&v14, "initWithInfo:", a3);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = (NSExtension *)v6;
      extension = v8->_extension;
      v8->_extension = v9;
    }

    else
    {
      v11 = (objc_class *)objc_opt_class(v7);
      v12 = NSStringFromClass(v11);
      extension = (NSExtension *)objc_claimAutoreleasedReturnValue(v12);
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"ExtensionRequiredError",  @"%@ Requires Extension!",  extension);
    }
  }

  return v8;
}

- (void)obtainXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
  if (v5)
  {
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppExtensionService requestId](self, "requestId"));

    if (!v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppExtensionService extension](self, "extension"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
      objc_initWeak(&location, self);
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x2020000000LL;
      int v19 = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = __45__CDAppExtensionService_obtainXPCConnection___block_invoke;
      v12[3] = &unk_100059E58;
      v16 = v18;
      objc_copyWeak(&v17, &location);
      id v10 = v9;
      id v13 = v10;
      id v11 = v8;
      id v14 = v11;
      id v15 = v4;
      [v11 beginExtensionRequestWithOptions:0 inputItems:0 completion:v12];

      objc_destroyWeak(&v17);
      _Block_object_dispose(v18, 8);
      objc_destroyWeak(&location);

      goto LABEL_5;
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.CDAnonymousXPCService.duplicate_connection",  @"Asked to build a connection to %@ but we already have a perfectly good one!",  v7);

LABEL_5:
}

void __45__CDAppExtensionService_obtainXPCConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) >= 2)
  {
    uint64_t v7 = CDGetLogHandle("daemon");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "beginExtensionRequestWithInputItems callback called multiple (%d) times!",  buf,  8u);
    }

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.unexpected_multiple_callback",  @"beginExtensionRequestWithInputItems callback fired more than once");
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained serviceQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __45__CDAppExtensionService_obtainXPCConnection___block_invoke_12;
    v16[3] = &unk_100059E30;
    id v17 = (os_log_s *)v5;
    id v18 = v6;
    id v19 = *(id *)(a1 + 40);
    v20 = v10;
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    dispatch_async(v11, v16);

    v12 = v17;
  }

  else
  {
    uint64_t v13 = CDGetLogHandle("daemon");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "BeginExtensionRequestWithInputItems returned after self went away (ID=%@)!",  buf,  0xCu);
    }
  }
}

void __45__CDAppExtensionService_obtainXPCConnection___block_invoke_12(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_extensionContextForUUID:"));
    v3 = v2;
    if (v2)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _auxiliaryConnection]);
      [*(id *)(a1 + 56) setXpcConnection:v4];

      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) xpcConnection]);
      if (v5)
      {
LABEL_9:

        goto LABEL_10;
      }

      uint64_t v6 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) ID]);
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        v9 = "Unable to get xpc connection from app extension context for app extension service %@";
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
      }
    }

    else
    {
      uint64_t v10 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) ID]);
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        v9 = "Unable to get extension context for app extension service %@";
        goto LABEL_21;
      }
    }

    goto LABEL_9;
  }

- (void)invalidateConnection
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned int v5 = -[CDXPCService isConnected](self, "isConnected");

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppExtensionService extension](self, "extension"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppExtensionService requestId](self, "requestId"));
      [v6 cancelExtensionRequestWithIdentifier:v7];
    }
  }

  -[CDAppExtensionService setRequestId:](self, "setRequestId:", 0LL);
  -[CDXPCService connectionWasInvalidated](self, "connectionWasInvalidated");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));

  if (v8)
  {
    v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));
    dispatch_source_cancel(v9);

    -[CDXPCService setWatchdog_timer:](self, "setWatchdog_timer:", 0LL);
  }

  else
  {
    uint64_t v10 = CDGetLogHandle("daemon");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));
      int v13 = 134218240;
      int v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "watchdog timer is nil, self: %p, timer: %p",  (uint8_t *)&v13,  0x16u);
    }
  }

- (NSExtension)extension
{
  return self->_extension;
}

- (NSCopying)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end