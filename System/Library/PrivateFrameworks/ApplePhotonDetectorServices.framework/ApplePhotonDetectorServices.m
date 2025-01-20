uint64_t connect(uint64_t a1, const char *a2)
{
  mach_port_t v4;
  CFDictionaryRef v5;
  uint64_t MatchingServices;
  io_iterator_t v7;
  uint64_t v8;
  int v9;
  char **v10;
  CFDictionaryRef v11;
  uint64_t v12;
  CFDictionaryRef v13;
  io_service_t MatchingService;
  io_object_t v15;
  CFNumberRef v16;
  CFNumberRef v17;
  const char *v18;
  const char *v19;
  dispatch_queue_s *v20;
  xpc_connection_t mach_service;
  os_log_s *v22;
  const char *v23;
  io_iterator_t existing;
  char valuePtr;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;
  v29 = *MEMORY[0x1895F89C0];
  valuePtr = 0;
  existing = 0;
  if (!a1) {
    return 3758096385LL;
  }
  v4 = *MEMORY[0x1896086A8];
  v5 = IOServiceMatching("AppleH13CamIn");
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  v7 = existing;
  if (existing)
  {
    v8 = MatchingServices;
    v9 = 0;
    v10 = off_18A358580;
  }

  else
  {
    v11 = IOServiceMatching("AppleH16CamIn");
    v12 = IOServiceGetMatchingServices(v4, v11, &existing);
    if (!existing) {
      return 3758097086LL;
    }
    v8 = v12;
    v10 = &off_18A358588;
    v9 = 1;
  }

  v13 = IOServiceNameMatching(*v10);
  MatchingService = IOServiceGetMatchingService(v4, v13);
  v15 = MatchingService;
  if (MatchingService)
  {
    v16 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"RestoreMode",  (CFAllocatorRef)*MEMORY[0x189604DB0],  3u);
    v17 = v16;
    if (v16) {
      CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
    }
  }

  else
  {
    v17 = 0LL;
  }

  *(_DWORD *)(a1 + 16) = v9;
  if (v7)
  {
    v18 = "com.apple.dietappleh13camerad";
    *(void *)(a1 + 24) = "H13ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H13ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v18;
    *(void *)(a1 + 48) = "H13ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H13ISPServicesRemoteFusingLengthKey";
  }

  else
  {
    v19 = "com.apple.dietappleh16camerad";
    *(void *)(a1 + 24) = "H16ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H16ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v19;
    *(void *)(a1 + 48) = "H16ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H16ISPServicesRemoteFusingLengthKey";
    *(void *)(a1 + 64) = "H16ISPServicesRemoteIORegPropertyNameKey";
    *(void *)(a1 + 72) = "H16ISPServicesRemoteIORegPropertyDataKey";
  }

  v20 = dispatch_queue_create(a2, 0LL);
  *(void *)(a1 + 8) = v20;
  if (v20)
  {
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 40), v20, 0LL);
    *(void *)a1 = mach_service;
    if (mach_service) {
      goto LABEL_27;
    }
    v8 = 3758097086LL;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = (os_log_s *)MEMORY[0x1895F8DA0];
    v23 = "%s: Could not establish a connection\n";
    goto LABEL_26;
  }

  v8 = 3758097086LL;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = (os_log_s *)MEMORY[0x1895F8DA0];
    v23 = "%s: Could not create a serial dispatch queue, exiting\n";
LABEL_26:
    _os_log_impl(&dword_18913A000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }

LABEL_27:
  if (existing)
  {
    IOObjectRelease(existing);
    existing = 0;
  }

  if (v15) {
    IOObjectRelease(v15);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v8;
}

    *v9 = v18;
    _Block_object_dispose(&v44, 8);
    goto LABEL_28;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v62 = "ApplePhotonDetectorServicesGetLuxAsync";
    v63 = 2048;
    v64 = v7;
    v65 = 2048;
    v66 = v6;
    v67 = 2048;
    v68 = v5;
    v69 = 2048;
    v70 = v8;
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid arguments, replyQueue = 0x%p, info = 0x%p, UserCallback = 0x%p, handle = %p exiting\n",  buf,  0x34u);
    v17 = v53;
  }

  else
  {
    v17 = &v52;
  }

  *((_DWORD *)v17 + 6) = -536870911;
LABEL_28:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  return 0LL;
}

void disconnect(xpc_connection_t *a1)
{
  v2 = *a1;
  if (v2)
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global);
    xpc_connection_cancel(*a1);
    xpc_release(*a1);
    *a1 = 0LL;
  }
}

xpc_object_t sendSynchronousXpcMsgWithReply()
{
  v0 = (xpc_connection_t *)MEMORY[0x1895F8858]();
  *(void *)&v23[3293] = *MEMORY[0x1895F89C0];
  if (*v0)
  {
    uint64_t v4 = v3;
    int v5 = v2;
    int v6 = v1;
    v7 = v0;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v8)
    {
      v9 = v8;
      if (v5 == 1)
      {
        bzero(&bytes, 0x3378uLL);
        int bytes = v6;
        switch(v6)
        {
          case 204:
          case 207:
          case 212:
            if (v4)
            {
              uint64_t v14 = *(void *)(v4 + 16);
              v13 = (size_t *)(v4 + 16);
              *(void *)&v23[1] = *(v13 - 1);
              *(void *)&v23[3] = v14;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[6], *(const void **)&v23[1], *v13);
              xpc_dictionary_set_uint64(v9, (const char *)v7[7], *(uint64_t *)&v23[3]);
            }

            else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = (os_log_s *)MEMORY[0x1895F8DA0];
              v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_29;
            }

            break;
          case 205:
          case 206:
          case 209:
          case 210:
            goto LABEL_20;
          case 208:
            xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
            xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
            break;
          case 211:
            if (v4)
            {
              uint64_t v18 = *(void *)(v4 + 24);
              v17 = (size_t *)(v4 + 24);
              *(_OWORD *)&v23[1] = *((_OWORD *)v17 - 1);
              *(void *)&v23[5] = v18;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_string(v9, (const char *)v7[8], *(const char **)&v23[1]);
              xpc_dictionary_set_data(v9, (const char *)v7[9], *(const void **)&v23[3], *v17);
              break;
            }

            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
              break;
            }
            int v20 = 136315138;
            v21 = "sendSynchronousXpcMsgWithReply";
            v15 = (os_log_s *)MEMORY[0x1895F8DA0];
            v16 = "%s: Missing property information to set, returning\n";
            goto LABEL_29;
          default:
            if (v6 == 105)
            {
              v23[1] = *(_DWORD *)(v4 + 8);
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
            }

            else
            {
LABEL_20:
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                int v20 = 136315138;
                v21 = "sendSynchronousXpcMsgWithReply";
                v15 = (os_log_s *)MEMORY[0x1895F8DA0];
                v16 = "%s: Unhandled property\n";
LABEL_29:
                _os_log_impl(&dword_18913A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);
              }
            }

            break;
        }
      }

      else
      {
        if (v5 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            int bytes = 136315138;
            *(void *)v23 = "sendSynchronousXpcMsgWithReply";
            _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Unexpected property type, returning\n",  (uint8_t *)&bytes,  0xCu);
          }

          xpc_object_t v12 = 0LL;
          goto LABEL_31;
        }

        bzero(&bytes, 0xE60uLL);
        int bytes = v6;
        xpc_dictionary_set_uint64(v9, (const char *)v7[3], 2uLL);
        xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0xE60uLL);
      }

      xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(*v7, v9);
LABEL_31:
      xpc_release(v9);
      return v12;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int bytes = 136315138;
      *(void *)v23 = "sendSynchronousXpcMsgWithReply";
      v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      v11 = "%s: Could not create dictionary, exiting\n";
      goto LABEL_10;
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int bytes = 136315138;
    *(void *)v23 = "sendSynchronousXpcMsgWithReply";
    v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    v11 = "%s: Connection is invalid, exiting \n";
LABEL_10:
    _os_log_impl(&dword_18913A000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&bytes, 0xCu);
  }

  return 0LL;
}

uint64_t ApplePhotonDetectorServicesGetGlobalCorrectionFactor(void *a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x7802000000LL;
  v19 = __Block_byref_object_copy_;
  int v20 = __Block_byref_object_dispose_;
  memset(v21, 0, sizeof(v21));
  if (a1)
  {
    uint64_t v2 = connect((uint64_t)v21, "com.apple.applephotondetectorservicesqueue");
    if ((_DWORD)v2) {
      goto LABEL_18;
    }
    uint64_t v3 = (_xpc_connection_s *)v17[5];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke;
    handler[3] = &unk_18A3585D8;
    handler[4] = &v16;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_activate((xpc_connection_t)v17[5]);
    xpc_object_t v4 = sendSynchronousXpcMsgWithReply();
    int v5 = v4;
    if (v4)
    {
      if (MEMORY[0x1895E083C](v4) == MEMORY[0x1895F9250])
      {
        data = xpc_dictionary_get_data(v5, (const char *)v17[9], &length);
        size_t v10 = length;
        if (length == 3680)
        {
          uint64_t v2 = 0LL;
          *a1 = data[1];
        }

        else
        {
          uint64_t v2 = 3758097087LL;
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
            __int16 v24 = 2048;
            size_t v25 = v10;
            __int16 v26 = 2048;
            uint64_t v27 = 3680LL;
            int v6 = (os_log_s *)MEMORY[0x1895F8DA0];
            v7 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
            uint32_t v8 = 32;
            goto LABEL_16;
          }
        }
      }

      else
      {
        uint64_t v2 = 3758097097LL;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
          int v6 = (os_log_s *)MEMORY[0x1895F8DA0];
          v7 = "%s: Received an unexpected event\n";
          uint32_t v8 = 12;
LABEL_16:
          _os_log_impl(&dword_18913A000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
        }
      }

      xpc_release(v5);
      goto LABEL_18;
    }

    uint64_t v2 = 3758097087LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from daemon\n",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid arguments, exiting\n",  buf,  0xCu);
    }

    uint64_t v2 = 3758096385LL;
  }

LABEL_18:
  v11 = (dispatch_queue_s *)v17[6];
  if (v11)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2;
    v13[3] = &unk_18A358600;
    v13[4] = &v16;
    dispatch_sync(v11, v13);
    dispatch_release((dispatch_object_t)v17[6]);
    v17[6] = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v2;
}

      xpc_release(v7);
      return int64;
    }

    int64 = 3758097087LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from the daemon\n",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid pointer to the connection object\n",  buf,  0xCu);
    }

    return 3758096385LL;
  }

  return int64;
}

void sub_18913B930( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  __n128 result = *(__n128 *)(a2 + 56);
  __int128 v3 = *(_OWORD *)(a2 + 72);
  __int128 v4 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8_Block_object_dispose(va, 8) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9268])
  {
    if (a2 == MEMORY[0x1895F91A0])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        __int128 v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        int v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_18913A000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
      }
    }

    else
    {
      if (a2 != MEMORY[0x1895F9198])
      {
        if (a2 != MEMORY[0x1895F91C8] || !os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        int v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        __int128 v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        int v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        __int128 v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        int v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }

LABEL_12:
    disconnect((xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  }

    disconnect((xpc_connection_t *)(*(void *)(a1[4] + 8LL) + 40LL));
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_5;
    block[3] = &__block_descriptor_tmp_6;
    int v6 = (dispatch_queue_s *)a1[5];
    block[4] = a1[6];
    dispatch_sync(v6, block);
  }

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2(uint64_t a1)
{
}

void ApplePhotonDetectorServicesGetLux(dispatch_queue_s *object, uint64_t *a2)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (!object || !a2)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    v21 = (os_log_s *)MEMORY[0x1895F8DA0];
    v22 = "%s: Invalid arguments, exiting\n";
    goto LABEL_25;
  }

  if (!*((_BYTE *)a2 + 36))
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    v21 = (os_log_s *)MEMORY[0x1895F8DA0];
    v22 = "%s: Error! Client requested 0 samples. Exiting\n";
LABEL_25:
    _os_log_impl(&dword_18913A000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)buf, 0xCu);
    return;
  }

  uint64_t v4 = *a2;
  if ((!*a2 || !a2[2] || !a2[1]) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a2[1];
    uint64_t v5 = a2[2];
    LODWORD(buf[0]) = 136315906;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    WORD2(buf[1]) = 2048;
    *(void *)((char *)&buf[1] + 6) = v4;
    HIWORD(buf[2]) = 2048;
    buf[3] = v5;
    LOWORD(buf[4]) = 2048;
    *(void *)((char *)&buf[4] + 2) = v6;
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: lux samples = %p, abs time = %p, gains = %p\n",  (uint8_t *)buf,  0x2Au);
  }

  if (!a2[3] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Memory for coexFlags not allocated by the client\n",  (uint8_t *)buf,  0xCu);
  }

  dispatch_retain(object);
  v7 = calloc(*((unsigned __int8 *)a2 + 36), 4uLL);
  uint64_t v8 = calloc(*((unsigned __int8 *)a2 + 36), 4uLL);
  v9 = calloc(*((unsigned __int8 *)a2 + 36), 8uLL);
  size_t v10 = calloc(*((unsigned __int8 *)a2 + 36), 1uLL);
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x7802000000LL;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  bzero(buf, 0xE60uLL);
  memset(v51, 0, sizeof(v51));
  uint64_t v11 = MEMORY[0x1895F87A8];
  if (!v7 || !v9 || !v8)
  {
    int v12 = -536870211;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)v54 = 136315138;
    v55 = "ApplePhotonDetectorServicesGetLux";
    v23 = (os_log_s *)MEMORY[0x1895F8DA0];
    __int16 v24 = "%s: Could not allocate memory to store lux information\n";
LABEL_30:
    _os_log_impl(&dword_18913A000, v23, OS_LOG_TYPE_DEFAULT, v24, v54, 0xCu);
    goto LABEL_31;
  }

  if (!v10)
  {
    int v12 = -536870211;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)v54 = 136315138;
    v55 = "ApplePhotonDetectorServicesGetLux";
    v23 = (os_log_s *)MEMORY[0x1895F8DA0];
    __int16 v24 = "%s: Could not allocate memory to store coex flags information\n";
    goto LABEL_30;
  }

  int v12 = connect((uint64_t)v51, "com.apple.applephotondetectorservicesqueue");
  if (!v12)
  {
    v13 = (_xpc_connection_s *)v47[5];
    handler[0] = v11;
    handler[1] = 0x40000000LL;
    handler[2] = __ApplePhotonDetectorServicesGetLux_block_invoke;
    handler[3] = &unk_18A358648;
    handler[4] = &v46;
    void handler[5] = object;
    handler[6] = a2;
    xpc_connection_set_event_handler(v13, handler);
    xpc_connection_activate((xpc_connection_t)v47[5]);
    uint64_t v14 = v47;
    xpc_object_t v15 = sendSynchronousXpcMsgWithReply();
    uint64_t v16 = v15;
    if (!v15)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v54 = 136315138;
        v55 = "isIspPowered";
        _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from daemon\n",  v54,  0xCu);
      }

      goto LABEL_59;
    }

    if (MEMORY[0x1895E083C](v15) == MEMORY[0x1895F9250])
    {
      data = xpc_dictionary_get_data(v16, (const char *)v14[9], &length);
      size_t v29 = length;
      if (length == 3680)
      {
        BOOL v17 = data[8] != 0;
        goto LABEL_54;
      }

      BOOL v17 = 0;
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
LABEL_54:
        xpc_release(v16);
        if (v17)
        {
          if (*((unsigned __int8 *)a2 + 36) <= 4u)
          {
            xpc_object_t v30 = sendSynchronousXpcMsgWithReply();
            __int16 v26 = v30;
            int v12 = -536870209;
            if (v30)
            {
              if (MEMORY[0x1895E083C](v30) != MEMORY[0x1895F9250])
              {
LABEL_58:
                LOBYTE(v25) = 0;
LABEL_67:
                int v12 = 0;
                goto LABEL_33;
              }

              v34 = xpc_dictionary_get_data(v26, (const char *)v47[9], &length);
              if (length == 3680)
              {
                memcpy(buf, v34, sizeof(buf));
                if (BYTE4(buf[13]))
                {
                  if (*((_BYTE *)a2 + 36))
                  {
                    unint64_t v25 = 0LL;
                    unsigned int v35 = buf[13];
                    do
                    {
                      v36 = &buf[3 * v35 + 1];
                      v7[v25] = *(_DWORD *)v36;
                      v9[v25] = v36[1];
                      v8[v25] = *((_DWORD *)v36 + 1);
                      v10[v25] = *((_BYTE *)v36 + 16);
                      unsigned int v35 = ((_BYTE)v35 + 1) & 3;
                      ++v25;
                    }

                    while (v25 < *((unsigned __int8 *)a2 + 36));
                    int v12 = 0;
                    goto LABEL_33;
                  }

                  goto LABEL_58;
                }

                int v12 = -536870184;
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v54 = 136315138;
                  v55 = "ApplePhotonDetectorServicesGetLux";
                  v37 = (os_log_s *)MEMORY[0x1895F8DA0];
                  v38 = "%s: lux cache is not ready with valid data\n";
                  uint32_t v39 = 12;
                  goto LABEL_85;
                }
              }

              else
              {
                size_t v40 = length;
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v54 = 136315650;
                  v55 = "ApplePhotonDetectorServicesGetLux";
                  __int16 v56 = 2048;
                  size_t v57 = v40;
                  __int16 v58 = 2048;
                  uint64_t v59 = 3680LL;
                  v37 = (os_log_s *)MEMORY[0x1895F8DA0];
                  v38 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
                  uint32_t v39 = 32;
LABEL_85:
                  _os_log_impl(&dword_18913A000, v37, OS_LOG_TYPE_DEFAULT, v38, v54, v39);
                }
              }
            }

            LOBYTE(v25) = 0;
            goto LABEL_33;
          }

          goto LABEL_60;
        }

LABEL_59:
        if (!*((_BYTE *)a2 + 36))
        {
          LOBYTE(v25) = 0;
          __int16 v26 = 0LL;
          goto LABEL_67;
        }

LABEL_60:
        unint64_t v25 = 0LL;
        while (1)
        {
          xpc_object_t v31 = sendSynchronousXpcMsgWithReply();
          __int16 v26 = v31;
          if (!v31) {
            break;
          }
          if (MEMORY[0x1895E083C](v31) != MEMORY[0x1895F9250])
          {
            int v12 = -536870199;
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v54 = 136315138;
              v55 = "ApplePhotonDetectorServicesGetLux";
              _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received an unexpected event\n",  v54,  0xCu);
            }

            goto LABEL_33;
          }

          v32 = xpc_dictionary_get_data(v26, (const char *)v47[9], &length);
          size_t v33 = length;
          if (length != 3680)
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v54 = 136315650;
              v55 = "ApplePhotonDetectorServicesGetLux";
              __int16 v56 = 2048;
              size_t v57 = v33;
              __int16 v58 = 2048;
              uint64_t v59 = 3680LL;
              _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received reply with unexpected length %lu. Expected %lu\n",  v54,  0x20u);
            }

            int v12 = -536870209;
            goto LABEL_33;
          }

          memcpy(buf, v32, sizeof(buf));
          v7[v25] = buf[1];
          v9[v25] = buf[2];
          v8[v25] = HIDWORD(buf[1]);
          int v12 = HIDWORD(buf[3]);
          v10[v25] = buf[3];
          xpc_release(v26);
        }

        int v12 = -536870209;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v54 = 136315138;
          v55 = "ApplePhotonDetectorServicesGetLux";
          _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from daemon\n",  v54,  0xCu);
        }

        goto LABEL_32;
      }

      *(_DWORD *)v54 = 136315650;
      v55 = "isIspPowered";
      __int16 v56 = 2048;
      size_t v57 = v29;
      __int16 v58 = 2048;
      uint64_t v59 = 3680LL;
      uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      v19 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
      uint32_t v20 = 32;
    }

    else
    {
      BOOL v17 = 0;
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)v54 = 136315138;
      v55 = "isIspPowered";
      uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      v19 = "%s: Received an unexpected event\n";
      uint32_t v20 = 12;
    }

    _os_log_impl(&dword_18913A000, v18, OS_LOG_TYPE_DEFAULT, v19, v54, v20);
    BOOL v17 = 0;
    goto LABEL_54;
  }

LABEL_31:
  LOBYTE(v25) = 0;
LABEL_32:
  __int16 v26 = 0LL;
LABEL_33:
  block[0] = v11;
  block[1] = 0x40000000LL;
  block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_8;
  block[3] = &__block_descriptor_tmp_9;
  char v44 = v25;
  block[4] = a2;
  block[5] = v7;
  block[6] = v8;
  block[7] = v9;
  block[8] = v10;
  int v43 = v12;
  dispatch_sync(object, block);
  if (v26) {
    xpc_release(v26);
  }
  uint64_t v27 = (dispatch_queue_s *)v47[6];
  if (v27)
  {
    v41[0] = v11;
    v41[1] = 0x40000000LL;
    v41[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_2;
    v41[3] = &unk_18A358690;
    v41[4] = &v46;
    dispatch_sync(v27, v41);
    dispatch_release((dispatch_object_t)v47[6]);
    v47[6] = 0LL;
  }

  dispatch_release(object);
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  if (v8) {
    free(v8);
  }
  if (v10) {
    free(v10);
  }
  _Block_object_dispose(&v46, 8);
}

void sub_18913C560( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void __ApplePhotonDetectorServicesGetLux_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9268])
  {
    if (a2 == MEMORY[0x1895F91A0])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_18913A000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }

    else
    {
      if (a2 != MEMORY[0x1895F9198])
      {
        if (a2 != MEMORY[0x1895F91C8] || !os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }

uint64_t __ApplePhotonDetectorServicesGetLux_block_invoke_5(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32LL) = -536870165;
  return result;
}

void __ApplePhotonDetectorServicesGetLux_block_invoke_2(uint64_t a1)
{
}

uint64_t ApplePhotonDetectorServicesGetCoex(int *a1)
{
  uint64_t v1 = 3758097097LL;
  io_iterator_t existing = 0;
  if (!a1) {
    return 3758097090LL;
  }
  uint64_t v3 = 0LL;
  *a1 = 0;
  mach_port_t v4 = *MEMORY[0x1896086A8];
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    v7 = IOServiceMatching(off_18A3586B0[v3]);
    IOServiceGetMatchingServices(v4, v7, &existing);
    char v5 = existing;
    if (existing) {
      break;
    }
    uint64_t v3 = 1LL;
    if ((v6 & 1) == 0) {
      return 3758097086LL;
    }
  }

  uint64_t v8 = IOServiceNameMatching(off_18A3586B0[v3]);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v8);
  io_registry_entry_t v10 = MatchingService;
  if (MatchingService)
  {
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    int v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"StrobeState",  (CFAllocatorRef)*MEMORY[0x189604DB0],  3u);
    v13 = v12;
    if (v12)
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      uint64_t v14 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v10, "IOService", @"LidarState", v11, 3u);
      xpc_object_t v15 = v14;
      if (v14)
      {
        CFNumberGetValue(v14, kCFNumberSInt32Type, &v17);
        uint64_t v1 = 0LL;
        *a1 = valuePtr | (2 * v17);
      }

      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v1 = 0LL;
    v13 = 0LL;
  }

  xpc_object_t v15 = 0LL;
LABEL_13:
  if (existing)
  {
    IOObjectRelease(existing);
    io_iterator_t existing = 0;
  }

  if (v10) {
    IOObjectRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v1;
}

uint64_t ApplePhotonDetectorServicesGetLuxAsync()
{
  v0 = (dispatch_object_s *)MEMORY[0x1895F8858]();
  char v5 = v3;
  char v6 = v2;
  v7 = v1;
  uint64_t v8 = v0;
  uint64_t v71 = *MEMORY[0x1895F89C0];
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x2000000000LL;
  int v55 = 0;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2000000000LL;
  char v51 = 0;
  if (v0 && v1 && v2 && v3)
  {
    v9 = &v55;
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x2000000000LL;
    v47 = v0;
    if (*(void *)v0)
    {
      if (!*((_BYTE *)v2 + 36))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "ApplePhotonDetectorServicesGetLuxAsync";
          _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Error! Client requested 0 samples\n",  buf,  0xCu);
          v9 = (int *)(v53 + 3);
        }

        int v18 = -536870911;
        goto LABEL_27;
      }

      io_registry_entry_t v10 = *v2;
      if (*v2 && v2[2] && v2[1] && v2[3])
      {
        uint64_t v11 = v4;
        dispatch_retain(v1);
        v42[0] = 0LL;
        v42[1] = v42;
        v42[2] = 0x2000000000LL;
        int v43 = 0;
        bzero(buf, 0xE60uLL);
        xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
        if (v12)
        {
          v13 = *(dispatch_queue_s **)v45[3];
          uint64_t v14 = MEMORY[0x1895F87A8];
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke;
          block[3] = &unk_18A3586C8;
          block[4] = &v44;
          void block[5] = &v48;
          block[6] = &v52;
          dispatch_sync(v13, block);
          if (!*((_DWORD *)v53 + 6))
          {
            if (!*((_BYTE *)v49 + 24)) {
              xpc_connection_set_event_handler(*(xpc_connection_t *)(v45[3] + 8), &__block_literal_global_0);
            }
            xpc_connection_activate(*(xpc_connection_t *)(v45[3] + 8));
            if (isCameraStreaming(v45[3] + 8) && *((unsigned __int8 *)v6 + 36) <= 4u)
            {
              *(_DWORD *)buf = 104;
              xpc_dictionary_set_uint64(v12, *(const char **)(v45[3] + 32), 2uLL);
              xpc_dictionary_set_data(v12, *(const char **)(v45[3] + 40), buf, 0xE60uLL);
              uint64_t v26 = v45[3];
              uint64_t v27 = *(_xpc_connection_s **)(v26 + 8);
              uint64_t v28 = *(dispatch_queue_s **)(v26 + 16);
              handler[0] = v14;
              handler[1] = 0x40000000LL;
              handler[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_20;
              handler[3] = &unk_18A358750;
              handler[4] = &v44;
              void handler[5] = v42;
              handler[6] = v6;
              void handler[7] = v5;
              handler[8] = v7;
              handler[9] = v11;
              xpc_connection_send_message_with_reply(v27, v12, v28, handler);
            }

            else
            {
              *(void *)&__int128 v58 = 0LL;
              *((void *)&v58 + 1) = &v58;
              uint64_t v59 = 0x2000000000LL;
              char v60 = 0;
              uint64_t v36 = 0LL;
              v37 = &v36;
              uint64_t v38 = 0x2000000000LL;
              uint32_t v39 = calloc(1uLL, 4uLL);
              size_t v29 = (_DWORD *)v37[3];
              if (v29)
              {
                int v30 = *((unsigned __int8 *)v6 + 36);
                *size_t v29 = v30;
                if (v30)
                {
                  unsigned int v31 = 0;
                  do
                  {
                    *(_DWORD *)buf = 100;
                    xpc_dictionary_set_uint64(v12, *(const char **)(v45[3] + 32), 2uLL);
                    xpc_dictionary_set_data(v12, *(const char **)(v45[3] + 40), buf, 0xE60uLL);
                    uint64_t v32 = v45[3];
                    size_t v33 = *(_xpc_connection_s **)(v32 + 8);
                    v34 = *(dispatch_queue_s **)(v32 + 16);
                    v35[0] = MEMORY[0x1895F87A8];
                    v35[1] = 0x40000000LL;
                    v35[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_24;
                    v35[3] = &unk_18A358798;
                    v35[4] = &v44;
                    v35[5] = v42;
                    v35[6] = &v58;
                    v35[7] = &v36;
                    v35[8] = v6;
                    v35[9] = v5;
                    v35[10] = v7;
                    v35[11] = v11;
                    xpc_connection_send_message_with_reply(v33, v12, v34, v35);
                    ++v31;
                  }

                  while (v31 < *((unsigned __int8 *)v6 + 36));
                }
              }

              else
              {
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int16 v56 = 136315138;
                  size_t v57 = "ApplePhotonDetectorServicesGetLuxAsync";
                  _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Could not allocate memory for counter \n",  v56,  0xCu);
                }

                disconnectFromDaemon((dispatch_queue_s **)v45[3]);
              }

              _Block_object_dispose(&v36, 8);
              _Block_object_dispose(&v58, 8);
            }

            goto LABEL_46;
          }

          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
LABEL_46:
            _Block_object_dispose(v42, 8);
            _Block_object_dispose(&v44, 8);
            if (v12) {
              xpc_release(v12);
            }
            goto LABEL_28;
          }

          LODWORD(v5_Block_object_dispose(va, 8) = 136315138;
          *(void *)((char *)&v58 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          xpc_object_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v16 = "%s: Could not establish a connection with the daemon, exiting\n";
        }

        else
        {
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_46;
          }
          LODWORD(v5_Block_object_dispose(va, 8) = 136315138;
          *(void *)((char *)&v58 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          xpc_object_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v16 = "%s: Could not create dictionary, exiting\n";
        }

        _os_log_impl(&dword_18913A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v58, 0xCu);
        goto LABEL_46;
      }

      int v18 = -536870211;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v6[1];
        v22 = v6[2];
        __int16 v24 = v6[3];
        *(_DWORD *)buf = 136316162;
        v62 = "ApplePhotonDetectorServicesGetLuxAsync";
        __int16 v63 = 2048;
        v64 = v10;
        __int16 v65 = 2048;
        v66 = (dispatch_object_s **)v22;
        __int16 v67 = 2048;
        v68 = v23;
        __int16 v69 = 2048;
        v70 = v24;
        v19 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint32_t v20 = "%s: Error! Client has not allocated the required memory: lux samples = %p, abs time = %p, gains = %p, coex = %p\n";
        uint32_t v21 = 52;
        goto LABEL_23;
      }
    }

    else
    {
      int v18 = -536870195;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v62 = "ApplePhotonDetectorServicesGetLuxAsync";
        v19 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint32_t v20 = "%s: APDS dispatch queue is unavailable. Was it not allocated ?\n";
        uint32_t v21 = 12;
LABEL_23:
        _os_log_impl(&dword_18913A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
        v9 = (int *)(v53 + 3);
      }
    }

void sub_18913D08C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  if (*(void *)(v2 + 8))
  {
    ++*(void *)(v2 + 88);
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = 0;
    __n128 result = connect( *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) + 8LL,  "com.apple.applephotondetectorservicesqueue");
    *(_DWORD *)(*(void *)(*(void *)(v1 + 48) + 8LL) + 24LL) = result;
    if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 48) + 8LL) + 24LL))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL);
      ++*(void *)(v3 + 88);
    }
  }

  return result;
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9268] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    int v4 = 136315394;
    char v5 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    __int16 v6 = 2080;
    v7 = string;
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received error %s\n",  (uint8_t *)&v4,  0x16u);
  }

BOOL isCameraStreaming(BOOL result)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  int v1 = *(_DWORD *)(result + 16);
  uint64_t v2 = "AppleH16CamIn";
  if (v1 != 1) {
    uint64_t v2 = 0LL;
  }
  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = "AppleH13CamIn";
  }
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    __n128 result = 0LL;
    if (!v14) {
      return result;
    }
    int valuePtr = 136315394;
    v22 = "isCameraStreaming";
    __int16 v23 = 1024;
    LODWORD(v24) = v1;
    xpc_object_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v16 = "%s: Could not get a matching driver name, driver version = %d\n";
    uint32_t v17 = 18;
LABEL_21:
    _os_log_impl(&dword_18913A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&valuePtr, v17);
    return 0LL;
  }

  mach_port_t v4 = *MEMORY[0x1896086A8];
  char v5 = IOServiceNameMatching(v3);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    __n128 result = 0LL;
    if (!v18) {
      return result;
    }
    int valuePtr = 136315394;
    v22 = "isCameraStreaming";
    __int16 v23 = 2080;
    __int16 v24 = v3;
    xpc_object_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v16 = "%s: Could not match to the driver %s\n";
    uint32_t v17 = 22;
    goto LABEL_21;
  }

  io_registry_entry_t v7 = MatchingService;
  int valuePtr = 0;
  uint64_t v20 = 0LL;
  int v19 = 0;
  uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v9 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"FrontCameraStreaming",  (CFAllocatorRef)*MEMORY[0x189604DB0],  3u);
  io_registry_entry_t v10 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v7, "IOService", @"BackCameraStreaming", v8, 3u);
  uint64_t v11 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v7, "IOService", @"BackTeleCameraStreaming", v8, 3u);
  xpc_object_t v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty( v7,  "IOService",  @"BackSuperWideCameraStreaming",  v8,  3u);
  if (v9) {
    CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
  }
  if (v10) {
    CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)&v20 + 4);
  }
  if (v11) {
    CFNumberGetValue(v11, kCFNumberSInt32Type, &v20);
  }
  if (v12)
  {
    CFNumberGetValue(v12, kCFNumberSInt32Type, &v19);
    int v13 = v19;
  }

  else
  {
    int v13 = 0;
  }

  return (HIDWORD(v20) | valuePtr | v20 | v13) != 0;
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x1895E083C](a2);
  bzero(__dst, 0xE60uLL);
  if (v4 == MEMORY[0x1895F9250])
  {
    data = xpc_dictionary_get_data( a2,  *(const char **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 40LL),  &length);
    if (data)
    {
      size_t v6 = length;
      if (length == 3680)
      {
        memcpy(__dst, data, sizeof(__dst));
        if (BYTE4(__dst[13])) {
          goto LABEL_17;
        }
        int v7 = -536870184;
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315138;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        v9 = "%s: lux cache is not ready with valid data\n";
        goto LABEL_12;
      }

      int v7 = -536870209;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        __int16 v23 = 2048;
        size_t v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = 3680LL;
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        v9 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v10 = 32;
        goto LABEL_15;
      }
    }

    else
    {
      int v7 = -536870209;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        v9 = "%s: Could not get the required data\n";
LABEL_12:
        uint32_t v10 = 12;
LABEL_15:
        _os_log_impl(&dword_18913A000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      }
    }

LABEL_16:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v7;
    goto LABEL_17;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received a response of an unknown type\n",  buf,  0xCu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -536870199;
LABEL_17:
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    *(_BYTE *)(v11 + 36) = 0;
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (*(_BYTE *)(v11 + 36))
    {
      unint64_t v12 = 0LL;
      unsigned int v13 = __dst[13];
      do
      {
        BOOL v14 = &__dst[3 * v13 + 1];
        int v15 = *((_DWORD *)v14 + 1);
        *(_DWORD *)(*(void *)v11 + 4 * v12) = *(_DWORD *)v14;
        *(void *)(*(void *)(v11 + 16) + 8 * v12) = v14[1];
        *(_BYTE *)(*(void *)(v11 + 24) + v12) = *((_BYTE *)v14 + 16);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)(*(void *)(v11 + 8) + 4 * v12) = v15;
        unsigned int v13 = ((_BYTE)v13 + 1) & 3;
        ++v12;
      }

      while (v12 < *(unsigned __int8 *)(v11 + 36));
    }
  }

  *(_DWORD *)(v11 + 32) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 0x40000000LL;
    v18[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21;
    v18[3] = &__block_descriptor_tmp_22;
    v18[4] = v16;
    v18[5] = v11;
    uint32_t v17 = *(dispatch_queue_s **)(a1 + 64);
    v18[6] = *(void *)(a1 + 72);
    dispatch_async(v17, v18);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }

  disconnectFromDaemon(*(dispatch_queue_s ***)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

void disconnectFromDaemon(dispatch_queue_s **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke;
      block[3] = &__block_descriptor_tmp_45;
      block[4] = a1;
      dispatch_sync(v2, block);
    }
  }

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9250])
  {
    data = xpc_dictionary_get_data( a2,  *(const char **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 40LL),  &length);
    if (data)
    {
      size_t v9 = length;
      if (length == 3680)
      {
        float v6 = *((float *)data + 2);
        float v7 = *((float *)data + 3);
        uint64_t v4 = *((void *)data + 2);
        char v5 = *((_BYTE *)data + 24);
        int v10 = *((_DWORD *)data + 7);
LABEL_14:
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
        goto LABEL_15;
      }

      float v6 = 0.0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        size_t v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        __int16 v30 = 2048;
        *(void *)unsigned int v31 = v9;
        *(_WORD *)&v31[8] = 2048;
        uint64_t v32 = 3680LL;
        uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
        unint64_t v12 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v13 = 32;
        goto LABEL_12;
      }
    }

    else
    {
      float v6 = 0.0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        size_t v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
        unint64_t v12 = "%s: Could not get the required data\n";
        uint32_t v13 = 12;
LABEL_12:
        _os_log_impl(&dword_18913A000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      }
    }

    uint64_t v4 = 0LL;
    char v5 = 0;
    int v10 = -536870209;
    float v7 = 0.0;
    goto LABEL_14;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    size_t v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received a response of an unknown type\n",  buf,  0xCu);
  }

  uint64_t v4 = 0LL;
  char v5 = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -536870199;
  float v6 = 0.0;
  float v7 = 0.0;
LABEL_15:
  if (!*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 88LL)) {
    goto LABEL_33;
  }
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v16 = *(int **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  int v17 = *v16;
  unsigned int v18 = *(unsigned __int8 *)(v14 + 36);
  unsigned int v19 = v18 - *v16;
  if (v18 >= *v16)
  {
    char v21 = 0;
    int v20 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v20) {
      float v22 = 0.0;
    }
    else {
      float v22 = v6;
    }
    if (v20) {
      uint64_t v4 = 0LL;
    }
    *(float *)(*(void *)v14 + 4LL * v19) = v22;
    *(void *)(*(void *)(v14 + 16) + 8LL * v19) = v4;
    if (v20) {
      float v7 = 0.0;
    }
    *(float *)(*(void *)(v14 + 8) + 4LL * v19) = v7;
    if (v20) {
      char v5 = 0;
    }
    *(_BYTE *)(*(void *)(v14 + 24) + v19) = v5;
    int *v16 = v17 - 1;
    if (v17 != 1) {
      goto LABEL_32;
    }
    char v21 = 1;
  }

  else
  {
    int v20 = -536870168;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      size_t v29 = "UpdateLuxInfo";
      __int16 v30 = 1024;
      *(_DWORD *)unsigned int v31 = v17;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v18;
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: currentCount is greater than the number of samples requested, currentCount = %d, numSamples = %d\n",  buf,  0x18u);
    }

    char v21 = 0;
  }

  *(_DWORD *)(v14 + 32) = v20;
LABEL_32:
  *(_BYTE *)(v15 + 24) = v21;
LABEL_33:
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v23 = *(void *)(a1 + 72);
    if (v23)
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 0x40000000LL;
      v26[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25;
      v26[3] = &__block_descriptor_tmp_26;
      uint64_t v24 = *(void *)(a1 + 64);
      v26[4] = v23;
      v26[5] = v24;
      __int16 v25 = *(dispatch_queue_s **)(a1 + 80);
      v26[6] = *(void *)(a1 + 88);
      dispatch_async(v25, v26);
      dispatch_release(*(dispatch_object_t *)(a1 + 80));
    }

    disconnectFromDaemon(*(dispatch_queue_s ***)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    free(*(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
  }

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t ApplePhotonDetectorServicesOpen(dispatch_object_t **a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (dispatch_object_t *)calloc(1uLL, 0x60uLL);
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v7 = 136315394;
    uint64_t v8 = "ApplePhotonDetectorServicesOpen";
    __int16 v9 = 1024;
    int v10 = 889;
    char v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    float v6 = "%s: %d: Could not open an interface to APDS\n";
LABEL_8:
    _os_log_impl(&dword_18913A000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x12u);
LABEL_9:
    if (*v2) {
      dispatch_release(*v2);
    }
    goto LABEL_11;
  }

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.applephotondetectorservicesprivatequeue", 0LL);
  dispatch_object_t *v2 = v3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      free(v2);
      uint64_t v2 = 0LL;
      uint64_t result = 3758097085LL;
      goto LABEL_12;
    }

    int v7 = 136315394;
    uint64_t v8 = "ApplePhotonDetectorServicesOpen";
    __int16 v9 = 1024;
    int v10 = 897;
    char v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    float v6 = "%s: %d: Could not create a serial queue\n";
    goto LABEL_8;
  }

  uint64_t result = 0LL;
LABEL_12:
  *a1 = v2;
  return result;
}

uint64_t ApplePhotonDetectorServicesClose(dispatch_object_s **a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      dispatch_release(v2);
    }
    free(a1);
    return 0LL;
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      char v5 = "ApplePhotonDetectorServicesClose";
      __int16 v6 = 1024;
      int v7 = 932;
      __int16 v8 = 2048;
      uint64_t v9 = 0LL;
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: %d: Invalid handle provided %p\n",  (uint8_t *)&v4,  0x1Cu);
    }

    return 3758096385LL;
  }

uint64_t ApplePhotonDetectorServicesSetCILDutyCycle()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x7802000000LL;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  bzero(v14, 0x3378uLL);
  memset(v11, 0, sizeof(v11));
  uint64_t v1 = connect((uint64_t)v11, "com.apple.applephotondetectorservicesqueue");
  if (!(_DWORD)v1)
  {
    xpc_connection_set_event_handler((xpc_connection_t)v7[5], &__block_literal_global_30);
    xpc_connection_activate((xpc_connection_t)v7[5]);
    int v15 = v0;
    xpc_object_t v2 = sendSynchronousXpcMsgWithReply();
    if (v2)
    {
      xpc_release(v2);
      uint64_t v1 = 0LL;
    }

    else
    {
      uint64_t v1 = 3758097087LL;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint32_t v13 = "ApplePhotonDetectorServicesSetCILDutyCycle";
        _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from daemon\n",  buf,  0xCu);
      }
    }
  }

  dispatch_queue_t v3 = (dispatch_queue_s *)v7[6];
  if (v3)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = __ApplePhotonDetectorServicesSetCILDutyCycle_block_invoke_31;
    v5[3] = &unk_18A358800;
    v5[4] = &v6;
    dispatch_sync(v3, v5);
    dispatch_release((dispatch_object_t)v7[6]);
    v7[6] = 0LL;
  }

  _Block_object_dispose(&v6, 8);
  return v1;
}

void sub_18913E0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void __ApplePhotonDetectorServicesSetCILDutyCycle_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9268] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    int v4 = 136315394;
    char v5 = "ApplePhotonDetectorServicesSetCILDutyCycle_block_invoke";
    __int16 v6 = 2080;
    int v7 = string;
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received error %s\n",  (uint8_t *)&v4,  0x16u);
  }

void __ApplePhotonDetectorServicesSetCILDutyCycle_block_invoke_31(uint64_t a1)
{
}

uint64_t ApplePhotonDetectorServicesConfigureCILDutyCycle()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v2 = v1;
  uint64_t v3 = v0;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  bzero(v10, 0x3378uLL);
  if (v3)
  {
    int v11 = v2;
    xpc_object_t v4 = sendSynchronousXpcMsgWithReply();
    if (v4)
    {
      char v5 = v4;
      if (MEMORY[0x1895E083C]() == MEMORY[0x1895F9250])
      {
        uint64_t v6 = 0LL;
      }

      else
      {
        uint64_t v6 = 3758097097LL;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          uint64_t v9 = "ApplePhotonDetectorServicesConfigureCILDutyCycle";
          _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received an unexpected event\n",  (uint8_t *)&v8,  0xCu);
        }
      }

      xpc_release(v5);
    }

    else
    {
      uint64_t v6 = 3758097087LL;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        uint64_t v9 = "ApplePhotonDetectorServicesConfigureCILDutyCycle";
        _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Did not receive a reply from daemon\n",  (uint8_t *)&v8,  0xCu);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "ApplePhotonDetectorServicesConfigureCILDutyCycle";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid pointer to the connection object\n",  (uint8_t *)&v8,  0xCu);
    }

    return 3758096385LL;
  }

  return v6;
}

uint64_t ApplePhotonDetectorServicesConfigureCILDutyCycleAsync()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v2 = v1;
  uint64_t v3 = v0;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  bzero(bytes, 0x3378uLL);
  if (v3)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v4)
    {
      char v5 = v4;
      bytes[2] = v2;
      bytes[0] = 105;
      xpc_dictionary_set_uint64(v4, *(const char **)(v3 + 24), 1uLL);
      xpc_dictionary_set_data(v5, *(const char **)(v3 + 32), bytes, 0x3378uLL);
      xpc_connection_send_message(*(xpc_connection_t *)v3, v5);
      xpc_release(v5);
      return 0LL;
    }

    else
    {
      uint64_t v6 = 3758097085LL;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        uint64_t v9 = "ApplePhotonDetectorServicesConfigureCILDutyCycleAsync";
        _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Could not create dictionary, exiting\n",  (uint8_t *)&v8,  0xCu);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "ApplePhotonDetectorServicesConfigureCILDutyCycleAsync";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid pointer to the connection object\n",  (uint8_t *)&v8,  0xCu);
    }

    return 3758096385LL;
  }

  return v6;
}

uint64_t ApplePhotonDetectorServicesGetCILDutyCycleRange(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  bzero(__dst, 0xE60uLL);
  if (a1)
  {
    xpc_object_t v6 = sendSynchronousXpcMsgWithReply();
    if (v6)
    {
      int v7 = v6;
      if (MEMORY[0x1895E083C]() == MEMORY[0x1895F9250])
      {
        data = xpc_dictionary_get_data(v7, *(const char **)(a1 + 32), &length);
        size_t v13 = length;
        if (length == 3680)
        {
          uint64_t v14 = data;
          int64_t int64 = xpc_dictionary_get_int64(v7, "H16ISPServicesRemoteReturnKey");
          if (!(_DWORD)int64)
          {
            memcpy(__dst, v14, length);
            unsigned int v16 = v20;
            *a2 = v20;
            unsigned int v17 = v21;
            *a3 = v21;
            if (v16 < v17)
            {
              int64_t int64 = 0LL;
              goto LABEL_18;
            }

            int64_t int64 = 3758097097LL;
            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
            __int16 v24 = 1024;
            *(_DWORD *)__int16 v25 = v16;
            *(_WORD *)&v25[4] = 1024;
            *(_DWORD *)&v25[6] = v17;
            uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v10 = "%s: Error: Received incorrect duty cycle ranges min (%u), max (%u)\n";
            uint32_t v11 = 24;
            goto LABEL_17;
          }

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
            __int16 v24 = 1024;
            *(_DWORD *)__int16 v25 = int64;
            uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v10 = "%s: Received return code 0x%x\n";
            uint32_t v11 = 18;
            goto LABEL_17;
          }
        }

        else
        {
          int64_t int64 = 3758097087LL;
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
            __int16 v24 = 2048;
            *(void *)__int16 v25 = v13;
            *(_WORD *)&v25[8] = 2048;
            uint64_t v26 = 3680LL;
            uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v10 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
            uint32_t v11 = 32;
            goto LABEL_17;
          }
        }
      }

      else
      {
        int64_t int64 = 3758097097LL;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v23 = "ApplePhotonDetectorServicesGetCILDutyCycleRange";
          uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v10 = "%s: Received an unexpected event\n";
          uint32_t v11 = 12;
LABEL_17:
          _os_log_impl(&dword_18913A000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
        }
      }

uint64_t ApplePhotonDetectorServicesSetupConnection(xpc_connection_t **a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v2 = (xpc_connection_t *)calloc(1uLL, 0x50uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = connect((uint64_t)v2, "com.apple.applephotondetectorservicesqueue");
    if (!(_DWORD)v4)
    {
      xpc_connection_set_event_handler(*v3, &__block_literal_global_35);
      xpc_connection_activate(*v3);
      *a1 = v3;
      return v4;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "ApplePhotonDetectorServicesSetupConnection";
      __int16 v11 = 1024;
      int v12 = v4;
      char v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      xpc_object_t v6 = "%s: Could not connect to the daemon, ret = 0x%x\n";
      uint32_t v7 = 18;
LABEL_7:
      _os_log_impl(&dword_18913A000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v7);
    }
  }

  else
  {
    uint64_t v4 = 3758097085LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "ApplePhotonDetectorServicesSetupConnection";
      char v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      xpc_object_t v6 = "%s: Could not create an xpc connection object\n";
      uint32_t v7 = 12;
      goto LABEL_7;
    }
  }

  return v4;
}

void __ApplePhotonDetectorServicesSetupConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x1895E083C](a2) == MEMORY[0x1895F9268] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    int v4 = 136315394;
    char v5 = "ApplePhotonDetectorServicesSetupConnection_block_invoke";
    __int16 v6 = 2080;
    uint32_t v7 = string;
    _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Received error %s\n",  (uint8_t *)&v4,  0x16u);
  }

uint64_t ApplePhotonDetectorServicesTearDownConnection(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v2 = (dispatch_queue_s *)*((void *)a1 + 1);
    if (v2)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __ApplePhotonDetectorServicesTearDownConnection_block_invoke;
      block[3] = &__block_descriptor_tmp_36;
      block[4] = a1;
      dispatch_sync(v2, block);
      dispatch_release(*((dispatch_object_t *)a1 + 1));
    }

    free(a1);
    return 0LL;
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v6 = "ApplePhotonDetectorServicesTearDownConnection";
      _os_log_impl( &dword_18913A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Invalid pointer to the connection object\n",  buf,  0xCu);
    }

    return 3758096385LL;
  }

void __ApplePhotonDetectorServicesTearDownConnection_block_invoke(uint64_t a1)
{
}

void ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(v2 + 88) - 1LL;
    *(void *)(v2 + 8_Block_object_dispose(va, 8) = v3;
    if (!v3)
    {
      disconnect((xpc_connection_t *)(v2 + 8));
      int v4 = *(dispatch_object_s **)(*(void *)(a1 + 32) + 16LL);
      if (v4)
      {
        dispatch_release(v4);
        *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
      }
    }
  }

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1895FC6E0]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}