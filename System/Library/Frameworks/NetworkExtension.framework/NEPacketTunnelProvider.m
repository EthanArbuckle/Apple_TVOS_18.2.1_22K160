@interface NEPacketTunnelProvider
- (NEPacketTunnelFlow)packetFlow;
- (NEPacketTunnelProvider)init;
- (NEPacketTunnelProvider)initWithVirtualInterfaceType:(int64_t)a3;
- (NWTCPConnection)createTCPConnectionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate;
- (NWUDPSession)createUDPSessionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint;
- (OS_nw_interface)virtualInterface;
- (id)getTunnelInterface;
- (void)cancelTunnelWithError:(NSError *)error;
- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7;
- (void)setPacketFlow:(id)a3;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
- (void)startTunnelWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)stopTunnelWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEPacketTunnelProvider

- (NEPacketTunnelProvider)init
{
  return -[NEPacketTunnelProvider initWithVirtualInterfaceType:](self, "initWithVirtualInterfaceType:", 1LL);
}

- (NEPacketTunnelProvider)initWithVirtualInterfaceType:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEPacketTunnelProvider;
  v4 = -[NEProvider initAllowUnentitled:](&v13, sel_initAllowUnentitled_, 0LL);
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NEPacketTunnelFlow);
    if (v5)
    {
      v14.receiver = v5;
      v14.super_class = (Class)&OBJC_CLASS___NEPacketTunnelFlow;
      v6 = -[NEProvider init](&v14, sel_init);
      if (v6)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
        v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v9 = dispatch_queue_create("NEPacketTunnelFlow queue", v8);
        context = v6->super.super._context;
        v6->super.super._context = (NEExtensionProviderContext *)v9;

        v6[1].super.super._defaultPath = (NWPath *)a3;
      }
    }

    else
    {
      v6 = 0LL;
    }

    packetFlow = v4->_packetFlow;
    v4->_packetFlow = (NEPacketTunnelFlow *)v6;
  }

  return v4;
}

- (OS_nw_interface)virtualInterface
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = 0LL;
    v4 = 0LL;
LABEL_6:

    return (OS_nw_interface *)v4;
  }

  v4 = (void *)v3[11];

  if (v4)
  {
    uint64_t v5 = -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
    v6 = (void *)v5;
    if (v5) {
      uint64_t v5 = *(void *)(v5 + 88);
    }
    NEVirtualInterfaceGetIndex(v5);
    v4 = (void *)nw_interface_create_with_index();
    goto LABEL_6;
  }

  return (OS_nw_interface *)v4;
}

- (NWTCPConnection)createTCPConnectionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  BOOL v7 = enableTLS;
  v10 = TLSParameters;
  v11 = (objc_class *)MEMORY[0x189608E10];
  id v12 = delegate;
  objc_super v13 = remoteEndpoint;
  id v14 = objc_alloc_init(v11);
  [v14 setEnableTLS:v7];
  if (v10 && v7)
  {
    v15 = -[NWTLSParameters TLSSessionID](v10, "TLSSessionID");
    [v14 setTLSSessionID:v15];
    v16 = -[NWTLSParameters SSLCipherSuites](v10, "SSLCipherSuites");
    [v14 setSSLCipherSuites:v16];

    objc_msgSend( v14,  "setMinimumSSLProtocolVersion:",  -[NWTLSParameters minimumSSLProtocolVersion](v10, "minimumSSLProtocolVersion"));
    objc_msgSend( v14,  "setMaximumSSLProtocolVersion:",  -[NWTLSParameters maximumSSLProtocolVersion](v10, "maximumSSLProtocolVersion"));
  }
  v17 = -[NEPacketTunnelProvider getTunnelInterface](self);
  [v14 setRequiredInterface:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x189608E30]) initWithEndpoint:v13 parameters:v14 delegate:v12];
  return (NWTCPConnection *)v18;
}

- (NWUDPSession)createUDPSessionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  v6 = localEndpoint;
  BOOL v7 = (objc_class *)MEMORY[0x189608E10];
  v8 = remoteEndpoint;
  id v9 = objc_alloc_init(v7);
  if (v6)
  {
    v10 = (void *)MEMORY[0x189608DE8];
    v11 = -[NWHostEndpoint hostname](v6, "hostname");
    -[NWHostEndpoint port](v6, "port");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 endpointWithHostname:v11 port:v12];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setLocalAddress:v13];
  }

  -[NEPacketTunnelProvider getTunnelInterface](self);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setRequiredInterface:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x189608E38]) initWithEndpoint:v8 parameters:v9];
  return (NWUDPSession *)v15;
}

- (void)cancelTunnelWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v4 = error;
  ne_log_obj();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "%@: canceling with error %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[NEProvider context](self, "context");
  [v6 cancelWithError:v4];
}

- (void)startTunnelWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6 = options;
  int v7 = completionHandler;
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0LL);
}

- (void)stopTunnelWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v6 = completionHandler;
  ne_log_obj();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2048;
    NEProviderStopReason v11 = reason;
    _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "%@: Stopping with reason %ld", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6);
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  ne_log_obj();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = "PFKey";
    int v19 = 138412802;
    v20 = self;
    if (v10) {
      v17 = "IKE";
    }
    __int16 v21 = 2080;
    v22 = v17;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_INFO,  "%@: Getting %s Socket for Interface %@",  (uint8_t *)&v19,  0x20u);
  }
  v18 = -[NEProvider context](self, "context");
  [v18 requestSocket:v10 interface:v12 local:v15 remote:v14 completionHandler:v13];
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  int v8 = (void (**)(id, void *))a4;
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  [v9 IPv4Settings];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || ([v9 IPv4Settings],
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        [v4 configMethod] == 3))
  {
    uint64_t v11 = [v9 IPv6Settings];
    if (!v11)
    {
      if (v10)
      {
      }

      goto LABEL_16;
    }

    id v12 = (void *)v11;
    [v9 IPv6Settings];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 configMethod];

    if (v10)
    {
    }

    if (v14 == 2)
    {
LABEL_16:
      v21.receiver = self;
      v21.super_class = (Class)&OBJC_CLASS___NEPacketTunnelProvider;
      -[NETunnelProvider setTunnelNetworkSettings:completionHandler:]( &v21,  sel_setTunnelNetworkSettings_completionHandler_,  v9,  v8);
      goto LABEL_17;
    }
  }

  else
  {
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x189607870];
    uint64_t v24 = *MEMORY[0x1896075E0];
    v25[0] = @"Non-manual IP addressing can only be used with NEEthernetTunnelNetworkSettings";
    v16 = (void *)MEMORY[0x189603F68];
    v17 = (const __CFString **)v25;
    v18 = &v24;
    goto LABEL_13;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_16;
  }
  id v15 = (void *)MEMORY[0x189607870];
  uint64_t v22 = *MEMORY[0x1896075E0];
  __int16 v23 = @"Non-manual IP addressing can only be used with NEEthernetTunnelProvider";
  v16 = (void *)MEMORY[0x189603F68];
  v17 = &v23;
  v18 = &v22;
LABEL_13:
  [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v19];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v20);
LABEL_17:
}

- (NEPacketTunnelFlow)packetFlow
{
  return (NEPacketTunnelFlow *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPacketFlow:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)getTunnelInterface
{
  if (!a1)
  {
    v3 = 0LL;
    return v3;
  }

  [a1 packetFlow];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = 0LL;
    v3 = 0LL;
LABEL_9:

    return v3;
  }

  v3 = (void *)v2[11];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x189608E00]);
    uint64_t v5 = [a1 packetFlow];
    v6 = (void *)v5;
    if (v5 && (uint64_t v7 = *(void *)(v5 + 88)) != 0) {
      int v8 = (__CFString *)CFStringCreateWithCString( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const char *)(v7 + 265),  0x600u);
    }
    else {
      int v8 = 0LL;
    }
    v3 = (void *)[v4 initWithInterfaceName:v8];

    goto LABEL_9;
  }

  return v3;
}

@end