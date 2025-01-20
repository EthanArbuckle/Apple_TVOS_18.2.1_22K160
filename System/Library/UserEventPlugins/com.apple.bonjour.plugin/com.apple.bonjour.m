void init_bonjour_registration(uint64_t a1)
{
  *(void *)calloc(1uLL, 0x18uLL) = a1;
  xpc_event_provider_create();
}

void sub_2E2C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a1 == 2)
  {
    v15 = (void **)(a4 + 16);
    v16 = (void *)(a4 + 16);
    while (1)
    {
      v16 = (void *)*v16;
      if (!v16) {
        break;
      }
      if (v16[2] == a2)
      {
        for (i = *v15; i != v16; i = (void *)*i)
          v15 = (void **)i;
        *v15 = (void *)*v16;
        unint64_t v18 = v16[4];
        if (v18)
        {
          for (unint64_t j = 0LL; j < v18; ++j)
          {
            v20 = *(dispatch_source_s **)(v16[5] + 8 * j);
            if (v20)
            {
              dispatch_source_cancel(v20);
              dispatch_release(*(dispatch_object_t *)(v16[5] + 8 * j));
              unint64_t v18 = v16[4];
            }
          }
        }

        free((void *)v16[5]);
        dispatch_release((dispatch_object_t)v16[3]);
        free(v16);
        return;
      }
    }

    return;
  }

  if (a1 != 1) {
    return;
  }
  v7 = (char *)malloc(0x30uLL);
  *((void *)v7 + 1) = *(void *)(a4 + 8);
  *((void *)v7 + 2) = a2;
  snprintf(__str, 0x64uLL, "com.apple.bonjour.registration.token%llu", a2);
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
  *((void *)v7 + 3) = dispatch_queue_create(__str, v9);
  *((void *)v7 + 4) = 0LL;
  v10 = (size_t *)(v7 + 32);
  *((void *)v7 + 5) = 0LL;
  *(void *)v7 = *(void *)(a4 + 16);
  *(void *)(a4 + 16) = v7;
  if (!xpc_dictionary_get_value(a3, "Bonjour"))
  {
    *(void *)v87 = 0LL;
    v88 = v87;
    uint64_t v89 = 0x2000000000LL;
    xpc_object_t objects = 0LL;
    p_xpc_object_t objects = &objects;
    uint64_t v83 = 0x2000000000LL;
    uint64_t v84 = 0LL;
    unint64_t int64 = xpc_dictionary_get_int64(a3, "Flags");
    int v22 = int64;
    if (HIDWORD(int64))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3B74();
      }
      int v22 = 0;
    }

    int64_t v23 = xpc_dictionary_get_int64(a3, "InterfaceIndex");
    int v24 = v23;
    if ((unint64_t)(v23 - 0x100000000LL) <= 0xFFFFFFFE7FFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3B00();
      }
      int v24 = 0;
    }

    string = xpc_dictionary_get_string(a3, "Name");
    v26 = xpc_dictionary_get_string(a3, "RegistrationType");
    v27 = xpc_dictionary_get_string(a3, "Domain");
    v28 = xpc_dictionary_get_string(a3, "Host");
    unint64_t v29 = xpc_dictionary_get_int64(a3, "Port");
    __int16 v30 = v29;
    if (v29 >= 0x10000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3A8C();
      }
      __int16 v30 = 0;
    }

    data = xpc_dictionary_get_data(a3, "TXTRecord", (size_t *)&length);
    size_t v32 = (size_t)length;
    if ((unint64_t)length >= 0x10000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3A18();
      }
      size_t v32 = 0LL;
      data = 0LL;
      length = 0LL;
    }

    v33 = (dispatch_queue_s *)*((void *)v7 + 3);
    *(void *)&block.ai_flags = _NSConcreteStackBlock;
    *(void *)&block.ai_sockxpc_type_t type = 0x40000000LL;
    *(void *)&block.ai_addrlen = sub_36F4;
    block.ai_canonname = (char *)&unk_4190;
    block.ai_addr = (sockaddr *)v87;
    block.ai_next = (addrinfo *)&objects;
    int v78 = v22;
    int v79 = v24;
    v71 = string;
    v72 = v26;
    v73 = v27;
    v74 = v28;
    __int16 v80 = v30;
    size_t v75 = v32;
    v76 = data;
    v77 = v7;
    dispatch_sync(v33, &block);
    uint64_t v34 = *((int *)v88 + 6);
    if ((_DWORD)v34)
    {
      _os_assumes_log(v34);
    }

    else
    {
      dnssd_sock_t v35 = DNSServiceRefSockFD((DNSServiceRef)p_objects[3]);
      dispatch_source_t v36 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v35,  0LL,  *((dispatch_queue_t *)v7 + 3));
      dispatch_set_context(v36, p_objects[3]);
      dispatch_source_set_event_handler_f(v36, (dispatch_function_t)&DNSServiceProcessResult);
      dispatch_source_set_cancel_handler_f(v36, (dispatch_function_t)&DNSServiceRefDeallocate);
      dispatch_resume(v36);
      if (v36)
      {
        *((void *)v7 + 4) = 1LL;
        v37 = calloc(1uLL, 8uLL);
        *((void *)v7 + 5) = v37;
        void *v37 = v36;
      }
    }

    _Block_object_dispose(&objects, 8);
    _Block_object_dispose(v87, 8);
    return;
  }

  xpc_object_t value = xpc_dictionary_get_value(a3, "Bonjour");
  v12 = value;
  xpc_object_t objects = value;
  if (!value)
  {
    _os_assumes_log(0LL);
    goto LABEL_46;
  }

  xpc_type_t type = xpc_get_type(value);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (v12 != &_xpc_BOOL_true) {
      _os_assumes_log(0LL);
    }
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v14 = xpc_array_create(&objects, 1uLL);
      goto LABEL_45;
    }

    if (type == (xpc_type_t)&_xpc_type_array)
    {
      xpc_object_t v14 = xpc_retain(v12);
LABEL_45:
      v12 = v14;
      goto LABEL_46;
    }
  }

  v12 = 0LL;
LABEL_46:
  memset(&block, 0, sizeof(block));
  xpc_object_t v38 = xpc_dictionary_get_value(a3, "SockType");
  xpc_object_t objects = v38;
  if (!v38) {
    goto LABEL_52;
  }
  if (xpc_get_type(v38) != (xpc_type_t)&_xpc_type_string)
  {
LABEL_48:
    char v39 = 0;
    goto LABEL_54;
  }

  string_ptr = xpc_string_get_string_ptr(objects);
  if (!strcasecmp(string_ptr, "stream"))
  {
LABEL_52:
    int v42 = 1;
  }

  else
  {
    v41 = xpc_string_get_string_ptr(objects);
    if (strcasecmp(v41, "dgram")) {
      goto LABEL_48;
    }
    int v42 = 2;
  }

  block.ai_sockxpc_type_t type = v42;
  char v39 = 1;
LABEL_54:
  xpc_object_t v43 = xpc_dictionary_get_value(a3, "SockPassive");
  xpc_object_t objects = v43;
  if (v43)
  {
    int v44 = 1;
    if (v43 == &_xpc_BOOL_true)
    {
      block.ai_flags = 1;
      int v44 = 0;
    }
  }

  else
  {
    int v44 = 0;
    block.ai_flags = 1;
  }

  xpc_object_t v45 = xpc_dictionary_get_value(a3, "SockNodeName");
  xpc_object_t objects = v45;
  if (v45 && xpc_get_type(v45) == (xpc_type_t)&_xpc_type_string) {
    v46 = xpc_string_get_string_ptr(objects);
  }
  else {
    v46 = 0LL;
  }
  xpc_object_t v47 = xpc_dictionary_get_value(a3, "SockServiceName");
  xpc_object_t objects = v47;
  if (v47)
  {
    xpc_type_t v48 = xpc_get_type(v47);
    if (v48 == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t v50 = xpc_int64_get_value(objects);
      v49 = v87;
      snprintf(v87, 0x15uLL, "%lld", v50);
      goto LABEL_68;
    }

    if (v48 == (xpc_type_t)&_xpc_type_string)
    {
      v49 = xpc_string_get_string_ptr(objects);
      goto LABEL_68;
    }
  }

  v49 = 0LL;
LABEL_68:
  xpc_object_t v51 = xpc_dictionary_get_value(a3, "SockFamily");
  xpc_object_t objects = v51;
  if (v51 && xpc_get_type(v51) == (xpc_type_t)&_xpc_type_string)
  {
    v52 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v52, "IPv4"))
    {
      int v54 = 2;
      goto LABEL_74;
    }

    v53 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v53, "IPv6"))
    {
      int v54 = 30;
LABEL_74:
      block.ai_family = v54;
    }
  }

  xpc_object_t v55 = xpc_dictionary_get_value(a3, "SockProtocol");
  xpc_object_t objects = v55;
  if (v55 && xpc_get_type(v55) == (xpc_type_t)&_xpc_type_string)
  {
    v56 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v56, "TCP"))
    {
      int v58 = 6;
    }

    else
    {
      v57 = xpc_string_get_string_ptr(objects);
      if (strcasecmp(v57, "UDP")) {
        goto LABEL_82;
      }
      int v58 = 17;
    }

    block.ai_protocol = v58;
  }

LABEL_82:
  if ((v39 & 1) != 0)
  {
    if (!v44) {
      goto LABEL_84;
    }
  }

  else
  {
    _os_assumes_log(0LL);
    if (!v44) {
      goto LABEL_84;
    }
  }

  _os_assumes_log(0LL);
LABEL_84:
  int v59 = getaddrinfo(v46, v49, &block, &length);
  if (v59)
  {
    _os_assumes_log(v59);
    if (v12) {
LABEL_112:
    }
      xpc_release(v12);
  }

  else
  {
    size_t v60 = (size_t)length;
    if (length)
    {
      while (1)
      {
        int v61 = *(_DWORD *)(v60 + 4);
        BOOL v62 = v61 == 30 || v61 == 2;
        if (v12)
        {
          size_t count = xpc_array_get_count(v12);
          *((void *)v7 + 4) = count;
          *((void *)v7 + 5) = calloc(count, 8uLL);
          if (!*((void *)v7 + 4)) {
            goto LABEL_106;
          }
          size_t v64 = 0LL;
          uint64_t v65 = 0LL;
          do
          {
            xpc_object_t v66 = xpc_array_get_value(v12, v64);
            if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_string)
            {
              v67 = xpc_string_get_string_ptr(v66);
              *(void *)(*((void *)v7 + 5) + 8 * v64) = sub_3784(v60, v67, *((dispatch_queue_s **)v7 + 3));
              if (*(void *)(*((void *)v7 + 5) + 8 * v64)) {
                ++v65;
              }
            }

            else
            {
              _os_assumes_log(0LL);
            }

            ++v64;
            size_t v68 = *v10;
          }

          while (v64 < *v10);
        }

        else
        {
          *((void *)v7 + 4) = 1LL;
          *((void *)v7 + 5) = calloc(1uLL, 8uLL);
          **((void **)v7 + 5) = sub_3784(v60, v49, *((dispatch_queue_s **)v7 + 3));
          size_t v68 = *((void *)v7 + 4);
          uint64_t v65 = **((void **)v7 + 5) != 0LL;
        }

        if (v65 == v68)
        {
          if (v65) {
            goto LABEL_109;
          }
        }

        else
        {
          _os_assumes_log(0LL);
          if (v65)
          {
LABEL_109:
            v69 = length;
            goto LABEL_111;
          }
        }

LABEL_106:
        size_t v60 = *(void *)(v60 + 40);
        if (!v60) {
          goto LABEL_109;
        }
      }
    }

    v69 = 0LL;
LABEL_111:
    freeaddrinfo(v69);
    if (v12) {
      goto LABEL_112;
    }
  }
}

uint64_t sub_36F4(uint64_t a1)
{
  uint64_t result = DNSServiceRegister( (DNSServiceRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(_DWORD *)(a1 + 104),  *(_DWORD *)(a1 + 108),  *(const char **)(a1 + 48),  *(const char **)(a1 + 56),  *(const char **)(a1 + 64),  *(const char **)(a1 + 72),  bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16,  *(void *)(a1 + 80),  *(const void **)(a1 + 88),  (DNSServiceRegisterReply)sub_3764,  *(void **)(a1 + 96));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_3764(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    return _os_assumes_log(a3);
  }
  return result;
}

dispatch_source_t sub_3784(uint64_t a1, const char *a2, dispatch_queue_s *a3)
{
  uint64_t v23 = 0LL;
  int v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 1);
  if (v6 == 30)
  {
    if (!*(_DWORD *)(v5 + 8) && !*(_DWORD *)(v5 + 12) && !*(_DWORD *)(v5 + 16))
    {
      v7 = (_DWORD *)(v5 + 20);
      int v8 = 0x1000000;
LABEL_4:
      if (*v7 == v8) {
        int v9 = -1;
      }
      else {
        int v9 = 0;
      }
      goto LABEL_11;
    }
  }

  else if (v6 == 2)
  {
    v7 = (_DWORD *)(v5 + 4);
    int v8 = 16777343;
    goto LABEL_4;
  }

  int v9 = 0;
LABEL_11:
  if (*(_DWORD *)(a1 + 8) == 1) {
    v10 = "tcp";
  }
  else {
    v10 = "udp";
  }
  snprintf(__str, 0xC8uLL, "_%s._%s.", a2, v10);
  __int16 v11 = *(_WORD *)(*(void *)(a1 + 32) + 2LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_3988;
  block[3] = &unk_41B8;
  block[4] = &v23;
  block[5] = &v19;
  int v17 = v9;
  block[6] = __str;
  __int16 v18 = v11;
  dispatch_sync(a3, block);
  uint64_t v12 = *((int *)v24 + 6);
  if ((_DWORD)v12)
  {
    _os_assumes_log(v12);
    dispatch_source_t v14 = 0LL;
  }

  else
  {
    dnssd_sock_t v13 = DNSServiceRefSockFD((DNSServiceRef)v20[3]);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v13, 0LL, a3);
    dispatch_set_context(v14, (void *)v20[3]);
    dispatch_source_set_event_handler_f(v14, (dispatch_function_t)&DNSServiceProcessResult);
    dispatch_source_set_cancel_handler_f(v14, (dispatch_function_t)&DNSServiceRefDeallocate);
    dispatch_resume(v14);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

uint64_t sub_3988(uint64_t a1)
{
  uint64_t result = DNSServiceRegister( (DNSServiceRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  0,  *(_DWORD *)(a1 + 56),  0LL,  *(const char **)(a1 + 48),  0LL,  0LL,  *(_WORD *)(a1 + 60),  0,  0LL,  0LL,  0LL);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_39EC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_3A18()
{
}

void sub_3A8C()
{
}

void sub_3B00()
{
}

void sub_3B74()
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}