@interface Querier
@end

@implementation Querier

void __Querier_GetDNSServiceManager_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  switch(a2)
  {
    case 3:
      uint64_t v20 = *(void *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      }
      block = _NSConcreteStackBlock;
      uint64_t v22 = 0x40000000LL;
      v23 = __mdns_dns_service_manager_apply_pending_updates_block_invoke;
      v24 = &__block_descriptor_tmp_39;
      uint64_t v25 = v20;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 188);
      Querier_ProcessDNSServiceChanges(0LL);
      _Querier_LogDNSServices(*(void *)(a1 + 32));
      mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 191);
      break;
    case 2:
      os_release(*(void **)(a1 + 32));
      break;
    case 1:
      uint64_t v19 = *(void *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      }
      block = _NSConcreteStackBlock;
      uint64_t v22 = 0x40000000LL;
      v23 = __mdns_dns_service_manager_invalidate_block_invoke;
      v24 = &__block_descriptor_tmp_19_834;
      uint64_t v25 = v19;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      if (Querier_GetDNSServiceManager_sDNSServiceManager
        && Querier_GetDNSServiceManager_sDNSServiceManager == *(void *)(a1 + 32))
      {
        os_release((void *)Querier_GetDNSServiceManager_sDNSServiceManager);
        Querier_GetDNSServiceManager_sDNSServiceManager = 0LL;
      }

      break;
  }

  KQueueUnlock((uint64_t)"DNS Service Manager event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_LogDNSServices_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      int v8 = *(_DWORD *)(a1 + 40);
      v10[0] = 67109634;
      v10[1] = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "DNS service (%u/%u) -- %@",  (uint8_t *)v10,  0x18u);
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
  }

  return 1LL;
}

void ___Querier_GetMyUUID_block_invoke(id a1)
{
  if (_Querier_GetMyPID_sOnce != -1) {
    dispatch_once(&_Querier_GetMyPID_sOnce, &__block_literal_global_45);
  }
  mdns_system_pid_to_uuid(_Querier_GetMyPID_sPID, _Querier_GetMyUUID_sUUID);
}

void ___Querier_GetMyPID_block_invoke(id a1)
{
  _Querier_GetMyPID_sPID = getpid();
}

void ___Querier_InternalQueue_block_invoke(id a1)
{
  _Querier_InternalQueue_sQueue = (uint64_t)dispatch_queue_create("com.apple.mDNSResponder.querier-support-queue", 0LL);
}

void ___Querier_EnsureNEDNSProxyStateWatchHasStarted_block_invoke(id a1)
{
  if (_Querier_InternalQueue_sOnce != -1) {
    dispatch_once(&_Querier_InternalQueue_sOnce, &__block_literal_global_38);
  }
  id v1 = (id)_Querier_InternalQueue_sQueue;
  v2 = &__block_literal_global_35;
  v3 = objc_autoreleasePoolPush();
  if (objc_opt_class(&OBJC_CLASS___NEDNSProxyManager))
  {
    id v4 = _mdns_ne_dns_proxy_state_watch_queue();
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __mdns_ne_dns_proxy_state_watch_start_block_invoke;
    v6[3] = &unk_10013BA48;
    v6[4] = v1;
    v6[5] = &__block_literal_global_35;
    dispatch_async(v5, v6);
  }

  objc_autoreleasePoolPop(v3);
}

void ___Querier_StartNEDNSProxyStateWatch_block_invoke(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if ((((gNEDNSProxyIsRunning == 0) ^ v2) & 1) != 0) {
    goto LABEL_23;
  }
  gNEDNSProxyIsRunning = v2;
  uint64_t v18 = (os_log_s *)mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v26 = 67109120;
    BOOL v27 = v2;
    goto LABEL_11;
  }

  uint64_t v18 = (os_log_s *)mDNSLogCategory_Default_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 67109120;
    BOOL v27 = v2;
LABEL_11:
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "NEDNSProxy state update -- running: %{mdns:yesno}d",  (uint8_t *)&v26,  8u);
  }

BOOL __Querier_HandleUnicastQuestion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(a2 + 32) == *(void *)(v3 + 80))
  {
    uint64_t v5 = *(void *)(a2 + 88);
    if (mdns_querier_match( v5,  (unsigned __int8 *)(v3 + 356),  *(unsigned __int16 *)(v3 + 322),  *(unsigned __int16 *)(v3 + 324)))
    {
      unsigned int v6 = *(unsigned __int8 *)(v5 + 70);
      int v7 = *(unsigned __int8 *)(a1 + 48);
      int v8 = (v6 >> 2) & 1;
      int v9 = (v6 >> 1) & 1;
      if (v7 == v8 && v7 == v9) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
      }
    }
  }

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0LL;
}

void __Querier_HandleUnicastQuestion_block_invoke_14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if (*(_BYTE *)(v2 + 255))
  {
    uint64_t v11 = (void *)(v2 + 16);
    do
    {
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_13;
      }
      uint64_t v12 = (uint64_t (*)(uint64_t, void, uint64_t))v11[3];
    }

    while (!v12);
    uint64_t v13 = v12(v2, 0LL, 1LL);
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = (os_log_s *)mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        free(v14);
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v15 = (os_log_s *)mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
    }

    int v22 = *(_DWORD *)(v2 + 232);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)v54 = 2082;
    *(void *)&v54[2] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Q%u] Handling concluded querier: %{public}s",  buf,  0x12u);
    goto LABEL_24;
  }

void __Querier_HandleUnicastQuestion_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  if (a2 == 1)
  {
    _Querier_HandleSubscriberInvalidation(*(void *)(a1 + 32));
    os_release(*(void **)(a1 + 32));
  }

  else if (a2 == 2)
  {
    _Querier_ApplyUpdate(*(void **)(a1 + 32));
  }

  KQueueUnlock((uint64_t)"Subscriber event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_ApplyUpdate_block_invoke(uint64_t *a1, _DWORD *a2)
{
  int v4 = a2[10];
  if (v4 != -2)
  {
    if (v4 == -1)
    {
      _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 0);
      return 1LL;
    }

    uint64_t v6 = (void *)gMessageBuilder;
    if (!gMessageBuilder)
    {
      uint64_t v7 = _os_object_alloc(&OBJC_CLASS___OS_mdns_message_builder, 64LL);
      if (!v7)
      {
        uint64_t v5 = 0LL;
        gMessageBuilder = 0LL;
        return v5;
      }

      uint64_t v6 = (void *)v7;
      uint64_t v8 = &_mdns_message_builder_kind;
      *(void *)(v7 + 16) = &_mdns_message_builder_kind;
      do
      {
        uint64_t v9 = (void (*)(void *))v8[2];
        if (v9) {
          v9(v6);
        }
        uint64_t v8 = (_UNKNOWN **)*v8;
      }

      while (v8);
      gMessageBuilder = (uint64_t)v6;
    }

    _mdns_message_builder_forget_resources(v6);
    v6[7] = 0LL;
    uint64_t v10 = gMessageBuilder;
    *(_WORD *)(gMessageBuilder + 56) = 0;
    *(_WORD *)(v10 + 58) |= 0x8400u;
    uint64_t v11 = a1[4];
    if (v11 && (*(_WORD *)(v11 + 276) & 0x4000) == 0)
    {
      uint64_t v12 = (void *)(*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 80LL))();
      __int16 v13 = (*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 88LL))();
      __int16 v14 = (*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 96LL))();
      if (v12) {
        os_retain(v12);
      }
      uint64_t v15 = *(void **)(v10 + 24);
      if (v15) {
        os_release(v15);
      }
      *(void *)(v10 + 24) = v12;
      *(_WORD *)(v10 + 60) = v13;
      *(_WORD *)(v10 + 62) = v14;
      uint64_t v10 = gMessageBuilder;
    }

    uint64_t v16 = *(__CFArray **)(v10 + 32);
    if (v16)
    {
      if (CFArrayGetCount(*(CFArrayRef *)(v10 + 32)) >= 0xFFFF) {
        goto LABEL_25;
      }
    }

    else
    {
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      if (!Mutable)
      {
LABEL_25:
        uint64_t v18 = gMessageBuilder;
        __int16 v19 = *(_WORD *)(gMessageBuilder + 56);
        __int16 v20 = *(_WORD *)(gMessageBuilder + 58);
        v21 = *(const __CFArray **)(gMessageBuilder + 32);
        unint64_t v22 = (unint64_t)(*(void *)(gMessageBuilder + 24) != 0LL) << 8;
        if (v21)
        {
          int Count = CFArrayGetCount(v21);
          uint64_t v24 = (Count << 8) & 0xFF0000;
          uint64_t v25 = (Count << 24);
        }

        else
        {
          uint64_t v25 = 0LL;
          uint64_t v24 = 0LL;
        }

        unint64_t v26 = v22 | v24 | v25;
        uint64_t v27 = *(const __CFArray **)(v18 + 40);
        if (v27)
        {
          CFIndex v28 = CFArrayGetCount(v27);
          uint64_t v29 = (v28 << 24) & 0xFF00000000LL;
          unint64_t v30 = (unint64_t)v28 << 40;
        }

        else
        {
          unint64_t v30 = 0LL;
          uint64_t v29 = 0LL;
        }

        uint64_t v31 = v26 | v29;
        uint64_t v32 = *(const __CFArray **)(v18 + 48);
        if (v32)
        {
          CFIndex v33 = CFArrayGetCount(v32);
          uint64_t v34 = (v33 << 40) & 0xFF000000000000LL;
          CFIndex v35 = v33 << 56;
        }

        else
        {
          CFIndex v35 = 0LL;
          uint64_t v34 = 0LL;
        }

        uint64_t v51 = 0LL;
        unsigned __int8 v52 = &v51;
        uint64_t v53 = 0x3800000000LL;
        v54 = byte_10015D9A8;
        byte_10015D9A8[0] = HIBYTE(v19);
        byte_10015D9A9 = v19;
        byte_10015D9AA = HIBYTE(v20);
        byte_10015D9AB = v20;
        *(void *)&word_10015D9AC = v31 | v30 | v34 | v35;
        uint64_t v56 = 12LL;
        __int128 v55 = xmmword_100100810;
        uint64_t v36 = *(void *)(v18 + 24);
        if (v36)
        {
          unint64_t v37 = *(void *)(v36 + 32);
          unint64_t v38 = 8940LL;
          if (v37 >= 0x22EC) {
            size_t v39 = 8940LL;
          }
          else {
            size_t v39 = *(void *)(v36 + 32);
          }
          if (v39)
          {
            memcpy(&unk_10015D9B4, *(const void **)(v36 + 24), v39);
            uint64_t v40 = v39 + 12;
            *((void *)&v55 + 1) = v39 + 12;
            unint64_t v38 = 8940 - v39;
          }

          else
          {
            uint64_t v40 = 12LL;
          }

          __int16 v41 = *(_WORD *)(v18 + 60);
          __int16 v42 = *(_WORD *)(v18 + 62);
          LOBYTE(v50[0]) = HIBYTE(v41);
          BYTE1(v50[0]) = v41;
          BYTE2(v50[0]) = HIBYTE(v42);
          BYTE3(v50[0]) = v42;
          if (v38 >= 4) {
            size_t v43 = 4LL;
          }
          else {
            size_t v43 = v38;
          }
          if (v43)
          {
            memcpy((char *)&mDNSStorage[2494] + v40, v50, v43);
            *((void *)&v55 + 1) = v40 + v43;
          }

          uint64_t v44 = v37 + 16;
          if (v37 >= 0xFFFFFFFFFFFFFFF0LL) {
            uint64_t v44 = -1LL;
          }
          uint64_t v56 = v44;
        }

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 0x40000000LL;
        v50[2] = __mdns_message_builder_write_message_block_invoke;
        v50[3] = &unk_100139A00;
        v50[4] = &v51;
        v45 = *(const __CFArray **)(v18 + 32);
        if (v45) {
          mdns_cfarray_enumerate(v45, (uint64_t)v50);
        }
        int v46 = *(const __CFArray **)(v18 + 40);
        if (v46) {
          mdns_cfarray_enumerate(v46, (uint64_t)v50);
        }
        int v47 = *(const __CFArray **)(v18 + 48);
        if (v47) {
          mdns_cfarray_enumerate(v47, (uint64_t)v50);
        }
        unint64_t v48 = v52[6];
        _Block_object_dispose(&v51, 8);
        if (v48 <= 0x22F8) {
          mDNSCoreReceiveForQuerier( (unint64_t)mDNSStorage + &loc_100004DF0 + v48,  a1[6],  (void *)a1[4],  a1[5]);
        }
        return 1LL;
      }

      uint64_t v16 = Mutable;
      *(void *)(v10 + 32) = Mutable;
    }

    CFArrayAppendValue(v16, a2);
    goto LABEL_25;
  }

  uint64_t v5 = 1LL;
  _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 1);
  return v5;
}

void __Querier_ProcessDNSServiceChangesAsync_block_invoke(uint64_t a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage + 616));
  *(_DWORD *)(mDNSStorage + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1377);
  Querier_ProcessDNSServiceChanges(*(unsigned __int8 *)(a1 + 32));
  mDNS_Unlock_((uint64_t)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1379);
  KQueueUnlock((uint64_t)"Querier_ProcessDNSServiceChangesAsync", v10, v11, v12, v13, v14, v15, v16);
}

@end