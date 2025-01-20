@interface NEProxyConfigurationNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (NEProxyConfigurationNetworkAgent)initWithProxyConfiguration:(id)a3;
- (id)agentDescription;
- (id)copyAgentData;
@end

@implementation NEProxyConfigurationNetworkAgent

- (id)agentDescription
{
  return (id)[(id)objc_opt_class() agentType];
}

- (NEProxyConfigurationNetworkAgent)initWithProxyConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEProxyConfigurationNetworkAgent;
  v5 = -[NEProxyConfigurationNetworkAgent init](&v11, sel_init);
  if (!v5)
  {
LABEL_7:
    v8 = 0LL;
    goto LABEL_8;
  }

  uint64_t ProxyAgentData = SCNetworkProxiesCreateProxyAgentData();
  if (!ProxyAgentData)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to turn proxy configuration into agent data: %@",  buf,  0xCu);
    }

    goto LABEL_7;
  }

  agentData = v5->_agentData;
  v5->_agentData = (NSData *)ProxyAgentData;

  v8 = v5;
LABEL_8:

  return v8;
}

- (id)copyAgentData
{
  if (self) {
    self = (NEProxyConfigurationNetworkAgent *)objc_getProperty(self, a2, 80LL, 1);
  }
  return (id)-[NEProxyConfigurationNetworkAgent copy](self, "copy");
}

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return @"SystemConfig";
}

+ (id)agentType
{
  return @"ProxyAgent";
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NEProxyConfigurationNetworkAgent);
  v6 = v4;
  if (v4) {
    objc_setProperty_atomic(v4, v5, v3, 80LL);
  }

  return v6;
}

@end