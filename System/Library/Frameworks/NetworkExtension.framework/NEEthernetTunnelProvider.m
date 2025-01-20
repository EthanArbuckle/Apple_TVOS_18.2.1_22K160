@interface NEEthernetTunnelProvider
- (NEEthernetTunnelProvider)init;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NEEthernetTunnelProvider

- (NEEthernetTunnelProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelProvider;
  return -[NEPacketTunnelProvider initWithVirtualInterfaceType:](&v3, sel_initWithVirtualInterfaceType_, 3LL);
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v7;
    [v9 IPv4Settings];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || ([v9 IPv4Settings],
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          [v4 configMethod] == 3))
    {
      uint64_t v13 = [v9 IPv6Settings];
      if (!v13)
      {
        if (v10)
        {
        }

        goto LABEL_17;
      }

      v14 = (void *)v13;
      [v9 IPv6Settings];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 configMethod];

      if (v10)
      {
      }

      if (v16 == 2)
      {
LABEL_17:
        v24.receiver = self;
        v24.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelProvider;
        -[NEPacketTunnelProvider setTunnelNetworkSettings:completionHandler:]( &v24,  sel_setTunnelNetworkSettings_completionHandler_,  v9,  v8);
        goto LABEL_18;
      }
    }

    else
    {
    }
    Property = -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
    v19 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v18, 96LL, 1);
    }
    id v20 = Property;

    if (!v20)
    {
      v21 = (void *)MEMORY[0x189607870];
      uint64_t v25 = *MEMORY[0x1896075E0];
      v26 = @"-[NEPacketTunnelFlow readPacketsWithCompletionHandler:] must be called before setting IPv4 settings or IPv6 settings with non-manual address configuration";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v22];
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, v23);
      goto LABEL_18;
    }

    goto LABEL_17;
  }

  v11 = (void *)MEMORY[0x189607870];
  uint64_t v27 = *MEMORY[0x1896075E0];
  v28[0] = @"Only NEEthernetTunnelNetworkSettings can be used with NEEthernetTunnelProvider";
  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v12];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v9);
LABEL_18:
}

@end