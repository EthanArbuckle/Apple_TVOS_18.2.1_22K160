@interface IDSTransportLevelAgent
+ (IDSTransportLevelAgent)sharedInstance;
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
- (BOOL)supportsListenRequests;
- (IDSTransportLevelAgent)init;
- (NEPolicySession)session;
- (NEVirtualInterface_s)interface;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (NWNetworkAgentRegistration)registration;
- (id)clientMultiplexerForIdentifier:(id)a3;
- (id)copyAgentData;
- (id)multiplexerForIdentifier:(id)a3;
- (void)closeNexusWithOptions:(id)a3;
- (void)registerMultiplexer:(id)a3 forIdentifier:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setAgentUUID:(id)a3;
- (void)setClientMultiplexer:(id)a3 forIdentifier:(id)a4;
- (void)setInterface:(NEVirtualInterface_s *)a3;
- (void)setMultiplexer:(id)a3 forIdentifier:(id)a4;
- (void)setRegistration:(id)a3;
- (void)setSession:(id)a3;
- (void)unassertAgentWithOptions:(id)a3;
- (void)unregisterMultiplexerForIdentifier:(id)a3;
@end

@implementation IDSTransportLevelAgent

+ (IDSTransportLevelAgent)sharedInstance
{
  if (qword_1009C0A30 != -1) {
    dispatch_once(&qword_1009C0A30, &stru_1008FFB20);
  }
  return (IDSTransportLevelAgent *)(id)qword_1009C0A38;
}

+ (id)agentDomain
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%u",  IDSNetworkAgentDomain,  getuid());
}

+ (id)agentType
{
  return IDSNetworkAgentTransportType;
}

+ (id)agentFromData:(id)a3
{
  return +[IDSTransportLevelAgent sharedInstance](&OBJC_CLASS___IDSTransportLevelAgent, "sharedInstance", a3);
}

- (IDSTransportLevelAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSTransportLevelAgent;
  v2 = -[IDSTransportLevelAgent init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    multiplexers = v2->_multiplexers;
    v2->_multiplexers = 0LL;

    clientMultiplexer = v3->_clientMultiplexer;
    v3->_clientMultiplexer = 0LL;
  }

  return v3;
}

- (id)multiplexerForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_multiplexers, "objectForKeyedSubscript:", a3);
}

- (void)setMultiplexer:(id)a3 forIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    multiplexers = self->_multiplexers;
    id v8 = v12;
    if (v12)
    {
      if (!multiplexers)
      {
        v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v10 = self->_multiplexers;
        self->_multiplexers = v9;

        id v8 = v12;
        multiplexers = self->_multiplexers;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](multiplexers, "setObject:forKeyedSubscript:", v8, v6);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](multiplexers, "setObject:forKeyedSubscript:", 0LL, v6);
      if (!-[NSMutableDictionary count](self->_multiplexers, "count"))
      {
        v11 = self->_multiplexers;
        self->_multiplexers = 0LL;
      }
    }
  }
}

- (id)clientMultiplexerForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_clientMultiplexer, "objectForKeyedSubscript:", a3);
}

- (void)setClientMultiplexer:(id)a3 forIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    clientMultiplexer = self->_clientMultiplexer;
    id v8 = v12;
    if (v12)
    {
      if (!clientMultiplexer)
      {
        v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v10 = self->_clientMultiplexer;
        self->_clientMultiplexer = v9;

        id v8 = v12;
        clientMultiplexer = self->_clientMultiplexer;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](clientMultiplexer, "setObject:forKeyedSubscript:", v8, v6);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](clientMultiplexer, "setObject:forKeyedSubscript:", 0LL, v6);
      if (!-[NSMutableDictionary count](self->_clientMultiplexer, "count"))
      {
        v11 = self->_clientMultiplexer;
        self->_clientMultiplexer = 0LL;
      }
    }
  }
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
  int v3 = 3;
  *(void *)((char *)&v4 + 4) = 0x100000002LL;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v3, 204LL));
}

- (NSString)agentDescription
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "agentDomain");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "agentType");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSTransportAgent %@ : %@",  v4,  v7));

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

- (BOOL)supportsListenRequests
{
  return 1;
}

- (void)registerMultiplexer:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent multiplexerForIdentifier:](self, "multiplexerForIdentifier:", v7));
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      __int128 v11 = "Multiplexer for identifier %@ already registered! Overriding %@ with %@\n";
      __int128 v12 = v9;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }

  else if (v10)
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int128 v11 = "Registering Multiplexer %@ for identifier %@";
    __int128 v12 = v9;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  -[IDSTransportLevelAgent setMultiplexer:forIdentifier:](self, "setMultiplexer:forIdentifier:", v6, v7);
}

- (void)unregisterMultiplexerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent multiplexerForIdentifier:](self, "multiplexerForIdentifier:", v4));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unregistering Multiplexer %@ for identifier %@",  (uint8_t *)&v8,  0x16u);
    }

    -[IDSTransportLevelAgent setMultiplexer:forIdentifier:](self, "setMultiplexer:forIdentifier:", 0LL, v4);
  }

  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No Multiplexer registered for identifier %@\n",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412546;
    *(void *)v36 = v5;
    *(_WORD *)&v36[8] = 2112;
    *(void *)&v36[10] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: Client requested nexus: %@ options: %@\n",  (uint8_t *)&v35,  0x16u);
  }

  BOOL v7 = -[IDSTransportLevelAgentClientInfo initWithClientUUID:]( objc_alloc(&OBJC_CLASS___IDSTransportLevelAgentClientInfo),  "initWithClientUUID:",  v5);
  int v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo path](v7, "path"));

    if (!v9)
    {
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412290;
        *(void *)v36 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: nw_path_copy_path_for_client failed for client %@",  (uint8_t *)&v35,  0xCu);
      }

      goto LABEL_18;
    }

    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo multiplexerParams](v8, "multiplexerParams"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 multiplexer]);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent multiplexerForIdentifier:](self, "multiplexerForIdentifier:", v11));

    if (v12)
    {
      uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo endpoint](v8, "endpoint"));

      if (v13)
      {
        int v14 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo endpoint](v8, "endpoint"));
        nw_endpoint_type_t type = nw_endpoint_get_type(v14);

        if (type == nw_endpoint_type_host)
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo multiplexerParams](v8, "multiplexerParams"));

          if (!v16)
          {
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v35 = 138412290;
              *(void *)v36 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: could not parse params for client %@",  (uint8_t *)&v35,  0xCu);
            }

LABEL_18:
            BOOL v18 = 0;
LABEL_31:

            goto LABEL_32;
          }
        }

        else
        {
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = 138412290;
            *(void *)v36 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: endpoint type not 'host' for client %@",  (uint8_t *)&v35,  0xCu);
          }
        }

        v27 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo endpoint](v8, "endpoint"));
        int port = nw_endpoint_get_port(v27);

        v29 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo endpoint](v8, "endpoint"));
        v30 = nw_endpoint_copy_port_string(v29);

        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = 67109378;
          *(_DWORD *)v36 = port;
          *(_WORD *)&v36[4] = 2080;
          *(void *)&v36[6] = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: port %u portString %s",  (uint8_t *)&v35,  0x12u);
        }

        free(v30);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo multiplexerParams](v8, "multiplexerParams"));
          int v35 = 138412802;
          *(void *)v36 = v33;
          *(_WORD *)&v36[8] = 2112;
          *(void *)&v36[10] = v5;
          __int16 v37 = 2112;
          v38 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: [%@] for client %@ found multiplexer %@",  (uint8_t *)&v35,  0x20u);
        }

        -[IDSTransportLevelAgent setClientMultiplexer:forIdentifier:]( self,  "setClientMultiplexer:forIdentifier:",  v12,  v5);
        unsigned __int8 v25 = -[os_log_s connectionRequest:](v12, "connectionRequest:", v8);
      }

      else
      {
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo multiplexerParams](v8, "multiplexerParams"));
          int v35 = 138412802;
          *(void *)v36 = v24;
          *(_WORD *)&v36[8] = 2112;
          *(void *)&v36[10] = v5;
          __int16 v37 = 2112;
          v38 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: [%@] for client %@ found multiplexer %@",  (uint8_t *)&v35,  0x20u);
        }

        -[IDSTransportLevelAgent setClientMultiplexer:forIdentifier:]( self,  "setClientMultiplexer:forIdentifier:",  v12,  v5);
        unsigned __int8 v25 = -[os_log_s listenRequest:](v12, "listenRequest:", v8);
      }

      BOOL v18 = v25;
      goto LABEL_31;
    }

    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgentClientInfo multiplexerParams](v8, "multiplexerParams"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 multiplexer]);
      multiplexers = self->_multiplexers;
      int v35 = 138412802;
      *(void *)v36 = v21;
      *(_WORD *)&v36[8] = 2112;
      *(void *)&v36[10] = v5;
      __int16 v37 = 2112;
      v38 = multiplexers;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "requestNexusWithOptions: cannot find mutiplexer for multiplexerIdentifier [%@] for client %@ Registered multiplexers %@",  (uint8_t *)&v35,  0x20u);
    }

    goto LABEL_18;
  }

  BOOL v18 = 0;
LABEL_32:

  return v18;
}

- (void)closeNexusWithOptions:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  NWNetworkAgentStartOptionClientUUID));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    uint32_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "closeNexusWithOptions: Client closed nexus: %@ options: %@\n",  (uint8_t *)&v12,  0x16u);
  }

  BOOL v7 = -[IDSTransportLevelAgentClientInfo initWithClientUUID:]( objc_alloc(&OBJC_CLASS___IDSTransportLevelAgentClientInfo),  "initWithClientUUID:",  v5);
  if (v7)
  {
    int v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[IDSTransportLevelAgent clientMultiplexerForIdentifier:]( self,  "clientMultiplexerForIdentifier:",  v5));
    if (v8)
    {
      -[IDSTransportLevelAgent setClientMultiplexer:forIdentifier:]( self,  "setClientMultiplexer:forIdentifier:",  0LL,  v5);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        uint32_t v13 = v5;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "closeNexusWithOptions: for client %@ found multiplexer %@",  (uint8_t *)&v12,  0x16u);
      }

      -[NSMutableDictionary connectionCancel:](v8, "connectionCancel:", v7);
    }

    else
    {
      __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        clientMultiplexer = self->_clientMultiplexer;
        int v12 = 138412546;
        uint32_t v13 = v5;
        __int16 v14 = 2112;
        id v15 = clientMultiplexer;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "closeNexusWithOptions: cannot find mutiplexer for client %@ Registered multiplexers %@",  (uint8_t *)&v12,  0x16u);
      }
    }
  }
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    BOOL v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client triggered agent: %@\n",  (uint8_t *)&v6,  0xCu);
  }

  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    BOOL v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client asserted agent: %@\n",  (uint8_t *)&v6,  0xCu);
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
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

- (NWNetworkAgentRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
}

- (NEPolicySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NEVirtualInterface_s)interface
{
  return self->_interface;
}

- (void)setInterface:(NEVirtualInterface_s *)a3
{
  self->_interface = a3;
}

- (void).cxx_destruct
{
}

@end