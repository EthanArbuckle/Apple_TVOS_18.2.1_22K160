@interface SDAirDropAgent
- (NEPolicySession)policySession;
- (NEVirtualInterface_s)interface;
- (NSMutableSet)clientTokens;
- (NSUUID)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (OS_nw_agent)browseAgent;
- (SDAirDropAgent)initWithEndpointService:(id)a3;
- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)endpointService;
- (id)_agentClientTokenForClient:(id)a3;
- (void)_createBrowseAgent;
- (void)_setupBrowseHandlers;
- (void)_setupPolicy;
- (void)handleEndpointsChanged:(id)a3;
- (void)setBrowseAgent:(id)a3;
- (void)setClientTokens:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointService:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterface:(NEVirtualInterface_s *)a3;
- (void)setPolicySession:(id)a3;
@end

@implementation SDAirDropAgent

- (SDAirDropAgent)initWithEndpointService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SDAirDropAgent;
  v6 = -[SDAirDropAgent init](&v15, "init");
  if (v6)
  {
    uint64_t v7 = airdrop_nw_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initializing Sharing network agent", buf, 2u);
    }

    objc_storeStrong((id *)&v6->_dispatchQueue, &_dispatch_main_q);
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    clientTokens = v6->_clientTokens;
    v6->_clientTokens = v9;

    objc_storeStrong((id *)&v6->_endpointService, a3);
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, v6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000FF6F0;
    v12[3] = &unk_1005CE4C8;
    objc_copyWeak(&v13, (id *)buf);
    -[SDAirDropEndpointService setEndpointsChangedHandler:](v6->_endpointService, "setEndpointsChangedHandler:", v12);
    if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "privateContactDiscoveryEnabled")) {
      -[SDAirDropAgent _createBrowseAgent](v6, "_createBrowseAgent");
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (void)_setupPolicy
{
  uint64_t v3 = airdrop_nw_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Configuring agent policies",  (uint8_t *)&v32,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NEPolicySession);
  -[SDAirDropAgent setPolicySession:](self, "setPolicySession:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    [v9 setPriority:300];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    [v10 lockSessionToCurrentProcess];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](&OBJC_CLASS___NEPolicyResult, "netAgentUUID:", v11));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.airdrop"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "AirDropNetworkAgent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition requiredAgentDomain:agentType:]( &OBJC_CLASS___NEPolicyCondition,  "requiredAgentDomain:agentType:",  v14,  v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition customEntitlement:]( &OBJC_CLASS___NEPolicyCondition,  "customEntitlement:",  @"com.apple.private.application-service-browse"));
    v34[0] = v13;
    v34[1] = v16;
    v34[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
    id v19 = [[NEPolicy alloc] initWithOrder:10 result:v12 conditions:v18];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    id v21 = [v20 addPolicy:v19];

    if (!v21)
    {
      uint64_t v24 = airdrop_nw_log(v22, v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
        int v32 = 138412290;
        v33 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to add entitlement allow policy for agent %@",  (uint8_t *)&v32,  0xCu);
      }
    }

    uint64_t v27 = airdrop_nw_log(v22, v23);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
      int v32 = 138412290;
      v33 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Applying policies for agent %@",  (uint8_t *)&v32,  0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    [v30 apply];
  }

  else
  {
    uint64_t v31 = airdrop_nw_log(v7, v8);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to create policy session",  (uint8_t *)&v32,  2u);
    }
  }
}

- (void)_createBrowseAgent
{
  uint64_t v3 = airdrop_nw_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating browse agent", buf, 2u);
  }

  id v5 = (void *)nw_agent_create("com.apple.airdrop", "AirDropNetworkAgent", "AirDrop Browse Agent", self->_dispatchQueue);
  -[SDAirDropAgent setBrowseAgent:](self, "setBrowseAgent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
  if (v6)
  {
    *(void *)buf = 0LL;
    uint64_t v35 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
    nw_agent_get_uuid(v9, buf);

    v10 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", buf);
    -[SDAirDropAgent setIdentifier:](self, "setIdentifier:", v10);

    uint64_t v13 = airdrop_nw_log(v11, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
      int v32 = 138412290;
      v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Browse Agent UUID=%@", (uint8_t *)&v32, 0xCu);
    }

    -[SDAirDropAgent _setupPolicy](self, "_setupPolicy");
    -[SDAirDropAgent _setupBrowseHandlers](self, "_setupBrowseHandlers");
    id v16 = -[SDAirDropAgent _setupAssertHandlers](self, "_setupAssertHandlers");
    uint64_t v18 = airdrop_nw_log(v16, v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Activating browse agent",  (uint8_t *)&v32,  2u);
    }

    uint64_t v20 = nw_agent_change_state(self->_browseAgent, 1LL, 4LL, 0LL);
    uint64_t v22 = airdrop_nw_log(v20, v21);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Browse agent ready!", (uint8_t *)&v32, 2u);
    }
  }

  else
  {
    uint64_t v24 = airdrop_nw_log(v7, v8);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100100770(v23, v25, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (void)_setupBrowseHandlers
{
  uint64_t v3 = airdrop_nw_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting Agent Browse handlers", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FFDF4;
  v7[3] = &unk_1005CE4F0;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100100014;
  v6[3] = &unk_1005CE518;
  nw_agent_set_browse_handlers(v5, v7, v6);
}

- (id)_agentClientTokenForClient:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent clientTokens](self, "clientTokens", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 agentClient]);
        id v11 = (id)objc_claimAutoreleasedReturnValue([v10 client]);

        if (v11 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)handleEndpointsChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100100370;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_nw_agent)browseAgent
{
  return self->_browseAgent;
}

- (void)setBrowseAgent:(id)a3
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

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)endpointService
{
  return self->_endpointService;
}

- (void)setEndpointService:(id)a3
{
}

- (NSMutableSet)clientTokens
{
  return self->_clientTokens;
}

- (void)setClientTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end