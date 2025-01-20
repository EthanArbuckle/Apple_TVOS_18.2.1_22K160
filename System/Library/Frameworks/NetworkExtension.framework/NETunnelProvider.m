@interface NETunnelProvider
- (BOOL)reasserting;
- (NETunnelProviderRoutingMethod)routingMethod;
- (NEVPNProtocol)protocolConfiguration;
- (NSArray)appRules;
- (void)handleAppMessage:(NSData *)messageData completionHandler:(void *)completionHandler;
- (void)setAppRules:(id)a3;
- (void)setProtocolConfiguration:(id)a3;
- (void)setReasserting:(BOOL)reasserting;
- (void)setTunnelNetworkSettings:(NETunnelNetworkSettings *)tunnelNetworkSettings completionHandler:(void *)completionHandler;
@end

@implementation NETunnelProvider

- (void)setTunnelNetworkSettings:(NETunnelNetworkSettings *)tunnelNetworkSettings completionHandler:(void *)completionHandler
{
  v25[1] = *MEMORY[0x1895F89C0];
  v6 = tunnelNetworkSettings;
  v7 = completionHandler;
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v6) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x189607870];
      uint64_t v24 = *MEMORY[0x1896075E0];
      v25[0] = @"NEPacketTunnelNetworkSettings can only be used with NEPacketTunnelProvider";
      v10 = (void *)MEMORY[0x189603F68];
      v11 = (const __CFString **)v25;
      v12 = &v24;
      goto LABEL_14;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x189607870];
      uint64_t v22 = *MEMORY[0x1896075E0];
      v23 = @"NEPacketTunnelNetworkSettings must be used with NEPacketTunnelProvider";
      v10 = (void *)MEMORY[0x189603F68];
      v11 = &v23;
      v12 = &v22;
LABEL_14:
      [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v16];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v13);
      goto LABEL_17;
    }
  }

  if (!-[NETunnelNetworkSettings checkValidityAndCollectErrors:](v6, "checkValidityAndCollectErrors:", v8))
  {
    ne_log_obj();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_INFO, "%@: setTunnelConfiguration validation failed", buf, 0xCu);
    }

    if ([v8 count])
    {
      objc_msgSend(v8, "componentsJoinedByString:", @"\n", *MEMORY[0x1896075E0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v13 = 0LL;
    }

    [MEMORY[0x189607870] errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v13];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);
  }

  else
  {
LABEL_8:
    v13 = -[NEProvider context](self, "context");
    [v13 setTunnelConfiguration:v6 completionHandler:v7];
  }

- (BOOL)reasserting
{
  return self->_reasserting;
}

- (void)setReasserting:(BOOL)reasserting
{
  BOOL v3 = reasserting;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v7, 0x12u);
  }

  self->_reasserting = v3;
  v6 = -[NEProvider context](self, "context");
  [v6 didSetReasserting:v3];
}

- (void)handleAppMessage:(NSData *)messageData completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6 = messageData;
  int v7 = completionHandler;
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    BOOL v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@: Handle App Message with %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0LL);
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEProvider context](v2, "context");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appVPN];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodSourceApplication;
  }

  else
  {
    -[NEProvider context](v2, "context");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (v10) {
      id v13 = objc_getProperty(v10, v11, 48LL, 1);
    }
    else {
      id v13 = 0LL;
    }
    id v14 = v13;
    [v14 VPN];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 tunnelType];

    if (v16 == 2) {
      NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodSourceApplication|NETunnelProviderRoutingMethodDestinationIP;
    }
    else {
      NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodDestinationIP;
    }
  }

  objc_sync_exit(v2);

  return v9;
}

- (NEVPNProtocol)protocolConfiguration
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProtocolConfiguration:(id)a3
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAppRules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end