@interface IDSGroupSessionMultiplexer
+ (id)sharedInstance;
- (BOOL)addNewConnectionToMultiplexerTransport:(id)a3;
- (BOOL)connectionCancel:(id)a3;
- (BOOL)connectionRequest:(id)a3;
- (BOOL)listenCancel:(id)a3;
- (BOOL)listenRequest:(id)a3;
- (BOOL)registerMultiplexerTransport:(id)a3;
- (BOOL)setupTransportForConnection:(id)a3;
- (BOOL)unregisterMultiplexerTransport:(id)a3;
- (IDSGroupSessionMultiplexer)init;
- (id)initAndSetupNexus;
- (unsigned)_getRandomPortForQUIC;
- (void)_releaseQUICPort:(unsigned __int16)a3;
- (void)resetConnection:(id)a3;
- (void)resetConnection:(id)a3 errorCode:(int)a4;
@end

@implementation IDSGroupSessionMultiplexer

+ (id)sharedInstance
{
  if (qword_1009BE9C0 != -1) {
    dispatch_once(&qword_1009BE9C0, &stru_1008FA220);
  }
  return (id)qword_1009BE9C8;
}

- (id)initAndSetupNexus
{
  v2 = -[IDSGroupSessionMultiplexer init](self, "init");
  if (!v2) {
    goto LABEL_17;
  }
  uint64_t v3 = nw_nexus_create("IDSGroupSessionMultiplexerNexus");
  nexus = v2->_nexus;
  v2->_nexus = (OS_nw_nexus *)v3;

  if (v2->_nexus)
  {
    uint64_t v5 = os_nexus_controller_create();
    v2->_osNexusController = (nexus_controller *)v5;
    if (!v5)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        v10 = "os_nexus_controller_create failed";
        v11 = (uint8_t *)&v18;
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    uint64_t v6 = os_nexus_attr_create();
    if (!v6)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "os_nexus_attr_create failed";
        v11 = buf;
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    uint64_t v7 = v6;
    os_nexus_attr_set(v6, 19LL, 1LL);
    strcpy((char *)v2->_osNexusName, "IDSMultiplexNexusOS");
    int v8 = os_nexus_controller_register_provider(v2->_osNexusController, v2->_osNexusName, 0LL, v7, v2->_osNexusUUID);
    os_nexus_attr_destroy(v7);
    if (v8)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        v10 = "os_nexus_controller_register_provider failed";
        v11 = (uint8_t *)&v16;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
        goto LABEL_15;
      }

      goto LABEL_15;
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[IDSTransportLevelAgent sharedInstance](&OBJC_CLASS___IDSTransportLevelAgent, "sharedInstance"));
    agent = v2->_agent;
    v2->_agent = (IDSTransportLevelAgent *)v13;

    -[IDSTransportLevelAgent registerMultiplexer:forIdentifier:]( v2->_agent,  "registerMultiplexer:forIdentifier:",  v2,  @"groupsession");
LABEL_17:
    v12 = v2;
    goto LABEL_18;
  }

  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = 0;
    v10 = "nw_nexus_create failed";
    v11 = (uint8_t *)&v19;
    goto LABEL_14;
  }

- (IDSGroupSessionMultiplexer)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSGroupSessionMultiplexer;
  v2 = -[IDSGroupSessionMultiplexer init](&v15, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientUUIDs = v3->_clientUUIDs;
    v3->_clientUUIDs = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    connections = v3->_connections;
    v3->_connections = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transports = v3->_transports;
    v3->_transports = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transportsInstances = v3->_transportsInstances;
    v3->_transportsInstances = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    occupiedPorts = v3->_occupiedPorts;
    v3->_occupiedPorts = v12;

    v3->_portHead = arc4random_uniform(0xFBFFu) + 1024;
  }

  return v3;
}

- (BOOL)registerMultiplexerTransport:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transports = self->_transports;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](transports, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Transport %@ already registered! Cannot register duplicate.",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    v11 = self->_transports;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v4, v12);

    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_transports;
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      __int16 v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "GroupSession Multiplexer added transport %@ to list of transports %@",  (uint8_t *)&v15,  0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v8 == 0LL;
}

- (BOOL)unregisterMultiplexerTransport:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transports = self->_transports;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](transports, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = self->_transports;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0LL, v10);

    [v4 invalidate];
  }

  else
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v14 = 138412290;
      int v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Transport %@ not registered! Cannot unregister.",  (uint8_t *)&v14,  0xCu);
    }
  }

  os_unfair_lock_unlock(p_lock);

  return v8 != 0LL;
}

- (BOOL)setupTransportForConnection:(id)a3
{
  id v4 = a3;
  memset(src, 170, sizeof(src));
  if (!os_nexus_controller_alloc_provider_instance(self->_osNexusController, self->_osNexusUUID, src))
  {
    memset(out, 170, sizeof(out));
    uuid_generate(out);
    osNexusController = self->_osNexusController;
    uint64_t v8 = getpid();
    if (os_nexus_controller_bind_provider_instance(osNexusController, src, 1LL, v8, 0LL, out, 16LL, 5LL))
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_bind_provider_instance failed for server",  buf,  2u);
      }

      goto LABEL_13;
    }

    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 processUUID]);
    v39[0] = 0xAAAAAAAAAAAAAAAALL;
    v39[1] = 0xAAAAAAAAAAAAAAAALL;
    -[os_log_s getUUIDBytes:](v9, "getUUIDBytes:", v39);
    if (os_nexus_controller_bind_provider_instance( self->_osNexusController,  src,  0,  [v4 pid],  v39,  out,  16,  7))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        BOOL v6 = 0;
LABEL_14:

        goto LABEL_15;
      }

      *(_WORD *)buf = 0;
      v11 = "os_nexus_controller_bind_provider_instance failed for client";
    }

    else
    {
      uuid_copy(self->_nexusInstanceUUID, src);
      uint64_t v13 = os_channel_attr_create();
      if (v13)
      {
        uint64_t v14 = v13;
        os_channel_attr_set_key(v13, out, 16LL);
        os_channel_attr_set(v14, 7LL, 1LL);
        os_channel_attr_set(v14, 26LL, 1LL);
        uint64_t extended = os_channel_create_extended(self->_nexusInstanceUUID, 1LL, 0LL, 0xFFFFFFFFLL, v14);
        os_channel_attr_destroy(v14, v16);
        __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!extended)
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "os_channel_create_extended failed",  buf,  2u);
          }

          goto LABEL_13;
        }

        if (v18)
        {
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
          v20 = (char *)objc_claimAutoreleasedReturnValue([v4 remoteEndpoint]);
          v21 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", src);
          *(_DWORD *)buf = 138412802;
          uint64_t v34 = (uint64_t)v19;
          __int16 v35 = 2112;
          v36 = v20;
          __int16 v37 = 2112;
          v38 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "nw_path_create_assign_message call with localEndpoint %@ remoteEndpoint %@ nexusInstanceUUID %@",  buf,  0x20u);
        }

        uint64_t v32 = 0LL;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteEndpoint]);
        v24 = (void *)nw_path_create_assign_message(&v32, src, 0LL, out, 16LL, v22, v23);

        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v32;
          v27 = sub_1001FF4E0((uint64_t)v24, v32);
          *(_DWORD *)buf = 134218242;
          uint64_t v34 = v26;
          __int16 v35 = 2080;
          v36 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "nw_path_create_assign_message returned size: %zu, data:\n%s",  buf,  0x16u);
        }

        if (v24)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransportLevelAgent registration](self->_agent, "registration"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v24, v32));
          v30 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
          unsigned __int8 v31 = [v28 assignNexusData:v29 toClient:v30];

          free(v24);
          if ((v31 & 1) != 0)
          {
            [v4 setOsChannel:extended];
            BOOL v6 = 1;
            goto LABEL_14;
          }

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_WORD *)buf = 0;
          v11 = "assignNexusData:toClient: failed";
        }

        else
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_WORD *)buf = 0;
          v11 = "nw_path_create_assign_message failed";
        }
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v11 = "connectTransportThreadForClient: os_channel_attr_create failed";
      }
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_12;
  }

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_alloc_provider_instance failed",  buf,  2u);
  }

  BOOL v6 = 0;
LABEL_15:

  return v6;
}

- (unsigned)_getRandomPortForQUIC
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = 0xFFFF;
  while (1)
  {
    uint64_t portHead = self->_portHead;
    unsigned __int16 v6 = (unsigned __int16)(portHead + 1) <= 0x400u ? 1024 : portHead + 1;
    self->_uint64_t portHead = v6;
    occupiedPorts = self->_occupiedPorts;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", portHead));
    LOBYTE(occupiedPorts) = -[NSMutableSet containsObject:](occupiedPorts, "containsObject:", v8);

    if (!--v4)
    {
      LOWORD(portHead) = 0;
      goto LABEL_9;
    }
  }

  v9 = self->_occupiedPorts;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", portHead));
  -[NSMutableSet addObject:](v9, "addObject:", v10);

LABEL_9:
  os_unfair_lock_unlock(p_lock);
  return portHead;
}

- (void)_releaseQUICPort:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  occupiedPorts = self->_occupiedPorts;
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:"));
  LODWORD(occupiedPorts) = -[NSMutableSet containsObject:](occupiedPorts, "containsObject:", v6);

  if ((_DWORD)occupiedPorts)
  {
    uint64_t v7 = self->_occupiedPorts;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
    -[NSMutableSet removeObject:](v7, "removeObject:", v8);
  }

- (BOOL)connectionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned __int16 v6 = (nw_path *)v5;
  if (v5)
  {
    uint64_t v7 = (os_log_s *)nw_path_copy_endpoint(v5);
    if (!v7)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)buf = 138412290;
        v79 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "client does not have endpoint %@",  buf,  0xCu);
      }

      LOBYTE(self) = 0;
      goto LABEL_49;
    }

    id v8 = (os_log_s *)nw_path_copy_parameters(v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
      *(_DWORD *)buf = 138412546;
      v79 = v10;
      LOWORD(v80) = 2112;
      *(void *)((char *)&v80 + 2) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "connectionRequest: clientUUID: %@ and params: %@",  buf,  0x16u);
    }

    v11 = nw_path_copy_effective_local_endpoint(v6);
    v12 = nw_path_copy_effective_remote_endpoint(v6);
    uint64_t pid = nw_parameters_get_pid(v8);
    if (!(_DWORD)pid)
    {
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)buf = 138412290;
        v79 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Client UUID %@ having pid 0 (root) is not supported",  buf,  0xCu);
      }

      LOBYTE(self) = 0;
      goto LABEL_48;
    }

    uint64_t v14 = pid;
    v77[0] = 0xAAAAAAAAAAAAAAAALL;
    v77[1] = 0xAAAAAAAAAAAAAAAALL;
    nw_parameters_get_proc_uuid(v8, v77);
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 assign]);

    if (v15)
    {
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___IDSMultiplexerGroupConnection);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
      -[IDSMultiplexerConnection setClientUUID:](v16, "setClientUUID:", v17);

      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      -[IDSMultiplexerConnection setPath:](v16, "setPath:", v18);

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
      -[IDSMultiplexerConnection setMultiplexerParams:](v16, "setMultiplexerParams:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
      -[IDSMultiplexerConnection setLocalEndpoint:](v16, "setLocalEndpoint:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
      -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v21);

      v22 = (nw_endpoint *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
      -[IDSMultiplexerConnection setLocalPort:](v16, "setLocalPort:", nw_endpoint_get_port(v22));

      v23 = (nw_endpoint *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
      -[IDSMultiplexerConnection setRemotePort:](v16, "setRemotePort:", nw_endpoint_get_port(v23));

      -[IDSMultiplexerConnection setPortsSignature:]( v16,  "setPortsSignature:",  -[IDSMultiplexerConnection localPort](v16, "localPort") | (-[IDSMultiplexerConnection remotePort]( v16,  "remotePort") << 16));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
      -[IDSMultiplexerConnection setContext:](v16, "setContext:", [v24 participantID]);

      LODWORD(self) = -[IDSGroupSessionMultiplexer addNewConnectionToMultiplexerTransport:]( self,  "addNewConnectionToMultiplexerTransport:",  v16);
      if ((_DWORD)self)
      {
        v72 = v8;
        v74 = v12;
        v71 = v11;
        v25 = (nw_protocol_definition *)objc_claimAutoreleasedReturnValue( -[IDSMultiplexerGroupConnection getProtocolDefinition]( v16,  "getProtocolDefinition"));
        uint64_t v26 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v4 assign]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v4 localEndpoint]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
        nw_protocol_options_t options = nw_framer_create_options(v25);
        ((void (**)(void, void *, void *, nw_protocol_options_t))v26)[2](v26, v27, v28, options);

        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "called nw_agent_flow_assign_t for %@",  buf,  0xCu);
        }

        v11 = v71;
        id v8 = v72;
        v12 = v74;
      }

      else
      {
        v25 = (nw_protocol_definition *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Could not add connection %@:", buf, 0xCu);
        }
      }
    }

    else
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v4 simConnection]);

      if (v35)
      {
        v75 = v12;
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v37 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
          *(_DWORD *)buf = 138412290;
          v79 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Creating Simulator connection and copying params for client %@",  buf,  0xCu);
        }

        v38 = objc_alloc(&OBJC_CLASS___IDSMultiplexerSimulatorConnection);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v4 simConnection]);
        uint64_t v16 = -[IDSMultiplexerSimulatorConnection initWithConnection:](v38, "initWithConnection:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        -[IDSMultiplexerConnection setClientUUID:](v16, "setClientUUID:", v40);

        v41 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
        -[IDSMultiplexerConnection setPath:](v16, "setPath:", v41);

        v42 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
        -[IDSMultiplexerConnection setMultiplexerParams:](v16, "setMultiplexerParams:", v42);

        -[IDSMultiplexerConnection setLocalPort:]( v16,  "setLocalPort:",  -[IDSGroupSessionMultiplexer _getRandomPortForQUIC](self, "_getRandomPortForQUIC"));
        if (-[IDSMultiplexerConnection localPort](v16, "localPort"))
        {
          unsigned int v43 = -[IDSMultiplexerConnection localPort](v16, "localPort");
          __int128 v80 = 0uLL;
          v79 = 0LL;
          *(_WORD *)&uint8_t buf[2] = __rev16(v43);
          *(_WORD *)buf = 7708;
          nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)buf);
          -[IDSMultiplexerConnection setLocalEndpoint:](v16, "setLocalEndpoint:", address);

          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          v12 = v75;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v46 = -[IDSMultiplexerConnection localPort](v16, "localPort");
            *(_DWORD *)buf = 67109120;
            LODWORD(v79) = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Assigning local port %d to new QUIC connection",  buf,  8u);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
          -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v47);

          v48 = (nw_endpoint *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
          -[IDSMultiplexerConnection setRemotePort:](v16, "setRemotePort:", nw_endpoint_get_port(v48));

          v49 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
          -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v49);

          -[IDSMultiplexerConnection setPortsSignature:]( v16,  "setPortsSignature:",  -[IDSMultiplexerConnection remotePort](v16, "remotePort") | (-[IDSMultiplexerConnection localPort]( v16,  "localPort") << 16));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
          -[IDSMultiplexerConnection setContext:](v16, "setContext:", [v50 participantID]);

          v51 = (void *)objc_claimAutoreleasedReturnValue([v4 simConnection]);
          -[IDSMultiplexerConnection setConnection:](v16, "setConnection:", v51);

          LOBYTE(self) = -[IDSGroupSessionMultiplexer addNewConnectionToMultiplexerTransport:]( self,  "addNewConnectionToMultiplexerTransport:",  v16);
        }

        else
        {
          self = (IDSGroupSessionMultiplexer *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog Multiplexer]( &OBJC_CLASS___IDSFoundationLog,  "Multiplexer"));
          v12 = v75;
          if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_DEFAULT))
          {
            v61 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
            *(_DWORD *)buf = 138412290;
            v79 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)self,  OS_LOG_TYPE_DEFAULT,  "Could not allocate local port for client %@",  buf,  0xCu);
          }

          LOBYTE(self) = 0;
        }

        goto LABEL_47;
      }

      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___IDSMultiplexerConnection);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
      -[IDSMultiplexerConnection setClientUUID:](v16, "setClientUUID:", v52);

      -[IDSMultiplexerConnection setPath:](v16, "setPath:", v6);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
      -[IDSMultiplexerConnection setMultiplexerParams:](v16, "setMultiplexerParams:", v53);

      -[IDSMultiplexerConnection setParameters:](v16, "setParameters:", v8);
      -[IDSMultiplexerConnection setPid:](v16, "setPid:", v14);
      v54 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v77);
      -[IDSMultiplexerConnection setProcessUUID:](v16, "setProcessUUID:", v54);

      uint64_t data_mode = nw_parameters_get_data_mode(v8);
      if ((data_mode & 0xFFFFFFFE) == 2) {
        uint64_t data_mode = (uint64_t)-[IDSMultiplexerConnection setIsTCP:](v16, "setIsTCP:", 1LL);
      }
      v25 = (nw_protocol_definition *)nw_protocol_copy_quic_stream_definition(data_mode);
      uint64_t identifier = nw_protocol_definition_get_identifier();
      -[IDSMultiplexerConnection setLocalPort:](v16, "setLocalPort:", nw_endpoint_get_port(v11));
      -[IDSMultiplexerConnection setRemotePort:](v16, "setRemotePort:", nw_endpoint_get_port(v12));
      if (-[IDSMultiplexerConnection isQUIC](v16, "isQUIC"))
      {
        -[IDSMultiplexerConnection setLocalPort:]( v16,  "setLocalPort:",  -[IDSGroupSessionMultiplexer _getRandomPortForQUIC](self, "_getRandomPortForQUIC"));
        if (!-[IDSMultiplexerConnection localPort](v16, "localPort"))
        {
          self = (IDSGroupSessionMultiplexer *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog Multiplexer]( &OBJC_CLASS___IDSFoundationLog,  "Multiplexer"));
          if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_DEFAULT))
          {
            v70 = (IDSMultiplexerGroupConnection *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
            *(_DWORD *)buf = 138412290;
            v79 = v70;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)self,  OS_LOG_TYPE_DEFAULT,  "Could not allocate local port for client %@",  buf,  0xCu);
          }

          LOBYTE(self) = 0;
          goto LABEL_46;
        }

        v73 = v8;
        nw_endpoint_t v57 = sub_1000EEBF8(-[IDSMultiplexerConnection localPort](v16, "localPort"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        -[IDSMultiplexerConnection setLocalEndpoint:](v16, "setLocalEndpoint:", v58);

        -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v12);
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v60 = -[IDSMultiplexerConnection localPort](v16, "localPort");
          *(_DWORD *)buf = 67109120;
          LODWORD(v79) = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Assigning local port %d to new QUIC connection",  buf,  8u);
        }

        id v8 = v73;
      }

      else
      {
        v76 = v25;
        v62 = v12;
        v63 = (nw_endpoint *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
        nw_endpoint_type_t type = nw_endpoint_get_type(v63);

        if (type == nw_endpoint_type_host)
        {
          nw_endpoint_t v65 = sub_1000EEBF8(-[IDSMultiplexerConnection localPort](v16, "localPort"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
          -[IDSMultiplexerConnection setLocalEndpoint:](v16, "setLocalEndpoint:", v66);

          nw_endpoint_t v67 = sub_1000EEBF8(-[IDSMultiplexerConnection remotePort](v16, "remotePort"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v68);

          v12 = v62;
        }

        else
        {
          -[IDSMultiplexerConnection setLocalEndpoint:](v16, "setLocalEndpoint:", v11);
          v12 = v62;
          -[IDSMultiplexerConnection setRemoteEndpoint:](v16, "setRemoteEndpoint:", v62);
        }

        v25 = v76;
      }

      -[IDSMultiplexerConnection setPortsSignature:]( v16,  "setPortsSignature:",  -[IDSMultiplexerConnection remotePort](v16, "remotePort") | (-[IDSMultiplexerConnection localPort]( v16,  "localPort") << 16));
      LOBYTE(self) = -[IDSGroupSessionMultiplexer addNewConnectionToMultiplexerTransport:]( self,  "addNewConnectionToMultiplexerTransport:",  v16);
    }

- (BOOL)addNewConnectionToMultiplexerTransport:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v45 = self;
  connections = self->_connections;
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](connections, "setObject:forKeyedSubscript:", v4, v6);

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
    *(_DWORD *)buf = 138412546;
    id v56 = v4;
    __int16 v57 = 2112;
    v58 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Created connection %@ with params %@",  buf,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 salt]);

  if (v10)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v11 = self->_transports;
    id v47 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
    v12 = 0LL;
    if (v47)
    {
      uint64_t v46 = *(void *)v52;
      obj = v11;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v52 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionID]);
          __int16 v17 = v4;
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 salt]);
          uint64_t v20 = IDSIDAliasHashUUIDString(v14, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          unsigned int v22 = [v16 isEqualToString:v21];

          if (v22)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v45->_transports, "objectForKeyedSubscript:", v14));

            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
            id v4 = v17;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v17 multiplexerParams]);
              uint64_t v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v25 sessionID]);
              transports = v45->_transports;
              *(_DWORD *)buf = 138412802;
              id v56 = v14;
              __int16 v57 = 2112;
              v58 = v26;
              __int16 v59 = 2112;
              unsigned int v60 = transports;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found transport sessionID %@ for %@ in transports %@",  buf,  0x20u);
            }

            v12 = (void *)v23;
          }

          else
          {
            id v4 = v17;
          }
        }

        v11 = obj;
        id v47 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
      }

      while (v47);
    }
  }

  else
  {
    v28 = self->_transports;
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary sessionID](v11, "sessionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v29));
  }

  if (v12)
  {
    [v4 setTransport:v12];
    os_unfair_lock_unlock(lock);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
    id v31 = [v12 routeClientConnections:v30];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v33 = [v32 isInternalInstall];

    if (v33)
    {
      if ([v4 isQUIC])
      {
        uint64_t v34 = IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.ids",  @"MUXKillQUICConnectionTimer",  0LL);
        if (v34 >= 1)
        {
          uint64_t v35 = v34;
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_1000F3698;
          v48[3] = &unk_1008F8800;
          id v49 = v4;
          v50 = v45;
          IDSTransportThreadAddBlockAfter(v48, (double)v35);
        }
      }
    }

    if (![v4 invalidated])
    {
      BOOL v41 = 1;
      goto LABEL_32;
    }

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "INVALID", buf, 2u);
    }
  }

  else
  {
    __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v4 multiplexerParams]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sessionID]);
      v40 = v45->_transports;
      *(_DWORD *)buf = 138412546;
      id v56 = v39;
      __int16 v57 = 2112;
      v58 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Can't find transport for %@ in transports %@",  buf,  0x16u);
    }

    os_unfair_lock_unlock(lock);
  }

  BOOL v41 = 0;
LABEL_32:

  return v41;
}

- (BOOL)connectionCancel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](connections, "objectForKeyedSubscript:", v6));

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_connections;
    v15[0] = 138412546;
    *(void *)&v15[1] = v7;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "connectionCancel: found connection %@ in _connections %@",  (uint8_t *)v15,  0x16u);
  }

  if (v7)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 transport]);
    [v10 cancelClientConnection:v7];

    [v7 invalidate];
    v11 = self->_connections;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0LL, v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nexusInstanceUUID", 0, 0));
  [v13 getUUIDBytes:v15];

  os_unfair_lock_unlock(&self->_lock);
  return 1;
}

- (void)resetConnection:(id)a3
{
}

- (void)resetConnection:(id)a3 errorCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  memset(uu, 170, sizeof(uu));
  uuid_clear(uu);
  uint64_t v16 = 0LL;
  uint64_t v7 = (void *)nw_path_create_assign_message(&v16, uu, v4, 0LL, 0LL, 0LL, 0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      int v15 = "resetConnection: nw_path_create_assign_message failed";
      goto LABEL_9;
    }

- (BOOL)listenRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 path]);
  id v6 = (nw_path *)v5;
  if (v5)
  {
    uint64_t v7 = (nw_endpoint *)nw_path_copy_endpoint(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "client endpoint %@", &buf[0].sa_len, 0xCu);
      }

      if (nw_endpoint_get_type(v7) != nw_endpoint_type_host)
      {
        int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
          *(_DWORD *)&buf[0].sa_len = 138412290;
          *(void *)&buf[0].sa_data[2] = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "client endpoint type not 'host' for client %@",  &buf[0].sa_len,  0xCu);
        }

        goto LABEL_34;
      }

      int port = nw_endpoint_get_port(v7);
      v11 = nw_endpoint_copy_port_string(v7);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 67109378;
        *(_DWORD *)&buf[0].sa_data[2] = port;
        *(_WORD *)&buf[0].sa_data[6] = 2080;
        *(void *)&buf[0].sa_data[8] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "port %u portString %s",  &buf[0].sa_len,  0x12u);
      }

      free(v11);
    }

    else
    {
      if (v9)
      {
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "client does not have endpoint %@",  &buf[0].sa_len,  0xCu);
      }
    }

    int v15 = (os_log_s *)nw_path_copy_parameters(v6);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
      *(_DWORD *)&buf[0].sa_len = 138412546;
      *(void *)&buf[0].sa_data[2] = v17;
      *(_WORD *)&buf[0].sa_data[10] = 2112;
      *(void *)&buf[0].sa_data[12] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "listenRequest: clientUUID: %@ and params: %@",  &buf[0].sa_len,  0x16u);
    }

    nw_endpoint_t endpoint = nw_path_copy_effective_local_endpoint(v6);
    nw_endpoint_t v86 = nw_path_copy_effective_remote_endpoint(v6);
    uint64_t pid = nw_parameters_get_pid(v15);
    if (!(_DWORD)pid)
    {
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v4 clientUUID]);
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Client UUID %@ having pid 0 (root) is not supported",  &buf[0].sa_len,  0xCu);
      }

      goto LABEL_32;
    }

    uint64_t v19 = pid;
    v79 = v7;
    v101[0] = 0xAAAAAAAAAAAAAAAALL;
    v101[1] = 0xAAAAAAAAAAAAAAAALL;
    nw_parameters_get_proc_uuid(v15, v101);
    v100[0] = 0xAAAAAAAAAAAAAAAALL;
    v100[1] = 0xAAAAAAAAAAAAAAAALL;
    if (os_nexus_controller_alloc_provider_instance(self->_osNexusController, self->_osNexusUUID, v100))
    {
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_alloc_provider_instance failed",  &buf[0].sa_len,  2u);
      }

      goto LABEL_32;
    }

    memset(out, 170, sizeof(out));
    uuid_generate(out);
    osNexusController = self->_osNexusController;
    uint64_t v24 = getpid();
    if (os_nexus_controller_bind_provider_instance( osNexusController,  v100,  1LL,  v24,  0LL,  out,  16LL,  5LL))
    {
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        v25 = "os_nexus_controller_bind_provider_instance failed for server";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v25, &buf[0].sa_len, 2u);
        goto LABEL_32;
      }

      goto LABEL_32;
    }

    if (os_nexus_controller_bind_provider_instance( self->_osNexusController,  v100,  0LL,  v19,  v101,  out,  16LL,  7LL))
    {
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        v25 = "os_nexus_controller_bind_provider_instance failed for client";
        goto LABEL_31;
      }

- (BOOL)listenCancel:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end