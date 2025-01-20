void ___mdns_resolver_set_up_server_path_evaluator_block_invoke(uint64_t a1, nw_path *a2)
{
  char server_usability_from_path;
  uint64_t v4;
  int v5;
  unsigned int v6;
  os_log_s *v7;
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  os_log_s *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  server_usability_from_path = _mdns_get_server_usability_from_path( a2,  (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 16LL) + 144LL) - 3) < 2);
  v4 = *(void *)(a1 + 40);
  v5 = *(char *)(v4 + 106);
  if (server_usability_from_path != *(_BYTE *)(v4 + 106))
  {
    v6 = v5 - 1;
    *(_BYTE *)(v4 + 106) = server_usability_from_path;
    if ((server_usability_from_path - 1) > 3u)
    {
      if (v6 <= 3)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        v11 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(void *)(a1 + 40);
          v14 = 138412290;
          v15 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Server %@ usability is now unusable",  (uint8_t *)&v14,  0xCu);
        }
      }
    }

    else
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      v7 = (os_log_s *)_mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void *)(a1 + 40);
        v9 = *(char *)(v8 + 106) + 1;
        if (v9 > 5) {
          v10 = "<INVALID USABILITY>";
        }
        else {
          v10 = off_10013D7F0[v9];
        }
        v14 = 138412546;
        v15 = v8;
        v16 = 2082;
        v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Server %@ usability is now %{public}s",  (uint8_t *)&v14,  0x16u);
      }

      if (v5 == 4 || v6 >= 4)
      {
        _mdns_resolver_unpenalize_server(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
        _mdns_resolver_handle_revived_server(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, 0LL);
      }
    }
  }

void ___mdns_resolver_set_up_server_path_evaluator_block_invoke_62(uint64_t a1)
{
}

uint64_t _mdns_get_server_usability_from_path(nw_path *a1, int a2)
{
  nw_path_status_t status = nw_path_get_status(a1);
  char v5 = 1;
  if (status != nw_path_status_satisfied && status != nw_path_status_satisfiable)
  {
    if (status == nw_path_status_unsatisfied)
    {
      if ((nw_path_is_per_app_vpn(a1) & 1) != 0) {
        return 3;
      }
      if ((nw_path_has_nat64_prefixes(a1) & 1) != 0 || a2 && nw_path_has_dns(a1))
      {
        v6 = (nw_endpoint *)nw_path_copy_endpoint(a1);
        if (v6)
        {
          v7 = v6;
          if (nw_endpoint_get_type(v6) == nw_endpoint_type_address)
          {
            address = nw_endpoint_get_address(v7);
            if (address)
            {
              int sa_family = address->sa_family;
              nw_release(v7);
              if (sa_family == 2) {
                return 2;
              }
              else {
                return -1;
              }
            }
          }

          nw_release(v7);
        }
      }
    }

    return -1;
  }

  return v5;
}

void _mdns_resolver_check_for_problematic_servers(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(a1 + 16) + 158LL) || *(void *)(a1 + 104)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2)
  {
LABEL_8:
    if (!*(_BYTE *)(a1 + 140))
    {
      if (_mdns_resolver_queue_s_once != -1) {
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
      }
      dispatch_source_t v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)_mdns_resolver_queue_s_queue);
      *(void *)(a1 + 104) = v3;
      if (!v3)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        v7 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to create probe timer",  buf,  2u);
        }

        return;
      }

      v4 = v3;
      dispatch_time_t v5 = dispatch_time(0x8000000000000000LL, 7200000000000LL);
      dispatch_source_set_timer(v4, v5, 0x68C61714000uLL, 0x53D1AC1000uLL);
      v6 = *(dispatch_source_s **)(a1 + 104);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = ___mdns_resolver_check_for_problematic_servers_block_invoke;
      handler[3] = &__block_descriptor_tmp_125_4619;
      handler[4] = a1;
      dispatch_source_set_event_handler(v6, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 104));
      _mdns_resolver_start_probe_querier(a1);
    }

    if (!*(_BYTE *)(a1 + 139))
    {
      *(_BYTE *)(a1 + 139) = 1;
      _mdns_resolver_generate_connection_event(a1);
    }

    return;
  }

  while ((*(char *)(v2 + 106) - 1) > 3 || *(_BYTE *)(v2 + 110) || *(_DWORD *)(v2 + 96) >= 3u)
  {
    uint64_t v2 = *(void *)(v2 + 24);
    if (!v2) {
      goto LABEL_8;
    }
  }

void ___mdns_resolver_check_for_problematic_servers_block_invoke(uint64_t a1)
{
}

void _mdns_resolver_start_probe_querier(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (v2)
  {
    mdns_client_invalidate(v2);
    os_release(*(void **)(a1 + 112));
    *(void *)(a1 + 112) = 0LL;
  }

  uint64_t querier = mdns_resolver_create_querier((void *)a1);
  *(void *)(a1 + 112) = querier;
  if (querier)
  {
    int v10 = *(_DWORD *)(a1 + 120) + 1;
    *(_DWORD *)(a1 + 120) = v10;
    mdns_querier_set_log_label(querier, "PQ%u", v4, v5, v6, v7, v8, v9, v10);
    uint64_t v11 = *(void *)(a1 + 112);
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
    }
    mdns_client_set_queue(v11, (dispatch_object_t)_mdns_resolver_queue_s_queue);
    mdns_querier_set_query(*(void *)(a1 + 112), "\x05apple\x03com", 2LL);
    mdns_client_activate(*(void *)(a1 + 112));
  }

  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    v12 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create probe querier", buf, 2u);
    }
  }

void _mdns_resolver_generate_connection_event(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "cannot_connect", *(_BYTE *)(a1 + 139));
  _mdns_resolver_generate_event((dispatch_queue_s **)a1, 2, v2);
  if (v2) {
    xpc_release(v2);
  }
}

void _mdns_resolver_generate_event(dispatch_queue_s **object, int a2, void *a3)
{
  if (!*((_BYTE *)object + 136))
  {
    if (object[10])
    {
      os_retain(object);
      xpc_retain(a3);
      uint64_t v6 = object[9];
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = ___mdns_resolver_generate_event_block_invoke;
      block[3] = &__block_descriptor_tmp_108_4621;
      int v8 = a2;
      block[4] = object;
      block[5] = a3;
      dispatch_async(v6, block);
    }
  }

void ___mdns_resolver_generate_event_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
}

uint64_t mdns_resolver_create_querier(void *a1)
{
  uint64_t v2 = _os_object_alloc(&OBJC_CLASS___OS_mdns_querier, 256LL);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = &_mdns_querier_kind;
  *(void *)(v2 + 16) = &_mdns_querier_kind;
  do
  {
    uint64_t v5 = (void (*)(uint64_t))v4[2];
    if (v5) {
      v5(v3);
    }
    uint64_t v4 = (_UNKNOWN **)*v4;
  }

  while (v4);
  *(_DWORD *)(v3 + 208) = 0;
  *(void *)(v3 + 64) = a1;
  os_retain(a1);
  uint64_t v6 = mdns_query_message_create();
  *(void *)(v3 + 88) = v6;
  if (v6) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (!v6) {
    os_release((void *)v3);
  }
  return v7;
}

void mdns_querier_set_log_label( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    v13[0] = 0LL;
    v13[1] = &a9;
    vasprintf(v13, a2, &a9);
    if (v13[0])
    {
      v12 = 0LL;
      asprintf(&v12, "[%s] ", v13[0]);
      int v10 = v12;
      if (v12)
      {
        uint64_t v11 = *(void **)(a1 + 128);
        if (v11)
        {
          free(v11);
          int v10 = v12;
        }

        *(void *)(a1 + 128) = v10;
        v12 = 0LL;
      }

      if (v13[0]) {
        free(v13[0]);
      }
    }
  }

void mdns_querier_set_query(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  int v6 = 0;
  uint64_t v5 = mdns_domain_name_create_with_labels(a2, &v6);
  if (!v6 && !*(_BYTE *)(a1 + 49)) {
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)(a1 + 16) + 56LL))(a1, v5, a3, 1LL);
  }
  if (v5) {
    os_release(v5);
  }
}

void *_mdns_querier_copy_description(void *a1, int a2, char a3)
{
  int v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  if (DNSRecordTypeValueToString(*(unsigned __int16 *)(a1[11] + 64LL))
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " TYPE%u"))
  {
    goto LABEL_18;
  }

  int v10 = *(unsigned __int16 *)(a1[11] + 66LL);
  uint64_t v11 = "ANY";
  if (v10 != 255) {
    uint64_t v11 = 0LL;
  }
  if (v10 == 1) {
    uint64_t v11 = "IN";
  }
  if (v11
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " CLASS%u"))
  {
LABEL_18:
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = mdns_string_builder_copy_string((uint64_t)v7);
  }

  os_release(v7);
  return v9;
}

void _mdns_querier_finalize(void *a1)
{
  a1[9] = 0LL;
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    os_release(v2);
    a1[8] = 0LL;
  }

  uint64_t v3 = (const void *)a1[10];
  if (v3)
  {
    _Block_release(v3);
    a1[10] = 0LL;
  }

  uint64_t v4 = (void *)a1[11];
  if (v4)
  {
    os_release(v4);
    a1[11] = 0LL;
  }

  uint64_t v5 = (void *)a1[16];
  if (v5)
  {
    free(v5);
    a1[16] = 0LL;
  }

  int v6 = (void *)a1[17];
  if (v6)
  {
    os_release(v6);
    a1[17] = 0LL;
  }

  uint64_t v7 = (void *)a1[20];
  if (v7)
  {
    os_release(v7);
    a1[20] = 0LL;
  }

  int v8 = (void *)a1[24];
  if (v8)
  {
    os_release(v8);
    a1[24] = 0LL;
  }

  _mdns_querier_clear_delegation((uint64_t)a1);
}

uint64_t _mdns_querier_get_internal_queue()
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  return _mdns_resolver_queue_s_queue;
}

void _mdns_querier_set_query(uint64_t a1, void *a2, __int16 a3, __int16 a4)
{
  uint64_t v7 = *(void *)(a1 + 88);
  if ((*(_BYTE *)(v7 + 70) & 0x20) == 0)
  {
    *(_WORD *)(v7 + 64) = a3;
    *(_WORD *)(v7 + 66) = a4;
  }

void _mdns_querier_activate(_BYTE *object)
{
  if (!object[249])
  {
    object[249] = 1;
    if (!object[254])
    {
      os_retain(object);
      object[254] = 1;
    }

    if (*(_BYTE *)(*(void *)(*((void *)object + 8) + 16LL) + 160LL))
    {
      LOWORD(v2) = 0;
    }

    else
    {
      uint32_t v3 = arc4random();
      unsigned int v2 = v3 + v3 / 0xFFFF + 1;
    }

    uint64_t v4 = *((void *)object + 11);
    char v5 = *(_BYTE *)(v4 + 70);
    if ((v5 & 0x20) == 0)
    {
      *(_WORD *)(v4 + 68) = v2;
      *(_BYTE *)(v4 + 70) = v5 & 0xF7 | (8 * *(_BYTE *)(*(void *)(*((void *)object + 8) + 16LL) + 159LL));
      uint64_t v4 = *((void *)object + 11);
      char v5 = *(_BYTE *)(v4 + 70);
    }

    uint64_t v6 = *((void *)object + 8);
    if ((v5 & 0x20) == 0)
    {
      *(_BYTE *)(v4 + 70) = v5 & 0xEF | (16 * ((*(_DWORD *)(*(void *)(v6 + 16) + 144LL) - 3) < 2));
      uint64_t v6 = *((void *)object + 8);
    }

    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 136LL);
    if (v7)
    {
      uint64_t v8 = v7();
      if (v8)
      {
        int v9 = *(unsigned __int8 *)(v8 + 1);
        if (v9 == 30)
        {
          uint64_t v12 = *((void *)object + 11);
          if ((*(_BYTE *)(v12 + 70) & 0x20) == 0)
          {
            *(_WORD *)(v12 + 71) = 14338;
            *(void *)(v12 + 81) = 0LL;
            *(void *)(v12 + 73) = 0LL;
            int v13 = *(_DWORD *)(v8 + 8);
            *(_DWORD *)(v12 + 76) = *(_DWORD *)(v8 + 11);
            *(_DWORD *)(v12 + 73) = v13;
          }
        }

        else if (v9 == 2)
        {
          uint64_t v10 = *((void *)object + 11);
          if ((*(_BYTE *)(v10 + 70) & 0x20) == 0)
          {
            unsigned int v11 = bswap32(*(_DWORD *)(v8 + 4));
            *(_WORD *)(v10 + 71) = 6145;
            *(void *)(v10 + 76) = 0LL;
            *(void *)(v10 + 81) = 0LL;
            *(_BYTE *)(v10 + 73) = HIBYTE(v11);
            *(_BYTE *)(v10 + 74) = BYTE2(v11);
            *(_BYTE *)(v10 + 75) = BYTE1(v11);
          }
        }
      }
    }

    int message_construct = mdns_query_message_construct(*((void *)object + 11));
    if (message_construct)
    {
      _mdns_querier_conclude_with_error_async(object, message_construct);
      return;
    }

    if (object[249] == 1)
    {
      uint64_t v15 = *((void *)object + 8);
      if (*(_BYTE *)(v15 + 136))
      {
        _mdns_querier_conclude_async(object);
        return;
      }

      if (*((void *)object + 16)) {
        v16 = (const char *)*((void *)object + 16);
      }
      else {
        v16 = "";
      }
      signed int v17 = *((_DWORD *)object + 59);
      if (v17)
      {
        if (v17 < 1)
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          v21 = (os_log_s *)_mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            LODWORD(handler) = 136446210;
            *(void *)((char *)&handler + 4) = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%{public}sPending querier will start when DNS traffic is observed",  (uint8_t *)&handler,  0xCu);
          }

          goto LABEL_37;
        }

        oneshot_timer = _mdns_resolver_create_oneshot_timer(v17, 0);
        *((void *)object + 19) = oneshot_timer;
        if (oneshot_timer)
        {
          *(void *)&__int128 handler = _NSConcreteStackBlock;
          *((void *)&handler + 1) = 0x40000000LL;
          v31 = ___mdns_resolver_handle_new_querier_block_invoke;
          v32 = &__block_descriptor_tmp_135_4644;
          v33 = object;
          uint64_t v34 = v15;
          dispatch_source_set_event_handler(oneshot_timer, &handler);
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          v19 = (os_log_s *)_mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            int v20 = *((_DWORD *)object + 59);
            int v26 = 136446466;
            v27 = v16;
            __int16 v28 = 1024;
            int v29 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%{public}sPending querier will start after at most %d ms or when DNS traffic is observed",  (uint8_t *)&v26,  0x12u);
          }

          dispatch_activate(*((dispatch_object_t *)object + 19));
LABEL_37:
          v22 = (void *)(v15 + 40);
          do
          {
            v23 = v22;
            uint64_t v24 = *v22;
            v22 = (void *)(*v22 + 56LL);
          }

          while (v24);
          void *v23 = object;
          os_retain(object);
          return;
        }

        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        v25 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LODWORD(handler) = 136446210;
          *(void *)((char *)&handler + 4) = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}sFailed to create flexible start timer for querier, will start immediately",  (uint8_t *)&handler,  0xCu);
        }
      }

      _mdns_resolver_start_querier(v15, object);
    }
  }

void _mdns_querier_invalidate(uint64_t a1)
{
}

uint64_t _mdns_querier_get_name(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 88) + 56LL);
}

uint64_t _mdns_querier_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(*(void *)(a1 + 88) + 64LL);
}

uint64_t _mdns_querier_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(*(void *)(a1 + 88) + 66LL);
}

void _mdns_querier_conclude_ex(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v8 = *(dispatch_object_s **)(a1 + 96);
  if (v8)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v8);
    *(void *)(a1 + 96) = 0LL;
  }

  int v9 = *(dispatch_object_s **)(a1 + 120);
  if (v9)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v9);
    *(void *)(a1 + 120) = 0LL;
  }

  uint64_t v10 = *(dispatch_object_s **)(a1 + 152);
  if (v10)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 152));
    dispatch_release(v10);
    *(void *)(a1 + 152) = 0LL;
  }

  unsigned int v11 = *(void **)(a1 + 144);
  if (v11)
  {
    os_release(v11);
    *(void *)(a1 + 144) = 0LL;
  }

  _mdns_resolver_deregister_querier(*(void *)(a1 + 64), a1);
  if (*(_BYTE *)(a1 + 249) != 3)
  {
    *(_BYTE *)(a1 + 249) = 3;
    switch(a2)
    {
      case 1:
        if (a4) {
          os_retain(a4);
        }
        uint64_t v12 = *(void **)(a1 + 136);
        if (v12) {
          os_release(v12);
        }
        *(void *)(a1 + 136) = a4;
        int v13 = *(void **)(a1 + 160);
        if (v13)
        {
          os_release(v13);
          *(void *)(a1 + 160) = 0LL;
          a4 = *(void **)(a1 + 136);
        }

        v14 = (unsigned __int16 *)a4[4];
        unint64_t v15 = a4[5];
        *(void *)buf = 0LL;
        if (!DNSMessageGetAnswerSection((unint64_t)v14, v15, (char **)buf))
        {
          unsigned int v16 = __rev16(v14[4]) + (bswap32(v14[3]) >> 16);
          if (v16)
          {
            while (1)
            {
              LOWORD(size) = 0;
              if (_DNSMessageExtractRecordEx( (unint64_t)v14,  v15,  *(char **)buf,  0LL,  &size,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  buf)
                || (unsigned __int16)size == 41)
              {
                break;
              }

              if (!--v16) {
                goto LABEL_22;
              }
            }
          }

          else
          {
LABEL_22:
            unsigned int v17 = __rev16(v14[5]);
            if (v17)
            {
              unint64_t v18 = 0LL;
              v19 = 0LL;
              while (1)
              {
                LOWORD(size) = 0;
                int v20 = *(_BYTE **)buf;
                if (_DNSMessageExtractRecordEx( (unint64_t)v14,  v15,  *(char **)buf,  0LL,  &size,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  buf)) {
                  break;
                }
                if ((unsigned __int16)size == 41)
                {
                  if (v19 || *v20) {
                    break;
                  }
                  unint64_t v18 = *(void *)buf - (void)v20;
                  v19 = v20;
                }

                if (!--v17)
                {
                  if (!v19 || v18 < 0xB) {
                    break;
                  }
                  v21 = (unsigned __int16 *)&v19[v18];
                  v22 = (unsigned __int16 *)(v19 + 11);
                  while (1)
                  {
                    uint64_t v23 = 0LL;
                    uint64_t v24 = v22;
                    v25 = v22 + 2;
                    uint64_t v26 = __rev16(v24[1]);
                    v22 = (unsigned __int16 *)((char *)v25 + v26);
                    if (__rev16(*v24) == 15)
                    {
                      char v27 = (_BYTE)v22 - ((_BYTE)v24 + 6);
                      size_t v28 = (unsigned __int16)((_WORD)v22 - ((_WORD)v24 + 6));
                      if ((_WORD)v22 == (_WORD)v24 + 6) {
                        int v29 = 0LL;
                      }
                      else {
                        int v29 = (const char *)(v24 + 3);
                      }
                      unsigned int v30 = v24[2];
                      uint64_t v31 = _os_object_alloc(&OBJC_CLASS___OS_mdns_extended_dns_error, 40LL);
                      uint64_t v23 = v31;
                      if (!v31) {
                        goto LABEL_90;
                      }
                      unsigned int v32 = bswap32(v30) >> 16;
                      v33 = &_mdns_extended_dns_error_kind;
                      *(void *)(v31 + 16) = &_mdns_extended_dns_error_kind;
                      do
                      {
                        uint64_t v34 = (void (*)(uint64_t))v33[2];
                        if (v34) {
                          v34(v23);
                        }
                        v33 = (_UNKNOWN **)*v33;
                      }

                      while (v33);
                      if (v28)
                      {
                        uint64_t v35 = *(void *)(v23 + 24);
                      }

                      else
                      {
                        if (_mdns_copy_empty_string_s_once != -1) {
                          dispatch_once(&_mdns_copy_empty_string_s_once, &__block_literal_global_6884);
                        }
                        if (_mdns_copy_empty_string_s_empty_string)
                        {
                          xpc_retain((xpc_object_t)_mdns_copy_empty_string_s_empty_string);
                          uint64_t v35 = _mdns_copy_empty_string_s_empty_string;
                        }

                        else
                        {
                          uint64_t v35 = 0LL;
                        }

                        *(void *)(v23 + 24) = v35;
                      }

                      if (v35
                        || (unsigned __int16 v45 = strnlen(v29, v28),
                            (CFStringRef v46 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)v29, v45, 0x8000100u, 0)) != 0LL)
                        && (CFRelease(v46),
                            xpc_object_t v55 = mdns_xpc_string_create_with_format(v47, v48, v49, v50, v51, v52, v53, v54, v27),
                            (*(void *)(v23 + 24) = v55) != 0LL))
                      {
                        *(_WORD *)(v23 + 32) = v32;
                        goto LABEL_90;
                      }

                      os_release((void *)v23);
                      goto LABEL_89;
                    }
                  }
                }
              }
            }
          }
        }

LABEL_105:
        LODWORD(v56) = 0;
LABEL_116:
        if (a3 == 1) {
          int v72 = 1;
        }
        else {
          int v72 = v56;
        }
        *(_BYTE *)(a1 + 253) = v72;
        if (v72 == 1)
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          v36 = (os_log_s *)_mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            v73 = *(const char **)(a1 + 128);
            if (!v73) {
              v73 = "";
            }
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v73;
            v38 = "%{public}sQuerier concluded -- reason: response (fabricated)";
            goto LABEL_132;
          }
        }

        else
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          v36 = (os_log_s *)_mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            v74 = *(const char **)(a1 + 128);
            if (!v74) {
              v74 = "";
            }
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v74;
            v38 = "%{public}sQuerier concluded -- reason: response";
            goto LABEL_132;
          }
        }

                          v41 = *((_DWORD *)a3 + 2);
                          *(_DWORD *)buf = 67110403;
                          *(_DWORD *)CFStringRef v46 = v24;
                          *(_WORD *)&v46[4] = 1024;
                          *(_DWORD *)&v46[6] = v25;
                          strcpy((char *)&v47, "p\bhash");
                          HIBYTE(v47) = 0;
                          *(_DWORD *)uint64_t v48 = 68157440;
                          *(_DWORD *)&v48[4] = v40;
                          *(_WORD *)&v48[8] = 2101;
                          *(void *)&uint64_t v49 = v26;
                          WORD4(v49) = 1024;
                          *(_DWORD *)((char *)&v49 + 10) = v41;
                          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "[Q%u->SubQ%u] Insecure validation complete, scheduling cache update - insecure zone: %{sensi tive, mask.hash, mdnsresponder:domain_name}.*P, ttl: %u",  buf,  0x2Eu);
                        }
                      }

                      *(void *)(v18 + 88) = a3;
                      v42 = dword_100158BF8;
                      dword_100158C5C = v42;
LABEL_109:
                      if (a4)
                      {
LABEL_112:
                        _dnssec_make_validation_progress(*(void *)(v7 + 64));
                        goto LABEL_113;
                      }

void _mdns_resolver_deregister_querier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(dispatch_object_s **)(a2 + 96);
  if (v4)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a2 + 96));
    dispatch_release(v4);
    *(void *)(a2 + 96) = 0LL;
  }

  _mdns_forget_session_list((uint64_t *)(a2 + 104));
  _mdns_forget_session_list((uint64_t *)(a2 + 112));
  char v5 = (void *)(a1 + 32);
  do
  {
    uint64_t v6 = v5;
    uint64_t v7 = *v5;
    char v5 = (void *)(*v5 + 56LL);
    if (v7) {
      BOOL v8 = v7 == a2;
    }
    else {
      BOOL v8 = 1;
    }
  }

  while (!v8);
  if (v7) {
    goto LABEL_17;
  }
  int v9 = (void *)(a1 + 40);
  do
  {
    uint64_t v6 = v9;
    uint64_t v10 = *v9;
    int v9 = (void *)(*v9 + 56LL);
    if (v10) {
      BOOL v11 = v10 == a2;
    }
    else {
      BOOL v11 = 1;
    }
  }

  while (!v11);
  if (v10)
  {
LABEL_17:
    void *v6 = *(void *)(a2 + 56);
    *(void *)(a2 + 56) = 0LL;
    os_release((void *)a2);
  }

void ___mdns_querier_conclude_ex_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 40) + 248LL) = *(_BYTE *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint32_t v3 = *(const void **)(a1 + 32);
    if (v3) {
      _Block_release(v3);
    }
  }

  os_release(*(void **)(a1 + 40));
}

void _mdns_forget_session_list(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    *a1 = 0LL;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      *(void *)(v1 + 24) = 0LL;
      _mdns_session_invalidate((_BYTE *)v1);
      os_release((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

void _mdns_session_invalidate(_BYTE *a1)
{
  a1[88] = 3;
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = ___mdns_session_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_45_4643;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_session_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint32_t v3 = *(void (**)(void))(*(void *)(v2 + 72) + 16LL);
  if (v3)
  {
    v3(*(void *)(v2 + 48));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(v2 + 48) = 0LL;
  os_release(*(void **)(a1 + 32));
}

void _mdns_session_invalidate_internal(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 40);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_release(v2);
    *(void *)(a1 + 40) = 0LL;
  }

  uint32_t v3 = *(void (**)(uint64_t))(*(void *)(a1 + 16) + 72LL);
  if (v3) {
    v3(a1);
  }
}

void _mdns_querier_conclude_async(void *a1)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000LL;
  v2[2] = ___mdns_querier_conclude_async_block_invoke;
  v2[3] = &__block_descriptor_tmp_136_4757;
  v2[4] = a1;
  char v3 = 4;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v2);
}

dispatch_source_s *_mdns_resolver_create_oneshot_timer(unsigned int a1, unsigned int a2)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  return _mdns_dispatch_create_monotonic_timer( a1,  0xFFFFFFFFFFFFFFFFLL,  a2,  (dispatch_queue_s *)_mdns_resolver_queue_s_queue);
}

void ___mdns_resolver_handle_new_querier_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(dispatch_object_s **)(v2 + 152);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 152));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 152LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = (void *)(*(void *)(a1 + 40) + 40LL);
  do
  {
    char v5 = v4;
    uint64_t v6 = *v4;
    uint64_t v4 = (void *)(*v4 + 56LL);
    if (v6) {
      BOOL v7 = v6 == v2;
    }
    else {
      BOOL v7 = 1;
    }
  }

  while (!v7);
  if (v6)
  {
    *char v5 = *(void *)(v2 + 56);
    *(void *)(v2 + 56) = 0LL;
    os_release((void *)v2);
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    BOOL v8 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
    {
      int v9 = *(const char **)(*(void *)(a1 + 32) + 128LL);
      if (!v9) {
        int v9 = "";
      }
      int v10 = 136446210;
      BOOL v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}sStarting pending querier because leeway elapsed",  (uint8_t *)&v10,  0xCu);
    }

    _mdns_resolver_start_querier(*(void *)(a1 + 40), *(_BYTE **)(a1 + 32));
  }

void _mdns_resolver_start_querier(uint64_t a1, _BYTE *object)
{
  if (object[249] == 1)
  {
    object[249] = 2;
    unsigned int v4 = *((_DWORD *)object + 56);
    else {
      _mdns_resolver_register_querier_ex(a1, object, 0);
    }
  }

void _mdns_querier_conclude_with_error_async(void *a1, int a2)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = ___mdns_querier_conclude_with_error_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_66_4648;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_querier_conclude_with_error_async_block_invoke(uint64_t a1)
{
}

uint64_t _mdns_querier_reset_time_limit(uint64_t a1, unsigned int a2)
{
  if (*(_BYTE *)(a1 + 249) != 2) {
    return 0LL;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  unsigned int v4 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    int v5 = *(const char **)(a1 + 128);
    if (!v5) {
      int v5 = "";
    }
    *(_DWORD *)buf = 136446466;
    BOOL v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%{public}sResetting time limit to %u ms",  buf,  0x12u);
  }

  uint64_t v6 = *(dispatch_object_s **)(a1 + 120);
  if (v6)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v6);
    *(void *)(a1 + 120) = 0LL;
  }

  if (!a2) {
    return 0LL;
  }
  oneshot_timer = _mdns_resolver_create_oneshot_timer(a2, 5u);
  *(void *)(a1 + 120) = oneshot_timer;
  if (oneshot_timer)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = ___mdns_querier_reset_time_limit_block_invoke;
    handler[3] = &__block_descriptor_tmp_116_4755;
    handler[4] = a1;
    dispatch_source_set_event_handler(oneshot_timer, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 120));
    return 0LL;
  }

  return 4294960567LL;
}

uint64_t _mdns_resolver_register_querier_ex(uint64_t a1, _WORD *object, int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v5 + 158)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (v6)
  {
    if (*(_BYTE *)(v5 + 161) && *(_BYTE *)(a1 + 134))
    {
      uint64_t v8 = *(void *)(a1 + 88) - mach_continuous_time();
      if ((v8 & 0x8000000000000000LL) == 0LL)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        int v9 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          if (mdns_mach_ticks_per_second_s_once != -1) {
            dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
          }
          int v15 = 134218240;
          unint64_t v16 = v8 / mdns_mach_ticks_per_second_s_ticks_per_second;
          __int16 v17 = 2048;
          unint64_t v18 = 1000
              * (v8 % mdns_mach_ticks_per_second_s_ticks_per_second)
              / mdns_mach_ticks_per_second_s_ticks_per_second;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Suspicious mode (%lld.%03lld seconds left): forcing query over bytestream",  (uint8_t *)&v15,  0x16u);
        }

        object[125] = 259;
        goto LABEL_6;
      }

      *(_BYTE *)(a1 + 134) = 0;
    }

    char v7 = 0;
    *((_BYTE *)object + 251) = 0;
    *((void *)object + 27) = 0LL;
    *((_DWORD *)object + 53) = 0;
    goto LABEL_20;
  }

  *((_BYTE *)object + 251) = 1;
LABEL_6:
  char v7 = 0;
  *((void *)object + 27) = 0LL;
  *((_DWORD *)object + 53) = 0;
  if (!*(_BYTE *)(a1 + 138)) {
    char v7 = *(_BYTE *)(*(void *)(a1 + 16) + 162LL) ^ 1;
  }
LABEL_20:
  *((_BYTE *)object + 252) = v7;
  int v10 = (void *)(a1 + 32);
  do
  {
    BOOL v11 = v10;
    uint64_t v12 = *v10;
    int v10 = (void *)(*v10 + 56LL);
  }

  while (v12);
  *BOOL v11 = object;
  os_retain(object);
  *((void *)object + 9) = 0LL;
  *((_BYTE *)object + 247) = 0;
  if (*((_BYTE *)object + 251)) {
    int v13 = 2000;
  }
  else {
    int v13 = *(_DWORD *)(*((void *)object + 8) + 124LL);
  }
  *((_DWORD *)object + 51) = v13;
  return _mdns_querier_initiate_send(object);
}

void _mdns_querier_initiate_send(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v2);
    *(void *)(a1 + 96) = 0LL;
  }

  uint64_t v3 = *(void *)(a1 + 72);
  unsigned int v4 = &unk_100150000;
  while (1)
  {
    if (v3) {
      goto LABEL_8;
    }
    if (*(void *)(a1 + 144) && !_mdns_resolver_get_server(*(void *)(a1 + 64), *(_DWORD *)(a1 + 228))) {
      break;
    }
    uint64_t eligible_server = _mdns_querier_get_eligible_server(a1);
    _mdns_querier_set_current_server(a1, eligible_server);
    uint64_t v3 = *(void *)(a1 + 72);
    if (!v3)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      v33 = (os_log_s *)*((void *)v4 + 131);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *(const char **)(a1 + 128);
        if (!v34) {
          uint64_t v34 = "";
        }
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%{public}sNo more eligible servers",  buf,  0xCu);
      }

      return;
    }

LABEL_8:
    uint64_t v6 = *(void *)(a1 + 64);
    if (*(_DWORD *)(*(void *)(v6 + 16) + 144LL) == 1 || *(_DWORD *)(v6 + 128))
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 88LL))(a1);
      if ((v7 & 0xFFFE) == 0x40)
      {
        uint64_t v8 = (_WORD *)v7;
        if (*(_BYTE *)(v3 + 112))
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          int v9 = (os_log_s *)*((void *)v4 + 131);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v10 = *(const char **)(a1 + 128);
            if (!v10) {
              int v10 = "";
            }
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = v10;
            *(_WORD *)&_BYTE buf[12] = 2112;
            *(void *)&buf[14] = v3;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v46) = (_DWORD)v8;
            BOOL v11 = v9;
            uint64_t v12 = "%{public}sNot sending query to server %@, which mixes up responses of type %{mdns:rrtype}d";
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 0x1Cu);
            goto LABEL_19;
          }

          goto LABEL_19;
        }

        if (!*(_BYTE *)(v3 + 107))
        {
          uint64_t v21 = *(void *)(v3 + 64);
          if (v21)
          {
            if (*(_DWORD *)(v21 + 8) >= *(_DWORD *)(v21 + 12))
            {
              if (_mdns_resolver_log_s_once != -1) {
                dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
              }
              v22 = (os_log_s *)*((void *)v4 + 131);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = *(const char **)(a1 + 128);
                if (!v23) {
                  uint64_t v23 = "";
                }
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = v23;
                *(_WORD *)&_BYTE buf[12] = 2112;
                *(void *)&buf[14] = v3;
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v46) = (_DWORD)v8;
                BOOL v11 = v22;
                uint64_t v12 = "%{public}sNot sending query to server %@, which ignores queries of type %{mdns:rrtype}d";
                goto LABEL_18;
              }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = object;
  xpc_retain(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
LABEL_9:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  unint64_t v18 = *(dispatch_object_s **)(a1 + 48);
  if (v18) {
    dispatch_release(v18);
  }
}

  if (mdns_system_log_s_once != -1) {
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6614);
  }
  uint64_t v5 = (os_log_s *)mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = a1;
    uint64_t v7 = 2048;
    uint64_t v8 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "if_indextoname() for %u failed: %{darwin.errno}ld",  (uint8_t *)v6,  0x12u);
  }

  return 0LL;
}

uint64_t _mdns_resolver_get_server(uint64_t a1, int a2)
{
  uint64_t v3 = (uint64_t *)(a1 + 24);
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if (*(_DWORD *)(result + 100) != 1
      || *(_BYTE *)(result + 108)
      || ((*(char *)(result + 106) - 1) <= 3 ? (BOOL v5 = (a2 & 1) == 0) : (BOOL v5 = 0), !v5))
    {
      uint64_t v6 = mach_continuous_time();
      uint64_t v7 = *v3;
      if (*v3)
      {
        uint64_t v8 = v6;
        int v9 = v3;
        do
        {
          if (*(_BYTE *)(v7 + 108) && (uint64_t v10 = v8 - *(void *)(v7 + 72), v10 >= 0))
          {
            *int v9 = *(void *)(v7 + 24);
            *(void *)(v7 + 24) = 0LL;
            *(_BYTE *)(v7 + 108) = 0;
            uint64_t v11 = *v3;
            if (*v3 && !*(_BYTE *)(v11 + 108))
            {
              unsigned int v14 = *(_DWORD *)(v7 + 100);
              uint64_t v12 = v3;
              if (*(_DWORD *)(v11 + 100) <= v14)
              {
                do
                {
                  uint64_t v15 = v11;
                  uint64_t v11 = *(void *)(v11 + 24);
                }

                while (v11 && !*(_BYTE *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v14);
                uint64_t v12 = (uint64_t *)(v15 + 24);
              }
            }

            else
            {
              uint64_t v12 = v3;
            }

            *(void *)(v7 + 24) = v11;
            uint64_t *v12 = v7;
            if (_mdns_resolver_log_s_once != -1) {
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
            }
            uint64_t v13 = (os_log_s *)_mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
            {
              if (mdns_mach_ticks_per_second_s_once != -1) {
                dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v18 = v7;
              __int16 v19 = 2048;
              unint64_t v20 = v10 / (unint64_t)mdns_mach_ticks_per_second_s_ticks_per_second;
              __int16 v21 = 2048;
              unint64_t v22 = 1000
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Unpenalizing server %@ (penalty expired %lld.%03lld seconds ago)",  buf,  0x20u);
            }
          }

          else
          {
            int v9 = (uint64_t *)(v7 + 24);
          }

          uint64_t v7 = *v9;
        }

        while (*v9);
        for (uint64_t result = *v3; result; uint64_t result = *(void *)(result + 24))
        {
          if ((*(char *)(result + 106) - 1) <= 3)
          {
            int v16 = (*(_DWORD *)(result + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(result + 100) - 1);
            if ((v16 & a2) == 0) {
              break;
            }
          }
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

void ___mdns_querier_conclude_with_response_async_block_invoke(uint64_t a1)
{
}

uint64_t _mdns_querier_get_eligible_server(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 228);
  if (*(_BYTE *)(a1 + 251)) {
    v2 |= *(_DWORD *)(a1 + 216) | *(_DWORD *)(a1 + 220);
  }
  uint64_t result = _mdns_resolver_get_server(*(void *)(a1 + 64), v2);
  if (result)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 112LL);
    if (v4 && v4 != a1)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      uint64_t v6 = (os_log_s *)_mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(const char **)(a1 + 128);
        if (!v7) {
          uint64_t v7 = "";
        }
        int v8 = 136446210;
        int v9 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}sBacking off while probe querier is active",  (uint8_t *)&v8,  0xCu);
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t _mdns_querier_set_current_server(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  *(_BYTE *)(result + 247) = 0;
  if (a2)
  {
    int v2 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    if ((v2 & *(_DWORD *)(result + 212)) == 0)
    {
      if (*(_BYTE *)(result + 251)) {
        int v3 = 2000;
      }
      else {
        int v3 = *(_DWORD *)(*(void *)(result + 64) + 124LL);
      }
      *(_DWORD *)(result + 204) = v3;
    }
  }

  return result;
}

uint64_t ___mdns_querier_initiate_send_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(dispatch_object_s **)(v1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 96));
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 96LL) = 0LL;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  int v4 = *(unsigned __int8 *)(v1 + 251);
  if (*(_BYTE *)(v1 + 251)) {
    unsigned int v5 = 900000;
  }
  else {
    unsigned int v5 = 30000;
  }
  unsigned int v6 = *(_DWORD *)(v1 + 204);
  if (v6 <= v5 >> 1) {
    unsigned int v5 = 2 * v6;
  }
  *(_DWORD *)(v1 + 204) = v5;
  uint64_t v7 = *(void *)(v1 + 72);
  if (v7)
  {
    if (v4)
    {
      _mdns_resolver_penalize_server_ex(*(void *)(v1 + 64), *(void *)(v1 + 72), 0, 0LL, 0LL);
      *(void *)(v1 + 72) = 0LL;
      int v8 = (_BYTE *)(v1 + 247);
LABEL_22:
      *int v8 = 0;
      return _mdns_querier_initiate_send(v1);
    }

    int v8 = (_BYTE *)(v1 + 247);
    int v9 = *(unsigned __int8 *)(v1 + 247);
    if (v9 == 255 || (*int v8 = v9 + 1, v9))
    {
      uint64_t v10 = *(void **)(v1 + 104);
      if (v10)
      {
        while (v10[4] != v7)
        {
          uint64_t v10 = (void *)v10[3];
          if (!v10) {
            goto LABEL_21;
          }
        }

        _mdns_resolver_penalize_server_ex(*(void *)(v1 + 64), v7, 1, v1, v10[8]);
        unsigned int v11 = *(_DWORD *)(v7 + 100) - 1;
        if (v11 < 0x20) {
          int v12 = ~(1 << v11);
        }
        else {
          int v12 = -1;
        }
        *(_DWORD *)(v1 + 200) &= v12;
      }

void *_mdns_resolver_create_session(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  int v12 = *(_DWORD *)(*(void *)(a1 + 16) + 144LL);
  if (v12 == 4)
  {
    uint64_t v13 = (void *)_os_object_alloc(&OBJC_CLASS___OS_mdns_session, 200LL);
    unsigned int v14 = v13;
    if (!v13) {
      goto LABEL_38;
    }
    __int16 v17 = &_mdns_url_session_kind;
    v13[2] = &_mdns_url_session_kind;
    do
    {
      uint64_t v18 = (void (*)(void *))v17[2];
      if (v18) {
        v18(v14);
      }
      __int16 v17 = (_UNKNOWN **)*v17;
    }

    while (v17);
  }

  else
  {
    if (v12 != 1)
    {
      uint64_t v13 = 0LL;
      unsigned int v14 = 0LL;
      int v19 = -6756;
      goto LABEL_33;
    }

    if ((_DWORD)a3)
    {
LABEL_5:
      uint64_t v13 = (void *)_os_object_alloc(&OBJC_CLASS___OS_mdns_session, 112LL);
      unsigned int v14 = v13;
      if (v13)
      {
        uint64_t v15 = &_mdns_connection_session_kind;
        v13[2] = &_mdns_connection_session_kind;
        do
        {
          int v16 = (void (*)(void *))v15[2];
          if (v16) {
            v16(v14);
          }
          uint64_t v15 = (_UNKNOWN **)*v15;
        }

        while (v15);
        goto LABEL_23;
      }

void _mdns_session_activate(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 88))
  {
    unsigned int v2 = *(_DWORD *)(a1 + 80);
    if (v2)
    {
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v2, 5u);
      *(void *)(a1 + 40) = oneshot_timer;
      if (!oneshot_timer)
      {
        int v7 = -6729;
        goto LABEL_13;
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = ___mdns_session_activate_block_invoke;
      handler[3] = &__block_descriptor_tmp_117_4688;
      handler[4] = a1;
      dispatch_source_set_event_handler(oneshot_timer, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 40));
    }

    uint64_t v4 = mach_continuous_time();
    *(void *)(a1 + 56) = v4;
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
    }
    *(void *)(a1 + 64) = v4 - 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    unsigned int v5 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 64LL);
    if (!v5 || (int v6 = v5(a1)) == 0)
    {
      *(_BYTE *)(a1 + 88) = 1;
      return;
    }

    int v7 = v6;
LABEL_13:
    *(_BYTE *)(a1 + 88) = 2;
    _mdns_common_session_terminate_async((void *)a1, v7);
  }

void _mdns_resolver_penalize_server_ex(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    if (!a4) {
      goto LABEL_25;
    }
    if (!*(_DWORD *)(a1 + 128)) {
      goto LABEL_25;
    }
    if (*(_BYTE *)(a2 + 107)) {
      goto LABEL_25;
    }
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)(a4 + 16) + 88LL))(a4);
    if ((v10 & 0xFFFE) != 0x40) {
      goto LABEL_25;
    }
    int v11 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    if ((v11 & *(_DWORD *)(a4 + 200)) == 0) {
      goto LABEL_25;
    }
    int v12 = v10;
    uint64_t v13 = *(uint64_t **)(a2 + 64);
    if (!v13)
    {
      int v14 = *(_DWORD *)(*(void *)(a4 + 64) + 128LL);
      uint64_t v15 = (uint64_t *)calloc(1uLL, 0x10uLL);
      if (!v15) {
        goto LABEL_52;
      }
      uint64_t v13 = v15;
      *((_DWORD *)v15 + 3) = v14;
      *(void *)(a2 + 64) = v15;
    }

    int v16 = *(unsigned __int8 **)(*(void *)(*(void *)(a4 + 88) + 56LL) + 24LL);
    if (!_pqw_info_can_accept_qname(v13, v16)) {
      goto LABEL_25;
    }
    int v17 = *((_DWORD *)v13 + 3);
    if (*((_DWORD *)v13 + 2) >= (v17 - 1))
    {
      unint64_t v20 = (void *)*v13;
      if (*v13)
      {
        do
        {
          __int16 v21 = (void *)*v20;
          _pqw_qname_item_free(v20);
          unint64_t v20 = v21;
        }

        while (v21);
        *uint64_t v13 = 0LL;
        int v17 = *((_DWORD *)v13 + 3);
      }

void _mdns_querier_send_query(uint64_t a1, uint64_t a2)
{
  else {
    int v3 = 1 << (*(_BYTE *)(*(void *)(a2 + 32) + 100LL) - 1);
  }
  if (*(_BYTE *)(a2 + 88) == 1 && *(_BYTE *)(a2 + 90))
  {
    *(_DWORD *)(a1 + 216) &= ~v3;
    if (!*(_BYTE *)(a2 + 89) || (*(_DWORD *)(a1 + 220) & v3) == 0)
    {
      _mdns_querier_send_query_immediate(a1, a2);
      *(_DWORD *)(a1 + 220) |= v3;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 216) |= v3;
  }

void _mdns_querier_send_query_immediate(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 88) == 1)
  {
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = *(unsigned __int16 *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 24);
    *(void *)(a2 + 64) = mach_continuous_time();
    int v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + 80LL);
    if (v7) {
      v7(a2, v6, v5);
    }
  }

  int v8 = (unsigned int *)(a1 + 208);
  do
    unsigned int v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  if (*(void *)(a1 + 128)) {
    int v10 = *(const char **)(a1 + 128);
  }
  else {
    int v10 = "";
  }
  unint64_t v11 = *(void *)(*(void *)(a1 + 88) + 40LL);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = 152LL;
  if (!*(_BYTE *)(a2 + 89)) {
    uint64_t v13 = 148LL;
  }
  int v14 = *(_DWORD *)(*(void *)(v12 + 16) + v13);
  interface_log_string = _mdns_resolver_get_interface_log_string(v12);
  uint64_t v16 = *(void *)(a1 + 88);
  if (v11 < 0xC)
  {
    if (*(_BYTE *)(a1 + 255))
    {
      uint64_t v30 = (void *)(v16 + 16);
      while (1)
      {
        uint64_t v30 = (void *)*v30;
        if (!v30) {
          break;
        }
        uint64_t v31 = (uint64_t (*)(void, void, uint64_t))v30[3];
        if (v31)
        {
          uint64_t v32 = v31(*(void *)(a1 + 88), 0LL, 1LL);
          if (!v32) {
            break;
          }
          __int16 v21 = (void *)v32;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          uint64_t v33 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = *(_DWORD *)(a1 + 208);
            uint64_t v35 = *(void *)(a2 + 32);
            uint64_t v36 = *(void *)(*(void *)(a1 + 88) + 32LL);
            int v91 = 136448258;
            v92 = v10;
            __int16 v93 = 2048;
            unint64_t v94 = v11;
            __int16 v95 = 1024;
            unsigned int v96 = v34;
            __int16 v97 = 2112;
            uint64_t v98 = v35;
            __int16 v99 = 1024;
            int v100 = v14;
            __int16 v101 = 2082;
            v102 = interface_log_string;
            __int16 v103 = 1040;
            *(_DWORD *)v104 = v11;
            *(_WORD *)&v104[4] = 2098;
            *(void *)&v104[6] = v36;
            *(_WORD *)&v104[14] = 2082;
            *(void *)&v104[16] = v21;
            char v27 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %{public}s";
            uint64_t v28 = (os_log_s *)v33;
            uint32_t v29 = 80;
LABEL_30:
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v91, v29);
          }

const char *_mdns_resolver_get_interface_log_string(uint64_t a1)
{
  unsigned int v2 = (char **)(a1 + 64);
  uint64_t v1 = *(char **)(a1 + 64);
  if (!v1)
  {
    uint64_t v4 = *(nw_interface **)(a1 + 48);
    if (v4)
    {
      name = nw_interface_get_name(v4);
      uint64_t v4 = *(nw_interface **)(a1 + 48);
      if (v4) {
        LODWORD(v4) = nw_interface_get_index(v4);
      }
    }

    else
    {
      name = "any";
    }

    uint64_t v6 = "";
    if (name) {
      uint64_t v6 = name;
    }
    asprintf(v2, "%s/%u", v6, (_DWORD)v4);
    uint64_t v1 = *v2;
  }

  if (v1) {
    return v1;
  }
  else {
    return "???";
  }
}

BOOL _pqw_info_can_accept_qname(uint64_t *a1, unsigned __int8 *a2)
{
  if (*((_DWORD *)a1 + 2) >= *((_DWORD *)a1 + 3)) {
    return 0LL;
  }
  int v3 = (uint64_t **)a1;
  while (1)
  {
    int v3 = (uint64_t **)*v3;
    BOOL result = v3 == 0LL;
    if (!v3) {
      break;
    }
  }

  return result;
}

void _mdns_resolver_start_pending_queriers(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unsigned int v2 = *(dispatch_source_s **)(a1 + 96);
    if (v2)
    {
LABEL_7:
      dispatch_source_merge_data(v2, 1uLL);
      return;
    }

    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
    }
    int v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  (dispatch_queue_t)_mdns_resolver_queue_s_queue);
    *(void *)(a1 + 96) = v3;
    if (v3)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = ___mdns_resolver_start_pending_queriers_block_invoke;
      handler[3] = &__block_descriptor_tmp_115_4666;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      unsigned int v2 = *(dispatch_source_s **)(a1 + 96);
      goto LABEL_7;
    }

    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint64_t v4 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create pending querier starter GCD source",  buf,  2u);
    }
  }

void ___mdns_resolver_start_pending_queriers_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unsigned int v2 = (void *)(v1 + 40);
  uint64_t v3 = v4;
  if (v4)
  {
    do
    {
      *unsigned int v2 = *(void *)(v3 + 56);
      *(void *)(v3 + 56) = 0LL;
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      uint64_t v6 = (os_log_s *)_mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      {
        int v7 = *(const char **)(v3 + 128);
        if (!v7) {
          int v7 = "";
        }
        *(_DWORD *)buf = 136446210;
        unint64_t v11 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}sStarting pending querier due to observed traffic activity",  buf,  0xCu);
      }

      _mdns_resolver_start_querier(*(void *)(a1 + 32), (_BYTE *)v3);
      os_release((void *)v3);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      unsigned int v2 = (void *)(v8 + 40);
      uint64_t v3 = v9;
    }

    while (v9);
  }

void _mdns_querier_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v8 = (os_log_s *)_mdns_resolver_log_s_log;
  if (a3) {
    BOOL v9 = a2 == 3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    unint64_t v11 = *(const char **)(a4 + 128);
    if (!v11) {
      unint64_t v11 = "";
    }
    int v25 = 136446722;
    unint64_t v26 = v11;
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v10,  "%{public}sQuerier session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld",  (uint8_t *)&v25,  0x1Cu);
  }

  if ((a2 - 3) < 2)
  {
    int v12 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v13 = (void *)(a4 + 104);
    if (*(_BYTE *)(a1 + 89)) {
      uint64_t v13 = (void *)(a4 + 112);
    }
    do
    {
      int v14 = v13;
      uint64_t v15 = *v13;
      uint64_t v13 = (void *)(*v13 + 24LL);
      if (v15) {
        BOOL v16 = v15 == a1;
      }
      else {
        BOOL v16 = 1;
      }
    }

    while (!v16);
    if (!v15) {
      return;
    }
    void *v14 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = 0LL;
    _mdns_session_invalidate((_BYTE *)a1);
    os_release((void *)a1);
    if (!v12) {
      return;
    }
    uint64_t v17 = *(void *)(a1 + 32);
    if (a2 == 3)
    {
      if (a3)
      {
        uint64_t v18 = *(void *)(a4 + 64);
        _mdns_resolver_generate_error_event((dispatch_queue_s **)v18, a3);
      }

      else
      {
        if (*(_BYTE *)(a4 + 249) == 3) {
          goto LABEL_44;
        }
        uint64_t v18 = *(void *)(a4 + 64);
      }

      if (*(void *)(a4 + 128)) {
        uint64_t v22 = *(const char **)(a4 + 128);
      }
      else {
        uint64_t v22 = "";
      }
      char v23 = _mdns_resolver_handle_stream_error(v18, v17, v22);
      int v24 = *(unsigned __int8 *)(v18 + 140);
      _mdns_resolver_penalize_server_ex(v18, v17, 0, 0LL, 0LL);
      if (v24 && (v23 & 1) != 0) {
        goto LABEL_43;
      }
    }

void _mdns_querier_session_receive(uint64_t a1, dispatch_data_s *a2, uint64_t a3)
{
  uint64_t v5 = mdns_message_create_with_dispatch_data(a2, 1);
  if (v5)
  {
    uint64_t v6 = v5;
    __int16 v28 = 0;
    int v7 = *(unsigned __int8 *)(a1 + 89);
    if (*(_BYTE *)(a1 + 89)) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = (BOOL *)&v28 + 1;
    }
    if (*(_BYTE *)(*(void *)(*(void *)(a3 + 64) + 16LL) + 161LL)) {
      BOOL v9 = *(_BYTE *)(a1 + 89) != 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      os_log_type_t v10 = 0LL;
    }
    else {
      os_log_type_t v10 = &v28;
    }
    __int16 v27 = 0;
    int is_response_acceptable = _mdns_querier_is_response_acceptable(a3, (uint64_t)v5, v8, v10, &v27);
    if (*(void *)(a3 + 128)) {
      int v12 = *(const char **)(a3 + 128);
    }
    else {
      int v12 = "";
    }
    _mdns_resolver_log_receive( *(void *)(a3 + 64),  a1,  v6,  is_response_acceptable,  v12,  *(unsigned __int8 *)(a3 + 255));
    uint64_t v13 = *(void *)(a1 + 32);
    if (is_response_acceptable)
    {
      uint64_t v14 = *(void *)(a3 + 64);
      uint64_t v15 = *(void *)(a1 + 56);
      int v16 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 16) + 88LL))(a3);
      _mdns_resolver_note_responsiveness(v14, v13, v7 != 0, v15, v16);
      if (v27 > 9 || ((1 << v27) & 0x209) == 0)
      {
        _mdns_querier_handle_bad_rcode(a3, v6, v27, v13);
        goto LABEL_49;
      }

      if (v7 || !HIBYTE(v28))
      {
        _mdns_querier_conclude_ex(a3, 1, 0, v6);
        goto LABEL_49;
      }

      *(_BYTE *)(a3 + 250) = 1;
    }

    else
    {
      if ((_BYTE)v28) {
        char v17 = v9;
      }
      else {
        char v17 = 1;
      }
      if ((v17 & 1) != 0)
      {
        uint64_t v18 = *(void *)(a3 + 64);
        if (*(_DWORD *)(v18 + 128))
        {
          uint64_t v19 = *(void *)(a3 + 192);
          if (v19)
          {
            int is_query_response = _mdns_message_is_query_response_ex( *((char **)v6 + 4),  *((void *)v6 + 5),  v19,  0LL,  0LL,  1);
            uint64_t v18 = *(void *)(a3 + 64);
            if (is_query_response)
            {
              else {
                int v21 = 1 << (*(_BYTE *)(v13 + 100) - 1);
              }
              *(_DWORD *)(a3 + 200) |= v21;
              _mdns_resolver_note_responsiveness( v18,  v13,  v7 != 0,  *(void *)(a1 + 56),  *(unsigned __int16 *)(*(void *)(a3 + 192) + 64LL));
              goto LABEL_49;
            }
          }
        }

        if (*(_DWORD *)(*(void *)(v18 + 16) + 144LL) == 1 && !*(_BYTE *)(v13 + 112))
        {
          int v25 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 16) + 88LL))(a3);
          unint64_t v26 = _mdns_qtype_is_problematic;
          if (v25 != 1 && v25 != 28)
          {
            if ((v25 & 0xFFFE) != 0x40) {
              goto LABEL_49;
            }
            unint64_t v26 = _mdns_qtype_is_address_type;
          }

          *(_WORD *)buf = 0;
          if (_mdns_message_is_query_response_ex( *((char **)v6 + 4),  *((void *)v6 + 5),  *(void *)(a3 + 88),  0LL,  buf,  0)
            && v26(*(unsigned __int16 *)buf))
          {
            *(_BYTE *)(v13 + 112) = 1;
          }
        }

uint64_t _mdns_querier_is_response_acceptable(uint64_t a1, uint64_t a2, BOOL *a3, _BYTE *a4, _WORD *a5)
{
  unint64_t v7 = *(void *)(a2 + 40);
  if (v7 < 0xC)
  {
    uint64_t result = 0LL;
LABEL_21:
    char v16 = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_18;
  }

  __int16 v17 = 0;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t result = _mdns_message_is_query_response_ex((char *)v11, v7, *(void *)(a1 + 88), &v17, 0LL, 0);
  if (!(_DWORD)result) {
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a1 + 88);
  if (v17 == *(_WORD *)(v13 + 68))
  {
    char v14 = *(_BYTE *)(v11 + 3);
    if (a3)
    {
      BOOL v15 = (*(_BYTE *)(v11 + 2) & 2) != 0
         && ((*(_BYTE *)(v13 + 70) & 4) != 0
      *a3 = v15;
    }

    if (a5) {
      *a5 = v14 & 0xF;
    }
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t result = 0LL;
  }

  char v16 = 1;
  if (a4) {
LABEL_18:
  }
    *a4 = v16 & (result ^ 1);
  return result;
}

void _mdns_resolver_log_receive(uint64_t a1, uint64_t a2, void *a3, int a4, const char *a5, int a6)
{
  if (a5) {
    os_log_type_t v10 = a5;
  }
  else {
    os_log_type_t v10 = "";
  }
  unint64_t v11 = a3[5];
  uint64_t v12 = 152LL;
  if (!*(_BYTE *)(a2 + 89)) {
    uint64_t v12 = 148LL;
  }
  int v13 = *(_DWORD *)(*(void *)(a1 + 16) + v12);
  interface_log_string = _mdns_resolver_get_interface_log_string(a1);
  if (v11 < 0xC)
  {
    if (a6)
    {
      __int16 v27 = a3 + 2;
      while (1)
      {
        __int16 v27 = (void *)*v27;
        if (!v27) {
          break;
        }
        __int16 v28 = (uint64_t (*)(void *, void, uint64_t))v27[3];
        if (v28)
        {
          uint64_t v29 = v28(a3, 0LL, 1LL);
          if (!v29) {
            break;
          }
          uint64_t v19 = (void *)v29;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          uint64_t v30 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = *(void *)(a2 + 32);
            uint64_t v32 = a3[4];
            int v43 = 136448258;
            uint32_t v44 = v10;
            __int16 v45 = 1024;
            int v46 = a4;
            __int16 v47 = 2048;
            unint64_t v48 = v11;
            __int16 v49 = 2112;
            uint64_t v50 = v31;
            __int16 v51 = 1024;
            int v52 = v13;
            __int16 v53 = 2082;
            __int16 v54 = interface_log_string;
            __int16 v55 = 1040;
            *(_DWORD *)uint32_t v56 = v11;
            *(_WORD *)&v56[4] = 2098;
            *(void *)&v56[6] = v32;
            *(_WORD *)&v56[14] = 2082;
            *(void *)&v56[16] = v19;
            int v24 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s"
                  " -- %{public,mdns:dnshdr}.*P, %{public}s";
            int v25 = (os_log_s *)v30;
            uint32_t v26 = 80;
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v43, v26);
          }

void _mdns_resolver_note_responsiveness(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  if (a4 - *(void *)(a2 + 80) >= 1) {
    *(void *)(a2 + 80) = a4;
  }
  if ((a5 & 0xFFFFFFFE) == 0x40 && !*(_BYTE *)(a2 + 107)) {
    *(_BYTE *)(a2 + 107) = 1;
  }
  _mdns_resolver_unpenalize_server(a1, a2, 1);
  if (*(_BYTE *)(a2 + 109))
  {
    *(_BYTE *)(a2 + 109) = 0;
    if (*(_BYTE *)(a1 + 132))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a2 + 48)) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 48));
        _mdns_symptoms_report_dns_server_symptom(413698LL, (uint64_t)address);
      }
    }
  }

  if (!a3)
  {
    if (!*(void *)(a2 + 40))
    {
      unsigned int v9 = *(_DWORD *)(a1 + 124);
      if (v9 / 0xA + v9 <= v9) {
        unsigned int v10 = *(_DWORD *)(a1 + 124);
      }
      else {
        unsigned int v10 = v9 / 0xA + v9;
      }
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v10, 5u);
      *(void *)(a2 + 40) = oneshot_timer;
      if (oneshot_timer)
      {
        uint64_t v12 = mach_continuous_time();
        int v13 = *(dispatch_source_s **)(a2 + 40);
        uint64_t v21 = _NSConcreteStackBlock;
        *(void *)&__int128 v22 = 0x40000000LL;
        *((void *)&v22 + 1) = ___mdns_resolver_schedule_fast_recovery_check_block_invoke;
        unint64_t v23 = &__block_descriptor_tmp_114_4674;
        uint64_t v24 = a2;
        uint64_t v25 = a1;
        uint64_t v26 = v12;
        dispatch_source_set_event_handler(v13, &v21);
        dispatch_activate(*(dispatch_object_t *)(a2 + 40));
      }

      else
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        uint64_t v20 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to create fast recovery timer",  (uint8_t *)&v21,  2u);
        }
      }
    }

    goto LABEL_31;
  }

  if (!*(_BYTE *)(*(void *)(a1 + 16) + 158LL)) {
    goto LABEL_31;
  }
  if (*(_BYTE *)(a2 + 110))
  {
    *(_DWORD *)(a2 + 96) = 0;
    *(_BYTE *)(a2 + 110) = 0;
  }

  else
  {
    unsigned int v14 = *(_DWORD *)(a2 + 96);
    *(_DWORD *)(a2 + 96) = 0;
    *(_BYTE *)(a2 + 110) = 0;
    if (v14 < 3) {
      goto LABEL_25;
    }
  }

  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v15 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *(_DWORD *)(*(void *)(a1 + 16) + 152LL);
    LODWORD(v21) = 67109378;
    HIDWORD(v21) = v16;
    LOWORD(v22) = 2112;
    *(void *)((char *)&v22 + 2) = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cleared stream problems with %{mdns:protocol}d server %@",  (uint8_t *)&v21,  0x12u);
  }

void _mdns_querier_handle_bad_rcode(uint64_t a1, void *object, int a3, uint64_t a4)
{
  else {
    int v8 = 1 << (*(_BYTE *)(a4 + 100) - 1);
  }
  *(_DWORD *)(a1 + 228) |= v8;
  int v9 = *(__int16 *)(a1 + 244);
  unsigned int v10 = *(void **)(a1 + 144);
  if (v9 < 0)
  {
    if (v10)
    {
      os_release(v10);
      *(void *)(a1 + 144) = 0LL;
    }

    *(_WORD *)(a1 + 244) = 0;
  }

  else if (v10 && (a3 == 5 || v9 != 5))
  {
    goto LABEL_15;
  }

  os_retain(object);
  unint64_t v11 = *(void **)(a1 + 144);
  if (v11) {
    os_release(v11);
  }
  *(void *)(a1 + 144) = object;
  *(_WORD *)(a1 + 244) = a3;
LABEL_15:
  if (a3 == 5) {
    _mdns_resolver_penalize_server_ex(*(void *)(a1 + 64), a4, 0, 0LL, 0LL);
  }
  if (_mdns_resolver_get_server(*(void *)(a1 + 64), *(_DWORD *)(a1 + 228)))
  {
    if (*(void *)(a1 + 72) == a4)
    {
      *(void *)(a1 + 72) = 0LL;
      *(_BYTE *)(a1 + 247) = 0;
      _mdns_querier_initiate_send(a1);
    }
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0LL;
    _mdns_querier_conclude_ex(a1, 1, 0, v12);
    os_release(v12);
  }

uint64_t _mdns_message_is_query_response_ex( char *a1, unint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5, char a6)
{
  if (a2 < 0xC) {
    return 0LL;
  }
  unsigned int v10 = __rev16(*(unsigned __int16 *)a1);
  if ((a1[2] & 0xF8) != 0x80) {
    return 0LL;
  }
  int v12 = 0;
  memset(v13, 0, sizeof(v13));
  if (DNSMessageExtractQuestion( (unint64_t)a1,  a2,  a1 + 12,  (char *)v13,  (_WORD *)&v12 + 1,  &v12,  0LL)) {
    return 0LL;
  }
  if ((a6 & 1) == 0)
  {
    uint64_t result = DomainNameEqual((unsigned __int8 *)v13, *(unsigned __int8 **)(*(void *)(a3 + 56) + 24LL));
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = HIWORD(v12);
  }
  return 1LL;
}

BOOL _mdns_qtype_is_address_type(int a1)
{
  return a1 == 1 || a1 == 28;
}

BOOL _mdns_qtype_is_problematic(int a1)
{
  return (a1 & 0xFFFFFFFE) == 64;
}

void _mdns_resolver_unpenalize_server(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_BYTE *)(a2 + 108)) {
    return;
  }
  uint64_t v4 = (uint64_t *)(a1 + 24);
  uint64_t v5 = (void *)(a1 + 24);
  do
  {
    uint64_t v6 = v5;
    uint64_t v7 = *v5;
    uint64_t v5 = (void *)(*v5 + 24LL);
    if (v7) {
      BOOL v8 = v7 == a2;
    }
    else {
      BOOL v8 = 1;
    }
  }

  while (!v8);
  if (!v7) {
    return;
  }
  void *v6 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0LL;
  *(_BYTE *)(a2 + 108) = 0;
  if (a3)
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    int v9 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int v14 = 138412290;
    uint64_t v15 = a2;
    unsigned int v10 = "Unpenalizing responsive server %@";
  }

  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    int v9 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int v14 = 138412290;
    uint64_t v15 = a2;
    unsigned int v10 = "Unpenalizing server %@";
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);
LABEL_19:
  uint64_t v11 = *v4;
  if (*v4)
  {
    if (!*(_BYTE *)(v11 + 108))
    {
      unsigned int v12 = *(_DWORD *)(a2 + 100);
      if (*(_DWORD *)(v11 + 100) <= v12)
      {
        do
        {
          uint64_t v13 = v11;
          uint64_t v11 = *(void *)(v11 + 24);
        }

        while (v11 && !*(_BYTE *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v12);
        uint64_t v4 = (uint64_t *)(v13 + 24);
      }
    }
  }

  *(void *)(a2 + 24) = v11;
  uint64_t *v4 = a2;
}

void ___mdns_resolver_start_serverless_queries_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 136))
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      while ((*(char *)(v3 + 106) - 1) > 3)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (!v3) {
          goto LABEL_14;
        }
      }

      uint64_t v4 = *(void *)(v2 + 32);
      if (v4)
      {
        do
        {
          if (!*(void *)(v4 + 72))
          {
            *(void *)(v4 + 72) = 0LL;
            *(_BYTE *)(v4 + 247) = 0;
            if (*(_BYTE *)(v4 + 251)) {
              int v5 = 2000;
            }
            else {
              int v5 = *(_DWORD *)(*(void *)(v4 + 64) + 124LL);
            }
            *(_DWORD *)(v4 + 204) = v5;
            _mdns_querier_initiate_send(v4);
          }

          uint64_t v4 = *(void *)(v4 + 56);
        }

        while (v4);
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
  }

void ___mdns_resolver_schedule_fast_recovery_check_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(dispatch_object_s **)(v2 + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 40));
    dispatch_release(v3);
    *(void *)(a1[4] + 40LL) = 0LL;
    uint64_t v2 = a1[4];
  }

  _mdns_resolver_handle_revived_server(a1[5], v2, 0, a1[6]);
}

void _mdns_resolver_handle_revived_server(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if (!*(_BYTE *)(a1 + 136) && (*(char *)(a2 + 106) - 5) >= 0xFFFFFFFC)
  {
    int v5 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    for (uint64_t i = *(void *)(a1 + 32); i; uint64_t i = *(void *)(i + 56))
    {
      if ((*(_DWORD *)(i + 228) & v5) == 0)
      {
        uint64_t v8 = *(void *)(i + 72);
        if (*(_BYTE *)(i + 251))
        {
          if (!v8) {
            goto LABEL_22;
          }
        }

        else
        {
          if ((a3 & 1) == 0)
          {
            if (!*(_BYTE *)(a2 + 107)
              && ((*(uint64_t (**)(uint64_t))(*(void *)(i + 16) + 88LL))(i) & 0xFFFE) == 0x40)
            {
              continue;
            }

            int v9 = *(void **)(i + 104);
            if (v9)
            {
              while (v9[4] != a2)
              {
                int v9 = (void *)v9[3];
                if (!v9) {
                  goto LABEL_19;
                }
              }

              if (v9[8] - a4 > 0) {
                continue;
              }
            }
          }

void _mdns_resolver_generate_error_event(dispatch_queue_s **a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v4, "error_code", a2);
  _mdns_resolver_generate_event(a1, 3, v4);
  if (v4) {
    xpc_release(v4);
  }
}

uint64_t _mdns_resolver_handle_stream_error(uint64_t a1, uint64_t a2, const char *a3)
{
  if (*(_BYTE *)(*(void *)(a1 + 16) + 158LL))
  {
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = v6 - *(void *)(a2 + 88);
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
    }
    if (v7 >= mdns_mach_ticks_per_second_s_ticks_per_second)
    {
      unsigned int v8 = *(_DWORD *)(a2 + 96);
      if (*(_BYTE *)(a2 + 110)) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 >= 3;
      }
      int v10 = !v9;
      *(void *)(a2 + 88) = v6;
      if (v8 == -1)
      {
        BOOL v11 = 1;
      }

      else
      {
        *(_DWORD *)(a2 + 96) = v8 + 1;
        BOOL v11 = v8 > 1;
      }

      if ((v10 & v11) == 1) {
        _mdns_resolver_log_server_problems(a1, a2, a3);
      }
    }

    _mdns_resolver_check_for_problematic_servers(a1);
  }

  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_querier_handle_stream_termination(int8x8_t *a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a2 + 100) - 1;
  if (v3 < 0x20) {
    unsigned int v4 = ~(1 << v3);
  }
  else {
    unsigned int v4 = -1;
  }
  a1[27] = vand_s8((int8x8_t)vdup_n_s32(v4), a1[27]);
  int8x8_t v5 = a1[9];
  if (*(void *)&v5 != a2)
  {
    if (*(void *)&v5 || *(void *)&a1[12]) {
      return;
    }
LABEL_14:
    _mdns_querier_initiate_send((uint64_t)a1);
    return;
  }

  uint64_t eligible_server = _mdns_querier_get_eligible_server((uint64_t)a1);
  if (eligible_server)
  {
    if (*(_BYTE *)(eligible_server + 108)) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = eligible_server;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  _mdns_querier_set_current_server((uint64_t)a1, v7);
  if (a1[9]) {
    goto LABEL_14;
  }
}

uint64_t _mdns_resolver_handle_stream_lateness(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  if (*(_BYTE *)(*(void *)(a1 + 16) + 158LL) && a3 - *(void *)(a2 + 80) >= 1)
  {
    if (*(_BYTE *)(a2 + 110))
    {
      *(_BYTE *)(a2 + 110) = 1;
    }

    else
    {
      unsigned int v5 = *(_DWORD *)(a2 + 96);
      *(_BYTE *)(a2 + 110) = 1;
      if (v5 <= 2) {
        _mdns_resolver_log_server_problems(a1, a2, a4);
      }
    }

    _mdns_resolver_check_for_problematic_servers(a1);
  }

  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_resolver_log_server_problems(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v6 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = "";
    int v8 = *(_DWORD *)(*(void *)(a1 + 16) + 152LL);
    if (a3) {
      uint64_t v7 = a3;
    }
    int v9 = *(unsigned __int8 *)(a2 + 110);
    int v10 = *(_DWORD *)(a2 + 96);
    int v11 = 136447234;
    int v12 = v7;
    __int16 v13 = 1024;
    int v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = a2;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}sHaving stream problems with %{mdns:protocol}d server %@ -- lateness: %{BOOL}d, error count: %u",  (uint8_t *)&v11,  0x28u);
  }

uint64_t ___mdns_session_activate_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  unsigned int v3 = *(dispatch_object_s **)(result + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(result + 40));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
    uint64_t result = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(result + 88) == 1)
  {
    unsigned int v4 = *(uint64_t (***)(uint64_t, uint64_t, void, void))(result + 72);
    if (*v4) {
      return (*v4)(result, 2LL, 0LL, *(void *)(result + 48));
    }
  }

  return result;
}

void _mdns_common_session_terminate_async(void *a1, int a2)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = ___mdns_common_session_terminate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_109;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_common_session_terminate_async_block_invoke(uint64_t a1)
{
}

void _mdns_common_session_finish(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 88) != 3)
  {
    _mdns_session_invalidate_internal(a1);
    *(_BYTE *)(a1 + 88) = 3;
    uint64_t v6 = *(void (***)(uint64_t, uint64_t, uint64_t, void))(a1 + 72);
    if (*v6) {
      (*v6)(a1, a2, a3, *(void *)(a1 + 48));
    }
  }

void _mdns_resolver_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  int v8 = (os_log_s *)_mdns_resolver_log_s_log;
  if (a3) {
    BOOL v9 = a2 == 3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    v15[0] = 67109376;
    v15[1] = a2;
    __int16 v16 = 2048;
    uint64_t v17 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v10,  "Resolver session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld",  (uint8_t *)v15,  0x12u);
  }

  if ((a2 - 3) >= 2)
  {
    if (a2 == 2)
    {
      _mdns_resolver_handle_stream_lateness(a4, *(void *)(a1 + 32), *(void *)(a1 + 56), 0LL);
    }

    else if (a2 == 1)
    {
      int v11 = (*(_DWORD *)(*(void *)(a1 + 32) + 100LL) - 1) >= 0x20
          ? 0
          : 1 << (*(_BYTE *)(*(void *)(a1 + 32) + 100LL) - 1);
      for (uint64_t i = *(void *)(a4 + 32); i; uint64_t i = *(void *)(i + 56))
      {
        if (*(_BYTE *)(i + 251))
        {
          if ((*(_DWORD *)(i + 216) & v11) != 0) {
            _mdns_querier_send_query(i, a1);
          }
        }
      }
    }

    return;
  }

  uint64_t v13 = *(void *)(a4 + 24);
  if (!v13) {
    return;
  }
  while (*(void *)(v13 + 32) != a1)
  {
    uint64_t v13 = *(void *)(v13 + 24);
    if (!v13) {
      return;
    }
  }

  if (a1)
  {
    _mdns_session_invalidate((_BYTE *)a1);
    os_release(*(void **)(v13 + 32));
    *(void *)(v13 + 32) = 0LL;
  }

  if (a2 == 3)
  {
    if (a3)
    {
      _mdns_resolver_generate_error_event((dispatch_queue_s **)a4, a3);
LABEL_33:
      _mdns_resolver_handle_stream_error(a4, v13, 0LL);
      _mdns_resolver_penalize_server_ex(a4, v13, 0, 0LL, 0LL);
      goto LABEL_35;
    }

    if (!*(_DWORD *)(a1 + 84)) {
      goto LABEL_33;
    }
  }

void _mdns_resolver_session_receive(uint64_t a1, dispatch_data_s *a2, uint64_t a3)
{
  int v5 = mdns_message_create_with_dispatch_data(a2, 1);
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a3 + 32);
  if (!v7) {
    goto LABEL_19;
  }
  char v8 = 0;
  do
  {
    while (1)
    {
      uint64_t v9 = v7;
      uint64_t v7 = *(void *)(v7 + 56);
      __int16 v16 = 0;
LABEL_15:
      if (!v7) {
        goto LABEL_18;
      }
    }

    if ((v8 & 1) == 0)
    {
      if (*(void *)(v9 + 128)) {
        os_log_type_t v10 = *(const char **)(v9 + 128);
      }
      else {
        os_log_type_t v10 = "";
      }
      _mdns_resolver_log_receive(a3, a1, v6, 1, v10, *(unsigned __int8 *)(v9 + 255));
    }

    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v13 = *(void *)(a1 + 56);
    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 88LL))(v9);
    _mdns_resolver_note_responsiveness(a3, v11, v12, v13, v14);
    if (v16 <= 9 && ((1 << v16) & 0x209) != 0)
    {
      char v8 = 1;
      _mdns_querier_conclude_ex(v9, 1, 0, v6);
      goto LABEL_15;
    }

    _mdns_querier_handle_bad_rcode(v9, v6, v16, *(void *)(a1 + 32));
    char v8 = 1;
  }

  while (v7);
LABEL_18:
  if ((v8 & 1) == 0) {
LABEL_19:
  }
    _mdns_resolver_log_receive(a3, a1, v6, 0, 0LL, 0);
  os_release(v6);
}

void _mdns_url_session_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[14];
  if (v2)
  {
    nw_release(v2);
    a1[14] = 0LL;
  }

  unsigned int v3 = (void *)a1[15];
  if (v3)
  {
    nw_release(v3);
    a1[15] = 0LL;
  }

  _mdns_url_session_forget_crypto(a1);
  unsigned int v4 = (void *)a1[23];
  if (v4)
  {
    os_release(v4);
    a1[23] = 0LL;
  }

uint64_t _mdns_url_session_initialize(uint64_t a1, void *a2)
{
  unsigned int v14 = 0;
  if (*(_DWORD *)(a2[2] + 144LL) == 4) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = 0LL;
  }
  *(void *)(a1 + 184) = v4;
  if (v4)
  {
    os_retain(v4);
    int v5 = *(uint64_t (**)(void *, unsigned int *))(a2[2] + 112LL);
    if (v5)
    {
      uint64_t v6 = (nw_parameters *)v5(a2, &v14);
      uint64_t result = v14;
      if (!v14)
      {
        uint64_t v8 = nw_parameters_copy_url_endpoint(v6);
        *(void *)(a1 + 112) = v8;
        if (v8)
        {
          uint64_t v9 = nw_parameters_copy(v6);
          *(void *)(a1 + 120) = v9;
          os_log_type_t v10 = nw_parameters_copy_default_protocol_stack(v9);
          nw_protocol_stack_clear_application_protocols(v10);
          if (v10) {
            nw_release(v10);
          }
          nw_parameters_set_metadata(*(void *)(a1 + 120), 0LL);
          nw_parameters_set_fast_open_enabled(*(nw_parameters_t *)(a1 + 120), 1);
          return v14;
        }

        else
        {
          return 4294960567LL;
        }
      }
    }

    else
    {
      return 4294960561LL;
    }
  }

  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint64_t v11 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = *(unsigned int *)(a2[2] + 144LL);
      else {
        uint64_t v13 = off_10013D820[v12];
      }
      *(_DWORD *)buf = 136446210;
      __int16 v16 = v13;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Trying to initialize an mdns_url_session using a non-https resolver of type %{public}s",  buf,  0xCu);
    }

    return 4294960540LL;
  }

  return result;
}

uint64_t _mdns_url_session_activate(void *a1)
{
  if (*(void *)(a1[23] + 176LL))
  {
    if ((unint64_t)g_pending_odoh_connection_count >= 0xA)
    {
      uint64_t v1 = &g_pending_odoh_sessions;
      do
      {
        uint64_t v2 = v1;
        uint64_t v3 = *v1;
        uint64_t v1 = (uint64_t *)(*v1 + 104);
      }

      while (v3);
      *uint64_t v2 = (uint64_t)a1;
      os_retain(a1);
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
    }

    else
    {
      _mdns_url_session_activate_for_odoh(a1);
    }
  }

  else
  {
    _mdns_common_session_make_ready_async(a1);
  }

  return 0LL;
}

void _mdns_url_session_invalidate(void *a1)
{
  uint64_t v2 = (nw_connection *)a1[16];
  if (v2)
  {
    uint64_t v3 = a1[17];
    if (v3)
    {
      nw_connection_end_activity();
      nw_activity_complete_with_reason(v3, 4LL);
      uint64_t v2 = (nw_connection *)a1[16];
    }

    nw_connection_cancel(v2);
    unsigned int v4 = (void *)a1[16];
    if (v4)
    {
      nw_release(v4);
      a1[16] = 0LL;
    }
  }

  int v5 = (void *)a1[17];
  if (v5)
  {
    nw_release(v5);
    a1[17] = 0LL;
  }

  uint64_t v6 = (void *)a1[18];
  if (v6)
  {
    http_task_cancel(v6);
    a1[18] = 0LL;
  }

  _mdns_url_session_forget_crypto(a1);
  _mdns_url_session_handle_connection_no_longer_pending((uint64_t)a1);
  uint64_t v7 = &g_active_odoh_sessions;
  do
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)*v7;
    uint64_t v7 = (uint64_t *)(*v7 + 104);
    if (v9) {
      BOOL v10 = v9 == a1;
    }
    else {
      BOOL v10 = 1;
    }
  }

  while (!v10);
  if (v9)
  {
    *uint64_t v8 = a1[13];
    a1[13] = 0LL;
    os_release(a1);
    --g_active_odoh_session_count;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint64_t v11 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 134217984;
      uint64_t v20 = g_active_odoh_session_count;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Active ODoH session count decrease: %zu",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v12 = (dispatch_object_s *)g_active_odoh_session_interrupt_timer;
    if (g_active_odoh_session_interrupt_timer)
    {
      dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
      dispatch_release(v12);
      g_active_odoh_session_interrupt_timer = 0LL;
    }

    if (g_pending_odoh_sessions) {
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
    }
  }

  else
  {
    uint64_t v13 = &g_pending_odoh_sessions;
    do
    {
      unsigned int v14 = v13;
      __int16 v15 = (void *)*v13;
      uint64_t v13 = (uint64_t *)(*v13 + 104);
      if (v15) {
        BOOL v16 = v15 == a1;
      }
      else {
        BOOL v16 = 1;
      }
    }

    while (!v16);
    if (v15)
    {
      uint64_t *v14 = a1[13];
      a1[13] = 0LL;
      os_release(a1);
    }

    if (!g_pending_odoh_sessions)
    {
      uint64_t v17 = (dispatch_object_s *)g_active_odoh_session_interrupt_timer;
      if (g_active_odoh_session_interrupt_timer)
      {
        dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
        dispatch_release(v17);
        g_active_odoh_session_interrupt_timer = 0LL;
      }
    }
  }

  int v18 = (void *)a1[23];
  if (v18)
  {
    os_release(v18);
    a1[23] = 0LL;
  }

void _mdns_url_session_send(uint64_t a1, dispatch_data_s *a2, unsigned int a3)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  size_t p_applier = (size_t)&applier;
  uint64_t v7 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v70 = *(void *)(a1 + 112);
    LODWORD(applier) = 138412290;
    *(void *)((char *)&applier + 4) = v70;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Sending message on URL %@",  (uint8_t *)&applier,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 184);
  if (!v8)
  {
    v112 = 0LL;
    v114 = 0LL;
    BOOL v10 = 0;
    goto LABEL_47;
  }

  unsigned int v123 = a3;
  uint64_t v9 = *(void *)(v8 + 168);
  BOOL v10 = v9 != 0;
  if (!v9)
  {
    options = 0LL;
    int v14 = 0;
    __int16 v15 = 0LL;
    goto LABEL_23;
  }

  size_t length = xpc_data_get_length(*(xpc_object_t *)(v8 + 168));
  bytes_ptr = (unsigned __int16 *)xpc_data_get_bytes_ptr(*(xpc_object_t *)(v8 + 168));
  if (nw_http_oblivious_config_is_valid(bytes_ptr, length))
  {
    *(void *)&__int128 applier = 0LL;
    if (nw_endpoint_get_port(*(nw_endpoint_t *)(a1 + 112)) == 443)
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path(*(void *)(a1 + 112));
      asprintf((char **)&applier, "/dns-query?targethost=%s&targetpath=%s");
    }

    else
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path(*(void *)(a1 + 112));
      asprintf((char **)&applier, "/dns-query?targethost=%s:%u&targetpath=%s");
    }

    options = (void *)nw_oblivious_http_create_options(bytes_ptr, length, applier);
    if ((void)applier)
    {
      free((void *)applier);
      *(void *)&__int128 applier = 0LL;
    }

    if (options)
    {
      __int16 v15 = 0LL;
      int v14 = 1;
      goto LABEL_23;
    }

    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    int v75 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
LABEL_87:
      options = 0LL;
      __int16 v15 = 0LL;
LABEL_88:
      int v76 = -6700;
      goto LABEL_89;
    }

    *(_WORD *)buf = 0;
    int v77 = "Failed to create oblivious http options";
    uint64_t v78 = buf;
LABEL_92:
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, v77, v78, 2u);
    goto LABEL_87;
  }

  if (!a2 || !bytes_ptr)
  {
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_115);
    }
    uint64_t v68 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_83;
    }
    *(_WORD *)buf = 0;
    v69 = "Parameters are NULL";
LABEL_110:
    int v85 = (os_log_s *)v68;
    uint32_t v86 = 2;
LABEL_111:
    _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, v69, buf, v86);
    goto LABEL_83;
  }

  if (length <= 1)
  {
    if (_mdns_crypto_log_s_once == -1)
    {
LABEL_16:
      BOOL v16 = (os_log_s *)_mdns_crypto_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      {
LABEL_82:
        uint64_t v68 = _mdns_crypto_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        {
LABEL_83:
          uint64_t v74 = _mdns_resolver_log_s_once;
LABEL_84:
          if (v74 != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          int v75 = (os_log_s *)_mdns_resolver_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          LOWORD(applier) = 0;
          int v77 = "Failed to create oblivious request";
          uint64_t v78 = (uint8_t *)&applier;
          goto LABEL_92;
        }

        *(_WORD *)buf = 0;
        v69 = "Failed to parse supported config";
        goto LABEL_110;
      }

      *(_DWORD *)buf = 134217984;
      *(void *)(p_applier + 164) = length;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Config length is too short: %zu",  buf,  0xCu);
LABEL_80:
      if (_mdns_crypto_log_s_once != -1) {
        dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_115);
      }
      goto LABEL_82;
    }

void sub_1000D0774(_Unwind_Exception *a1)
{
}

void ___mdns_url_session_send_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 128))
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint64_t v7 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = nw_connection_state_to_string(a2);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 128LL);
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Connection state changed to %s for connection %@ error %@",  (uint8_t *)&v10,  0x20u);
    }

    switch((_DWORD)a2)
    {
      case 3:
        _mdns_url_session_handle_connection_no_longer_pending(*(void *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(void *)(a1 + 32), 3LL, 4294960543LL);
        break;
      case 5:
        uint64_t v5 = *(void *)(a1 + 32);
LABEL_10:
        _mdns_url_session_handle_connection_no_longer_pending(v5);
        os_release(*(void **)(a1 + 32));
        break;
    }
  }

  else if ((_DWORD)a2 == 5)
  {
    goto LABEL_10;
  }

uint64_t _mdns_create_and_start_connection_activity(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 != 1)
  {
    if ((_DWORD)a2 != 28) {
      return 0LL;
    }
    a2 = 2LL;
  }

  uint64_t v3 = nw_activity_create(33LL, a2);
  if (v3) {
    nw_connection_start_activity(a1, v3);
  }
  return v3;
}

void ___mdns_url_session_send_block_invoke_96( uint64_t a1, uint64_t error_code, nw_content_context *a3, uint64_t a4, nw_error *a5)
{
  if (!*(void *)(*(void *)(a1 + 32) + 128LL)) {
    return;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v9 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v34) = 134217984;
    *(void *)((char *)&v34 + 4) = error_code;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received data %p", (uint8_t *)&v34, 0xCu);
  }

  *(void *)&__int128 v34 = 0LL;
  *((void *)&v34 + 1) = &v34;
  uint64_t v35 = 0x2000000000LL;
  uint64_t v36 = 0LL;
  if (a3)
  {
    int v10 = (nw_protocol_definition *)nw_protocol_copy_http_definition();
    a3 = nw_content_context_copy_protocol_metadata(a3, v10);
    if (v10) {
      nw_release(v10);
    }
    if (a3)
    {
      uint64_t v11 = (void *)nw_http_metadata_copy_response(a3);
      nw_release(a3);
      if (v11)
      {
        LODWORD(a3) = nw_http_response_get_status_code(v11);
        __int16 v12 = (void *)nw_http_response_copy_header_fields(v11);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 0x40000000LL;
        v31[2] = ___mdns_url_session_send_block_invoke_98;
        v31[3] = &unk_10013D5F8;
        v31[4] = &v34;
        nw_http_fields_access_value_by_name(v12, "client-address", v31);
        if (v12) {
          nw_release(v12);
        }
        nw_release(v11);
      }

      else
      {
        LODWORD(a3) = 0;
      }
    }
  }

  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v13 = (os_log_s *)_mdns_resolver_log_s_log;
  if ((_DWORD)a3 != 200 || error_code == 0) {
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v15))
  {
    BOOL v16 = "";
    if (!error_code) {
      BOOL v16 = "out";
    }
    *(_DWORD *)buf = 67109378;
    LODWORD(v33[0]) = (_DWORD)a3;
    WORD2(v33[0]) = 2082;
    *(void *)((char *)v33 + 6) = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, v15, "Received HTTP status %u with%{public}s body", buf, 0x12u);
  }

  if (error_code)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (*(_BYTE *)(a1 + 41))
      {
        uint64_t v17 = 0LL;
      }

      else
      {
        error_code = (uint64_t)mdns_decrypt_oblivious_response( (dispatch_data_s *)error_code,  *(void *)(*(void *)(a1 + 32) + 152LL),  *(void *)(*(void *)(a1 + 32) + 160LL),  *(const void **)(*(void *)(a1 + 32) + 168LL),  *(void *)(*(void *)(a1 + 32) + 176LL));
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        }
        uint64_t v21 = (os_log_s *)_mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33[0] = error_code;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Decrypted %@", buf, 0xCu);
        }

        uint64_t v17 = (dispatch_object_s *)error_code;
        if (!error_code)
        {
          char v19 = 0;
          int v18 = 0;
          error_code = 4294960520LL;
          goto LABEL_47;
        }
      }

      __int128 v22 = *(nw_endpoint **)(*((void *)&v34 + 1) + 24LL);
      if (v22) {
        _mdns_https_resolver_set_client_address(*(void *)(*(void *)(a1 + 32) + 184LL), v22);
      }
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(v23 + 184);
      if (!*(_BYTE *)(v24 + 230))
      {
        *(_BYTE *)(v24 + 230) = 1;
        _mdns_resolver_generate_error_event((dispatch_queue_s **)v24, 0);
        uint64_t v23 = *(void *)(a1 + 32);
      }

      _mdns_common_session_invoke_receive(v23, error_code);
      if (v17) {
        dispatch_release(v17);
      }
    }

    else
    {
      uint64_t v20 = *(nw_endpoint **)(*((void *)&v34 + 1) + 24LL);
      if (v20) {
        _mdns_https_resolver_set_client_address(*(void *)(*(void *)(a1 + 32) + 184LL), v20);
      }
      _mdns_common_session_invoke_receive(*(void *)(a1 + 32), error_code);
    }

    error_code = 0LL;
    char v19 = 1;
    int v18 = 1;
  }

  else
  {
    int v18 = 0;
    char v19 = 1;
  }

void ___mdns_url_session_send_block_invoke_104(uint64_t a1, dispatch_data_s *a2, int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 144))
  {
    int v9 = *(unsigned __int8 *)(a1 + 40);
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    int v10 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)a2;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Received response %@",  (uint8_t *)&v15,  0xCu);
      if (a2)
      {
LABEL_6:
        if (v9)
        {
          dispatch_data_t v11 = mdns_decrypt_oblivious_response( a2,  *(void *)(v4 + 152),  *(void *)(v4 + 160),  *(const void **)(v4 + 168),  *(void *)(v4 + 176));
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          }
          __int16 v12 = (os_log_s *)_mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
          {
            int v15 = 138412290;
            uint64_t v16 = (uint64_t)v11;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Decrypted response %@",  (uint8_t *)&v15,  0xCu);
          }

          a2 = v11;
          if (!v11)
          {
            if (a3 == 401) {
              a4 = 4294960520LL;
            }
            else {
              a4 = 4294960519LL;
            }
LABEL_29:
            _mdns_common_session_finish(*(void *)(a1 + 32), 3LL, a4);
            uint64_t v4 = *(void *)(a1 + 32);
            goto LABEL_30;
          }
        }

        else
        {
          dispatch_data_t v11 = 0LL;
        }

        _mdns_common_session_invoke_receive(v4, (uint64_t)a2);
        if (!a4)
        {
LABEL_27:
          if (v11) {
            dispatch_release(v11);
          }
          goto LABEL_29;
        }

void _mdns_common_session_invoke_receive(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 88) == 1)
  {
    uint64_t v4 = *(dispatch_object_s **)(a1 + 40);
    if (v4)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
      dispatch_release(v4);
      *(void *)(a1 + 40) = 0LL;
    }

    int v5 = *(_DWORD *)(a1 + 84);
    if (v5 != -1) {
      *(_DWORD *)(a1 + 84) = v5 + 1;
    }
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 72) + 8LL);
    if (v6) {
      v6(a1, a2, *(void *)(a1 + 48));
    }
  }

void ___mdns_url_session_send_block_invoke_98(uint64_t a1, char *hostname)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_endpoint_create_host(hostname, "0");
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  uint64_t v3 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Received client address %@",  (uint8_t *)&v5,  0xCu);
  }

const sockaddr *_mdns_https_resolver_set_client_address(uint64_t a1, nw_endpoint_t endpoint)
{
  *(void *)(a1 + 200) = 0LL;
  uint64_t v2 = (sockaddr *)(a1 + 200);
  *(_DWORD *)(a1 + 224) = 0;
  *(void *)(a1 + 20_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  *(void *)(a1 + 216) = 0LL;
  uint64_t result = nw_endpoint_get_address(endpoint);
  if (result)
  {
    int sa_family = result->sa_family;
    if (sa_family == 30)
    {
      sockaddr v5 = *result;
      *(_OWORD *)&v2->sa_data[10] = *(_OWORD *)&result->sa_data[10];
    }

    else
    {
      if (sa_family != 2) {
        return result;
      }
      sockaddr v5 = *result;
    }

    *uint64_t v2 = v5;
  }

  return result;
}

void _mdns_url_session_handle_connection_no_longer_pending(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 192))
  {
    unint64_t v1 = --g_pending_odoh_connection_count;
    *(_BYTE *)(a1 + 192) = 0;
    uint64_t v2 = g_pending_odoh_sessions;
    if (g_pending_odoh_sessions) {
      BOOL v3 = v1 > 9;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      g_pending_odoh_sessions = *(void *)(g_pending_odoh_sessions + 104);
      *(void *)(v2 + 104) = 0LL;
      _mdns_url_session_activate_for_odoh((_BYTE *)v2);
      os_release((void *)v2);
    }
  }

void _mdns_url_session_activate_for_odoh(_BYTE *object)
{
  object[192] = 1;
  ++g_pending_odoh_connection_count;
  uint64_t v2 = &g_active_odoh_sessions;
  do
  {
    BOOL v3 = v2;
    uint64_t v4 = *v2;
    uint64_t v2 = (uint64_t *)(*v2 + 104);
  }

  while (v4);
  *BOOL v3 = (uint64_t)object;
  os_retain(object);
  *((void *)object + 12) = mach_continuous_time();
  ++g_active_odoh_session_count;
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  sockaddr v5 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    uint64_t v7 = g_active_odoh_session_count;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Active ODoH session count increase: %zu",  (uint8_t *)&v6,  0xCu);
  }

  _mdns_common_session_make_ready_async(object);
}

void _mdns_common_session_make_ready_async(void *a1)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = ___mdns_common_session_make_ready_async_block_invoke;
  block[3] = &__block_descriptor_tmp_87_4719;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_common_session_make_ready_async_block_invoke(uint64_t a1)
{
}

uint64_t _mdns_common_session_invoke_ready_event_handler(uint64_t result)
{
  if (*(_BYTE *)(result + 88) == 1 && !*(_BYTE *)(result + 90))
  {
    *(_BYTE *)(result + 90) = 1;
    unint64_t v1 = *(uint64_t (***)(uint64_t, uint64_t, void, void))(result + 72);
    if (*v1) {
      return (*v1)(result, 1LL, 0LL, *(void *)(result + 48));
    }
  }

  return result;
}

void _mdns_url_session_forget_crypto(void *a1)
{
  uint64_t v2 = (void *)a1[19];
  if (v2)
  {
    memset_s(v2, a1[20], 0, a1[20]);
    BOOL v3 = (void *)a1[19];
    if (v3)
    {
      free(v3);
      a1[19] = 0LL;
    }
  }

  a1[20] = 0LL;
  uint64_t v4 = (void *)a1[21];
  if (v4)
  {
    memset_s(v4, a1[22], 0, a1[22]);
    sockaddr v5 = (void *)a1[21];
    if (v5)
    {
      free(v5);
      a1[21] = 0LL;
    }
  }

  a1[22] = 0LL;
}

void _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session()
{
  v0 = (void *)g_active_odoh_sessions;
  if (g_active_odoh_sessions) {
    BOOL v1 = g_active_odoh_session_interrupt_timer == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    uint64_t v2 = mach_continuous_time() - v0[12];
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
    }
    if (v2 / mdns_mach_ticks_per_second_s_ticks_per_second > 9) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = 10000
    }
         - (1000 * (v2 % mdns_mach_ticks_per_second_s_ticks_per_second) / mdns_mach_ticks_per_second_s_ticks_per_second
          + 1000 * (v2 / mdns_mach_ticks_per_second_s_ticks_per_second));
    g_active_odoh_session_interrupt_timer = (uint64_t)_mdns_resolver_create_oneshot_timer(v3, 5u);
    if (g_active_odoh_session_interrupt_timer)
    {
      os_retain(v0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke;
      handler[3] = &__block_descriptor_tmp_85;
      handler[4] = v0;
      dispatch_source_set_event_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, handler);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 0x40000000LL;
      v4[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2;
      v4[3] = &__block_descriptor_tmp_86;
      v4[4] = v0;
      dispatch_source_set_cancel_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, v4);
      dispatch_activate((dispatch_object_t)g_active_odoh_session_interrupt_timer);
    }
  }

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke(uint64_t a1)
{
  uint64_t v2 = (dispatch_object_s *)g_active_odoh_session_interrupt_timer;
  if (g_active_odoh_session_interrupt_timer)
  {
    dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
    dispatch_release(v2);
    g_active_odoh_session_interrupt_timer = 0LL;
  }

  _mdns_common_session_finish(*(void *)(a1 + 32), 4LL, 0LL);
}

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2(uint64_t a1)
{
}

uint64_t _mdns_udp_socket_session_init(uint64_t result)
{
  *(_DWORD *)(result + 136) = -1;
  return result;
}

uint64_t _mdns_udp_socket_session_finalize(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 136);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a1 + 136) = -1;
  }

  return result;
}

uint64_t _mdns_udp_socket_session_initialize( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, unsigned __int8 *a5)
{
  address = nw_endpoint_get_address(*(nw_endpoint_t *)(*(void *)(a1 + 32) + 48LL));
  int sa_family = address->sa_family;
  if (sa_family != 30 && sa_family != 2) {
    return 4294960540LL;
  }
  __int16 v12 = address;
  v54[0] = 0LL;
  v54[1] = 0LL;
  if (sa_family == 30)
  {
    if (*(_DWORD *)&address->sa_data[6] || *(_DWORD *)&address->sa_data[10]) {
      goto LABEL_9;
    }
    int v35 = *(_DWORD *)&address[1].sa_len;
    if (v35)
    {
      if (v35 == -65536)
      {
        int v36 = *(_DWORD *)&address[1].sa_data[2];
LABEL_139:
        LOWORD(v54[0]) = 528;
        WORD1(v54[0]) = *(_WORD *)address->sa_data;
        HIDWORD(v54[0]) = v36;
        __int16 v12 = (const sockaddr *)v54;
        int sa_family = 2;
        goto LABEL_10;
      }
    }

    else
    {
      int v36 = *(_DWORD *)&address[1].sa_data[2];
      if ((v36 | 0x1000000) != 0x1000000) {
        goto LABEL_139;
      }
    }

LABEL_96:
  if (!a4) {
    goto LABEL_126;
  }
LABEL_97:
  int v39 = a4[4];
  if (v39 == 3)
  {
    __int128 v41 = *(_OWORD *)(*(void *)a4 + 40LL);
    *(_OWORD *)v53[0].val = *(_OWORD *)(*(void *)a4 + 24LL);
    *(_OWORD *)&v53[0].val[4] = v41;
    *(_DWORD *)buf = audit_token_to_pid(v53);
    if (!setsockopt(v14, 0xFFFF, 4359, buf, 4u)) {
      goto LABEL_126;
    }
    if (*__error())
    {
      int v42 = *__error();
      if (!v42) {
        goto LABEL_126;
      }
    }

    else
    {
      int v42 = -6700;
    }

    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint32_t v44 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v42;
    __int16 v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
LABEL_144:
    _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v45, (uint8_t *)v53, 8u);
    goto LABEL_126;
  }

  if (v39 == 2)
  {
    if (!setsockopt(v14, 0xFFFF, 4360, a4, 0x10u)) {
      goto LABEL_126;
    }
    if (*__error())
    {
      int v43 = *__error();
      if (!v43) {
        goto LABEL_126;
      }
    }

    else
    {
      int v43 = -6700;
    }

    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint32_t v44 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v43;
    __int16 v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED_UUID failed %{darwin.errno}d";
    goto LABEL_144;
  }

  if (v39 != 1 || !setsockopt(v14, 0xFFFF, 4359, a4, 4u)) {
    goto LABEL_126;
  }
  if (!*__error())
  {
    int v40 = -6700;
LABEL_113:
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint32_t v44 = (os_log_s *)_mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v40;
    __int16 v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
    goto LABEL_144;
  }

  int v40 = *__error();
  if (v40) {
    goto LABEL_113;
  }
LABEL_126:
  if (!a5)
  {
LABEL_133:
    if (sa_family == 2) {
      size_t v48 = 16LL;
    }
    else {
      size_t v48 = 28LL;
    }
    memcpy((void *)(a1 + 104), v12, v48);
    uint64_t v16 = 0LL;
    *(_DWORD *)(a1 + 132) = v48;
    *(_DWORD *)(a1 + 136) = v14;
    return v16;
  }

  bzero(v53, 0x3F1uLL);
  uint64_t v46 = DomainNameToString(a5, 0LL, (unsigned __int8 *)v53, 0LL);
  if (!(_DWORD)v46)
  {
    if ((ne_session_set_socket_attributes(v14, v53, 0LL) & 1) == 0)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      __int16 v47 = (os_log_s *)_mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v56 = v53;
        _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "ne_session_set_socket_attributes() failed for '%s'",  buf,  0xCu);
      }
    }

    goto LABEL_133;
  }

  uint64_t v16 = v46;
  if ((v14 & 0x80000000) == 0) {
    close(v14);
  }
  return v16;
}

uint64_t _mdns_udp_socket_session_activate(uint64_t a1)
{
  uintptr_t v2 = *(int *)(a1 + 136);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  dispatch_source_t v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v2,  0LL,  (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  *(void *)(a1 + 96) = v3;
  if (!v3) {
    return 4294960567LL;
  }
  os_retain((void *)a1);
  dispatch_set_context(*(dispatch_object_t *)(a1 + 96), (void *)a1);
  dispatch_source_set_event_handler_f( *(dispatch_source_t *)(a1 + 96),  (dispatch_function_t)_mdns_udp_socket_session_read_handler);
  dispatch_source_set_cancel_handler_f( *(dispatch_source_t *)(a1 + 96),  (dispatch_function_t)_mdns_udp_socket_session_cancel_handler);
  dispatch_activate(*(dispatch_object_t *)(a1 + 96));
  return 0LL;
}

void _mdns_udp_socket_session_invalidate(uint64_t a1)
{
  BOOL v1 = *(dispatch_object_s **)(a1 + 96);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v1);
    *(void *)(a1 + 96) = 0LL;
  }

void _mdns_udp_socket_session_send(uint64_t a1, dispatch_data_t data)
{
  size_t v8 = 0LL;
  buffer_ptr = 0LL;
  dispatch_data_t v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v8);
  if (v3)
  {
    uint64_t v4 = v3;
    if (sendto(*(_DWORD *)(a1 + 136), buffer_ptr, v8, 0, (const sockaddr *)(a1 + 104), *(_DWORD *)(a1 + 132)) < 0)
    {
      if (*__error())
      {
        int v5 = *__error();
        if (!v5) {
          goto LABEL_11;
        }
      }

      else
      {
        int v5 = -6700;
      }

      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      }
      int v6 = (os_log_s *)_mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 1024;
        int v13 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "sending to %@ failed: %{darwin.errno}d",  buf,  0x12u);
      }
    }

void _mdns_udp_socket_session_read_handler(uint64_t a1)
{
  *(void *)&v10.sa_len = 0LL;
  *(void *)&v10.sa_data[6] = 0LL;
  int v12 = 0;
  uint64_t v11 = 0LL;
  socklen_t v9 = 28;
  ssize_t v2 = recvfrom(*(_DWORD *)(a1 + 136), buffer, 0x200uLL, 0, &v10, &v9);
  if (v2 < 0)
  {
    if (*__error())
    {
      uint64_t v3 = *__error();
      if (!(_DWORD)v3) {
        goto LABEL_4;
      }
      if ((_DWORD)v3 == 35) {
        return;
      }
    }

    else
    {
      uint64_t v3 = 4294960596LL;
    }

    _mdns_common_session_finish(a1, 3LL, v3);
    return;
  }

void _mdns_udp_socket_session_cancel_handler(_DWORD *object)
{
  int v2 = object[34];
  if ((v2 & 0x80000000) == 0)
  {
    close(v2);
    object[34] = -1;
  }

  os_release(object);
}

uint64_t _mdns_connection_session_initialize( uint64_t a1, uint64_t a2, int a3, nw_parameters *a4, unsigned __int8 *a5)
{
  unsigned int v33 = 0;
  uint64_t v8 = *(void *)(a2 + 16);
  if (*(_BYTE *)(v8 + 158)) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (v9)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 104);
    if (v14)
    {
      uint64_t v15 = v14(a2, &v33);
      char v13 = v33;
      if (v33) {
        return v33;
      }
      int v12 = (nw_parameters *)v15;
      goto LABEL_11;
    }

    return -6735;
  }

  sockaddr v10 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 112);
  if (!v10) {
    return -6735;
  }
  uint64_t v11 = v10(a2, &v33);
  if (v33) {
    return v33;
  }
  int v12 = (nw_parameters *)v11;
  char v13 = 1;
LABEL_11:
  *(_BYTE *)(a1 + 104) = v13;
  if (!a4) {
    goto LABEL_25;
  }
  if ((*((_DWORD *)a4 + 4) - 1) > 2)
  {
    a4 = 0LL;
    goto LABEL_25;
  }

  nw_parameters_t v16 = nw_parameters_copy(v12);
  if (!v16) {
    return -6729;
  }
  int v12 = v16;
  int v17 = *((_DWORD *)a4 + 4);
  switch(v17)
  {
    case 3:
      __int128 v19 = *(_OWORD *)(*(void *)a4 + 40LL);
      *(_OWORD *)buf = *(_OWORD *)(*(void *)a4 + 24LL);
      *(_OWORD *)&uint8_t buf[16] = v19;
      nw_parameters_set_source_application(v16, buf);
      break;
    case 2:
      nw_parameters_set_e_proc_uuid(v16, a4);
      break;
    case 1:
      nw_parameters_set_pid(v16);
      break;
  }

  a4 = v12;
LABEL_25:
  uint64_t v20 = *(void *)(a1 + 32);
  unsigned int v21 = *(nw_endpoint **)(v20 + 48);
  if (a5)
  {
    address = nw_endpoint_get_address(*(nw_endpoint_t *)(v20 + 48));
    nw_endpoint_t v23 = nw_endpoint_create_address(address);
    if (v23)
    {
      uint64_t v24 = v23;
      bzero(buf, 0x3F1uLL);
      int v25 = DomainNameToString(a5, 0LL, buf, 0LL);
      if (v25)
      {
        int v29 = v25;
      }

      else
      {
        uint64_t port = nw_endpoint_get_port(v24);
        host_with_numeric_uint64_t port = nw_endpoint_create_host_with_numeric_port(buf, port);
        if (host_with_numeric_port)
        {
          uint64_t v28 = (void *)host_with_numeric_port;
          nw_endpoint_set_parent_endpoint(v24, host_with_numeric_port, 0LL);
          nw_release(v28);
          unsigned int v21 = v24;
          goto LABEL_39;
        }

        int v29 = -6729;
      }

      nw_release(v24);
    }

    else
    {
      int v29 = -6729;
    }

    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    char v30 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to create domain-attributed endpoint for %@: %{mdns:err}ld",  buf,  0x16u);
    }
  }

  uint64_t v24 = 0LL;
LABEL_39:
  nw_connection_t v31 = nw_connection_create(v21, v12);
  *(void *)(a1 + 96) = v31;
  if (v31)
  {
    if (!a4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  unsigned int v33 = -6729;
  if (a4) {
LABEL_41:
  }
    nw_release(a4);
LABEL_42:
  if (v24) {
    nw_release(v24);
  }
  return v33;
}

uint64_t _mdns_connection_session_activate(nw_connection_t *a1)
{
  int v2 = a1[12];
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  nw_connection_set_queue(v2, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  uint64_t v3 = a1[12];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = ___mdns_connection_session_activate_block_invoke;
  v6[3] = &__block_descriptor_tmp_70_4747;
  v6[4] = a1;
  nw_connection_set_state_changed_handler(v3, v6);
  nw_connection_start(a1[12]);
  int v4 = a1[12];
  completion[0] = _NSConcreteStackBlock;
  completion[1] = 0x40000000LL;
  completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
  completion[3] = &__block_descriptor_tmp_72_4748;
  completion[4] = a1;
  nw_connection_receive_message(v4, completion);
  return 0LL;
}

void _mdns_connection_session_invalidate(uint64_t a1)
{
  int v2 = *(nw_connection **)(a1 + 96);
  if (v2)
  {
    nw_connection_cancel(v2);
    uint64_t v3 = *(void **)(a1 + 96);
    if (v3)
    {
      nw_release(v3);
      *(void *)(a1 + 96) = 0LL;
    }
  }

void _mdns_connection_session_send(uint64_t a1, dispatch_data_s *a2, uint64_t a3)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  BOOL v6 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 96);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Sending message on connection %@",  buf,  0xCu);
  }

  uint64_t started = _mdns_create_and_start_connection_activity(*(void *)(a1 + 96), a3);
  uint64_t v8 = *(nw_connection **)(a1 + 96);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = ___mdns_connection_session_send_block_invoke;
  v10[3] = &__block_descriptor_tmp_74;
  v10[4] = started;
  v10[5] = a1;
  nw_connection_send(v8, a2, _nw_content_context_default_message, 1, v10);
}

uint64_t _mdns_connection_session_is_bytestream(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 104);
}

void ___mdns_connection_session_send_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96LL);
    if (v5)
    {
      nw_connection_end_activity(v5, v4);
      int v4 = *(void **)(a1 + 32);
    }

    nw_release(v4);
  }

  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(void *)(v6 + 96)) {
      _mdns_common_session_finish(v6, 3LL, 4294960543LL);
    }
  }

void ___mdns_connection_session_activate_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 32);
  if (v4[12])
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    }
    uint64_t v5 = (os_log_s *)_mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = nw_connection_state_to_string(a2);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96LL);
      int v8 = 136315394;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Connection state changed to %s for connection %@",  (uint8_t *)&v8,  0x16u);
    }

    switch((_DWORD)a2)
    {
      case 3:
        _mdns_common_session_invoke_ready_event_handler(*(void *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(void *)(a1 + 32), 3LL, 4294960543LL);
        break;
      case 5:
        int v4 = *(void **)(a1 + 32);
LABEL_10:
        os_release(v4);
        break;
    }
  }

  else if ((_DWORD)a2 == 5)
  {
    goto LABEL_10;
  }

void ___mdns_connection_session_schedule_receive_block_invoke( uint64_t a1, uint64_t a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 96))
  {
    if (a2) {
      _mdns_common_session_invoke_receive(v6, a2);
    }
    if (context) {
      BOOL is_final = nw_content_context_get_is_final(context);
    }
    else {
      BOOL is_final = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (a5 || is_final)
    {
      if (a5) {
        uint64_t v12 = 4294960543LL;
      }
      else {
        uint64_t v12 = 0LL;
      }
      _mdns_common_session_finish(v10, 3LL, v12);
    }

    else
    {
      uint64_t v11 = *(nw_connection **)(v10 + 96);
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 0x40000000LL;
      completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
      completion[3] = &__block_descriptor_tmp_72_4748;
      completion[4] = v10;
      nw_connection_receive_message(v11, completion);
    }
  }

void ___mdns_querier_reset_time_limit_block_invoke(uint64_t a1)
{
}

void ___mdns_querier_conclude_async_block_invoke(uint64_t a1)
{
}

void _mdns_querier_clear_delegation(uint64_t a1)
{
  int v2 = (void **)(a1 + 168);
  int v3 = *(_DWORD *)(a1 + 184);
  switch(v3)
  {
    case 3:
      if (*v2)
      {
        os_release(*v2);
        *int v2 = 0LL;
      }

      break;
    case 2:
      uuid_clear((unsigned __int8 *)(a1 + 168));
      break;
    case 1:
      *(_DWORD *)int v2 = 0;
      break;
  }

  *(_DWORD *)(a1 + 184) = 0;
}

void mdns_resolver_invalidate(void *a1)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __mdns_resolver_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_4_4772;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void __mdns_resolver_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 136))
  {
    *(_BYTE *)(v2 + 136) = 1;
    int v3 = *(dispatch_object_s **)(v2 + 104);
    if (v3)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 104));
      dispatch_release(v3);
      *(void *)(v2 + 104) = 0LL;
    }

    uint64_t v4 = *(void *)(v2 + 112);
    if (v4)
    {
      mdns_client_invalidate(v4);
      os_release(*(void **)(v2 + 112));
      *(void *)(v2 + 112) = 0LL;
    }

    while (1)
    {
      uint64_t v8 = *(void *)(v2 + 24);
      if (!v8) {
        break;
      }
      *(void *)(v2 + 24) = *(void *)(v8 + 24);
      if (*(void *)(v8 + 56))
      {
        nw_path_evaluator_cancel();
        uint64_t v5 = *(void **)(v8 + 56);
        if (v5)
        {
          nw_release(v5);
          *(void *)(v8 + 56) = 0LL;
        }
      }

      uint64_t v6 = *(_BYTE **)(v8 + 32);
      if (v6)
      {
        _mdns_session_invalidate(v6);
        os_release(*(void **)(v8 + 32));
        *(void *)(v8 + 32) = 0LL;
      }

      uint64_t v7 = *(dispatch_object_s **)(v8 + 40);
      if (v7)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v8 + 40));
        dispatch_release(v7);
        *(void *)(v8 + 40) = 0LL;
      }
    }

    _mdns_resolver_invalidate_and_forget_queriers((void **)(v2 + 32));
    _mdns_resolver_invalidate_and_forget_queriers((void **)(v2 + 40));
    uint64_t v9 = *(dispatch_object_s **)(v2 + 96);
    if (v9)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 96));
      dispatch_release(v9);
      *(void *)(v2 + 96) = 0LL;
    }

    if (*(void *)(v2 + 80))
    {
      os_retain((void *)v2);
      uint64_t v10 = *(dispatch_queue_s **)(v2 + 72);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = ___mdns_resolver_invalidate_internal_block_invoke;
      block[3] = &__block_descriptor_tmp_44_4773;
      block[4] = v2;
      dispatch_async(v10, block);
    }
  }

  os_release(*(void **)(a1 + 32));
}

void _mdns_resolver_invalidate_and_forget_queriers(void **a1)
{
  BOOL v1 = *a1;
  if (*a1)
  {
    *a1 = 0LL;
    do
    {
      uint64_t v2 = (void *)v1[7];
      v1[7] = 0LL;
      _mdns_querier_conclude_ex((uint64_t)v1, 4, 0, 0LL);
      os_release(v1);
      BOOL v1 = v2;
    }

    while (v2);
  }

void ___mdns_resolver_invalidate_internal_block_invoke(uint64_t a1)
{
}

void __mdns_resolver_prepare_for_system_sleep_block_invoke(id a1)
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  }
  BOOL v1 = (os_log_s *)_mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Preparing for system sleep", v3, 2u);
  }

  uint64_t v2 = objc_autoreleasePoolPush();
  _http_task_shared_session_critical_region(&__block_literal_global_389);
  objc_autoreleasePoolPop(v2);
}

void mdns_querier_set_delegator_uuid(uint64_t a1, const unsigned __int8 *a2)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    memset(dst, 0, sizeof(dst));
    uuid_copy(dst, a2);
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 2;
    uuid_copy((unsigned __int8 *)(a1 + 168), dst);
  }

void mdns_querier_set_delegator_audit_token(uint64_t a1, void *object)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    os_retain(object);
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 3;
    *(void *)(a1 + 16_Block_object_dispose((const void *)(v1 - 176), 8) = object;
  }

void mdns_querier_set_result_handler(uint64_t a1, void *aBlock)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    if (aBlock) {
      int v3 = _Block_copy(aBlock);
    }
    else {
      int v3 = 0LL;
    }
    uint64_t v4 = *(const void **)(a1 + 80);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 80) = v3;
  }

void mdns_querier_set_time_limit_ms(void *a1, int a2)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = __mdns_querier_set_time_limit_ms_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_4801;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void __mdns_querier_set_time_limit_ms_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 249) != 3)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(v2 + 224) = v3;
    int v4 = _mdns_querier_reset_time_limit(v2, v3);
    if (v4) {
      _mdns_querier_conclude_with_error_async((void *)v2, v4);
    }
  }

  os_release(*(void **)(a1 + 32));
}

BOOL mdns_querier_match(uint64_t a1, unsigned __int8 *a2, int a3, int a4)
{
  BOOL result = 0;
  if (*(unsigned __int16 *)(a1 + 64) == a3 && *(unsigned __int16 *)(a1 + 66) == a4)
  {
    int v4 = *(unsigned __int8 **)(*(void *)(a1 + 56) + 24LL);
    if (v4)
    {
    }
  }

  return result;
}

void *SendPortMapRequest(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 176);
  unsigned int v5 = v4;
  if (!*(_WORD *)(a2 + 176)) {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 174);
  }
  memset(v39, 0, 30);
  memset(v37, 0, sizeof(v37));
  uint64_t v38 = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  unsigned int v6 = bswap32(v5);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  int v7 = *(_DWORD *)(a2 + 136);
  unsigned int v8 = v7 + HIWORD(v6);
  uint64_t v9 = *(void *)(a1 + 14648);
  if (!v9)
  {
LABEL_14:
    __int16 v20 = 0;
    int v19 = 0;
    int v17 = 0;
    __int16 v18 = 0;
    int v12 = (unsigned __int16)v8;
    mDNS_snprintf(&v19);
    mDNS_snprintf(&v17);
    mDNS_snprintf(v37);
    mDNS_snprintf(v39);
    *(void *)&__int128 v25 = "NewRemoteHost";
    *((void *)&v25 + 1) = "string";
    *(void *)&__int128 v26 = "";
    *((void *)&v26 + 1) = "NewExternalPort";
    *(void *)&__int128 v27 = "ui2";
    *((void *)&v27 + 1) = &v19;
    *(void *)&__int128 v28 = "NewProtocol";
    *((void *)&v28 + 1) = "string";
    char v13 = "TCP";
    if (*(_BYTE *)(a2 + 172) == 1) {
      char v13 = "UDP";
    }
    *(void *)&__int128 v29 = v13;
    *((void *)&v29 + 1) = "NewInternalPort";
    *(void *)&__int128 v30 = "ui2";
    *((void *)&v30 + 1) = &v17;
    *(void *)&__int128 v31 = "NewInternalClient";
    *((void *)&v31 + 1) = "string";
    *(void *)&__int128 v32 = v39;
    *((void *)&v32 + 1) = "NewEnabled";
    *(void *)&__int128 v33 = "BOOLean";
    *((void *)&v33 + 1) = "1";
    *(void *)&__int128 v34 = "NewPortMappingDescription";
    *((void *)&v34 + 1) = "string";
    *(void *)&__int128 v35 = v37;
    *((void *)&v35 + 1) = "NewLeaseDuration";
    *(void *)&__int128 v36 = "ui4";
    *((void *)&v36 + 1) = "0";
    uint64_t v14 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:
        unsigned int v15 = bswap32(*(unsigned __int16 *)(a2 + 174));
        *(_DWORD *)buf = 67109376;
        unsigned int v22 = HIWORD(v15);
        __int16 v23 = 1024;
        int v24 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SendPortMapRequest: internal %u external %u",  buf,  0xEu);
      }
    }

    else
    {
      uint64_t v14 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
    }

    return SendSOAPMsgControlAction(a1, a2 + 32, (uint64_t)"AddPortMapping", 8, (uint64_t)&v25, 3);
  }

  while (v9 == a2)
  {
    uint64_t v9 = a2;
LABEL_13:
    uint64_t v9 = *(void *)v9;
    if (!v9) {
      goto LABEL_14;
    }
  }

  unsigned int v10 = *(unsigned __int16 *)(v9 + 176);
  if (!*(_WORD *)(v9 + 176)) {
    unsigned int v10 = *(unsigned __int16 *)(v9 + 174);
  }
  if (v7 <= 99)
  {
    *(_DWORD *)(a2 + 136) = ++v7;
    unsigned int v11 = v4;
    if (!v4) {
      unsigned int v11 = *(unsigned __int16 *)(a2 + 174);
    }
    unsigned int v8 = v7 + (bswap32(v11) >> 16);
    uint64_t v9 = a1 + 14648;
    goto LABEL_13;
  }

  natTraversalHandlePortMapReplyWithAddress( a1,  a2,  *(void *)(a1 + 14944),  4LL,  *(unsigned int *)(a1 + 14672),  0LL,  0LL,  2LL);
  return 0LL;
}

void *SendSOAPMsgControlAction(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  unsigned int v6 = (unsigned __int16 *)(a1 + 14964);
  if (!*(_WORD *)(a1 + 14964) || !*(void *)(a1 + 14984) || !*(void *)(a1 + 15000))
  {
    uint64_t TCPConnection = 4294901747LL;
    int v17 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT)) {
        return (void *)TCPConnection;
      }
      __int16 v26 = 0;
      int v19 = (uint8_t *)&v26;
    }

    else
    {
      int v17 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
        return (void *)TCPConnection;
      }
      *(_WORD *)buf = 0;
      int v19 = buf;
    }

    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "SendSOAPMsgControlAction: no SOAP port, URL or address string",  v19,  2u);
    return (void *)TCPConnection;
  }

  uint64_t v10 = a1 + 28904;
  int v11 = mDNS_snprintf((void *)(a1 + 28904));
  int v12 = (_BYTE *)(v10 + v11);
  _BYTE *v12 = 0;
  if (a4 < 1)
  {
    int v13 = 0;
  }

  else
  {
    int v13 = 0;
    uint64_t v14 = a4;
    uint64_t v15 = a5 + 16;
    do
    {
      v13 += mDNS_snprintf(&v12[v13]);
      v15 += 24LL;
      --v14;
    }

    while (v14);
  }

  mDNS_snprintf((void *)(a1 + 28904 + v13 + v11));
  BOOL result = *(void **)(a2 + 64);
  if (result)
  {
LABEL_22:
    *(_DWORD *)(a2 + 72) = mDNS_snprintf(result);
    uint64_t TCPConnection = MakeTCPConnection(a1, a2, (int *)(a1 + 12704), *v6, a6);
    if ((_DWORD)TCPConnection)
    {
      unsigned int v22 = *(void **)(a2 + 64);
      if (v22) {
        free(v22);
      }
      *(void *)(a2 + 64) = 0LL;
    }

    return (void *)TCPConnection;
  }

  BOOL result = malloc(0x2000uLL);
  if (result)
  {
    *(void *)(a2 + 64) = result;
    goto LABEL_22;
  }

  __break(1u);
  return result;
}

uint64_t MakeTCPConnection(uint64_t a1, uint64_t a2, int *a3, unsigned int a4, int a5)
{
  __int16 v32 = 0;
  __int16 v7 = a4;
  if (a3[1]) {
    BOOL v8 = (unsigned __int16)a4 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = 4294901747LL;
    uint64_t v10 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT)) {
        return v9;
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
        return v9;
      }
    }

    *(_DWORD *)buf = 141558787;
    uint64_t v34 = 1752392040LL;
    __int16 v35 = 1045;
    int v36 = 20;
    __int16 v37 = 2101;
    uint64_t v38 = a3;
    __int16 v39 = 1024;
    unsigned int v40 = bswap32(a4) >> 16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "LNT MakeTCPConnection: bad address/port %{sensitive, mask.hash, mdnsresponder:ip_addr}.20P:%d",  buf,  0x22u);
    return v9;
  }

  *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 176), 8) = a1;
  __int128 v14 = *(_OWORD *)a3;
  *(_DWORD *)(a2 + 52) = a3[4];
  *(_OWORD *)(a2 + 36) = v14;
  *(_WORD *)(a2 + 56) = a4;
  *(_DWORD *)(a2 + 32) = a5;
  *(void *)(a2 + 96) = 0LL;
  *(_DWORD *)(a2 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0x2000;
  uint64_t v15 = *(void **)(a2 + 80);
  if (v15)
  {
    bzero(v15, 0x2000uLL);
  }

  else
  {
    int v17 = malloc(0x2000uLL);
    if (!v17) {
      __break(1u);
    }
    *(void *)(a2 + 80) = v17;
  }

  if (*(void *)(a2 + 24))
  {
    __int16 v18 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        goto LABEL_26;
      }
    }

    else
    {
      __int16 v18 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_26:
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "MakeTCPConnection: closing previous open connection",  buf,  2u);
      }
    }

    mDNSPlatformTCPCloseConnection(*(_DWORD **)(a2 + 24));
    *(void *)(a2 + 24) = 0LL;
  }

  int v19 = mDNSPlatformTCPSocket(0, *a3, &v32, 0LL, 0);
  *(void *)(a2 + 24) = v19;
  char v20 = gSensitiveLoggingEnabled;
  unsigned int v21 = (os_log_s *)mDNSLogCategory_NAT;
  if (mDNSLogCategory_NAT == mDNSLogCategory_State) {
    char v20 = 0;
  }
  if (v19)
  {
    if ((v20 & 1) != 0)
    {
      unsigned int v21 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
    }

    else if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_39;
    }

    unsigned int v24 = bswap32(*(unsigned __int16 *)(a2 + 56)) >> 16;
    *(_DWORD *)buf = 141558787;
    uint64_t v34 = 1752392040LL;
    __int16 v35 = 1045;
    int v36 = 20;
    __int16 v37 = 2101;
    uint64_t v38 = (int *)(a2 + 36);
    __int16 v39 = 1024;
    unsigned int v40 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "MakeTCPConnection: connecting to %{sensitive, mask.hash, mdnsresponder:ip_addr}.20P:%d",  buf,  0x22u);
LABEL_39:
    uint64_t v25 = mDNSPlatformTCPConnect(*(void *)(a2 + 24), a3, v7, 0LL, (uint64_t)tcpConnectionCallback, a2);
    if ((_DWORD)v25 == -65787) {
      return 0LL;
    }
    uint64_t v9 = v25;
    if ((_DWORD)v25 == -65789)
    {
      unsigned int v26 = *(_DWORD *)(a1 + 48);
      unsigned int v27 = *(_DWORD *)(a1 + 52) + 1;
      *(_DWORD *)(a1 + 52) = v27;
      mDNS_VerifyLockState("Drop Lock", 0, v26, v27, (uint64_t)"MakeTCPConnection", 570);
      tcpConnectionCallback(*(_DWORD **)(a2 + 24), a2, 1, 0);
      mDNS_VerifyLockState( "Reclaim Lock",  0,  *(_DWORD *)(a1 + 48),  *(_DWORD *)(a1 + 52),  (uint64_t)"MakeTCPConnection",  572);
      uint64_t v9 = 0LL;
      --*(_DWORD *)(a1 + 52);
      return v9;
    }

    __int128 v28 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        goto LABEL_55;
      }
    }

    else
    {
      __int128 v28 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_55:
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "LNT MakeTCPConnection: connection failed",  buf,  2u);
      }
    }

    mDNSPlatformTCPCloseConnection(*(_DWORD **)(a2 + 24));
    *(void *)(a2 + 24) = 0LL;
    __int128 v30 = *(void **)(a2 + 80);
    if (v30) {
      free(v30);
    }
    *(void *)(a2 + 80) = 0LL;
    return v9;
  }

  if ((v20 & 1) != 0)
  {
    uint64_t v22 = mDNSLogCategory_NAT_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v23 = (os_log_s *)v22;
LABEL_49:
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "LNT MakeTCPConnection: unable to create TCP socket",  buf,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    __int16 v23 = v21;
    goto LABEL_49;
  }

  __int128 v29 = *(void **)(a2 + 80);
  if (v29) {
    free(v29);
  }
  *(void *)(a2 + 80) = 0LL;
  return 4294901757LL;
}

void tcpConnectionCallback(_DWORD *a1, uint64_t a2, int a3, int a4)
{
  char v75 = 0;
  BOOL v8 = *(_DWORD **)(a2 + 24);
  if (v8 == a1) {
    goto LABEL_20;
  }
  uint64_t v9 = (os_log_s *)mDNSLogCategory_NAT;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      *(_DWORD *)buf = 134218240;
      uint64_t v77 = (uint64_t)v8;
      __int16 v78 = 2048;
      *(void *)uint64_t v79 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "tcpConnectionCallback: WARNING- tcpInfo->sock(%p) != sock(%p) !!! Printing tcpInfo struct",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)mDNSLogCategory_NAT_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
  }

  int v12 = (os_log_s *)mDNSLogCategory_NAT;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  int v12 = (os_log_s *)mDNSLogCategory_NAT_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT))
  {
LABEL_19:
    unsigned int v15 = bswap32(*(unsigned __int16 *)(a2 + 56));
    int v16 = *(_DWORD *)(a2 + 32);
    int v17 = *(_DWORD *)(a2 + 104);
    uint64_t v18 = *(void *)(a2 + 64);
    uint64_t v19 = *(void *)(a2 + 80);
    *(_DWORD *)buf = 141560323;
    uint64_t v77 = 1752392040LL;
    __int16 v78 = 1045;
    *(_DWORD *)uint64_t v79 = 20;
    *(_WORD *)&v79[4] = 2101;
    *(void *)&v79[6] = a2 + 36;
    *(_WORD *)&v79[14] = 1024;
    *(_DWORD *)&v79[16] = HIWORD(v15);
    LOWORD(v80) = 1024;
    *(_DWORD *)((char *)&v80 + 2) = v16;
    HIWORD(v80) = 1024;
    int v81 = v17;
    __int16 v82 = 2160;
    uint64_t v83 = 1752392040LL;
    __int16 v84 = 2085;
    uint64_t v85 = v18;
    __int16 v86 = 2160;
    uint64_t v87 = 1752392040LL;
    __int16 v88 = 2085;
    uint64_t v89 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "tcpConnectionCallback: tcpInfo->Address:Port [%{sensitive, mask.hash, mdnsresponder:ip_addr}.20P:%d] tcpInfo->op[% d] tcpInfo->retries[%d] tcpInfo->Request[%{sensitive, mask.hash}s] tcpInfo->Reply[%{sensitive, mask.hash}s]",  buf,  0x56u);
  }

void handleLNTDeviceDescriptionResponse( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = a1[1];
  uint64_t v10 = (char *)a1[10];
  int v41 = v10;
  if (*(_WORD *)(v9 + 14964)) {
    return;
  }
  uint64_t v12 = a1[12];
  unint64_t v13 = (unint64_t)&v10[v12];
  int v14 = ParseHTTPResponseCode((const char **)&v41, (unsigned __int8 *)&v10[v12]);
  if (v14 != 200)
  {
    int v20 = v14;
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTDeviceDescriptionResponse: HTTP Result code: %d",  v15,  v16,  v17,  v18,  v19,  v20);
    }
    return;
  }

  *(_BYTE *)(v9 + 14976) = 0;
  unsigned int v21 = v41;
  if (v41 && (unint64_t)v41 < v13)
  {
    do
    {
      if ((*v21 & 0xDF) == 0x57 && !strncasecmp(v21, "WANIPConnection:1", 0x11uLL)) {
        break;
      }
      if (!++v21) {
        break;
      }
    }

    while ((unint64_t)v21 < v13);
  }

  int v41 = v21;
  if (v21 == (char *)v13)
  {
    unsigned int v21 = (char *)a1[10];
    if (v21 && (unint64_t)v21 < v13)
    {
      while ((*v21 & 0xDF) != 0x57 || strncasecmp(v21, "WANPPPConnection:1", 0x12uLL))
      {
      }

      int v41 = v21;
      *(_BYTE *)(v9 + 14976) = 1;
      goto LABEL_23;
    }

void handleLNTGetExternalAddressResponse(void *a1)
{
  uint64_t v1 = a1[1];
  int v28 = 0;
  uint64_t v2 = (char *)a1[10];
  unsigned int v27 = v2;
  uint64_t v3 = a1[12];
  unint64_t v4 = (unint64_t)&v2[v3];
  int v5 = ParseHTTPResponseCode((const char **)&v27, (unsigned __int8 *)&v2[v3]);
  int v11 = v5;
  if (v5 == 404)
  {
    LNT_ClearState(v1);
LABEL_22:
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTGetExternalAddressResponse: HTTP Result code: %d",  v6,  v7,  v8,  v9,  v10,  v11);
    }
    return;
  }

  uint64_t v12 = v27;
  if ((unint64_t)v27 < v4)
  {
    int64_t v13 = &v2[v3] - v27;
    while (strncasecmp(v12, handleLNTGetExternalAddressResponse_tagname, 0x14uLL))
    {
      ++v12;
      if (!--v13)
      {
        uint64_t v12 = &v2[v3];
        break;
      }
    }
  }

  unint64_t v14 = (unint64_t)(v12 + 20);
  unsigned int v27 = v12 + 20;
  if ((unint64_t)(v12 + 20) < v4)
  {
    uint64_t v15 = &v2[v3] - v12 - 20;
    while (*(_BYTE *)v14 != 62)
    {
      unsigned int v27 = (char *)++v14;
      if (!--v15)
      {
        unint64_t v14 = (unint64_t)&v2[v3];
        break;
      }
    }
  }

  uint64_t v16 = (_BYTE *)(v14 + 1);
  unsigned int v27 = (char *)(v14 + 1);
  if (v14 + 1 < v4)
  {
    uint64_t v17 = &v2[v3 + ~v14];
    while (1)
    {
      int v18 = *v16;
      ++v16;
      if (!--v17) {
        return;
      }
    }

    _BYTE *v16 = 0;
    int v20 = (int)v27;
    if (inet_pton(2, v27, &v28) <= 0)
    {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTGetExternalAddressResponse: Router returned bad address %s",  v21,  v22,  v23,  v24,  v25,  v20);
      int v28 = 0;
      int v26 = 3;
    }

    else
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTGetExternalAddressResponse: External IP address is %.4a",  v21,  v22,  v23,  v24,  v25,  (int)&v28);
      }
      int v26 = 0;
    }

    natTraversalHandleAddressReply(v1, v26, v28, v21, v22, v23, v24, v25);
  }

void handleLNTPortMappingResponse( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10 = *(void *)(a1 + 8);
  int v11 = *(char **)(a1 + 80);
  int v40 = v11;
  uint64_t v12 = *(void *)(a1 + 96);
  int64_t v13 = &v11[v12];
  uint64_t v14 = v10 + 14648;
  while (1)
  {
    uint64_t v14 = *(void *)v14;
    if (!v14) {
      break;
    }
    if (v14 == *(void *)(a1 + 16))
    {
      int v20 = ParseHTTPResponseCode((const char **)&v40, (unsigned __int8 *)&v11[v12]);
      if ((unsigned __int16)v20 <= 0x1F3u)
      {
        if ((unsigned __int16)v20 == 200)
        {
          if (mDNS_LoggingEnabled == 1) {
            LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTPortMappingResponse: got a valid response, sending reply to natTraversalHandlePortMapReply(intern al %d external %d retries %d)",  v15,  v16,  v17,  v18,  v19,  bswap32(*(unsigned __int16 *)(v14 + 174)) >> 16);
          }
          unsigned int v31 = *(unsigned __int16 *)(v14 + 176);
          if (!*(_WORD *)(v14 + 176)) {
            unsigned int v31 = *(unsigned __int16 *)(v14 + 174);
          }
          uint64_t v32 = bswap32(*(unsigned __int16 *)(v14 + 136) + (bswap32(v31) >> 16)) >> 16;
          *(_DWORD *)(a1 + 104) = 0;
          natTraversalHandlePortMapReplyWithAddress( v10,  v14,  *(void *)(v10 + 14944),  0LL,  *(unsigned int *)(v10 + 14672),  v32,  7200LL,  2LL);
        }

        else if ((unsigned __int16)v20 == 404)
        {
          LNT_ClearState(v10);
        }

        goto LABEL_38;
      }

      if ((unsigned __int16)v20 == 65534)
      {
        uint64_t v29 = (os_log_s *)mDNSLogCategory_Default;
        uint64_t v30 = "handleLNTPortMappingResponse got unexpected response code";
      }

      else
      {
        if ((unsigned __int16)v20 != 65533)
        {
          if ((unsigned __int16)v20 == 500)
          {
            uint64_t v21 = v40;
            if (v40)
            {
              if (v40 != v13)
              {
                uint64_t v22 = &v11[v12] - v40;
                while (1)
                {
                  int v23 = *v21;
                  if ((v23 & 0xFFFFFFDF) != 0x43 || v22 < 8)
                  {
                    if (v23 != 62 || v22 < 15) {
                      goto LABEL_22;
                    }
                    int v26 = v21;
                    unsigned int v27 = ">718</errorCode";
                    size_t v28 = 15LL;
                  }

                  else
                  {
                    int v26 = v21;
                    unsigned int v27 = "Conflict";
                    size_t v28 = 8LL;
                  }

                  if (!strncasecmp(v26, v27, v28))
                  {
                    int v33 = *(_DWORD *)(a1 + 104);
                    if (v33 > 99)
                    {
                      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTPortMappingResponse too many conflict retries %d %d",  v15,  v16,  v17,  v18,  v19,  bswap32(*(unsigned __int16 *)(v14 + 174)) >> 16);
                      natTraversalHandlePortMapReplyWithAddress( v10,  v14,  *(void *)(v10 + 14944),  4LL,  *(unsigned int *)(v10 + 14672),  0LL,  0LL,  2LL);
                    }

                    else
                    {
                      *(_DWORD *)(a1 + 104) = v33 + 1;
                      SendPortMapRequest(*(void *)(a1 + 8), v14);
                      if (mDNS_LoggingEnabled == 1) {
                        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "handleLNTPortMappingResponse: Conflict retry %d",  v34,  v35,  v36,  v37,  v38,  *(_DWORD *)(a1 + 104));
                      }
                    }

                    return;
                  }

uint64_t ParseHTTPResponseCode(const char **a1, unsigned __int8 *a2)
{
  uint64_t v2 = *a1;
  if (strncasecmp(*a1, "HTTP/", 5uLL)) {
    return -3;
  }
  uint64_t v12 = (unsigned __int8 *)(v2 + 5);
  if (v2 != (const char *)-5LL && v12 != a2)
  {
    while (1)
    {
      int v19 = *v12;
      if (v19 == 10) {
        return -3;
      }
      if (v19 != 32)
      {
        if (++v12)
        {
          if (v12 != a2) {
            continue;
          }
        }
      }

      break;
    }
  }

  if (v12 == a2) {
    return -1;
  }
  uint64_t v14 = v12 + 1;
  if (a2 - (v12 + 1) < 3) {
    return -1;
  }
  uint64_t v15 = v12 + 4;
  if (v12 != (unsigned __int8 *)-4LL)
  {
    do
    {
      if (v15 == a2) {
        break;
      }
      if (*v15 == 10) {
        break;
      }
      ++v15;
    }

    while (v15);
  }

  if (v15 == a2) {
    return -1;
  }
  *a1 = (const char *)(v15 + 1);
  if (*v14 == 12338 && v12[3] == 48)
  {
    return 200;
  }

  else if (*v14 == 12340 && v12[3] == 52)
  {
    return 404;
  }

  else if (*v14 == 12341 && v12[3] == 48)
  {
    return 500;
  }

  else
  {
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ParseHTTPResponseCode found unexpected result code: %c%c%c",  v6,  v7,  v8,  v9,  v10,  v12[1]);
    }
    return -2;
  }

uint64_t ParseHttpUrl(uint64_t result, unint64_t a2, void *a3, _WORD *a4, void *a5)
{
  uint64_t v7 = (unsigned __int8 *)result;
  if ((uint64_t)(a2 - result) >= 7)
  {
    BOOL result = strncasecmp((const char *)result, "http://", 7uLL);
    if (!(_DWORD)result)
    {
      int v19 = v7 + 7;
      if ((unint64_t)(v7 + 7) >= a2)
      {
        uint64_t v15 = 4294901756LL;
        if (mDNS_LoggingEnabled == 1) {
          LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ParseHttpUrl: past end of buffer parsing host:port",  v10,  v11,  v12,  v13,  v14,  v30);
        }
        return v15;
      }

      if (v7 == (unsigned __int8 *)-7LL)
      {
        BOOL result = (uint64_t)malloc(1uLL);
        if (result) {
          *a3 = result;
        }
        goto LABEL_36;
      }

      uint64_t v20 = 0LL;
      while (1)
      {
        uint64_t v21 = &v7[v20];
        if (v7[v20 + 7] == 47) {
          break;
        }
        ++v20;
        uint64_t v22 = v21 + 8;
        if (!v22 || v22 == (unsigned __int8 *)a2)
        {
          uint64_t v21 = &v7[v20];
          break;
        }
      }

      uint64_t v7 = v21 + 7;
      unsigned int v23 = v20 + 1;
      if ((_DWORD)v20 == -1) {
        goto LABEL_36;
      }
      BOOL result = (uint64_t)malloc((v20 + 1));
      if (!result) {
        goto LABEL_36;
      }
      *a3 = result;
      if (v23 < 2)
      {
LABEL_25:
        *(_BYTE *)BOOL result = 0;
      }

      else
      {
        uint64_t v24 = (int)v23;
        uint64_t v25 = v19;
        while (1)
        {
          int v26 = *v25;
          *(_BYTE *)BOOL result = v26;
          if (!v26) {
            break;
          }
          ++result;
          ++v25;
        }
      }

      unsigned int v27 = v7 - 1;
      while (v27 > v19)
      {
        size_t v28 = v27--;
        int v29 = *v28;
        BOOL result = (uint64_t)(v28 + 1);
        if (v29 == 58)
        {
          BOOL result = strtol((const char *)result, 0LL, 10);
          *a4 = bswap32(result) >> 16;
          break;
        }
      }
    }
  }

  uint64_t v15 = 0LL;
  int v16 = a2 - (_DWORD)v7;
  uint64_t v17 = (a2 - (_DWORD)v7 + 1);
  if (v16 != -1)
  {
    BOOL result = (uint64_t)malloc((v16 + 1));
    if (result)
    {
      *a5 = result;
      if (v7)
      {
        if (v17 < 2)
        {
LABEL_11:
          uint64_t v15 = 0LL;
          *(_BYTE *)BOOL result = 0;
        }

        else
        {
          while (1)
          {
            int v18 = *v7;
            *(_BYTE *)BOOL result = v18;
            if (!v18) {
              return 0LL;
            }
            ++result;
            ++v7;
          }
        }

        return v15;
      }
    }
  }

void AllocAndCopy( void *a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (__s)
  {
    size_t v16 = strlen(__s) + 1;
    if (HIDWORD(v16))
    {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "AllocAndCopy: can't allocate string",  v11,  v12,  v13,  v14,  v15,  a9);
    }

    else if ((_DWORD)v16 && (uint64_t v17 = malloc(v16)) != 0LL)
    {
      *a1 = v17;
      memcpy(v17, __s, v16);
    }

    else
    {
      __break(1u);
    }
  }

void GetDeviceDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int16 *)(a1 + 14962);
  if (!*(_WORD *)(a1 + 14964))
  {
    if (!*(void *)(a1 + 14968) || !*(void *)(a1 + 14992))
    {
      uint64_t v7 = (os_log_s *)mDNSLogCategory_NAT;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_WORD *)buf = 0;
      }

      else
      {
        uint64_t v7 = (os_log_s *)mDNSLogCategory_NAT_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_WORD *)buf = 0;
      }

      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "GetDeviceDescription: no router URL or address string!",  buf,  2u);
      return;
    }

    int v5 = *(void **)(a2 + 64);
    if (v5)
    {
      bzero(v5, 0x2000uLL);
      uint64_t v6 = *(void **)(a2 + 64);
    }

    else
    {
      uint64_t v6 = malloc(0x2000uLL);
      if (!v6) {
        __break(1u);
      }
      *(void *)(a2 + 64) = v6;
    }

    *(_DWORD *)(a2 + 72) = mDNS_snprintf(v6);
    uint64_t v10 = (os_log_s *)mDNSLogCategory_NAT;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_NAT == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a2 + 64);
        *(_DWORD *)buf = 136446210;
        uint64_t v14 = v12;
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)mDNSLogCategory_NAT_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_NAT_redacted, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a2 + 64);
        *(_DWORD *)buf = 136446210;
        uint64_t v14 = v11;
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Describe Device: [%{public}s]", buf, 0xCu);
      }
    }

    MakeTCPConnection(a1, a2, (int *)(a1 + 12704), *v2, 1);
  }

void LNT_SendDiscoveryMsg(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 141))
  {
    uint64_t v2 = a1 + 14960;
    if (*(_WORD *)(a1 + 14962))
    {
      uint64_t v3 = *(void **)(a1 + 14952);
      if (v3)
      {
        CloseSocketSet(*(void *)(a1 + 14952));
        free(v3);
        *(void *)(a1 + 14952) = 0LL;
      }

      if (!*(_WORD *)(v2 + 4) && !*(void *)(a1 + 14848)) {
        GetDeviceDescription(a1, a1 + 14824);
      }
    }

    else
    {
      uint64_t v4 = a1 + 28904;
      unsigned int v5 = mDNS_snprintf((void *)(a1 + 28904));
      if (*(_DWORD *)(a1 + 12708))
      {
        unsigned int v6 = v5;
        uint64_t v7 = *(int **)(a1 + 14952);
        if (!v7)
        {
          uint64_t v7 = mDNSPlatformUDPSocket(0);
          *(void *)(a1 + 14952) = v7;
        }

        uint64_t v8 = v4 + v6;
        mDNSPlatformSendUDP( (void *)a1,  (unsigned __int16 *)(a1 + 28904),  v8,  0LL,  (uint64_t)v7,  (int *)(a1 + 12704),  0x6C07u,  0);
        mDNSPlatformSendUDP( (void *)a1,  (unsigned __int16 *)(a1 + 28904),  v8,  0LL,  *(void *)(a1 + 14952),  LNT_SendDiscoveryMsg_multicastDest,  0x6C07u,  0);
      }

      *(_BYTE *)uint64_t v2 = *(_BYTE *)v2 == 0;
    }
  }

uint64_t dump_state_to_fd(unsigned int a1)
{
  int v1017 = mDNS_TimeNow(mDNSStorage, v2, v3, v4, v5, v6, v7, v8);
  memset(v1033, 0, sizeof(v1033));
  LogToFD( a1,  "---- BEGIN STATE LOG ---- %s %s %d",  v9,  v10,  v11,  v12,  v13,  v14,  (int)"mDNSResponder mDNSResponder-2559.60.39.0.1 (Nov 10 2024 02:11:03)");
  v1036.__darwin_time_t tv_sec = 0LL;
  *(void *)&v1036.tv_usec = 0LL;
  gettimeofday(&v1036, 0LL);
  getLocalTimestampFromTimeval((uint64_t)&v1036, (char *)v1033);
  unsigned int v1029 = a1;
  LogToFD(a1, "Date: %s", v15, v16, v17, v18, v19, v20, (int)v1033);
  uint64_t v21 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v1036.tv_sec) = 136446210;
      *(__darwin_time_t *)((char *)&v1036.tv_sec + 4) = (__darwin_time_t)v1033;
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v21 = (os_log_s *)mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v1036.tv_sec) = 136446210;
      *(__darwin_time_t *)((char *)&v1036.tv_sec + 4) = (__darwin_time_t)v1033;
LABEL_7:
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "---- BEGIN STATE LOG ---- (%{public}s)",  (uint8_t *)&v1036,  0xCu);
    }
  }

  int v29 = mDNS_TimeNow(mDNSStorage, v22, v23, v24, v25, v26, v27, v28);
  LODWORD(v1036.tv_sec) = 0;
  LODWORD(v1034[0]) = 0;
  uint64_t v1032 = 0LL;
  LogToFD(a1, "------------ Cache -------------", v30, v31, v32, v33, v34, v35, v967);
  LogToFD( a1,  "Slt Q     TTL if     U Type     DNSSEC                                   rdlen",  v36,  v37,  v38,  v39,  v40,  v41,  v968);
  uint64_t v48 = 0LL;
  int v49 = 0;
  int v50 = 0;
  int v1028 = v29;
  do
  {
    uint64_t v51 = mDNSStorage[v48 + 35];
    if (v51)
    {
      do
      {
        v1020 = (uint64_t *)v51;
        int v1023 = v49;
        for (i = *(void *)(v51 + 16); i; int v29 = v1028)
        {
          uint64_t v53 = *(void *)(i + 32);
          if (v53) {
            uint64_t v54 = (uint64_t *)((char *)&v1032 + 4);
          }
          else {
            uint64_t v54 = &v1032;
          }
          uint64_t v55 = *(void *)(i + 56);
          if (v55)
          {
            if (!v53)
            {
              uint64_t v56 = *(void *)(v55 + 24);
              if (v56)
              {
                int v57 = *(unsigned __int8 *)(v56 + 280);
                if (v57 == 5 || v57 == 2) {
                  uint64_t v53 = *(unsigned int *)(v56 + 256);
                }
                else {
                  uint64_t v53 = 0LL;
                }
              }
            }
          }

          unint64_t v59 = -274877907LL * (v29 - *(_DWORD *)(i + 80));
          uint64_t v60 = (v59 >> 63) + (SHIDWORD(v59) >> 6) + *(_DWORD *)(i + 16);
          uint64_t v61 = &xmmword_10015BD30;
          while (1)
          {
            uint64_t v61 = *(__int128 **)v61;
            if (!v61) {
              break;
            }
            int v62 = v61;
            if (*((void *)v61 + 782) == v53) {
              goto LABEL_28;
            }
          }

          int v62 = 0LL;
LABEL_28:
          if (v61) {
            uint64_t v63 = (uint64_t)v62 + 6310;
          }
          else {
            uint64_t v63 = 0LL;
          }
          if (*(void *)(i + 96)) {
            ++v50;
          }
          PrintOneCacheRecordToFD(a1, i, v48, v60, v63, v54);
          uint64_t v64 = *(void *)(i + 120);
          if (v64) {
            PrintOneCacheRecordToFD(a1, v64, v48, v60, v63, v54);
          }
          uint64_t i = *(void *)i;
        }

        int v49 = v1023 + 1;
        uint64_t v51 = *v1020;
      }

      while (*v1020);
    }

    ++v48;
  }

  while (v48 != 499);
  if (dword_100158CB4 != HIDWORD(v1032) + v49 + (_DWORD)v1032) {
    LogToFD( a1,  "Cache use mismatch: rrcache_totalused is %lu, true count %lu",  v42,  v43,  v44,  v45,  v46,  v47,  dword_100158CB4);
  }
  if ((_DWORD)qword_100158CBC != v50) {
    LogToFD( a1,  "Cache use mismatch: rrcache_active is %lu, true count %lu",  v42,  v43,  v44,  v45,  v46,  v47,  qword_100158CBC);
  }
  LogToFD( a1,  "Cache size %u entities; %u in use (%u group, %u multicast, %u unicast); %u referenced by active questions",
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    dword_100158CB0);
  LogToFD(a1, "--------- Auth Records ---------", v65, v66, v67, v68, v69, v70, v969);
  uint64_t v71 = a1;
  LogAuthRecordsToFD(a1, v29, xmmword_10015BD08, 0LL, v72, v73, v74, v75);
  LogToFD(a1, "--------- LocalOnly, P2P Auth Records ---------", v76, v77, v78, v79, v80, v81, v970);
  uint64_t v88 = 0LL;
  int v89 = 1;
  do
  {
    uint64_t v1024 = v88;
    for (j = (void *)mDNSStorage[v88 + 787]; j; j = (void *)*j)
    {
      for (k = (uint64_t *)j[2]; k; k = (uint64_t *)*k)
      {
        if ((void (*)(uint64_t, uint64_t, int))k[13] != FreeEtcHosts)
        {
          if (v89) {
            LogToFD(v71, "  State       Interface", v82, v83, v84, v85, v86, v87, v971);
          }
          int v92 = *((_DWORD *)k + 43);
          if (v92 == 5)
          {
            uint64_t v100 = k[4];
            int v101 = RecordTypeName(*((unsigned __int8 *)k + 8));
            GetRRDisplayString_rdb((unsigned __int8 *)k + 8, (unsigned __int16 *)(k[6] + 4), word_100164338);
            if (v100 == -5)
            {
              uint64_t v71 = a1;
              LogToFD(a1, " %s   BLE %s", v102, v103, v104, v105, v106, v107, v101);
            }

            else
            {
              uint64_t v71 = a1;
              LogToFD(a1, " %s   PP  %s", v102, v103, v104, v105, v106, v107, v101);
            }
          }

          else if (v92 == 4)
          {
            int v93 = RecordTypeName(*((unsigned __int8 *)k + 8));
            GetRRDisplayString_rdb((unsigned __int8 *)k + 8, (unsigned __int16 *)(k[6] + 4), word_100164338);
            LogToFD(v71, " %s   LO  %s", v94, v95, v96, v97, v98, v99, v93);
          }

          int v89 = 0;
        }
      }
    }

    uint64_t v88 = v1024 + 1;
  }

  while (v1024 != 498);
  if (v89) {
    LogToFD(v71, "<None>", v82, v83, v84, v85, v86, v87, v971);
  }
  LogToFD(v71, "--------- /etc/hosts ---------", v82, v83, v84, v85, v86, v87, v971);
  uint64_t v114 = 0LL;
  int v115 = 0;
  int v116 = 0;
  uint64_t v117 = 0LL;
  int v118 = 1;
  do
  {
    v119 = (void *)mDNSStorage[v114 + 787];
    if (v119) {
      ++v116;
    }
    uint64_t v1021 = v114;
    for (m = v116; v119; uint64_t v117 = v121)
    {
      v120 = (unsigned __int8 *)v119[2];
      if (v120)
      {
        do
        {
          if (*((void (**)(uint64_t, uint64_t, int))v120 + 13) == FreeEtcHosts)
          {
            if (v118) {
              LogToFD(v71, "  State       Interface", v108, v109, v110, v111, v112, v113, v972);
            }
            uint64_t v121 = (v117 + 1);
            if ((int)v117 <= 49)
            {
              if (*((_DWORD *)v120 + 43) == 4)
              {
                if (*((void *)v120 + 4) == -2LL)
                {
                  int v129 = RecordTypeName(v120[8]);
                  GetRRDisplayString_rdb(v120 + 8, (unsigned __int16 *)(*((void *)v120 + 6) + 4LL), word_100164338);
                  LogToFD(v71, " %s   LO %s", v130, v131, v132, v133, v134, v135, v129);
                }

                else
                {
                  int v122 = RecordTypeName(v120[8]);
                  GetRRDisplayString_rdb(v120 + 8, (unsigned __int16 *)(*((void *)v120 + 6) + 4LL), word_100164338);
                  LogToFD(v71, " %s   %u  %s", v123, v124, v125, v126, v127, v128, v122);
                }
              }

              int v118 = 0;
            }

            else
            {
              int v118 = 0;
              int v115 = 1;
            }
          }

          else
          {
            uint64_t v121 = v117;
          }

          v120 = *(unsigned __int8 **)v120;
          uint64_t v117 = v121;
        }

        while (v120);
      }

      else
      {
        uint64_t v121 = v117;
      }

      v119 = (void *)*v119;
    }

    int v116 = m;
    uint64_t v114 = v1021 + 1;
  }

  while (v1021 != 498);
  if (v118)
  {
    LogToFD(v71, "<None>", v108, v109, v110, v111, v112, v113, v972);
    int v136 = v1028;
  }

  else
  {
    int v136 = v1028;
    if (v115) {
      LogToFD( v71,  "<Truncated: to 50 records, Total records %d, Total Auth Groups %d, Auth Slots %d>",  v108,  v109,  v110,  v111,  v112,  v113,  v117);
    }
  }

  LogToFD(v71, "------ Duplicate Records -------", v108, v109, v110, v111, v112, v113, v972);
  LogAuthRecordsToFD(v71, v136, *((uint64_t *)&xmmword_10015BD08 + 1), 0LL, v137, v138, v139, v140);
  LogToFD(v71, "----- Auth Records Proxied -----", v141, v142, v143, v144, v145, v146, v973);
  LogAuthRecordsToFD(v71, v136, xmmword_10015BD08, &v1036, v147, v148, v149, v150);
  LogToFD(v71, "-- Duplicate Records Proxied ---", v151, v152, v153, v154, v155, v156, v974);
  LogAuthRecordsToFD(v71, v136, *((uint64_t *)&xmmword_10015BD08 + 1), v1034, v157, v158, v159, v160);
  LogToFD(v71, "---------- Questions -----------", v161, v162, v163, v164, v165, v166, v975);
  if (qword_100158C80)
  {
    LogToFD( v71,  "   Int  Next if     T NumAns Qptr               DupOf              SU SQ DNSSEC Type    Name",  v167,  v168,  v169,  v170,  v171,  v172,  v976);
    uint64_t v179 = qword_100158C80;
    int v180 = 0;
    for (n = 0; v179; uint64_t v179 = *(void *)(v179 + 8))
    {
      int v182 = *(_DWORD *)(v179 + 212);
      int v1026 = v182 / 1000;
      v183 = &xmmword_10015BD30;
      do
        v183 = *(__int128 **)v183;
      while (v183 && *((void *)v183 + 782) != *(void *)(v179 + 136));
      ++n;
      if (v182) {
        ++v180;
      }
      DNSTypeName(*(unsigned __int16 *)(v179 + 322));
      uint64_t v71 = v1029;
      LogToFD(v1029, "%6d%6d %-7s%s %6d 0x%p 0x%p %1d %2d  %-7s%-8s%##s%s", v184, v185, v186, v187, v188, v189, v1026);
    }

    LogToFD(v71, "%lu question%s; %lu active", v173, v174, v175, v176, v177, v178, n);
  }

  else
  {
    LogToFD(v71, "<None>", v167, v168, v169, v170, v171, v172, v976);
  }

  LogToFD(v71, "----- LocalOnly, P2P Questions -----", v190, v191, v192, v193, v194, v195, v977);
  uint64_t v202 = qword_100158C98;
  if (qword_100158C98)
  {
    do
    {
      uint64_t v203 = *(void *)(v202 + 136);
      if (v203 == -5) {
        v204 = "BLE";
      }
      else {
        v204 = "P2P";
      }
      if (v203 == -2) {
        v205 = "LO ";
      }
      else {
        LODWORD(v205) = (_DWORD)v204;
      }
      DNSTypeName(*(unsigned __int16 *)(v202 + 322));
      int v979 = (int)v205;
      uint64_t v71 = v1029;
      LogToFD(v1029, "                 %3s   %5d  %-6s%##s%s", v206, v207, v208, v209, v210, v211, v979);
      uint64_t v202 = *(void *)(v202 + 8);
    }

    while (v202);
  }

  else
  {
    LogToFD(v71, "<None>", v196, v197, v198, v199, v200, v201, v978);
  }

  LogToFD(v71, "---- Active UDS Client Requests ----", v212, v213, v214, v215, v216, v217, v980);
  uint64_t v224 = all_requests;
  if (all_requests)
  {
    do
    {
      uint64_t v225 = *(void *)(v224 + 24);
      if (v225)
      {
        for (iuint64_t i = all_requests; ii && ii != v224; iuint64_t i = *(void *)(ii + 16))
        {
          if (ii == v225) {
            goto LABEL_116;
          }
        }

        LogToFD( v71,  "%3d: Orhpan operation %p; parent %p not found in request list",
          v218,
          v219,
          v220,
          v221,
          v222,
          v223,
          *(_DWORD *)(v224 + 168));
      }

      LogClientInfoToFD(v71, v224);
LABEL_116:
      uint64_t v224 = *(void *)(v224 + 16);
    }

    while (v224);
  }

  else
  {
    LogToFD(v71, "<None>", v218, v219, v220, v221, v222, v223, v981);
  }

  LogToFD(v71, "-------- NAT Traversals --------", v218, v219, v220, v221, v222, v223, v981);
  LogToFD(v71, "ExtAddress %.4a Retry %d Interval %d", v228, v229, v230, v231, v232, v233, (int)&dword_10015C508);
  for (jj = (void *)xmmword_10015C4F0; jj; jj = (void *)*jj)
    LogToFD( v71,  "%p %s Int %5d %s Err %d Retry %5d Interval %5d Expire %5d Req %.4a:%d Ext %.4a:%d",  v234,  v235,  v236,  v237,  v238,  v239,  (int)jj);
  LogToFD(v71, "--------- AuthInfoList ---------", v234, v235, v236, v237, v238, v239, v982);
  v247 = (void *)qword_10015BD98;
  if (qword_10015BD98)
  {
    int v248 = v1028;
    do
    {
      LogToFD(v71, "%##s %##s %##s %d %d", v241, v242, v243, v244, v245, v246, (_DWORD)v247 + 12);
      v247 = (void *)*v247;
    }

    while (v247);
  }

  else
  {
    LogToFD(v71, "<None>", v241, v242, v243, v244, v245, v246, v983);
    int v248 = v1028;
  }

  LogToFD(v71, "---------- Misc State ----------", v241, v242, v243, v244, v245, v246, v984);
  LogToFD(v71, "PrimaryMAC:   %.6a", v249, v250, v251, v252, v253, v254, (int)&dword_100158BD0);
  LogToFD(v71, "m->SleepState %d (%s) seq %d", v255, v256, v257, v258, v259, v260, byte_100158C45);
  else {
    LogToFD(v71, "Not offering Sleep Proxy Service", v261, v262, v263, v264, v265, v266, v985);
  }
  if (dword_10015D930 == LODWORD(v1034[0]) + LODWORD(v1036.tv_sec)) {
    LogToFD(v71, "ProxyRecords: %d + %d = %d", v267, v268, v269, v270, v271, v272, v1036.tv_sec);
  }
  else {
    LogToFD(v71, "ProxyRecords: MISMATCH %d + %d = %d ≠ %d", v267, v268, v269, v270, v271, v272, v1036.tv_sec);
  }
  LogToFD(v71, "------ Auto Browse Domains -----", v273, v274, v275, v276, v277, v278, v986);
  v285 = (void *)AutoBrowseDomains;
  if (AutoBrowseDomains)
  {
    do
    {
      LogToFD(v71, "%##s", v279, v280, v281, v282, v283, v284, (_DWORD)v285 + 12);
      v285 = (void *)*v285;
    }

    while (v285);
  }

  else
  {
    LogToFD(v71, "<None>", v279, v280, v281, v282, v283, v284, v987);
  }

  LogToFD(v71, "--- Auto Registration Domains --", v279, v280, v281, v282, v283, v284, v988);
  v292 = (void *)AutoRegistrationDomains;
  if (AutoRegistrationDomains)
  {
    do
    {
      LogToFD(v71, "%##s", v286, v287, v288, v289, v290, v291, (_DWORD)v292 + 12);
      v292 = (void *)*v292;
    }

    while (v292);
  }

  else
  {
    LogToFD(v71, "<None>", v286, v287, v288, v289, v290, v291, v989);
  }

  LogToFD(v71, "--- Search Domains --", v286, v287, v288, v289, v290, v291, v990);
  v299 = (void *)SearchList;
  if (SearchList)
  {
    do
    {
      v300 = &xmmword_10015BD30;
      do
        v300 = *(__int128 **)v300;
      while (v300 && *((void *)v300 + 782) != v299[34]);
      LogToFD(v71, "%##s %s", v293, v294, v295, v296, v297, v298, (_DWORD)v299 + 8);
      v299 = (void *)*v299;
    }

    while (v299);
  }

  else
  {
    LogToFD(v71, "<None>", v293, v294, v295, v296, v297, v298, v991);
  }

  LogToFD(v71, "--- MDNS Statistics ---", v293, v294, v295, v296, v297, v298, v992);
  LogToFD( v71,  "Name Conflicts                 %u",  v301,  v302,  v303,  v304,  v305,  v306,  *(_DWORD *)&byte_100158C30[&loc_100004D18]);
  LogToFD( v71,  "KnownUnique Name Conflicts     %u",  v307,  v308,  v309,  v310,  v311,  v312,  *(_DWORD *)((char *)&qword_100158C34 + &loc_100004D18));
  LogToFD( v71,  "Duplicate Query Suppressions   %u",  v313,  v314,  v315,  v316,  v317,  v318,  *(_DWORD *)((char *)&qword_100158C34 + &loc_100004D18 + 4));
  LogToFD( v71,  "KA Suppressions                %u",  v319,  v320,  v321,  v322,  v323,  v324,  *(_DWORD *)((char *)&unk_100158C3C + &loc_100004D18));
  LogToFD( v71,  "KA Multiple Packets            %u",  v325,  v326,  v327,  v328,  v329,  v330,  *(int *)((char *)&dword_100158C40 + &loc_100004D18));
  LogToFD( v71,  "Poof Cache Deletions           %u",  v331,  v332,  v333,  v334,  v335,  v336,  *(_DWORD *)&byte_100158C44[&loc_100004D18]);
  LogToFD(v71, "--------------------------------", v337, v338, v339, v340, v341, v342, v993);
  LogToFD(v71, "Multicast packets Sent         %u", v343, v344, v345, v346, v347, v348, SHIDWORD(qword_100158C64));
  LogToFD(v71, "Multicast packets Received     %u", v349, v350, v351, v352, v353, v354, dword_100158C40);
  LogToFD(v71, "Remote Subnet packets          %u", v355, v356, v357, v358, v359, v360, dword_100158C6C);
  LogToFD( v71,  "QU questions  received         %u",  v361,  v362,  v363,  v364,  v365,  v366,  *(_DWORD *)((char *)&unk_100158C48 + &loc_100004D18));
  LogToFD( v71,  "Normal multicast questions     %u",  v367,  v368,  v369,  v370,  v371,  v372,  *(int *)((char *)&dword_100158C4C + &loc_100004D18));
  LogToFD( v71,  "Answers for questions          %u",  v373,  v374,  v375,  v376,  v377,  v378,  *(int *)((char *)&dword_100158C50 + &loc_100004D18));
  LogToFD( v71,  "Unicast responses              %u",  v379,  v380,  v381,  v382,  v383,  v384,  *(int *)((char *)&dword_100158C54 + &loc_100004D18));
  LogToFD( v71,  "Multicast responses            %u",  v385,  v386,  v387,  v388,  v389,  v390,  *(int *)((char *)&dword_100158C58 + &loc_100004D18));
  LogToFD( v71,  "Unicast response Demotions     %u",  v391,  v392,  v393,  v394,  v395,  v396,  *(int *)((char *)&dword_100158C5C + &loc_100004D18));
  LogToFD(v71, "--------------------------------", v397, v398, v399, v400, v401, v402, v994);
  LogToFD( v71,  "Sleeps                         %u",  v403,  v404,  v405,  v406,  v407,  v408,  *(int *)((char *)&dword_100158C60 + &loc_100004D18));
  LogToFD( v71,  "Wakeups                        %u",  v409,  v410,  v411,  v412,  v413,  v414,  *(_DWORD *)((char *)&qword_100158C64 + &loc_100004D18));
  LogToFD( v71,  "Interface UP events            %u",  v415,  v416,  v417,  v418,  v419,  v420,  *(_DWORD *)((char *)&qword_100158C64 + &loc_100004D18 + 4));
  LogToFD( v71,  "Interface UP Flap events       %u",  v421,  v422,  v423,  v424,  v425,  v426,  *(int *)((char *)&dword_100158C6C + &loc_100004D18));
  LogToFD( v71,  "Interface Down events          %u",  v427,  v428,  v429,  v430,  v431,  v432,  *(int *)((char *)&dword_100158C70 + &loc_100004D18));
  LogToFD( v71,  "Interface DownFlap events      %u",  v433,  v434,  v435,  v436,  v437,  v438,  *(int *)((char *)&dword_100158C74 + &loc_100004D18));
  LogToFD( v71,  "Cache refresh queries          %u",  v439,  v440,  v441,  v442,  v443,  v444,  *(_DWORD *)((char *)&unk_100158C78 + &loc_100004D18));
  LogToFD( v71,  "Cache refreshed                %u",  v445,  v446,  v447,  v448,  v449,  v450,  *(_DWORD *)((char *)&unk_100158C7C + &loc_100004D18));
  LogToFD( v71,  "Wakeup on Resolves             %u",  v451,  v452,  v453,  v454,  v455,  v456,  *(_DWORD *)((char *)&qword_100158C80 + &loc_100004D18));
  LogToFD(v71, "---- Task Scheduling Timers ----", v457, v458, v459, v460, v461, v462, v995);
  LogToFD(v71, "BonjourEnabled %d", v463, v464, v465, v466, v467, v468, byte_100158C30[0]);
  if (qword_100158C88)
  {
    int v475 = *(_DWORD *)(qword_100158C88 + 204);
    DNSTypeName(*(unsigned __int16 *)(qword_100158C88 + 322));
    LogToFD(v71, "NewQuestion DelayAnswering %d %d %##s (%s)", v476, v477, v478, v479, v480, v481, v475);
  }

  else
  {
    LogToFD(v71, "NewQuestion <NONE>", v469, v470, v471, v472, v473, v474, v996);
  }

  if (qword_100158CA0)
  {
    int v488 = qword_100158CA0 + 356;
    DNSTypeName(*(unsigned __int16 *)(qword_100158CA0 + 322));
    LogToFD(v71, "NewLocalOnlyQuestions %##s (%s)", v489, v490, v491, v492, v493, v494, v488);
  }

  else
  {
    LogToFD(v71, "NewLocalOnlyQuestions <NONE>", v482, v483, v484, v485, v486, v487, v997);
  }

  if ((void)xmmword_10015BD18)
  {
    int v501 = *(unsigned __int8 *)(xmmword_10015BD18 + 8);
    GetRRDisplayString_rdb( (unsigned __int8 *)(xmmword_10015BD18 + 8),  (unsigned __int16 *)(*(void *)(xmmword_10015BD18 + 48) + 4LL),  word_100164338);
    LogToFD(v71, "NewLocalRecords %02X %s", v502, v503, v504, v505, v506, v507, v501);
  }

  else
  {
    LogToFD(v71, "NewLocalRecords <NONE>", v495, v496, v497, v498, v499, v500, v998);
  }

  if ((void)xmmword_10015C678) {
    v514 = "";
  }
  else {
    v514 = " <NONE>";
  }
  LogToFD(v71, "SPSProxyListChanged%s", v508, v509, v510, v511, v512, v513, (int)v514);
  if (byte_100158C44[0]) {
    v521 = "";
  }
  else {
    v521 = " <NONE>";
  }
  LogToFD(v71, "LocalRemoveEvents%s", v515, v516, v517, v518, v519, v520, (int)v521);
  LogToFD(v71, "m->WABBrowseQueriesCount %d", v522, v523, v524, v525, v526, v527, SDWORD2(xmmword_10015C4C8));
  LogToFD(v71, "m->WABLBrowseQueriesCount %d", v528, v529, v530, v531, v532, v533, SHIDWORD(xmmword_10015C4C8));
  LogToFD(v71, "m->WABRegQueriesCount %d", v534, v535, v536, v537, v538, v539, dword_10015C4D8);
  LogToFD( v71,  "m->AutoTargetServices %u",  v540,  v541,  v542,  v543,  v544,  v545,  *(_DWORD *)((char *)mDNSStorage + &loc_100004D80 + 4));
  LogToFD(v71, "m->AutoTargetAWDLIncludedCount %u", v546, v547, v548, v549, v550, v551, dword_10015B668);
  LogToFD(v71, "m->AutoTargetAWDLOnlyCount     %u", v552, v553, v554, v555, v556, v557, dword_10015B66C);
  LogToFD( v71,  "                         ABS (hex)  ABS (dec)  REL (hex)  REL (dec)",  v558,  v559,  v560,  v561,  v562,  v563,  v999);
  LogToFD(v71, "m->timenow               %08X %11d", v564, v565, v566, v567, v568, v569, v248);
  LogToFD(v71, "m->timenow_adjust        %08X %11d", v570, v571, v572, v573, v574, v575, dword_100158BF4);
  LogToFD(v71, "m->NextScheduledEvent    %08X %11d  %08X %11d", v576, v577, v578, v579, v580, v581, dword_100158C00);
  LogToFD(v71, "m->NextuDNSEvent         %08X %11d  %08X %11d", v582, v583, v584, v585, v586, v587, dword_10015BD48);
  LogToFD(v71, "m->NextSRVUpdate         %08X %11d  %08X %11d", v588, v589, v590, v591, v592, v593, dword_10015BD4C);
  LogToFD(v71, "m->NextScheduledNATOp    %08X %11d  %08X %11d", v594, v595, v596, v597, v598, v599, dword_100158C20);
  LogToFD(v71, "m->retryGetAddr          %08X %11d  %08X %11d", v600, v601, v602, v603, v604, v605, dword_10015C504);
  LogToFD(v71, "m->NextCacheCheck        %08X %11d  %08X %11d", v606, v607, v608, v609, v610, v611, dword_100158C10);
  LogToFD(v71, "m->NextScheduledSPS      %08X %11d  %08X %11d", v612, v613, v614, v615, v616, v617, dword_100158C24);
  LogToFD(v71, "m->NextScheduledKA       %08X %11d  %08X %11d", v618, v619, v620, v621, v622, v623, dword_100158C28);
  LogToFD(v71, "m->NextBonjourDisableTime  %08X %11d  %08X %11d", v624, v625, v626, v627, v628, v629, dword_100158C2C);
  LogToFD(v71, "m->NextScheduledSPRetry  %08X %11d  %08X %11d", v630, v631, v632, v633, v634, v635, dword_100158C70);
  LogToFD(v71, "m->DelaySleep            %08X %11d  %08X %11d", v636, v637, v638, v639, v640, v641, dword_100158C50);
  LogToFD(v71, "m->NextScheduledQuery    %08X %11d  %08X %11d", v642, v643, v644, v645, v646, v647, dword_100158C14);
  LogToFD(v71, "m->NextScheduledProbe    %08X %11d  %08X %11d", v648, v649, v650, v651, v652, v653, dword_100158C18);
  LogToFD(v71, "m->NextScheduledResponse %08X %11d  %08X %11d", v654, v655, v656, v657, v658, v659, dword_100158C1C);
  LogToFD(v71, "m->SuppressQueries       %08X %11d  %08X %11d", v660, v661, v662, v663, v664, v665, qword_100158C08);
  LogToFD( v71,  "m->SuppressResponses     %08X %11d  %08X %11d",  v666,  v667,  v668,  v669,  v670,  v671,  SHIDWORD(qword_100158C08));
  LogToFD(v71, "m->SuppressProbes        %08X %11d  %08X %11d", v672, v673, v674, v675, v676, v677, dword_10015BD40);
  LogToFD( v71,  "m->ProbeFailTime         %08X %11d  %08X %11d",  v678,  v679,  v680,  v681,  v682,  v683,  SDWORD2(xmmword_10015BD30));
  LogToFD(v71, "m->DelaySleep            %08X %11d  %08X %11d", v684, v685, v686, v687, v688, v689, dword_100158C50);
  LogToFD(v71, "m->SleepLimit            %08X %11d  %08X %11d", v690, v691, v692, v693, v694, v695, dword_100158C54);
  LogToFD(v71, "m->NextScheduledStopTime  %08X %11d  %08X %11d", v696, v697, v698, v699, v700, v701, dword_100158C74);
  LogToFD(v71, "----- Platform Timers -----", v702, v703, v704, v705, v706, v707, v1000);
  LogToFD(v71, "m->NextCacheCheck        %08X %11d  %08X %11d", v708, v709, v710, v711, v712, v713, dword_100158C10);
  LogToFD(v71, "m->NetworkChanged        %08X %11d  %08X %11d", v714, v715, v716, v717, v718, v719, dword_100158BC0);
  LogToFD( v71,  "m->p->NotifyUser         %08X %11d  %08X %11d",  v720,  v721,  v722,  v723,  v724,  v725,  *(_DWORD *)(mDNSStorage[0] + 492));
  LogToFD( v71,  "m->p->HostNameConflict   %08X %11d  %08X %11d",  v726,  v727,  v728,  v729,  v730,  v731,  *(_DWORD *)(mDNSStorage[0] + 496));
  LogToFD( v71,  "m->p->KeyChainTimer      %08X %11d  %08X %11d",  v732,  v733,  v734,  v735,  v736,  v737,  *(_DWORD *)(mDNSStorage[0] + 500));
  LogToFD(v71, "----- KQSocketEventSources -----", v738, v739, v740, v741, v742, v743, v1001);
  uint64_t v750 = gEventSources;
  if (gEventSources)
  {
    do
    {
      LogToFD(v71, "%3d %s %s", v744, v745, v746, v747, v748, v749, *(_DWORD *)(v750 + 8));
      uint64_t v750 = *(void *)v750;
    }

    while (v750);
  }

  else
  {
    LogToFD(v71, "<None>", v744, v745, v746, v747, v748, v749, v1002);
  }

  LogToFD(v71, "------ Network Interfaces ------", v744, v745, v746, v747, v748, v749, v1003);
  if (*(void *)mDNSStorage[0])
  {
    LogToFD( v71,  "Struct addr          Registered                     MAC               BSSID                                Functio nal Type  Interface Address",  v751,  v752,  v753,  v754,  v755,  v756,  v1004);
    for (uint64_t kk = *(void *)mDNSStorage[0]; kk; uint64_t kk = *(void *)(kk + 6384))
    {
      if (*(_BYTE *)(kk + 6400))
      {
        v1036.__darwin_time_t tv_sec = 0LL;
        *(void *)&v1036.tv_usec = 0LL;
        uint64_t v1037 = 0LL;
        FindSPSInCache((uint64_t)mDNSStorage, kk + 24, &v1036.tv_sec);
        LogToFD( v71,  "%p %2ld, %p,  %s %-8.8s %.6a %.6a %s %s %s %s %s %s %-16.16s %#a",  kk + 6428,  kk + 6264,  v764,  v765,  v766,  v767,  kk);
        if (kk == *(void *)(kk + 6480))
        {
          __darwin_time_t tv_sec = v1036.tv_sec;
          uint64_t v768 = *(void *)&v1036.tv_usec;
          uint64_t v770 = v1037;
          if (v1036.tv_sec || *(void *)&v1036.tv_usec || v1037)
          {
            LogToFD(v71, "         Sleep Proxy Metric   Name", v757, v758, v759, v760, v761, v762, v1005);
            if (tv_sec)
            {
              v771 = *(unsigned __int8 **)(tv_sec + 48);
              unsigned int v772 = v771[4];
              int v773 = 1000000;
              if (v772 >= 5)
              {
                int v774 = v771[5];
                int v773 = 1000000;
                if ((v774 - 48) <= 9)
                {
                  int v775 = v771[6];
                  int v773 = 1000000;
                  if ((v775 - 48) <= 9)
                  {
                    int v776 = v771[8];
                    int v773 = 1000000;
                    if ((v776 - 48) <= 9)
                    {
                      int v777 = v771[9];
                      int v773 = 1000000;
                      if ((v777 - 48) <= 9)
                      {
                        if (v772 < 0xB
                          || v777 != 57
                          || v776 != 57
                          || v771[7] != 45
                          || v771[10] != 45
                          || v771[11] != 57
                          || v771[12] != 57
                          || v771[13] != 45
                          || v771[14] != 57
                          || (int v773 = 1000000, v771[15] != 57))
                        {
                          int v773 = 10000 * v775
                               + 100000 * v774
                               + 1000 * v776
                               + 100 * v777
                               + 10 * v771[11]
                               + v771[12]
                               - 5333328;
                        }
                      }
                    }
                  }
                }
              }

              LogToFD(v71, "  %13d %#s", v757, v758, v759, v760, v761, v762, v773);
            }

            if (v768)
            {
              v778 = *(unsigned __int8 **)(v768 + 48);
              unsigned int v779 = v778[4];
              int v780 = 1000000;
              if (v779 >= 5)
              {
                int v781 = v778[5];
                int v780 = 1000000;
                if ((v781 - 48) <= 9)
                {
                  int v782 = v778[6];
                  int v780 = 1000000;
                  if ((v782 - 48) <= 9)
                  {
                    int v783 = v778[8];
                    int v780 = 1000000;
                    if ((v783 - 48) <= 9)
                    {
                      int v784 = v778[9];
                      int v780 = 1000000;
                      if ((v784 - 48) <= 9)
                      {
                        if (v779 < 0xB
                          || v784 != 57
                          || v783 != 57
                          || v778[7] != 45
                          || v778[10] != 45
                          || v778[11] != 57
                          || v778[12] != 57
                          || v778[13] != 45
                          || v778[14] != 57
                          || (int v780 = 1000000, v778[15] != 57))
                        {
                          int v780 = 10000 * v782
                               + 100000 * v781
                               + 1000 * v783
                               + 100 * v784
                               + 10 * v778[11]
                               + v778[12]
                               - 5333328;
                        }
                      }
                    }
                  }
                }
              }

              LogToFD(v71, "  %13d %#s", v757, v758, v759, v760, v761, v762, v780);
            }

            if (v770)
            {
              v785 = *(unsigned __int8 **)(v770 + 48);
              unsigned int v786 = v785[4];
              int v787 = 1000000;
              if (v786 >= 5)
              {
                int v788 = v785[5];
                int v787 = 1000000;
                if ((v788 - 48) <= 9)
                {
                  int v789 = v785[6];
                  int v787 = 1000000;
                  if ((v789 - 48) <= 9)
                  {
                    int v790 = v785[8];
                    int v787 = 1000000;
                    if ((v790 - 48) <= 9)
                    {
                      int v791 = v785[9];
                      int v787 = 1000000;
                      if ((v791 - 48) <= 9)
                      {
                        if (v786 < 0xB
                          || v791 != 57
                          || v790 != 57
                          || v785[7] != 45
                          || v785[10] != 45
                          || v785[11] != 57
                          || v785[12] != 57
                          || v785[13] != 45
                          || v785[14] != 57
                          || (int v787 = 1000000, v785[15] != 57))
                        {
                          int v787 = 10000 * v789
                               + 100000 * v788
                               + 1000 * v790
                               + 100 * v791
                               + 10 * v785[11]
                               + v785[12]
                               - 5333328;
                        }
                      }
                    }
                  }
                }
              }

              LogToFD(v71, "  %13d %#s", v757, v758, v759, v760, v761, v762, v787);
            }
          }
        }
      }

      else
      {
        LogToFD( v71,  "%p %2ld, %p,  %s %-6s %.6a %.6a %#-14a dormant for %d seconds",  v757,  v758,  v759,  v760,  v761,  v762,  kk);
      }
    }
  }

  else
  {
    LogToFD(v71, "<None>", v751, v752, v753, v754, v755, v756, v1004);
  }

  LogToFD(v71, "----------- DNS Services -----------", v757, v758, v759, v760, v761, v762, v1005);
  uint64_t DNSServiceManager = Querier_GetDNSServiceManager();
  if (DNSServiceManager)
  {
    v1030[0] = _NSConcreteStackBlock;
    v1030[1] = 0x40000000LL;
    v1030[2] = __dump_state_to_fd_block_invoke;
    v1030[3] = &__block_descriptor_tmp_5057;
    int v1031 = v71;
    mdns_dns_service_manager_enumerate(DNSServiceManager, (uint64_t)v1030);
  }

  LogToFD(v71, "v4answers %d", v793, v794, v795, v796, v797, v798, *(unsigned __int8 *)(mDNSStorage[0] + 688));
  LogToFD(v71, "v6answers %d", v799, v800, v801, v802, v803, v804, *(unsigned __int8 *)(mDNSStorage[0] + 689));
  LogToFD( v71,  "Last DNS Trigger: %d ms ago",  v805,  v806,  v807,  v808,  v809,  v810,  v1017 - *(_DWORD *)(mDNSStorage[0] + 692));
  LogToFD(v71, "--------- Mcast Resolvers ----------", v811, v812, v813, v814, v815, v816, v1006);
  v823 = (void *)qword_10015BD50;
  if (qword_10015BD50)
  {
    do
    {
      LogToFD(v71, "Mcast Resolver %##s timeout %u", v817, v818, v819, v820, v821, v822, (_DWORD)v823 + 20);
      v823 = (void *)*v823;
    }

    while (v823);
  }

  else
  {
    LogToFD(v71, "<None>", v817, v818, v819, v820, v821, v822, v1007);
  }

  LogToFD(v71, "------------ Hostnames -------------", v817, v818, v819, v820, v821, v822, v1008);
  v830 = (unsigned __int8 *)xmmword_10015C4C8;
  if ((void)xmmword_10015C4C8)
  {
    do
    {
      GetRRDisplayString_rdb(v830 + 472, (unsigned __int16 *)(*((void *)v830 + 64) + 4LL), word_100164338);
      LogToFD(v1029, "%##s v4 %d %s", v831, v832, v833, v834, v835, v836, (_DWORD)v830 + 208);
      GetRRDisplayString_rdb(v830 + 1648, (unsigned __int16 *)(*((void *)v830 + 211) + 4LL), word_100164338);
      LODWORD(v71) = v1029;
      LogToFD(v1029, "%##s v6 %d %s", v837, v838, v839, v840, v841, v842, (_DWORD)v830 + 208);
      v830 = *(unsigned __int8 **)v830;
    }

    while (v830);
  }

  else
  {
    LogToFD(v71, "<None>", v824, v825, v826, v827, v828, v829, v1009);
  }

  LogToFD(v71, "--------------- FQDN ---------------", v843, v844, v845, v846, v847, v848, v1010);
  if (byte_10015C3C8[0]) {
    LogToFD(v71, "%##s", v849, v850, v851, v852, v853, v854, (int)byte_10015C3C8);
  }
  else {
    LogToFD(v71, "<None>", v849, v850, v851, v852, v853, v854, v1011);
  }
  LogToFD(v71, "----    Unicast Assist", v855, v856, v857, v858, v859, v860, v1012);
  LogToFD(v71, "Assist Unicast: %llu", v861, v862, v863, v864, v865, v866, sUnicastAssist_UnicastCount);
  LogToFD(v71, "Assist Multicast: %llu", v867, v868, v869, v870, v871, v872, sUnicastAssist_MulticastCount);
  LogToFD(v71, "Non-assist Unicast: %llu", v873, v874, v875, v876, v877, v878, sNonUnicastAssist_UnicastCount);
  LogToFD(v71, "Non-assist Multicast: %llu", v879, v880, v881, v882, v883, v884, sNonUnicastAssist_MulticastCount);
  if ((_os_feature_enabled_impl("mDNSResponder", "unicast_assist_cache") & 1) != 0)
  {
    mDNS_TimeNow(mDNSStorage, v885, v886, v887, v888, v889, v890, v891);
    bzero(&v1036, 0x400uLL);
    uint64_t v1035 = 0LL;
    memset(v1034, 0, sizeof(v1034));
    LogToFD(v71, "----    Unicast Assist Cache    -----", v892, v893, v894, v895, v896, v897, v1013);
    LogToFD(v71, "----    Cache Records", v898, v899, v900, v901, v902, v903, v1014);
    uint64_t v910 = s_interface_head_0;
    if (s_interface_head_0)
    {
      uint64_t v71 = 0LL;
      int v911 = 0;
      uint64_t v912 = 0LL;
      uint64_t v913 = 0LL;
      do
      {
        uint64_t v1019 = v913;
        LogToFD(v1029, "ifhash %x ifid %2.2d", v904, v905, v906, v907, v908, v909, *(_DWORD *)(v910 + 32));
        v71 += 40LL;
        v1018 = (uint64_t *)v910;
        v914 = *(void **)(v910 + 8);
        if (v914)
        {
          do
          {
            uint64_t v1027 = v912;
            mDNS_snprintf(v1034);
            LOBYTE(v1036.tv_sec) = 0;
            unsigned int v915 = mDNS_snprintf(&v1036);
            v71 += 40LL;
            v1022 = v914;
            v922 = (void *)v914[1];
            if (v922)
            {
              int v923 = 0;
              unsigned int v924 = v915;
              do
              {
                if ((v923 + 1) < 6)
                {
                  ++v923;
                }

                else
                {
                  v924 += mDNS_snprintf((char *)&v1036 + v924);
                  v923 -= 4;
                }

                unsigned int v925 = mDNS_snprintf((char *)&v1036 + v924) + v924;
                uint64_t v926 = mDNS_snprintf((char *)&v1036 + v925) + v925;
                unsigned int v924 = mDNS_snprintf((char *)&v1036 + v926) + v926;
                v71 += 24LL;
                ++v911;
                v922 = (void *)*v922;
              }

              while (v922);
            }

            uint64_t v912 = v1027 + 1;
            LogToFD(v1029, "  %s", v916, v917, v918, v919, v920, v921, (int)&v1036);
            v914 = (void *)*v1022;
          }

          while (*v1022);
        }

        uint64_t v913 = v1019 + 1;
        uint64_t v910 = *v1018;
      }

      while (*v1018);
    }

    else
    {
      LODWORD(v913) = 0;
      LODWORD(v912) = 0;
      int v911 = 0;
      LODWORD(v71) = 0;
    }

    LogToFD(v1029, "----    Cache Record Stats", v904, v905, v906, v907, v908, v909, v1015);
    LogToFD(v1029, "If Hash Count: %lu", v935, v936, v937, v938, v939, v940, v913);
    LogToFD(v1029, "Addr Count:    %lu", v941, v942, v943, v944, v945, v946, v912);
    LogToFD(v1029, "Qhash Count:   %lu", v947, v948, v949, v950, v951, v952, v911);
    int v1016 = v71;
    LODWORD(v71) = v1029;
    v933 = "Total Size:    %lu bytes";
    int v934 = v1029;
  }

  else
  {
    LogToFD(v71, "----    Unicast Assist Cache    -----", v886, v887, v888, v889, v890, v891, v1013);
    v933 = "Feature Flag: mDNSResponder/unicast_assist_cache DISABLED";
    int v934 = v71;
  }

  LogToFD(v934, v933, v927, v928, v929, v930, v931, v932, v1016);
  LogToFD(v71, "Date: %s", v953, v954, v955, v956, v957, v958, (int)v1033);
  v959 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v1036.tv_sec) = 136446210;
      *(__darwin_time_t *)((char *)&v1036.tv_sec + 4) = (__darwin_time_t)v1033;
      goto LABEL_266;
    }
  }

  else
  {
    v959 = (os_log_s *)mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v1036.tv_sec) = 136446210;
      *(__darwin_time_t *)((char *)&v1036.tv_sec + 4) = (__darwin_time_t)v1033;
LABEL_266:
      _os_log_impl( (void *)&_mh_execute_header,  v959,  OS_LOG_TYPE_DEFAULT,  "---- END STATE LOG ---- (%{public}s)",  (uint8_t *)&v1036,  0xCu);
    }
  }

  return LogToFD( v71,  "----  END STATE LOG  ---- %s %s %d",  v960,  v961,  v962,  v963,  v964,  v965,  (int)"mDNSResponder mDNSResponder-2559.60.39.0.1 (Nov 10 2024 02:11:03)");
}

uint64_t __dump_state_to_fd_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)(a2 + 16);
  while (1)
  {
    uint64_t v9 = (void *)*v9;
    if (!v9) {
      break;
    }
    uint64_t v10 = (uint64_t (*)(uint64_t, void, void))v9[3];
    if (v10)
    {
      uint64_t v11 = (void *)v10(a2, 0LL, 0LL);
      goto LABEL_6;
    }
  }

  uint64_t v11 = 0LL;
LABEL_6:
  uint64_t v12 = "<missing description>";
  if (v11) {
    LODWORD(v12) = (_DWORD)v11;
  }
  LogToFD(*(_DWORD *)(a1 + 32), "%s", a3, a4, a5, a6, a7, a8, (int)v12);
  if (v11) {
    free(v11);
  }
  return 1LL;
}

void UpdateDebugState( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v41 = 0;
  int valuePtr = 1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v15 = Mutable;
    CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    if (v16)
    {
      CFNumberRef v22 = v16;
      CFNumberRef v23 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v41);
      if (v23)
      {
        CFNumberRef v29 = v23;
        if (mDNS_LoggingEnabled) {
          CFNumberRef v30 = v22;
        }
        else {
          CFNumberRef v30 = v23;
        }
        CFDictionarySetValue(v15, @"VerboseLogging", v30);
        if (mDNS_PacketLoggingEnabled) {
          CFNumberRef v31 = v22;
        }
        else {
          CFNumberRef v31 = v29;
        }
        CFDictionarySetValue(v15, @"PacketLogging", v31);
        if (mDNS_McastLoggingEnabled) {
          CFNumberRef v32 = v22;
        }
        else {
          CFNumberRef v32 = v29;
        }
        CFDictionarySetValue(v15, @"McastLogging", v32);
        if (mDNS_McastTracingEnabled) {
          CFNumberRef v33 = v22;
        }
        else {
          CFNumberRef v33 = v29;
        }
        CFDictionarySetValue(v15, @"McastTracing", v33);
        CFRelease(v22);
        CFRelease(v29);
        mDNSDynamicStoreSetConfig(6, 0LL, v15, v34, v35, v36, v37, v38, v40);
        uint64_t v39 = v15;
      }

      else
      {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "UpdateDebugState: Could not create CFNumber zero",  v24,  v25,  v26,  v27,  v28,  v40);
        uint64_t v39 = v22;
      }

      CFRelease(v39);
    }

    else
    {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "UpdateDebugState: Could not create CFNumber one",  v17,  v18,  v19,  v20,  v21,  v40);
    }
  }

  else
  {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "UpdateDebugState: Could not create dict",  v10,  v11,  v12,  v13,  v14,  a9);
  }

BOOL PreferencesGetValueBool(const __CFString *a1, BOOL a2)
{
  uint64_t v3 = (const __CFBoolean *)CFPreferencesCopyAppValue(a1, @"com.apple.mDNSResponder");
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID()) {
      a2 = CFBooleanGetValue(v4) != 0;
    }
    CFRelease(v4);
  }

  return a2;
}

uint64_t PreferencesGetValueInt(const __CFString *a1, uint64_t a2)
{
  uint64_t v3 = (const __CFNumber *)CFPreferencesCopyAppValue(a1, @"com.apple.mDNSResponder");
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int valuePtr = 0;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v4, kCFNumberIntType, &valuePtr)) {
        a2 = valuePtr;
      }
      else {
        a2 = a2;
      }
    }

    CFRelease(v4);
  }

  return a2;
}

void HandleSIG(mach_msg_id_t a1)
{
  mach_msg_return_t v2;
  mach_msg_header_t msg;
  msg.msgh_remote_uint64_t port = signal_port;
  msg.msgh_local_uint64_t port = 0;
  *(void *)&msg.msgh_bits = 0x1800000014LL;
  msg.msgh_voucher_uint64_t port = 0;
  msg.msgh_id = a1;
  uint64_t v2 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
  if (v2)
  {
    if (v2 == 268435460) {
      mach_msg_destroy(&msg);
    }
    if (a1 == 15 || a1 == 2) {
      exit(-1);
    }
  }

void SignalCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  int v11 = *(_DWORD *)(a2 + 20);
  switch(v11)
  {
    case 15:
      goto LABEL_12;
    case 16:
    case 17:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      goto LABEL_19;
    case 18:
      mDNS_McastTracingEnabled = 0;
      mDNS_McastLoggingEnabled = 0;
      mDNS_PacketLoggingEnabled = 0;
      mDNS_LoggingEnabled = 0;
      uint64_t v12 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        LOWORD(v82) = 0;
        uint64_t v21 = "All mDNSResponder Debug Logging/Tracing Disabled (USR1/USR2/PROF)";
      }

      else
      {
        uint64_t v12 = mDNSLogCategory_Default_redacted;
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        LOWORD(v82) = 0;
        uint64_t v21 = "All mDNSResponder Debug Logging/Tracing Disabled (USR1/USR2/PROF)";
      }

      uint64_t v56 = (os_log_s *)v12;
      uint32_t v57 = 2;
      goto LABEL_133;
    case 27:
      int v28 = mDNS_McastLoggingEnabled;
      mDNS_McastLoggingEnabled = mDNS_McastLoggingEnabled == 0;
      CFNumberRef v29 = (os_log_s *)mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_81;
        }
        __int16 v58 = "Disabled";
        if (!v28) {
          __int16 v58 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v58;
      }

      else
      {
        CFNumberRef v29 = (os_log_s *)mDNSLogCategory_Default_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_81;
        }
        uint64_t v35 = "Disabled";
        if (!v28) {
          uint64_t v35 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v35;
      }

      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "SIGPROF: Multicast Logging %{public}s",  (uint8_t *)&v82,  0xCu);
LABEL_81:
      LogMcastStateInfo(0, 1LL, 1LL, v30, v31, v32, v33, v34, v82);
      if (mDNS_McastLoggingEnabled) {
        int v59 = mDNS_PacketLoggingEnabled;
      }
      else {
        int v59 = 0;
      }
      mDNS_McastTracingEnabled = v59;
      uint64_t v60 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        uint64_t v77 = "Disabled";
        if (v59) {
          uint64_t v77 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v77;
        uint64_t v21 = "SIGPROF: Multicast Tracing is %{public}s";
      }

      else
      {
        uint64_t v60 = mDNSLogCategory_Default_redacted;
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        uint64_t v61 = "Disabled";
        if (v59) {
          uint64_t v61 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v61;
        uint64_t v21 = "SIGPROF: Multicast Tracing is %{public}s";
      }

      goto LABEL_132;
    case 28:
      uint64_t v36 = (os_log_s *)mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_93;
        }
        LOWORD(v82) = 0;
        goto LABEL_92;
      }

      uint64_t v36 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v82) = 0;
LABEL_92:
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "SIGWINCH: Purge unicast assist cache",  (uint8_t *)&v82,  2u);
      }

LABEL_111:
      if (mDNS_McastLoggingEnabled) {
        int v75 = mDNS_PacketLoggingEnabled;
      }
      else {
        int v75 = 0;
      }
      mDNS_McastTracingEnabled = v75;
      uint64_t v60 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        uint64_t v78 = "Disabled";
        if (v75) {
          uint64_t v78 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v78;
        uint64_t v21 = "SIGUSR2: Multicast Tracing is %{public}s";
      }

      else
      {
        uint64_t v60 = mDNSLogCategory_Default_redacted;
        BOOL v13 = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT);
        if (!v13) {
          goto LABEL_134;
        }
        uint64_t v76 = "Disabled";
        if (v75) {
          uint64_t v76 = "Enabled";
        }
        int v82 = 136446210;
        uint64_t v83 = (char *)v76;
        uint64_t v21 = "SIGUSR2: Multicast Tracing is %{public}s";
      }

void mDNSPreferencesSetNames(int a1, __int128 *a2, __int128 *a3)
{
  uint64_t v6 = mDNSStorage[0];
  if (a1 == 1) {
    uint64_t v7 = 364LL;
  }
  else {
    uint64_t v7 = 236LL;
  }
  if (a1 == 1) {
    uint64_t v8 = (_OWORD *)(mDNSStorage[0] + 364);
  }
  else {
    uint64_t v8 = (_OWORD *)(mDNSStorage[0] + 236);
  }
  if (a1 == 1) {
    uint64_t v9 = 428LL;
  }
  else {
    uint64_t v9 = 300LL;
  }
  if (a1 == 1) {
    uint64_t v10 = (_OWORD *)(mDNSStorage[0] + 428);
  }
  else {
    uint64_t v10 = (_OWORD *)(mDNSStorage[0] + 300);
  }
  if (a2 && a3)
  {
    size_t v11 = *(unsigned __int8 *)a2;
    if ((_DWORD)v11 == *(unsigned __int8 *)a3)
    {
      __s1 = (char *)a3 + 1;
      if (!memcmp((char *)a2 + 1, (char *)a3 + 1, v11)
        && (_DWORD)v11 == *(unsigned __int8 *)(v6 + v7)
        && !memcmp((char *)a2 + 1, (char *)v8 + 1, v11)
        && (_DWORD)v11 == *(unsigned __int8 *)(v6 + v9)
        && !memcmp(__s1, (char *)v10 + 1, v11))
      {
        return;
      }
    }
  }

  else if (!a2)
  {
    *(_BYTE *)(mDNSStorage[0] + v7) = 0;
    if (a3) {
      goto LABEL_24;
    }
    goto LABEL_26;
  }

  __int128 v12 = *a2;
  __int128 v13 = a2[1];
  __int128 v14 = a2[3];
  v8[2] = a2[2];
  v8[3] = v14;
  *uint64_t v8 = v12;
  v8[1] = v13;
  if (a3)
  {
LABEL_24:
    __int128 v15 = *a3;
    __int128 v16 = a3[1];
    __int128 v17 = a3[3];
    v10[2] = a3[2];
    v10[3] = v17;
    *uint64_t v10 = v15;
    v10[1] = v16;
    goto LABEL_27;
  }

void SetLowWater(uint64_t a1, int a2)
{
  int v21 = a2;
  int v3 = *(_DWORD *)(a1 + 16);
  if ((v3 & 0x80000000) == 0 && setsockopt(v3, 0xFFFF, 4100, &v21, 4u) < 0)
  {
    uint64_t v4 = (os_log_s *)mDNSLogCategory_Default;
    int v5 = *(_DWORD *)(a1 + 16);
    __error();
    uint64_t v6 = __error();
    strerror(*v6);
    LogMsgWithLevel(v4, OS_LOG_TYPE_DEFAULT, "SO_RCVLOWAT IPv4 %d error %d errno %d (%s)", v7, v8, v9, v10, v11, v5);
  }

  int v12 = *(_DWORD *)(a1 + 48);
  if ((v12 & 0x80000000) == 0 && setsockopt(v12, 0xFFFF, 4100, &v21, 4u) < 0)
  {
    __int128 v13 = (os_log_s *)mDNSLogCategory_Default;
    int v14 = *(_DWORD *)(a1 + 48);
    __error();
    __int128 v15 = __error();
    strerror(*v15);
    LogMsgWithLevel( v13,  OS_LOG_TYPE_DEFAULT,  "SO_RCVLOWAT IPv6 %d error %d errno %d (%s)",  v16,  v17,  v18,  v19,  v20,  v14);
  }

uint64_t kqUDSEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 40))(a1, *(void *)(a3 + 48));
}

uint64_t SendDict_ToServer(void *a1)
{
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  uint64_t v24 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  int v20 = -3;
  HelperLog((int)"SendDict_ToServer Sending msg to Daemon", a1);
  mach_service = xpc_connection_create_mach_service( "com.apple.mDNSResponder_Helper",  (dispatch_queue_t)HelperQueue,  2uLL);
  if (mach_service)
  {
    int v3 = mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_5277);
    xpc_connection_activate(v3);
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    if (v4)
    {
      int v5 = v4;
      dispatch_retain(v4);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = __SendDict_ToServer_block_invoke;
      handler[3] = &unk_10013D8E8;
      handler[4] = &v17;
      void handler[5] = &v21;
      handler[6] = v5;
      xpc_connection_send_message_with_reply(v3, a1, (dispatch_queue_t)HelperQueue, handler);
      dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
      if (dispatch_semaphore_wait(v5, v6))
      {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SendDict_ToServer: UNEXPECTED WAIT_TIME in dispatch_semaphore_wait",  v7,  v8,  v9,  v10,  v11,  v15);
        xpc_connection_cancel(v3);
        dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      }

      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SendDict_ToServer returning with errorcode[%d]",  v7,  v8,  v9,  v10,  v11,  *((_DWORD *)v18 + 6));
      }
      xpc_connection_cancel(v3);
      xpc_release(v3);
      dispatch_release(v5);
    }

    else
    {
      xpc_connection_cancel(v3);
      xpc_release(v3);
    }
  }

  int v12 = (void *)v22[3];
  if (v12)
  {
    xpc_release(v12);
    v22[3] = 0LL;
  }

  uint64_t v13 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v13;
}

void HelperLog(int a1, xpc_object_t object)
{
  uint64_t v8 = xpc_copy_description(object);
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "HelperLog %s: %s",  v3,  v4,  v5,  v6,  v7,  a1);
  }
  if (v8) {
    free(v8);
  }
}

char *_mdns_obj_copy_description(void *a1)
{
  uint64_t v2 = 0LL;
  asprintf(&v2, "<%s: %p>", *(const char **)(a1[2] + 8LL), a1);
  return v2;
}

const char *_mdns_obj_copy_description_as_cfstring(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  do
  {
    uint64_t v1 = (void *)*v1;
    if (!v1) {
      return 0LL;
    }
    uint64_t v2 = (uint64_t (*)(void))v1[3];
  }

  while (!v2);
  BOOL result = (const char *)v2();
  if (result)
  {
    uint64_t v4 = (char *)result;
    BOOL result = (const char *)CFStringCreateWithCStringNoCopy(0LL, result, 0x8000100u, kCFAllocatorMalloc);
    if (!result)
    {
      free(v4);
      return 0LL;
    }
  }

  return result;
}

void _dnssec_obj_rr_rrsig_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(void *)(a1 + 80) = 0LL;
  }

char *_dnssec_obj_rr_rrsig_copy_rdata_rfc_description(uint64_t a1, int *a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  time_t v36 = bswap32(*(_DWORD *)(v4 + 12));
  time_t v35 = bswap32(*(_DWORD *)(v4 + 8));
  memset(&v34, 0, sizeof(v34));
  gmtime_r(&v36, &v34);
  strftime(v39, 0xFuLL, "%Y%m%d%H%M%S", &v34);
  gmtime_r(&v35, &v34);
  strftime(v38, 0xFuLL, "%Y%m%d%H%M%S", &v34);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = v37;
  bzero(v37, 0x3F1uLL);
  uint64_t v7 = *(_BYTE **)(v5 + 16);
  LODWORD(v_Block_object_dispose((const void *)(v1 - 176), 8) = *v7;
  if (*v7)
  {
    uint64_t v9 = &v7[*(void *)(v5 + 24)];
    uint64_t v6 = v37;
    uint64_t v10 = *(_BYTE **)(v5 + 16);
    do
    {
      if (v8 > 0x3F || (uint64_t v11 = &v10[v8 + 1], v11 - v7 > 255))
      {
        uint64_t v24 = 0LL;
        int v27 = -6742;
        goto LABEL_132;
      }

      if (v11 >= v9)
      {
        uint64_t v24 = 0LL;
        int v27 = -6750;
        goto LABEL_132;
      }

      int v12 = v10 + 1;
      if (v12 < v11)
      {
        uint64_t v8 = v8;
        do
        {
          int v13 = *v12;
          unsigned int v14 = v13 - 32;
          if ((v13 - 32) > 0x5E)
          {
            char *v6 = 92;
            v6[1] = (*v12 / 0x64u) | 0x30;
            v6[2] = (*v12 / 0xAu - 10 * ((unsigned __int16)(26 * (*v12 / 0xAu)) >> 8)) | 0x30;
            v6[3] = (*v12 % 0xAu) | 0x30;
            v6 += 4;
          }

          else
          {
            BOOL v15 = v14 > 0x3C;
            uint64_t v16 = (1LL << v14) & 0x1000000000004001LL;
            if (!v15 && v16 != 0) {
              *v6++ = 92;
            }
            *v6++ = v13;
          }

          ++v12;
          --v8;
        }

        while (v8);
      }

      *v6++ = 46;
      LODWORD(v_Block_object_dispose((const void *)(v1 - 176), 8) = *v11;
      uint64_t v10 = v11;
    }

    while (*v11);
    if (v11 != v7) {
      goto LABEL_20;
    }
  }

  *v6++ = 46;
LABEL_20:
  char *v6 = 0;
  uint64_t v18 = *(unsigned __int16 **)(a1 + 24);
  unsigned int v19 = *((unsigned __int8 *)v18 + 18);
  int v20 = v18 + 9;
  if (*((_BYTE *)v18 + 18))
  {
    int v20 = v18 + 9;
    do
    {
      uint64_t v21 = (char *)v20 + v19;
      unsigned int v22 = v21[1];
      int v20 = (unsigned __int16 *)(v21 + 1);
      unsigned int v19 = v22;
    }

    while (v22);
  }

  unint64_t v23 = (unsigned __int16)(~((_WORD)v20 - ((_WORD)v18 + 18)) + *(_WORD *)(a1 + 36) - 18);
  uint64_t v24 = (char *)(4 * (((v23 + 2) * (unsigned __int128)0x5555555555555556uLL) >> 64));
  int v25 = __rev16(*v18);
  if (v25 > 248)
  {
    if (v25 >= 0x8000)
    {
      switch(v25)
      {
        case 0x8000:
          int v26 = "TA";
          break;
        case 0x8001:
          int v26 = "DLV";
          break;
        case 0xFFFF:
          int v26 = "Reserved";
          break;
        default:
LABEL_120:
          int v26 = 0LL;
          break;
      }
    }

    else
    {
      switch(v25)
      {
        case 249:
          int v26 = "TKEY";
          break;
        case 250:
          int v26 = "TSIG";
          break;
        case 251:
          int v26 = "IXFR";
          break;
        case 252:
          int v26 = "AXFR";
          break;
        case 253:
          int v26 = "MAILB";
          break;
        case 254:
          int v26 = "MAILA";
          break;
        case 255:
          int v26 = "ANY";
          break;
        case 256:
          int v26 = "URI";
          break;
        case 257:
          int v26 = "CAA";
          break;
        case 258:
          int v26 = "AVC";
          break;
        case 259:
          int v26 = "DOA";
          break;
        case 260:
          int v26 = "AMTRELAY";
          break;
        default:
          goto LABEL_120;
      }
    }
  }

  else
  {
    int v26 = "A";
    switch(v25)
    {
      case 1:
        break;
      case 2:
        int v26 = "NS";
        break;
      case 3:
        int v26 = "MD";
        break;
      case 4:
        int v26 = "MF";
        break;
      case 5:
        int v26 = "CNAME";
        break;
      case 6:
        int v26 = "SOA";
        break;
      case 7:
        int v26 = "MB";
        break;
      case 8:
        int v26 = "MG";
        break;
      case 9:
        int v26 = "MR";
        break;
      case 10:
        int v26 = "NULL";
        break;
      case 11:
        int v26 = "WKS";
        break;
      case 12:
        int v26 = "PTR";
        break;
      case 13:
        int v26 = "HINFO";
        break;
      case 14:
        int v26 = "MINFO";
        break;
      case 15:
        int v26 = "MX";
        break;
      case 16:
        int v26 = "TXT";
        break;
      case 17:
        int v26 = "RP";
        break;
      case 18:
        int v26 = "AFSDB";
        break;
      case 19:
        int v26 = "X25";
        break;
      case 20:
        int v26 = "ISDN";
        break;
      case 21:
        int v26 = "RT";
        break;
      case 22:
        int v26 = "NSAP";
        break;
      case 23:
        int v26 = "NSAP-PTR";
        break;
      case 24:
        int v26 = "SIG";
        break;
      case 25:
        int v26 = "KEY";
        break;
      case 26:
        int v26 = "PX";
        break;
      case 27:
        int v26 = "GPOS";
        break;
      case 28:
        int v26 = "AAAA";
        break;
      case 29:
        int v26 = "LOC";
        break;
      case 30:
        int v26 = "NXT";
        break;
      case 31:
        int v26 = "EID";
        break;
      case 32:
        int v26 = "NIMLOC";
        break;
      case 33:
        int v26 = "SRV";
        break;
      case 34:
        int v26 = "ATMA";
        break;
      case 35:
        int v26 = "NAPTR";
        break;
      case 36:
        int v26 = "KX";
        break;
      case 37:
        int v26 = "CERT";
        break;
      case 38:
        int v26 = "A6";
        break;
      case 39:
        int v26 = "DNAME";
        break;
      case 40:
        int v26 = "SINK";
        break;
      case 41:
        int v26 = "OPT";
        break;
      case 42:
        int v26 = "APL";
        break;
      case 43:
        int v26 = "DS";
        break;
      case 44:
        int v26 = "SSHFP";
        break;
      case 45:
        int v26 = "IPSECKEY";
        break;
      case 46:
        int v26 = "RRSIG";
        break;
      case 47:
        int v26 = "NSEC";
        break;
      case 48:
        int v26 = "DNSKEY";
        break;
      case 49:
        int v26 = "DHCID";
        break;
      case 50:
        int v26 = "NSEC3";
        break;
      case 51:
        int v26 = "NSEC3PARAM";
        break;
      case 52:
        int v26 = "TLSA";
        break;
      case 53:
        int v26 = "SMIMEA";
        break;
      case 55:
        int v26 = "HIP";
        break;
      case 56:
        int v26 = "NINFO";
        break;
      case 57:
        int v26 = "RKEY";
        break;
      case 58:
        int v26 = "TALINK";
        break;
      case 59:
        int v26 = "CDS";
        break;
      case 60:
        int v26 = "CDNSKEY";
        break;
      case 61:
        int v26 = "OPENPGPKEY";
        break;
      case 62:
        int v26 = "CSYNC";
        break;
      case 63:
        int v26 = "ZONEMD";
        break;
      case 64:
        int v26 = "SVCB";
        break;
      case 65:
        int v26 = "HTTPS";
        break;
      case 99:
        int v26 = "SPF";
        break;
      case 100:
        int v26 = "UINFO";
        break;
      case 101:
        int v26 = "UID";
        break;
      case 102:
        int v26 = "GID";
        break;
      case 103:
        int v26 = "UNSPEC";
        break;
      case 104:
        int v26 = "NID";
        break;
      case 105:
        int v26 = "L32";
        break;
      case 106:
        int v26 = "L64";
        break;
      case 107:
        int v26 = "LP";
        break;
      case 108:
        int v26 = "EUI48";
        break;
      case 109:
        int v26 = "EUI64";
        break;
      default:
        goto LABEL_120;
    }
  }

  size_t v28 = ((unint64_t)v24 | 1)
      + snprintf( 0LL,  0LL,  "%s %u %u %u %s %s %u %s ",  v26,  *((unsigned __int8 *)v18 + 2),  *((unsigned __int8 *)v18 + 3),  bswap32(*((_DWORD *)v18 + 1)),  v39,  v38,  __rev16(v18[8]),  v37);
  if (v28 && (uint64_t v29 = (char *)calloc(1uLL, v28)) != 0LL)
  {
    uint64_t v24 = v29;
    int v30 = snprintf( v29,  v28,  "%s %u %u %u %s %s %u %s ",  v26,  *(unsigned __int8 *)(*(void *)(a1 + 24) + 2LL),  *(unsigned __int8 *)(*(void *)(a1 + 24) + 3LL),  bswap32(*(_DWORD *)(*(void *)(a1 + 24) + 4LL)),  v39,  v38,  __rev16(*(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL)),  v37);
    if (v30 >= 1)
    {
      base_x_encode(0, (unsigned __int8 *)v20 + 1, v23, &v24[v30]);
      char v31 = 0;
      int v27 = 0;
      if (!a2) {
        goto LABEL_126;
      }
      goto LABEL_125;
    }
  }

  else
  {
    __break(1u);
  }

  int v27 = -6700;
LABEL_132:
  char v31 = 1;
  if (a2) {
LABEL_125:
  }
    *a2 = v27;
LABEL_126:
  char v32 = v31 ^ 1;
  if (!v24) {
    char v32 = 1;
  }
  if ((v32 & 1) == 0)
  {
    free(v24);
    return 0LL;
  }

  return v24;
}

uint64_t dnssec_obj_rr_rrsig_create(unsigned __int8 *a1, const void *a2, unsigned int a3, int a4, int *a5)
{
  int v17 = 0;
  if (rdata_parser_rrsig_check_validity((uint64_t)a2, a3))
  {
    uint64_t v11 = calloc(1uLL, 0x58uLL);
    if (v11)
    {
      uint64_t v5 = (uint64_t)v11;
      int v13 = &_dnssec_obj_rr_rrsig_kind;
      v11[1] = &_dnssec_obj_rr_rrsig_kind;
      do
      {
        unsigned int v14 = (void (*)(uint64_t))v13[2];
        if (v14) {
          v14(v5);
        }
        int v13 = (_UNKNOWN **)*v13;
      }

      while (v13);
      ++*(_DWORD *)v5;
      dnssec_obj_rr_init_fields( v5,  a1,  46,  1,  a2,  a3,  a4,  (uint64_t)_dnssec_obj_rr_rrsig_copy_rdata_rfc_description,  &v17);
      *(void *)(v5 + 80) = dnssec_obj_domain_name_create_with_labels( (unsigned __int8 *)(*(void *)(v5 + 24) + 18LL),  0,  &v17);
      int v12 = v17;
      if (!v17)
      {
        BOOL v15 = 0LL;
        int v17 = 0;
        goto LABEL_9;
      }
    }

    else
    {
      __break(1u);
    }

    BOOL v15 = (void *)v5;
    uint64_t v5 = 0LL;
  }

  else
  {
    BOOL v15 = 0LL;
    uint64_t v5 = 0LL;
    int v12 = -6705;
    int v17 = -6705;
  }

BOOL dnssec_obj_rr_rrsig_covers_rr(uint64_t a1, uint64_t a2, int *a3)
{
  int v4 = -90005;
  uint64_t v5 = *(unsigned __int16 **)(a1 + 24);
  if (*(unsigned __int16 *)(a2 + 32) == bswap32(*v5) >> 16)
  {
    uint64_t v8 = *(void *)(a2 + 16);
    uint64_t v9 = *(_BYTE **)(v8 + 16);
    int v10 = *v9;
    if (*v9)
    {
      unint64_t v11 = 0LL;
      do
      {
        ++v11;
        int v12 = &v9[v10];
        int v13 = v12[1];
        uint64_t v9 = v12 + 1;
        int v10 = v13;
      }

      while (v13);
    }

    else
    {
      unint64_t v11 = 0LL;
    }

    if (v11 < *((unsigned __int8 *)v5 + 3))
    {
      BOOL result = 0LL;
      int v4 = -90002;
    }

    else if (ref_count_obj_compare(*(void *)(a1 + 16), *(void *)(a2 + 16), 1LL))
    {
      BOOL result = 0LL;
      int v4 = -90003;
    }

    else if (*(unsigned __int16 *)(a1 + 34) == *(unsigned __int16 *)(a2 + 34))
    {
      uint64_t v14 = *(void *)(a1 + 80);
      if (!ref_count_obj_compare(v8, v14, 1LL)
        || (BOOL result = dnssec_obj_domain_name_is_sub_domain_of( *(unsigned __int8 **)(v8 + 16),  *(unsigned __int8 **)(v14 + 16))))
      {
        int v4 = 0;
        BOOL result = 1LL;
      }
    }

    else
    {
      BOOL result = 0LL;
      int v4 = -90004;
    }
  }

  else
  {
    BOOL result = 0LL;
    int v4 = -90001;
  }

  if (a3) {
    *a3 = v4;
  }
  return result;
}

uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, void *a5)
{
  if (__dst) {
    uint64_t v6 = __dst + 256;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = 4294960586LL;
  unint64_t v8 = a1 + a2;
  int v10 = __dst;
  unsigned int v11 = *__src;
  if (*__src)
  {
    int v12 = 0LL;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0) {
          return 4294960554LL;
        }
        if (!v12)
        {
          int v12 = __src + 2;
          if (!v10) {
            goto LABEL_23;
          }
        }

        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        unsigned int v11 = *__src;
        if (v11 > 0xBF) {
          return 4294960554LL;
        }
      }

      else
      {
        int v13 = &__src[v11 + 1];
        if (v10)
        {
          uint64_t v14 = v11 + 1;
          if (v6 - v10 <= v14) {
            return 4294960545LL;
          }
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }

        unsigned int v11 = *v13;
        __src = v13;
      }
    }

    while (v11);
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  int v12 = 0LL;
  if (__dst) {
LABEL_22:
  }
    *int v10 = 0;
LABEL_23:
  uint64_t result = 0LL;
  if (a5)
  {
    if (v12) {
      BOOL v15 = v12;
    }
    else {
      BOOL v15 = __src + 1;
    }
    *a5 = v15;
  }

  return result;
}

uint64_t DNSMessageExtractDomainNameString( unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, void *a5)
{
  uint64_t v8 = 0LL;
  memset(__dst, 0, sizeof(__dst));
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    uint64_t result = DomainNameToString((unsigned __int8 *)__dst, 0LL, a4, 0LL);
    if (a5)
    {
      if (!(_DWORD)result) {
        *a5 = v8;
      }
    }
  }

  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  LODWORD(i) = *a1;
  if (*a1)
  {
    uint64_t v5 = a1;
    do
    {
      uint64_t v6 = &v5[i + 1];
      if (v6 - a1 > 255) {
        return 4294960554LL;
      }
      uint64_t v7 = v5 + 1;
      if (v7 < v6)
      {
        for (uint64_t i = i; i; --i)
        {
          unsigned __int8 v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u) {
                char v10 = 48;
              }
              else {
                char v10 = 49;
              }
              a3[1] = v10;
              if (v8 >= 0x64u) {
                char v11 = v8 / 0xAu - 10;
              }
              else {
                char v11 = v8 / 0xAu;
              }
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }

          else if (*v7 - 32 <= 0x3C && ((1LL << (v8 - 32)) & 0x1000000000004001LL) != 0)
          {
            *a3++ = 92;
          }

          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }

      *a3++ = 46;
      LODWORD(i) = *v6;
      uint64_t v5 = v6;
    }

    while (*v6);
    if (v6 != a1) {
      goto LABEL_30;
    }
  }

  *a3++ = 46;
  uint64_t v6 = a1;
LABEL_30:
  *a3 = 0;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t DNSMessageExtractQuestion( unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, void *a7)
{
  uint64_t v14 = 0LL;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!(_DWORD)result)
  {
    int v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546LL;
    }

    else
    {
      if (a5) {
        *a5 = bswap32(*v14) >> 16;
      }
      if (a6) {
        *a6 = bswap32(v13[1]) >> 16;
      }
      uint64_t result = 0LL;
      if (a7) {
        *a7 = v13 + 2;
      }
    }
  }

  return result;
}

uint64_t _DNSMessageExtractRecordEx( unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, size_t a11, void *a12, void *a13, void *a14)
{
  int v27 = 0LL;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v27);
  if (!(_DWORD)result)
  {
    int v20 = v27;
    uint64_t v21 = (unsigned __int16 *)(v27 + 10);
    unint64_t v22 = __rev16(*((unsigned __int16 *)v27 + 4));
    if (a1 + a2 - (unint64_t)(v27 + 10) < v22)
    {
      return 4294960546LL;
    }

    else
    {
      unint64_t v25 = 0LL;
      size_t v26 = 0LL;
      unsigned int v23 = bswap32(*(unsigned __int16 *)v27) >> 16;
      if (!a11 && !a13
        || (uint64_t result = DNSMessageExtractRData(a1, a2, v27 + 10, v22, v23, a10, a11, &v26, &v25), !(_DWORD)result))
      {
        if (a5) {
          *a5 = v23;
        }
        if (a6) {
          *a6 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        }
        if (a7) {
          *a7 = bswap32(*((_DWORD *)v20 + 1));
        }
        if (a8) {
          *a8 = v21;
        }
        if (a9) {
          *a9 = v22;
        }
        if (a12) {
          *a12 = v26;
        }
        if (a13) {
          *a13 = v25;
        }
        uint64_t result = 0LL;
        if (a14) {
          *a14 = (char *)v21 + v22;
        }
      }
    }
  }

  return result;
}

uint64_t DNSMessageExtractRData( unint64_t a1, uint64_t a2, char *__src, unint64_t a4, int a5, char *a6, size_t a7, size_t *a8, unint64_t *a9)
{
  size_t v10 = a7;
  unint64_t v12 = a4;
  uint64_t v76 = 0LL;
  memset(__srca, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  uint64_t v16 = &__src[a4];
  switch(a5)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 12:
    case 39:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        int v18 = __srca[0];
        unsigned int v19 = __srca;
        if (__srca[0])
        {
          do
          {
            int v20 = &v19[v18];
            int v21 = v20[1];
            unsigned int v19 = v20 + 1;
            int v18 = v21;
          }

          while (v21);
        }

        unint64_t v12 = v19 - __srca + 1;
        if (v12 < v10) {
          size_t v10 = v19 - __srca + 1;
        }
        unint64_t v22 = __srca;
        unsigned int v23 = a6;
        goto LABEL_9;
      }

      break;
    case 6:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
        if (!(_DWORD)result)
        {
          int v49 = v76;
          if (v16 - (_BYTE *)v76 != 20) {
            goto LABEL_77;
          }
          int v50 = __srca[0];
          uint64_t v51 = __srca;
          if (__srca[0])
          {
            do
            {
              int v52 = &v51[v50];
              int v53 = v52[1];
              uint64_t v51 = v52 + 1;
              int v50 = v53;
            }

            while (v53);
          }

          uint64_t v54 = &a6[v10];
          int64_t v55 = v51 - __srca;
          int v56 = LOBYTE(__dst[0]);
          int v57 = (char *)__dst;
          if (LOBYTE(__dst[0]))
          {
            do
            {
              __int16 v58 = &v57[v56];
              int v59 = v58[1];
              int v57 = v58 + 1;
              int v56 = v59;
            }

            while (v59);
          }

          int64_t v60 = v57 - (char *)__dst;
          unint64_t v61 = v57 - (char *)__dst + 1;
          unint64_t v12 = v55 + v61 + 21;
          if (v55 + 1 < v10) {
            size_t v10 = v55 + 1;
          }
          memcpy(a6, __srca, v10);
          __int128 v62 = &a6[v10];
          if (v54 - v62 >= v61) {
            size_t v63 = v60 + 1;
          }
          else {
            size_t v63 = v54 - v62;
          }
          memcpy(v62, __dst, v63);
          uint64_t v64 = &v62[v63];
          else {
            size_t v65 = v54 - v64;
          }
          goto LABEL_70;
        }
      }

      break;
    case 14:
    case 17:
    case 26:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
        if (!(_DWORD)result)
        {
          if (v76 != v16) {
            goto LABEL_77;
          }
          int v36 = __srca[0];
          uint64_t v37 = __srca;
          if (__srca[0])
          {
            do
            {
              char v38 = &v37[v36];
              int v39 = v38[1];
              uint64_t v37 = v38 + 1;
              int v36 = v39;
            }

            while (v39);
          }

          int v40 = &a6[v10];
          unint64_t v41 = v37 - __srca + 1;
          int v42 = LOBYTE(__dst[0]);
          CFStringRef v43 = (char *)__dst;
          if (LOBYTE(__dst[0]))
          {
            do
            {
              uint64_t v44 = &v43[v42];
              int v45 = v44[1];
              CFStringRef v43 = v44 + 1;
              int v42 = v45;
            }

            while (v45);
          }

          int64_t v46 = v43 - (char *)__dst;
          unint64_t v47 = v43 - (char *)__dst + 1;
          unint64_t v12 = v47 + v41;
          if (v41 < v10) {
            size_t v10 = v37 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          uint8_t v33 = &a6[v10];
          if (v40 - v33 >= v47) {
            size_t v34 = v46 + 1;
          }
          else {
            size_t v34 = v40 - v33;
          }
          time_t v35 = (char *)__dst;
          goto LABEL_36;
        }
      }

      break;
    case 15:
    case 18:
    case 21:
    case 36:
      if (a4 < 3) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 2, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        uint64_t v24 = &a6[v10];
        int v25 = __srca[0];
        size_t v26 = __srca;
        if (__srca[0])
        {
          do
          {
            int v27 = &v26[v25];
            int v28 = v27[1];
            size_t v26 = v27 + 1;
            int v25 = v28;
          }

          while (v28);
        }

        int64_t v29 = v26 - __srca;
        unint64_t v30 = v26 - __srca + 1;
        unint64_t v12 = v26 - __srca + 3;
        BOOL v31 = v10 >= 2;
        uint64_t v32 = 2LL;
        goto LABEL_16;
      }

      break;
    case 33:
      if (a4 < 7) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 6, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        uint64_t v24 = &a6[v10];
        int v66 = __srca[0];
        __int16 v67 = __srca;
        if (__srca[0])
        {
          do
          {
            uint64_t v68 = &v67[v66];
            int v69 = v68[1];
            __int16 v67 = v68 + 1;
            int v66 = v69;
          }

          while (v69);
        }

        int64_t v29 = v67 - __srca;
        unint64_t v30 = v67 - __srca + 1;
        unint64_t v12 = v67 - __srca + 7;
        BOOL v31 = v10 >= 6;
        uint64_t v32 = 6LL;
LABEL_16:
        if (v31) {
          size_t v10 = v32;
        }
        memcpy(a6, __src, v10);
        uint8_t v33 = &a6[v10];
        if (v24 - v33 >= v30) {
          size_t v34 = v29 + 1;
        }
        else {
          size_t v34 = v24 - v33;
        }
        time_t v35 = __srca;
LABEL_36:
        memcpy(v33, v35, v34);
        uint64_t v48 = &v33[v34];
        goto LABEL_71;
      }

      break;
    case 47:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        int v49 = v76;
        if (v76 <= v16)
        {
          uint64_t v70 = &a6[v10];
          int v71 = __srca[0];
          uint64_t v72 = __srca;
          if (__srca[0])
          {
            do
            {
              int v73 = &v72[v71];
              int v74 = v73[1];
              uint64_t v72 = v73 + 1;
              int v71 = v74;
            }

            while (v74);
          }

          unint64_t v75 = v16 - (_BYTE *)v76;
          unint64_t v12 = v72 - __srca + 1 + v16 - (_BYTE *)v76;
          if (v72 - __srca + 1 < v10) {
            size_t v10 = v72 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          uint64_t v64 = &a6[v10];
          if (v70 - v64 >= v75) {
            size_t v65 = v16 - v49;
          }
          else {
            size_t v65 = v70 - v64;
          }
LABEL_70:
          memcpy(v64, v49, v65);
          uint64_t v48 = &v64[v65];
LABEL_71:
          size_t v10 = v48 - a6;
          goto LABEL_72;
        }

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  if (a2 < 0xC) {
    return 4294960553LL;
  }
  v12[7] = v3;
  v12[8] = v4;
  unsigned int v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  unsigned __int8 v8 = (char *)(a1 + 12);
  if (v7)
  {
    unint64_t v10 = a1 + a2;
    while (1)
    {
      v12[0] = 0LL;
      uint64_t result = DNSMessageExtractDomainName(a1, a2, v8, 0LL, v12);
      if ((_DWORD)result) {
        break;
      }
      if (v10 - v12[0] <= 3) {
        return 4294960546LL;
      }
      unsigned __int8 v8 = (char *)(v12[0] + 4LL);
      if (!--v7) {
        goto LABEL_7;
      }
    }
  }

  else
  {
LABEL_7:
    uint64_t result = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, void *a3, char **a4)
{
  int v53 = 0LL;
  int v52 = 0;
  memset(__src, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  if (a2 < 0xC)
  {
LABEL_69:
    int v36 = 0LL;
    int v20 = 0LL;
    int DomainName = -6743;
    goto LABEL_58;
  }

  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    int v36 = 0LL;
    int v20 = 0LL;
    int DomainName = -6764;
    goto LABEL_58;
  }

  int v53 = (char *)(a1 + 12);
  int DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v52 + 1, &v52, &v53);
  if (DomainName) {
    goto LABEL_63;
  }
  if ((unsigned __int16)v52 != 1)
  {
    int v36 = 0LL;
    int v20 = 0LL;
    int DomainName = -6756;
    goto LABEL_58;
  }

  int v9 = __src[0];
  char v38 = a3;
  unint64_t v10 = __src;
  if (__src[0])
  {
    do
    {
      char v11 = &v10[v9];
      int v12 = v11[1];
      unint64_t v10 = v11 + 1;
      int v9 = v12;
    }

    while (v12);
  }

  int64_t v13 = v10 - __src;
  __int n = v10 - __src + 1;
  unint64_t v41 = v53;
  __memcpy_chk(__dst, __src, __n, 256LL);
  unsigned int v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    int v15 = 0;
    unsigned int v43 = -1;
LABEL_9:
    int v16 = 0;
    int v53 = v41;
    char v17 = 1;
    while (1)
    {
      uint64_t v51 = 0LL;
      LODWORD(v49) = 0;
      LOWORD(v4_Block_object_dispose((const void *)(v1 - 176), 8) = 0;
      unsigned __int16 v50 = 0;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      int DomainName = _DNSMessageExtractRecordEx( a1,  a2,  v53,  (char *)&v54,  &v48,  &v50,  &v49,  (unsigned __int16 **)&v51,  0LL,  0LL,  0LL,  0LL,  0LL,  &v53);
      if (DomainName) {
        break;
      }
      if ((unsigned __int16)v48 == 5
        && v50 == (unsigned __int16)v52
        && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
      {
        int DomainName = DNSMessageExtractDomainName(a1, a2, v51, __dst, 0LL);
        if (DomainName) {
          break;
        }
        char v17 = 0;
        unsigned int v18 = v43;
        unsigned int v43 = v18;
        if (++v16 == v14) {
          goto LABEL_22;
        }
      }

      else if (v14 == ++v16)
      {
        if ((v17 & 1) != 0) {
          goto LABEL_25;
        }
LABEL_22:
        if (++v15 != v14) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
    }

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = *v3;
    if (v3 != v2)
    {
      int v5 = *v2;
    }

    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!(_DWORD)v4) {
      return 1LL;
    }
  }

  return 0LL;
}

_BYTE *DomainNameDupEx(_BYTE *result, void *a2, size_t *a3)
{
  int v5 = result;
  int v6 = *result;
  unsigned int v7 = result;
  if (*result)
  {
    unsigned int v7 = result;
    do
    {
      unsigned __int8 v8 = &v7[v6];
      int v9 = v8[1];
      unsigned int v7 = v8 + 1;
      int v6 = v9;
    }

    while (v9);
  }

  size_t v10 = v7 - result + 1;
  if (v7 - result == -1 || (uint64_t result = malloc(v7 - result + 1)) == 0LL)
  {
    __break(1u);
  }

  else
  {
    char v11 = result;
    uint64_t result = memcpy(result, v5, v10);
    *a2 = v11;
    if (a3) {
      *a3 = v10;
    }
  }

  return result;
}

uint64_t DomainNameFromString(_BYTE *a1, char *a2)
{
  *a1 = 0;
  uint64_t v2 = *a2;
  if (*a2)
  {
    if ((_DWORD)v2 == 46)
    {
      uint64_t v2 = a2[1];
      if (!a2[1]) {
        return v2;
      }
      LODWORD(v2) = 46;
    }

    unint64_t v3 = (unint64_t)(a1 + 255);
    while (2)
    {
      else {
        uint64_t v4 = a1 + 64;
      }
      int v5 = a1 + 1;
      int v6 = a1 + 1;
      unsigned int v7 = (unsigned __int8 *)a2;
      do
      {
        a2 = (char *)(v7 + 1);
        if ((_DWORD)v2 == 92)
        {
          LODWORD(v2) = *a2;
          if (!*a2) {
            return 4294960546LL;
          }
          a2 = (char *)(v7 + 2);
          if (v2 - 48 <= 9)
          {
            int v8 = *a2;
            if ((v8 - 48) <= 9)
            {
              int v9 = v7[3];
              if ((v9 - 48) <= 9)
              {
                int v10 = 100 * v2 + 10 * (char)v8 + (char)v9;
                char v11 = (char *)(v7 + 4);
                if (v10 < 5584)
                {
                  a2 = v11;
                  LOBYTE(v2) = v10 + 48;
                }
              }
            }
          }
        }

        else if ((_DWORD)v2 == 46)
        {
          break;
        }

        if (v6 >= v4) {
          return 4294960545LL;
        }
        *v6++ = v2;
        LODWORD(v2) = *a2;
        unsigned int v7 = (unsigned __int8 *)a2;
      }

      while (*a2);
      if (v6 == v5)
      {
        return 4294960554LL;
      }

      else
      {
        *a1 = (_BYTE)v6 - (_BYTE)v5;
        _BYTE *v6 = 0;
        uint64_t v2 = *a2;
        a1 = v6;
        if (*a2) {
          continue;
        }
      }

      break;
    }
  }

  return v2;
}

const char *DNSRecordTypeValueToString(int a1)
{
  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0LL;
      }
    }

    else
    {
      switch(a1)
      {
        case 249:
          uint64_t result = "TKEY";
          break;
        case 250:
          uint64_t result = "TSIG";
          break;
        case 251:
          uint64_t result = "IXFR";
          break;
        case 252:
          uint64_t result = "AXFR";
          break;
        case 253:
          uint64_t result = "MAILB";
          break;
        case 254:
          uint64_t result = "MAILA";
          break;
        case 255:
          uint64_t result = "ANY";
          break;
        case 256:
          uint64_t result = "URI";
          break;
        case 257:
          uint64_t result = "CAA";
          break;
        case 258:
          uint64_t result = "AVC";
          break;
        case 259:
          uint64_t result = "DOA";
          break;
        case 260:
          uint64_t result = "AMTRELAY";
          break;
        default:
          return 0LL;
      }
    }
  }

  else
  {
    int v1 = a1 - 1;
    uint64_t result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NS";
        break;
      case 2:
        uint64_t result = "MD";
        break;
      case 3:
        uint64_t result = "MF";
        break;
      case 4:
        uint64_t result = "CNAME";
        break;
      case 5:
        uint64_t result = "SOA";
        break;
      case 6:
        uint64_t result = "MB";
        break;
      case 7:
        uint64_t result = "MG";
        break;
      case 8:
        uint64_t result = "MR";
        break;
      case 9:
        uint64_t result = "NULL";
        break;
      case 10:
        uint64_t result = "WKS";
        break;
      case 11:
        uint64_t result = "PTR";
        break;
      case 12:
        uint64_t result = "HINFO";
        break;
      case 13:
        uint64_t result = "MINFO";
        break;
      case 14:
        uint64_t result = "MX";
        break;
      case 15:
        uint64_t result = "TXT";
        break;
      case 16:
        uint64_t result = "RP";
        break;
      case 17:
        uint64_t result = "AFSDB";
        break;
      case 18:
        uint64_t result = "X25";
        break;
      case 19:
        uint64_t result = "ISDN";
        break;
      case 20:
        uint64_t result = "RT";
        break;
      case 21:
        uint64_t result = "NSAP";
        break;
      case 22:
        uint64_t result = "NSAP-PTR";
        break;
      case 23:
        uint64_t result = "SIG";
        break;
      case 24:
        uint64_t result = "KEY";
        break;
      case 25:
        uint64_t result = "PX";
        break;
      case 26:
        uint64_t result = "GPOS";
        break;
      case 27:
        uint64_t result = "AAAA";
        break;
      case 28:
        uint64_t result = "LOC";
        break;
      case 29:
        uint64_t result = "NXT";
        break;
      case 30:
        uint64_t result = "EID";
        break;
      case 31:
        uint64_t result = "NIMLOC";
        break;
      case 32:
        uint64_t result = "SRV";
        break;
      case 33:
        uint64_t result = "ATMA";
        break;
      case 34:
        uint64_t result = "NAPTR";
        break;
      case 35:
        uint64_t result = "KX";
        break;
      case 36:
        uint64_t result = "CERT";
        break;
      case 37:
        uint64_t result = "A6";
        break;
      case 38:
        uint64_t result = "DNAME";
        break;
      case 39:
        uint64_t result = "SINK";
        break;
      case 40:
        uint64_t result = "OPT";
        break;
      case 41:
        uint64_t result = "APL";
        break;
      case 42:
        uint64_t result = "DS";
        break;
      case 43:
        uint64_t result = "SSHFP";
        break;
      case 44:
        uint64_t result = "IPSECKEY";
        break;
      case 45:
        uint64_t result = "RRSIG";
        break;
      case 46:
        uint64_t result = "NSEC";
        break;
      case 47:
        uint64_t result = "DNSKEY";
        break;
      case 48:
        uint64_t result = "DHCID";
        break;
      case 49:
        uint64_t result = "NSEC3";
        break;
      case 50:
        uint64_t result = "NSEC3PARAM";
        break;
      case 51:
        uint64_t result = "TLSA";
        break;
      case 52:
        uint64_t result = "SMIMEA";
        break;
      case 54:
        uint64_t result = "HIP";
        break;
      case 55:
        uint64_t result = "NINFO";
        break;
      case 56:
        uint64_t result = "RKEY";
        break;
      case 57:
        uint64_t result = "TALINK";
        break;
      case 58:
        uint64_t result = "CDS";
        break;
      case 59:
        uint64_t result = "CDNSKEY";
        break;
      case 60:
        uint64_t result = "OPENPGPKEY";
        break;
      case 61:
        uint64_t result = "CSYNC";
        break;
      case 62:
        uint64_t result = "ZONEMD";
        break;
      case 63:
        uint64_t result = "SVCB";
        break;
      case 64:
        uint64_t result = "HTTPS";
        break;
      case 98:
        uint64_t result = "SPF";
        break;
      case 99:
        uint64_t result = "UINFO";
        break;
      case 100:
        uint64_t result = "UID";
        break;
      case 101:
        uint64_t result = "GID";
        break;
      case 102:
        uint64_t result = "UNSPEC";
        break;
      case 103:
        uint64_t result = "NID";
        break;
      case 104:
        uint64_t result = "L32";
        break;
      case 105:
        uint64_t result = "L64";
        break;
      case 106:
        uint64_t result = "LP";
        break;
      case 107:
        uint64_t result = "EUI48";
        break;
      case 108:
        uint64_t result = "EUI64";
        break;
      default:
        return 0LL;
    }
  }

  return result;
}

void DNSMessageToString(char *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v113 = 0LL;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_5519);
  }
  uint64_t v116 = 0LL;
  memset(v115, 0, sizeof(v115));
  uint64_t v114 = 0LL;
  uint64_t v112 = 0LL;
  memset(v126, 0, sizeof(v126));
  bzero(v125, 0x3F1uLL);
  memset(v124, 0, 256);
  memset(v123, 0, sizeof(v123));
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_636;
  }
  _GetCUSymAddr_DataBuffer_Init_sAddr(v115, v126, 512LL, -1LL);
  if (a2 < 0xC) {
    goto LABEL_636;
  }
  unsigned int v107 = __rev16(*((unsigned __int16 *)a1 + 2));
  unsigned int v105 = __rev16(*((unsigned __int16 *)a1 + 3));
  unsigned int v104 = __rev16(*((unsigned __int16 *)a1 + 4));
  unint64_t v102 = ((unint64_t)a1[2] >> 3) & 0xF;
  unsigned int v103 = __rev16(*((unsigned __int16 *)a1 + 5));
  int v5 = "";
  if ((a3 & 0x20) != 0)
  {
LABEL_74:
    if ((a3 & 0x10) != 0) {
      goto LABEL_628;
    }
    goto LABEL_75;
  }

  unint64_t v6 = a1[3] | (a1[2] << 8);
  uint64_t v7 = __rev16(*(unsigned __int16 *)a1);
  if ((a3 & 4) != 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    int v8 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v11 = 81LL;
    if ((v6 & 0x8000u) != 0LL) {
      uint64_t v11 = 82LL;
    }
    unint64_t v99 = v6;
    uint64_t v100 = v11;
    uint64_t v98 = v7;
    int v10 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "ID:               0x%04X (%u)\n", v7, v7))
    {
      goto LABEL_636;
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    int v8 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v9 = 81LL;
    if ((v6 & 0x8000u) != 0LL) {
      uint64_t v9 = 82LL;
    }
    uint64_t v98 = v9;
    int v10 = "Flags:            0x%04X %c/";
  }

  if (v102 > 6 || (_DWORD)v102 == 3)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    int CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "OPCODE%d");
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    int CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s");
  }

  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_636;
  }
  for (uint64_t i = 0LL; i != 14; i += 2LL)
  {
    if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v6) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
        || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, ", %s", (&kDNSHeaderFlagsDescs)[i]))
      {
        goto LABEL_636;
      }
    }
  }

  if ((v6 & 0xF) > 0xB)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    uint64_t v96 = (char *)(v6 & 0xF);
    int v15 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, ", RCODE%d");
  }

  else
  {
    unsigned int v14 = (&off_10013F288)[v6 & 0xF];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_636;
    }
    uint64_t v96 = v14;
    int v15 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, ", %s");
  }

  if (v15) {
    goto LABEL_636;
  }
  if ((a3 & 4) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\n", v96, v98))
    {
      goto LABEL_636;
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "Question count:   %u\n", v107))
    {
      goto LABEL_636;
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "Answer count:     %u\n", v105))
    {
      goto LABEL_636;
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "Authority count:  %u\n", v104))
    {
      goto LABEL_636;
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
      || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "Additional count: %u\n", v103))
    {
      goto LABEL_636;
    }

    int v5 = "";
    goto LABEL_74;
  }

  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
    || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, ")", v96, v98))
  {
    goto LABEL_636;
  }

  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
    || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, ", counts: %u/%u/%u/%u", v107, v105, v104, v103))
  {
    goto LABEL_636;
  }

  int v5 = ", ";
  if ((a3 & 0x10) != 0) {
    goto LABEL_628;
  }
LABEL_75:
  int v109 = (a3 >> 3) & 1;
  uint64_t v114 = a1 + 12;
  if (!v107)
  {
    int v16 = 0LL;
    unsigned int v22 = v124;
LABEL_200:
    if (v104 + v105 + v103)
    {
      int v38 = 0;
      while (1)
      {
        __src[0] = 0LL;
        v127[0] = 0LL;
        LODWORD(v122) = 0;
        LOWORD(v121) = 0;
        LOWORD(v120) = 0;
        if (_DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v114,  v22,  &v121,  &v120,  &v122,  (unsigned __int16 **)__src,  v127,  0LL,  0LL,  0LL,  0LL,  &v114)
          || DomainNameToString((unsigned __int8 *)v22, 0LL, v125, 0LL))
        {
          goto LABEL_636;
        }

        BOOL v39 = (__int16)v120 < 0;
        if ((a3 & 1) != 0) {
          LOWORD(v120) = (unsigned __int16)v120 & 0x7FFF;
        }
        int v40 = a3 & v39;
        if ((a3 & 4) == 0) {
          break;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
          || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s", v5))
        {
          goto LABEL_636;
        }

        if (v16 && DomainNameEqual((unsigned __int8 *)v22, v16))
        {
          char v42 = v22;
          unsigned int v22 = (char *)v16;
        }

        else
        {
          if (v109 && _NameIsPrivate((const char *)v125))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v43 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~s ");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v43 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s ");
          }

          if (v43) {
            goto LABEL_636;
          }
          if (v22 == v124) {
            char v42 = (char *)v123;
          }
          else {
            char v42 = v124;
          }
          char *v42 = 0;
        }

        if ((unsigned __int16)v121 == 41)
        {
          if (v40)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
              || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "CF "))
            {
              goto LABEL_636;
            }
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
            || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "OPT %u", (unsigned __int16)v120))
          {
            goto LABEL_636;
          }

          if ((_DWORD)v122)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v44 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " 0x%08X");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v44 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " 0");
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
            || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%u", (_DWORD)v122))
          {
            goto LABEL_636;
          }

          if (v40)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
              || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CF"))
            {
              goto LABEL_636;
            }
          }

          unsigned int v45 = "ANY";
          else {
            int64_t v46 = v45;
          }
          if (v46)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v47 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v47 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CLASS%u");
          }

          if (v47) {
            goto LABEL_636;
          }
          if (DNSRecordTypeValueToString((unsigned __int16)v121))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v44 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            int v44 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u");
          }
        }

        int v5 = ", ";
        if (v44) {
          goto LABEL_636;
        }
LABEL_371:
        if ((a3 & 2) == 0) {
          DNSRecordDataToStringEx( (unsigned __int16 *)__src[0],  v127[0],  (unsigned __int16)v121,  (unint64_t)a1,  a2,  v109,  (uint64_t)&v113);
        }
        if (v113)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
            || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s", (const char *)v113))
          {
            goto LABEL_636;
          }

          if (v113)
          {
            free(v113);
            uint64_t v113 = 0LL;
          }
        }

        else
        {
          if (v109)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            unint64_t v95 = v127[0];
            int v56 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " [%zu B]");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_636;
            }
            unint64_t v97 = v127[0];
            unint64_t v99 = v127[0];
            unint64_t v95 = (unint64_t)__src[0];
            int v56 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %#H");
          }

          if (v56) {
            goto LABEL_636;
          }
        }

        if ((a3 & 4) != 0)
        {
          if ((unsigned __int16)v121 == 5)
          {
            int DomainName = DNSMessageExtractDomainName((unint64_t)a1, a2, (char *)__src[0], v42, 0LL);
            __int128 v58 = v124;
            if (v42 == v124) {
              __int128 v58 = (char *)v123;
            }
            if (!DomainName)
            {
              unsigned int v22 = v42;
              char v42 = v58;
            }

            char *v42 = 0;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
            || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\n"))
          {
            goto LABEL_636;
          }
        }

        ++v38;
        int v16 = (unsigned __int8 *)v22;
        unsigned int v22 = v42;
        if (v105 + v103 + v104 == v38) {
          goto LABEL_403;
        }
      }

      if (!v105 || v38)
      {
        if (v104 && v105 == v38)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_636;
          }
          int v41 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\nAUTHORITY SECTION\n");
        }

        else
        {
          if (!v103 || v104 + v105 != v38)
          {
LABEL_283:
            if ((unsigned __int16)v121 == 41)
            {
              if (v109 && _NameIsPrivate((const char *)v125))
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v48 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~s");
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v48 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s");
              }

              if (v48) {
                goto LABEL_636;
              }
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_636;
              }
              unsigned __int16 v50 = "";
              if (v40) {
                unsigned __int16 v50 = " CF";
              }
              if ((_DWORD)v122)
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v51 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " 0x%08X");
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v51 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " 0");
              }
            }

            else
            {
              if (v109)
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v49 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~-42s");
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v49 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%-42s");
              }

              if (v49) {
                goto LABEL_636;
              }
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_636;
              }
              int v52 = "";
              if (v40) {
                int v52 = "CF";
              }
              int v53 = "ANY";
              else {
                __int128 v54 = v53;
              }
              if (v54)
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v55 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v55 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CLASS%u");
              }

              if (v55) {
                goto LABEL_636;
              }
              if (DNSRecordTypeValueToString((unsigned __int16)v121))
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v51 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %-5s");
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                  goto LABEL_636;
                }
                int v51 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u");
              }
            }

            char v42 = v22;
            unsigned int v22 = (char *)v16;
            if (v51) {
              goto LABEL_636;
            }
            goto LABEL_371;
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_636;
          }
          int v41 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\nADDITIONAL SECTION\n");
        }
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_636;
        }
        int v41 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\nANSWER SECTION\n");
      }

      if (v41) {
        goto LABEL_636;
      }
      goto LABEL_283;
    }

LABEL_403:
    if ((_DWORD)v102 == 6)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      __int128 v59 = a1;
      __int128 v60 = v114;
      unint64_t v108 = (unint64_t)&a1[a2];
      if (v114 < &a1[a2])
      {
        if (((a3 >> 2) & 1) != 0) {
          __int128 v61 = "";
        }
        else {
          __int128 v61 = "\n\t";
        }
        if (((a3 >> 2) & 1) != 0) {
          __int128 v62 = ", ";
        }
        else {
          __int128 v62 = ",\n\t";
        }
        uint64_t v106 = v62;
        while (v60 >= v59)
        {
          int64_t v63 = __rev16(*((unsigned __int16 *)v60 + 1));
          __int128 v64 = v60 + 4;
          unsigned int v65 = *(unsigned __int16 *)v60;
          unint64_t v66 = (unint64_t)&v64[v63];
          uint64_t v114 = &v64[v63];
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
            || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s", v61))
          {
            break;
          }

          unint64_t v67 = __rev16(v65);
          __int128 v68 = "Reserved";
          switch((int)v67)
          {
            case 0:
              goto LABEL_437;
            case 1:
              __int128 v68 = "KeepAlive";
              goto LABEL_437;
            case 2:
              __int128 v68 = "Retry Delay";
              goto LABEL_437;
            case 3:
              __int128 v68 = "Encryption Padding";
LABEL_437:
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_636;
              }
              unint64_t v95 = (unint64_t)v68;
              int v69 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s: ");
LABEL_441:
              if (v69) {
                goto LABEL_636;
              }
              uint64_t v121 = 0LL;
              int v122 = (unsigned __int16 *)(v60 + 4);
              bzero(__src, 0x3F1uLL);
              switch((int)v67)
              {
                case '@':
                  int v70 = DNSMessageExtractDomainNameString( (unint64_t)a1,  a2,  v60 + 4,  (unsigned __int8 *)__src,  &v122);
                  if (v70) {
                    goto LABEL_566;
                  }
                  int v71 = v122;
                  if (v66 - (void)v122 != 4) {
                    goto LABEL_619;
                  }
                  if (v109 && _NameIsPrivate((const char *)__src))
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)__src;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~s");
                  }

                  else
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)__src;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s");
                  }

                  if (v70) {
                    goto LABEL_566;
                  }
                  unint64_t v78 = __rev16(v71[1]);
                  uint64_t v79 = "ANY";
                  if ((_DWORD)v78 != 255) {
                    uint64_t v79 = 0LL;
                  }
                  if ((_DWORD)v78 == 1) {
                    uint64_t v80 = "IN";
                  }
                  else {
                    uint64_t v80 = v79;
                  }
                  if (v80)
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)v80;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
                  }

                  else
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = v78;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CLASS%u");
                  }

                  if (v70) {
                    goto LABEL_566;
                  }
                  unint64_t v85 = __rev16(*v71);
                  uint64_t v86 = DNSRecordTypeValueToString(v85);
                  if (v86)
                  {
                    uint64_t v87 = v86;
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    {
                      unint64_t v95 = (unint64_t)v87;
                      int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
                      goto LABEL_612;
                    }
                  }

                  else
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    {
                      unint64_t v95 = v85;
                      int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u");
                      goto LABEL_612;
                    }
                  }

                  goto LABEL_619;
                case 'A':
                  break;
                case 'B':
                  if ((_DWORD)v63 != 2) {
                    goto LABEL_636;
                  }
                  unsigned int v76 = *((unsigned __int16 *)v60 + 2);
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  }
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                    goto LABEL_619;
                  }
                  int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%u", __rev16(v76));
                  goto LABEL_566;
                case 'C':
                  int v70 = DNSMessageExtractDomainNameString( (unint64_t)a1,  a2,  v60 + 4,  (unsigned __int8 *)__src,  &v122);
                  if (v70) {
                    goto LABEL_566;
                  }
                  uint64_t v77 = v122;
                  v122 += 2;
                  if (v109 && _NameIsPrivate((const char *)__src))
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)__src;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~s");
                  }

                  else
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)__src;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s");
                  }

                  if (v70) {
                    goto LABEL_566;
                  }
                  unint64_t v81 = __rev16(v77[1]);
                  int v82 = "ANY";
                  if ((_DWORD)v81 != 255) {
                    int v82 = 0LL;
                  }
                  if ((_DWORD)v81 == 1) {
                    uint64_t v83 = "IN";
                  }
                  else {
                    uint64_t v83 = v82;
                  }
                  if (v83)
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)v83;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
                  }

                  else
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = v81;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CLASS%u");
                  }

                  if (v70) {
                    goto LABEL_566;
                  }
                  unint64_t v88 = __rev16(*v77);
                  int v89 = DNSRecordTypeValueToString(v88);
                  if (v89)
                  {
                    int v90 = v89;
                    uint64_t v91 = a2;
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = (unint64_t)v90;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
                  }

                  else
                  {
                    uint64_t v91 = a2;
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    unint64_t v95 = v88;
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u");
                  }

                  if (v70) {
                    goto LABEL_566;
                  }
                  int v92 = v122;
                  unint64_t v93 = v66 - (void)v122;
                  DNSRecordDataToStringEx( v122,  v66 - (void)v122,  v88,  (unint64_t)a1,  v91,  v109,  (uint64_t)&v121);
                  if (v121)
                  {
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    }
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                      goto LABEL_619;
                    }
                    int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s", (const char *)v121);
                    if (v70) {
                      goto LABEL_566;
                    }
                    if (v121)
                    {
                      free(v121);
                      uint64_t v121 = 0LL;
                    }
                  }

                  else
                  {
                    if (v109)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      }
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                        goto LABEL_619;
                      }
                      unint64_t v95 = v93;
                      int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " [%zu B]");
                    }

                    else
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      }
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                        goto LABEL_619;
                      }
                      unint64_t v97 = v93;
                      unint64_t v99 = v93;
                      unint64_t v95 = (unint64_t)v92;
                      int v70 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " '%H'");
                    }

LABEL_621:
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_636;
      }
      if (((a3 >> 2) & 1) != 0
         ? _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "]", v95, v97, v99, v100)
         : _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\n]", v95, v97, v99, v100))
      {
        goto LABEL_636;
      }
    }

LABEL_628:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    }
    if (_GetCUSymAddr_DataBuffer_Append_sAddr && !_GetCUSymAddr_DataBuffer_Append_sAddr(v115, "", 1LL))
    {
      if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
      }
      if (_GetCUSymAddr_DataBuffer_Detach_sAddr) {
        _GetCUSymAddr_DataBuffer_Detach_sAddr(v115, a4, &v112);
      }
    }

    goto LABEL_636;
  }

  int v16 = 0LL;
  int v17 = 0;
  unsigned int v18 = v124;
  while (1)
  {
    LOWORD(__src[0]) = 0;
    LOWORD(v127[0]) = 0;
    BOOL v19 = SLOWORD(v127[0]) < 0;
    if ((a3 & 1) != 0) {
      LOWORD(v127[0]) &= ~0x8000u;
    }
    int v20 = a3 & v19;
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
        || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s", v5))
      {
        break;
      }

      if (v16 && DomainNameEqual((unsigned __int8 *)v18, v16))
      {
        unsigned int v22 = v18;
        unsigned int v18 = (char *)v16;
      }

      else
      {
        if (v109 && _NameIsPrivate((const char *)v125))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            break;
          }
          int v27 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~s ");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            break;
          }
          int v27 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s ");
        }

        if (v27) {
          break;
        }
        if (v18 == v124) {
          unsigned int v22 = (char *)v123;
        }
        else {
          unsigned int v22 = v124;
        }
        char *v22 = 0;
      }

      int v28 = "ANY";
      if (LOWORD(v127[0]) != 255) {
        int v28 = 0LL;
      }
      if (LOWORD(v127[0]) == 1) {
        int64_t v29 = "IN";
      }
      else {
        int64_t v29 = v28;
      }
      if (v29)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v30 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%s");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v30 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "CLASS%u");
      }

      if (v30) {
        break;
      }
      if ((a3 & 1) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        BOOL v31 = "QM";
        if (v20) {
          BOOL v31 = "QU";
        }
      }

      uint64_t v32 = DNSRecordTypeValueToString(LOWORD(__src[0]));
      if (v32)
      {
        uint8_t v33 = v32;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        unint64_t v95 = (unint64_t)v33;
        int v34 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s?");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        unint64_t v95 = LOWORD(__src[0]);
        int v34 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u?");
      }

      int v5 = ", ";
      if (v34) {
        break;
      }
    }

    else
    {
      if (!v17)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr
          || _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "\nQUESTION SECTION\n"))
        {
          break;
        }
      }

      if (v109 && _NameIsPrivate((const char *)v125))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v21 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%~-30s");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v21 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, "%-30s");
      }

      if (v21) {
        break;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        break;
      }
      unsigned int v23 = "QM";
      if (v20) {
        unsigned int v23 = "QU";
      }
      if ((a3 & 1) == 0) {
        unsigned int v23 = "";
      }
      unsigned int v24 = "ANY";
      if (LOWORD(v127[0]) != 255) {
        unsigned int v24 = 0LL;
      }
      if (LOWORD(v127[0]) == 1) {
        char v25 = "IN";
      }
      else {
        char v25 = v24;
      }
      if (v25)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v26 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %s");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        int v26 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " CLASS%u");
      }

      if (v26) {
        break;
      }
      __int16 v35 = DNSRecordTypeValueToString(LOWORD(__src[0]));
      if (v35)
      {
        int v36 = v35;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        unint64_t v95 = (unint64_t)v36;
        int v37 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " %-5s\n");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          break;
        }
        unint64_t v95 = LOWORD(__src[0]);
        int v37 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v115, " TYPE%u\n");
      }

      unsigned int v22 = v18;
      unsigned int v18 = (char *)v16;
      if (v37) {
        break;
      }
    }

    int v16 = (unsigned __int8 *)v18;
    ++v17;
    unsigned int v18 = v22;
    if (v107 == v17) {
      goto LABEL_200;
    }
  }

LABEL_636:
  if (v113) {
    free(v113);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
    _GetCUSymAddr_DataBuffer_Free_sAddr(v115);
  }
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result = strcasecmp(a1, ".");
  if ((_DWORD)result) {
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  }
  return result;
}

uint64_t DNSRecordDataToStringEx( unsigned __int16 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_5519);
  }
  uint64_t v85 = 0LL;
  uint64_t v86 = 0LL;
  memset(v84, 0, sizeof(v84));
  uint64_t v83 = 0LL;
  memset(v89, 0, sizeof(v89));
  bzero(v88, 0x3F1uLL);
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_424;
  }
  uint64_t v78 = a7;
  unint64_t v13 = (unint64_t)a1 + a2;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v84, v89, 256LL, -1LL);
  uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960582LL;
  if (a3 <= 32)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4) {
          goto LABEL_426;
        }
        uint64_t appended = _AppendIPv4Address((uint64_t)v84, 0LL, (unsigned int *)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
        goto LABEL_419;
      case 6:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v86, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = DomainNameToString(v86, (unint64_t)a1 + a2, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        int v73 = (unsigned int *)v86;
        if (v13 - (void)v86 != 20) {
          goto LABEL_426;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  " %u %u %u %u %u",  bswap32(*v73),  bswap32(v73[1]),  bswap32(v73[2]),  bswap32(v73[3]),  bswap32(v73[4]));
          goto LABEL_409;
        }

        goto LABEL_424;
      case 13:
      case 16:
        if (!a2) {
          goto LABEL_426;
        }
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%zu B]");
        }

        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#H");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#{txt}");
        }

        if (!(_DWORD)appended) {
          goto LABEL_410;
        }
        goto LABEL_418;
      case 15:
        unsigned int v71 = *a1;
        int v70 = (char *)(a1 + 1);
        unsigned int v69 = v71;
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, v70, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)v70, v13, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v69));
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        unint64_t v75 = " ";
        break;
      default:
        if (a3 == 25) {
          goto LABEL_229;
        }
        if (a3 != 28) {
          goto LABEL_419;
        }
        if (a2 != 16) {
          goto LABEL_426;
        }
        uint64_t appended = _AppendIPv6Address((uint64_t)v84, 0LL, (uint64_t)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
    }

    goto LABEL_408;
  }

  switch(a3)
  {
    case ')':
      int v16 = "";
      while (2)
      {
        int v17 = a1 + 2;
        unint64_t v18 = __rev16(a1[1]);
        unsigned int v19 = *a1;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s{", v16);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        unsigned int v20 = __rev16(v19);
        if (v20 == 12)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "Padding");
        }

        else if (v20 == 15)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "EDE");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "CODE%u");
        }

        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", ");
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        int v21 = (unsigned __int16 *)&v17[v18];
        if (v20 != 15 || !(_DWORD)v18)
        {
          if (a6)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%u B]");
          }

          else if (v20 == 12 && (_DWORD)v18 && !*v17 && !memcmp(a1 + 2, (char *)a1 + 5, v18 - 1))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u zero bytes>");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%H'");
          }

          goto LABEL_78;
        }

        unsigned int v22 = a1[2];
        int v23 = (unsigned __int16)((_WORD)v21 - ((_WORD)a1 + 6));
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        unsigned int v24 = __rev16(v22);
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "code: %u", v24);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        if (v23 | v24)
        {
          if (v24 <= 0x18)
          {
            char v25 = off_10013DC70[v24];
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " (%s)", v25);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
          }

          if (v23)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", extra-text: ");
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            if (a6)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_424;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "«REDACTED»");
            }

            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_424;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%.*s'");
            }

LABEL_307:
              BYTE1(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v60 >> 30) & 0x1F];
              LOBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v60 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              }
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_424;
              }
              if (v59) {
                uint64_t v68 = v59;
              }
              else {
                uint64_t v68 = 2LL;
              }
              uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, v90, v68);
              if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_419;
              }
              continue;
          }
        }

        break;
      }

      uint64_t v72 = v56;
      goto LABEL_338;
    default:
      if ((a3 - 64) < 2)
      {
        if (v13 < (unint64_t)a1)
        {
LABEL_428:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960586LL;
          goto LABEL_419;
        }

        if (a2 >= 2)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(*a1));
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            bzero(v90, 0x3F1uLL);
            uint64_t v87 = (unsigned int *)(a1 + 1);
            uint64_t appended = DomainNameToString( (unsigned __int8 *)a1 + 2,  (unint64_t)a1 + a2,  (unsigned __int8 *)v90,  &v87);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v90);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            int v26 = v87;
            while (2)
            {
              if (v13 - (unint64_t)v26 < 4)
              {
LABEL_425:
                uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960546LL;
                goto LABEL_419;
              }

              int v27 = (const char *)__rev16(*(unsigned __int16 *)v26);
              unsigned int v28 = *((unsigned __int16 *)v26 + 1);
              int64_t v29 = _DNSSVCBKeyToString((int)v27);
              if (v29)
              {
                int v30 = v29;
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  uint64_t v77 = v30;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %s=");
                  goto LABEL_108;
                }
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  uint64_t v77 = v27;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " key%u=");
LABEL_108:
                  if ((_DWORD)appended) {
                    goto LABEL_418;
                  }
                  BOOL v31 = (const char *)__rev16(v28);
                  uint64_t v32 = v26 + 1;
                  uint64_t v87 = v26 + 1;
                  if (v13 - (unint64_t)(v26 + 1) >= v31)
                  {
                    switch((int)v27)
                    {
                      case 0:
                        uint8_t v33 = (unsigned int *)&v31[(void)v32];
                        int v34 = 0LL;
                        char v35 = 1;
                        do
                        {
                          int v36 = (const char *)__rev16(*(unsigned __int16 *)v32);
                          uint64_t v87 = (unsigned int *)((char *)v32 + 2);
                          int v37 = _DNSSVCBKeyToString((int)v36);
                          if ((v35 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v34);
                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                          }

                          if (v37)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t v77 = v37;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s");
                          }

                          else
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t v77 = v36;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "key%u");
                          }

                          if ((_DWORD)appended) {
                            goto LABEL_418;
                          }
                          char v35 = 0;
                          uint64_t v32 = v87;
                          int v34 = ",";
                        }

                        while (v87 < v33);
                        goto LABEL_212;
                      case 1:
                        int v38 = (unsigned int *)&v31[(void)v32];
                        BOOL v39 = 0LL;
                        char v40 = 1;
                        while (1)
                        {
                          uint64_t v87 = (unsigned int *)((char *)v32 + 1);
                          unint64_t v41 = *(unsigned __int8 *)v32;
                          uint64_t v32 = (unsigned int *)((char *)v32 + 1);
                          if ((v40 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v39);
                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                            uint64_t v32 = v87;
                          }

                          char v42 = (unsigned int *)((char *)v32 + v41);
                          while (v32 < v42)
                          {
                            int v43 = (const char *)*(unsigned __int8 *)v32;
                            if (((_DWORD)v43 - 32) > 0x5E)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              uint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                            }

                            else if ((_DWORD)v43 == 92 || (_DWORD)v43 == 44)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              uint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                            }

                            else
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              uint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                            }

                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                            uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                            uint64_t v87 = (unsigned int *)((char *)v87 + 1);
                          }

                          char v40 = 0;
                          BOOL v39 = ",";
                          if (v32 >= v38) {
                            goto LABEL_212;
                          }
                        }

                      case 2:
                        goto LABEL_136;
                      case 3:
                        if ((_DWORD)v31 != 2) {
                          goto LABEL_426;
                        }
                        unsigned int v44 = *((unsigned __int16 *)v26 + 2);
                        uint64_t v87 = (unsigned int *)&v31[(void)v32];
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_424;
                        }
                        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v44));
                        if ((_DWORD)appended) {
                          goto LABEL_418;
                        }
                        goto LABEL_212;
                      case 4:
                        unsigned int v45 = (unsigned int *)&v31[(void)v32];
                        int64_t v46 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv4Address((uint64_t)v84, (uint64_t)v46, v32, a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_419;
                          }
                          uint64_t v32 = v87 + 1;
                          uint64_t v87 = v32;
                          if (v32 < v45)
                          {
                            int64_t v46 = ",";
                            continue;
                          }

                          goto LABEL_212;
                        }

                      case 5:
                        goto LABEL_132;
                      case 6:
                        int v47 = (unsigned int *)&v31[(void)v32];
                        int v48 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv6Address( (uint64_t)v84,  (uint64_t)v48,  (uint64_t)v32,  a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_419;
                          }
                          uint64_t v32 = v87 + 4;
                          uint64_t v87 = v32;
                          if (v32 < v47)
                          {
                            int v48 = ",";
                            continue;
                          }

                          goto LABEL_212;
                        }

                      default:
                        if ((_DWORD)v27 == 32769)
                        {
LABEL_132:
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_424;
                          }
                          uint64_t v77 = (const char *)v87;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%.4H");
                        }

                        else
                        {
LABEL_136:
                          if (!a6)
                          {
                            int v49 = (unsigned int *)&v31[(void)v32];
                            while (v32 < v49)
                            {
                              unsigned __int16 v50 = (const char *)*(unsigned __int8 *)v32;
                              if (((_DWORD)v50 - 33) > 0x5D)
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                uint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                              }

                              else if (((_DWORD)v50 - 34) > 0x3A {
                                     || ((1LL << (v50 - 34)) & 0x4000000020000C1LL) == 0)
                              }
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                uint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                              }

                              else
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                uint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                              }

                              if ((_DWORD)appended) {
                                goto LABEL_418;
                              }
                              uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                              uint64_t v87 = (unsigned int *)((char *)v87 + 1);
                            }

                            goto LABEL_212;
                          }

                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_424;
                          }
                          uint64_t v77 = v31;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u redacted bytes>");
                        }

                        if ((_DWORD)appended) {
                          goto LABEL_418;
                        }
                        uint64_t v87 = (unsigned int *)&v31[(void)v87];
LABEL_212:
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_424;
                        }
                        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "", v77);
                        if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                          goto LABEL_419;
                        }
                        int v26 = v87;
                        continue;
                    }
                  }

                  goto LABEL_425;
                }
              }

              break;
            }
          }

LABEL_424:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
          goto LABEL_419;
        }

LABEL_426:
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960554LL;
        goto LABEL_419;
      }

      if (a3 != 33) {
        goto LABEL_419;
      }
      if (a2 < 7) {
        goto LABEL_426;
      }
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 6, (unint64_t)a1 + a2, v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u ", __rev16(*a1), __rev16(a1[1]), __rev16(a1[2]));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      unint64_t v75 = 0LL;
LABEL_408:
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)v75, a6, (const char *)v88);
LABEL_409:
      uint64_t CUSymAddr_DataBuffer_Append_sAddr = CUSymAddr_DataBuffer_AppendF_sAddr;
      if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      {
LABEL_410:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
        }
        if (_GetCUSymAddr_DataBuffer_Append_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, "", 1LL);
          if ((_DWORD)appended)
          {
LABEL_418:
            uint64_t CUSymAddr_DataBuffer_Append_sAddr = appended;
            goto LABEL_419;
          }

          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v84, v78, &v83);
            goto LABEL_418;
          }
        }

        goto LABEL_424;
      }

LABEL_419:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
      }
      if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
        _GetCUSymAddr_DataBuffer_Free_sAddr(v84);
      }
      return CUSymAddr_DataBuffer_Append_sAddr;
  }

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  if (a4)
  {
    unsigned int v4 = bswap32(*a3);
    if (v4) {
      BOOL v5 = v4 == 2130706433;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
  }

  else
  {
    int v6 = 0;
  }

  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4LL, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (*(void *)a3 | *(void *)(a3 + 7)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    }
    int v5 = v4;
  }

  else
  {
    int v5 = 0;
  }

  return _AppendIPAddress(a1, a2, a3, 16LL, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }

  return 4294960561LL;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a3 - (void)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      uint64_t v5 = a2[1];
      int v6 = a2 + 2;
      uint64_t v14 = a3 - (void)(a2 + 2);
      uint64_t v15 = a2[1];
      unsigned int v7 = 0;
      unsigned int v8 = 8 * v5;
      int v9 = *a2 << 8;
      else {
        int v10 = 8 * v5;
      }
      BOOL v11 = 1;
      while (1)
      {
        if (((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)) & 1) != 0)
        {
          *(_OWORD *)__str = 0u;
          __int128 v18 = 0u;
          int v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            int v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            return 4294960561LL;
          }
          uint64_t result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if ((_DWORD)result) {
            break;
          }
        }

        BOOL v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          uint64_t v3 = a3 - (void)v6;
          goto LABEL_19;
        }
      }

      uint64_t v3 = v14;
      if (v11) {
        return result;
      }
LABEL_19:
      a2 = v6;
      if (v3 > 0) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

const char *_DNSSVCBKeyToString(int a1)
{
  uint64_t result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "alpn";
      break;
    case 2:
      uint64_t result = "no-default-alpn";
      break;
    case 3:
      uint64_t result = "port";
      break;
    case 4:
      uint64_t result = "ipv4hint";
      break;
    case 5:
      uint64_t result = "echconfig";
      break;
    case 6:
      uint64_t result = "ipv6hint";
      break;
    case 7:
      uint64_t result = "dohpath";
      break;
    default:
      BOOL v4 = "odohconfig";
      if (a1 != 32769) {
        BOOL v4 = 0LL;
      }
      if (a1 == 0x8000) {
        uint64_t result = "dohuri";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }

  return result;
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((_DWORD)a4 != 16 && (_DWORD)a4 != 4) {
    return 4294960553LL;
  }
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    }
    return 4294960561LL;
  }

  char v10 = 0;
  memset(v9, 0, sizeof(v9));
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33LL, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    }
    return 4294960561LL;
  }

  return result;
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, const char *a2)
{
  if (_NameIsPrivate(a2))
  {
  }

  else
  {
  }

  return 4294960561LL;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 16 && a3 != 4) {
    return 4294960553LL;
  }
  char v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v7, 33LL, "%.4H", a2, a3, a3);
  if ((result & 0x80000000) == 0)
  {
    return 4294960561LL;
  }

  return result;
}

char *put_hex_from_bytes(unsigned __int8 *a1, uint64_t a2, char *__str, unint64_t a4)
{
  BOOL v4 = __str;
  if (a1)
  {
    uint64_t v5 = a2;
    if (a2)
    {
      if (2 * a2 < a4)
      {
        int v6 = a1;
        unsigned int v7 = &__str[a4];
        do
        {
          int v8 = *v6++;
          v4 += snprintf(v4, v7 - v4, "%02X", v8);
          --v5;
        }

        while (v5);
      }
    }
  }

  return v4;
}

uint64_t _dnssec_obj_rr_nsec3_compare(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return 3LL;
  }
  int v6 = *(_BYTE **)(*(void *)(a2 + 16) + 16LL);
  parent = domain_name_labels_get_parent(*(_BYTE **)(*(void *)(a1 + 16) + 16LL), 1uLL);
  if (!parent)
  {
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      int v12 = (os_log_s *)mDNSLogCategory_DNSSEC;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return 2LL;
      }
    }

    else
    {
      int v12 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return 2LL;
      }
    }

    int v15 = 136447234;
    int v16 = "my_parent != NULL";
    __int16 v17 = 2082;
    __int128 v18 = "";
    __int16 v19 = 2082;
    unsigned int v20 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
    __int16 v21 = 1024;
    int v22 = 205;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
LABEL_26:
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v15,  0x30u);
    return 2LL;
  }

  int v8 = parent;
  int v9 = domain_name_labels_get_parent(v6, 1uLL);
  if (!v9)
  {
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      int v12 = (os_log_s *)mDNSLogCategory_DNSSEC;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return 2LL;
      }
    }

    else
    {
      int v12 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return 2LL;
      }
    }

    int v15 = 136447234;
    int v16 = "others_parent != NULL";
    __int16 v17 = 2082;
    __int128 v18 = "";
    __int16 v19 = 2082;
    unsigned int v20 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
    __int16 v21 = 1024;
    int v22 = 208;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
    goto LABEL_26;
  }

  return domain_name_label_canonical_compare( *(unsigned __int8 **)(*(void *)(a1 + 16) + 16LL),  *(unsigned __int8 **)(*(void *)(a2 + 16) + 16LL),  0);
}

void _dnssec_obj_rr_nsec3_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(void *)(a1 + 80) = 0LL;
  }

BOOL dnssec_obj_rr_nsec3_asserts_name_exists_data_does_not_exist( uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v6 = *(void *)(a1 + 24);
  unsigned int v7 = (unsigned __int8 *)(*(unsigned __int8 *)(v6 + 4)
                         + v6
                         + 5
  unsigned __int16 v8 = *(_WORD *)(a1 + 36)
     - (*(unsigned __int8 *)(v6 + 4)
      + 5
  if ((rdata_parser_type_bit_maps_cover_dns_type(v7, v8, a4) & 1) != 0) {
    return 0LL;
  }
  unint64_t v9 = (unint64_t)&v7[v8];
  if ((unint64_t)(v7 + 1) < v9)
  {
    int v10 = 0;
    do
    {
      uint64_t v11 = v7[1];
      unint64_t v12 = (unint64_t)&v7[v11 + 2];
      if (v12 > v9) {
        break;
      }
      if (*v7) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = (_DWORD)v11 == 0;
      }
      if (!v13) {
        v10 |= (v7[2] & 4) >> 2;
      }
      v7 += v11 + 2;
    }

    while (v12 + 1 < v9);
    if ((v10 & 1) != 0) {
      return 0LL;
    }
  }

  uint64_t nsec3_hashed_name = dnssec_obj_domain_name_get_nsec3_hashed_name(a2, a1);
  if (nsec3_hashed_name) {
    return ref_count_obj_compare(*(void *)(a1 + 16), nsec3_hashed_name, 1LL) == 0;
  }
  int v16 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_25:
      int v18 = 136447234;
      __int16 v19 = "hashed_name != NULL";
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
      __int16 v24 = 1024;
      int v25 = 316;
      __int16 v26 = 2048;
      uint64_t v27 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v18,  0x30u);
      return 0LL;
    }
  }

  else
  {
    int v16 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_25;
    }
  }

  return result;
}

uint64_t dnssec_obj_rr_nsec3_asserts_name_does_not_exist(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t nsec3_hashed_name = dnssec_obj_domain_name_get_nsec3_hashed_name(a2, a1);
  if (nsec3_hashed_name)
  {
    uint64_t v7 = nsec3_hashed_name;
    int v8 = *(unsigned __int8 *)(a1 + 88);
    int v9 = ref_count_obj_compare(v4, nsec3_hashed_name, 0LL);
    if (v8)
    {
      if (v9 == -1) {
        return 1LL;
      }
      return ref_count_obj_compare(v7, v5, 0LL) == -1;
    }

    if (v9 == -1) {
      return ref_count_obj_compare(v7, v5, 0LL) == -1;
    }
    return 0LL;
  }

  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    unint64_t v12 = (os_log_s *)mDNSLogCategory_DNSSEC;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
LABEL_18:
      int v13 = 136447234;
      uint64_t v14 = "hashed_name != NULL";
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 2082;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
      __int16 v19 = 1024;
      int v20 = 339;
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v13,  0x30u);
      return 0LL;
    }
  }

  else
  {
    unint64_t v12 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result) {
      goto LABEL_18;
    }
  }

  return result;
}

uint64_t _mdns_dso_session_init(uint64_t result)
{
  *(void *)(result + 116) = 0x36EE8000003A98LL;
  do
  {
    unint64_t v1 = __ldxr(&_mdns_dso_session_get_next_id_s_last_id);
    unint64_t v2 = v1 + 1;
  }

  while (__stxr(v2, &_mdns_dso_session_get_next_id_s_last_id));
  *(void *)(result + 40) = v2;
  return result;
}

char *_mdns_dso_session_copy_description(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 200LL);
  if (v1) {
    return (char *)v1();
  }
  uint64_t result = strdup("<This is a DSO session object.>");
  if (!result) {
    __break(1u);
  }
  return result;
}

void _mdns_dso_session_finalize(uint64_t a1)
{
  unint64_t v2 = *(dispatch_object_s **)(a1 + 48);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  }

  uint64_t v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(a1 + 56) = 0LL;
  }

  uint64_t v4 = *(const void **)(a1 + 64);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 64) = 0LL;
  }

  uint64_t v5 = *(void **)(a1 + 88);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  }

  uint64_t v6 = *(void **)(a1 + 96);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 96) = 0LL;
  }

  uint64_t v7 = *(dispatch_object_s **)(a1 + 72);
  if (v7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v7);
    *(void *)(a1 + 72) = 0LL;
  }

int32x2_t _mdns_dso_client_session_init(int32x2_t *a1)
{
  int32x2_t result = vdup_n_s32(0x3A98u);
  a1[16] = result;
  a1[26].i8[6] = 1;
  return result;
}

void _mdns_dso_client_session_finalize(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 136);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 136) = 0LL;
  }

  if (*(void *)(a1 + 144))
  {
    nw_resolver_cancel();
    uint64_t v3 = *(void **)(a1 + 144);
    if (v3)
    {
      nw_release(v3);
      *(void *)(a1 + 144) = 0LL;
    }
  }

  uint64_t v4 = *(const void **)(a1 + 152);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 152) = 0LL;
  }

  uint64_t v5 = *(const void **)(a1 + 160);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 160) = 0LL;
  }

  uint64_t v6 = *(void **)(a1 + 168);
  if (v6)
  {
    os_release(v6);
    *(void *)(a1 + 16_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 176);
  if (v7)
  {
    os_release(v7);
    *(void *)(a1 + 176) = 0LL;
  }

  int v8 = *(dispatch_object_s **)(a1 + 184);
  if (v8)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
    dispatch_release(v8);
    *(void *)(a1 + 184) = 0LL;
  }

  int v9 = *(dispatch_object_s **)(a1 + 192);
  if (v9)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v9);
    *(void *)(a1 + 192) = 0LL;
  }

  int v10 = *(const void **)(a1 + 200);
  if (v10)
  {
    _Block_release(v10);
    *(void *)(a1 + 200) = 0LL;
  }

uint64_t _mdns_dso_client_session_activate(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) < 1)
  {
    uint64_t v9 = *(void *)(a1 + 136);
    if (!v9) {
      return 4294960591LL;
    }
    uint64_t srv = nw_endpoint_create_srv(*(void *)(v9 + 40));
    if (!srv) {
      return 4294960567LL;
    }
    uint64_t v11 = (void *)srv;
    nw_parameters_t v12 = nw_parameters_create();
    if (!v12)
    {
      nw_release(v11);
      return 4294960567LL;
    }

    int v13 = v12;
    uint64_t v14 = *(unsigned int *)(a1 + 208);
    if ((_DWORD)v14)
    {
      __int16 v15 = (nw_interface *)nw_interface_create_with_index(v14);
      if (!v15) {
        goto LABEL_30;
      }
      nw_parameters_require_interface(v13, v15);
    }

    else
    {
      __int16 v15 = 0LL;
    }

    __int16 v17 = (void *)nw_resolver_create_with_endpoint(v11, v13);
    if (v17)
    {
      uint64_t v18 = (uint64_t)v17;
      nw_retain(v17);
      __int16 v24 = _NSConcreteStackBlock;
      uint64_t v25 = 0x40000000LL;
      __int16 v26 = ___mdns_dso_client_session_start_srv_resolution_block_invoke;
      uint64_t v27 = &__block_descriptor_tmp_20_5935;
      uint64_t v28 = v18;
      nw_resolver_set_cancel_handler(v18, &v24);
      if (_mdns_dso_session_queue_s_once != -1) {
        dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
      }
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000LL;
      *(void *)&uint8_t buf[16] = ___mdns_dso_client_session_start_srv_resolution_block_invoke_2;
      int v36 = &__block_descriptor_tmp_22_5936;
      uint64_t v37 = a1;
      nw_resolver_set_update_handler(v18, _mdns_dso_session_queue_s_queue, buf);
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
      }
      __int16 v19 = (os_log_s *)_mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 136);
        int v22 = *(_DWORD *)(a1 + 208);
        *(_DWORD *)int64_t v29 = 134218498;
        uint64_t v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = v21;
        __int16 v33 = 1024;
        int v34 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Start -> Start SRV resolution -- service name: %@, interface index: %u",  v29,  0x1Cu);
      }

      uint64_t v5 = 0LL;
      *(void *)(a1 + 144) = v18;
      *(_BYTE *)(a1 + 214) = 2;
LABEL_31:
      nw_release(v11);
      nw_release(v13);
      if (v15)
      {
        int v16 = v15;
LABEL_33:
        nw_release(v16);
        return v5;
      }

      return v5;
    }

uint64_t _mdns_dso_client_session_check_configuration(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) <= 0 && !*(void *)(a1 + 136)
    || !*(void *)(a1 + 200)
    || !*(_WORD *)(a1 + 212))
  {
    return 4294960578LL;
  }

  if (*(_BYTE *)(a1 + 214) == 1) {
    return 0LL;
  }
  return 4294960587LL;
}

nw_connection_t _mdns_dso_client_session_prepare_connection(void *a1, int *a2)
{
  uint64_t v4 = a1[2];
  *(void *)uint64_t v18 = _NSConcreteStackBlock;
  *(void *)&v18[8] = 0x40000000LL;
  *(void *)&v18[16] = ___mdns_dso_session_create_tls_nw_parameters_block_invoke;
  __int16 v19 = &__block_descriptor_tmp_26_5928;
  uint64_t v20 = a1;
  uint64_t v21 = v4;
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v18, _nw_parameters_configure_protocol_default_configuration);
  if (!secure_tcp)
  {
LABEL_20:
    nw_connection_t v12 = 0LL;
    int v15 = -6729;
    if (!a2) {
      return v12;
    }
    goto LABEL_17;
  }

  uint64_t v6 = secure_tcp;
  nw_parameters_set_no_wake_from_sleep(secure_tcp, 1LL);
  nw_protocol_stack_t v7 = nw_parameters_copy_default_protocol_stack(v6);
  if (!v7)
  {
    nw_release(v6);
    goto LABEL_20;
  }

  uint64_t v8 = v7;
  if (_mdns_get_dns_over_bytestream_protocol_definition_s_once != -1) {
    dispatch_once(&_mdns_get_dns_over_bytestream_protocol_definition_s_once, &__block_literal_global_6088);
  }
  if (!_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def)
  {
    options = 0LL;
    goto LABEL_23;
  }

  options = nw_framer_create_options((nw_protocol_definition_t)_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def);
  if (!options)
  {
LABEL_23:
    nw_connection_t v12 = 0LL;
    goto LABEL_24;
  }

  int v10 = nw_protocol_stack_copy_transport_protocol(v8);
  nw_tcp_options_set_maximum_segment_size(v10, 0x1C2u);
  nw_protocol_stack_prepend_application_protocol(v8, options);
  uint64_t v11 = a1[22];
  if (!v11)
  {
    nw_connection_t v12 = 0LL;
    int v15 = -6718;
    goto LABEL_14;
  }

  nw_connection_t v12 = nw_connection_create(*(nw_endpoint_t *)(v11 + 24), v6);
  if (!v12)
  {
LABEL_24:
    int v15 = -6729;
    goto LABEL_14;
  }

  maximum_segment_uint64_t size = nw_tcp_options_get_maximum_segment_size(v10);
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  uint64_t v14 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = a1[5];
    *(_DWORD *)uint64_t v18 = 134218240;
    *(void *)&v18[4] = v17;
    *(_WORD *)&v18[12] = 1024;
    *(_DWORD *)&v18[14] = maximum_segment_size;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[DSO%llu] mss is %d", v18, 0x12u);
  }

  nw_release(v10);
  int v15 = 0;
LABEL_14:
  nw_release(v6);
  nw_release(v8);
  if (options) {
    nw_release(options);
  }
  if (a2) {
LABEL_17:
  }
    *a2 = v15;
  return v12;
}

BOOL _mdns_dso_client_session_evaluate_trust(uint64_t a1, int a2, sec_trust_t trust, int *a4)
{
  CFErrorRef error = 0LL;
  if (trust)
  {
    uint64_t v6 = sec_trust_copy_ref(trust);
    if (v6)
    {
      nw_protocol_stack_t v7 = v6;
      uint64_t v8 = *(const __CFArray **)(a1 + 160);
      if (v8)
      {
        SecTrustSetNetworkFetchAllowed(v6, 0);
        SecTrustSetAnchorCertificatesOnly(v7, 1u);
        SecTrustSetAnchorCertificates(v7, v8);
        uint64_t v9 = SecTrustCopyExceptions(v7);
        if (v9) {
          SecTrustSetExceptions(v7, v9);
        }
        BOOL v10 = SecTrustEvaluateWithError(v7, &error);
        if (v10)
        {
          int Code = 0;
        }

        else if (error)
        {
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
          }
          nw_connection_t v12 = (os_log_s *)_mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            uint64_t v17 = v14;
            __int16 v18 = 2112;
            CFErrorRef v19 = error;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[DSO%llu] TLS certificate evaluation failed -- reason: %@",  buf,  0x16u);
          }

          int Code = CFErrorGetCode(error);
        }

        else
        {
          int Code = -6754;
        }

        CFRelease(v7);
        if (v9) {
          CFRelease(v9);
        }
      }

      else
      {
        CFRelease(v6);
        int Code = 0;
        BOOL v10 = 1LL;
      }

      if (error) {
        CFRelease(error);
      }
    }

    else
    {
      BOOL v10 = 0LL;
      int Code = -6729;
    }
  }

  else
  {
    BOOL v10 = 0LL;
    int Code = -6705;
  }

  if (a4) {
    *a4 = Code;
  }
  return v10;
}

uint64_t _mdns_dso_client_session_set_connection_ready(uint64_t result)
{
  *(_BYTE *)(result + 214) = 5;
  return result;
}

uint64_t _mdns_dso_client_session_prepare_session(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 214) != 5) {
    return 4294960587LL;
  }
  uint64_t keepalive_message = _mdns_dso_session_create_keepalive_message(a1, *(_WORD *)(a1 + 212));
  if (!keepalive_message) {
    return 4294960567LL;
  }
  uint64_t v3 = (dispatch_data_t *)keepalive_message;
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer( 0x7530u,  0xFFFFFFFFFFFFFFFFLL,  5u,  (dispatch_queue_s *)_mdns_dso_session_queue_s_queue);
  if (monotonic_timer)
  {
    *(void *)(a1 + 192) = monotonic_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = ___mdns_dso_client_session_prepare_session_block_invoke;
    handler[3] = &__block_descriptor_tmp_27_5925;
    handler[4] = a1;
    dispatch_source_set_event_handler(monotonic_timer, handler);
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v5 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Connection ready -> Preparing session",  buf,  0xCu);
    }

    _mdns_dso_session_send_data_immediately(a1, v3[3], 0, 0);
    dispatch_activate(*(dispatch_object_t *)(a1 + 192));
    uint64_t v7 = 0LL;
    *(_BYTE *)(a1 + 214) = 6;
  }

  else
  {
    uint64_t v7 = 4294960567LL;
  }

  os_release(v3);
  return v7;
}

BOOL _mdns_dso_client_session_expects_message(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 214) & 0xFE) == 6;
}

BOOL _mdns_dso_client_session_is_session_ready(uint64_t a1)
{
  return *(_BYTE *)(a1 + 214) == 7;
}

uint64_t _mdns_dso_client_session_set_up_inactivity_timer(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2;
  if (!a2) {
    unsigned int v2 = *(_DWORD *)(a1 + 128);
  }
  if (v2 == -1) {
    return 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = ___mdns_dso_client_session_set_up_inactivity_timer_ex_block_invoke;
  v8[3] = &__block_descriptor_tmp_28_5923;
  v8[4] = a1;
  unsigned int v9 = v2;
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer( v2,  0xFFFFFFFFFFFFFFFFLL,  5u,  (dispatch_queue_s *)_mdns_dso_session_queue_s_queue);
  if (!monotonic_timer) {
    return 4294960567LL;
  }
  uint64_t v5 = monotonic_timer;
  dispatch_source_set_event_handler(monotonic_timer, v8);
  uint64_t v6 = *(dispatch_object_s **)(a1 + 72);
  if (v6)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v6);
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 72) = v5;
  return result;
}

BOOL _mdns_dso_client_session_check_if_dso_message_belongs_to_user(uint64_t a1, void *a2)
{
  uint64_t v4 = (unsigned __int16 *)a2[4];
  unint64_t v5 = a2[5];
  if (mdns_dso_message_is_unidirectional(v4, v5)) {
    return *(unsigned __int16 *)(a2[2] + 56LL) > 2u;
  }
  _mdns_dso_message_get_header((uint64_t)v4, v5);
  return *(unsigned __int16 *)(a1 + 212) != bswap32(*v4) >> 16;
}

uint64_t _mdns_dso_client_session_process_dso_message(uint64_t a1, void *a2, _BYTE *a3, char *a4)
{
  uint64_t v6 = (_UNKNOWN **)(a2 + 2);
  uint64_t v5 = a2[2];
  int v7 = *(unsigned __int16 *)(v5 + 56);
  if (!*(_WORD *)(v5 + 56))
  {
    char v15 = 0;
    uint64_t result = 4294960554LL;
    goto LABEL_36;
  }

  int v11 = *(_BYTE *)(_mdns_dso_message_get_header(a2[4], a2[5]) + 3) & 0xF;
  if (!mdns_dso_message_is_unidirectional((unsigned __int16 *)a2[4], a2[5]))
  {
    if (v7 != 1) {
      goto LABEL_25;
    }
    int v17 = *(unsigned __int8 *)(a1 + 214);
    if (v17 == 7)
    {
      if (v11)
      {
LABEL_24:
        char v15 = 0;
LABEL_35:
        uint64_t result = 0LL;
        goto LABEL_36;
      }

      uint64_t result = _mdns_dso_client_session_accept_keepalive_message(a1, (uint64_t)a2, a3);
      if (!(_DWORD)result)
      {
        if (_mdns_dso_session_log_s_once != -1) {
          dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
        }
        int v22 = (os_log_s *)_mdns_dso_session_log_s_log;
        char v15 = 1;
        if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 40);
          int v24 = 134217984;
          uint64_t v25 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "[DSO%llu] Keepalive message acked",  (uint8_t *)&v24,  0xCu);
        }

        goto LABEL_35;
      }
    }

    else
    {
      if (v17 != 6) {
        goto LABEL_25;
      }
      if (v11)
      {
        char v15 = 0;
        uint64_t result = 4294960543LL;
        goto LABEL_36;
      }

      uint64_t result = _mdns_dso_client_session_accept_keepalive_message(a1, (uint64_t)a2, 0LL);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(a1 + 214) = 7;
        __int16 v18 = *(dispatch_object_s **)(a1 + 192);
        if (v18)
        {
          dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
          dispatch_release(v18);
          *(void *)(a1 + 192) = 0LL;
        }

        uint64_t result = _mdns_dso_session_schedule_inactivity_timer_ex((void *)a1, 0LL);
        if (!(_DWORD)result)
        {
          uint64_t v19 = *(void *)(a1 + 176);
          if (!v19) {
            goto LABEL_25;
          }
          *(void *)(v19 + 32) = 0LL;
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
          }
          uint64_t v20 = (os_log_s *)_mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a1 + 40);
            int v24 = 134218242;
            uint64_t v25 = v21;
            __int16 v26 = 2112;
            uint64_t v27 = a1;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Preparing session -> Session ready -- session: %@",  (uint8_t *)&v24,  0x16u);
          }

          _mdns_dso_client_session_schedule_user_event(a1, 3, 0);
          goto LABEL_24;
        }
      }
    }

    char v15 = 0;
    goto LABEL_36;
  }

  if (v7 != 1)
  {
    if (v7 == 2)
    {
      do
        uint64_t v6 = (_UNKNOWN **)*v6;
      while (v6 != (_UNKNOWN **)&_mdns_dso_retry_delay_message_kind);
      unsigned int v12 = bswap32(*(_DWORD *)(a2[4] + 16LL));
      uint64_t v13 = *(void *)(a1 + 176);
      uint64_t v14 = mach_continuous_time();
      if (mdns_mach_ticks_per_second_s_once != -1) {
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
      }
      char v15 = 0;
      *(void *)(v13 + 40) = mdns_mach_ticks_per_second_s_ticks_per_second * (v12 / 0x3E8uLL)
                            + mdns_mach_ticks_per_second_s_ticks_per_second * (unint64_t)(v12 % 0x3E8) / 0x3E8
                            + v14;
      *a3 = 1;
      goto LABEL_35;
    }

void _mdns_dso_client_session_handle_error(uint64_t a1, unsigned int a2)
{
  if (a2 - 51 <= 0xE && ((1 << (a2 - 51)) & 0x6609) != 0 && *(_BYTE *)(a1 + 215))
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v4 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218240;
      uint64_t v7 = v5;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Reporting connection error to the client -- error: %{mdns:err}ld",  (uint8_t *)&v6,  0x16u);
    }

    _mdns_dso_client_session_schedule_user_event(a1, 2, a2);
  }

uint64_t _mdns_dso_client_session_check_and_move_to_closing_state(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 214);
  if ((v2 & 0xFE) == 8) {
    return 0LL;
  }
  if (a2)
  {
    if (v2 == 3) {
      return 0LL;
    }
    char v4 = 3;
  }

  else
  {
    char v4 = 8;
  }

  *(_BYTE *)(a1 + 214) = v4;
  return 1LL;
}

void _mdns_dso_client_session_close(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  unsigned int v12 = *(dispatch_object_s **)(a1 + 184);
  if (v12)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
    dispatch_release(v12);
    *(void *)(a1 + 184) = 0LL;
  }

  uint64_t v13 = *(dispatch_object_s **)(a1 + 192);
  if (v13)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v13);
    *(void *)(a1 + 192) = 0LL;
  }

  uint64_t v14 = *(void **)(a1 + 176);
  if (!v14)
  {
LABEL_11:
    if (a5) {
      goto LABEL_12;
    }
LABEL_23:
    if (!a6) {
      return;
    }
    goto LABEL_24;
  }

  if (a3)
  {
    if (a4)
    {
      uint64_t v15 = mach_continuous_time();
      if (mdns_mach_ticks_per_second_s_once != -1) {
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
      }
      v14[5] = v15 + 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
      uint64_t v14 = *(void **)(a1 + 176);
      if (!v14) {
        goto LABEL_11;
      }
    }

    else
    {
      ++v14[4];
    }
  }

  os_release(v14);
  *(void *)(a1 + 176) = 0LL;
  if (!a5) {
    goto LABEL_23;
  }
LABEL_12:
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  int v16 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    int v23 = 134217984;
    uint64_t v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Restarting DSO session",  (uint8_t *)&v23,  0xCu);
  }

  do
  {
    unint64_t v18 = __ldxr(&_mdns_dso_session_get_next_id_s_last_id);
    unint64_t v19 = v18 + 1;
  }

  while (__stxr(v19, &_mdns_dso_session_get_next_id_s_last_id));
  *(void *)(a1 + 40) = v19;
  *(_BYTE *)(a1 + 214) = 3;
  if (!_mdns_dso_client_session_connect_or_delay_reconnecting(a1))
  {
    uint64_t v20 = a1;
    char v21 = 1;
    int v22 = 0;
LABEL_25:
    _mdns_dso_client_session_schedule_user_event(v20, v21, v22);
    return;
  }

  if ((a6 & 1) != 0)
  {
LABEL_24:
    *(_BYTE *)(a1 + 214) = 8;
    uint64_t v20 = a1;
    char v21 = 4;
    int v22 = a2;
    goto LABEL_25;
  }

BOOL _mdns_dso_client_session_check_and_move_to_done_state(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 214);
  if (v1 != 9) {
    *(_BYTE *)(a1 + 214) = 9;
  }
  return v1 != 9;
}

void _mdns_dso_client_session_invalidate(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 200);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(a1 + 200) = 0LL;
  }

void *_mdns_dso_client_session_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  int v27 = 0;
  int v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    uint64_t v7 = v6;
    if (a2
      && (int appended = mdns_string_builder_append_formatted( v6,  "<%s: %p>: ",  *(const char **)(*(void *)(a1 + 16) + 8LL),  (const void *)a1),  (*((_DWORD *)v25 + 6) = appended) != 0))
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      mdns_string_builder_append_formatted(v7, "[DSO%llu", *(void *)(a1 + 40));
      if (!*(_BYTE *)(a1 + 124)) {
        mdns_string_builder_append_formatted(v7, " inactive");
      }
      else {
        BOOL v10 = (&off_10013E1B8)[(*(_BYTE *)(a1 + 214) - 1)];
      }
      mdns_string_builder_append_formatted(v7, " %s", v10);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) < 1)
      {
        uint64_t v12 = *(void *)(a1 + 136);
        if (v12)
        {
          mdns_string_builder_append_description_with_prefix(v7, " ", v12, a3);
          mdns_string_builder_append_formatted(v7, "@interface %u", *(_DWORD *)(a1 + 208));
        }
      }

      else
      {
        v23[0] = 0LL;
        v23[1] = v23;
        v23[2] = 0x2000000000LL;
        v23[3] = " ";
        int v11 = *(const __CFArray **)(a1 + 152);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 0x40000000LL;
        v21[2] = ___mdns_dso_client_session_copy_description_block_invoke;
        v21[3] = &unk_10013E118;
        v21[5] = v23;
        v21[6] = v7;
        v21[4] = &v24;
        char v22 = a3;
        mdns_cfarray_enumerate(v11, (uint64_t)v21);
        _Block_object_dispose(v23, 8);
      }

      uint64_t v13 = *(void *)(a1 + 176);
      if (v13)
      {
        if (*(void *)(a1 + 136)) {
          uint64_t v14 = "->";
        }
        else {
          uint64_t v14 = " ";
        }
        mdns_string_builder_append_description_with_prefix(v7, v14, v13, a3);
      }

      uint64_t v15 = *(nw_connection **)(a1 + 80);
      if (v15)
      {
        int v16 = nw_connection_copy_description(v15);
        if (v16)
        {
          uint64_t v17 = v16;
          mdns_string_builder_append_formatted(v7, ", %s", v16);
          free(v17);
        }
      }

      mdns_string_builder_append_formatted(v7, ", activity count: %zu", *(void *)(a1 + 104));
      if (*(void *)(a1 + 32))
      {
        int64_t v18 = mach_continuous_time() - *(void *)(a1 + 32);
        if (v18 >= 1)
        {
          unint64_t v19 = mdns_ticks_to_milliseconds(v18);
          mdns_string_builder_append_formatted(v7, ", last activity %llums ago", v19);
        }
      }

      mdns_string_builder_append_formatted( v7,  ", inactivity timeout: %ums, keepalive interval: %ums",  *(_DWORD *)(a1 + 128),  *(_DWORD *)(a1 + 132));
      mdns_string_builder_append_formatted(v7, ", keepalive msg id: %u", *(unsigned __int16 *)(a1 + 212));
      if (*(_BYTE *)(a1 + 215)) {
        mdns_string_builder_append_formatted(v7, ", reports connection error");
      }
      mdns_string_builder_append_formatted(v7, "]");
      uint64_t v9 = mdns_string_builder_copy_string((uint64_t)v7);
    }

    os_release(v7);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  _Block_object_dispose(&v24, 8);
  return v9;
}

BOOL ___mdns_dso_client_session_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = mdns_string_builder_append_description_with_prefix( *(void **)(a1 + 48),  *(const char **)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                                 + 24LL),
                                                                  a2,
                                                                  *(_BYTE *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

void _mdns_dso_client_session_schedule_user_event(uint64_t a1, char a2, int a3)
{
  if (*(void *)(a1 + 200))
  {
    os_retain((void *)a1);
    int v6 = _Block_copy(*(const void **)(a1 + 200));
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = ___mdns_dso_client_session_schedule_user_event_block_invoke;
    block[3] = &unk_10013E0B0;
    char v10 = a2;
    int v9 = a3;
    block[4] = v6;
    void block[5] = a1;
    dispatch_async(v7, block);
  }

void ___mdns_dso_client_session_schedule_user_event_block_invoke(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

uint64_t _mdns_dso_client_session_connect_or_delay_reconnecting(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(_BYTE *)(a1 + 214) != 3)
  {
    uint64_t v19 = 4294960587LL;
    goto LABEL_64;
  }

  uint64_t v42 = *(void *)(a1 + 168);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v42 + 24));
  if (Count < 1)
  {
    uint64_t v19 = 4294960569LL;
    goto LABEL_46;
  }

  uint64_t v3 = Count;
  uint64_t v41 = v1;
  CFIndex v4 = 0LL;
  char v5 = 0;
  char v6 = 0;
  unint64_t v7 = 0LL;
  int v8 = 0;
  *(_DWORD *)__int128 handler = 0;
  unsigned int v9 = -1;
  unsigned int v10 = 0xFFFF;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v42 + 24), v4);
    LODWORD(completion[0]) = 0;
    if ((_mdns_dso_server_endpoint_is_usable_now((uint64_t)ValueAtIndex, handler, (int *)completion) & 1) != 0)
    {
      if ((v5 & 1) == 0) {
        char v5 = 1;
      }
      unsigned int priority = nw_endpoint_get_priority(ValueAtIndex[3]);
      int weight = nw_endpoint_get_weight(ValueAtIndex[3]);
      if (v10 <= priority) {
        int v14 = v8;
      }
      else {
        int v14 = 0;
      }
      int v15 = v14 + weight;
      if (v10 <= priority) {
        unint64_t v16 = v7;
      }
      else {
        unint64_t v16 = 0LL;
      }
      if (!weight) {
        ++v16;
      }
      if (v10 >= priority)
      {
        unsigned int v10 = priority;
        int v8 = v15;
        unint64_t v7 = v16;
      }
    }

    else
    {
      unsigned int v17 = completion[0];
      if (v9 < LODWORD(completion[0])) {
        unsigned int v17 = v9;
      }
      if (*(_DWORD *)handler == -6760) {
        unsigned int v9 = v17;
      }
      v6 |= *(_DWORD *)handler == -6760;
    }

    ++v4;
  }

  while (v3 != v4);
  if ((v5 & 1) == 0)
  {
    if ((v6 & 1) != 0)
    {
      char v18 = 1;
      uint64_t v19 = 4294960536LL;
      uint64_t v1 = v41;
      goto LABEL_47;
    }

    uint64_t v19 = 4294960569LL;
LABEL_45:
    uint64_t v1 = v41;
LABEL_46:
    unsigned int v9 = 0;
    char v18 = 0;
LABEL_47:
    int v27 = *(void **)(v1 + 176);
    if (v27)
    {
      os_release(v27);
      *(void *)(v1 + 176) = 0LL;
    }

    char v28 = v18 ^ 1;
    if ((_DWORD)v19 != -6760) {
      char v28 = 1;
    }
    if ((v28 & 1) == 0 && v9)
    {
      int64_t v29 = *(dispatch_object_s **)(v1 + 184);
      if (v29)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v1 + 184));
        dispatch_release(v29);
        *(void *)(v1 + 184) = 0LL;
      }

      if (_mdns_dso_session_queue_s_once != -1) {
        dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
      }
      monotonic_timer = _mdns_dispatch_create_monotonic_timer( v9,  0xFFFFFFFFFFFFFFFFLL,  5u,  (dispatch_queue_s *)_mdns_dso_session_queue_s_queue);
      *(void *)(v1 + 184) = monotonic_timer;
      if (monotonic_timer)
      {
        *(void *)__int128 handler = _NSConcreteStackBlock;
        *(void *)&handler[8] = 0x40000000LL;
        *(void *)&handler[16] = ___mdns_dso_client_session_schedule_reconnecting_block_invoke;
        *(void *)&handler[24] = &__block_descriptor_tmp_19_5891;
        uint64_t v46 = v1;
        dispatch_source_set_event_handler(monotonic_timer, handler);
        dispatch_activate(*(dispatch_object_t *)(v1 + 184));
        uint64_t v19 = 0LL;
      }

      else
      {
        uint64_t v19 = 4294960567LL;
      }

      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
      }
      __int16 v31 = (os_log_s *)_mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(v1 + 40);
        *(_DWORD *)__int128 handler = 134218498;
        *(void *)&handler[4] = v32;
        *(_WORD *)&handler[12] = 1024;
        *(_DWORD *)&handler[14] = v9;
        *(_WORD *)&handler[18] = 2112;
        *(void *)&handler[20] = v1;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] -> Wait for reconnection -- delay: %ums, session: %@",  handler,  0x1Cu);
      }

      if (!(_DWORD)v19) {
        return v19;
      }
    }

uint64_t ___mdns_dso_client_session_schedule_reconnecting_block_invoke(uint64_t a1)
{
  return _mdns_dso_client_session_connect_or_delay_reconnecting(*(void *)(a1 + 32));
}

void _mdns_dso_session_handle_failure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  unsigned int v9 = *(void (**)(uint64_t, uint64_t))(v8 + 152);
  if (v9)
  {
    v9(a1, a2);
    uint64_t v8 = *(void *)(a1 + 16);
  }

  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 168))(a1, a4))
  {
    _mdns_dso_session_close_internal(a1, a2, a3, 0LL, a4, 1LL);
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    unsigned int v10 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 134218752;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = (int)a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 1024;
      int v21 = a4;
      uint64_t v12 = "[DSO%llu] DSO session failed, closing -- error: %{mdns:err}ld, forcibly: %{BOOL}d, restartable: %{BOOL}d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x22u);
    }
  }

  else
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    unsigned int v10 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 134218752;
      uint64_t v15 = v13;
      __int16 v16 = 2048;
      uint64_t v17 = (int)a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 1024;
      int v21 = a4;
      uint64_t v12 = "[DSO%llu] DSO session failed, waiting to restart -- error: %{mdns:err}ld, forcibly: %{BOOL}d, restartable: %{BOOL}d";
      goto LABEL_12;
    }
  }

uint64_t _mdns_dso_session_close_internal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(a1 + 104) = 0LL;
  uint64_t v12 = *(nw_connection **)(a1 + 80);
  if (v12)
  {
    if ((_DWORD)a3) {
      nw_connection_force_cancel(v12);
    }
    else {
      nw_connection_cancel(v12);
    }
    uint64_t v13 = *(void **)(a1 + 80);
    if (v13)
    {
      nw_release(v13);
      *(void *)(a1 + 80) = 0LL;
    }

    int v14 = *(void **)(a1 + 88);
    if (v14)
    {
      free(v14);
      *(void *)(a1 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
    }

    uint64_t v15 = *(void **)(a1 + 96);
    if (v15)
    {
      free(v15);
      *(void *)(a1 + 96) = 0LL;
    }

    *(_DWORD *)(a1 + 112) = 0;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 16) + 176LL))( a1,  a2,  a3,  a4,  a5,  a6);
}

void _mdns_dso_session_stop_inactivity_timer(uint64_t a1)
{
  int v2 = *(dispatch_object_s **)(a1 + 72);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v2);
    *(void *)(a1 + 72) = 0LL;
  }

  *(void *)(a1 + 32) = 0LL;
}

void ___mdns_dso_session_queue_block_invoke(id a1)
{
  _mdns_dso_session_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mdns.dso-session-queue", 0LL);
}

void ___mdns_dso_session_prepare_connection_with_nw_connection_block_invoke( uint64_t a1, uint64_t a2, nw_error_t error)
{
  if (*(void *)(*(void *)(a1 + 32) + 80LL) != *(void *)(a1 + 40)) {
    goto LABEL_2;
  }
  if (error) {
    uint64_t error_code = nw_error_get_error_code(error);
  }
  else {
    uint64_t error_code = 0LL;
  }
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  char v6 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 40LL);
    uint64_t v27 = nw_connection_state_to_string(a2);
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 80LL);
    *(_DWORD *)__int16 v33 = 134218754;
    *(void *)&v33[4] = v26;
    *(_WORD *)&v33[12] = 2082;
    *(void *)&v33[14] = v27;
    __int16 v34 = 2112;
    uint64_t v35 = v28;
    __int16 v36 = 2048;
    uint64_t v37 = (int)error_code;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[DSO%llu] DSO session connection state change -- state: %{public}s, connection: %@, error: %{mdns:err}ld",  v33,  0x2Au);
  }

  switch((int)a2)
  {
    case 0:
    case 1:
    case 2:
      return;
    case 3:
      unint64_t v7 = (nw_endpoint *)nw_connection_copy_connected_local_endpoint(*(void *)(a1 + 40));
      uint64_t v8 = nw_connection_copy_connected_remote_endpoint(*(void *)(a1 + 40));
      if (_mdns_dso_session_log_s_once == -1) {
        goto LABEL_15;
      }
      break;
    case 4:
      if ((_DWORD)error_code != 54) {
        goto LABEL_46;
      }
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
      }
      uint64_t v25 = (os_log_s *)_mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v31 = *(void *)(v30 + 40);
        uint64_t v32 = *(void *)(v30 + 80);
        *(_DWORD *)__int16 v33 = 134218242;
        *(void *)&v33[4] = v31;
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[DSO%llu] DSO session is forcibly aborted by the other side -- %@",  v33,  0x16u);
      }

      uint64_t error_code = 54LL;
      goto LABEL_47;
    case 5:
      goto LABEL_3;
    default:
      uint64_t error_code = 4294960587LL;
      goto LABEL_47;
  }

  while (1)
  {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
LABEL_15:
    unsigned int v9 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40LL);
      *(_DWORD *)__int16 v33 = 134218498;
      *(void *)&v33[4] = v10;
      *(_WORD *)&v33[12] = 2112;
      *(void *)&v33[14] = v7;
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Start connection -> Connection ready -- %@ <---> %@",  v33,  0x20u);
    }

    if (v7) {
      nw_release(v7);
    }
    if (v8) {
      nw_release((void *)v8);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v8 + 88);
    if (v11)
    {
      free(v11);
      *(void *)(v8 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
    }

    uint64_t v12 = nw_connection_copy_endpoint(*(nw_connection_t *)(v8 + 80));
    if (v12)
    {
      unint64_t v7 = v12;
      hostname = nw_endpoint_get_hostname(v12);
      if (!hostname) {
        goto LABEL_48;
      }
      int v14 = strdup(hostname);
      if (!v14) {
        goto LABEL_48;
      }
      *(void *)(v8 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = v14;
      nw_release(v7);
    }

    *(_DWORD *)(v8 + 112) = 0;
    nw_path_t v15 = nw_connection_copy_current_path(*(nw_connection_t *)(v8 + 80));
    if (v15)
    {
      unint64_t v7 = v15;
      *(_DWORD *)(v8 + 112) = nw_path_get_interface_index();
      nw_release(v7);
    }

    __int16 v16 = *(void **)(v8 + 96);
    if (v16)
    {
      free(v16);
      *(void *)(v8 + 96) = 0LL;
    }

    unsigned int v17 = *(_DWORD *)(v8 + 112);
    if (!v17) {
      goto LABEL_35;
    }
    memset(v33, 0, 17);
    __int16 v18 = if_indextoname(v17, v33);
    if (!v18) {
      goto LABEL_35;
    }
    int v19 = strdup(v18);
    if (v19) {
      break;
    }
LABEL_48:
    __break(1u);
  }

  *(void *)(v8 + 96) = v19;
LABEL_35:
  __int16 v20 = nw_connection_copy_parameters(*(nw_connection_t *)(v8 + 80));
  int v21 = nw_parameters_copy_default_protocol_stack(v20);
  nw_protocol_options_t v22 = nw_protocol_stack_copy_transport_protocol(v21);
  maximum_segment_uint64_t size = nw_tcp_options_get_maximum_segment_size();
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  uint64_t v24 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = *(void *)(v8 + 40);
    *(_DWORD *)__int16 v33 = 134218240;
    *(void *)&v33[4] = v29;
    *(_WORD *)&v33[12] = 1024;
    *(_DWORD *)&v33[14] = maximum_segment_size;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[DSO%llu] mss is %d", v33, 0x12u);
  }

  nw_release(v22);
  nw_release(v21);
  nw_release(v20);
  (*(void (**)(uint64_t))(*(void *)(v8 + 16) + 80LL))(v8);
  uint64_t error_code = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 88LL))();
LABEL_46:
  if ((_DWORD)error_code)
  {
LABEL_47:
    _mdns_dso_session_handle_failure(*(void *)(a1 + 32), error_code, 1LL, 1LL);
LABEL_2:
    if ((_DWORD)a2 == 5)
    {
LABEL_3:
      os_release(*(void **)(a1 + 32));
      nw_release(*(void **)(a1 + 40));
    }
  }

void ___mdns_dso_session_schedule_receive_block_invoke( uint64_t a1, dispatch_data_s *a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  if (!*(void *)(*(void *)(a1 + 32) + 80LL)) {
    return;
  }
  uint64_t error_code = a5;
  char v44 = 0;
  if (context)
  {
    BOOL is_final = nw_content_context_get_is_final(context);
    if (!error_code) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  BOOL is_final = 0;
  if (a5) {
LABEL_4:
  }
    uint64_t error_code = nw_error_get_error_code((nw_error_t)error_code);
LABEL_5:
  if ((_DWORD)error_code) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = is_final;
  }
  if (v9)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 160LL);
    if (v10) {
      v10();
    }
    char v44 = 1;
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v11 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v12;
      uint64_t v13 = "[DSO%llu] DSO session is gracefully closed by the other side.";
      int v14 = (os_log_s *)v11;
      uint32_t v15 = 12;
      goto LABEL_58;
    }
  }

  else if ((_DWORD)error_code == 61 || (_DWORD)error_code == 54)
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v16 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 40LL);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = error_code;
      uint64_t v13 = "[DSO%llu] DSO session is forcibly aborted by the other side -- error: %{mdns:err}ld";
      int v14 = (os_log_s *)v16;
      uint32_t v15 = 22;
LABEL_58:
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      if (!a2) {
        goto LABEL_39;
      }
LABEL_21:
      if (dispatch_data_get_size(a2))
      {
        int v17 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 96LL))();
        uint64_t v18 = *(void *)(a1 + 32);
        if (!v17)
        {
          uint64_t error_code = 4294960587LL;
          goto LABEL_40;
        }

        int v19 = mdns_message_create_with_dispatch_data(a2, 1);
        if (!v19)
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t error_code = 4294960567LL;
          goto LABEL_40;
        }

        __int16 v20 = v19;
        int v21 = (_UNKNOWN **)*((void *)v19 + 2);
        if (!v21) {
          goto LABEL_31;
        }
        while (v21 != &_mdns_dso_message_kind)
        {
          int v21 = (_UNKNOWN **)*v21;
          if (!v21) {
            goto LABEL_31;
          }
        }

        if (!(*(unsigned int (**)(uint64_t, _BYTE *))(*(void *)(v18 + 16) + 120LL))(v18, v19))
        {
          char v45 = 0;
          __int16 v36 = (_UNKNOWN **)v20[2];
          if (v36)
          {
            while (v36 != &_mdns_dso_message_kind)
            {
              __int16 v36 = (_UNKNOWN **)*v36;
              if (!v36) {
                goto LABEL_51;
              }
            }

            uint64_t error_code = (*(uint64_t (**)(uint64_t, void *, char *, char *))(*(void *)(v18 + 16) + 128LL))( v18,  v20,  &v44,  &v45);
            if (!v45)
            {
              if (_mdns_dso_session_log_s_once != -1) {
                dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
              }
              uint64_t v37 = (os_log_s *)_mdns_dso_session_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v38 = *(void *)(v18 + 40);
                size_t size = dispatch_data_get_size(a2);
                uint64_t v40 = *(void **)(v18 + 88);
                uint64_t v41 = *(void *)(v18 + 96);
                int v42 = *(_DWORD *)(v18 + 112);
                *(_DWORD *)buf = 134219010;
                *(void *)&uint8_t buf[4] = v38;
                *(_WORD *)&_BYTE buf[12] = 2048;
                *(void *)&buf[14] = size;
                *(_WORD *)&buf[22] = 2082;
                int v47 = v40;
                LOWORD(v4_Block_object_dispose((const void *)(v1 - 176), 8) = 2082;
                *(void *)((char *)&v48 + 2) = v41;
                WORD5(v4_Block_object_dispose((const void *)(v1 - 176), 8) = 1024;
                HIDWORD(v4_Block_object_dispose((const void *)(v1 - 176), 8) = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Received %zu-byte session DSO message from %{public}s over DSO session via %{public}s/%u",  buf,  0x30u);
              }
            }
          }

          else
          {
LABEL_51:
            uint64_t error_code = 4294960560LL;
          }
        }

        else
        {
LABEL_31:
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
          }
          nw_protocol_options_t v22 = (os_log_s *)_mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = *(void *)(v18 + 40);
            size_t v24 = dispatch_data_get_size(a2);
            uint64_t v25 = *(void **)(v18 + 88);
            uint64_t v26 = *(void *)(v18 + 96);
            int v27 = *(_DWORD *)(v18 + 112);
            *(_DWORD *)buf = 134219010;
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&_BYTE buf[12] = 2048;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2082;
            int v47 = v25;
            LOWORD(v4_Block_object_dispose((const void *)(v1 - 176), 8) = 2082;
            *(void *)((char *)&v48 + 2) = v26;
            WORD5(v4_Block_object_dispose((const void *)(v1 - 176), 8) = 1024;
            HIDWORD(v4_Block_object_dispose((const void *)(v1 - 176), 8) = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Received %zu-byte user DSO message from %{public}s over DSO session via %{public}s/%u",  buf,  0x30u);
          }

          if (*(void *)(v18 + 64))
          {
            os_retain((void *)v18);
            dispatch_retain(a2);
            uint64_t v28 = _Block_copy(*(const void **)(v18 + 64));
            uint64_t v29 = *(dispatch_queue_s **)(v18 + 48);
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 0x40000000LL;
            *(void *)&uint8_t buf[16] = ___mdns_dso_session_schedule_user_receive_block_invoke;
            int v47 = &unk_10013DFA8;
            *(void *)&__int128 v48 = v28;
            *((void *)&v48 + 1) = v18;
            int v49 = a2;
            dispatch_async(v29, buf);
          }

          uint64_t error_code = 0LL;
        }

        os_release(v20);
      }

      goto LABEL_39;
    }
  }

  if (a2) {
    goto LABEL_21;
  }
LABEL_39:
  uint64_t v18 = *(void *)(a1 + 32);
  if ((_DWORD)error_code)
  {
LABEL_40:
    uint64_t v30 = v18;
    uint64_t v31 = error_code;
    uint64_t v32 = 1LL;
    uint64_t v33 = 1LL;
LABEL_43:
    _mdns_dso_session_handle_failure(v30, v31, v32, v33);
    return;
  }

  if (v44)
  {
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    goto LABEL_43;
  }

  __int16 v34 = *(void (**)(void))(*(void *)(v18 + 16) + 136LL);
  if (v34)
  {
    v34(*(void *)(a1 + 32));
    uint64_t v18 = *(void *)(a1 + 32);
  }

  uint64_t v35 = *(nw_connection **)(v18 + 80);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 0x40000000LL;
  *(void *)&uint8_t buf[16] = ___mdns_dso_session_schedule_receive_block_invoke;
  int v47 = &__block_descriptor_tmp_17_5898;
  *(void *)&__int128 v48 = v18;
  nw_connection_receive_message(v35, buf);
}

void ___mdns_dso_session_schedule_user_receive_block_invoke(uint64_t a1)
{
  int v2 = *(dispatch_object_s **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

void ___mdns_dso_session_log_block_invoke(id a1)
{
  _mdns_dso_session_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "dso_session");
}

uint64_t _mdns_dso_client_session_schedule_keepalive_message(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 214) != 7) {
    return 4294960587LL;
  }
  int v2 = *(dispatch_object_s **)(a1 + 192);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v2);
    *(void *)(a1 + 192) = 0LL;
  }

  unsigned int v3 = *(_DWORD *)(a1 + 132);
  if (v3 == -1) {
    return 0LL;
  }
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer( v3,  0xFFFFFFFFFFFFFFFFLL,  5u,  (dispatch_queue_s *)_mdns_dso_session_queue_s_queue);
  *(void *)(a1 + 192) = monotonic_timer;
  if (monotonic_timer)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = ___mdns_dso_client_session_schedule_keepalive_message_block_invoke;
    handler[3] = &__block_descriptor_tmp_30_5914;
    handler[4] = a1;
    dispatch_source_set_event_handler(monotonic_timer, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 192));
    return 0LL;
  }

  return 4294960567LL;
}

void ___mdns_dso_client_session_schedule_keepalive_message_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v3 = *(dispatch_object_s **)(v2 + 192);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 192));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 192LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v2 + 214) == 7)
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    CFIndex v4 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40LL);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[DSO%llu] Sending keepalive message",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t keepalive_message = _mdns_dso_session_create_keepalive_message( *(void *)(a1 + 32),  *(_WORD *)(*(void *)(a1 + 32) + 212LL));
    if (keepalive_message)
    {
      char v6 = (void *)keepalive_message;
      _mdns_dso_session_send_data_immediately(*(void *)(a1 + 32), *(dispatch_data_t *)(keepalive_message + 24), 1, 1);
      os_release(v6);
    }
  }

uint64_t _mdns_dso_session_create_keepalive_message(uint64_t a1, __int16 a2)
{
  uint64_t result = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_keepalive_message_builder, 40LL);
  if (result)
  {
    uint64_t v5 = result;
    char v6 = &_mdns_dso_keepalive_message_builder_kind;
    *(void *)(result + 16) = &_mdns_dso_keepalive_message_builder_kind;
    do
    {
      uint64_t v7 = (void (*)(uint64_t))v6[2];
      if (v7) {
        v7(v5);
      }
      char v6 = (_UNKNOWN **)*v6;
    }

    while (v6);
    *(_WORD *)(v5 + 2_Block_object_dispose((const void *)(v1 - 176), 8) = a2;
    *(void *)(v5 + 32) = *(void *)(a1 + 116);
    message = mdns_dso_message_builder_create_message(v5);
    os_release((void *)v5);
    return (uint64_t)message;
  }

  return result;
}

void _mdns_dso_session_send_data_immediately(uint64_t a1, dispatch_data_t data, char a3, char a4)
{
  uint64_t v7 = *(nw_connection **)(a1 + 80);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = ___mdns_dso_session_send_data_immediately_block_invoke;
  v8[3] = &__block_descriptor_tmp_32_5916;
  v8[4] = a1;
  void v8[5] = v7;
  v8[6] = dispatch_data_get_size(data);
  char v9 = a4;
  char v10 = a3;
  nw_connection_send(v7, data, _nw_content_context_default_message, 1, v8);
}

void ___mdns_dso_session_send_data_immediately_block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[10] != *(void *)(a1 + 40)) {
    return;
  }
  if (error)
  {
    uint64_t error_code = nw_error_get_error_code(error);
    if ((_DWORD)error_code)
    {
      uint64_t v5 = error_code;
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
      }
      char v6 = (os_log_s *)_mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(v19 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v22 = *(void *)(v19 + 88);
        uint64_t v23 = *(void *)(v19 + 96);
        LODWORD(v19) = *(_DWORD *)(v19 + 112);
        int v24 = 134219266;
        uint64_t v25 = v20;
        __int16 v26 = 2048;
        uint64_t v27 = v21;
        __int16 v28 = 2082;
        uint64_t v29 = v22;
        __int16 v30 = 2082;
        uint64_t v31 = v23;
        __int16 v32 = 1024;
        int v33 = v19;
        __int16 v34 = 2048;
        uint64_t v35 = (int)v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[DSO%llu] Failed to send %zu-byte DSO message to %{public}s over DSO session via %{public}s/%u -- error: %{mdns:err}ld",  (uint8_t *)&v24,  0x3Au);
      }

      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), v5, 1LL, 1LL);
      return;
    }
  }

  else if ((*(unsigned int (**)(void))(v2[2] + 104LL))(*(void *)(a1 + 32)) && !v2[13])
  {
    _mdns_dso_session_schedule_inactivity_timer_ex(*(void **)(a1 + 32), 0LL);
  }

  if (*(_BYTE *)(a1 + 56)) {
    return;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v7 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(v8 + 88);
      uint64_t v12 = *(void *)(v8 + 96);
      LODWORD(v_Block_object_dispose((const void *)(v1 - 176), 8) = *(_DWORD *)(v8 + 112);
      int v24 = 134219010;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 2082;
      uint64_t v29 = v11;
      __int16 v30 = 2082;
      uint64_t v31 = v12;
      __int16 v32 = 1024;
      int v33 = v8;
      uint64_t v13 = "[DSO%llu] Sent %zu-byte user DSO message to %{public}s over DSO session via %{public}s/%u";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0x30u);
    }
  }

  else
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
    }
    uint64_t v7 = (os_log_s *)_mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(v14 + 88);
      uint64_t v18 = *(void *)(v14 + 96);
      LODWORD(v14) = *(_DWORD *)(v14 + 112);
      int v24 = 134219010;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2082;
      uint64_t v29 = v17;
      __int16 v30 = 2082;
      uint64_t v31 = v18;
      __int16 v32 = 1024;
      int v33 = v14;
      uint64_t v13 = "[DSO%llu] Sent %zu-byte session DSO message to %{public}s over DSO session via %{public}s/%u";
      goto LABEL_23;
    }
  }

uint64_t _mdns_dso_session_schedule_inactivity_timer_ex(void *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(a1[2] + 112LL))(a1, a2);
  if (!(_DWORD)result)
  {
    uint64_t result = a1[9];
    if (result)
    {
      dispatch_activate((dispatch_object_t)result);
      uint64_t v5 = mach_continuous_time();
      uint64_t result = 0LL;
      a1[4] = v5;
    }
  }

  return result;
}

uint64_t _mdns_dso_client_session_accept_keepalive_message(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5 = *(_UNKNOWN ***)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = a2;
    while (v5 != (_UNKNOWN **)&_mdns_dso_keepalive_message_kind)
    {
      uint64_t v5 = (_UNKNOWN **)*v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = *(void *)(v6 + 32);
  else {
    uint64_t v8 = 0LL;
  }
  unsigned int v9 = bswap32(*v8);
  if (v9 <= 0x1388) {
    unsigned int v10 = 5000;
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a1 + 12_Block_object_dispose((const void *)(v1 - 176), 8) = v10;
  if (!*(void *)(a1 + 72)) {
    return 4294960587LL;
  }
  int64_t v15 = mach_continuous_time() - *(void *)(a1 + 32);
  if (v15 < 0) {
    return 4294960587LL;
  }
  unint64_t v16 = mdns_ticks_to_milliseconds(v15);
  uint64_t v17 = *(dispatch_object_s **)(a1 + 72);
  if (v17)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v17);
    *(void *)(a1 + 72) = 0LL;
  }

  if (v16 >= v10)
  {
    if (a3) {
      *a3 = 1;
    }
    goto LABEL_14;
  }

  if (a3) {
    *a3 = 0;
  }
  uint64_t result = _mdns_dso_session_schedule_inactivity_timer_ex((void *)a1, v10 - v16);
  if (!(_DWORD)result)
  {
LABEL_14:
    uint64_t result = 0LL;
    uint64_t v12 = *(void *)(v6 + 32);
    uint64_t v13 = v12 + 16;
    unsigned int v14 = bswap32(*(_DWORD *)(v13 + 4));
    if (v14 <= 0x2710) {
      unsigned int v14 = 10000;
    }
    *(_DWORD *)(a1 + 132) = v14;
  }

  return result;
}

void ___mdns_dso_client_session_set_up_inactivity_timer_ex_block_invoke(uint64_t a1)
{
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  uint64_t v2 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40LL);
    int v4 = *(_DWORD *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Hit inactivity timeout, closing the idle session -- inactivity timeout: %ums",  (uint8_t *)&v6,  0x12u);
  }

  _mdns_dso_session_stop_inactivity_timer(*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  if ((*(unsigned int (**)(uint64_t))(*(void *)(v5 + 16) + 104LL))(v5))
  {
    if (!*(void *)(v5 + 104)) {
      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), 0LL, 0LL, 0LL);
    }
  }

void ___mdns_dso_client_session_prepare_session_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_object_s **)(v2 + 192);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 192));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 192LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v2 + 214) == 6) {
    _mdns_dso_session_handle_failure(v2, 4294960574LL, 1LL, 1LL);
  }
}

void ___mdns_dso_session_create_tls_nw_parameters_block_invoke(uint64_t a1, nw_protocol_options_t options)
{
  uint64_t v3 = nw_tls_copy_sec_protocol_options(options);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  if (v5)
  {
    int v6 = *(dispatch_queue_s **)(v4 + 48);
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    _OWORD v7[2] = ___mdns_dso_session_create_tls_nw_parameters_block_invoke_2;
    v7[3] = &__block_descriptor_tmp_24_5931;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v4;
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
    }
    int v6 = (dispatch_queue_s *)_mdns_dso_session_queue_s_queue;
    uint64_t v5 = v7;
  }

  sec_protocol_options_set_verify_block(v3, v5, v6);
  if (v3) {
    sec_release(v3);
  }
}

uint64_t ___mdns_dso_session_create_tls_nw_parameters_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 72LL);
  if (v5) {
    uint64_t v6 = v5(*(void *)(a1 + 40), a2, a3, 0LL);
  }
  else {
    uint64_t v6 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v6);
}

nw_endpoint_t ___mdns_dso_client_session_start_connection_with_server_addresses_block_invoke( uint64_t a1, uint64_t a2)
{
  *(_DWORD *)&v7[24] = 0;
  *(void *)&v7[16] = 0LL;
  uint64_t v3 = (_OWORD *)(a2 + 24);
  int v4 = *(unsigned __int8 *)(a2 + 25);
  if (v4 == 30)
  {
    *(_OWORD *)uint64_t v7 = *v3;
    *(_OWORD *)&v7[12] = *(_OWORD *)(a2 + 36);
  }

  else
  {
    nw_endpoint_t result = 0LL;
    if (v4 != 2) {
      return result;
    }
    *(_OWORD *)uint64_t v7 = *v3;
  }

  if (!*(_WORD *)&v7[2]) {
    *(_WORD *)&_OWORD v7[2] = 21763;
  }
  nw_endpoint_t result = nw_endpoint_create_address((const sockaddr *)v7);
  if (result)
  {
    uint64_t v6 = result;
    nw_array_append(*(void *)(a1 + 32), result);
    nw_release(v6);
    return (nw_endpoint_t)1;
  }

  return result;
}

uint64_t _mdns_dso_client_session_add_nw_endpoints(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0LL;
  int64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  int v17 = 0;
  uint64_t v4 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_server_endpoint_manager, 32LL);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = &_mdns_dso_server_endpoint_manager_kind;
    *(void *)(v4 + 16) = &_mdns_dso_server_endpoint_manager_kind;
    do
    {
      uint64_t v7 = (void (*)(void *))v6[2];
      if (v7) {
        v7(v5);
      }
      uint64_t v6 = (_UNKNOWN **)*v6;
    }

    while (v6);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
    v5[3] = Mutable;
    if (Mutable) {
      int v9 = 0;
    }
    else {
      int v9 = -6729;
    }
    if (!Mutable) {
      uint64_t v5 = 0LL;
    }
    int v17 = v9;
    uint64_t v10 = *((unsigned int *)v15 + 6);
    if ((_DWORD)v10)
    {
      if (Mutable)
      {
        os_release(v5);
        uint64_t v10 = *((unsigned int *)v15 + 6);
      }

      goto LABEL_19;
    }
  }

  else
  {
    int v17 = -6728;
    uint64_t v10 = *((unsigned int *)v15 + 6);
    if ((_DWORD)v10) {
      goto LABEL_19;
    }
    uint64_t v5 = 0LL;
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = ___mdns_dso_client_session_add_nw_endpoints_block_invoke;
  v13[3] = &unk_10013DF20;
  v13[4] = &v14;
  v13[5] = v5;
  nw_array_apply(a2, v13);
  *(void *)(a1 + 16_Block_object_dispose((const void *)(v1 - 176), 8) = v5;
  *(_BYTE *)(a1 + 214) = 3;
  os_retain((void *)a1);
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = ___mdns_dso_client_session_add_nw_endpoints_block_invoke_2;
  block[3] = &__block_descriptor_tmp_13_5941;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
  uint64_t v10 = 0LL;
  *((_DWORD *)v15 + 6) = 0;
LABEL_19:
  _Block_object_dispose(&v14, 8);
  return v10;
}

void ___mdns_dso_client_session_start_srv_resolution_block_invoke(uint64_t a1)
{
}

void ___mdns_dso_client_session_start_srv_resolution_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 2)
  {
    if (!a3)
    {
      uint64_t v8 = 4294960569LL;
LABEL_16:
      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), v8, 1LL, 0LL);
      return;
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v5 + 214) == 2)
    {
      uint64_t srv_weighted_variant = nw_resolver_create_srv_weighted_variant(a3);
      if (srv_weighted_variant)
      {
        uint64_t v7 = (void *)srv_weighted_variant;
        uint64_t v8 = _mdns_dso_client_session_add_nw_endpoints(v5, srv_weighted_variant);
        if (_mdns_dso_session_log_s_once != -1) {
          dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
        }
        int v9 = (os_log_s *)_mdns_dso_session_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(v5 + 40);
          int v12 = 134218242;
          uint64_t v13 = v10;
          __int16 v14 = 2112;
          uint64_t v15 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] Start SRV resolution -> SRV resolution finished -- endpoints: %@",  (uint8_t *)&v12,  0x16u);
        }

        nw_release(v7);
      }

      else
      {
        uint64_t v8 = 4294960567LL;
      }
    }

    else
    {
      uint64_t v8 = 4294960587LL;
    }

    nw_resolver_cancel(*(void *)(v5 + 144));
    uint64_t v11 = *(void **)(v5 + 144);
    if (v11)
    {
      nw_release(v11);
      *(void *)(v5 + 144) = 0LL;
    }

    if ((_DWORD)v8) {
      goto LABEL_16;
    }
  }

BOOL ___mdns_dso_client_session_add_nw_endpoints_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_server_endpoint, 48LL);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = &_mdns_dso_server_endpoint_kind;
    *(void *)(v6 + 16) = &_mdns_dso_server_endpoint_kind;
    do
    {
      int v9 = (void (*)(void *))v8[2];
      if (v9) {
        v9(v7);
      }
      uint64_t v8 = (_UNKNOWN **)*v8;
    }

    while (v8);
    v7[3] = nw_retain(a3);
    CFArrayAppendValue(*(CFMutableArrayRef *)(v5 + 24), v7);
    os_release(v7);
    int v10 = 0;
  }

  else
  {
    int v10 = -6728;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v10;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

void ___mdns_dso_client_session_add_nw_endpoints_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[214] == 3)
  {
    _mdns_dso_client_session_connect_or_delay_reconnecting((uint64_t)v2);
    uint64_t v2 = *(_BYTE **)(a1 + 32);
  }

  os_release(v2);
}

void __mdns_dso_session_add_activity_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 104LL))())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    ++*(void *)(v2 + 104);
    _mdns_dso_session_stop_inactivity_timer(v2);
    os_release(*(void **)(a1 + 32));
  }

void __mdns_dso_session_remove_activity_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 104LL))())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 104);
    if (v3)
    {
      *(void *)(v2 + 104) = v3 - 1;
      if ((*(unsigned int (**)(uint64_t))(*(void *)(v2 + 16) + 104LL))(v2))
      {
        if (!*(void *)(v2 + 104)) {
          _mdns_dso_session_schedule_inactivity_timer_ex(*(void **)(a1 + 32), 0LL);
        }
      }
    }

    os_release(*(void **)(a1 + 32));
  }

void mdns_dso_session_send(void *a1, dispatch_object_s *a2)
{
  if ((*(unsigned int (**)(void))(a1[2] + 104LL))())
  {
    os_retain(a1);
    dispatch_retain(a2);
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000LL;
    v4[2] = __mdns_dso_session_send_block_invoke;
    v4[3] = &__block_descriptor_tmp_5_5951;
    v4[4] = a1;
    void v4[5] = a2;
    dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, v4);
  }

void __mdns_dso_session_send_block_invoke(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 104LL))();
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    _mdns_dso_session_send_data_immediately((uint64_t)v3, *(dispatch_data_t *)(a1 + 40), 1, 0);
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(uint64_t (**)(void))(v3[2] + 144LL);
    if (v4)
    {
      uint64_t v5 = v4();
      uint64_t v3 = *(void **)(a1 + 32);
      if ((_DWORD)v5)
      {
        _mdns_dso_session_handle_failure((uint64_t)v3, v5, 1LL, 1LL);
        uint64_t v3 = *(void **)(a1 + 32);
      }
    }
  }

  os_release(v3);
  uint64_t v6 = *(dispatch_object_s **)(a1 + 40);
  if (v6) {
    dispatch_release(v6);
  }
}

void mdns_dso_session_invalidate(void *a1)
{
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __mdns_dso_session_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_7_5953;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
}

void __mdns_dso_session_invalidate_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 184LL))())
  {
    _mdns_dso_session_close_internal(*(void *)(a1 + 32), 0LL, 0LL, 1LL, 0LL, 0LL);
    int v2 = *(void **)(a1 + 32);
    uint64_t v3 = (const void *)v2[7];
    if (v3)
    {
      _Block_release(v3);
      v2[7] = 0LL;
    }

    uint64_t v4 = (const void *)v2[8];
    if (v4)
    {
      _Block_release(v4);
      v2[8] = 0LL;
    }

    (*(void (**)(void *))(v2[2] + 192LL))(v2);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24LL);
  uint64_t monotonic_time_ns = mdns_get_monotonic_time_ns();
  unint64_t v7 = (monotonic_time_ns - v5) / 0xF4240uLL;
  if (__ROR8__(0x790FB65668C26139LL * v7, 6) <= 0x10C6F7A0B5EDuLL) {
    int64_t v8 = (monotonic_time_ns - v5) / 0xF4240uLL;
  }
  else {
    int64_t v8 = v7 + 1;
  }
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
  }
  int v9 = (os_log_s *)_mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40LL);
    int v11 = 134218496;
    uint64_t v12 = v10;
    __int16 v13 = 2048;
    unint64_t v14 = (unint64_t)((unsigned __int128)(v8 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7;
    __int16 v15 = 2048;
    unint64_t v16 = v8 - 1000 * v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] DSO session invalidated -- duration: %{mdns:time_duration}lld %lldms",  (uint8_t *)&v11,  0x20u);
  }

  os_release(*(void **)(a1 + 32));
}

uint64_t dnssec_objs_sort(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0LL;
    uint64_t v5 = (void *)result;
    do
    {
      uint64_t v6 = v4++;
      uint64_t v7 = *(void *)(v3 + 8 * v4);
      nw_endpoint_t result = ref_count_obj_compare(v7, *(void *)(v3 + 8 * v6), 0LL);
      uint64_t v8 = v4;
      if ((_DWORD)result == -1)
      {
        int v9 = v5;
        uint64_t v8 = v4;
        do
        {
          v9[1] = *v9;
          if (!--v8) {
            break;
          }
          uint64_t v10 = *--v9;
          nw_endpoint_t result = ref_count_obj_compare(v7, v10, 0LL);
        }

        while ((_DWORD)result == -1);
      }

      *(void *)(v3 + 8 * v_Block_object_dispose((const void *)(v1 - 176), 8) = v7;
      ++v5;
    }

    while (v6 != v2);
  }

  return result;
}

void __is_apple_internal_build_block_invoke(id a1)
{
  is_apple_internal_build_is_internal = os_variant_has_internal_diagnostics("com.apple.mDNSResponder");
}

uint64_t _dnssec_obj_validation_manager_compare()
{
  return 2LL;
}

void _dnssec_obj_validation_manager_finalize(void *a1)
{
  unint64_t v2 = (void *)a1[2];
  if (v2)
  {
    ref_count_obj_release(v2);
    a1[2] = 0LL;
  }

  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    ref_count_obj_release(v3);
    a1[4] = 0LL;
  }

  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    ref_count_obj_release(v4);
    a1[5] = 0LL;
  }

  _dnssec_obj_validation_manager_reset_validation_key_requestor((uint64_t)a1);
  _dnssec_obj_validation_manager_reset_insecure_validation((uint64_t)a1);
  unint64_t v5 = a1[16];
  if (v5)
  {
    for (unint64_t i = 0LL; i < v5; ++i)
    {
      uint64_t v7 = *(void **)(a1[15] + 8 * i);
      if (v7)
      {
        ref_count_obj_release(v7);
        unint64_t v5 = a1[16];
        *(void *)(a1[15] + 8 * i) = 0LL;
      }
    }
  }

  uint64_t v8 = (void *)a1[15];
  if (v8)
  {
    free(v8);
    a1[15] = 0LL;
  }

void _dnssec_obj_validation_manager_reset_validation_key_requestor(uint64_t a1)
{
  *(_BYTE *)(a1 + 72) = 0;
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    int v6 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 1024;
    unsigned int v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[Q%u->SubQ%u] Canceling the existing validation key requestor",  (uint8_t *)v10,  0xEu);
  }

void _dnssec_obj_validation_manager_reset_insecure_validation(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    int v6 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    int v8 = *(_DWORD *)(a1 + 112);
    BOOL v9 = *(void *)(a1 + 88) != 0LL;
    v11[0] = 67109888;
    v11[1] = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    __int16 v14 = 1026;
    int v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[Q%u->SubQ%u] Canceling the existing insecure validation - state: %{public, mdns:dnssec_inval_state}d, validated: %{mdns:yesno}d",  (uint8_t *)v11,  0x1Au);
  }

void _dnssec_obj_validation_manager_stop_negative_ds_query(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2) {
    goto LABEL_18;
  }
  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v5 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    uint64_t v7 = *(void *)(a1 + 104);
    if (v7)
    {
      int v8 = *(_DWORD *)(v7 + 24);
      uint64_t v7 = *(void *)(v7 + 16);
    }

    else
    {
      int v8 = 0;
    }

    goto LABEL_15;
  }

  uint64_t v3 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    uint64_t v7 = *(void *)(a1 + 104);
    if (v7)
    {
      int v8 = *(_DWORD *)(v7 + 24);
      uint64_t v7 = *(void *)(v7 + 16);
    }

    else
    {
      int v8 = 0;
    }

BOOL dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    uint64_t v2 = a2;
    if (a2) {
      goto LABEL_5;
    }
    return 0LL;
  }

  uint64_t v2 = a1;
  if (a2) {
    return 0LL;
  }
LABEL_5:
  int v3 = *(_DWORD *)(v2 + 40);
  if (v3 != 4 && v3 != 2) {
    return 0LL;
  }
  if (!*(void *)(v2 + 32))
  {
    uint64_t v19 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    else
    {
      uint64_t v19 = mDNSLogCategory_DNSSEC_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    int v21 = 136447234;
    uint64_t v22 = (uint64_t)"dnssec_obj_rrset_get_rr_count(me) > 0";
    __int16 v23 = 2082;
    *(void *)int v24 = "";
    *(_WORD *)&v24[8] = 2082;
    *(void *)&v24[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
    *(_WORD *)&v24[18] = 1024;
    int v25 = 361;
    __int16 v26 = 2048;
    uint64_t v27 = 0LL;
    uint64_t v16 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    __int16 v17 = (os_log_s *)v19;
    uint32_t v18 = 48;
    goto LABEL_39;
  }

  int v5 = *(unsigned __int8 **)(v2 + 24);
  if (**(unsigned __int8 **)v5 != 240)
  {
    char v8 = 0;
    do
    {
      while (1)
      {
        int v9 = *(unsigned __int16 *)(*(void *)v5 + 4LL);
        if (v9 != 43)
        {
          if (v9 == 46) {
            return 0LL;
          }
          if (v9 != 48) {
            break;
          }
        }

        int v5 = (unsigned __int8 *)*((void *)v5 + 1);
        char v8 = 1;
        if (!v5) {
          goto LABEL_23;
        }
      }

      int v5 = (unsigned __int8 *)*((void *)v5 + 1);
    }

    while (v5);
    if ((v8 & 1) == 0) {
      return 1LL;
    }
LABEL_23:
    uint64_t v10 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      uint64_t v12 = *(void *)(v2 + 16);
      if (v12)
      {
        int v13 = *(_DWORD *)(v12 + 24);
        uint64_t v14 = *(void *)(v12 + 16);
      }

      else
      {
        int v13 = 0;
        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v10 = mDNSLogCategory_DNSSEC_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      uint64_t v15 = *(void *)(v2 + 16);
      if (v15)
      {
        int v13 = *(_DWORD *)(v15 + 24);
        uint64_t v14 = *(void *)(v15 + 16);
      }

      else
      {
        int v13 = 0;
        uint64_t v14 = 0LL;
      }
    }

    int v21 = 141558787;
    uint64_t v22 = 1752392040LL;
    __int16 v23 = 1040;
    *(_DWORD *)int v24 = v13;
    *(_WORD *)&v24[4] = 2101;
    *(void *)&v24[6] = v14;
    *(_WORD *)&v24[14] = 1024;
    *(_DWORD *)&v24[16] = dnssec_obj_rrset_get_rr_type(v2);
    uint64_t v16 = "Received positive DNSKEY or DS RRSet without RRSIG, malformed - name: %{sensitive, mask.hash, mdnsresponder:do"
          "main_name}.*P, type: %{mdns:rrtype}d.";
    __int16 v17 = (os_log_s *)v10;
    uint32_t v18 = 34;
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v21, v18);
    return 0LL;
  }

  uint64_t v6 = *(void *)(*(void *)v5 + 56LL);
  return !v6 || *(_DWORD *)(v6 + 32) || *(_BYTE *)(v6 + 40) || *(void *)(v6 + 48) == 0LL;
}

_DWORD *_dnssec_obj_validation_manager_start_sub_query( uint64_t a1, __int16 a2, __int16 a3, int a4, uint64_t a5, uint64_t a6, int *a7)
{
  BOOL result = calloc(1uLL, 0x290uLL);
  if (result)
  {
    uint64_t v15 = (uint64_t)result;
    result[53] = -1;
    *((void *)result + 17) = *(void *)(*(void *)(a5 + 24) + 136LL);
    result[76] = a4;
    __memcpy_chk(result + 89, *(void *)(a1 + 16), *(void *)(a1 + 24), 300LL);
    *(_WORD *)(v15 + 324) = a2;
    *(_WORD *)(v15 + 322) = a3;
    *(_BYTE *)(v15 + 635) = (a4 & 0x200000) != 0;
    *(_BYTE *)(v15 + 6memset(v38, 0, 15) = (a4 & 0x1000) != 0;
    *(_DWORD *)(v15 + 244) = getpid();
    *(void *)(v15 + 152) = a6;
    *(void *)(v15 + 176) = a5;
    int started = mDNS_StartQuery((unsigned int *)&mDNSStorage, v15);
    if (a7)
    {
      if (started) {
        int v17 = -6736;
      }
      else {
        int v17 = 0;
      }
      *a7 = v17;
    }

    if (started)
    {
      free((void *)v15);
      return 0LL;
    }

    return (_DWORD *)v15;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void dnssec_obj_validation_manager_start_insecure_validation(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 0xFFFFE5C200000000LL;
  _dnssec_obj_validation_manager_reset_validation_key_requestor(a1);
  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 140) = 0;
  *(_BYTE *)(a1 + 144) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  int v26 = 0;
  if (*(void *)(a1 + 80)) {
    return;
  }
  if (*(_DWORD *)(a1 + 112) || !v4 || ((int v5 = *(_DWORD *)(v4 + 40), v5 != 2) ? (v6 = v5 == 4) : (v6 = 1), !v6))
  {
    int v17 = 0LL;
    int v18 = -6709;
LABEL_27:
    int v26 = v18;
    goto LABEL_28;
  }

  uint64_t v7 = *(void *)(a1 + 16);
  char v8 = *(unsigned __int8 **)(v7 + 16);
  unsigned int v9 = *v8;
  if (!*v8) {
    goto LABEL_39;
  }
  uint64_t v10 = *(void *)(a2 + 24);
  if (!v10) {
    goto LABEL_39;
  }
  unint64_t v11 = -1LL;
  uint64_t v12 = *(void *)(v7 + 16);
  do
  {
    unint64_t v13 = v11;
    uint64_t v14 = v12 + v9;
    unsigned int v15 = *(unsigned __int8 *)(v14 + 1);
    uint64_t v12 = v14 + 1;
    unsigned int v9 = v15;
    ++v11;
  }

  while (v15);
  if (*(_WORD *)(v10 + 322) == 43 && v13 + 2 <= 1)
  {
LABEL_39:
    int v17 = 0LL;
    int v18 = -6736;
    goto LABEL_27;
  }

  int v17 = dnssec_obj_domain_name_copy_parent_domain(v8, v11, &v26);
  int v18 = v26;
  if (v26) {
    goto LABEL_28;
  }
  int started = _dnssec_obj_validation_manager_start_negative_ds_query(a1, (uint64_t)v17, a2);
  int v26 = started;
  if (started)
  {
    int v18 = started;
LABEL_28:
    _dnssec_obj_validation_manager_fail_insecure_validation(a1, v18);
    if (!v17) {
      return;
    }
    goto LABEL_37;
  }

  uint64_t v20 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
  }

  else
  {
    uint64_t v20 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
  }

  int v21 = *(unsigned __int16 *)(a1 + 24);
  unsigned int v22 = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 96) + 320LL)) >> 16;
  uint64_t v24 = *(void *)(v7 + 16);
  uint64_t v23 = *(void *)(v7 + 24);
  *(_DWORD *)buf = 67110147;
  int v28 = v21;
  __int16 v29 = 1024;
  unsigned int v30 = v22;
  __int16 v31 = 2160;
  uint64_t v32 = 1752392040LL;
  __int16 v33 = 1040;
  int v34 = v23;
  __int16 v35 = 2101;
  uint64_t v36 = v24;
  _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "[Q%u->SubQ%u] Start insecure validation - unsigned domain: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P",  buf,  0x28u);
LABEL_32:
  *(_DWORD *)(a1 + 112) = 1;
  if (v17) {
    ++*(_DWORD *)v17;
  }
  int v25 = *(void **)(a1 + 104);
  if (v25) {
    ref_count_obj_release(v25);
  }
  *(void *)(a1 + 104) = v17;
  int v26 = 0;
  if (v17) {
LABEL_37:
  }
    ref_count_obj_release(v17);
}

uint64_t _dnssec_obj_validation_manager_start_negative_ds_query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v18 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      return -6709;
    }
  }

  if (*(void *)(a1 + 96)) {
    return -6709;
  }
  __int16 rr_class = dnssec_obj_rrset_get_rr_class(v6);
  int started = _dnssec_obj_validation_manager_start_sub_query( a2,  rr_class,  43,  4096,  a3,  (uint64_t)_query_record_with_insecure_validation_reply,  (int *)&v18);
  *(void *)(a1 + 96) = started;
  if (!v18)
  {
    unsigned int v9 = started;
    uint64_t v10 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      {
        int v12 = *(unsigned __int16 *)(a1 + 24);
        unsigned int v13 = bswap32(*((unsigned __int16 *)v9 + 160)) >> 16;
        if (a2)
        {
          int v14 = *(_DWORD *)(a2 + 24);
          uint64_t v15 = *(void *)(a2 + 16);
        }

        else
        {
          int v14 = 0;
          uint64_t v15 = 0LL;
        }

        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      {
        int v12 = *(unsigned __int16 *)(a1 + 24);
        unsigned int v13 = bswap32(*((unsigned __int16 *)v9 + 160)) >> 16;
        if (a2)
        {
          int v14 = *(_DWORD *)(a2 + 24);
          uint64_t v15 = *(void *)(a2 + 16);
        }

        else
        {
          int v14 = 0;
          uint64_t v15 = 0LL;
        }

void _dnssec_obj_validation_manager_fail_insecure_validation(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 104);
      if (v6)
      {
        int v7 = *(_DWORD *)(v6 + 24);
        uint64_t v6 = *(void *)(v6 + 16);
      }

      else
      {
        int v7 = 0;
      }

      uint64_t v9 = *(void *)(a1 + 96);
      if (v9) {
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 320)) >> 16;
      }
      int v10 = *(unsigned __int16 *)(a1 + 24);
      int v11 = *(_DWORD *)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 320)) >> 16;
      }
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 104);
      if (v6)
      {
        int v7 = *(_DWORD *)(v6 + 24);
        uint64_t v6 = *(void *)(v6 + 16);
      }

      else
      {
        int v7 = 0;
      }

      uint64_t v9 = *(void *)(a1 + 96);
      if (v9) {
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 320)) >> 16;
      }
      int v10 = *(unsigned __int16 *)(a1 + 24);
      int v11 = *(_DWORD *)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 320)) >> 16;
      }
LABEL_23:
      v13[0] = 67110659;
      v13[1] = v10;
      __int16 v14 = 1026;
      int v15 = v11;
      __int16 v16 = 2160;
      uint64_t v17 = 1752392040LL;
      __int16 v18 = 1040;
      int v19 = v7;
      __int16 v20 = 2101;
      uint64_t v21 = v6;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 1024;
      int v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[Q%u] Insecure validation failed - state: %{public, mdns:dnssec_inval_state}d, DS denial lookup name: %{sensitiv e, mask.hash, mdnsresponder:domain_name}.*P, DS denial lookup q: Q%u, secure DS denial q: Q%u",  (uint8_t *)v13,  0x34u);
    }
  }

  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 112) = 3;
  *(_DWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 3;
  *(_DWORD *)(a1 + 52) = a2;
}

uint64_t _update_validated_cache_with_rrset(uint64_t a1, int a2)
{
  unsigned int v126 = 0;
  int v119 = *(_DWORD *)(a1 + 44);
  size_t v125 = 0LL;
  uint64_t v123 = dnssec_obj_rrset_copy_rrs((void *)a1, &v125, &v126);
  if (v126) {
    goto LABEL_199;
  }
  size_t v2 = v125;
  if (!v125) {
    goto LABEL_223;
  }
  uint64_t cache_record = resource_record_get_cache_record(*(void *)(*v123 + 56));
  if (!cache_record)
  {
    unsigned int v103 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_DNSSEC != mDNSLogCategory_State)
    {
      unsigned int v103 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        goto LABEL_223;
      }
      goto LABEL_222;
    }

    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
    {
LABEL_222:
      *(_DWORD *)buf = 136447234;
      *(void *)uint64_t v128 = "cr != NULL";
      *(_WORD *)&v128[8] = 2082;
      *(void *)&v128[10] = "";
      *(_WORD *)&v128[18] = 2082;
      *(void *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_mdns_core.c";
      *(_WORD *)&v128[28] = 1024;
      *(_DWORD *)&v128[30] = 314;
      *(_WORD *)&v128[34] = 2048;
      *(void *)&v128[36] = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  buf,  0x30u);
    }

void dnssec_obj_validation_manager_remove_validated_cache(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v31 = 0;
    if (*(_BYTE *)(v2 + 60))
    {
      size_t v30 = 0LL;
      int v3 = dnssec_obj_rrset_copy_rrs((void *)v2, &v30, &v31);
      uint64_t v4 = v31;
      if (v31)
      {
        __int16 v27 = (os_log_s *)mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
            return;
          }
        }

        else
        {
          __int16 v27 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
            return;
          }
        }

        *(_DWORD *)buf = 136447234;
        uint64_t v33 = (uint64_t)"err == 0";
        __int16 v34 = 2082;
        *(void *)uint64_t v35 = "";
        *(_WORD *)&v35[8] = 2082;
        *(void *)&v35[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnsse"
                              "c_obj_validation_manager.c";
        *(_WORD *)&v35[18] = 1024;
        int v36 = 1267;
        __int16 v37 = 2048;
        uint64_t v38 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  buf,  0x30u);
        return;
      }

      uint64_t v5 = v3;
      size_t v6 = v30;
      if (v30)
      {
        uint64_t v7 = 0LL;
        while (1)
        {
          uint64_t v8 = v5[v7];
          mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"_purge_validated_record_from_cache", 1933);
          uint64_t v9 = *(void *)(v8 + 56);
          if (!v9 || *(_DWORD *)(v9 + 32)) {
            goto LABEL_44;
          }
          uint64_t v10 = CacheGroupForName((uint64_t)&mDNSStorage, *(_DWORD *)(v8 + 16), *(_BYTE **)(v8 + 32)) + 2;
          do
          {
            uint64_t v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_44;
            }
          }

          while (!identical_dnssec_validated_same_name_resource_record(v8, (uint64_t)(v10 + 1)));
          int expiration_time = resource_record_get_expiration_time(*(void *)(v8 + 56));
          if (expiration_time)
          {
            if (expiration_time - dword_100158BF8 >= 4000)
            {
              unsigned int v12 = (os_log_s *)mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                {
                  uint64_t v13 = *(void *)(v8 + 32);
                  if (v13)
                  {
                    uint64_t v14 = *(_BYTE **)(v8 + 32);
                    if (v13 == -256)
                    {
LABEL_28:
                      while (v14)
                      {
                        uint64_t v16 = *v14;
                        if (!*v14)
                        {
                          LOWORD(v14) = (_WORD)v14 - v13 + 1;
                          goto LABEL_40;
                        }

                        v14 += v16 + 1;
                        if (v13 != -256) {
                          goto LABEL_27;
                        }
                      }
                    }

                    else
                    {
LABEL_27:
                    }

                    LOWORD(v14) = 257;
LABEL_40:
                    LODWORD(v14) = (unsigned __int16)v14;
                  }

                  else
                  {
                    LODWORD(v14) = 0;
                  }

uint64_t dnssd_svcb_service_name_is_empty(uint64_t a1, unint64_t a2)
{
  if (a2 < 2) {
    return 0LL;
  }
  BOOL v3 = 0;
  unint64_t v4 = a1 + 2;
  if (a1 == -2)
  {
    BOOL v5 = 0;
  }

  else
  {
    BOOL v5 = 0;
    if (a1 + a2 > v4)
    {
      size_t v6 = (_BYTE *)(a1 + 2);
      while (*v6)
      {
        v6 += *v6 + 1;
        if (v6) {
          BOOL v7 = (unint64_t)v6 >= a1 + a2;
        }
        else {
          BOOL v7 = 1;
        }
        if (v7)
        {
          BOOL v3 = 0;
          BOOL v5 = 0;
          return v3 & v5;
        }
      }

      unint64_t v8 = (unsigned __int16)((_WORD)v6 - v4 + 1);
      BOOL v5 = v8 < 0x101;
      BOOL v3 = v8 == 1;
    }
  }

  return v3 & v5;
}

uint64_t __dnssd_svcb_is_valid_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3)
  {
    if ((a3 & 1) != 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }

    else
    {
      uint64_t v3 = (unsigned __int16)(a3 >> 1);
      if ((unsigned __int16)(a3 >> 1))
      {
        do
        {
          uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
          if (*(_BYTE *)(v4 + 24)) {
            break;
          }
          unsigned int v5 = bswap32(*a2) >> 16;
          if (v5 - 1 >= 7 && v5 - 0x8000 >= 2) {
            *(_BYTE *)(v4 + 24) = 1;
          }
          ++a2;
          --v3;
        }

        while (v3);
      }
    }
  }

  return 0LL;
}

_WORD *_dnssd_svcb_extract_values(_WORD *result, unint64_t a2, int a3, uint64_t a4)
{
  if (a2 >= 2)
  {
    if (*result)
    {
      uint64_t v4 = result + 1;
      if (result != (_WORD *)-2LL && (_WORD *)((char *)result + a2) > v4)
      {
        BOOL v7 = result + 1;
        while (*v7)
        {
          v7 += *v7 + 1;
          if (v7) {
            BOOL v8 = v7 >= (_BYTE *)result + a2;
          }
          else {
            BOOL v8 = 1;
          }
          if (v8) {
            return result;
          }
        }

        unint64_t v9 = (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
        if (v9 <= 0x100)
        {
          uint64_t v10 = (_WORD *)((char *)v4 + v9);
          unint64_t v11 = a2 - 2 - v9;
          while (v11 >= 4 && v10 != 0LL)
          {
            unint64_t v13 = bswap32(v10[1]) >> 16;
            BOOL v8 = v11 - 4 >= v13;
            unint64_t v11 = v11 - 4 - v13;
            if (!v8) {
              break;
            }
            uint64_t v14 = v10 + 2;
            if (a3 == bswap32(*v10) >> 16)
            {
              BOOL result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))( a4,  v10 + 2,  v13);
              if (!(_DWORD)result) {
                break;
              }
            }

            uint64_t v10 = (unsigned __int16 *)((char *)v14 + v13);
          }
        }
      }
    }
  }

  return result;
}

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2) {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = bswap32(*a2) >> 16;
  }
  return 0LL;
}

uint64_t __dnssd_svcb_copy_doh_uri_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3) {
    asprintf((char **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "%.*s", a3, a2);
  }
  return 0LL;
}

uint64_t __dnssd_svcb_copy_doh_path_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3) {
    asprintf((char **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "%.*s", a3, a2);
  }
  return 0LL;
}

void *__dnssd_svcb_copy_odoh_config_block_invoke(uint64_t a1, const void *a2, size_t __size)
{
  if (!a2 || !__size) {
    return 0LL;
  }
  BOOL result = calloc(1uLL, __size);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    **(void **)(a1 + 40) = __size;
    memcpy(*(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), a2, __size);
    return 0LL;
  }

  __break(1u);
  return result;
}

uint64_t __dnssd_svcb_access_alpn_values_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 && a3)
  {
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(a2 + v6);
      unint64_t v8 = v6 + 1;
      v6 += 1 + v7;
      memset(v16, 0, 255);
      if (v6 > a3) {
        break;
      }
      __memcpy_chk(v16, a2 + v8, v7, 255LL);
      if (((*(uint64_t (**)(void, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v16,  v9,  v10,  v11,  v12,  v13,  v14) & 1) == 0) {
        break;
      }
    }

    while (v6 < a3);
  }

  return 0LL;
}

void ___mdns_get_dns_over_bytestream_protocol_definition_block_invoke(id a1)
{
  _mdns_get_dns_over_bytestream_protocol_definition_s_framer_def = (uint64_t)nw_framer_create_definition( "DNS over bytestream",  0,  &__block_literal_global_14_6094);
}

int ___mdns_create_dns_over_bytestream_framer_block_invoke_4(id a1, const nw_framer *a2)
{
  return 1;
}

void ___mdns_create_dns_over_bytestream_framer_block_invoke_3( id a1, const nw_framer *a2, const nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  if (a4 < 0x10000)
  {
    *(_WORD *)output_buffer = bswap32(a4) >> 16;
    nw_framer_write_output(a2, output_buffer, 2uLL);
    nw_framer_write_output_no_copy(a2, a4);
  }

  else
  {
    nw_framer_mark_failed_with_error(a2, 40);
  }

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_6099(id a1, nw_framer *a2)
{
  do
  {
    *(_WORD *)temp_buffer = 0;
    if (!nw_framer_parse_input(a2, 2uLL, 2uLL, temp_buffer, &__block_literal_global_7_6102)) {
      break;
    }
    size_t v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    uint64_t v4 = nw_framer_message_create(a2);
    LODWORD(v3) = nw_framer_deliver_input_no_copy(a2, v3, v4, 1);
    nw_release(v4);
  }

  while ((_DWORD)v3);
  return 2LL;
}

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_2( id a1, char *a2, unint64_t a3, BOOL a4)
{
  return 2LL * (a3 > 1);
}

uint64_t GetAddrInfoClientRequestStart( uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v58 = 0u;
  uint64_t RecordOpStart = 4294901756LL;
  __int128 v57 = 0u;
  __int128 v56 = 0u;
  __int128 v55 = 0u;
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  __int128 v52 = 0u;
  __int128 v51 = 0u;
  __int128 v50 = 0u;
  __int128 v49 = 0u;
  __int128 v48 = 0u;
  __int128 v47 = 0u;
  __int128 v46 = 0u;
  __int128 v45 = 0u;
  uint64_t v13 = (unsigned __int8 *)*((void *)a2 + 1);
  unsigned __int8 v44 = 0;
  if (!AppendDNSNameString(&v44, v13, a3, a4, a5, a6, a7, a8))
  {
    int v25 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
    }

    else
    {
      int v25 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
    }

    int v26 = *a2;
    uint64_t v27 = *((void *)a2 + 1);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&uint8_t buf[4] = v26;
    *(_WORD *)&uint8_t buf[8] = 2160;
    *(void *)&buf[10] = 1752392040LL;
    *(_WORD *)&buf[18] = 2085;
    *(void *)&buf[20] = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[R%u] ERROR: bad hostname '%{sensitive, mask.hash}s'",  buf,  0x1Cu);
LABEL_40:
    GetAddrInfoClientRequestStop(a1, v14, v15, v16, v17, v18, v19, v20);
    return RecordOpStart;
  }

  unsigned int v21 = a2[6];
  if (v21 > 3) {
    goto LABEL_40;
  }
  if (v21)
  {
    int v22 = a2[5];
  }

  else
  {
    unsigned int v21 = 3;
    int v22 = a2[5] | 0x8000;
  }

  *(_DWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 176), 8) = v21;
  if ((v22 & 0x10000000) != 0)
  {
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "GetAddrInfoClientRequestStart: kDNSServiceFlagsServiceIndex is SET by the client",  v16,  v17,  v18,  v19,  v20,  v37);
    }
    uint64_t v24 = 0LL;
    int v23 = a2[4];
  }

  else
  {
    uint64_t v38 = 0LL;
    uint64_t RecordOpStart = InterfaceIndexToInterfaceID(a2[4], &v38, v15, v16, v17, v18, v19, v20);
    if ((_DWORD)RecordOpStart) {
      goto LABEL_40;
    }
    int v23 = -1;
    uint64_t v24 = v38;
  }

  char v28 = 0;
  *(void *)a1 = v24;
  uint64_t v29 = (_BYTE *)*((void *)a2 + 1);
  while (1)
  {
    int v30 = *v29++;
    if (v30 == 46) {
      break;
    }
    if (v30 == 92)
    {
      ++v28;
    }

    else
    {
      if (!*(v29 - 1)) {
        goto LABEL_27;
      }
LABEL_24:
      char v28 = 0;
    }
  }

  if (*v29) {
    goto LABEL_24;
  }
  if ((v28 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  if (AlwaysAppendSearchDomains || v44 && !*(&v44 + v44 + 1))
  {
    char v31 = 1;
    goto LABEL_32;
  }

uint64_t InterfaceIndexToInterfaceID( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = mDNSPlatformInterfaceIDfromInterfaceIndex(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  uint64_t v16 = v10;
  if (!a1 || v10)
  {
LABEL_9:
    uint64_t v17 = 0LL;
    *a2 = v16;
    return v17;
  }

  if (InterfaceIndexToInterfaceID_getLoopbackIndexOnce != -1) {
    dispatch_once(&InterfaceIndexToInterfaceID_getLoopbackIndexOnce, &__block_literal_global_6144);
  }
  if (a1 <= 0xFFFFFFFB && InterfaceIndexToInterfaceID_loopbackIndex != a1)
  {
    uint64_t v16 = a1;
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "Query pending for interface index %d",  v11,  v12,  v13,  v14,  v15,  a1);
    }
    goto LABEL_9;
  }

  uint64_t v17 = 4294901756LL;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ERROR: bad interfaceIndex %d",  v11,  v12,  v13,  v14,  v15,  a1);
  }
  return v17;
}

uint64_t QueryRecordOpStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = *(_BYTE **)(a2 + 8);
  uint64_t v9 = v8;
  if (v8 == (_BYTE *)-256LL) {
    goto LABEL_5;
  }
LABEL_2:
  unsigned int v10 = 257;
  if (v9 < v8 + 256 && v9)
  {
    while (1)
    {
      uint64_t v11 = *v9;
      if (v11 > 0x3F)
      {
LABEL_10:
        unsigned int v10 = 257;
        goto LABEL_12;
      }

      if (!*v9) {
        break;
      }
      v9 += v11 + 1;
      if (v8 != (_BYTE *)-256LL) {
        goto LABEL_2;
      }
LABEL_5:
      if (!v9) {
        goto LABEL_10;
      }
    }

    unsigned int v10 = (unsigned __int16)((_WORD)v9 - (_WORD)v8 + 1);
    if ((_WORD)v9 - (_WORD)v8 == 0xFFFF) {
      goto LABEL_129;
    }
  }

void GetAddrInfoClientRequestStop( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9) {
    QueryRecordOpStop(v9);
  }
  uint64_t v10 = *(void *)(a1 + 24);
  if (v10)
  {
    QueryRecordOpStop(v10);
    uint64_t v11 = *(void *)(a1 + 24);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12 || *(_BYTE *)(v12 + 718))
  {
    if (!v11) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }

  if (*(_BYTE *)(v12 + 617)) {
    mDNSPlatformUpdateDNSStatus(*(void *)(a1 + 16));
  }
  uint64_t v12 = 0LL;
  if (v11)
  {
LABEL_9:
    if (!*(_BYTE *)(v11 + 718))
    {
      if (*(_BYTE *)(v11 + 617)) {
        mDNSPlatformUpdateDNSStatus(v11);
      }
      uint64_t v11 = 0LL;
    }
  }

void QueryRecordOpStop(uint64_t a1)
{
  if (*(void *)(a1 + 176))
  {
    resolved_cache_delete(a1);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a1);
    *(void *)(a1 + 176) = 0LL;
    if (callExternalHelpers( *(void *)(a1 + 136),  *(_BYTE **)(a1 + 656),  *(unsigned int *)(a1 + 304),  v2,  v3,  v4,  v5,  v6))
    {
      external_stop_browsing_for_service( *(void *)(a1 + 136),  (unsigned __int8 *)(a1 + 356),  *(unsigned __int16 *)(a1 + 322),  *(_DWORD *)(a1 + 304),  *(_DWORD *)(a1 + 244));
    }
  }

  uint64_t v7 = *(void **)(a1 + 656);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 656) = 0LL;
  }

  unint64_t v8 = *(void **)(a1 + 704);
  if (v8)
  {
    if (!v8[22]
      || (resolved_cache_delete(*(void *)(a1 + 704)),
          mDNS_StopQuery((unsigned int *)mDNSStorage, (uint64_t)v8),
          v8[22] = 0LL,
          (unint64_t v8 = *(void **)(a1 + 704)) != 0LL))
    {
      free(v8);
    }

    *(void *)(a1 + 704) = 0LL;
  }

  uint64_t v9 = *(void **)(a1 + 744);
  if (v9)
  {
    os_release(v9);
    *(void *)(a1 + 744) = 0LL;
  }

  uint64_t v10 = *(void **)(a1 + 752);
  if (v10)
  {
    os_release(v10);
    *(void *)(a1 + 752) = 0LL;
  }

void QueryRecordOpCallback( uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a2 + 176);
  if (*(void *)(v12 + 704) == a2 && *(_WORD *)(a2 + 322) == 6)
  {
    if (*((_WORD *)a3 + 2) == 6)
    {
      resolved_cache_delete(a2);
      mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
      *(void *)(a2 + 176) = 0LL;
      *(_WORD *)(a2 + 322) = *(_WORD *)(v12 + 712);
      *(_BYTE *)(a2 + 612) = *(_BYTE *)(v12 + 714);
      *(_BYTE *)(a2 + 6memset(v38, 0, 15) = *(_BYTE *)(v12 + 715);
      *(_BYTE *)(a2 + 617) = *(_BYTE *)(v12 + 716);
      int v20 = *(unsigned __int8 *)(v12 + 717);
      *(_BYTE *)(a2 + 621) = v20;
      if (*a3 == 240)
      {
        if (v20)
        {
          SearchDomaiint n = NextSearchDomain(v12, v13, v14, v15, v16, v17, v18, v19);
          if (SearchDomain) {
            QueryRecordOpRestartUnicastQuestion(v12, a2, SearchDomain);
          }
        }
      }

      else
      {
        QueryRecordOpRestartUnicastQuestion(v12, a2, 0LL);
      }
    }

    return;
  }

  if ((_DWORD)a4 != 1 || *(_BYTE *)(a2 + 626) != 1)
  {
    if ((_DWORD)a4 != 4) {
      goto LABEL_30;
    }
    int v22 = (os_log_s *)mDNSLogCategory_Default;
    uint64_t v23 = 4294901742LL;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
      {
LABEL_123:
        char v33 = 0;
        goto LABEL_144;
      }

      int v25 = *(_DWORD *)(v12 + 688);
      int v26 = (_BYTE *)(a2 + 356);
      if (a2 == -612)
      {
LABEL_25:
        while (v26)
        {
          uint64_t v27 = *v26;
          if (!*v26)
          {
            int v40 = (unsigned __int16)((_WORD)v26 - (a2 + 356) + 1);
            goto LABEL_122;
          }

          v26 += v27 + 1;
          if (a2 != -612) {
            goto LABEL_24;
          }
        }
      }

      else
      {
LABEL_24:
      }

      int v40 = 257;
    }

    else
    {
      int v22 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_123;
      }
      int v25 = *(_DWORD *)(v12 + 688);
      int v36 = (_BYTE *)(a2 + 356);
      if (a2 == -612)
      {
LABEL_54:
        while (v36)
        {
          uint64_t v37 = *v36;
          if (!*v36)
          {
            int v40 = (unsigned __int16)((_WORD)v36 - (a2 + 356) + 1);
            goto LABEL_122;
          }

          v36 += v37 + 1;
          if (a2 != -612) {
            goto LABEL_53;
          }
        }
      }

      else
      {
LABEL_53:
      }

      int v40 = 257;
    }

void *QueryRecordOpResetHandler(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = (void *)result[22];
  uint64_t v3 = (_BYTE *)v2[82];
  uint64_t v4 = v3;
  if (v3 == (_BYTE *)-256LL)
  {
LABEL_3:
    while (v4)
    {
      uint64_t v5 = *v4;
      if (!*v4)
      {
        unsigned __int16 v6 = (_WORD)v4 - (_WORD)v3 + 1;
        if (v6 > 0x100u) {
          break;
        }
        BOOL result = memcpy((char *)result + 356, v3, v6);
        goto LABEL_11;
      }

      v4 += v5 + 1;
      if (v3 != (_BYTE *)-256LL) {
        goto LABEL_2;
      }
    }
  }

  else
  {
LABEL_2:
    if (v4 < v3 + 256) {
      goto LABEL_3;
    }
  }

  *((_BYTE *)result + 356) = 0;
LABEL_11:
  else {
    unint64_t v8 = v2 + 83;
  }
  v1[17] = *v8;
  *(void *)((char *)v2 + 692) = 0LL;
  return result;
}

uint64_t QueryRecordOpEventHandler(uint64_t result, int a2)
{
  if (a2 != 1) {
    return result;
  }
  uint64_t v2 = result;
  if (*(_BYTE *)(result + 626) != 1) {
    return result;
  }
  uint64_t v3 = *(void *)(result + 176);
  if (!*(_BYTE *)(v3 + 720)) {
    return result;
  }
  resolved_cache_delete(result);
  mDNS_StopQuery((unsigned int *)mDNSStorage, v2);
  *(void *)(v2 + 176) = 0LL;
  uint64_t v4 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_Default != mDNSLogCategory_State)
  {
    uint64_t v4 = (os_log_s *)mDNSLogCategory_Default_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_52;
    }
    int v6 = *(_DWORD *)(v3 + 688);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    uint64_t v17 = (_BYTE *)(v2 + 356);
    if (v2 == -612)
    {
LABEL_20:
      while (v17)
      {
        uint64_t v18 = *v17;
        if (!*v17)
        {
          int v19 = (unsigned __int16)((_WORD)v17 - (v2 + 356) + 1);
          goto LABEL_39;
        }

        v17 += v18 + 1;
        if (v2 != -612) {
          goto LABEL_19;
        }
      }
    }

    else
    {
LABEL_19:
    }

    int v19 = 257;
LABEL_39:
    uint64_t v20 = *(void *)(v3 + 656);
    if (v20)
    {
      char v24 = *(_BYTE **)(v3 + 656);
      if (v20 == -256)
      {
LABEL_42:
        while (v24)
        {
          uint64_t v25 = *v24;
          if (!*v24)
          {
            int v23 = (unsigned __int16)((_WORD)v24 - v20 + 1);
            goto LABEL_51;
          }

          v24 += v25 + 1;
          if (v20 != -256) {
            goto LABEL_41;
          }
        }
      }

      else
      {
LABEL_41:
      }

      int v23 = 257;
    }

    else
    {
      int v23 = 0;
    }

    goto LABEL_51;
  }

  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(v3 + 688);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 320)) >> 16;
    unint64_t v8 = (_BYTE *)(v2 + 356);
    if (v2 == -612)
    {
LABEL_12:
      while (v8)
      {
        uint64_t v9 = *v8;
        if (!*v8)
        {
          int v19 = (unsigned __int16)((_WORD)v8 - (v2 + 356) + 1);
          goto LABEL_28;
        }

        v8 += v9 + 1;
        if (v2 != -612) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
    }

    int v19 = 257;
LABEL_28:
    uint64_t v20 = *(void *)(v3 + 656);
    if (v20)
    {
      uint64_t v21 = *(_BYTE **)(v3 + 656);
      if (v20 == -256)
      {
LABEL_31:
        while (v21)
        {
          uint64_t v22 = *v21;
          if (!*v21)
          {
            int v23 = (unsigned __int16)((_WORD)v21 - v20 + 1);
            goto LABEL_51;
          }

          v21 += v22 + 1;
          if (v20 != -256) {
            goto LABEL_30;
          }
        }
      }

      else
      {
LABEL_30:
      }

      int v23 = 257;
    }

    else
    {
      int v23 = 0;
    }

uint64_t QueryRecordOpStartQuestion(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 176) = a1;
  uint64_t started = mDNS_StartQuery((unsigned int *)mDNSStorage, a2);
  if ((_DWORD)started)
  {
    uint64_t v5 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        *(void *)(a2 + 176) = 0LL;
        return started;
      }

      int v7 = *(_DWORD *)(a1 + 688);
      unint64_t v8 = (_BYTE *)(a2 + 356);
      if (a2 == -612)
      {
LABEL_10:
        while (v8)
        {
          uint64_t v9 = *v8;
          if (!*v8)
          {
            int v13 = (unsigned __int16)((_WORD)v8 - (a2 + 356) + 1);
            goto LABEL_27;
          }

          v8 += v9 + 1;
          if (a2 != -612) {
            goto LABEL_9;
          }
        }
      }

      else
      {
LABEL_9:
      }

      int v13 = 257;
    }

    else
    {
      uint64_t v5 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v7 = *(_DWORD *)(a1 + 688);
      uint64_t v11 = (_BYTE *)(a2 + 356);
      if (a2 == -612)
      {
LABEL_18:
        while (v11)
        {
          uint64_t v12 = *v11;
          if (!*v11)
          {
            int v13 = (unsigned __int16)((_WORD)v11 - (a2 + 356) + 1);
            goto LABEL_27;
          }

          v11 += v12 + 1;
          if (a2 != -612) {
            goto LABEL_17;
          }
        }
      }

      else
      {
LABEL_17:
      }

      int v13 = 257;
    }

uint64_t DomainNameIsInSearchList(_BYTE *a1, int a2)
{
  int v4 = *a1;
  if (*a1)
  {
    int v5 = 0;
    int v6 = a1;
    do
    {
      ++v5;
      int v7 = &v6[v4];
      int v8 = v7[1];
      int v6 = v7 + 1;
      int v4 = v8;
    }

    while (v8);
  }

  else
  {
    int v5 = 0;
  }

  uint64_t v9 = SearchList;
  if (!SearchList) {
    return 0LL;
  }
  while (1)
  {
    if (!a2 || !SameDomainNameBytes((_BYTE *)(v9 + 8), "\x05local"))
    {
      unsigned int v10 = *(unsigned __int8 *)(v9 + 8);
      if (*(_BYTE *)(v9 + 8))
      {
        int v11 = 0;
        uint64_t v12 = v9 + 8;
        do
        {
          ++v11;
          uint64_t v13 = v12 + v10;
          unsigned int v14 = *(unsigned __int8 *)(v13 + 1);
          uint64_t v12 = v13 + 1;
          unsigned int v10 = v14;
        }

        while (v14);
      }

      else
      {
        int v11 = 0;
      }

      if (v5 >= v11)
      {
        uint64_t v15 = a1;
        if (v5 - v11 >= 1)
        {
          int v16 = v5 + 1 - v11;
          uint64_t v15 = a1;
          do
          {
            if (!*v15) {
              break;
            }
            v15 += *v15 + 1;
            --v16;
          }

          while (v16 > 1);
        }
      }
    }

    uint64_t v9 = *(void *)v9;
    if (!v9) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t *NextSearchDomain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 692);
  unsigned int v10 = &SearchList;
  *(_DWORD *)(a1 + 696) = v9;
  while ((v9 & 0x80000000) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 664);
    do
    {
      unsigned int v10 = (uint64_t *)*v10;
      BOOL v12 = v9-- != 0;
    }

    while (v12 && v10);
    while (1)
    {
      if (!v10) {
        goto LABEL_52;
      }
      unsigned int v14 = v10 + 1;
      unsigned int v13 = *((unsigned __int8 *)v10 + 8);
      if (*((_BYTE *)v10 + 8))
      {
        int v15 = -1;
        int v16 = v10 + 1;
        do
        {
          int v17 = v15;
          uint64_t v18 = (char *)v16 + v13;
          unsigned int v19 = v18[1];
          int v16 = (uint64_t *)(v18 + 1);
          unsigned int v13 = v19;
          ++v15;
        }

        while (v19);
        if (v17 + 2 >= 2)
        {
          int v20 = (unsigned __int8 *)(v10 + 1);
          if (v17)
          {
            int v20 = (unsigned __int8 *)(v10 + 1);
            do
            {
              if (!*v20) {
                break;
              }
              --v15;
              v20 += *v20 + 1;
            }

            while (v15 > 1);
          }

          if (SameDomainNameBytes(v20, "\ain-addr\x04arpa")
            || SameDomainNameBytes(v20, "\x03ip6\x04arpa"))
          {
            if (mDNS_LoggingEnabled == 1) {
              LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "uDNS_GetNextSearchDomain: skipping search domain %##s, InterfaceID %p",  a4,  a5,  a6,  a7,  a8,  (_DWORD)v10 + 8);
            }
            ++*(_DWORD *)(a1 + 692);
            goto LABEL_9;
          }
        }
      }

      ++*(_DWORD *)(a1 + 692);
      if (v10[34] == v11) {
        break;
      }
      if (mDNS_LoggingEnabled) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "uDNS_GetNextSearchDomain skipping domain %##s, InterfaceID %p",  a4,  a5,  a6,  a7,  a8,  (_DWORD)v10 + 8);
      }
LABEL_9:
      unsigned int v10 = (uint64_t *)*v10;
    }

    if (mDNS_LoggingEnabled) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "uDNS_GetNextSearchDomain returning domain %##s, InterfaceID %p",  a4,  a5,  a6,  a7,  a8,  (_DWORD)v10 + 8);
    }
    __int16 v21 = *(_BYTE **)(a1 + 656);
    for (unint64_t i = v21; v21 == (_BYTE *)-256LL; i += v24 + 1)
    {
      if (!i) {
        goto LABEL_36;
      }
LABEL_32:
      uint64_t v24 = *i;
      if (v24 > 0x3F)
      {
LABEL_36:
        unsigned __int16 v23 = 257;
        goto LABEL_38;
      }

      if (!*i)
      {
        unsigned __int16 v23 = (_WORD)i - (_WORD)v21 + 1;
        goto LABEL_38;
      }
    }

    unsigned __int16 v23 = 257;
    if (i < v21 + 256 && i) {
      goto LABEL_32;
    }
LABEL_38:
    int v25 = v23 - 1;
    int v26 = v10 + 1;
    if (v10 != (uint64_t *)-264LL)
    {
LABEL_39:
      unsigned __int16 v27 = 257;
      if (v26 >= (_BYTE *)v10 + 264 || !v26) {
        goto LABEL_49;
      }
      goto LABEL_43;
    }

    while (v26)
    {
LABEL_43:
      uint64_t v28 = *v26;
      if (!*v26)
      {
        unsigned __int16 v27 = (_WORD)v26 - (_WORD)v14 + 1;
        goto LABEL_49;
      }

      v26 += v28 + 1;
    }

    unsigned __int16 v27 = 257;
LABEL_49:
    if (v25 + v27 < 257) {
      return v14;
    }
    int v9 = *(_DWORD *)(a1 + 692);
    unsigned int v10 = &SearchList;
  }

  LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "uDNS_GetNextSearchDomain: count %d less than zero",  a4,  a5,  a6,  a7,  a8,  v9);
LABEL_52:
  unsigned int v14 = 0LL;
  *(_DWORD *)(a1 + 692) = -1;
  return v14;
}

uint64_t QueryRecordOpRestartUnicastQuestion(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *(void *)(a2 + 136) = *(void *)(a1 + 664);
  int v6 = *(_BYTE **)(a1 + 656);
  int v7 = v6;
  if (v6 == (_BYTE *)-256LL)
  {
LABEL_3:
    while (v7)
    {
      uint64_t v8 = *v7;
      if (!*v7)
      {
        unsigned __int16 v9 = (_WORD)v7 - (_WORD)v6 + 1;
        if (v9 > 0x100u) {
          break;
        }
        memcpy((void *)(a2 + 356), v6, v9);
        if (a3) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }

      v7 += v8 + 1;
      if (v6 != (_BYTE *)-256LL) {
        goto LABEL_2;
      }
    }
  }

  else
  {
LABEL_2:
    if (v7 < v6 + 256) {
      goto LABEL_3;
    }
  }

  *(_BYTE *)(a2 + 356) = 0;
  if (a3) {
LABEL_12:
  }
    AppendDomainName((_BYTE *)(a2 + 356), a3);
LABEL_13:
  uint64_t v10 = a2 + 356;
  unsigned int v11 = *(unsigned __int8 *)(a2 + 356);
  if (*(_BYTE *)(a2 + 356))
  {
    do
    {
      uint64_t v12 = v10;
      uint64_t v13 = v10 + v11;
      unsigned int v14 = *(unsigned __int8 *)(v13 + 1);
      uint64_t v10 = v13 + 1;
      unsigned int v11 = v14;
    }

    while (v14);
  }

  else
  {
    uint64_t v12 = a2 + 356;
  }

  *(_BYTE *)(a2 + 61_Block_object_dispose((const void *)(v1 - 176), 8) = SameDomainLabelPointer(v12, "\x05local") != 0;
  return QueryRecordOpStartQuestion(a1, a2);
}

void QueryRecordOpStopQuestion(uint64_t a1)
{
  *(void *)(a1 + 176) = 0LL;
}

BOOL GetAddrInfoClientRequestIsMulticast(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  BOOL result = 1;
  if (!v1 || *(_WORD *)(v1 + 320) || *(int *)(v1 + 212) <= 0)
  {
    uint64_t v2 = *(void *)(a1 + 24);
  }

  return result;
}

uint64_t QueryRecordClientRequestStart( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a2 + 68))
  {
    uint64_t v12 = *(void *)(a2 + 72);
    uint64_t RecordOpStart = 4294901741LL;
    if (!v12) {
      goto LABEL_8;
    }
    unsigned int v14 = (void *)xpc_copy_entitlement_for_token("com.apple.private.dnssd.resolver-override", v12 + 24);
    if (!v14) {
      goto LABEL_8;
    }
    int v15 = v14;
    xpc_release(v14);
    if (v15 != &_xpc_BOOL_true) {
      goto LABEL_8;
    }
    uint64_t v16 = *(void *)(a2 + 48);
    if (!v16)
    {
      uint64_t RecordOpStart = 4294901756LL;
      goto LABEL_8;
    }

    Querier_RegisterPathResolver(v16);
  }

  uint64_t v30 = 0LL;
  uint64_t RecordOpStart = InterfaceIndexToInterfaceID(*(_DWORD *)(a2 + 16), &v30, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)RecordOpStart)
  {
LABEL_8:
    QueryRecordClientRequestStop(a1, a2, a3, a4, a5, a6, a7, a8, v29);
    return RecordOpStart;
  }

  uint64_t v18 = *(unsigned __int8 **)(a2 + 8);
  v36[0] = 0;
  if (!AppendDNSNameString(v36, v18, a3, a4, a5, a6, a7, a8))
  {
    uint64_t RecordOpStart = 4294901756LL;
    unsigned __int16 v23 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
    }

    else
    {
      unsigned __int16 v23 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
    }

    int v25 = *(_DWORD *)a2;
    uint64_t v26 = *(void *)(a2 + 8);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&uint8_t buf[4] = v25;
    *(_WORD *)&uint8_t buf[8] = 2160;
    *(void *)&buf[10] = 1752392040LL;
    *(_WORD *)&buf[18] = 2085;
    *(void *)&buf[20] = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[R%u] ERROR: bad domain name '%{sensitive, mask.hash}s'",  buf,  0x1Cu);
    goto LABEL_8;
  }

  int v19 = *(unsigned __int16 *)(a2 + 24);
  if (v19 != 28 && v19 != 1) {
    goto LABEL_33;
  }
  char v20 = 0;
  __int16 v21 = *(_BYTE **)(a2 + 8);
  while (1)
  {
    int v22 = *v21++;
    if (v22 == 46) {
      break;
    }
    if (v22 == 92)
    {
      ++v20;
    }

    else
    {
      if (!*(v21 - 1)) {
        goto LABEL_27;
      }
LABEL_19:
      char v20 = 0;
    }
  }

  if (*v21) {
    goto LABEL_19;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_27:
  if (AlwaysAppendSearchDomains || v36[0] && !v36[v36[0] + 1]) {
    char v24 = 1;
  }
  else {
LABEL_33:
  }
    char v24 = 0;
  memset(buf, 0, sizeof(buf));
  memset(v35, 0, sizeof(v35));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v32 = 0u;
  *(_DWORD *)buf = *(_DWORD *)a2;
  *(void *)&uint8_t buf[8] = v36;
  int v27 = *(_DWORD *)(a2 + 20);
  LODWORD(v32) = -1;
  DWORD1(v32) = v27;
  *(_WORD *)&uint8_t buf[16] = v19;
  *(_WORD *)&buf[18] = *(_WORD *)(a2 + 26);
  *(void *)&_BYTE buf[24] = v30;
  BYTE8(v32) = v24;
  HIDWORD(v32) = *(_DWORD *)(a2 + 28);
  *(void *)&__int128 v33 = *(void *)(a2 + 32);
  DWORD2(v33) = *(_DWORD *)(a2 + 40);
  uint64_t v28 = *(void *)(a2 + 56);
  *(void *)&__int128 v34 = *(void *)(a2 + 48);
  *((void *)&v34 + 1) = v28;
  LODWORD(v35[0]) = *(_DWORD *)(a2 + 64);
  BYTE4(v35[0]) = *(_BYTE *)(a2 + 68);
  *(_OWORD *)((char *)v35 + _Block_object_dispose((const void *)(v1 - 176), 8) = *(_OWORD *)(a2 + 72);
  WORD6(v33) = *(_WORD *)(a2 + 88);
  BYTE8(v35[1]) = *(_BYTE *)(a2 + 90);
  uint64_t RecordOpStart = QueryRecordOpStart(a1, (uint64_t)buf, a3, a4);
  if ((_DWORD)RecordOpStart) {
    goto LABEL_8;
  }
  return RecordOpStart;
}

void QueryRecordClientRequestStop( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (*(_BYTE *)(a1 + 718))
  {
    int v16 = *(unsigned __int16 *)(a1 + 322);
    if (v16 == 1) {
      uint64_t v17 = a1;
    }
    else {
      uint64_t v17 = 0LL;
    }
    if (v16 == 28) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = 0LL;
    }
    mDNSPlatformTriggerDNSRetry(v17, v18, v10, v11, v12, v13, v14, v15, a9);
  }

uint64_t DNSProxyStartHandler(const void *a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = gProxyManager;
  if (gProxyManager) {
    goto LABEL_16;
  }
  uint64_t v11 = _os_object_alloc(&OBJC_CLASS___OS_mrcs_dns_proxy_manager, 32LL);
  if (!v11)
  {
    gProxyManager = 0LL;
    uint64_t v23 = 4294960568LL;
    goto LABEL_42;
  }

  int v19 = (void *)v11;
  char v20 = &_mrcs_dns_proxy_manager_kind;
  *(void *)(v11 + 16) = &_mrcs_dns_proxy_manager_kind;
  do
  {
    __int16 v21 = (void (*)(void *))v20[2];
    if (v21) {
      v21(v19);
    }
    char v20 = (_UNKNOWN **)*v20;
  }

  while (v20);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mrcs_cfarray_callbacks);
  v19[3] = Mutable;
  if (Mutable) {
    uint64_t v10 = (uint64_t)v19;
  }
  else {
    uint64_t v10 = 0LL;
  }
  if (Mutable) {
    uint64_t v23 = 0LL;
  }
  else {
    uint64_t v23 = 4294960567LL;
  }
  if (!Mutable) {
    os_release(v19);
  }
  gProxyManager = v10;
  if (!(_DWORD)v23)
  {
LABEL_16:
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v10 + 24));
    uint64_t v25 = gProxyManager;
    uint64_t v26 = *(const __CFArray **)(gProxyManager + 24);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 0x40000000LL;
    v60[2] = ___mrcs_dns_proxy_manager_conflicts_with_proxy_block_invoke;
    v60[3] = &__block_descriptor_tmp_17_4055;
    v60[4] = a1;
    if (mdns_cfarray_enumerate(v26, (uint64_t)v60))
    {
      CFArrayAppendValue(*(CFMutableArrayRef *)(v25 + 24), a1);
      uint64_t v23 = 0LL;
      if (Count) {
        goto LABEL_42;
      }
    }

    else
    {
      uint64_t v23 = 4294960537LL;
      if (Count) {
        goto LABEL_42;
      }
    }

    if (CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
    {
      int v27 = socket(2, 2, 17);
      int v28 = socket(30, 2, 17);
      int v29 = socket(2, 1, 6);
      int v30 = socket(30, 1, 6);
      int v31 = v30;
      if (v27 < 0 || v28 < 0 || v29 < 0 || v30 < 0)
      {
        if ((v27 & 0x80000000) == 0) {
          close(v27);
        }
        if ((v28 & 0x80000000) == 0) {
          close(v28);
        }
        if ((v29 & 0x80000000) == 0) {
          close(v29);
        }
        if ((v31 & 0x80000000) == 0) {
          close(v31);
        }
      }

      BindDPSocket(v27, 2, 2);
      BindDPSocket(v28, 30, 2);
      BindDPSocket(v29, 2, 1);
      BindDPSocket(v31, 30, 1);
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "mDNSPlatformInitDNSProxySkts: Opened Listener Sockets for DNS Proxy : %d, %d, %d, %d",  v32,  v33,  v34,  v35,  v36,  v27);
      }
      uint64_t v37 = mDNSStorage[0];
      *(void *)(mDNSStorage[0] + 976) = ProxyUDPCallback;
      *(void *)(v37 + 984) = ProxyTCPCallback;
      *(_WORD *)(v37 + 704) = 13568;
      *(void *)(v37 + 872) = mDNSStorage;
      *(_WORD *)(v37 + 800) = 13568;
      *(void *)(v37 + 960) = mDNSStorage;
      *(_WORD *)(v37 + 88_Block_object_dispose((const void *)(v1 - 176), 8) = 13568;
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupDNSProxySkts: %d, %d, %d, %d",  v32,  v33,  v34,  v35,  v36,  v27);
      *(_BYTE *)(v37 + 792) = 1;
      if (SetupUDPProxySocket(v27, (void *)(v37 + 704), 2, v38, v39, v40, v41, v42)) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupDNSProxySkts: ERROR!! UDPv4 Socket",  v43,  v44,  v45,  v46,  v47,  v59);
      }
      if (SetupUDPProxySocket(v28, (void *)(v37 + 704), 30, v43, v44, v45, v46, v47)) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupDNSProxySkts: ERROR!! UDPv6 Socket",  v48,  v49,  v50,  v51,  v52,  v59);
      }
      if (SetupTCPProxySocket(v29, v37 + 800)) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupDNSProxySkts: ERROR!! TCPv4 Socket",  v53,  v54,  v55,  v56,  v57,  v59);
      }
      if (SetupTCPProxySocket(v31, v37 + 888)) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupDNSProxySkts: ERROR!! TCPv6 Socket",  v14,  v15,  v16,  v17,  v18,  v59);
      }
      dp_listener = v27;
      unk_100158B20 = v28;
      dword_100158B24 = v29;
      unk_100158B28 = v31;
    }
  }

uint64_t DNSProxyStopHandler(const void *a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  if (gProxyManager)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    uint64_t v18 = gProxyManager;
    CFIndex v19 = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    if (v19 < 1)
    {
LABEL_6:
      uint64_t v22 = 4294960569LL;
    }

    else
    {
      CFIndex v20 = v19;
      CFIndex v21 = 0LL;
      while (CFArrayGetValueAtIndex(*(CFArrayRef *)(v18 + 24), v21) != a1)
      {
        if (v20 == ++v21) {
          goto LABEL_6;
        }
      }

      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v18 + 24), v21);
      if (Count)
      {
        if (!CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
        {
          for (uint64_t i = 0LL; i != 4; ++i)
            close(dp_listener[i]);
          if (mDNS_LoggingEnabled == 1) {
            LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "mDNSPlatformCloseDNSProxySkts: Closing DNS Proxy Listener Sockets",  v12,  v13,  v14,  v15,  v16,  v25);
          }
        }
      }

      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v22 = 4294901754LL;
  }

  KQueueUnlock((uint64_t)"DNSProxyStopHandler", v10, v11, v12, v13, v14, v15, v16);
  return v22;
}

char *DNSProxyGetStateHandler()
{
  uint64_t v0 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v0, v1, v2, v3, v4, v5, v6, v7);
  if (gProxyManager && CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
  {
    uint64_t v15 = (void *)(gProxyManager + 16);
    while (1)
    {
      uint64_t v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_9;
      }
      uint64_t v16 = (uint64_t (*)(void))v15[3];
      if (v16)
      {
        uint64_t v17 = (char *)v16();
        goto LABEL_10;
      }
    }
  }

  uint64_t v17 = strdup("‹No DNS Proxies›");
  if (!v17)
  {
    __break(1u);
LABEL_9:
    uint64_t v17 = 0LL;
  }

void ProxyUDPCallback( unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10 = a5;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyUDPCallback: DNS Message from %#a:%d to %#a:%d length %d",  (uint64_t)a4,  a5,  a6,  a7,  a8,  (int)a4);
  }
  ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 0LL, a9);
}

void ProxyTCPCallback( unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10 = a5;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPCallback: DNS Message from %#a:%d to %#a:%d length %d",  (uint64_t)a4,  a5,  a6,  a7,  a8,  (int)a4);
  }
  if ((unsigned __int8 *)a3 != a2
    && gProxyManager
    && mrcs_dns_proxy_manager_get_proxy_by_input_interface(*(const __CFArray **)(gProxyManager + 24), a8))
  {
    ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 1LL, a9);
  }

  else
  {
    uint64_t v15 = &DNSProxyClients;
    uint64_t v16 = &DNSProxyClients;
    do
    {
      uint64_t v17 = v16;
      uint64_t v16 = v15;
      uint64_t v15 = (uint64_t *)*v15;
      if (!v15)
      {
        mDNSPlatformDisposeProxyContext(a1);
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPCallback: socket cannot be found",  v18,  v19,  v20,  v21,  v22,  (int)a9);
        return;
      }
    }

    while ((unsigned __int16 *)v15[5] != a1);
    *uint64_t v17 = *v15;
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPCallback: free",  (uint64_t)a4,  a5,  a6,  a7,  a8,  v23);
    }
    mDNSPlatformDisposeProxyContext(a1);
    FreeDNSProxyClient((void *)*v16);
  }

void FreeDNSProxyClient(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)a1[127];
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)a1[128];
  if (v4) {
    os_release(v4);
  }
  free(a1);
}

void ProxyCallbackCommon( unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8)
{
  if (!gProxyManager
    || (int v10 = a7,
        unsigned __int16 v11 = a5,
        (uint64_t proxy_by_input_interface = mrcs_dns_proxy_manager_get_proxy_by_input_interface( *(const __CFArray **)(gProxyManager + 24),  a6)) == 0))
  {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyCallbackCommon: Rejecting DNS Query coming from InterfaceID %p",  (uint64_t)a4,  a5,  a6,  a7,  (uint64_t)a8,  a6);
    return;
  }

  if ((((_DWORD)a3 - (_DWORD)a2) & 0xFFFFFFFC) >= 0xCuLL)
  {
    unsigned int v17 = __rev16(*((unsigned __int16 *)a2 + 2));
    *((_WORD *)a2 + 2) = v17;
    unsigned int v18 = __rev16(*((unsigned __int16 *)a2 + 3));
    *((_WORD *)a2 + 3) = v18;
    unsigned int v19 = __rev16(*((unsigned __int16 *)a2 + 4));
    *((_WORD *)a2 + 4) = v19;
    *((_WORD *)a2 + 5) = bswap32(*((unsigned __int16 *)a2 + 5)) >> 16;
    if ((a2[2] & 0xF8) != 0)
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyCallbackCommon: Not a query(%d) for pkt from %#a:%d",  (uint64_t)a4,  a5,  a6,  a7,  (uint64_t)a8,  a2[2] & 0xF8);
      }
      unsigned __int16 v20 = v11;
      char v21 = 4;
      goto LABEL_25;
    }

    if (v17 != 1 || v18 || v19)
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyCallbackCommon: Malformed pkt from %#a:%d, Q:%d, An:%d, Au:%d",  (uint64_t)a4,  a5,  a6,  a7,  (uint64_t)a8,  (int)a4);
      }
    }

    else
    {
      uint64_t v22 = (void *)proxy_by_input_interface;
      bzero(v97, 0x290uLL);
      if (getQuestion((unint64_t)a2, a2 + 12, a3, a6, v97))
      {
        if (mDNS_LoggingEnabled)
        {
          __int16 v92 = (os_log_s *)mDNSLogCategory_Default;
          DNSTypeName(v98);
          LogMsgWithLevel( v92,  OS_LOG_TYPE_DEFAULT,  "ProxyCallbackCommon: Question %##s (%s)",  v28,  v29,  v30,  v31,  v32,  (int)v100);
        }

        OptRR = LocateOptRR((unint64_t)a2, a3, 0);
        uint64_t v93 = OptRR;
        if (OptRR)
        {
          unint64_t v34 = a3;
          int v35 = (int)OptRR;
          uint64_t v36 = skipResourceRecord((unint64_t)a2, OptRR, v34);
          if (v36)
          {
            unsigned int v91 = (_DWORD)v36 - v35;
            if (mDNS_LoggingEnabled == 1)
            {
              int v90 = (os_log_s *)mDNSLogCategory_Default;
              int v42 = (_DWORD)v36 - v35;
              DNSTypeName(v98);
              LogMsgWithLevel( v90,  OS_LOG_TYPE_DEFAULT,  "ProxyCallbackCommon: EDNS0 opt length %u present in Question %##s (%s)",  v43,  v44,  v45,  v46,  v47,  v42);
            }

void SendError( unsigned __int16 *a1, uint64_t a2, int a3, int *a4, unsigned __int16 a5, uint64_t a6, int a7, _DWORD *a8, char a9)
{
  else {
    int v15 = a3 - a2;
  }
  int v16 = *(_DWORD *)(a2 + 8);
  qword_10015FCA0 = *(void *)a2;
  dword_10015FCA8 = v16;
  BYTE2(qword_10015FCA0) |= 0x80u;
  BYTE3(qword_10015FCA0) = a9;
  memcpy(&unk_10015FCAC, (const void *)(a2 + 12), (v15 - 12));
  unsigned int v17 = (char *)&qword_10015FCA0 + v15;
  if (a7) {
    mDNSSendDNSMessage( (uint64_t)mDNSStorage,  (unint64_t)mDNSStorage + &loc_1000070E8,  (unint64_t)v17,  a6,  a1,  0LL,  a4,  a5,  0LL,  0);
  }
  else {
    mDNSSendDNSMessage( (uint64_t)mDNSStorage,  (unint64_t)mDNSStorage + &loc_1000070E8,  (unint64_t)v17,  a6,  0LL,  a1,  a4,  a5,  0LL,  0);
  }
  mDNSPlatformDisposeProxyContext(a8);
}

void DNSProxyPrepareOmsg(unsigned int a1, uint64_t a2)
{
  __int16 v3 = a1;
  size_t v4 = a1 + 12LL;
  uint64_t v5 = *(void *)(a2 + 1016);
  uint64_t v6 = (char *)calloc(1uLL, v4);
  if (v6)
  {
    uint64_t v12 = v6;
    if (v5)
    {
      uint64_t v13 = *(const void **)(a2 + 1016);
      uint64_t v5 = *(void *)(a2 + 1000) - (void)v13 - 12LL;
      if (mDNS_LoggingEnabled == 1)
      {
        LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "DNSProxyPrepareOmsg: Preserving offset %ld in size %d",  v7,  v8,  v9,  v10,  v11,  *(_DWORD *)(a2 + 1000) - (_DWORD)v13 - 12);
        uint64_t v13 = *(const void **)(a2 + 1016);
      }

      else {
        size_t v14 = *(unsigned __int16 *)(a2 + 1008) + 12LL;
      }
      memcpy(v12, v13, v14);
      int v15 = *(void **)(a2 + 1016);
      if (v15) {
        free(v15);
      }
    }

    *(void *)(a2 + 1016) = v12;
    *(_WORD *)(a2 + 100_Block_object_dispose((const void *)(v1 - 176), 8) = v3;
    *(void *)(a2 + 1000) = &v12[v5 + 12];
  }

  else
  {
    __break(1u);
  }

void ProxyClientCallback( uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a2;
  BOOL v10 = *a3 == 240 || *((unsigned __int16 *)a3 + 2) == *(unsigned __int16 *)(a2 + 322);
  BOOL v157 = v10;
  if (!a4) {
    return;
  }
  uint64_t v11 = *(void *)(a2 + 176);
  if (mDNS_LoggingEnabled == 1)
  {
    uint64_t v12 = (os_log_s *)mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 992));
    LogMsgWithLevel(v12, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: %##s (%s)", v13, v14, v15, v16, v17, v11 + 80);
  }

  int v18 = *(_DWORD *)(v11 + 996);
  if (!*(_BYTE *)(*(void *)(v11 + 1024) + 76LL))
  {
    if (v18 != 4) {
      goto LABEL_17;
    }
LABEL_131:
    uint64_t v126 = *(void *)(v11 + 1016);
    *(_WORD *)uint64_t v126 = *(_WORD *)(v11 + 30);
    *(_WORD *)(v126 + 2) = 896;
    *(void *)(v126 + 4) = 0LL;
    uint64_t v86 = putQuestion( *(void *)(v11 + 1016),  *(void *)(v11 + 1016) + 12LL,  *(void *)(v11 + 1016) + 12LL + *(unsigned __int16 *)(v11 + 1008),  (unsigned __int8 *)(v11 + 80),  *(unsigned __int16 *)(v11 + 992),  *(unsigned __int16 *)(v11 + 660),  a7,  a8);
    if (v86) {
      BOOL v127 = 1;
    }
    else {
      BOOL v127 = mDNS_LoggingEnabled == 0;
    }
    if (!v127)
    {
      uint64_t v128 = (os_log_s *)mDNSLogCategory_Default;
      DNSTypeName(*(unsigned __int16 *)(v11 + 992));
      LogMsgWithLevel( v128,  OS_LOG_TYPE_DEFAULT,  "ProxyClientCallback: putQuestion NULL for %##s (%s)",  v129,  v130,  v131,  v132,  v133,  v11 + 80);
      uint64_t v86 = 0LL;
    }

    goto LABEL_143;
  }

  if (v18 == 4) {
    goto LABEL_131;
  }
  if (v18 == 2)
  {
    if (*a3 != 240 && *(_WORD *)(v8 + 322) == 12 && *((_WORD *)a3 + 2) == 12 && *((_WORD *)a3 + 3) == 1)
    {
      *(_DWORD *)(v11 + 996) = 3;
      goto LABEL_17;
    }

    *(_DWORD *)(v11 + 996) = 4;
    goto LABEL_131;
  }

  if (!v18 && *a3 == 240 && *(_WORD *)(v8 + 322) == 28 && *((_WORD *)a3 + 2) == 28 && *((_WORD *)a3 + 3) == 1)
  {
    mDNS_StopQuery((unsigned int *)a1, v8);
    *(_DWORD *)(v11 + 996) = 1;
    *(_WORD *)(v8 + 322) = 1;
    mDNS_StartQuery((unsigned int *)a1, v8);
    return;
  }

LABEL_143:
    unint64_t v134 = *(void *)(v11 + 1016);
    uint64_t v135 = *(void *)(v11 + 32);
    __int16 v136 = *(unsigned __int16 **)(v11 + 40);
    uint64_t v137 = (int *)(v11 + 8);
    unsigned __int16 v138 = *(_WORD *)(v11 + 28);
    if (*(_BYTE *)(v11 + 48)) {
      mDNSSendDNSMessage(a1, v134, (unint64_t)v86, v135, v136, 0LL, v137, v138, 0LL, 0);
    }
    else {
      mDNSSendDNSMessage(a1, v134, (unint64_t)v86, v135, 0LL, v136, v137, v138, 0LL, 0);
    }
    goto LABEL_146;
  }

  if (mDNS_LoggingEnabled == 1)
  {
    uint64_t v120 = (os_log_s *)mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 992));
    LogMsgWithLevel( v120,  OS_LOG_TYPE_DEFAULT,  "ProxyClientCallback: putQuestion NULL for %##s (%s)",  v121,  v122,  v123,  v124,  v125,  (int)v19);
  }

                  *(_DWORD *)buf = 67109891;
                  uint64_t v58 = v52;
                  uint64_t v59 = 2160;
                  *(void *)uint64_t v60 = 1752392040LL;
                  *(_WORD *)&v60[8] = 1040;
                  *(_DWORD *)&v60[10] = v53;
                  uint64_t v61 = 2101;
                  *(void *)uint64_t v62 = v54;
                  _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "[Q%u] Unable to continue the trust chain validation since DS is self-signed - name: %{sensitive, mas k.hash, mdnsresponder:domain_name}.*P",  buf,  0x22u);
                }
              }

              uint64_t v17 = 0LL;
              uint64_t v9 = -88993;
              goto LABEL_110;
            }
          }

void dnssec_query_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a2 + 144);
  if (!v4 || !*(_BYTE *)(v4 + 24))
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "dns_question_is_primary_dnssec_requestor(question)";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 145;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0LL;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }

  uint64_t v7 = &unk_100164000;
  uint64_t v8 = &unk_100158000;
  uint64_t v9 = &unk_100164000;
  if (!*((void *)a3 + 7))
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "answer->dnssec != NULL";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 155;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0LL;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }

  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = *(void *)(v11 + 64);
  if (*(void *)(v12 + 96) == a2)
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "!_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 156;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0LL;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }

  uint64_t v13 = a1;
  uint64_t v83 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, uint64_t))(v11 + 40);
  int v84 = *(unsigned __int8 *)(v11 + 36);
  uint64_t v14 = *(_DWORD **)(a1 + 19944);
  uint64_t v15 = *(void **)(v11 + 56);
  if (v15 != (void *)v14)
  {
    if (v14) {
      ++*v14;
    }
    if (v15)
    {
      ref_count_obj_release(v15);
      uint64_t v12 = *(void *)(v11 + 64);
    }

    *(void *)(v11 + 56) = v14;
  }

  *(_WORD *)(v12 + 24) = bswap32(*(unsigned __int16 *)(*(void *)(v11 + 24) + 320LL)) >> 16;
  uint64_t v16 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *((void *)a3 + 4);
      if (v22)
      {
        uint64_t v23 = (_BYTE *)*((void *)a3 + 4);
        if (v22 == -256) {
          goto LABEL_31;
        }
LABEL_28:
        unsigned __int16 v24 = 257;
        if ((unint64_t)v23 < v22 + 256 && v23)
        {
          while (1)
          {
            uint64_t v25 = *v23;
            if (v25 > 0x3F)
            {
LABEL_39:
              unsigned __int16 v24 = 257;
              goto LABEL_55;
            }

            if (!*v23) {
              break;
            }
            v23 += v25 + 1;
            if (v22 != -256) {
              goto LABEL_28;
            }
LABEL_31:
            if (!v23) {
              goto LABEL_39;
            }
          }

          unsigned __int16 v24 = (_WORD)v23 - v22 + 1;
        }

void _dnssec_fetch_key_records(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (!*(_DWORD *)(v1 + 48))
  {
    if (dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(*(void *)(v1 + 32), *(void *)(v1 + 40)))
    {
      if (!*(_DWORD *)(v1 + 112)) {
        dnssec_obj_validation_manager_start_insecure_validation(v1, a1);
      }
      return;
    }

    int v55 = 0;
    if (!*(void *)(v1 + 56) || *(_BYTE *)(v1 + 72))
    {
      *(_DWORD *)buf = 0;
      uint64_t v3 = *(void *)(v1 + 32);
      if (v3 && *(_DWORD *)(v3 + 40) != 3 && *(void *)(v3 + 32))
      {
        uint64_t v4 = dnssec_obj_rrset_copy_signer_name(v3, (int *)buf);
        int v5 = *(_DWORD *)buf;
        if (*(_DWORD *)buf && *(_DWORD *)buf != -6727)
        {
          uint64_t v6 = 0LL;
          uint64_t v7 = 0LL;
LABEL_27:
          int v55 = v5;
          if (v4) {
            ref_count_obj_release(v4);
          }
          if (v7) {
            ref_count_obj_release(v7);
          }
          int v9 = v55;
          if (v55)
          {
            uint64_t v17 = 0LL;
            goto LABEL_115;
          }

          uint64_t v10 = *(void *)(v1 + 32);
          if (!v10) {
            goto LABEL_40;
          }
          if (dnssec_obj_rrset_get_rr_type(v10) == 43
            && !ref_count_obj_compare(*(void *)(v1 + 16), v6, 1LL))
          {
            goto LABEL_133;
          }

          uint64_t v11 = *(void *)(v1 + 32);
          if (v11)
          {
            if (dnssec_obj_rrset_is_dnskey(v11)) {
              int v12 = 43;
            }
            else {
              int v12 = 48;
            }
            int rr_class = dnssec_obj_rrset_get_rr_class(*(void *)(v1 + 32));
          }

          else
          {
LABEL_40:
            uint64_t v14 = *(void *)(v1 + 40);
            if (!v14)
            {
              uint64_t v17 = 0LL;
              int v9 = -6745;
              goto LABEL_110;
            }

            int rr_class = dnssec_obj_rrset_get_rr_class(v14);
            int v12 = 48;
          }

          uint64_t v15 = *(void *)(v1 + 56);
          if (!v15 || !*(_BYTE *)(v1 + 72))
          {
            uint64_t v17 = 0LL;
            goto LABEL_75;
          }

          if (*(unsigned __int16 *)(v15 + 322) != v12 || *(unsigned __int16 *)(v15 + 324) != rr_class)
          {
            uint64_t v17 = 0LL;
            int v9 = -6700;
            goto LABEL_110;
          }

          uint64_t v16 = dnssec_obj_domain_name_create_with_labels((unsigned __int8 *)(v15 + 356), 0, &v55);
          uint64_t v17 = v16;
          int v9 = v55;
          if (v55)
          {
LABEL_115:
            *(_DWORD *)(v1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 3;
            *(_DWORD *)(v1 + 52) = v9;
LABEL_116:
            if (!v6) {
              goto LABEL_118;
            }
            goto LABEL_117;
          }

          *(_BYTE *)(v1 + 72) = 0;
          int v18 = ref_count_obj_compare((uint64_t)v16, v6, 1LL);
          char v19 = gSensitiveLoggingEnabled;
          unsigned __int16 v20 = (os_log_s *)mDNSLogCategory_DNSSEC;
          if (mDNSLogCategory_DNSSEC == mDNSLogCategory_State) {
            char v19 = 0;
          }
          if (!v18)
          {
            if ((v19 & 1) != 0)
            {
              uint64_t v23 = mDNSLogCategory_DNSSEC_redacted;
              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
                goto LABEL_125;
              }
              int v24 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                int v25 = *((_DWORD *)v17 + 6);
                uint64_t v26 = *((void *)v17 + 2);
              }

              else
              {
                int v25 = 0;
                uint64_t v26 = 0LL;
              }

              *(_DWORD *)buf = 67110147;
              int v58 = v24;
              __int16 v59 = 2160;
              *(void *)uint64_t v60 = 1752392040LL;
              *(_WORD *)&v60[8] = 1040;
              *(_DWORD *)&v60[10] = v25;
              __int16 v61 = 2101;
              *(void *)os_log_type_t v62 = v26;
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = v12;
              uint64_t v50 = (os_log_s *)v23;
            }

            else
            {
              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
                goto LABEL_125;
              }
              int v27 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                int v28 = *((_DWORD *)v17 + 6);
                uint64_t v29 = *((void *)v17 + 2);
              }

              else
              {
                int v28 = 0;
                uint64_t v29 = 0LL;
              }

              *(_DWORD *)buf = 67110147;
              int v58 = v27;
              __int16 v59 = 2160;
              *(void *)uint64_t v60 = 1752392040LL;
              *(_WORD *)&v60[8] = 1040;
              *(_DWORD *)&v60[10] = v28;
              __int16 v61 = 2101;
              *(void *)os_log_type_t v62 = v29;
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = v12;
              uint64_t v50 = v20;
            }

            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "[Q%u] The existing validation key requestor can still be reused - qname: %{sensitive, mask.hash, mdnsrespo nder:domain_name}.*P, qtype: %{mdns:rrtype}d",  buf,  0x28u);
LABEL_125:
            int v55 = 0;
            if (!v6)
            {
LABEL_118:
              if (v17) {
                ref_count_obj_release(v17);
              }
              return;
            }

LABEL_117:
            ref_count_obj_release((void *)v6);
            goto LABEL_118;
          }

          if ((v19 & 1) != 0)
          {
            unsigned __int16 v20 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
            if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
            {
              if (v6)
              {
                int v21 = *(_DWORD *)(v6 + 24);
                uint64_t v22 = *(void *)(v6 + 16);
              }

              else
              {
                int v21 = 0;
                uint64_t v22 = 0LL;
              }

              int v30 = *(unsigned __int16 *)(v1 + 24);
              if (v17)
              {
                int v31 = *((_DWORD *)v17 + 6);
                uint64_t v32 = *((void *)v17 + 2);
              }

              else
              {
                int v31 = 0;
                uint64_t v32 = 0LL;
              }

void _dnssec_make_validation_progress(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48)) {
    return;
  }
  LODWORD(v106) = 0;
  *(void *)buf = 0LL;
  size_t v107 = 0LL;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *(_DWORD *)(v2 + 40);
    if (v3 != 4 && v3 != 2) {
      goto LABEL_21;
    }
    uint64_t v6 = (uint64_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5)
    {
      if (!*(_DWORD *)(a1 + 112)) {
        goto LABEL_20;
      }
LABEL_18:
      int v9 = 0LL;
      uint64_t v10 = 0LL;
      BOOL v11 = *(void *)(a1 + 88) != 0LL;
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v6 = (uint64_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5)
    {
LABEL_21:
      int v9 = 0LL;
LABEL_22:
      uint64_t v10 = 0LL;
LABEL_23:
      BOOL v11 = 0;
      goto LABEL_24;
    }
  }

  int v7 = *(_DWORD *)(v5 + 40);
  if (v7 != 4 && v7 != 2) {
    goto LABEL_21;
  }
  if (*(_DWORD *)(a1 + 112)) {
    goto LABEL_18;
  }
  if (!v2)
  {
LABEL_34:
    unint64_t v15 = 0LL;
    int v9 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_35;
  }

LABEL_274:
    int v31 = 0LL;
    uint64_t v32 = 0LL;
    int v48 = -6709;
    goto LABEL_107;
  }

void _query_record_with_insecure_validation_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  if (*(void *)(a2 + 144))
  {
    uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "!dns_question_is_dnssec_requestor(question)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&__int128 v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 330;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0LL;
LABEL_27:
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  buf,  0x30u);
    return;
  }

  int v7 = *((unsigned __int16 *)a3 + 2);
  if (v7 != 5 && v7 != 43)
  {
    uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "answer->rrtype == kDNSRecordType_DS || answer->rrtype == kDNSRecordType_CNAME";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&__int128 v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 331;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0LL;
    goto LABEL_27;
  }

  uint64_t v8 = *(void *)(a2 + 176);
  uint64_t v9 = *(void *)(v8 + 64);
  if (!*(_DWORD *)(v9 + 112))
  {
    uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "_insecure_validation_in_progress(dnssec_context)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&__int128 v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 334;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0LL;
    goto LABEL_27;
  }

  if (*(void *)(v9 + 96) != a2)
  {
    uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }

    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&__int128 v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 335;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0LL;
    goto LABEL_27;
  }

  if (v7 == 5) {
    return;
  }
  uint64_t v10 = *(void *)(v8 + 24);
  BOOL v11 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    unsigned int v20 = bswap32(*(unsigned __int16 *)(v10 + 320));
    unsigned int v21 = bswap32(*(unsigned __int16 *)(a2 + 320));
    uint64_t v14 = *((void *)a3 + 4);
    if (v14)
    {
      unint64_t v15 = (_BYTE *)*((void *)a3 + 4);
      if (v14 == -256)
      {
LABEL_32:
        while (v15)
        {
          uint64_t v22 = *v15;
          if (!*v15)
          {
            LOWORD(vmemset(v38, 0, 15) = (_WORD)v15 - v14 + 1;
            goto LABEL_48;
          }

          v15 += v22 + 1;
          if (v14 != -256) {
            goto LABEL_31;
          }
        }
      }

      else
      {
LABEL_31:
      }

      LOWORD(vmemset(v38, 0, 15) = 257;
LABEL_48:
      LODWORD(vmemset(v38, 0, 15) = (unsigned __int16)v15;
    }

    else
    {
      LODWORD(vmemset(v38, 0, 15) = 0;
    }

    unsigned int v23 = HIWORD(v20);
    unsigned int v24 = HIWORD(v21);
    BOOL v25 = *a3 != 240;
    uint64_t v26 = *((void *)a3 + 3);
    uint64_t v28 = v26 + 5;
  }

  else
  {
    BOOL v11 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 320));
    unsigned int v13 = bswap32(*(unsigned __int16 *)(a2 + 320));
    uint64_t v14 = *((void *)a3 + 4);
    if (v14)
    {
      unint64_t v15 = (_BYTE *)*((void *)a3 + 4);
      if (v14 == -256)
      {
LABEL_13:
        while (v15)
        {
          uint64_t v16 = *v15;
          if (!*v15)
          {
            LOWORD(vmemset(v38, 0, 15) = (_WORD)v15 - v14 + 1;
            goto LABEL_42;
          }

          v15 += v16 + 1;
          if (v14 != -256) {
            goto LABEL_12;
          }
        }
      }

      else
      {
LABEL_12:
      }

      LOWORD(vmemset(v38, 0, 15) = 257;
LABEL_42:
      LODWORD(vmemset(v38, 0, 15) = (unsigned __int16)v15;
    }

    else
    {
      LODWORD(vmemset(v38, 0, 15) = 0;
    }

    unsigned int v23 = HIWORD(v12);
    unsigned int v24 = HIWORD(v13);
    BOOL v25 = *a3 != 240;
    uint64_t v26 = *((void *)a3 + 3);
    uint64_t v27 = v26 + 5;
  }

  int v29 = a3[2];
  int v30 = *((_DWORD *)a3 + 2);
  *(_DWORD *)buf = 67111427;
  *(_DWORD *)BOOL v73 = v23;
  *(_WORD *)&v73[4] = 1024;
  *(_DWORD *)&v73[6] = v24;
  *(_WORD *)&v73[10] = 2160;
  *(void *)&v73[12] = 1752392040LL;
  LOWORD(v74) = 1040;
  *(_DWORD *)((char *)&v74 + 2) = (_DWORD)v15;
  WORD3(v74) = 2101;
  *((void *)&v74 + 1) = v14;
  LOWORD(v75) = 1024;
  *(_DWORD *)((char *)&v75 + 2) = v25;
  HIWORD(v75) = 1024;
  int v76 = a4;
  __int16 v77 = 1024;
  int v78 = v26;
  __int16 v79 = 1024;
  int v80 = v29;
  __int16 v81 = 1024;
  int v82 = v30;
  _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[Q%u->SubQ%u] DS denial lookup record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, %{mdns :pos/neg}d, %{mdns:addrmv}d, interface index: %d, mortality: %{mdns:mortality}d, ttl: %u",  buf,  0x46u);
LABEL_53:
  uint64_t v31 = *(void *)(v8 + 64);
  int v70 = 0;
  if (*(_DWORD *)(v31 + 112) != 1)
  {
    uint64_t v33 = 0LL;
    int v60 = 0LL;
    int v63 = 0LL;
    int v47 = -6709;
    goto LABEL_115;
  }

  if (*((void *)a3 + 7) || a4 != 1)
  {
    uint64_t v33 = 0LL;
    goto LABEL_140;
  }

  if (*((_WORD *)a3 + 2) != 43)
  {
    uint64_t v33 = 0LL;
    int v60 = 0LL;
    int v63 = 0LL;
    int v47 = -6756;
    goto LABEL_115;
  }

  uint64_t v32 = *(void *)(v31 + 16);
  uint64_t v33 = *(void *)(v31 + 104);
  if (v33) {
    ++*(_DWORD *)v33;
  }
  if (*a3 == 240)
  {
    uint64_t v34 = *(void *)(v8 + 24);
    if (!ref_count_obj_compare(v32, v33, 1LL) && *(_WORD *)(v34 + 322) == 43)
    {
      size_t v35 = (os_log_s *)mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
        {
          unsigned int v36 = bswap32(*(unsigned __int16 *)(v34 + 320)) >> 16;
          if (v32)
          {
            int v37 = *(_DWORD *)(v32 + 24);
            uint64_t v38 = *(void *)(v32 + 16);
          }

          else
          {
            int v37 = 0;
            uint64_t v38 = 0LL;
          }

          goto LABEL_113;
        }
      }

      else
      {
        size_t v35 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
        {
          unsigned int v36 = bswap32(*(unsigned __int16 *)(v34 + 320)) >> 16;
          if (v32)
          {
            int v37 = *(_DWORD *)(v32 + 24);
            uint64_t v38 = *(void *)(v32 + 16);
          }

          else
          {
            int v37 = 0;
            uint64_t v38 = 0LL;
          }

void _dnssec_query_key_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  int v6 = *((unsigned __int16 *)a3 + 2);
  if (v6 != 5 || *a3 == 240)
  {
    if (*(void *)(a2 + 144))
    {
      if (a4 <= 1)
      {
        uint64_t v7 = *(void *)(a2 + 176);
        if (v6 == 48 || v6 == 43)
        {
          uint64_t v8 = *((void *)a3 + 7);
          if (v8)
          {
            if (dnssec_obj_resource_record_member_get_validation_result(v8) - 3 >= 0xFFFFFFFE)
            {
              int v44 = 0;
              uint64_t v9 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 0, &v44);
              if (v44) {
                goto LABEL_113;
              }
              uint64_t v10 = *(void *)(v7 + 24);
              BOOL v11 = (os_log_s *)mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
                  goto LABEL_21;
                }
                unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 320)) >> 16;
                BOOL v13 = *a3 != 240;
                if (v9)
                {
                  int v14 = *((_DWORD *)v9 + 6);
                  uint64_t v15 = *((void *)v9 + 2);
                }

                else
                {
                  int v14 = 0;
                  uint64_t v15 = 0LL;
                }
              }

              else
              {
                BOOL v11 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
                  goto LABEL_21;
                }
                unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 320)) >> 16;
                BOOL v13 = *a3 != 240;
                if (v9)
                {
                  int v14 = *((_DWORD *)v9 + 6);
                  uint64_t v15 = *((void *)v9 + 2);
                }

                else
                {
                  int v14 = 0;
                  uint64_t v15 = 0LL;
                }
              }

              int v16 = *((unsigned __int16 *)a3 + 2);
              int v17 = *((unsigned __int16 *)a3 + 6);
              *(_DWORD *)buf = 67110915;
              *(_DWORD *)int v46 = v12;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v13;
              LOWORD(v47) = 1024;
              *(_DWORD *)((char *)&v47 + 2) = a4;
              HIWORD(v47) = 2160;
              *(void *)int v48 = 1752392040LL;
              *(_WORD *)&v48[8] = 1040;
              LODWORD(v49) = v14;
              WORD2(v49) = 2101;
              *(void *)((char *)&v49 + 6) = v15;
              HIWORD(v49) = 1024;
              int v50 = v16;
              __int16 v51 = 1024;
              int v52 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[Q%u] DNSSEC secure record changes - %{mdns:pos/neg}d, %{mdns:addrmv}d, qname: %{sensitive, mask.hash, m dnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rd_len: %u.",  buf,  0x3Au);
LABEL_21:
              uint64_t v18 = *(void *)(v7 + 64);
              if (a4)
              {
                if (!*(_DWORD *)(v18 + 112))
                {
                  int v19 = *((unsigned __int16 *)a3 + 2);
                  if (v19 == 43 || v19 == 48)
                  {
                    *(_DWORD *)buf = 0;
                    unsigned int v20 = *(void **)(v18 + 64);
                    if (v20)
                    {
                      unsigned int v21 = 0LL;
                      ++*(_DWORD *)v20;
                    }

                    else
                    {
                      unsigned int v36 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 1, (int *)buf);
                      unsigned int v21 = v36;
                      if (*(_DWORD *)buf)
                      {
                        unsigned int v20 = 0LL;
                        if (!v36)
                        {
LABEL_78:
                          if (v20) {
                            ref_count_obj_release(v20);
                          }
                          int v44 = *(_DWORD *)buf;
                          if (*(_DWORD *)buf)
                          {
                            if (*(_DWORD *)buf != -6730) {
                              goto LABEL_113;
                            }
                            int v37 = (os_log_s *)mDNSLogCategory_DNSSEC;
                            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                            {
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG)) {
                                goto LABEL_113;
                              }
                            }

                            else
                            {
                              int v37 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG)) {
                                goto LABEL_113;
                              }
                            }

                            unsigned int v38 = bswap32(*(unsigned __int16 *)(v10 + 320)) >> 16;
                            *(_DWORD *)buf = 67109120;
                            *(_DWORD *)int v46 = v38;
                            int v39 = "[Q%u] Getting duplicate secure record add event due to possible primary DNSSEC question change";
                            goto LABEL_94;
                          }

                          goto LABEL_112;
                        }

uint64_t _dnssec_obj_resource_record_member_compare()
{
  return 2LL;
}

void _dnssec_obj_resource_record_member_finalize(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      ref_count_obj_release(v2);
      *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
    }
  }

_DWORD *_dnssec_obj_resource_record_member_new()
{
  BOOL result = calloc(1uLL, 0x38uLL);
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = &_dnssec_obj_resource_record_member_kind;
    *((void *)result + 1) = &_dnssec_obj_resource_record_member_kind;
    do
    {
      int v3 = (void (*)(_DWORD *))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }

    while (v2);
    ++*v1;
    return v1;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t dnssec_obj_resource_record_member_get_validation_result(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32) == 1) {
    return *(unsigned int *)(a1 + 40);
  }
  uint64_t v2 = (os_log_s *)mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
LABEL_12:
      int v4 = 136447234;
      uint64_t v5 = "me->aware_type == dnssec_aware_rr_validated";
      __int16 v6 = 2082;
      uint64_t v7 = "";
      __int16 v8 = 2082;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_resource_record_member.c";
      __int16 v10 = 1024;
      int v11 = 210;
      __int16 v12 = 2048;
      uint64_t v13 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v4,  0x30u);
      return 0LL;
    }
  }

  else
  {
    uint64_t v2 = (os_log_s *)mDNSLogCategory_DNSSEC_redacted;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result) {
      goto LABEL_12;
    }
  }

  return result;
}

id _mdns_heuristics_log()
{
  if (_mdns_heuristics_log_s_once != -1) {
    dispatch_once(&_mdns_heuristics_log_s_once, &__block_literal_global_36);
  }
  return (id)_mdns_heuristics_log_s_log;
}

void ___mdns_heuristics_log_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mdns", "heuristics");
  uint64_t v2 = (void *)_mdns_heuristics_log_s_log;
  _mdns_heuristics_log_s_log = (uint64_t)v1;
}

id getHeuristicsQueue()
{
  if (getHeuristicsQueue_onceToken != -1) {
    dispatch_once(&getHeuristicsQueue_onceToken, &__block_literal_global_39);
  }
  return (id)getHeuristicsQueue_queue;
}

void __dns_heuristics_report_resolution_failure_block_invoke(uint64_t a1)
{
  id v2 = _mdns_heuristics_log();
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "dns_heuristics_report_resolution_failure %@ %d",  (uint8_t *)&v7,  0x12u);
  }

  __int16 v6 = objc_autoreleasePoolPush();
  +[DNSHeuristics reportResolutionFailure:isTimeout:]( &OBJC_CLASS___DNSHeuristics,  "reportResolutionFailure:isTimeout:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
  objc_autoreleasePoolPop(v6);
}

void __getHeuristicsQueue_block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("DNSHeuristicsQueue", 0LL);
  id v2 = (void *)getHeuristicsQueue_queue;
  getHeuristicsQueue_queue = (uint64_t)v1;
}

void __dns_heuristics_report_resolution_success_block_invoke(id a1)
{
  id v1 = _mdns_heuristics_log();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "dns_heuristics_report_resolution_success",  v4,  2u);
  }

  int v3 = objc_autoreleasePoolPush();
  +[DNSHeuristics updateHeuristicState:isTimeout:]( &OBJC_CLASS___DNSHeuristics,  "updateHeuristicState:isTimeout:",  1LL,  0LL);
  objc_autoreleasePoolPop(v3);
}

void __mhc_bpf_open_block_invoke(uint64_t a1, xpc_object_t object)
{
  int v5 = *(const void **)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v6 = -1;
    int v7 = -6700;
    goto LABEL_12;
  }

  xpc_object_t v8 = _mdns_xpc_dictionary_get_object(object, "bpf_fd", (const _xpc_type_s *)&_xpc_type_fd);
  if (v8)
  {
    int v9 = xpc_fd_dup(v8);
    if ((v9 & 0x80000000) == 0)
    {
      int v6 = v9;
      int v7 = 0;
      goto LABEL_12;
    }

    int v10 = -6700;
  }

  else
  {
    int v10 = -6712;
  }

  unsigned int int64_limited = _mdns_xpc_dictionary_get_int64_limited( object,  "error",  0xFFFFFFFF80000000LL,  0x7FFFFFFFLL,  0LL);
  else {
    int v7 = v10;
  }
  int v6 = -1;
LABEL_12:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  v14[2] = ___mhc_bpf_open_reply_handler_block_invoke;
  v14[3] = &unk_10013E708;
  v14[4] = _Block_copy(v5);
  int v15 = v6;
  int v16 = v7;
  dispatch_async(v4, v14);
  __int16 v12 = *(dispatch_object_s **)(a1 + 40);
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v13 = *(const void **)(a1 + 32);
  if (v13) {
    _Block_release(v13);
  }
}

void ___mhc_send_message_with_reply_block_invoke(uint64_t a1, xpc_object_t object)
{
}

void _mhc_common_reply_handler( _xpc_connection_s *a1, void *a2, xpc_object_t object, void (**a4)(void, void))
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, "command");
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6404);
    }
    int v9 = (os_log_s *)_mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_ERROR))
    {
      if (!string) {
        string = "<NO COMMAND>";
      }
      *(_DWORD *)buf = 136446722;
      __int16 v12 = string;
      __int16 v13 = 2114;
      int v14 = a1;
      __int16 v15 = 2082;
      int v16 = xpc_dictionary_get_string(object, _xpc_error_key_description);
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s request received error reply -- connection: %{public}@, error: %{public}s",  buf,  0x20u);
    }
  }

  if (object == &_xpc_error_connection_interrupted)
  {
    if (_mhc_queue_s_once != -1) {
      dispatch_once(&_mhc_queue_s_once, &__block_literal_global_12_6401);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = ___mhc_common_reply_handler_block_invoke;
    handler[3] = &unk_10013E6E0;
    void handler[5] = a1;
    handler[6] = a2;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(a1, a2, (dispatch_queue_t)_mhc_queue_s_queue, handler);
  }

  else
  {
    if (a1)
    {
      xpc_connection_cancel(a1);
      xpc_release(a1);
    }

    if (a2) {
      xpc_release(a2);
    }
    if (a4)
    {
      ((void (**)(void, xpc_object_t))a4)[2](a4, object);
      _Block_release(a4);
    }
  }

uint64_t ___mhc_common_reply_handler_block_invoke(uint64_t a1, xpc_object_t object)
{
  return _mhc_common_reply_handler(*(void *)(a1 + 40), *(void *)(a1 + 48), object);
}

void ___mhc_log_block_invoke(id a1)
{
  _mhc_log_s_log = (uint64_t)os_log_create("com.apple.mDNSResponder", "helper_client");
}

void ___mhc_queue_block_invoke(id a1)
{
  _mhc_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mhc", 0LL);
}

void ___mhc_create_connection_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6404);
    }
    uint64_t v4 = (os_log_s *)_mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2082;
      string = xpc_dictionary_get_string(object, _xpc_error_key_description);
      int v6 = "Connection received error event -- connnection: %{public}@, error: %{public}s";
      goto LABEL_11;
    }
  }

  else
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4_6404);
    }
    uint64_t v4 = (os_log_s *)_mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      string = (const char *)object;
      int v6 = "Connection received unexpected event -- connection: %{public}@, event: %@";
LABEL_11:
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0x16u);
    }
  }

void ___mhc_bpf_open_reply_handler_block_invoke(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

void BindDPSocket(int a1, int a2, int a3)
{
  int v26 = 1;
  if (a3 == 1 && setsockopt(a1, 0xFFFF, 4, &v26, 4u))
  {
    int v5 = *__error();
    int v6 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      if (a2 == 2) {
        int v8 = "IPv4";
      }
      else {
        int v8 = "IPv6";
      }
      goto LABEL_22;
    }

    int v6 = (os_log_s *)mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 == 2) {
        int v8 = "IPv4";
      }
      else {
        int v8 = "IPv6";
      }
LABEL_22:
      uint64_t v18 = strerror(v5);
      *(_DWORD *)uint64_t v27 = 136446978;
      *(void *)&v27[4] = v8;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = a1;
      *(_WORD *)&v27[18] = 1024;
      *(_DWORD *)&v27[20] = v5;
      LOWORD(v28[0]) = 2082;
      *(void *)((char *)v28 + 2) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "BindDPSocket: setsockopt SO_REUSEADDR failed for %{public}s %d errno %d (%{public}s)",  v27,  0x22u);
    }
  }

  else if (a2 == 2)
  {
    *(void *)uint64_t v27 = 889192960LL;
    *(void *)&v27[8] = 0LL;
    if (bind(a1, (const sockaddr *)v27, 0x10u))
    {
      uint64_t v9 = (os_log_s *)mDNSLogCategory_Default;
      __error();
      __int16 v10 = __error();
      strerror(*v10);
      LogMsgWithLevel(v9, OS_LOG_TYPE_DEFAULT, "BindDPSocket: bind %d errno %d (%s)", v11, v12, v13, v14, v15, a1);
    }
  }

  else
  {
    if (setsockopt(a1, 41, 27, &v26, 4u) < 0)
    {
      int v16 = "DPFBindSocket: setsockopt IPV6_V6ONLY %d errno %d (%s)";
    }

    else
    {
      *(void *)uint64_t v27 = 889200128LL;
      *(void *)&v27[8] = 0LL;
      v28[0] = 0;
      *(void *)&v27[16] = 0LL;
      if (!bind(a1, (const sockaddr *)v27, 0x1Cu)) {
        return;
      }
      int v16 = "BindDPSocket: bind6 %d errno %d (%s)";
    }

    int v19 = (os_log_s *)mDNSLogCategory_Default;
    __error();
    unsigned int v20 = __error();
    strerror(*v20);
    LogMsgWithLevel(v19, OS_LOG_TYPE_DEFAULT, v16, v21, v22, v23, v24, v25, a1);
  }

uint64_t SetupUDPProxySocket( int a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v53 = 1;
  a2[1] = mDNSStorage;
  a2[10] = 0LL;
  if (a3 == 2) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = 6LL;
  }
  if (a3 == 2) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 7LL;
  }
  if (a3 == 2) {
    uint64_t v12 = a2 + 3;
  }
  else {
    uint64_t v12 = a2 + 7;
  }
  if (a3 != 2)
  {
    if (a3 != 30)
    {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "SetupUDPProxySocket: wrong family %d",  a4,  a5,  a6,  a7,  a8,  a3);
      return 0xFFFFFFFFLL;
    }

    uint64_t v22 = setsockopt(a1, 41, 61, &v53, 4u);
    if ((v22 & 0x80000000) != 0)
    {
      uint64_t v14 = v22;
      int v37 = (os_log_s *)mDNSLogCategory_Default;
      __error();
      unsigned int v38 = __error();
      strerror(*v38);
      LogMsgWithLevel( v37,  OS_LOG_TYPE_DEFAULT,  "SetupUDPProxySocket: IPV6_RECVPKTINFO %d errno %d (%s)",  v39,  v40,  v41,  v42,  v43,  a1);
      return v14;
    }

    uint64_t v14 = setsockopt(a1, 41, 37, &v53, 4u);
    if ((v14 & 0x80000000) != 0)
    {
      int v44 = (os_log_s *)mDNSLogCategory_Default;
      __error();
      __int16 v45 = __error();
      strerror(*v45);
      LogMsgWithLevel( v44,  OS_LOG_TYPE_DEFAULT,  "SetupUDPProxySocket: IPV6_RECVHOPLIMIT %d errno %d (%s)",  v46,  v47,  v48,  v49,  v50,  a1);
      return v14;
    }

uint64_t SetupTCPProxySocket(int a1, uint64_t a2)
{
  uint64_t v4 = listen(a1, 100);
  if ((_DWORD)v4)
  {
    int v5 = (os_log_s *)mDNSLogCategory_Default;
    __error();
    int v6 = __error();
    strerror(*v6);
    LogMsgWithLevel(v5, OS_LOG_TYPE_DEFAULT, "SetupTCPProxySocket: listen %d errno %d (%s)", v7, v8, v9, v10, v11, a1);
  }

  else
  {
    int v12 = fcntl(a1, 3, 0LL);
    fcntl(a1, 4, v12 | 4u);
    *(void *)(a2 + 24) = ProxyTCPAccept;
    *(_DWORD *)(a2 + 16) = a1;
    *(void *)(a2 + 32) = a2;
    *(void *)(a2 + 40) = "TCP Accept";
    *(void *)(a2 + 72) = mDNSStorage;
    KQueueSet(a1, 1u, -1, (void *)(a2 + 24));
  }

  return v4;
}

uint64_t ProxyTCPAccept(int a1, uint64_t a2, uint64_t a3)
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  sockaddr v20 = (sockaddr)0;
  __int128 v21 = 0u;
  int v18 = 1;
  socklen_t v19 = 128;
  int v5 = "ProxyTCPAccept: IP_RECVIF %d errno %d (%s)";
  while (1)
  {
    uint64_t result = accept(a1, &v20, &v19);
    if ((_DWORD)result == -1) {
      return result;
    }
    int v7 = result;
    uint64_t v8 = calloc(1uLL, 0x68uLL);
    if (!v8) {
      __break(1u);
    }
    uint64_t v9 = v8;
    v8[4] = -1;
    *((void *)v8 + 9) = *(void *)(a3 + 72);
    int v10 = fcntl(v7, 3, 0LL);
    fcntl(v7, 4, v10 | 4u);
    if (v20.sa_family == 2)
    {
      if (setsockopt(v7, 0, 20, &v18, 4u)) {
        goto LABEL_10;
      }
    }

    else if (setsockopt(v7, 41, 61, &v18, 4u))
    {
      int v5 = "ProxyTCPAccept: IP_RECVPKTINFO %d errno %d (%s)";
LABEL_10:
      uint64_t v11 = (os_log_s *)mDNSLogCategory_Default;
      __error();
      int v12 = __error();
      strerror(*v12);
      LogMsgWithLevel(v11, OS_LOG_TYPE_DEFAULT, v5, v13, v14, v15, v16, v17, v7);
      mDNSPlatformDisposeProxyContext(v9);
      return close(v7);
    }

    *((void *)v9 + 3) = ProxyTCPSocketCallBack;
    v9[4] = v7;
    *((void *)v9 + 4) = v9;
    *((void *)v9 + 5) = "TCP Proxy packet reception";
    *((_BYTE *)v9 + 65) = 1;
    *((void *)v9 + 9) = *(void *)(a3 + 72);
    KQueueSet(v7, 1u, -1, v9 + 6);
  }

void ProxyTCPSocketCallBack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  memset(v86, 0, sizeof(v86));
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  memset(v79, 0, sizeof(v79));
  memset(v78, 0, 20);
  memset(v77, 0, 20);
  uint64_t v76 = 0LL;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v59 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v54 = 0u;
  memset(v53, 0, sizeof(v53));
  socklen_t v52 = 408;
  LOBYTE(v51) = 0;
  uint64_t v5 = *(unsigned int *)(a3 + 100);
  if (v5 >= 2)
  {
    int v12 = *(char **)(a3 + 88);
    LODWORD(v13) = *(unsigned __int16 *)(a3 + 96);
  }

  else
  {
    ssize_t v6 = mDNSPlatformReadTCP(a3, (void *)(a3 + v5 + 96), 2 - v5, &v51);
    if (v6 < 0 || (_BYTE)v51)
    {
      uint64_t v32 = (os_log_s *)mDNSLogCategory_Default;
      uint64_t v33 = "ProxyTCPRead: attempt to read message length failed";
LABEL_19:
      LogMsgWithLevel(v32, OS_LOG_TYPE_DEFAULT, v33, v7, v8, v9, v10, v11, v44);
      goto LABEL_20;
    }

    LODWORD(v5) = *(_DWORD *)(a3 + 100) + v6;
    *(_DWORD *)(a3 + 100) = v5;
    if (v5 <= 1)
    {
      LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPRead: nread %d, n %d",  v7,  v8,  v9,  v10,  v11,  v5);
      return;
    }

    size_t v13 = __rev16(*(unsigned __int16 *)(a3 + 96));
    *(_WORD *)(a3 + 96) = v13;
    if (v13 <= 0xB)
    {
      uint64_t v32 = (os_log_s *)mDNSLogCategory_Default;
      int v44 = v13;
      uint64_t v33 = "ProxyTCPRead: Message length too short (%d bytes)";
      goto LABEL_19;
    }

    int v12 = (char *)malloc(v13);
    if (!v12) {
      __break(1u);
    }
    *(void *)(a3 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = v12;
  }

  ssize_t v14 = mDNSPlatformReadTCP(a3, &v12[(v5 - 2)], (v13 - (v5 - 2)), &v51);
  if (v14 < 0 || (_BYTE)v51)
  {
    LogMsgWithLevel( (os_log_s *)mDNSLogCategory_Default,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPRead: read failure n %d, closed %d",  v15,  v16,  v17,  v18,  v19,  v14);
LABEL_20:
    mDNSPlatformDisposeProxyContext((_DWORD *)a3);
    return;
  }

  int v20 = *(_DWORD *)(a3 + 100) + v14;
  *(_DWORD *)(a3 + 100) = v20;
  if (v20 - 2 == *(unsigned __int16 *)(a3 + 96))
  {
    KQueueSet(a1, 2u, -1, (void *)(a3 + 24));
    memset(v79, 0, sizeof(v79));
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    memset(v86, 0, sizeof(v86));
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    socklen_t v51 = 128;
    if (getsockname(a1, v79, &v51) < 0)
    {
      uint64_t v34 = (os_log_s *)mDNSLogCategory_Default;
      int v45 = a1;
      __error();
      uint64_t v40 = "ProxyTCPReceive: getsockname(fd=%d) errno %d";
    }

    else
    {
      if ((getpeername(a1, v86, &v51) & 0x80000000) == 0)
      {
        if (getsockopt(a1, 6, 512, v53, &v52))
        {
          __int128 v26 = (os_log_s *)mDNSLogCategory_Default;
          __error();
          LogMsgWithLevel( v26,  OS_LOG_TYPE_DEFAULT,  "ProxyTCPReceive: getsockopt for TCP_INFO failed (fd=%d) errno %d",  v27,  v28,  v29,  v30,  v31,  a1);
          return;
        }

        uint64_t v41 = SHIDWORD(v54);
        if (v86[0].sa_family == 30)
        {
          LODWORD(v78[0]) = 6;
          *(sockaddr *)((char *)v78 + 4) = *(sockaddr *)&v86[0].sa_data[6];
          unsigned int v42 = *(unsigned __int16 *)v86[0].sa_data;
          LODWORD(v77[0]) = 6;
          *(sockaddr *)((char *)v77 + 4) = *(sockaddr *)&v79[0].sa_data[6];
          if ((mDNS_LoggingEnabled & 1) != 0)
          {
            uint64_t v43 = "ProxyTCPReceive received IPv6 packet(len %d) from %#-15a to %#-15a on skt %d %s ifindex %d";
            goto LABEL_34;
          }

void mDNSPlatformDisposeProxyContext(_DWORD *a1)
{
  if (a1)
  {
    int v2 = a1[4];
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      a1[4] = -1;
    }

    int v3 = (void *)*((void *)a1 + 11);
    if (v3) {
      free(v3);
    }
    free(a1);
  }

void __mdns_system_log_block_invoke(id a1)
{
  mdns_system_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "system");
}

const __SCPreferences *_mdns_system_create_locked_prefs(int *a1)
{
  int v2 = SCPreferencesCreateWithAuthorization( kCFAllocatorDefault,  @"com.apple.mDNSResponder",  0LL,  kSCPreferencesUseEntitlementAuthorization);
  if (!v2)
  {
    if (SCError())
    {
      int v3 = SCError();
      if (!v3) {
        goto LABEL_4;
      }
      int v5 = v3;
    }

    else
    {
      int v5 = -6700;
    }

    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6614);
    }
    ssize_t v6 = (os_log_s *)mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "SCPreferencesCreateWithAuthorization failed: %{mdns:err}ld",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v4 = 0LL;
LABEL_23:
    int v2 = 0LL;
    if (!a1) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

uint64_t _mdns_system_commit_and_apply_prefs(const __SCPreferences *a1)
{
  if (!SCPreferencesCommitChanges(a1))
  {
    if (SCError())
    {
      uint64_t v2 = SCError();
      if (!(_DWORD)v2) {
        goto LABEL_4;
      }
      uint64_t v3 = v2;
    }

    else
    {
      uint64_t v3 = 4294960596LL;
    }

    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6614);
    }
    uint64_t v4 = (os_log_s *)mdns_system_log_s_log;
    if (!os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR)) {
      return v3;
    }
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    int v5 = "SCPreferencesCommitChanges failed: %{mdns:err}ld";
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
    return v3;
  }

void _mdns_system_unlock_and_forget_prefs(const __SCPreferences **a1)
{
  id v1 = *a1;
  if (*a1)
  {
    *a1 = 0LL;
    if (!SCPreferencesUnlock(v1))
    {
      if (!SCError())
      {
        int v3 = -6700;
        goto LABEL_7;
      }

      int v2 = SCError();
      if (v2)
      {
        int v3 = v2;
LABEL_7:
        if (mdns_system_log_s_once != -1) {
          dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6614);
        }
        uint64_t v4 = (os_log_s *)mdns_system_log_s_log;
        if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
        {
          int v5 = 134217984;
          uint64_t v6 = v3;
          _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "SCPreferencesUnlock failed: %{mdns:err}ld",  (uint8_t *)&v5,  0xCu);
        }
      }
    }

    CFRelease(v1);
  }

char *mdns_system_interface_index_to_name(unsigned int a1)
{
  *(void *)int v9 = 0LL;
  uint64_t v10 = 0LL;
  char v11 = 0;
  int v2 = if_indextoname(a1, v9);
  if (v2)
  {
    uint64_t result = strdup(v2);
    if (result) {
      return result;
    }
    goto LABEL_6;
  }

  if (!*__error())
  {
LABEL_7:
    int v4 = -6700;
    goto LABEL_8;
  }

  int v4 = *__error();
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

uint64_t mdns_system_pid_to_uuid(int a1, unsigned __int8 *a2)
{
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  if (proc_pidinfo(a1, 17, 1uLL, v4, 56) != 56) {
    return 4294960596LL;
  }
  if (a2) {
    uuid_copy(a2, (const unsigned __int8 *)v4);
  }
  return 0LL;
}

uint64_t mdns_system_pid_to_name(int a1, uint64_t a2)
{
  __int128 v6 = 0u;
  memset(v7, 0, sizeof(v7));
  if (proc_pidinfo(a1, 13, 1uLL, &v6, 64) != 64) {
    return 0LL;
  }
  if (!a2) {
    __break(1u);
  }
  uint64_t v3 = 0LL;
  while (1)
  {
    int v4 = *((unsigned __int8 *)v7 + v3);
    *(_BYTE *)(a2 + v3) = v4;
    if (!v4) {
      break;
    }
    if (++v3 == 15)
    {
      *(_BYTE *)(a2 + memset(v38, 0, 15) = 0;
      return a2;
    }
  }

  return a2;
}

void *_mdns_push_server_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  int v24 = 0;
  __int128 v6 = (void *)mdns_string_builder_create();
  if (!v6)
  {
    char v11 = 0LL;
    goto LABEL_15;
  }

  __int16 v7 = v6;
  if (a2)
  {
    int appended = mdns_string_builder_append_formatted( v6,  "<%s: %p>: ",  *(const char **)(*(void *)(a1 + 16) + 8LL),  (const void *)a1);
    *((_DWORD *)v22 + 6) = appended;
    if (appended) {
      goto LABEL_13;
    }
  }

  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) >= 1)
  {
    v20[0] = 0LL;
    v20[1] = v20;
    v20[2] = 0x2000000000LL;
    v20[3] = "addresses: {";
    int v9 = *(const __CFArray **)(a1 + 64);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 0x40000000LL;
    v18[2] = ___mdns_push_server_copy_description_block_invoke;
    v18[3] = &unk_10013E850;
    v18[5] = v20;
    v18[6] = v7;
    v18[4] = &v21;
    char v19 = a3;
    mdns_cfarray_enumerate(v9, (uint64_t)v18);
    int v10 = mdns_string_builder_append_formatted(v7, "}");
    *((_DWORD *)v22 + 6) = v10;
    _Block_object_dispose(v20, 8);
    char v11 = 0LL;
    if (v10) {
      goto LABEL_14;
    }
  }

  if (*(void *)(a1 + 48))
  {
    int v12 = mdns_string_builder_append_formatted(v7, "srv name: ");
    *((_DWORD *)v22 + 6) = v12;
    if (v12) {
      goto LABEL_13;
    }
    int v13 = mdns_string_builder_append_description(v7, *(void *)(a1 + 48), a3);
    *((_DWORD *)v22 + 6) = v13;
    if (v13) {
      goto LABEL_13;
    }
  }

  int v14 = mdns_string_builder_append_formatted(v7, ", ");
  *((_DWORD *)v22 + 6) = v14;
  if (v14) {
    goto LABEL_13;
  }
  uint64_t v15 = *(const char **)(a1 + 56);
  if (!v15) {
    uint64_t v15 = "";
  }
  int v16 = mdns_string_builder_append_formatted(v7, "interface: %s/%u", v15, *(_DWORD *)(a1 + 96));
  *((_DWORD *)v22 + 6) = v16;
  if (v16) {
LABEL_13:
  }
    char v11 = 0LL;
  else {
    char v11 = mdns_string_builder_copy_string((uint64_t)v7);
  }
LABEL_14:
  os_release(v7);
LABEL_15:
  _Block_object_dispose(&v21, 8);
  return v11;
}

void _mdns_push_server_finalize(void *a1)
{
  int v2 = (void *)a1[6];
  if (v2)
  {
    os_release(v2);
    a1[6] = 0LL;
  }

  uint64_t v3 = (const void *)a1[8];
  if (v3)
  {
    CFRelease(v3);
    a1[8] = 0LL;
  }

  int v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0LL;
  }

  uint64_t v5 = (void *)a1[7];
  if (v5)
  {
    free(v5);
    a1[7] = 0LL;
  }

BOOL ___mdns_push_server_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = mdns_string_builder_append_description_with_prefix( *(void **)(a1 + 48),  *(const char **)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                                 + 24LL),
                                                                  a2,
                                                                  *(_BYTE *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

void *mdns_push_server_create()
{
  uint64_t v0 = _os_object_alloc(&OBJC_CLASS___OS_mdns_push_server, 104LL);
  id v1 = (void *)v0;
  if (v0)
  {
    int v2 = &_mdns_push_server_kind;
    *(void *)(v0 + 16) = &_mdns_push_server_kind;
    do
    {
      uint64_t v3 = (void (*)(void *))v2[2];
      if (v3) {
        v3(v1);
      }
      int v2 = (_UNKNOWN **)*v2;
    }

    while (v2);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
    v1[8] = Mutable;
    if (!Mutable || (CFMutableArrayRef v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks), (v1[9] = v5) == 0LL))
    {
      os_release(v1);
      return 0LL;
    }
  }

  return v1;
}

void mdns_push_server_set_srv_name(uint64_t a1, void *object)
{
  if (!*(_BYTE *)(a1 + 103))
  {
    os_retain(object);
    int v4 = *(void **)(a1 + 48);
    if (v4) {
      os_release(v4);
    }
    *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = object;
  }

void *mdns_push_server_create_subscriber(void *a1)
{
  uint64_t v2 = _os_object_alloc(&OBJC_CLASS___OS_mdns_subscriber, 136LL);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = (void *)v2;
  int v4 = &_mdns_subscriber_kind;
  *(void *)(v2 + 16) = &_mdns_subscriber_kind;
  do
  {
    CFMutableArrayRef v5 = (void (*)(void *))v4[2];
    if (v5) {
      v5(v3);
    }
    int v4 = (_UNKNOWN **)*v4;
  }

  while (v4);
  do
  {
    unint64_t v6 = __ldxr(&mdns_push_server_create_subscriber_s_last_id);
    unint64_t v7 = v6 + 1;
  }

  while (__stxr(v7, &mdns_push_server_create_subscriber_s_last_id));
  v3[15] = v7;
  os_retain(a1);
  uint64_t v8 = (void *)v3[7];
  if (v8) {
    os_release(v8);
  }
  v3[7] = a1;
  if (_mdns_domain_name_get_root_s_once != -1) {
    dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
  }
  uint64_t v9 = _mdns_domain_name_get_root_s_root;
  v3[10] = _mdns_domain_name_get_root_s_root;
  if (v9) {
    int v10 = v3;
  }
  else {
    int v10 = 0LL;
  }
  if (!v9) {
    os_release(v3);
  }
  return v10;
}

void *_mdns_subscriber_copy_description(uint64_t a1, int a2, int a3)
{
  unint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0LL;
  }
  unint64_t v7 = v6;
  if (!a2
    || !mdns_string_builder_append_formatted( v6,  "<%s: %p>: ",  *(const char **)(*(void *)(a1 + 16) + 8LL),  (const void *)a1))
  {
    uint64_t v9 = *(void *)(a1 + 80);
    if (v9)
    {
      if (a3)
      {
        int v10 = (void *)(v9 + 16);
        while (1)
        {
          int v10 = (void *)*v10;
          if (!v10) {
            break;
          }
          char v11 = (uint64_t (*)(void))v10[3];
          if (v11)
          {
            int v12 = (char *)v11();
            goto LABEL_14;
          }
        }

        int v12 = 0LL;
LABEL_14:
        int v13 = "«REDACTED»";
        if (v12) {
          int v13 = v12;
        }
      }

      else
      {
        int v12 = 0LL;
        int v13 = *(const char **)(v9 + 40);
      }
    }

    else
    {
      int v12 = 0LL;
      int v13 = "«NO NAME»";
    }

    int v14 = DNSRecordTypeValueToString(*(unsigned __int16 *)(a1 + 128))
        ? mdns_string_builder_append_formatted(v7, "%s")
        : mdns_string_builder_append_formatted(v7, "TYPE%u");
    int v15 = *(unsigned __int16 *)(a1 + 130);
    int v16 = "ANY";
    if (v15 != 255) {
      int v16 = 0LL;
    }
    if (v15 == 1) {
      int v16 = "IN";
    }
    if (v16
       ? mdns_string_builder_append_formatted(v7, "%s")
       : mdns_string_builder_append_formatted(v7, "CLASS%u"))
    {
LABEL_34:
      uint64_t v8 = 0LL;
      if (!v12) {
        goto LABEL_32;
      }
    }

    else
    {
      uint64_t v8 = mdns_string_builder_copy_string((uint64_t)v7);
      if (!v12) {
        goto LABEL_32;
      }
    }

    free(v12);
    goto LABEL_32;
  }

  uint64_t v8 = 0LL;
LABEL_32:
  os_release(v7);
  return v8;
}

void _mdns_subscriber_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2)
  {
    os_release(v2);
    a1[7] = 0LL;
  }

  uint64_t v3 = (void *)a1[10];
  if (v3)
  {
    os_release(v3);
    a1[10] = 0LL;
  }

  int v4 = a1 + 12;
  do
    CFMutableArrayRef v5 = (const void *)__ldxr(v4);
  while (__stxr(0LL, v4));
  if (v5) {
    CFRelease(v5);
  }
  unint64_t v6 = (const void *)a1[14];
  if (v6)
  {
    CFRelease(v6);
    a1[14] = 0LL;
  }

uint64_t _mdns_subscriber_get_internal_queue()
{
  if (_mdns_push_notifications_queue_s_once != -1) {
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6674);
  }
  return _mdns_push_notifications_queue_s_queue;
}

void _mdns_subscriber_set_query(uint64_t a1, void *object, __int16 a3, __int16 a4)
{
  if (object) {
    os_retain(object);
  }
  uint64_t v8 = *(void **)(a1 + 80);
  if (v8) {
    os_release(v8);
  }
  *(void *)(a1 + 80) = object;
  *(_WORD *)(a1 + 12_Block_object_dispose((const void *)(v1 - 176), 8) = a3;
  *(_WORD *)(a1 + 130) = a4;
}

void _mdns_subscriber_activate(_WORD *object)
{
  uint64_t v2 = *((void *)object + 7);
  uint64_t v45 = 0LL;
  if (!*(void *)(v2 + 40))
  {
    uint64_t v3 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_client_session, 216LL);
    uint64_t v4 = v3;
    if (v3)
    {
      CFMutableArrayRef v5 = &_mdns_dso_client_session_kind;
      *(void *)(v3 + 16) = &_mdns_dso_client_session_kind;
      do
      {
        unint64_t v6 = (void (*)(uint64_t))v5[2];
        if (v6) {
          v6(v4);
        }
        CFMutableArrayRef v5 = (_UNKNOWN **)*v5;
      }

      while (v5);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      *(void *)(v4 + 152) = Mutable;
      if (!Mutable) {
        uint64_t v4 = 0LL;
      }
    }

    if (CFArrayGetCount(*(CFArrayRef *)(v2 + 64)) < 1)
    {
      uint64_t v9 = *(void **)(v2 + 48);
      if (v9 && !*(_BYTE *)(v4 + 124))
      {
        *(void *)(v4 + 136) = v9;
        os_retain(v9);
      }
    }

    else
    {
      uint64_t v8 = *(const __CFArray **)(v2 + 64);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 0x40000000LL;
      v44[2] = ___mdns_push_server_add_subscriber_block_invoke;
      v44[3] = &__block_descriptor_tmp_20_6673;
      v44[4] = v4;
      mdns_cfarray_enumerate(v8, (uint64_t)v44);
    }

    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 72));
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0LL; i != v11; ++i)
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 72), i);
        if (!*(_BYTE *)(v4 + 124))
        {
          int v14 = ValueAtIndex;
          if (*(void *)(v4 + 160)
            || (CFMutableArrayRef v15 = CFArrayCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeArrayCallBacks),
                (*(void *)(v4 + 160) = v15) != 0LL))
          {
            SecCertificateRef v16 = SecCertificateCreateWithData(kCFAllocatorDefault, v14);
            if (v16)
            {
              SecCertificateRef v17 = v16;
              CFArrayAppendValue(*(CFMutableArrayRef *)(v4 + 160), v16);
              CFRelease(v17);
            }
          }
        }
      }
    }

    if (!*(_BYTE *)(v4 + 124)) {
      *(_DWORD *)(v4 + 20_Block_object_dispose((const void *)(v1 - 176), 8) = *(_DWORD *)(v2 + 96);
    }
    if (_mdns_push_notifications_queue_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6674);
    }
    if (!*(_BYTE *)(v4 + 124))
    {
      uint64_t v18 = (dispatch_object_s *)_mdns_push_notifications_queue_s_queue;
      char v19 = *(dispatch_object_s **)(v4 + 48);
      if (v19) {
        dispatch_release(v19);
      }
      *(void *)(v4 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = v18;
      dispatch_retain(v18);
      if (!*(_BYTE *)(v4 + 124))
      {
        *(int32x2_t *)(v4 + 116) = vdup_n_s32(0x3A98u);
        *(_WORD *)(v4 + 212) = 1;
      }
    }

    os_retain((void *)v2);
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000LL;
    aBlock[2] = ___mdns_push_server_add_subscriber_block_invoke_2;
    aBlock[3] = &__block_descriptor_tmp_23_6675;
    aBlock[4] = v2;
    aBlock[5] = v4;
    if (!*(_BYTE *)(v4 + 124))
    {
      int v20 = _Block_copy(aBlock);
      uint64_t v21 = *(const void **)(v4 + 200);
      if (v21) {
        _Block_release(v21);
      }
      *(void *)(v4 + 200) = v20;
    }

    if (*(void *)(v2 + 88) && *(void *)(v2 + 80) && !*(_BYTE *)(v4 + 124)) {
      *(_BYTE *)(v4 + 2memset(v38, 0, 15) = 1;
    }
    *(void *)(v2 + 40) = v4;
    os_retain((void *)v4);
    uint64_t v22 = *(void *)(v2 + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 0x40000000LL;
    v42[2] = ___mdns_push_server_add_subscriber_block_invoke_4;
    v42[3] = &__block_descriptor_tmp_25_6676;
    v42[4] = v2;
    if (!*(_BYTE *)(v22 + 124))
    {
      uint64_t v23 = _Block_copy(v42);
      int v24 = *(const void **)(v22 + 64);
      if (v24) {
        _Block_release(v24);
      }
      *(void *)(v22 + 64) = v23;
      uint64_t v25 = *(void *)(v2 + 40);
      if (!*(_BYTE *)(v25 + 124))
      {
        if (*(void *)(v25 + 48))
        {
          if (*(void *)(v25 + 64))
          {
            uint64_t v26 = *(void *)(v25 + 16);
            if (!(*(unsigned int (**)(void))(v26 + 56))(*(void *)(v2 + 40)))
            {
              if (_mdns_dso_session_log_s_once != -1) {
                dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5889);
              }
              uint64_t v27 = (os_log_s *)_mdns_dso_session_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = *(void *)(v25 + 40);
                *(_DWORD *)buf = 134218242;
                uint64_t v47 = v28;
                __int16 v48 = 2112;
                uint64_t v49 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[DSO%llu] DSO session start -- session: %@",  buf,  0x16u);
              }

              int v29 = (*(uint64_t (**)(uint64_t))(v26 + 48))(v25);
              *(void *)(v25 + 24) = mdns_get_monotonic_time_ns();
              if (!v29) {
                *(_BYTE *)(v25 + 124) = 1;
              }
            }
          }
        }
      }
    }
  }

  _mdns_push_server_send_pending_subscribe_requests(v2);
  if (!v45)
  {
    uint64_t v37 = *(void *)(v2 + 40);
    uint64_t v38 = *((void *)object + 15);
    if (v37)
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6664);
      }
      uint64_t v39 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v40 = *(void *)(v37 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v47 = v38;
      __int16 v48 = 2048;
      uint64_t v49 = v40;
      __int16 v50 = 2112;
      socklen_t v51 = (_WORD *)v2;
      __int16 v52 = 2112;
      int v53 = object;
      uint64_t v34 = "[Sub%llu->DSO%llu] New subscription added to the session -- server: %@, subscriber: %@";
      uint64_t v35 = (os_log_s *)v39;
      uint32_t v36 = 42;
    }

    else
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6664);
      }
      uint64_t v41 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v47 = v38;
      __int16 v48 = 2112;
      uint64_t v49 = v2;
      __int16 v50 = 2112;
      socklen_t v51 = object;
      uint64_t v34 = "[Sub%llu] New subscription added to the session -- server: %@, subscriber: %@";
      uint64_t v35 = (os_log_s *)v41;
      uint32_t v36 = 32;
    }

void _mdns_subscriber_invalidate(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  unsigned __int8 v29 = 0;
  int v3 = _mdns_subscriber_list_remove((uint64_t *)(v2 + 24), (void *)a1, &v29);
  if ((v3 & 1) != 0)
  {
    if (!v29) {
      goto LABEL_15;
    }
  }

  else
  {
    _mdns_subscriber_list_remove((uint64_t *)(v2 + 32), (void *)a1, &v29);
  }

  int v4 = v3 ^ 1;
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t v6 = *(void *)(a1 + 120);
  if (v5)
  {
    if (_mdns_push_notifications_log_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6664);
    }
    uint64_t v7 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v5 + 40);
      int v9 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219522;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&_BYTE buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = (void *)v2;
      *(_WORD *)uint64_t v32 = 2112;
      *(void *)&_DWORD v32[2] = a1;
      *(_WORD *)&v32[10] = 1024;
      *(_DWORD *)uint64_t v33 = v4;
      *(_WORD *)&v33[4] = 1024;
      int v34 = v29;
      __int16 v35 = 1024;
      int v36 = v9;
      int v10 = "[Sub%llu->DSO%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{m"
            "dns:yesno}d, session ready: %{mdns:yesno}d";
      CFIndex v11 = (os_log_s *)v7;
      uint32_t v12 = 60;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }

  else
  {
    if (_mdns_push_notifications_log_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6664);
    }
    uint64_t v13 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&_BYTE buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = (void *)a1;
      *(_WORD *)uint64_t v32 = 1024;
      *(_DWORD *)&_DWORD v32[2] = v4;
      *(_WORD *)&v32[6] = 1024;
      *(_DWORD *)&v32[8] = v29;
      *(_WORD *)uint64_t v33 = 1024;
      *(_DWORD *)&v33[2] = v14;
      int v10 = "[Sub%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{mdns:yesno"
            "}d, session ready: %{mdns:yesno}d";
      CFIndex v11 = (os_log_s *)v13;
      uint32_t v12 = 50;
      goto LABEL_14;
    }
  }

uint64_t _mdns_subscriber_get_name(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t _mdns_subscriber_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 128);
}

uint64_t _mdns_subscriber_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 130);
}

uint64_t _mdns_subscriber_list_remove(uint64_t *a1, void *a2, _BYTE *a3)
{
  uint64_t v4 = *a1;
  if (!*a1) {
    goto LABEL_5;
  }
  uint64_t v6 = a1;
  while ((_mdns_subscriber_equal(v4, (uint64_t)a2) & 1) == 0)
  {
    uint64_t v6 = (uint64_t *)(v4 + 64);
    uint64_t v4 = *(void *)(v4 + 64);
    if (!v4) {
      goto LABEL_5;
    }
  }

  if ((void *)v4 != a2)
  {
    do
    {
      uint64_t v8 = v4;
      uint64_t v4 = *(void *)(v4 + 72);
      if (v4) {
        BOOL v9 = v4 == (void)a2;
      }
      else {
        BOOL v9 = 1;
      }
    }

    while (!v9);
    if (v4)
    {
      *(void *)(v8 + 72) = a2[9];
LABEL_18:
      LOBYTE(v4) = 1;
      goto LABEL_19;
    }

uint64_t ___mdns_subscriber_invalidate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void ___mdns_push_notifications_log_block_invoke(id a1)
{
  _mdns_push_notifications_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "push_notifications");
}

uint64_t _mdns_subscriber_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  if (*(unsigned __int16 *)(a1 + 128) == *(unsigned __int16 *)(a2 + 128)
    && *(unsigned __int16 *)(a1 + 130) == *(unsigned __int16 *)(a2 + 130))
  {
    return _mdns_domain_name_equal(*(void *)(a1 + 80), *(void *)(a2 + 80));
  }

  return 0LL;
}

uint64_t _mdns_subscriber_list_insert_conditionally(uint64_t *a1, _WORD *object, char a3, uint64_t *a4)
{
  uint64_t v7 = *a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v8 = v7;
      uint64_t v7 = *(void *)(v8 + 64);
      if (!v7)
      {
        a1 = (uint64_t *)(v8 + 64);
        goto LABEL_5;
      }
    }

    object[66] = *(_WORD *)(v8 + 132);
    uint64_t v13 = v8;
    do
    {
      uint64_t v14 = v13;
      uint64_t v13 = *(void *)(v13 + 72);
    }

    while (v13);
    a1 = (uint64_t *)(v14 + 72);
    uint64_t v9 = 1LL;
LABEL_12:
    *a1 = (uint64_t)object;
    os_retain(object);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    if (!a4) {
      return v11;
    }
    goto LABEL_7;
  }

uint64_t ___mdns_push_server_add_subscriber_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 124)) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 152), a2);
  }
  return 1LL;
}

void ___mdns_push_server_add_subscriber_block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 40);
  if (v7 == v5)
  {
    switch(a2)
    {
      case 1:
        *(_WORD *)(v6 + 100) = 0;
        uint64_t v8 = *(void **)(v6 + 24);
        if (v8)
        {
          uint64_t v9 = (void *)(v6 + 32);
          do
          {
            uint64_t v10 = v9;
            uint64_t v11 = *v9;
            uint64_t v9 = (void *)(*v9 + 64LL);
          }

          while (v11);
          *uint64_t v10 = v8;
          os_retain(v8);
          uint32_t v12 = *(void **)(v6 + 24);
          if (v12)
          {
            os_release(v12);
            *(void *)(v6 + 24) = 0LL;
          }
        }

        for (uint64_t i = *(void *)(v6 + 32); i; uint64_t i = *(void *)(i + 64))
        {
          uint64_t v14 = i;
          do
          {
            *(_WORD *)(v14 + 132) = 0;
            uint64_t v14 = *(void *)(v14 + 72);
          }

          while (v14);
        }

        goto LABEL_2;
      case 2:
        uint64_t v15 = *(void *)(v6 + 88);
        if (v15)
        {
          SecCertificateRef v16 = *(dispatch_queue_s **)(v6 + 80);
          if (v16)
          {
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 0x40000000LL;
            v17[2] = ___mdns_push_server_add_subscriber_block_invoke_3;
            v17[3] = &unk_10013E8C8;
            v17[4] = v15;
            int v18 = a3;
            dispatch_async(v16, v17);
          }
        }

        break;
      case 3:
        *(_BYTE *)(v6 + 102) = 1;
        _mdns_push_server_send_pending_subscribe_requests(v6);
        break;
      case 4:
        if (v7)
        {
          mdns_dso_session_invalidate(v7);
          os_release(*(void **)(*(void *)(a1 + 32) + 40LL));
          *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
          uint64_t v6 = *(void *)(a1 + 32);
        }

        *(_BYTE *)(v6 + 102) = 0;
        break;
      case 5:
        goto LABEL_4;
      default:
        return;
    }
  }

  else
  {
LABEL_2:
    if (a2 == 5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
LABEL_4:
      os_release((void *)v6);
      os_release(*(void **)(a1 + 40));
    }
  }

void ___mdns_push_server_add_subscriber_block_invoke_4(uint64_t a1, dispatch_data_s *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = mdns_message_create_with_dispatch_data(a2, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (_UNKNOWN **)*((void *)v3 + 2);
    if (!v5) {
      goto LABEL_102;
    }
    uint64_t v6 = (_UNKNOWN **)*((void *)v3 + 2);
    while (v6 != &_mdns_dso_message_kind)
    {
      uint64_t v6 = (_UNKNOWN **)*v6;
      if (!v6) {
        goto LABEL_102;
      }
    }

    if (*((_WORD *)v5 + 28))
    {
      if (*((_WORD *)v5 + 28) == 3)
      {
        while (v5 != (_UNKNOWN **)&_mdns_dso_push_message_kind)
        {
          uint64_t v5 = (_UNKNOWN **)*v5;
          if (!v5)
          {
            uint64_t v7 = 0LL;
            goto LABEL_34;
          }
        }

        uint64_t v7 = v3;
LABEL_34:
        CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
        if (Mutable)
        {
          uint64_t v26 = Mutable;
          __int128 v60 = v2;
          CFMutableSetRef v27 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, (const CFSetCallBacks *)&mdns_domain_name_cf_set_callbacks);
          __int128 v61 = v4;
          if (v27)
          {
            uint64_t v28 = v27;
            int64_t v29 = 0LL;
            unint64_t v30 = *((void *)v7 + 5);
            unint64_t v62 = *((void *)v7 + 4);
            if (v30 < 0xC)
            {
              uint64_t v31 = 0LL;
            }

            else
            {
              uint64_t v31 = 0LL;
              if ((v30 & 0xFFFFFFFFFFFFFFFCLL) != 0xC)
              {
                int64_t v32 = __rev16(*(unsigned __int16 *)(v62 + 14));
                else {
                  uint64_t v31 = 0LL;
                }
                else {
                  int64_t v29 = 0LL;
                }
              }
            }

            uint64_t v33 = &v31[v29];
            handler[0] = v31;
            if (v31 < &v31[v29])
            {
              int v34 = 0LL;
              __int16 v35 = 0LL;
              while (1)
              {
                __int128 v85 = 0u;
                __int128 v86 = 0u;
                __int128 v83 = 0u;
                __int128 v84 = 0u;
                __int128 v81 = 0u;
                __int128 v82 = 0u;
                __int128 v79 = 0u;
                __int128 v80 = 0u;
                __int128 v77 = 0u;
                __int128 v78 = 0u;
                __int128 v75 = 0u;
                __int128 v76 = 0u;
                __int128 v73 = 0u;
                __int128 v74 = 0u;
                memset(buf, 0, sizeof(buf));
                int v70 = 0;
                int v71 = 0;
                __src = 0LL;
                *(void *)__int128 v69 = 0LL;
                if (_DNSMessageExtractRecordEx( v62,  v30,  v31,  (char *)buf,  (_WORD *)&v71 + 1,  &v71,  &v70,  (unsigned __int16 **)&__src,  (unint64_t *)v69,  0LL,  0LL,  0LL,  0LL,  handler)) {
                  break;
                }
                uint64_t v31 = (char *)handler[0];
                if (v70 >= -2)
                {
                  if (v34) {
                    os_release(v34);
                  }
                  int v34 = mdns_domain_name_create_with_labels(buf, 0LL);
                  if (!v34) {
                    break;
                  }
                  Value = (void *)CFSetGetValue(v28, v34);
                  if (!Value)
                  {
                    CFSetAddValue(v28, v34);
                    Value = v34;
                  }

                  uint64_t v37 = v26;
                  if (v35) {
                    free(v35);
                  }
                  unint64_t v38 = *(void *)v69;
                  if (*(void *)v69)
                  {
                    uint64_t v39 = v28;
                    uint64_t v40 = (char *)__src;
                    int v41 = HIWORD(v71);
                    __size[0] = 0LL;
                    if (DNSMessageExtractRData( v62,  v30,  (char *)__src,  *(unint64_t *)v69,  HIWORD(v71),  0LL,  0LL,  0LL,  __size)
                      || !__size[0])
                    {
                      goto LABEL_77;
                    }

                    unsigned int v42 = (char *)calloc(1uLL, __size[0]);
                    if (!v42)
                    {
                      __break(1u);
LABEL_76:
                      free(v35);
LABEL_77:
                      __int16 v35 = 0LL;
                      uint64_t v28 = v39;
                      uint64_t v26 = v37;
                      break;
                    }

                    __int16 v35 = v42;
                    unsigned __int16 v43 = __size[0];
                    uint64_t v28 = v39;
                  }

                  else
                  {
                    unsigned __int16 v43 = 0;
                    __int16 v35 = 0LL;
                  }

                  int v44 = mdns_resource_record_create(Value, SHIWORD(v71), v71, v70, v35, v43);
                  uint64_t v26 = v37;
                  if (!v44) {
                    break;
                  }
                  uint64_t v45 = v44;
                  CFArrayAppendValue(v37, v44);
                  os_release(v45);
                  uint64_t v31 = (char *)handler[0];
                }

                if (v31 >= v33)
                {
                  uint64_t v46 = 0LL;
                  goto LABEL_79;
                }
              }

              uint64_t v46 = v26;
              uint64_t v26 = 0LL;
LABEL_79:
              uint64_t v47 = v60;
              if (v34) {
                os_release(v34);
              }
              CFRelease(v28);
              if (v35) {
                free(v35);
              }
              uint64_t v4 = v61;
              if (!v46)
              {
LABEL_85:
                if (v26)
                {
                  size_t v49 = v47[3];
                  if (v49)
                  {
                    while (1)
                    {
                      __src = 0LL;
                      p_src = &__src;
                      uint64_t v67 = 0x2000000000LL;
                      uint64_t v68 = 0LL;
                      *(void *)buf = _NSConcreteStackBlock;
                      *(void *)&uint8_t buf[8] = 0x40000000LL;
                      *(void *)&uint8_t buf[16] = ___mdns_subscriber_process_change_notifications_block_invoke;
                      *(void *)&_BYTE buf[24] = &unk_10013E930;
                      *(void *)&__int128 v73 = &__src;
                      *((void *)&v73 + 1) = v49;
                      if (mdns_cfarray_enumerate(v26, (uint64_t)buf))
                      {
                        __int16 v50 = p_src;
                        unint64_t v51 = (unint64_t)p_src[3];
                        if (v51)
                        {
                          if (*(void *)(v49 + 88)) {
                            goto LABEL_93;
                          }
                          __int16 v52 = *(dispatch_queue_s **)(v49 + 24);
                          if (!v52) {
                            goto LABEL_93;
                          }
                          dispatch_source_t v53 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  v52);
                          *(void *)(v49 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = v53;
                          if (v53) {
                            break;
                          }
                        }
                      }

void _mdns_push_server_send_pending_subscribe_requests(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 102))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      if (v2)
      {
        uint64_t v3 = 0LL;
        while (1)
        {
          if (*(_WORD *)(v2 + 132)) {
            goto LABEL_36;
          }
          int v4 = *(unsigned __int16 *)(a1 + 100);
          unsigned __int16 v5 = v4 + 1;
          while (v5 < 2u)
          {
LABEL_8:
            if (v4 == ++v5) {
              goto LABEL_37;
            }
          }

          uint64_t v6 = *(void *)(a1 + 24);
          if (v6)
          {
            while (*(unsigned __int16 *)(v6 + 132) != v5)
            {
              uint64_t v6 = *(void *)(v6 + 64);
              if (!v6) {
                goto LABEL_13;
              }
            }

            goto LABEL_8;
          }

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(_DWORD *)(a2 + 40);
  if (v5 < -1)
  {
    if (v5 != -2) {
      return 1LL;
    }
    if (*(_WORD *)(a2 + 56)) {
      return 1LL;
    }
    int v10 = *(unsigned __int16 *)(a2 + 54);
    if (v10 != 255)
    {
      int v11 = *(unsigned __int16 *)(a2 + 52);
    }
  }

  else
  {
    int v6 = *(unsigned __int16 *)(v4 + 130);
    int v8 = *(unsigned __int16 *)(v4 + 128);
    BOOL v9 = v8 == 255 || *(unsigned __int16 *)(a2 + 52) == v8;
    if (!v9 || (_mdns_domain_name_equal(*(void *)(a2 + 24), *(void *)(v4 + 80)) & 1) == 0) {
      return 1LL;
    }
  }

  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result
    || (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreateMutable( kCFAllocatorDefault,  0LL,  (const CFArrayCallBacks *)&mdns_cfarray_callbacks),  (uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) != 0))
  {
    CFArrayAppendValue((CFMutableArrayRef)result, (const void *)a2);
    return 1LL;
  }

  return result;
}

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = (unint64_t *)(*(void *)(result + 32) + 96LL);
  do
    unint64_t v3 = __ldxr(v2);
  while (__stxr(0LL, v2));
  if (v3)
  {
    uint64_t v4 = *(void *)(result + 32);
    int v5 = *(const void **)(v4 + 112);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(*(void *)(v1 + 32) + 112LL) = 0LL;
      uint64_t v4 = *(void *)(v1 + 32);
    }

    *(void *)(v4 + 112) = v3;
    uint64_t result = *(void *)(*(void *)(v1 + 32) + 104LL);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2LL);
    }
  }

  return result;
}

void ___mdns_subscriber_process_change_notifications_block_invoke_3(uint64_t a1)
{
}

uint64_t ___mdns_push_server_add_subscriber_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  1LL,  *(unsigned int *)(a1 + 40));
}

void ___mdns_push_notifications_queue_block_invoke(id a1)
{
  _mdns_push_notifications_queue_s_queue = (uint64_t)dispatch_queue_create( "com.apple.mdns.push-notifications-queue",  0LL);
}

void mdns_push_server_invalidate(_BYTE *a1)
{
  a1[103] = 1;
  os_retain(a1);
  if (_mdns_push_notifications_queue_s_once != -1) {
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35_6674);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __mdns_push_server_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2_6703;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_push_notifications_queue_s_queue, block);
}

void __mdns_push_server_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    mdns_dso_session_invalidate(*(void **)(v2 + 40));
    os_release(*(void **)(*(void *)(a1 + 32) + 40LL));
    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v3 = *(void *)(v2 + 88);
  if (v3)
  {
    uint64_t v4 = *(dispatch_queue_s **)(v2 + 80);
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = __mdns_push_server_invalidate_block_invoke_2;
      block[3] = &unk_10013E7A0;
      block[4] = v3;
      dispatch_async(v4, block);
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  if (*(void *)(v2 + 80))
  {
    dispatch_release(*(dispatch_object_t *)(v2 + 80));
    *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(void *)(v2 + 88))
  {
    _Block_release(*(const void **)(v2 + 88));
    uint64_t v2 = *(void *)(a1 + 32);
    *(void *)(v2 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  }

  os_release((void *)v2);
}

uint64_t __mdns_push_server_invalidate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void mdns_subscriber_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0LL;
    }
    uint64_t v4 = *(const void **)(a1 + 104);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 104) = v3;
  }

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>( unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *a1++;
      unsigned int v4 = v5;
      unsigned int v6 = v5 + 32;
      if (v5 - 65 < 0x1A) {
        unsigned int v4 = v6;
      }
      unsigned int v8 = *a2++;
      unsigned int v7 = v8;
      unsigned int v9 = v8 + 32;
      if (v8 - 65 < 0x1A) {
        unsigned int v7 = v9;
      }
      if (v4 > v7) {
        a4 = 1;
      }
      if (v4 < v7) {
        a4 = -1;
      }
      if (v4 != v7) {
        break;
      }
      if (!--a3) {
        return 0;
      }
    }
  }

  else
  {
    return 0;
  }

  return a4;
}

void mDNSPlatformGetDNSRoutePolicy(uint64_t a1)
{
  *(_DWORD *)(a1 + 280) = -1;
  if (!*(_WORD *)(a1 + 320) || (*(_DWORD *)(a1 + 244) & 0x80000000) != 0) {
    goto LABEL_162;
  }
  bzero(hostname, 0x3F1uLL);
  __int16 v2 = a1 + 356;
  ConvertDomainNameToCString_withescape((unsigned __int8 *)(a1 + 356), (unsigned __int8 *)hostname);
  nw_endpoint_t host = nw_endpoint_create_host(hostname, "0");
  if (host)
  {
    nw_endpoint_t v4 = host;
    nw_parameters_t v5 = nw_parameters_create();
    if (v5)
    {
      unsigned int v6 = v5;
      uint64_t v7 = *(void *)(a1 + 136);
      if (v7 == -4 || v7 == -5 || v7 == -3 || v7 == -1 || v7 == -2 || v7 == 0) {
        uint64_t v13 = 0LL;
      }
      else {
        uint64_t v13 = v7;
      }
      if ((_DWORD)v13)
      {
        uint64_t v14 = (nw_interface *)nw_interface_create_with_index(v13);
        if (v14)
        {
          uint64_t v15 = v14;
          nw_parameters_require_interface(v6, v14);
          nw_release(v15);
          goto LABEL_70;
        }

        uint64_t v28 = (os_log_s *)mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_70;
          }
        }

        else
        {
          uint64_t v28 = (os_log_s *)mDNSLogCategory_Default_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_70;
          }
        }

        unsigned int v30 = bswap32(*(unsigned __int16 *)(a1 + 320));
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = HIWORD(v30);
        LOWORD(v94) = 1024;
        *(_DWORD *)((char *)&v94 + 2) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[Q%u] mDNSPlatformGetDNSRoutePolicy: nw_interface_create_with_index() returned NULL for index %u",  buf,  0xEu);
      }

LABEL_162:
  char v51 = 0;
LABEL_163:
  *(_BYTE *)(a1 + 634) = v51;
}

uint64_t __mDNSPlatformGetDNSRoutePolicy_block_invoke(void *a1, uint64_t a2)
{
  int allow_failover = nw_resolver_config_get_allow_failover(a2);
  unsigned int v5 = nw_resolver_config_get_class(a2);
  if (v5 && (!allow_failover || !*(_BYTE *)(a1[7] + 623LL)))
  {
    uint64_t v6 = *(void *)(a1[4] + 8LL);
    if (*(_DWORD *)(v6 + 24) - 1 >= v5)
    {
      *(_DWORD *)(v6 + 24) = v5;
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = allow_failover;
    }
  }

  return 1LL;
}

uint64_t _dnssec_obj_trust_anchor_compare(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24) && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28)) {
    return 2 * (ref_count_obj_compare(*(void *)(a1 + 16), *(void *)(a2 + 16), 1LL) != 0);
  }
  else {
    return 2LL;
  }
}

void _dnssec_obj_trust_anchor_finalize(uint64_t a1)
{
  __int16 v2 = *(void **)(a1 + 16);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(void *)(a1 + 16) = 0LL;
  }

void *dnssec_obj_trust_anchor_create_with_ds_data( unsigned __int8 *a1, __int16 a2, char a3, __int128 *a4, int a5, int a6, int *a7)
{
  int v21 = 0;
  v22[0] = HIBYTE(a2);
  v22[1] = a2;
  v22[2] = a3;
  v22[3] = 2;
  bzero(&v25, 0xFDCuLL);
  __int128 v12 = a4[1];
  __int128 v23 = *a4;
  __int128 v24 = v12;
  uint64_t v13 = dnssec_obj_rr_ds_create(a1, 1, v22, 0x24u, 1, &v21);
  uint64_t v14 = v13;
  int v15 = v21;
  if (v21)
  {
    unsigned int v17 = 0LL;
  }

  else if (v13)
  {
    uint64_t v16 = calloc(1uLL, 0x20uLL);
    if (!v16) {
      __break(1u);
    }
    unsigned int v17 = v16;
    uint64_t v18 = &_dnssec_obj_trust_anchor_kind;
    v16[1] = &_dnssec_obj_trust_anchor_kind;
    do
    {
      uint64_t v19 = (void (*)(void *))v18[2];
      if (v19) {
        v19(v17);
      }
      uint64_t v18 = (_UNKNOWN **)*v18;
    }

    while (v18);
    int v15 = 0;
    ++*(_DWORD *)v17;
    v17[2] = v14;
    ++*(_DWORD *)v14;
    *((_DWORD *)v17 + 6) = a5;
    *((_DWORD *)v17 + 7) = a6;
    int v21 = 0;
  }

  else
  {
    unsigned int v17 = 0LL;
    int v15 = -6728;
    int v21 = -6728;
  }

  if (a7) {
    *a7 = v15;
  }
  if (v14) {
    ref_count_obj_release(v14);
  }
  return v17;
}

size_t mdns_snprintf_add( char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    int v10 = *a1;
  }
  else {
    int v10 = 0LL;
  }
  if (a1) {
    size_t v11 = a2 - (void)v10;
  }
  else {
    size_t v11 = 0LL;
  }
  size_t v12 = vsnprintf(v10, v11, a3, &a9);
  size_t v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    else {
      size_t v12 = v12;
    }
    *a1 = &v10[v12];
  }

  return v13;
}

void mdns_replace_string(void **a1, char *__s1)
{
  if (__s1)
  {
    uint64_t v3 = strdup(__s1);
    if (v3) {
      goto LABEL_5;
    }
    __break(1u);
  }

  uint64_t v3 = 0LL;
LABEL_5:
  if (*a1) {
    free(*a1);
  }
  *a1 = v3;
}

uint64_t mdns_get_monotonic_time_ns()
{
  __uint64_t v0 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v0 && (!*__error() || *__error())) {
    return 1LL;
  }
  return v0;
}

char *_mdns_message_copy_description(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = 0LL;
  uint64_t result = *(char **)(a1 + 32);
  if (result)
  {
    char v5 = a3;
    int v6 = *(_BYTE *)(a1 + 48) ? 36 : 4;
    unsigned int v7 = a3 ? v6 | 8 : v6;
    DNSMessageToString(result, *(void *)(a1 + 40), v7, (uint64_t)&v16);
    uint64_t result = v16;
    if (!v16 && (v5 & 1) == 0)
    {
      uint64_t result = 0LL;
      unint64_t v8 = *(_BYTE *)(a1 + 48) ? 12LL : 0LL;
      unint64_t v9 = *(void *)(a1 + 40);
      if (v9 >= v8)
      {
        uint64_t v10 = v9 - v8;
        if ((uint64_t)(v9 - v8) < 0)
        {
          return 0LL;
        }

        else
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t result = (char *)malloc((2 * v10) | 1);
          if (result)
          {
            size_t v12 = result;
            if (v9 != v8)
            {
              size_t v13 = (unsigned __int8 *)(v11 + v8);
              uint64_t v14 = result;
              do
              {
                unsigned int v15 = *v13++;
                char *v14 = a0123456789abcd_0[(unint64_t)v15 >> 4];
                size_t v12 = v14 + 2;
                v14[1] = a0123456789abcd_0[v15 & 0xF];
                v14 += 2;
                --v10;
              }

              while (v10);
            }

            char *v12 = 0;
          }

          else
          {
            __break(1u);
          }
        }
      }
    }
  }

  return result;
}

void _mdns_message_finalize(uint64_t a1)
{
  *(void *)(a1 + 32) = 0LL;
  __int16 v2 = *(dispatch_object_s **)(a1 + 24);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 24) = 0LL;
  }

_BYTE *mdns_message_create_with_dispatch_data(dispatch_data_s *a1, char a2)
{
  size_t v41 = 0LL;
  buffer_ptr = 0LL;
  dispatch_data_t v3 = dispatch_data_create_map(a1, (const void **)&buffer_ptr, &v41);
  if (!v3) {
    return 0LL;
  }
  nw_endpoint_t v4 = v3;
  size_t v6 = v41;
  char v5 = buffer_ptr;
  if (buffer_ptr) {
    BOOL v7 = v41 >= 0xC;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7
    && (*((_BYTE *)buffer_ptr + 2) & 0x78) == 0x30
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 2))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 3))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 4))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 5))
    && ((*((_BYTE *)buffer_ptr + 2) & 0x80) == 0 || __rev16(*(unsigned __int16 *)buffer_ptr)))
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = (char *)buffer_ptr + 12;
    uint64_t v10 = (char *)buffer_ptr + v41;
    while (v9 < v10)
    {
      if ((unint64_t)(v10 - v9) >= 4)
      {
        uint64_t v11 = __rev16(*((unsigned __int16 *)v9 + 1));
        uint64_t v12 = v10 - (v9 + 4);
        v9 += v11 + 4;
        ++v8;
        if (v12 >= v11) {
          continue;
        }
      }

      goto LABEL_21;
    }

    if ((*((_BYTE *)buffer_ptr + 2) & 0x80) != 0 || v8)
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = &off_10013ED18;
      do
      {
        if ((((uint64_t (*)(void *, size_t))*v19)(v5, v6) & 1) != 0)
        {
          switch(*((_WORD *)&off_10013ED18 + 8 * v18 + 4))
          {
            case 0:
              goto LABEL_34;
            case 1:
              uint64_t v23 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_keepalive_message, 56LL);
              uint64_t v14 = (_BYTE *)v23;
              if (!v23) {
                goto LABEL_29;
              }
              __int128 v24 = &_mdns_dso_keepalive_message_kind;
              *(void *)(v23 + 16) = &_mdns_dso_keepalive_message_kind;
              do
              {
                int v25 = (void (*)(_BYTE *))v24[2];
                if (v25) {
                  v25(v14);
                }
                __int128 v24 = (_UNKNOWN ***)*v24;
              }

              while (v24);
              break;
            case 2:
              uint64_t v26 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_retry_delay_message, 56LL);
              uint64_t v14 = (_BYTE *)v26;
              if (!v26) {
                goto LABEL_29;
              }
              uint64_t v27 = &_mdns_dso_retry_delay_message_kind;
              *(void *)(v26 + 16) = &_mdns_dso_retry_delay_message_kind;
              do
              {
                uint64_t v28 = (void (*)(_BYTE *))v27[2];
                if (v28) {
                  v28(v14);
                }
                uint64_t v27 = (_UNKNOWN ***)*v27;
              }

              while (v27);
              break;
            case 3:
              uint64_t v29 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_push_message, 56LL);
              uint64_t v14 = (_BYTE *)v29;
              if (!v29) {
                goto LABEL_29;
              }
              unsigned int v30 = &_mdns_dso_push_message_kind;
              *(void *)(v29 + 16) = &_mdns_dso_push_message_kind;
              do
              {
                int v31 = (void (*)(_BYTE *))v30[2];
                if (v31) {
                  v31(v14);
                }
                unsigned int v30 = (_UNKNOWN ***)*v30;
              }

              while (v30);
              break;
            case 4:
              uint64_t v32 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_subscribe_message, 56LL);
              uint64_t v14 = (_BYTE *)v32;
              if (!v32) {
                goto LABEL_29;
              }
              uint64_t v33 = &_mdns_dso_subscribe_message_kind;
              *(void *)(v32 + 16) = &_mdns_dso_subscribe_message_kind;
              do
              {
                int v34 = (void (*)(_BYTE *))v33[2];
                if (v34) {
                  v34(v14);
                }
                uint64_t v33 = (_UNKNOWN ***)*v33;
              }

              while (v33);
              break;
            case 5:
              uint64_t v35 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_unsubscribe_message, 56LL);
              uint64_t v14 = (_BYTE *)v35;
              if (!v35) {
                goto LABEL_29;
              }
              int v36 = &_mdns_dso_unsubscribe_message_kind;
              *(void *)(v35 + 16) = &_mdns_dso_unsubscribe_message_kind;
              do
              {
                uint64_t v37 = (void (*)(_BYTE *))v36[2];
                if (v37) {
                  v37(v14);
                }
                int v36 = (_UNKNOWN ***)*v36;
              }

              while (v36);
              break;
            case 6:
              uint64_t v38 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_reconfirm_message, 56LL);
              uint64_t v14 = (_BYTE *)v38;
              if (!v38) {
                goto LABEL_29;
              }
              uint64_t v39 = &_mdns_dso_reconfirm_message_kind;
              *(void *)(v38 + 16) = &_mdns_dso_reconfirm_message_kind;
              do
              {
                unsigned int v40 = (void (*)(_BYTE *))v39[2];
                if (v40) {
                  v40(v14);
                }
                uint64_t v39 = (_UNKNOWN ***)*v39;
              }

              while (v39);
              break;
            default:
              goto LABEL_79;
          }

          goto LABEL_26;
        }

        ++v18;
        v19 += 2;
      }

      while (v18 != 6);
LABEL_34:
      uint64_t v20 = _os_object_alloc(&OBJC_CLASS___OS_mdns_dso_unspecified_message, 56LL);
      uint64_t v14 = (_BYTE *)v20;
      if (!v20) {
        goto LABEL_29;
      }
      int v21 = &_mdns_dso_unspecified_message_kind;
      *(void *)(v20 + 16) = &_mdns_dso_unspecified_message_kind;
      do
      {
        uint64_t v22 = (void (*)(_BYTE *))v21[2];
        if (v22) {
          v22(v14);
        }
        int v21 = (_UNKNOWN ***)*v21;
      }

      while (v21);
      goto LABEL_26;
    }
  }

uint64_t _mdns_message_set_msg_data(void *a1, dispatch_data_t data)
{
  size_t v7 = 0LL;
  buffer_ptr = 0LL;
  if (data)
  {
    dispatch_data_t v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v7);
    if (!v3) {
      return 4294960568LL;
    }
  }

  else
  {
    size_t v7 = 0LL;
    buffer_ptr = 0LL;
    dispatch_data_t v3 = &_dispatch_data_empty;
  }

  char v5 = (dispatch_object_s *)a1[3];
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t result = 0LL;
  size_t v6 = buffer_ptr;
  a1[3] = v3;
  a1[4] = v6;
  a1[5] = v7;
  return result;
}

BOOL _mdns_dso_keepalive_message_validator(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x18
    && (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0xC
    && (int64_t v2 = __rev16(*(unsigned __int16 *)(a1 + 14)), (uint64_t)(a2 - 16) >= v2)
    && ((unsigned int v3 = __rev16(*(unsigned __int16 *)(a1 + 12)), (_DWORD)v2 == 8) ? (v4 = a1 == -16) : (v4 = 1),
        !v4 ? (BOOL v5 = v3 == 1) : (BOOL v5 = 0),
        v5))
  {
    return bswap32(*(_DWORD *)(a1 + 20)) >> 4 > 0x270;
  }

  else
  {
    return 0LL;
  }

uint64_t _mdns_dso_retry_delay_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2 >= 0x14)
  {
    uint64_t v2 = 0LL;
    int v3 = *((char *)a1 + 2);
    unsigned int v4 = __rev16(*a1);
    BOOL v5 = !v4 && v3 < 0;
    if (!v5 && (v3 & 0x80000000) == 0 && !v4)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC || (int64_t v6 = __rev16(a1[7]), (uint64_t)(a2 - 16) < v6))
      {
        BOOL v10 = 0;
        BOOL v9 = 0;
      }

      else
      {
        unsigned int v7 = __rev16(a1[6]);
        BOOL v9 = a1 != (unsigned __int16 *)-16LL && v7 == 2;
        BOOL v10 = v6 == 4;
      }

      return v10 & v9;
    }
  }

  return v2;
}

BOOL _mdns_dso_push_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  if (a2 > 0x3FFE) {
    return 0LL;
  }
  v17[7] = v2;
  v17[8] = v3;
  BOOL result = 0LL;
  if (a1 && a2 >= 0xC)
  {
    BOOL result = 0LL;
    int v7 = *((char *)a1 + 2);
    unsigned int v8 = __rev16(*a1);
    BOOL v9 = !v8 && v7 < 0;
    if (!v9 && (v7 & 0x80000000) == 0 && !v8)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
        return 0LL;
      }
      int64_t v10 = __rev16(a1[7]);
      BOOL result = 0LL;
      uint64_t v11 = (char *)(a1 + 8);
      if (a1 != (unsigned __int16 *)-16LL && __rev16(a1[6]) == 65)
      {
        uint64_t v12 = &v11[v10];
        v17[0] = a1 + 8;
        if (v11 < &v11[v10])
        {
          uint64_t v13 = 0LL;
          while (1)
          {
            int v16 = 0;
            int v15 = 0;
            unint64_t v14 = 0LL;
            if (_DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v11,  0LL,  (_WORD *)&v16 + 1,  &v16,  &v15,  0LL,  &v14,  0LL,  0LL,  0LL,  0LL,  v17)) {
              return 0LL;
            }
            uint64_t v11 = (char *)v17[0];
            if ((v15 & 0x80000000) == 0) {
              break;
            }
            if (v15 == -2)
            {
              if (v14) {
                return 0LL;
              }
            }

            else if (v15 == -1)
            {
              break;
            }

BOOL _mdns_dso_subscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0LL;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0LL;
      if (((char)a1[1] & 0x80000000) == 0)
      {
        if (__rev16(*a1))
        {
          if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
            return 0LL;
          }
          BOOL result = 0LL;
          unsigned int v4 = a1 + 8;
          int64_t v5 = __rev16(a1[7]);
          if (__rev16(a1[6]) != 64) {
            return 0LL;
          }
          int64_t v6 = (char *)v4 + v5;
          int v7 = v4;
          while (1)
          {
            uint64_t v8 = *(unsigned __int8 *)v7;
            if (!*(_BYTE *)v7) {
              break;
            }
            BOOL result = 0LL;
            BOOL v9 = (char *)v7 + v8;
            BOOL v12 = __OFSUB__(v6 - (char *)v7, v8);
            BOOL v10 = v6 - (char *)v7 == v8;
            BOOL v11 = v6 - (char *)v7 - v8 < 0;
            if (v11 ^ v12 | v10 || v9 + 1 - (_BYTE *)v4 >= 256) {
              return result;
            }
          }

          int v13 = (unsigned __int16)((_WORD)v7 - (_WORD)v4) + 1;
          int64_t v14 = v5 - (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
          BOOL v16 = v5 > (unsigned __int16)v13 && v14 == 4;
          return (v13 & 0x10000) == 0 && v16;
        }
      }
    }
  }

  return result;
}

BOOL _mdns_dso_unsubscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0LL;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0LL;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        {
          return 0LL;
        }

        else
        {
          BOOL result = 0LL;
          if (a1 != (unsigned __int16 *)-16LL)
          {
            int64_t v4 = __rev16(a1[7]);
          }
        }
      }
    }
  }

  return result;
}

BOOL _mdns_dso_reconfirm_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0LL;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0LL;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
          return 0LL;
        }
        BOOL result = 0LL;
        int64_t v4 = a1 + 8;
        if (a1 != (unsigned __int16 *)-16LL)
        {
          int64_t v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) >= v5)
          {
            if (__rev16(a1[6]) == 67 && v4 < (unsigned __int16 *)((char *)v4 + v5))
            {
              int64_t v6 = a1 + 8;
              while (1)
              {
                uint64_t v7 = *v6;
                if (!*v6) {
                  break;
                }
                BOOL result = 0LL;
                uint64_t v8 = &v6[v7];
                if ((char *)v4 + v5 - v6 > v7)
                {
                  int64_t v6 = v8 + 1;
                  if (v8 + 1 - (_BYTE *)v4 < 256) {
                    continue;
                  }
                }

                return result;
              }

              unsigned __int16 v9 = (_WORD)v6 - (_WORD)v4 + 1;
              if ((_WORD)v6 - (_WORD)v4 != 0xFFFF) {
                return v5 > v9 && v5 - v9 > 3;
              }
            }

            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t mdns_query_message_create()
{
  uint64_t v0 = _os_object_alloc(&OBJC_CLASS___OS_mdns_query_message, 96LL);
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mdns_query_message_kind;
    *(void *)(v0 + 16) = &_mdns_query_message_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }

    while (v2);
    *(_BYTE *)(v1 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 1;
    if (_mdns_domain_name_get_root_s_once != -1) {
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
    }
    uint64_t v4 = _mdns_domain_name_get_root_s_root;
    *(void *)(v1 + 56) = _mdns_domain_name_get_root_s_root;
    if (!v4)
    {
LABEL_11:
      os_release((void *)v1);
      return 0LL;
    }
  }

  return v1;
}

void _mdns_query_message_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 56) = 0LL;
  }

void mdns_query_message_set_qname(uint64_t a1, void *object)
{
  if ((*(_BYTE *)(a1 + 70) & 0x20) == 0)
  {
    if (object) {
      os_retain(object);
    }
    uint64_t v4 = *(void **)(a1 + 56);
    if (v4) {
      os_release(v4);
    }
    *(void *)(a1 + 56) = object;
  }

uint64_t mdns_query_message_construct(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 70);
  memset(v32, 0, sizeof(v32));
  uint64_t v3 = *(_BYTE **)(*(void *)(a1 + 56) + 24LL);
  __int16 v4 = *(_WORD *)(a1 + 68);
  __int16 v5 = *(_WORD *)(a1 + 64);
  __int16 v6 = *(_WORD *)(a1 + 66);
  *(_DWORD *)((char *)v32 + 6) = 0;
  WORD5(v32[0]) = 0;
  LOBYTE(v32[0]) = HIBYTE(v4);
  BYTE1(v32[0]) = v4;
  BYTE2(v32[0]) = 1;
  BYTE3(v32[0]) = (__rbit32(v2) >> 26) & 0x30;
  WORD2(v32[0]) = 256;
  uint64_t v7 = v3;
  int v8 = *v3;
  if (*v3)
  {
    uint64_t v7 = v3;
    do
    {
      unsigned __int16 v9 = &v7[v8];
      int v10 = v9[1];
      uint64_t v7 = v9 + 1;
      int v8 = v10;
    }

    while (v10);
  }

  uint64_t v11 = v7 - v3;
  uint64_t v12 = v11 + 1;
  memcpy((void *)((unint64_t)v32 | 0xC), v3, v11 + 1);
  uint64_t v13 = ((unint64_t)v32 | 0xC) + v12;
  *(_BYTE *)uint64_t v13 = HIBYTE(v5);
  *(_BYTE *)(v13 + 1) = v5;
  *(_BYTE *)(v13 + 2) = HIBYTE(v6);
  *(_BYTE *)(v13 + 3) = v6;
  int64_t v14 = (char *)(v13 + 4);
  unint64_t v15 = v13 + 4 - (void)v32;
  if ((v2 & 0x1C) == 0 && !*(_BYTE *)(a1 + 71))
  {
    size_t v19 = v14 - (char *)v32;
    goto LABEL_31;
  }

  if (v15 > 0x200) {
    return 4294960553LL;
  }
  *(_DWORD *)(((unint64_t)v32 | 0xC) + v12 + 11) = 0;
  *(void *)int64_t v14 = 0LL;
  *(_DWORD *)(v13 + 5) = 141568;
  if ((v2 & 4) != 0) {
    *(_BYTE *)(v13 + 11) = 0x80;
  }
  size_t v16 = v15 + 11;
  WORD5(v32[0]) = 256;
  char v17 = *(_BYTE *)(a1 + 71);
  if (!v17)
  {
    size_t v19 = v15 + 11;
    if ((v2 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }

  unint64_t v18 = *(unsigned __int8 *)(a1 + 72);
  size_t v19 = v15 + ((v18 + 7) >> 3) + 19;
  uint64_t v20 = 4294960553LL;
  if (v19 <= v16 || v19 > 0x200) {
    return v20;
  }
  int v21 = (char *)v32 + v16;
  bzero((char *)v32 + v16, (char *)v32 + v19 - ((char *)v32 + v16));
  *(_WORD *)(v13 + 13) = bswap32(v32 + v19 - v13 - 15) >> 16;
  *(_WORD *)int v21 = 2048;
  v21[4] = 0;
  __int16 v22 = (unsigned __int16)v32 + v19 - ((_WORD)v21 + 4);
  v21[2] = HIBYTE(v22);
  v21[3] = v22;
  v21[5] = v17;
  v21[6] = v18;
  void v21[7] = 0;
  uint64_t v23 = v21 + 8;
  if ((v18 & 7) != 0) {
    *((_BYTE *)v23 + (v18 >> 3)) = *((_BYTE *)v23 + (v18 >> 3)) & ~(-1 << (8 - (v18 & 7))) | *(_BYTE *)(a1 + 73 + (v18 >> 3)) & (-1 << (8 - (v18 & 7)));
  }
  if ((v2 & 0x10) != 0)
  {
LABEL_21:
    if (v19 <= 0x1FA)
    {
      uint64_t v20 = 4294960554LL;
      if (v19 <= v15 || v19 - v15 < 0xB) {
        return v20;
      }
      size_t v24 = v19 + 6;
      int v25 = (_WORD *)((char *)v32 + v19);
      bzero(v25, (char *)v32 + v24 - (char *)v25);
      *(_WORD *)(v13 + 13) = bswap32(v32 + v24 - v13 - 15) >> 16;
      *(_DWORD *)int v25 = 33558272;
      v25[2] = 0;
      size_t v19 = v24;
      if ((v2 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_25;
    }

    return 4294960553LL;
  }

uint64_t _mdns_dso_message_get_header(uint64_t result, unint64_t a2)
{
  if (a2 < 0xC || !result)
  {
    uint64_t v2 = _os_assert_log(0LL);
    BOOL result = _os_crash(v2);
    __break(1u);
  }

  return result;
}

BOOL mdns_dso_message_is_unidirectional(unsigned __int16 *a1, unint64_t a2)
{
  if (!a1 || a2 < 0xC) {
    return 0LL;
  }
  int v2 = *((char *)a1 + 2);
  unsigned int v3 = __rev16(*a1);
  BOOL v4 = v2 >= 0 && v3 == 0;
  BOOL result = v4;
  if (v2 < 0 && !v3) {
    return 0LL;
  }
  return result;
}

void *_mdns_extended_dns_error_copy_description(uint64_t a1, int a2, int a3)
{
  __int16 v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted( v6,  "<%s: %p>: ",  *(const char **)(*(void *)(a1 + 16) + 8LL),  (const void *)a1)
    || mdns_string_builder_append_formatted(v7, "code: %u", *(unsigned __int16 *)(a1 + 32))
    || (unint64_t v9 = *(unsigned __int16 *)(a1 + 32), v9 <= 0x18)
    && mdns_string_builder_append_formatted(v7, " (%s)", off_10013DC70[v9])
    || mdns_string_builder_append_formatted(v7, ", extra-text: ")
    || (!a3
      ? ((uint64_t v11 = *(void **)(a1 + 24)) == 0LL || !xpc_string_get_string_ptr(v11)
       ? (int appended = mdns_string_builder_append_formatted(v7, "«EXTRA TEXT»"))
       : (int appended = mdns_string_builder_append_formatted(v7, "'%s'")))
      : (int appended = mdns_string_builder_append_formatted(v7, "«REDACTED»", v13)),
        appended))
  {
    int v8 = 0LL;
  }

  else
  {
    int v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }

  os_release(v7);
  return v8;
}

void _mdns_extended_dns_error_finalize(uint64_t a1)
{
  int v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 24) = 0LL;
  }

void ___mdns_copy_empty_string_block_invoke(id a1)
{
  _mdns_copy_empty_string_s_empty_string = (uint64_t)xpc_string_create("");
}

BOOL type_bit_maps_check_length(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  unint64_t v3 = a1 + a2;
  for (unint64_t i = a1 + 1; i < v3; unint64_t i = v5 + 3)
  {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 1) + v2;
    uint64_t v2 = v5 + 2;
  }

  if (v2 != v3)
  {
    uint64_t v7 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return v2 == v3;
      }
    }

    else
    {
      uint64_t v7 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return v2 == v3;
      }
    }

    int v10 = 136447234;
    uint64_t v11 = "ptr == ptr_limit";
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v16 = 1024;
    int v17 = 42;
    __int16 v18 = 2048;
    uint64_t v19 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v10,  0x30u);
  }

  return v2 == v3;
}

uint64_t rdata_parser_type_bit_maps_cover_dns_type(unsigned __int8 *a1, int a2, unsigned int a3)
{
  unint64_t v3 = (unint64_t)&a1[a2];
  if ((unint64_t)(a1 + 1) >= v3)
  {
    char v4 = 0;
  }

  else
  {
    char v4 = 0;
    do
    {
      uint64_t v5 = a1[1];
      __int16 v6 = &a1[v5 + 2];
      unsigned int v7 = 8 * v5;
      a1 = v6;
    }

    while ((unint64_t)(v6 + 1) < v3);
  }

  return v4 & 1;
}

uint64_t rdata_parser_ds_get_digest_length(unsigned int a1)
{
  if (a1 <= 3)
  {
    unint64_t v3 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }

    else
    {
      unint64_t v3 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }

    int v6 = 136447234;
    unsigned int v7 = "rdata_len >= offsetof(rdata_ds_t, digest)";
    __int16 v8 = 2082;
    unint64_t v9 = "";
    __int16 v10 = 2082;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v12 = 1024;
    int v13 = 351;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v6,  0x30u);
    return 0;
  }

  return (unsigned __int16)(a1 - 4);
}

BOOL rdata_parser_rrsig_check_validity(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x13)
  {
    uint64_t v11 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    else
    {
      uint64_t v11 = (os_log_s *)mDNSLogCategory_Default_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }

    int v14 = 136447234;
    uint64_t v15 = "rdata_len >= min_rdata_len_rrsig";
    __int16 v16 = 2082;
    int v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v20 = 1024;
    int v21 = 474;
    __int16 v22 = 2048;
    uint64_t v23 = 0LL;
    goto LABEL_22;
  }

  unsigned int v2 = *(unsigned __int8 *)(a1 + 18);
  if (*(_BYTE *)(a1 + 18))
  {
    unint64_t v3 = a1 + a2;
    uint64_t v4 = a1 + 18;
    while (!v3 || v4 + (unint64_t)v2 + 1 <= v3)
    {
      uint64_t v5 = v2 + v4;
      unsigned int v6 = *(unsigned __int8 *)(v5 + 1);
      uint64_t v4 = v5 + 1;
      unsigned int v2 = v6;
      if (!v6) {
        goto LABEL_9;
      }
    }
  }

  else
  {
    uint64_t v4 = a1 + 18;
LABEL_9:
    uint64_t v7 = v4 - (a1 + 18);
    BOOL v8 = __CFADD__(v7, 1LL);
    unint64_t v9 = v7 + 1;
    if (!v8)
    {
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        uint64_t v11 = (os_log_s *)mDNSLogCategory_Default;
        BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
      }

      else
      {
        uint64_t v11 = (os_log_s *)mDNSLogCategory_Default_redacted;
        BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
      }

      int v14 = 136447234;
      uint64_t v15 = "signer_name_len < rdata_len - offsetof(rdata_rrsig_t, signer_name)";
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      __int16 v20 = 1024;
      int v21 = 481;
      __int16 v22 = 2048;
      uint64_t v23 = 0LL;
      goto LABEL_22;
    }
  }

  uint64_t v11 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_21:
      int v14 = 136447234;
      uint64_t v15 = "signer_name_len >= 1";
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      __int16 v20 = 1024;
      int v21 = 479;
      __int16 v22 = 2048;
      uint64_t v23 = 0LL;
LABEL_22:
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v14,  0x30u);
      return 0LL;
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)mDNSLogCategory_Default_redacted;
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_21;
    }
  }

  return result;
}

uint64_t rdata_parser_dnskey_get_public_key_size(unsigned int a1)
{
  if (a1 <= 3)
  {
    unint64_t v3 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }

    else
    {
      unint64_t v3 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }

    int v6 = 136447234;
    uint64_t v7 = "rdata_len >= offsetof(rdata_dnskey_t, public_key)";
    __int16 v8 = 2082;
    unint64_t v9 = "";
    __int16 v10 = 2082;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v12 = 1024;
    int v13 = 539;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld",  (uint8_t *)&v6,  0x30u);
    return 0;
  }

  return (unsigned __int16)(a1 - 4);
}

void __dnssd_analytics_init_block_invoke(id a1)
{
  dnssd_analytics_init_sAnalyticsQueue = (uint64_t)dispatch_queue_create( "com.apple.mDNSResponder.analytics-reporting-queue",  0LL);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_string(v1, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.mDNSResponder.analytics.daily", v1, &__block_literal_global_7_7066);
  if (v1) {
    xpc_release(v1);
  }
}

void __dnssd_analytics_init_block_invoke_2(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_should_defer(a2))
  {
    BOOL v3 = xpc_activity_set_state(a2, 3LL);
    char v4 = gSensitiveLoggingEnabled;
    uint64_t v5 = mDNSLogCategory_Analytics;
    if (mDNSLogCategory_Analytics == mDNSLogCategory_State) {
      char v4 = 0;
    }
    if (v3)
    {
      if ((v4 & 1) != 0)
      {
        uint64_t v5 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        __int16 v16 = 0;
        int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        uint64_t v7 = (uint8_t *)&v16;
      }

      else
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        __int16 v17 = 0;
        int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        uint64_t v7 = (uint8_t *)&v17;
      }

      unint64_t v9 = (os_log_s *)v5;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }

    if ((v4 & 1) != 0)
    {
      uint64_t v5 = mDNSLogCategory_Analytics_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
      __int16 v14 = 0;
      int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      uint64_t v7 = (uint8_t *)&v14;
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
      int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      uint64_t v7 = buf;
    }

void __dnssd_analytics_init_block_invoke_8(id a1)
{
  uint64_t v1 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v1, v2, v3, v4, v5, v6, v7, v8);
  mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 606);
  if ((analytics_send_event_lazy("com.apple.mDNSResponder.unicastassist", &__block_literal_global_20_7078, v9) & 1) == 0)
  {
    os_log_type_t v10 = (os_log_s *)mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = buf;
        goto LABEL_8;
      }
    }

    else
    {
      os_log_type_t v10 = (os_log_s *)mDNSLogCategory_Analytics_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = 0;
        uint64_t v11 = (uint8_t *)&v23;
LABEL_8:
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "com.apple.mDNSResponder.unicastassist: Analytic not posted",  v11,  2u);
      }
    }
  }

  sUnicastAssist_UnicastCFIndex Count = 0LL;
  sUnicastAssist_MulticastCFIndex Count = 0LL;
  sNonUnicastAssist_UnicastCFIndex Count = 0LL;
  sNonUnicastAssist_MulticastCFIndex Count = 0LL;
  __int16 v12 = (os_log_s *)mDNSLogCategory_Analytics;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v22 = 0;
      __int16 v13 = v22;
      goto LABEL_15;
    }
  }

  else
  {
    __int16 v12 = (os_log_s *)mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      __int16 v13 = (uint8_t *)&v21;
LABEL_15:
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "com.apple.mDNSResponder.analytics.daily Complete",  v13,  2u);
    }
  }

  mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 618);
  KQueueUnlock((uint64_t)"Analytics Update", v14, v15, v16, v17, v18, v19, v20);
}

void *__cdecl ___post_unicast_assist_block_invoke(id a1)
{
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v1, "unicast", sUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "multicast", sUnicastAssist_MulticastCount);
  xpc_dictionary_set_uint64(v1, "non_unicast", sNonUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "non_multicast", sNonUnicastAssist_MulticastCount);
  return v1;
}

void *_mdns_dso_message_builder_copy_description(void *a1, int a2)
{
  uint64_t v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  else {
    uint64_t v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

_BYTE *mdns_dso_message_builder_create_message(uint64_t a1)
{
  uint64_t v16 = 0LL;
  __int16 buffer = bswap32(*(unsigned __int16 *)(a1 + 28)) >> 16;
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(_BYTE *)(a1 + 30) & 0xF;
  if (*(_BYTE *)(v2 + 56)) {
    char v4 = -80;
  }
  else {
    char v4 = 48;
  }
  char v14 = v4;
  char v15 = v3;
  dispatch_data_t v5 = dispatch_data_create(&buffer, 0xCuLL, 0LL, 0LL);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v2 + 48);
  if (v7)
  {
    uint64_t v8 = (dispatch_data_s *)v7(a1);
    if (!v8)
    {
      uint64_t v11 = 0LL;
      goto LABEL_12;
    }

    __n128 v9 = v8;
    dispatch_data_t concat = dispatch_data_create_concat(v6, v8);
    dispatch_release(v6);
    if (!concat)
    {
      uint64_t v11 = 0LL;
      uint64_t v6 = v9;
LABEL_12:
      dispatch_release(v6);
      return v11;
    }

    uint64_t v6 = concat;
  }

  else
  {
    __n128 v9 = 0LL;
  }

  uint64_t v11 = mdns_message_create_with_dispatch_data(v6, *(_DWORD *)(a1 + 24));
  dispatch_release(v6);
  uint64_t v6 = v9;
  if (v9) {
    goto LABEL_12;
  }
  return v11;
}

dispatch_data_t _mdns_dso_keepalive_message_builder_create_primary_tlv(uint64_t a1)
{
  char v3 = calloc(1uLL, 0xCuLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }

  xpc_object_t v1 = v3;
  *char v3 = 134217984;
  int v5 = *(_DWORD *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 36);
  *((_BYTE *)v3 + 4) = HIBYTE(v5);
  *((_BYTE *)v3 + 5) = BYTE2(v5);
  *((_BYTE *)v3 + 6) = BYTE1(v5);
  *((_BYTE *)v3 + 7) = v5;
  *((_BYTE *)v3 + _Block_object_dispose((const void *)(v1 - 176), 8) = HIBYTE(v4);
  *((_BYTE *)v3 + 9) = BYTE2(v4);
  *((_BYTE *)v3 + 10) = BYTE1(v4);
  *((_BYTE *)v3 + 11) = v4;
  dispatch_data_t result = dispatch_data_create(v3, 0xCuLL, 0LL, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0LL;
  }

  return result;
}

void _mdns_dso_subscribe_message_builder_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 32) = 0LL;
  }

char *_mdns_dso_subscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  dispatch_data_t result = 0LL;
  size_t v3 = *(void *)(*(void *)(a1 + 32) + 32LL);
  size_t v4 = v3 + 4;
  if (v3 < 0xFFFFFFFFFFFFFFFCLL && !(v4 >> 16))
  {
    size_t v5 = v3 + 8;
    dispatch_data_t result = (char *)calloc(1uLL, v3 + 8);
    if (result)
    {
      uint64_t v6 = result;
      *(_WORD *)dispatch_data_t result = 0x4000;
      result[2] = BYTE1(v4);
      result[3] = v4;
      if (v4 < v3) {
        v3 += 4LL;
      }
      if (v3)
      {
        memcpy(result + 4, *(const void **)(*(void *)(a1 + 32) + 24LL), v3);
        uint64_t v7 = v3 + 4;
      }

      else
      {
        uint64_t v7 = 4LL;
      }

      __src[0] = bswap32(*(unsigned __int16 *)(a1 + 40)) >> 16;
      __src[1] = bswap32(*(unsigned __int16 *)(a1 + 42)) >> 16;
      unint64_t v8 = v5 - v7;
      if (v5 - v7 >= 4) {
        size_t v9 = 4LL;
      }
      else {
        size_t v9 = v5 - v7;
      }
      if (v9) {
        memcpy(&v6[v7], __src, v9);
      }
      if (v8 < 4 || (dispatch_data_t result = (char *)dispatch_data_create(v6, v4 + 4, 0LL, _dispatch_data_destructor_free)) == 0LL)
      {
        free(v6);
        return 0LL;
      }
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

dispatch_data_t _mdns_dso_unsubscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  size_t v3 = calloc(1uLL, 6uLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }

  xpc_object_t v1 = v3;
  *size_t v3 = 33571328;
  *((_WORD *)v3 + 2) = bswap32(*(unsigned __int16 *)(a1 + 32)) >> 16;
  dispatch_data_t result = dispatch_data_create(v3, 6uLL, 0LL, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0LL;
  }

  return result;
}

void __init_log_utility_service_block_invoke(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v7 = (os_log_s *)mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        xpc_retain(a2);
        xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)log_utility_server_queue);
        *(void *)__int16 v12 = _NSConcreteStackBlock;
        *(void *)&v12[8] = 0x40000000LL;
        *(void *)&v12[16] = __accept_client_block_invoke;
        __int16 v13 = &__block_descriptor_tmp_3_7147;
        char v14 = a2;
        xpc_connection_set_event_handler((xpc_connection_t)a2, v12);
        xpc_connection_resume((xpc_connection_t)a2);
        return;
      }

      *(_DWORD *)__int16 v12 = 134217984;
      *(void *)&v12[4] = a2;
    }

    else
    {
      uint64_t v7 = (os_log_s *)mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)__int16 v12 = 134217984;
      *(void *)&v12[4] = a2;
    }

    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "C%p {action='receives connection'}", v12, 0xCu);
    goto LABEL_24;
  }

  char v4 = gSensitiveLoggingEnabled;
  uint64_t v5 = mDNSLogCategory_XPC;
  if (mDNSLogCategory_XPC == mDNSLogCategory_State) {
    char v4 = 0;
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if ((v4 & 1) != 0)
    {
      uint64_t v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }

    else if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
    {
      return;
    }

    *(_DWORD *)__int16 v12 = 134218242;
    *(void *)&v12[4] = a2;
    *(_WORD *)&v12[12] = 2082;
    *(void *)&v12[14] = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    uint64_t v6 = "C%p {xpc_error=\n%{public}s\n}";
    size_t v9 = (os_log_s *)v5;
    uint32_t v10 = 22;
  }

  else
  {
    if ((v4 & 1) != 0)
    {
      uint64_t v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)__int16 v12 = 134217984;
      *(void *)&v12[4] = a2;
      uint64_t v6 = "C%p {error='receives unknown xpc request'}";
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)__int16 v12 = 134217984;
      *(void *)&v12[4] = a2;
      uint64_t v6 = "C%p {error='receives unknown xpc request'}";
    }

    size_t v9 = (os_log_s *)v5;
    uint32_t v10 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v6, v12, v10);
}

void __accept_client_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    char v4 = (os_log_s *)mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v6 = *(void *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = v6;
    }

    else
    {
      char v4 = (os_log_s *)mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        __int16 v12 = *(void **)(a1 + 32);
        if (v12) {
          goto LABEL_57;
        }
        return;
      }

      uint64_t v11 = *(void *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = v11;
    }

    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "C%p {status='client closed the connection'}",  (uint8_t *)buf,  0xCu);
    goto LABEL_19;
  }

  remote_connectioint n = xpc_dictionary_get_remote_connection(object);
  unint64_t v8 = (os_log_s *)mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    buf[0].st_dev = 134217984;
    *(void *)&buf[0].st_mode = remote_connection;
    goto LABEL_23;
  }

  unint64_t v8 = (os_log_s *)mDNSLogCategory_XPC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].st_dev = 134217984;
    *(void *)&buf[0].st_mode = remote_connection;
LABEL_23:
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "C%p {action='handling log utility request'}",  (uint8_t *)buf,  0xCu);
  }

LABEL_232:
            uint64_t v118 = v64;
LABEL_233:
            archive_write_free(v118);
            goto LABEL_234;
          }

          uint64_t v88 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_232;
            }
          }

          else
          {
            uint64_t v88 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_232;
            }
          }

          *(_DWORD *)__int16 v136 = 134218240;
          *(void *)&v136[4] = 1024LL;
          *(_WORD *)&v136[12] = 2048;
          *(void *)&v136[14] = v66;
          int v108 = "buffer is not large enough to hold the file name - buffer length: %zu, required length: %zu";
          uint64_t v109 = (os_log_s *)v88;
          uint32_t v110 = 22;
LABEL_222:
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, v108, v136, v110);
          goto LABEL_232;
        }

        uint64_t v87 = (os_log_s *)mDNSLogCategory_XPC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
          {
LABEL_217:
            uint64_t v107 = archive_error_string(0LL);
            *(_DWORD *)__int16 v136 = 136446210;
            *(void *)&v136[4] = v107;
            _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEBUG,  "archive_write_new fails: %{public}s",  v136,  0xCu);
          }
        }

        else
        {
          uint64_t v87 = (os_log_s *)mDNSLogCategory_XPC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_217;
          }
        }

LABEL_178:
      int v95 = (os_log_s *)mDNSLogCategory_XPC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          __int16 v96 = "create_new_state_dump_file fails";
          goto LABEL_214;
        }
      }

      else
      {
        int v95 = (os_log_s *)mDNSLogCategory_XPC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          __int16 v96 = "create_new_state_dump_file fails";
          goto LABEL_214;
        }
      }

      goto LABEL_215;
    }

    int v82 = v60;
    uint64_t v83 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_178;
      }
    }

    else
    {
      uint64_t v83 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_178;
      }
    }

    *(_DWORD *)uint64_t v133 = 67109376;
    *(_DWORD *)unint64_t v134 = v82;
    *(_WORD *)&v134[4] = 1024;
    *(_DWORD *)&v134[6] = 1024;
    int v90 = "State Dump: snprintf truncates the final string - minimal buffer size: %d, actual buffer size: %u";
    __int128 v91 = (os_log_s *)v83;
    uint32_t v92 = 14;
LABEL_177:
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, v90, v133, v92);
    goto LABEL_178;
  }

  uint64_t v35 = v34;
  unsigned __int8 v126 = 0;
  __darwin_time_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v37 = readdir(v35);
    if (!v37) {
      break;
    }
    uint64_t v38 = v37;
    if (v37->d_namlen >= 0x19u)
    {
      d_name = v37->d_name;
      if (!strncmp(v37->d_name, "mDNSResponder_state_dump", 0x18uLL))
      {
        memset(buf, 0, 144);
        if ((snprintf(__str, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", v38->d_name) - 1024) <= 0xFFFFFC00)
        {
          uint64_t v52 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }

          else
          {
            uint64_t v52 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }

          size_t v54 = strlen(d_name);
          v138.st_dev = 67109632;
          *(_DWORD *)&v138.st_mode = 1024;
          LOWORD(v138.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v138.st_ino + 2) = 30LL;
          HIWORD(v138.st_uid) = 2048;
          *(void *)&v138.st_gid = v54;
          uint64_t v55 = "snprintf truncates the final string - full name buffer length: %u, directory name length: %zu, file name length: %zu";
          int v56 = (os_log_s *)v52;
          uint32_t v57 = 28;
LABEL_117:
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, v55, (uint8_t *)&v138, v57);
          break;
        }

        if (stat(__str, buf))
        {
          uint64_t v53 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }

          else
          {
            uint64_t v53 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }

          int v58 = __error();
          int v59 = strerror(*v58);
          v138.st_dev = 136446210;
          *(void *)&v138.st_mode = v59;
          uint64_t v55 = "State Dump: error when reading file properties - reason: %{public}s";
          int v56 = (os_log_s *)v53;
          uint32_t v57 = 12;
          goto LABEL_117;
        }

        __darwin_time_t tv_sec = buf[0].st_birthtimespec.tv_sec;
        if (v36 <= buf[0].st_birthtimespec.tv_sec)
        {
LABEL_86:
          ++v126;
        }

        else
        {
          d_namleint n = v38->d_namlen;
          if (d_namlen <= 0x3FF)
          {
            uint64_t v43 = 0LL;
            while (1)
            {
              int v44 = d_name[v43];
              __s[v43] = v44;
              if (!v44) {
                break;
              }
              if (++v43 == 1023)
              {
                __s[1023] = 0;
                break;
              }
            }

            __darwin_time_t v36 = tv_sec;
            goto LABEL_86;
          }

          __darwin_time_t v123 = buf[0].st_birthtimespec.tv_sec;
          uint64_t v42 = (os_log_s *)mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              goto LABEL_80;
            }
          }

          else
          {
            uint64_t v42 = (os_log_s *)mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              goto LABEL_80;
            }
          }

          v138.st_dev = 141558787;
          *(void *)&v138.st_mode = 1752392040LL;
          WORD2(v138.st_ino) = 2085;
          *(__darwin_ino64_t *)((char *)&v138.st_ino + 6) = (__darwin_ino64_t)d_name;
          HIWORD(v138.st_gid) = 1024;
          v138.st_rdev = d_namlen;
          *((_WORD *)&v138.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&v138.st_rdev + 6) = 1024;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "State Dump: filename is too long to be put into the buffer, ignoring the current file - file name to be copi ed: %{sensitive, mask.hash}s, length: %u, buffer length: %u",  (uint8_t *)&v138,  0x22u);
LABEL_80:
          __darwin_time_t v36 = v123;
        }
      }
    }
  }

  closedir(v35);
  bzero(buf, 0x400uLL);
  if (v126 < 5u) {
    goto LABEL_121;
  }
  if ((snprintf((char *)buf, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", __s) - 1024) <= 0xFFFFFC00)
  {
    uint64_t v85 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_208;
      }
    }

    else
    {
      uint64_t v85 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_208;
      }
    }

    size_t v101 = strlen(__s);
    v138.st_dev = 134218496;
    *(void *)&v138.st_mode = 1024LL;
    WORD2(v138.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v138.st_ino + 6) = 30LL;
    HIWORD(v138.st_gid) = 2048;
    *(void *)&v138.st_rdev = v101;
    __int16 v102 = "State Dump: snprintf truncates the final string - buffer length: %zu, directory name length: %zu, old file name length: %zu";
    int v103 = (os_log_s *)v85;
    uint32_t v104 = 32;
    goto LABEL_207;
  }

  uint64_t v86 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
  }

  else
  {
    uint64_t v86 = mDNSLogCategory_XPC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
    {
LABEL_206:
      unsigned int v105 = __error();
      size_t v106 = strerror(*v105);
      v138.st_dev = 136446466;
      *(void *)&v138.st_mode = buf;
      WORD2(v138.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v138.st_ino + 6) = (__darwin_ino64_t)v106;
      __int16 v102 = "State Dump: file %{public}s cannot be deleted, reason: %{public}s";
      int v103 = (os_log_s *)v86;
      uint32_t v104 = 22;
LABEL_207:
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, v102, (uint8_t *)&v138, v104);
    }
  }

LABEL_215:
  int v29 = 255;
  int uint64 = v128;
LABEL_242:
  int v21 = v125;
LABEL_243:
  KQueueUnlock((uint64_t)"State Dump", v22, v23, v24, v25, v26, v27, v28);
  buf[0].st_ino = 0LL;
  *(void *)&buf[0].st_dev = 0LL;
  gettimeofday((timeval *)buf, 0LL);
  int v122 = timediff_ms((uint64_t *)&buf[0].st_dev, &v129.tv_sec);
  if (v29)
  {
    xpc_dictionary_set_string(v15, "ErrorDescription", "State dump fails");
    uint64_t v32 = 3LL;
  }

  else
  {
    xpc_dictionary_set_int64(v15, "mDNSResponderDumpTimeUsed", v122);
    uint64_t v32 = 0LL;
  }

  close(v21);
LABEL_56:
  xpc_dictionary_set_uint64(v15, "DaemonReplyStatusToClient", v32);
  xpc_connection_send_message(remote_connection, v15);
  __int16 v12 = v15;
LABEL_57:
  xpc_release(v12);
}

uint64_t timediff_ms(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (*a1 < *a2) {
    return -timediff_ms(a2, a1);
  }
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *((_DWORD *)a2 + 2);
  if (v2 == v3 && v4 < v5) {
    return -timediff_ms(a2, a1);
  }
  int v7 = v2 - v3;
  int v8 = v4 + 1000000;
  if (v4 >= v5) {
    int v8 = *((_DWORD *)a1 + 2);
  }
  return (v8 - v5) / 1000 + 1000 * (v7 - (v4 < v5));
}

void *_mdns_dso_server_endpoint_copy_description(void *a1, int a2)
{
  int v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0LL;
  }
  int v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8LL), a1))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    descriptioint n = (const char *)nw_endpoint_get_description(a1[3]);
    mdns_string_builder_append_formatted(v5, "[endpoint: %s", description);
    mdns_string_builder_append_formatted(v5, ", abort count: %zu", a1[4]);
    uint64_t v8 = a1[5];
    if (v8)
    {
      int64_t v9 = v8 - mach_continuous_time();
      if (v9 >= 1)
      {
        unint64_t v10 = mdns_ticks_to_milliseconds(v9);
        mdns_string_builder_append_formatted(v5, ", delayed retry in %llums", v10);
      }
    }

    mdns_string_builder_append_formatted(v5, "]");
    uint64_t v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }

  os_release(v5);
  return v6;
}

void _mdns_dso_server_endpoint_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    nw_release(v2);
    *(void *)(a1 + 24) = 0LL;
  }

const char *_mdns_dso_server_endpoint_manager_copy_description()
{
  return "<This is a DSO server endpoint manager object>";
}

void _mdns_dso_server_endpoint_manager_finalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0LL;
  }

uint64_t _mdns_dso_server_endpoint_is_usable_now(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) >= 2uLL)
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v7 = mach_continuous_time();
    if (mdns_mach_ticks_per_second_s_once != -1)
    {
      uint64_t v12 = v7;
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3412);
      uint64_t v7 = v12;
    }

    uint64_t v6 = v7 + 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    *(void *)(a1 + 40) = v6;
  }

  if (!v6)
  {
    uint64_t result = 1LL;
    int v9 = -1;
    if (a2) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }

void ref_count_obj_release(void *a1)
{
  if ((*(_DWORD *)a1)-- == 1)
  {
    for (unint64_t i = (void *)a1[1]; i; unint64_t i = (void *)*i)
    {
      int v4 = (void (*)(void *))i[4];
      if (v4) {
        v4(a1);
      }
    }

    free(a1);
  }

uint64_t ref_count_obj_compare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == a2) {
    return 0LL;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6 == *(void **)(a2 + 8))
  {
    while (v6)
    {
      int64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v6[3];
      if (v8)
      {
        uint64_t result = v8(a1, a2, a3);
        if ((_DWORD)result != 3) {
          return result;
        }
      }

      uint64_t v6 = (void *)*v6;
    }

    return 3LL;
  }

  else if ((_DWORD)a3)
  {
    return 2LL;
  }

  else
  {
    return 3LL;
  }

uint64_t _cache_item_get_tracker_state(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    int DispositionRedactLogs = *(_DWORD *)(a1 + 32);
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 8);
    uint64_t AppInfo = NEHelperTrackerGetAppInfo();
    if (!AppInfo)
    {
      unsigned __int16 v18 = 0;
      *(void *)(a1 + 16) = 0LL;
      return v18;
    }

    uint64_t v9 = AppInfo;
    memset(v25, 0, sizeof(v25));
    uint64_t v10 = *(void *)(v2 + 120);
    uint64_t v11 = *(void *)(v2 + 128);
    uint64_t v12 = (_OWORD *)(v10 + 24);
    BOOL v13 = v10 == 0;
    char v14 = v25;
    if (v13) {
      uint64_t v12 = v25;
    }
    if (v11) {
      char v14 = (_OWORD *)(v11 + 24);
    }
    __int128 v15 = v14[1];
    *(_OWORD *)atoken.val = *v14;
    *(_OWORD *)&atoken.val[4] = v15;
    __int128 v16 = v12[1];
    v24[0] = *v12;
    v24[1] = v16;
    ((void (*)(uint64_t, audit_token_t *, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))NEHelperTrackerAppInfoSetAuditToken)( AppInfo,  &atoken,  v24,  v4,  v5,  v6,  v7,  v8);
    if (!*(void *)(v2 + 128))
    {
      int v20 = *(_DWORD *)(v2 + 244);
      if (v20)
      {
        uint64_t v21 = *(void *)(v2 + 120);
        if (v21)
        {
          __int128 v22 = *(_OWORD *)(v21 + 40);
          *(_OWORD *)atoken.val = *(_OWORD *)(v21 + 24);
          *(_OWORD *)&atoken.val[4] = v22;
          pid_t v23 = audit_token_to_pid(&atoken);
          int v20 = *(_DWORD *)(v2 + 244);
        }

        else
        {
          pid_t v23 = 0;
        }

        if (v23 != v20) {
          NEHelperTrackerAppInfoSetPID(v9);
        }
      }

      else
      {
        if (_create_tracker_app_info_s_once != -1) {
          dispatch_once(&_create_tracker_app_info_s_once, &__block_literal_global_7372);
        }
        *(_OWORD *)atoken.val = *(_OWORD *)(v2 + 636);
        NEHelperTrackerAppInfoSetUUID(v9, &atoken, &_create_tracker_app_info_s_null_uuid);
      }
    }

    if (*(_BYTE *)(v2 + 633)) {
      NEHelperTrackerAppInfoSetIsBrowser(v9);
    }
    *(void *)(a1 + 16) = v9;
    int DispositionRedactLogs = NEHelperTrackerGetDispositionRedactLogs( v9,  *(void *)(a1 + 40),  a1 + 24,  0LL,  gSensitiveLoggingEnabled);
    *(_DWORD *)(a1 + 32) = DispositionRedactLogs;
  }

  if (DispositionRedactLogs) {
    return 2;
  }
  else {
    return 1;
  }
}

void ___create_tracker_app_info_block_invoke(id a1)
{
}

uint64_t resolved_cache_get_tracker_state(uint64_t a1, void *a2, void *a3, BOOL *a4, _BYTE *a5)
{
  if (!&_NEHelperTrackerGetAppInfo) {
    return 0LL;
  }
  uint64_t v9 = &s_head_0;
  do
  {
    uint64_t v9 = (uint64_t *)*v9;
    if (!v9) {
      return 0LL;
    }
  }

  while (v9[1] != a1);
  uint64_t result = _cache_item_get_tracker_state((uint64_t)v9);
  if ((_DWORD)result == 2)
  {
    if (a4) {
      *a4 = *((_DWORD *)v9 + 8) == 3;
    }
    if (a2) {
      *a2 = NEHelperTrackerContextGetDomain(v9[3]);
    }
    if (a3) {
      *a3 = NEHelperTrackerContextGetDomainOwner(v9[3]);
    }
    if (a5) {
      *a5 = NEHelperTrackerContextCanBlockRequest(v9[3]);
    }
    return 2LL;
  }

  return result;
}

void _cache_item_report(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 48)))
  {
    if (_os_feature_enabled_impl("symptomsd", "networking_transparency"))
    {
      uint64_t v2 = *(void *)(a1 + 8);
      memset(v16, 0, sizeof(v16));
      uint64_t v3 = *(void *)(v2 + 120);
      uint64_t v4 = *(void *)(v2 + 128);
      if (v3) {
        uint64_t v5 = (_OWORD *)(v3 + 24);
      }
      else {
        uint64_t v5 = v16;
      }
      if (v4)
      {
        uint64_t v6 = (_OWORD *)(v4 + 24);
        uint64_t v7 = *(const __CFArray **)(a1 + 40);
        uint64_t v8 = *(const __CFArray **)(a1 + 48);
        BOOL v9 = *(_BYTE *)(v2 + 633) != 0;
        unsigned int v10 = *(_DWORD *)(v2 + 252);
        uint64_t v11 = v5;
        int v12 = 0;
        BOOL v13 = 0LL;
      }

      else
      {
        int v12 = *(_DWORD *)(v2 + 244);
        if (v12)
        {
          if (v3)
          {
            __int128 v14 = *(_OWORD *)(v3 + 40);
            *(_OWORD *)atoken.val = *(_OWORD *)(v3 + 24);
            *(_OWORD *)&atoken.val[4] = v14;
            LODWORD(v3) = audit_token_to_pid(&atoken);
            int v12 = *(_DWORD *)(v2 + 244);
          }

          uint64_t v7 = *(const __CFArray **)(a1 + 40);
          uint64_t v8 = *(const __CFArray **)(a1 + 48);
          unsigned int v10 = *(_DWORD *)(v2 + 252);
          BOOL v15 = (_DWORD)v3 == v12 || v12 == 0;
          BOOL v9 = *(unsigned __int8 *)(v2 + 633) != 0;
          uint64_t v11 = v5;
          if (v15) {
            int v12 = 0;
          }
          BOOL v13 = 0LL;
        }

        else
        {
          uint64_t v7 = *(const __CFArray **)(a1 + 40);
          uint64_t v8 = *(const __CFArray **)(a1 + 48);
          BOOL v9 = *(_BYTE *)(v2 + 633) != 0;
          unsigned int v10 = *(_DWORD *)(v2 + 252);
          BOOL v13 = (const unsigned __int8 *)(v2 + 636);
          uint64_t v11 = v5;
        }

        uint64_t v6 = 0LL;
      }

      _mdns_symptoms_report_resolved(v7, v8, v11, v9, v10, v12, v13, v6);
    }

    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 48));
  }

void resolved_cache_delete(uint64_t a1)
{
  if (&_NEHelperTrackerGetAppInfo || _os_feature_enabled_impl("symptomsd", "networking_transparency"))
  {
    uint64_t v2 = &s_head_0;
    uint64_t v3 = &s_head_0;
    while (1)
    {
      uint64_t v3 = (uint64_t *)*v3;
      if (!v3) {
        break;
      }
      if (v3[1] == a1)
      {
        _cache_item_report((uint64_t)v3);
        *uint64_t v2 = *v3;
        uint64_t v5 = (const void *)v3[5];
        if (v5)
        {
          CFRelease(v5);
          v3[5] = 0LL;
        }

        uint64_t v6 = (const void *)v3[6];
        if (v6)
        {
          CFRelease(v6);
          v3[6] = 0LL;
        }

        if (v3[2]) {
          NEHelperTrackerFreeAppInfo();
        }
        free(v3);
        return;
      }
    }
  }

uint64_t _mdns_tcpinfo_get_info(_BYTE *a1, void *a2)
{
  *a1 = 6;
  memset(__src, 0, 408);
  size_t v4 = 408LL;
  if (sysctlbyname("net.inet.tcp.info", __src, &v4, a1, 0x3CuLL) == -1)
  {
    if (!*__error()) {
      return 4294960596LL;
    }
    uint64_t result = *__error();
    if (!a2) {
      return result;
    }
  }

  else
  {
    uint64_t result = 0LL;
    if (!a2) {
      return result;
    }
  }

  if (!(_DWORD)result)
  {
    memcpy(a2, __src, 0x198uLL);
    return 0LL;
  }

  return result;
}

void ___mdns_tcpinfo_log_block_invoke(id a1)
{
  _mdns_tcpinfo_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "tcpinfo");
}

id objc_msgSend_updatePresenseData(void *a1, const char *a2, ...)
{
  return [a1 updatePresenseData];
}