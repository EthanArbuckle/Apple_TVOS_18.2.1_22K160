@interface NERelayNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (OS_nw_proxy_config)proxyConfig;
- (id)agentDescription;
- (id)copyAgentData;
- (void)setProxyConfig:(id)a3;
@end

@implementation NERelayNetworkAgent

- (id)agentDescription
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NERelayNetworkAgent;
  -[NENetworkAgent agentDescription](&v3, sel_agentDescription);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyAgentData
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    return 0LL;
  }
  v4 = -[NENetworkAgent configurationUUID](self, "configurationUUID");
  [v4 getUUIDBytes:v9];
  v5 = -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  nw_proxy_config_set_identifier();
  v6 = -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  v7 = (void *)nw_proxy_config_copy_agent_data();

  return v7;
}

- (OS_nw_proxy_config)proxyConfig
{
  return (OS_nw_proxy_config *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setProxyConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return (id)[NSString stringWithUTF8String:nw_proxy_config_get_agent_domain()];
}

+ (id)agentType
{
  return (id)[NSString stringWithUTF8String:nw_proxy_config_get_agent_type()];
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end