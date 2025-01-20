@interface _NSCFSocksProxy
+ (id)proxyServers;
+ (void)handleIncomingConnection:(id)a3 queue:(id)a4 configuration:(id)a5;
- (uint64_t)handshakeRead;
- (uint64_t)readInbound;
- (uint64_t)readOutbound;
- (void)cleanup;
- (void)connected:(int)a3;
- (void)dealloc;
- (void)outboundConnectionCompleteWithError:(int)a3;
- (void)outboundConnectionReceivedData:(id)a3 handler:(id)a4;
@end

@implementation _NSCFSocksProxy

- (void)connected:(int)a3
{
  inbound = self->_inbound;
  v6 = -[__CFN_SocksHandshake finish:](self->_socksHandshake, "finish:");
  -[NSProxyConnection write:handler:](inbound, "write:handler:", v6, &__block_literal_global_7_6223);

  if (a3)
  {
    -[_NSCFSocksProxy cleanup](self, "cleanup");
  }

  else
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v8 = self->_inbound;
    uint64_t v10 = MEMORY[0x1895F87A8];
    uint64_t v11 = 3221225472LL;
    v12 = __30___NSCFSocksProxy_readInbound__block_invoke;
    v13 = &unk_189C0ACB0;
    v14 = self;
    -[NSProxyConnection read:handler:](v8, "read:handler:", 0x40000LL, &v10);
    outbound = self->_outbound;
    uint64_t v10 = v7;
    uint64_t v11 = 3221225472LL;
    v12 = __31___NSCFSocksProxy_readOutbound__block_invoke;
    v13 = &unk_189C0ACB0;
    v14 = self;
    -[NSProxyConnection read:handler:](outbound, "read:handler:", 0x40000LL, &v10);
  }

- (void)cleanup
{
  inbound = self->_inbound;
  if (inbound && inbound->_pendingWrites)
  {
    inbound->_doCleanupWhenWritesCompleted = 1;
  }

  else
  {
    -[NSProxyConnection cancel](inbound, "cancel");
    v4 = self->_inbound;
    self->_inbound = 0LL;
  }

  outbound = self->_outbound;
  self->_outbound = 0LL;

  [(id)_proxyServers removeObject:self];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v3 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[_NSCFSocksProxy proxyServers]();
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_DEFAULT,  "Finished ProxyConnection %lu connection(s) left",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSCFSocksProxy;
  -[_NSCFSocksProxy dealloc](&v5, sel_dealloc);
}

- (void)outboundConnectionReceivedData:(id)a3 handler:(id)a4
{
  id v6 = a4;
  inbound = self->_inbound;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __58___NSCFSocksProxy_outboundConnectionReceivedData_handler___block_invoke;
  v9[3] = &unk_189C12290;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  -[NSProxyConnection write:handler:](inbound, "write:handler:", a3, v9);
}

- (void)outboundConnectionCompleteWithError:(int)a3
{
  socksHandshake = self->_socksHandshake;
  if (socksHandshake && socksHandshake->_finished) {
    -[_NSCFSocksProxy cleanup](self, "cleanup", *(void *)&a3);
  }
  else {
    -[_NSCFSocksProxy connected:](self, "connected:", 1LL);
  }
}

- (void).cxx_destruct
{
}

+ (id)proxyServers
{
  v0 = (void *)_proxyServers;
  if (!_proxyServers)
  {
    id v1 = objc_alloc_init(MEMORY[0x189603FE0]);
    v2 = (void *)_proxyServers;
    _proxyServers = (uint64_t)v1;

    v0 = (void *)_proxyServers;
  }

  return v0;
}

- (uint64_t)readInbound
{
  if (result)
  {
    id v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __30___NSCFSocksProxy_readInbound__block_invoke;
    v2[3] = &unk_189C0ACB0;
    v2[4] = result;
    return [v1 read:0x40000 handler:v2];
  }

  return result;
}

- (uint64_t)readOutbound
{
  if (result)
  {
    id v1 = *(void **)(result + 48);
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __31___NSCFSocksProxy_readOutbound__block_invoke;
    v2[3] = &unk_189C0ACB0;
    v2[4] = result;
    return [v1 read:0x40000 handler:v2];
  }

  return result;
}

+ (void)handleIncomingConnection:(id)a3 queue:(id)a4 configuration:(id)a5
{
  id newValue = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc(&OBJC_CLASS____NSCFSocksProxy);
  id v10 = objc_alloc(&OBJC_CLASS___NSProxyConnection);
  id v11 = v8;
  if (v10)
  {
    v20.receiver = v10;
    v20.super_class = (Class)&OBJC_CLASS___NSProxyConnection;
    v12 = objc_msgSendSuper2(&v20, sel_init);
    id v10 = (NSProxyConnection *)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a3);
      tcp_connection_set_event_handler();
      tcp_connection_start();
    }
  }

  v13 = v10;
  id v14 = v7;
  if (v9)
  {
    v20.receiver = v9;
    v20.super_class = (Class)&OBJC_CLASS____NSCFSocksProxy;
    v15 = objc_msgSendSuper2(&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 5, v10);
      objc_storeStrong(v16 + 1, a4);
    }
  }

  else
  {
    v16 = 0LL;
  }

  if (v16) {
    objc_setProperty_atomic(v16, v17, newValue, 56LL);
  }
  v18 = +[_NSCFSocksProxy proxyServers]();
  [v18 addObject:v16];

  -[_NSCFSocksProxy handshakeRead]((uint64_t)v16);
}

- (uint64_t)handshakeRead
{
  if (result)
  {
    id v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __32___NSCFSocksProxy_handshakeRead__block_invoke;
    v2[3] = &unk_189C0ACB0;
    v2[4] = result;
    return [v1 read:1024 handler:v2];
  }

  return result;
}

@end