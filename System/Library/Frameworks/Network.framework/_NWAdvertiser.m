@interface _NWAdvertiser
- (id)initFor:(void *)a3 descriptor:(void *)a4 parent:(void *)a5 parameters:;
- (void)dealloc;
- (void)reconcileChildren:(uint64_t)a1;
- (void)start;
- (void)stop;
- (void)updateFlows:(uint64_t)a1;
@end

@implementation _NWAdvertiser

- (void)dealloc
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (self->dnsref)
  {
    uint64_t v3 = *((void *)self->listener + 2);
    if (v3)
    {
      if (!nw_path_parameters_get_logging_disabled(*(void *)(v3 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        id v4 = (id)glistenerLogObj;
        id_string = nw_listener_get_id_string(self->listener);
        *(_DWORD *)buf = 136446466;
        v26 = "-[_NWAdvertiser dealloc]";
        __int16 v27 = 2082;
        v28 = id_string;
        int v21 = 22;
        v20 = buf;
        v6 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v23 = 0;
        if (!__nwlog_fault(v6, &type, &v23))
        {
LABEL_13:
          if (!v6) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }

        if (type == OS_LOG_TYPE_FAULT)
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
          }
          v7 = (os_log_s *)(id)glistenerLogObj;
          os_log_type_t v8 = type;
          if (os_log_type_enabled(v7, type))
          {
            v9 = nw_listener_get_id_string(self->listener);
            *(_DWORD *)buf = 136446466;
            v26 = "-[_NWAdvertiser dealloc]";
            __int16 v27 = 2082;
            v28 = v9;
            _os_log_impl(&dword_181A5C000, v7, v8, "%{public}s [%{public}s] dnsref is not NULL", buf, 0x16u);
          }

- (void).cxx_destruct
{
}

- (id)initFor:(void *)a3 descriptor:(void *)a4 parent:(void *)a5 parameters:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v10)
  {
    __nwlog_obj();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
    v20 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v34 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_181A5C000, v21, v22, "%{public}s called with null _listener", buf, 0xCu);
      }
    }

    else if (v34)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      BOOL v27 = os_log_type_enabled(v21, type);
      if (backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446466;
          v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
          __int16 v38 = 2082;
          v39 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v21,  v26,  "%{public}s called with null _listener, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_40:
        if (!v20)
        {
LABEL_42:

          a1 = 0LL;
          goto LABEL_6;
        }

- (void)start
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  nw_context_assert_queue(*(void **)(*(void *)(a1 + 8) + 24LL));
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 16LL);
  if (v2 && !nw_path_parameters_get_logging_disabled(*(void *)(v2 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    uint64_t v3 = (os_log_s *)(id)glistenerLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id_string = nw_listener_get_id_string(*(void **)(a1 + 8));
      v5 = *(char **)(a1 + 16);
      *(_DWORD *)buf = 136446722;
      v67 = "-[_NWAdvertiser start]";
      __int16 v68 = 2082;
      v69 = id_string;
      __int16 v70 = 2112;
      v71 = v5;
      _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] start advertise %@", buf, 0x20u);
    }
  }

  if (!*(void *)(a1 + 32))
  {
    *(void *)__str = 0LL;
    uint64_t v75 = 0LL;
    snprintf(__str, 0x10uLL, "%d", *(unsigned __int16 *)(*(void *)(a1 + 8) + 300LL));
    id v6 = nw_listener_copy_parameters_with_port(*(void **)(a1 + 40), __str, 0);
    evaluator_for_advertise = nw_path_create_evaluator_for_advertise(*(void **)(a1 + 16), v6);
    os_log_type_t v8 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = evaluator_for_advertise;

    if (*(void *)(a1 + 32))
    {
      objc_initWeak(&location, (id)a1);
      v9 = *(void **)(a1 + 32);
      v63[0] = MEMORY[0x1895F87A8];
      v63[1] = 3221225472LL;
      v63[2] = __22___NWAdvertiser_start__block_invoke;
      v63[3] = &unk_189BC8C90;
      objc_copyWeak(&v64, &location);
      nw_path_evaluator_set_update_handler(v9, 0LL, v63);
      uint64_t v10 = *(void *)(*(void *)(a1 + 8) + 16LL);
      if (v10 && !nw_path_parameters_get_logging_disabled(*(void *)(v10 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        id v11 = (os_log_s *)(id)glistenerLogObj;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          __int16 v68 = 2082;
          v69 = v12;
          _os_log_impl( &dword_181A5C000,  v11,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Starting advertiser",  buf,  0x16u);
        }
      }

      id v13 = *(os_unfair_lock_s **)(a1 + 32);
      if (v13)
      {
        os_log_type_t v14 = v13 + 24;
        id v15 = v13;
        os_unfair_lock_lock(v14);
        id v16 = v15[6];
        os_unfair_lock_unlock(v14);
      }

      else
      {
        id v16 = 0LL;
      }

      id v20 = v16;
      nw_context_assert_queue(*(void **)(*(void *)(a1 + 8) + 24LL));
      uint64_t v21 = *(void *)(a1 + 8);
      if ((*(_DWORD *)(v21 + 128) - 1) <= 1 && (*(_BYTE *)(v21 + 302) & 1) == 0)
      {
        -[_NWAdvertiser updateFlows:](a1, v20);
        -[_NWAdvertiser reconcileChildren:](a1, v20);
      }

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 8) + 16LL);
      if (v17 && !nw_path_parameters_get_logging_disabled(*(void *)(v17 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        os_log_type_t v18 = (os_log_s *)(id)glistenerLogObj;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          __int16 v68 = 2082;
          v69 = v19;
          _os_log_impl( &dword_181A5C000,  v18,  OS_LOG_TYPE_ERROR,  "%{public}s [%{public}s] nw_path_create_evaluator_for_advertise failed",  buf,  0x16u);
        }
      }
    }
  }

  if (!*(void *)(a1 + 64) && nw_advertise_descriptor_get_type(*(void **)(a1 + 16)) == 1)
  {
    if (nw_parameters_get_use_awdl(*(void **)(*(void *)(a1 + 8) + 16LL)))
    {
      os_log_type_t v22 = (nw_parameters_t *)*(id *)(a1 + 8);
      if (nw_parameters_get_include_peer_to_peer(v22[2])
        && nw_parameters_get_multipath_service(v22[2])
        && (nw_parameters_t v23 = v22[33]) != 0LL)
      {
        BOOL v24 = nw_advertise_descriptor_get_type(v23) == 2;

        uint64_t v25 = *(void *)(a1 + 8);
        if (v24 && !*(_WORD *)(v25 + 240)) {
          goto LABEL_40;
        }
      }

      else
      {

        uint64_t v25 = *(void *)(a1 + 8);
      }

      uint64_t v27 = *(void *)(v25 + 16);
      if (v27 && !nw_path_parameters_get_logging_disabled(*(void *)(v27 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        v28 = (os_log_s *)(id)glistenerLogObj;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          os_log_type_t v29 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          __int16 v68 = 2082;
          v69 = v29;
          _os_log_impl( &dword_181A5C000,  v28,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Including kDNSServiceFlagsIncludeAWDL",  buf,  0x16u);
        }
      }

      int v26 = 0x100000;
LABEL_50:
      nw_interface_t v30 = nw_parameters_copy_required_interface(*(nw_parameters_t *)(*(void *)(a1 + 8) + 208LL));
      v26 |= 0x20000u;
      if (!v30) {
        goto LABEL_83;
      }
      uint64_t v31 = *(void *)(*(void *)(a1 + 8) + 16LL);
      if (!v31 || nw_path_parameters_get_logging_disabled(*(void *)(v31 + 104))) {
        goto LABEL_83;
      }
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      id v32 = (id)glistenerLogObj;
      objc_super v33 = nw_listener_get_id_string(*(void **)(a1 + 8));
      *(_DWORD *)buf = 136446722;
      v67 = "-[_NWAdvertiser start]";
      __int16 v68 = 2082;
      v69 = v33;
      __int16 v70 = 2082;
      v71 = (char *)v30 + 104;
      char v34 = (void *)_os_log_send_and_compose_impl();

      __str[0] = 16;
      LOBYTE(location) = 0;
      if (__nwlog_fault((const char *)v34, __str, &location))
      {
        if (__str[0] == 17)
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
          }
          v35 = (os_log_s *)(id)glistenerLogObj;
          os_log_type_t v36 = __str[0];
          if (os_log_type_enabled(v35, (os_log_type_t)__str[0]))
          {
            v37 = nw_listener_get_id_string(*(void **)(a1 + 8));
            *(_DWORD *)buf = 136446722;
            v67 = "-[_NWAdvertiser start]";
            __int16 v68 = 2082;
            v69 = v37;
            __int16 v70 = 2082;
            v71 = (char *)v30 + 104;
            _os_log_impl( &dword_181A5C000,  v35,  v36,  "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P",  buf,  0x20u);
          }
        }

        else if ((_BYTE)location)
        {
          backtrace_string = __nw_create_backtrace_string();
          if (backtrace_string)
          {
            v39 = (char *)backtrace_string;
            if (__nwlog_listener_log::onceToken != -1) {
              dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
            }
            uint64_t v40 = (os_log_s *)(id)glistenerLogObj;
            os_log_type_t v41 = __str[0];
            if (os_log_type_enabled(v40, (os_log_type_t)__str[0]))
            {
              v42 = nw_listener_get_id_string(*(void **)(a1 + 8));
              *(_DWORD *)buf = 136446978;
              v67 = "-[_NWAdvertiser start]";
              __int16 v68 = 2082;
              v69 = v42;
              __int16 v70 = 2082;
              v71 = (char *)v30 + 104;
              __int16 v72 = 2082;
              v73 = v39;
              _os_log_impl( &dword_181A5C000,  v40,  v41,  "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P, dumping backtrace:%{public}s",  buf,  0x2Au);
            }

            free(v39);
            if (!v34)
            {
LABEL_83:
              if (nw_advertise_descriptor_get_no_auto_rename(*(nw_advertise_descriptor_t *)(a1 + 16))) {
                DNSServiceFlags v47 = v26 | 8;
              }
              else {
                DNSServiceFlags v47 = v26;
              }
              if (nw_parameters_get_required_interface_type(*(nw_parameters_t *)(*(void *)(a1 + 8) + 208LL)) != nw_interface_type_loopback)
              {
                if (!v30)
                {
                  uint32_t v50 = 0;
                  goto LABEL_92;
                }

                v48 = v30;
                int v49 = *((_DWORD *)v48 + 24);

                if (v49 != 4)
                {
                  uint32_t v50 = *((_DWORD *)v48 + 2);
                  goto LABEL_92;
                }
              }

              uint32_t v50 = -1;
LABEL_92:
              nw_txt_record_t v51 = nw_advertise_descriptor_copy_txt_record_object(*(nw_advertise_descriptor_t *)(a1 + 16));
              nw_txt_record_t v52 = v51;
              if (v51)
              {
                uint16_t txtLen = *((_WORD *)v51 + 8);
                txtRecord = (const void *)*((void *)v51 + 1);
              }

              else
              {
                uint16_t txtLen = 0;
                txtRecord = 0LL;
              }

              bonjour_name = (const char *)nw_advertise_descriptor_get_bonjour_name(*(void **)(a1 + 16));
              bonjour_os_log_type_t type = (const char *)nw_advertise_descriptor_get_bonjour_type(*(void **)(a1 + 16));
              if (nw_parameters_get_local_only(*(nw_parameters_t *)(a1 + 40))) {
                bonjour_domain = "local.";
              }
              else {
                bonjour_domain = (const char *)nw_advertise_descriptor_get_bonjour_domain(*(void **)(a1 + 16));
              }
              DNSServiceErrorType v58 = DNSServiceRegister( (DNSServiceRef *)(a1 + 64),  v47,  v50,  bonjour_name,  bonjour_type,  bonjour_domain,  0LL,  bswap32(*(unsigned __int16 *)(*(void *)(a1 + 8) + 300LL)) >> 16,  txtLen,  txtRecord,  (DNSServiceRegisterReply)_NWAdvertiser_dnssd_handler,  (void *)a1);
              if (v58
                || (v59 = *(_DNSServiceRef_t **)(a1 + 64),
                    BOOL v60 = nw_context_copy_workloop(*(void **)(*(void *)(a1 + 8) + 24LL)),
                    DNSServiceErrorType v58 = DNSServiceSetDispatchQueue(v59, (dispatch_queue_t)v60),
                    (id)v60,
                    v58))
              {
                v61 = *(void **)(a1 + 8);
                dns_error = nw_error_create_dns_error(v58);
                nw_listener_set_state_on_queue(v61, 3, dns_error);
              }

              return;
            }

- (void)updateFlows:(uint64_t)a1
{
  id v9 = a2;
  uint64_t v3 = nw_dictionary_create();
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = MEMORY[0x1895F87A8];
  if (v4)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __29___NWAdvertiser_updateFlows___block_invoke;
    v13[3] = &unk_189BC1300;
    id v14 = v9;
    id v15 = v3;
    nw_dictionary_apply(v4, (uint64_t)v13);
  }

  v12[0] = v5;
  v12[1] = 3221225472LL;
  v12[2] = __29___NWAdvertiser_updateFlows___block_invoke_2;
  v12[3] = &unk_189BC5058;
  v12[4] = a1;
  nw_dictionary_apply((uint64_t)v3, (uint64_t)v12);
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __29___NWAdvertiser_updateFlows___block_invoke_6;
  v10[3] = &unk_189BC1328;
  v10[4] = a1;
  id v6 = nw_dictionary_create();
  id v11 = v6;
  nw_path_enumerate_browse_options(v9, v10);
  v7 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v6;
  os_log_type_t v8 = v6;
}

- (void)reconcileChildren:(uint64_t)a1
{
  id v9 = a2;
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = nw_path_copy_discovered_endpoints(v9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v7 = nw_listener_reconcile_advertised_endpoints(v3, v4, v5, v9, WeakRetained);
  os_log_type_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v7;
}

- (void)stop
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(*(void *)(a1 + 8) + 24LL));
    uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 16LL);
    if (v2 && !nw_path_parameters_get_logging_disabled(*(void *)(v2 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      uint64_t v3 = (os_log_s *)(id)glistenerLogObj;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_listener_get_id_string(*(void **)(a1 + 8));
        id v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[_NWAdvertiser stop]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2112;
        os_log_type_t v45 = v5;
        _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] stop advertise %@", buf, 0x20u);
      }
    }

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(v6);
          }
          -[_NWAdvertiser stop](*(void *)(*((void *)&v40 + 1) + 8 * i));
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }

      while (v7);
    }

    uint64_t v10 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0LL;

    uint64_t v11 = *(void *)(a1 + 64);
    if (v11)
    {
      *(void *)(a1 + 64) = 0LL;
      id v12 = nw_parameters_copy_context(*(void **)(*(void *)(a1 + 8) + 16LL));
      v39[0] = MEMORY[0x1895F87A8];
      v39[1] = 3221225472LL;
      v39[2] = __21___NWAdvertiser_stop__block_invoke;
      v39[3] = &unk_189BC66E8;
      v39[4] = a1;
      v39[5] = v11;
      nw_queue_context_async_if_needed(v12, v39);
    }

    id v13 = *(void **)(a1 + 32);
    if (v13)
    {
      nw_path_evaluator_cancel(v13);
      id v14 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0LL;
    }

    uint64_t v15 = *(void *)(a1 + 8);
    if (*(_DWORD *)(v15 + 128) == 2 && (*(_BYTE *)(v15 + 302) & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      BOOL v17 = WeakRetained == 0LL;

      if (v17)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        os_log_type_t v45 = __Block_byref_object_copy__17859;
        v46 = __Block_byref_object_dispose__17860;
        id v47 = 0LL;
        uint64_t v33 = 0LL;
        char v34 = &v33;
        uint64_t v35 = 0x3032000000LL;
        os_log_type_t v36 = __Block_byref_object_copy__3;
        v37 = __Block_byref_object_dispose__4;
        id v38 = 0LL;
        uint64_t v27 = 0LL;
        v28 = &v27;
        uint64_t v29 = 0x3032000000LL;
        nw_interface_t v30 = __Block_byref_object_copy__17859;
        uint64_t v31 = __Block_byref_object_dispose__17860;
        id v32 = 0LL;
        os_log_type_t v18 = *(os_unfair_lock_s **)(a1 + 8);
        uint64_t v19 = MEMORY[0x1895F87A8];
        aBlock[0] = MEMORY[0x1895F87A8];
        aBlock[1] = 3221225472LL;
        aBlock[2] = __21___NWAdvertiser_stop__block_invoke_2;
        aBlock[3] = &unk_189BB9B70;
        aBlock[4] = a1;
        aBlock[5] = buf;
        aBlock[6] = &v33;
        aBlock[7] = &v27;
        id v20 = (void (**)(void))_Block_copy(aBlock);
        v18 += 2;
        os_unfair_lock_lock(v18);
        v20[2](v20);
        os_unfair_lock_unlock(v18);

        if (v34[5])
        {
          uint64_t v21 = *(void **)(*(void *)&buf[8] + 40LL);
          if (v21)
          {
            if (v28[5])
            {
              dispatch_qos_class_t v22 = *(_DWORD *)(*(void *)(a1 + 8) + 72LL);
              v25[0] = v19;
              v25[1] = 3221225472LL;
              v25[2] = __21___NWAdvertiser_stop__block_invoke_3;
              v25[3] = &unk_189BB8970;
              v25[4] = &v33;
              v25[5] = &v27;
              nw_parameters_t v23 = v21;
              dispatch_block_t v24 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v22, 0, v25);
              dispatch_async(v23, v24);
            }
          }
        }

        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(buf, 8);
      }
    }
  }

@end