@interface NWConcrete_nw_endpoint_handler
- (id).cxx_construct;
- (id)initWithEndpoint:(void *)a3 parameters:(void *)a4 reportCallback:(void *)a5 context:(void *)a6 parent:(unsigned int)a7 identifier:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_endpoint_handler

- (id).cxx_construct
{
  *((_DWORD *)self + 37) = 0;
  return self;
}

- (id)initWithEndpoint:(void *)a3 parameters:(void *)a4 reportCallback:(void *)a5 context:(void *)a6 parent:(unsigned int)a7 identifier:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v14 = a2;
  id v15 = a3;
  id v16 = a5;
  v17 = a6;
  if (!a1) {
    goto LABEL_7;
  }
  v33.receiver = a1;
  v33.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_handler;
  v18 = (id *)objc_msgSendSuper2(&v33, sel_init);
  a1 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 3, a2);
    objc_storeStrong(a1 + 4, a3);
    a1[1] = a4;
    objc_storeWeak(a1 + 2, v16);
    *((_DWORD *)a1 + 30) = 0;
    *((_DWORD *)a1 + 28) = 0;
    id v19 = nw_parameters_copy_context(v15);
    id v20 = a1[5];
    a1[5] = v19;

    *((_DWORD *)a1 + 66) = 0;
    else {
      char v21 = 0;
    }
    *((_BYTE *)a1 + 268) = *((_BYTE *)a1 + 268) & 0xDF | v21;
    nw_endpoint_handler_inherit_from_parent((NWConcrete_nw_endpoint_handler *)a1, v17, a7);
    goto LABEL_7;
  }

  __nwlog_obj();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
  v24 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v31 = 0;
  if (__nwlog_fault(v24, &type, &v31))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_181A5C000, v25, v26, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v31)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v28 = type;
      BOOL v29 = os_log_type_enabled(v25, type);
      if (backtrace_string)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
          __int16 v36 = 2082;
          v37 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v25,  v28,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_24;
      }

      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_181A5C000, v25, v28, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v30 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_181A5C000, v25, v30, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2 = self;
  uint64_t v114 = *MEMORY[0x1895F89C0];
  int state = self->state;
  if (state) {
    BOOL v4 = state == 5;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_87;
  }
  v5 = self;
  char v6 = *((_BYTE *)v5 + 268);

  if ((v6 & 0x20) != 0) {
    goto LABEL_87;
  }
  if (__nwlog_connection_log::onceToken != -1) {
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
  }
  id v7 = (id)gconnectionLogObj;
  v8 = v5;

  v9 = v8;
  char v10 = *((_BYTE *)v5 + 268);

  if ((v10 & 1) != 0) {
    v11 = "dry-run ";
  }
  else {
    v11 = "";
  }
  nw_endpoint_t v12 = nw_endpoint_handler_copy_endpoint(v9);
  logging_description = nw_endpoint_get_logging_description(v12);
  id_str = v8->id_str;
  id v14 = v9;
  id v15 = v14;
  v92 = v2;
  uint64_t v16 = v2->state;
  else {
    v17 = off_189BBBBF0[v16];
  }

  v18 = v15;
  id v19 = v18;
  id v20 = "path";
  switch(*((_DWORD *)v18 + 29))
  {
    case 0:
      break;
    case 1:
      id v20 = "resolver";
      break;
    case 2:
      id v20 = nw_endpoint_flow_mode_string(v18[31]);
      break;
    case 3:
      id v20 = "proxy";
      break;
    case 4:
      id v20 = "fallback";
      break;
    case 5:
      id v20 = "transform";
      break;
    default:
      id v20 = "unknown-mode";
      break;
  }

  v90 = v19;
  char v21 = v19;
  os_unfair_lock_lock((os_unfair_lock_t)v21 + 28);
  id v22 = v21[8];
  lock = (os_unfair_lock_s *)(v21 + 14);
  os_unfair_lock_unlock((os_unfair_lock_t)v21 + 28);
  v91 = v21;

  *(_DWORD *)buf = 136447746;
  v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
  __int16 v100 = 2082;
  v101 = id_str;
  __int16 v102 = 2082;
  v103 = v11;
  __int16 v104 = 2082;
  v105 = logging_description;
  __int16 v106 = 2082;
  v107 = v17;
  __int16 v108 = 2082;
  v109 = v20;
  __int16 v110 = 2114;
  id v111 = v22;
  int v85 = 72;
  v84 = buf;
  v94 = (const char *)_os_log_send_and_compose_impl();

  v2 = v92;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v96 = 0;
  v23 = (char *)v94;
  if (__nwlog_fault(v94, &type, &v96))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
      }
      v24 = (os_log_s *)(id)gconnectionLogObj;
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v24, type))
      {
        os_log_type_t v26 = v21;

        v27 = v26;
        BOOL v28 = (*((_BYTE *)v5 + 268) & 1) == 0;

        if (v28) {
          BOOL v29 = "";
        }
        else {
          BOOL v29 = "dry-run ";
        }
        nw_endpoint_t v30 = nw_endpoint_handler_copy_endpoint(v27);
        char v31 = nw_endpoint_get_logging_description(v30);
        v32 = v27;
        objc_super v33 = v32;
        uint64_t v34 = v92->state;
        else {
          v35 = off_189BBBBF0[v34];
        }
        v88 = v35;

        v61 = v33;
        v62 = v61;
        v63 = "path";
        switch(*((_DWORD *)v90 + 29))
        {
          case 0:
            break;
          case 1:
            v63 = "resolver";
            break;
          case 2:
            v63 = nw_endpoint_flow_mode_string(v61[31]);
            break;
          case 3:
            v63 = "proxy";
            break;
          case 4:
            v63 = "fallback";
            break;
          case 5:
            v63 = "transform";
            break;
          default:
            v63 = "unknown-mode";
            break;
        }

        v78 = v62;
        os_unfair_lock_lock(lock);
        id v79 = v91[8];
        os_unfair_lock_unlock(lock);

        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        __int16 v100 = 2082;
        v101 = id_str;
        __int16 v102 = 2082;
        v103 = v29;
        __int16 v104 = 2082;
        v105 = v31;
        __int16 v106 = 2082;
        v107 = v88;
        __int16 v108 = 2082;
        v109 = v63;
        __int16 v110 = 2114;
        id v111 = v79;
        _os_log_impl( &dword_181A5C000,  v24,  v25,  "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected state",  buf,  0x48u);
      }
    }

    else if (v96)
    {
      backtrace_string = __nw_create_backtrace_string();
      if (backtrace_string)
      {
        v37 = (char *)backtrace_string;
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
        }
        uint64_t v38 = (os_log_s *)(id)gconnectionLogObj;
        os_log_type_t v39 = type;
        if (os_log_type_enabled(v38, type))
        {
          v40 = v21;

          v41 = v40;
          BOOL v42 = (*((_BYTE *)v5 + 268) & 1) == 0;

          if (v42) {
            v43 = "";
          }
          else {
            v43 = "dry-run ";
          }
          nw_endpoint_t v44 = nw_endpoint_handler_copy_endpoint(v41);
          v45 = nw_endpoint_get_logging_description(v44);
          v46 = v41;
          v47 = v46;
          uint64_t v48 = v92->state;
          v86 = v45;
          else {
            v49 = off_189BBBBF0[v48];
          }

          v72 = v47;
          v73 = v72;
          v74 = "path";
          switch(*((_DWORD *)v90 + 29))
          {
            case 0:
              break;
            case 1:
              v74 = "resolver";
              break;
            case 2:
              v74 = nw_endpoint_flow_mode_string(v72[31]);
              break;
            case 3:
              v74 = "proxy";
              break;
            case 4:
              v74 = "fallback";
              break;
            case 5:
              v74 = "transform";
              break;
            default:
              v74 = "unknown-mode";
              break;
          }

          v80 = v73;
          os_unfair_lock_lock(lock);
          id v81 = v91[8];
          os_unfair_lock_unlock(lock);

          *(_DWORD *)buf = 136448002;
          v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
          __int16 v100 = 2082;
          v101 = id_str;
          __int16 v102 = 2082;
          v103 = v43;
          __int16 v104 = 2082;
          v105 = v86;
          __int16 v106 = 2082;
          v107 = v49;
          __int16 v108 = 2082;
          v109 = v74;
          __int16 v110 = 2114;
          id v111 = v81;
          __int16 v112 = 2082;
          v113 = v37;
          _os_log_impl( &dword_181A5C000,  v38,  v39,  "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected s tate, dumping backtrace:%{public}s",  buf,  0x52u);
        }

        free(v37);
        goto LABEL_84;
      }

      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
      }
      v24 = (os_log_s *)(id)gconnectionLogObj;
      os_log_type_t v64 = type;
      if (os_log_type_enabled(v24, type))
      {
        id_string = nw_endpoint_handler_get_id_string(v21);
        v66 = nw_endpoint_handler_dry_run_string(v21);
        nw_endpoint_t v67 = nw_endpoint_handler_copy_endpoint(v21);
        v68 = nw_endpoint_get_logging_description(v67);
        v69 = nw_endpoint_handler_state_string(v21);
        v70 = nw_endpoint_handler_mode_string(v21);
        id v71 = nw_endpoint_handler_copy_current_path(v21);
        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        __int16 v100 = 2082;
        v101 = id_string;
        __int16 v102 = 2082;
        v103 = v66;
        __int16 v104 = 2082;
        v105 = v68;
        __int16 v106 = 2082;
        v107 = v69;
        __int16 v108 = 2082;
        v109 = v70;
        __int16 v110 = 2114;
        id v111 = v71;
        _os_log_impl( &dword_181A5C000,  v24,  v64,  "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected sta te, no backtrace",  buf,  0x48u);

        v2 = v92;
      }
    }

    else
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
      }
      v24 = (os_log_s *)(id)gconnectionLogObj;
      os_log_type_t v50 = type;
      if (os_log_type_enabled(v24, type))
      {
        v51 = v21;

        v52 = v51;
        BOOL v53 = (*((_BYTE *)v5 + 268) & 1) == 0;

        if (v53) {
          v54 = "";
        }
        else {
          v54 = "dry-run ";
        }
        nw_endpoint_t v55 = nw_endpoint_handler_copy_endpoint(v52);
        v56 = nw_endpoint_get_logging_description(v55);
        v57 = v52;
        v58 = v57;
        uint64_t v59 = v92->state;
        v87 = v56;
        else {
          v60 = off_189BBBBF0[v59];
        }

        v75 = v58;
        v76 = v75;
        v77 = "path";
        switch(*((_DWORD *)v90 + 29))
        {
          case 0:
            break;
          case 1:
            v77 = "resolver";
            break;
          case 2:
            v77 = nw_endpoint_flow_mode_string(v75[31]);
            break;
          case 3:
            v77 = "proxy";
            break;
          case 4:
            v77 = "fallback";
            break;
          case 5:
            v77 = "transform";
            break;
          default:
            v77 = "unknown-mode";
            break;
        }

        v82 = v76;
        os_unfair_lock_lock(lock);
        id v83 = v91[8];
        os_unfair_lock_unlock(lock);

        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        __int16 v100 = 2082;
        v101 = id_str;
        __int16 v102 = 2082;
        v103 = v54;
        __int16 v104 = 2082;
        v105 = v87;
        __int16 v106 = 2082;
        v107 = v60;
        __int16 v108 = 2082;
        v109 = v77;
        __int16 v110 = 2114;
        id v111 = v83;
        _os_log_impl( &dword_181A5C000,  v24,  v50,  "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected sta te, backtrace limit exceeded",  buf,  0x48u);
      }
    }

LABEL_84:
    v23 = (char *)v94;
  }

  if (v23) {
    free(v23);
  }
LABEL_87:
  v95.receiver = v2;
  v95.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_handler;
  -[NWConcrete_nw_endpoint_handler dealloc](&v95, sel_dealloc, v84, v85);
}

- (void).cxx_destruct
{
}

@end