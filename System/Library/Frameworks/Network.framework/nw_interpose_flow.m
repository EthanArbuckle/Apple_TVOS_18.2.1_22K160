@interface nw_interpose_flow
- (BOOL)matchNexusAgent:(unsigned __int8)a3[16];
- (BOOL)matchNexusAgentWithFlow:(id)a3;
- (BOOL)matchNexusInstance:(id)a3;
- (nw_interpose_flow)initWithInterface:(id)a3 registration:(id)a4 eventHandler:(id)a5;
- (void)clearFlowEventHandler;
- (void)close;
- (void)closeFlow;
- (void)dealloc;
- (void)notifyFlowEvent:(int)a3;
- (void)resetFlow:(id)a3;
@end

@implementation nw_interpose_flow

- (nw_interpose_flow)initWithInterface:(id)a3 registration:(id)a4 eventHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___nw_interpose_flow;
  v12 = -[nw_interpose_flow init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->_registration, a4);
    flow = v13->_flow;
    v13->_flow = 0LL;

    v15 = _Block_copy(v11);
    id eventHandler = v13->_eventHandler;
    v13->_id eventHandler = v15;

    v17 = v13;
    goto LABEL_3;
  }

  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
  v20 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v20, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_181A5C000, v21, v22, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      BOOL v25 = os_log_type_enabled(v21, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
          __int16 v32 = 2082;
          v33 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v21,  v24,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_181A5C000, v21, v24, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_181A5C000, v21, v26, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[nw_interpose_flow dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: dealloc", buf, 0x16u);
  }

  -[nw_interpose_flow close](self, "close");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___nw_interpose_flow;
  -[nw_interpose_flow dealloc](&v4, sel_dealloc);
}

- (void)close
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136446466;
    __int16 v7 = "-[nw_interpose_flow close]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: close", (uint8_t *)&v6, 0x16u);
  }

  registration = self->_registration;
  if (registration)
  {
    nw_path_flow_registration_close(registration);
    v5 = self->_registration;
    self->_registration = 0LL;
  }

  -[nw_interpose_flow closeFlow](self, "closeFlow");
}

- (void)notifyFlowEvent:(int)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12[0] = 0uLL;
  int v7 = 0;
  flow = self->_flow;
  if (flow && self->_eventHandler && self->_interface)
  {
    int v6 = flow;
    if (uuid_is_null(v6 + 128))
    {
    }

    else
    {
      v12[1] = *((_OWORD *)v6 + 8);

      if (nw_path_flow_get_id(self->_flow, v12))
      {
        if (nw_path_flow_get_nexus_key(self->_flow, &v7) && v7)
        {
          (*((void (**)(void))self->_eventHandler + 2))();
        }

        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v5 = (os_log_s *)(id)gLogObj;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v9 = "-[nw_interpose_flow notifyFlowEvent:]";
            __int16 v10 = 2112;
            id v11 = self;
            _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s %@: no flow key or key length",  buf,  0x16u);
          }
        }
      }
    }
  }

- (void)closeFlow
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136446466;
    int v6 = "-[nw_interpose_flow closeFlow]";
    __int16 v7 = 2112;
    __int16 v8 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: closeFlow", (uint8_t *)&v5, 0x16u);
  }

  -[nw_interpose_flow notifyFlowEvent:](self, "notifyFlowEvent:", 1LL);
  flow = self->_flow;
  self->_flow = 0LL;
}

- (void)clearFlowEventHandler
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136446466;
    int v6 = "-[nw_interpose_flow clearFlowEventHandler]";
    __int16 v7 = 2112;
    __int16 v8 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: clearFlowEventHandler", (uint8_t *)&v5, 0x16u);
  }

  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0LL;
}

- (void)resetFlow:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  int v6 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136446466;
    __int16 v8 = "-[nw_interpose_flow resetFlow:]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl(&dword_181A5C000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %@: resetFlow", (uint8_t *)&v7, 0x16u);
  }

  objc_storeStrong((id *)&self->_flow, a3);
  -[nw_interpose_flow notifyFlowEvent:](self, "notifyFlowEvent:", 0LL);
}

- (BOOL)matchNexusAgent:(unsigned __int8)a3[16]
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136446978;
    __int16 v8 = "-[nw_interpose_flow matchNexusAgent:]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    __int16 v11 = 1042;
    int v12 = 16;
    __int16 v13 = 2098;
    unsigned __int8 *__attribute__((__org_arrdim(0,16))) v14 = a3;
    _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s %@: matchNexusAgent: matching Nexus agent %{public, uuid_t}.16P",  (uint8_t *)&v7,  0x26u);
  }

  return nw_path_flow_registration_uses_nexus(self->_registration, a3);
}

- (BOOL)matchNexusAgentWithFlow:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)matchNexusInstance:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = 0;
  __int128 v21 = 0uLL;
  if (v4)
  {
    flow = self->_flow;
    if (flow)
    {
      __int128 v7 = flow;
      if (uuid_is_null(v7 + 128)
        || (*(_OWORD *)uu1 = *((_OWORD *)v7 + 8),
            v7,
            __int128 v7 = (unsigned __int8 *)v4,
            uuid_is_null(v7 + 128)))
      {

LABEL_6:
        BOOL v5 = 0;
        goto LABEL_7;
      }

      *(_OWORD *)uu2 = *((_OWORD *)v7 + 8);

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      __int16 v9 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 136446978;
        __int16 v13 = "-[nw_interpose_flow matchNexusInstance:]";
        __int16 v14 = 2112;
        uint64_t v15 = self;
        __int16 v16 = 1042;
        int v17 = 16;
        __int16 v18 = 2098;
        v19 = uu2;
        _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s %@: matchNexusInstance: matching Nexus instance %{public, uuid_t}.16P",  (uint8_t *)&v12,  0x26u);
      }

      __int16 v10 = v7;
      if (uuid_is_null(v10 + 144))
      {

        goto LABEL_6;
      }

      *(_OWORD *)v20 = *((_OWORD *)v10 + 9);

      __nwlog_obj();
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 136446978;
        __int16 v13 = "-[nw_interpose_flow matchNexusInstance:]";
        __int16 v14 = 2112;
        uint64_t v15 = self;
        __int16 v16 = 1042;
        int v17 = 16;
        __int16 v18 = 2098;
        v19 = v20;
        _os_log_impl( &dword_181A5C000,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s %@: matchNexusInstance: matching flow id %{public, uuid_t}.16P",  (uint8_t *)&v12,  0x26u);
      }

      BOOL v5 = uuid_compare((const unsigned __int8 *)&v21, v20) == 0;
    }
  }

- (void).cxx_destruct
{
}

@end