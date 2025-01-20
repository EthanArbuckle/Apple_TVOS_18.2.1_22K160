@interface NWRemotePacketProxy
- (BOOL)receiveRemotePacket:(id)a3;
- (NSMutableArray)writeRequests;
- (NWRemotePacketProxy)initWithDelegate:(id)a3;
- (NWRemotePacketProxyDelegate)delegate;
- (nw_hash_table)packetHashTable;
- (nw_protocol)defaultOutputHandler;
- (nw_protocol)outputHandlerForPacket:(id)a3 inbound:(BOOL)a4;
- (nw_protocol)packetProtocol;
- (unsigned)receiveWindowPacketCount;
- (void)dealloc;
- (void)setDefaultOutputHandler:(nw_protocol *)a3;
- (void)setDelegate:(id)a3;
- (void)setOutputProtocolHandler:(nw_protocol *)a3 local:(id)a4 remote:(id)a5 ipProtocol:(unsigned __int8)a6;
- (void)setPacketHashTable:(nw_hash_table *)a3;
- (void)setPacketProtocol:(nw_protocol *)a3;
- (void)setReceiveWindowPacketCount:(unsigned int)a3;
- (void)setWriteRequests:(id)a3;
@end

@implementation NWRemotePacketProxy

- (NWRemotePacketProxy)initWithDelegate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v11, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate";
      }

      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v16 = type;
        BOOL v34 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWRemotePacketProxy initWithDelegate:]";
            __int16 v42 = 2082;
            uint64_t v43 = (uint64_t)backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v16,  "%{public}s called with null delegate, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          if (!v11) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }

        if (!v34) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate, no backtrace";
      }

      else
      {
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }

      goto LABEL_35;
    }

    goto LABEL_39;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NWRemotePacketProxy;
  v5 = -[NWRemotePacketProxy init](&v37, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v32 = "%{public}s [super init] failed";
LABEL_73:
        _os_log_impl(&dword_181A5C000, v30, v31, v32, buf, 0xCu);
      }
    }

    else
    {
      if (v38)
      {
        v35 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v31 = type;
        BOOL v36 = os_log_type_enabled(v30, type);
        if (v35)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWRemotePacketProxy initWithDelegate:]";
            __int16 v42 = 2082;
            uint64_t v43 = (uint64_t)v35;
            _os_log_impl( &dword_181A5C000,  v30,  v31,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v35);
          goto LABEL_75;
        }

        if (!v36) {
          goto LABEL_74;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }

      __nwlog_obj();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v32 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_73;
      }
    }

- (void)dealloc
{
  if (-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"))
  {
    free(-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"));
    -[NWRemotePacketProxy setPacketProtocol:](self, "setPacketProtocol:", 0LL);
  }

  if (-[NWRemotePacketProxy packetHashTable](self, "packetHashTable")
    && -[NWRemotePacketProxy packetHashTable](self, "packetHashTable"))
  {
    v3 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
    _nw_hash_table_release((os_unfair_lock_s *)v3, v4);
    -[NWRemotePacketProxy setPacketHashTable:](self, "setPacketHashTable:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWRemotePacketProxy;
  -[NWRemotePacketProxy dealloc](&v5, sel_dealloc);
}

- (void)setReceiveWindowPacketCount:(unsigned int)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  unsigned int receiveWindowPacketCount = v4->_receiveWindowPacketCount;
  v4->_unsigned int receiveWindowPacketCount = a3;
  objc_sync_exit(v4);

  if (a3)
  {
    if (!receiveWindowPacketCount)
    {
      nw_remote_packet_input_available( (uint64_t)-[NWRemotePacketProxy packetProtocol](v4, "packetProtocol"),  (uint64_t)-[NWRemotePacketProxy defaultOutputHandler](v4, "defaultOutputHandler"));
      v6 = -[NWRemotePacketProxy packetHashTable](v4, "packetHashTable");
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke;
      v7[3] = &unk_189BC86F0;
      v7[4] = v4;
      nw_hash_table_apply(v6, (uint64_t)v7);
    }
  }

- (nw_protocol)outputHandlerForPacket:(id)a3 inbound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
  *(_OWORD *)&v24[8] = 0u;
  unint64_t v9 = objc_msgSend(v6, "length", 0, 0, 0, 0, 0, 0, 0, *(void *)&v24[20]);
  uint64_t v10 = [v6 bytes];
  if (!v10 || !v9) {
    goto LABEL_35;
  }
  int v11 = *(_BYTE *)v10 & 0xF0;
  if (v11 == 96)
  {
    __int16 v21 = 7708;
    *(_WORD *)v20 = 7708;
    if (v9 <= 0x27) {
      goto LABEL_35;
    }
    if (v4)
    {
      *(_OWORD *)&v20[8] = *(_OWORD *)(v10 + 24);
      os_log_type_t v16 = (_OWORD *)(v10 + 8);
    }

    else
    {
      *(_OWORD *)&v20[8] = *(_OWORD *)(v10 + 8);
      os_log_type_t v16 = (_OWORD *)(v10 + 24);
    }

    *(_OWORD *)os_log_type_t v24 = *v16;
    v24[20] = *(_BYTE *)(v10 + 6);
    if (v24[20] == 17)
    {
      if (v9 <= 0x2F) {
        goto LABEL_35;
      }
      if (v4) {
        goto LABEL_25;
      }
    }

    else
    {
      if (v24[20] != 6) {
        goto LABEL_33;
      }
      if (v9 <= 0x3B) {
        goto LABEL_35;
      }
      if (v4)
      {
LABEL_25:
        *(_WORD *)&v20[2] = *(_WORD *)(v10 + 42);
        __int16 v15 = *(_WORD *)(v10 + 40);
        goto LABEL_32;
      }
    }

    *(_WORD *)&v20[2] = *(_WORD *)(v10 + 40);
    __int16 v15 = *(_WORD *)(v10 + 42);
    goto LABEL_32;
  }

  if (v11 != 64) {
    goto LABEL_35;
  }
  __int16 v21 = 528;
  *(_WORD *)v20 = 528;
  if (v9 <= 0x13) {
    goto LABEL_35;
  }
  uint64_t v12 = 12LL;
  if (v4) {
    uint64_t v13 = 16LL;
  }
  else {
    uint64_t v13 = 12LL;
  }
  if (!v4) {
    uint64_t v12 = 16LL;
  }
  int v14 = *(_DWORD *)(v10 + v12);
  *(_DWORD *)&v20[4] = *(_DWORD *)(v10 + v13);
  int v23 = v14;
  v24[20] = *(_BYTE *)(v10 + 9);
  if (v24[20] == 17)
  {
    if (v9 > 0x1B)
    {
      if (v4) {
        goto LABEL_16;
      }
LABEL_28:
      *(_WORD *)&v20[2] = *(_WORD *)(v10 + 20);
      __int16 v15 = *(_WORD *)(v10 + 22);
      goto LABEL_32;
    }

- (void)setOutputProtocolHandler:(nw_protocol *)a3 local:(id)a4 remote:(id)a5 ipProtocol:(unsigned __int8)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = calloc(1uLL, 0x3CuLL);
  if (v12)
  {
    uint64_t v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 address]) {
      __memcpy_chk();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 address]) {
      __memcpy_chk();
    }
    v13[56] = a6;
    int v14 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
    BOOL node = nw_hash_table_get_node((uint64_t)v14, (uint64_t)v13, 60LL);
    uint64_t v16 = node;
    if (!a3)
    {
      if (node) {
        nw_hash_table_remove_node((uint64_t)v14, node);
      }
      goto LABEL_30;
    }

    if (node || (uint64_t v16 = nw_hash_table_add_object((uint64_t)v14, (uint64_t)v13, 0LL)) != 0)
    {
      *(void *)(v16 + 32) = a3;
LABEL_30:
      free(v13);
      goto LABEL_31;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v26 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    BOOL v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
    v27 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault((const char *)v27, &type, &v33))
    {
LABEL_49:
      if (v27) {
        free(v27);
      }
      goto LABEL_30;
    }

    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (os_log_s *)(id)gLogObj;
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed";
LABEL_47:
        _os_log_impl(&dword_181A5C000, v28, v29, v30, buf, 0xCu);
      }
    }

    else
    {
      if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v29 = type;
        BOOL v32 = os_log_type_enabled(v28, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
            __int16 v37 = 2082;
            uint64_t v38 = (uint64_t)backtrace_string;
            _os_log_impl( &dword_181A5C000,  v28,  v29,  "%{public}s nw_hash_table_add_object failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }

        if (!v32) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, no backtrace";
        goto LABEL_47;
      }

      __nwlog_obj();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, backtrace limit exceeded";
        goto LABEL_47;
      }
    }

- (BOOL)receiveRemotePacket:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    id v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v23 = 0;
    if (__nwlog_fault(v16, &type, &v23))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          id v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_181A5C000, v17, v18, "%{public}s called with null packet", buf, 0xCu);
        }
      }

      else if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = type;
        BOOL v21 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            id v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
            __int16 v27 = 2082;
            v28 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v17,  v20,  "%{public}s called with null packet, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }

        if (v21)
        {
          *(_DWORD *)buf = 136446210;
          id v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_181A5C000, v17, v20, "%{public}s called with null packet, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          id v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl( &dword_181A5C000,  v17,  v22,  "%{public}s called with null packet, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (unsigned)receiveWindowPacketCount
{
  return self->_receiveWindowPacketCount;
}

- (NWRemotePacketProxyDelegate)delegate
{
  return (NWRemotePacketProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setWriteRequests:(id)a3
{
}

- (nw_protocol)packetProtocol
{
  return self->_packetProtocol;
}

- (void)setPacketProtocol:(nw_protocol *)a3
{
  self->_packetProtocol = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_hash_table)packetHashTable
{
  return self->_packetHashTable;
}

- (void)setPacketHashTable:(nw_hash_table *)a3
{
  self->_packetHashTable = a3;
}

- (void).cxx_destruct
{
}

uint64_t __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke(uint64_t a1, uint64_t a2)
{
  extra = (uint64_t *)nw_hash_node_get_extra(a2);
  nw_remote_packet_input_available([*(id *)(a1 + 32) packetProtocol], *extra);
  return 1LL;
}

double __40__NWRemotePacketProxy_initWithDelegate___block_invoke()
{
  initWithDelegate__NWRemotePacketProtocolIdentifier = 0u;
  unk_18C5A3180 = 0u;
  *(void *)&double result = 0x100000004LL;
  qword_18C5A3190 = 0x100000004LL;
  initWithDelegate__NWRemotePacketProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  unk_18C5A31A0 = nw_protocol_default_remove_input_handler;
  qword_18C5A31E8 = (uint64_t)nw_protocol_default_get_input_frames;
  unk_18C5A31F0 = nw_protocol_default_get_output_frames;
  qword_18C5A31F8 = (uint64_t)nw_protocol_default_finalize_output_frames;
  unk_18C5A3200 = nw_protocol_default_link_state;
  qword_18C5A3218 = (uint64_t)nw_protocol_default_get_local;
  unk_18C5A3220 = nw_protocol_default_get_remote;
  qword_18C5A3208 = (uint64_t)nw_protocol_default_get_parameters;
  unk_18C5A3210 = nw_protocol_default_get_path;
  qword_18C5A3258 = (uint64_t)nw_protocol_default_output_finished;
  unk_18C5A3260 = nw_protocol_default_get_output_local;
  qword_18C5A31A8 = (uint64_t)nw_protocol_default_replace_input_handler;
  unk_18C5A31B0 = nw_protocol_default_connect;
  qword_18C5A31B8 = (uint64_t)nw_protocol_default_disconnect;
  unk_18C5A31C0 = nw_protocol_default_connected;
  qword_18C5A31C8 = (uint64_t)nw_protocol_default_disconnected;
  unk_18C5A31D0 = nw_protocol_default_error;
  qword_18C5A3298 = (uint64_t)nw_protocol_default_reset;
  unk_18C5A32A0 = nw_protocol_default_input_flush;
  qword_18C5A3248 = (uint64_t)nw_protocol_default_supports_external_data;
  unk_18C5A3250 = nw_protocol_default_input_finished;
  qword_18C5A3268 = (uint64_t)nw_protocol_default_get_output_interface;
  unk_18C5A3270 = nw_protocol_default_waiting_for_output;
  qword_18C5A3228 = (uint64_t)nw_protocol_default_register_notification;
  unk_18C5A3230 = nw_protocol_default_unregister_notification;
  qword_18C5A3238 = (uint64_t)nw_protocol_default_notify;
  unk_18C5A3240 = nw_protocol_default_updated_path;
  qword_18C5A3278 = (uint64_t)nw_protocol_default_copy_info;
  unk_18C5A3280 = nw_protocol_default_add_listen_handler;
  qword_18C5A3288 = (uint64_t)nw_protocol_default_remove_listen_handler;
  unk_18C5A3290 = nw_protocol_default_get_message_properties;
  qword_18C5A31D8 = (uint64_t)nw_remote_packet_input_available;
  unk_18C5A31E0 = nw_remote_packet_output_available;
  return result;
}

@end