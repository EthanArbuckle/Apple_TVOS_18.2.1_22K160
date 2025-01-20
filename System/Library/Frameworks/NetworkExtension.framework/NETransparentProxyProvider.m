@interface NETransparentProxyProvider
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NETransparentProxyProvider

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x189607870];
      uint64_t v12 = *MEMORY[0x1896075E0];
      v13[0] = @"Only NETransparentProxyNetworkSettings can be used with NETransparentProxyProvider";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v9];
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v10);
      goto LABEL_6;
    }

    [v6 setIsFullyTransparent:1];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NETransparentProxyProvider;
  -[NETunnelProvider setTunnelNetworkSettings:completionHandler:]( &v11,  sel_setTunnelNetworkSettings_completionHandler_,  v6,  v7);
LABEL_6:
}

@end