@interface IDSNexusAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isNexusProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requestNexusWithOptions:(id)a3;
- (BOOL)startAgentWithOptions:(id)a3;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)closeNexusWithOptions:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAgentUUID:(id)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation IDSNexusAgent

+ (id)agentDomain
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%u",  IDSNetworkAgentDomain,  getuid());
}

+ (id)agentType
{
  return IDSNetworkAgentClientChannelType;
}

+ (id)agentFromData:(id)a3
{
  return objc_alloc_init(&OBJC_CLASS___IDSNexusAgent);
}

- (id)copyAgentData
{
  __int128 v4 = 0u;
  uint64_t v16 = 0LL;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  __int128 v9 = 0u;
  __int128 v8 = 0u;
  __int128 v7 = 0u;
  __int128 v6 = 0u;
  __int128 v5 = 0u;
  int v3 = 4;
  DWORD1(v4) = 2;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v3, 204LL));
}

- (NSString)agentDescription
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "agentDomain");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "agentType");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSNexusAgent %@ : %@",  v4,  v7));

  return (NSString *)v8;
}

- (BOOL)isVoluntary
{
  return 0;
}

- (BOOL)isKernelActivated
{
  return 0;
}

- (BOOL)isUserActivated
{
  return 0;
}

- (BOOL)isSpecificUseOnly
{
  return 0;
}

- (BOOL)isNetworkProvider
{
  return 1;
}

- (BOOL)isNexusProvider
{
  return 1;
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelAgent](&OBJC_CLASS___IDSFoundationLog, "ClientChannelAgent"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    __int128 v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client requested nexus: %@\n",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
  unsigned __int8 v6 = [v5 addClient:v3];

  return v6;
}

- (void)closeNexusWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelAgent](&OBJC_CLASS___IDSFoundationLog, "ClientChannelAgent"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    __int128 v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client closed nexus: %@\n",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
  [v5 removeClient:v3];
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelAgent](&OBJC_CLASS___IDSFoundationLog, "ClientChannelAgent"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    __int128 v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client triggered agent: %@\n",  (uint8_t *)&v6,  0xCu);
  }

  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelAgent](&OBJC_CLASS___IDSFoundationLog, "ClientChannelAgent"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    __int128 v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client asserted agent: %@\n",  (uint8_t *)&v6,  0xCu);
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelAgent](&OBJC_CLASS___IDSFoundationLog, "ClientChannelAgent"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client unasserted agent: %@\n",  (uint8_t *)&v5,  0xCu);
  }
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
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

- (void).cxx_destruct
{
}

@end