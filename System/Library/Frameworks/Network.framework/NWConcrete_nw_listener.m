@interface NWConcrete_nw_listener
- (BOOL)canHandleNewConnection:(id)a3;
- (NSString)description;
- (char)getPeerDeviceID;
- (char)initWithParameters:(void *)a3 multicastDescriptor:;
- (id).cxx_construct;
- (id)getIDSInformation;
- (void)dealloc;
- (void)handleInbound:(id)a3 addProtocolInbox:(BOOL)a4;
- (void)handleInboundPacket:(const char *)a3 length:(unsigned __int16)a4 from:(id)a5 to:(id)a6 interface:(id)a7 socket:(id)a8;
- (void)handleInboxCancelComplete:(id)a3;
- (void)handleInboxFailed:(id)a3 error:(id)a4;
- (void)updateParametersForNewConnection:(id)a3;
@end

@implementation NWConcrete_nw_listener

- (BOOL)canHandleNewConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke;
  v12[3] = &unk_189BC9210;
  v12[4] = self;
  v12[5] = &v13;
  v5 = (void (**)(void))_Block_copy(v12);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v5[2](v5);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  int v6 = *((unsigned __int8 *)v14 + 24);
  if (*((_BYTE *)v14 + 24))
  {
    v7 = self;
    id v8 = v4;
    [v8 suspend];
    uint64_t v9 = *((void *)v7 + 2);
    if (v9 && !nw_path_parameters_get_logging_disabled(*(void *)(v9 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      v10 = (os_log_s *)(id)glistenerLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "nw_listener_suspend_inbox";
        __int16 v19 = 2082;
        v20 = (char *)v7 + 42;
        __int16 v21 = 2114;
        id v22 = v8;
        _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s [%{public}s] Suspended for %{public}@",  buf,  0x20u);
      }
    }
  }

  _Block_object_dispose(&v13, 8);

  return v6 == 0;
}

- (void)handleInbound:(id)a3 addProtocolInbox:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v7 = *((void *)self + 2);
  if (v7 && !nw_path_parameters_get_logging_disabled(*(void *)(v7 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    id v8 = (os_log_s *)(id)glistenerLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self;
      v10 = (char *)v9 + 42;

      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v81) = v4;
      WORD2(v81) = 2112;
      *(void *)((char *)&v81 + 6) = v6;
      _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s [%{public}s] Handling inbound connection (add inbox %u) %@",  buf,  0x26u);
    }
  }

  if (*((_DWORD *)self + 32) == 2 && (*((_BYTE *)self + 302) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke;
    aBlock[3] = &unk_189BC93A0;
    aBlock[4] = self;
    v11 = (void (**)(void))_Block_copy(aBlock);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v11[2](v11);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    v12 = self;
    if (nw_parameters_get_include_peer_to_peer(*((nw_parameters_t *)self + 2))
      && nw_parameters_get_multipath_service(*((nw_parameters_t *)self + 2))
      && (uint64_t v13 = (void *)*((void *)v12 + 33)) != 0LL)
    {
      v14 = v13;
      int v15 = v14[2];

      if (v15 == 2)
      {
        uint64_t v16 = *((void *)self + 2);
        if (v16 && !nw_path_parameters_get_logging_disabled(*(void *)(v16 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
          }
          v17 = (os_log_s *)(id)glistenerLogObj;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id_string = nw_listener_get_id_string(v12);
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = id_string;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&__int128 v81 = v6;
            _os_log_impl( &dword_181A5C000,  v17,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Monitoring connection %@ for AWDL usage",  buf,  0x20u);
          }
        }

        v73[0] = MEMORY[0x1895F87A8];
        v73[1] = 3221225472LL;
        v73[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_38;
        v73[3] = &unk_189BB8998;
        v73[4] = v12;
        id v74 = v6;
        nw_connection_set_interface_use_callback(v74, v73);
      }
    }

    else
    {
    }

    if (v4)
    {
      uint64_t listener_protocol_on_nw_queue = nw_connection_get_listener_protocol_on_nw_queue(v6, *((void **)self + 2), 0);
      if (listener_protocol_on_nw_queue)
      {
        uint64_t v20 = *((void *)self + 2);
        if (v20 && !nw_path_parameters_get_logging_disabled(*(void *)(v20 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
          }
          __int16 v21 = (os_log_s *)(id)glistenerLogObj;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = v12;

            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = (char *)v22 + 42;
            _os_log_impl( &dword_181A5C000,  v21,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Listener found protocol in new connection to create an inbox from",  buf,  0x16u);
          }
        }

        uint64_t v23 = -[nw_listener_inbox_protocol initWithProtocol:delegate:]( objc_alloc(&OBJC_CLASS___nw_listener_inbox_protocol),  listener_protocol_on_nw_queue,  v12);
        if (v23)
        {
          nw_array_append(*((void *)v12 + 18), v23);
        }

        else
        {
          uint64_t v24 = *((void *)self + 2);
          if (v24 && !nw_path_parameters_get_logging_disabled(*(void *)(v24 + 104)))
          {
            if (__nwlog_listener_log::onceToken != -1) {
              dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
            }
            v25 = (os_log_s *)(id)glistenerLogObj;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = nw_listener_get_id_string(v12);
              uint64_t v27 = *(void *)(listener_protocol_on_nw_queue + 16);
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v26;
              *(_WORD *)&buf[22] = 2082;
              *(void *)&__int128 v81 = v27;
              _os_log_impl( &dword_181A5C000,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s [%{public}s] Failed to create inbox for %{public}s",  buf,  0x20u);
            }
          }
        }
      }
    }

    uint64_t v69 = 0LL;
    v70 = &v69;
    uint64_t v71 = 0x2020000000LL;
    char v72 = 0;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    *(void *)&__int128 v81 = __Block_byref_object_copy__17859;
    *((void *)&v81 + 1) = __Block_byref_object_dispose__17860;
    id v82 = 0LL;
    uint64_t v63 = 0LL;
    v64 = &v63;
    uint64_t v65 = 0x3032000000LL;
    v66 = __Block_byref_object_copy__3;
    v67 = __Block_byref_object_dispose__4;
    id v68 = 0LL;
    uint64_t v57 = 0LL;
    v58 = &v57;
    uint64_t v59 = 0x3032000000LL;
    v60 = __Block_byref_object_copy__3;
    v61 = __Block_byref_object_dispose__4;
    id v62 = 0LL;
    uint64_t v51 = 0LL;
    v52 = &v51;
    uint64_t v53 = 0x3032000000LL;
    v54 = __Block_byref_object_copy__17859;
    v55 = __Block_byref_object_dispose__17860;
    id v56 = 0LL;
    v50[0] = MEMORY[0x1895F87A8];
    v50[1] = 3221225472LL;
    v50[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_40;
    v50[3] = &unk_189BB9B48;
    v50[4] = v12;
    v50[5] = &v69;
    v50[6] = buf;
    v50[7] = &v63;
    v50[8] = &v57;
    v50[9] = &v51;
    v28 = (void (**)(void))_Block_copy(v50);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v28[2](v28);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    if (v58[5])
    {
      v29 = nw_connection_copy_endpoint((nw_connection_t)v6);
      nw_group_descriptor_t multiplex = nw_group_descriptor_create_multiplex(v29);
      v31 = nw_connection_group_create_with_connection(multiplex, v6);
      v47[0] = MEMORY[0x1895F87A8];
      v47[1] = 3221225472LL;
      v47[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2;
      v47[3] = &unk_189BC9210;
      v48 = v31;
      v49 = &v57;
      v32 = v31;
      id v33 = _Block_copy(v47);
    }

    else
    {
      if (!v64[5])
      {
        uint64_t v39 = *((void *)self + 2);
        if (!v39 || nw_path_parameters_get_logging_disabled(*(void *)(v39 + 104)))
        {
          id v33 = 0LL;
          goto LABEL_58;
        }

        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        v38 = (os_log_s *)(id)glistenerLogObj;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v40 = nw_listener_get_id_string(v12);
          *(_DWORD *)v76 = 136446466;
          v77 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
          __int16 v78 = 2082;
          v79 = v40;
          _os_log_impl( &dword_181A5C000,  v38,  OS_LOG_TYPE_ERROR,  "%{public}s [%{public}s] Neither connection handler nor connection group handler is set",  v76,  0x16u);
        }

        id v33 = 0LL;
        goto LABEL_57;
      }

      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3;
      v44[3] = &unk_189BC9210;
      v46 = &v63;
      v45 = (nw_endpoint *)v6;
      id v33 = _Block_copy(v44);
      v29 = v45;
    }

    if (*((_BYTE *)v70 + 24))
    {
LABEL_47:
      nw_utilities_execute_block_as_persona_from_parameters((void *)v52[5], v33);
LABEL_58:

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v57, 8);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v69, 8);
      goto LABEL_59;
    }

    v34 = *(void **)(*(void *)&buf[8] + 40LL);
    if (!v34)
    {
      v34 = *(void **)(*(void *)&buf[8] + 40LL);
      if (!v34) {
        goto LABEL_58;
      }
    }

    dispatch_qos_class_t v35 = *((_DWORD *)v12 + 18);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_41;
    block[3] = &unk_189BBF570;
    v43 = &v51;
    id v33 = v33;
    v42 = (os_log_s *)v33;
    v36 = v34;
    dispatch_block_t v37 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v35, 0, block);
    dispatch_async(v36, v37);

    v38 = v42;
LABEL_57:

    goto LABEL_58;
  }

- (void)handleInboundPacket:(const char *)a3 length:(unsigned __int16)a4 from:(id)a5 to:(id)a6 interface:(id)a7 socket:(id)a8
{
  unsigned int v11 = a4;
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  nw_context_assert_queue(*((void **)self + 3));
  if (!a3)
  {
    __nwlog_obj();
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      dispatch_qos_class_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_181A5C000, v35, v36, "%{public}s called with null buffer", buf, 0xCu);
      }
    }

    else if (v81[0])
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      dispatch_qos_class_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v48 = type[0];
      BOOL v49 = os_log_type_enabled(v35, type[0]);
      if (backtrace_string)
      {
        if (v49)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v35,  v48,  "%{public}s called with null buffer, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_128:
        if (!v34) {
          goto LABEL_30;
        }
LABEL_129:
        free(v34);
        goto LABEL_30;
      }

      if (v49)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_181A5C000, v35, v48, "%{public}s called with null buffer, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      dispatch_qos_class_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v61 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl( &dword_181A5C000,  v35,  v61,  "%{public}s called with null buffer, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (void)handleInboxFailed:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = (nw_listener_inbox *)a3;
  id v7 = a4;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v8 = *((void *)self + 2);
  if (v8 && !nw_path_parameters_get_logging_disabled(*(void *)(v8 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    uint64_t v9 = (os_log_s *)(id)glistenerLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self;
      unsigned int v11 = (char *)v10 + 42;

      int v19 = 136446722;
      dispatch_data_t v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
      __int16 v21 = 2082;
      id v22 = v11;
      __int16 v23 = 2114;
      dispatch_qos_class_t v24 = v6;
      _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s [%{public}s] inbox failed: %{public}@",  (uint8_t *)&v19,  0x20u);
    }
  }

  uint64_t v12 = *((void *)self + 18);
  if (!v12 || !v6) {
    goto LABEL_18;
  }
  id v14 = *(nw_listener_inbox ***)(v12 + 16);
  uint64_t v13 = *(nw_listener_inbox ***)(v12 + 24);
  if (v14 != v13)
  {
    while (*v14 != v6)
    {
      if (++v14 == v13)
      {
        id v14 = *(nw_listener_inbox ***)(v12 + 24);
        break;
      }
    }
  }

  if (v14 != v13)
  {
    nw_array_remove_object(v12, (uint64_t)v6);
    nw_listener_cancel_inbox_on_queue(self, v6);
    uint64_t v15 = *((void *)self + 18);
    if (!v15 || *(void *)(v15 + 24) == *(void *)(v15 + 16)) {
      nw_listener_set_state_on_queue(self, 1, v7);
    }
  }

  else
  {
LABEL_18:
    uint64_t v16 = *((void *)self + 2);
    if (v16 && !nw_path_parameters_get_logging_disabled(*(void *)(v16 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      id v17 = (os_log_s *)(id)glistenerLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = self;

        int v19 = 136446466;
        dispatch_data_t v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
        __int16 v21 = 2082;
        id v22 = (char *)v18 + 42;
        _os_log_impl( &dword_181A5C000,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s [%{public}s] inbox already removed, not cancelling redundantly",  (uint8_t *)&v19,  0x16u);
      }
    }
  }
}

- (void)handleInboxCancelComplete:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  int v5 = *((_DWORD *)self + 74);
  if (v5)
  {
    int v6 = v5 - 1;
    *((_DWORD *)self + 74) = v6;
    uint64_t v7 = *((void *)self + 2);
    if (v7)
    {
      if (!nw_path_parameters_get_logging_disabled(*(void *)(v7 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
        }
        uint64_t v8 = (os_log_s *)(id)glistenerLogObj;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = self;
          v10 = (char *)v9 + 42;

          int v11 = *((_DWORD *)self + 74);
          *(_DWORD *)buf = 136446978;
          uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
          __int16 v28 = 2082;
          v29 = v10;
          __int16 v30 = 2114;
          id v31 = v4;
          __int16 v32 = 1024;
          LODWORD(v33) = v11;
          _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Removing deferral for %{public}@ -> %d",  buf,  0x26u);
        }
      }

      int v6 = *((_DWORD *)self + 74);
    }

    if (!v6)
    {
      if ((*((_BYTE *)self + 302) & 1) != 0)
      {
        nw_listener_cancel_complete_on_queue(self);
      }

      else if (*((int *)self + 32) <= 2)
      {
        nw_listener_reconcile_inboxes_on_queue(self);
      }
    }

    goto LABEL_36;
  }

  uint64_t v12 = *((void *)self + 2);
  if (!v12 || nw_path_parameters_get_logging_disabled(*(void *)(v12 + 104))) {
    goto LABEL_36;
  }
  if (__nwlog_listener_log::onceToken != -1) {
    dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
  }
  id v13 = (id)glistenerLogObj;
  id v14 = self;

  *(_DWORD *)buf = 136446722;
  uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
  __int16 v28 = 2082;
  v29 = (char *)v14 + 42;
  __int16 v30 = 2114;
  id v31 = v4;
  uint64_t v15 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (type == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    uint64_t v16 = (os_log_s *)(id)glistenerLogObj;
    os_log_type_t v17 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      __int16 v28 = 2082;
      v29 = (char *)v14 + 42;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count",  buf,  0x20u);
    }

- (void)updateParametersForNewConnection:(id)a3
{
  id v4 = (nw_parameters *)a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = __Block_byref_object_copy__17859;
  id v14 = __Block_byref_object_dispose__17860;
  id v15 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke;
  aBlock[3] = &unk_189BC9210;
  aBlock[4] = self;
  void aBlock[5] = &v10;
  int v6 = (void (**)(void))_Block_copy(aBlock);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v6[2](v6);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  if (v11[5])
  {
    uint64_t v7 = nw_parameters_copy_default_protocol_stack(v4);
    v8[0] = v5;
    v8[1] = 3221225472LL;
    v8[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2;
    v8[3] = &unk_189BBD078;
    v8[4] = self;
    v8[5] = &v10;
    nw_protocol_stack_iterate_application_protocols(v7, v8);
  }

  _Block_object_dispose(&v10, 8);
}

- (id)getIDSInformation
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  int v11 = __Block_byref_object_copy__17859;
  uint64_t v12 = __Block_byref_object_dispose__17860;
  id v13 = 0LL;
  v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__NWConcrete_nw_listener_getIDSInformation__block_invoke;
  v7[3] = &unk_189BC9210;
  v7[4] = self;
  v7[5] = &v8;
  id v4 = (void (**)(void))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (char)getPeerDeviceID
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke;
  v7[3] = &unk_189BC9210;
  v7[4] = self;
  v7[5] = &v8;
  id v4 = (void (**)(void))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  id v5 = (char *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (*((void *)self + 32))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
    int v22 = 12;
    os_log_type_t v21 = buf;
    id v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating",  buf,  0xCu);
      }

- (NSString)description
{
  v2 = self;
  id v3 = (os_unfair_lock_s *)v2;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  if (v2)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __nw_listener_copy_description_block_invoke;
    v8[3] = &unk_189BC9210;
    uint64_t v9 = v2;
    os_log_type_t v10 = &v11;
    id v4 = (void (**)(void))_Block_copy(v8);
    os_unfair_lock_lock(v3 + 2);
    v4[2](v4);
    os_unfair_lock_unlock(v3 + 2);

    id v5 = (const char *)v12[3];
  }

  else
  {
    id v5 = 0LL;
  }

  _Block_object_dispose(&v11, 8);

  if (v5) {
    os_log_type_t v6 = (__CFString *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v5,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  else {
    os_log_type_t v6 = 0LL;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (char)initWithParameters:(void *)a3 multicastDescriptor:
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  if (!a1)
  {
LABEL_99:
    uint64_t v30 = 0LL;
    goto LABEL_49;
  }

  v60.receiver = a1;
  v60.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_listener;
  uint64_t v8 = (char *)objc_msgSendSuper2(&v60, sel_init);
  if (!v8)
  {
    __nwlog_obj();
    os_log_type_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
    v43 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v58 = 0;
    if (__nwlog_fault(v43, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v45 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_181A5C000, v44, v45, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v58)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v51 = type;
        BOOL v52 = os_log_type_enabled(v44, type);
        if (backtrace_string)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
            __int16 v63 = 2082;
            os_log_type_t v64 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v44,  v51,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_91;
        }

        if (v52)
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_181A5C000, v44, v51, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v56 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl( &dword_181A5C000,  v44,  v56,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end