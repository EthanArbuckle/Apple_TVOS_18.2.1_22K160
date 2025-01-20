@interface NWConcrete_nw_endpoint_flow
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_flow)init;
- (id).cxx_construct;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_flow

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 616) = 0u;
  *(_OWORD *)((char *)self + 632) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *((_OWORD *)self + 43) = 0u;
  *((void *)self + 90) = 0LL;
  *((void *)self + 97) = 0LL;
  return self;
}

- (NWConcrete_nw_endpoint_flow)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_flow;
  v2 = -[NWConcrete_nw_endpoint_flow init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->pre_connected_fd = -1;
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_flow init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_endpoint_flow init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)startWithHandler:(id)a3
{
  uint64_t v250 = *MEMORY[0x1895F89C0];
  id v233 = a3;
  if (!v233)
  {
    __nwlog_obj();
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v234 = 0;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v191 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_181A5C000, v16, v191, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v234)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v194 = type[0];
      BOOL v195 = os_log_type_enabled(v16, type[0]);
      if (backtrace_string)
      {
        if (v195)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v194,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_80;
      }

      if (v195)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_181A5C000, v16, v194, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v196 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl( &dword_181A5C000,  v16,  v196,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v219 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    BOOL v130 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
    v131 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v131, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v133 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_181A5C000, v132, v133, "%{public}s called with null handler", buf, 0xCu);
        }
      }

      else if ((_BYTE)p_shared_protocol)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v135 = type[0];
        BOOL v136 = os_log_type_enabled(v132, type[0]);
        if (backtrace_string)
        {
          if (v136)
          {
            *(_DWORD *)buf = 136446466;
            v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
            __int16 v203 = 2082;
            v204 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v132,  v135,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_196;
        }

        if (v136)
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_181A5C000, v132, v135, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v137 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl( &dword_181A5C000,  v132,  v137,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v149 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
    int v24 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v24, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v91 = type[0];
        if (os_log_type_enabled(v25, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v25, v91, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_77;
      }

      if (!(_BYTE)p_shared_protocol)
      {
        __nwlog_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v95 = type[0];
        if (os_log_type_enabled(v25, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl( &dword_181A5C000,  v25,  v95,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_77;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v93 = type[0];
      BOOL v94 = os_log_type_enabled(v25, type[0]);
      if (!backtrace_string)
      {
        if (v94)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v25, v93, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_77;
      }

      if (v94)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
        __int16 v137 = 2082;
        uint64_t v138 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v25,  v93,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)dealloc
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (self->internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    BOOL v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating",  buf,  0xCu);
      }

- (void).cxx_destruct
{
  if ((*((_BYTE *)&self->multiplexed_message_protocol + 8) & 1) != 0) {
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->multiplexed_message_protocol);
  }
  self->multiplexed_message_protocol.m_id obj = 0LL;
  objc_storeStrong((id *)&self->multiplexed_message_definition, 0LL);
  if ((*((_BYTE *)&self->transport_protocol + 8) & 1) != 0) {
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->transport_protocol);
  }
  self->transport_protocol.m_id obj = 0LL;
  objc_storeStrong((id *)&self->new_flow_read_requests, 0LL);

  objc_storeStrong((id *)&self->clone_from_flow, 0LL);
  objc_storeStrong((id *)&self->internally_retained_object, 0LL);
  objc_storeStrong((id *)&self->flow_path, 0LL);
  objc_storeStrong((id *)&self->connected_path, 0LL);
}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (uint64_t (**)(void))a4;
  if (!v6)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    id v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v36 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }

      goto LABEL_38;
    }

    if (!v36)
    {
      __nwlog_obj();
      os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v34 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl( &dword_181A5C000,  v14,  v34,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_38;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v30 = type;
    BOOL v31 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }

      goto LABEL_38;
    }

    if (v31)
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
      __int16 v40 = 2082;
      char v41 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v14,  v30,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
    }

@end