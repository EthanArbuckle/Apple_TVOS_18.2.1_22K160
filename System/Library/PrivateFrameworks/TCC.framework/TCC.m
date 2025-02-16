_BYTE *stringCopyUTF8String(const __CFString *a1)
{
  CFIndex Length;
  _BYTE *v3;
  CFIndex v4;
  CFIndex usedBufLen;
  CFRange v7;
  CFRange v8;
  Length = CFStringGetLength(a1);
  v7.location = 0LL;
  v7.length = Length;
  v3 = 0LL;
  if (CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen) == Length
    && (v4 = usedBufLen, (v3 = malloc(usedBufLen + 1)) != 0LL)
    && (v8.location = 0LL, v8.length = Length, CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, v3, v4, &usedBufLen) == Length))
  {
    v3[usedBufLen] = 0;
  }

  else
  {
    free(v3);
    return 0LL;
  }

  return v3;
}

double tcc_message_options_create()
{
  *(_DWORD *)(v0 + 56) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_BYTE *)(v0 + 96) = 0;
  return result;
}

uint64_t tcc_message_options_set_reply_handler_policy(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) = a2;
  return result;
}

uint64_t tcc_message_options_get_reply_handler_policy(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t tcc_message_options_set_request_prompt_policy(uint64_t result, uint64_t a2)
{
  *(void *)(result + 64) = a2;
  return result;
}

uint64_t tcc_message_options_get_request_prompt_policy(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tcc_message_options_set_request_usage_string_policy(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  return result;
}

uint64_t tcc_message_options_get_request_usage_string_policy(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tcc_message_options_set_request_record_upgrade_policy(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t tcc_message_options_get_request_record_upgrade_policy(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t tcc_message_options_set_request_prompt_rights_mask(uint64_t result, uint64_t a2)
{
  *(void *)(result + 88) = a2;
  return result;
}

uint64_t tcc_message_options_get_request_prompt_rights_mask(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t tcc_message_options_set_cache_policy(uint64_t result, char a2)
{
  *(_BYTE *)(result + 96) = a2;
  return result;
}

uint64_t tcc_message_options_get_cache_policy(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 96);
}

CFTypeRef tcc_message_options_set_client_dict(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = CFRetain(cf);
  *(void *)(a1 + 104) = cf;
  return result;
}

uint64_t tcc_message_options_get_client_dict(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t tcc_message_options_get_nokill_policy(uint64_t a1)
{
  if (*(void *)(a1 + 112)) {
    return *(void *)(a1 + 112);
  }
  else {
    return *MEMORY[0x189604DE0];
  }
}

uint64_t tcc_message_options_set_nokill_policy(uint64_t result, int a2)
{
  v2 = (void *)MEMORY[0x189604DE8];
  if (!a2) {
    v2 = (void *)MEMORY[0x189604DE0];
  }
  *(void *)(result + 112) = *v2;
  return result;
}

void tcc_message_options_dispose(uint64_t a1)
{
  v1 = *(const void **)(a1 + 104);
  if (v1) {
    CFRelease(v1);
  }
}

void tcc_message_options_encode_to_dictionary(uint64_t *a1, xpc_object_t xdict)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_POLICY_KEY", a1[8]);
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_USAGE_STRING_POLICY_KEY", a1[9]);
  uint64_t v4 = a1[10];
  if (v4) {
    xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_RECORD_UPGRADE_POLICY_POLICY_KEY", v4);
  }
  uint64_t v5 = a1[11];
  if (v5) {
    xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_RIGHTS_MASK_KEY", v5);
  }
  v6 = (const void *)a1[13];
  if (v6)
  {
    CFErrorRef error = 0LL;
    v7 = CFPropertyListCreateData(0LL, v6, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
    v8 = v7;
    if (!error)
    {
      BytePtr = CFDataGetBytePtr(v7);
      size_t Length = CFDataGetLength(v8);
      xpc_dictionary_set_data(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_CLIENT_DICT_KEY", BytePtr, Length);
      if (!v8) {
        return;
      }
      goto LABEL_10;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "tcc_message_options_encode_to_dictionary";
      _os_log_impl( &dword_186DC2000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: error creating CFData from provided client_dict",  buf,  0xCu);
    }

    if (v8) {
LABEL_10:
    }
      CFRelease(v8);
  }
}

  ;
}

__n128 tcc_identity_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_credential_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_attributed_entity_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_authorization_record_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_message_options_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_service_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_server_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_events_filter_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_events_subscription_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_authorization_cache_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

__n128 tcc_authorization_change_monitor_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _os_object_alloc();
  if (v3)
  {
    __n128 result = *(__n128 *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(void *)(v3 + 48) = *(void *)(a2 + 32);
  }

  return result;
}

uint64_t tcc_authorization_changed_for_service_notification_name(uint64_t a1, char *a2, size_t a3)
{
  name = (const char *)tcc_service_get_name(a1);
  uint64_t result = snprintf(a2, a3, "com.apple.TCC.%s.authorization.changed", name);
  return result;
}

void *tcc_authorization_change_monitor_create(uint64_t a1)
{
  uint64_t v3 = v2;
  v2[7] = os_log_create("com.apple.TCC", "changeMonitor");
  v3[10] = a1;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v3[8] = dispatch_queue_create_with_target_V2("com.apple.TCC.cache.changeMonitor", 0LL, global_queue);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  &kTCCObjectDictionaryValueCallBacks);
  v3[9] = Mutable;
  if (!Mutable)
  {
    v6 = (os_log_s *)v3[7];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      tcc_authorization_change_monitor_create_cold_1(v6);
    }
    tcc_release(v3);
    return 0LL;
  }

  return v3;
}

void tcc_authorization_change_monitor_start_monitoring_service(uint64_t a1, uint64_t a2)
{
  v2 = *(dispatch_queue_s **)(a1 + 64);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __tcc_authorization_change_monitor_start_monitoring_service_block_invoke;
  v3[3] = &__block_descriptor_tmp_6;
  v3[4] = a1;
  v3[5] = a2;
  dispatch_async(v2, v3);
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!CFDictionaryContainsValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 72LL), *(const void **)(a1 + 40)))
  {
    tcc_authorization_changed_for_service_notification_name(*(void *)(a1 + 40), name, 0x80uLL);
    int out_token = -1;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2;
    v6[3] = &__block_descriptor_tmp;
    __int128 v7 = *(_OWORD *)(a1 + 32);
    uint32_t v2 = notify_register_dispatch(name, &out_token, *(dispatch_queue_t *)(v7 + 64), v6);
    if (v2)
    {
      int v3 = v2;
      uint64_t v4 = *(os_log_s **)(*(void *)(a1 + 32) + 56LL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_cold_1((uint64_t)name, v3, v4);
      }
    }

    else
    {
      CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &out_token);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 72LL), v5, *(const void **)(a1 + 40));
      CFRelease(v5);
    }
  }

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 72LL), v3);
  CFRelease(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  if (Value)
  {
    tcc_authorization_cache_handle_authorization_changed_for_service_clear( *(void *)(v5 + 80),  *(const void **)(a1 + 40));
  }

  else
  {
    v6 = *(os_log_s **)(v5 + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2_cold_1(&valuePtr, v6);
    }
  }

void tcc_authorization_change_monitor_dispose(uint64_t a1)
{
  uint32_t v2 = *(dispatch_object_s **)(a1 + 64);
  if (v2) {
    dispatch_release(v2);
  }
  CFNumberRef v3 = *(const __CFDictionary **)(a1 + 72);
  if (v3)
  {
    CFIndex Count = CFDictionaryGetCount(v3);
    uint64_t v5 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), v5, 0LL);
    if (Count >= 1)
    {
      v6 = (const __CFNumber **)v5;
      do
      {
        __int128 v7 = *v6++;
        CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
        notify_cancel(valuePtr);
        --Count;
      }

      while (Count);
    }

    free(v5);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
  }

uint64_t tcc_object_retain_cf_callback(uint64_t a1, uint64_t a2)
{
  return tcc_retain(a2);
}

uint64_t tcc_object_release_cf_callback(uint64_t a1, uint64_t a2)
{
  return tcc_release(a2);
}

CFErrorRef _tcc_util_create_CFError_with_user_info(CFIndex a1, CFStringRef format, ...)
{
  CFStringRef v4 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, format, va);
  if (!v4)
  {
    uint64_t v5 = (os_log_s *)tcc_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      _tcc_util_create_CFError_with_user_info_cold_2((uint64_t)format, v5, v6, v7, v8, v9, v10, v11);
    }
    CFStringRef v4 = @"<Failed User Info creation>";
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189604E40], MEMORY[0x189605250]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x189604F38], v4);
  CFErrorRef v13 = CFErrorCreate(0LL, @"kTCCErrorDomain", a1, Mutable);
  CFRelease(Mutable);
  CFRelease(v4);
  uint64_t v14 = (os_log_s *)tcc_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    _tcc_util_create_CFError_with_user_info_cold_1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return v13;
}

uint64_t tcc_object_encode_to_dictionary(uint64_t result)
{
  v1 = *(uint64_t (**)(void))(result + 24);
  if (v1) {
    return v1();
  }
  return result;
}

CFStringRef tcc_object_copy_description(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(a1 + 32);
  if (v1) {
    return (const __CFString *)v1();
  }
  else {
    return @"<Missing Description>";
  }
}

uint64_t tcc_object_hash(uint64_t result)
{
  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 40);
    if (v1) {
      return v1();
    }
  }

  return result;
}

uint64_t tcc_object_equal(uint64_t a1, uint64_t a2)
{
  else {
    return a1 == a2;
  }
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void tcc_authorization_record_create()
{
  *(_DWORD *)(v0 + 140) = -1;
  *(void *)(v0 + 144) = 0LL;
  *(void *)(v0 + 152) = 0LL;
}

uint64_t tcc_authorization_record_set_service(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_retain(a2);
  *(void *)(a1 + 56) = result;
  return result;
}

uint64_t tcc_authorization_record_get_service(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t tcc_authorization_record_set_subject_identity(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_retain(a2);
  *(void *)(a1 + 64) = result;
  return result;
}

uint64_t tcc_authorization_record_get_subject_identity(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tcc_authorization_record_set_indirect_object_identity(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_retain(a2);
  *(void *)(a1 + 72) = result;
  return result;
}

uint64_t tcc_authorization_record_get_indirect_object_identity(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tcc_authorization_record_set_authorization_right(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_authorization_right(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t tcc_authorization_record_set_authorization_value(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_authorization_value(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t tcc_authorization_record_set_authorization_reason(uint64_t result, uint64_t a2)
{
  *(void *)(result + 88) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_authorization_reason(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t tcc_authorization_record_set_subject_attributed_entity(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_retain(a2);
  *(void *)(a1 + 104) = result;
  return result;
}

uint64_t tcc_authorization_record_get_subject_attributed_entity(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t tcc_authorization_record_set_indirect_object_attributed_entity(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_retain(a2);
  *(void *)(a1 + 112) = result;
  return result;
}

uint64_t tcc_authorization_record_get_indirect_object_attributed_entity(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

CFTypeRef tcc_authorization_record_set_last_modified_date(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = CFRetain(cf);
  *(void *)(a1 + 120) = result;
  return result;
}

uint64_t tcc_authorization_record_get_last_modified_date(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

CFTypeRef tcc_authorization_record_set_expired_at_date(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result = CFRetain(cf);
  *(void *)(a1 + 128) = result;
  return result;
}

uint64_t tcc_authorization_record_get_expired_at_date(uint64_t a1)
{
  return *(void *)(a1 + 128);
}

uint64_t tcc_authorization_record_set_version(uint64_t result, uint64_t a2)
{
  *(void *)(result + 96) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_version(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t tcc_authorization_record_set_allow_standard_user_to_set_system_service(uint64_t result, char a2)
{
  *(_BYTE *)(result + 136) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_allow_standard_user_to_set_system_service(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 136);
}

uint64_t tcc_authorization_record_set_session_pid(uint64_t result, int a2)
{
  *(_DWORD *)(result + 140) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_session_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 140);
}

uint64_t tcc_authorization_record_set_session_pid_version(uint64_t result, uint64_t a2)
{
  *(void *)(result + 144) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_session_pid_version(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

char *tcc_authorization_record_set_bootUUID(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  CFTypeRef result = strndup(__s, v4);
  *(void *)(a1 + 152) = result;
  return result;
}

uint64_t tcc_authorization_record_get_bootUUID(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t tcc_authorization_record_set_has_prompted_for_allow(uint64_t result, char a2)
{
  *(_BYTE *)(result + 160) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_has_prompted_for_allow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 160);
}

void tcc_authorization_record_dispose(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    tcc_release(v2);
  }
  uint64_t v3 = a1[8];
  if (v3) {
    tcc_release(v3);
  }
  uint64_t v4 = a1[9];
  if (v4) {
    tcc_release(v4);
  }
  uint64_t v5 = a1[13];
  if (v5) {
    tcc_release(v5);
  }
  uint64_t v6 = a1[14];
  if (v6) {
    tcc_release(v6);
  }
  uint64_t v7 = (const void *)a1[15];
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = (const void *)a1[16];
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (void *)a1[19];
  if (v9) {
    free(v9);
  }
}

__CFString *tcc_authorization_record_copy_description(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0LL, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<Authorization Record (%p) | ", a1);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3)
  {
    uint64_t v4 = tcc_object_copy_description(v3);
    CFStringAppendFormat(Mutable, 0LL, @"Subject: %@, ", v4);
    CFRelease(v4);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5
    && (uint64_t v6 = tcc_object_copy_description(v5),
        CFStringAppendFormat(Mutable, 0LL, @"Service: %@, ", v6),
        CFRelease(v6),
        tcc_service_get_authorization_value_type(*(void *)(a1 + 56)) == 1))
  {
    unint64_t v7 = *(void *)(a1 + 80);
    if (v7 > 6) {
      uint64_t v8 = "<Invalid Right>";
    }
    else {
      uint64_t v8 = off_189F83D88[v7];
    }
    CFStringAppendFormat(Mutable, 0LL, @"AuthRight: %s, ", v8);
  }

  else
  {
    CFStringAppendFormat(Mutable, 0LL, @"AuthValue: 0x%llx, ", *(void *)(a1 + 80));
  }

  unint64_t v9 = *(void *)(a1 + 88);
  if (v9 > 0xE) {
    uint64_t v10 = "<Invalid Reason>";
  }
  else {
    uint64_t v10 = off_189F83DC0[v9];
  }
  CFStringAppendFormat(Mutable, 0LL, @"Reason: %s, ", v10);
  CFStringAppendFormat(Mutable, 0LL, @"Version: %llu, ", *(void *)(a1 + 96));
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11)
  {
    v12 = tcc_object_copy_description(v11);
    CFStringAppendFormat(Mutable, 0LL, @"IndirectObject: %@, ", v12);
    CFRelease(v12);
  }

  if (*(void *)(a1 + 120)) {
    CFStringAppendFormat(Mutable, 0LL, @"Last Modified: %@, ", *(void *)(a1 + 120));
  }
  if (*(void *)(a1 + 128)) {
    CFStringAppendFormat(Mutable, 0LL, @"Expired At: %@, ", *(void *)(a1 + 128));
  }
  uint64_t v13 = *(void *)(a1 + 104);
  if (v13)
  {
    uint64_t v14 = tcc_object_copy_description(v13);
    CFStringAppendFormat(Mutable, 0LL, @"Atrributed Entity: %@, ", v14);
    CFRelease(v14);
  }

  if ((*(_DWORD *)(a1 + 140) & 0x80000000) == 0) {
    CFStringAppendFormat(Mutable, 0LL, @"Session pid: %d, ", *(unsigned int *)(a1 + 140));
  }
  if (*(void *)(a1 + 144)) {
    CFStringAppendFormat(Mutable, 0LL, @"Session pid version: %llu, ", *(void *)(a1 + 144));
  }
  if (*(void *)(a1 + 152)) {
    CFStringAppendFormat(Mutable, 0LL, @"Boot UUID: %s, ", *(void *)(a1 + 152));
  }
  if (*(_BYTE *)(a1 + 136)) {
    CFStringAppend(Mutable, @"Allow Standard User to Set System Service");
  }
  if (*(_BYTE *)(a1 + 160)) {
    CFStringAppend(Mutable, @"Has Prompted For Allow");
  }
  CFStringAppend(Mutable, @">");
  return Mutable;
}

uint64_t tcc_authorization_record_hash(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    uint64_t v3 = tcc_object_hash(v2);
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    uint64_t v3 = tcc_object_hash(v4) - v3 + 32 * v3;
  }
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5) {
    uint64_t v3 = tcc_object_hash(v5) - v3 + 32 * v3;
  }
  uint64_t v6 = *(void *)(a1 + 80) - v3 + 32 * v3;
  uint64_t v7 = *(void *)(a1 + 88) - v6 + 32 * v6;
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 96) - v7 + 32 * v7;
  if (v8) {
    uint64_t v9 = tcc_object_hash(v8) - v9 + 32 * v9;
  }
  uint64_t v10 = *(void *)(a1 + 112);
  if (v10) {
    uint64_t v9 = tcc_object_hash(v10) - v9 + 32 * v9;
  }
  uint64_t v11 = *(const void **)(a1 + 120);
  if (v11) {
    uint64_t v9 = CFHash(v11) - v9 + 32 * v9;
  }
  v12 = *(const void **)(a1 + 128);
  if (v12) {
    uint64_t v9 = CFHash(v12) - v9 + 32 * v9;
  }
  if (*(_BYTE *)(a1 + 136)) {
    return 31 * v9;
  }
  else {
    return 31 * v9 + 1;
  }
}

uint64_t tcc_authorization_record_equal(uint64_t a1, uint64_t a2)
{
  uint64_t result = tcc_object_equal(*(void *)(a1 + 56), *(void *)(a2 + 56));
  if ((_DWORD)result)
  {
    uint64_t result = tcc_object_equal(*(void *)(a1 + 64), *(void *)(a2 + 64));
    if ((_DWORD)result)
    {
      uint64_t result = tcc_object_equal(*(void *)(a1 + 72), *(void *)(a2 + 72));
      if ((_DWORD)result)
      {
        if (*(void *)(a1 + 80) != *(void *)(a2 + 80)
          || *(void *)(a1 + 88) != *(void *)(a2 + 88)
          || *(void *)(a1 + 96) != *(void *)(a2 + 96))
        {
          return 0LL;
        }

        uint64_t result = tcc_object_equal(*(void *)(a1 + 104), *(void *)(a2 + 104));
        if ((_DWORD)result)
        {
          uint64_t result = tcc_object_equal(*(void *)(a1 + 112), *(void *)(a2 + 112));
          if ((_DWORD)result)
          {
            uint64_t v5 = *(const void **)(a1 + 120);
            if (!v5 || (v6 = *(const void **)(a2 + 120)) == 0LL || (uint64_t result = CFEqual(v5, v6), (_DWORD)result))
            {
              uint64_t v7 = *(const void **)(a1 + 128);
              if (!v7 || (v8 = *(const void **)(a2 + 128)) == 0LL || (uint64_t result = CFEqual(v7, v8), (_DWORD)result))
              {
                if (*(unsigned __int8 *)(a1 + 136) != *(unsigned __int8 *)(a2 + 136)
                  || *(_DWORD *)(a1 + 140) != *(_DWORD *)(a2 + 140)
                  || *(void *)(a1 + 144) != *(void *)(a2 + 144))
                {
                  return 0LL;
                }

                uint64_t v9 = *(const char **)(a1 + 152);
                uint64_t v10 = *(const char **)(a2 + 152);
                if (v9 == v10) {
                  return 1LL;
                }
                uint64_t result = 0LL;
                if (v9 && v10)
                {
                  size_t v11 = strlen(v9);
                  return !strncmp(v9, v10, v11);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t tcc_log_handle()
{
  if (tcc_log_handle_onceToken != -1) {
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  }
  return tcc_client_log;
}

os_log_t __tcc_log_handle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TCC", "access");
  tcc_client_log = (uint64_t)result;
  return result;
}

void tccd_send_v2(_xpc_connection_s *a1, uint64_t a2, int a3, uint64_t a4, void *a5, uint64_t a6)
{
  BOOL v9 = a3 == 0;
  tccd_set_message_number(a5);
  if (a1)
  {
    tccd_send_message(a1, v9, a5, a6, 7LL, 0);
  }

  else
  {
    uint64_t v10 = tccd();
    tccd_send_message(v10, v9, a5, a6, 7LL, 0);
    if (v10) {
      xpc_release(v10);
    }
  }

void tccd_set_message_number(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!xpc_dictionary_get_value(a1, "TCCD_MSG_ID"))
  {
    do
    {
      unint64_t v2 = __ldaxr(&tccd_set_message_number_message_number);
      unint64_t v3 = v2 + 1;
    }

    while (__stlxr(v2 + 1, &tccd_set_message_number_message_number));
    pid_t v4 = getpid();
    snprintf(__str, 0x20uLL, "%d.%lld", v4, v3);
    xpc_dictionary_set_string(a1, "TCCD_MSG_ID", __str);
  }

void tccd_send_message(_xpc_connection_s *a1, int a2, void *a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if (a6 >= a5)
  {
    v28 = (void *)MEMORY[0x186E48978](a3);
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    v29 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 67109634;
      *(_DWORD *)&buffer[4] = a5;
      *(_WORD *)&buffer[8] = 2048;
      *(void *)&buffer[10] = a3;
      *(_WORD *)&buffer[18] = 2082;
      *(void *)&buffer[20] = v28;
      _os_log_error_impl( &dword_186DC2000,  v29,  OS_LOG_TYPE_ERROR,  "Limit (%d) reached; cannot send request (%p): %{public}s",
        buffer,
        0x1Cu);
    }

    free(v28);
    xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v30)
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      v52 = (os_log_s *)tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_FAULT)) {
        tccd_send_message_cold_2(v52);
      }
      abort();
    }

    xpc_object_t v31 = v30;
    xpc_dictionary_set_BOOL(v30, "do_not_cache", 1);
    (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, v31);
    v32 = v31;
    goto LABEL_62;
  }

  p_cache = &OBJC_CLASS___OS_tcc_service.cache;
  if (tcc_log_handle_onceToken != -1) {
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  }
  uint64_t v13 = &OBJC_CLASS___OS_tcc_service.cache;
  if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
    if (Mutable)
    {
      uint64_t v15 = Mutable;
      string = xpc_dictionary_get_string(a3, "TCCD_MSG_ID");
      CFStringAppendFormat(v15, 0LL, @"msgID=%s, ", string);
      uint64_t v17 = "function";
      uint64_t v18 = off_189F847F8;
      do
      {
        uint64_t v19 = xpc_dictionary_get_string(a3, v17);
        if (v19) {
          CFStringAppendFormat(v15, 0LL, @"%s=%s, ", v17, v19);
        }
        uint64_t v20 = *v18++;
        uint64_t v17 = v20;
      }

      while (v20);
      uint64_t v53 = a4;
      v21 = "target_token";
      v22 = off_189F84820;
      uint64_t v23 = MEMORY[0x1895F9240];
      do
      {
        xpc_object_t value = xpc_dictionary_get_value(a3, v21);
        if (value)
        {
          v25 = value;
          if (MEMORY[0x186E48A8C]() == v23 && xpc_data_get_bytes(v25, buffer, 0LL, 0x20uLL) == 32)
          {
            audit_token_t atoken = *(audit_token_t *)buffer;
            audit_token_to_au32(&atoken, &auidp, &euidp, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
            CFStringAppendFormat( v15,  0LL,  @"%s={pid:%d, auid:%d, euid:%d}, ",  v21,  pidp,  auidp,  euidp);
          }
        }

        v26 = *v22++;
        v21 = v26;
      }

      while (v26);
      v27 = stringCopyUTF8String(v15);
      CFRelease(v15);
      a4 = v53;
      uint64_t v13 = (void **)(&OBJC_CLASS___OS_tcc_service + 16);
      p_cache = (void **)(&OBJC_CLASS___OS_tcc_service + 16);
    }

    else
    {
      v27 = 0LL;
    }

    name = xpc_connection_get_name(a1);
    v34 = (os_log_s *)v13[32];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)&buffer[8] = 1024;
      v35 = "asynchronous";
      *(_DWORD *)buffer = 67110146;
      *(_DWORD *)&buffer[4] = a6;
      if (!a2) {
        v35 = "synchronous";
      }
      *(_DWORD *)&buffer[10] = a5;
      *(_WORD *)&buffer[14] = 2082;
      *(void *)&buffer[16] = v35;
      *(_WORD *)&buffer[24] = 2082;
      *(void *)&buffer[26] = name;
      __int16 v63 = 2082;
      v64 = v27;
      _os_log_impl( &dword_186DC2000,  v34,  OS_LOG_TYPE_INFO,  "SEND: %d/%d %{public}s to %{public}s: request: %{public}s",  buffer,  0x2Cu);
    }

    free(v27);
  }

  if (a2)
  {
    xpc_retain(a1);
    xpc_retain(a3);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __tccd_send_message_block_invoke;
    handler[3] = &unk_189F847D0;
    handler[5] = a3;
    handler[6] = a1;
    handler[4] = a4;
    int v55 = a2;
    int v56 = a5;
    unsigned int v57 = a6;
    xpc_connection_send_message_with_reply(a1, a3, global_queue, handler);
    return;
  }

  xpc_object_t v37 = xpc_connection_send_message_with_reply_sync(a1, a3);
  v38 = v37;
  if (v37 == (xpc_object_t)MEMORY[0x1895F9198])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    v41 = (os_log_s *)v13[32];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buffer = 134217984;
      *(void *)&buffer[4] = a3;
      _os_log_impl( &dword_186DC2000,  v41,  OS_LOG_TYPE_DEFAULT,  "send_message_with_reply_sync(): connection interrupted for message: %p.",  buffer,  0xCu);
    }

    tccd_send_message(a1, 0LL, a3, a4, a5, a6 + 1);
    goto LABEL_61;
  }

  if (v37 != (xpc_object_t)MEMORY[0x1895F91A0])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)v13[32], OS_LOG_TYPE_INFO))
    {
      v39 = (void *)tccd_reply_description_redacted(v38);
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      v40 = (os_log_s *)v13[32];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buffer = 136446210;
        *(void *)&buffer[4] = v39;
        _os_log_impl(&dword_186DC2000, v40, OS_LOG_TYPE_INFO, "RECV: synchronous reply %{public}s", buffer, 0xCu);
      }

      free(v39);
    }

    (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v38);
    goto LABEL_61;
  }

  if (xpc_dictionary_get_BOOL(a3, "user_tccd_unavailable"))
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    v42 = (os_log_s *)v13[32];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      tccd_send_message_cold_1((uint64_t)a3, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_60:
    (*(void (**)(uint64_t, void))(a4 + 16))(a4, MEMORY[0x1895F91A0]);
    goto LABEL_61;
  }

  if (tcc_log_handle_onceToken != -1) {
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  }
  v49 = (os_log_s *)v13[32];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 134217984;
    *(void *)&buffer[4] = a3;
    _os_log_impl( &dword_186DC2000,  v49,  OS_LOG_TYPE_DEFAULT,  "send_message_with_reply_sync(): user tccd unavailable, sending %p to system tccd",  buffer,  0xCu);
  }

  v50 = tccd();
  if (!v50) {
    goto LABEL_60;
  }
  v51 = v50;
  xpc_dictionary_set_BOOL(a3, "user_tccd_unavailable", 1);
  tccd_send_message(v51, 0LL, a3, a4, a5, a6 + 1);
  xpc_release(v51);
LABEL_61:
  v32 = v38;
LABEL_62:
  xpc_release(v32);
}

_xpc_connection_s *tccd()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  mach_service = xpc_connection_create_mach_service("com.apple.tccd", global_queue, 2uLL);
  unint64_t v2 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_293);
    xpc_connection_resume(v2);
  }

  return v2;
}

void __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(uint64_t a1, const char *a2)
{
  if (tcc_log_handle_onceToken != -1) {
    goto LABEL_7;
  }
  while (1)
  {
    pid_t v4 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446210;
      uint64_t v6 = a1;
      _os_log_error_impl(&dword_186DC2000, v4, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v5, 0xCu);
    }

    if (a2) {
      strlen(a2);
    }
    abort_with_payload();
LABEL_7:
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  }

void TCCAccessRequest(const void *a1, const __CFDictionary *a2, uint64_t a3)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  if (a2)
  {
    Value = CFDictionaryGetValue(a2, @"_kTCCAccessRequestOptionPreflight");
    uint64_t v8 = CFDictionaryGetValue(a2, @"_kTCCAccessRequestOptionTargetToken");
    BOOL v9 = CFDictionaryGetValue(a2, @"_kTCCAccessRequestOptionSyncCallback");
    if (v9) {
      int v10 = CFEqual(v9, (CFTypeRef)*MEMORY[0x189604DE8]);
    }
    else {
      int v10 = 0;
    }
    uint64_t v13 = (const __CFBoolean *)CFDictionaryGetValue(a2, kTCCAccessCheckOptionPurposeRequired);
    int v11 = 0;
    int v12 = 1;
    if (v13 && v13 != (const __CFBoolean *)*MEMORY[0x189605018])
    {
      int v12 = CFBooleanGetValue(v13);
      int v11 = 1;
    }
  }

  else
  {
    int v11 = 0;
    int v10 = 0;
    uint64_t v8 = 0LL;
    Value = 0LL;
    int v12 = 1;
  }

  if (os_variant_is_darwinos())
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    uint64_t v14 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186DC2000,  v14,  OS_LOG_TYPE_DEFAULT,  "automatically granting auth because of darwinos",  buf,  2u);
    }

    if (v10)
    {
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1LL);
      return;
    }

    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 0x40000000LL;
    v23[2] = __TCCAccessRequest_block_invoke;
    v23[3] = &unk_189F83E80;
    v23[4] = a3;
    uint64_t v15 = v23;
  }

  else
  {
    if (TCCAccessRequest_cache_once != -1) {
      dispatch_once(&TCCAccessRequest_cache_once, &__block_literal_global_132);
    }
    if (TCCAccessRequest_cache_map && TCCAccessRequest_cache_queue)
    {
      CFRetain(a1);
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 0x40000000LL;
      v18[2] = __TCCAccessRequest_block_invoke_4;
      v18[3] = &unk_189F84000;
      v18[6] = v8;
      v18[7] = a1;
      v18[4] = Value;
      v18[5] = a3;
      v18[8] = global_queue;
      int v19 = v10;
      int v20 = v11;
      int v21 = v12;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessRequest_block_invoke_2_157;
      activity_block[3] = &unk_189F84028;
      int v17 = v10;
      activity_block[4] = Value;
      activity_void block[5] = v18;
      activity_block[6] = a1;
      _os_activity_initiate(&dword_186DC2000, "TCCAccessRequest() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      return;
    }

    if (v10)
    {
      (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0LL);
      return;
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __TCCAccessRequest_block_invoke_3;
    block[3] = &unk_189F83EE8;
    block[4] = a3;
    uint64_t v15 = block;
  }

  dispatch_async(global_queue, v15);
}

uint64_t __TCCAccessRequest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

dispatch_queue_t __TCCAccessRequest_block_invoke_2()
{
  TCCAccessRequest_cache_map = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189604E40], MEMORY[0x189605250]);
  dispatch_queue_t result = dispatch_queue_create("com.apple.tcc.cache_queue", 0LL);
  TCCAccessRequest_cache_queue = (uint64_t)result;
  return result;
}

uint64_t __TCCAccessRequest_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __TCCAccessRequest_block_invoke_4(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v36 = 0LL;
  xpc_object_t v37 = &v36;
  uint64_t v38 = 0x2000000000LL;
  uint64_t v39 = 0LL;
  *(_OWORD *)keys = xmmword_189F83F08;
  __int128 v45 = *(_OWORD *)&off_189F83F18;
  __int128 v46 = xmmword_189F83F28;
  uint64_t v43 = 0LL;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  *(_OWORD *)values = 0u;
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __TCCAccessRequest_block_invoke_5;
    block[3] = &unk_189F83F40;
    uint64_t v8 = *(void *)(a1 + 56);
    block[4] = &v36;
    void block[5] = v8;
    dispatch_sync((dispatch_queue_t)TCCAccessRequest_cache_queue, block);
    BOOL v9 = (const __CFData *)v37[3];
    if (v9)
    {
      v48.location = 0LL;
      v48.length = 16LL;
      CFDataGetBytes(v9, v48, buffer);
      int v10 = *(_DWORD *)buffer;
      uint64_t v11 = *(void *)(a1 + 32);
      if (*(_DWORD *)buffer != 2)
      {
        if (v11)
        {
          (*(void (**)(uint64_t, void, void))(v11 + 16))(v11, 0LL, v34);
          int v10 = *(_DWORD *)buffer;
        }

        if (!*(_DWORD *)(a1 + 72))
        {
          uint64_t v14 = *(dispatch_queue_s **)(a1 + 64);
          v31[0] = v7;
          v31[1] = 0x40000000LL;
          v31[2] = __TCCAccessRequest_block_invoke_6;
          v31[3] = &unk_189F83F68;
          v31[4] = *(void *)(a1 + 40);
          BOOL v32 = v10 == 0;
          dispatch_async(v14, v31);
          goto LABEL_23;
        }

        int v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_16:
        v12();
LABEL_23:
        uint64_t v15 = 0LL;
        xpc_object_t v16 = 0LL;
        pid_t v4 = 0LL;
        goto LABEL_34;
      }

      if (v11)
      {
        (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, 1LL, 0LL);
        int v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
        goto LABEL_16;
      }
    }
  }

  pid_t v4 = stringCopyUTF8String(*(const __CFString **)(a1 + 56));
  if (!v4) {
    goto LABEL_29;
  }
  values[0] = xpc_string_create("TCCAccessRequest");
  if (!values[0]) {
    goto LABEL_29;
  }
  values[1] = xpc_string_create(v4);
  if (!values[1]) {
    goto LABEL_29;
  }
  *(void *)&__int128 v41 = xpc_BOOL_create(*(void *)(a1 + 32) != 0LL);
  if (!(void)v41) {
    goto LABEL_29;
  }
  int v5 = *(const void **)(a1 + 48);
  xpc_object_t v6 = v5 ? xpc_data_create(v5, 0x20uLL) : xpc_null_create();
  if ((*((void *)&v41 + 1) = v6) != 0LL
    && (*(void *)&__int128 v42 = xpc_BOOL_create(0), (void)v42)
    && (!*(_DWORD *)(a1 + 76) ? (xpc_object_t v13 = xpc_null_create()) : (xpc_object_t v13 = xpc_BOOL_create(*(_DWORD *)(a1 + 80) != 0)),
        (*((void *)&v42 + 1) = v13) != 0LL))
  {
    xpc_object_t v16 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    if (v16)
    {
      int v17 = tccd();
      if (v17)
      {
        uint64_t v15 = v17;
        CFRetain(*(CFTypeRef *)(a1 + 56));
        BOOL v18 = *(_DWORD *)(a1 + 72) == 0;
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 0x40000000LL;
        v25[2] = __TCCAccessRequest_block_invoke_8;
        v25[3] = &unk_189F83FD8;
        char v28 = 0;
        BOOL v29 = v3;
        __int128 v19 = *(_OWORD *)(a1 + 48);
        int8x16_t v26 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
        __int128 v27 = v19;
        tccd_set_message_number(v16);
        tccd_send_message(v15, v18, v16, (uint64_t)v25, 7LL, 0);
        goto LABEL_34;
      }
    }
  }

  else
  {
LABEL_29:
    xpc_object_t v16 = 0LL;
  }

  if (*(_DWORD *)(a1 + 72))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    int v20 = *(dispatch_queue_s **)(a1 + 64);
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 0x40000000LL;
    v30[2] = __TCCAccessRequest_block_invoke_7;
    v30[3] = &unk_189F83F90;
    v30[4] = *(void *)(a1 + 40);
    dispatch_async(v20, v30);
  }

  uint64_t v15 = 0LL;
LABEL_34:
  int v21 = (const void *)v37[3];
  if (v21) {
    CFRelease(v21);
  }
  free(v4);
  if (v16) {
    xpc_release(v16);
  }
  if (v15) {
    xpc_release(v15);
  }
  xpc_object_t v22 = values[0];
  if (values[0])
  {
    uint64_t v23 = &values[1];
    do
    {
      xpc_release(v22);
      v24 = *v23++;
      xpc_object_t v22 = v24;
    }

    while (v24);
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
  _Block_object_dispose(&v36, 8);
}

CFTypeRef __TCCAccessRequest_block_invoke_5(uint64_t a1)
{
  CFTypeRef result = CFDictionaryGetValue((CFDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (result) {
    return CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  }
  return result;
}

uint64_t __TCCAccessRequest_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

uint64_t __TCCAccessRequest_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __TCCAccessRequest_block_invoke_8(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessRequest_block_invoke_8_cold_1(a2);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_15;
  }

  string = xpc_dictionary_get_string(a2, "abort");
  if (string)
  {
    uint64_t v12 = (uint64_t)string;
    xpc_object_t v13 = xpc_dictionary_get_string(a2, "problem_key");
    __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(v12, v13);
  }

  xpc_object_t value = xpc_dictionary_get_value(a2, "extension");
  if (*(void *)(a1 + 48)
    || *(_BYTE *)(a1 + 64)
    || !value
    || (xpc_string_get_string_ptr(value), sandbox_extension_consume() != -1))
  {
    BOOL v6 = xpc_dictionary_get_BOOL(a2, "preflight_unknown");
    BOOL v7 = xpc_dictionary_get_BOOL(a2, "restricted");
    BOOL v8 = xpc_dictionary_get_BOOL(a2, "result");
    BOOL v9 = xpc_dictionary_get_BOOL(a2, "do_not_cache");
    if (*(_BYTE *)(a1 + 65) && !v9)
    {
      CFRetain(*(CFTypeRef *)(a1 + 56));
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 0x40000000LL;
      v14[2] = __TCCAccessRequest_block_invoke_152;
      v14[3] = &__block_descriptor_tmp_153;
      BOOL v15 = v6;
      v14[4] = *(void *)(a1 + 56);
      BOOL v16 = v8;
      BOOL v17 = v7;
      dispatch_async((dispatch_queue_t)TCCAccessRequest_cache_queue, v14);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, BOOL, BOOL))(v10 + 16))(v10, v6, v7);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_15:
    v11();
    CFRelease(*(CFTypeRef *)(a1 + 56));
    return;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __TCCAccessRequest_block_invoke_152(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40)) {
    goto LABEL_6;
  }
  if (CFDictionaryGetValue((CFDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 32)))
  {
    CFRelease(*(CFTypeRef *)(a1 + 32));
    return;
  }

  if (*(_BYTE *)(a1 + 40)) {
    int v2 = 2;
  }
  else {
LABEL_6:
  }
    int v2 = *(_BYTE *)(a1 + 41) == 0;
  int v4 = v2;
  char v5 = *(_BYTE *)(a1 + 42);
  time_t v6 = time(0LL);
  CFDataRef v3 = CFDataCreate(0LL, (const UInt8 *)&v4, 16LL);
  CFDictionarySetValue((CFMutableDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 32), v3);
  CFRelease(v3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __TCCAccessRequest_block_invoke_2_157(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  dispatch_queue_global_t v3 = service_queue(*(void *)(a1 + 48), *(void *)(a1 + 32) != 0LL);
  int v4 = *(void **)(a1 + 40);
  if (v2) {
    dispatch_sync(v3, v4);
  }
  else {
    dispatch_async(v3, v4);
  }
}

dispatch_queue_global_t service_queue(uint64_t a1, int a2)
{
  if (service_queue_once != -1) {
    dispatch_once(&service_queue_once, &__block_literal_global_295);
  }
  int v4 = &service_queue_preflight_map;
  if (!a2) {
    int v4 = &service_queue_request_map;
  }
  uint64_t v5 = *v4;
  uint64_t v18 = 0LL;
  __int128 v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  if (!v5) {
    goto LABEL_7;
  }
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 0x40000000LL;
  v16[2] = __service_queue_block_invoke_2;
  v16[3] = &unk_189F848C0;
  v16[4] = &v18;
  v16[5] = v5;
  v16[6] = a1;
  char v17 = a2;
  dispatch_sync((dispatch_queue_t)service_queue_qq, v16);
  dispatch_queue_global_t global_queue = (dispatch_queue_global_t)v19[3];
  if (!global_queue)
  {
LABEL_7:
    if ((service_queue_have_logged & 1) == 0)
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      BOOL v7 = (os_log_s *)tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
        service_queue_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      service_queue_have_logged = 1;
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }

  _Block_object_dispose(&v18, 8);
  return global_queue;
}

uint64_t TCCAccessPreflight(const void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 1;
  uint64_t v2 = MEMORY[0x1895F87A8];
  *(_OWORD *)keys = xmmword_189F84098;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = __TCCAccessPreflight_block_invoke;
  v9[3] = &unk_189F84050;
  v9[4] = &v10;
  dispatch_queue_global_t v3 = (void *)*MEMORY[0x189604DE8];
  values[0] = v9;
  values[1] = v3;
  int v4 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)values, 2LL, MEMORY[0x189605240], 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    v8[0] = v2;
    v8[1] = 0x40000000LL;
    v8[2] = __TCCAccessPreflight_block_invoke_2;
    v8[3] = &unk_189F84078;
    v8[4] = &v10;
    TCCAccessRequest(a1, v4, (uint64_t)v8);
    CFRelease(v5);
  }

  uint64_t v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __TCCAccessPreflight_block_invoke(uint64_t result, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 2;
  }
  return result;
}

uint64_t __TCCAccessPreflight_block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
  }
  return result;
}

uint64_t TCCAccessRestricted(const void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  *(_OWORD *)keys = xmmword_189F84098;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = __TCCAccessRestricted_block_invoke;
  v7[3] = &unk_189F840B0;
  v7[4] = &v8;
  uint64_t v2 = (void *)*MEMORY[0x189604DE8];
  values[0] = v7;
  values[1] = v2;
  dispatch_queue_global_t v3 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)values, 2LL, MEMORY[0x189605240], 0LL);
  if (v3)
  {
    int v4 = v3;
    TCCAccessRequest(a1, v3, (uint64_t)&__block_literal_global_167);
    CFRelease(v4);
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __TCCAccessRestricted_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t TCCAccessCheckAuditToken(const void *a1, void *a2, CFDictionaryRef theDict)
{
  keys[4] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  __int128 v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  if (theDict)
  {
    uint64_t v6 = CFDictionaryGetValue(theDict, kTCCAccessCheckOptionPrompt);
    BOOL v7 = (void *)*MEMORY[0x189604DE8];
    else {
      uint64_t v8 = &__block_literal_global_169;
    }
    uint64_t v9 = (void *)*MEMORY[0x189605018];
    xpc_object_t value = (void *)*MEMORY[0x189605018];
    int ValueIfPresent = CFDictionaryGetValueIfPresent(theDict, kTCCAccessCheckOptionPurposeRequired, (const void **)&value);
    char v11 = value;
    if (!ValueIfPresent) {
      char v11 = v9;
    }
  }

  else
  {
    char v11 = (void *)*MEMORY[0x189605018];
    xpc_object_t value = (void *)*MEMORY[0x189605018];
    BOOL v7 = (void *)*MEMORY[0x189604DE8];
    uint64_t v8 = &__block_literal_global_169;
  }

  keys[0] = @"_kTCCAccessRequestOptionTargetToken";
  keys[1] = @"_kTCCAccessRequestOptionPreflight";
  keys[2] = @"_kTCCAccessRequestOptionSyncCallback";
  keys[3] = (void *)kTCCAccessCheckOptionPurposeRequired;
  values[0] = a2;
  values[1] = v8;
  xpc_object_t values[2] = v7;
  values[3] = v11;
  uint64_t v12 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)values, 4LL, MEMORY[0x189605240], 0LL);
  if (v12)
  {
    int v13 = v12;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __TCCAccessCheckAuditToken_block_invoke_2;
    v16[3] = &unk_189F84158;
    v16[4] = &v18;
    TCCAccessRequest(a1, v12, (uint64_t)v16);
    CFRelease(v13);
  }

  uint64_t v14 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __TCCAccessCheckAuditToken_block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

uint64_t TCCAccessPreflightWithAuditToken(const void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  char v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 1;
  *(_OWORD *)keys = xmmword_189F84178;
  uint64_t v16 = @"_kTCCAccessRequestOptionSyncCallback";
  uint64_t v3 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = __TCCAccessPreflightWithAuditToken_block_invoke;
  v9[3] = &unk_189F84198;
  v9[4] = &v10;
  values[0] = a2;
  values[1] = v9;
  xpc_object_t values[2] = *(void **)MEMORY[0x189604DE8];
  int v4 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)values, 3LL, MEMORY[0x189605240], 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    v8[0] = v3;
    v8[1] = 0x40000000LL;
    v8[2] = __TCCAccessPreflightWithAuditToken_block_invoke_2;
    v8[3] = &unk_189F841C0;
    v8[4] = &v10;
    TCCAccessRequest(a1, v4, (uint64_t)v8);
    CFRelease(v5);
  }

  uint64_t v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __TCCAccessPreflightWithAuditToken_block_invoke(uint64_t result, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 2;
  }
  return result;
}

uint64_t __TCCAccessPreflightWithAuditToken_block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
  }
  return result;
}

CFTypeRef _TCCTCCAccessCopyInformationInternalForEntry(void *a1)
{
  size_t count = xpc_dictionary_get_count(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, count, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable) {
    return 0LL;
  }
  int v4 = Mutable;
  string = xpc_dictionary_get_string(a1, "bundle");
  uint64_t v6 = (const UInt8 *)string;
  if (!string)
  {
    uint64_t v9 = 0LL;
LABEL_8:
    char v11 = xpc_dictionary_get_string(a1, "path");
    if (v11)
    {
      CFStringRef v12 = CFStringCreateWithCString(0LL, v11, 0x8000100u);
      if (!v12)
      {
        CFDateRef v19 = 0LL;
        CFStringRef v20 = 0LL;
        CFStringRef v14 = 0LL;
        goto LABEL_32;
      }

      CFDictionarySetValue(v4, kTCCInfoPath, v12);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    int v13 = xpc_dictionary_get_string(a1, "service");
    if (v13)
    {
      CFStringRef v14 = CFStringCreateWithCString(0LL, v13, 0x8000100u);
      if (!v14)
      {
        CFDateRef v19 = 0LL;
        CFStringRef v20 = 0LL;
        goto LABEL_32;
      }

      CFDictionarySetValue(v4, (const void *)kTCCInfoService, v14);
    }

    else
    {
      CFStringRef v14 = 0LL;
    }

    BOOL v15 = (const void *)kTCCInfoGranted;
    BOOL v16 = xpc_dictionary_get_BOOL(a1, "granted");
    uint64_t v17 = (const void **)MEMORY[0x189604DE8];
    if (!v16) {
      uint64_t v17 = (const void **)MEMORY[0x189604DE0];
    }
    CFDictionarySetValue(v4, v15, *v17);
    int64_t int64 = xpc_dictionary_get_int64(a1, "last_modified");
    if (int64 < 1)
    {
      CFDateRef v19 = 0LL;
    }

    else
    {
      CFDateRef v19 = CFDateCreate(0LL, (double)(int64 - 978307200));
      CFDictionarySetValue(v4, kTCCInfoLastModified, v19);
    }

    int64_t v21 = xpc_dictionary_get_int64(a1, "expired_at");
    if (v21 >= 1)
    {
      CFDateRef v22 = CFDateCreate(0LL, (double)(v21 - 978307200));
      CFDictionarySetValue(v4, kTCCInfoExpiredAt, v22);
      CFRelease(v22);
    }

    uint64_t v23 = xpc_dictionary_get_string(a1, "_CHILD_SERVICE_");
    if (!v23)
    {
      CFStringRef v20 = 0LL;
      goto LABEL_30;
    }

    CFStringRef v20 = CFStringCreateWithCString(0LL, v23, 0x8000100u);
    if (v20)
    {
      CFDictionarySetValue(v4, @"_CHILD_SERVICE_", v20);
LABEL_30:
      CFTypeRef v10 = CFRetain(v4);
      goto LABEL_33;
    }

LABEL_32:
    CFTypeRef v10 = 0LL;
LABEL_33:
    CFRelease(v4);
    int v4 = v19;
    if (!v9) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  size_t v7 = strlen(string);
  uint64_t v8 = CFURLCreateWithBytes(0LL, v6, v7, 0x8000100u, 0LL);
  if (!v8)
  {
    CFTypeRef v10 = 0LL;
LABEL_44:
    CFRelease(v4);
    return v10;
  }

  uint64_t v9 = v8;
  uint64_t v6 = (const UInt8 *)CFBundleCreate(0LL, v8);
  if (v6)
  {
    CFDictionarySetValue(v4, kTCCInfoBundle, v6);
    goto LABEL_8;
  }

  CFRelease(v4);
  CFTypeRef v10 = 0LL;
  CFStringRef v12 = 0LL;
  CFStringRef v14 = 0LL;
  CFStringRef v20 = 0LL;
  CFDateRef v19 = 0LL;
LABEL_34:
  CFRelease(v9);
  int v4 = v19;
LABEL_35:
  if (v6) {
    CFRelease(v6);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v4) {
    goto LABEL_44;
  }
  return v10;
}

uint64_t TCCAccessCopyInformation(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  CFStringRef v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  xpc_object_t values = 0LL;
  *(_OWORD *)keys = xmmword_189F846B8;
  v18[0] = 0LL;
  v18[1] = 0LL;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (xpc_object_t values = xpc_string_create("TCCAccessCopyInformation")) != 0LL
    && (v18[0] = xpc_string_create(v1)) != 0LL
    && (xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0LL)
  {
    uint64_t v3 = v2;
    int v4 = tccd();
    if (v4)
    {
      uint64_t v5 = v4;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      v12[2] = __TCCAccessCopyInformation_block_invoke;
      v12[3] = &unk_189F84210;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate(&dword_186DC2000, "TCCAccessCopyInformation() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
      free(v1);
      xpc_release(v3);
      uint64_t v6 = v5;
    }

    else
    {
      free(v1);
      uint64_t v6 = (_xpc_connection_s *)v3;
    }

    xpc_release(v6);
  }

  else
  {
    free(v1);
  }

  xpc_object_t v7 = values;
  if (values)
  {
    uint64_t v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      uint64_t v9 = *v8++;
      xpc_object_t v7 = v9;
    }

    while (v9);
  }

  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __TCCAccessCopyInformation_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessCopyInformation_block_invoke_2;
  v3[3] = &unk_189F841E8;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessCopyInformation_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessCopyInformation_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "clients");
    if (value) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = TCCAccessCopyInformationInternal(value);
    }
  }

CFMutableArrayRef TCCAccessCopyInformationInternal(void *a1)
{
  size_t count = xpc_array_get_count(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, count, MEMORY[0x189605228]);
  CFMutableArrayRef v4 = Mutable;
  if (Mutable)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 0x40000000LL;
    applier[2] = __TCCAccessCopyInformationInternal_block_invoke;
    applier[3] = &__block_descriptor_tmp_299;
    applier[4] = Mutable;
    xpc_array_apply(a1, applier);
  }

  return v4;
}

CFStringRef TCCAccessCopyInformationForBundle(__CFBundle *a1)
{
  CFTypeRef result = CFBundleGetIdentifier(a1);
  if (result) {
    return (const __CFString *)TCCAccessCopyInformationForBundleId(result);
  }
  return result;
}

uint64_t TCCAccessCopyInformationForBundleId(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  *(_OWORD *)keys = xmmword_189F84230;
  CFDateRef v19 = "client";
  *(_OWORD *)xpc_object_t values = 0u;
  __int128 v17 = 0u;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values[0] = xpc_string_create("TCCAccessCopyInformationForBundle")) != 0LL
    && (values[1] = xpc_string_create("bundle")) != 0LL
    && (*(void *)&__int128 v17 = xpc_string_create(v1), (void)v17)
    && (xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0LL)
  {
    uint64_t v3 = v2;
    CFMutableArrayRef v4 = tccd();
    if (v4)
    {
      uint64_t v5 = v4;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessCopyInformationForBundleId_block_invoke;
      activity_block[3] = &unk_189F84278;
      activity_void block[5] = v4;
      activity_void block[6] = v3;
      activity_block[4] = &v12;
      _os_activity_initiate( &dword_186DC2000,  "TCCAccessCopyInformationForBundle() IPC-per-user",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
      xpc_release(v5);
    }

    free(v1);
    xpc_release(v3);
  }

  else
  {
    free(v1);
  }

  xpc_object_t v6 = values[0];
  if (values[0])
  {
    xpc_object_t v7 = &values[1];
    do
    {
      xpc_release(v6);
      uint64_t v8 = *v7++;
      xpc_object_t v6 = v8;
    }

    while (v8);
  }

  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __TCCAccessCopyInformationForBundleId_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessCopyInformationForBundleId_block_invoke_2;
  v3[3] = &unk_189F84250;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessCopyInformationForBundleId_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessCopyInformationForBundleId_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "services");
    if (value) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = TCCAccessCopyInformationInternal(value);
    }
  }

uint64_t TCCAccessCopyBundleIdentifiersForService(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  xpc_object_t values = 0LL;
  *(_OWORD *)keys = xmmword_189F846B8;
  v18[0] = 0LL;
  v18[1] = 0LL;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (xpc_object_t values = xpc_string_create("TCCAccessCopyBundleIdentifiersForService")) != 0LL
    && (v18[0] = xpc_string_create(v1)) != 0LL
    && (xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0LL)
  {
    uint64_t v3 = v2;
    CFMutableArrayRef v4 = tccd();
    if (v4)
    {
      uint64_t v5 = v4;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      v12[2] = __TCCAccessCopyBundleIdentifiersForService_block_invoke;
      v12[3] = &unk_189F842F0;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate( &dword_186DC2000,  "TCCAccessCopyBundleIdentifiersForService() IPC",  OS_ACTIVITY_FLAG_DETACHED,  v12);
      free(v1);
      xpc_release(v3);
      xpc_object_t v6 = v5;
    }

    else
    {
      free(v1);
      xpc_object_t v6 = (_xpc_connection_s *)v3;
    }

    xpc_release(v6);
  }

  else
  {
    free(v1);
  }

  xpc_object_t v7 = values;
  if (values)
  {
    uint64_t v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      uint64_t v9 = *v8++;
      xpc_object_t v7 = v9;
    }

    while (v9);
  }

  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __TCCAccessCopyBundleIdentifiersForService_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessCopyBundleIdentifiersForService_block_invoke_2;
  v3[3] = &unk_189F842C8;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessCopyBundleIdentifiersForService_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessCopyBundleIdentifiersForService_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "clients");
    if (value)
    {
      uint64_t v5 = value;
      size_t count = xpc_array_get_count(value);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, count, MEMORY[0x189605228]);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = Mutable;
      if (Mutable)
      {
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 0x40000000LL;
        applier[2] = __TCCAccessCopyBundleIdentifiersForService_block_invoke_214;
        applier[3] = &unk_189F842A0;
        applier[4] = *(void *)(a1 + 32);
        xpc_array_apply(v5, applier);
      }
    }
  }

uint64_t __TCCAccessCopyBundleIdentifiersForService_block_invoke_214( uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  CFStringRef v5 = CFStringCreateWithCString(0LL, string_ptr, 0x8000100u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v5);
    CFRelease(v6);
  }

  return 1LL;
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  xpc_object_t values = 0LL;
  *(_OWORD *)keys = xmmword_189F846B8;
  v18[0] = 0LL;
  v18[1] = 0LL;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (xpc_object_t values = xpc_string_create("TCCAccessCopyBundleIdentifiersDisabledForService")) != 0LL
    && (v18[0] = xpc_string_create(v1)) != 0LL
    && (xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0LL)
  {
    uint64_t v3 = v2;
    CFMutableArrayRef v4 = tccd();
    if (v4)
    {
      CFStringRef v5 = v4;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      v12[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke;
      v12[3] = &unk_189F84368;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate( &dword_186DC2000,  "TCCAccessCopyBundleIdentifiersDisabledForService() IPC",  OS_ACTIVITY_FLAG_DETACHED,  v12);
      free(v1);
      xpc_release(v3);
      CFStringRef v6 = v5;
    }

    else
    {
      free(v1);
      CFStringRef v6 = (_xpc_connection_s *)v3;
    }

    xpc_release(v6);
  }

  else
  {
    free(v1);
  }

  xpc_object_t v7 = values;
  if (values)
  {
    uint64_t v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      uint64_t v9 = *v8++;
      xpc_object_t v7 = v9;
    }

    while (v9);
  }

  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2;
  v3[3] = &unk_189F84340;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "clients");
    if (value)
    {
      CFStringRef v5 = value;
      size_t count = xpc_array_get_count(value);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, count, MEMORY[0x189605228]);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = Mutable;
      if (Mutable)
      {
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 0x40000000LL;
        applier[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_219;
        applier[3] = &unk_189F84318;
        applier[4] = *(void *)(a1 + 32);
        xpc_array_apply(v5, applier);
      }
    }
  }

uint64_t __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_219( uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  CFStringRef v5 = CFStringCreateWithCString(0LL, string_ptr, 0x8000100u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v5);
    CFRelease(v6);
  }

  return 1LL;
}

uint64_t TCCAccessSetInternal( const __CFString *a1, const char *a2, const char *a3, const void *a4, int a5, const __CFData *a6, int a7, CFDictionaryRef theDict)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2000000000LL;
  char v54 = 0;
  __int128 v67 = xmmword_189F843C8;
  __int128 v68 = *(_OWORD *)&off_189F843D8;
  __int128 v69 = xmmword_189F843E8;
  *(_OWORD *)keys = xmmword_189F84388;
  __int128 v64 = *(_OWORD *)&off_189F84398;
  __int128 v65 = xmmword_189F843A8;
  __int128 v66 = *(_OWORD *)&off_189F843B8;
  uint64_t v62 = 0LL;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  *(_OWORD *)xpc_object_t values = 0u;
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, kTCCInfoLastModified);
    int64_t v16 = (int64_t)Value;
    if (Value)
    {
      CFTypeID v17 = CFGetTypeID(Value);
      if (v17 == CFDateGetTypeID()) {
        int64_t v16 = (uint64_t)(MEMORY[0x186E4842C](v16) + *MEMORY[0x189604DA8]);
      }
      else {
        int64_t v16 = 0LL;
      }
    }

    CFDateRef v19 = (const __CFBoolean *)CFDictionaryGetValue(theDict, kTCCSetNoKill);
    uint64_t v18 = v19;
    if (v19)
    {
      CFTypeID v20 = CFGetTypeID(v19);
      if (v20 == CFBooleanGetTypeID()) {
        LODWORD(v18) = CFBooleanGetValue(v18);
      }
      else {
        LODWORD(v18) = 0;
      }
    }
  }

  else
  {
    LODWORD(v18) = 0;
    int64_t v16 = 0LL;
  }

  int64_t v21 = stringCopyUTF8String(a1);
  if (!v21) {
    goto LABEL_50;
  }
  values[0] = xpc_string_create("TCCAccessSetInternal");
  if (!values[0]) {
    goto LABEL_50;
  }
  values[1] = xpc_string_create(v21);
  if (!values[1]) {
    goto LABEL_50;
  }
  xpc_object_t v22 = a2 ? xpc_string_create(a2) : xpc_null_create();
  *(void *)&__int128 v56 = v22;
  if (!v22) {
    goto LABEL_50;
  }
  xpc_object_t v23 = a3 ? xpc_string_create(a3) : xpc_null_create();
  *((void *)&v56 + 1) = v23;
  if (!v23) {
    goto LABEL_50;
  }
  xpc_object_t v24 = a4 ? xpc_data_create(a4, 0x20uLL) : xpc_null_create();
  *(void *)&__int128 v57 = v24;
  if (!v24) {
    goto LABEL_50;
  }
  *((void *)&v57 + 1) = xpc_BOOL_create(a5 != 0);
  if (!*((void *)&v57 + 1)) {
    goto LABEL_50;
  }
  if (a6)
  {
    BytePtr = CFDataGetBytePtr(a6);
    size_t Length = CFDataGetLength(a6);
    xpc_object_t v27 = xpc_data_create(BytePtr, Length);
  }

  else
  {
    xpc_object_t v27 = xpc_null_create();
  }

  *(void *)&__int128 v58 = v27;
  if (!v27) {
    goto LABEL_50;
  }
  *((void *)&v58 + 1) = xpc_null_create();
  if (!*((void *)&v58 + 1)) {
    goto LABEL_50;
  }
  *(void *)&__int128 v59 = xpc_null_create();
  if ((void)v59
    && (*((void *)&v59 + 1) = xpc_null_create()) != 0LL
    && (*(void *)&__int128 v60 = xpc_uint64_create(0LL), (void)v60)
    && (*((void *)&v60 + 1) = xpc_int64_create(v16)) != 0LL
    && (*(void *)&__int128 v61 = xpc_BOOL_create((_DWORD)v18 != 0), (void)v61)
    && (*((void *)&v61 + 1) = xpc_null_create()) != 0LL
    && (xpc_object_t v28 = xpc_dictionary_create((const char *const *)keys, values, 0xEuLL)) != 0LL)
  {
    BOOL v29 = v28;
    xpc_object_t v30 = tccd();
    if (v30)
    {
      xpc_object_t v31 = v30;
      if (theDict)
      {
        BOOL v32 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"auth_value");
        if (v32)
        {
          v33 = v32;
          CFTypeID v34 = CFGetTypeID(v32);
          if (v34 == CFNumberGetTypeID())
          {
            uint64_t valuePtr = 0LL;
            if (CFNumberGetValue(v33, kCFNumberLongLongType, &valuePtr) != 1)
            {
              if (tcc_log_handle_onceToken != -1) {
                dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
              }
              v35 = (os_log_s *)tcc_client_log;
              if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
                TCCAccessSetInternal_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
              }
            }

            xpc_dictionary_set_uint64(v29, "auth_value", valuePtr);
            xpc_dictionary_set_uint64(v29, "TCCD_MSG_SPI_VERSION", 2uLL);
          }
        }
      }

      v49[0] = MEMORY[0x1895F87A8];
      v49[1] = 0x40000000LL;
      v49[2] = __TCCAccessSetInternal_block_invoke;
      v49[3] = &unk_189F84400;
      v49[4] = &v51;
      tccd_set_message_number(v29);
      tccd_send_message(v31, 0, v29, (uint64_t)v49, 7LL, 0);
      free(v21);
      xpc_release(v29);
      uint64_t v43 = v31;
    }

    else
    {
      free(v21);
      uint64_t v43 = (_xpc_connection_s *)v29;
    }

    xpc_release(v43);
  }

  else
  {
LABEL_50:
    free(v21);
  }

  xpc_object_t v44 = values[0];
  if (values[0])
  {
    __int128 v45 = &values[1];
    do
    {
      xpc_release(v44);
      __int128 v46 = *v45++;
      xpc_object_t v44 = v46;
    }

    while (v46);
  }

  uint64_t v47 = *((unsigned __int8 *)v52 + 24);
  _Block_object_dispose(&v51, 8);
  return v47;
}

void __TCCAccessSetInternal_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessSetInternal_block_invoke_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
  }

uint64_t TCCAccessSetForBundle(uint64_t a1, CFBundleRef bundle, char a3)
{
  keys[1] = *(void **)MEMORY[0x1895F89C0];
  CFStringRef Identifier = CFBundleGetIdentifier(bundle);
  if (!Identifier) {
    return 0LL;
  }
  xpc_object_t v7 = Identifier;
  CFURLRef v8 = CFBundleCopyBundleURL(bundle);
  if (!v8) {
    return 0LL;
  }
  CFURLRef v9 = v8;
  xpc_object_t values = v8;
  keys[0] = @"bundle_url";
  CFDictionaryRef v10 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)&values, 1LL, MEMORY[0x189605240], 0LL);
  uint64_t v11 = TCCAccessSetForBundleIdWithOptions(a1, v7, a3, (uint64_t)v10);
  CFRelease(v9);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

uint64_t TCCAccessSetForBundleIdWithOptions(uint64_t a1, const __CFString *a2, char a3, uint64_t a4)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  xpc_object_t v7 = stringCopyUTF8String(a2);
  CFURLRef v8 = v7;
  if (v7)
  {
    activity_block[0] = MEMORY[0x1895F87A8];
    activity_block[1] = 0x40000000LL;
    activity_block[2] = __TCCAccessSetForBundleIdWithOptions_block_invoke;
    activity_block[3] = &unk_189F84428;
    activity_block[4] = &v13;
    activity_void block[5] = a1;
    char v12 = a3;
    activity_void block[6] = v7;
    void activity_block[7] = a4;
    _os_activity_initiate( &dword_186DC2000,  "TCCAccessSetForBundleIdWithOptions() IPC",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
  }

  free(v8);
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t TCCAccessSetForBundleId(uint64_t a1, const __CFString *a2, char a3)
{
  return TCCAccessSetForBundleIdWithOptions(a1, a2, a3, 0LL);
}

uint64_t __TCCAccessSetForBundleIdWithOptions_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result = TCCAccessSetInternal( *(const __CFString **)(a1 + 40),  "bundle",  *(const char **)(a1 + 48),  0LL,  *(unsigned __int8 *)(a1 + 64),  0LL,  a7,  *(CFDictionaryRef *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t TCCAccessSetForPath(uint64_t a1, const __CFString *a2, char a3)
{
  return TCCAccessSetForPathWithOptions(a1, a2, a3, 0LL);
}

uint64_t TCCAccessSetForPathWithOptions(uint64_t a1, const __CFString *a2, char a3, uint64_t a4)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  xpc_object_t v7 = stringCopyUTF8String(a2);
  CFURLRef v8 = v7;
  if (v7)
  {
    activity_block[0] = MEMORY[0x1895F87A8];
    activity_block[1] = 0x40000000LL;
    activity_block[2] = __TCCAccessSetForPathWithOptions_block_invoke;
    activity_block[3] = &unk_189F84450;
    activity_block[4] = &v13;
    activity_void block[5] = a1;
    char v12 = a3;
    activity_void block[6] = v7;
    void activity_block[7] = a4;
    _os_activity_initiate( &dword_186DC2000,  "TCCAccessSetForPathWithOptions() IPC",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
  }

  free(v8);
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __TCCAccessSetForPathWithOptions_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result = TCCAccessSetInternal( *(const __CFString **)(a1 + 40),  "path",  *(const char **)(a1 + 48),  0LL,  *(unsigned __int8 *)(a1 + 64),  0LL,  a7,  *(CFDictionaryRef *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t TCCAccessSetForAuditToken(uint64_t a1, __int128 *a2, char a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  char v13 = 0;
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 0x40000000LL;
  activity_block[2] = __TCCAccessSetForAuditToken_block_invoke;
  activity_block[3] = &unk_189F84478;
  activity_block[4] = &v10;
  activity_void block[5] = a1;
  __int128 v3 = a2[1];
  __int128 v7 = *a2;
  __int128 v8 = v3;
  char v9 = a3;
  _os_activity_initiate(&dword_186DC2000, "TCCAccessSetForAuditToken() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
  uint64_t v4 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

uint64_t __TCCAccessSetForAuditToken_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result = TCCAccessSetInternal( *(const __CFString **)(a1 + 40),  0LL,  0LL,  (const void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 80),  0LL,  a7,  0LL);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t TCCAccessSetForAuditTokenWithOptions(uint64_t a1, __int128 *a2, char a3, uint64_t a4)
{
  uint64_t v13 = 0x2000000000LL;
  v7[1] = 0x40000000LL;
  __int128 v4 = a2[1];
  __int128 v8 = *a2;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  char v14 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[2] = __TCCAccessSetForAuditTokenWithOptions_block_invoke;
  v7[3] = &unk_189F844A0;
  v7[4] = &v11;
  void v7[5] = a1;
  __int128 v9 = v4;
  char v10 = a3;
  v7[6] = a4;
  _os_activity_initiate(&dword_186DC2000, "TCCAccessSetForAuditToken() IPC", OS_ACTIVITY_FLAG_DETACHED, v7);
  uint64_t v5 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __TCCAccessSetForAuditTokenWithOptions_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result = TCCAccessSetInternal( *(const __CFString **)(a1 + 40),  0LL,  0LL,  (const void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 88),  0LL,  a7,  *(CFDictionaryRef *)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t TCCAccessSetOverride(const __CFString *a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  *(_OWORD *)keys = xmmword_189F844C0;
  xpc_object_t v22 = "override";
  *(_OWORD *)xpc_object_t values = 0u;
  __int128 v20 = 0u;
  __int128 v3 = stringCopyUTF8String(a1);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessSetOverride")) != 0LL
    && (values[1] = xpc_string_create(v3)) != 0LL
    && (*(void *)&__int128 v20 = xpc_BOOL_create(a2 != 0), (void)v20)
    && (xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0LL)
  {
    uint64_t v5 = v4;
    CFStringRef v6 = tccd();
    if (v6)
    {
      __int128 v7 = v6;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessSetOverride_block_invoke;
      activity_block[3] = &unk_189F84508;
      activity_void block[5] = v6;
      activity_void block[6] = v5;
      activity_block[4] = &v15;
      _os_activity_initiate(&dword_186DC2000, "TCCAccessSetOverride() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      __int128 v8 = v7;
    }

    else
    {
      free(v3);
      __int128 v8 = (_xpc_connection_s *)v5;
    }

    xpc_release(v8);
  }

  else
  {
    free(v3);
  }

  xpc_object_t v9 = values[0];
  if (values[0])
  {
    char v10 = &values[1];
    do
    {
      xpc_release(v9);
      uint64_t v11 = *v10++;
      xpc_object_t v9 = v11;
    }

    while (v11);
  }

  uint64_t v12 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __TCCAccessSetOverride_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessSetOverride_block_invoke_2;
  v3[3] = &unk_189F844E0;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessSetOverride_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessSetOverride_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
  }

uint64_t TCCAccessGetOverride(const __CFString *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  *(_OWORD *)keys = xmmword_189F846B8;
  xpc_object_t values = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  __int128 v3 = stringCopyUTF8String(a1);
  if (v3
    && (xpc_object_t values = xpc_string_create("TCCAccessGetOverride")) != 0LL
    && (v20[0] = xpc_string_create(v3)) != 0LL
    && (xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0LL)
  {
    uint64_t v5 = v4;
    CFStringRef v6 = tccd();
    if (v6)
    {
      __int128 v7 = v6;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessGetOverride_block_invoke;
      activity_block[3] = &unk_189F84558;
      activity_block[4] = &v15;
      activity_void block[5] = v6;
      activity_void block[6] = v5;
      void activity_block[7] = a2;
      _os_activity_initiate(&dword_186DC2000, "TCCAccessGetOverride() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      __int128 v8 = v7;
    }

    else
    {
      free(v3);
      __int128 v8 = (_xpc_connection_s *)v5;
    }

    xpc_release(v8);
  }

  else
  {
    free(v3);
  }

  xpc_object_t v9 = values;
  if (values)
  {
    char v10 = (void **)v20;
    do
    {
      xpc_release(v9);
      uint64_t v11 = *v10++;
      xpc_object_t v9 = v11;
    }

    while (v11);
  }

  uint64_t v12 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __TCCAccessGetOverride_block_invoke(void *a1)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = __TCCAccessGetOverride_block_invoke_2;
  v4[3] = &unk_189F84530;
  v1 = (_xpc_connection_s *)a1[5];
  __int128 v3 = (void *)a1[6];
  uint64_t v2 = a1[7];
  v4[4] = a1[4];
  v4[5] = v2;
  tccd_set_message_number(v3);
  tccd_send_message(v1, 0, v3, (uint64_t)v4, 7LL, 0);
}

void __TCCAccessGetOverride_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessGetOverride_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    BOOL v4 = xpc_dictionary_get_BOOL(a2, "result");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
    if (v4) {
      **(_BYTE **)(a1 + 40) = xpc_dictionary_get_BOOL(a2, "override");
    }
  }

CFMutableSetRef TCCAccessCopyOverrides()
{
  keys[1] = *(char **)MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  uint64_t v17 = 0LL;
  keys[0] = "function";
  xpc_object_t values = xpc_string_create("TCCAccessGetOverrides");
  if (values)
  {
    xpc_object_t v0 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    if (v0)
    {
      v1 = v0;
      uint64_t v2 = tccd();
      if (v2)
      {
        __int128 v3 = v2;
        activity_block[0] = MEMORY[0x1895F87A8];
        activity_block[1] = 0x40000000LL;
        activity_block[2] = __TCCGetOverridesInternal_block_invoke;
        activity_block[3] = &unk_189F84930;
        activity_void block[5] = v2;
        activity_void block[6] = v1;
        activity_block[4] = &v12;
        _os_activity_initiate( &dword_186DC2000,  "TCCAccessGetOverrides() IPC",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
        xpc_release(v3);
      }

      xpc_release(v1);
    }

    xpc_object_t v4 = values;
    if (values)
    {
      uint64_t v5 = (void **)&v17;
      do
      {
        xpc_release(v4);
        CFStringRef v6 = *v5++;
        xpc_object_t v4 = v6;
      }

      while (v6);
    }
  }

  __int128 v7 = (const __CFArray *)v13[3];
  _Block_object_dispose(&v12, 8);
  if (!v7) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(v7);
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], Count, MEMORY[0x189605258]);
  v19.length = CFArrayGetCount(v7);
  v19.location = 0LL;
  CFArrayApplyFunction(v7, v19, (CFArrayApplierFunction)_append_override, Mutable);
  CFRelease(v7);
  return Mutable;
}

void _append_override(const void *a1, __CFSet *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    CFSetSetValue(a2, a1);
  }

  else
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      _append_override_cold_1();
    }
  }

uint64_t TCCAccessReset(const __CFString *cf1)
{
  return TCCResetInternal("TCCAccessResetInternal", cf1, 0LL, 0LL, 0LL);
}

uint64_t TCCAccessResetForBundle(const __CFString *a1, CFBundleRef bundle)
{
  CFStringRef Identifier = CFBundleGetIdentifier(bundle);
  if (Identifier)
  {
    CFTypeID v4 = stringCopyUTF8String(Identifier);
    if (v4) {
      uint64_t v5 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v4, 0LL);
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    CFTypeID v4 = 0LL;
  }

  free(v4);
  return v5;
}

uint64_t TCCAccessResetForBundleId(const __CFString *a1, const __CFString *a2)
{
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3) {
    uint64_t v4 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v3, 0LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForBundleIdWithAuditToken(const __CFString *a1, const __CFString *a2)
{
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3) {
    uint64_t v4 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v3, 0LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForPath(const __CFString *a1, const __CFString *a2)
{
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3) {
    uint64_t v4 = TCCResetInternal("TCCAccessResetInternal", a1, "path", v3, 0LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForBundleIdWithOptions( const __CFString *a1, const __CFString *a2, const __CFDictionary *a3)
{
  uint64_t v5 = stringCopyUTF8String(a2);
  if (v5) {
    uint64_t v6 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v5, a3);
  }
  else {
    uint64_t v6 = 0LL;
  }
  free(v5);
  return v6;
}

uint64_t TCCAccessDeclarePolicy(const __CFUUID *a1, const __CFString *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  char v19 = 0;
  CFUUIDBytes uuid = CFUUIDGetUUIDBytes(a1);
  uint64_t v23 = "display";
  __int128 v21 = 0u;
  *(_OWORD *)keys = xmmword_189F84578;
  *(_OWORD *)xpc_object_t values = 0u;
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessDeclarePolicy")) != 0LL
    && (values[1] = xpc_uuid_create(&uuid.byte0)) != 0LL
    && (*(void *)&__int128 v21 = xpc_string_create(v3), (void)v21)
    && (xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0LL)
  {
    uint64_t v5 = v4;
    uint64_t v6 = tccd();
    if (v6)
    {
      __int128 v7 = v6;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessDeclarePolicy_block_invoke;
      activity_block[3] = &unk_189F845C0;
      activity_void block[5] = v6;
      activity_void block[6] = v5;
      activity_block[4] = &v16;
      _os_activity_initiate(&dword_186DC2000, "TCCAccessDeclarePolicy() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      __int128 v8 = v7;
    }

    else
    {
      free(v3);
      __int128 v8 = (_xpc_connection_s *)v5;
    }

    xpc_release(v8);
  }

  else
  {
    free(v3);
  }

  xpc_object_t v9 = values[0];
  if (values[0])
  {
    char v10 = &values[1];
    do
    {
      xpc_release(v9);
      uint64_t v11 = *v10++;
      xpc_object_t v9 = v11;
    }

    while (v11);
  }

  uint64_t v12 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __TCCAccessDeclarePolicy_block_invoke(void *a1)
{
  uint64_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessDeclarePolicy_block_invoke_2;
  v3[3] = &unk_189F84598;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessDeclarePolicy_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessDeclarePolicy_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
  }

uint64_t TCCAccessSelectPolicyForExtensionWithIdentifier(const __CFUUID *a1, const __CFString *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  char v19 = 0;
  CFUUIDBytes uuid = CFUUIDGetUUIDBytes(a1);
  uint64_t v23 = "bundle_id";
  __int128 v21 = 0u;
  *(_OWORD *)keys = xmmword_189F845E0;
  *(_OWORD *)xpc_object_t values = 0u;
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessSelectPolicyForExtensionWithIdentifier")) != 0LL
    && (values[1] = xpc_uuid_create(&uuid.byte0)) != 0LL
    && (*(void *)&__int128 v21 = xpc_string_create(v3), (void)v21)
    && (xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0LL)
  {
    uint64_t v5 = v4;
    uint64_t v6 = tccd();
    if (v6)
    {
      __int128 v7 = v6;
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 0x40000000LL;
      activity_block[2] = __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke;
      activity_block[3] = &unk_189F84628;
      activity_void block[5] = v6;
      activity_void block[6] = v5;
      activity_block[4] = &v16;
      _os_activity_initiate( &dword_186DC2000,  "TCCAccessSelectPolicyForExtensionWithIdentifier() IPC",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
      free(v3);
      xpc_release(v5);
      __int128 v8 = v7;
    }

    else
    {
      free(v3);
      __int128 v8 = (_xpc_connection_s *)v5;
    }

    xpc_release(v8);
  }

  else
  {
    free(v3);
  }

  xpc_object_t v9 = values[0];
  if (values[0])
  {
    char v10 = &values[1];
    do
    {
      xpc_release(v9);
      uint64_t v11 = *v10++;
      xpc_object_t v9 = v11;
    }

    while (v11);
  }

  uint64_t v12 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke(void *a1)
{
  uint64_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke_2;
  v3[3] = &unk_189F84600;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
  }

_xpc_connection_s *TCCAccessResetPoliciesExcept(const __CFArray *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(_OWORD *)keys = xmmword_189F84648;
  xpc_object_t values = 0LL;
  v12[0] = 0LL;
  v12[1] = 0LL;
  uint64_t result = (_xpc_connection_s *)xpc_array_create(0LL, 0LL);
  if (result)
  {
    __int128 v3 = result;
    v15.length = CFArrayGetCount(a1);
    v15.location = 0LL;
    CFArrayApplyFunction(a1, v15, (CFArrayApplierFunction)_append_policy, v3);
    xpc_object_t values = xpc_string_create("TCCAccessResetPoliciesExcept");
    if (values)
    {
      v12[0] = xpc_retain(v3);
      if (v12[0])
      {
        xpc_object_t v4 = (_xpc_connection_s *)xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = tccd();
          if (v6)
          {
            __int128 v7 = v6;
            activity_block[0] = MEMORY[0x1895F87A8];
            activity_block[1] = 0x40000000LL;
            activity_block[2] = __TCCAccessResetPoliciesExcept_block_invoke;
            activity_block[3] = &__block_descriptor_tmp_257;
            activity_block[4] = v6;
            activity_void block[5] = v5;
            _os_activity_initiate( &dword_186DC2000,  "TCCAccessResetPoliciesExcept() IPC",  OS_ACTIVITY_FLAG_DETACHED,  activity_block);
            xpc_release(v3);
            __int128 v3 = v5;
            uint64_t v5 = v7;
          }

          xpc_release(v3);
          __int128 v3 = v5;
        }
      }
    }

    xpc_release(v3);
    uint64_t result = (_xpc_connection_s *)values;
  }

  if (result)
  {
    __int128 v8 = (void **)v12;
    do
    {
      xpc_release(result);
      xpc_object_t v9 = (_xpc_connection_s *)*v8++;
      uint64_t result = v9;
    }

    while (v9);
  }

  return result;
}

void __TCCAccessResetPoliciesExcept_block_invoke(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  tccd_set_message_number(v2);
  tccd_send_message(v1, 0, v2, (uint64_t)&__block_literal_global_256, 7LL, 0);
}

void __TCCAccessResetPoliciesExcept_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCAccessResetPoliciesExcept_block_invoke_2_cold_1(a2);
    }
  }

uint64_t TCCExpirationCopyInformationForService(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  xpc_object_t values = 0LL;
  *(_OWORD *)keys = xmmword_189F846B8;
  v18[0] = 0LL;
  v18[1] = 0LL;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (xpc_object_t values = xpc_string_create("TCCExpirationCopyInformationForService")) != 0LL
    && (v18[0] = xpc_string_create(v1)) != 0LL
    && (xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0LL)
  {
    __int128 v3 = v2;
    xpc_object_t v4 = tccd();
    if (v4)
    {
      uint64_t v5 = v4;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      void v12[2] = __TCCExpirationCopyInformationForService_block_invoke;
      v12[3] = &unk_189F846F8;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate( &dword_186DC2000,  "TCCExpirationCopyInformationForService() IPC",  OS_ACTIVITY_FLAG_DETACHED,  v12);
      free(v1);
      xpc_release(v3);
      uint64_t v6 = v5;
    }

    else
    {
      free(v1);
      uint64_t v6 = (_xpc_connection_s *)v3;
    }

    xpc_release(v6);
  }

  else
  {
    free(v1);
  }

  xpc_object_t v7 = values;
  if (values)
  {
    __int128 v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      xpc_object_t v9 = *v8++;
      xpc_object_t v7 = v9;
    }

    while (v9);
  }

  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __TCCExpirationCopyInformationForService_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCExpirationCopyInformationForService_block_invoke_2;
  v3[3] = &unk_189F846D0;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCExpirationCopyInformationForService_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCExpirationCopyInformationForService_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "clients");
    if (value) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = TCCAccessCopyInformationInternal(value);
    }
  }

uint64_t TCCExpirationResetService(const __CFString *cf1)
{
  return TCCResetInternal("TCCExpirationReset", cf1, "bundle", "kTCCClientAll", 0LL);
}

uint64_t TCCExpirationResetServiceForBundleIdentifier(const __CFString *a1, const __CFString *a2)
{
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3) {
    uint64_t v4 = TCCResetInternal("TCCExpirationReset", a1, "bundle", v3, 0LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  free(v3);
  return v4;
}

uint64_t TCCExpirationResetServiceForPath(const __CFString *a1, const __CFString *a2)
{
  __int128 v3 = stringCopyUTF8String(a2);
  if (v3) {
    uint64_t v4 = TCCResetInternal("TCCExpirationReset", a1, "path", v3, 0LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  free(v3);
  return v4;
}

uint64_t TCCServiceCopyDescriptions(const __CFString *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  xpc_object_t values = 0LL;
  *(_OWORD *)keys = xmmword_189F84718;
  v18[0] = 0LL;
  v18[1] = 0LL;
  if (a1)
  {
    v1 = stringCopyUTF8String(a1);
    if (!v1) {
      goto LABEL_14;
    }
  }

  else
  {
    v1 = 0LL;
  }

  xpc_object_t values = xpc_string_create("TCCServiceCopyDescriptions");
  if (!values) {
    goto LABEL_17;
  }
  if (v1) {
    xpc_object_t v2 = xpc_string_create(v1);
  }
  else {
    xpc_object_t v2 = xpc_null_create();
  }
  v18[0] = v2;
  if (v2)
  {
    __int128 v3 = (_xpc_connection_s *)xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = tccd();
      if (v5)
      {
        uint64_t v6 = v5;
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 0x40000000LL;
        void v12[2] = __TCCServiceCopyDescriptions_block_invoke;
        v12[3] = &unk_189F84758;
        v12[5] = v5;
        v12[6] = v4;
        v12[4] = &v13;
        _os_activity_initiate(&dword_186DC2000, "TCCServiceCopyDescriptions() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
        xpc_release(v4);
        uint64_t v4 = v6;
      }

      xpc_release(v4);
    }
  }

LABEL_14:
  xpc_object_t v7 = values;
  if (values)
  {
    __int128 v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      xpc_object_t v9 = *v8++;
      xpc_object_t v7 = v9;
    }

    while (v9);
  }

LABEL_17:
  free(v1);
  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

    CFDictionarySetValue((CFMutableDictionaryRef)Value, a3, a4);
    uint64_t v22 = tcc_object_copy_description((uint64_t)a3);
    uint64_t v23 = tcc_object_copy_description((uint64_t)a4);
    uint64_t v24 = *(os_log_s **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = tcc_service_get_name((uint64_t)a2);
      CFTypeID v34 = 136315650;
      v35 = v25;
      uint64_t v36 = 2112;
      uint64_t v37 = v22;
      uint64_t v38 = 2112;
      uint64_t v39 = v23;
      _os_log_impl(&dword_186DC2000, v24, OS_LOG_TYPE_INFO, "SET: (%s, %@) -> %@", (uint8_t *)&v34, 0x20u);
    }

    CFRelease(v22);
    CFRelease(v23);
    return;
  }

  int8x16_t v26 = *(os_log_s **)(a1 + 56);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    _tcc_authorization_cache_locked_set_authorization_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
  }
}

void __TCCServiceCopyDescriptions_block_invoke(void *a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCServiceCopyDescriptions_block_invoke_2;
  v3[3] = &unk_189F84730;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCServiceCopyDescriptions_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCServiceCopyDescriptions_block_invoke_2_cold_1(a2);
    }
  }

  else if (xpc_dictionary_get_value(a2, "service_descriptions"))
  {
    if (MEMORY[0x186E48A8C]() == MEMORY[0x1895F9220])
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _CFXPCCreateCFObjectFromXPCObject();
    }

    else
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      uint64_t v4 = (os_log_s *)tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
        __TCCServiceCopyDescriptions_block_invoke_2_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

CFArrayRef TCCServiceCopyNames(const __CFString *a1)
{
  v1 = (const __CFArray *)TCCServiceCopyDescriptions(a1);
  if (!v1) {
    return 0LL;
  }
  xpc_object_t v2 = v1;
  CFIndex Count = CFArrayGetCount(v1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, Count, MEMORY[0x189605228]);
  if (Mutable)
  {
    uint64_t v5 = Mutable;
    if (CFArrayGetCount(v2) >= 1)
    {
      CFIndex v6 = 0LL;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v6);
        Value = CFDictionaryGetValue(ValueAtIndex, @"name");
        if (Value) {
          CFArrayAppendValue(v5, Value);
        }
        ++v6;
      }

      while (v6 < CFArrayGetCount(v2));
    }

    CFRelease(v2);
    CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
  }

  else
  {
    CFArrayRef Copy = 0LL;
    uint64_t v5 = v2;
  }

  CFRelease(v5);
  return Copy;
}

uint64_t TCCTestInternalWithReplyHander4( uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = 0LL;
  __int128 v21 = &v20;
  uint64_t v22 = 0x2000000000LL;
  char v23 = 0;
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v14 = stringCopyUTF8String(a2);
  uint64_t v15 = tccd();
  uint64_t v16 = v15;
  if (v13 && v14 && v15)
  {
    xpc_dictionary_set_string(v13, "function", "TCCTestInternal");
    xpc_dictionary_set_string(v13, "operation", v14);
    if (a3) {
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a3 + 16))(a3, v13, "arg1");
    }
    if (a4) {
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a4 + 16))(a4, v13, "arg2");
    }
    if (a5) {
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a5 + 16))(a5, v13, "arg3");
    }
    if (a6) {
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a6 + 16))(a6, v13, "arg4");
    }
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 0x40000000LL;
    v19[2] = __TCCTestInternalWithReplyHander4_block_invoke;
    v19[3] = &unk_189F847A8;
    v19[6] = v16;
    v19[7] = v13;
    v19[4] = a7;
    v19[5] = &v20;
    _os_activity_initiate(&dword_186DC2000, "TCCTestInternal() IPC", OS_ACTIVITY_FLAG_DETACHED, v19);
  }

  else if (!v14)
  {
    goto LABEL_15;
  }

  free(v14);
LABEL_15:
  if (v13) {
    xpc_release(v13);
  }
  if (v16) {
    xpc_release(v16);
  }
  uint64_t v17 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v17;
}

void __TCCTestInternalWithReplyHander4_block_invoke(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(a1 + 48);
  xpc_object_t v2 = *(void **)(a1 + 56);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCTestInternalWithReplyHander4_block_invoke_2;
  v3[3] = &unk_189F84780;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  tccd_set_message_number(v2);
  tccd_send_message(v1, 0, v2, (uint64_t)v3, 7LL, 0);
}

void __TCCTestInternalWithReplyHander4_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCTestInternalWithReplyHander4_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, void *, void))(v4 + 16))( v4,  a2,  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    }
  }

uint64_t TCCTestInternalWithReplyHander(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return TCCTestInternalWithReplyHander4(0LL, a2, a3, a4, 0LL, 0LL, a5);
}

uint64_t TCCTestInternal(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  return TCCTestInternalWithReplyHander4(0LL, a1, a2, a3, 0LL, 0LL, 0LL);
}

uint64_t tccd_reply_description_redacted(void *a1)
{
  if (MEMORY[0x186E48A8C]() != MEMORY[0x1895F9250])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    xpc_object_t v2 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      tccd_reply_description_redacted_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return MEMORY[0x186E48978](a1);
  }

  if (!xpc_dictionary_get_string(a1, "extension")) {
    return MEMORY[0x186E48978](a1);
  }
  xpc_object_t v12 = xpc_copy(a1);
  xpc_dictionary_set_string(v12, "extension", "<redacted>");
  if (v12) {
    xpc_object_t v13 = v12;
  }
  else {
    xpc_object_t v13 = a1;
  }
  uint64_t v10 = MEMORY[0x186E48978](v13);
  if (v12) {
    xpc_release(v12);
  }
  return v10;
}

void __tccd_send_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a2 == (void *)MEMORY[0x1895F9198])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    uint64_t v7 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      int v21 = 134217984;
      uint64_t v22 = v8;
      _os_log_impl( &dword_186DC2000,  v7,  OS_LOG_TYPE_DEFAULT,  "send_message_with_reply(): connection interrupted for message: %p.",  (uint8_t *)&v21,  0xCu);
    }

    tccd_send_message( *(void *)(a1 + 48),  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 60),  (*(_DWORD *)(a1 + 64) + 1));
  }

  else
  {
    if (a2 != (void *)MEMORY[0x1895F91A0])
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = (void *)tccd_reply_description_redacted(a2);
        if (tcc_log_handle_onceToken != -1) {
          dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
        }
        uint64_t v5 = (os_log_s *)tcc_client_log;
        if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
        {
          int v21 = 136446210;
          uint64_t v22 = v4;
          _os_log_impl( &dword_186DC2000,  v5,  OS_LOG_TYPE_INFO,  "RECV: asynchronous reply %{public}s",  (uint8_t *)&v21,  0xCu);
        }

        free(v4);
      }

      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
      goto LABEL_29;
    }

    uint64_t v9 = (void **)(a1 + 40);
    if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "user_tccd_unavailable"))
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      uint64_t v10 = (os_log_s *)tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
        __tccd_send_message_block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
      }
LABEL_28:
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_29:
      v6();
      goto LABEL_30;
    }

    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    uint64_t v17 = (os_log_s *)tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *v9;
      int v21 = 134217984;
      uint64_t v22 = v18;
      _os_log_impl( &dword_186DC2000,  v17,  OS_LOG_TYPE_DEFAULT,  "send_message_with_reply(): user tccd unavailable, sending %p to system tccd",  (uint8_t *)&v21,  0xCu);
    }

    char v19 = tccd();
    if (!v19) {
      goto LABEL_28;
    }
    uint64_t v20 = v19;
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "user_tccd_unavailable", 1);
    tccd_send_message( v20,  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 60),  (*(_DWORD *)(a1 + 64) + 1));
    xpc_release(v20);
  }

LABEL_30:
  xpc_release(*(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

dispatch_queue_t __service_queue_block_invoke()
{
  xpc_object_t v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189604E40];
  service_queue_request_map = (uint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189604E40],  0LL);
  service_queue_preflight_map = (uint64_t)CFDictionaryCreateMutable(v0, 0LL, v1, 0LL);
  dispatch_queue_t result = dispatch_queue_create("com.apple.tcc.service_queue", 0LL);
  service_queue_qq = (uint64_t)result;
  return result;
}

void __service_queue_block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 40),  *(const void **)(a1 + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    v4[0] = *(_OWORD *)"com.apple.tcc.";
    memset(&v4[1], 0, 240);
    if (*(_BYTE *)(a1 + 56)) {
      __strlcat_chk();
    }
    size_t v2 = strlen((const char *)v4);
    CFStringGetCString(*(CFStringRef *)(a1 + 48), (char *)v4 + v2, 256 - v2, 0x600u);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = dispatch_queue_create((const char *)v4, 0LL);
    uint64_t v3 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (v3) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48), v3);
    }
  }

uint64_t __TCCAccessCopyInformationInternal_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeRef v4 = _TCCTCCAccessCopyInformationInternalForEntry(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
    CFRelease(v5);
  }

  return 1LL;
}

void __TCCGetOverridesInternal_block_invoke(void *a1)
{
  size_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCGetOverridesInternal_block_invoke_2;
  v3[3] = &unk_189F84908;
  void v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCGetOverridesInternal_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCGetOverridesInternal_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "overrides");
    if (value && MEMORY[0x186E48A8C](value) == MEMORY[0x1895F9220])
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _CFXPCCreateCFObjectFromXPCObject();
    }

    else
    {
      if (tcc_log_handle_onceToken != -1) {
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      }
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
        __TCCGetOverridesInternal_block_invoke_2_cold_2();
      }
    }
  }

uint64_t TCCResetInternal( const char *a1, const __CFString *cf1, const char *a3, const char *a4, const __CFDictionary *a5)
{
  int v10 = CFEqual(cf1, kTCCServiceAll);
  uint64_t v11 = tccd();
  uint64_t v12 = v11;
  if (v10)
  {
    if (v11)
    {
      uint64_t v13 = TCCResetInternalWithConnection((uint64_t)v11, a1, cf1, a3, a4, a5);
      xpc_release(v12);
      if (!(_DWORD)v13) {
        return v13;
      }
      uint64_t v12 = tccd();
      if (!v12) {
        return v13;
      }
LABEL_7:
      uint64_t v14 = TCCResetInternalWithConnection((uint64_t)v12, a1, cf1, a3, a4, a5);
      xpc_release(v12);
      return v14;
    }
  }

  else if (v11)
  {
    goto LABEL_7;
  }

  return 0LL;
}

uint64_t TCCResetInternalWithConnection( uint64_t a1, const char *a2, const __CFString *a3, const char *a4, const char *a5, CFDictionaryRef theDict)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2000000000LL;
  int64_t valuePtr = 1LL;
  char v41 = 0;
  *(_OWORD *)keys = xmmword_189F84950;
  __int128 v47 = *(_OWORD *)&off_189F84960;
  __int128 v48 = xmmword_189F84970;
  uint64_t v45 = 0LL;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  *(_OWORD *)xpc_object_t values = 0u;
  if (theDict)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kTCCSetNoKill);
    uint64_t v13 = Value;
    if (Value)
    {
      CFTypeID v14 = CFGetTypeID(Value);
      if (v14 == CFBooleanGetTypeID()) {
        LODWORD(v13) = CFBooleanGetValue(v13);
      }
      else {
        LODWORD(v13) = 0;
      }
    }

    uint64_t v15 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)kTCCResetSyncAuth);
    if (v15)
    {
      uint64_t v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID() && !CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr))
      {
        if (tcc_log_handle_onceToken != -1) {
          dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
        }
        uint64_t v18 = (os_log_s *)tcc_client_log;
        if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
          TCCResetInternalWithConnection_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }
  }

  else
  {
    LODWORD(v13) = 0;
  }

  int8x16_t v26 = stringCopyUTF8String(a3);
  if (!v26) {
    goto LABEL_29;
  }
  values[0] = xpc_string_create(a2);
  if (!values[0]) {
    goto LABEL_29;
  }
  values[1] = xpc_string_create(v26);
  if (!values[1]) {
    goto LABEL_29;
  }
  xpc_object_t v27 = a4 ? xpc_string_create(a4) : xpc_null_create();
  *(void *)&__int128 v43 = v27;
  if (v27
    && (!a5 ? (xpc_object_t v28 = xpc_null_create()) : (xpc_object_t v28 = xpc_string_create(a5)),
        (*((void *)&v43 + 1) = v28) != 0LL
     && (*(void *)&__int128 v44 = xpc_BOOL_create((_DWORD)v13 != 0), (void)v44)
     && (*((void *)&v44 + 1) = xpc_int64_create(valuePtr)) != 0LL
     && (xpc_object_t v29 = xpc_dictionary_create((const char *const *)keys, values, 6uLL)) != 0LL))
  {
    xpc_object_t v30 = v29;
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 0x40000000LL;
    v36[2] = __TCCResetInternalWithConnection_block_invoke;
    v36[3] = &unk_189F849B0;
    v36[5] = a1;
    v36[6] = v29;
    v36[4] = &v38;
    _os_activity_initiate(&dword_186DC2000, "TCCResetInternal() IPC", OS_ACTIVITY_FLAG_DETACHED, v36);
    free(v26);
    xpc_release(v30);
  }

  else
  {
LABEL_29:
    free(v26);
  }

  xpc_object_t v31 = values[0];
  if (values[0])
  {
    BOOL v32 = &values[1];
    do
    {
      xpc_release(v31);
      v33 = *v32++;
      xpc_object_t v31 = v33;
    }

    while (v33);
  }

  uint64_t v34 = *((unsigned __int8 *)v39 + 24);
  _Block_object_dispose(&v38, 8);
  return v34;
}

void __TCCResetInternalWithConnection_block_invoke(void *a1)
{
  size_t v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __TCCResetInternalWithConnection_block_invoke_2;
  v3[3] = &unk_189F84988;
  void v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7LL, 0);
}

void __TCCResetInternalWithConnection_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    if (tcc_log_handle_onceToken != -1) {
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR)) {
      __TCCResetInternalWithConnection_block_invoke_2_cold_1(a2);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(a2, "result");
  }

void _append_policy(const __CFUUID *a1, void *a2)
{
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(a1);
  xpc_object_t v3 = xpc_uuid_create(&v4.byte0);
  xpc_array_append_value(a2, v3);
}

void OUTLINED_FUNCTION_0_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void tcc_authorization_request_with_endpoint( _xpc_endpoint_s *a1, void *key, uint64_t a3, void (*a4)(void, void, void))
{
  uint64_t v6 = tcc_service_singleton_for_CF_name(key);
  uint64_t v7 = (const void *)tcc_credential_singleton_for_self();
  if (a1) {
    uint64_t v8 = (uint64_t)tcc_server_create_with_endpoint(0LL, a1);
  }
  else {
    uint64_t v8 = tcc_server_singleton_default();
  }
  uint64_t v9 = (void (*)(void, void, void))v8;
  tcc_message_options_create();
  v11[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
  v11[1] = (void (*)(void, void, void))0x40000000;
  v11[2] = (void (*)(void, void, void))__tcc_authorization_request_with_endpoint_block_invoke;
  v11[3] = (void (*)(void, void, void))&unk_189F849D8;
  v11[4] = a4;
  v11[5] = v10;
  v11[6] = (void (*)(void, void, void))a1;
  v11[7] = v9;
  tcc_server_message_request_authorization((uint64_t)v9, (uint64_t)v10, v7, v6, 0LL, v11);
}

uint64_t __tcc_authorization_request_with_endpoint_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_request_with_endpoint_block_invoke_cold_1();
    }
    CFUUIDBytes v4 = *(void (**)(void))(a1[4] + 16LL);
  }

  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    CFUUIDBytes v4 = *(void (**)(void))(a1[4] + 16LL);
  }

  v4();
  uint64_t result = tcc_release(a1[5]);
  if (a1[6]) {
    return tcc_release(a1[7]);
  }
  return result;
}

void tcc_authorization_request(void *key, uint64_t a2, void (*a3)(void, void, void))
{
}

uint64_t tcc_authorization_preflight_with_endpoint(_xpc_endpoint_s *a1, void *key)
{
  xpc_object_t v3 = tcc_service_singleton_for_CF_name(key);
  CFUUIDBytes v4 = (const void *)tcc_credential_singleton_for_self();
  if (a1) {
    uint64_t v5 = (uint64_t)tcc_server_create_with_endpoint(0LL, a1);
  }
  else {
    uint64_t v5 = tcc_server_singleton_default();
  }
  uint64_t v6 = (void (*)(void, void, void))v5;
  tcc_message_options_create();
  uint64_t v8 = (void (*)(void, void, void))v7;
  tcc_message_options_set_reply_handler_policy(v7, 1);
  tcc_message_options_set_request_prompt_policy((uint64_t)v8, 2LL);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
  v11[1] = (void (*)(void, void, void))0x40000000;
  v11[2] = (void (*)(void, void, void))__tcc_authorization_preflight_with_endpoint_block_invoke;
  v11[3] = (void (*)(void, void, void))&unk_189F84A00;
  v11[4] = (void (*)(void, void, void))&v12;
  v11[5] = (void (*)(void, void, void))v3;
  v11[6] = v8;
  v11[7] = (void (*)(void, void, void))a1;
  v11[8] = v6;
  tcc_server_message_request_authorization((uint64_t)v6, (uint64_t)v8, v4, v3, 0LL, v11);
  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __tcc_authorization_preflight_with_endpoint_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_preflight_with_endpoint_block_invoke_cold_1((uint64_t)a1);
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = tcc_authorization_record_get_authorization_right(a2);
  }

  uint64_t result = tcc_release(a1[6]);
  if (a1[7]) {
    return tcc_release(a1[8]);
  }
  return result;
}

uint64_t tcc_authorization_preflight(void *key)
{
  return tcc_authorization_preflight_with_endpoint(0LL, key);
}

uint64_t tcc_authorization_check_audit_token(void *a1, __int128 *a2, const __CFDictionary *a3)
{
  uint64_t v5 = tcc_service_singleton_for_CF_name(a1);
  __int128 v6 = a2[1];
  __int128 v21 = *a2;
  __int128 v22 = v6;
  tcc_credential_create_for_process_with_audit_token((uint64_t)&v21);
  uint64_t v8 = v7;
  uint64_t v9 = tcc_server_singleton_default();
  tcc_message_options_create();
  uint64_t v11 = (void (*)(void, void, void))v10;
  tcc_message_options_set_reply_handler_policy(v10, 1);
  if (a3)
  {
    uint64_t v12 = CFDictionaryGetValue(a3, kTCCAccessCheckOptionPrompt);
    uint64_t v13 = (const void *)*MEMORY[0x189604DE8];
    if (v12 == (const void *)*MEMORY[0x189604DE8])
    {
      uint64_t v14 = (uint64_t)v11;
      uint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v14 = (uint64_t)v11;
      uint64_t v15 = 2LL;
    }

    tcc_message_options_set_request_prompt_policy(v14, v15);
    xpc_object_t value = (void *)*MEMORY[0x189605018];
    if (CFDictionaryGetValueIfPresent(a3, kTCCAccessCheckOptionPurposeRequired, (const void **)&value))
    {
      if (CFEqual(value, v13)) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    tcc_message_options_set_request_prompt_policy((uint64_t)v11, 2LL);
    uint64_t v16 = 0LL;
    xpc_object_t value = (void *)*MEMORY[0x189605018];
  }

  tcc_message_options_set_request_usage_string_policy((uint64_t)v11, v16);
  *(void *)&__int128 v21 = 0LL;
  *((void *)&v21 + 1) = &v21;
  __int128 v22 = 0x2000000000uLL;
  v19[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
  v19[1] = (void (*)(void, void, void))0x40000000;
  v19[2] = (void (*)(void, void, void))__tcc_authorization_check_audit_token_block_invoke;
  v19[3] = (void (*)(void, void, void))&unk_189F84A28;
  v19[4] = (void (*)(void, void, void))&v21;
  v19[5] = v11;
  v19[6] = v8;
  tcc_server_message_request_authorization(v9, (uint64_t)v11, v8, v5, 0LL, v19);
  uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 24LL);
  _Block_object_dispose(&v21, 8);
  return v17;
}

uint64_t __tcc_authorization_check_audit_token_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_check_audit_token_block_invoke_cold_1();
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = tcc_authorization_record_get_authorization_right(a2);
  }

  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

uint64_t tcc_authorization_audit_token_request_change( void *a1, __int128 *a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t v8 = tcc_server_singleton_default();
  tcc_message_options_create();
  uint64_t v10 = (void (*)(void, void, void))v9;
  tcc_message_options_set_reply_handler_policy(v9, 1);
  if (a4 && CFDictionaryContainsKey(a4, kTCCAccessClientDictionary))
  {
    Value = CFDictionaryGetValue(a4, kTCCAccessClientDictionary);
    tcc_message_options_set_client_dict((uint64_t)v10, Value);
  }

  __int128 v12 = a2[1];
  __int128 v19 = *a2;
  __int128 v20 = v12;
  tcc_credential_create_for_process_with_audit_token((uint64_t)&v19);
  uint64_t v14 = v13;
  uint64_t v15 = tcc_service_singleton_for_CF_name(a1);
  *(void *)&__int128 v19 = 0LL;
  *((void *)&v19 + 1) = &v19;
  *(void *)&__int128 v20 = 0x2000000000LL;
  *((void *)&v20 + 1) = 1LL;
  v18[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
  v18[1] = (void (*)(void, void, void))0x40000000;
  void v18[2] = (void (*)(void, void, void))__tcc_authorization_audit_token_request_change_block_invoke;
  v18[3] = (void (*)(void, void, void))&unk_189F84A50;
  v18[4] = (void (*)(void, void, void))&v19;
  v18[5] = v10;
  v18[6] = v14;
  tcc_server_message_request_authorization_change(v8, (uint64_t)v10, v14, v15, a3, 0LL, v18);
  uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 24LL);
  _Block_object_dispose(&v19, 8);
  return v16;
}

uint64_t __tcc_authorization_audit_token_request_change_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_audit_token_request_change_block_invoke_cold_1();
    }
  }

  else
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = tcc_authorization_record_get_authorization_right(a2);
  }

  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

uint64_t tcc_authorization_audit_token_report_use(void *a1, _OWORD *a2)
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 1;
  uint64_t v4 = tcc_server_singleton_default();
  tcc_message_options_create();
  uint64_t v6 = v5;
  tcc_message_options_set_reply_handler_policy(v5, 1);
  __int128 v7 = a2[1];
  v14[0] = *a2;
  v14[1] = v7;
  tcc_credential_create_for_process_with_audit_token((uint64_t)v14);
  uint64_t v9 = v8;
  uint64_t v10 = tcc_service_singleton_for_CF_name(a1);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 0x40000000LL;
  v13[2] = __tcc_authorization_audit_token_report_use_block_invoke;
  v13[3] = &unk_189F84A78;
  v13[4] = &v15;
  v13[5] = v6;
  v13[6] = v9;
  tcc_server_message_credential_report_use(v4, v6, v9, (uint64_t)v10, v13);
  uint64_t v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __tcc_authorization_audit_token_report_use_block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_audit_token_report_use_block_invoke_cold_1();
    }
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
  }

  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

void tcc_authorization_request_change( void *a1, uint64_t a2, const __CFDictionary *a3, void (*a4)(void, void, void))
{
  uint64_t v8 = tcc_server_singleton_default();
  tcc_message_options_create();
  uint64_t v10 = v9;
  if (a3 && CFDictionaryContainsKey(a3, kTCCAccessClientDictionary))
  {
    Value = CFDictionaryGetValue(a3, kTCCAccessClientDictionary);
    tcc_message_options_set_client_dict((uint64_t)v10, Value);
  }

  __int128 v12 = (const void *)tcc_credential_singleton_for_self();
  uint64_t v13 = tcc_service_singleton_for_CF_name(a1);
  v14[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
  v14[1] = (void (*)(void, void, void))0x40000000;
  _OWORD v14[2] = (void (*)(void, void, void))__tcc_authorization_request_change_block_invoke;
  v14[3] = (void (*)(void, void, void))&unk_189F84AA0;
  v14[4] = a4;
  void v14[5] = v10;
  tcc_server_message_request_authorization_change(v8, (uint64_t)v10, v12, v13, a2, 0LL, v14);
}

uint64_t __tcc_authorization_request_change_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_request_change_block_invoke_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v4();
  return tcc_release(*(void *)(a1 + 40));
}

void tcc_authorization_set_access_with_prompt( void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = tcc_service_singleton_for_CF_name(a1);
  uint64_t v9 = tcc_server_singleton_default();
  tcc_message_options_create();
  uint64_t v11 = v10;
  tcc_message_options_set_reply_handler_policy(v10, 1);
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  uint64_t v13 = tcc_identity_create(0LL, CStringPtr);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 0x40000000LL;
  _OWORD v14[2] = __tcc_authorization_set_access_with_prompt_block_invoke;
  v14[3] = &unk_189F84AC8;
  v14[4] = a5;
  void v14[5] = v11;
  v14[6] = v13;
  tcc_server_message_prompt_authorization_value(v9, v11, (uint64_t)v13, (uint64_t)v8, 0LL, a3, v14);
}

uint64_t __tcc_authorization_set_access_with_prompt_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __tcc_authorization_set_access_with_prompt_block_invoke_cold_1();
    }
    uint64_t v4 = *(void (**)(void))(a1[4] + 16LL);
  }

  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    uint64_t v4 = *(void (**)(void))(a1[4] + 16LL);
  }

  v4();
  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

void OUTLINED_FUNCTION_0_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t tcc_authorization_cache_create(uint64_t a1)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 56) = os_log_create("com.apple.TCC", "cache");
  *(void *)(v3 + 104) = a1;
  *(_DWORD *)(v3 + 64) = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  &kTCCObjectDictionaryKeyCallBacks,  MEMORY[0x189605250]);
  *(void *)(v3 + 72) = Mutable;
  if (!Mutable)
  {
    uint64_t v24 = *(os_log_s **)(v3 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      tcc_authorization_cache_create_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_10;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  *(void *)(v3 + 80) = dispatch_queue_create_with_target_V2("com.apple.TCC.cache.state_handler", 0LL, global_queue);
  uint64_t v6 = os_state_add_handler();
  *(void *)(v3 + 88) = v6;
  if (!v6)
  {
    __int128 v7 = *(os_log_s **)(v3 + 56);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      tcc_authorization_cache_create_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  uint64_t v15 = tcc_authorization_change_monitor_create(v3);
  *(void *)(v3 + 96) = v15;
  if (!v15)
  {
    uint64_t v16 = *(os_log_s **)(v3 + 56);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      tcc_authorization_cache_create_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_10:
    tcc_release(v3);
    return 0LL;
  }

  return v3;
}

void *__tcc_authorization_cache_create_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0LL;
  }
  uint64_t v2 = tcc_authorization_cache_copy_state_dump(*(void *)(a1 + 32));
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x189604DB0], v2, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (Data)
  {
    uint64_t v5 = Data;
    unsigned int Length = CFDataGetLength(Data);
    __int128 v7 = calloc(1uLL, Length + 200LL);
    if (v7)
    {
      __strlcpy_chk();
      *(_DWORD *)__int128 v7 = 1;
      *((_DWORD *)v7 + 1) = Length;
      v9.location = 0LL;
      v9.length = Length;
      CFDataGetBytes(v5, v9, (UInt8 *)v7 + 200);
    }

    CFRelease(v3);
  }

  else
  {
    __int128 v7 = 0LL;
    uint64_t v5 = v3;
  }

  CFRelease(v5);
  return v7;
}

uint64_t tcc_authorization_cache_shared_instance()
{
  if (tcc_authorization_cache_shared_instance_init_once != -1) {
    dispatch_once(&tcc_authorization_cache_shared_instance_init_once, &__block_literal_global_0);
  }
  return tcc_authorization_cache_shared_instance_shared_instance;
}

uint64_t __tcc_authorization_cache_shared_instance_block_invoke()
{
  uint64_t result = tcc_authorization_cache_create(0LL);
  tcc_authorization_cache_shared_instance_shared_instance = result;
  if (result)
  {
    *(_DWORD *)(result + 12) = 0x7FFFFFFF;
    *(_DWORD *)(result + 8) = 0x7FFFFFFF;
  }

  return result;
}

uint64_t tcc_authorization_cache_copy_authorization(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    uint64_t v8 = CFDictionaryGetValue(Value, a3);
    uint64_t v9 = (uint64_t)v8;
    if (v8) {
      tcc_retain(v8);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (os_log_type_enabled(*(os_log_t *)(a1 + 56), OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = tcc_object_copy_description((uint64_t)a3);
    if (v9) {
      uint64_t v11 = tcc_object_copy_description(v9);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = *(os_log_s **)(a1 + 56);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315650;
      uint64_t name = tcc_service_get_name((uint64_t)a2);
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_debug_impl(&dword_186DC2000, v12, OS_LOG_TYPE_DEBUG, "GET: (%s, %@) -> %@", (uint8_t *)&v15, 0x20u);
    }

    CFRelease(v10);
    if (v11) {
      CFRelease(v11);
    }
    CFStringRef v13 = CFCopyDescription(*(CFTypeRef *)(a1 + 72));
    CFRelease(v13);
  }

  os_unfair_lock_unlock(v6);
  return v9;
}

void tcc_authorization_cache_set_authorization(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v8 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  _tcc_authorization_cache_locked_set_authorization(a1, a2, a3, a4);
  os_unfair_lock_unlock(v8);
}

void _tcc_authorization_cache_locked_set_authorization( uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v8 = tcc_credential_singleton_for_self();
  int v9 = tcc_object_equal((uint64_t)a3, v8);
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 64));
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  &kTCCObjectDictionaryKeyCallBacks,  &kTCCObjectDictionaryValueCallBacks);
  if (Mutable)
  {
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), a2, Mutable);
    CFRelease(Value);
    if (!v9)
    {
LABEL_6:
      uint64_t v12 = *(os_log_s **)(a1 + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_186DC2000, v12, OS_LOG_TYPE_INFO, "Credential is not this process", (uint8_t *)&v34, 2u);
      }

      int v13 = CFDictionaryContainsKey((CFDictionaryRef)Value, a3);
      uint64_t v14 = *(os_log_s **)(a1 + 56);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v34 = 67109120;
        LODWORD(v35) = v13 != 0;
        _os_log_impl(&dword_186DC2000, v14, OS_LOG_TYPE_INFO, "Credential is present: %d", (uint8_t *)&v34, 8u);
      }

      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)Value);
      int audit_token_cache_max_size = tcc_service_get_audit_token_cache_max_size((uint64_t)a2);
      __int16 v17 = *(os_log_s **)(a1 + 56);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v34 = 134218240;
        CFIndex v35 = Count;
        __int16 v36 = 1024;
        LODWORD(v37) = audit_token_cache_max_size;
        _os_log_impl( &dword_186DC2000,  v17,  OS_LOG_TYPE_INFO,  "Numbers of entries in cache: %ld, max: %d",  (uint8_t *)&v34,  0x12u);
      }

      if (!v13 && Count == audit_token_cache_max_size)
      {
        uint64_t v18 = (const void **)malloc(8 * Count);
        CFDictionaryGetKeysAndValues((CFDictionaryRef)Value, v18, 0LL);
        __int16 v19 = tcc_object_copy_description((uint64_t)a3);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)Value, *v18);
        uint64_t v20 = *(os_log_s **)(a1 + 56);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t name = tcc_service_get_name((uint64_t)a2);
          int v34 = 136315394;
          CFIndex v35 = name;
          __int16 v36 = 2112;
          uint64_t v37 = v19;
          _os_log_impl(&dword_186DC2000, v20, OS_LOG_TYPE_INFO, "REMOVE: (%s, %@)", (uint8_t *)&v34, 0x16u);
        }

        free(v18);
        CFRelease(v19);
      }
    }

void tcc_authorization_cache_handle_authorization_changed_for_service(uint64_t a1, const void *a2)
{
  *(void *)((char *)&v36[1] + 4) = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    uint64_t v6 = Value;
    os_unfair_lock_t lock = v4;
    CFIndex Count = CFDictionaryGetCount(Value);
    uint64_t v8 = (const void **)malloc(8 * Count);
    uint64_t v24 = (const void **)malloc(8 * Count);
    uint64_t v25 = v8;
    CFDictionaryGetKeysAndValues(v6, v8, v24);
    if (Count >= 1)
    {
      uint64_t v9 = MEMORY[0x1895F87A8];
      uint64_t v10 = (uint64_t *)v24;
      do
      {
        uint64_t v11 = *v8;
        uint64_t v12 = *v10;
        bos_unfair_lock_t lock = v9;
        p_bos_unfair_lock_t lock = 0x40000000LL;
        uint64_t v28 = (uint64_t)___tcc_authorization_cache_lazy_init_server_block_invoke;
        uint64_t v29 = &__block_descriptor_tmp_9;
        uint64_t v30 = a1;
        if (_tcc_authorization_cache_lazy_init_server_init_once != -1) {
          dispatch_once(&_tcc_authorization_cache_lazy_init_server_init_once, &block);
        }
        if (*(void *)(a1 + 104))
        {
          tcc_message_options_create();
          uint64_t v14 = v13;
          tcc_message_options_set_request_prompt_policy(v13, 2LL);
          tcc_message_options_set_request_usage_string_policy(v14, 2LL);
          tcc_message_options_set_reply_handler_policy(v14, 1);
          tcc_message_options_set_cache_policy(v14, 1);
          bos_unfair_lock_t lock = 0LL;
          p_bos_unfair_lock_t lock = (uint64_t)&block;
          uint64_t v28 = 0x2000000000LL;
          uint64_t v29 = 0LL;
          uint64_t v15 = *(void *)(a1 + 104);
          *(void *)buf = v9;
          *(void *)&buf[8] = 0x40000000LL;
          *(void *)&uint8_t buf[16] = ___tcc_authorization_cache_copy_current_authorization_block_invoke;
          uint64_t v32 = &unk_189F84B50;
          uint64_t v33 = &block;
          uint64_t v34 = a1;
          tcc_server_message_request_authorization( v15,  v14,  v11,  a2,  0LL,  (void (**)(void, void, void))buf);
          tcc_release(v14);
          uint64_t v16 = *(const void **)(p_block + 24);
          _Block_object_dispose(&block, 8);
          if (v16)
          {
            if (!tcc_object_equal((uint64_t)v16, v12))
            {
              __int16 v17 = a2;
              uint64_t v18 = tcc_object_copy_description(v12);
              __int16 v19 = tcc_object_copy_description((uint64_t)v16);
              uint64_t v20 = *(os_log_s **)(a1 + 56);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v19;
                _os_log_impl( &dword_186DC2000,  v20,  OS_LOG_TYPE_DEFAULT,  "UPDATE:\n%{public}@ ->\n%{public}@",  buf,  0x16u);
              }

              CFRelease(v18);
              CFRelease(v19);
              a2 = v17;
              _tcc_authorization_cache_locked_set_authorization(a1, v17, v11, v16);
              uint64_t v9 = MEMORY[0x1895F87A8];
            }

            tcc_release(v16);
          }
        }

        else
        {
          uint64_t v21 = *(os_log_s **)(a1 + 56);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            tcc_authorization_cache_handle_authorization_changed_for_service_cold_2(v35, v36, v21);
          }
        }

        ++v10;
        ++v8;
        --Count;
      }

      while (Count);
    }

    free(v25);
    free(v24);
    uint64_t v4 = lock;
  }

  else
  {
    uint64_t v22 = *(os_log_s **)(a1 + 56);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      tcc_authorization_cache_handle_authorization_changed_for_service_cold_1((uint64_t)a2, v22);
    }
  }

  os_unfair_lock_unlock(v4);
}

__CFDictionary *tcc_authorization_cache_copy_state_dump(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  theDict = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (theDict)
  {
    uint64_t v22 = v2;
    CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 72));
    uint64_t v4 = (const void **)malloc(8 * Count);
    uint64_t v24 = (const void **)malloc(8 * Count);
    uint64_t v25 = v4;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), v4, v24);
    CFIndex v23 = Count;
    if (Count >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (!Mutable) {
          break;
        }
        __int128 v7 = Mutable;
        uint64_t v8 = (uint64_t)v25[v5];
        uint64_t v9 = (const __CFDictionary *)v24[v5];
        CFIndex v10 = CFDictionaryGetCount(v9);
        uint64_t v11 = (const void **)malloc(8 * v10);
        uint64_t v12 = (const void **)malloc(8 * v10);
        CFDictionaryGetKeysAndValues(v9, v11, v12);
        if (v10 >= 1)
        {
          uint64_t v13 = (uint64_t *)v11;
          uint64_t v14 = (uint64_t *)v12;
          do
          {
            uint64_t v16 = *v13++;
            uint64_t v15 = v16;
            uint64_t v17 = *v14++;
            uint64_t v18 = tcc_object_copy_description(v15);
            __int16 v19 = tcc_object_copy_description(v17);
            CFDictionarySetValue(v7, v18, v19);
            CFRelease(v18);
            CFRelease(v19);
            --v10;
          }

          while (v10);
        }

        free(v11);
        free(v12);
        CF_uint64_t name = (const void *)tcc_service_get_CF_name(v8);
        CFDictionarySetValue(theDict, CF_name, v7);
        CFRelease(v7);
        ++v5;
      }

      while (v5 != v23);
    }

    free(v25);
    free(v24);
    uint64_t v2 = v22;
  }

  os_unfair_lock_unlock(v2);
  return theDict;
}

void tcc_authorization_cache_handle_authorization_changed_for_service_clear(uint64_t a1, const void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  uint64_t v6 = *(os_log_s **)(a1 + 56);
  if (Value)
  {
    __int128 v7 = Value;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      uint64_t name = tcc_service_get_name((uint64_t)a2);
      _os_log_impl(&dword_186DC2000, v6, OS_LOG_TYPE_DEFAULT, "CLEAR:\n%{public}s", (uint8_t *)&v8, 0xCu);
    }

    CFDictionaryRemoveAllValues(v7);
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    tcc_authorization_cache_handle_authorization_changed_for_service_clear_cold_1((uint64_t)a2, v6);
  }

  os_unfair_lock_unlock(v4);
}

void tcc_authorization_cache_dispose(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 80);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)(a1 + 88)) {
    os_state_remove_handler();
  }
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3) {
    tcc_release(v3);
  }
  uint64_t v4 = *(const __CFDictionary **)(a1 + 72);
  if (v4)
  {
    CFIndex Count = CFDictionaryGetCount(v4);
    uint64_t v6 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), 0LL, v6);
    if (Count >= 1)
    {
      __int128 v7 = (__CFDictionary **)v6;
      do
      {
        int v8 = *v7++;
        CFDictionaryRemoveAllValues(v8);
        --Count;
      }

      while (Count);
    }

    free(v6);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
  }

CFStringRef tcc_authorization_cache_copy_description(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  CFStringRef v3 = CFCopyDescription(*(CFTypeRef *)(a1 + 72));
  os_unfair_lock_unlock(v2);
  return v3;
}

void ___tcc_authorization_cache_copy_current_authorization_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = tcc_retain(a2);
  }

  else
  {
    uint64_t v4 = *(os_log_s **)(*(void *)(a1 + 40) + 56LL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___tcc_authorization_cache_copy_current_authorization_block_invoke_cold_1(a3, v4, v5);
    }
  }

void *___tcc_authorization_cache_lazy_init_server_block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 104))
  {
    uint64_t result = tcc_server_create(0LL);
    *(void *)(v1 + 104) = result;
  }

  return result;
}

uint64_t tcc_attributed_entity_create(int a1, const char *a2)
{
  uint64_t v5 = v4;
  *(_DWORD *)(v4 + 56) = a1;
  *(void *)(v4 + 64) = strdup(a2);
  return v5;
}

uint64_t tcc_attributed_entity_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t tcc_attributed_entity_get_path(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) > 1u) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 64);
  }
}

void tcc_attributed_entity_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) <= 1u) {
    free(*(void **)(a1 + 64));
  }
}

void tcc_attributed_entity_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  int v4 = *(_DWORD *)(a1 + 56);
  if (v4)
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = "TCCD_MSG_ATTRIBUTED_ENTITY_EXECUTABLE_PATH_KEY";
  }

  else
  {
    uint64_t v5 = "TCCD_MSG_ATTRIBUTED_ENTITY_APPLICATION_PATH_KEY";
  }

  xpc_dictionary_set_string(xdict, v5, *(const char **)(a1 + 64));
}

__CFString *tcc_attributed_entity_copy_description(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0LL, 0LL);
  CFStringRef v3 = Mutable;
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  else {
    CFStringAppendFormat(Mutable, 0LL, @"%s(%u)", *(void *)(a1 + 64), v4);
  }
  return v3;
}

size_t tcc_attributed_entity_hash(uint64_t a1)
{
  size_t v1 = *(unsigned int *)(a1 + 56);
  if (v1 <= 1)
  {
    no_copy = (void *)xpc_string_create_no_copy();
    size_t v1 = xpc_hash(no_copy) - v1 + 32 * v1;
    xpc_release(no_copy);
  }

  return v1;
}

BOOL tcc_attributed_entity_equal(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 56);
  return v2 == *(_DWORD *)(a2 + 56) && (v2 > 1 || !strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64)));
}

uint64_t tcc_credential_singleton_for_self()
{
  if (tcc_credential_singleton_for_self_onceToken != -1) {
    dispatch_once(&tcc_credential_singleton_for_self_onceToken, &__block_literal_global_1);
  }
  return tcc_credential_singleton_for_self_cred_for_this_process;
}

void __tcc_credential_singleton_for_self_block_invoke()
{
  tcc_credential_singleton_for_self_cred_for_this_process = v0;
  if (v0)
  {
    *(void *)(v0 + 56) = 0LL;
    *(_DWORD *)(v0 + 12) = 0x7FFFFFFF;
    *(_DWORD *)(v0 + 8) = 0x7FFFFFFF;
  }

uint64_t tcc_credential_create_for_self_with_assumed_identity(uint64_t a1)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 56) = 0LL;
  *(void *)(v2 + 96) = tcc_retain(a1);
  return v3;
}

__n128 tcc_credential_create_for_process_with_audit_token(uint64_t a1)
{
  result.n128_u64[0] = tcc_credential_alloc(104LL, (uint64_t)&credential_object_ops).n128_u64[0];
  if (v2)
  {
    *(void *)(v2 + 56) = 1LL;
    __n128 result = *(__n128 *)a1;
    __int128 v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v2 + 64) = *(_OWORD *)a1;
    *(_OWORD *)(v2 + 80) = v4;
  }

  return result;
}

uint64_t tcc_credential_create_for_process_with_audit_token_and_assumed_identity(__int128 *a1, uint64_t a2)
{
  __int128 v6 = *a1;
  __int128 v7 = a1[1];
  tcc_credential_alloc(104LL, (uint64_t)&credential_object_ops);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 56) = 1LL;
    *(_OWORD *)(v3 + 64) = v6;
    *(_OWORD *)(v3 + 80) = v7;
  }

  *(void *)(v3 + 96) = tcc_retain(a2);
  return v4;
}

uint64_t tcc_credential_create_data_from_process_with_audit_token()
{
  xpc_object_t v0 = xpc_null_create();
  tcc_credential_alloc(104LL, (uint64_t)&credential_object_ops);
  uint64_t v2 = v1;
  if (v1)
  {
    *(void *)(v1 + 56) = 2LL;
    *(void *)(v1 + 64) = xpc_retain(v0);
  }

  xpc_release(v0);
  return v2;
}

uint64_t tcc_credential_create_for_file_provider_domain_identifier(const char *a1)
{
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 56) = 3LL;
    *(void *)(v2 + 64) = strdup(a1);
  }

  return v3;
}

uint64_t tcc_credential_dispose(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 3)
  {
    free(*(void **)(a1 + 64));
  }

  else if (v2 == 2)
  {
    xpc_release(*(xpc_object_t *)(a1 + 64));
  }

  uint64_t result = *(void *)(a1 + 96);
  if (result) {
    return tcc_release(result);
  }
  return result;
}

void tcc_credential_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v4 = *(void *)(a1 + 56);
  switch(v4)
  {
    case 3LL:
      xpc_dictionary_set_string( xdict,  "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_FILE_PROVIDER_DOMAIN_ID_KEY",  *(const char **)(a1 + 64));
      break;
    case 2LL:
      xpc_dictionary_set_value(xdict, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_DATA_KEY", *(xpc_object_t *)(a1 + 64));
      break;
    case 1LL:
      xpc_dictionary_set_data( xdict,  "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY",  (const void *)(a1 + 64),  0x20uLL);
      break;
  }

  if (*(void *)(a1 + 96))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    tcc_object_encode_to_dictionary(*(void *)(a1 + 96));
    xpc_dictionary_set_value(xdict, "TCCD_MSG_CREDENTIAL_ASSUMED_IDENTITY", v5);
    xpc_release(v5);
  }

__CFString *tcc_credential_copy_description(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  CFMutableDictionaryRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  uint64_t v3 = Mutable;
  unint64_t v4 = *(void *)(a1 + 56) - 1LL;
  if (v4 > 2) {
    xpc_object_t v5 = "Requestor";
  }
  else {
    xpc_object_t v5 = off_189F84BD0[v4];
  }
  CFStringAppendFormat(Mutable, 0LL, @"<Credential (%p) | %s", a1, v5);
  if (*(void *)(a1 + 56) == 1LL)
  {
    snprintf(__str, 0x20uLL, "%d.%d/%d", *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 92), *(_DWORD *)(a1 + 68));
    CFStringAppendFormat(v3, 0LL, @", %s", __str);
  }

  CFStringAppend(v3, @">");
  return v3;
}

uint64_t tcc_credential_hash(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 3uLL:
      no_copy = (void *)xpc_string_create_no_copy();
      size_t v2 = xpc_hash(no_copy) + 93;
      xpc_release(no_copy);
      break;
    case 2uLL:
      size_t v2 = xpc_hash(*(xpc_object_t *)(a1 + 64)) + 62;
      break;
    case 1uLL:
      uint64_t v3 = 0LL;
      uint64_t v4 = 0LL;
      __int128 v5 = *(_OWORD *)(a1 + 80);
      v9[0] = *(_OWORD *)(a1 + 64);
      v9[1] = v5;
      do
      {
        uint64_t v4 = *(unsigned int *)((char *)v9 + v3) - v4 + 32 * v4;
        v3 += 4LL;
      }

      while (v3 != 32);
      size_t v2 = v4 + 31;
      break;
  }

  uint64_t v7 = *(void *)(a1 + 96);
  if (v7) {
    return tcc_object_hash(v7) - v2 + 32 * v2;
  }
  return v2;
}

BOOL tcc_credential_equal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == *(void *)(a2 + 56))
  {
    switch(v4)
    {
      case 0LL:
        BOOL result = 1LL;
        break;
      case 1LL:
        __int128 v16 = *(_OWORD *)(a1 + 64);
        __int128 v17 = *(_OWORD *)(a1 + 80);
        __int128 v6 = *(_OWORD *)(a2 + 80);
        __int128 v15 = *(_OWORD *)(a2 + 64);
        BOOL v9 = (void)v16 == (void)v15
          && *((void *)&v16 + 1) == *((void *)&v15 + 1)
          && (void)v17 == (void)v6
          && *((void *)&v17 + 1) == *((void *)&v6 + 1);
        goto LABEL_18;
      case 2LL:
        size_t length = xpc_data_get_length(*(xpc_object_t *)(a1 + 64));
        if (length != xpc_data_get_length(*(xpc_object_t *)(a2 + 64))) {
          goto LABEL_15;
        }
        bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 64));
        uint64_t v12 = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a2 + 64));
        int v13 = memcmp(bytes_ptr, v12, length);
        goto LABEL_17;
      case 3LL:
        int v13 = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64));
LABEL_17:
        BOOL v9 = v13 == 0;
LABEL_18:
        BOOL result = v9;
        break;
      default:
        goto LABEL_15;
    }
  }

  else
  {
LABEL_15:
    BOOL result = 0LL;
  }

  uint64_t v14 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96))
  {
    if (v14) {
      return tcc_identity_type_and_identifiers_are_equal(*(void *)(a1 + 96), v14);
    }
  }

  else if (!v14)
  {
    return result;
  }

  return 0LL;
}

uint64_t tcc_events_filter_singleton_for_check_in()
{
  if (tcc_events_filter_singleton_for_check_in_init_once != -1) {
    dispatch_once(&tcc_events_filter_singleton_for_check_in_init_once, &__block_literal_global_2);
  }
  return tcc_events_filter_singleton_for_check_in_events_filter_for_check_in;
}

void __tcc_events_filter_singleton_for_check_in_block_invoke()
{
  tcc_events_filter_singleton_for_check_in_events_filter_for_check_in = v0;
  *(_BYTE *)(v0 + 56) = 0;
  *(_DWORD *)(v0 + 12) = 0x7FFFFFFF;
  *(_DWORD *)(v0 + 8) = 0x7FFFFFFF;
}

uint64_t tcc_events_filter_create_with_criteria(void *a1)
{
  uint64_t v3 = v2;
  *(_BYTE *)(v2 + 56) = 1;
  xpc_object_t v4 = xpc_copy(a1);
  *(void *)(v3 + 64) = v4;
  if (!v4)
  {
    tcc_release(v3);
    return 0LL;
  }

  return v3;
}

void tcc_events_subscribe(const char *a1, uint64_t a2, dispatch_object_s *a3, const void *a4)
{
  values[1] = *(xpc_object_t *)MEMORY[0x1895F89C0];
  _tcc_events_initialize();
  tcc_events_subscription_alloc(88LL, (uint64_t)&events_subscription_object_ops);
  BOOL v9 = v8;
  v8[7] = strdup(a1);
  if (a2)
  {
    tcc_retain(a2);
  }

  else
  {
    *(void *)uint64_t v21 = "kTCCServiceAll";
    values[0] = xpc_BOOL_create(1);
    xpc_object_t v10 = xpc_dictionary_create((const char *const *)v21, values, 1uLL);
    a2 = tcc_events_filter_create_with_criteria(v10);
    xpc_release(v10);
  }

  v9[8] = a2;
  v9[9] = a3;
  dispatch_retain(a3);
  v9[10] = _Block_copy(a4);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C6ABCD0);
  uint64_t pointer = xpc_dictionary_get_pointer();
  if (pointer)
  {
    uint64_t v12 = pointer;
    int v13 = (os_log_s *)qword_18C6ABCC8;
    if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_DEBUG)) {
      tcc_events_subscribe_cold_1((uint64_t)(v9 + 7), v13, v14, v15, v16, v17, v18, v19);
    }
    tcc_release(v12);
  }

  xpc_dictionary_set_pointer();
  if (*(_BYTE *)(v9[8] + 56LL) == 1) {
    xpc_set_event();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C6ABCD0);
  uint64_t v20 = (os_log_s *)qword_18C6ABCC8;
  if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136446210;
    *(void *)&v21[4] = a1;
    _os_log_impl(&dword_186DC2000, v20, OS_LOG_TYPE_INFO, "%{public}s subscribed", v21, 0xCu);
  }

void _tcc_events_initialize()
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___tcc_events_initialize_block_invoke;
  block[3] = &__block_descriptor_tmp_7_0;
  block[4] = &_tcc_events_global_state;
  if (_tcc_events_global_state != -1) {
    dispatch_once(&_tcc_events_global_state, block);
  }
}

void tcc_events_unsubscribe(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _tcc_events_initialize();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C6ABCD0);
  uint64_t pointer = xpc_dictionary_get_pointer();
  if (pointer)
  {
    uint64_t v3 = pointer;
    xpc_dictionary_set_pointer();
    tcc_release(v3);
    xpc_set_event();
  }

  else if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR))
  {
    tcc_events_unsubscribe_cold_1();
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C6ABCD0);
  xpc_object_t v4 = (os_log_s *)qword_18C6ABCC8;
  if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446210;
    uint64_t v6 = a1;
    _os_log_impl(&dword_186DC2000, v4, OS_LOG_TYPE_INFO, "%{public}s unsubscribed", (uint8_t *)&v5, 0xCu);
  }

void tcc_events_filter_dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  if (v1) {
    xpc_release(v1);
  }
}

void ___tcc_events_initialize_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8LL) = os_log_create("com.apple.TCC", "events");
  *(_DWORD *)(*(void *)(a1 + 32) + 16LL) = 0;
  *(void *)(*(void *)(a1 + 32) + 24LL) = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_set_event_stream_handler("com.apple.tccd.events", 0LL, &__block_literal_global_6);
}

void ___tcc_events_initialize_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (const _xpc_type_s *)MEMORY[0x186E48A8C](a2);
  xpc_object_t v4 = (void *)MEMORY[0x186E48978](a2);
  if (v3 != (const _xpc_type_s *)MEMORY[0x1895F9268])
  {
    int v5 = (os_log_s *)qword_18C6ABCC8;
    if (v3 != (const _xpc_type_s *)MEMORY[0x1895F9250])
    {
      if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
        ___tcc_events_initialize_block_invoke_2_cold_10(v3, (uint64_t)v4, v5);
      }
      goto LABEL_46;
    }

    if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_DEBUG)) {
      ___tcc_events_initialize_block_invoke_2_cold_9();
    }
    if (xpc_dictionary_get_uint64(a2, "event_type"))
    {
      if (xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91D0]))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_18C6ABCD0);
        uint64_t pointer = xpc_dictionary_get_pointer();
        if (!pointer)
        {
          if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
            ___tcc_events_initialize_block_invoke_2_cold_4();
          }
          goto LABEL_45;
        }

        uint64_t v8 = pointer;
        os_unfair_lock_assert_owner((os_unfair_lock_t)&unk_18C6ABCD0);
        if (!*(void *)(v8 + 72)) {
          tcc_authorization_changed_for_service_notification_name_cold_1();
        }
        if (!*(void *)(v8 + 80)) {
          tcc_authorization_changed_for_service_notification_name_cold_1();
        }
        uint64_t int64 = xpc_dictionary_get_uint64(a2, "event_type");
        tcc_authorization_record_create();
        uint64_t v11 = v10;
        string = xpc_dictionary_get_string(a2, "service");
        if (string) {
          int v13 = tcc_service_singleton_for_name(string);
        }
        else {
          int v13 = 0LL;
        }
        uint64_t v17 = xpc_dictionary_get_uint64(a2, "TCCD_MSG_IDENTITY_TYPE_KEY");
        uint64_t v18 = xpc_dictionary_get_string(a2, "TCCD_MSG_IDENTITY_ID_KEY");
        if (v18) {
          uint64_t v19 = tcc_identity_create(v17, v18);
        }
        else {
          uint64_t v19 = 0LL;
        }
        uint64_t v20 = xpc_dictionary_get_uint64(a2, "auth_value");
        if (v11 && v13 && v19)
        {
          uint64_t v21 = v20;
          tcc_authorization_record_set_service(v11, (uint64_t)v13);
          tcc_authorization_record_set_subject_identity(v11, (uint64_t)v19);
          tcc_authorization_record_set_authorization_value(v11, v21);
        }

        else
        {
          uint64_t v22 = (void *)MEMORY[0x186E48978](a2);
          if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
            ___tcc_events_initialize_block_invoke_2_cold_8();
          }
          free(v22);
          if (v11) {
            tcc_release(v11);
          }
          if (!v19) {
            goto LABEL_42;
          }
          uint64_t v11 = 0LL;
        }

        tcc_release(v19);
        if (uint64 && v11)
        {
          tcc_retain(v8);
          CFIndex v23 = *(dispatch_queue_s **)(v8 + 72);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = ___tcc_events_handle_event_for_subscription_block_invoke;
          block[3] = &__block_descriptor_tmp_9_0;
          block[4] = v8;
          void block[5] = uint64;
          void block[6] = v11;
          dispatch_async(v23, block);
LABEL_45:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C6ABCD0);
          goto LABEL_46;
        }

LABEL_42:
        uint64_t v24 = (void *)MEMORY[0x186E48978](a2);
        if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
          ___tcc_events_initialize_block_invoke_2_cold_7();
        }
        free(v24);
        goto LABEL_45;
      }

      uint64_t v16 = (void *)MEMORY[0x186E48978](a2);
      if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
        ___tcc_events_initialize_block_invoke_2_cold_3();
      }
    }

    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        uint64_t v15 = reply;
        xpc_dictionary_send_reply();
        xpc_release(v15);
        goto LABEL_46;
      }

      uint64_t v16 = (void *)MEMORY[0x186E48978](a2);
      if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
        ___tcc_events_initialize_block_invoke_2_cold_2();
      }
    }

    free(v16);
    goto LABEL_46;
  }

  uint64_t v6 = (os_log_s *)qword_18C6ABCC8;
  if (os_log_type_enabled((os_log_t)qword_18C6ABCC8, OS_LOG_TYPE_ERROR)) {
    ___tcc_events_initialize_block_invoke_2_cold_1(a2, v6);
  }
LABEL_46:
  free(v4);
}

uint64_t ___tcc_events_handle_event_for_subscription_block_invoke(uint64_t a1)
{
  return tcc_release(*(void *)(a1 + 48));
}

void tcc_events_subscription_dispose(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2) {
    free(v2);
  }
  uint64_t v3 = a1[8];
  if (v3) {
    tcc_release(v3);
  }
  xpc_object_t v4 = (dispatch_object_s *)a1[9];
  if (v4) {
    dispatch_release(v4);
  }
  int v5 = (const void *)a1[10];
  if (v5) {
    _Block_release(v5);
  }
}

  ;
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

const char *TCCAuthGetReasonDescription(uint64_t a1)
{
  BOOL result = "None";
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      BOOL result = "Recorded";
      break;
    case 2LL:
      BOOL result = "Service Default";
      break;
    case 3LL:
      BOOL result = "Service Policy";
      break;
    case 4LL:
      BOOL result = "Compatibility Policy";
      break;
    case 5LL:
      BOOL result = "Override Policy";
      break;
    case 6LL:
      BOOL result = "Set";
      break;
    default:
      switch(a1)
      {
        case 1000LL:
          BOOL result = "Error";
          break;
        case 1001LL:
          BOOL result = "Service Override";
          break;
        case 1002LL:
          BOOL result = "Missing Usage String";
          break;
        case 1003LL:
          BOOL result = "Prompt Timeout";
          break;
        case 1004LL:
          BOOL result = "Preflight Unknown";
          break;
        default:
          if (a1 == 2000) {
            BOOL result = "Entitled";
          }
          else {
            BOOL result = "<Unknown Reason>";
          }
          break;
      }

      break;
  }

  return result;
}

char *TCCAuthCopyDescription(uint64_t a1)
{
  uint64_t v2 = 0LL;
  if ((a1 & 0x100000000000000LL) != 0)
  {
    if ((a1 & 0x200000000000000LL) != 0)
    {
      asprintf(&v2, "Auth:{Access:Unknown}");
    }

    else
    {
      TCCAuthGetReasonDescription(WORD2(a1));
      asprintf(&v2, "{Access:%s, reason:%s}");
    }
  }

  else
  {
    asprintf(&v2, "Auth:{Invalid}");
  }

  return v2;
}

const void *tcc_service_singleton_for_CF_name(void *key)
{
  if (_tcc_service_singleton_for_platform_onceToken != -1) {
    dispatch_once(&_tcc_service_singleton_for_platform_onceToken, &__block_literal_global_3);
  }
  return CFDictionaryGetValue((CFDictionaryRef)platform_services, key);
}

const char *tcc_service_singleton_for_name(const char *cStr)
{
  if (cStr)
  {
    uint64_t v1 = (__CFString *)CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    uint64_t v2 = tcc_service_singleton_for_CF_name(v1);
    CFRelease(v1);
    return (const char *)v2;
  }

  return cStr;
}

uint64_t tcc_service_get_CF_name(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t tcc_service_get_name(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tcc_service_get_authorization_value_type(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tcc_service_get_authorization_rights_mask(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

unint64_t tcc_service_get_authorization_prompt_rights_mask(uint64_t a1)
{
  return *(void *)(a1 + 80) & 0xFFFFFFFFFFFFFFFDLL;
}

uint64_t tcc_service_get_is_system_service(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 96);
}

uint64_t tcc_service_get_message_queue(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v2 = (dispatch_once_t *)(a1 + 104);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __tcc_service_get_message_queue_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  if (v3 != -1) {
    dispatch_once(v2, block);
  }
  return *(void *)(a1 + 112);
}

dispatch_queue_t __tcc_service_get_message_queue_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v10 = xmmword_186DD6870;
  __int128 v11 = unk_186DD6880;
  __int128 v8 = xmmword_186DD6850;
  __int128 v9 = unk_186DD6860;
  __int128 v14 = xmmword_186DD68B0;
  __int128 v15 = unk_186DD68C0;
  __int128 v12 = xmmword_186DD6890;
  __int128 v13 = unk_186DD68A0;
  __int128 v18 = xmmword_186DD68F0;
  __int128 v19 = unk_186DD6900;
  __int128 v16 = xmmword_186DD68D0;
  __int128 v17 = unk_186DD68E0;
  strcpy(v3, "com.apple.tcc.auth.");
  int v4 = 0;
  uint64_t v5 = 0LL;
  __int128 v6 = xmmword_186DD6830;
  __int128 v7 = unk_186DD6840;
  __strlcat_chk();
  dispatch_queue_t result = dispatch_queue_create(v3, 0LL);
  *(void *)(*(void *)(a1 + 32) + 112LL) = result;
  return result;
}

uint64_t tcc_service_get_message_preflight_queue(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 120);
  uint64_t v2 = (dispatch_once_t *)(a1 + 120);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __tcc_service_get_message_preflight_queue_block_invoke;
  block[3] = &__block_descriptor_tmp_2_0;
  block[4] = a1;
  if (v3 != -1) {
    dispatch_once(v2, block);
  }
  return *(void *)(a1 + 128);
}

dispatch_queue_t __tcc_service_get_message_preflight_queue_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v8 = xmmword_186DD6970;
  __int128 v9 = unk_186DD6980;
  __int128 v6 = xmmword_186DD6950;
  __int128 v7 = unk_186DD6960;
  __int128 v12 = xmmword_186DD69B0;
  __int128 v13 = unk_186DD69C0;
  __int128 v10 = xmmword_186DD6990;
  __int128 v11 = unk_186DD69A0;
  __int128 v16 = xmmword_186DD69F0;
  __int128 v17 = unk_186DD6A00;
  __int128 v14 = xmmword_186DD69D0;
  __int128 v15 = unk_186DD69E0;
  strcpy((char *)v3, "com.apple.tcc.auth.preflight.");
  v3[15] = 0;
  __int128 v4 = xmmword_186DD6930;
  __int128 v5 = unk_186DD6940;
  __strlcat_chk();
  dispatch_queue_t result = dispatch_queue_create((const char *)v3, 0LL);
  *(void *)(*(void *)(a1 + 32) + 128LL) = result;
  return result;
}

uint64_t tcc_service_get_audit_token_cache_max_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 100);
}

uint64_t ___tcc_service_singleton_for_platform_block_invoke()
{
  platform_services = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189604E40], 0LL);
  _tcc_add_service_for_platform(kTCCServiceAll);
  _tcc_add_service_for_platform(kTCCServiceAddressBook);
  _tcc_add_service_for_platform(kTCCServiceContactsLimited);
  _tcc_add_service_for_platform(kTCCServiceContactsFull);
  _tcc_add_service_for_platform(kTCCServiceCalendar);
  _tcc_add_service_for_platform(kTCCServiceReminders);
  _tcc_add_service_for_platform(kTCCServiceTwitter);
  _tcc_add_service_for_platform(kTCCServiceFacebook);
  _tcc_add_service_for_platform(kTCCServiceSinaWeibo);
  _tcc_add_service_for_platform(kTCCServiceLiverpool);
  _tcc_add_service_for_platform(kTCCServiceUbiquity);
  _tcc_add_service_for_platform(kTCCServiceTencentWeibo);
  _tcc_add_service_for_platform(kTCCServiceShareKit);
  *(void *)(_tcc_add_service_for_platform(kTCCServicePhotos) + 80) = 15LL;
  _tcc_add_service_for_platform(kTCCServicePhotosAdd);
  _tcc_add_service_for_platform(kTCCServiceMicrophone);
  _tcc_add_service_for_platform(kTCCServiceCamera);
  _tcc_add_service_for_platform(kTCCServiceWillow);
  _tcc_add_service_for_platform(kTCCServiceMediaLibrary);
  _tcc_add_service_for_platform(kTCCServiceSiri);
  _tcc_add_service_for_platform(kTCCServiceMotion);
  _tcc_add_service_for_platform(kTCCServiceSpeechRecognition);
  _tcc_add_service_for_platform(kTCCServiceUserTracking);
  _tcc_add_service_for_platform(kTCCServiceBluetoothAlways);
  _tcc_add_service_for_platform(kTCCServiceWebKitIntelligentTrackingPrevention);
  _tcc_add_service_for_platform(kTCCServicePrototype3Rights);
  *(void *)(_tcc_add_service_for_platform(kTCCServicePrototype4Rights) + 80) = 15LL;
  _tcc_add_service_for_platform(kTCCServiceGameCenterFriends);
  _tcc_add_service_for_platform(kTCCServiceVoiceBanking);
  _tcc_add_service_for_platform(kTCCServiceBluetoothPeripheral);
  _tcc_add_service_for_platform(kTCCServiceBluetoothWhileInUse);
  _tcc_add_service_for_platform(kTCCServiceKeyboardNetwork);
  _tcc_add_service_for_platform(kTCCServiceMSO);
  _tcc_add_service_for_platform(kTCCServiceCalls);
  _tcc_add_service_for_platform(kTCCServiceFaceID);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMotion);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchMotion);
  _tcc_add_service_for_platform(kTCCServiceSensorKitLocationMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitAmbientLightSensor);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchAmbientLightSensor);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchHeartRate);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchOnWristState);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWristTemperature);
  _tcc_add_service_for_platform(kTCCServiceSensorKitKeyboardMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchPedometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitPedometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchFallStats);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchForegroundAppCategory);
  _tcc_add_service_for_platform(kTCCServiceSensorKitForegroundAppCategory);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchSpeechMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitSpeechMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMotionHeartRate);
  _tcc_add_service_for_platform(kTCCServiceSensorKitOdometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitElevation);
  _tcc_add_service_for_platform(kTCCServiceSensorKitStrideCalibration);
  _tcc_add_service_for_platform(kTCCServiceSensorKitDeviceUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitPhoneUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMessageUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitFacialMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitHistoricalMobilityMetrics);
  return _tcc_add_service_for_platform(kTCCServiceSensorKitHistoricalCardioMetrics);
}

uint64_t _tcc_add_service_for_platform(const __CFString *a1)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 56) = CFRetain(a1);
  *(void *)(v3 + 64) = stringCopyUTF8String(a1);
  *(_OWORD *)(v3 + 72) = xmmword_186DD6800;
  *(_BYTE *)(v3 + 96) = 0;
  *(_DWORD *)(v3 + 100) = -1;
  *(void *)(v3 + 104) = 0LL;
  *(void *)(v3 + 120) = 0LL;
  CFDictionaryAddValue((CFMutableDictionaryRef)platform_services, a1, (const void *)v3);
  return v3;
}

void tcc_service_dispose(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 112);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(dispatch_object_s **)(a1 + 128);
  if (v3) {
    dispatch_release(v3);
  }
}

void tcc_service_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
}

__CFString *tcc_service_copy_description(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0LL, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"%@", *(void *)(a1 + 56));
  return Mutable;
}

uint64_t tcc_server_convert_xpc_object_to_record(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  tcc_authorization_record_create();
  uint64_t v9 = v8;
  if (!v8) {
    return v9;
  }
  if (a2)
  {
    __int128 v10 = a2;
  }

  else
  {
    if (!xpc_dictionary_get_value(a1, "service")) {
      goto LABEL_7;
    }
    string = xpc_dictionary_get_string(a1, "service");
    __int128 v10 = tcc_service_singleton_for_name(string);
    uint64_t v8 = v9;
  }

  tcc_authorization_record_set_service(v8, (uint64_t)v10);
LABEL_7:
  if (!xpc_dictionary_get_value(a1, "auth_value"))
  {
    _tcc_util_create_CFError_with_user_info(2LL, @"missing 'auth_value' in reply message");
    goto LABEL_33;
  }

  uint64_t int64 = xpc_dictionary_get_uint64(a1, "auth_value");
  if (xpc_dictionary_get_value(a1, "auth_reason")) {
    uint64_t v13 = xpc_dictionary_get_uint64(a1, "auth_reason");
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = xpc_dictionary_get_uint64(a1, "auth_version");
  char v15 = xpc_dictionary_get_BOOL(a1, "has_prompted_for_allow");
  tcc_authorization_record_set_authorization_value(v9, uint64);
  tcc_authorization_record_set_authorization_reason(v9, v13);
  tcc_authorization_record_set_version(v9, v14);
  tcc_authorization_record_set_has_prompted_for_allow(v9, v15);
  if (xpc_dictionary_get_value(a1, "session_pid"))
  {
    int v16 = xpc_dictionary_get_uint64(a1, "session_pid");
    tcc_authorization_record_set_session_pid(v9, v16);
  }

  if (xpc_dictionary_get_value(a1, "session_pid_version"))
  {
    uint64_t v17 = xpc_dictionary_get_uint64(a1, "session_pid_version");
    tcc_authorization_record_set_session_pid_version(v9, v17);
  }

  uint64_t v18 = (char *)xpc_dictionary_get_string(a1, "session_boot_UUID");
  if (v18) {
    tcc_authorization_record_set_bootUUID(v9, v18);
  }
  char v19 = xpc_dictionary_get_BOOL(a1, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
  tcc_authorization_record_set_allow_standard_user_to_set_system_service(v9, v19);
  if (xpc_dictionary_get_value(a1, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY"))
  {
    xpc_object_t value = xpc_dictionary_get_value(a1, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY");
    uint64_t v21 = xpc_dictionary_get_uint64(value, "TCCD_MSG_IDENTITY_TYPE_KEY");
    uint64_t v22 = xpc_dictionary_get_string(value, "TCCD_MSG_IDENTITY_ID_KEY");
    CFIndex v23 = tcc_identity_create(v21, v22);
    if (v23)
    {
      uint64_t v24 = (uint64_t)v23;
      xpc_object_t v25 = xpc_dictionary_get_value(a1, "code_requirement");
      tcc_identity_set_verifier_code_requirement_data(v24, v25);
      tcc_authorization_record_set_subject_identity(v9, v24);
      tcc_release(v24);
      goto LABEL_23;
    }

    _tcc_util_create_CFError_with_user_info(2LL, @"Failed to allocate subject identity.");
LABEL_33:
    tcc_release(v9);
    return 0LL;
  }

  if (a3) {
    tcc_authorization_record_set_subject_identity(v9, a3);
  }
LABEL_23:
  if (xpc_dictionary_get_value(a1, "indirect_object_identifier"))
  {
    int64_t int64 = xpc_dictionary_get_int64(a1, "indirect_object_identifier_type");
    uint64_t v27 = xpc_dictionary_get_string(a1, "indirect_object_identifier");
    uint64_t v28 = tcc_identity_create(int64, v27);
    if (v28)
    {
      uint64_t v29 = (uint64_t)v28;
      xpc_object_t v30 = xpc_dictionary_get_value(a1, "indirect_object_code_requirement");
      tcc_identity_set_verifier_code_requirement_data(v29, v30);
      tcc_authorization_record_set_indirect_object_identity(v9, v29);
      tcc_release(v29);
    }
  }

  else if (a4)
  {
    tcc_authorization_record_set_indirect_object_identity(v9, a4);
  }

  uint64_t v31 = (const __CFDictionary *)_TCCTCCAccessCopyInformationInternalForEntry(a1);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = (__CFBundle *)CFDictionaryGetValue(v31, kTCCInfoBundle);
    if (v33)
    {
      uint64_t v34 = CFBundleCopyBundleURL(v33);
      if (CFURLGetFileSystemRepresentation(v34, 0, buffer, 1024LL)) {
        uint64_t v35 = tcc_attributed_entity_create(0, (const char *)buffer);
      }
      else {
        uint64_t v35 = 0LL;
      }
      CFRelease(v34);
    }

    else
    {
      __int16 v36 = (const __CFString *)CFDictionaryGetValue(v32, kTCCInfoPath);
      if (!v36)
      {
LABEL_40:
        __int16 v38 = CFDictionaryGetValue(v32, kTCCInfoLastModified);
        if (v38) {
          tcc_authorization_record_set_last_modified_date(v9, v38);
        }
        uint64_t v39 = CFDictionaryGetValue(v32, kTCCInfoExpiredAt);
        if (v39) {
          tcc_authorization_record_set_last_modified_date(v9, v39);
        }
        CFRelease(v32);
        return v9;
      }

      uint64_t v37 = stringCopyUTF8String(v36);
      uint64_t v35 = tcc_attributed_entity_create(1, v37);
      free(v37);
    }

    if (v35)
    {
      tcc_authorization_record_set_subject_attributed_entity(v9, v35);
      tcc_release(v35);
    }

    goto LABEL_40;
  }

  return v9;
}

uint64_t tcc_server_copy_cached_authorization(uint64_t a1, const void *a2, const void *a3)
{
  return tcc_authorization_cache_copy_authorization(*(void *)(a1 + 64), a2, a3);
}

void tcc_server_cache_authorization(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
}

void *tcc_server_create_with_endpoint(dispatch_queue_global_s *a1, _xpc_endpoint_s *a2)
{
  uint64_t v3 = tcc_server_create(a1);
  __int128 v4 = xpc_connection_create_from_endpoint(a2);
  v3[9] = v4;
  xpc_connection_set_event_handler(v4, &__block_literal_global_4);
  xpc_connection_activate((xpc_connection_t)v3[9]);
  return v3;
}

void *tcc_server_create(dispatch_queue_global_t global_queue)
{
  uint64_t v3 = v2;
  if (!global_queue) {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }
  dispatch_retain(global_queue);
  v3[7] = global_queue;
  v3[9] = 0LL;
  v3[8] = tcc_authorization_cache_shared_instance();
  return v3;
}

uint64_t tcc_server_get_connection(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tcc_server_singleton_default()
{
  if (tcc_server_singleton_default_onceToken != -1) {
    dispatch_once(&tcc_server_singleton_default_onceToken, &__block_literal_global_22);
  }
  return tcc_server_singleton_default_default_ipc_server;
}

void *__tcc_server_singleton_default_block_invoke()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_queue_t result = tcc_server_create(global_queue);
  tcc_server_singleton_default_default_ipc_server = (uint64_t)result;
  if (result)
  {
    *((_DWORD *)result + 3) = 0x7FFFFFFF;
    *((_DWORD *)result + 2) = 0x7FFFFFFF;
  }

  return result;
}

uint64_t tcc_server_get_reply_handler_queue(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

void tcc_server_message_request_authorization( uint64_t a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, void (**a6)(void, void, void))
{
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v12, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v12, "TCCD_MSG_REQUEST_TYPE_KEY", 0LL);
  uint64_t v13 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v13 = v14;
    a2 = v14;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  tcc_object_encode_to_dictionary((uint64_t)a3);
  xpc_dictionary_set_value(v12, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v15);
  xpc_release(v15);
  tcc_object_encode_to_dictionary((uint64_t)a4);
  if (a5)
  {
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    tcc_object_encode_to_dictionary(a5);
    xpc_dictionary_set_value(v12, "TCC_MSG_REQUEST_AUTHORIZATION_INDIRECT_OBJECT_CREDENTIAL_DICTIONARY_KEY", v16);
    xpc_release(v16);
  }

  _tcc_server_send_request_authorization(a1, a4, a3, a2, v12, a6);
  if (v13) {
    tcc_release(v13);
  }
  xpc_release(v12);
}

void _tcc_server_send_request_authorization( uint64_t a1, const void *a2, const void *a3, uint64_t a4, void *a5, void (**a6)(void, void, void))
{
  int reply_handler_policy = tcc_message_options_get_reply_handler_policy(a4);
  BOOL v11 = reply_handler_policy == 1;
  uint64_t v12 = tcc_credential_singleton_for_self();
  int v13 = tcc_object_equal((uint64_t)a3, v12);
  uint64_t request_prompt_policy = tcc_message_options_get_request_prompt_policy(a4);
  int cache_policy = tcc_message_options_get_cache_policy(a4);
  BOOL v41 = cache_policy == 0;
  int audit_token_cache_max_size = tcc_service_get_audit_token_cache_max_size((uint64_t)a2);
  if (os_variant_is_darwinos())
  {
    uint64_t v17 = (os_log_s *)tcc_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186DC2000,  v17,  OS_LOG_TYPE_DEFAULT,  "automatically granting auth because of darwinos",  buf,  2u);
    }

    tcc_authorization_record_create();
    if (v18)
    {
      uint64_t v19 = v18;
      tcc_authorization_record_set_service(v18, (uint64_t)a2);
      tcc_authorization_record_set_authorization_value(v19, 2LL);
      tcc_authorization_record_set_authorization_reason(v19, 5LL);
      if (reply_handler_policy == 1)
      {
        a6[2](a6, v19, 0LL);
        uint64_t v20 = v19;
LABEL_30:
        tcc_release(v20);
        return;
      }

      uint64_t v28 = _Block_copy(a6);
      uint64_t v29 = *(dispatch_queue_s **)(a1 + 56);
      v52[0] = MEMORY[0x1895F87A8];
      v52[1] = 0x40000000LL;
      v52[2] = ___tcc_server_send_request_authorization_block_invoke;
      v52[3] = &unk_189F84E30;
      v52[4] = v28;
      v52[5] = v19;
      xpc_object_t v30 = v52;
LABEL_32:
      dispatch_async(v29, v30);
      return;
    }
  }

  if (v13) {
    BOOL v21 = 0;
  }
  else {
    BOOL v21 = audit_token_cache_max_size < 0;
  }
  int v22 = !v21;
  if (!cache_policy)
  {
    if (v22)
    {
      uint64_t v23 = tcc_authorization_cache_copy_authorization(*(void *)(a1 + 64), a2, a3);
      if (v23)
      {
        uint64_t v24 = v23;
        if (tcc_authorization_record_get_authorization_right(v23) != 1 || request_prompt_policy)
        {
          uint64_t v31 = (os_log_s *)tcc_log_handle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v32 = tcc_object_copy_description(v24);
            uint64_t v33 = (os_log_s *)tcc_log_handle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              _tcc_server_send_request_authorization_cold_1((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);
            }
            CFRelease(v32);
          }

          if (reply_handler_policy == 1)
          {
            a6[2](a6, v24, 0LL);
            uint64_t v20 = v24;
            goto LABEL_30;
          }

          uint64_t v40 = _Block_copy(a6);
          uint64_t v29 = *(dispatch_queue_s **)(a1 + 56);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = ___tcc_server_send_request_authorization_block_invoke_53;
          block[3] = &unk_189F84E58;
          block[4] = v40;
          void block[5] = v24;
          xpc_object_t v30 = block;
          goto LABEL_32;
        }

        tcc_release(v24);
      }
    }
  }

  xpc_dictionary_set_string(a5, "function", "TCCAccessRequest");
  tcc_retain(a2);
  xpc_object_t v25 = _Block_copy(a6);
  xpc_retain(a5);
  uint64_t v26 = MEMORY[0x1895F87A8];
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 0x40000000LL;
  v46[2] = ___tcc_server_send_request_authorization_block_invoke_2;
  v46[3] = &unk_189F84ED0;
  v46[6] = a1;
  v46[7] = a2;
  v46[4] = v25;
  v46[5] = a5;
  BOOL v47 = v11;
  int v48 = v13;
  BOOL v49 = v41;
  BOOL v50 = audit_token_cache_max_size >= 0;
  v46[8] = a3;
  if (request_prompt_policy) {
    uint64_t message_preflight_queue = tcc_service_get_message_preflight_queue((uint64_t)a2);
  }
  else {
    uint64_t message_preflight_queue = tcc_service_get_message_queue((uint64_t)a2);
  }
  activity_block[0] = v26;
  activity_block[1] = 0x40000000LL;
  activity_block[2] = ___tcc_server_send_request_authorization_block_invoke_2_76;
  activity_block[3] = &unk_189F84EF8;
  BOOL v45 = v11;
  activity_block[4] = v46;
  activity_void block[5] = message_preflight_queue;
  _os_activity_initiate( &dword_186DC2000,  "tcc_send_request_authorization() IPC",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

void tcc_server_message_set_authorization_value( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t valuePtr = a6;
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1)
    {
      uint64_t type = tcc_identity_get_type(a3);
      CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info( 2LL,  @"Unhandled identity type: %llu",  type);
      goto LABEL_18;
    }

    uint64_t v12 = "path";
  }

  else
  {
    uint64_t v12 = "bundle";
  }

  int v13 = (const void *)*MEMORY[0x189604DE0];
  if (a2)
  {
    uint64_t nokill_policy = tcc_message_options_get_nokill_policy(a2);
    if (nokill_policy) {
      int v13 = (const void *)nokill_policy;
    }
  }

  if (a6 == 1)
  {
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info( 8LL,  @"Authorization right cannot be Unknown");
LABEL_18:
    CFErrorRef v25 = CFError_with_user_info;
    if (a7) {
      (*(void (**)(uint64_t, CFErrorRef))(a7 + 16))(a7, CFError_with_user_info);
    }
    CFRelease(v25);
    return;
  }

  BOOL v16 = a6 != 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189604E40], MEMORY[0x189605250]);
  CFNumberRef v18 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"auth_value", v18);
  CFDictionarySetValue(Mutable, kTCCSetNoKill, v13);
  CF_uint64_t name = (const __CFString *)tcc_service_get_CF_name(a4);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  int v21 = TCCAccessSetInternal(CF_name, v12, identifier, 0LL, v16, 0LL, 0, Mutable);
  CFErrorRef v22 = 0LL;
  if (!v21)
  {
    uint64_t name = tcc_service_get_name(a4);
    uint64_t v24 = tcc_identity_get_identifier(a3);
    CFErrorRef v22 = _tcc_util_create_CFError_with_user_info(2LL, @"Failed to set authorization for %s, %s", name, v24);
  }

  if (a7) {
    (*(void (**)(uint64_t, CFErrorRef))(a7 + 16))(a7, v22);
  }
  if (v22) {
    CFRelease(v22);
  }
  CFRelease(v18);
  CFRelease(Mutable);
}

void tcc_server_message_prompt_authorization_value( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v13, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v13, "TCCD_MSG_REQUEST_TYPE_KEY", 8uLL);
  xpc_dictionary_set_string(v13, "function", "TCCAccessSetWithPrompt");
  uint64_t v14 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v14 = v15;
    a2 = v15;
  }

  tcc_object_encode_to_dictionary(a2);
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1) {
      goto LABEL_8;
    }
    BOOL v16 = "path";
  }

  else
  {
    BOOL v16 = "bundle";
  }

  xpc_dictionary_set_string(v13, "client_type", v16);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  xpc_dictionary_set_string(v13, "client", identifier);
LABEL_8:
  uint64_t name = (const char *)tcc_service_get_name(a4);
  xpc_dictionary_set_string(v13, "service", name);
  xpc_dictionary_set_uint64(v13, "desired_auth_value", a6);
  BOOL v19 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  uint64_t v20 = _Block_copy(a7);
  xpc_retain(v13);
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 0x40000000LL;
  v23[2] = ___tcc_server_send_prompt_authorization_value_block_invoke;
  v23[3] = &unk_189F84F70;
  BOOL v24 = v19;
  v23[6] = v13;
  v23[7] = a4;
  v23[4] = v20;
  void v23[5] = a1;
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 0x40000000LL;
  activity_block[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_2_82;
  activity_block[3] = &unk_189F84F98;
  BOOL v22 = v19;
  activity_block[4] = v23;
  _os_activity_initiate( &dword_186DC2000,  "tcc_send_prompt_authorization_value() IPC",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
  if (v14) {
    tcc_release(v14);
  }
  xpc_release(v13);
}

void tcc_server_message_get_authorization_records_by_identity( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_REQUEST_TYPE_KEY", 2uLL);
  uint64_t v11 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v11 = v12;
    tcc_message_options_set_reply_handler_policy(v12, 1);
    a2 = v11;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_dictionary_set_string(v10, "function", "TCCAccessCopyInformationForBundle");
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1) {
      goto LABEL_8;
    }
    xpc_object_t v13 = "path";
  }

  else
  {
    xpc_object_t v13 = "bundle";
  }

  xpc_dictionary_set_string(v10, "client_type", v13);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  xpc_dictionary_set_string(v10, "client", identifier);
LABEL_8:
  _tcc_server_send_get_authorization_records(a1, 0, a2, 0LL, a3, a4, (uint64_t)v10, a5);
  if (v11) {
    tcc_release(v11);
  }
  xpc_release(v10);
}

void tcc_server_message_get_authorization_records_by_service( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY", 3uLL);
  uint64_t v9 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v9 = v10;
    tcc_message_options_set_reply_handler_policy(v10, 1);
    a2 = v9;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_dictionary_set_string(v8, "function", "TCCAccessCopyInformation");
  uint64_t name = (const char *)tcc_service_get_name(a3);
  xpc_dictionary_set_string(v8, "service", name);
  int is_system_service = tcc_service_get_is_system_service(a3);
  _tcc_server_send_get_authorization_records(a1, is_system_service, a2, a3, 0LL, 0LL, (uint64_t)v8, a4);
  if (v9) {
    tcc_release(v9);
  }
  xpc_release(v8);
}

void tcc_server_message_get_identity_for_credential(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY", 4uLL);
  xpc_dictionary_set_string(v8, "function", "TCCGetIdentityForCredential");
  uint64_t v9 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v9 = v10;
    a2 = v10;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  tcc_object_encode_to_dictionary(a3);
  xpc_dictionary_set_value(v8, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v11);
  xpc_release(v11);
  BOOL v12 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  xpc_object_t v13 = _Block_copy(a4);
  xpc_retain(v8);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 0x40000000LL;
  v16[2] = ___tcc_server_send_get_identity_for_credential_block_invoke;
  v16[3] = &unk_189F850C8;
  void v16[5] = v8;
  v16[6] = a1;
  BOOL v17 = v12;
  v16[4] = v13;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 0x40000000LL;
  _OWORD v14[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_2_106;
  v14[3] = &unk_189F850F0;
  BOOL v15 = v12;
  v14[4] = v16;
  _os_activity_initiate(&dword_186DC2000, "tcc_send_get_identity_for_credential() IPC", OS_ACTIVITY_FLAG_DEFAULT, v14);
  if (v9) {
    tcc_release(v9);
  }
  xpc_release(v8);
}

void tcc_server_set_authorization_change_handler()
{
  if (tcc_server_set_authorization_change_handler_log_once != -1) {
    dispatch_once(&tcc_server_set_authorization_change_handler_log_once, &__block_literal_global_46);
  }
}

void __tcc_server_set_authorization_change_handler_block_invoke()
{
  uint64_t v0 = (os_log_s *)tcc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __tcc_server_set_authorization_change_handler_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void tcc_server_message_set_authorization_change_policy()
{
  if (tcc_server_message_set_authorization_change_policy_log_once != -1) {
    dispatch_once(&tcc_server_message_set_authorization_change_policy_log_once, &__block_literal_global_48);
  }
}

void __tcc_server_message_set_authorization_change_policy_block_invoke()
{
  uint64_t v0 = (os_log_s *)tcc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __tcc_server_message_set_authorization_change_policy_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void tcc_server_message_request_authorization_change( uint64_t a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, uint64_t a6, void (**a7)(void, void, void))
{
  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v14, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v14, "TCCD_MSG_REQUEST_TYPE_KEY", 0LL);
  xpc_dictionary_set_uint64(v14, "desired_auth_value", a5);
  uint64_t v15 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v15 = v16;
    a2 = v16;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  tcc_object_encode_to_dictionary((uint64_t)a3);
  xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v17);
  xpc_release(v17);
  tcc_object_encode_to_dictionary((uint64_t)a4);
  if (a6)
  {
    xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
    tcc_object_encode_to_dictionary(a6);
    xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_INDIRECT_OBJECT_CREDENTIAL_DICTIONARY_KEY", v18);
    xpc_release(v18);
  }

  _tcc_server_send_request_authorization(a1, a4, a3, a2, v14, a7);
  if (v15) {
    tcc_release(v15);
  }
  xpc_release(v14);
}

void tcc_server_message_credential_report_use( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_REQUEST_TYPE_KEY", 7uLL);
  uint64_t v11 = 0LL;
  if (!a2)
  {
    tcc_message_options_create();
    uint64_t v11 = v12;
    a2 = v12;
  }

  tcc_object_encode_to_dictionary(a2);
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  tcc_object_encode_to_dictionary(a3);
  xpc_dictionary_set_value(v10, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v13);
  xpc_release(v13);
  tcc_object_encode_to_dictionary(a4);
  BOOL v14 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  uint64_t v15 = _Block_copy(a5);
  xpc_retain(v10);
  xpc_dictionary_set_string(v10, "function", "TCCReportUse");
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 0x40000000LL;
  void v18[2] = ___tcc_server_send_report_resource_use_block_invoke;
  v18[3] = &unk_189F851A8;
  v18[5] = v10;
  v18[6] = a1;
  BOOL v19 = v14;
  v18[4] = v15;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 0x40000000LL;
  v16[2] = ___tcc_server_send_report_resource_use_block_invoke_2_117;
  v16[3] = &unk_189F851D0;
  BOOL v17 = v14;
  v16[4] = v18;
  _os_activity_initiate(&dword_186DC2000, "tcc_send_report_resource_use() IPC", OS_ACTIVITY_FLAG_DEFAULT, v16);
  if (v11) {
    tcc_release(v11);
  }
  xpc_release(v10);
}

void tcc_server_message_get_authorization_records_by_services( uint64_t a1, const __CFArray *a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v6 = a3;
    uint64_t v7 = 0LL;
  }

  else
  {
    tcc_message_options_create();
    uint64_t v7 = v8;
    tcc_message_options_set_reply_handler_policy(v8, 1);
    uint64_t v6 = v7;
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v9, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v9, "TCCD_MSG_REQUEST_TYPE_KEY", 5uLL);
  xpc_dictionary_set_string(v9, "function", "TCCAccessCopyInformationForServices");
  tcc_object_encode_to_dictionary(v6);
  xpc_object_t v10 = xpc_array_create(0LL, 0LL);
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v12 = Count;
    for (CFIndex i = 0LL; i != v12; ++i)
    {
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(a2, i);
      uint64_t v15 = tcc_service_singleton_for_CF_name(ValueAtIndex);
      if (v15)
      {
        uint64_t name = (const char *)tcc_service_get_name((uint64_t)v15);
        xpc_object_t v17 = xpc_string_create(name);
        xpc_array_append_value(v10, v17);
        xpc_release(v17);
      }

      else
      {
        xpc_object_t v18 = stringCopyUTF8String(ValueAtIndex);
        BOOL v19 = (os_log_s *)tcc_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_186DC2000, v19, OS_LOG_TYPE_ERROR, "%s, service invalid", (uint8_t *)&buf, 0xCu);
        }

        free(v18);
      }
    }
  }

  if (xpc_array_get_count(v10))
  {
    xpc_dictionary_set_value(v9, "services", v10);
  }

  else
  {
    xpc_release(v9);
    xpc_object_t v9 = 0LL;
  }

  xpc_release(v10);
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  uint64_t v30 = 0LL;
  if (v9)
  {
    uint64_t v20 = _Block_copy(a4);
    BOOL v21 = tcc_message_options_get_reply_handler_policy(v6) == 1;
    uint64_t v22 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 0x40000000LL;
    v26[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke;
    v26[3] = &unk_189F85248;
    v26[4] = v20;
    v26[5] = &v27;
    uint64_t v23 = (os_log_s *)tcc_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_186DC2000,  v23,  OS_LOG_TYPE_INFO,  "tcc_server_message_get_authorization_records_by_services() IPC",  (uint8_t *)&buf,  2u);
    }

    *(void *)&__int128 buf = v22;
    *((void *)&buf + 1) = 0x40000000LL;
    uint64_t v32 = ___tcc_server_send_get_authorization_records_by_services_block_invoke_129;
    uint64_t v33 = &unk_189F852C0;
    uint64_t v37 = a1;
    xpc_object_t v38 = v9;
    uint64_t v35 = v20;
    uint64_t v36 = &v27;
    uint64_t v34 = v26;
    BOOL v39 = v21;
    int v40 = 1;
    _os_activity_initiate( &dword_186DC2000,  "tcc_server_message_get_authorization_records_by_services() IPC",  OS_ACTIVITY_FLAG_DEFAULT,  &buf);
  }

  else
  {
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(8LL, @"Invalid services list");
    v28[3] = (uint64_t)CFError_with_user_info;
    ((void (**)(void, void, CFErrorRef))a4)[2](a4, 0LL, CFError_with_user_info);
  }

  _Block_object_dispose(&v27, 8);
  if (v7) {
    tcc_release(v7);
  }
}

uint64_t tcc_server_copy_authorization_cache(uint64_t a1)
{
  return tcc_authorization_cache_dump_state_copy(*(void *)(a1 + 64));
}

void tcc_server_dispose(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 56);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(void **)(a1 + 72);
  if (v3) {
    xpc_release(v3);
  }
}

void ___tcc_server_send_request_authorization_block_invoke(uint64_t a1)
{
}

void ___tcc_server_send_request_authorization_block_invoke_53(uint64_t a1)
{
}

void ___tcc_server_send_request_authorization_block_invoke_2(uint64_t a1)
{
  size_t length = 0LL;
  xpc_object_t value = xpc_dictionary_get_value( *(xpc_object_t *)(a1 + 40),  "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  data = value;
  if (value)
  {
    else {
      data = 0LL;
    }
  }

  uint64_t v4 = *(_xpc_connection_s **)(*(void *)(a1 + 48) + 72LL);
  uint64_t is_system_service = tcc_service_get_is_system_service(*(void *)(a1 + 56));
  int v6 = *(_DWORD *)(a1 + 72);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = ___tcc_server_send_request_authorization_block_invoke_3;
  v8[3] = &unk_189F84EA8;
  uint64_t v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  void v8[5] = v7;
  uint64_t v11 = *(void *)(a1 + 76);
  char v13 = *(_BYTE *)(a1 + 84);
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  uint64_t v10 = *(void *)(a1 + 64);
  int v12 = v6;
  tccd_send_v2(v4, is_system_service, v6, (uint64_t)data, v7, (uint64_t)v8);
}

void ___tcc_server_send_request_authorization_block_invoke_3(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    int8x16_t v9 = (os_log_s *)tcc_log_handle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    uint64_t v11 = (const char *)*MEMORY[0x1895F91B0];
    if (v10) {
      ___tcc_server_send_request_authorization_block_invoke_3_cold_1(a2, (const char *)*MEMORY[0x1895F91B0]);
    }
    string = xpc_dictionary_get_string(a2, v11);
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"%s", string);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    _Block_release(*(const void **)(a1 + 32));
    tcc_release(*(void *)(a1 + 48));
    CFErrorRef v14 = CFError_with_user_info;
    goto LABEL_44;
  }

  uint64_t v4 = xpc_dictionary_get_string(a2, "abort");
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    int v6 = xpc_dictionary_get_string(a2, "problem_key");
    __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(v5, v6);
  }

  if (xpc_dictionary_get_value(a2, "auth_value"))
  {
    uint64_t int64 = xpc_dictionary_get_uint64(a2, "auth_value");
    CFErrorRef v8 = 0LL;
  }

  else
  {
    CFErrorRef v8 = _tcc_util_create_CFError_with_user_info(2LL, @"missing 'auth_value' in reply message");
    uint64_t int64 = 0LL;
  }

  if (xpc_dictionary_get_value(a2, "auth_reason")) {
    uint64_t v15 = xpc_dictionary_get_uint64(a2, "auth_reason");
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v16 = xpc_dictionary_get_uint64(a2, "auth_version");
  xpc_object_t value = xpc_dictionary_get_value(a2, "extension");
  if (v8) {
    goto LABEL_14;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    if (value)
    {
      xpc_string_get_string_ptr(value);
      if (sandbox_extension_consume() == -1)
      {
        uint64_t v32 = (os_log_s *)tcc_log_handle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          ___tcc_server_send_request_authorization_block_invoke_3_cold_2(v32);
        }
        uint64_t v33 = __error();
        CFErrorRef v8 = _tcc_util_create_CFError_with_user_info(2LL, @"sandbox_extension_consume():%d", *v33);
        if (v8)
        {
LABEL_14:
          xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
          goto LABEL_15;
        }
      }
    }
  }

  if (xpc_dictionary_get_value(a2, "auth_error_string"))
  {
    if (xpc_dictionary_get_value(a2, "auth_error_code")) {
      uint64_t v20 = xpc_dictionary_get_uint64(a2, "auth_error_code");
    }
    else {
      uint64_t v20 = 2LL;
    }
    uint64_t v22 = xpc_dictionary_get_string(a2, "auth_error_string");
    CFErrorRef v8 = _tcc_util_create_CFError_with_user_info(v20, @"server error: %s", v22);
    BOOL v21 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
    if (!v8) {
      goto LABEL_25;
    }
LABEL_15:
    char v18 = 0;
    BOOL v19 = 0LL;
    goto LABEL_39;
  }

  BOOL v21 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
LABEL_25:
  char v23 = v21;
  tcc_authorization_record_create();
  BOOL v19 = (const void *)v24;
  if (!v24) {
    goto LABEL_38;
  }
  tcc_authorization_record_set_service(v24, *(void *)(a1 + 48));
  tcc_authorization_record_set_authorization_value((uint64_t)v19, uint64);
  tcc_authorization_record_set_authorization_reason((uint64_t)v19, v15);
  tcc_authorization_record_set_version((uint64_t)v19, v16);
  tcc_authorization_record_set_allow_standard_user_to_set_system_service((uint64_t)v19, v23);
  if (xpc_dictionary_get_value(a2, "session_pid"))
  {
    int v25 = xpc_dictionary_get_uint64(a2, "session_pid");
    tcc_authorization_record_set_session_pid((uint64_t)v19, v25);
  }

  if (xpc_dictionary_get_value(a2, "session_pid_version"))
  {
    uint64_t v26 = xpc_dictionary_get_uint64(a2, "session_pid_version");
    tcc_authorization_record_set_session_pid_version((uint64_t)v19, v26);
  }

  if (xpc_dictionary_get_value(a2, "has_prompted_for_allow"))
  {
    char v27 = xpc_dictionary_get_BOOL(a2, "has_prompted_for_allow");
    tcc_authorization_record_set_has_prompted_for_allow((uint64_t)v19, v27);
  }

  uint64_t v28 = (char *)xpc_dictionary_get_string(a2, "session_boot_UUID");
  if (v28) {
    tcc_authorization_record_set_bootUUID((uint64_t)v19, v28);
  }
  BOOL v29 = xpc_dictionary_get_BOOL(a2, "do_not_cache");
  if (!*(_DWORD *)(a1 + 76)) {
    goto LABEL_38;
  }
  if (!*(_DWORD *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 84)) {
      char v34 = v29;
    }
    else {
      char v34 = 1;
    }
    if ((v34 & 1) != 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

  if (!v29) {
LABEL_37:
  }
    tcc_authorization_cache_set_authorization( *(void *)(*(void *)(a1 + 56) + 64LL),  *(const void **)(a1 + 48),  *(const void **)(a1 + 64),  v19);
LABEL_38:
  CFErrorRef v8 = 0LL;
  char v18 = 1;
LABEL_39:
  if (*(_DWORD *)(a1 + 80))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    _Block_release(*(const void **)(a1 + 32));
    tcc_release(*(void *)(a1 + 48));
    if (v19) {
      tcc_release(v19);
    }
    if ((v18 & 1) == 0)
    {
      CFErrorRef v14 = v8;
LABEL_44:
      CFRelease(v14);
    }
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[2] = ___tcc_server_send_request_authorization_block_invoke_72;
    block[3] = &unk_189F84E80;
    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v31 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 56LL);
    block[1] = 0x40000000LL;
    block[4] = *(void *)(a1 + 32);
    void block[5] = v19;
    void block[6] = v8;
    void block[7] = v30;
    dispatch_async(v31, block);
  }

void ___tcc_server_send_request_authorization_block_invoke_72(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    tcc_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

void ___tcc_server_send_request_authorization_block_invoke_2_76(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v2) {
    dispatch_sync(v3, v4);
  }
  else {
    dispatch_async(v3, v4);
  }
}

void ___tcc_server_send_prompt_authorization_value_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(_xpc_connection_s **)(v1 + 72);
  v5[0] = MEMORY[0x1895F87A8];
  v5[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_2;
  v5[3] = &unk_189F84F48;
  int v4 = *(_DWORD *)(a1 + 64);
  v5[1] = 0x40000000LL;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  int v8 = v4;
  v5[4] = v2;
  uint64_t v7 = v1;
  tccd_send_v2(v3, 0LL, v4, 0LL, (void *)v6, (uint64_t)v5);
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) != MEMORY[0x1895F9268])
  {
    if (xpc_dictionary_get_value(a2, "auth_value"))
    {
      uint64_t int64 = xpc_dictionary_get_uint64(a2, "auth_value");
      CFErrorRef CFError_with_user_info = 0LL;
    }

    else
    {
      CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info( 2LL,  @"missing 'auth_value' in reply message");
      uint64_t int64 = 0LL;
    }

    if (xpc_dictionary_get_value(a2, "auth_reason")) {
      uint64_t v10 = xpc_dictionary_get_uint64(a2, "auth_reason");
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = xpc_dictionary_get_uint64(a2, "auth_version");
    if (CFError_with_user_info)
    {
      xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
LABEL_13:
      char v12 = 0;
      uint64_t v13 = 0LL;
LABEL_23:
      if (*(_DWORD *)(a1 + 64))
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        _Block_release(*(const void **)(a1 + 32));
        if ((v12 & 1) == 0) {
          CFRelease(CFError_with_user_info);
        }
        if (v13) {
          tcc_release(v13);
        }
      }

      else
      {
        uint64_t v20 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 56LL);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 0x40000000LL;
        block[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_78;
        block[3] = &unk_189F84F20;
        block[4] = *(void *)(a1 + 32);
        void block[5] = v13;
        void block[6] = CFError_with_user_info;
        dispatch_async(v20, block);
      }

      return;
    }

    uint64_t v14 = v11;
    if (xpc_dictionary_get_value(a2, "auth_error_string"))
    {
      if (xpc_dictionary_get_value(a2, "auth_error_code")) {
        uint64_t v15 = xpc_dictionary_get_uint64(a2, "auth_error_code");
      }
      else {
        uint64_t v15 = 2LL;
      }
      string = xpc_dictionary_get_string(a2, "auth_error_string");
      CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(v15, @"server error: %s", string);
      BOOL v16 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
      if (CFError_with_user_info) {
        goto LABEL_13;
      }
    }

    else
    {
      BOOL v16 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
    }

    char v18 = v16;
    tcc_authorization_record_create();
    uint64_t v13 = v19;
    if (v19)
    {
      tcc_authorization_record_set_service(v19, *(void *)(a1 + 48));
      tcc_authorization_record_set_authorization_value(v13, uint64);
      tcc_authorization_record_set_authorization_reason(v13, v10);
      tcc_authorization_record_set_version(v13, v14);
      tcc_authorization_record_set_allow_standard_user_to_set_system_service(v13, v18);
    }

    CFErrorRef CFError_with_user_info = 0LL;
    char v12 = 1;
    goto LABEL_23;
  }

  __int128 v6 = (os_log_s *)tcc_log_handle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  int v8 = (const char *)*MEMORY[0x1895F91B0];
  if (v7) {
    ___tcc_server_send_prompt_authorization_value_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1895F91B0]);
  }
  int8x16_t v9 = xpc_dictionary_get_string(a2, v8);
  _tcc_util_create_CFError_with_user_info(2LL, @"%s", v9);
}

uint64_t ___tcc_server_send_prompt_authorization_value_block_invoke_78(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return tcc_release(result);
  }
  return result;
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2_82(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1) {
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    }
    dispatch_sync((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }

  else
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1) {
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    }
    dispatch_async((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }

dispatch_queue_t ___tcc_server_resource_use_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.TCC.send_report_resource_use", 0LL);
  _tcc_server_resource_use_queue_resource_use_queue = (uint64_t)result;
  return result;
}

void _tcc_server_send_get_authorization_records( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  int reply_handler_policy = tcc_message_options_get_reply_handler_policy(a3);
  if (a4) {
    tcc_retain(a4);
  }
  if (a5) {
    tcc_retain(a5);
  }
  if (a6) {
    tcc_retain(a6);
  }
  BOOL v16 = _Block_copy(a8);
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 0x40000000LL;
  activity_block[2] = ___tcc_server_send_get_authorization_records_block_invoke;
  activity_block[3] = &unk_189F85050;
  int v18 = a2;
  BOOL v19 = reply_handler_policy == 1;
  activity_void block[6] = a1;
  void activity_block[7] = a7;
  void activity_block[8] = a4;
  activity_block[9] = a5;
  activity_block[10] = a6;
  activity_block[4] = v16;
  activity_void block[5] = a8;
  int v20 = 1;
  _os_activity_initiate(&dword_186DC2000, "tcc_send_get_authorization() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

__n128 ___tcc_server_send_get_authorization_records_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 56);
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(a1 + 48) + 72LL);
  uint64_t v3 = *(unsigned int *)(a1 + 88);
  int v4 = *(_DWORD *)(a1 + 92);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = ___tcc_server_send_get_authorization_records_block_invoke_2;
  v7[3] = &unk_189F85028;
  __int128 v5 = *(_OWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 80);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  int v11 = *(_DWORD *)(a1 + 96);
  tccd_send_v2(v2, v3, v4, 0LL, v1, (uint64_t)v7);
  return result;
}

void ___tcc_server_send_get_authorization_records_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = 0LL;
  int v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  uint64_t v27 = 0LL;
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    __int128 v9 = (os_log_s *)tcc_log_handle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    int v11 = (const char *)*MEMORY[0x1895F91B0];
    if (v10) {
      ___tcc_server_send_get_authorization_records_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1895F91B0]);
    }
    string = xpc_dictionary_get_string(a2, v11);
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"%s", string);
    goto LABEL_18;
  }

  if (*(void *)(a1 + 48))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "clients");
    if (!value)
    {
      __int128 v5 = (os_log_s *)tcc_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ___tcc_server_send_get_authorization_records_block_invoke_2_cold_3(v5, v6, v7);
      }
      __int128 v8 = "Missing 'clients' array in returned message.";
LABEL_17:
      CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"%s", v8);
LABEL_18:
      v25[3] = (uint64_t)CFError_with_user_info;
LABEL_19:
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      _Block_release(*(const void **)(a1 + 32));
      BOOL v16 = (const void *)v25[3];
      if (v16) {
        CFRelease(v16);
      }
      goto LABEL_24;
    }
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "services");
    if (!value)
    {
      uint64_t v13 = (os_log_s *)tcc_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ___tcc_server_send_get_authorization_records_block_invoke_2_cold_2(v13, v14, v15);
      }
      __int128 v8 = "Missing 'services' array in returned message.";
      goto LABEL_17;
    }
  }

  if (v25[3]) {
    goto LABEL_19;
  }
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 0x40000000LL;
  applier[2] = ___tcc_server_send_get_authorization_records_block_invoke_91;
  applier[3] = &unk_189F85000;
  __int128 v22 = *(_OWORD *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 64);
  applier[4] = *(void *)(a1 + 40);
  void applier[5] = &v24;
  xpc_array_apply(value, applier);
  if (v25[3])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    CFRelease((CFTypeRef)v25[3]);
  }

  else if (*(_DWORD *)(a1 + 72))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  _Block_release(*(const void **)(a1 + 32));
LABEL_24:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    tcc_release(v17);
  }
  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    tcc_release(v18);
  }
  uint64_t v19 = *(void *)(a1 + 64);
  if (v19) {
    tcc_release(v19);
  }
  _Block_object_dispose(&v24, 8);
}

BOOL ___tcc_server_send_get_authorization_records_block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = tcc_server_convert_xpc_object_to_record( a3,  *(const char **)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (!v5)
  {
    uint64_t v6 = v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    if (v6) {
      tcc_release(v6);
    }
  }

  return v5 == 0;
}

void ___tcc_server_send_get_identity_for_credential_block_invoke(uint64_t a1)
{
  size_t length = 0LL;
  xpc_object_t value = xpc_dictionary_get_value( *(xpc_object_t *)(a1 + 40),  "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  else {
    data = 0LL;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(_xpc_connection_s **)(v6 + 72);
  int v8 = *(_DWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  _OWORD v9[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_2;
  v9[3] = &unk_189F850A0;
  int v10 = v8;
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v5;
  v9[6] = v6;
  tccd_send_v2(v7, 0LL, v8, (uint64_t)data, v5, (uint64_t)v9);
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    int v10 = (os_log_s *)tcc_log_handle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    char v12 = (const char *)*MEMORY[0x1895F91B0];
    if (v11) {
      ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1895F91B0]);
    }
    string = xpc_dictionary_get_string(a2, v12);
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"%s", string);
    goto LABEL_12;
  }

  xpc_object_t value = xpc_dictionary_get_value(a2, "TCCD_MSG_IDENTITY_TYPE_KEY");
  xpc_object_t v5 = xpc_dictionary_get_value(a2, "TCCD_MSG_IDENTITY_ID_KEY");
  if (!value
    || (uint64_t v6 = v5, MEMORY[0x186E48A8C](value) != MEMORY[0x1895F92F0])
    || !v6
    || MEMORY[0x186E48A8C](v6) != MEMORY[0x1895F92E8])
  {
    uint64_t v7 = (void *)MEMORY[0x186E48978](a2);
    int v8 = (os_log_s *)tcc_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_2();
    }
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info( 2LL,  @"Invalid reply for attribution request: %s",  v7);
    free(v7);
LABEL_12:
    uint64_t v14 = 0LL;
    goto LABEL_13;
  }

  uint64_t v16 = xpc_uint64_get_value(value);
  string_ptr = xpc_string_get_string_ptr(v6);
  uint64_t v14 = tcc_identity_create(v16, string_ptr);
  if (v14) {
    CFErrorRef CFError_with_user_info = 0LL;
  }
  else {
    CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"Failed to allocate identity.");
  }
LABEL_13:
  if (*(_DWORD *)(a1 + 56))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    _Block_release(*(const void **)(a1 + 32));
    if (v14) {
      tcc_release(v14);
    }
    if (CFError_with_user_info) {
      CFRelease(CFError_with_user_info);
    }
  }

  else
  {
    uint64_t v15 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 56LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_102;
    block[3] = &unk_189F85078;
    block[4] = *(void *)(a1 + 32);
    void block[5] = v14;
    void block[6] = CFError_with_user_info;
    dispatch_async(v15, block);
  }

void ___tcc_server_send_get_identity_for_credential_block_invoke_102(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    tcc_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_106(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_attribution_ipc_queue_attribution_queue_once != -1) {
      dispatch_once(&_tcc_server_attribution_ipc_queue_attribution_queue_once, &__block_literal_global_109);
    }
    dispatch_sync((dispatch_queue_t)_tcc_server_attribution_ipc_queue_attribution_queue, *(dispatch_block_t *)(a1 + 32));
  }

  else
  {
    if (_tcc_server_attribution_ipc_queue_attribution_queue_once != -1) {
      dispatch_once(&_tcc_server_attribution_ipc_queue_attribution_queue_once, &__block_literal_global_109);
    }
    dispatch_async( (dispatch_queue_t)_tcc_server_attribution_ipc_queue_attribution_queue,  *(dispatch_block_t *)(a1 + 32));
  }

dispatch_queue_t ___tcc_server_attribution_ipc_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.TCC.send_get_identity_for_credential", 0LL);
  _tcc_server_attribution_ipc_queue_attribution_queue = (uint64_t)result;
  return result;
}

void ___tcc_server_send_report_resource_use_block_invoke(uint64_t a1)
{
  size_t length = 0LL;
  xpc_object_t value = xpc_dictionary_get_value( *(xpc_object_t *)(a1 + 40),  "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  else {
    data = 0LL;
  }
  xpc_object_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(_xpc_connection_s **)(v6 + 72);
  int v8 = *(_DWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  _OWORD v9[2] = ___tcc_server_send_report_resource_use_block_invoke_2;
  v9[3] = &unk_189F85180;
  int v10 = v8;
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v5;
  v9[6] = v6;
  tccd_send_v2(v7, 0LL, v8, (uint64_t)data, v5, (uint64_t)v9);
}

void ___tcc_server_send_report_resource_use_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9268])
  {
    xpc_object_t v5 = (os_log_s *)tcc_log_handle();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    uint64_t v7 = (const char *)*MEMORY[0x1895F91B0];
    if (v6) {
      ___tcc_server_send_report_resource_use_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1895F91B0]);
    }
    int v8 = a2;
    __int128 v9 = v7;
  }

  else
  {
    if (xpc_dictionary_get_BOOL(a2, "result"))
    {
      CFErrorRef CFError_with_user_info = 0LL;
      goto LABEL_9;
    }

    __int128 v9 = (const char *)*MEMORY[0x1895F91B0];
    int v8 = a2;
  }

  string = xpc_dictionary_get_string(v8, v9);
  CFErrorRef CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2LL, @"%s", string);
LABEL_9:
  if (*(_DWORD *)(a1 + 56))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    _Block_release(*(const void **)(a1 + 32));
    if (CFError_with_user_info) {
      CFRelease(CFError_with_user_info);
    }
  }

  else
  {
    BOOL v11 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 56LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___tcc_server_send_report_resource_use_block_invoke_113;
    block[3] = &unk_189F85158;
    block[4] = *(void *)(a1 + 32);
    void block[5] = CFError_with_user_info;
    dispatch_async(v11, block);
  }

void ___tcc_server_send_report_resource_use_block_invoke_113(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
}

void ___tcc_server_send_report_resource_use_block_invoke_2_117(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1) {
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    }
    dispatch_sync((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }

  else
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1) {
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    }
    dispatch_async((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }

void ___tcc_server_send_get_authorization_records_by_services_block_invoke(uint64_t a1, void *a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    if (MEMORY[0x186E48A8C](a2) != MEMORY[0x1895F9268] && MEMORY[0x186E48A8C](a2) == MEMORY[0x1895F9250])
    {
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 0x40000000LL;
      applier[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_123;
      applier[3] = &unk_189F85220;
      __int128 v14 = *(_OWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
    }

    else
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = _tcc_util_create_CFError_with_user_info( 2LL,  @"Failed to get clients for services: %s",  string);
      xpc_object_t v5 = (os_log_s *)tcc_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }

BOOL ___tcc_server_send_get_authorization_records_by_services_block_invoke_123( uint64_t a1, uint64_t a2, void *a3)
{
  if (MEMORY[0x186E48A8C](a3) != MEMORY[0x1895F9268] && MEMORY[0x186E48A8C](a3) == MEMORY[0x1895F9220])
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 0x40000000LL;
    applier[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_124;
    applier[3] = &unk_189F851F8;
    uint64_t v18 = a2;
    __int128 v17 = *(_OWORD *)(a1 + 32);
    xpc_array_apply(a3, applier);
    return *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == 0LL;
  }

  else
  {
    string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x1895F91B0]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = _tcc_util_create_CFError_with_user_info( 2LL,  @"Failed to get clients for services: %s",  string);
    uint64_t v7 = (os_log_s *)tcc_log_handle();
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
      return 0LL;
    }
  }

  return result;
}

BOOL ___tcc_server_send_get_authorization_records_by_services_block_invoke_124( uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v5 = tcc_service_singleton_for_name(*(const char **)(a1 + 48));
  uint64_t v6 = tcc_server_convert_xpc_object_to_record(a3, v5, 0LL, 0LL);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (!v7)
  {
    uint64_t v8 = v6;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    if (v8) {
      tcc_release(v8);
    }
  }

  return v7 == 0;
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_129(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(_xpc_connection_s **)(*(void *)(a1 + 56) + 72LL);
    v13[0] = MEMORY[0x1895F87A8];
    v13[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_2;
    v13[3] = &unk_189F85270;
    xpc_object_t v5 = *(void **)(a1 + 64);
    v13[1] = 0x40000000LL;
    uint64_t v15 = v3;
    uint64_t v16 = v5;
    __int128 v14 = *(_OWORD *)(a1 + 32);
    int v17 = *(_DWORD *)(a1 + 76);
    uint64_t v6 = v13;
  }

  else
  {
    uint64_t v7 = _Block_copy(*(const void **)(a1 + 32));
    xpc_object_t v5 = *(void **)(a1 + 64);
    uint64_t v8 = *(_xpc_connection_s **)(*(void *)(a1 + 56) + 72LL);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    _OWORD v9[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_3;
    v9[3] = &unk_189F85298;
    v9[4] = v7;
    uint64_t v11 = v5;
    __int128 v10 = *(_OWORD *)(a1 + 40);
    int v2 = *(_DWORD *)(a1 + 72);
    int v12 = *(_DWORD *)(a1 + 76);
    uint64_t v6 = v9;
    uint64_t v4 = v8;
  }

  tccd_send_v2(v4, 0LL, v2, 0LL, v5, (uint64_t)v6);
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  }

  else if (*(_DWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  _Block_release(*(const void **)(a1 + 40));
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  }

  else if (*(_DWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  _Block_release(*(const void **)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

const char *OUTLINED_FUNCTION_6_0(xpc_object_t xdict, const char *key)
{
  return xpc_dictionary_get_string(xdict, key);
}

const char *OUTLINED_FUNCTION_7_0(char *key)
{
  return xpc_dictionary_get_string(v1, key);
}

void *tcc_identity_create(uint64_t a1, const char *a2)
{
  xpc_object_t v5 = v4;
  uint64_t v6 = strdup(a2);
  v5[7] = a1;
  v5[8] = v6;
  v5[9] = 0LL;
  return v5;
}

CFNumberRef tcc_identity_create_from_external_representation(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID()) {
    return 0LL;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kTCCIdentityType);
  uint64_t v4 = Value;
  if (!Value) {
    return v4;
  }
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFNumberGetTypeID()) {
    return 0LL;
  }
  int v6 = CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
  uint64_t v4 = 0LL;
  if (v6 && valuePtr <= 3)
  {
    uint64_t v7 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kTCCIdentityIdentifier);
    if (v7)
    {
      uint64_t v8 = v7;
      CFTypeID v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID())
      {
        __int128 v10 = (const __CFString *)CFDictionaryGetValue( (CFDictionaryRef)a1,  (const void *)kTCCIdentityCodeRequirementString);
        uint64_t v11 = v10;
        if (!v10 || (CFTypeID v12 = CFGetTypeID(v10), v12 == CFStringGetTypeID()))
        {
          tcc_identity_alloc(88LL, (uint64_t)&identity_object_ops);
          uint64_t v4 = v13;
          *((void *)v13 + 7) = valuePtr;
          *((void *)v13 + 8) = stringCopyUTF8String(v8);
          if (v11)
          {
            *((void *)v4 + 9) = 1LL;
            *((void *)v4 + 10) = stringCopyUTF8String(v11);
          }

          else
          {
            *((void *)v4 + 9) = 0LL;
          }

          return v4;
        }
      }
    }

    return 0LL;
  }

  return v4;
}

uint64_t tcc_identity_get_identifier(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tcc_identity_get_type(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

char *tcc_identity_set_verifier_code_requirement_string(uint64_t a1, char *__s1)
{
  BOOL result = strdup(__s1);
  *(void *)(a1 + 72) = 1LL;
  *(void *)(a1 + 80) = result;
  return result;
}

uint64_t tcc_identity_get_verifier_type(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tcc_identity_get_verifier_code_requirement_string(uint64_t a1)
{
  if (*(void *)(a1 + 72) == 1LL) {
    return *(void *)(a1 + 80);
  }
  else {
    return 0LL;
  }
}

CFDictionaryRef tcc_identity_copy_external_representation(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189604E40], MEMORY[0x189605250]);
  if (!Mutable) {
    return 0LL;
  }
  uint64_t v3 = Mutable;
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberSInt64Type, (const void *)(a1 + 56));
  if (!v4)
  {
    CFDictionaryRef Copy = 0LL;
    CFStringRef v7 = (CFStringRef)v3;
LABEL_16:
    CFRelease(v7);
    return Copy;
  }

  CFNumberRef v5 = v4;
  CFDictionarySetValue(v3, (const void *)kTCCIdentityType, v4);
  CFStringRef v6 = CFStringCreateWithCString(0LL, *(const char **)(a1 + 64), 0x8000100u);
  if (!v6)
  {
    CFDictionaryRef Copy = 0LL;
    CFStringRef v7 = 0LL;
    goto LABEL_13;
  }

  CFDictionarySetValue(v3, (const void *)kTCCIdentityIdentifier, v6);
  if (*(void *)(a1 + 72) != 1LL)
  {
    CFStringRef v7 = 0LL;
    goto LABEL_11;
  }

  CFStringRef v7 = CFStringCreateWithCString(0LL, *(const char **)(a1 + 80), 0x8000100u);
  if (v7)
  {
    CFDictionarySetValue(v3, (const void *)kTCCIdentityCodeRequirementString, v7);
LABEL_11:
    CFDictionaryRef Copy = CFDictionaryCreateCopy(0LL, v3);
    goto LABEL_13;
  }

  CFDictionaryRef Copy = 0LL;
LABEL_13:
  CFRelease(v3);
  CFRelease(v5);
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    goto LABEL_16;
  }
  return Copy;
}

BOOL tcc_identity_type_and_identifiers_are_equal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 56) == *(void *)(a2 + 56)
      && strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64)) == 0;
}

void tcc_identity_dispose(uint64_t a1)
{
  if (*(void *)(a1 + 72) == 1LL) {
    free(*(void **)(a1 + 80));
  }
}

void tcc_identity_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  if (*(void *)(a1 + 72) == 1LL) {
    xpc_dictionary_set_string(xdict, "TCCD_MSG_IDENTITY_VERIFIER_CODE_REQUIREMENT_KEY", *(const char **)(a1 + 80));
  }
}

__CFString *tcc_identity_copy_description(void *a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0LL, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"%s/%llu", a1[8], a1[7]);
  if (a1[9] == 1LL) {
    CFStringAppendFormat(Mutable, 0LL, @", %s", a1[10]);
  }
  return Mutable;
}

uint64_t tcc_identity_hash(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  no_copy = (void *)xpc_string_create_no_copy();
  size_t v4 = xpc_hash(no_copy) - v2 + 32 * v2;
  xpc_release(no_copy);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = v5 - v4 + 32 * v4;
  if (v5 == 1)
  {
    CFStringRef v7 = (void *)xpc_string_create_no_copy();
    uint64_t v6 = xpc_hash(v7) - v6 + 32 * v6;
    xpc_release(v7);
  }

  return v6;
}

void tcc_authorization_changed_for_service_notification_name_cold_1()
{
}

void tcc_authorization_change_monitor_create_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = "tcc_authorization_change_monitor_create";
  _os_log_error_impl( &dword_186DC2000,  log,  OS_LOG_TYPE_ERROR,  "%s: CFDictionaryCreateMutable failed",  (uint8_t *)&v1,  0xCu);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_cold_1( uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( &dword_186DC2000,  log,  OS_LOG_TYPE_ERROR,  "notify_register_dispatch(%{public}s) failed: %d",  (uint8_t *)&v3,  0x12u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2_cold_1( int *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_fault_impl( &dword_186DC2000,  a2,  OS_LOG_TYPE_FAULT,  "%s: Failed to get service for token %d",  (uint8_t *)&v3,  0x12u);
  OUTLINED_FUNCTION_0();
}

void _tcc_util_create_CFError_with_user_info_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _tcc_util_create_CFError_with_user_info_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void tccd_send_message_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void tccd_send_message_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl( &dword_186DC2000,  log,  OS_LOG_TYPE_FAULT,  "Unable to allocate reply dictionary when message send limit reached.",  v1,  2u);
  OUTLINED_FUNCTION_7();
}

void __TCCAccessRequest_block_invoke_8_cold_1(void *a1)
{
}

void service_queue_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_7();
}

void __TCCAccessCopyInformation_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessCopyInformationForBundleId_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessCopyBundleIdentifiersForService_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2_cold_1(void *a1)
{
}

void TCCAccessSetInternal_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __TCCAccessSetInternal_block_invoke_cold_1(void *a1)
{
}

void __TCCAccessSetOverride_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessGetOverride_block_invoke_2_cold_1(void *a1)
{
}

void _append_override_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_186DC2000, v0, v1, "%{public}s: Invalid type for override: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __TCCAccessDeclarePolicy_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke_2_cold_1(void *a1)
{
}

void __TCCAccessResetPoliciesExcept_block_invoke_2_cold_1(void *a1)
{
}

void __TCCExpirationCopyInformationForService_block_invoke_2_cold_1(void *a1)
{
}

void __TCCServiceCopyDescriptions_block_invoke_2_cold_1(void *a1)
{
}

void __TCCServiceCopyDescriptions_block_invoke_2_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_186DC2000, a1, a3, "%{public}s: returned object is not an array.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __TCCTestInternalWithReplyHander4_block_invoke_2_cold_1(void *a1)
{
}

void tccd_reply_description_redacted_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __tccd_send_message_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __TCCGetOverridesInternal_block_invoke_2_cold_1(void *a1)
{
}

void __TCCGetOverridesInternal_block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_186DC2000, v0, v1, "%{public}s: Missing or invalid overrides: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void TCCResetInternalWithConnection_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __TCCResetInternalWithConnection_block_invoke_2_cold_1(void *a1)
{
}

void __tcc_authorization_request_with_endpoint_block_invoke_cold_1()
{
}

void __tcc_authorization_preflight_with_endpoint_block_invoke_cold_1(uint64_t a1)
{
}

void __tcc_authorization_check_audit_token_block_invoke_cold_1()
{
}

void __tcc_authorization_audit_token_request_change_block_invoke_cold_1()
{
}

void __tcc_authorization_audit_token_report_use_block_invoke_cold_1()
{
}

void __tcc_authorization_request_change_block_invoke_cold_1()
{
}

void __tcc_authorization_set_access_with_prompt_block_invoke_cold_1()
{
}

void tcc_authorization_cache_create_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void tcc_authorization_cache_create_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void tcc_authorization_cache_create_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _tcc_authorization_cache_locked_set_authorization_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void tcc_authorization_cache_handle_authorization_changed_for_service_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  tcc_service_get_name(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2( &dword_186DC2000,  a2,  v3,  "%s: Failed to find cached authorizations for %{public}s",  (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

void tcc_authorization_cache_handle_authorization_changed_for_service_cold_2( uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)__int128 buf = 136315138;
  *a2 = "_tcc_authorization_cache_copy_current_authorization";
  _os_log_error_impl(&dword_186DC2000, log, OS_LOG_TYPE_ERROR, "%s: failed to initialize server", buf, 0xCu);
}

void tcc_authorization_cache_handle_authorization_changed_for_service_clear_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  tcc_service_get_name(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2( &dword_186DC2000,  a2,  v3,  "%s: Failed to find cached authorizations for %{public}s",  (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

void ___tcc_authorization_cache_copy_current_authorization_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136315394;
  uint64_t v4 = "_tcc_authorization_cache_copy_current_authorization_block_invoke";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_2( &dword_186DC2000,  a2,  a3,  "%s: authorization request failed with error: %{public}@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void tcc_events_subscribe_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void tcc_events_unsubscribe_cold_1()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_1(void *a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1895F91B0]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_186DC2000, a2, OS_LOG_TYPE_ERROR, "Subscriber received error: %s", v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

void ___tcc_events_initialize_block_invoke_2_cold_2()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_3()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_4()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_7()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_8()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_9()
{
}

void ___tcc_events_initialize_block_invoke_2_cold_10(const _xpc_type_s *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  xpc_type_get_name(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_186DC2000,  a3,  OS_LOG_TYPE_ERROR,  "Subscriber received event of unexpected type %s: %s",  v5,  0x16u);
  OUTLINED_FUNCTION_3();
}

void _tcc_server_send_request_authorization_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __tcc_server_set_authorization_change_handler_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __tcc_server_message_set_authorization_change_policy_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___tcc_server_send_request_authorization_block_invoke_3_cold_1(void *a1, const char *a2)
{
}

void ___tcc_server_send_request_authorization_block_invoke_3_cold_2(os_log_s *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  int v3 = 136446466;
  uint64_t v4 = "_tcc_server_send_request_authorization_block_invoke";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl( &dword_186DC2000,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s: sandbox_extension_consume():%d",  (uint8_t *)&v3,  0x12u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2_cold_1(void *a1, const char *a2)
{
  int v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_186DC2000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_1(void *a1, const char *a2)
{
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136446466;
  uint64_t v4 = "_tcc_server_send_get_authorization_records_block_invoke";
  __int16 v5 = 2082;
  uint64_t v6 = "Missing 'services' array in returned message.";
  OUTLINED_FUNCTION_2(&dword_186DC2000, a1, a3, "%{public}s: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136446466;
  uint64_t v4 = "_tcc_server_send_get_authorization_records_block_invoke";
  __int16 v5 = 2082;
  uint64_t v6 = "Missing 'clients' array in returned message.";
  OUTLINED_FUNCTION_2(&dword_186DC2000, a1, a3, "%{public}s: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_1(void *a1, const char *a2)
{
  uint64_t v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_186DC2000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2( &dword_186DC2000,  v0,  v1,  "%{public}s: invalid reply for attribution request: %{public}s",  (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_report_resource_use_block_invoke_2_cold_1(void *a1, const char *a2)
{
  uint64_t v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_186DC2000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x189602B78]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x189602BA0](theDict, value);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFURLRef CFURLCreateWithBytes( CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037B8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x1895F8E10]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x1895F8E18]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x1895F8E20]();
}

uint64_t _os_object_retain()
{
  return MEMORY[0x1895F8E28]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x1895F8E30]();
}

void abort(void)
{
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1895F9310]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void audit_token_to_au32( audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
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

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1896169B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1895FC620]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1895FC628]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1895FD8B0](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1895FD9A0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
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

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDA70](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

uint64_t xpc_dictionary_get_pointer()
{
  return MEMORY[0x1895FDC28]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1895FDC78]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

uint64_t xpc_dictionary_set_pointer()
{
  return MEMORY[0x1895FDD00]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1895FDE88](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1895FE008]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

uint64_t xpc_string_create_no_copy()
{
  return MEMORY[0x1895FE058]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1895FE0C0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FE0D0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}