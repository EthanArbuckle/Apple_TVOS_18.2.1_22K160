@interface IDSClientChannelManager
+ (id)sharedInstance;
- (BOOL)addClient:(id)a3;
- (BOOL)addClient:(id)a3 path:(id)a4 endpoint:(id)a5;
- (BOOL)connectProtocolHandlerForClient:(id)a3;
- (BOOL)connectTransportThreadForClient:(id)a3;
- (BOOL)registerClientChannelDestination:(id)a3 connectHandler:(id)a4;
- (BOOL)unregisterClientChannelDestination:(id)a3 clientUUID:(id)a4;
- (IDSClientChannelManager)init;
- (id)_getClientChannelconnectHandlerForDestination:(id)a3;
- (id)_getClientUUIDForDestination:(id)a3;
- (id)_getPendingClientUUIDForDestination:(id)a3;
- (id)initForTesting;
- (void)removeClient:(id)a3;
@end

@implementation IDSClientChannelManager

+ (id)sharedInstance
{
  if (qword_1009BE6F0 != -1) {
    dispatch_once(&qword_1009BE6F0, &stru_1008F7848);
  }
  return (id)qword_1009BE6F8;
}

- (IDSClientChannelManager)init
{
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___IDSClientChannelManager;
  v2 = -[IDSClientChannelManager init](&v59, "init");
  v3 = v2;
  if (!v2) {
    goto LABEL_45;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v4 = nw_nexus_create("IDSClientChannelNexus");
  nexus = v3->_nexus;
  v3->_nexus = (OS_nw_nexus *)v4;

  if (v3->_nexus)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientChannelRegistrations = v3->_clientChannelRegistrations;
    v3->_clientChannelRegistrations = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    destinationToRegisteredClientUUIDMapping = v3->_destinationToRegisteredClientUUIDMapping;
    v3->_destinationToRegisteredClientUUIDMapping = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientChannels = v3->_clientChannels;
    v3->_clientChannels = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingClientUUIDs = v3->_pendingClientUUIDs;
    v3->_pendingClientUUIDs = (NSMutableDictionary *)v12;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v3->_vifRef = (NEVirtualInterface_s *)NEVirtualInterfaceCreate(kCFAllocatorDefault, 1LL, v15, 0LL);

    if (v3->_vifRef)
    {
      v16 = (const void *)NEVirtualInterfaceCopyName();
      CFTypeRef v17 = CFAutorelease(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = os_nexus_controller_create();
      v3->_osNexusController = (nexus_controller *)v19;
      if (!v19)
      {
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "os_nexus_controller_create failed";
          goto LABEL_18;
        }

- (id)initForTesting
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSClientChannelManager;
  v2 = -[IDSClientChannelManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientChannelRegistrations = v3->_clientChannelRegistrations;
    v3->_clientChannelRegistrations = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    destinationToRegisteredClientUUIDMapping = v3->_destinationToRegisteredClientUUIDMapping;
    v3->_destinationToRegisteredClientUUIDMapping = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clientChannels = v3->_clientChannels;
    v3->_clientChannels = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingClientUUIDs = v3->_pendingClientUUIDs;
    v3->_pendingClientUUIDs = (NSMutableDictionary *)v10;
  }

  return v3;
}

- (BOOL)connectTransportThreadForClient:(id)a3
{
  uint64_t v4 = (char *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memset(src, 170, sizeof(src));
  if (!os_nexus_controller_alloc_provider_instance(self->_osNexusController, self->_osNexusUUID, src))
  {
    memset(buf, 170, 16);
    uuid_generate(buf);
    osNexusController = self->_osNexusController;
    uint64_t v8 = getpid();
    if (os_nexus_controller_bind_provider_instance(osNexusController, src, 1LL, v8, 0LL, buf, 16LL, 5LL))
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_bind_provider_instance failed for server",  v41,  2u);
      }

      goto LABEL_9;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) parameters]);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processUUID]);

    memset(v41, 170, sizeof(v41));
    [v13 getUUIDBytes:v41];
    v14 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) parameters]);
    id v15 = [v14 pid];

    if (os_nexus_controller_bind_provider_instance( self->_osNexusController,  src,  0LL,  v15,  v41,  buf,  16LL,  7LL))
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_bind_provider_instance failed for client",  v40,  2u);
      }

      BOOL v10 = 0;
      v4[9] = 1;
      goto LABEL_36;
    }

    CFTypeRef v17 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) parameters]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 account]);

    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v18));
      [v19 scanUnsignedLongLong:v4 + 144];
    }

    uuid_copy((unsigned __int8 *)v4 + 32, src);
    uint64_t v20 = os_channel_attr_create();
    *((void *)v4 + 12) = v20;
    if (v20)
    {
      os_channel_attr_set_key(v20, buf, 16LL);
      os_channel_attr_set(*((void *)v4 + 12), 7LL, 1LL);
      uint64_t extended = os_channel_create_extended(src, 1LL, 0LL, 0xFFFFFFFFLL, *((void *)v4 + 12));
      *((void *)v4 + 11) = extended;
      if (extended)
      {
        uint64_t fd = os_channel_get_fd(extended, v22);
        uint64_t v24 = os_channel_ring_id(*((void *)v4 + 11), 2LL);
        uint64_t v25 = os_channel_rx_ring(*((void *)v4 + 11), v24);
        uint64_t v26 = os_channel_ring_id(*((void *)v4 + 11), 0LL);
        *((void *)v4 + 13) = os_channel_tx_ring(*((void *)v4 + 11), v26);
        *(void *)v40 = 0LL;
        assign_message = (void *)nw_path_create_assign_message(v40, src, 0LL, buf, 16LL, 0LL, 0LL);
        if (assign_message)
        {
          registration = self->_registration;
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  assign_message,  *(void *)v40));
          LOBYTE(registration) = -[NWNetworkAgentRegistration assignNexusData:toClient:]( registration,  "assignNexusData:toClient:",  v29,  *((void *)v4 + 2));

          free(assign_message);
          if ((registration & 1) != 0)
          {
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_1000434A0;
            v35[3] = &unk_1008F78B0;
            int v36 = v4;
            uint64_t v37 = v25;
            int v38 = fd;
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472LL;
            v32[2] = sub_100043C48;
            v32[3] = &unk_1008F78D8;
            v33 = v36;
            int v34 = fd;
            IDSTransportThreadAddSocket(fd, v35, v32);

            BOOL v10 = 1;
LABEL_35:

LABEL_36:
            goto LABEL_10;
          }

          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v39 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "assignNexusData:toClient: failed",  v39,  2u);
          }
        }

        else
        {
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v39 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "nw_path_create_assign_message failed",  v39,  2u);
          }
        }

LABEL_34:
        BOOL v10 = 0;
        v4[9] = 1;
        goto LABEL_35;
      }

      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "os_channel_create_extended failed",  v40,  2u);
      }
    }

    else
    {
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "connectTransportThreadForClient: os_channel_attr_create failed",  v40,  2u);
      }
    }

    goto LABEL_34;
  }

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "os_nexus_controller_alloc_provider_instance failed",  buf,  2u);
  }

LABEL_9:
  BOOL v10 = 0;
  v4[9] = 1;
LABEL_10:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BOOL)connectProtocolHandlerForClient:(id)a3
{
  uint64_t v4 = (char *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (unsigned __int8 *)calloc(1uLL, 0x40uLL);
  *((void *)v6 + 2) = &unk_1009BE700;
  *((void *)v6 + 3) = &unk_1009BE728;
  uuid_copy(v6, (const unsigned __int8 *)v4 + 112);
  *((void *)v6 + 5) = v4;
  uint64_t channel_to_new_instance = nw_nexus_create_channel_to_new_instance(self->_nexus);
  uint64_t v8 = (void *)channel_to_new_instance;
  if (channel_to_new_instance)
  {
    uint64_t v28 = 0LL;
    memset(uu, 170, sizeof(uu));
    if ((nw_channel_get_nexus_instance(channel_to_new_instance, uu, (char *)&v28 + 4) & 1) == 0)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "nw_channel_get_nexus_instance failed",  buf,  2u);
      }

      BOOL v16 = 0;
      goto LABEL_29;
    }

    uint64_t key = nw_channel_get_key(v8, &v28);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) parameters]);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 processUUID]);

    int v27 = -1431655766;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) parameters]);
    unsigned int v13 = [v12 pid];

    int v27 = v13;
    if (v11)
    {
      memset(buf, 170, 16);
      -[os_log_s getUUIDBytes:](v11, "getUUIDBytes:", buf);
      char v14 = nw_nexus_bind_client_port(self->_nexus, uu, buf, &v27, key, v28);
    }

    else
    {
      char v14 = nw_nexus_bind_client_port(self->_nexus, uu, 0LL, &v27, key, v28);
    }

    if ((v14 & 1) == 0)
    {
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v27;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "nw_nexus_bind_client_port failed for pid %d processUUID %@",  buf,  0x12u);
      }

      BOOL v16 = 0;
      goto LABEL_28;
    }

    *(void *)&buf[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    uuid_unparse(uu, buf);
    v18 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uu);
    uint64_t protocol_handler = nw_channel_get_protocol_handler(v8);
    (**(void (***)(void))(protocol_handler + 24))();
    uint64_t v26 = 0LL;
    uint64_t v20 = (void *)nw_path_create_assign_message(&v26, uu, 0LL, key, v28, 0LL, 0LL);
    if (v20)
    {
      registration = self->_registration;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v20, v26));
      LOBYTE(registration) = -[NWNetworkAgentRegistration assignNexusData:toClient:]( registration,  "assignNexusData:toClient:",  v22,  *((void *)v4 + 2));

      free(v20);
      if ((registration & 1) != 0)
      {
        -[os_log_s getUUIDBytes:](v18, "getUUIDBytes:", v4 + 32);
        objc_storeStrong((id *)v4 + 8, v8);
        *((void *)v4 + 10) = v6;
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 134218242;
          id v30 = v4;
          __int16 v31 = 2080;
          v32 = buf;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Connected to protocol handler channel object %p for nexus instance [%s]",  v29,  0x16u);
        }

        BOOL v16 = 1;
        goto LABEL_27;
      }

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        uint64_t v24 = "assignNexusData:toClient: failed";
        goto LABEL_25;
      }
    }

    else
    {
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        uint64_t v24 = "nw_path_create_assign_message failed";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, v29, 2u);
      }
    }

    BOOL v16 = 0;
LABEL_27:

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "nw_nexus_create_channel_to_new_instance failed",  buf,  2u);
  }

  BOOL v16 = 0;
LABEL_30:

  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (BOOL)addClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v4));
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
    BOOL v8 = -[IDSClientChannelManager addClient:path:endpoint:](self, "addClient:path:endpoint:", v4, v6, v7);
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to get path for client UUID %@",  (uint8_t *)&v11,  0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)addClient:(id)a3 path:(id)a4 endpoint:(id)a5
{
  v9 = (IDSClientChannel *)a3;
  id v10 = a4;
  v32 = (IDSClientChannel *)a5;
  os_unfair_lock_lock(&self->_lock);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 parameters]);
  LODWORD(a5) = [v11 pid];
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 processUUID]);
  int v29 = (int)a5;
  __int16 v31 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue(-[IDSClientChannel hostname](v32, "hostname"));
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue([v10 endpoint]);
    char v14 = (void *)objc_claimAutoreleasedReturnValue([v10 parameters]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSClientChannel port](v32, "port"));
    *(_DWORD *)buf = 138413314;
    int v34 = v9;
    __int16 v35 = 2112;
    int v36 = v13;
    __int16 v37 = 2112;
    *(void *)int v38 = v14;
    *(_WORD *)&v38[8] = 2112;
    *(void *)&v38[10] = v10;
    *(_WORD *)&v38[18] = 1024;
    *(_DWORD *)&v38[20] = [v15 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client UUID %@ requested nexus\n\t%@\n\t%@\n\t%@, endpoint port: %d",  buf,  0x30u);
  }

  BOOL v16 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannels,  "objectForKeyedSubscript:",  v9));
  if (v16)
  {
    __int128 v17 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      int v34 = v16;
      __int16 v35 = 2112;
      int v36 = v9;
      __int16 v37 = 2112;
      *(void *)int v38 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "We already created the clientChannel %p for the client %@. (IDSClientChannel %@)",  buf,  0x20u);
    }
  }

  else
  {
    __int128 v17 = -[IDSClientChannel initWithDestination:]( objc_alloc(&OBJC_CLASS___IDSClientChannel),  "initWithDestination:",  v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[IDSClientChannel setCachedDataForClient:](v17, "setCachedDataForClient:", v18);

    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v17->_path, a4);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSClientChannel port](v32, "port"));
    v17->_hasMetadata = (int)[v19 intValue] > 0;

    v17->_transportType = [v11 dataMode] == (id)2;
    -[NSUUID getUUIDBytes:](v17->_uuid, "getUUIDBytes:", v17->_flowID);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientChannels, "setObject:forKeyedSubscript:", v17, v9);
    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannelRegistrations,  "objectForKeyedSubscript:",  v31));
    uint64_t v21 = (void *)v20;
    if (v20)
    {
      (*(void (**)(uint64_t, IDSClientChannel *, IDSClientChannel *))(v20 + 16))(v20, v31, v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_destinationToRegisteredClientUUIDMapping,  "setObject:forKeyedSubscript:",  v9,  v31);
      unsigned int v22 = -[NSMutableDictionary count](self->_clientChannels, "count");
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        int v34 = v17;
        __int16 v35 = 2112;
        int v36 = v31;
        __int16 v37 = 2112;
        *(void *)int v38 = v32;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v29;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v30;
        __int16 v39 = 1024;
        unsigned int v40 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Created channel object %p for destination %@ endpoint [%@] pid %d processUUID %@. Active clients: %u",  buf,  0x36u);
      }

      if (v22 >= 0x1E)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
        unsigned int v25 = [v24 isInternalInstall];

        if (v25)
        {
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v34) = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Too many active clients (%u). Aborting.",  buf,  8u);
          }

          throwsIDSAbortException();
        }
      }
    }

    else
    {
      int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannelManager]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannelManager"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        int v34 = v31;
        __int16 v35 = 2112;
        int v36 = v32;
        __int16 v37 = 1024;
        *(_DWORD *)int v38 = v29;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Failed finding connectHandler for destination %@ endpoint [%@] pid %d processUUID %@",  buf,  0x26u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingClientUUIDs,  "setObject:forKeyedSubscript:",  v9,  v31);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  return 1;
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannels,  "objectForKeyedSubscript:",  v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientChannels, "setObject:forKeyedSubscript:", 0LL, v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 destination]);
    BOOL v8 = (void *)v6;
    if (!v6)
    {
LABEL_11:

      goto LABEL_12;
    }

    uint64_t v9 = im_primary_queue(v6, v7);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100044AF4;
    block[3] = &unk_1008F5F80;
    id v25 = v8;
    id v11 = v4;
    id v26 = v11;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync(v10, v12);

    [v5 invalidate];
    if (v5[11])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100044B38;
      v20[3] = &unk_1008F7900;
      uint64_t v21 = v5;
      unsigned int v22 = self;
      id v23 = v11;
      IDSTransportThreadAddSyncBlock(v20);

      unsigned int v13 = (void (**)(void, void, void, void, void, void))v21;
    }

    else
    {
      uint64_t v14 = v5[8];
      if (!v14)
      {
LABEL_10:

        goto LABEL_11;
      }

      uint64_t v15 = v5[10];
      if (v15)
      {
        (*(void (**)(void))(*(void *)(*(void *)(v15 + 32) + 24LL) + 8LL))();
        uint64_t v14 = v5[8];
      }

      nw_channel_close(v14);
      BOOL v16 = (void *)v5[8];
      v5[8] = 0LL;

      unsigned int v13 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue([v5 readHandler]);
      __int128 v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"client %@ closed connection",  v11);
      v18 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v17,  NSLocalizedDescriptionKey,  0LL);
      uint64_t v19 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"ClientChannel",  9001LL,  v18);
      ((void (**)(void, void, void, void, void, NSError *))v13)[2](v13, 0LL, 0LL, 0LL, 0LL, v19);
    }

    goto LABEL_10;
  }

- (BOOL)registerClientChannelDestination:(id)a3 connectHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [v7 copy];
  id v9 = objc_retainBlock(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_clientChannelRegistrations,  "setObject:forKeyedSubscript:",  v9,  v6);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingClientUUIDs,  "objectForKeyedSubscript:",  v6));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_retainBlock(v8);
    clientChannelRegistrations = self->_clientChannelRegistrations;
    clientChannels = self->_clientChannels;
    int v17 = 138413058;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v12;
    __int16 v21 = 2112;
    unsigned int v22 = clientChannelRegistrations;
    __int16 v23 = 2112;
    uint64_t v24 = clientChannels;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "registerClientChannelDestination %@ handler %p all handlers [%@] channels [%@]",  (uint8_t *)&v17,  0x2Au);
  }

  if (v10)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannels,  "objectForKeyedSubscript:",  v10));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_destinationToRegisteredClientUUIDMapping,  "setObject:forKeyedSubscript:",  v10,  v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingClientUUIDs,  "setObject:forKeyedSubscript:",  0LL,  v6);
    if (v15) {
      (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v15);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  return 1;
}

- (BOOL)unregisterClientChannelDestination:(id)a3 clientUUID:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_destinationToRegisteredClientUUIDMapping,  "objectForKeyedSubscript:",  v6));
  if (([(id)v7 isEqual:v9] & 1) == 0 && v7 | v9)
  {
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      unint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "skipping unregisterClientChannelDestination; clientUUID %@ does not match storedClientUUID %@ for destination %@",
        (uint8_t *)&v18,
        0x20u);
    }

    BOOL v15 = 0;
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannelManager](&OBJC_CLASS___IDSFoundationLog, "ClientChannelManager"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannelRegistrations,  "objectForKeyedSubscript:",  v6));
      id v12 = objc_retainBlock(v11);
      clientChannelRegistrations = self->_clientChannelRegistrations;
      clientChannels = self->_clientChannels;
      int v18 = 138413314;
      unint64_t v19 = (unint64_t)v6;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = clientChannelRegistrations;
      __int16 v26 = 2112;
      int v27 = clientChannels;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "unregisterClientChannelDestination %@ clientUUID %@ handler %p all handlers [%@] channels [%@]",  (uint8_t *)&v18,  0x34u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_clientChannelRegistrations,  "setObject:forKeyedSubscript:",  0LL,  v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingClientUUIDs,  "setObject:forKeyedSubscript:",  0LL,  v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_destinationToRegisteredClientUUIDMapping,  "setObject:forKeyedSubscript:",  0LL,  v6);
    BOOL v15 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)_getClientUUIDForDestination:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_destinationToRegisteredClientUUIDMapping,  "objectForKeyedSubscript:",  a3);
}

- (id)_getPendingClientUUIDForDestination:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingClientUUIDs, "objectForKeyedSubscript:", a3);
}

- (id)_getClientChannelconnectHandlerForDestination:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientChannelRegistrations,  "objectForKeyedSubscript:",  a3));
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void).cxx_destruct
{
}

@end