uint64_t sendAsyncAssertionMsg(int a1, uint64_t a2, _DWORD *a3, int a4)
{
  xpc_object_t v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t uint64;
  os_log_s *v29;
  void *v30;
  xpc_object_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  if (!gAssertionConnection) {
    initialSetup();
  }
  v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v8)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        sendAsyncReleaseMsg_cold_2();
      }
    }

    else
    {
      v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v12) {
        sendAsyncReleaseMsg_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    return 0LL;
  }

  v9 = v8;
  if (gAsyncAssertionActivityLog_2) {
    v10 = a4;
  }
  else {
    v10 = 0;
  }
  if (!a2 && (v10 & 1) == 0)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        sendAsyncAssertionMsg_cold_12();
      }
    }

    else
    {
      v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v20) {
        sendAsyncAssertionMsg_cold_11(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }

    return 0LL;
  }

  if (a2)
  {
    v11 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    if (!v11)
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          sendAsyncAssertionMsg_cold_4();
        }
      }

      else
      {
        v32 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v32) {
          sendAsyncAssertionMsg_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }

      return 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  if (v10)
  {
    v29 = (os_log_s *)assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        sendAsyncReleaseMsg_cold_6(v29);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      sendAsyncReleaseMsg_cold_5();
    }

    v30 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v9, "assertionActivityLog", v30);
    if (a1) {
      goto LABEL_37;
    }
LABEL_31:
    if (a2) {
      xpc_dictionary_set_value(v9, "assertionProperties", v11);
    }
    xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v9);
    uint64 = 0LL;
    v31 = 0LL;
    goto LABEL_58;
  }

  v30 = 0LL;
  if (!a1) {
    goto LABEL_31;
  }
LABEL_37:
  xpc_dictionary_set_value(v9, "assertionCreate", v11);
  v31 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)gAssertionConnection, v9);
  if (MEMORY[0x186E19334]() == MEMORY[0x1895F9250])
  {
    uint64 = xpc_dictionary_get_uint64(v31, "assertionId");
    if (a3) {
      *a3 = xpc_dictionary_get_uint64(v31, "returnCode");
    }
    goto LABEL_58;
  }

  if (MEMORY[0x186E19334](v31) != MEMORY[0x1895F9268]) {
    goto LABEL_39;
  }
  if (v31 == (xpc_object_t)MEMORY[0x1895F9198])
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        sendAsyncAssertionMsg_cold_6();
      }
    }

    else
    {
      v40 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v40) {
        sendAsyncAssertionMsg_cold_5(v40, v41, v42, v43, v44, v45, v46, v47);
      }
    }

    uint64 = 0LL;
    v31 = (xpc_object_t)MEMORY[0x1895F9198];
    goto LABEL_58;
  }

  if (v31 == (xpc_object_t)MEMORY[0x1895F91A0])
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        sendAsyncAssertionMsg_cold_8();
      }
    }

    else
    {
      v48 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v48) {
        sendAsyncAssertionMsg_cold_7(v48, v49, v50, v51, v52, v53, v54, v55);
      }
    }

    uint64 = 0LL;
    v31 = (xpc_object_t)MEMORY[0x1895F91A0];
  }

  else
  {
LABEL_39:
    uint64 = 0LL;
  }

void clearAssertionLogBuffer()
{
  gAsyncAssertionActivityLog_2 = 0;
  gAsyncAssertionActivityLog_0 = 0;
  if (gAsyncAssertionActivityLog_1) {
    CFArrayRemoveAllValues((CFMutableArrayRef)gAsyncAssertionActivityLog_1);
  }
}

void processCheckAssertionsMsg(void *a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if ((int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) < 1)
  {
    unsigned int v3 = 0;
  }

  else
  {
    PMQueue = (dispatch_queue_s *)getPMQueue();
    dispatch_async(PMQueue, &__block_literal_global_57);
    unsigned int v3 = 1;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    v5 = reply;
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
    xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
    xpc_dictionary_set_uint64(v5, "assertionCheckCount", v3);
    uint64_t v7 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109376;
        unsigned int v19 = v3;
        __int16 v20 = 2048;
        uint64_t v21 = uint64;
        v8 = (os_log_s *)v7;
LABEL_13:
        _os_log_impl( &dword_182DAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "Replying to assertion check message with count %d token:%llu\n",  (uint8_t *)&v18,  0x12u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109376;
      unsigned int v19 = v3;
      __int16 v20 = 2048;
      uint64_t v21 = uint64;
      v8 = (os_log_s *)MEMORY[0x1895F8DA0];
      goto LABEL_13;
    }

    remote_connection = xpc_dictionary_get_remote_connection(a1);
    xpc_connection_send_message(remote_connection, v5);
    xpc_release(v5);
    return;
  }

  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processCheckAssertionsMsg_cold_2();
    }
  }

  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      processCheckAssertionsMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

void __processCheckAssertionsMsg_block_invoke()
{
  if (gCurrentRemoteAssertion)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        __processCheckAssertionsMsg_block_invoke_cold_2();
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __processCheckAssertionsMsg_block_invoke_cold_1();
    }
  }

  offloadAssertions(1);
}

void processAssertionTimeout(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int uint64 = xpc_dictionary_get_uint64(a1, "assertionTimeout");
  int v2 = gCurrentRemoteAssertion;
  uint64_t v3 = assertions_log;
  if (gCurrentRemoteAssertion == uint64)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 67109376;
        int v11 = uint64;
        __int16 v12 = 1024;
        int v13 = gCurrentAssertion;
        v4 = (os_log_s *)v3;
LABEL_10:
        _os_log_impl( &dword_182DAF000,  v4,  OS_LOG_TYPE_DEFAULT,  "Current assertion has been released by powerd gCurrentRemoteAssertion 0x%x gCurrentAssertion 0x%x",  (uint8_t *)&v10,  0xEu);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109376;
      int v11 = uint64;
      __int16 v12 = 1024;
      int v13 = gCurrentAssertion;
      v4 = (os_log_s *)MEMORY[0x1895F8DA0];
      goto LABEL_10;
    }
  }

  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processAssertionTimeout_cold_12();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    processAssertionTimeout_cold_11();
  }

  v5 = (const void *)(HIWORD(gCurrentAssertion) & 0x7FFF);
  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gAssertionsDict, v5);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    removeFromTimedList(gCurrentAssertion);
    if (CFDictionaryContainsKey((CFDictionaryRef)gActiveAssertionsDict, v5))
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_10();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_9();
      }

      CFDictionaryRemoveValue((CFMutableDictionaryRef)gActiveAssertionsDict, v5);
    }

    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        processAssertionTimeout_cold_8();
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      processAssertionTimeout_cold_7();
    }

    if (CFDictionaryContainsValue(Value, @"TimeoutAction")) {
      v8 = (const __CFString *)CFDictionaryGetValue(Value, @"TimeoutAction");
    }
    else {
      v8 = @"TimeoutActionTurnOff";
    }
    if (CFStringCompare(v8, @"TimeoutActionRelease", 0LL))
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_6();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_5();
      }

      CFDictionarySetValue((CFMutableDictionaryRef)gInactiveAssertionsDict, v5, Value);
    }

    else
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_4();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_3();
      }

      CFDictionaryRemoveValue((CFMutableDictionaryRef)gAssertionsDict, v5);
    }
  }

  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
      processAssertionTimeout_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
  {
    processAssertionTimeout_cold_1();
  }

  if (v2 == uint64)
  {
    gCurrentAssertion = 0;
    gCurrentRemoteAssertion = 0;
    gCurrentRemoteAssertionIsCoalesced = 0;
  }

  PMQueue = (dispatch_queue_s *)getPMQueue();
  dispatch_async(PMQueue, &__block_literal_global_68_0);
}

void __processAssertionTimeout_block_invoke()
{
}

void processAssertionUpdateActivity(void *a1)
{
  uint64_t v2 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v26 = 0;
    uint64_t v3 = (uint8_t *)&v26;
    v4 = (os_log_s *)v2;
  }

  else
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v25 = 0;
    v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v3 = (uint8_t *)&v25;
  }

  _os_log_impl(&dword_182DAF000, v4, OS_LOG_TYPE_DEFAULT, "Powerd has requested assertion activity update", v3, 2u);
LABEL_7:
  if (gAssertionConnection)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      v6 = reply;
      uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
      xpc_dictionary_set_uint64(v6, "assertionCheckToken", uint64);
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionUpdateActivity_cold_6();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
      {
        processAssertionUpdateActivity_cold_5();
      }

      if (gAsyncAssertionActivityLog_2 && CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1))
      {
        v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v6, "assertionActivityLog", v8);
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v6);
        if (v8) {
          xpc_release(v8);
        }
      }

      else
      {
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v6);
      }

      xpc_release(v6);
      gAsyncAssertionActivityLog_2 = 0;
      gAsyncAssertionActivityLog_0 = 0;
      if (gAsyncAssertionActivityLog_1) {
        CFArrayRemoveAllValues((CFMutableArrayRef)gAsyncAssertionActivityLog_1);
      }
    }

    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        processAssertionUpdateActivity_cold_4();
      }
    }

    else
    {
      BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v17) {
        processAssertionUpdateActivity_cold_3(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processAssertionUpdateActivity_cold_2();
    }
  }

  else
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v9) {
      processAssertionUpdateActivity_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

void processCurrentActiveAssertions(void *a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v2 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = (os_log_s *)v2;
  }

  else
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = (os_log_s *)MEMORY[0x1895F8DA0];
  }

  _os_log_impl(&dword_182DAF000, v3, OS_LOG_TYPE_DEFAULT, "Powerd has requested active assertions update", buf, 2u);
LABEL_7:
  if (gAssertionConnection)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      v5 = reply;
      uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
      xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
      if (gActiveAssertionsDict && CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) >= 1)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
        v8 = 0LL;
        BOOL v9 = (os_log_s *)MEMORY[0x1895F8DA0];
        do
        {
          if (CFDictionaryGetValueIfPresent((CFDictionaryRef)gActiveAssertionsDict, v8, (const void **)buf))
          {
            uint64_t v10 = *(const void **)buf;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (v10 && CFGetTypeID(v10) == TypeID)
            {
              CFArrayAppendValue(Mutable, *(const void **)buf);
            }

            else
            {
              uint64_t v12 = (os_log_s *)assertions_log;
              if (assertions_log)
              {
                if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v33 = 67109120;
                  int v34 = (int)v8;
                  _os_log_error_impl(&dword_182DAF000, v12, OS_LOG_TYPE_ERROR, "Not a dictianary for 0x%x", v33, 8u);
                }
              }

              else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                processCurrentActiveAssertions_cold_5(v31, (int)v8, v32);
              }
            }
          }

          ++v8;
        }

        while (v8 != (char *)128);
        uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v5, "assertionUpdateActives", v13);
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        if (v13) {
          xpc_release(v13);
        }
        xpc_release(v5);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }

      else
      {
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        xpc_release(v5);
      }
    }

    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        processAssertionUpdateActivity_cold_4();
      }
    }

    else
    {
      BOOL v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v22) {
        processAssertionUpdateActivity_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }

  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processCurrentActiveAssertions_cold_2();
    }
  }

  else
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v14) {
      processCurrentActiveAssertions_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

void handleAssertionTimeout()
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  uint64_t MonotonicTime = getMonotonicTime();
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
      handleAssertionTimeout_cold_9();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
  {
    handleAssertionTimeout_cold_8();
  }

  uint64_t valuePtr = 0LL;
  if (CFArrayGetCount((CFArrayRef)gTimedAssertionsList) >= 1)
  {
    CFIndex v1 = 0LL;
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)gTimedAssertionsList, v1);
      Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"TimeoutTimeStamp");
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      v4 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"AsyncClientAssertionId");
      unsigned int v38 = 0;
      CFNumberGetValue(v4, kCFNumberSInt32Type, &v38);
      if (valuePtr > MonotonicTime)
      {
LABEL_42:
        while ((_DWORD)v1)
        {
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)gTimedAssertionsList, 0LL);
          LODWORD(v1) = v1 - 1;
        }

        goto LABEL_44;
      }

      if (!CFDictionaryContainsKey(ValueAtIndex, @"AsyncRemoteAssertionId")) {
        break;
      }
      v5 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"AsyncRemoteAssertionId");
      unsigned int v37 = 0;
      CFNumberGetValue(v5, kCFNumberIntType, &v37);
      unsigned int v6 = v37;
      if (v37 != gCurrentRemoteAssertion) {
        break;
      }
      uint64_t v7 = assertions_log;
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v43 = v6;
          v8 = (os_log_s *)v7;
LABEL_33:
          _os_log_impl( &dword_182DAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "Powerd knows about this assertion 0x%0x. let powerd time it out",  buf,  8u);
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v43 = v6;
        v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        goto LABEL_33;
      }

LABEL_36:
      if (CFArrayGetCount((CFArrayRef)gTimedAssertionsList) <= ++v1) {
        goto LABEL_42;
      }
    }

    uint64_t v9 = assertions_log;
    if (assertions_log)
    {
      if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v43 = v38;
      __int16 v44 = 2048;
      v45 = (const __CFDictionary *)valuePtr;
      uint64_t v10 = (os_log_s *)v9;
    }

    else
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v43 = v38;
      __int16 v44 = 2048;
      v45 = (const __CFDictionary *)valuePtr;
      uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    }

    _os_log_debug_impl( &dword_182DAF000,  v10,  OS_LOG_TYPE_DEBUG,  "Timeout: assertion id 0x%x with time %llu",  buf,  0x12u);
LABEL_18:
    logAsyncAssertionActivity(2u, v38);
    if (CFDictionaryContainsValue(ValueAtIndex, @"TimeoutAction")) {
      uint64_t v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"TimeoutAction");
    }
    else {
      uint64_t v11 = @"TimeoutActionTurnOff";
    }
    if (CFStringCompare(v11, @"TimeoutActionRelease", 0LL) == kCFCompareEqualTo)
    {
      if (_releaseAsycnAssertion(v38, 0, 0))
      {
        BOOL v14 = (os_log_s *)assertions_log;
        if (assertions_log)
        {
          if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v43 = v38;
            _os_log_error_impl( &dword_182DAF000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to release assertion 0x%x on timeout",  buf,  8u);
          }
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          handleAssertionTimeout_cold_7(v40, (int *)&v38, v41);
        }
      }

      goto LABEL_36;
    }

    uint64_t v12 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        unsigned int v43 = v38;
        __int16 v44 = 2112;
        v45 = ValueAtIndex;
        uint64_t v13 = (os_log_s *)v12;
LABEL_41:
        _os_log_debug_impl(&dword_182DAF000, v13, OS_LOG_TYPE_DEBUG, "Turning off assertion 0x%x: %@", buf, 0x12u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      unsigned int v43 = v38;
      __int16 v44 = 2112;
      v45 = ValueAtIndex;
      uint64_t v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      goto LABEL_41;
    }

    *(_DWORD *)buf = 0;
    uint64_t v15 = CFNumberCreate(allocator, kCFNumberSInt32Type, buf);
    handleAssertionLevel(v15, v38, 1);
    CFRelease(v15);
    goto LABEL_36;
  }

CFComparisonResult compare_assertion(const __CFDictionary *a1, const __CFDictionary *a2)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"TimeoutTimeStamp");
  v4 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimeoutTimeStamp");
  return CFNumberCompare(Value, v4, 0LL);
}

void __insertIntoTimedList_block_invoke_2()
{
  gAssertionTimer = 0LL;
}

uint64_t IOPMGetCurrentAsyncActiveAssertions()
{
  if (!gAssertionsDict) {
    return 0LL;
  }
  if (CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) <= 0) {
    return 0LL;
  }
  return gActiveAssertionsDict;
}

uint64_t IOPMGetCurrentAsyncReleasedAssertions()
{
  uint64_t result = gReleasedAssertionsList;
  if (gReleasedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gReleasedAssertionsList) <= 0) {
      return 0LL;
    }
    else {
      return gReleasedAssertionsList;
    }
  }

  return result;
}

uint64_t IOPMGetCurrentAsyncInactiveAssertions()
{
  uint64_t result = gInactiveAssertionsDict;
  if (gInactiveAssertionsDict)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)gInactiveAssertionsDict) <= 0) {
      return 0LL;
    }
    else {
      return gInactiveAssertionsDict;
    }
  }

  return result;
}

uint64_t IOPMGetCurrentAsyncTimedAssertions()
{
  uint64_t result = gTimedAssertionsList;
  if (gTimedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gTimedAssertionsList) <= 0) {
      return 0LL;
    }
    else {
      return gTimedAssertionsList;
    }
  }

  return result;
}

const void *IOPMGetCurrentAsycnRemoteAssertion()
{
  if (!gCurrentAssertion) {
    return 0LL;
  }
  uint64_t result = CFDictionaryGetValue( (CFDictionaryRef)gAssertionsDict,  (const void *)(((unint64_t)gCurrentAssertion >> 16) & 0x7FFF));
  if (!result) {
    return 0LL;
  }
  return result;
}

uint64_t IOPMCopyActiveAsyncAssertionsByProcess()
{
  return 0LL;
}

IOReturn IOPMAssertionCreate( CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, IOPMAssertionID *AssertionID)
{
  return IOPMAssertionCreateWithName( AssertionType,  AssertionLevel,  @"Nameless (via IOPMAssertionCreate)",  AssertionID);
}

IOReturn IOPMAssertionCreateWithName( CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  IOReturn v4 = -536870212;
  IOPMAssertionLevel valuePtr = AssertionLevel;
  if (AssertionType && AssertionName && AssertionID)
  {
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    CFTypeID TypeID = CFNumberGetTypeID();
    if (v8)
    {
      if (CFGetTypeID(v8) == TypeID)
      {
        Mutable = CFDictionaryCreateMutable(0LL, 3LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (Mutable)
        {
          uint64_t v11 = Mutable;
          CFDictionarySetValue(Mutable, @"AssertType", AssertionType);
          CFDictionarySetValue(v11, @"AssertName", AssertionName);
          CFDictionarySetValue(v11, @"AssertLevel", v8);
          CFRelease(v8);
          IOReturn v4 = IOPMAssertionCreateWithProperties(v11, AssertionID);
          CFRelease(v11);
        }
      }
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    IOReturn v4 = -536870206;
    if (v12) {
      IOPMAssertionCreateWithName_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  return v4;
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  mach_port_t v53 = 0;
  IOReturn v54 = -536870212;
  int v51 = -1;
  int v52 = 0;
  if (!AssertionProperties || !AssertionID)
  {
    BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v17) {
      IOPMAssertionCreateWithProperties_cold_6(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_15;
  }

  Value = CFDictionaryGetValue(AssertionProperties, @"AssertType");
  v5 = CFDictionaryGetValue(AssertionProperties, @"AssertName");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || (CFTypeID v7 = CFStringGetTypeID(), !v5) || CFGetTypeID(v5) != v7)
  {
    BOOL v25 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v25) {
      IOPMAssertionCreateWithProperties_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
    }
LABEL_15:
    uint64_t v16 = 0LL;
LABEL_16:
    IOReturn v54 = -536870206;
    goto LABEL_17;
  }

  if (pm_connect_init(&v53))
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v8) {
      IOPMAssertionCreateWithProperties_cold_5(v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_10:
    uint64_t v16 = 0LL;
    IOReturn v54 = -536870199;
    goto LABEL_17;
  }

  CFTypeID v34 = CFStringGetTypeID();
  if (CFGetTypeID(Value) == v34
    && CFEqual(Value, @"EnableIdleSleep")
    && !IOPMAssertionCreateWithProperties_resyncToken)
  {
    IOPMAssertionCreateWithProperties_resyncCopy = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, AssertionProperties);
    notify_register_dispatch( "com.apple.system.powermanagement.assertionresync",  &IOPMAssertionCreateWithProperties_resyncToken,  MEMORY[0x1895F8AE0],  &__block_literal_global_116);
  }

  uint64_t v35 = (const __CFNumber *)CFDictionaryGetValue(AssertionProperties, @"AssertLevel");
  CFTypeID v36 = CFNumberGetTypeID();
  if (v35 && CFGetTypeID(v35) == v36)
  {
    int valuePtr = 0;
    CFNumberGetValue(v35, kCFNumberIntType, &valuePtr);
    BOOL v37 = valuePtr != 0;
  }

  else
  {
    BOOL v37 = 1;
  }

  uint64_t v16 = 0LL;
  if (collectBackTrace && v37)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, AssertionProperties);
    if (!MutableCopy)
    {
      BOOL v47 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v47) {
        IOPMAssertionCreateWithProperties_cold_2(v47, v48, v49);
      }
      goto LABEL_10;
    }

    uint64_t v16 = MutableCopy;
    saveBackTrace(MutableCopy);
  }

  CFTypeID v39 = CFStringGetTypeID();
  if (CFGetTypeID(Value) == v39
    && (CFEqual(Value, @"PreventUserIdleSystemSleep")
     || CFEqual(Value, @"NoIdleSleepAssertion")
     || CFEqual(Value, @"SystemIsActive")))
  {
    if (!v16) {
      uint64_t v16 = CFDictionaryCreateMutableCopy(0LL, 0LL, AssertionProperties);
    }
    if (!CFDictionaryContainsKey(v16, @"AllowsDeviceRestart")) {
      CFDictionarySetValue(v16, @"AllowsDeviceRestart", (const void *)*MEMORY[0x189604DE8]);
    }
  }

  if (v16) {
    CFDictionaryRef v40 = v16;
  }
  else {
    CFDictionaryRef v40 = AssertionProperties;
  }
  CFDataRef Data = CFPropertyListCreateData(0LL, v40, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (!Data) {
    goto LABEL_16;
  }
  v42 = Data;
  if (createAsyncAssertion(v40, (uint64_t)AssertionID))
  {
    IOReturn v54 = 0;
    int v51 = 0x10000;
  }

  else
  {
    mach_port_t v44 = v53;
    BytePtr = CFDataGetBytePtr(v42);
    int Length = CFDataGetLength(v42);
    if (io_pm_assertion_create(v44, (uint64_t)BytePtr, Length, (int *)AssertionID, &v52, &v51, &v54))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        IOPMAssertionCreateWithProperties_cold_4();
      }
      IOReturn v54 = -536870199;
      goto LABEL_57;
    }

    if (v54 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      IOPMAssertionCreateWithProperties_cold_3();
    }
  }

  if (v51) {
    BOOL v43 = v37;
  }
  else {
    BOOL v43 = 0;
  }
  if (v43) {
    entr_act_begin();
  }
LABEL_57:
  CFRelease(v42);
LABEL_17:
  if (v53) {
    _pm_disconnect();
  }
  if (v16) {
    CFRelease(v16);
  }
  return v54;
}

IOReturn IOPMAssertionCreateWithDescription( CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  IOReturn result = -536870206;
  if (AssertionType && Name && AssertionID)
  {
    AssertionDescription = createAssertionDescription( AssertionType,  Name,  Details,  HumanReadableReason,  LocalizationBundlePath,  TimeoutAction,  Timeout);
    if (AssertionDescription)
    {
      uint64_t v12 = AssertionDescription;
      IOReturn v13 = IOPMAssertionCreateWithProperties(AssertionDescription, AssertionID);
      CFRelease(v12);
      return v13;
    }

    else
    {
      return -536870212;
    }
  }

  return result;
}

__CFDictionary *createAssertionDescription( const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, double a7)
{
  double valuePtr = a7;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  uint64_t v15 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"AssertName", a2);
    CFDictionarySetValue(v15, @"AssertType", a1);
    if (a3) {
      CFDictionarySetValue(v15, @"Details", a3);
    }
    if (a4) {
      CFDictionarySetValue(v15, @"HumanReadableReason", a4);
    }
    if (a5) {
      CFDictionarySetValue(v15, @"BundlePath", a5);
    }
    if (a7 != 0.0)
    {
      CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberDoubleType, &valuePtr);
      CFDictionarySetValue(v15, @"TimeoutSeconds", v16);
      CFRelease(v16);
    }

    if (a6) {
      CFDictionarySetValue(v15, @"TimeoutAction", a6);
    }
  }

  return v15;
}

uint64_t IOPMAssertionCreateWithAutoTimeout( const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, IOPMAssertionID *a7, double a8)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2 && a7)
  {
    AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a8);
    if (AssertionDescription)
    {
      uint64_t v12 = AssertionDescription;
      CFDictionarySetValue(AssertionDescription, @"AutoTimesout", (const void *)*MEMORY[0x189604DE8]);
      uint64_t v13 = IOPMAssertionCreateWithProperties(v12, a7);
      CFRelease(v12);
      return v13;
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t IOPMAssertionCreateWithResourceList( const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, IOPMAssertionID *a8, double a9)
{
  uint64_t v9 = 3758097090LL;
  if (a1)
  {
    if (a2)
    {
      if (a8)
      {
        CFTypeID TypeID = CFArrayGetTypeID();
        if (a7)
        {
          if (CFGetTypeID(a7) == TypeID)
          {
            AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a9);
            if (AssertionDescription)
            {
              uint64_t v21 = AssertionDescription;
              CFDictionarySetValue(AssertionDescription, @"ResourcesUsed", a7);
              uint64_t v22 = IOPMAssertionCreateWithProperties(v21, a8);
              CFRelease(v21);
              return v22;
            }

            return 3758097084LL;
          }
        }
      }
    }
  }

  return v9;
}

uint64_t pm_connect_init(_DWORD *a1)
{
  if (!pm_connect_init_collectBackTraceToken)
  {
    notify_register_dispatch( "com.apple.powermanagement.collectbt",  &pm_connect_init_collectBackTraceToken,  MEMORY[0x1895F8AE0],  &__block_literal_global_151);
    notify_get_state(pm_connect_init_collectBackTraceToken, (uint64_t *)&collectBackTrace);
  }

  return _pm_connect(a1);
}

uint64_t __IOPMAssertionCreateWithProperties_block_invoke()
{
  return IOPMAssertionCreateWithProperties((CFDictionaryRef)IOPMAssertionCreateWithProperties_resyncCopy, &AssertionID);
}

void saveBackTrace(__CFDictionary *a1)
{
  v9[8] = *(void **)MEMORY[0x1895F89C0];
  int v2 = backtrace(v9, 8);
  uint64_t v3 = backtrace_symbols(v9, v2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, v2, MEMORY[0x189605228]);
  v5 = Mutable;
  if (v3 && Mutable)
  {
    if (v2 >= 1)
    {
      for (CFIndex i = 0LL; i != v2; ++i)
      {
        CFStringRef v7 = CFStringCreateWithCString(0LL, v3[i], 0);
        if (v7)
        {
          CFStringRef v8 = v7;
          CFArrayInsertValueAtIndex(v5, i, v7);
          CFRelease(v8);
        }

        else
        {
          CFArrayInsertValueAtIndex(v5, i, @" ");
        }
      }
    }

    CFDictionarySetValue(a1, @"CreatorBacktrace", v5);
  }

  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    free(v3);
  }
}

uint64_t IOPMPerformBlockWithAssertion(CFDictionaryRef AssertionProperties, uint64_t a2)
{
  IOPMAssertionID AssertionID = 0;
  uint64_t result = 3758097090LL;
  if (AssertionProperties)
  {
    if (a2)
    {
      uint64_t result = IOPMAssertionCreateWithProperties(AssertionProperties, &AssertionID);
      if (!(_DWORD)result)
      {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
        uint64_t result = AssertionID;
        if (AssertionID)
        {
          IOPMAssertionRelease(AssertionID);
          return 0LL;
        }
      }
    }
  }

  return result;
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  IOReturn v1 = -536870199;
  IOReturn v7 = -536870212;
  mach_port_t v6 = 0;
  uint64_t v5 = 0LL;
  int v4 = 0;
  if (!AssertionID) {
    return -536870206;
  }
  if (AssertionID >= 0x10000 && gAssertionsDict) {
    return releaseAsyncAssertion(AssertionID);
  }
  if (!pm_connect_init(&v6))
  {
    if (v4) {
      entr_act_modify();
    }
    else {
      entr_act_end();
    }
    _pm_disconnect();
    return v7;
  }

  return v1;
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
  int v13 = -536870212;
  mach_port_t v12 = 0;
  uint64_t v11 = 0LL;
  int v10 = 0;
  if (theAssertion)
  {
    if (theAssertion >= 0x10000 && gAssertionsDict)
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMAssertionRetain_cold_2();
        }
      }

      else
      {
        BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v2) {
          IOPMAssertionRetain_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
        }
      }

      goto LABEL_3;
    }

    if (io_pm_assertion_retain_release(v12, theAssertion, 1, &v10, (_DWORD *)&v11 + 1, &v11, &v13))
    {
LABEL_3:
      int v13 = -536870199;
      goto LABEL_5;
    }

    entr_act_modify();
  }

  else
  {
    int v13 = -536870206;
  }

LABEL_5:
  if (v12) {
    _pm_disconnect();
  }
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  mach_port_t v20 = 0;
  uint64_t v19 = 0LL;
  int v18 = -1;
  if (!theAssertion)
  {
    int v6 = -536870206;
    goto LABEL_6;
  }

  if (theAssertion >= 0x10000 && gAssertionsDict)
  {
    IOReturn v21 = setAsyncAssertionProperties((uint64_t)theProperty, (uint64_t)theValue, *(uint64_t *)&theAssertion);
    goto LABEL_8;
  }

  IOReturn v21 = pm_connect_init(&v20);
  if (!v21)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (Mutable)
    {
      uint64_t v9 = Mutable;
      CFDictionarySetValue(Mutable, theProperty, theValue);
      if (CFStringCompare(theProperty, @"AssertLevel", 0LL) == kCFCompareEqualTo
        && (CFTypeID TypeID = CFNumberGetTypeID(), theValue)
        && CFGetTypeID(theValue) == TypeID)
      {
        int valuePtr = 0;
        CFNumberGetValue((CFNumberRef)theValue, kCFNumberIntType, &valuePtr);
        BOOL v10 = valuePtr == 0;
        BOOL v11 = valuePtr == 255;
        if (valuePtr == 255 && collectBackTrace)
        {
          saveBackTrace(v9);
          BOOL v10 = 0;
          BOOL v11 = 1;
        }
      }

      else
      {
        BOOL v10 = 0;
        BOOL v11 = 0;
      }

      CFDataRef Data = CFPropertyListCreateData(0LL, v9, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
      CFRelease(v9);
      mach_port_t v13 = v20;
      BytePtr = CFDataGetBytePtr(Data);
      int Length = CFDataGetLength(Data);
      if (io_pm_assertion_set_properties( v13,  theAssertion,  (uint64_t)BytePtr,  Length,  (int *)&v19 + 1,  &v19,  &v18,  &v21))
      {
        IOReturn v21 = -536870199;
      }

      else if (v18)
      {
        if (v11)
        {
          entr_act_begin();
        }

        else if (v10)
        {
          entr_act_end();
        }
      }

      if (Data) {
        CFRelease(Data);
      }
      goto LABEL_8;
    }

    int v6 = -536870211;
LABEL_6:
    IOReturn v21 = v6;
  }

uint64_t IOPMAssertionSetProcessState(int a1, unsigned int a2)
{
  uint64_t v4 = 3758097084LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", global_queue, 0LL);
  if (mach_service)
  {
    uint64_t v7 = mach_service;
    xpc_connection_set_target_queue(mach_service, global_queue);
    xpc_connection_set_event_handler(v7, &__block_literal_global_122);
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        IOPMAssertionSetProcessState_cold_2();
      }
      xpc_dictionary_set_uint64(v9, "pid", a1);
      xpc_dictionary_set_uint64(v9, "assertionSetState", a2);
      xpc_connection_resume(v7);
      xpc_connection_send_message(v7, v9);
      xpc_release(v9);
      xpc_release(v7);
      return 0LL;
    }

    else
    {
      xpc_release(v7);
      BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v10) {
        sendAsyncReleaseMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }

  return v4;
}

uint64_t IOPMAssertionSetTimeout(IOPMAssertionID a1, double a2)
{
  int valuePtr = (int)a2;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (!v3) {
    return 3758097084LL;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOPMAssertionSetProperty(a1, @"TimeoutSeconds", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOPMAssertionDeclareNotificationEvent(const __CFString *a1, IOPMAssertionID *a2, CFTimeInterval a3)
{
  uint64_t v6 = 3758097097LL;
  IOPMAssertionID AssertionID = 0;
  io_registry_entry_t PMRootDomainRef = getPMRootDomainRef();
  if (!PMRootDomainRef) {
    return v6;
  }
  io_registry_entry_t v8 = PMRootDomainRef;
  uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( PMRootDomainRef,  @"DesktopMode",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  CFTypeRef v11 = IORegistryEntryCreateCFProperty(v8, @"AppleClamshellState", v9, 0);
  uint64_t v12 = v11;
  if ((CFTypeRef)*MEMORY[0x189604DE8] != v11 || *MEMORY[0x189604DE0] != (void)CFProperty)
  {
    uint64_t v6 = IOPMAssertionCreateWithDescription( @"DisplayWake",  a1,  0LL,  0LL,  0LL,  a3,  @"TimeoutActionRelease",  &AssertionID);
    if (a2) {
      *a2 = AssertionID;
    }
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v6 = 3758097112LL;
  if (v11) {
LABEL_9:
  }
    CFRelease(v12);
LABEL_10:
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v6;
}

uint64_t IOPMAssertionDeclareSystemActivityWithProperties(const __CFDictionary *a1, int *a2, int *a3)
{
  mach_port_t v16 = 0;
  unsigned int v17 = -536870212;
  if (!a1 || !a2 || !a3) {
    goto LABEL_16;
  }
  if (pm_connect_init(&v16))
  {
    unsigned int v17 = -536870199;
    goto LABEL_17;
  }

  Value = CFDictionaryGetValue(a1, @"AssertName");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value) {
    goto LABEL_16;
  }
  if (CFGetTypeID(Value) != TypeID) {
    goto LABEL_16;
  }
  io_registry_entry_t v8 = CFDictionaryGetValue(a1, @"AssertType");
  CFTypeID v9 = CFStringGetTypeID();
  if (v8)
  {
    if (CFGetTypeID(v8) == v9) {
      goto LABEL_16;
    }
  }

  if (collectBackTrace) {
    saveBackTrace(a1);
  }
  CFDataRef Data = CFPropertyListCreateData(0LL, a1, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (Data)
  {
    CFTypeRef v11 = Data;
    mach_port_t v12 = v16;
    BytePtr = CFDataGetBytePtr(Data);
    int Length = CFDataGetLength(v11);
    CFRelease(v11);
  }

  else
  {
LABEL_16:
    unsigned int v17 = -536870206;
  }

uint64_t IOPMAssertionDeclareSystemActivity(const void *a1, int *a2, int *a3)
{
  uint64_t v3 = 3758097090LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        CFDictionarySetValue(Mutable, @"AssertName", a1);
        uint64_t v3 = IOPMAssertionDeclareSystemActivityWithProperties(Mutable, a2, a3);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
    }
  }

  return v3;
}

IOReturn IOPMAssertionDeclareUserActivity( CFStringRef AssertionName, IOPMUserActiveType userType, IOPMAssertionID *AssertionID)
{
  mach_port_t v14 = 0;
  IOReturn v15 = -536870212;
  int v13 = 0;
  if (!AssertionName || !AssertionID)
  {
    IOReturn v15 = -536870206;
    goto LABEL_6;
  }

  if (pm_connect_init(&v14))
  {
    IOReturn v15 = -536870199;
    goto LABEL_6;
  }

  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionarySetValue(Mutable, @"AssertName", AssertionName);
  if (collectBackTrace) {
    saveBackTrace(Mutable);
  }
  CFDataRef Data = CFPropertyListCreateData(0LL, Mutable, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (!Data)
  {
    IOReturn v15 = -536870206;
    if (!Mutable) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }

  CFTypeID v9 = Data;
  mach_port_t v10 = v14;
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(v9);
  CFRelease(v9);
  if (Mutable) {
LABEL_17:
  }
    CFRelease(Mutable);
LABEL_6:
  if (v14) {
    _pm_disconnect();
  }
  return v15;
}

IOReturn IOPMDeclareNetworkClientActivity(CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  mach_port_t v12 = 0;
  IOReturn v13 = -536870212;
  int v11 = 0;
  if (!AssertionName || !AssertionID)
  {
    IOReturn v13 = -536870206;
    goto LABEL_6;
  }

  if (pm_connect_init(&v12))
  {
    IOReturn v13 = -536870199;
    goto LABEL_6;
  }

  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionarySetValue(Mutable, @"AssertName", AssertionName);
  if (collectBackTrace) {
    saveBackTrace(Mutable);
  }
  CFDataRef Data = CFPropertyListCreateData(0LL, Mutable, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (!Data)
  {
    IOReturn v13 = -536870206;
    if (!Mutable) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }

  uint64_t v7 = Data;
  mach_port_t v8 = v12;
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(v7);
  CFRelease(v7);
  if (Mutable) {
LABEL_17:
  }
    CFRelease(Mutable);
LABEL_6:
  if (v12) {
    _pm_disconnect();
  }
  return v13;
}

uint64_t IOPMSetReservePowerMode(int a1)
{
  uint64_t v4 = 0LL;
  uint64_t result = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      unsigned int v3 = io_pm_set_value_int(HIDWORD(v4), 9u, a1, &v4);
      _pm_disconnect();
      if ((_DWORD)v4) {
        return v4;
      }
      else {
        return v3;
      }
    }

    else
    {
      return 3758097112LL;
    }
  }

  return result;
}

uint64_t IOPMCopyAssertionsByProcessWithAllocator(CFDictionaryRef *a1, const __CFAllocator *a2)
{
  return _copyAssertionsByProcess(2, a1, a2);
}

uint64_t _copyAssertionsByProcess(int a1, CFDictionaryRef *a2, const __CFAllocator *a3)
{
  uint64_t v3 = 3758097090LL;
  CFTypeRef cf = 0LL;
  if (a2 && (a1 == 7 || a1 == 2))
  {
    uint64_t v3 = _copyPMServerObject(a1, 0, 0LL, &cf);
    uint64_t v6 = (const __CFArray *)cf;
    if (!(_DWORD)v3)
    {
      if (!cf) {
        return 0LL;
      }
      int Count = CFArrayGetCount((CFArrayRef)cf);
      int v8 = Count;
      if (!Count)
      {
        uint64_t v3 = 0LL;
        goto LABEL_6;
      }

      CFTypeID v9 = (const void **)malloc(8LL * Count);
      mach_port_t v10 = malloc(8LL * v8);
      uint64_t v3 = (uint64_t)v10;
      if (v9 && v10)
      {
        if (v8 >= 1)
        {
          for (CFIndex i = 0LL; i != v8; ++i)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, i);
            if (ValueAtIndex)
            {
              IOReturn v13 = ValueAtIndex;
              v9[i] = CFDictionaryGetValue(ValueAtIndex, @"AssertPID");
              *(void *)(v3 + 8 * i) = CFDictionaryGetValue(v13, @"PerTaskAssertions");
            }
          }
        }

        *a2 = CFDictionaryCreate(a3, v9, (const void **)v3, v8, MEMORY[0x189605240], MEMORY[0x189605250]);
      }

      if (v9) {
        free(v9);
      }
      if (v3)
      {
        free((void *)v3);
        uint64_t v3 = 0LL;
      }
    }

    if (v6) {
LABEL_6:
    }
      CFRelease(v6);
  }

  return v3;
}

IOReturn IOPMCopyAssertionsByProcess(CFDictionaryRef *AssertionsByPID)
{
  return _copyAssertionsByProcess(2, AssertionsByPID, (const __CFAllocator *)*MEMORY[0x189604DB0]);
}

uint64_t IOPMCopyAssertionsByType(const __CFData *a1, CFPropertyListRef *a2)
{
  if (a2) {
    return _copyPMServerObject(6, 0, a1, a2);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t _copyPMServerObject(int a1, int a2, const __CFData *a3, CFPropertyListRef *a4)
{
  mach_port_t v16 = 0;
  memset(length, 0, sizeof(length));
  *a4 = 0LL;
  int v17 = pm_connect_init(&v16);
  if (v17) {
    return 3758097136LL;
  }
  if (a3 && (CFDataRef Data = CFPropertyListCreateData(0LL, a3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL), (a3 = Data) != 0LL))
  {
    BytePtr = CFDataGetBytePtr(Data);
    int v11 = CFDataGetLength(a3);
  }

  else
  {
    BytePtr = 0LL;
    int v11 = 0;
  }

  int v12 = io_pm_assertion_copy_details(v16, a2, a1, (uint64_t)BytePtr, v11, &length[1], length, &v17);
  if (!(v12 | v17))
  {
    IOReturn v13 = CFDataCreate(0LL, *(const UInt8 **)&length[1], length[0]);
    if (v13)
    {
      mach_port_t v14 = v13;
      *a4 = CFPropertyListCreateWithData(0LL, v13, 0LL, 0LL, 0LL);
      CFRelease(v14);
    }

    if (*(void *)&length[1] && length[0]) {
      mach_vm_deallocate(*MEMORY[0x1895FBBE0], *(mach_vm_address_t *)&length[1], length[0]);
    }
  }

  if (a3) {
    CFRelease(a3);
  }
  uint64_t result = v16;
  if (v16)
  {
    _pm_disconnect();
    return 0LL;
  }

  return result;
}

uint64_t IOPMCopyInactiveAssertionsByProcess(CFDictionaryRef *a1)
{
  return _copyAssertionsByProcess(7, a1, (const __CFAllocator *)*MEMORY[0x189604DB0]);
}

CFDictionaryRef IOPMAssertionCopyProperties(IOPMAssertionID theAssertion)
{
  BOOL v2 = 0LL;
  _copyPMServerObject(1, theAssertion, 0LL, (CFPropertyListRef *)&v2);
  return v2;
}

IOReturn IOPMCopyAssertionsStatus(CFDictionaryRef *AssertionsStatus)
{
  if (AssertionsStatus) {
    return _copyPMServerObject(3, 0, 0LL, (CFPropertyListRef *)AssertionsStatus);
  }
  else {
    return -536870206;
  }
}

uint64_t IOPMCopyDeviceRestartPreventers(__CFArray **a1)
{
  uint64_t v2 = 0LL;
  CFMutableArrayRef Mutable = 0LL;
  char v4 = 1;
  uint64_t v5 = (const CFArrayCallBacks *)MEMORY[0x189605228];
  while (1)
  {
    char v6 = v4;
    CFArrayRef theArray = 0LL;
    uint64_t result = _copyPMServerObject(6, 0, (const __CFData *)off_189C50640[v2], (CFPropertyListRef *)&theArray);
    if ((_DWORD)result) {
      break;
    }
    int v8 = theArray;
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        for (CFIndex i = 0LL; i < CFArrayGetCount(v8); ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
          Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, @"AllowsDeviceRestart");
          if (!Value || !CFBooleanGetValue(Value))
          {
            if (!Mutable)
            {
              CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, v5);
              if (!Mutable)
              {
                CFRelease(v8);
                goto LABEL_16;
              }
            }

            CFArrayAppendValue(Mutable, ValueAtIndex);
          }
        }
      }

      CFRelease(v8);
    }

    char v4 = 0;
    uint64_t v2 = 1LL;
    if ((v6 & 1) == 0)
    {
LABEL_16:
      uint64_t result = 0LL;
      break;
    }
  }

  *a1 = Mutable;
  return result;
}

uint64_t IOPMCopyAssertionActivityLogWithAllocator(CFPropertyListRef *a1, BOOL *a2, const __CFAllocator *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, &IOPMCopyAssertionActivityLogWithAllocator_refCnt, a3);
}

uint64_t IOPMCopyAssertionActivityUpdateWithAllocator( CFPropertyListRef *a1, BOOL *a2, _DWORD *a3, const __CFAllocator *a4)
{
  unsigned int v15 = -536870199;
  CFIndex length = 0LL;
  bytes = 0LL;
  *a1 = 0LL;
  _pm_connect((_DWORD *)&length + 1);
  uint64_t result = HIDWORD(length);
  if (HIDWORD(length))
  {
    else {
      BOOL v9 = v15 == 0;
    }
    if (v9 && (_DWORD)length != 0)
    {
      int v11 = CFDataCreateWithBytesNoCopy(0LL, bytes, length, (CFAllocatorRef)*MEMORY[0x189604DC8]);
      if (v11)
      {
        int v12 = v11;
        *a1 = CFPropertyListCreateWithData(a4, v11, 1uLL, 0LL, 0LL);
        CFRelease(v12);
      }

      if (a2) {
        *a2 = v16 != 0;
      }
    }

    if (bytes && (_DWORD)length) {
      mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)bytes, length);
    }
    if (HIDWORD(length)) {
      _pm_disconnect();
    }
    return v15;
  }

  return result;
}

uint64_t IOPMCopyAssertionActivityLog(CFPropertyListRef *a1, BOOL *a2)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator( a1,  a2,  IOPMCopyAssertionActivityLog_refCnt,  (const __CFAllocator *)*MEMORY[0x189604DB0]);
}

uint64_t IOPMCopyAssertionActivityUpdate(CFPropertyListRef *a1, BOOL *a2, _DWORD *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, a3, (const __CFAllocator *)*MEMORY[0x189604DB0]);
}

uint64_t IOPMCopyAssertionActivityUpdateWithCallback(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 3758097084LL;
  uint64_t result = 3758097090LL;
  if (a1 && a2 && a3)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1895F8AE0], 0LL);
    if (mach_service)
    {
      BOOL v9 = mach_service;
      PMQueue = (dispatch_queue_s *)getPMQueue();
      xpc_connection_set_target_queue(v9, PMQueue);
      xpc_connection_set_event_handler(v9, &__block_literal_global_132);
      xpc_connection_resume(v9);
      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v11)
      {
        int v12 = v11;
        xpc_dictionary_set_BOOL(v11, "assertionCopyActivityUpdate", 1);
        xpc_dictionary_set_uint64(v12, "assertionActivityUpdateRefCnt", *a1);
        IOReturn v13 = (dispatch_queue_s *)getPMQueue();
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 0x40000000LL;
        v30[2] = __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135;
        v30[3] = &unk_189C506C0;
        v30[4] = a3;
        v30[5] = a1;
        v30[6] = a2;
        v30[7] = v9;
        xpc_connection_send_message_with_reply(v9, v12, v13, v30);
        xpc_release(v12);
        uint64_t v4 = 0LL;
      }

      else if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMCopyAssertionActivityUpdateWithCallback_cold_4();
        }
      }

      else
      {
        BOOL v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v22) {
          IOPMCopyAssertionActivityUpdateWithCallback_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }

      xpc_release(v9);
      return v4;
    }

    else
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMCopyAssertionActivityUpdateWithCallback_cold_2();
        }
      }

      else
      {
        BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v14) {
          IOPSGaugingMitigationGetState_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }

      return 3758097084LL;
    }
  }

  return result;
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135(uint64_t a1, void *a2)
{
  if (MEMORY[0x186E19334](a2) == MEMORY[0x1895F9250])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "assertionActivityUpdateData");
    int uint64 = xpc_dictionary_get_uint64(a2, "assertionActivityUpdateRefCnt");
    BOOL v6 = xpc_dictionary_get_BOOL(a2, "assertionActivityUpdateOverflow");
    xpc_object_t v7 = xpc_dictionary_get_value(a2, "assertionActivityUpdateProcessList");
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
      {
        __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_4();
        if (!value)
        {
LABEL_16:
          if (assertions_log)
          {
            if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_2();
            }
          }

          else
          {
            BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
            if (v18) {
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_1( v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25);
            }
          }

          uint64_t v16 = 0LL;
          if (!v7) {
            goto LABEL_22;
          }
          goto LABEL_14;
        }

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_138(void *a1)
{
  uint64_t v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t IOPMSetAssertionActivityLog(int a1)
{
  uint64_t v4 = 0LL;
  uint64_t v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)v2)
  {
    if (HIDWORD(v4))
    {
      uint64_t v2 = io_pm_set_value_int(HIDWORD(v4), 7u, a1, &v4);
      _pm_disconnect();
    }

    else
    {
      return 3758097112LL;
    }
  }

  return v2;
}

uint64_t IOPMSetAssertionActivityAggregate(int a1)
{
  uint64_t v4 = 0LL;
  uint64_t v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)v2)
  {
    if (HIDWORD(v4))
    {
      uint64_t v2 = io_pm_set_value_int(HIDWORD(v4), 8u, a1, &v4);
      _pm_disconnect();
    }

    else
    {
      return 3758097112LL;
    }
  }

  return v2;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregateWithAllocator(const __CFAllocator *a1)
{
  int v9 = -536870199;
  mach_port_t v8 = 0;
  memset(length, 0, sizeof(length));
  _pm_connect(&v8);
  if (!v8) {
    return 0LL;
  }
  int v2 = io_pm_assertion_activity_aggregate(v8, &length[1], length, &v9);
  if (v2 | v9
    || (uint64_t v3 = CFDataCreateWithBytesNoCopy( 0LL,  *(const UInt8 **)&length[1],  length[0],  (CFAllocatorRef)*MEMORY[0x189604DC8])) == 0LL)
  {
    CFPropertyListRef v5 = 0LL;
  }

  else
  {
    uint64_t v4 = v3;
    CFPropertyListRef v5 = CFPropertyListCreateWithData(a1, v3, 1uLL, 0LL, 0LL);
    CFRelease(v4);
  }

  if (*(void *)&length[1] && length[0]) {
    mach_vm_deallocate(*MEMORY[0x1895FBBE0], *(mach_vm_address_t *)&length[1], length[0]);
  }
  if (v8) {
    _pm_disconnect();
  }
  return v5;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregate()
{
  return IOPMCopyAssertionActivityAggregateWithAllocator((const __CFAllocator *)*MEMORY[0x189604DB0]);
}

uint64_t IOPMAssertionSetBTCollection(unsigned int a1)
{
  int out_token = 0;
  notify_register_check("com.apple.powermanagement.collectbt", &out_token);
  notify_set_state(out_token, a1);
  notify_post("com.apple.powermanagement.collectbt");
  return notify_cancel(out_token);
}

uint64_t IOPMSetAssertionExceptionLimits(const void *a1)
{
  uint64_t v2 = 3758097090LL;
  mach_port_t v10 = 0;
  unsigned int v11 = -536870212;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    if (pm_connect_init(&v10))
    {
      unsigned int v11 = -536870199;
    }

    else
    {
      CFDataRef Data = CFPropertyListCreateData(0LL, a1, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
      if (Data)
      {
        CFPropertyListRef v5 = Data;
        mach_port_t v6 = v10;
        BytePtr = CFDataGetBytePtr(Data);
        int Length = CFDataGetLength(v5);
        CFRelease(v5);
      }

      else
      {
        unsigned int v11 = -536870206;
      }
    }

    if (v10) {
      _pm_disconnect();
    }
    return v11;
  }

  return v2;
}

void *IOPMScheduleAssertionExceptionNotification(dispatch_queue_s *a1, uint64_t a2)
{
  uint64_t v4 = calloc(1uLL, 4uLL);
  if (v4)
  {
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __IOPMScheduleAssertionExceptionNotification_block_invoke;
    handler[3] = &unk_189C506E8;
    handler[4] = a2;
    if (notify_register_dispatch("com.apple.powermanagement.assertionexception", (int *)v4, a1, handler))
    {
      free(v4);
      return 0LL;
    }
  }

  return v4;
}

uint64_t __IOPMScheduleAssertionExceptionNotification_block_invoke(uint64_t a1, int token)
{
  uint64_t result = notify_get_state(token, &state64);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return result;
}

void IOPMUnregisterExceptionNotification(int *a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2) {
      notify_cancel(v2);
    }
    *a1 = 0;
    free(a1);
  }

uint64_t __pm_connect_init_block_invoke(int a1, int token)
{
  return notify_get_state(token, (uint64_t *)&collectBackTrace);
}

void OUTLINED_FUNCTION_3_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_5_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_11_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_12_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_14(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_17(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_25(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_28(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t __IOHIDPlugInInstanceRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t __IOHIDPlugInInstanceRelease(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2);
}

uint64_t _IOHIDLoadBundles()
{
  if (_IOHIDLoadBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadBundles_onceToken, &__block_literal_global_16);
  }
  return __hidPlugInBundles;
}

__CFArray *__IOHIDPlugInLoadBundles(const __CFArray *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (CFArrayGetCount(a1) >= 1)
  {
    CFIndex v4 = 0LL;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      mach_port_t v6 = CFStringCreateWithFormat(0LL, 0LL, @"%@%@", &stru_189C527D8, ValueAtIndex);
      xpc_object_t v7 = CFURLCreateWithFileSystemPath(v2, v6, kCFURLPOSIXPathStyle, 1u);
      CFArrayRef BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(v2, v7, @"plugin");
      if (BundlesFromDirectory)
      {
        int v9 = BundlesFromDirectory;
        mach_port_t v10 = (os_log_s *)_IOHIDLogCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          CFIndex Count = CFArrayGetCount(v9);
          *(_DWORD *)buf = 134218498;
          CFIndex v14 = Count;
          __int16 v15 = 2112;
          uint64_t v16 = v6;
          __int16 v17 = 2112;
          BOOL v18 = v9;
          _os_log_impl(&dword_182DAF000, v10, OS_LOG_TYPE_DEFAULT, "Loaded %ld HID plugins (%@) %@", buf, 0x20u);
        }

        v20.CFIndex length = CFArrayGetCount(v9);
        v20.location = 0LL;
        CFArrayAppendArray(Mutable, v9, v20);
        CFRelease(v9);
      }

      CFRelease(v6);
      CFRelease(v7);
      ++v4;
    }

    while (v4 < CFArrayGetCount(a1));
  }

  CFRelease(&stru_189C527D8);
  return Mutable;
}

uint64_t _IOHIDLoadSessionFilterBundles()
{
  if (_IOHIDLoadSessionFilterBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadSessionFilterBundles_onceToken, &__block_literal_global_9_0);
  }
  return __hidSessionFilterBundles;
}

uint64_t _IOHIDLoadServiceFilterBundles()
{
  if (_IOHIDLoadServiceFilterBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadServiceFilterBundles_onceToken, &__block_literal_global_20_0);
  }
  return __hidServiceFilterBundles;
}

uint64_t _IOHIDLoadServicePluginBundles()
{
  if (_IOHIDLoadServicePluginBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadServicePluginBundles_onceToken, &__block_literal_global_31);
  }
  return __hidServicePluginBundles;
}

uint64_t _IOHIDLoadConnectionPluginBundles()
{
  if (_IOHIDLoadConnectionPluginBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadConnectionPluginBundles_onceToken, &__block_literal_global_40);
  }
  return __hidConnectionPluginBundles;
}

void _IOHIDPlugInInstanceCacheAdd(void *key, const void *a2)
{
  if (a2 && key && __hidPlugInInstanceCache && !CFDictionaryContainsKey((CFDictionaryRef)__hidPlugInInstanceCache, key))
  {
    CFIndex v4 = (__CFDictionary *)__hidPlugInInstanceCache;
    (*(void (**)(const void *))(*(void *)a2 + 16LL))(a2);
    CFDictionarySetValue(v4, key, a2);
  }

uint64_t __IOHIDPlugInInstanceCacheApplier(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2);
}

void _IOHIDPlugInInstanceCacheClear()
{
  if (__hidPlugInInstanceCache)
  {
    CFDictionaryApplyFunction( (CFDictionaryRef)__hidPlugInInstanceCache,  (CFDictionaryApplierFunction)__IOHIDPlugInInstanceCacheApplier,  0LL);
    CFDictionaryRemoveAllValues((CFMutableDictionaryRef)__hidPlugInInstanceCache);
  }

BOOL _IOHIDPlugInInstanceCacheIsEmpty()
{
  return !__hidPlugInInstanceCache || CFDictionaryGetCount((CFDictionaryRef)__hidPlugInInstanceCache) == 0;
}

uint64_t IODPControllerGetTypeID()
{
  uint64_t result = __kIODPControllerTypeID;
  if (!__kIODPControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
    return __kIODPControllerTypeID;
  }

  return result;
}

uint64_t __IODPControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IODPControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPController",  (uint64_t (*)(void, uint64_t))IODPControllerCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IODPControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPController",  (uint64_t (*)(void, uint64_t))IODPControllerCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IODPControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIODPControllerTypeID) {
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*(_DWORD *)(v5 + 16), *MEMORY[0x1895FBBE0], 0x44504354u, (io_connect_t *)(v5 + 20)))
    {
      mach_port_t v6 = IOAVControllerCreateWithService(a1, a2);
      *(void *)(v5 + 24) = v6;
      if (v6)
      {
        CFTypeRef v7 = IOAVControllerCopyProperty((uint64_t)v6, @"Location");
        if (v7)
        {
          mach_port_t v8 = v7;
          if (CFEqual(v7, @"Embedded")) {
            *(_DWORD *)(v5 + 32) = 1;
          }
          CFRelease(v8);
        }

        int v9 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MinLaneCount");
        if (v9)
        {
          mach_port_t v10 = v9;
          CFTypeID TypeID = CFNumberGetTypeID();
          if (TypeID == CFGetTypeID(v10)) {
            CFNumberGetValue(v10, kCFNumberIntType, (void *)(v5 + 40));
          }
          CFRelease(v10);
        }

        uint64_t v12 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MaxLaneCount");
        if (v12)
        {
          uint64_t v13 = v12;
          CFTypeID v14 = CFNumberGetTypeID();
          if (v14 == CFGetTypeID(v13)) {
            CFNumberGetValue(v13, kCFNumberIntType, (void *)(v5 + 44));
          }
          CFRelease(v13);
        }

        __int16 v15 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MinLinkRate");
        if (v15)
        {
          uint64_t v16 = v15;
          CFTypeID v17 = CFNumberGetTypeID();
          if (v17 == CFGetTypeID(v16))
          {
            CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
            *(_BYTE *)(v5 + 36) = valuePtr;
          }

          CFRelease(v16);
        }

        BOOL v18 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MaxLinkRate");
        if (v18)
        {
          uint64_t v19 = v18;
          CFTypeID v20 = CFNumberGetTypeID();
          if (v20 == CFGetTypeID(v19))
          {
            CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
            *(_BYTE *)(v5 + 37) = valuePtr;
          }

          CFRelease(v19);
        }
      }

      return v5;
    }

    CFRelease((CFTypeRef)v5);
    return 0LL;
  }

  return v5;
}

uint64_t IODPControllerGetAVController(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPControllerSetScramblingInhibited(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerSetSupportsEnhancedMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 1u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerSetSupportsDownspread(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerSetLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerGetMinLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPControllerSetMinLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (!(_DWORD)result) {
    *(_DWORD *)(a1 + 40) = a2;
  }
  return result;
}

uint64_t IODPControllerGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPControllerSetMaxLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 5u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (!(_DWORD)result) {
    *(_DWORD *)(a1 + 44) = a2;
  }
  return result;
}

uint64_t IODPControllerSetLinkRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerGetMinLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 36);
}

uint64_t IODPControllerSetMinLinkRate(uint64_t a1, unsigned int a2)
{
  char v2 = a2;
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 7u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (!(_DWORD)result) {
    *(_BYTE *)(a1 + 36) = v2;
  }
  return result;
}

uint64_t IODPControllerGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 37);
}

uint64_t IODPControllerSetMaxLinkRate(uint64_t a1, unsigned int a2)
{
  char v2 = a2;
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 8u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (!(_DWORD)result) {
    *(_BYTE *)(a1 + 37) = v2;
  }
  return result;
}

uint64_t IODPControllerSetDriveSettings(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerSetQualityPattern(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 9u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPControllerSetSecureAuxFilter(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t __IODPControllerFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result) {
    return IOObjectRelease(result);
  }
  return result;
}

uint64_t IODPDeviceGetTypeID()
{
  uint64_t result = __kIODPDeviceTypeID;
  if (!__kIODPDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
    return __kIODPDeviceTypeID;
  }

  return result;
}

uint64_t __IODPDeviceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t IODPDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPDevice",  (uint64_t (*)(void, uint64_t))IODPDeviceCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IODPDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPDevice",  (uint64_t (*)(void, uint64_t))IODPDeviceCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

_OWORD *IODPDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIODPDeviceTypeID) {
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1895FBBE0], 0x44504456u, (io_connect_t *)v5 + 5))
    {
      mach_port_t v6 = IOAVDeviceCreateWithService(a1, *((_DWORD *)v5 + 4));
      *((void *)v5 + 3) = v6;
      if (v6)
      {
        CFTypeRef v7 = IOAVDeviceCopyProperty((uint64_t)v6, @"Location");
        if (v7)
        {
          mach_port_t v8 = v7;
          if (CFEqual(v7, @"Embedded")) {
            *((_DWORD *)v5 + 8) = 1;
          }
          CFRelease(v8);
        }

        int v9 = (const __CFDictionary *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"Revision");
        if (v9)
        {
          mach_port_t v10 = v9;
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"Major");
          if (Value) {
            CFNumberGetValue(Value, kCFNumberIntType, (char *)v5 + 36);
          }
          uint64_t v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Minor");
          if (v12) {
            CFNumberGetValue(v12, kCFNumberIntType, (char *)v5 + 40);
          }
          CFRelease(v10);
        }

        uint64_t v13 = (const __CFNumber *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"MaxLaneCount");
        if (v13)
        {
          CFTypeID v14 = v13;
          CFNumberGetValue(v13, kCFNumberIntType, (char *)v5 + 44);
          CFRelease(v14);
        }

        __int16 v15 = (const __CFNumber *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"MaxLinkRate");
        if (v15)
        {
          uint64_t v16 = v15;
          CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
          *((_BYTE *)v5 + 48) = valuePtr;
          CFRelease(v16);
        }

        CFTypeRef v17 = IOAVDeviceCopyProperty(*((void *)v5 + 3), @"SupportsEnhancedMode");
        BOOL v18 = (CFTypeRef *)MEMORY[0x189604DE8];
        if (v17)
        {
          uint64_t v19 = v17;
          *((_BYTE *)v5 + 49) = CFEqual(v17, (CFTypeRef)*MEMORY[0x189604DE8]) != 0;
          CFRelease(v19);
        }

        CFTypeRef v20 = IOAVDeviceCopyProperty(*((void *)v5 + 3), @"SupportsDownspread");
        if (v20)
        {
          uint64_t v21 = v20;
          *((_BYTE *)v5 + 50) = CFEqual(v20, *v18) != 0;
          CFRelease(v21);
        }
      }

      return v5;
    }

    CFRelease(v5);
    return 0LL;
  }

  return v5;
}

uint64_t IODPDeviceGetController(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IODPControllerCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 56) = result;
    }

    else
    {
      return *(void *)(a1 + 56);
    }
  }

  return result;
}

uint64_t IODPDeviceGetAVDevice(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPDeviceGetRevisionMajor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t IODPDeviceGetRevisionMinor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPDeviceGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPDeviceGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t IODPDeviceGetSupportsEnhancedMode(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 49);
}

uint64_t IODPDeviceGetSupportsDownspread(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 50);
}

uint64_t IODPDeviceReadDPCD(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  if (a4 >= 0x1000) {
    size_t v4 = 4096LL;
  }
  else {
    size_t v4 = a4;
  }
  size_t v6 = v4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v6);
}

uint64_t IODPDeviceWriteDPCD(uint64_t a1, unsigned int a2, void *inputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1895F89C0];
  if (a4 >= 0x1000) {
    size_t v4 = 4096LL;
  }
  else {
    size_t v4 = a4;
  }
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v5, 1u, input, 1u, inputStruct, v4, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPDeviceGetLinkTrainingData(uint64_t a1, void *outputStruct)
{
  size_t v3 = 116LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IODPDeviceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 3u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a3 = output;
  }
  return result;
}

uint64_t IODPDeviceSetUpdateMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPDeviceSetUpdated(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 5u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void __IODPDeviceFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    IOObjectRelease(v4);
  }
  mach_port_t v5 = *(const void **)(a1 + 56);
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t IODPServiceGetTypeID()
{
  uint64_t result = __kIODPServiceTypeID;
  if (!__kIODPServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
    return __kIODPServiceTypeID;
  }

  return result;
}

uint64_t __IODPServiceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPServiceCFTypeID TypeID = result;
  return result;
}

uint64_t IODPServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPService",  (uint64_t (*)(void, uint64_t))IODPServiceCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IODPServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IODPService",  (uint64_t (*)(void, uint64_t))IODPServiceCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

void *IODPServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIODPServiceTypeID) {
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
  }
  uint64_t Instance = (void *)_CFRuntimeCreateInstance();
  mach_port_t v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0LL;
    Instance[3] = 0LL;
    Instance[4] = 0LL;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1895FBBE0], 0x44505356u, (io_connect_t *)v5 + 5))
    {
      v5[3] = IOAVServiceCreateWithService(a1, *((_DWORD *)v5 + 4));
      return v5;
    }

    CFRelease(v5);
    return 0LL;
  }

  return v5;
}

_OWORD *IODPServiceGetDevice(uint64_t a1)
{
  uint64_t result = *(_OWORD **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(_OWORD **)(a1 + 32);
    }

    else
    {
      uint64_t result = IODPDeviceCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 32) = result;
    }
  }

  return result;
}

uint64_t IODPServiceGetAVService(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPServiceGetSinkCount(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IODPServiceRetrainLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IODPServiceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a3 = output;
  }
  return result;
}

void __IODPServiceFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    IOObjectRelease(v4);
  }
  mach_port_t v5 = *(const void **)(a1 + 32);
  if (v5) {
    CFRelease(v5);
  }
}

__CFString *IODPCreateStringWithLinkTrainingData(const __CFAllocator *a1, uint64_t a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Link Training Data:\n\n");
    int v19 = a3;
    int v7 = a3 + 1;
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Lane Count:    %d\n", *(unsigned int *)(a2 + 8));
    uint64_t v8 = IODPLinkRateScalar(*(unsigned __int8 *)(a2 + 12));
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Link Rate:     %llu bps\n", v8);
    if (*(_BYTE *)(a2 + 1)) {
      int v9 = "YES";
    }
    else {
      int v9 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Enhanced Mode: %s\n", v9);
    if (*(_BYTE *)(a2 + 2)) {
      mach_port_t v10 = "YES";
    }
    else {
      mach_port_t v10 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Downspread:    %s\n", v10);
    if (*(_BYTE *)(a2 + 3)) {
      unsigned int v11 = "YES";
    }
    else {
      unsigned int v11 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Fast:          %s\n", v11);
    if (*(_BYTE *)(a2 + 5)) {
      uint64_t v12 = "YES";
    }
    else {
      uint64_t v12 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"FEC:           %s\n", v12);
    if (*(_BYTE *)(a2 + 6)) {
      uint64_t v13 = "YES";
    }
    else {
      uint64_t v13 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"PSR:           %s\n", v13);
    if (*(_DWORD *)(a2 + 8))
    {
      unint64_t v14 = 0LL;
      int v15 = a3 + 2;
      uint64_t v16 = (unsigned int *)(a2 + 28);
      do
      {
        _IOAVStringAppendIndendationAndFormat(v6, v7, @"Lane %d:\n\n", v14);
        _IOAVStringAppendIndendationAndFormat(v6, v15, @"Swing Voltage: %d\n", *(v16 - 1));
        unsigned int v17 = *v16;
        v16 += 3;
        _IOAVStringAppendIndendationAndFormat(v6, v15, @"Pre-emphasis:  %d\n", v17);
        _IOAVStringAppendIndendationAndFormat(v6, v7, @"\n");
        ++v14;
      }

      while (v14 < *(unsigned int *)(a2 + 8));
    }

    _IOAVStringAppendIndendationAndFormat(v6, v19, @"\n");
  }

  return v6;
}

uint64_t IOAVAudioInterfaceGetTypeID()
{
  uint64_t result = __kIOAVAudioInterfaceTypeID;
  if (!__kIOAVAudioInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
    return __kIOAVAudioInterfaceTypeID;
  }

  return result;
}

uint64_t __IOAVAudioInterfaceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVAudioInterfaceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVAudioInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVAudioInterface",  (uint64_t (*)(void, uint64_t))IOAVAudioInterfaceCreateWithService,  0LL,  2u,  -1);
  }
  else {
    return 0LL;
  }
}

io_connect_t *IOAVAudioInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVAudioInterfaceTypeID) {
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  io_object_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0LL;
    *((void *)Instance + 3) = 0LL;
    mach_port_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0LL;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      int v7 = v4;
      io_object_t v4 = 0LL;
LABEL_10:
      CFRelease(v7);
      return v4;
    }

    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty( *v5,  @"Location",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }

  return v4;
}

CFTypeRef IOAVAudioInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

io_connect_t *IOAVAudioInterfaceGetService(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVServiceCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 32) = result;
    }

    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }

  return result;
}

uint64_t IOAVAudioInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVAudioInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

CFArrayRef IOAVAudioInterfaceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0LL;
  IOReturn v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return 0LL;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVAudioInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVAudioInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVAudioInterfaceCopyElements(uint64_t a1)
{
  else {
    BOOL v1 = cf == 0LL;
  }
  if (v1) {
    return 0LL;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFArrayGetTypeID()) {
    return cf;
  }
  else {
    return 0LL;
  }
}

CFTypeRef IOAVAudioInterfaceCopyChannelLayoutElements(uint64_t a1)
{
  else {
    BOOL v1 = cf == 0LL;
  }
  if (v1) {
    return 0LL;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFArrayGetTypeID()) {
    return cf;
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVAudioInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = 0LL;
  size_t v3 = 32LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVAudioInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  size_t v4 = 32LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t IOAVAudioInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVAudioInterfaceStopLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 4u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVAudioInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVAudioInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVAudioInterfaceCopyDiagnosticsString()
{
  return 0LL;
}

void __IOAVAudioInterfaceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t IOAVControllerGetTypeID()
{
  uint64_t result = __kIOAVControllerTypeID;
  if (!__kIOAVControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
    return __kIOAVControllerTypeID;
  }

  return result;
}

uint64_t __IOAVControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVController",  (uint64_t (*)(void, uint64_t))IOAVControllerCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVController",  (uint64_t (*)(void, uint64_t))IOAVControllerCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

io_connect_t *IOAVControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVControllerTypeID) {
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  size_t v4 = (io_connect_t *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    *(void *)(Instance + 24) = 0LL;
    mach_port_t v5 = (io_service_t *)(Instance + 16);
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      int v7 = v4;
      size_t v4 = 0LL;
LABEL_10:
      CFRelease(v7);
      return v4;
    }

    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty( *v5,  @"Location",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }

  return v4;
}

CFTypeRef IOAVControllerCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFArrayRef IOAVControllerCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0LL;
  BOOL v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return 0LL;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVControllerSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVControllerGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVControllerGetPower(uint64_t a1, BOOL *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xBu, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0] != 0;
  }
  return result;
}

uint64_t IOAVControllerSetPower(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSetProtectionType()
{
  return 3758097095LL;
}

uint64_t IOAVControllerForceHotPlugDetect(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerCopyDiagnosticsString()
{
  return 0LL;
}

uint64_t IOAVControllerSetVirtualDeviceMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerWakeDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerSleepDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVControllerGetCRCData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  size_t v4 = 16LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t __IOAVControllerFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result) {
    return IOObjectRelease(result);
  }
  return result;
}

uint64_t IOAVDeviceGetTypeID()
{
  uint64_t result = __kIOAVDeviceTypeID;
  if (!__kIOAVDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
    return __kIOAVDeviceTypeID;
  }

  return result;
}

uint64_t __IOAVDeviceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVDevice",  (uint64_t (*)(void, uint64_t))IOAVDeviceCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVDevice",  (uint64_t (*)(void, uint64_t))IOAVDeviceCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

io_connect_t *IOAVDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVDeviceTypeID) {
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  size_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0LL;
    *((void *)Instance + 3) = 0LL;
    mach_port_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0LL;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      int v7 = v4;
      size_t v4 = 0LL;
LABEL_10:
      CFRelease(v7);
      return v4;
    }

    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty( *v5,  @"Location",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }

  return v4;
}

CFTypeRef IOAVDeviceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

io_connect_t *IOAVDeviceGetController(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVControllerCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 32) = result;
    }

    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }

  return result;
}

uint64_t IOAVDeviceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVDeviceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVDeviceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVDeviceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVDeviceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVDeviceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

CFArrayRef IOAVDeviceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0LL;
  BOOL v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return 0LL;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVDeviceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVDeviceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVDeviceReadI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  size_t v6 = a5;
  if (a5 <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v6);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOAVDeviceWriteI2C( uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000) {
    return IOConnectCallMethod( *(_DWORD *)(a1 + 20),  7u,  input,  2u,  inputStruct,  inputStructCnt,  0LL,  0LL,  0LL,  0LL);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOAVDeviceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  size_t v4 = 272LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t IOAVDeviceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVDeviceCopyDiagnosticsString()
{
  return 0LL;
}

void __IOAVDeviceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t IOAVDisplayMemoryGetTypeID()
{
  uint64_t result = __kIOAVDisplayMemoryTypeID;
  if (!__kIOAVDisplayMemoryTypeID)
  {
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
    return __kIOAVDisplayMemoryTypeID;
  }

  return result;
}

uint64_t __IOAVDisplayMemoryRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVDisplayMemoryCFTypeID TypeID = result;
  return result;
}

io_service_t *IOAVDisplayMemoryCreateWithName(uint64_t a1, const void *a2)
{
  size_t v4 = IOServiceMatching("IOAVDisplayMemory");
  if (!v4) {
    return 0LL;
  }
  mach_port_t v5 = v4;
  CFDictionarySetValue(v4, @"IONameMatch", a2);
  io_registry_entry_t MatchingService = IOServiceGetMatchingService(0, v5);
  if (!MatchingService) {
    return 0LL;
  }
  io_object_t v7 = MatchingService;
  uint64_t v8 = IOAVDisplayMemoryCreateWithService(a1, MatchingService);
  IOObjectRelease(v7);
  return v8;
}

io_service_t *IOAVDisplayMemoryCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVDisplayMemoryTypeID) {
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  size_t v4 = (io_service_t *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(v4[4], *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      CFRelease(v4);
      return 0LL;
    }
  }

  return v4;
}

uint64_t IOAVDisplayMemoryRead(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  size_t v5 = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v5);
}

uint64_t IOAVDisplayMemoryWrite(uint64_t a1, unsigned int a2, void *inputStruct, size_t inputStructCnt)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v4, 1u, input, 1u, inputStruct, inputStructCnt, 0LL, 0LL, 0LL, 0LL);
}

uint64_t __IOAVDisplayMemoryFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result) {
    return IOObjectRelease(result);
  }
  return result;
}

void _IOAVStringAppendIndendationAndFormat(CFMutableStringRef theString, int a2, CFStringRef format, ...)
{
  if (a2)
  {
    int v5 = a2;
    do
    {
      CFStringAppend(theString, @"    ");
      --v5;
    }

    while (v5);
  }

  CFStringAppendFormatAndArguments(theString, 0LL, format, va);
}

__CFString *IOAVCreateDiagnosticsString(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsStringWithLocation(a1, 0);
}

__CFString *IOAVCreateDiagnosticsStringWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (Mutable)
  {
    uint64_t v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      size_t v6 = (const void *)v5;
      io_object_t v7 = (const __CFString *)IOAVControllerCopyDiagnosticsString();
      if (v7)
      {
        uint64_t v8 = v7;
        CFStringAppend(Mutable, v7);
        CFRelease(v8);
      }

      CFRelease(v6);
    }

    uint64_t v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      mach_port_t v10 = (const void *)v9;
      unsigned int v11 = (const __CFString *)IOAVDeviceCopyDiagnosticsString();
      if (v11)
      {
        uint64_t v12 = v11;
        CFStringAppend(Mutable, v11);
        CFRelease(v12);
      }

      CFRelease(v10);
    }

    uint64_t v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      unint64_t v14 = (const void *)v13;
      int v15 = (const __CFString *)IOAVServiceCopyDiagnosticsString();
      if (v15)
      {
        uint64_t v16 = v15;
        CFStringAppend(Mutable, v15);
        CFRelease(v16);
      }

      CFRelease(v14);
    }

    uint64_t v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      BOOL v18 = (const void *)v17;
      int v19 = (const __CFString *)IOAVAudioInterfaceCopyDiagnosticsString();
      if (v19)
      {
        CFTypeRef v20 = v19;
        CFStringAppend(Mutable, v19);
        CFRelease(v20);
      }

      CFRelease(v18);
    }

    uint64_t v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      uint64_t v22 = (const void *)v21;
      uint64_t v23 = (const __CFString *)IOAVVideoInterfaceCopyDiagnosticsString();
      if (v23)
      {
        uint64_t v24 = v23;
        CFStringAppend(Mutable, v23);
        CFRelease(v24);
      }

      CFRelease(v22);
    }
  }

  return Mutable;
}

__CFDictionary *IOAVCreateDiagnosticsReference(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsReferenceWithLocation(a1, 0);
}

__CFDictionary *IOAVCreateDiagnosticsReferenceWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (Mutable)
  {
    uint64_t v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      size_t v6 = (const void *)v5;
      CFArrayRef v7 = IOAVControllerCopyProperties(v5);
      if (v7)
      {
        CFArrayRef v8 = v7;
        CFDictionarySetValue(Mutable, @"IOAVController", v7);
        CFRelease(v8);
      }

      CFRelease(v6);
    }

    uint64_t v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      mach_port_t v10 = (const void *)v9;
      CFArrayRef v11 = IOAVDeviceCopyProperties(v9);
      if (v11)
      {
        CFArrayRef v12 = v11;
        CFDictionarySetValue(Mutable, @"IOAVDevice", v11);
        CFRelease(v12);
      }

      CFRelease(v10);
    }

    uint64_t v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      unint64_t v14 = (const void *)v13;
      CFArrayRef v15 = IOAVServiceCopyProperties(v13);
      if (v15)
      {
        CFArrayRef v16 = v15;
        CFDictionarySetValue(Mutable, @"IOAVService", v15);
        CFRelease(v16);
      }

      CFRelease(v14);
    }

    uint64_t v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      BOOL v18 = (const void *)v17;
      CFArrayRef v19 = IOAVAudioInterfaceCopyProperties(v17);
      if (v19)
      {
        CFArrayRef v20 = v19;
        CFDictionarySetValue(Mutable, @"IOAVAudioInterface", v19);
        CFRelease(v20);
      }

      CFRelease(v18);
    }

    uint64_t v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      uint64_t v22 = (const void *)v21;
      CFArrayRef v23 = IOAVVideoInterfaceCopyProperties(v21);
      if (v23)
      {
        CFArrayRef v24 = v23;
        CFDictionarySetValue(Mutable, @"IOAVVideoInterface", v23);
        CFRelease(v24);
      }

      CFRelease(v22);
    }

    uint64_t v25 = IOAVControlInterfaceCreate((uint64_t)a1);
    if (v25)
    {
      uint64_t v26 = (const void *)v25;
      CFArrayRef v27 = IOAVControlInterfaceCopyProperties(v25);
      if (v27)
      {
        CFArrayRef v28 = v27;
        CFDictionarySetValue(Mutable, @"IOAVControlInterface", v27);
        CFRelease(v28);
      }

      CFRelease(v26);
    }
  }

  return Mutable;
}

__CFString *IOAVCreateStringWithVideoLinkData(const __CFAllocator *a1, unsigned __int8 *a2, int a3, char a4)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  uint64_t v9 = Mutable;
  if (Mutable)
  {
    if ((a4 & 1) != 0)
    {
      int v10 = *((_DWORD *)a2 + 10);
      double v11 = (double)*((int *)a2 + 24) * 0.0000152587891;
      uint64_t v12 = *((unsigned int *)a2 + 12);
      uint64_t v13 = *((unsigned int *)a2 + 20);
      uint64_t v14 = *((unsigned int *)a2 + 2);
      CFArrayRef v15 = IOAVVideoColorDynamicRangeString(*((_DWORD *)a2 + 4));
      CFArrayRef v16 = IOAVVideoPixelEncodingString(*((_DWORD *)a2 + 3));
      CFArrayRef v28 = IOAVVideoColorimetryString(*((_DWORD *)a2 + 5));
      uint64_t v29 = IOAVVideoColorEOTFString(*((_DWORD *)a2 + 6));
      uint64_t v17 = 105LL;
      if ((v10 & 1) == 0) {
        uint64_t v17 = 112LL;
      }
      CFStringAppendFormat( v9,  0LL,  @"%dx%d%c %.3f Hz, %dbpc %s Range %s, %s colorimetry, %s EOTF",  v12,  v13,  v17,  *(void *)&v11,  v14,  v15,  v16,  v28,  v29);
      if ((*(_WORD *)(a2 + 1) & 1) != 0)
      {
        if ((*((_WORD *)a2 + 63) & 1) != 0) {
          CFArrayRef v19 = @", DSC (%f bpp, passthrough)";
        }
        else {
          CFArrayRef v19 = @", DSC (%f bpp, decompress)";
        }
        LOWORD(v18) = *((_WORD *)a2 + 62);
        CFStringAppendFormat(v9, 0LL, v19, (double)v18 * 0.0625);
      }
    }

    else
    {
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Video Link Data:\n\n");
      CFArrayRef v20 = IOAVCreateStringWithVideoTimingData(a1, (_DWORD *)a2 + 10, a3 + 1);
      if (v20)
      {
        uint64_t v21 = v20;
        CFStringAppend(v9, v20);
        CFRelease(v21);
      }

      uint64_t v22 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)a2 + 2, a3 + 1);
      if (v22)
      {
        CFArrayRef v24 = v22;
        CFStringAppend(v9, v22);
        CFRelease(v24);
      }

      if ((*(_WORD *)(a2 + 1) & 1) != 0)
      {
        if ((*((_WORD *)a2 + 63) & 1) != 0) {
          uint64_t v25 = @"DSC:          YES (%f bpp, passthrough)\n";
        }
        else {
          uint64_t v25 = @"DSC:          YES (%f bpp, decompress)\n";
        }
        LOWORD(v23) = *((_WORD *)a2 + 62);
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, v25, (double)v23 * 0.0625);
      }

      else
      {
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"DSC:          NO\n");
      }

      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Link ID:      %u\n", *((_DWORD *)a2 + 30) & 0xFFF);
      uint64_t v26 = IOAVVideoLinkModeString(*a2);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Link Mode:    %s\n", v26);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Test Mode:    %d\n", *((unsigned int *)a2 + 1));
      _IOAVStringAppendIndendationAndFormat(v9, a3, @"\n");
    }
  }

  return v9;
}

__CFString *IOAVCreateStringWithVideoTimingData(const __CFAllocator *a1, _DWORD *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  uint64_t PixelClock = IOAVVideoTimingGetPixelClock(a2, 0LL);
  if (Mutable)
  {
    uint64_t v7 = PixelClock;
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Timing Attributes:\n");
    _IOAVStringAppendIndendationAndFormat( Mutable,  a3 + 1,  @"Horizontal:    Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f kHz\n",  a2[1],  a2[2],  a2[5],  a2[3],  a2[4],  a2[7],  a2[8],  (double)(int)a2[6] * 0.0000152587891);
    _IOAVStringAppendIndendationAndFormat( Mutable,  a3 + 1,  @"Vertical:      Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f Hz\n",  a2[9],  a2[10],  a2[13],  a2[11],  a2[12],  a2[15],  a2[16],  (double)(int)a2[14] * 0.0000152587891);
    if ((*a2 & 1) != 0) {
      CFArrayRef v8 = "YES";
    }
    else {
      CFArrayRef v8 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Interlaced:    %s\n", v8);
    if ((*a2 & 2) != 0) {
      uint64_t v9 = "YES";
    }
    else {
      uint64_t v9 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Split:         %s\n", v9);
    _IOAVStringAppendIndendationAndFormat( Mutable,  a3 + 1,  @"Pixel Clock:   %f Mhz (%u Hz)\n",  (double)v7 / 1000000.0,  v7);
    int v10 = IOAVVideoScanInformationString(a2[19]);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Scan Type:     %s\n", v10);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"\n");
  }

  return Mutable;
}

__CFString *IOAVCreateStringWithVideoColorData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Color Attributes:\n");
    uint64_t v7 = *a2;
    CFArrayRef v8 = IOAVVideoPixelEncodingString(a2[1]);
    uint64_t v9 = IOAVVideoColorDynamicRangeString(a2[2]);
    int v10 = IOAVVideoColorimetryString(a2[3]);
    double v11 = IOAVVideoColorEOTFString(a2[4]);
    _IOAVStringAppendIndendationAndFormat( v6,  a3 + 1,  @"Depth: [%d bpc] Encoding: [%s] Range: [%s] Colorimetry: [%s] EOTF: [%s] DSC: [%s]\n",  v7,  v8,  v9,  v10,  v11,  IOAVCreateStringWithVideoColorData_dscMethods[a2[5] & 3]);
    _IOAVStringAppendIndendationAndFormat(v6, a3, @"\n");
  }

  return v6;
}

__CFString *IOAVCreateStringWithAudioLinkData(const __CFAllocator *a1, unsigned int *a2, int a3, char a4)
{
  return __IOAVCreateStringWithAudioLinkData(a1, a2, a3, 1, a4);
}

__CFString *__IOAVCreateStringWithAudioLinkData( const __CFAllocator *a1, unsigned int *a2, int a3, int a4, char a5)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  double v11 = Mutable;
  if (Mutable)
  {
    if ((a5 & 1) != 0)
    {
      LODWORD(v10) = a2[3];
      unsigned int v12 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = a2[2];
      double v15 = (double)v10 / 1000.0;
      CFArrayRef v16 = IOAVAudioFormatString(v12);
      CFStringAppendFormat(v11, 0LL, @"%g kHz %dch %d-bit %s", *(void *)&v15, v13, v14, v16);
    }

    else
    {
      uint64_t v22 = 0LL;
      memset(&v21, 0, 32);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Audio Link Data:\n");
      uint64_t v17 = IOAVAudioFormatString(*a2);
      _IOAVStringAppendIndendationAndFormat( v11,  a3 + 1,  @"Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n",  v17,  a2[1],  a2[2],  a2[3]);
      if (a4)
      {
        _IOAVStringAppendIndendationAndFormat(v11, a3 + 1, @"Layout:\n");
        IOAVAudioGetChannelLayoutData(a2[5], &v21);
        if (v21.n128_u32[0])
        {
          unint64_t v18 = 0LL;
          do
          {
            CFArrayRef v19 = IOAVAudioSpeakerString(v21.n128_u32[v18 + 2]);
            _IOAVStringAppendIndendationAndFormat(v11, a3 + 2, @"Channel %d: %s\n", v18++, v19);
          }

          while (v18 < v21.n128_u32[0]);
        }
      }

      _IOAVStringAppendIndendationAndFormat(v11, a3, @"\n");
    }
  }

  return v11;
}

__CFString *IOAVCreateStringWithAudioChannelLayoutData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Audio Channel Layout Data:\n\n");
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Total Channels: %d Active Channels: %d\n", *a2, a2[1]);
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Layout:\n");
    if (*a2)
    {
      unint64_t v7 = 0LL;
      do
      {
        CFArrayRef v8 = IOAVAudioSpeakerString(a2[v7 + 2]);
        _IOAVStringAppendIndendationAndFormat(v6, a3 + 2, @"Channel %d: %s\n", v7++, v8);
      }

      while (v7 < *a2);
    }

    _IOAVStringAppendIndendationAndFormat(v6, a3, @"\n");
  }

  return v6;
}

CFDictionaryRef _IOAVElementListGetElementIDAtIndex(const __CFArray *a1, CFIndex a2)
{
  uint64_t result = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"ID");
  }
  return result;
}

__CFString *_IOAVCreateStringOfColorIDs( const __CFAllocator *a1, CFDictionaryRef theDict, void *key, int a4, uint64_t (*a5)(const __CFArray *, uint64_t))
{
  Value = (const __CFArray *)CFDictionaryGetValue(theDict, key);
  if (!Value) {
    return 0LL;
  }
  double v11 = Value;
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(v11);
    if (Count)
    {
      uint64_t v14 = Count;
      double v15 = (const __CFArray *)CFDictionaryGetValue(theDict, @"UnsafeColorElementIDs");
      CFArrayRef theArray = v15;
      if (v15) {
        CFIndex v16 = CFArrayGetCount(v15);
      }
      else {
        CFIndex v16 = 0LL;
      }
      _IOAVStringAppendIndendationAndFormat(Mutable, a4, @"%@:", key);
      if (v14 >= 1)
      {
        uint64_t v17 = 0LL;
        int v18 = a4 + 1;
        do
        {
          uint64_t v19 = v17 + 1;
          if ((v17 & 0xF) == 0 && v19 < v14)
          {
            CFStringAppend(Mutable, @"\n");
            _IOAVStringAppendIndendationAndFormat(Mutable, v18, &stru_189C527D8);
          }

          CFArrayRef v20 = (const __CFNumber *)a5(v11, v17);
          if (v20)
          {
            __n128 v21 = v20;
            CFTypeID v22 = CFGetTypeID(v20);
            if (v22 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v21, kCFNumberSInt64Type, &valuePtr);
              uint64_t v23 = valuePtr;
              if (v16)
              {
                v28.location = 0LL;
                v28.CFIndex length = v16;
                if (CFArrayContainsValue(theArray, v28, v21)) {
                  uint64_t v24 = 42LL;
                }
                else {
                  uint64_t v24 = 32LL;
                }
              }

              else
              {
                uint64_t v24 = 32LL;
              }

              CFStringAppendFormat(Mutable, 0LL, @"%3lld%c ", v23, v24);
            }
          }

          uint64_t v17 = v19;
        }

        while (v14 != v19);
      }

      CFStringAppend(Mutable, @"\n");
    }
  }

  return Mutable;
}

__CFString *IOAVCreateStringWithElement(const __CFAllocator *a1, const __CFDictionary *a2, int a3)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (Mutable)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"ElementType");
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      uint64_t v8 = (a3 + 1);
      uint64_t v9 = IOAVElementTypeString(valuePtr);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s Element\n", v9);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"------------------------\n");
      if (a2)
      {
        unint64_t v10 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ID");
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "ID", *(void *)buffer);
        }

        double v11 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Score");
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "Score", *(void *)buffer);
        }

        unsigned int v12 = CFDictionaryGetValue(a2, @"IsVirtual");
        uint64_t v13 = (const void **)MEMORY[0x189604DE8];
        if (v12)
        {
          else {
            uint64_t v14 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsVirtual", v14);
        }

        double v15 = CFDictionaryGetValue(a2, @"IsPreferred");
        if (v15)
        {
          if (v15 == *v13) {
            CFIndex v16 = "YES";
          }
          else {
            CFIndex v16 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsPreferred", v16);
        }

        uint64_t v17 = CFDictionaryGetValue(a2, @"IsPromoted");
        if (v17)
        {
          if (v17 == *v13) {
            int v18 = "YES";
          }
          else {
            int v18 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsPromoted", v18);
        }
      }

      switch(valuePtr)
      {
        case 0u:
          uint64_t v19 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v19)
          {
            v75.location = 0LL;
            v75.CFIndex length = 80LL;
            CFDataGetBytes(v19, v75, buffer);
            CFArrayRef v20 = IOAVCreateStringWithVideoTimingData(a1, buffer, a3 + 1);
            if (a2)
            {
              __n128 v21 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StandardType");
              if (v21)
              {
                CFNumberGetValue(v21, kCFNumberSInt32Type, &v68);
                CFTypeID v22 = IOAVStandardTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "StandardType", v22);
              }

              uint64_t v23 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimingType");
              if (v23)
              {
                CFNumberGetValue(v23, kCFNumberSInt32Type, &v68);
                uint64_t v24 = IOAVVideoTimingTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "TimingType", v24);
              }

              uint64_t v25 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimingStandard");
              if (v25)
              {
                CFNumberGetValue(v25, kCFNumberSInt32Type, &v68);
                uint64_t v26 = IOAVVideoTimingStandardString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "TimingStandard", v26);
              }

              CFArrayRef v27 = (const __CFNumber *)CFDictionaryGetValue(a2, @"CEAShortID");
              if (v27)
              {
                CFNumberGetValue(v27, kCFNumberSInt64Type, &v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "CEAShortID", v68);
              }

              CFRange v28 = (const __CFNumber *)CFDictionaryGetValue(a2, @"AspectRatio");
              if (v28)
              {
                CFNumberGetValue(v28, kCFNumberSInt32Type, &v68);
                uint64_t v29 = IOAVVideoAspectRatioString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "AspectRatio", v29);
              }

              uint64_t v30 = (const __CFNumber *)CFDictionaryGetValue(a2, @"PreciseAspectRatio");
              if (v30)
              {
                CFNumberGetValue(v30, kCFNumberSInt64Type, &v68);
                LOWORD(v31) = v68;
                if (v68 < 0) {
                  uint64_t v31 = -v68;
                }
                _IOAVStringAppendIndendationAndFormat( Mutable,  a3 + 1,  @"%s: %lld.%0*lld\n",  "PreciseAspectRatio",  v68 / 0x10000,  3LL,  (1000 * (unint64_t)(unsigned __int16)v31) >> 16);
              }
            }

            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s:\n", "ValidPixelEncodings");
            uint64_t v32 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ValidPixelEncodings");
            if (v32)
            {
              CFNumberGetValue(v32, kCFNumberIntType, &v68);
              unsigned int v33 = 0;
              int v34 = a3 + 2;
              do
              {
                if (((v68 >> v33) & 1) != 0)
                {
                  uint64_t v35 = IOAVVideoPixelEncodingString(v33);
                  _IOAVStringAppendIndendationAndFormat(Mutable, v34, @"%s\n", v35);
                }

                ++v33;
              }

              while (v33 != 15);
            }

            CFTypeID v36 = _IOAVCreateStringOfColorIDs( a1,  a2,  @"ColorModes",  v8,  (uint64_t (*)(const __CFArray *, uint64_t))_IOAVElementListGetElementIDAtIndex);
            if (v36)
            {
              BOOL v37 = v36;
              CFStringAppend(Mutable, v36);
              CFRelease(v37);
            }

            unsigned int v38 = _IOAVCreateStringOfColorIDs( a1,  a2,  @"DSCRequiredColorElementIDs",  v8,  (uint64_t (*)(const __CFArray *, uint64_t))MEMORY[0x189602698]);
            if (v38)
            {
              CFTypeID v39 = v38;
              CFStringAppend(Mutable, v38);
              CFRelease(v39);
            }

            if (v20)
            {
              CFStringAppend(Mutable, v20);
              CFRelease(v20);
            }

            CFDictionaryRef v40 = CFDictionaryGetValue(a2, @"DownstreamFormat");
            if (v40)
            {
              v41 = v40;
              _IOAVStringAppendIndendationAndFormat(Mutable, v8, @"%s:\n\n", "DownstreamFormat");
              v42 = (const __CFString *)IOAVCreateStringWithElement(a1, v41, v8);
              if (v42)
              {
                BOOL v43 = v42;
                CFStringAppend(Mutable, v42);
                CFRelease(v43);
              }
            }

            mach_port_t v44 = CFDictionaryGetValue(a2, @"UpstreamFormat");
            if (v44)
            {
              v45 = v44;
              uint64_t v46 = "UpstreamFormat";
              goto LABEL_63;
            }
          }

          break;
        case 1u:
          if (a2)
          {
            BOOL v47 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StandardType");
            if (v47)
            {
              CFNumberGetValue(v47, kCFNumberSInt32Type, &v68);
              uint64_t v48 = IOAVStandardTypeString(v68);
              _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "StandardType", v48);
            }
          }

          uint64_t v49 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v49)
          {
            v76.location = 0LL;
            v76.CFIndex length = 32LL;
            CFDataGetBytes(v49, v76, buffer);
            v50 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)buffer, a3 + 1);
            if (v50)
            {
              int v51 = v50;
              CFStringAppend(Mutable, v50);
              CFRelease(v51);
              int v52 = CFDictionaryGetValue(a2, @"DownstreamFormat");
              if (v52)
              {
                v45 = v52;
                uint64_t v46 = "DownstreamFormat";
LABEL_63:
                _IOAVStringAppendIndendationAndFormat(Mutable, v8, @"%s:\n\n", v46);
                mach_port_t v53 = (__CFString *)IOAVCreateStringWithElement(a1, v45, v8);
                goto LABEL_82;
              }
            }
          }

          break;
        case 2u:
          unsigned int v69 = 0;
          unsigned int v70 = 0;
          IOReturn v54 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v54)
          {
            v77.location = 0LL;
            v77.CFIndex length = 32LL;
            CFDataGetBytes(v54, v77, buffer);
            v55 = __IOAVCreateStringWithAudioLinkData(a1, (unsigned int *)buffer, a3 + 1, 0, 0);
            v56 = (const __CFArray *)CFDictionaryGetValue(a2, @"AudioChannelLayoutElements");
            if (v56)
            {
              v57 = v56;
              CFIndex Count = CFArrayGetCount(v56);
              if (Count)
              {
                uint64_t v59 = Count;
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: ", "AudioChannelLayoutElements");
                if (v59 >= 1)
                {
                  for (CFIndex i = 0LL; i != v59; ++i)
                  {
                    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v57, i);
                    if (ValueAtIndex)
                    {
                      v62 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"ID");
                      if (v62)
                      {
                        CFNumberGetValue(v62, kCFNumberSInt64Type, &v68);
                        _IOAVStringAppendIndendationAndFormat(Mutable, 1, @"%lld ", v68);
                      }
                    }
                  }
                }

                CFStringAppend(Mutable, @"\n");
              }
            }

            v63 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StreamSampleRate");
            if (v63) {
              CFNumberGetValue(v63, kCFNumberIntType, &v70);
            }
            v64 = (const __CFNumber *)CFDictionaryGetValue(a2, @"MaxChannelCount");
            if (v64) {
              CFNumberGetValue(v64, kCFNumberIntType, &v69);
            }
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Audio Stream Data:\n");
            v65 = IOAVAudioFormatString(*(unsigned int *)buffer);
            _IOAVStringAppendIndendationAndFormat( Mutable,  a3 + 2,  @"Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n",  v65,  v69,  v73,  v70);
            if (v55) {
              goto LABEL_86;
            }
          }

          break;
        case 3u:
          v66 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v66)
          {
            v78.location = 0LL;
            v78.CFIndex length = 40LL;
            CFDataGetBytes(v66, v78, buffer);
            mach_port_t v53 = IOAVCreateStringWithAudioChannelLayoutData(a1, (unsigned int *)buffer, a3 + 1);
LABEL_82:
            v55 = v53;
            if (v53)
            {
LABEL_86:
              CFStringAppend(Mutable, v55);
              CFStringAppend(Mutable, @"\n");
              CFRelease(v55);
            }
          }

          break;
        default:
          CFShow(a2);
          break;
      }
    }
  }

  return Mutable;
}

__CFString *IOAVCreateStringWithElements(const __CFAllocator *a1, const __CFArray *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0LL; i != v8; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          double v11 = ValueAtIndex;
          CFTypeID v12 = CFGetTypeID(ValueAtIndex);
          if (v12 == CFDictionaryGetTypeID())
          {
            uint64_t v13 = IOAVCreateStringWithElement(a1, v11, a3);
            if (v13)
            {
              uint64_t v14 = v13;
              CFStringAppend(Mutable, v13);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }

  return Mutable;
}

__CFString *IOAVCreateStringWithData(const __CFAllocator *a1, const __CFData *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (Mutable)
  {
    unsigned int Length = CFDataGetLength(a2);
    unsigned int v7 = Length;
    if (Length)
    {
      uint64_t v8 = 0LL;
      unsigned int v9 = Length;
      do
      {
        if (v9 >= 0x10uLL) {
          uint64_t v10 = 16LL;
        }
        else {
          uint64_t v10 = v9;
        }
        uint64_t v11 = v8;
        else {
          int v12 = v7 - v8;
        }
        _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"%08x: ", v8);
        if (v12)
        {
          uint64_t v13 = v11;
          do
          {
            BytePtr = CFDataGetBytePtr(a2);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"%02x ", BytePtr[v13++]);
            --v10;
          }

          while (v10);
        }

        _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"\n");
        uint64_t v8 = (v11 + 16);
        v9 -= 16;
      }

      while (v8 < v7);
    }
  }

  return Mutable;
}

CFArrayRef IOAVPropertyListCreateWithCFProperties(const __CFAllocator *a1, const void *a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  if (IOAVPropertyListCreateWithCFProperties_onceToken != -1) {
    dispatch_once(&IOAVPropertyListCreateWithCFProperties_onceToken, &__block_literal_global_17);
  }
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 == IOAVPropertyListCreateWithCFProperties_BOOLeanTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_numberTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_stringTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_dateTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_dataTypeID)
  {
    return (CFArrayRef)CFRetain(a2);
  }

  if (v4 == IOAVPropertyListCreateWithCFProperties_arrayTypeID)
  {
    uint64_t v10 = (const void **)v42;
    bzero(v42, 0x400uLL);
    unint64_t Count = CFArrayGetCount((CFArrayRef)a2);
    CFIndex v12 = Count;
    if (Count < 0x81 || (uint64_t v10 = (const void **)malloc(8 * Count)) != 0LL)
    {
      v44.location = 0LL;
      v44.CFIndex length = v12;
      CFArrayGetValues((CFArrayRef)a2, v44, v10);
      if (v12 < 1)
      {
LABEL_39:
        CFIndex v16 = (const __CFArray *)CFRetain(a2);
      }

      else
      {
        char v13 = 0;
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          uint64_t v15 = IOAVPropertyListCreateWithCFProperties(a1, v10[i]);
          if (!v15)
          {
            if (i)
            {
              for (uint64_t j = 0LL; j != i; ++j)
                CFRelease(v10[j]);
            }

            goto LABEL_74;
          }

          v13 |= v15 != (void)v10[i];
          v10[i] = (const void *)v15;
        }

        if ((v13 & 1) == 0) {
          goto LABEL_39;
        }
        CFIndex v16 = CFArrayCreate(a1, v10, v12, MEMORY[0x189605228]);
      }

      CFArrayRef v26 = v16;
      if (v12 >= 1)
      {
        CFArrayRef v27 = v10;
        do
        {
          CFRange v28 = *v27++;
          CFRelease(v28);
          --v12;
        }

        while (v12);
      }

CFTypeID __IOAVPropertyListCreateWithCFProperties_block_invoke()
{
  IOAVPropertyListCreateWithCFProperties_BOOLeanCFTypeID TypeID = CFBooleanGetTypeID();
  IOAVPropertyListCreateWithCFProperties_numberCFTypeID TypeID = CFNumberGetTypeID();
  IOAVPropertyListCreateWithCFProperties_stringCFTypeID TypeID = CFStringGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dateCFTypeID TypeID = CFDateGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dataCFTypeID TypeID = CFDataGetTypeID();
  IOAVPropertyListCreateWithCFProperties_arrayCFTypeID TypeID = CFArrayGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dictionaryCFTypeID TypeID = CFDictionaryGetTypeID();
  CFTypeID result = CFSetGetTypeID();
  IOAVPropertyListCreateWithCFProperties_setCFTypeID TypeID = result;
  return result;
}

BOOL IOAVObjectConformsTo(io_registry_entry_t a1, uint64_t a2)
{
  io_object_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeID v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%s%s", a2, "UserInterfaceSupported");
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, v4, v3, 0);
  if (CFProperty)
  {
    BOOL v7 = CFProperty == (CFTypeRef)*MEMORY[0x189604DE8];
    CFRelease(CFProperty);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  CFRelease(v5);
  return v7;
}

uint64_t IOAVConnectCallCopyMethod(mach_port_t a1, uint32_t a2, CFTypeRef *a3)
{
  size_t v5 = -3LL;
  outputStruct = 0LL;
  if (!a3) {
    return 3758097090LL;
  }
  uint64_t result = IOConnectCallMethod(a1, a2, 0LL, 0, 0LL, 0LL, 0LL, 0LL, &outputStruct, &v5);
  if ((_DWORD)result)
  {
    *a3 = 0LL;
  }

  else
  {
    *a3 = IOCFUnserializeBinary(outputStruct, v5, 0LL, 0LL, 0LL);
    mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)outputStruct, v5);
    if (*a3) {
      return 0LL;
    }
    else {
      return 3758097085LL;
    }
  }

  return result;
}

uint64_t IOAVConnectCallSetMethod(mach_port_t a1, uint32_t a2, CFTypeRef object)
{
  size_t v5 = IOCFSerialize(object, 1uLL);
  if (!v5) {
    return 3758097090LL;
  }
  size_t v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  size_t Length = CFDataGetLength(v6);
  uint64_t v9 = IOConnectCallMethod(a1, a2, 0LL, 0, BytePtr, Length, 0LL, 0LL, 0LL, 0LL);
  CFRelease(v6);
  return v9;
}

uint64_t IOAVServiceGetTypeID()
{
  uint64_t result = __kIOAVServiceTypeID;
  if (!__kIOAVServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
    return __kIOAVServiceTypeID;
  }

  return result;
}

uint64_t __IOAVServiceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVServiceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVService",  (uint64_t (*)(void, uint64_t))IOAVServiceCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVService",  (uint64_t (*)(void, uint64_t))IOAVServiceCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

io_connect_t *IOAVServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVServiceTypeID) {
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  CFTypeID v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0LL;
    *((void *)Instance + 3) = 0LL;
    size_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0LL;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      BOOL v7 = v4;
      CFTypeID v4 = 0LL;
LABEL_10:
      CFRelease(v7);
      return v4;
    }

    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty( *v5,  @"Location",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      BOOL v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }

  return v4;
}

CFTypeRef IOAVServiceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

io_connect_t *IOAVServiceGetDevice(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(io_connect_t **)(a1 + 32);
    }

    else
    {
      uint64_t result = IOAVDeviceCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 32) = result;
    }
  }

  return result;
}

uint64_t IOAVServiceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

CFArrayRef IOAVServiceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0LL;
  BOOL v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return 0LL;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVServiceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVServiceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVServiceGetPower(uint64_t a1, BOOL *a2)
{
  uint64_t v2 = 3758097084LL;
  if (!a2) {
    return 3758097090LL;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( *(_DWORD *)(a1 + 16),  @"Power",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    size_t v5 = CFProperty;
    *a2 = CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x189604DE8]) != 0;
    CFRelease(v5);
    return 0LL;
  }

  return v2;
}

uint64_t IOAVServiceSetVirtualEDIDMode(uint64_t a1, unsigned int a2, CFDataRef theData)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    size_t Length = CFDataGetLength(theData);
  }

  else
  {
    BytePtr = 0LL;
    size_t Length = 0LL;
  }

  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x17u, input, 1u, BytePtr, Length, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceCopyEDID(uint64_t a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Au, &cf);
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0LL;
    return 3758097097LL;
  }

  CFTypeRef v5 = cf;
  *a2 = cf;
  if (!v5) {
    return 3758097097LL;
  }
  return v3;
}

uint64_t IOAVServiceCopyPhysicalAddress(uint64_t a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Fu, &cf);
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0LL;
    return 3758097097LL;
  }

  CFTypeRef v5 = cf;
  *a2 = cf;
  if (!v5) {
    return 3758097097LL;
  }
  return v3;
}

uint64_t IOAVServiceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = 0LL;
  size_t v4 = 272LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t IOAVServiceGetLinkDataWithSource(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a4;
  size_t v5 = 272LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v5);
}

uint64_t IOAVServiceGetFRLLinkData(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLCharacterErrorCounts(uint64_t a1, void *outputStruct)
{
  size_t v3 = 16LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceRetrainFRL(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetFRLMaxRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetFRLMinRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceGetFRLMaxRate(uint64_t a1, void *outputStruct)
{
  size_t v3 = 4LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLMinRate(uint64_t a1, void *outputStruct)
{
  size_t v3 = 4LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xDu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceSetFRLRecovery(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xEu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 0xFu, input, 1u, inputStruct, 0x110uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xFu, input, 1u, inputStruct, 0x110uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStopLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 0x10u, input, 1u, inputStruct, 0x110uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x10u, input, 1u, inputStruct, 0x110uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStartInfoFrame(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 0x11u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStartInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x11u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStopInfoFrame(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 0x12u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceStopInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x12u, input, 1u, inputStruct, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetHDRStaticMetadata(uint64_t a1, const void *a2)
{
  if (a2) {
    mach_port_t v2 = a2;
  }
  else {
    mach_port_t v2 = (const void *)*MEMORY[0x189604DE0];
  }
  return IOAVConnectCallSetMethod(*(_DWORD *)(a1 + 20), 0x1Eu, v2);
}

uint64_t IOAVServiceGetContentProtectionCapabilities(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x13u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceGetChosenContentProtection(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x14u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVServiceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x15u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceGetEncryptionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x20u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceSetContentProtectionCapabilities(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Cu, 0LL, 0, inputStruct, 8uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetContentProtectionPolicyOptions(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Du, 0LL, 0, inputStruct, 4uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceSetContentProtectionSupportEnabled(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0x1Bu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVServiceGetHDCPAuthenticatedContentType(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x16u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceCopyDiagnosticsString()
{
  return 0LL;
}

uint64_t IOAVServiceReadI2C( uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  size_t v6 = a5;
  if (a5 <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x18u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v6);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOAVServiceWriteI2C( uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000) {
    return IOConnectCallMethod( *(_DWORD *)(a1 + 20),  0x19u,  input,  2u,  inputStruct,  inputStructCnt,  0LL,  0LL,  0LL,  0LL);
  }
  else {
    return 3758097090LL;
  }
}

void __IOAVServiceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t IOAVVideoInterfaceGetTypeID()
{
  uint64_t result = __kIOAVVideoInterfaceTypeID;
  if (!__kIOAVVideoInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
    return __kIOAVVideoInterfaceTypeID;
  }

  return result;
}

uint64_t __IOAVVideoInterfaceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVVideoInterfaceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVVideoInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVVideoInterface",  (uint64_t (*)(void, uint64_t))IOAVVideoInterfaceCreateWithService,  0LL,  0,  -1);
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVVideoInterfaceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x189604DB0] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType( (uint64_t)"IOAVVideoInterface",  (uint64_t (*)(void, uint64_t))IOAVVideoInterfaceCreateWithService,  0LL,  a2,  -1);
  }
  else {
    return 0LL;
  }
}

io_connect_t *IOAVVideoInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!__kIOAVVideoInterfaceTypeID) {
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  size_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0LL;
    *((void *)Instance + 3) = 0LL;
    size_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0LL;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1895FBBE0], 0, v4 + 5))
    {
      BOOL v7 = v4;
      size_t v4 = 0LL;
LABEL_10:
      CFRelease(v7);
      return v4;
    }

    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty( *v5,  @"Location",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      BOOL v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }

  return v4;
}

CFTypeRef IOAVVideoInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

io_connect_t *IOAVVideoInterfaceGetService(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVServiceCreateWithService(*MEMORY[0x189604DB0], parent);
      *(void *)(a1 + 32) = result;
    }

    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }

  return result;
}

CFTypeRef IOAVVideoInterfaceCopyDisplayAttributes(uint64_t a1)
{
  else {
    BOOL v1 = cf == 0LL;
  }
  if (v1) {
    return 0LL;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFDictionaryGetTypeID()) {
    return cf;
  }
  else {
    return 0LL;
  }
}

CFArrayRef IOAVVideoInterfaceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0LL;
  BOOL v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return 0LL;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVVideoInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVVideoInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVVideoInterfaceCopyTimingElements(uint64_t a1)
{
  else {
    BOOL v1 = cf == 0LL;
  }
  if (v1) {
    return 0LL;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFArrayGetTypeID()) {
    return cf;
  }
  else {
    return 0LL;
  }
}

CFTypeRef IOAVVideoInterfaceCopyColorElements(uint64_t a1)
{
  else {
    BOOL v1 = cf == 0LL;
  }
  if (v1) {
    return 0LL;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFArrayGetTypeID()) {
    return cf;
  }
  else {
    return 0LL;
  }
}

uint64_t IOAVVideoInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = 0LL;
  size_t v3 = 256LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v3);
}

uint64_t IOAVVideoInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  size_t v4 = 256LL;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t IOAVVideoInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0LL;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceStartLinkWithModes( uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceStopLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceUpdateLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xEu, input, 1u, inputStruct, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceSetRotation(uint64_t a1, float a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 7u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceSetColorDitherRemoval(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceSetBounds(uint64_t a1, uint64_t a2, uint64_t a3)
{
  inputStruct[0] = a2;
  inputStruct[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0LL, 0, inputStruct, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceSetScreenVirtualTemperature(uint64_t a1, float a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAVVideoInterfaceCopyDiagnosticsString()
{
  return 0LL;
}

void __IOAVVideoInterfaceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __IOUSBDeviceDescriptionRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceDescriptionCFTypeID TypeID = result;
  return result;
}

uint64_t IOUSBDevicDeviceDescriptionGetTypeID()
{
  uint64_t result = __kIOUSBDeviceDescriptionTypeID;
  if (!__kIOUSBDeviceDescriptionTypeID)
  {
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
    return __kIOUSBDeviceDescriptionTypeID;
  }

  return result;
}

uint64_t IOUSBDeviceDescriptionCreate(const __CFAllocator *a1)
{
  if (!__kIOUSBDeviceDescriptionTypeID) {
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    *(void *)(Instance + 24) = 0LL;
    *(void *)(Instance + 16) = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    *(void *)(v3 + 24) = a1;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0LL, MEMORY[0x189605228]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), @"ConfigurationDescriptors", Mutable);
    CFRelease(Mutable);
  }

  return v3;
}

CFTypeRef IOUSBDeviceDescriptionCreateFromController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service = IOUSBDeviceControllerGetService(a2);
  CFTypeRef result = IORegistryEntryCreateCFProperty(Service, @"DeviceDescription", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (result)
  {
    size_t v5 = result;
    uint64_t v6 = __IOUSBDeviceDescriptionCreateFromDictionary(a1, result);
    CFRelease(v5);
    return (CFTypeRef)v6;
  }

  return result;
}

uint64_t __IOUSBDeviceDescriptionCreateFromDictionary(const __CFAllocator *a1, const void *a2)
{
  uint64_t v3 = IOUSBDeviceDescriptionCreate(a1);
  uint64_t v4 = v3;
  if (v3)
  {
    size_t v5 = *(const void **)(v3 + 16);
    if (v5 != a2)
    {
      CFRelease(v5);
      *(void *)(v4 + 16) = CFRetain(a2);
    }
  }

  return v4;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaults(const __CFAllocator *a1)
{
  else {
    BOOL v2 = cf == 0LL;
  }
  if (v2) {
    return 0LL;
  }
  io_registry_entry_t Service = IOUSBDeviceControllerGetService((uint64_t)cf);
  uint64_t v4 = __IOUSBDeviceDescriptionCreate(a1, Service, 0LL);
  CFRelease(cf);
  return v4;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaultsAndController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service = IOUSBDeviceControllerGetService(a2);
  return __IOUSBDeviceDescriptionCreate(a1, Service, 0LL);
}

uint64_t __IOUSBDeviceDescriptionCreate(const __CFAllocator *a1, io_registry_entry_t a2, const void *a3)
{
  uint64_t result = __IOUSBDeviceDescriptionCreateFromFile( a1,  @"/System/Library/AppleUSBDevice/USBDeviceConfigurationOverride.plist",  a2,  a3);
  if (!result) {
    return __IOUSBDeviceDescriptionCreateFromFile( a1,  @"/System/Library/AppleUSBDevice/USBDeviceConfiguration.plist",  a2,  a3);
  }
  return result;
}

uint64_t IOUSBDeviceDescriptionCreateWithType(const __CFAllocator *a1, const void *a2)
{
  else {
    BOOL v4 = cf == 0LL;
  }
  if (v4) {
    return 0LL;
  }
  uint64_t v5 = __IOUSBDeviceDescriptionCreate(a1, (io_registry_entry_t)cf, a2);
  CFRelease(cf);
  return v5;
}

uint64_t _IOUSBDeviceDescriptionGetInfo(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOUSBDeviceDescriptionGetClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceClass");
}

CFNumberRef __IOUSBDeviceGetIntProperty(uint64_t a1, const void *a2)
{
  unsigned int valuePtr = 0;
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

void IOUSBDeviceDescriptionSetClass(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceClass", v3);
  CFRelease(v3);
}

void IOUSBDeviceDescriptionSetSubClass(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceSubClass", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetSubClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceSubClass");
}

void IOUSBDeviceDescriptionSetProtocol(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceProtocol", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProtocol(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceProtocol");
}

uint64_t IOUSBDeviceDescriptionGetVendorID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"vendorID");
}

void IOUSBDeviceDescriptionSetVendorID(uint64_t a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"vendorID", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProductID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"productID");
}

void IOUSBDeviceDescriptionSetProductID(uint64_t a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"productID", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetVersion(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"deviceID");
}

const void *IOUSBDeviceDescriptionGetManufacturerString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"manufacturerString");
}

const void *IOUSBDeviceDescriptionGetProductString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"productString");
}

const void *IOUSBDeviceDescriptionGetSerialString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"serialNumber");
}

void IOUSBDeviceDescriptionSetSerialString(uint64_t a1, void *value)
{
}

void IOUSBDeviceDescriptionRemoveAllConfigurations(uint64_t a1)
{
  Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  CFArrayRemoveAllValues(Value);
}

uint64_t IOUSBDeviceDescriptionGetMatchingConfiguration(uint64_t a1, const __CFArray *a2)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  if (!result) {
    return result;
  }
  BOOL v4 = (const __CFArray *)result;
  uint64_t result = CFArrayGetCount((CFArrayRef)result);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  if (result < 1) {
    return 0LL;
  }
  CFIndex v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = (const void *)*MEMORY[0x189604DE8];
  uint64_t v9 = @"DefaultConfiguration";
  uint64_t v22 = (const void *)*MEMORY[0x189604DE8];
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v6);
    if (!ValueAtIndex) {
      goto LABEL_20;
    }
    uint64_t v11 = ValueAtIndex;
    uint64_t v7 = CFDictionaryGetValue(ValueAtIndex, v9) == v8 ? (v6 + 1) : v7;
    Value = (const __CFArray *)CFDictionaryGetValue(v11, @"Interfaces");
    if (!Value) {
      goto LABEL_20;
    }
    char v13 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (!a2) {
      goto LABEL_20;
    }
    CFIndex v15 = Count;
    if (!Count) {
      goto LABEL_20;
    }
    CFIndex v16 = CFArrayGetCount(a2);
    if (!v16) {
      goto LABEL_20;
    }
    CFIndex v17 = v16;
    if (v16 < 1) {
      goto LABEL_23;
    }
    unint64_t v18 = v9;
    CFIndex v19 = CFArrayGetValueAtIndex(a2, 0LL);
    v23.location = 0LL;
    v23.CFIndex length = v15;
    if (CFArrayGetFirstIndexOfValue(v13, v23, v19) != -1) {
      break;
    }
LABEL_19:
    uint64_t v9 = v18;
    uint64_t v8 = v22;
LABEL_20:
    if (++v6 == v5) {
      return v7;
    }
  }

  CFIndex v20 = 1LL;
  while (v17 != v20)
  {
    __n128 v21 = CFArrayGetValueAtIndex(a2, v20);
    v24.location = 0LL;
    v24.CFIndex length = v15;
    ++v20;
    if (CFArrayGetFirstIndexOfValue(v13, v24, v21) == -1)
    {
      if (v20 - 1 >= v17) {
        break;
      }
      goto LABEL_19;
    }
  }

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(uint64_t a1, const void *a2)
{
  Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  CFDictionarySetValue( *(CFMutableDictionaryRef *)(a1 + 16),  @"AllowMultipleCreates",  (const void *)*MEMORY[0x189604DE8]);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFMutableArrayRef v6 = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0LL, MEMORY[0x189605228]);
  CFDictionaryAddValue(Mutable, @"Interfaces", v6);
  CFRelease(v6);
  if (a2) {
    CFDictionaryAddValue(Mutable, @"Description", a2);
  }
  CFArrayAppendValue(Value, Mutable);
  CFRelease(Mutable);
  return CFArrayGetCount(Value) - 1;
}

void IOUSBDeviceDescriptionSetAllowOverride(uint64_t a1, int a2)
{
  BOOL v2 = *(__CFDictionary **)(a1 + 16);
  CFNumberRef v3 = (const void **)MEMORY[0x189604DE8];
  if (!a2) {
    CFNumberRef v3 = (const void **)MEMORY[0x189604DE0];
  }
  CFDictionarySetValue(v2, @"AllowMultipleCreates", *v3);
}

uint64_t IOUSBDeviceDescriptionAppendConfiguration(uint64_t a1, const void *a2, char a3, char a4)
{
  char valuePtr = a3;
  char v12 = a4;
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, (int)appended);
  CFNumberRef v9 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionaryAddValue(ValueAtIndex, @"Attributes", v9);
  CFRelease(v9);
  CFNumberRef v10 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &v12);
  CFDictionaryAddValue(ValueAtIndex, @"MaxPower", v10);
  CFRelease(v10);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterface(uint64_t a1, const void *a2)
{
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  IOUSBDeviceDescriptionAppendInterfaceToConfiguration(a1, appended, a2);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfaceToConfiguration(uint64_t a1, int a2, const void *a3)
{
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
  CFArrayAppendValue(v7, a3);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(uint64_t a1, const __CFArray *a2)
{
  CFStringRef v4 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x189604DB0], a2, @"+");
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v5 = v4;
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, v4);
  IOUSBDeviceDescriptionAppendInterfacesToConfiguration(a1, appended, a2);
  CFRelease(v5);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfacesToConfiguration(uint64_t a1, int a2, const __CFArray *a3)
{
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
  v9.CFIndex length = CFArrayGetCount(a3);
  v9.location = 0LL;
  CFArrayAppendArray(v7, a3, v9);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionCreateWithConfigurationInterfaces( const __CFAllocator *a1, const __CFArray *a2)
{
  uint64_t v3 = IOUSBDeviceDescriptionCreate(a1);
  CFIndex Count = CFArrayGetCount(a2);
  if (v3)
  {
    CFIndex v5 = Count;
    if (Count >= 1)
    {
      CFIndex v6 = 0LL;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a2, v6);
        IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(v3, ValueAtIndex);
        ++v6;
      }

      while (v5 != v6);
    }
  }

  return v3;
}

__CFArray *IOUSBDeviceDescriptionCopyInterfaces(uint64_t a1)
{
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  uint64_t Count = CFArrayGetCount(Value);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), Count, MEMORY[0x189605228]);
  if (Mutable && Count >= 1)
  {
    CFIndex v5 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v5);
      uint64_t v7 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
      CFArrayRef Copy = CFArrayCreateCopy(*(CFAllocatorRef *)(a1 + 24), v7);
      if (!Copy) {
        break;
      }
      CFArrayRef v9 = Copy;
      CFArrayAppendValue(Mutable, Copy);
      CFRelease(v9);
      if (Count == ++v5) {
        return Mutable;
      }
    }

    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

BOOL IOUSBDeviceDescriptionGetAllowOverride(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AllowMultipleCreates") == (const void *)*MEMORY[0x189604DE8];
}

void IOUSBDeviceDescriptionSetUDIDString(uint64_t a1, void *value)
{
}

void __IOUSBDeviceDescriptionRelease(uint64_t a1)
{
  BOOL v1 = *(const void **)(a1 + 16);
  if (v1) {
    CFRelease(v1);
  }
}

CFStringRef __IOUSBDeviceDescriptionSerializeDebug(uint64_t a1)
{
  uint64_t IntProperty = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"productID");
  uint64_t v3 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"vendorID");
  uint64_t v4 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"deviceID");
  uint64_t v5 = __IOUSBDeviceGetIntProperty(a1, @"deviceClass");
  uint64_t v6 = __IOUSBDeviceGetIntProperty(a1, @"deviceSubClass");
  uint64_t v7 = __IOUSBDeviceGetIntProperty(a1, @"deviceProtocol");
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"manufacturerString");
  CFArrayRef v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"productString");
  CFNumberRef v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"serialNumber");
  return CFStringCreateWithFormat( 0LL,  0LL,  @"IOUSBDeviceDescription: pid/vid/ver=%04x/%04x/%d class/sub/prot=%d/%d/%d Mfg:%@ Prod:%@ Ser:%@\n%@",  IntProperty,  v3,  v4,  v5,  v6,  v7,  Value,  v9,  v10,  *(void *)(a1 + 16));
}

uint64_t __IOUSBDeviceDescriptionCreateFromFile( const __CFAllocator *a1, const __CFString *a2, io_registry_entry_t a3, const void *a4)
{
  uint64_t v7 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    resourceCFDataRef Data = 0LL;
    CFURLCreateDataAndPropertiesFromResource(a1, v7, &resourceData, 0LL, 0LL, &errorCode);
    if (!resourceData)
    {
      uint64_t v14 = 0LL;
LABEL_25:
      CFRelease(v8);
      return v14;
    }

    CFPropertyListRef v9 = CFPropertyListCreateFromXMLData(a1, resourceData, 2uLL, 0LL);
    if (!v9)
    {
      uint64_t v14 = 0LL;
LABEL_24:
      CFRelease(resourceData);
      goto LABEL_25;
    }

    CFNumberRef v10 = v9;
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (a3
      && (char v12 = (__CFDictionary *)IORegistryEntryCreateCFProperty( a3,  @"DefaultDeviceDescription",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0)) != 0LL)
    {
      CFMutableDictionaryRef v13 = v12;
      if (!a4)
      {
LABEL_16:
        CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a3, @"ConfigurationType", v11, 0);
        if (CFProperty)
        {
          a4 = CFProperty;
          goto LABEL_18;
        }

uint64_t IOUSBDeviceControllerGetTypeID()
{
  uint64_t result = __kIOUSBDeviceControllerTypeID;
  if (!__kIOUSBDeviceControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
    return __kIOUSBDeviceControllerTypeID;
  }

  return result;
}

uint64_t __IOUSBDeviceControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IOUSBDeviceControllerCreate(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = 3758097085LL;
  int v5 = -60;
  while (1)
  {
    uint64_t v6 = IOServiceMatching("IOUSBDeviceController");
    if (!v6) {
      break;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(0, v6);
    if (MatchingService)
    {
      io_object_t v9 = MatchingService;
      uint64_t v4 = IOUSBDeviceControllerCreateWithService(a1, MatchingService, a2);
      IOObjectRelease(v9);
      return v4;
    }

    usleep(0x7A120u);
    if (__CFADD__(v5++, 1)) {
      return 3758097136LL;
    }
  }

  return v4;
}

uint64_t IOUSBDeviceControllerCreateWithService(uint64_t a1, io_object_t a2, uint64_t *a3)
{
  if (!__kIOUSBDeviceControllerTypeID) {
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 3758097085LL;
  }
  uint64_t v6 = Instance;
  *(void *)(Instance + 16) = 0LL;
  *(_DWORD *)(Instance + 16) = a2;
  IOObjectRetain(a2);
  uint64_t result = 0LL;
  *a3 = v6;
  return result;
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  if (!v3) {
    return 3758097085LL;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOUSBDeviceControllerSendCommand(a1, @"GoOffAndOnBus", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerSendCommand(uint64_t a1, const void *a2, const void *a3)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable) {
    return 3758097085LL;
  }
  uint64_t v7 = Mutable;
  CFDictionarySetValue(Mutable, @"USBDeviceCommand", a2);
  if (a3) {
    CFDictionarySetValue(v7, @"USBDeviceCommandParameter", a3);
  }
  uint64_t v8 = IORegistryEntrySetCFProperties(*(_DWORD *)(a1 + 16), v7);
  CFRelease(v7);
  return v8;
}

uint64_t IOUSBDeviceControllerForceOffBus(uint64_t a1, int a2)
{
  if (a2) {
    BOOL v2 = @"ForceOffBusEnable";
  }
  else {
    BOOL v2 = @"ForceOffBusDisable";
  }
  return IOUSBDeviceControllerSendCommand(a1, v2, 0LL);
}

uint64_t IOUSBDeviceControllerSetPreferredConfiguration(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  if (!v3) {
    return 3758097090LL;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOUSBDeviceControllerSendCommand(a1, @"SetDevicePreferredConfiguration", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerCreateDefaultDescription(uint64_t a1, const __CFAllocator *a2)
{
  return IOUSBDeviceDescriptionCreateFromDefaultsAndController(a2, a1);
}

uint64_t IOUSBDeviceControllerGetService(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t IOUSBDeviceControllerSetDescription(uint64_t a1, uint64_t a2)
{
  Info = (const void *)_IOUSBDeviceDescriptionGetInfo(a2);
  return IOUSBDeviceControllerSendCommand(a1, @"SetDeviceDescription", Info);
}

uint64_t __IOUSBDeviceControllerRelease(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result) {
    uint64_t result = IOObjectRelease(result);
  }
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t IOHIDAnalyticsEventCreate(uint64_t a1, uint64_t a2)
{
  if (__loadFramework_haOnce_0 != -1) {
    dispatch_once(&__loadFramework_haOnce_0, &__block_literal_global_18);
  }
  if (createEventFuncPtr) {
    return createEventFuncPtr(a1, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t IOHIDAnalyticsHistogramEventCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (__loadFramework_haOnce_0 != -1) {
    dispatch_once(&__loadFramework_haOnce_0, &__block_literal_global_18);
  }
  if (createHistogramEventFuncPtr) {
    return createHistogramEventFuncPtr(a1, a2, a3, a4, a5);
  }
  else {
    return 0LL;
  }
}

uint64_t IOHIDAnalyticsHistogramEventSetIntegerValue()
{
  if (setHistogramIntegerValueFuncPtr) {
    return setHistogramIntegerValueFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventAddHistogramField(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (addHistogramFieldFuncPtr) {
    return addHistogramFieldFuncPtr(result, a2, a3, a4);
  }
  return result;
}

uint64_t IOHIDAnalyticsEventSetIntegerValueForField()
{
  if (setIntegerValueForFieldFuncPtr) {
    return setIntegerValueForFieldFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventSetStringValueForField()
{
  if (setStringValueForFieldFuncPtr) {
    return setStringValueForFieldFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventActivate()
{
  if (activateEventFuncPtr) {
    return activateEventFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventCancel()
{
  if (cancelEventFuncPtr) {
    return cancelEventFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventAddField()
{
  if (addFieldFuncPtr) {
    return addFieldFuncPtr();
  }
  return result;
}

void *____loadFramework_block_invoke_0()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/HIDAnalytics.framework/HIDAnalytics", 1);
  __loadFramework_haHandle_0 = (uint64_t)result;
  if (result)
  {
    createEventFuncPtr = (uint64_t (*)(void, void))dlsym(result, "HIDAnalyticsEventCreate");
    if (__loadFramework_haHandle_0)
    {
      addHistogramFieldFuncPtr = (uint64_t (*)(void, void, void, void))dlsym( (void *)__loadFramework_haHandle_0,  "HIDAnalyticsEventAddHistogramField");
      if (__loadFramework_haHandle_0)
      {
        addFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventAddField");
        if (__loadFramework_haHandle_0)
        {
          setIntegerValueForFieldFuncPtr = (uint64_t (*)(void))dlsym( (void *)__loadFramework_haHandle_0,  "HIDAnalyticsEventSetIntegerValueForField");
          if (__loadFramework_haHandle_0)
          {
            setStringValueForFieldFuncPtr = (uint64_t (*)(void))dlsym( (void *)__loadFramework_haHandle_0,  "HIDAnalyticsEventSetStringValueForField");
            if (__loadFramework_haHandle_0)
            {
              activateEventFuncPtr = (uint64_t (*)(void))dlsym( (void *)__loadFramework_haHandle_0,  "HIDAnalyticsEventActivate");
              if (__loadFramework_haHandle_0)
              {
                BOOL v1 = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventCancel");
                uint64_t result = (void *)__loadFramework_haHandle_0;
                cancelEventFuncPtr = v1;
                if (__loadFramework_haHandle_0)
                {
                  BOOL v2 = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventCreate");
                  uint64_t result = (void *)__loadFramework_haHandle_0;
                  createHistogramEventFuncPtr = (uint64_t (*)(void, void, void, void, void))v2;
                  if (__loadFramework_haHandle_0) {
                    uint64_t result = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventSetIntegerValue");
                  }
                  goto LABEL_18;
                }

uint64_t io_pm_get_value_int(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x1895F8468];
  unsigned int v12 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x11D2800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (v10.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (v10.msgh_id == 73100)
      {
        if ((v10.msgh_bits & 0x80000000) == 0)
        {
          if (v10.msgh_size == 40)
          {
            if (!v10.msgh_remote_port)
            {
              uint64_t v7 = v12;
              if (!v12)
              {
                *a3 = v13;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (v10.msgh_size == 36)
          {
            if (v10.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v12 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v12;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t io_pm_set_value_int(mach_port_t a1, unsigned int a2, int a3, _DWORD *a4)
{
  uint64_t v12 = *MEMORY[0x1895F8468];
  unsigned int v13 = a2;
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = 5395;
  *(void *)&v11.msgh_voucher_port = 0x11D2900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 73101)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = v13;
              if (!v13)
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v13 == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_pm_force_active_settings(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = -2147478253;
  *(void *)&v11.msgh_voucher_port = 0x11D2A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 73102)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_pm_schedule_power_event(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D2B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73103)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_schedule_repeat_event(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D2C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_cancel_repeat_events(mach_port_t a1, _DWORD *a2)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v9.msgh_remote_port = a1;
  v9.msgh_local_port = special_reply_port;
  v9.msgh_bits = 5395;
  *(void *)&v9.msgh_voucher_port = 0x11D2D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v9);
    mach_port_t special_reply_port = v9.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (v9.msgh_id == 71)
      {
        uint64_t v6 = 4294966988LL;
      }

      else if (v9.msgh_id == 73105)
      {
        if ((v9.msgh_bits & 0x80000000) == 0)
        {
          if (v9.msgh_size == 40)
          {
            if (!v9.msgh_remote_port)
            {
              uint64_t v6 = v10;
              if (!v10)
              {
                *a2 = v11;
                return v6;
              }

              goto LABEL_22;
            }
          }

          else if (v9.msgh_size == 36)
          {
            if (v9.msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = v10 == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996LL;
            }
            else {
              uint64_t v6 = v10;
            }
            goto LABEL_22;
          }
        }

        uint64_t v6 = 4294966996LL;
      }

      else
      {
        uint64_t v6 = 4294966995LL;
      }

uint64_t io_pm_last_wake_time(mach_port_t a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v18.msgh_remote_port = a1;
  v18.msgh_local_port = special_reply_port;
  v18.msgh_bits = 5395;
  *(void *)&v18.msgh_voucher_port = 0x11D2E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v18);
    mach_port_t special_reply_port = v18.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v18, 3162115, 0x18u, 0x58u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v18.msgh_id == 73106)
      {
        if ((v18.msgh_bits & 0x80000000) == 0)
        {
          if (v18.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v20))
            {
              if (v18.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v20);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_26;
        }

        uint64_t v14 = 4294966996LL;
        if (v19 == 2 && v18.msgh_size == 80 && !v18.msgh_remote_port && v21 == 1 && v24 == 1)
        {
          int v15 = v22;
          if (v22 == v26)
          {
            int v16 = v25;
            if (v25 == v27)
            {
              uint64_t v14 = 0LL;
              *a2 = v20;
              *a3 = v15;
              *a4 = v23;
              *a5 = v16;
              *a6 = v28;
              return v14;
            }
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_pm_assertion_create( mach_port_t a1, uint64_t a2, int a3, int *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  int v20 = 1;
  uint64_t v21 = a2;
  int v22 = 16777472;
  int v23 = a3;
  uint64_t v24 = *MEMORY[0x1895F8468];
  int v25 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D2F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x38u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 73107)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 52)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v14 = HIDWORD(v21);
              if (!HIDWORD(v21))
              {
                int v17 = v23;
                *a4 = v22;
                *a5 = v17;
                int v18 = HIDWORD(v24);
                *a6 = v24;
                *a7 = v18;
                return v14;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v15 = 1;
            }
            else {
              BOOL v15 = HIDWORD(v21) == 0;
            }
            if (v15) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v21);
            }
            goto LABEL_22;
          }
        }

        uint64_t v14 = 4294966996LL;
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_pm_assertion_set_properties( mach_port_t a1, int a2, uint64_t a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  int v21 = 1;
  uint64_t v22 = a3;
  int v23 = 16777472;
  int v24 = a4;
  uint64_t v25 = *MEMORY[0x1895F8468];
  int v26 = a2;
  int v27 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&msg, 3162115, 0x3Cu, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (msg.msgh_id == 73108)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 52)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v15 = HIDWORD(v22);
              if (!HIDWORD(v22))
              {
                int v18 = v24;
                *a5 = v23;
                *a6 = v18;
                int v19 = HIDWORD(v25);
                *a7 = v25;
                *a8 = v19;
                return v15;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v16 = 1;
            }
            else {
              BOOL v16 = HIDWORD(v22) == 0;
            }
            if (v16) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = HIDWORD(v22);
            }
            goto LABEL_22;
          }
        }

        uint64_t v15 = 4294966996LL;
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

uint64_t io_pm_assertion_retain_release( mach_port_t a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v20 = *MEMORY[0x1895F8468];
  unsigned int v21 = a2;
  int v22 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D3100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x28u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 73109)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 52)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v14 = v21;
              if (!v21)
              {
                int v17 = v23;
                *a4 = v22;
                *a5 = v17;
                int v18 = v25;
                *a6 = v24;
                *a7 = v18;
                return v14;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v15 = 1;
            }
            else {
              BOOL v15 = v21 == 0;
            }
            if (v15) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = v21;
            }
            goto LABEL_22;
          }
        }

        uint64_t v14 = 4294966996LL;
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_pm_assertion_copy_details( mach_port_t a1, int a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 1;
  uint64_t v19 = a4;
  int v20 = 16777472;
  int v21 = a5;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a2;
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x40u, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 73110)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0LL;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_pm_declare_system_active(mach_port_t a1, int *a2, uint64_t a3, int a4, int *a5, _DWORD *a6)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  int v20 = a4;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = *a2;
  int v23 = a4;
  int v24 = *a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x40u, 0x38u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 73111)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v18);
              if (!HIDWORD(v18))
              {
                int v15 = v20;
                *a2 = v19;
                *a5 = v15;
                *a6 = v21;
                return v12;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v18) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v18);
            }
            goto LABEL_22;
          }
        }

        uint64_t v12 = 4294966996LL;
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t io_pm_declare_user_active( mach_port_t a1, int a2, uint64_t a3, int a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v18 = 1;
  uint64_t v19 = a3;
  int v20 = 16777472;
  int v21 = a4;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a2;
  int v24 = a4;
  int v25 = *a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, 0x40u, 0x38u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 73112)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                int v16 = v21;
                *a5 = v20;
                *a6 = v16;
                *a7 = v22;
                return v13;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v19) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996LL;
            }
            else {
              uint64_t v13 = HIDWORD(v19);
            }
            goto LABEL_22;
          }
        }

        uint64_t v13 = 4294966996LL;
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t io_pm_declare_network_client_active( mach_port_t a1, uint64_t a2, int a3, int *a4, _DWORD *a5, _DWORD *a6)
{
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v10 = *a4;
  int v23 = a3;
  int v24 = v10;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, 0x3Cu, 0x38u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 73113)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                int v16 = v21;
                *a4 = v20;
                *a5 = v16;
                *a6 = v22;
                return v13;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v19) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996LL;
            }
            else {
              uint64_t v13 = HIDWORD(v19);
            }
            goto LABEL_22;
          }
        }

        uint64_t v13 = 4294966996LL;
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t io_pm_get_uuid(mach_port_t a1, unsigned int a2, char *a3, _DWORD *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v16 = *MEMORY[0x1895F8468];
  unsigned int v17 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  v15.msgh_bits = 5395;
  *(void *)&v15.msgh_voucher_port = 0x11D3600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v15, 3162115, 0x24u, 0x438u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (v15.msgh_id == 73114)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size - 1073 <= 0xFFFFFBFE)
          {
            if (v15.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = v17 == 0;
            }
            if (!v10 && v15.msgh_size == 36) {
              uint64_t v9 = v17;
            }
            else {
              uint64_t v9 = 4294966996LL;
            }
            goto LABEL_24;
          }

          if (!v15.msgh_remote_port)
          {
            uint64_t v9 = v17;
            if (v17) {
              goto LABEL_24;
            }
            if (v18 <= 0x400)
            {
              uint64_t v9 = 4294966996LL;
              if (v15.msgh_size - 48 >= v18)
              {
                unsigned int v13 = (v18 + 3) & 0xFFFFFFFC;
                if (v15.msgh_size == v13 + 48)
                {
                  BOOL v14 = (char *)&v15 + v13;
                  mig_strncpy(a3, v19, 1024);
                  uint64_t v9 = 0LL;
                  *a4 = *((_DWORD *)v14 + 11);
                  return v9;
                }
              }

              goto LABEL_24;
            }
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_connection_create(mach_port_t a1, const char *a2, int a3, int *a4, _DWORD *a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v19 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v9 = mig_strncpy_zerofill(v22, a2, 1024);
  }
  else {
    int v9 = mig_strncpy(v22, a2, 1024);
  }
  unsigned int v20 = 0;
  int v21 = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v22[(v9 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D3700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, v10, 0x34u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v12)
    {
      mig_dealloc_special_reply_port();
      return v13;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v13 = 4294966988LL;
    }

    else if (msg.msgh_id == 73115)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 44)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v13 = v20;
            if (!v20)
            {
              int v17 = *(_DWORD *)v22;
              *a4 = v21;
              *a5 = v17;
              return v13;
            }

            goto LABEL_28;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v20 == 0;
          }
          if (v15) {
            uint64_t v13 = 4294966996LL;
          }
          else {
            uint64_t v13 = v20;
          }
          goto LABEL_28;
        }
      }

      uint64_t v13 = 4294966996LL;
    }

    else
    {
      uint64_t v13 = 4294966995LL;
    }

uint64_t io_pm_connection_schedule_notification(mach_port_t a1, int a2, int a3, int a4, int *a5)
{
  int v13 = 1;
  int v14 = a3;
  int v16 = 1245184;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a2;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73116)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = v15;
              if (!v15)
              {
                *a5 = v16;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = v15 == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = v15;
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_connection_release(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x1895F8468];
  unsigned int v12 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x11D3900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (v10.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (v10.msgh_id == 73117)
      {
        if ((v10.msgh_bits & 0x80000000) == 0)
        {
          if (v10.msgh_size == 40)
          {
            if (!v10.msgh_remote_port)
            {
              uint64_t v7 = v12;
              if (!v12)
              {
                *a3 = v13;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (v10.msgh_size == 36)
          {
            if (v10.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v12 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v12;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t io_pm_connection_acknowledge_event(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v14 = 1;
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = a5;
  uint64_t v18 = *MEMORY[0x1895F8468];
  int v19 = a2;
  int v20 = a3;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 73118)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_ps_new_pspowersource(mach_port_t a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D3B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 73119)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v8 = v13;
              if (!v13)
              {
                int v11 = v15;
                *a2 = v14;
                *a3 = v11;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v13 == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_ps_update_pspowersource(mach_port_t a1, int a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a2;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73120)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_ps_release_pspowersource(mach_port_t a1, unsigned int a2)
{
  uint64_t v8 = *MEMORY[0x1895F8468];
  unsigned int v9 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D3D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v4 = mach_msg(&msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_special_reply_port();
      return v5;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (msg.msgh_id == 73121)
    {
      uint64_t v5 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v5 = v9;
        if (!v9) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v5;
}

uint64_t io_ps_copy_powersources_info(mach_port_t a1, int a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  *(void *)int v15 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v15[8] = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D3E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x24u, 0x44u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 73122)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (*(_DWORD *)&v15[8])
            {
              if (msg.msgh_remote_port) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = *(unsigned int *)&v15[8];
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)v15 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
        {
          int v12 = v17;
          if (v17 == v18)
          {
            uint64_t v11 = 0LL;
            *a3 = *(void *)&v15[4];
            *a4 = v12;
            *a5 = v19;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t io_pm_hid_event_report_activity(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x1895F8468];
  unsigned int v12 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x11D3F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (v10.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (v10.msgh_id == 73123)
      {
        if ((v10.msgh_bits & 0x80000000) == 0)
        {
          if (v10.msgh_size == 40)
          {
            if (!v10.msgh_remote_port)
            {
              uint64_t v7 = v12;
              if (!v12)
              {
                *a3 = v13;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (v10.msgh_size == 36)
          {
            if (v10.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v12 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v12;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t io_pm_hid_event_copy_history(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 73124)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v10 = 4294966996LL;
            if (HIDWORD(v15))
            {
              if (msg.msgh_remote_port) {
                uint64_t v10 = 4294966996LL;
              }
              else {
                uint64_t v10 = HIDWORD(v15);
              }
            }
          }

          else
          {
            uint64_t v10 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v10 = 4294966996LL;
        if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
        {
          int v11 = v17;
          if (v17 == v18)
          {
            uint64_t v10 = 0LL;
            *a2 = v15;
            *a3 = v11;
            *a4 = v19;
            return v10;
          }
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_pm_set_debug_flags(mach_port_t a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  unsigned int v16 = a2;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x28u, 0x34u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 73125)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = v16;
              if (!v16)
              {
                int v13 = v18;
                *a4 = v17;
                *a5 = v13;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = v16 == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v16;
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_pm_set_bt_wake_interval(mach_port_t a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1895F8468];
  unsigned int v15 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73126)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = v15;
              if (!v15)
              {
                int v12 = v17;
                *a3 = v16;
                *a4 = v12;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = v15 == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = v15;
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_set_dw_linger_interval(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x1895F8468];
  unsigned int v12 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x11D4300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (v10.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (v10.msgh_id == 73127)
      {
        if ((v10.msgh_bits & 0x80000000) == 0)
        {
          if (v10.msgh_size == 40)
          {
            if (!v10.msgh_remote_port)
            {
              uint64_t v7 = v12;
              if (!v12)
              {
                *a3 = v13;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (v10.msgh_size == 36)
          {
            if (v10.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v12 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v12;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t io_pm_change_sa_assertion_behavior(mach_port_t a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v14 = *MEMORY[0x1895F8468];
  unsigned int v15 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 73128)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = v15;
              if (!v15)
              {
                int v12 = v17;
                *a3 = v16;
                *a4 = v12;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = v15 == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = v15;
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t io_pm_set_sleepservice_wake_time_cap(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x1895F8468];
  unsigned int v12 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x11D4500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (v10.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (v10.msgh_id == 73129)
      {
        if ((v10.msgh_bits & 0x80000000) == 0)
        {
          if (v10.msgh_size == 40)
          {
            if (!v10.msgh_remote_port)
            {
              uint64_t v7 = v12;
              if (!v12)
              {
                *a3 = v13;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (v10.msgh_size == 36)
          {
            if (v10.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v12 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v12;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t io_pm_get_capability_bits(mach_port_t a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 73130)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v8 = v13;
              if (!v13)
              {
                int v11 = v15;
                *a2 = v14;
                *a3 = v11;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v13 == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_pm_ctl_assertion_type(mach_port_t a1, const char *a2, int a3, int *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v16 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill(v19, a2, 1024);
  }
  else {
    int v7 = mig_strncpy(v19, a2, 1024);
  }
  unsigned int v17 = 0;
  int v18 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v19[(v7 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, v8, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_special_reply_port();
      return v11;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v11 = 4294966988LL;
    }

    else if (msg.msgh_id == 73131)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v11 = v17;
            if (!v17)
            {
              *a4 = v18;
              return v11;
            }

            goto LABEL_28;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v17 == 0;
          }
          if (v13) {
            uint64_t v11 = 4294966996LL;
          }
          else {
            uint64_t v11 = v17;
          }
          goto LABEL_28;
        }
      }

      uint64_t v11 = 4294966996LL;
    }

    else
    {
      uint64_t v11 = 4294966995LL;
    }

uint64_t io_pm_assertion_notify(mach_port_t a1, const char *a2, int a3, int *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v16 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill(v19, a2, 1024);
  }
  else {
    int v7 = mig_strncpy(v19, a2, 1024);
  }
  unsigned int v17 = 0;
  int v18 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v19[(v7 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, v8, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_special_reply_port();
      return v11;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v11 = 4294966988LL;
    }

    else if (msg.msgh_id == 73132)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v11 = v17;
            if (!v17)
            {
              *a4 = v18;
              return v11;
            }

            goto LABEL_28;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v17 == 0;
          }
          if (v13) {
            uint64_t v11 = 4294966996LL;
          }
          else {
            uint64_t v11 = v17;
          }
          goto LABEL_28;
        }
      }

      uint64_t v11 = 4294966996LL;
    }

    else
    {
      uint64_t v11 = 4294966995LL;
    }

uint64_t io_pm_assertion_activity_log( mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  *(void *)int v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = *a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x24u, 0x4Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 73133)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (*(_DWORD *)&v19[8])
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = *(unsigned int *)&v19[8];
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v14 = 4294966996LL;
        if (*(_DWORD *)v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && v20 == 1)
        {
          int v15 = v21;
          if (v21 == v22)
          {
            uint64_t v14 = 0LL;
            *a2 = *(void *)&v19[4];
            *a3 = v15;
            int v16 = v24;
            *a4 = v23;
            *a5 = v16;
            *a6 = v25;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_pm_assertion_activity_aggregate(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x11D4A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 73134)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v10 = 4294966996LL;
            if (HIDWORD(v15))
            {
              if (msg.msgh_remote_port) {
                uint64_t v10 = 4294966996LL;
              }
              else {
                uint64_t v10 = HIDWORD(v15);
              }
            }
          }

          else
          {
            uint64_t v10 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v10 = 4294966996LL;
        if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
        {
          int v11 = v17;
          if (v17 == v18)
          {
            uint64_t v10 = 0LL;
            *a2 = v15;
            *a3 = v11;
            *a4 = v19;
            return v10;
          }
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_pm_set_exception_limits(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = -2147478253;
  *(void *)&v11.msgh_voucher_port = 0x11D4B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 73135)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_hideventsystem_open( mach_port_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8, _DWORD *a9, _OWORD *a10)
{
  int v17 = 4;
  int v18 = a2;
  int v20 = 1245184;
  uint64_t v21 = a4;
  int v22 = 16777472;
  int v23 = a5;
  *(void *)int v24 = a6;
  *(_DWORD *)&v24[8] = 16777472;
  *(_DWORD *)&v24[12] = a7;
  *(_DWORD *)&v24[16] = a8;
  DWORD1(v25) = 1245184;
  *((void *)&v25 + 1) = *MEMORY[0x1895F8468];
  int v26 = a3;
  int v27 = a5;
  int v28 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 53493763, 0x68u, 0x6Cu, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 70100)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v13 = 4294966996LL;
            if (v19)
            {
              if (msg.msgh_remote_port) {
                uint64_t v13 = 4294966996LL;
              }
              else {
                uint64_t v13 = v19;
              }
            }
          }

          else
          {
            uint64_t v13 = 4294966996LL;
          }

          goto LABEL_28;
        }

        uint64_t v13 = 4294966996LL;
        if (v17 == 1 && msg.msgh_size == 40 && !msg.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
        {
          if ((_DWORD)v21 || HIDWORD(v21) < 0x20) {
            return 4294966987LL;
          }
          uint64_t v13 = 0LL;
          *a9 = v18;
          __int128 v15 = v25;
          *a10 = *(_OWORD *)&v24[4];
          a10[1] = v15;
          return v13;
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_matching_services( mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777472;
  int v22 = a3;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x38u, 0x54u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 70101)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v20))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v20);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_29;
        }

        uint64_t v14 = 4294966996LL;
        if (v19 == 2 && msg.msgh_size == 76 && !msg.msgh_remote_port && HIBYTE(v21) == 1 && HIBYTE(v24) == 1)
        {
          int v15 = v22;
          if (v22 == v26)
          {
            int v16 = v25;
            if (v25 == v27)
            {
              uint64_t v14 = 0LL;
              *a4 = v20;
              *a5 = v15;
              *a6 = v23;
              *a7 = v16;
              return v14;
            }
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_hideventsystem_release_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1895F8468];
  int v10 = a3;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_182E45820;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v3;
}

uint64_t io_hideventsystem_clear_service_cache(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70003;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_do_client_refresh(mach_port_t a1, void *a2, _DWORD *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x1117400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 70104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v8 = 4294966996LL;
            if (HIDWORD(v13))
            {
              if (msg.msgh_remote_port) {
                uint64_t v8 = 4294966996LL;
              }
              else {
                uint64_t v8 = HIDWORD(v13);
              }
            }
          }

          else
          {
            uint64_t v8 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v8 = 4294966996LL;
        if (v12 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v14 == 1)
        {
          int v9 = v15;
          if (v15 == v16)
          {
            uint64_t v8 = 0LL;
            *a2 = v13;
            *a3 = v9;
            return v8;
          }
        }
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_hideventsystem_dispatch_event(int a1, uint64_t a2, int a3, mach_msg_timeout_t timeout)
{
  uint64_t v8 = a2;
  int v9 = 16777472;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_182E45830;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 17, 0x38u, 0, 0, timeout, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v5;
}

uint64_t io_hideventsystem_service_conforms_to(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v14 = 1;
  uint64_t v15 = a2;
  int v16 = 16777472;
  int v17 = a3;
  uint64_t v18 = *MEMORY[0x1895F8468];
  int v19 = a3;
  int v20 = a4;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 70106)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_25;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_event_for_service( mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7, void *a8, _DWORD *a9)
{
  int v17 = 2;
  uint64_t v18 = a2;
  int v19 = 16777472;
  int v20 = a3;
  uint64_t v21 = a5;
  int v22 = 16777472;
  int v23 = a6;
  uint64_t v24 = *MEMORY[0x1895F8468];
  int v25 = a3;
  int v26 = a4;
  int v27 = a6;
  int v28 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, 0x54u, 0x40u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 70107)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v13 = 4294966996LL;
            if (HIDWORD(v18))
            {
              if (msg.msgh_remote_port) {
                uint64_t v13 = 4294966996LL;
              }
              else {
                uint64_t v13 = HIDWORD(v18);
              }
            }
          }

          else
          {
            uint64_t v13 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v13 = 4294966996LL;
        if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
        {
          int v14 = v20;
          if (v20 == v22)
          {
            uint64_t v13 = 0LL;
            *a8 = v18;
            *a9 = v14;
            return v13;
          }
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_matching_event_for_service( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, _DWORD *a6)
{
  int v15 = 1;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1895F8468];
  uint64_t v20 = a2;
  int v21 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  v14.msgh_bits = -2147478253;
  *(void *)&v14.msgh_voucher_port = 0x1117800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v14);
    mach_port_t special_reply_port = v14.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&v14, 3162115, 0x40u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v14.msgh_id == 70108)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (v14.msgh_remote_port) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v11 = 4294966996LL;
        if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == (_DWORD)v20)
          {
            uint64_t v11 = 0LL;
            *a5 = v16;
            *a6 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t io_hideventsystem_set_element_value_for_service( mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int *a7)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v15 = 1;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  uint64_t v19 = *MEMORY[0x1895F8468];
  int v20 = a3;
  int v21 = a4;
  int v22 = a5;
  int v23 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 70109)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_25;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t io_hideventsystem_set_properties_for_service( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 16777472;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 16777472;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 70110)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_25;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_property_for_service( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 16777472;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1895F8468];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 70111)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0LL;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_properties_for_service( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 16777472;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1895F8468];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 70112)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0LL;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t io_hideventsystem_set_properties(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = -2147478253;
  *(void *)&v11.msgh_voucher_port = 0x1117D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 70113)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_25;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_25;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_hideventsystem_copy_property( mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  int v16 = 1;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = *MEMORY[0x1895F8468];
  int v21 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x38u, 0x44u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 70114)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (HIDWORD(v17))
            {
              if (msg.msgh_remote_port) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v12 = 4294966996LL;
        if (v16 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0LL;
            *a4 = v17;
            *a5 = v13;
            *a6 = v22;
            return v12;
          }
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t io_hideventsystem_queue_create(mach_port_t a1, int a2, int a3, _DWORD *a4)
{
  int v11 = 1;
  int v12 = a2;
  int v14 = 1310720;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1117F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x34u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 70115)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v8 = 4294966996LL;
            if (v13)
            {
              if (msg.msgh_remote_port) {
                uint64_t v8 = 4294966996LL;
              }
              else {
                uint64_t v8 = v13;
              }
            }
          }

          else
          {
            uint64_t v8 = 4294966996LL;
          }

          goto LABEL_26;
        }

        uint64_t v8 = 4294966996LL;
        if (v11 == 1 && msg.msgh_size == 40 && !msg.msgh_remote_port && HIWORD(v14) << 16 == 1114112)
        {
          uint64_t v8 = 0LL;
          *a4 = v12;
          return v8;
        }
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_hideventsystem_queue_start(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70016;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_queue_stop(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70017;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_register_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1895F8468];
  int v10 = a3;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_182E45840;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v3;
}

uint64_t io_hideventsystem_unregister_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1895F8468];
  int v10 = a3;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_182E45850;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v3;
}

uint64_t io_hideventsystem_register_event_filter(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895F8468];
  int v6 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 70020;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v2;
}

uint64_t io_hideventsystem_unregister_event_filter(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70021;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_register_record_client_changed_notification(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70022;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_unregister_record_client_changed_notification(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70023;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_register_record_service_changed_notification(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70024;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_unregister_record_service_changed_notification(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70025;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t io_hideventsystem_create_virtual_service(mach_port_t a1, uint64_t a2, int a3, void *a4)
{
  int v12 = 1;
  uint64_t v13 = a2;
  LODWORD(v14) = 16777472;
  HIDWORD(v14) = a3;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1118A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x38u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 70126)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_25;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t io_hideventsystem_remove_virtual_service(mach_port_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F8468];
  uint64_t v6 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70027;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v2;
}

uint64_t io_hideventsystem_dispatch_event_for_virtual_service(int a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = a3;
  int v9 = 16777472;
  int v10 = a4;
  uint64_t v11 = *MEMORY[0x1895F8468];
  uint64_t v12 = a2;
  int v13 = a4;
  v6[0] = -2147483629;
  v6[2] = a1;
  *(_OWORD *)name = xmmword_182E45860;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)v6);
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)v6, 1, 0x40u, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], name[0]);
    }
    mach_msg_destroy((mach_msg_header_t *)v6);
  }

  return v4;
}

uint64_t iohideventsystem_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t _Xio_hideventsystem_open(uint64_t result, _DWORD *a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 4 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
    goto LABEL_14;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(_BYTE *)(result + 51) != 1
    || *(_BYTE *)(result + 67) != 1
    || *(unsigned __int16 *)(result + 82) << 16 != 1114112
    || *(_DWORD *)(result + 52) != *(_DWORD *)(result + 96)
    || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 100))
  {
    int v3 = -300;
    goto LABEL_14;
  }

  if (*(_DWORD *)(result + 104) || *(_DWORD *)(result + 108) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_14:
    a2[8] = v3;
    goto LABEL_15;
  }

  *((void *)a2 + 4) = 0x11000000000000LL;
  unsigned int v4 = *(_DWORD *)(result + 12);
  mach_port_name_t v5 = *(_DWORD *)(result + 28);
  unsigned int v6 = *(_DWORD *)(result + 92);
  uint64_t v7 = *(UInt8 **)(result + 40);
  unsigned int v8 = *(_DWORD *)(result + 52);
  int v9 = *(UInt8 **)(result + 56);
  unsigned int v10 = *(_DWORD *)(result + 68);
  mach_port_name_t v11 = *(_DWORD *)(result + 72);
  __int128 v12 = *(_OWORD *)(result + 140);
  v13[0] = *(_OWORD *)(result + 124);
  v13[1] = v12;
  uint64_t result = _io_hideventsystem_open(v4, v5, v6, v7, v8, v9, v10, v11, a2 + 7, v13);
  if (!(_DWORD)result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }

  a2[8] = result;
LABEL_15:
  *((void *)a2 + 3) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xio_hideventsystem_copy_matching_services(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  *(_DWORD *)(a2 + 52) = 16777473;
  uint64_t result = _io_hideventsystem_copy_matching_services( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 68),  (vm_offset_t *)(a2 + 44),  (_DWORD *)(a2 + 72));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  int v4 = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a2 + 56) = v4;
  *(void *)(a2 + 60) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 76;
  *(_DWORD *)(a2 + 24) = 2;
  return result;
}

uint64_t _Xio_hideventsystem_release_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_release_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

_DWORD *_Xio_hideventsystem_clear_service_cache(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_clear_service_cache(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_do_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)_io_hideventsystem_do_client_refresh(result[3], (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_dispatch_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_dispatch_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xio_hideventsystem_service_conforms_to(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _io_hideventsystem_service_conforms_to( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 56),  *(_DWORD *)(result + 60),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t _Xio_hideventsystem_copy_event_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 84)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 76))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_event_for_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(unsigned int *)(result + 40),  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  *(unsigned int *)(result + 80),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_copy_matching_event_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_matching_event_for_service( *(_DWORD *)(result + 12),  *(void *)(result + 52),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_set_element_value_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 68)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _io_hideventsystem_set_element_value_for_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 56),  *(_DWORD *)(result + 60),  *(_DWORD *)(result + 64),  (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t _Xio_hideventsystem_set_properties_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    uint64_t v5 = *MEMORY[0x1895F8468];
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  uint64_t result = _io_hideventsystem_set_properties_for_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t _Xio_hideventsystem_copy_property_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_property_for_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(unsigned int *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52),  (_DWORD *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_copy_properties_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_properties_for_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(unsigned int *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52),  (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_set_properties(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _io_hideventsystem_set_properties( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t _Xio_hideventsystem_copy_property(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_property( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52),  (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_queue_create(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 52)
  {
    int v3 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_9;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_8;
  }

  *(void *)(a2 + 32) = 0x13000000000000LL;
  uint64_t result = _io_hideventsystem_queue_create( *(_DWORD *)(result + 12),  *(_DWORD *)(result + 28),  *(_DWORD *)(result + 48),  (_DWORD *)(a2 + 28));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_9:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 40;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *_Xio_hideventsystem_queue_start(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_queue_start(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_queue_stop(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_queue_stop(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t _Xio_hideventsystem_register_property_changed_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_register_property_changed_notification( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xio_hideventsystem_unregister_property_changed_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_unregister_property_changed_notification( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

_DWORD *_Xio_hideventsystem_register_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_event_filter(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_unregister_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_event_filter(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_register_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_register_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t _Xio_hideventsystem_create_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _io_hideventsystem_create_virtual_service( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  (const void **)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t _Xio_hideventsystem_remove_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = _io_hideventsystem_remove_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

uint64_t _Xio_hideventsystem_dispatch_event_for_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 60))
      {
        uint64_t result = _io_hideventsystem_dispatch_event_for_virtual_service( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t iohideventsystem_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 70029) >= 0xFFFFFFE3
    && (int v5 = (void (*)(void))*(&_iohideventsystem_subsystem + 5 * (v4 - 70000) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t iohideventsystem_client_dispatch_notification_results( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, mach_msg_timeout_t a6)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int v13 = 2;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = a4;
  int v18 = 16777472;
  int v19 = a5;
  uint64_t v20 = *MEMORY[0x1895F8468];
  int v21 = a3;
  int v22 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x124F800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162515, 0x4Cu, 0x2Cu, special_reply_port, a6, 0);
  uint64_t v10 = v9;
  if ((_DWORD)v9)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&msg);
    return v10;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v10 = 4294966988LL;
    goto LABEL_19;
  }

  if (msg.msgh_id != 75100)
  {
    uint64_t v10 = 4294966995LL;
    goto LABEL_19;
  }

  uint64_t v10 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_19;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v10 = HIDWORD(v14);
  if (HIDWORD(v14)) {
    goto LABEL_19;
  }
  return v10;
}

uint64_t iohideventsystem_client_dispatch_service_removal( mach_port_t a1, uint64_t a2, int a3, mach_msg_timeout_t a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v11 = 1;
  uint64_t v12 = a2;
  int v13 = 16777472;
  int v14 = a3;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = -2147478253;
  *(void *)&v10.msgh_voucher_port = 0x124F900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v10, 3162515, 0x38u, 0x2Cu, special_reply_port, a4, 0);
  uint64_t v8 = v7;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v10.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v10.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&v10);
    return v8;
  }

  if (v10.msgh_id == 71)
  {
    uint64_t v8 = 4294966988LL;
    goto LABEL_19;
  }

  if (v10.msgh_id != 75101)
  {
    uint64_t v8 = 4294966995LL;
    goto LABEL_19;
  }

  uint64_t v8 = 4294966996LL;
  if ((v10.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (v10.msgh_size != 36) {
    goto LABEL_19;
  }
  if (v10.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_19;
  }
  return v8;
}

uint64_t iohideventsystem_client_dispatch_properties_changed( mach_port_t a1, uint64_t a2, int a3, mach_msg_timeout_t a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v11 = 1;
  uint64_t v12 = a2;
  int v13 = 16777472;
  int v14 = a3;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  v10.msgh_bits = -2147478253;
  *(void *)&v10.msgh_voucher_port = 0x124FA00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v10, 3162515, 0x38u, 0x2Cu, special_reply_port, a4, 0);
  uint64_t v8 = v7;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v10.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v10.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&v10);
    return v8;
  }

  if (v10.msgh_id == 71)
  {
    uint64_t v8 = 4294966988LL;
    goto LABEL_19;
  }

  if (v10.msgh_id != 75102)
  {
    uint64_t v8 = 4294966995LL;
    goto LABEL_19;
  }

  uint64_t v8 = 4294966996LL;
  if ((v10.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (v10.msgh_size != 36) {
    goto LABEL_19;
  }
  if (v10.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_19;
  }
  return v8;
}

uint64_t iohideventsystem_client_dispatch_event_filter( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6, mach_msg_timeout_t a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x124FB00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162515, 0x4Cu, 0x30u, special_reply_port, a7, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 75103)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a6 = v18;
                return v12;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_25;
          }
        }

        uint64_t v12 = 4294966996LL;
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t iohideventsystem_client_dispatch_client_records_changed(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 75004;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t iohideventsystem_client_dispatch_service_records_changed(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 75005;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v1;
}

uint64_t iohideventsystem_client_dispatch_virtual_service_copy_property( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, _DWORD *a6, mach_msg_timeout_t a7)
{
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  int v20 = a4;
  uint64_t v21 = *MEMORY[0x1895F8468];
  uint64_t v22 = a2;
  int v23 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = special_reply_port;
  v16.msgh_bits = -2147478253;
  *(void *)&v16.msgh_voucher_port = 0x124FE00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v16);
    mach_port_t special_reply_port = v16.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&v16, 3162515, 0x40u, 0x40u, special_reply_port, a7, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (v16.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (v16.msgh_id == 75106)
      {
        if ((v16.msgh_bits & 0x80000000) == 0)
        {
          if (v16.msgh_size == 36)
          {
            uint64_t v13 = 4294966996LL;
            if (HIDWORD(v18))
            {
              if (v16.msgh_remote_port) {
                uint64_t v13 = 4294966996LL;
              }
              else {
                uint64_t v13 = HIDWORD(v18);
              }
            }
          }

          else
          {
            uint64_t v13 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v13 = 4294966996LL;
        if (v17 == 1 && v16.msgh_size == 56 && !v16.msgh_remote_port && HIBYTE(v19) == 1)
        {
          int v14 = v20;
          if (v20 == (_DWORD)v22)
          {
            uint64_t v13 = 0LL;
            *a5 = v18;
            *a6 = v14;
            return v13;
          }
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t iohideventsystem_client_dispatch_virtual_service_set_property( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int *a5, mach_msg_timeout_t a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v15 = 1;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1895F8468];
  uint64_t v20 = a2;
  int v21 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x124FF00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162515, 0x40u, 0x30u, special_reply_port, a6, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 75107)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a5 = v17;
                return v11;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_25;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t iohideventsystem_client_dispatch_virtual_service_notification( int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v8 = a4;
  int v9 = 16777472;
  int v10 = a5;
  uint64_t v11 = *MEMORY[0x1895F8468];
  uint64_t v12 = a2;
  int v13 = a3;
  int v14 = a5;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_182E458D0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 129, 0x44u, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v5;
}

uint64_t iohideventsystem_copy_event_from_virtual_service( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, void *a7, _DWORD *a8, mach_msg_timeout_t a9)
{
  int v18 = 1;
  uint64_t v19 = a4;
  int v20 = 16777472;
  int v21 = a5;
  uint64_t v22 = *MEMORY[0x1895F8468];
  uint64_t v23 = a2;
  int v24 = a3;
  int v25 = a5;
  int v26 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1250100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162515, 0x48u, 0x40u, special_reply_port, a9, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 75109)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == (_DWORD)v23)
          {
            uint64_t v14 = 0LL;
            *a7 = v19;
            *a8 = v15;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t iohideventsystem_copy_matching_event_from_virtual_service( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, _DWORD *a6, mach_msg_timeout_t a7)
{
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  int v20 = a4;
  uint64_t v21 = *MEMORY[0x1895F8468];
  uint64_t v22 = a2;
  int v23 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = special_reply_port;
  v16.msgh_bits = -2147478253;
  *(void *)&v16.msgh_voucher_port = 0x1250200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v16);
    mach_port_t special_reply_port = v16.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&v16, 3162515, 0x40u, 0x40u, special_reply_port, a7, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (v16.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (v16.msgh_id == 75110)
      {
        if ((v16.msgh_bits & 0x80000000) == 0)
        {
          if (v16.msgh_size == 36)
          {
            uint64_t v13 = 4294966996LL;
            if (HIDWORD(v18))
            {
              if (v16.msgh_remote_port) {
                uint64_t v13 = 4294966996LL;
              }
              else {
                uint64_t v13 = HIDWORD(v18);
              }
            }
          }

          else
          {
            uint64_t v13 = 4294966996LL;
          }

          goto LABEL_27;
        }

        uint64_t v13 = 4294966996LL;
        if (v17 == 1 && v16.msgh_size == 56 && !v16.msgh_remote_port && HIBYTE(v19) == 1)
        {
          int v14 = v20;
          if (v20 == (_DWORD)v22)
          {
            uint64_t v13 = 0LL;
            *a5 = v18;
            *a6 = v14;
            return v13;
          }
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

uint64_t iohideventsystem_output_event_to_virtual_service( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int *a5, mach_msg_timeout_t a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v15 = 1;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1895F8468];
  uint64_t v20 = a2;
  int v21 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1250300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162515, 0x40u, 0x30u, special_reply_port, a6, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 75111)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a5 = v17;
                return v11;
              }

              goto LABEL_25;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_25;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t iohideventsystem_client_refresh(mach_port_t a1, int a2)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 75012;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, a2 | 1, 0x18u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v3;
}

uint64_t iohideventsystem_client_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t _Xiohideventsystem_client_dispatch_notification_results(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v5 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    goto LABEL_11;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v5 = -300;
    goto LABEL_10;
  }

  uint64_t result = _iohideventsystem_client_dispatch_notification_results( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4);
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_service_removal(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_8;
  }

  uint64_t result = _iohideventsystem_client_dispatch_service_removal(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_properties_changed(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_8;
  }

  uint64_t result = _iohideventsystem_client_dispatch_properties_changed(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_event_filter(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    uint64_t v5 = *MEMORY[0x1895F8468];
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  uint64_t result = _iohideventsystem_client_dispatch_event_filter( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *_Xiohideventsystem_client_dispatch_client_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_dispatch_client_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xiohideventsystem_client_dispatch_service_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_dispatch_service_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_virtual_service_copy_property(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _iohideventsystem_client_dispatch_virtual_service_copy_property( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_virtual_service_set_property(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 60)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _iohideventsystem_client_dispatch_virtual_service_set_property( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(UInt8 **)(result + 28),  v3,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t _Xiohideventsystem_client_dispatch_virtual_service_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 68)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 64))
      {
        uint64_t result = _iohideventsystem_client_dispatch_virtual_service_notification( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(unsigned int *)(result + 60),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xiohideventsystem_copy_event_from_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 64))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _iohideventsystem_copy_event_from_virtual_service( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(unsigned int *)(result + 60),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(unsigned int *)(result + 68),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xiohideventsystem_copy_matching_event_from_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _iohideventsystem_copy_matching_event_from_virtual_service( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1895F8468];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xiohideventsystem_output_event_to_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1895F8468];
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 60)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  uint64_t result = _iohideventsystem_output_event_to_virtual_service( *(_DWORD *)(result + 12),  *(const void **)(result + 52),  *(UInt8 **)(result + 28),  v3,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if (!(_DWORD)result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *_Xiohideventsystem_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_refresh(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t iohideventsystem_client_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 75013) >= 0xFFFFFFF3
    && (int v5 = (void (*)(void))*(&_iohideventsystem_client_subsystem + 5 * (v4 - 75000) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t io_object_get_class(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF000000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_object_conforms_to(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAF100000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_iterator_next(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF200000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_iterator_reset(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF300000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_service_get_matching_services(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAF400000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_entry_get_property(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAF500000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v15 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill(v18, a2, 128);
  }
  else {
    int v7 = mig_strncpy(v18, a2, 128);
  }
  unsigned int v16 = 0;
  int v17 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v18[(v7 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v14.msgh_bits = 5395;
  v14.msgh_size = v8;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.msgh_voucher_port = 0xAF600000000LL;
  uint64_t v10 = mach_msg2_internal();
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v14.msgh_id == 2906)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996LL;
          if ((_DWORD)v15 == 1 && v14.msgh_size == 40 && !v14.msgh_remote_port && HIWORD(v17) << 16 == 1114112)
          {
            uint64_t v11 = 0LL;
            *a4 = HIDWORD(v15);
            return v11;
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v11 = 4294966996LL;
          if (v16)
          {
            if (v14.msgh_remote_port) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = v16;
            }
          }
        }

        else
        {
          uint64_t v11 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v11;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v14.msgh_local_port);
  }

  return v11;
}

uint64_t io_registry_iterator_enter_entry(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF700000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_iterator_exit_entry(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF800000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_from_path(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAF900000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_entry_get_name(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAFA00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_get_properties(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAFB00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_get_property_bytes(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = MEMORY[0x1895F8858](a1, a2);
  mach_msg_header_t v5 = v4;
  int v7 = v6;
  unsigned int v8 = v2;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v22 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v9 = mig_strncpy_zerofill(__n_4, v3, 128);
  }
  else {
    int v9 = mig_strncpy(__n_4, v3, 128);
  }
  unsigned int v23 = 0;
  mach_msg_size_t __n = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 44;
  int v11 = *v5;
  *(_DWORD *)&__n_4[(v9 + 3) & 0xFFFFFFFC] = v11;
  mach_port_t reply_port = mig_get_reply_port();
  v21.msgh_bits = 5395;
  v21.msgh_size = v10;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, v8);
  *(void *)&v21.msgh_voucher_port = 0xAFC00000000LL;
  uint64_t v13 = mach_msg2_internal();
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v21.msgh_local_port);
    return v14;
  }

  if ((_DWORD)v13)
  {
    mig_dealloc_reply_port(v21.msgh_local_port);
    return v14;
  }

  if (v21.msgh_id == 71)
  {
    uint64_t v14 = 4294966988LL;
LABEL_30:
    mach_msg_destroy(&v21);
    return v14;
  }

  if (v21.msgh_id != 2912)
  {
    uint64_t v14 = 4294966995LL;
    goto LABEL_30;
  }

  if ((v21.msgh_bits & 0x80000000) != 0) {
    goto LABEL_29;
  }
  if (v21.msgh_size - 4137 <= 0xFFFFEFFE)
  {
    if (v21.msgh_remote_port) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v23 == 0;
    }
    if (!v16 && v21.msgh_size == 36) {
      uint64_t v14 = v23;
    }
    else {
      uint64_t v14 = 4294966996LL;
    }
    goto LABEL_30;
  }

  if (v21.msgh_remote_port)
  {
LABEL_29:
    uint64_t v14 = 4294966996LL;
    goto LABEL_30;
  }

  uint64_t v14 = v23;
  if (v23) {
    goto LABEL_30;
  }
  mach_msg_size_t v19 = __n;
  uint64_t v14 = 4294966996LL;
  if (__n > 0x1000 || v21.msgh_size - 40 < __n || v21.msgh_size != ((__n + 3) & 0xFFFFFFFC) + 40) {
    goto LABEL_30;
  }
  size_t v20 = *v5;
  if (__n <= v20)
  {
    memcpy(v7, __n_4, __n);
    uint64_t v14 = 0LL;
    int *v5 = v19;
  }

  else
  {
    memcpy(v7, __n_4, v20);
    int *v5 = v19;
    return 4294966989LL;
  }

  return v14;
}

uint64_t io_registry_entry_get_child_iterator(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAFD00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_entry_get_parent_iterator(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xAFE00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_service_close(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0000000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_connect_get_service(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0100000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_connect_add_client(unsigned int a1, int a2)
{
  int v7 = 1;
  int v8 = a2;
  int v9 = 1245184;
  *(void *)&v6.msgh_bits = 0x2880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0400000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_connect_set_properties(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0500000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v6);
  }

  return v4;
}

uint64_t io_registry_entry_get_path(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB0A00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_get_root_entry(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0B00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_set_properties(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0C00000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v6);
  }

  return v4;
}

uint64_t io_registry_entry_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB0D00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_object_get_retain_count(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0E00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_service_get_busy_state(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0F00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_service_wait_quiet(unsigned int a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F8468];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1000000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_registry_entry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v15 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill(v18, a2, 128);
  }
  else {
    int v7 = mig_strncpy(v18, a2, 128);
  }
  unsigned int v16 = 0;
  int v17 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v18[(v7 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v14.msgh_bits = 5395;
  v14.msgh_size = v8;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.msgh_voucher_port = 0xB1100000000LL;
  uint64_t v10 = mach_msg2_internal();
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v14.msgh_id == 2933)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996LL;
          if ((_DWORD)v15 == 1 && v14.msgh_size == 40 && !v14.msgh_remote_port && HIWORD(v17) << 16 == 1114112)
          {
            uint64_t v11 = 0LL;
            *a4 = HIDWORD(v15);
            return v11;
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v11 = 4294966996LL;
          if (v16)
          {
            if (v14.msgh_remote_port) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = v16;
            }
          }
        }

        else
        {
          uint64_t v11 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v11;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v14.msgh_local_port);
  }

  return v11;
}

uint64_t io_iterator_is_valid(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1200000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_catalog_send_data(unsigned int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v8 = 1;
  uint64_t v9 = a3;
  int v10 = 16777472;
  int v11 = a4;
  uint64_t v12 = *MEMORY[0x1895F8468];
  int v13 = a2;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB1400000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }

  else
  {
    uint64_t v5 = 4294966995LL;
    mach_msg_destroy(&v7);
  }

  return v5;
}

uint64_t io_catalog_terminate(unsigned int a1, int a2, char *src)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x1895F8468];
  int v11 = a2;
  if (MEMORY[0x1895FBEC0]) {
    int v4 = mig_strncpy_zerofill(v14, src, 128);
  }
  else {
    int v4 = mig_strncpy(v14, src, 128);
  }
  int v12 = 0;
  int v13 = v4;
  v9.msgh_bits = 5395;
  v9.msgh_size = ((v4 + 3) & 0xFFFFFFFC) + 44;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v9.msgh_voucher_port = 0xB1500000000LL;
  uint64_t v5 = mach_msg2_internal();
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
    }

    else
    {
      uint64_t v6 = 4294966995LL;
      mach_msg_destroy(&v9);
    }
  }

  else
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  return v6;
}

uint64_t io_catalog_get_data(unsigned int a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *MEMORY[0x1895F8468];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1600000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_catalog_get_gen_count(unsigned int a1)
{
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1700000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_catalog_module_loaded(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB1800000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_catalog_reset(unsigned int a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F8468];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1900000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_service_request_probe(unsigned int a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F8468];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1A00000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_registry_entry_get_name_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB1B00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_service_match_property_table(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB1C00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_connect_get_notification_semaphore(unsigned int a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F8468];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2400000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_registry_entry_get_location_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB2600000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_entry_get_property_recursively( unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  *(void *)int v27 = *MEMORY[0x1895F8468];
  int v11 = MEMORY[0x1895FBEC0];
  if (MEMORY[0x1895FBEC0]) {
    int v12 = mig_strncpy_zerofill((char *)v29, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)v29, a2, 128);
  }
  *(_DWORD *)&v27[8] = 0;
  int v28 = v12;
  unsigned int v13 = ((v12 + 3) & 0xFFFFFFFC) + 52;
  int v14 = (char *)&v26 + ((v12 + 3) & 0xFFFFFFFC);
  uint64_t v15 = v14 - 128;
  unsigned int v16 = v14 + 48;
  if (v11) {
    int v17 = mig_strncpy_zerofill(v16, a3, 128);
  }
  else {
    int v17 = mig_strncpy(v16, a3, 128);
  }
  *((_DWORD *)v15 + 42) = 0;
  *((_DWORD *)v15 + 43) = v17;
  uint64_t v18 = (v17 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v19 = v13 + v18;
  *(_DWORD *)&v15[v18 + 176] = a4;
  mach_port_t reply_port = mig_get_reply_port();
  v26.msgh_bits = 5395;
  v26.msgh_size = v19;
  *(void *)&v26.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v26.msgh_voucher_port = 0xB2700000000LL;
  uint64_t v21 = mach_msg2_internal();
  uint64_t v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v21)
    {
      if (v26.msgh_id == 71)
      {
        uint64_t v22 = 4294966988LL;
      }

      else if (v26.msgh_id == 2955)
      {
        if ((v26.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v22 = 4294966996LL;
          if (*(_DWORD *)v27 == 1 && v26.msgh_size == 56 && !v26.msgh_remote_port && HIBYTE(v28) == 1)
          {
            int v24 = v29[0];
            if (v29[0] == v29[3])
            {
              uint64_t v22 = 0LL;
              *a5 = *(void *)&v27[4];
              *a6 = v24;
              return v22;
            }
          }
        }

        else if (v26.msgh_size == 36)
        {
          uint64_t v22 = 4294966996LL;
          if (*(_DWORD *)&v27[8])
          {
            if (v26.msgh_remote_port) {
              uint64_t v22 = 4294966996LL;
            }
            else {
              uint64_t v22 = *(unsigned int *)&v27[8];
            }
          }
        }

        else
        {
          uint64_t v22 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v22 = 4294966995LL;
      }

      mach_msg_destroy(&v26);
      return v22;
    }

    mig_dealloc_reply_port(v26.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v26.msgh_local_port);
  }

  return v22;
}

uint64_t io_service_get_state(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB2800000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_service_get_matching_services_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2900000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v6);
  }

  return v4;
}

uint64_t io_service_match_property_table_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2A00000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v6);
  }

  return v4;
}

uint64_t io_object_get_superclass(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB2C00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_object_get_bundle_identifier(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB2D00000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_service_open_extended(unsigned int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v10 = 2;
  int v11 = a2;
  int v12 = 1245184;
  uint64_t v13 = a5;
  int v14 = 0x1000000;
  int v15 = a6;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = a6;
  *(void *)&v9.msgh_bits = 0x5080001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v9.msgh_voucher_port = 0xB2E00000000LL;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  else if ((_DWORD)v6)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  else
  {
    uint64_t v7 = 4294966995LL;
    mach_msg_destroy(&v9);
  }

  return v7;
}

uint64_t io_connect_map_memory_into_task(unsigned int a1, int a2, int a3, uint64_t *a4, uint64_t *a5, int a6)
{
  int v10 = 1;
  int v11 = a3;
  v12[0] = 1245184;
  *(void *)&v12[1] = *MEMORY[0x1895F8468];
  v12[3] = a2;
  uint64_t v13 = *a4;
  uint64_t v14 = *a5;
  int v15 = a6;
  *(void *)&v9.msgh_bits = 0x4880001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v9.msgh_voucher_port = 0xB2F00000000LL;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  else if ((_DWORD)v6)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  else
  {
    uint64_t v7 = 4294966995LL;
    mach_msg_destroy(&v9);
  }

  return v7;
}

uint64_t io_connect_unmap_memory_from_task(unsigned int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v8 = 1;
  int v9 = a3;
  int v10 = 1245184;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a2;
  uint64_t v13 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB3000000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }

  else
  {
    uint64_t v5 = 4294966995LL;
    mach_msg_destroy(&v7);
  }

  return v5;
}

uint64_t io_connect_method( uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__dst, int *a10, void *a11, int *a12, uint64_t a13, void *a14)
{
  unsigned int v14 = MEMORY[0x1895F8858](a1, a2);
  *(void *)&__n_4[4268] = *MEMORY[0x1895F89C0];
  uint64_t v50 = *MEMORY[0x1895F8468];
  unsigned int v51 = v20;
  if (v15 <= 0x10)
  {
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    unsigned int v23 = v17;
    int v24 = v16;
    mach_msg_size_t v25 = v15;
    unsigned int v26 = v14;
    uint64_t v27 = 8 * v15;
    __memcpy_chk();
    mach_msg_size_t __n = v25;
    if (v23 <= 0x1000)
    {
      uint64_t v30 = (char *)&v49 + v27;
      uint64_t v31 = (v23 + 3) & 0xFFFFFFFC;
      uint64_t v32 = (char *)&v49 + v27 + v31;
      int v33 = v27 + v31;
      memcpy(v30 + 44, v24, v23);
      *((_DWORD *)v30 + 10) = v23;
      *(void *)(v32 + 44) = v22;
      *(void *)(v32 + 52) = v21;
      int v34 = *a10;
      *((_DWORD *)v32 + 15) = v34;
      int v35 = *a12;
      *((_DWORD *)v32 + 16) = v35;
      *(void *)(v32 + 68) = a13;
      *(void *)(v32 + 76) = *a14;
      mach_port_t reply_port = mig_get_reply_port();
      v49.msgh_bits = 5395;
      v49.msgh_size = v33 + 84;
      *(void *)&v49.msgh_remote_port = __PAIR64__(reply_port, v26);
      *(void *)&v49.msgh_voucher_port = 0xB3100000000LL;
      uint64_t v37 = mach_msg2_internal();
      uint64_t v28 = v37;
      if ((v37 - 268435458) <= 0xE && ((1 << (v37 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(v49.msgh_local_port);
        return v28;
      }

      if ((_DWORD)v37)
      {
        mig_dealloc_reply_port(v49.msgh_local_port);
        return v28;
      }

      if (v49.msgh_id == 71)
      {
        uint64_t v28 = 4294966988LL;
      }

      else if (v49.msgh_id == 2965)
      {
        if ((v49.msgh_bits & 0x80000000) != 0) {
          goto LABEL_30;
        }
        if (v49.msgh_size - 4277 <= 0xFFFFEF7E)
        {
          if (v49.msgh_remote_port) {
            BOOL v38 = 1;
          }
          else {
            BOOL v38 = v51 == 0;
          }
          if (!v38 && v49.msgh_size == 36) {
            uint64_t v28 = v51;
          }
          else {
            uint64_t v28 = 4294966996LL;
          }
          goto LABEL_31;
        }

        if (v49.msgh_remote_port) {
          goto LABEL_30;
        }
        uint64_t v28 = v51;
        if (v51) {
          goto LABEL_31;
        }
        if (__n > 0x1000)
        {
LABEL_30:
          uint64_t v28 = 4294966996LL;
        }

        else
        {
          uint64_t v28 = 4294966996LL;
          if (v49.msgh_size - 52 >= __n)
          {
            unsigned int v40 = (__n + 3) & 0xFFFFFFFC;
            if (v49.msgh_size >= v40 + 52)
            {
              v41 = (char *)&v49 + v40;
              mach_msg_size_t v42 = *((_DWORD *)v41 + 10);
              if (v42 <= 0x10 && v42 <= (v49.msgh_size - v40 - 52) >> 3)
              {
                unsigned int v43 = 8 * v42;
                if (v49.msgh_size - v40 == 8 * v42 + 52)
                {
                  size_t v44 = *a10;
                  mach_msg_size_t v45 = __n;
                  if (__n <= v44)
                  {
                    uint64_t v46 = v41 - 4096;
                    memcpy(__dst, __n_4, __n);
                    *a10 = v45;
                    unsigned int v47 = *((_DWORD *)v46 + 1034);
                    uint64_t v48 = v46 + 4140;
                    if (v47 <= *a12)
                    {
                      memcpy(a11, v48, 8 * v47);
                      uint64_t v28 = 0LL;
                      *a12 = *((_DWORD *)v46 + 1034);
                      *a14 = *(void *)&v46[v43 + 4140];
                      return v28;
                    }

                    memcpy(a11, v48, (8 * *a12));
                    *a12 = *((_DWORD *)v46 + 1034);
                  }

                  else
                  {
                    memcpy(__dst, __n_4, v44);
                    *a10 = v45;
                  }

                  return 4294966989LL;
                }
              }
            }
          }
        }
      }

      else
      {
        uint64_t v28 = 4294966995LL;
      }

uint64_t io_connect_async_method( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int a9, uint64_t a10, uint64_t a11, void *__dst, int *a13, void *a14, int *a15, uint64_t a16, void *a17)
{
  unsigned int v17 = MEMORY[0x1895F8858]();
  uint64_t v60 = *MEMORY[0x1895F89C0];
  int v56 = 1;
  int v57 = v23;
  __n[0] = 1310720;
  *(void *)&__n[1] = *MEMORY[0x1895F8468];
  if (v18 <= 8)
  {
    int v24 = v22;
    unsigned int v25 = v21;
    unsigned int v26 = v20;
    int v27 = v19;
    unsigned int v28 = v18;
    unsigned int v29 = v17;
    uint64_t v30 = 8 * v18;
    __memcpy_chk();
    __n[3] = v28;
    uint64_t v31 = (char *)&v55 + v30;
    *(_DWORD *)((char *)&v55 + v30 + 52) = v27;
    if (v25 <= 0x10)
    {
      uint64_t v32 = v31 - 64;
      size_t v33 = 8 * v25;
      memcpy(v31 + 60, v26, v33);
      *((_DWORD *)v32 + 30) = v25;
      if (a9 <= 0x1000)
      {
        CFTypeID v36 = &v32[v33];
        uint64_t v37 = (a9 + 3) & 0xFFFFFFFC;
        BOOL v38 = &v36[v37];
        int v39 = v30 + v33 + v37;
        memcpy(v36 + 128, v24, a9);
        *((_DWORD *)v36 + 31) = a9;
        *((void *)v38 + 16) = a10;
        *((void *)v38 + 17) = a11;
        int v40 = *a13;
        *((_DWORD *)v38 + 36) = v40;
        int v41 = *a15;
        *((_DWORD *)v38 + 37) = v41;
        *((void *)v38 + 19) = a16;
        *((void *)v38 + 20) = *a17;
        mach_port_t reply_port = mig_get_reply_port();
        v55.msgh_bits = -2147478253;
        v55.msgh_size = v39 + 104;
        *(void *)&v55.msgh_remote_port = __PAIR64__(reply_port, v29);
        *(void *)&v55.msgh_voucher_port = 0xB3200000000LL;
        uint64_t v43 = mach_msg2_internal();
        uint64_t v34 = v43;
        if ((v43 - 268435458) <= 0xE && ((1 << (v43 - 2)) & 0x4003) != 0)
        {
          mig_put_reply_port(v55.msgh_local_port);
          return v34;
        }

        if ((_DWORD)v43)
        {
          mig_dealloc_reply_port(v55.msgh_local_port);
          return v34;
        }

        if (v55.msgh_id == 71)
        {
          uint64_t v34 = 4294966988LL;
        }

        else if (v55.msgh_id == 2966)
        {
          if ((v55.msgh_bits & 0x80000000) != 0) {
            goto LABEL_31;
          }
          if (v55.msgh_size - 4277 <= 0xFFFFEF7E)
          {
            if (v55.msgh_remote_port) {
              BOOL v44 = 1;
            }
            else {
              BOOL v44 = v58 == 0;
            }
            if (!v44 && v55.msgh_size == 36) {
              uint64_t v34 = v58;
            }
            else {
              uint64_t v34 = 4294966996LL;
            }
            goto LABEL_32;
          }

          if (v55.msgh_remote_port) {
            goto LABEL_31;
          }
          uint64_t v34 = v58;
          if (v58) {
            goto LABEL_32;
          }
          int v46 = __n[0];
          if (__n[0] > 0x1000u)
          {
LABEL_31:
            uint64_t v34 = 4294966996LL;
          }

          else
          {
            uint64_t v34 = 4294966996LL;
            if (v55.msgh_size - 52 >= __n[0])
            {
              unsigned int v47 = (__n[0] + 3) & 0xFFFFFFFC;
              if (v55.msgh_size >= v47 + 52)
              {
                uint64_t v48 = (char *)&v55 + v47;
                mach_msg_size_t v49 = *((_DWORD *)v48 + 10);
                if (v49 <= 0x10 && v49 <= (v55.msgh_size - v47 - 52) >> 3)
                {
                  unsigned int v50 = 8 * v49;
                  if (v55.msgh_size - v47 == 8 * v49 + 52)
                  {
                    size_t v51 = *a13;
                    if (__n[0] <= v51)
                    {
                      int v52 = v48 - 4096;
                      memcpy(__dst, &__n[1], __n[0]);
                      *a13 = v46;
                      unsigned int v53 = *((_DWORD *)v52 + 1034);
                      IOReturn v54 = v52 + 4140;
                      if (v53 <= *a15)
                      {
                        memcpy(a14, v54, 8 * v53);
                        uint64_t v34 = 0LL;
                        *a15 = *((_DWORD *)v52 + 1034);
                        *a17 = *(void *)&v52[v50 + 4140];
                        return v34;
                      }

                      memcpy(a14, v54, (8 * *a15));
                      *a15 = *((_DWORD *)v52 + 1034);
                    }

                    else
                    {
                      memcpy(__dst, &__n[1], v51);
                      *a13 = v46;
                    }

                    return 4294966989LL;
                  }
                }
              }
            }
          }
        }

        else
        {
          uint64_t v34 = 4294966995LL;
        }

uint64_t io_connect_set_notification_port(unsigned int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v8 = 1;
  int v9 = a3;
  int v10 = 1310720;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a2;
  uint64_t v13 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB3300000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }

  else
  {
    uint64_t v5 = 4294966995LL;
    mach_msg_destroy(&v7);
  }

  return v5;
}

uint64_t io_service_add_notification( unsigned int a1, const char *a2, const char *a3, int a4, const void *a5, unsigned int a6, _DWORD *a7)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  int v26 = 1;
  int v27 = a4;
  int v29 = 1310720;
  uint64_t v30 = *MEMORY[0x1895F8468];
  int v12 = MEMORY[0x1895FBEC0];
  if (MEMORY[0x1895FBEC0]) {
    int v13 = mig_strncpy_zerofill(v33, a2, 128);
  }
  else {
    int v13 = mig_strncpy(v33, a2, 128);
  }
  int v31 = 0;
  int v32 = v13;
  unsigned int v14 = (v13 + 3) & 0xFFFFFFFC;
  unsigned int v15 = (char *)&v25 + v14;
  uint64_t v16 = v15 - 128;
  unsigned int v17 = v15 + 64;
  if (v12) {
    int v18 = mig_strncpy_zerofill(v17, a3, 512);
  }
  else {
    int v18 = mig_strncpy(v17, a3, 512);
  }
  *((_DWORD *)v16 + 46) = 0;
  *((_DWORD *)v16 + 47) = v18;
  if (a6 > 8) {
    return 4294966989LL;
  }
  uint64_t v20 = (v18 + 3) & 0xFFFFFFFC;
  memcpy(&v16[v20 + 196], a5, 8 * a6);
  *(_DWORD *)&v16[v20 + 192] = a6;
  mach_port_t reply_port = mig_get_reply_port();
  v25.msgh_bits = -2147478253;
  v25.msgh_size = v14 + 8 * a6 + v20 + 68;
  *(void *)&v25.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v25.msgh_voucher_port = 0xB3400000000LL;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v19 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v22)
    {
      if (v25.msgh_id == 71)
      {
        uint64_t v19 = 4294966988LL;
      }

      else if (v25.msgh_id == 2968)
      {
        if ((v25.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v19 = 4294966996LL;
          if (v26 == 1 && v25.msgh_size == 40 && !v25.msgh_remote_port && HIWORD(v29) << 16 == 1114112)
          {
            uint64_t v19 = 0LL;
            *a7 = v27;
            return v19;
          }
        }

        else if (v25.msgh_size == 36)
        {
          uint64_t v19 = 4294966996LL;
          if (v28)
          {
            if (v25.msgh_remote_port) {
              uint64_t v19 = 4294966996LL;
            }
            else {
              uint64_t v19 = v28;
            }
          }
        }

        else
        {
          uint64_t v19 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v19 = 4294966995LL;
      }

      mach_msg_destroy(&v25);
      return v19;
    }

    mig_dealloc_reply_port(v25.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v25.msgh_local_port);
  }

  return v19;
}

uint64_t io_service_add_interest_notification( unsigned int a1, const char *a2, int a3, const void *a4, unsigned int a5, _DWORD *a6)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v19 = 1;
  int v20 = a3;
  int v22 = 1310720;
  uint64_t v23 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v10 = mig_strncpy_zerofill(v26, a2, 128);
  }
  else {
    int v10 = mig_strncpy(v26, a2, 128);
  }
  int v24 = 0;
  int v25 = v10;
  if (a5 > 8) {
    return 4294966989LL;
  }
  unsigned int v12 = (v10 + 3) & 0xFFFFFFFC;
  int v13 = (char *)&v18 + v12;
  memcpy(v13 + 60, a4, 8 * a5);
  *((_DWORD *)v13 + 14) = a5;
  mach_port_t reply_port = mig_get_reply_port();
  v18.msgh_bits = -2147478253;
  v18.msgh_size = v12 + 8 * a5 + 60;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v18.msgh_voucher_port = 0xB3500000000LL;
  uint64_t v15 = mach_msg2_internal();
  uint64_t v11 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v15)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v18.msgh_id == 2969)
      {
        if ((v18.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996LL;
          if (v19 == 1 && v18.msgh_size == 40 && !v18.msgh_remote_port && HIWORD(v22) << 16 == 1114112)
          {
            uint64_t v11 = 0LL;
            *a6 = v20;
            return v11;
          }
        }

        else if (v18.msgh_size == 36)
        {
          uint64_t v11 = 4294966996LL;
          if (v21)
          {
            if (v18.msgh_remote_port) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = v21;
            }
          }
        }

        else
        {
          uint64_t v11 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

      mach_msg_destroy(&v18);
      return v11;
    }

    mig_dealloc_reply_port(v18.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v18.msgh_local_port);
  }

  return v11;
}

uint64_t io_service_add_notification_ool( unsigned int a1, const char *a2, uint64_t a3, int a4, int a5, const void *a6, unsigned int a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  int v24 = 2;
  uint64_t v25 = a3;
  int v26 = 0x1000000;
  int v27 = a4;
  int v28 = a5;
  int v30 = 1310720;
  uint64_t v31 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v14 = mig_strncpy_zerofill(v34, a2, 128);
  }
  else {
    int v14 = mig_strncpy(v34, a2, 128);
  }
  int v32 = 0;
  int v33 = v14;
  unsigned int v15 = (v14 + 3) & 0xFFFFFFFC;
  uint64_t v16 = (char *)&v23 + v15;
  *((_DWORD *)v16 + 18) = a4;
  if (a7 > 8) {
    return 4294966989LL;
  }
  mach_msg_header_t v18 = v16 - 128;
  memcpy(v16 + 80, a6, 8 * a7);
  *((_DWORD *)v18 + 51) = a7;
  mach_port_t reply_port = mig_get_reply_port();
  v23.msgh_bits = -2147478253;
  v23.msgh_size = v15 + 8 * a7 + 80;
  *(void *)&v23.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v23.msgh_voucher_port = 0xB3600000000LL;
  uint64_t v20 = mach_msg2_internal();
  uint64_t v17 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v23.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v20)
    {
      if (v23.msgh_id == 71)
      {
        uint64_t v17 = 4294966988LL;
      }

      else if (v23.msgh_id == 2970)
      {
        if ((v23.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996LL;
          if (v24 == 1 && v23.msgh_size == 52 && !v23.msgh_remote_port && HIWORD(v26) << 16 == 1114112)
          {
            uint64_t v17 = 0LL;
            int v21 = v25;
            *a8 = v29;
            *a9 = v21;
            return v17;
          }
        }

        else if (v23.msgh_size == 36)
        {
          uint64_t v17 = 4294966996LL;
          if (HIDWORD(v25))
          {
            if (v23.msgh_remote_port) {
              uint64_t v17 = 4294966996LL;
            }
            else {
              uint64_t v17 = HIDWORD(v25);
            }
          }
        }

        else
        {
          uint64_t v17 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v17 = 4294966995LL;
      }

      mach_msg_destroy(&v23);
      return v17;
    }

    mig_dealloc_reply_port(v23.msgh_local_port);
  }

  return v17;
}

uint64_t io_registry_entry_get_registry_entry_id(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3700000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_connect_method_var_output( uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__dst, int *a10, void *a11, int *a12, void *a13, _DWORD *a14)
{
  unsigned int v14 = MEMORY[0x1895F8858](a1, a2);
  __n_4[530] = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v48 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v48[8] = v20;
  if (v15 <= 0x10)
  {
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    unsigned int v23 = v17;
    int v24 = v16;
    unsigned int v25 = v15;
    unsigned int v26 = v14;
    uint64_t v27 = 8 * v15;
    __memcpy_chk();
    unsigned int v49 = v25;
    if (v23 <= 0x1000)
    {
      int v30 = (char *)&v47 + v27;
      uint64_t v31 = (v23 + 3) & 0xFFFFFFFC;
      int v32 = (char *)&v47 + v27 + v31;
      int v33 = v27 + v31;
      memcpy(v30 + 44, v24, v23);
      *((_DWORD *)v30 + 10) = v23;
      *(void *)(v32 + 44) = v22;
      *(void *)(v32 + 52) = v21;
      int v34 = *a10;
      *((_DWORD *)v32 + 15) = v34;
      int v35 = *a12;
      *((_DWORD *)v32 + 16) = v35;
      mach_port_t reply_port = mig_get_reply_port();
      v47.msgh_bits = 5395;
      v47.msgh_size = v33 + 68;
      *(void *)&v47.msgh_remote_port = __PAIR64__(reply_port, v26);
      *(void *)&v47.msgh_voucher_port = 0xB3800000000LL;
      uint64_t v37 = mach_msg2_internal();
      uint64_t v28 = v37;
      if ((v37 - 268435458) <= 0xE && ((1 << (v37 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(v47.msgh_local_port);
        return v28;
      }

      if ((_DWORD)v37)
      {
        mig_dealloc_reply_port(v47.msgh_local_port);
        return v28;
      }

      if (v47.msgh_id == 71)
      {
        uint64_t v28 = 4294966988LL;
      }

      else if (v47.msgh_id == 2972)
      {
        if ((v47.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v28 = 4294966996LL;
          if (*(_DWORD *)v48 == 1
            && v47.msgh_size >= 0x40
            && v47.msgh_size <= 0x10C0
            && !v47.msgh_remote_port
            && HIBYTE(v49) == 1
            && __n <= 0x1000
            && v47.msgh_size - 64 >= __n)
          {
            unsigned int v38 = (__n + 3) & 0xFFFFFFFC;
            if (v47.msgh_size >= v38 + 64)
            {
              int v39 = (char *)&v47 + v38;
              mach_msg_size_t v40 = *((_DWORD *)v39 + 14);
              if (v40 <= 0x10 && v40 <= (v47.msgh_size - v38 - 64) >> 3 && v47.msgh_size - v38 == 8 * v40 + 64)
              {
                int v41 = v39 - 4096;
                uint64_t v42 = (uint64_t)&v39[8 * v40 - 4096];
                if (v50 == *(_DWORD *)(v42 + 4156))
                {
                  size_t v43 = *a10;
                  mach_msg_size_t v44 = __n;
                  if (__n <= v43)
                  {
                    memcpy(__dst, __n_4, __n);
                    *a10 = v44;
                    unsigned int v45 = *((_DWORD *)v41 + 1038);
                    int v46 = v41 + 4156;
                    if (v45 <= *a12)
                    {
                      memcpy(a11, v46, 8 * v45);
                      uint64_t v28 = 0LL;
                      *a12 = *((_DWORD *)v41 + 1038);
                      *a13 = *(void *)&v48[4];
                      *a14 = *(_DWORD *)(v42 + 4156);
                      return v28;
                    }

                    memcpy(a11, v46, (8 * *a12));
                    *a12 = *((_DWORD *)v41 + 1038);
                  }

                  else
                  {
                    memcpy(__dst, __n_4, v43);
                    *a10 = v44;
                  }

                  return 4294966989LL;
                }
              }
            }
          }
        }

        else if (v47.msgh_size == 36)
        {
          uint64_t v28 = 4294966996LL;
          if (*(_DWORD *)&v48[8])
          {
            if (v47.msgh_remote_port) {
              uint64_t v28 = 4294966996LL;
            }
            else {
              uint64_t v28 = *(unsigned int *)&v48[8];
            }
          }
        }

        else
        {
          uint64_t v28 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v28 = 4294966995LL;
      }

      mach_msg_destroy(&v47);
      return v28;
    }
  }

  return 4294966989LL;
}

uint64_t io_service_get_matching_service(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB3900000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_service_get_matching_service_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3A00000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v6);
  }

  return v4;
}

uint64_t io_service_get_authorization_id(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3B00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_service_set_authorization_id(unsigned int a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F8468];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513LL;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3C00000000LL;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }

    else
    {
      uint64_t v3 = 4294966995LL;
      mach_msg_destroy(&v6);
    }
  }

  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }

  return v3;
}

uint64_t io_server_version(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3D00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_get_properties_bin(unsigned int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&v5.msgh_bits = 0x1800001513LL;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3E00000000LL;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }

    else
    {
      uint64_t v2 = 4294966995LL;
      mach_msg_destroy(&v5);
    }
  }

  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }

  return v2;
}

uint64_t io_registry_entry_get_property_bin( unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v27 = *MEMORY[0x1895F8468];
  uint64_t v11 = MEMORY[0x1895FBEC0];
  if (MEMORY[0x1895FBEC0]) {
    int v12 = mig_strncpy_zerofill((char *)v29, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)v29, a2, 128);
  }
  *(_DWORD *)&v27[8] = 0;
  int v28 = v12;
  unsigned int v13 = ((v12 + 3) & 0xFFFFFFFC) + 52;
  unsigned int v14 = (char *)&v26 + ((v12 + 3) & 0xFFFFFFFC);
  unsigned int v15 = v14 - 128;
  uint64_t v16 = v14 + 48;
  if (v11) {
    int v17 = mig_strncpy_zerofill(v16, a3, 128);
  }
  else {
    int v17 = mig_strncpy(v16, a3, 128);
  }
  *((_DWORD *)v15 + 42) = 0;
  *((_DWORD *)v15 + 43) = v17;
  uint64_t v18 = (v17 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v19 = v13 + v18;
  *(_DWORD *)&v15[v18 + 176] = a4;
  mach_port_t reply_port = mig_get_reply_port();
  v26.msgh_bits = 5395;
  v26.msgh_size = v19;
  *(void *)&v26.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v26.msgh_voucher_port = 0xB3F00000000LL;
  uint64_t v21 = mach_msg2_internal();
  uint64_t v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v21)
    {
      if (v26.msgh_id == 71)
      {
        uint64_t v22 = 4294966988LL;
      }

      else if (v26.msgh_id == 2979)
      {
        if ((v26.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v22 = 4294966996LL;
          if (*(_DWORD *)v27 == 1 && v26.msgh_size == 56 && !v26.msgh_remote_port && HIBYTE(v28) == 1)
          {
            int v24 = v29[0];
            if (v29[0] == v29[3])
            {
              uint64_t v22 = 0LL;
              *a5 = *(void *)&v27[4];
              *a6 = v24;
              return v22;
            }
          }
        }

        else if (v26.msgh_size == 36)
        {
          uint64_t v22 = 4294966996LL;
          if (*(_DWORD *)&v27[8])
          {
            if (v26.msgh_remote_port) {
              uint64_t v22 = 4294966996LL;
            }
            else {
              uint64_t v22 = *(unsigned int *)&v27[8];
            }
          }
        }

        else
        {
          uint64_t v22 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v22 = 4294966995LL;
      }

      mach_msg_destroy(&v26);
      return v22;
    }

    mig_dealloc_reply_port(v26.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v26.msgh_local_port);
  }

  return v22;
}

uint64_t io_service_get_matching_service_bin(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = MEMORY[0x1895F8858](a1, a2);
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x1895F8468];
  if (v3 > 0x1000) {
    return 4294966989LL;
  }
  unsigned int v5 = v3;
  unsigned int v6 = v2;
  __memcpy_chk();
  unsigned int v11 = v5;
  v9.msgh_bits = 5395;
  v9.msgh_size = ((v5 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), v6);
  *(void *)&v9.msgh_voucher_port = 0xB4000000000LL;
  uint64_t v7 = mach_msg2_internal();
  uint64_t v4 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  else if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v9);
  }

  return v4;
}

uint64_t io_service_get_matching_services_bin(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = MEMORY[0x1895F8858](a1, a2);
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x1895F8468];
  if (v3 > 0x1000) {
    return 4294966989LL;
  }
  unsigned int v5 = v3;
  unsigned int v6 = v2;
  __memcpy_chk();
  unsigned int v11 = v5;
  v9.msgh_bits = 5395;
  v9.msgh_size = ((v5 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), v6);
  *(void *)&v9.msgh_voucher_port = 0xB4100000000LL;
  uint64_t v7 = mach_msg2_internal();
  uint64_t v4 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  else if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v9);
  }

  return v4;
}

uint64_t io_service_match_property_table_bin(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = MEMORY[0x1895F8858](a1, a2);
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x1895F8468];
  if (v3 > 0x1000) {
    return 4294966989LL;
  }
  unsigned int v5 = v3;
  unsigned int v6 = v2;
  __memcpy_chk();
  unsigned int v11 = v5;
  v9.msgh_bits = 5395;
  v9.msgh_size = ((v5 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&v9.msgh_remote_port = __PAIR64__(mig_get_reply_port(), v6);
  *(void *)&v9.msgh_voucher_port = 0xB4200000000LL;
  uint64_t v7 = mach_msg2_internal();
  uint64_t v4 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }

  else if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  else
  {
    uint64_t v4 = 4294966995LL;
    mach_msg_destroy(&v9);
  }

  return v4;
}

uint64_t io_service_add_notification_bin()
{
  unsigned int v0 = MEMORY[0x1895F8858]();
  unsigned int v3 = v2;
  unsigned int v5 = v4;
  uint64_t v7 = v6;
  unsigned int v9 = v8;
  unsigned int v11 = v10;
  unsigned int v12 = v0;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  int v24 = 1;
  int v25 = v13;
  int v27 = 1310720;
  uint64_t v28 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v14 = mig_strncpy_zerofill(v31, v1, 128);
  }
  else {
    int v14 = mig_strncpy(v31, v1, 128);
  }
  int v29 = 0;
  int v30 = v14;
  if (v9 > 0x1000) {
    return 4294966989LL;
  }
  unsigned int v15 = (v14 + 3) & 0xFFFFFFFC;
  uint64_t v16 = (char *)&v23 + v15;
  memcpy(v16 + 60, v11, v9);
  *((_DWORD *)v16 + 14) = v9;
  if (v5 > 8) {
    return 4294966989LL;
  }
  uint64_t v19 = (v9 + 3) & 0xFFFFFFFC;
  int v20 = &v16[v19 - 128];
  memcpy(v20 + 192, v7, 8 * v5);
  *((_DWORD *)v20 + 47) = v5;
  mach_port_t reply_port = mig_get_reply_port();
  v23.msgh_bits = -2147478253;
  v23.msgh_size = v19 + 8 * v5 + v15 + 64;
  *(void *)&v23.msgh_remote_port = __PAIR64__(reply_port, v12);
  *(void *)&v23.msgh_voucher_port = 0xB4400000000LL;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v17 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v23.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v22)
    {
      if (v23.msgh_id == 71)
      {
        uint64_t v17 = 4294966988LL;
      }

      else if (v23.msgh_id == 2984)
      {
        if ((v23.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996LL;
          if (v24 == 1 && v23.msgh_size == 40 && !v23.msgh_remote_port && HIWORD(v27) << 16 == 1114112)
          {
            uint64_t v17 = 0LL;
            *unsigned int v3 = v25;
            return v17;
          }
        }

        else if (v23.msgh_size == 36)
        {
          uint64_t v17 = 4294966996LL;
          if (v26)
          {
            if (v23.msgh_remote_port) {
              uint64_t v17 = 4294966996LL;
            }
            else {
              uint64_t v17 = v26;
            }
          }
        }

        else
        {
          uint64_t v17 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v17 = 4294966995LL;
      }

      mach_msg_destroy(&v23);
      return v17;
    }

    mig_dealloc_reply_port(v23.msgh_local_port);
  }

  return v17;
}

uint64_t io_registry_entry_get_path_ool()
{
  unsigned int v1 = MEMORY[0x1895F8858]();
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v2 = mig_strncpy_zerofill(v11, v0, 128);
  }
  else {
    int v2 = mig_strncpy(v11, v0, 128);
  }
  int v9 = 0;
  int v10 = v2;
  v7.msgh_bits = 5395;
  v7.msgh_size = ((v2 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), v1);
  *(void *)&v7.msgh_voucher_port = 0xB4500000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }

    else
    {
      uint64_t v4 = 4294966995LL;
      mach_msg_destroy(&v7);
    }
  }

  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  return v4;
}

uint64_t io_registry_entry_from_path_ool()
{
  unsigned int v0 = MEMORY[0x1895F8858]();
  uint64_t v3 = v2;
  unsigned int v5 = v4;
  int v7 = v6;
  unsigned int v8 = v0;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v19 = 1;
  uint64_t v20 = v9;
  int v21 = 0x1000000;
  int v22 = v6;
  uint64_t v23 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v10 = mig_strncpy_zerofill(v26, v1, 4096);
  }
  else {
    int v10 = mig_strncpy(v26, v1, 4096);
  }
  int v24 = 0;
  int v25 = v10;
  mach_msg_size_t v11 = ((v10 + 3) & 0xFFFFFFFC) + 64;
  *(_DWORD *)&v26[(v10 + 3) & 0xFFFFFFFC] = v7;
  mach_port_t reply_port = mig_get_reply_port();
  v18.msgh_bits = -2147478253;
  v18.msgh_size = v11;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, v8);
  *(void *)&v18.msgh_voucher_port = 0xB4600000000LL;
  uint64_t v13 = mach_msg2_internal();
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v18.msgh_id == 2986)
      {
        if ((v18.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v19 == 1 && v18.msgh_size == 52 && !v18.msgh_remote_port && HIWORD(v21) << 16 == 1114112)
          {
            uint64_t v14 = 0LL;
            int v16 = v20;
            _DWORD *v5 = HIDWORD(v23);
            *uint64_t v3 = v16;
            return v14;
          }
        }

        else if (v18.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v20))
          {
            if (v18.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v20);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&v18);
      return v14;
    }

    mig_dealloc_reply_port(v18.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v18.msgh_local_port);
  }

  return v14;
}

uint64_t io_device_tree_entry_exists_with_name(unsigned int a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v12, a2, 128);
  }
  else {
    int v3 = mig_strncpy(v12, a2, 128);
  }
  int v10 = 0;
  int v11 = v3;
  v8.msgh_bits = 5395;
  v8.msgh_size = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&v8.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v8.msgh_voucher_port = 0xB4700000000LL;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
    }

    else
    {
      uint64_t v5 = 4294966995LL;
      mach_msg_destroy(&v8);
    }
  }

  else
  {
    mig_put_reply_port(v8.msgh_local_port);
  }

  return v5;
}

uint64_t io_registry_entry_get_properties_bin_buf(unsigned int a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x1895F8468];
  uint64_t v9 = a2;
  uint64_t v10 = *a3;
  *(void *)&v7.msgh_bits = 0x3000001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB4800000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }

    else
    {
      uint64_t v4 = 4294966995LL;
      mach_msg_destroy(&v7);
    }
  }

  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  return v4;
}

uint64_t io_registry_entry_get_property_bin_buf( unsigned int a1, const char *a2, const char *a3, int a4, uint64_t a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v32 = *MEMORY[0x1895F8468];
  unsigned int v15 = MEMORY[0x1895FBEC0];
  if (MEMORY[0x1895FBEC0]) {
    int v16 = mig_strncpy_zerofill(v34, a2, 128);
  }
  else {
    int v16 = mig_strncpy(v34, a2, 128);
  }
  *(_DWORD *)&v32[8] = 0;
  int v33 = v16;
  unsigned int v17 = ((v16 + 3) & 0xFFFFFFFC) + 68;
  mach_msg_header_t v18 = (char *)&v31 + ((v16 + 3) & 0xFFFFFFFC);
  int v19 = v18 - 128;
  uint64_t v20 = v18 + 48;
  if (v15) {
    int v21 = mig_strncpy_zerofill(v20, a3, 128);
  }
  else {
    int v21 = mig_strncpy(v20, a3, 128);
  }
  *((_DWORD *)v19 + 42) = 0;
  *((_DWORD *)v19 + 43) = v21;
  uint64_t v22 = (v21 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v23 = v17 + v22;
  int v24 = &v19[v22];
  *((_DWORD *)v24 + 44) = a4;
  *(void *)(v24 + 180) = a5;
  *(void *)(v24 + 188) = *a6;
  mach_port_t reply_port = mig_get_reply_port();
  v31.msgh_bits = 5395;
  v31.msgh_size = v23;
  *(void *)&v31.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v31.msgh_voucher_port = 0xB4900000000LL;
  uint64_t v26 = mach_msg2_internal();
  uint64_t v27 = v26;
  if ((v26 - 268435458) > 0xE || ((1 << (v26 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v26)
    {
      if (v31.msgh_id == 71)
      {
        uint64_t v27 = 4294966988LL;
      }

      else if (v31.msgh_id == 2989)
      {
        if ((v31.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v27 = 4294966996LL;
          if (*(_DWORD *)v32 == 1 && v31.msgh_size == 64 && !v31.msgh_remote_port && HIBYTE(v33) == 1)
          {
            int v29 = *(_DWORD *)v34;
            if (*(_DWORD *)v34 == v36)
            {
              uint64_t v27 = 0LL;
              *a6 = v35;
              *a7 = *(void *)&v32[4];
              *a8 = v29;
              return v27;
            }
          }
        }

        else if (v31.msgh_size == 36)
        {
          uint64_t v27 = 4294966996LL;
          if (*(_DWORD *)&v32[8])
          {
            if (v31.msgh_remote_port) {
              uint64_t v27 = 4294966996LL;
            }
            else {
              uint64_t v27 = *(unsigned int *)&v32[8];
            }
          }
        }

        else
        {
          uint64_t v27 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v27 = 4294966995LL;
      }

      mach_msg_destroy(&v31);
      return v27;
    }

    mig_dealloc_reply_port(v31.msgh_local_port);
  }

  else
  {
    mig_put_reply_port(v31.msgh_local_port);
  }

  return v27;
}

uint64_t io_service_wait_quiet_with_options(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1895F8468];
  uint64_t v9 = a2;
  int v10 = a3;
  *(void *)&v7.msgh_bits = 0x2C00001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB4A00000000LL;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }

    else
    {
      uint64_t v4 = 4294966995LL;
      mach_msg_destroy(&v7);
    }
  }

  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }

  return v4;
}

uint64_t DisplayID::checksum(DisplayID *this, unint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = 0LL;
    unsigned __int8 v3 = 0;
    do
      v3 += *((_BYTE *)this + v2++);
    while (a2 > v2);
  }

  else
  {
    return 0;
  }

  return v3;
}

BOOL IOAVRecoverableError(int a1)
{
  return a1 != -536870208 && a1 != -536870173 && a1 != 0;
}

const char *IOAVCommandString(int a1)
{
  else {
    return off_189C515A8[a1 - 1];
  }
}

const char *IOAVEventLogEventTypeString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return off_189C51638[a1];
  }
}

const char *IOAVAudioFormatString(unsigned int a1)
{
  if (a1 > 0x14) {
    return "Unknown";
  }
  else {
    return off_189C51688[a1];
  }
}

uint64_t IOAVAudioSampleSizeEnum(int a1)
{
  if (a1 == 20) {
    int v1 = 2;
  }
  else {
    int v1 = 0;
  }
  if (a1 == 24) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 16) {
    return 1LL;
  }
  else {
    return v2;
  }
}

uint64_t IOAVAudioSampleSizeScalar(int a1)
{
  else {
    return (4 * (a1 - 1) + 16);
  }
}

uint64_t IOAVAudioSampleRateEnum(int a1)
{
  if (a1 > 255999)
  {
    if (a1 <= 705599)
    {
      if (a1 > 383999)
      {
        if (a1 == 384000) {
          return 12LL;
        }
        if (a1 == 512000) {
          return 13LL;
        }
      }

      else
      {
        if (a1 == 256000) {
          return 10LL;
        }
        if (a1 == 352800) {
          return 11LL;
        }
      }
    }

    else if (a1 < 1024000)
    {
      if (a1 == 705600) {
        return 14LL;
      }
      if (a1 == 768000) {
        return 15LL;
      }
    }

    else
    {
      switch(a1)
      {
        case 1024000:
          return 16LL;
        case 1411200:
          return 17LL;
        case 1536000:
          return 18LL;
      }
    }
  }

  else if (a1 <= 88199)
  {
    if (a1 > 47999)
    {
      if (a1 == 48000) {
        return 3LL;
      }
      if (a1 == 64000) {
        return 4LL;
      }
    }

    else
    {
      if (a1 == 32000) {
        return 1LL;
      }
      if (a1 == 44100) {
        return 2LL;
      }
    }
  }

  else if (a1 <= 127999)
  {
    if (a1 == 88200) {
      return 5LL;
    }
    if (a1 == 96000) {
      return 6LL;
    }
  }

  else
  {
    switch(a1)
    {
      case 128000:
        return 7LL;
      case 176400:
        return 8LL;
      case 192000:
        return 9LL;
    }
  }

  return 0LL;
}

uint64_t IOAVAudioSampleRateScalar(unsigned int a1)
{
  if (a1 > 0x12) {
    return 0LL;
  }
  else {
    return IOAVAudioSampleRateScalar::s_scalar_rates[a1];
  }
}

uint64_t IOAVAudioLinkSampleRateForFormat(int a1, unsigned int a2)
{
  if ((a1 - 16) >= 5)
  {
    else {
      return a2;
    }
  }

  else
  {
    uint64_t v2 = (int)IOAVAudioSampleRateEnum(a2) - 2LL;
    else {
      return dword_182E534B0[v2];
    }
  }

uint64_t IOAVHDMIAudioClockRegenerationDataForLink(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = IOAVAudioSampleRateEnum(*(_DWORD *)(a2 + 12));
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }

  uint64_t v7 = 0LL;
  uint64_t v8 = (char *)&IOAVHDMIAudioClockRegenerationDataForLink::s_acr_table + 16 * v3;
  while (*(_DWORD *)(a1 + 8) != IOAVHDMIAudioClockRegenerationDataForLink::s_depth_table[v7])
  {
    ++v7;
    v8 += 4320;
    if (v7 == 4) {
      return 0LL;
    }
  }

  if ((v7 & 0xFFFFFFFC) != 0) {
    return 0LL;
  }
  for (uint64_t i = 0LL; i != 14; ++i)
  {
    if (v4 == IOAVHDMIAudioClockRegenerationDataForLink::s_pixel_clock_table[i]) {
      break;
    }
  }

  return *(void *)&v8[288 * i - 16];
}

uint64_t IOAVVideoTimingGetPixelClock(_DWORD *a1, unsigned int *a2)
{
  uint64_t result = a1[17];
  if ((_DWORD)result)
  {
    if (!a2) {
      return result;
    }
    goto LABEL_3;
  }

  int v4 = *a1 & 1;
  int v5 = a1[8];
  unint64_t v6 = (a1[9] * (unint64_t)a1[1] * (int)a1[14]) >> 16;
  if (v5) {
    LODWORD(v6) = v6 / (v5 + 1);
  }
  uint64_t result = v6 >> v4;
  if (a2) {
LABEL_3:
  }
    *a2 = result / 0xC8;
  return result;
}

const char *IOAVAudioSpeakerString(unsigned int a1)
{
  if (a1 > 0x11) {
    return "Unknown";
  }
  else {
    return off_189C51730[a1];
  }
}

uint64_t IOAVAudioGetSpeakerAllocationMask(unsigned int a1)
{
  if (a1 > 0x31) {
    return 0LL;
  }
  else {
    return IOAVAudioGetSpeakerAllocationMask::sSpeakerAllocations[a1];
  }
}

__n128 IOAVAudioGetChannelLayoutData(unsigned int a1, __n128 *a2)
{
  if (a1 <= 0x31)
  {
    uint64_t v2 = (__n128 *)((char *)&IOAVAudioGetChannelLayoutData::sChannelMap + 40 * a1);
    *a2 = *v2;
    __n128 result = v2[1];
    a2[1] = result;
    a2[2].n128_u64[0] = v2[2].n128_u64[0];
  }

  return result;
}

uint64_t IOAVAudioGetChannelAllocationDefault(int a1)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t IOAVAudioGetChannelAllocation(void *__s2)
{
  uint64_t v2 = 0LL;
  for (uint64_t i = &IOAVAudioGetChannelLayoutData::sChannelMap; ; uint64_t i = (__int128 *)((char *)i + 40))
  {
    __int128 v4 = i[1];
    v6[0] = *i;
    v6[1] = v4;
    uint64_t v7 = *((void *)i + 4);
    if (!memcmp(v6, __s2, 0x28uLL)) {
      break;
    }
    if (++v2 == 50) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t IOAVAudioLinkGetBitRate(_DWORD *a1)
{
  return (a1[2] * a1[3] * a1[1]);
}

uint64_t IOAVAudioLinkIsIEC61937(_DWORD *a1)
{
  return (*a1 < 0x15u) & (0x1FF5FCu >> *a1);
}

uint64_t IOAVAudioLinkGetHDMIAudioPacketType(int *a1)
{
  int v1 = *a1;
  BOOL v2 = *a1 > 0x14 || ((1 << *a1) & 0x1FF5FC) == 0;
  if (v1 == 9) {
    return 3LL;
  }
  return 4 * (v1 == 11);
}

uint64_t IOAVAudioLinkGetMaxStreamChannelCount(int *a1)
{
  int v1 = *a1;
  if (v1 == 1) {
    return a1[1];
  }
  if (v1 == 2) {
    return 6LL;
  }
  return 0LL;
}

uint64_t IOAVAudioLinkGetMaxStreamSampleRate(_DWORD *a1)
{
  unsigned int v1 = a1[3];
  else {
    return v1 >> 2;
  }
}

const char *IOAVVideoAspectRatioString(int a1)
{
  else {
    return off_189C517C0[a1 - 1];
  }
}

const char *IOAVVideoLinkModeString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_189C51848[(char)a1];
  }
}

uint64_t IOAVVideoColorBitDepth(int a1)
{
  else {
    return dword_182E534D0[a1 - 6];
  }
}

uint64_t IOAVVideoColorBitDepthScalar(unsigned int a1)
{
  if (a1 > 5) {
    return 0LL;
  }
  else {
    return dword_182E534FC[a1];
  }
}

uint64_t IOAVVideoColorBitDepthMinimumForEOTF(int a1)
{
  return 2 * ((a1 & 0xFFFFFFFE) == 2);
}

BOOL IOAVVideoColorBitDepthIsSupported(unsigned int a1, int a2)
{
  BOOL v2 = a1 < 6;
  if (a2 != 1) {
    BOOL v2 = 0;
  }
  if (a2) {
    return v2;
  }
  else {
    return a1 < 5;
  }
}

const char *IOAVVideoAxisString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Vertical";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Horizontal";
  }
}

const char *IOAVVideoPixelEncodingString(unsigned int a1)
{
  if (a1 > 0xE) {
    return "Unknown";
  }
  else {
    return off_189C51868[a1];
  }
}

const char *IOAVVideoColorDynamicRangeString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Limited";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Full";
  }
}

const char *IOAVVideoColorEOTFString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_189C518E0[a1];
  }
}

const char *IOAVVideoColorimetryString(unsigned int a1)
{
  if (a1 > 0x10) {
    return "Unknown";
  }
  else {
    return off_189C51900[a1];
  }
}

BOOL IOAVVideoColorimetryIsValid(unsigned int a1, int a2, int a3)
{
  if (a1 <= 9 && ((1 << a1) & 0x2C0) != 0 && a3 < 2) {
    return 0LL;
  }
  switch(a2)
  {
    case 0:
      BOOL v4 = a1 - 9 >= 8;
      return !v4;
    case 1:
    case 2:
    case 3:
    case 6:
    case 7:
      BOOL v4 = a1 >= 8;
      return !v4;
    case 4:
    case 5:
      if (a1 >= 0xF) {
        return 0LL;
      }
      else {
        return (0x4102u >> a1) & 1;
      }
    case 8:
    case 9:
    case 10:
    case 11:
      BOOL v6 = a1 == 7;
      goto LABEL_18;
    case 12:
      BOOL v6 = a1 == 9;
LABEL_18:
      BOOL result = v6;
      break;
    default:
      return 0LL;
  }

  return result;
}

const char *IOAVLocationString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Embedded";
  }
  if (a1) {
    return v1;
  }
  else {
    return "External";
  }
}

const char *IOAVLinkTypeString(int a1)
{
  unsigned int v1 = "Unknown";
  if (!a1) {
    unsigned int v1 = "Audio";
  }
  if (a1 == 1) {
    return "Video";
  }
  else {
    return v1;
  }
}

const char *IOAVLinkSourceString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_189C51988[(char)a1];
  }
}

const char *IOAVInfoFrameTypeString(char a1)
{
  unint64_t v1 = a1 ^ 0xFFFFFFFFFFFFFF80LL;
  else {
    return off_189C519B0[v1];
  }
}

const char *IOAVElementTypeString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_189C519F0[a1];
  }
}

const char *IOAVVideoTimingStandardString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_189C51A18[a1];
  }
}

const char *IOAVVideoScanInformationString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_189C51A40[a1];
  }
}

const char *IOAVStandardTypeString(int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVStandardTypeString::sStrings[a1];
  }
}

const char *IOAVVideoTimingTypeString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return IOAVVideoTimingTypeString::sStrings[a1];
  }
}

const char *IOAVTransportString(unsigned int a1)
{
  if (a1 > 4) {
    return "Other";
  }
  else {
    return IOAVTransportString::sStrings[a1];
  }
}

const char *IOAVProtectionStatusString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVProtectionStatusString::sStrings[a1];
  }
}

const char *IOAVEncryptionStatusString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVEncryptionStatusString::sStrings[a1];
  }
}

const char *IOAVContentProtectionTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVContentProtectionTypeString::sStrings[a1];
  }
}

const char *IOAVContentProtectionProtocolString(uint64_t a1)
{
  unint64_t v1 = "Unknown";
  if (HIDWORD(a1) == 2) {
    unint64_t v1 = "HDCP2";
  }
  if (HIDWORD(a1) == 1) {
    unint64_t v1 = "HDCP1";
  }
  BOOL v2 = "Unknown";
  if ((_DWORD)a1 == 2) {
    BOOL v2 = "DPCP";
  }
  if ((_DWORD)a1 != 1) {
    unint64_t v1 = v2;
  }
  if ((_DWORD)a1) {
    return v1;
  }
  else {
    return "None";
  }
}

uint64_t IOAVGetVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  if (IOAVGetCEAVideoTimingData(a1, a2, a3, a4, a5)
    || (__IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a5, 1) & 1) != 0
    || (__IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a5, 1) & 1) != 0)
  {
    return 1LL;
  }

  else
  {
    return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
  }

BOOL IOAVGetCEAVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  unsigned int v6 = IOAVGetCEAVideoShortID(a1, a2, a3, a4);
  if (v6 <= 0x7E
    && (uint64_t v7 = &IOAVGetVideoTimingTable::sCEATimingData[5 * v6],
        *(_OWORD *)a5 = *v7,
        *(_OWORD *)(a5 + 16) = v7[1],
        *(_OWORD *)(a5 + 32) = v7[2],
        *(_OWORD *)(a5 + 48) = v7[3],
        *(_OWORD *)(a5 + 64) = v7[4],
        *(_DWORD *)(a5 + 4))
    && *(_DWORD *)(a5 + 36))
  {
    return *(_DWORD *)(a5 + 56) != 0;
  }

  else
  {
    return 0LL;
  }

uint64_t IOAVGetDMTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetCVTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetGTFVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
}

uint64_t IOAVGetVideoTimingTable(signed int a1, _DWORD *a2)
{
  if (a1 > 4)
  {
    int v2 = 0;
    uint64_t result = 0LL;
  }

  else
  {
    int v2 = dword_182E53514[a1];
    uint64_t result = *((void *)&off_189C51A60 + a1);
  }

  *a2 = v2;
  return result;
}

uint64_t IOAVVideoTimingGetSyncRateRounded(uint64_t a1, unsigned int a2)
{
  return (*(_DWORD *)(a1 + 32LL * a2 + 24) + 0x8000) & 0xFFFF0000;
}

BOOL IOAVVideoTimingIsVideoOptimized(uint64_t a1)
{
  int v1 = (*(_DWORD *)(a1 + 56) + 0x8000) % 392823;
  unsigned int v3 = v1 - 0x8000;
  BOOL v2 = v1 - 0x8000 < 0;
  unsigned int v4 = 0x8000 - v1;
  if (!v2) {
    unsigned int v4 = v3;
  }
  return v4 < 0x28F;
}

uint64_t IOAVVideoTimingVideoOptimizedDelta(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) + 0x8000;
  unsigned int v2 = 0x8000 - v1 % 392823;
  if (v1 % 392823 - 0x8000 >= 0) {
    unsigned int v2 = v1 % 392823 - 0x8000;
  }
  int v3 = v1 % 393216;
  int v5 = v3 - 0x8000;
  BOOL v4 = v3 - 0x8000 < 0;
  unsigned int v6 = 0x8000 - v3;
  if (!v4) {
    unsigned int v6 = v5;
  }
  if (v2 >= v6) {
    return v6;
  }
  else {
    return v2;
  }
}

uint64_t IOAVGetVideoTimingDataByID(int a1, unsigned int a2, __int128 *a3)
{
  if (a1 == 1)
  {
    int v5 = &IOAVGetVideoTimingTable::sDMTTimingData;
    unsigned int v6 = 89;
  }

  else
  {
    if (a1 != 4) {
      return 0LL;
    }
    int v5 = IOAVGetVideoTimingTable::sCEATimingData;
    unsigned int v6 = 127;
  }

  if (v6 <= a2) {
    return 0LL;
  }
  bzero(v9, 0x50uLL);
  uint64_t v7 = &v5[5 * a2];
  uint64_t result = memcmp(v9, v7, 0x50uLL);
  if ((_DWORD)result)
  {
    a3[1] = v7[1];
    a3[2] = v7[2];
    a3[3] = v7[3];
    a3[4] = v7[4];
    *a3 = *v7;
    return 1LL;
  }

  return result;
}

uint64_t __IOAVGetStandardVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7)
{
  uint64_t v13 = &IOAVGetVideoTimingTable::sNonstandardDetailedTimingData;
  int v14 = 1;
  unsigned int v15 = 57;
  switch(a1)
  {
    case 0:
      break;
    case 1:
      uint64_t v13 = &IOAVGetVideoTimingTable::sDMTTimingData;
      unsigned int v15 = 89;
      break;
    case 2:
      uint64_t v13 = &IOAVGetVideoTimingTable::sGTFTimingData;
      unsigned int v15 = 50;
      break;
    case 3:
      uint64_t v13 = &IOAVGetVideoTimingTable::sCVTTimingData;
      unsigned int v15 = 114;
      break;
    case 4:
      uint64_t v13 = IOAVGetVideoTimingTable::sCEATimingData;
      unsigned int v15 = 127;
      break;
    default:
      unsigned int v15 = 0;
      int v14 = 0;
      uint64_t v13 = 0LL;
      break;
  }

  uint64_t result = 0LL;
  if (a2 && a3 && a4 && a7 && v14)
  {
    unsigned int v17 = (a4 + 0x8000) & 0xFFFF0000;
    if (v15 <= 1) {
      uint64_t v18 = 1LL;
    }
    else {
      uint64_t v18 = v15;
    }
    while (((*(_BYTE *)v13 & 1) == 0) == a5
         || *((_DWORD *)v13 + 2) != a2
         || *((_DWORD *)v13 + 10) != a3
         || *((_DWORD *)v13 + 14) != v17
         || a7 != -1 && IOAVVideoTimingGetBlankingStyle((uint64_t)v13) != a7)
    {
      v13 += 5;
      if (!--v18) {
        return 0LL;
      }
    }

    __int128 v19 = v13[1];
    __int128 v20 = v13[2];
    __int128 v21 = v13[4];
    *(_OWORD *)(a6 + 48) = v13[3];
    __int128 v22 = *v13;
    *(_OWORD *)(a6 + 64) = v21;
    *(_OWORD *)(a6 + 16) = v19;
    *(_OWORD *)(a6 + 32) = v20;
    *(_OWORD *)a6 = v22;
    *(_DWORD *)(a6 + 56) = a4;
    return 1LL;
  }

  return result;
}

uint64_t IOAVVideoTimingGetBlankingStyle(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28);
  int v2 = *(_DWORD *)(a1 + 60);
  if ((v1 != 0) == (v2 != 0)) {
    return 1LL;
  }
  unsigned int v3 = *(unsigned __int16 *)(a1 + 44);
  if (!v1)
  {
    int v5 = v3 & 0xFFF8;
    return v2 && v5 == 0;
  }

  if (v2) {
    return 0LL;
  }
  if (v3 < 3) {
    return 1LL;
  }
  if (v3 != 3 && v3 < 8) {
    return 2LL;
  }
  if (v3 != 8) {
    return 0LL;
  }
  return 3LL;
}

BOOL IOAVGetCEAVideoTimingDataWithShortID(unsigned int a1, int a2, uint64_t a3)
{
  if (a1 > 0x7E) {
    return 0LL;
  }
  unsigned int v3 = &IOAVGetVideoTimingTable::sCEATimingData[5 * a1];
  *(_OWORD *)a3 = *v3;
  *(_OWORD *)(a3 + 16) = v3[1];
  *(_OWORD *)(a3 + 32) = v3[2];
  *(_OWORD *)(a3 + 48) = v3[3];
  *(_OWORD *)(a3 + 64) = v3[4];
  if (!*(_DWORD *)(a3 + 4) || !*(_DWORD *)(a3 + 36)) {
    return 0LL;
  }
  int v4 = *(_DWORD *)(a3 + 56);
  BOOL result = v4 != 0;
  if (v4 && a2)
  {
    int v6 = v4 + 0x8000;
    unsigned int v7 = 0x8000 - v6 % 392823;
    if (v6 % 392823 - 0x8000 >= 0) {
      unsigned int v7 = v6 % 392823 - 0x8000;
    }
    if (v7 <= 0x28E)
    {
      *(_DWORD *)(a3 + 56) = v6 & 0xFFFF0000;
    }

    return 1LL;
  }

  return result;
}

uint64_t IOAVGetCEAVideoShortID(int a1, int a2, int a3, int a4)
{
  uint64_t v4 = 0LL;
  __int128 v13 = 0u;
  __int128 v15 = 0u;
  memset(v16, 0, sizeof(v16));
  DWORD1(v13) = a1;
  DWORD1(v15) = a2;
  *(_DWORD *)&v16[4] = a3;
  int v12 = a4;
  uint64_t v5 = 17LL;
  __int128 v14 = 0u;
  uint64_t v6 = ((uint64_t)(a1 << 16) << 16) / (a2 << 16);
  unsigned int v7 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    int v8 = *v7;
    v7 += 2;
    unsigned int v9 = v8 - v6;
    int v10 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5] - v6;
    if (v10 < 0) {
      int v10 = v6 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v5];
    }
    if (v9 < v10) {
      uint64_t v5 = v4;
    }
    ++v4;
  }

  while (v4 != 18);
  *(_DWORD *)&v16[20] = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5 + 1];
  return __IOAVGetCEAVideoShortIDWithData(&v12, 1);
}

uint64_t IOAVGetCEAVideoShortIDWithData(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 0);
}

uint64_t __IOAVGetCEAVideoShortIDWithData(_DWORD *__s2, int a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = IOAVGetVideoTimingTable::sCEATimingData;
  do
  {
    __int128 v6 = v5[3];
    __int128 v10 = v5[2];
    __int128 v11 = v6;
    __int128 v7 = v5[1];
    v9[0] = *v5;
    v9[1] = v7;
    __int128 v12 = v5[4];
    if (DWORD1(v9[0]) && DWORD1(v10) && DWORD2(v11))
    {
      if (a2)
      {
        if (((LODWORD(v9[0]) ^ *__s2) & 1) == 0
          && __s2[18] == DWORD2(v12)
          && __s2[2] == DWORD2(v9[0])
          && __s2[10] == DWORD2(v10)
          && ((DWORD2(v11) + 0x8000) ^ (__s2[14] + 0x8000)) < 0x10000)
        {
          return v4;
        }
      }

      else if (!memcmp(v9, __s2, 0x50uLL))
      {
        return v4;
      }
    }

    ++v4;
    v5 += 5;
  }

  while (v4 != 127);
  return 0LL;
}

uint64_t IOAVGetCEAVideoShortIDWithDataActive(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 1);
}

uint64_t IOAVVideoActiveFormatAspectRatio(int a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = 17LL;
  unsigned int v3 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    int v4 = *v3;
    v3 += 2;
    unsigned int v5 = v4 - a1;
    if (v4 - a1 < 0) {
      unsigned int v5 = -v5;
    }
    int v6 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v2] - a1;
    if (v6 < 0) {
      int v6 = a1 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v2];
    }
    if (v5 < v6) {
      uint64_t v2 = v1;
    }
    ++v1;
  }

  while (v1 != 18);
  return IOAVVideoActiveFormatAspectRatio::arRef[2 * v2 + 1];
}

BOOL IOAVTransportSupportsCEA(int a1)
{
  return !a1 || a1 == 3;
}

BOOL IOAVTransportSupportsRGBOnly(int a1)
{
  if (a1) {
    BOOL v1 = a1 == 3;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t IOAVVideoTimingGetITSource(uint64_t a1)
{
  uint64_t v1 = 0LL;
  while (*(_DWORD *)(a1 + 40) != IOAVVideoTimingGetITSource::sITResolutions[v1 + 1]
       || *(_DWORD *)(a1 + 8) != IOAVVideoTimingGetITSource::sITResolutions[v1])
  {
    v1 += 3LL;
    if (v1 == 147) {
      return 0LL;
    }
  }

  return IOAVVideoTimingGetITSource::sITResolutions[v1 + 2];
}

BOOL IOAVEDIDIsStandard(void *a1)
{
  return *a1 == IOAVEDIDIsStandard::sEDIDStandardHeader;
}

uint64_t IOAVInfoFrameGetChecksum(_BYTE *a1)
{
  unint64_t v1 = a1[2];
  char v2 = a1[1] + *a1 + v1 + a1[3];
  return (v2 + DisplayID::checksum((DisplayID *)(a1 + 4), v1));
}

uint64_t IOAVGetSPDInfoFrame@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 11) = 0LL;
  *(void *)(a2 + 3) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 19) = 0LL;
  *(_WORD *)a2 = 387;
  *(_BYTE *)(a2 + 2) = 25;
  *(void *)(a2 + 4) = *(void *)a1;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)(a1 + 8);
  *(_BYTE *)(a2 + 28) = *(_DWORD *)(a1 + 24);
  uint64_t result = DisplayID::checksum((DisplayID *)(a2 + 4), 0x19uLL);
  *(_BYTE *)(a2 + 3) = 99 - result;
  return result;
}

uint64_t IOAVVideoTimingGetActivePixelClock(_DWORD *a1)
{
  int v1 = a1[8];
  unint64_t v2 = (a1[10] * (unint64_t)a1[2] * (int)a1[14]) >> 16;
  if (v1) {
    LODWORD(v2) = v2 / (v1 + 1);
  }
  return v2 >> (*a1 & 1);
}

unint64_t IOAVVideoGetPixelClockTolerance(unsigned int a1)
{
  return a1 / 0xC8uLL;
}

uint64_t IOAVVideoColorBitsPerPixel(_DWORD *a1, unsigned int a2, const char *a3, const char *a4)
{
  int v4 = a1[1];
  uint64_t result = 24LL;
  switch(v4)
  {
    case 0:
    case 3:
    case 11:
    case 12:
      uint64_t result = (3 * *a1);
      break;
    case 1:
      uint64_t result = (3 * *a1) >> 1;
      break;
    case 2:
      uint64_t result = (2 * *a1);
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
      return result;
    default:
      __IOAVAbort((const char *)0x18, a2, a3, a4);
  }

  return result;
}

void __IOAVAbort(const char *a1, unsigned int a2, const char *a3, const char *a4)
{
}

uint64_t IOAVVideoColorMinimumBitsPerPixelDSC(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 4);
  else {
    return word_182E53528[v1];
  }
}

uint64_t IOAVDSCModeForPixelEncoding(unsigned int a1)
{
  if (a1 > 0xC) {
    return 0LL;
  }
  else {
    return dword_182E53544[a1];
  }
}

uint64_t IOAVDSCCapabilitiesGetMaxSlicesPerLine(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOAVDSCSlicesPerLineScalar(unsigned int a1)
{
  if (a1 > 9) {
    return 0LL;
  }
  else {
    return byte_182E53578[(char)a1];
  }
}

uint64_t IOAVDSCCapabilitiesGetPeakPixelRateForMode(uint64_t a1, int a2)
{
  if ((a2 - 3) < 2)
  {
    unint64_t v2 = (unsigned int *)(a1 + 20);
    return *v2;
  }

  if ((a2 - 1) <= 1)
  {
    unint64_t v2 = (unsigned int *)(a1 + 16);
    return *v2;
  }

  return 0LL;
}

BOOL IOAVVideoLinkIsDolbyVision(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12);
  unsigned int v2 = v1 & 0xFFFFFFFE;
  unsigned int v3 = v1 - 8;
  return v2 == 4 || v3 < 5;
}

BOOL IOAVVideoPixelEncodingIsDolbyVision(int a1)
{
  return (a1 & 0xFFFFFFFE) == 4 || (a1 - 8) < 5;
}

BOOL IOAVVideoPixelEncodingIsLLDolbyVision(int a1)
{
  return (a1 - 8) < 5;
}

BOOL IOAVVideoLinkRequiresHDMIScrambling(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  return IOAVHDMICharacterRate(a1, a2, a3, a4) > 0x1443FD00;
}

unint64_t IOAVHDMICharacterRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }

  __int128 v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4 / 0x18;
}

uint64_t IOAVHDMIClockRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  unsigned int v5 = IOAVHDMICharacterRate(a1, a2, a3, a4);
  if (v5 <= 0x1443FD00) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 4;
  }
  if (v6 >= a2) {
    unsigned int v6 = a2;
  }
  return v5 / v6;
}

unint64_t IOAVVideoLinkBandwidth(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }

  __int128 v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4;
}

uint64_t IOAVHDMIFRLBandwidth(unsigned int a1)
{
  if (a1 > 6) {
    return 0LL;
  }
  else {
    return qword_182E53588[a1];
  }
}

uint64_t IOAVHDMIFRLBitRateScalar(unsigned int a1)
{
  if (a1 > 6) {
    return 0LL;
  }
  else {
    return qword_182E535C0[a1];
  }
}

uint64_t IOAVHDMIFRLCharacterRate(unsigned int a1)
{
  if (a1 > 6) {
    return 0LL;
  }
  else {
    return dword_182E535F8[a1];
  }
}

const char *IOAVHDMIFRLRateString(unsigned int a1)
{
  if (a1 > 6) {
    return "? Gbps (Unknown FRL rate)";
  }
  else {
    return (&off_189C51A88)[a1];
  }
}

const char *IODPCommandString(int a1)
{
  if (a1 == 32) {
    return "TrainLink";
  }
  if (a1 == 33) {
    return "RetrainLink";
  }
  return IOAVCommandString(a1);
}

const char *IODPEventLogEventTypeString(unsigned int a1)
{
  if (a1 == 32) {
    return "Link Training Command";
  }
  else {
    return IOAVEventLogEventTypeString(a1);
  }
}

const char *IODPTrainingPatternName(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return (&off_189C51AD8)[a1];
  }
}

const char *IODPQualityPatternName(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return (&off_189C51B18)[a1];
  }
}

uint64_t IODPLinkRateIsStandard(unsigned int a1)
{
  return (a1 < 0x1F) & (0x40100440u >> a1);
}

uint64_t IODPLinkRateIsUHBR(char a1)
{
  return ((a1 + 127) < 4u) & (0xBu >> ((a1 + 127) & 0xF));
}

uint64_t IODPLinkBitRateIsUHBR(uint64_t a1)
{
  BOOL v1 = a1 == 13500000000LL || a1 == 20000000000LL;
  return a1 == 10000000000LL || v1;
}

uint64_t IODPTrainingPatternLength(int a1)
{
  else {
    return dword_182E53674[a1 - 1];
  }
}

uint64_t IODPLinkSymbolRate(unsigned int a1)
{
  uint64_t v1 = 27000000LL * a1;
  if (a1 == 29) {
    uint64_t v1 = 799200000LL;
  }
  if (a1 == 21) {
    return 568800000LL;
  }
  else {
    return v1;
  }
}

unint64_t IODPLinkSymbolClockForLinkBitRate(unint64_t a1)
{
  if (a1 == 10000000000LL || a1 == 20000000000LL || a1 == 13500000000LL) {
    return a1 >> 5;
  }
  else {
    return a1 / 0xA;
  }
}

uint64_t IODPLinkBitRateForLinkSymbolClock(uint64_t a1)
{
  return 10 * a1;
}

uint64_t IODPLinkRateScalar(int a1)
{
  if (a1 <= 128)
  {
    if (a1 == 21) {
      return 5688000000LL;
    }
    if (a1 == 29) {
      return 7992000000LL;
    }
  }

  else
  {
    switch(a1)
    {
      case 129:
        return 10000000000LL;
      case 132:
        return 13500000000LL;
      case 130:
        return 20000000000LL;
    }
  }

  return 270000000LL * a1;
}

uint64_t IODPLinkRateEnum(uint64_t a1)
{
  if (a1 <= 0x2540BE3FFLL)
  {
    if (a1 == 5688000000LL)
    {
      LOBYTE(v1) = 21;
      return v1;
    }

    if (a1 == 7992000000LL)
    {
      LOBYTE(v1) = 29;
      return v1;
    }

    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  }

  if (a1 == 10000000000LL)
  {
    LOBYTE(v1) = -127;
    return v1;
  }

  if (a1 == 13500000000LL)
  {
    LOBYTE(v1) = -124;
    return v1;
  }

  if (a1 != 20000000000LL) {
    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  }
  LOBYTE(v1) = -126;
  return v1;
}

BOOL IODPDriveSettingsEqual(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    if (*(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4))
    {
      BOOL v3 = 0;
      unsigned int v4 = (int *)(a2 + 16);
      int v5 = (int *)(a1 + 16);
      unint64_t v6 = 1LL;
      do
      {
        if (*(v5 - 2) != *(v4 - 2)) {
          break;
        }
        BOOL v3 = v6 >= a3;
        if (a3 == v6) {
          break;
        }
        int v8 = *v4;
        v4 += 3;
        int v7 = v8;
        int v9 = *v5;
        v5 += 3;
        ++v6;
      }

      while (v9 == v7);
    }

    else
    {
      return 0;
    }
  }

  else
  {
    return 1;
  }

  return v3;
}

BOOL IODPDriveSettingsAreValid(unint64_t a1, int a2)
{
  return SHIDWORD(a1) <= 3 && a2 <= 3 && IODPDriveSettingsAreValid::sValidAdjustments[4 * HIDWORD(a1) + a2] != 0;
}

unint64_t IODPConstrainedDriveSettings(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = HIDWORD(a1);
  if (SHIDWORD(a1) >= 3) {
    LODWORD(v2) = 3;
  }
  else {
    a2 = a2;
  }
  unint64_t result = (a1 | ((unint64_t)v2 << 32)) + 0x100000000LL;
  uint64_t v4 = 4LL * v2;
  do
  {
    result -= 0x100000000LL;
    if (!v4) {
      break;
    }
    int v5 = IODPDriveSettingsAreValid::sValidAdjustments[a2 + v4];
    v4 -= 4LL;
  }

  while (!v5);
  return result;
}

uint64_t IODPConstrainDriveSettings(uint64_t result, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = a2;
    do
    {
      uint64_t v4 = result + 12 * v2;
      LODWORD(v5) = *(_DWORD *)(v4 + 8);
      uint64_t v6 = HIDWORD(*(void *)v4);
      else {
        uint64_t v5 = v5;
      }
      unint64_t v7 = (*(void *)v4 | ((unint64_t)v6 << 32)) + 0x100000000LL;
      uint64_t v8 = 4LL * v6;
      do
      {
        v7 -= 0x100000000LL;
        if (!v8) {
          break;
        }
        int v9 = IODPDriveSettingsAreValid::sValidAdjustments[v5 + v8];
        v8 -= 4LL;
      }

      while (!v9);
      *(void *)uint64_t v4 = v7;
      *(_DWORD *)(v4 + 8) = v5;
      ++v2;
    }

    while (v2 != v3);
  }

  return result;
}

uint64_t IODPUnifiedDriveSettings(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    int32x2_t v3 = 0LL;
    uint64_t v4 = (void *)(a1 + 4);
    do
    {
      int32x2_t v5 = *(int32x2_t *)v4;
      uint64_t v4 = (void *)((char *)v4 + 12);
      int32x2_t v3 = vmax_s32(v5, v3);
      --v2;
    }

    while (v2);
  }

  else
  {
    int32x2_t v3 = 0LL;
  }

  if (v3.i32[0] >= 3) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = v3.u32[0];
  }
  if (v3.i32[1] >= 3) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = v3.u32[1];
  }
  uint64_t result = (v6 << 32) + 0x100000000LL;
  uint64_t v9 = 4LL * v6;
  do
  {
    result -= 0x100000000LL;
    if (!v9) {
      break;
    }
    int v10 = IODPDriveSettingsAreValid::sValidAdjustments[v7 + v9];
    v9 -= 4LL;
  }

  while (!v10);
  return result;
}

unint64_t IODPStreamClockHz(unsigned int a1, unsigned int a2, unsigned int a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v3 = 568800000LL;
  uint64_t v4 = 27000000LL * a1;
  if (a1 == 29) {
    uint64_t v4 = 799200000LL;
  }
  if (a1 != 21) {
    uint64_t v3 = v4;
  }
  return v3 * (unint64_t)a2 / a3;
}

unint64_t IODPCalculateM(unint64_t result, uint64_t a2, unsigned int a3)
{
  if (result) {
    return 10 * a2 * (unint64_t)a3 / result;
  }
  return result;
}

unint64_t IODPLinkBandwidth(unsigned int a1, unint64_t a2)
{
  if (a2 == 10000000000LL || a2 == 20000000000LL || a2 == 13500000000LL) {
    return 1568768 * a2 * a1 / 0x18C063;
  }
  else {
    return 8 * a1 * (a2 / 0xA);
  }
}

unint64_t IODPVideoBandwidth(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  unsigned int PixelClock = IOAVVideoTimingGetPixelClock((_DWORD *)(a1 + 40), 0LL);
  if ((*(_WORD *)(a1 + 1) & 1) != 0)
  {
    unsigned __int16 v7 = *(_WORD *)(a1 + 124);
  }

  else
  {
    __int128 v6 = *(_OWORD *)(a1 + 24);
    v9[0] = *(_OWORD *)(a1 + 8);
    v9[1] = v6;
    unsigned __int16 v7 = 16 * IOAVVideoColorBitsPerPixel(v9, v2, v3, v4);
  }

  return (v7 * (unint64_t)PixelClock + 15) >> 4;
}

unint64_t IODPLinkRateRequiredForVideoBandwidth(uint64_t a1, unsigned int a2)
{
  return (a2 - 1 + 10 * ((unint64_t)(a1 + 7) >> 3)) / a2;
}

uint64_t IODPVideoLinkMainStreamAttributeData@<X0>( uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, char a4@<W3>, int a5@<W4>, BOOL *a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v14 = 0;
  int v15 = *(unsigned __int8 *)(a1 + 8);
  *a6 = 0;
  switch(*(_DWORD *)(a1 + 12))
  {
    case 0:
    case 0xC:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0xA:
        case 0x10:
          unsigned int v14 = 2 * (*(_DWORD *)(a1 + 16) == 1);
          break;
        case 0xB:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 13;
          break;
        case 0xC:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 12;
          break;
        case 0xD:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 3;
          break;
        case 0xE:
        case 0xF:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 14;
          break;
        default:
          goto LABEL_9;
      }

      break;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 6;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 7;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 4;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 5;
          break;
        default:
          goto LABEL_9;
      }

      break;
    case 3:
    case 0xB:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 10;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 11;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 8;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 9;
          break;
        default:
LABEL_9:
          unsigned int v14 = 0;
          *a6 = 1;
          break;
      }

      break;
    case 5:
    case 7:
    case 0xA:
      unsigned int v14 = 0;
      int v15 = 8;
      break;
    default:
      break;
  }

  uint64_t result = IOAVVideoColorBitDepth(v15);
  int v17 = *(_DWORD *)(a1 + 40);
  __int16 v18 = (v17 & 1) != 0 && (*(_BYTE *)(a1 + 76) & 1) == 0;
  char v19 = v17 & 1;
  if (a5 && *a6) {
    v18 |= 0x40u;
  }
  *(int8x8_t *)a7 = vbsl_s8((int8x8_t)0xFF000000FF000000LL, *(int8x8_t *)a7, (int8x8_t)__PAIR64__(a3, a2));
  unint64_t v20 = *(unsigned __int16 *)(a1 + 44) | (*(_DWORD *)(a1 + 76) >> v19 << 16) | ((unint64_t)(unsigned __int16)*(_DWORD *)(a1 + 56) << 32) | ((unint64_t)*(unsigned __int16 *)(a1 + 88) << 48);
  unint64_t v21 = (*(_DWORD *)(a1 + 68) == 0) | ((unint64_t)*(unsigned int *)(a7 + 22) << 48) | (2
                                                                                            * (*(_DWORD *)(a1 + 52) & 0x7FFFLL)) | ((unint64_t)(*(_DWORD *)(a1 + 100) == 0) << 16) | ((unint64_t)(*(_DWORD *)(a1 + 84) & 0x7FFF) << 17) | ((unint64_t)*(unsigned int *)(a1 + 48) << 32);
  unsigned __int16 v22 = *(_WORD *)(a1 + 80);
  *(_WORD *)(a7 + 24) = (v14 >> 1) & 6 | a4 & 0xE7 | (8 * ((v14 & 2) != 0)) & 0xEF | (16 * (v14 & 1)) | (32 * result) | (v18 << 8);
  *(void *)(a7 + 8) = v20;
  *(void *)(a7 + 16) = v21 & 0xFFFFFFFFFFFFLL | ((unint64_t)v22 << 48);
  return result;
}

__n128 IODPInfoFrameSDP@<Q0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *(_BYTE *)a2 | 0x80;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_BYTE *)(a3 + 1) = v3;
  *(_BYTE *)(a3 + 3) = 4 * a1;
  *(_DWORD *)(a3 + 32) = 0;
  if (a1 >= 19) {
    char v4 = 29;
  }
  else {
    char v4 = 27;
  }
  *(_BYTE *)(a3 + 2) = v4;
  if (a1 == 19)
  {
    *(_WORD *)(a3 + 4) = *(_WORD *)(a2 + 1);
    uint64_t v5 = a3 + 6;
  }

  else
  {
    uint64_t v5 = a3 + 4;
  }

  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 4);
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(v5 + 12) = result;
  return result;
}

_DWORD *IODPVideoLinkVideoStreamConfigurationSDP@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 4) = 0u;
  int v3 = result[3];
  int v2 = result[4];
  *(_DWORD *)a2 = 319096576;
  int v4 = result[2];
  int v5 = 0;
  char v6 = -127;
  char v7 = 1;
  switch(v3)
  {
    case 0:
    case 12:
      switch(result[5])
      {
        case 9:
          char v8 = 6;
          goto LABEL_33;
        case 0xA:
          goto LABEL_34;
        case 0xB:
          char v8 = 2;
          goto LABEL_33;
        case 0xC:
          char v8 = 1;
          goto LABEL_33;
        case 0xD:
          char v8 = 3;
          goto LABEL_33;
        case 0xE:
        case 0xF:
          char v8 = 4;
          goto LABEL_33;
        default:
          char v8 = 5;
          goto LABEL_33;
      }

    case 1:
      *(_BYTE *)(a2 + 20) = 48;
      switch(result[5])
      {
        case 1:
          char v8 = 49;
          goto LABEL_33;
        case 2:
          char v8 = 50;
          goto LABEL_33;
        case 3:
          char v8 = 51;
          goto LABEL_33;
        case 4:
          char v8 = 52;
          goto LABEL_33;
        case 5:
          char v8 = 53;
          goto LABEL_33;
        case 6:
          char v8 = 54;
          goto LABEL_33;
        case 7:
          char v8 = 55;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }

    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 13:
    case 14:
      *(_BYTE *)(a2 + 20) = 32;
      switch(result[5])
      {
        case 1:
          char v8 = 33;
          goto LABEL_33;
        case 2:
          char v8 = 34;
          goto LABEL_33;
        case 3:
          char v8 = 35;
          goto LABEL_33;
        case 4:
          char v8 = 36;
          goto LABEL_33;
        case 5:
          char v8 = 37;
          goto LABEL_33;
        case 6:
          char v8 = 38;
          goto LABEL_33;
        case 7:
          char v8 = 39;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }

    case 3:
    case 11:
      *(_BYTE *)(a2 + 20) = 16;
      switch(result[5])
      {
        case 1:
          char v8 = 17;
          goto LABEL_33;
        case 2:
          char v8 = 18;
          goto LABEL_33;
        case 3:
          char v8 = 19;
          goto LABEL_33;
        case 4:
          char v8 = 20;
          goto LABEL_33;
        case 5:
          char v8 = 21;
          goto LABEL_33;
        case 6:
          char v8 = 22;
          goto LABEL_33;
        case 7:
          char v8 = 23;
LABEL_33:
          *(_BYTE *)(a2 + 20) = v8;
          break;
        default:
          goto LABEL_34;
      }

      break;
    case 5:
    case 7:
    case 10:
LABEL_40:
      *(_BYTE *)(a2 + 21) = v7;
      char v10 = v6;
      int v2 = v5;
LABEL_41:
      if (v2 == 1) {
        *(_BYTE *)(a2 + 21) = v10;
      }
      return result;
    default:
      break;
  }

uint64_t IODPCompareLinkTrainingData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 10000000000LL;
  uint64_t v3 = 5688000000LL;
  unsigned int v4 = *(unsigned __int8 *)(a1 + 12);
  if (v4 <= 0x80)
  {
    uint64_t v5 = 5688000000LL;
    if (v4 == 21) {
      goto LABEL_11;
    }
    if (v4 == 29)
    {
      uint64_t v5 = 7992000000LL;
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v5 = 10000000000LL;
    switch(v4)
    {
      case 0x81u:
        goto LABEL_11;
      case 0x84u:
        uint64_t v5 = 13500000000LL;
        goto LABEL_11;
      case 0x82u:
        uint64_t v5 = 20000000000LL;
        goto LABEL_11;
    }
  }

  uint64_t v5 = 270000000LL * *(unsigned __int8 *)(a1 + 12);
LABEL_11:
  unsigned int v6 = *(unsigned __int8 *)(a2 + 12);
  if (v6 > 0x80)
  {
    switch(v6)
    {
      case 0x81u:
        goto LABEL_22;
      case 0x84u:
        uint64_t v2 = 13500000000LL;
        goto LABEL_22;
      case 0x82u:
        uint64_t v2 = 20000000000LL;
        goto LABEL_22;
    }

    goto LABEL_20;
  }

  if (v6 != 21)
  {
    if (v6 != 29)
    {
LABEL_20:
      uint64_t v3 = 270000000LL * *(unsigned __int8 *)(a2 + 12);
      goto LABEL_21;
    }

    uint64_t v3 = 7992000000LL;
  }

const char *IODPDeviceTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "Sink";
  }
  else {
    return (&IODPDeviceTypeString::sStrings)[a1];
  }
}

BOOL IODPAudioCodingType(_DWORD *a1)
{
  return IOAVAudioLinkIsIEC61937(a1) && (unint64_t)IOAVAudioLinkGetBitRate(a1) > 0x5DC000;
}

void getTagString_cold_1()
{
}

void IOCFSerialize_cold_1()
{
}

void IOCFSerialize_cold_2()
{
}

void IOCFSerialize_cold_3()
{
}

void IOCFSerialize_cold_4()
{
}

void IOCFSerialize_cold_5()
{
}

void IOCFSerialize_cold_6()
{
}

void IOCFSerialize_cold_7()
{
}

void IOCFSerialize_cold_8()
{
}

void IOCFSerialize_cold_9()
{
}

void DoIdrefScan_cold_1()
{
}

void DoCFSerialize_cold_1()
{
}

void IOCFUnserializeBinary_cold_1()
{
}

void addStartTag_cold_1()
{
}

void IONotificationPortSetImportanceReceiver_cold_1()
{
  __assert_rtn("IONotificationPortSetImportanceReceiver", "IOKitLib.c", 968, "kr == KERN_SUCCESS");
}

void IOPMSetEnergyModePreference_cold_1()
{
  *(_WORD *)unsigned int v0 = 0;
  _os_log_error_impl( &dword_182DAF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to create dictionary to send message\n",  v0,  2u);
}

void IOHIDSessionFilterCreateWithClass_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterCreateWithClass_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterCreateWithClass_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterGetPropertyForClient_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182DAF000, a2, OS_LOG_TYPE_ERROR, "%@ is not serializable", (uint8_t *)&v2, 0xCu);
}

void IOHIDCopyHIDParameterFromEventSystem_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSetHIDParameterToEventSystem_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSetCursorEnable_cold_1()
{
}

void IOHIDSetCursorBounds_cold_1()
{
}

void IOHIDSetOnScreenCursorBounds_cold_1()
{
}

void _IOHIDSetFixedMouseLocation_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_182DAF000, v0, OS_LOG_TYPE_DEBUG, "Set fixed mouse location failed:0x%x", v1, 8u);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetStateForSelector_cold_1()
{
}

void IOHIDSetStateForSelector_cold_2()
{
}

void IOHIDSetModifierLockState_cold_1()
{
}

void ____loadTCCFramework_block_invoke_cold_1()
{
}

void ____loadTCCFramework_block_invoke_cold_2()
{
}

void ____loadTCCFramework_block_invoke_cold_3()
{
}

void ____loadTCCFramework_block_invoke_cold_4()
{
}

void IOPSCopyExternalPowerAdapterDetails_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPSCopyExternalPowerAdapterDetails_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPSCopyExternalPowerAdapterDetails_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_182DAF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Event handler is called %@\n",  (uint8_t *)&v1,  0xCu);
}

void IOPSGaugingMitigationGetState_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPSGaugingMitigationGetState_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPSGaugingMitigationGetState_block_invoke_cold_1()
{
}

void __IOPSSetBatteryDateOfFirstUse_block_invoke_cold_1()
{
}

void getPMQueue_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void getUserActiveValidDict_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMUnregisterNotification_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendUserActivityMsg_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendUserActivityMsg_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processUserActivityMsg_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processUserActivityMsg_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMLogWakeProgress_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl( &dword_182DAF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Wake progress from %d. data: 0x%x\n",  v1,  0xEu);
  OUTLINED_FUNCTION_3_0();
}

void _conveyMachPortToPowerd_cold_1(int *a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( &dword_182DAF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to send mach port for IOPMConnection id 0x%x. rc:0x%x\n",  (uint8_t *)v3,  0xEu);
  OUTLINED_FUNCTION_3_0();
}

void __IOPMConnectionCreate_block_invoke_cold_1()
{
}

void _connectionCreate_cold_1()
{
}

void _connectionCreate_cold_2()
{
}

void copyBatteryData_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyCurrentScheduledWake_block_invoke_126_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __copyBatteryData_block_invoke_148_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDDeviceReleasePrivate_cold_1(void *a1, _OWORD *a2, unsigned int *a3)
{
}

void IOHIDDeviceCreate_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDDeviceCreate_cold_2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_error_impl( &dword_182DAF000,  log,  OS_LOG_TYPE_ERROR,  "IOCreatePlugInInterfaceForService:0x%x for serviceID:%#llx",  (uint8_t *)v4,  0x12u);
}

void IOHIDDeviceCreate_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOHIDDeviceSetupAsyncSupport_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDDeviceSetupAsyncSupport_cold_2(void *a1, _OWORD *a2)
{
}

void __IOHIDDeviceSetupAsyncSupport_cold_3()
{
}

void IOHIDDeviceSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDDeviceRegisterRemovalCallback_cold_1()
{
}

void _IOHIDLogCategory_cold_1()
{
}

void _IOHIDObjectRetainCount_cold_1(void *a1, _OWORD *a2)
{
}

void _IOHIDObjectRetainCount_cold_2(void *a1, _OWORD *a2)
{
}

void _IOHIDObjectRetainCount_cold_3(void *a1, _OWORD *a2)
{
}

void IOHIDManagerSetDeviceMatching_cold_1()
{
}

void __IOHIDManagerSetDeviceMatching_cold_1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_182DAF000,  a2,  OS_LOG_TYPE_ERROR,  "IOServiceAddMatchingNotification:0x%x",  (uint8_t *)v2,  8u);
}

void IOHIDManagerSetDispatchQueue_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2(MEMORY[0x1895F8DA0]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDManagerSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2(MEMORY[0x1895F8DA0]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDManagerExtRelease_cold_1(void *a1, _OWORD *a2, unsigned int *a3)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2(MEMORY[0x1895F8DA0]);
  atomic_load(a3);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void IOHIDQueueScheduleWithRunLoop_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDQueueSetupAsyncSupport_cold_1()
{
}

void IOHIDQueueSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDQueueRegisterValueAvailableCallback_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDQueueRegisterValueAvailableCallback_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDQueueRegisterValueAvailableCallback_cold_3()
{
}

void __IOHIDQueueExtRelease_cold_1(void *a1, _OWORD *a2, unsigned int *a3)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  atomic_load(a3);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _IOHIDEventSetAttachment_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOHIDEventCreateWithBytesHelper_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v3[0] = 67109632;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = 16LL;
  _os_log_error_impl( &dword_182DAF000,  log,  OS_LOG_TYPE_ERROR,  "Failed to create event at index=%d , eventDataSize: %u < sizeof(IOHIDEventData): %lu",  (uint8_t *)v3,  0x18u);
  OUTLINED_FUNCTION_3_0();
}

void IOHIDEventGetPolicy_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182DAF000, a2, OS_LOG_TYPE_ERROR, "unexpected policy request %llu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void __IOHIDEventDataAppendEventData_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 134218240;
  uint64_t v3 = 0LL;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_182DAF000,  a2,  OS_LOG_TYPE_ERROR,  "insufficient buffer data available, size: %ld, length: %ld",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_3_0();
}

void __IOHIDEventDataAppendEventData_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDConnectionFilterCreate_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_182DAF000,  log,  OS_LOG_TYPE_ERROR,  "IOHIDConnectionFilterCreate failed to find symbol %@ for bundle %@",  (uint8_t *)&v3,  0x16u);
}

void IOHIDConnectionFilterCreate_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDConnectionFilterCreate_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDConnectionFilterCreate_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOHIDEventSystemRegister_cold_1()
{
  __assert_rtn( "__IOHIDEventSystemRegister",  "IOHIDEventSystem.c",  245,  "kIOHIDServerConnectionRootQueue = hid_dispatch_pthread_root_queue_create(IOHIDEvent Server Connection - Root, &a ttribute, NULL, 2)");
}

void __IOHIDEventSystemRegister_cold_2()
{
}

void IOHIDEventSystemCreate_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDEventSystemOpen_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDEventSystemOpen_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_182DAF000, log, OS_LOG_TYPE_ERROR, "Failed to create server dipatch queue", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientInitReplyPort_cold_1()
{
}

void __IOHIDEventSystemClientInitReplyPort_cold_2()
{
}

void __IOHIDEventSystemClientInitReplyPort_cold_3()
{
}

void __IOHIDEventSystemClientTerminationCallback_cold_1()
{
}

void IOHIDEventSystemClient_cold_1()
{
}

void __IOHIDEventSystemClientRefresh_cold_1()
{
}

void __IOHIDEventSystemClientRefresh_cold_2(mach_error_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a2, v3, "mach_port_deallocate(server_port) %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_3()
{
  __assert_rtn("__IOHIDEventSystemClientRefresh", "IOHIDEventSystemClient.c", 579, "kern_result == KERN_SUCCESS");
}

void __IOHIDEventSystemClientRefresh_cold_4(mach_error_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a2, v3, "mach_port_deallocate(bootstrap_port) %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_5(kern_return_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a2, v3, "bootstrap_look_up2 failed: %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_6(kern_return_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a2, v3, "bootstrap_look_up_per_user failed: %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_7(int *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_error_impl( &dword_182DAF000,  a2,  OS_LOG_TYPE_ERROR,  "xpc_user_sessions_get_foreground_uid failed: %d - %s",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_1()
{
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_2()
{
}

void __IOHIDEventSystemClientStartQueue_cold_1()
{
}

void IOHIDEventSystemClientSetDispatchQueue_cold_1()
{
}

void IOHIDEventSystemClientRegisterEventCallback_cold_1()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_1()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_2()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_3()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_4()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_5()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_6()
{
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_1()
{
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_2()
{
}

void IOHIDVirtualServiceClientRemove_cold_1()
{
}

void IOHIDVirtualServiceClientDispatchEvent_cold_1()
{
}

void IOHIDVirtualServiceClientDispatchEvent_cold_2()
{
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_1()
{
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_2()
{
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_3()
{
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_3()
{
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_4()
{
}

void _iohideventsystem_output_event_to_virtual_service_cold_1()
{
}

void _iohideventsystem_output_event_to_virtual_service_cold_2()
{
}

void IOHIDNotificationInvalidate_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDNotificationInvalidate_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_2(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceInit_cold_1(CFNumberRef *a1, os_log_s *a2)
{
  v4[3] = *MEMORY[0x1895F89C0];
  v4[0] = 0LL;
  CFNumberGetValue(*a1, kCFNumberSInt64Type, v4);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_3( &dword_182DAF000,  a2,  v3,  "[%#llx] Invalid entitlements property, expected Array or String",  (uint8_t *)v4);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceInit_cold_2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_182DAF000,  v1,  OS_LOG_TYPE_ERROR,  "0x%llx: IOServiceAddInterestNotification 0x%x",  v2,  0x12u);
  OUTLINED_FUNCTION_3_0();
}

void __IOHIDServiceInit_cold_3(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceInit_cold_4(void *a1, _OWORD *a2)
{
}

void _IOHIDServiceCreate_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_4(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_182DAF000, a2, OS_LOG_TYPE_ERROR, "Unable to retain service: 0x%x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void _IOHIDServiceOpen_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, v0, v1, "0x%llx: Failed to open service", v2);
  OUTLINED_FUNCTION_3_0();
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_1()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_fault_impl( &dword_182DAF000,  v2,  OS_LOG_TYPE_FAULT,  "Service plugin %@: %@ never called cancel handler for service: %@",  v3,  0x20u);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_2(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a2, a3, "Service: %@ cancellation timer timed out", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void IOHIDServiceConformsTo_cold_1()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  __int16 v3 = 2080;
  uint64_t v4 = "DeviceUsagePairs";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl( &dword_182DAF000,  v1,  OS_LOG_TYPE_ERROR,  "0x%llx: IOHIDService property %s incorrect type: %@",  v2,  0x20u);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceConformsToFunction_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  __int16 v3 = "DeviceUsagePairs";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_182DAF000,  a2,  OS_LOG_TYPE_ERROR,  "Entry of IOHIDService property %s incorrect type: %@",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_3_0();
}

void __IOHIDServiceQueueWillExecute_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceQueueDidExecute_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_2(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_3(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionCreate_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionCreate_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionClose_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_182DAF000, log, OS_LOG_TYPE_DEBUG, "IOHIDSession close completed", v1, 2u);
}

void _IOHIDSessionCopyPropertyForClient_cold_2(uint8_t *a1, uint64_t a2, uint64_t *a3, os_log_s *a4)
{
  uint64_t RegistryID = IOHIDServiceGetRegistryID(a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = RegistryID;
  _os_log_error_impl( &dword_182DAF000,  a4,  OS_LOG_TYPE_ERROR,  "CopyServiceRecords deep copy failed. Service record for %@ is not serializable.",  a1,  0xCu);
}

void IOHIDEventQueueCreate_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDEventQueueCreate_cold_2()
{
}

void IOHIDEventQueueCreate_cold_3()
{
}

void __IOHIDEventQueueCreatePrivate_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDEventQueueCreateWithVM_cold_1(unsigned int a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_182DAF000, log, OS_LOG_TYPE_ERROR, "Invalid ptr=%p size=%d.", (uint8_t *)&v3, 0x12u);
}

void IOHIDEventQueueNotify_cold_1()
{
}

void IOHIDEventQueueDequeueCopy_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDUserDeviceCreateWithOptions_cold_1()
{
}

void IOHIDUserDeviceCreateWithOptions_cold_2()
{
}

void IOHIDUserDeviceCreateWithOptions_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDUserDeviceCreateWithOptions_cold_4()
{
}

void IOHIDUserDeviceScheduleWithRunLoop_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDUserDeviceSetupAsyncSupport_cold_1()
{
}

void IOHIDUserDeviceSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDUserDeviceRegisterGetReportBlock_cold_1()
{
}

void IOHIDUserDeviceRegisterSetReportBlock_cold_1()
{
}

void IOHIDUserDeviceHandleReportWithTimeStamp_cold_1()
{
}

void __IOMIGMachPortRelease_cold_1(mach_error_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = mach_error_string(a1);
  _os_log_error_impl( &dword_182DAF000,  a2,  OS_LOG_TYPE_ERROR,  "__IOMIGMachPortRelease mach_port_mod_refs:%s",  (uint8_t *)&v3,  0xCu);
}

void _IOHIDCreateBinaryData_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_182DAF000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize CFObject: %@", (uint8_t *)&v3, 0xCu);
}

void IOHIDServiceFilterCreateWithClass_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCreateWithClass_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCreateWithClass_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCopyPropertyForClient_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_182DAF000,  log,  OS_LOG_TYPE_ERROR,  "%@ is not serializable. result: %@",  (uint8_t *)&v3,  0x16u);
}

void IOHIDServiceClientCopyDescription_cold_1()
{
}

void IOHIDServiceClientCopyDescription_cold_2()
{
}

void IOHIDServiceClientCopyDescription_cold_3()
{
}

void IOHIDServiceClientCopyDescription_cold_4()
{
}

void IOHIDServiceClientCopyDescription_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOHIDEventSystemConnectionCheckServerStatus_cold_1()
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_1( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_2( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_3( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_4( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_5( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionCreate_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_182DAF000, log, OS_LOG_TYPE_ERROR, "Unknown client type: %d pid:%d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3_0();
}

void _IOHIDEventSystemConnectionCreate_cold_2()
{
}

void _IOHIDEventSystemConnectionScheduleAsync_cold_1()
{
}

void IOHIDEventSystemConnectionDispatchEvent_cold_1()
{
  int v1 = *(_DWORD *)(v0 + 300);
  int v4 = 136315394;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl( &dword_182DAF000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Event enqueue dropped:%d consecutive events",  (uint8_t *)&v4,  0x12u);
  OUTLINED_FUNCTION_3_0();
}

void _IOHIDEventSystemConnectionQueueStop_cold_1( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionQueueStop_cold_2( int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _IOHIDEventSystemConnectionFilterEvent_cold_1()
{
}

void _IOHIDEventSystemConnectionAddServices_cold_1()
{
}

void _IOHIDEventSystemConnectionRemoveService_cold_1()
{
}

void _IOHIDEventSystemConnectionPropertyChanged_cold_1()
{
}

void _IOHIDEventSystemConnectionRecordClientChanged_cold_1()
{
}

void _IOHIDEventSystemConnectionSetProperty_cold_1()
{
}

void _IOHIDEventSystemConnectionSetProperty_cold_2()
{
}

void __IOHIDServiceVirtualCopyPropertyCallback_cold_1()
{
}

void __IOHIDServiceVirtualCopyMatchingEventCallback_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_182DAF000, log, OS_LOG_TYPE_ERROR, "Unable to serialize matching data", v1, 2u);
}

void _io_hideventsystem_dispatch_event_cold_1(uint64_t a1)
{
}

void _io_hideventsystem_register_event_filter_cold_1(uint64_t a1)
{
}

void _io_hideventsystem_register_record_client_changed_notification_cold_1(uint64_t a1)
{
}

void initialSetup_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void initialSetup_cold_2()
{
}

void initialSetup_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void initialSetup_cold_4()
{
}

void initialSetup_cold_5()
{
}

void initialSetup_cold_6()
{
}

void initialSetup_cold_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = "com.apple.powerd.assertionoffloadtimer";
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, MEMORY[0x1895F8DA0], a3, "Failed to register for %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void initialSetup_cold_8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = "com.apple.powerd.assertionoffloadtimer";
  OUTLINED_FUNCTION_1_3(&dword_182DAF000, a1, a3, "Failed to register for %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void offloadAssertions_cold_1(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_4_3(&dword_182DAF000, MEMORY[0x1895F8DA0], (uint64_t)a3, "Not a dictinary for 0x%x", a1);
}

void offloadAssertions_cold_2(uint8_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)a1 = 138412290;
  *a3 = v3;
  OUTLINED_FUNCTION_1_3( &dword_182DAF000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "Failed to create the remoteID to CF for id %@\n",  a1);
}

void offloadAssertions_cold_3()
{
}

void offloadAssertions_cold_4()
{
}

void offloadAssertions_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void offloadAssertions_cold_6()
{
}

void offloadAssertions_cold_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void offloadAssertions_cold_8()
{
}

void processRemoteMsg_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_2()
{
}

void processRemoteMsg_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_4()
{
}

void processRemoteMsg_cold_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_8()
{
}

void activateAsyncAssertion_cold_1()
{
}

void activateAsyncAssertion_cold_2()
{
}

void logAsyncAssertionActivity_cold_1()
{
}

void logAsyncAssertionActivity_cold_2()
{
}

void insertIntoTimedList_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_14( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v0,  "Setting assertion timeout to fire in %d secs for timeout_ts %llu",  v1);
  OUTLINED_FUNCTION_3_0();
}

void insertIntoTimedList_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_14( &dword_182DAF000,  v0,  (uint64_t)v0,  "Setting assertion timeout to fire in %d secs for timeout_ts %llu",  v1);
  OUTLINED_FUNCTION_3_0();
}

void insertIntoTimedList_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void insertIntoTimedList_cold_4()
{
}

void createAsyncAssertion_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createAsyncAssertion_cold_2()
{
}

void __createAsyncAssertion_block_invoke_cold_1()
{
}

void __createAsyncAssertion_block_invoke_cold_2()
{
}

void __createAsyncAssertion_block_invoke_cold_3(int **a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v5[0] = 67109634;
  v5[1] = v3;
  OUTLINED_FUNCTION_19();
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_17( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v4,  "Async assertion created with 0x%x, length %ld, %@\n",  (uint8_t *)v5);
  OUTLINED_FUNCTION_29();
}

void __createAsyncAssertion_block_invoke_cold_4(int **a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v5 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v7[0] = 67109634;
  v7[1] = v5;
  OUTLINED_FUNCTION_19();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_17(&dword_182DAF000, a3, v6, "Async assertion created with 0x%x, length %ld, %@\n", (uint8_t *)v7);
  OUTLINED_FUNCTION_20();
}

void __createAsyncAssertion_block_invoke_cold_5()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(&dword_182DAF000, MEMORY[0x1895F8DA0], v0, "Initial level is off for 0x%x: %@", v1);
  OUTLINED_FUNCTION_3_0();
}

void __createAsyncAssertion_block_invoke_cold_6()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(&dword_182DAF000, v0, (uint64_t)v0, "Initial level is off for 0x%x: %@", v1);
  OUTLINED_FUNCTION_3_0();
}

void __createAsyncAssertion_block_invoke_cold_7()
{
}

void __createAsyncAssertion_block_invoke_cold_8()
{
}

void _releaseAsycnAssertion_cold_1()
{
}

void _releaseAsycnAssertion_cold_2()
{
}

void _releaseAsycnAssertion_cold_3()
{
}

void _releaseAsycnAssertion_cold_4()
{
}

void _releaseAsycnAssertion_cold_5(int a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_26();
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  OUTLINED_FUNCTION_25( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v4,  "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld",  v5);
  OUTLINED_FUNCTION_29();
}

void _releaseAsycnAssertion_cold_6(int a1, os_log_s *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v4 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_26();
  int v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = v5;
  OUTLINED_FUNCTION_25( &dword_182DAF000,  a2,  v6,  "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld",  v7);
  OUTLINED_FUNCTION_20();
}

void removeFromTimedList_cold_1()
{
}

void removeFromTimedList_cold_2()
{
}

void sendAsyncReleaseMsg_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncReleaseMsg_cold_2()
{
}

void sendAsyncReleaseMsg_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncReleaseMsg_cold_4()
{
}

void sendAsyncReleaseMsg_cold_5()
{
}

void sendAsyncReleaseMsg_cold_6(os_log_s *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0(&dword_182DAF000, a1, v2, "Logging all %ld activity to powerd\n", v3);
  OUTLINED_FUNCTION_12();
}

void sendAsyncReleaseMsg_cold_7()
{
}

void sendAsyncReleaseMsg_cold_8()
{
}

void setAsyncAssertionProperties_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v3[0] = 67109634;
  v3[1] = a3;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_17( &dword_182DAF000,  MEMORY[0x1895F8DA0],  a3,  "setAsyncAssertionProperties for 0x%x %@:%@",  (uint8_t *)v3);
  OUTLINED_FUNCTION_12();
}

void __setAsyncAssertionProperties_block_invoke_cold_1()
{
}

void __setAsyncAssertionProperties_block_invoke_cold_2()
{
}

void __setAsyncAssertionProperties_block_invoke_cold_3()
{
}

void __setAsyncAssertionProperties_block_invoke_cold_4()
{
}

void __setAsyncAssertionProperties_block_invoke_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setAsyncAssertionProperties_block_invoke_cold_6()
{
}

void __setAsyncAssertionProperties_block_invoke_cold_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setAsyncAssertionProperties_block_invoke_cold_8()
{
}

void handleAssertionLevel_cold_1()
{
}

void handleAssertionLevel_cold_2()
{
}

void handleAssertionLevel_cold_3(int *a1, uint64_t a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a3;
  __int16 v5 = 1024;
  int v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl( &dword_182DAF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "handleAssertionLevel for 0x%x to %d: %@",  (uint8_t *)v4,  0x18u);
  OUTLINED_FUNCTION_3_0();
}

void handleAssertionLevel_cold_4()
{
}

void handleAssertionLevel_cold_5()
{
}

void handleAssertionLevel_cold_6()
{
}

void handleAssertionLevel_cold_7()
{
}

void sendAsyncAssertionMsg_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_4()
{
}

void sendAsyncAssertionMsg_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_6()
{
}

void sendAsyncAssertionMsg_cold_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_8()
{
}

void sendAsyncAssertionMsg_cold_11( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_12()
{
}

void processCheckAssertionsMsg_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processCheckAssertionsMsg_cold_2()
{
}

void __processCheckAssertionsMsg_block_invoke_cold_1()
{
}

void __processCheckAssertionsMsg_block_invoke_cold_2()
{
}

void processAssertionTimeout_cold_1()
{
}

void processAssertionTimeout_cold_2()
{
}

void processAssertionTimeout_cold_3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v0,  "processAssertionTimeout: Removing idx:%d id:0x%x",  v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionTimeout_cold_4()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_182DAF000, v0, (uint64_t)v0, "processAssertionTimeout: Removing idx:%d id:0x%x", v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionTimeout_cold_5()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v0,  "processAssertionTimeout: Turning off assertion idx:%d id:0x%x",  v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionTimeout_cold_6()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0( &dword_182DAF000,  v0,  (uint64_t)v0,  "processAssertionTimeout: Turning off assertion idx:%d id:0x%x",  v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionTimeout_cold_7()
{
}

void processAssertionTimeout_cold_8()
{
}

void processAssertionTimeout_cold_9()
{
}

void processAssertionTimeout_cold_10()
{
}

void processAssertionTimeout_cold_11()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_28( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v0,  "Received a release not for gCurrentRemoteAssertion:0x%x. Received 0x%x",  v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionTimeout_cold_12()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_28( &dword_182DAF000,  v0,  (uint64_t)v0,  "Received a release not for gCurrentRemoteAssertion:0x%x. Received 0x%x",  v1);
  OUTLINED_FUNCTION_3_0();
}

void processAssertionUpdateActivity_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processAssertionUpdateActivity_cold_2()
{
}

void processAssertionUpdateActivity_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processAssertionUpdateActivity_cold_4()
{
}

void processAssertionUpdateActivity_cold_5()
{
}

void processAssertionUpdateActivity_cold_6()
{
}

void processCurrentActiveAssertions_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processCurrentActiveAssertions_cold_2()
{
}

void processCurrentActiveAssertions_cold_5(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_4_3(&dword_182DAF000, MEMORY[0x1895F8DA0], (uint64_t)a3, "Not a dictianary for 0x%x", a1);
}

void handleAssertionTimeout_cold_1()
{
}

void handleAssertionTimeout_cold_2()
{
}

void handleAssertionTimeout_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handleAssertionTimeout_cold_4()
{
}

void handleAssertionTimeout_cold_7(uint8_t *a1, int *a2, _DWORD *a3)
{
  int v3 = *a2;
  *(_DWORD *)a1 = 67109120;
  *a3 = v3;
  OUTLINED_FUNCTION_4_3( &dword_182DAF000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "Failed to release assertion 0x%x on timeout",  a1);
}

void handleAssertionTimeout_cold_8()
{
}

void handleAssertionTimeout_cold_9()
{
}

void IOPMAssertionCreateWithName_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 134217984;
  uint64_t v4 = collectBackTrace;
  OUTLINED_FUNCTION_1_3( &dword_182DAF000,  MEMORY[0x1895F8DA0],  a3,  "IOPMAssertionCreateWithProperties: Failure copying assertion properties. Collect backtrace %llu",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void IOPMAssertionCreateWithProperties_cold_3()
{
}

void IOPMAssertionCreateWithProperties_cold_4()
{
}

void IOPMAssertionCreateWithProperties_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_6( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionRetain_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionRetain_cold_2()
{
}

void IOPMAssertionSetProcessState_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_182DAF000, MEMORY[0x1895F8DA0], v0, "Setting Assertion State for PID %d to %d\n", v1);
  OUTLINED_FUNCTION_3_0();
}

void IOPMCopyAssertionActivityUpdateWithCallback_cold_2()
{
}

void IOPMCopyAssertionActivityUpdateWithCallback_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMCopyAssertionActivityUpdateWithCallback_cold_4()
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_2()
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_12_0( &dword_182DAF000,  MEMORY[0x1895F8DA0],  v0,  "Received assertion activity update refcnt %u overflow %d",  v1);
  OUTLINED_FUNCTION_3_0();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_4()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_12_0( &dword_182DAF000,  v0,  (uint64_t)v0,  "Received assertion activity update refcnt %u overflow %d",  v1);
  OUTLINED_FUNCTION_3_0();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_135_cold_6()
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1896025D0](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x189602600](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602670](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues( CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027E0](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFArrayRef CFBundleCreateBundlesFromDirectory( CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x1896028A8](allocator, directoryURL, bundleType);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1896028B8](bundle, symbolName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028D8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

CFPlugInRef CFBundleGetPlugIn(CFBundleRef bundle)
{
  return (CFPlugInRef)MEMORY[0x1896028F8](bundle);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x189602950](allocator, identifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
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

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter( CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x189602B18](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithDate( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x189602B28](allocator, formatter, date);
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

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
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

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFMachPortRef CFMachPortCreate( CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DB0](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x189602DD0](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x189602E88]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x189602E90](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x189602EF0](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x189602EF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x189602F20](number);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return (CFPlugInRef)MEMORY[0x189602F30](allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return (CFArrayRef)MEMORY[0x189602F38](typeUUID, plugIn);
}

CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn)
{
  return (CFBundleRef)MEMORY[0x189602F40](plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return (void *)MEMORY[0x189602F48](allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple( CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x189602F80](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple( CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue( CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x189602FC0](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x189602FD8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x189602FE0](allocator, stream, streamLength, mutabilityOption, format, errorString);
}

CFPropertyListRef CFPropertyListCreateFromXMLData( CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x189602FE8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x189603008](allocator, propertyList);
}

CFIndex CFPropertyListWriteToStream( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x189603020](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x189603050](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate( CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1896031A0](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

CFTypeID CFRunLoopSourceGetTypeID(void)
{
  return MEMORY[0x1896031B0]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

CFTypeID CFRunLoopTimerGetTypeID(void)
{
  return MEMORY[0x189603208]();
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x189603258](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x189603268](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x189603278]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x189603280](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFShow(CFTypeRef obj)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1896032D0](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative( CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1896032D8](allocator, *(void *)&sock, callBackTypes, callout, context);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments( CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings( CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x189603410](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x189603588]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x189603688](allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036D0](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036F8](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603758](allocator, url);
}

Boolean CFURLCreateDataAndPropertiesFromResource( CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x189603768](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

CFTypeRef CFURLCreatePropertyFromResource( CFAllocatorRef alloc, CFURLRef url, CFStringRef property, SInt32 *errorCode)
{
  return (CFTypeRef)MEMORY[0x189603790](alloc, url, property, errorCode);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x189603838](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x189603848](url, error);
}

Boolean CFURLWriteDataAndPropertiesToResource( CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32 *errorCode)
{
  return MEMORY[0x189603868](url, dataToWrite, propertiesToWrite, errorCode);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
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

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

fat_arch *__cdecl NXFindBestFatArch( cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1895F8548](*(void *)&cputype, *(void *)&cpusubtype, fat_archs, *(void *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1895F8550](*(void *)&cputype, *(void *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1895F8558](name);
}

const NXArchInfo *NXGetLocalArchInfo(void)
{
  return (const NXArchInfo *)MEMORY[0x1895F8560]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1895F85C8](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
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

uint64_t _CFBundleCopyExecutableURLInDirectory()
{
  return MEMORY[0x189604100]();
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x189604128]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x189604558]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x189604830]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

double __exp10(double a1)
{
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895F8938]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1895F8998](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID()
{
  return MEMORY[0x1895F8AF0]();
}

uint64_t _dispatch_workloop_set_observer_hooks_4IOHID()
{
  return MEMORY[0x1895F8BA0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t _os_nospin_lock_trylock()
{
  return MEMORY[0x1895F8E00]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1895F8E08]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1895F9510](client, msg, *(void *)&level, format);
}

void audit_token_to_au32( audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1895F95F0](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9610](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1895F9620]();
}

uint64_t bootstrap_look_up_per_user()
{
  return MEMORY[0x1895F9628]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1895F9648](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x189616470](cls, protocol);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x189616500](cls, sel);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit2_( z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x189617598]( strm,  *(void *)&level,  *(void *)&method,  *(void *)&windowBits,  *(void *)&memLevel,  *(void *)&strategy,  version,  *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1895FACF0]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FACF8]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1895FAD00]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1895FAD08]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FAD20]();
}

uint64_t dispatch_mig_server()
{
  return MEMORY[0x1895FAD40]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1895FADA8](queue, key);
}

void dispatch_queue_set_specific( dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FAE30]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, unint64_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1895FAF08](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1895FAF30]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FAF48](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t entr_act_begin()
{
  return MEMORY[0x1896151C8]();
}

uint64_t entr_act_end()
{
  return MEMORY[0x1896151D0]();
}

uint64_t entr_act_modify()
{
  return MEMORY[0x1896151D8]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1895FB598](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FB728](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1896175B8](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1896175D0](*(void *)&fd, mode);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x189617600](file, buf, *(void *)&len);
}

kern_return_t host_get_io_main(host_t host, io_main_t *io_main)
{
  return MEMORY[0x1895FB770](*(void *)&host, io_main);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FB810](a1, *(void *)&a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x189617618](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x189617620](strm, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

kern_return_t kext_request( host_priv_t host_priv, uint32_t user_log_flags, vm_offset_t request_data, mach_msg_type_number_t request_dataCnt, vm_offset_t *response_data, mach_msg_type_number_t *response_dataCnt, vm_offset_t *log_data, mach_msg_type_number_t *log_dataCnt, kern_return_t *op_result)
{
  return MEMORY[0x1895FB8E0]( *(void *)&host_priv,  *(void *)&user_log_flags,  request_data,  *(void *)&request_dataCnt,  response_data,  response_dataCnt,  log_data,  log_dataCnt);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FBAC8]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_make_memory_entry_64( vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1895FBAD8]( *(void *)&target_task,  size,  offset,  *(void *)&permission,  object_handle,  *(void *)&parent_entry);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

uint64_t mach_msg2_internal()
{
  return MEMORY[0x1895FBAF0]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes( ipc_space_inspect_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1895FBB48](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_get_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1895FBB58](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1895FBB88]( *(void *)&task,  *(void *)&name,  *(void *)&msgid,  *(void *)&sync,  *(void *)&notify,  *(void *)&notifyPoly,  previous);
}

kern_return_t mach_port_set_attributes( ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1895FBB90]( *(void *)&task,  *(void *)&name,  *(void *)&flavor,  port_info,  *(void *)&port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FBC18]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FBE88]();
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FBE98]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FBEA0]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEB8](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEC0](dest, src, *(void *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1895FC1A0](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1895FC1D0](name, notify_port, *(void *)&flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1896166D0](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1896169B0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x1895FC938](a1, a2, a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC940](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1895FC948](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC958](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1895FC968](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1895FC970](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1895FC978](a1, *(void *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1895FCA38](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1895FCAB0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1895FCAB8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1895FCAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1895FCB38](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCCA8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

uint64_t rootless_check_trusted()
{
  return MEMORY[0x1895FCD88]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x189616A50](str);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCE30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

void swap_load_command(load_command *lc, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
}

void swap_segment_command(segment_command *sg, NXByteOrder target_byte_order)
{
}

void swap_segment_command_64(segment_command_64 *sg, NXByteOrder target_byte_order)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1895FD310](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1895FD338](*(void *)&target_tport, *(void *)&pid, tn);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1895FD448](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FD4A8](a1, a2);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_read( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1895FD5A8](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1895FDAB0]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
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

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}