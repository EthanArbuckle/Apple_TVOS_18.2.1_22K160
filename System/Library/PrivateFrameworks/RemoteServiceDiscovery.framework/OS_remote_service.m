@interface OS_remote_service
- (int)proxySocketOverRemoteXPC:(int)a3;
- (void)dealloc;
@end

@implementation OS_remote_service

- (int)proxySocketOverRemoteXPC:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_alloc(&OBJC_CLASS___SocketRemoteXpcProxy);
  device = self->device;
  id v7 = remoted_queue();
  v8 = -[SocketRemoteXpcProxy initWithSocket:device:queue:server:]( v5,  "initWithSocket:device:queue:server:",  v3,  device,  v7,  0LL);

  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    int v9 = -[SocketRemoteXpcProxy takeOwnershipOfClientSocket](v8, "takeOwnershipOfClientSocket");
    if (v9 < 0)
    {
      v10 = (os_log_s *)rsd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[OS_remote_service proxySocketOverRemoteXPC:].cold.2();
      }
    }

    -[NSMutableArray addObject:](self->proxies, "addObject:", v8);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __46__OS_remote_service_proxySocketOverRemoteXPC___block_invoke;
    v13[3] = &unk_189F0BC88;
    v13[4] = self;
    objc_copyWeak(&v14, &location);
    -[SocketRemoteXpcProxy setOnCancel:](v8, "setOnCancel:", v13);
    -[SocketRemoteXpcProxy activate](v8, "activate");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    v11 = (os_log_s *)rsd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[OS_remote_service proxySocketOverRemoteXPC:].cold.1();
    }

    int v9 = -1;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_remote_service;
  -[OS_remote_service dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)proxySocketOverRemoteXPC:.cold.1()
{
}

- (void)proxySocketOverRemoteXPC:.cold.2()
{
}

@end