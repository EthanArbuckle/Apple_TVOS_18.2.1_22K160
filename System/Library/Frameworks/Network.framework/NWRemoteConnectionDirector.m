@interface NWRemoteConnectionDirector
- (BOOL)receiveRemoteReply:(id)a3;
- (NSMutableArray)writeRequests;
- (NWRemoteConnectionDirector)initWithDelegate:(id)a3;
- (NWRemoteConnectionDirectorDelegate)delegate;
- (id)createCloseConnectionMessageForClientID:(id)a3;
- (id)createOpenConnectionMessageForClientID:(id)a3 endpoint:(id)a4 parameters:(id)a5;
- (id)createSendDataMessageForClientID:(id)a3 data:(id)a4 receiveWindow:(unsigned int)a5;
- (id)createStartBrowseMessageForClientID:(id)a3 descriptor:(id)a4 parameters:(id)a5;
- (id)createStopBrowseMessageForClientID:(id)a3;
- (nw_hash_table)protocolHashTable;
- (nw_protocol)defaultOutputHandler;
- (nw_protocol)directorProtocol;
- (nw_protocol)outputHandlerForFlowID:(id)a3;
- (unint64_t)dataModeForFlowID:(id)a3;
- (unint64_t)maximumDataChunkSize;
- (void)dealloc;
- (void)receiveData:(id)a3 forClient:(id)a4;
- (void)setDefaultOutputHandler:(nw_protocol *)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectorProtocol:(nw_protocol *)a3;
- (void)setMaximumDataChunkSize:(unint64_t)a3;
- (void)setOutputProtocolHandler:(nw_protocol *)a3 forFlowID:(id)a4 dataMode:(unint64_t)a5;
- (void)setProtocolHashTable:(nw_hash_table *)a3;
- (void)setWriteRequests:(id)a3;
@end

@implementation NWRemoteConnectionDirector

- (NWRemoteConnectionDirector)initWithDelegate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }

      goto LABEL_35;
    }

    goto LABEL_39;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NWRemoteConnectionDirector;
  v5 = -[NWRemoteConnectionDirector init](&v37, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }

      __nwlog_obj();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v32 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_73;
      }
    }

- (void)dealloc
{
  if (-[NWRemoteConnectionDirector directorProtocol](self, "directorProtocol"))
  {
    free(-[NWRemoteConnectionDirector directorProtocol](self, "directorProtocol"));
    -[NWRemoteConnectionDirector setDirectorProtocol:](self, "setDirectorProtocol:", 0LL);
  }

  if (-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable")
    && -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"))
  {
    v3 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
    _nw_hash_table_release((os_unfair_lock_s *)v3, v4);
    -[NWRemoteConnectionDirector setProtocolHashTable:](self, "setProtocolHashTable:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWRemoteConnectionDirector;
  -[NWRemoteConnectionDirector dealloc](&v5, sel_dealloc);
}

- (id)createOpenConnectionMessageForClientID:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    __nwlog_obj();
    os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    BOOL v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      uint32_t v25 = "%{public}s called with null clientID";
LABEL_48:
      _os_log_impl(&dword_181A5C000, v23, v24, v25, buf, 0xCu);
      goto LABEL_49;
    }

    if (!v33)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        uint32_t v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v24 = type;
    BOOL v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        uint32_t v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    if (!v29) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136446466;
    BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v37 = 2082;
    char v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_34:
    _os_log_impl(&dword_181A5C000, v23, v24, v30, buf, 0x16u);
LABEL_35:

    free(backtrace_string);
    goto LABEL_50;
  }

  if (!v8)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    BOOL v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      uint32_t v25 = "%{public}s called with null endpoint";
      goto LABEL_48;
    }

    if (!v33)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        uint32_t v25 = "%{public}s called with null endpoint, backtrace limit exceeded";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v24 = type;
    BOOL v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        uint32_t v25 = "%{public}s called with null endpoint, no backtrace";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    if (!v31) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136446466;
    BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v37 = 2082;
    char v38 = backtrace_string;
    v30 = "%{public}s called with null endpoint, dumping backtrace:%{public}s";
    goto LABEL_34;
  }

  if (v9)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NWPBOpenConnection);
    [v7 UUIDString];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      v14 = (void *)[v8 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_endpoint, v14);

      id v15 = (void *)[v10 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_parameters, v15);
    }

    else
    {

      id v15 = (void *)[v10 createProtocolBufferObject];
    }

    os_log_type_t v16 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(_BYTE *)&v16->_has |= 1u;
      v16->_command = 1;
      -[PBCodable data](v11, "data");
      os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v18);
    }

    else
    {
      -[PBCodable data](v11, "data");
      os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [p_isa data];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  __nwlog_obj();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
  BOOL v22 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        uint32_t v25 = "%{public}s called with null parameters";
        goto LABEL_48;
      }

- (id)createCloseConnectionMessageForClientID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NWPBCloseConnection);
    [v3 UUIDString];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      objc_storeStrong((id *)&v4->_clientUUID, v5);
    }

    v6 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(_BYTE *)&v6->_has |= 1u;
      v6->_command = 3;
      -[PBCodable data](v4, "data");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v8);
    }

    else
    {
      -[PBCodable data](v4, "data");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [p_isa data];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        id v15 = "%{public}s called with null clientID";
LABEL_21:
        _os_log_impl(&dword_181A5C000, v13, v14, v15, buf, 0xCu);
      }
    }

    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
            __int16 v22 = 2082;
            v23 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v13,  v14,  "%{public}s called with null clientID, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }

        if (!v17) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        id v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_21;
      }

      __nwlog_obj();
      os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        id v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_21;
      }
    }

- (id)createStartBrowseMessageForClientID:(id)a3 descriptor:(id)a4 parameters:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v7)
  {
    __nwlog_obj();
    os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      uint32_t v25 = "%{public}s called with null clientID";
LABEL_48:
      _os_log_impl(&dword_181A5C000, v23, v24, v25, buf, 0xCu);
      goto LABEL_49;
    }

    if (!v33)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        uint32_t v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v24 = type;
    BOOL v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        uint32_t v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    if (!v29) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136446466;
    BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v37 = 2082;
    char v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_34:
    _os_log_impl(&dword_181A5C000, v23, v24, v30, buf, 0x16u);
LABEL_35:

    free(backtrace_string);
    goto LABEL_50;
  }

  if (!v8)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      uint32_t v25 = "%{public}s called with null descriptor";
      goto LABEL_48;
    }

    if (!v33)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        uint32_t v25 = "%{public}s called with null descriptor, backtrace limit exceeded";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v24 = type;
    BOOL v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        uint32_t v25 = "%{public}s called with null descriptor, no backtrace";
        goto LABEL_48;
      }

      goto LABEL_49;
    }

    if (!v31) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136446466;
    BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v37 = 2082;
    char v38 = backtrace_string;
    v30 = "%{public}s called with null descriptor, dumping backtrace:%{public}s";
    goto LABEL_34;
  }

  if (v9)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NWPBStartBrowse);
    [v7 UUIDString];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      os_log_type_t v14 = (void *)[v8 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_descriptor, v14);

      id v15 = (void *)[v10 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_parameters, v15);
    }

    else
    {

      id v15 = (void *)[v10 createProtocolBufferObject];
    }

    os_log_type_t v16 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(_BYTE *)&v16->_has |= 1u;
      v16->_command = 5;
      -[PBCodable data](v11, "data");
      char v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v18);
    }

    else
    {
      -[PBCodable data](v11, "data");
      char v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [p_isa data];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  __nwlog_obj();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
  __int16 v22 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        uint32_t v25 = "%{public}s called with null parameters";
        goto LABEL_48;
      }

- (id)createStopBrowseMessageForClientID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NWPBStopBrowse);
    [v3 UUIDString];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      objc_storeStrong((id *)&v4->_clientUUID, v5);
    }

    v6 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(_BYTE *)&v6->_has |= 1u;
      v6->_command = 7;
      -[PBCodable data](v4, "data");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v8);
    }

    else
    {
      -[PBCodable data](v4, "data");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [p_isa data];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        id v15 = "%{public}s called with null clientID";
LABEL_21:
        _os_log_impl(&dword_181A5C000, v13, v14, v15, buf, 0xCu);
      }
    }

    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
            __int16 v22 = 2082;
            v23 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v13,  v14,  "%{public}s called with null clientID, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }

        if (!v17) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        id v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_21;
      }

      __nwlog_obj();
      os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        id v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_21;
      }
    }

- (id)createSendDataMessageForClientID:(id)a3 data:(id)a4 receiveWindow:(unsigned int)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NWPBSendData);
      [v7 UUIDString];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_clientUUID, v11);

        objc_storeStrong((id *)&v10->_messageData, a4);
        *(_BYTE *)&v10->_has |= 1u;
        v10->_receiveWindow = a5;
      }

      else
      {
      }

      os_log_type_t v13 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
      p_isa = (id *)&v13->super.super.isa;
      if (v13)
      {
        *(_BYTE *)&v13->_has |= 1u;
        v13->_command = 4;
        -[PBCodable data](v10, "data");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(p_isa + 2, v15);
      }

      else
      {
        -[PBCodable data](v10, "data");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [p_isa data];
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }

    __nwlog_obj();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    BOOL v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          __int16 v22 = "%{public}s called with null data";
          goto LABEL_35;
        }

        goto LABEL_36;
      }

      if (!v28)
      {
        __nwlog_obj();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          __int16 v22 = "%{public}s called with null data, backtrace limit exceeded";
          goto LABEL_35;
        }

        goto LABEL_36;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v21 = type;
      BOOL v27 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          __int16 v22 = "%{public}s called with null data, no backtrace";
          goto LABEL_35;
        }

        goto LABEL_36;
      }

      if (!v27) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136446466;
      BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
      __int16 v32 = 2082;
      char v33 = backtrace_string;
      v26 = "%{public}s called with null data, dumping backtrace:%{public}s";
LABEL_25:
      _os_log_impl(&dword_181A5C000, v20, v21, v26, buf, 0x16u);
LABEL_26:

      free(backtrace_string);
    }
  }

  else
  {
    __nwlog_obj();
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    BOOL v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          __int16 v22 = "%{public}s called with null clientID";
LABEL_35:
          _os_log_impl(&dword_181A5C000, v20, v21, v22, buf, 0xCu);
        }

- (BOOL)receiveRemoteReply:(id)a3
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (char *)a3;
  if (v4)
  {
    objc_super v5 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBCommandMessage), "initWithData:", v4);
    v6 = v5;
    if (!v5)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        __int16 v74 = 2114;
        v75 = v4;
        id v8 = "%{public}s Could not parse reply: %{public}@";
        id v9 = v7;
        uint32_t v10 = 22;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_20;
      }

      goto LABEL_20;
    }

    if ((*(_BYTE *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        id v8 = "%{public}s Reply missing command value";
LABEL_18:
        id v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_19;
      }

      goto LABEL_20;
    }

    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        id v8 = "%{public}s Reply missing message data";
        goto LABEL_18;
      }

- (unint64_t)dataModeForFlowID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_super v5 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  if (nw_hash_table_count((uint64_t)v5, v6))
  {
    [v4 getUUIDBytes:v10];
    uint64_t node = nw_hash_table_get_node( (uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"),  (uint64_t)v10,  16LL);
    if (node) {
      unint64_t v8 = *(unsigned int *)(node + 32);
    }
    else {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 1LL;
  }

  return v8;
}

- (nw_protocol)outputHandlerForFlowID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_super v5 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  if (nw_hash_table_count((uint64_t)v5, v6)
    && ([v4 getUUIDBytes:v10],
        (uint64_t node = nw_hash_table_get_node( (uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"),  (uint64_t)v10,  16LL)) != 0))
  {
    unint64_t v8 = *(nw_protocol **)(node + 16);
  }

  else
  {
    unint64_t v8 = -[NWRemoteConnectionDirector defaultOutputHandler](self, "defaultOutputHandler");
  }

  return v8;
}

- (void)setOutputProtocolHandler:(nw_protocol *)a3 forFlowID:(id)a4 dataMode:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  [v8 getUUIDBytes:v12];

  BOOL node = nw_hash_table_get_node((uint64_t)v9, (uint64_t)v12, 16LL);
  if (node) {
    nw_hash_table_remove_node((uint64_t)v9, node);
  }
  if (a3)
  {
    uint64_t v11 = nw_hash_table_add_object((uint64_t)v9, (uint64_t)a3, 0LL);
    if (v11) {
      *(_DWORD *)(v11 + 32) = v5;
    }
  }

- (void)receiveData:(id)a3 forClient:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NWRemoteConnectionDirector outputHandlerForFlowID:](self, "outputHandlerForFlowID:", v7);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    uint32_t v10 = self;
    objc_sync_enter(v10);
    while (1)
    {
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 count];

      if (!v12) {
        break;
      }
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 firstObject];
      uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!nw_remote_director_write_request( (uint64_t)-[NWRemoteConnectionDirector directorProtocol](v10, "directorProtocol"),  v9,  v14))
      {

        break;
      }

      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 removeObjectAtIndex:0];
    }

    BOOL v17 = -[NWRemoteConnectionWriteRequest initWithData:clientID:]( objc_alloc(&OBJC_CLASS___NWRemoteConnectionWriteRequest),  "initWithData:clientID:",  v6,  v7);
    if (v12
      || !nw_remote_director_write_request( (uint64_t)-[NWRemoteConnectionDirector directorProtocol](v10, "directorProtocol"),  v9,  v17))
    {
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      char v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 addObject:v17];
    }

    objc_sync_exit(v10);
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v16 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      id v20 = "-[NWRemoteConnectionDirector receiveData:forClient:]";
      __int16 v21 = 2114;
      uint64_t v22 = 0LL;
      _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s No client protocol found for %{public}@, dropping data",  (uint8_t *)&v19,  0x16u);
    }
  }
}

- (unint64_t)maximumDataChunkSize
{
  return self->_maximumDataChunkSize;
}

- (void)setMaximumDataChunkSize:(unint64_t)a3
{
  self->_maximumDataChunkSize = a3;
}

- (NWRemoteConnectionDirectorDelegate)delegate
{
  return (NWRemoteConnectionDirectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (nw_protocol)directorProtocol
{
  return self->_directorProtocol;
}

- (void)setDirectorProtocol:(nw_protocol *)a3
{
  self->_directorProtocol = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_hash_table)protocolHashTable
{
  return self->_protocolHashTable;
}

- (void)setProtocolHashTable:(nw_hash_table *)a3
{
  self->_protocolHashTable = a3;
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWriteRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

double __47__NWRemoteConnectionDirector_initWithDelegate___block_invoke()
{
  NWRemoteConnectionDirectorProtocolIdentifier = 0u;
  unk_18C5A3E68 = 0u;
  *(void *)&double result = 0x100000004LL;
  qword_18C5A3E78 = 0x100000004LL;
  NWRemoteConnectionDirectorProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  *(void *)algn_18C5A3E88 = nw_protocol_default_remove_input_handler;
  qword_18C5A3ED0 = (uint64_t)nw_protocol_default_get_input_frames;
  unk_18C5A3ED8 = nw_protocol_default_get_output_frames;
  qword_18C5A3EE0 = (uint64_t)nw_protocol_default_finalize_output_frames;
  unk_18C5A3EE8 = nw_protocol_default_link_state;
  qword_18C5A3F00 = (uint64_t)nw_protocol_default_get_local;
  unk_18C5A3F08 = nw_protocol_default_get_remote;
  qword_18C5A3EF0 = (uint64_t)nw_protocol_default_get_parameters;
  unk_18C5A3EF8 = nw_protocol_default_get_path;
  qword_18C5A3F40 = (uint64_t)nw_protocol_default_output_finished;
  unk_18C5A3F48 = nw_protocol_default_get_output_local;
  qword_18C5A3E90 = (uint64_t)nw_protocol_default_replace_input_handler;
  unk_18C5A3E98 = nw_protocol_default_connect;
  qword_18C5A3EA0 = (uint64_t)nw_protocol_default_disconnect;
  unk_18C5A3EA8 = nw_protocol_default_connected;
  qword_18C5A3EB0 = (uint64_t)nw_protocol_default_disconnected;
  unk_18C5A3EB8 = nw_protocol_default_error;
  qword_18C5A3F80 = (uint64_t)nw_protocol_default_reset;
  unk_18C5A3F88 = nw_protocol_default_input_flush;
  qword_18C5A3F30 = (uint64_t)nw_protocol_default_supports_external_data;
  unk_18C5A3F38 = nw_protocol_default_input_finished;
  qword_18C5A3F50 = (uint64_t)nw_protocol_default_get_output_interface;
  unk_18C5A3F58 = nw_protocol_default_waiting_for_output;
  qword_18C5A3F10 = (uint64_t)nw_protocol_default_register_notification;
  unk_18C5A3F18 = nw_protocol_default_unregister_notification;
  qword_18C5A3F20 = (uint64_t)nw_protocol_default_notify;
  unk_18C5A3F28 = nw_protocol_default_updated_path;
  qword_18C5A3F60 = (uint64_t)nw_protocol_default_copy_info;
  unk_18C5A3F68 = nw_protocol_default_add_listen_handler;
  qword_18C5A3F70 = (uint64_t)nw_protocol_default_remove_listen_handler;
  unk_18C5A3F78 = nw_protocol_default_get_message_properties;
  qword_18C5A3EC0 = (uint64_t)nw_remote_director_input_available;
  unk_18C5A3EC8 = nw_remote_director_output_available;
  return result;
}

@end