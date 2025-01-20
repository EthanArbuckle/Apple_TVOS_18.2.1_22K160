@interface NWPathFlow
- (BOOL)isAssigned;
- (BOOL)isDefunct;
- (BOOL)isDirect;
- (BOOL)isLocal;
- (BOOL)isViable;
- (BOOL)supportsIPv4;
- (BOOL)supportsIPv6;
- (NSUUID)flowID;
- (NSUUID)nexusAgent;
- (NSUUID)nexusInstance;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (NWInterface)interface;
- (NWPathFlow)initWithPathFlow:(id)a3;
- (OS_nw_path_flow)internalPathFlow;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)privateDescription;
- (unsigned)nexusPort;
@end

@implementation NWPathFlow

- (NWPathFlow)initWithPathFlow:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWPathFlow;
    v6 = -[NWPathFlow init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalPathFlow, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPathFlow initWithPathFlow:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWPathFlow initWithPathFlow:]";
          __int16 v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWPathFlow initWithPathFlow:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWPathFlow initWithPathFlow:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null pathFlow, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (NWInterface)interface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_flow_copy_interface(v2);

  if (v3) {
    v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NWEndpoint)localEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_flow_copy_local_endpoint(v2);

  if (v3)
  {
    v4 = +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
  }

  else
  {
    v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)remoteEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_flow_copy_remote_endpoint(v2);

  if (v3)
  {
    v4 = +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
  }

  else
  {
    v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NSUUID)flowID
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v2 = -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  int id = nw_path_flow_get_id(v2, &v5);

  if (id) {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v5];
  }
  else {
    return (NSUUID *)0LL;
  }
}

- (NSUUID)nexusAgent
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v2 = -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  nexus_agent_uuint id = nw_path_flow_get_nexus_agent_uuid(v2, &v5);

  if (nexus_agent_uuid) {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v5];
  }
  else {
    return (NSUUID *)0LL;
  }
}

- (NSUUID)nexusInstance
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  int nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, 0LL);

  v4 = 0LL;
  if (nexus_instance) {
    v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v6];
  }
  return (NSUUID *)v4;
}

- (unsigned)nexusPort
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int v5 = 0;
  v2 = -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  int nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, &v5);

  if (nexus_instance) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isViable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_viable = nw_path_flow_is_viable(v2);

  return is_viable;
}

- (BOOL)isAssigned
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_assigned = nw_path_flow_is_assigned(v2);

  return is_assigned;
}

- (BOOL)isLocal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_local = nw_path_flow_is_local(v2);

  return is_local;
}

- (BOOL)isDirect
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_direct = nw_path_flow_is_direct(v2);

  return is_direct;
}

- (BOOL)isDefunct
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_defunct = nw_path_flow_is_defunct(v2);

  return is_defunct;
}

- (BOOL)supportsIPv4
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_ipv4 = nw_path_flow_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)supportsIPv6
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_ip__int128 v6 = nw_path_flow_has_ipv6(v2);

  return has_ipv6;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  v8 = -[NWPathFlow flowID](self, "flowID");
  [v7 appendPrettyObject:v8 withName:@"flowID" indent:v5 showFullContent:v4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isViable](self, "isViable"), @"isViable", v5);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPathFlow isAssigned](self, "isAssigned"),  @"isAssigned",  v5);
  if (-[NWPathFlow isLocal](self, "isLocal")) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isLocal](self, "isLocal"), @"isLocal", v5);
  }
  if (-[NWPathFlow isDirect](self, "isDirect")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPathFlow isDirect](self, "isDirect"),  @"isDirect",  v5);
  }
  if (-[NWPathFlow isDefunct](self, "isDefunct")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPathFlow isDefunct](self, "isDefunct"),  @"isDefunct",  v5);
  }
  if (-[NWPathFlow supportsIPv4](self, "supportsIPv4")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPathFlow supportsIPv4](self, "supportsIPv4"),  @"supportsIPv4",  v5);
  }
  if (-[NWPathFlow supportsIPv6](self, "supportsIPv6")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPathFlow supportsIPv6](self, "supportsIPv6"),  @"supportsIPv6",  v5);
  }
  v9 = -[NWPathFlow interface](self, "interface");
  [v7 appendPrettyObject:v9 withName:@"interface" indent:v5 showFullContent:v4];
  v10 = -[NWPathFlow localEndpoint](self, "localEndpoint");
  [v7 appendPrettyObject:v10 withName:@"localEndpoint" indent:v5 showFullContent:v4];
  v11 = -[NWPathFlow remoteEndpoint](self, "remoteEndpoint");
  [v7 appendPrettyObject:v11 withName:@"remoteEndpoint" indent:v5 showFullContent:v4];

  -[NWPathFlow nexusAgent](self, "nexusAgent");
  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v7 appendPrettyObject:v12 withName:@"nexusAgent" indent:v5 showFullContent:v4];
    v13 = -[NWPathFlow nexusInstance](self, "nexusInstance");
    [v7 appendPrettyObject:v13 withName:@"nexusInstance" indent:v5 showFullContent:v4];

    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWPathFlow nexusPort](self, "nexusPort"),  @"nexusPort",  v5);
  }

  return v7;
}

- (id)description
{
  return  -[NWPathFlow descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (id)privateDescription
{
  return  -[NWPathFlow descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (OS_nw_path_flow)internalPathFlow
{
  return (OS_nw_path_flow *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end