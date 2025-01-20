@interface IDSLocalMultiplexer
+ (id)sharedInstance;
- (BOOL)connectionCancel:(id)a3;
- (BOOL)connectionRequest:(id)a3;
- (BOOL)listenCancel:(id)a3;
- (BOOL)listenRequest:(id)a3;
- (BOOL)registerMultiplexerTransport:(id)a3;
- (BOOL)setupTransportForConnection:(id)a3;
- (BOOL)unregisterMultiplexerTransport:(id)a3;
- (IDSLocalMultiplexer)init;
- (id)_localTransportForSession:(id)a3;
@end

@implementation IDSLocalMultiplexer

+ (id)sharedInstance
{
  if (qword_1009BEB98 != -1) {
    dispatch_once(&qword_1009BEB98, &stru_1008FBA40);
  }
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = qword_1009BEBA0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "IDSLocalMultiplexer sharedInstance returns %@",  (uint8_t *)&v4,  0xCu);
  }

  return (id)qword_1009BEBA0;
}

- (IDSLocalMultiplexer)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSLocalMultiplexer;
  v2 = -[IDSLocalMultiplexer init](&v24, "init");
  v3 = v2;
  if (!v2) {
    goto LABEL_14;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v4 = nw_nexus_create("IDSLocalMultiplexerNexus");
  nexus = v3->_nexus;
  v3->_nexus = (OS_nw_nexus *)v4;

  if (v3->_nexus)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientUUIDs = v3->_clientUUIDs;
    v3->_clientUUIDs = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    connections = v3->_connections;
    v3->_connections = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    pendingConnections = v3->_pendingConnections;
    v3->_pendingConnections = (NSMutableSet *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transports = v3->_transports;
    v3->_transports = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transportsInstances = v3->_transportsInstances;
    v3->_transportsInstances = (NSMutableDictionary *)v14;

    strcpy((char *)v3->_osNexusName, "IDSMultiplexNexusOS");
    uint64_t v16 = os_nexus_controller_create();
    v3->_osNexusController = (nexus_controller *)v16;
    if (!v16)
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 0;
        v18 = "os_nexus_controller_create failed";
        goto LABEL_11;
      }

      goto LABEL_12;
    }

    if (os_nexus_controller_register_provider(v16, v3->_osNexusName, 0LL, 0LL, v3->_osNexusUUID))
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 0;
        v18 = "os_nexus_controller_register_provider failed";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)v23, 2u);
        goto LABEL_12;
      }

      goto LABEL_12;
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[IDSTransportLevelAgent sharedInstance](&OBJC_CLASS___IDSTransportLevelAgent, "sharedInstance"));
    agent = v3->_agent;
    v3->_agent = (IDSTransportLevelAgent *)v20;

    -[IDSTransportLevelAgent registerMultiplexer:forIdentifier:]( v3->_agent,  "registerMultiplexer:forIdentifier:",  v3,  @"local");
LABEL_14:
    v19 = v3;
    goto LABEL_15;
  }

  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 0;
    v18 = "nw_nexus_create failed";
    goto LABEL_11;
  }

- (BOOL)registerMultiplexerTransport:(id)a3
{
  id v4 = a3;
  transports = self->_transports;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](transports, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Transport %@ already registered! Cannot register duplicate.",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    uint64_t v10 = self->_transports;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v4, v11);

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_transports;
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Multiplexer added transport %@ to list of transports %@",  (uint8_t *)&v15,  0x16u);
    }

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 routeClientConnections:self->_pendingConnections]);
    -[NSMutableSet minusSet:](self->_pendingConnections, "minusSet:", v8);
  }

  return v7 == 0LL;
}

- (BOOL)unregisterMultiplexerTransport:(id)a3
{
  id v4 = a3;
  transports = self->_transports;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](transports, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    uint64_t v8 = self->_transports;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0LL, v9);
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Transport %@ not registered! Cannot unregister.",  (uint8_t *)&v13,  0xCu);
    }
  }

  return v7 != 0LL;
}

- (BOOL)setupTransportForConnection:(id)a3
{
  id v4 = a3;
  memset(src, 170, sizeof(src));
  if (os_nexus_controller_alloc_provider_instance(self->_osNexusController, self->_osNexusUUID, src))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "os_nexus_controller_alloc_provider_instance failed";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  memset(out, 170, sizeof(out));
  uuid_generate(out);
  osNexusController = self->_osNexusController;
  uint64_t v8 = getpid();
  if (!os_nexus_controller_bind_provider_instance(osNexusController, src, 1LL, v8, 0LL, out, 16LL, 5LL))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 processUUID]);
    v33[0] = 0xAAAAAAAAAAAAAAAALL;
    v33[1] = 0xAAAAAAAAAAAAAAAALL;
    [v11 getUUIDBytes:v33];
    if (os_nexus_controller_bind_provider_instance( self->_osNexusController,  src,  0,  [v4 pid],  v33,  out,  16,  7))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

LABEL_16:
        objc_msgSend(v4, "invalidate", v29);
        BOOL v9 = 0;
LABEL_17:

        goto LABEL_9;
      }

      *(_WORD *)buf = 0;
      int v13 = "os_nexus_controller_bind_provider_instance failed for client";
    }

    else
    {
      uuid_copy(self->_nexusInstanceUUID, src);
      uint64_t v15 = os_channel_attr_create();
      if (v15)
      {
        uint64_t v16 = v15;
        os_channel_attr_set_key(v15, out, 16LL);
        os_channel_attr_set(v16, 7LL, 1LL);
        uint64_t extended = os_channel_create_extended(self->_nexusInstanceUUID, 1LL, 0LL, 0xFFFFFFFFLL, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (!extended)
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "os_channel_create_extended failed",  buf,  2u);
          }

          goto LABEL_16;
        }

        if (v19)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteEndpoint]);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v20;
          __int16 v31 = 2112;
          v32 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "registration nexusdata localEndpoint %@ remoteEndpoint %@",  buf,  0x16u);
        }

        *(void *)buf = 0LL;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteEndpoint]);
        assign_message = (void *)nw_path_create_assign_message(buf, src, 0LL, out, 16LL, v22, v23);

        if (assign_message)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent registration](self->_agent, "registration"));
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  assign_message,  *(void *)buf));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
          unsigned __int8 v28 = [v25 assignNexusData:v26 toClient:v27];

          free(assign_message);
          if ((v28 & 1) != 0)
          {
            [v4 setOsChannel:extended];
            BOOL v9 = 1;
            goto LABEL_17;
          }

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          LOWORD(v29) = 0;
          int v13 = "assignNexusData:toClient: failed";
        }

        else
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          LOWORD(v29) = 0;
          int v13 = "nw_path_create_assign_message failed";
        }

        uint64_t v14 = (uint8_t *)&v29;
        goto LABEL_14;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      int v13 = "connectTransportThreadForClient: os_channel_attr_create failed";
    }

    uint64_t v14 = buf;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_15;
  }

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v6 = "os_nexus_controller_bind_provider_instance failed for server";
    goto LABEL_7;
  }

- (id)_localTransportForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (IDSMultiplexerLocalTransport *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_transportsInstances,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    uint64_t v5 = -[IDSMultiplexerLocalTransport initWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSMultiplexerLocalTransport),  "initWithIdentifier:",  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_transportsInstances,  "setObject:forKeyedSubscript:",  v5,  v4);
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    BOOL v9 = sub_10014D94C;
    uint64_t v10 = &unk_1008F91A0;
    v11 = self;
    id v12 = v4;
    -[IDSMultiplexerLocalTransport setPacketBufferReadHandler:](v5, "setPacketBufferReadHandler:", &v7);
    -[IDSLocalMultiplexer registerMultiplexerTransport:]( self,  "registerMultiplexerTransport:",  v5,  v7,  v8,  v9,  v10,  v11);
  }

  return v5;
}

- (BOOL)connectionRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 path]);
  uint64_t v5 = (nw_path *)v4;
  if (v4)
  {
    uint64_t v6 = (nw_endpoint *)nw_path_copy_endpoint(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client endpoint %@", buf, 0xCu);
      }

      if (nw_endpoint_get_type(v6) != nw_endpoint_type_host)
      {
        BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "client endpoint type not 'host' for client %@",  buf,  0xCu);
        }
      }

      int port = nw_endpoint_get_port(v6);
      id v12 = nw_endpoint_copy_port_string(v6);
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = port;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "port %u portString %s", buf, 0x12u);
      }

      free(v12);
      v7 = (os_log_s *)nw_path_copy_parameters(v5);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client params: %@", buf, 0xCu);
      }

      endpoint = nw_path_copy_effective_local_endpoint(v5);
      if (endpoint)
      {
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = endpoint;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "client local endpoint %@", buf, 0xCu);
        }
      }

      v46 = nw_path_copy_effective_remote_endpoint(v5);
      if (v46)
      {
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v46;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "client remote endpoint %@", buf, 0xCu);
        }
      }

      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v3 multiplexerParams]);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v18;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "client request [%@] for client %@",  buf,  0x16u);
      }

      uint64_t pid = nw_parameters_get_pid(v7);
      BOOL v21 = (_DWORD)pid != 0;
      if ((_DWORD)pid)
      {
        uint64_t v22 = pid;
        BOOL v43 = (_DWORD)pid != 0;
        memset(buf, 170, 16);
        nw_parameters_get_proc_uuid(v7, buf);
        os_unfair_lock_t lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v3 multiplexerParams]);
        objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sessionID]);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalMultiplexer _localTransportForSession:](self, "_localTransportForSession:", v24));

        v25 = objc_alloc_init(&OBJC_CLASS___IDSMultiplexerConnection);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
        -[IDSMultiplexerConnection setClientUUID:](v25, "setClientUUID:", v26);

        -[IDSMultiplexerConnection setPath:](v25, "setPath:", v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v3 multiplexerParams]);
        -[IDSMultiplexerConnection setMultiplexerParams:](v25, "setMultiplexerParams:", v27);

        -[IDSMultiplexerConnection setParameters:](v25, "setParameters:", v7);
        -[IDSMultiplexerConnection setPid:](v25, "setPid:", v22);
        unsigned __int8 v28 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", buf);
        -[IDSMultiplexerConnection setProcessUUID:](v25, "setProcessUUID:", v28);

        -[IDSMultiplexerConnection setLocalPort:](v25, "setLocalPort:", nw_endpoint_get_port(endpoint));
        -[IDSMultiplexerConnection setRemotePort:](v25, "setRemotePort:", nw_endpoint_get_port(v46));
        -[IDSMultiplexerConnection setPortsSignature:]( v25,  "setPortsSignature:",  -[IDSMultiplexerConnection remotePort](v25, "remotePort") | (-[IDSMultiplexerConnection localPort]( v25,  "localPort") << 16));
        if ((nw_parameters_get_data_mode(v7) & 0xFFFFFFFE) == 2) {
          -[IDSMultiplexerConnection setIsTCP:](v25, "setIsTCP:", 1LL);
        }
        uint64_t v29 = (nw_endpoint *)objc_claimAutoreleasedReturnValue([v3 endpoint]);
        nw_endpoint_type_t type = nw_endpoint_get_type(v29);

        if (type == nw_endpoint_type_host)
        {
          *(void *)&address.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
          address.sa_family = 2;
          *(_DWORD *)&address.sa_data[2] = 0;
          *(_WORD *)address.sa_data = __rev16(-[IDSMultiplexerConnection localPort](v25, "localPort"));
          address.sa_len = 16;
          nw_endpoint_t v31 = nw_endpoint_create_address(&address);
          -[IDSMultiplexerConnection setLocalEndpoint:](v25, "setLocalEndpoint:", v31);

          address.sa_family = 2;
          *(_DWORD *)&address.sa_data[2] = 0;
          *(_WORD *)address.sa_data = __rev16(-[IDSMultiplexerConnection remotePort](v25, "remotePort"));
          address.sa_len = 16;
          nw_endpoint_t v32 = nw_endpoint_create_address(&address);
          -[IDSMultiplexerConnection setRemoteEndpoint:](v25, "setRemoteEndpoint:", v32);
        }

        else
        {
          -[IDSMultiplexerConnection setLocalEndpoint:](v25, "setLocalEndpoint:", endpoint);
          -[IDSMultiplexerConnection setRemoteEndpoint:](v25, "setRemoteEndpoint:", v46);
        }

        connections = self->_connections;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](connections, "setObject:forKeyedSubscript:", v25, v38);

        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)&address.sa_len = 138412290;
          *(void *)&address.sa_data[2] = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Created connection %@",  &address.sa_len,  0xCu);
        }

        usleep(0x64u);
        -[NSMutableSet addObject:](self->_pendingConnections, "addObject:", v25);
        id v40 = -[NSMutableSet copy](self->_pendingConnections, "copy");
        -[IDSMultiplexerConnection setTransport:](v25, "setTransport:", v44);
        os_unfair_lock_unlock(lock);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v44 routeClientConnections:v40]);
        os_unfair_lock_lock(lock);
        -[NSMutableSet minusSet:](self->_pendingConnections, "minusSet:", v41);
        os_unfair_lock_unlock(lock);

        BOOL v21 = v43;
      }

      else
      {
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Client UUID %@ having pid 0 (root) is not supported",  buf,  0xCu);
        }
      }
    }

    else
    {
      if (v8)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "client does not have endpoint %@",  buf,  0xCu);
      }

      BOOL v21 = 0;
    }
  }

  else
  {
    uint64_t v6 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v3 clientUUID]);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "no nw_path for client %@", buf, 0xCu);
    }

    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)connectionCancel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](connections, "objectForKeyedSubscript:", v6));

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = self->_connections;
    pendingConnections = self->_pendingConnections;
    int v15 = 138412802;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = pendingConnections;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "connectionCancel: found connection %@ in _connections %@, _pendingConnections %@",  (uint8_t *)&v15,  0x20u);
  }

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 transport]);
    [v11 cancelClientConnection:v7];

    [v7 invalidate];
    id v12 = self->_connections;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", 0LL, v13);

    -[NSMutableSet removeObject:](self->_pendingConnections, "removeObject:", v7);
  }

  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (BOOL)listenRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 path]);
  uint64_t v6 = (nw_path *)v5;
  if (v5)
  {
    v7 = (nw_endpoint *)nw_path_copy_endpoint(v5);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (v9)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)buf = 138412290;
        *(void *)v71 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "client does not have endpoint %@",  buf,  0xCu);
      }

LABEL_14:
      int v13 = (os_log_s *)nw_path_copy_parameters(v6);
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v71 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client params: %@", buf, 0xCu);
      }

      uint64_t v16 = nw_path_copy_effective_local_endpoint(v6);
      if (v16)
      {
        __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v71 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "client local endpoint %@", buf, 0xCu);
        }
      }

      v18 = nw_path_copy_effective_remote_endpoint(v6);
      if (v18)
      {
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v71 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "client remote endpoint %@", buf, 0xCu);
        }
      }

      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
        uint64_t v22 = v13;
        v23 = v18;
        objc_super v24 = v16;
        v25 = self;
        v26 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)buf = 138412546;
        *(void *)v71 = v21;
        *(_WORD *)&v71[8] = 2112;
        *(void *)&v71[10] = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "client request [%@] for client %@",  buf,  0x16u);

        self = v25;
        uint64_t v16 = v24;
        v18 = v23;
        int v13 = v22;
      }

      uint64_t pid = nw_parameters_get_pid(v13);
      if (!(_DWORD)pid)
      {
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          nw_endpoint_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
          *(_DWORD *)buf = 138412290;
          *(void *)v71 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Client UUID %@ having pid 0 (root) is not supported",  buf,  0xCu);
        }

        goto LABEL_41;
      }

      uint64_t v28 = pid;
      v69[0] = 0xAAAAAAAAAAAAAAAALL;
      v69[1] = 0xAAAAAAAAAAAAAAAALL;
      nw_parameters_get_proc_uuid(v13, v69);
      memset(src, 170, sizeof(src));
      if (os_nexus_controller_alloc_provider_instance(self->_osNexusController, self->_osNexusUUID, src))
      {
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "os_nexus_controller_alloc_provider_instance failed";
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        }
      }

      else
      {
        memset(out, 170, sizeof(out));
        uuid_generate(out);
        osNexusController = self->_osNexusController;
        uint64_t v33 = getpid();
        if (os_nexus_controller_bind_provider_instance( osNexusController,  src,  1LL,  v33,  0LL,  out,  16LL,  5LL))
        {
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v30 = "os_nexus_controller_bind_provider_instance failed for server";
            goto LABEL_40;
          }
        }

        else if (os_nexus_controller_bind_provider_instance( self->_osNexusController,  src,  0LL,  v28,  v69,  out,  16LL,  7LL))
        {
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v30 = "os_nexus_controller_bind_provider_instance failed for client";
            goto LABEL_40;
          }
        }

        else
        {
          v64 = self;
          nexusInstanceUUID = self->_nexusInstanceUUID;
          uuid_copy(self->_nexusInstanceUUID, src);
          uint64_t v36 = os_channel_attr_create();
          if (!v36)
          {
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_41;
            }
            *(_WORD *)buf = 0;
            v30 = "connectTransportThreadForClient: os_channel_attr_create failed";
            goto LABEL_40;
          }

          uint64_t v37 = v36;
          os_channel_attr_set_key(v36, out, 16LL);
          os_channel_attr_set(v37, 7LL, 1LL);
          uint64_t extended = os_channel_create_extended(nexusInstanceUUID, 1LL, 0LL, 0xFFFFFFFFLL, v37);
          if (extended)
          {
            uint64_t v60 = extended;
            *(void *)&address.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
            address.sa_family = 2;
            *(_DWORD *)&address.sa_data[2] = 0;
            endpoint = v16;
            *(_WORD *)address.sa_data = __rev16(nw_endpoint_get_port(v16));
            address.sa_len = 16;
            nw_endpoint_t v39 = nw_endpoint_create_address(&address);
            *(void *)&address.sa_len = 528LL;
            nw_endpoint_t v40 = nw_endpoint_create_address(&address);
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v71 = v39;
              *(_WORD *)&v71[8] = 2112;
              *(void *)&v71[10] = v40;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "registration nexusdata localEndpoint %@ remoteEndpoint %@",  buf,  0x16u);
            }

            nw_endpoint_t v63 = v40;

            uint64_t v65 = 0LL;
            uint64_t v42 = nw_path_create_assign_message(&v65, src, 0LL, out, 16LL, v39, 0LL);
            if (v42)
            {
              BOOL v43 = (void *)v42;
              v61 = v39;
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent registration](v64->_agent, "registration"));
              v58 = v43;
              v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v43, v65));
              v45 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
              unsigned __int8 lock = [v56 assignNexusData:v44 toClient:v45];

              free(v58);
              if ((lock & 1) != 0)
              {
                os_unfair_lock_lock(&v64->_lock);
                v46 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
                v47 = (void *)objc_claimAutoreleasedReturnValue([v46 sessionID]);
                v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSLocalMultiplexer _localTransportForSession:]( v64,  "_localTransportForSession:",  v47));

                v48 = objc_alloc_init(&OBJC_CLASS___IDSMultiplexerConnection);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
                -[IDSMultiplexerConnection setClientUUID:](v48, "setClientUUID:", v49);

                -[IDSMultiplexerConnection setPath:](v48, "setPath:", v6);
                v50 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
                -[IDSMultiplexerConnection setMultiplexerParams:](v48, "setMultiplexerParams:", v50);

                -[IDSMultiplexerConnection setParameters:](v48, "setParameters:", v13);
                -[IDSMultiplexerConnection setPid:](v48, "setPid:", v28);
                v51 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v69);
                -[IDSMultiplexerConnection setProcessUUID:](v48, "setProcessUUID:", v51);

                -[IDSMultiplexerConnection setLocalEndpoint:](v48, "setLocalEndpoint:", v61);
                -[IDSMultiplexerConnection setRemoteEndpoint:](v48, "setRemoteEndpoint:", v40);
                uint64_t v16 = endpoint;
                -[IDSMultiplexerConnection setLocalPort:](v48, "setLocalPort:", nw_endpoint_get_port(endpoint));
                -[IDSMultiplexerConnection setRemotePort:](v48, "setRemotePort:", 0LL);
                LODWORD(v51) = nw_endpoint_get_port(endpoint);
                -[IDSMultiplexerConnection setPortsSignature:]( v48,  "setPortsSignature:",  nw_endpoint_get_port(v18) | ((_DWORD)v51 << 16));
                connections = v64->_connections;
                v53 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( connections,  "setObject:forKeyedSubscript:",  v48,  v53);

                v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v71 = v48;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Created listener %@", buf, 0xCu);
                }

                usleep(0x64u);
                v55 = v59;
                -[IDSMultiplexerConnection setTransport:](v48, "setTransport:", v59);
                -[IDSMultiplexerConnection setOsChannel:](v48, "setOsChannel:", v60);
                os_unfair_lock_unlock(&v64->_lock);
                -[os_log_s addListenerConnection:](v59, "addListenerConnection:", v48);
              }

              else
              {
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
                uint64_t v16 = endpoint;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "assignNexusData:toClient: failed",  buf,  2u);
                }
              }

              nw_endpoint_t v39 = v61;
            }

            else
            {
              v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "nw_path_create_assign_message failed",  buf,  2u);
              }

              uint64_t v16 = endpoint;
            }

            goto LABEL_42;
          }

          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v30 = "os_channel_create_extended failed";
            goto LABEL_40;
          }
        }
      }

- (BOOL)listenCancel:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end