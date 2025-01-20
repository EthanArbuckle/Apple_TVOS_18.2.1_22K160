@interface NSPPrivacyProxyDNSAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
+ (id)dnsAgentUUID;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (NSPPrivacyProxyDNSAgent)initWithDelegate:(id)a3;
- (NSPPrivacyProxyDNSAgentDelegate)delegate;
- (NSPPrivacyProxyResolverInfo)resolver;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (NSUUID)proxyAgentUUID;
- (id)copyAgentData;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setProxyAgentUUID:(id)a3;
- (void)setResolver:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NSPPrivacyProxyDNSAgent

- (NSPPrivacyProxyDNSAgent)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyDNSAgent;
  v5 = -[NSPPrivacyProxyDNSAgent init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[NSPPrivacyProxyDNSAgent setActive:](v5, "setActive:", 1LL);
    -[NSPPrivacyProxyDNSAgent setKernelActivated:](v6, "setKernelActivated:", 0LL);
    -[NSPPrivacyProxyDNSAgent setUserActivated:](v6, "setUserActivated:", 0LL);
    -[NSPPrivacyProxyDNSAgent setVoluntary:](v6, "setVoluntary:", 1LL);
    objc_storeWeak((id *)&v6->_delegate, v4);
    -[NSPPrivacyProxyDNSAgent setAgentDescription:](v6, "setAgentDescription:", @"iCloud Private Relay");
    id v7 = [(id)objc_opt_class(v6) dnsAgentUUID];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSPPrivacyProxyDNSAgent setAgentUUID:](v6, "setAgentUUID:", v8);
  }

  return v6;
}

+ (id)dnsAgentUUID
{
  return  -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  &ne_privacy_dns_netagent_id);
}

+ (id)agentDomain
{
  return @"SystemConfig";
}

+ (id)agentType
{
  return @"DNSAgent";
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

- (id)copyAgentData
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent resolver](self, "resolver"));
  if (v5)
  {
    v6 = (void *)nw_resolver_config_create();
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 obliviousDoHConfig]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent proxyAgentUUID](self, "proxyAgentUUID"));

    if (v8) {
      uint64_t v9 = 4LL;
    }
    else {
      uint64_t v9 = 3LL;
    }
    if (v8) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    nw_resolver_config_set_class(v6, v9);
    nw_resolver_config_set_protocol(v6, v10);
    nw_resolver_config_set_allow_failover(v6, 1LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dohURL]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));

    v13 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v12,  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents percentEncodedHost](v13, "percentEncodedHost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents percentEncodedPath](v13, "percentEncodedPath"));
    nw_resolver_config_set_provider_name(v6, [v14 UTF8String]);
    nw_resolver_config_set_provider_path(v6, [v15 UTF8String]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent proxyAgentUUID](self, "proxyAgentUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);

    if (v17) {
      nw_resolver_config_set_proxy_agent(v6, [v17 UTF8String]);
    }
    if (v7 && [v7 length]) {
      nw_resolver_config_set_odoh_config(v6, [v7 bytes], objc_msgSend(v7, "length"));
    }
    v18 = (void *)nw_resolver_config_copy_plist_data(v6);
  }

  else
  {
    uint64_t v19 = nplog_obj(0LL, v3, v4);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No resolver info set", v22, 2u);
    }

    v18 = 0LL;
  }

  return v18;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent delegate](self, "delegate"));
  [v7 reportErrorForDNSAgent:self error:v4 withOptions:v6];

  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return (NSPPrivacyProxyResolverInfo *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setResolver:(id)a3
{
}

- (NSUUID)proxyAgentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProxyAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyDNSAgentDelegate)delegate
{
  return (NSPPrivacyProxyDNSAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end