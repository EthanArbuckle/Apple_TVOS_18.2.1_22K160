@interface NEAgentDNSProxyExtension
- (id)driverInterface;
- (void)setSystemDNSSettings:(id)a3;
@end

@implementation NEAgentDNSProxyExtension

- (id)driverInterface
{
  if (driverInterface_onceToken != -1) {
    dispatch_once(&driverInterface_onceToken, &__block_literal_global_2034);
  }
  return (id)driverInterface_driverInterface;
}

- (void)setSystemDNSSettings:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSystemDNSSettings:v4];
}

void __43__NEAgentDNSProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EA660];
  v1 = (void *)driverInterface_driverInterface;
  driverInterface_driverInterface = v0;

  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)driverInterface_driverInterface setClasses:v4 forSelector:sel_setSystemDNSSettings_ argumentIndex:0 ofReply:0];
}

@end