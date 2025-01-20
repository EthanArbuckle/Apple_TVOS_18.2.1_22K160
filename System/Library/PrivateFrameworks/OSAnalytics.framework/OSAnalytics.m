BOOL SimulateCrash(int a1, uint64_t a2, void *a3)
{
  id v4;
  pid_t v5;
  v4 = a3;
  v5 = getpid();
  if (v5 == a1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      SimulateCrash_cold_1((uint64_t)v4);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    SimulateCrash_cold_2();
  }

  return v5 == a1;
}

BOOL WriteStackshotReport(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 0, 0, 0, 0LL);
}

BOOL _WriteStackshotReport(void *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v11 = a1;
  id v12 = a6;
  v13 = getprogname();
  if ([v11 length])
  {
    v14 = (void *)MEMORY[0x186E340A4]();
    OSAnalyticsHelperServiceConnection();
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v33 = v14;
      *(_OWORD *)buf = 0u;
      __int128 v40 = 0u;
      if (!v13)
      {
        pid_t v16 = getpid();
        v13 = (const char *)buf;
        __sprintf_chk((char *)buf, 0, 0x20uLL, "%d", v16);
      }

      xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v17, "operation", 2uLL);
      xpc_dictionary_set_string(v17, "caller", v13);
      if (v11) {
        v18 = (const char *)[v11 UTF8String];
      }
      else {
        v18 = "(none)";
      }
      xpc_dictionary_set_string(v17, "reason", v18);
      xpc_dictionary_set_uint64(v17, "exception_code", a2);
      xpc_dictionary_set_uint64(v17, "PID", a4);
      xpc_dictionary_set_uint64(v17, "flags", a5);
      if (v12)
      {
        int v31 = a3;
        xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v32 = v12;
        id v21 = v12;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t i = 0LL; i != v23; ++i)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(id *)(*((void *)&v34 + 1) + 8 * i);
              v27 = (const char *)[v26 UTF8String];
              id v28 = [v21 objectForKeyedSubscript:v26];
              xpc_dictionary_set_string(v20, v27, (const char *)[v28 UTF8String]);
            }

            uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }

          while (v23);
        }

        xpc_dictionary_set_value(v17, "additional_payload", v20);
        id v12 = v32;
        a3 = v31;
      }

      if (a3)
      {
        xpc_connection_send_message(v15, v17);
        BOOL v19 = 1LL;
      }

      else
      {
        xpc_object_t v29 = xpc_connection_send_message_with_reply_sync(v15, v17);
        BOOL v19 = xpc_dictionary_get_BOOL(v29, "result");
      }

      v14 = v33;
    }

    else
    {
      BOOL v19 = 0LL;
    }

    objc_autoreleasePoolPop(v14);
  }

  else
  {
    BOOL v19 = 0LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Stackshot requires reason; ignoring request",
        buf,
        2u);
      BOOL v19 = 0LL;
    }
  }

  return v19;
}

BOOL WriteStackshotReport_async(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 1, 0, 0, 0LL);
}

BOOL WriteStackshotReportWithPID(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, 0LL);
}

BOOL WriteStackshotReportWithPayload(void *a1, uint64_t a2, int a3, void *a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, a4);
}

BOOL WriteStackshotReportWithOptionsAndPayload(void *a1, uint64_t a2, int a3, unsigned int a4, void *a5)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, a5);
}

BOOL WriteStackshotReportWithPID_async(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 1, a3, 0, 0LL);
}

BOOL WriteStackshotReportWithOptions(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, 0LL);
}

BOOL WriteStackshotReportWithOptions_async(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 1, a3, a4, 0LL);
}

BOOL WriteStackshotReport_stdc(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x186E340A4]();
  [NSString stringWithUTF8String:a1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = _WriteStackshotReport(v5, a2, 0, 0, 0, 0LL);

  objc_autoreleasePoolPop(v4);
  return v6;
}

BOOL WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0LL, 0);
}

BOOL _WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3, void *a4, int a5)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x186E340A4]();
  OSAnalyticsHelperServiceConnection();
  id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "operation", 3uLL);
    xpc_dictionary_set_uint64(v13, "PID", a1);
    xpc_dictionary_set_uint64(v13, "ers_namespace", *a2);
    xpc_dictionary_set_uint64(v13, "ers_code", *(void *)(a2 + 1));
    xpc_dictionary_set_uint64(v13, "ers_flags", *(void *)(a2 + 3));
    if (v9) {
      v14 = (const char *)[v9 UTF8String];
    }
    else {
      v14 = "(none)";
    }
    xpc_dictionary_set_string(v13, "reason", v14);
    if (v10)
    {
      int v27 = a5;
      id v28 = v11;
      id v29 = v9;
      xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0LL; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(id *)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v23 = (const char *)[v22 UTF8String];
            id v24 = [v17 objectForKeyedSubscript:v22];
            xpc_dictionary_set_string(v16, v23, (const char *)[v24 UTF8String]);
          }

          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v19);
      }

      xpc_dictionary_set_value(v13, "additional_payload", v16);
      id v11 = v28;
      id v9 = v29;
      a5 = v27;
    }

    if (a5)
    {
      xpc_connection_send_message(v12, v13);
      BOOL v15 = 1LL;
    }

    else
    {
      xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v12, v13);
      BOOL v15 = xpc_dictionary_get_BOOL(v25, "result");
    }
  }

  else
  {
    BOOL v15 = 0LL;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

BOOL WriteCrashReportWithStackshot_async(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0LL, 1);
}

BOOL WriteCrashReportWithStackshotWithPayload(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 0);
}

BOOL WriteCrashReportWithStackshotWithPayload_async(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 1);
}

BOOL WriteSystemMemoryResetReport(const char *a1, uint64_t a2, uint64_t a3)
{
  return WriteSystemMemoryResetReportWithPids(a1, a2, a3, 0LL, 0);
}

BOOL WriteSystemMemoryResetReportWithPids(const char *a1, uint64_t a2, uint64_t a3, int *a4, int a5)
{
  id v9 = (void *)MEMORY[0x186E340A4]();
  OSAnalyticsHelperServiceConnection();
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v11, "operation", 4uLL);
    if (a1) {
      id v12 = a1;
    }
    else {
      id v12 = "";
    }
    xpc_dictionary_set_string(v11, "reason", v12);
    xpc_dictionary_set_uint64(v11, "event_code", a2);
    if (a4 && a5)
    {
      xpc_object_t v13 = xpc_array_create(0LL, 0LL);
      if (a5 >= 1)
      {
        uint64_t v14 = a5;
        do
        {
          int64_t v15 = *a4++;
          xpc_object_t v16 = xpc_int64_create(v15);
          xpc_array_append_value(v13, v16);

          --v14;
        }

        while (v14);
      }

      xpc_dictionary_set_value(v11, "pids", v13);
    }

    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v10, v11);
    BOOL v18 = xpc_dictionary_get_BOOL(v17, "result");
  }

  else
  {
    BOOL v18 = 0LL;
  }

  objc_autoreleasePoolPop(v9);
  return v18;
}

LABEL_51:
      objc_msgSend(v18, "appendFormat:", v11, v15, v16);
LABEL_52:
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"portlabels"];
      xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 appendPortLabelInfo:v5 portlabels:v13];

      goto LABEL_40;
    case 5:
      objc_msgSend(v8, "appendFormat:", @"mach_msg send on port %#llx in transit to ", v7);
      if (v6)
      {
        uint64_t v14 = v6;
        id v9 = @"port %#llx";
      }

      else
      {
        id v9 = @"unknown port";
      }

      goto LABEL_38;
    case 6:
      objc_msgSend(v8, "appendFormat:", @"semaphore port %#llx", v7);
      if (!v6) {
        goto LABEL_27;
      }
      uint64_t v14 = v6;
      id v9 = @" owned by pid %lld";
      goto LABEL_38;
    case 7:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for reading", v7, v16);
      goto LABEL_24;
    case 8:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for writing", v7, v16);
      goto LABEL_24;
    case 9:
      objc_msgSend(v8, "appendFormat:", @"krwlock %#llx for upgrading", v7, v16);
      goto LABEL_24;
    case 10:
      id v12 = @"unfair ";
      if (!v6) {
        id v12 = @"spin";
      }
      [v8 appendFormat:@"%@lock %#llx", v12, v7];
LABEL_24:
      if (v6) {
        goto LABEL_25;
      }
      goto LABEL_40;
    case 11:
      objc_msgSend(v8, "appendFormat:", @"pthread mutex %#llx", v7);
      if (v6)
      {
LABEL_25:
        uint64_t v14 = v6;
        id v9 = @" owned by thread %lld";
      }

      else
      {
LABEL_27:
        id v9 = @" with unknown owner";
      }

LABEL_38:
      v8 = v18;
      goto LABEL_39;
    case 12:
      objc_msgSend(v8, "appendFormat:", @"pthread rwlock %#llx for reading", v7, v16, v17);
      goto LABEL_40;
    case 13:
      objc_msgSend(v8, "appendFormat:", @"pthread rwlock %#llx for writing", v7, v16, v17);
      goto LABEL_40;
    case 14:
      objc_msgSend(v8, "appendFormat:", @"pthread condvar %#llx", v7, v16, v17);
      goto LABEL_40;
    case 16:
      switch(v6)
      {
        case -8LL:
          id v9 = @"queue that is suspended";
          goto LABEL_39;
        case 0LL:
          id v9 = @"queue in a transient state";
          goto LABEL_39;
        case -7LL:
          id v9 = @"queue thread to be allocated";
LABEL_39:
          objc_msgSend(v8, "appendFormat:", v9, v14, v16, v17);
          goto LABEL_40;
      }

      objc_msgSend(v8, "appendFormat:", @"queue processed by thread %llu", v6, v16, v17);
LABEL_40:
      [*(id *)(a1 + 40) addObject:v18];

      return;
    case 20:
      objc_msgSend(v8, "appendFormat:", @"thread %llu in compressor segment %#llx", v6, v7, v17);
      goto LABEL_40;
    default:
      objc_msgSend(v8, "appendFormat:", @"unknown type %u (owner %llu, context %#llx)", v4, v6, v7);
      goto LABEL_40;
  }
}

LABEL_22:
}

LABEL_19:
  -[NSMutableArray removeAllObjects](self->_frontmostPids, "removeAllObjects");
  xpc_object_t v16 = memorystatus_control();
  if (v16 < 1)
  {
    id v28 = self->super._notes;
    objc_msgSend( NSString,  "stringWithFormat:",  @"No jetsam status list available (size query returned %d)",  (2 * v16));
LABEL_44:
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v28, "addObject:", v35);

    goto LABEL_47;
  }

  xpc_object_t v17 = malloc((2 * v16));
  if (!v17)
  {
    id v28 = self->super._notes;
    objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to allocate memory for jetsam status list",  v38);
    goto LABEL_44;
  }

  BOOL v18 = v17;
  uint64_t v19 = memorystatus_control();
  if ((int)v19 >= 25)
  {
    uint64_t v20 = v19 / 0x18uLL;
    id v21 = v18 + 1;
    while (1)
    {
      id v22 = *v21;
      uint64_t v23 = *((unsigned int *)v21 - 2);
      if (!proc_name(*((_DWORD *)v21 - 2), &buffer, 0x20u)
        || (buffer == 0x6F42676E69727053LL ? (id v24 = v40 == 6582881) : (id v24 = 0), !v24))
      {
        if ((v22 & 0x100) != 0)
        {
          if (*((_DWORD *)v21 - 1) != 100 && (v22 & 1) == 0) {
            goto LABEL_36;
          }
        }

        else if ((v22 & 1) == 0)
        {
          goto LABEL_36;
        }
      }

      frontmostPids = self->_frontmostPids;
      [MEMORY[0x189607968] numberWithInt:v23];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](frontmostPids, "addObject:", v27);

LABEL_36:
      v21 += 3;
      if (!--v20) {
        goto LABEL_46;
      }
    }
  }

  __int128 v36 = self->super._notes;
  objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to get jetsam status list (query returned %d)",  v19);
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v36, "addObject:", v37);

LABEL_46:
  free(v18);
LABEL_47:
  -[OSAStackShotReport queryThermalData](self, "queryThermalData");
}

  v5 = v4 >= (*(_DWORD *)(a1 + 8) & 0xFu);
  BOOL v6 = v4 - (*(_DWORD *)(a1 + 8) & 0xF);
  if (v5) {
    return v6;
  }
  else {
    return 0LL;
  }
}

  return v10;
}

        objc_autoreleasePoolPop(v13);
        id v12 = readdir(v10);
      }

      while (v12);
    }

    closedir(v10);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = __error();
    uint64_t v19 = strerror(*v18);
    *(_DWORD *)__str = 136315394;
    id v22 = a1;
    uint64_t v23 = 2080;
    id v24 = v19;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to open log directory '%s': %s",  (uint8_t *)__str,  0x16u);
  }
}

    [v12 lastObject];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v13 = v11;
    int64_t v15 = v14;
    goto LABEL_20;
  }

  -[OSALegacyXform _getValueForKey:fromBody:orHeader:]( self,  "_getValueForKey:fromBody:orHeader:",  @"faultingThread",  v9,  0LL);
  xpc_object_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v9 objectForKeyedSubscript:@"threads"];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", (int)objc_msgSend(v11, "intValue"));
    xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    int64_t v15 = v8;
LABEL_20:
    objc_msgSend(v13, "objectForKeyedSubscript:", v15, v28, v29, (void)v30);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }

  id v26 = 0LL;
LABEL_21:

  return v26;
}

uint64_t includeSection(void *a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uint64_t v5 = 0LL;
  if (a1 && v3) {
    uint64_t v5 = [v3 BOOLValue];
  }

  return v5;
}

LABEL_314:
          [v73 setPid:*((unsigned int *)ss_trace_buffer + 25)];
          [MEMORY[0x189603FC8] dictionary];
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          [v255 setObject:v254 forKeyedSubscript:@"threadById"];

          [*(id *)(v24 + 2408) numberWithInt:*((unsigned int *)ss_trace_buffer + 25)];
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          [v257 setObject:v256 forKeyedSubscript:@"pid"];

          [NSString stringWithUTF8String:ss_trace_buffer + 104];
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          [v259 setObject:v258 forKeyedSubscript:@"procname"];

          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 19)];
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          [v261 setObject:v260 forKeyedSubscript:@"pageFaults"];

          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 20)];
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          [v263 setObject:v262 forKeyedSubscript:@"pageIns"];

          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 21)];
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          [v265 setObject:v264 forKeyedSubscript:@"copyOnWriteFaults"];

          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 22)];
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          [v267 setObject:v266 forKeyedSubscript:@"timesThrottled"];

          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 23)];
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          [v269 setObject:v268 forKeyedSubscript:@"timesDidThrottle"];

          objc_msgSend(NSString, "stringWithFormat:", @"0x%llX", *((void *)ss_trace_buffer + 3));
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          [v271 setObject:v270 forKeyedSubscript:@"rawFlags"];

          if (*((_DWORD *)ss_trace_buffer + 18))
          {
            objc_msgSend(*(id *)(v24 + 2408), "numberWithUnsignedInt:");
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            [v73 data];
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            [v273 setObject:v272 forKeyedSubscript:@"suspendCount"];
          }

          [MEMORY[0x189603FA8] array];
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          v275 = v274;
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 4) != 0)
          {
            [v274 addObject:@"rsrcFlagged"];
            v276 = *((void *)ss_trace_buffer + 3);
            if ((v276 & 8) == 0)
            {
LABEL_318:
              if ((v276 & 0x10) == 0) {
                goto LABEL_319;
              }
              goto LABEL_334;
            }
          }

          else if ((v276 & 8) == 0)
          {
            goto LABEL_318;
          }

          [v275 addObject:@"terminatedSnapshot"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x10) == 0)
          {
LABEL_319:
            if ((v276 & 0x20) == 0) {
              goto LABEL_320;
            }
            goto LABEL_335;
          }

LABEL_334:
          [v275 addObject:@"suspended"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x20) == 0)
          {
LABEL_320:
            if ((v276 & 0x40) == 0) {
              goto LABEL_321;
            }
            goto LABEL_336;
          }

LABEL_335:
          [v275 addObject:@"frozen"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x40) == 0)
          {
LABEL_321:
            if ((v276 & 0x80) == 0) {
              goto LABEL_322;
            }
            goto LABEL_337;
          }

LABEL_336:
          [v275 addObject:@"darwinBG"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x80) == 0)
          {
LABEL_322:
            if ((v276 & 0x100) == 0) {
              goto LABEL_323;
            }
            goto LABEL_338;
          }

LABEL_337:
          [v275 addObject:@"extDarwinBG"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x100) == 0)
          {
LABEL_323:
            if ((v276 & 0x200) == 0) {
              goto LABEL_324;
            }
            goto LABEL_339;
          }

LABEL_338:
          [v275 addObject:@"visVisible"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x200) == 0)
          {
LABEL_324:
            if ((v276 & 0x400) == 0) {
              goto LABEL_325;
            }
            goto LABEL_340;
          }

LABEL_339:
          [v275 addObject:@"visNonvisible"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x400) == 0)
          {
LABEL_325:
            if ((v276 & 0x800) == 0) {
              goto LABEL_326;
            }
            goto LABEL_341;
          }

LABEL_340:
          [v275 addObject:@"foreground"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x800) == 0)
          {
LABEL_326:
            if ((v276 & 0x1000) == 0) {
              goto LABEL_327;
            }
            goto LABEL_342;
          }

LABEL_341:
          [v275 addObject:@"boosted"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x1000) == 0)
          {
LABEL_327:
            if ((v276 & 0x4000) == 0) {
              goto LABEL_328;
            }
            goto LABEL_343;
          }

LABEL_342:
          [v275 addObject:@"suppressed"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x4000) == 0)
          {
LABEL_328:
            if ((v276 & 0x8000) == 0) {
              goto LABEL_329;
            }
            goto LABEL_344;
          }

LABEL_343:
          [v275 addObject:@"isImpDonor"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x8000) == 0)
          {
LABEL_329:
            if ((v276 & 0x10000) == 0) {
              goto LABEL_330;
            }
            goto LABEL_345;
          }

LABEL_344:
          [v275 addObject:@"isLiveImpDonor"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x10000) == 0)
          {
LABEL_330:
            if ((v276 & 0x80000) == 0) {
              goto LABEL_350;
            }
            goto LABEL_346;
          }

LABEL_345:
          [v275 addObject:@"dirty"];
          v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x80000) == 0) {
            goto LABEL_350;
          }
LABEL_346:
          if ((v276 & 0x20000) != 0)
          {
            [v275 addObject:@"exceededWQConstrainedLimit"];
            v276 = *((void *)ss_trace_buffer + 3);
          }

          if ((v276 & 0x40000) != 0)
          {
            [v275 addObject:@"exceededWQTotalLimit"];
            v276 = *((void *)ss_trace_buffer + 3);
          }

LABEL_350:
          if ((v276 & 0x700000) != 0)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"uuidFaultFlags0x%08llX", v276 & 0x700000);
            v277 = (void *)objc_claimAutoreleasedReturnValue();
            [v275 addObject:v277];

            v276 = *((void *)ss_trace_buffer + 3);
          }

          if ((v276 & 0x200000) != 0)
          {
            objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v73, "pid"));
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            [v498 addObject:v278];

            objc_msgSend( v73,  "setInvalid_images:",  objc_msgSend(v73, "invalid_images") + objc_msgSend(v500, "count"));
            if ((excludeSection(v495, (uint64_t)@"uuidResampling") & 1) == 0 && !self->_dead_snapshot)
            {
              v279 = -[OSAStackShotReport resampleUUIDsForTask:usingCatalog:]( self,  "resampleUUIDsForTask:usingCatalog:",  [v73 pid],  v10);
              v280 = [v279 count];
              v281 = [v279 count];
              v282 = objc_msgSend(v73, "invalid_images");
              v283 = @"resampledAllImages";
              if (v281 != v282)
              {
                v284 = objc_msgSend(v279, "count", @"resampledAllImages");
                else {
                  v283 = @"resampledExtraImages";
                }
              }

              [v275 addObject:v283];
              if ([v279 count])
              {
                [v279 valueForKey:@"details"];
                v285 = (void *)objc_claimAutoreleasedReturnValue();
                [v73 data];
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                [v286 setObject:v285 forKeyedSubscript:@"resampled_images"];

                self = v517;
                [v516 addObjectsFromArray:v279];
              }

              v469 = (v469 + v280);
            }
          }

          else if ([v500 count])
          {
            [v516 addObjectsFromArray:v500];
            [v516 sortByAddressAndSetInferredSizes];
          }

          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x1000000) != 0)
          {
            [v275 addObject:@"TALEngaged"];
            v287 = *((void *)ss_trace_buffer + 3);
            if ((v287 & 0x4000000) == 0)
            {
LABEL_366:
              if ((v287 & 0x8000000) == 0) {
                goto LABEL_367;
              }
              goto LABEL_387;
            }
          }

          else if ((v287 & 0x4000000) == 0)
          {
            goto LABEL_366;
          }

          [v275 addObject:@"isDirtyTracked"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x8000000) == 0)
          {
LABEL_367:
            if ((v287 & 0x10000000) == 0) {
              goto LABEL_368;
            }
            goto LABEL_388;
          }

LABEL_387:
          [v275 addObject:@"allowIdleExit"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x10000000) == 0)
          {
LABEL_368:
            if ((v287 & 0x20000000) == 0) {
              goto LABEL_369;
            }
            goto LABEL_389;
          }

LABEL_388:
          [v275 addObject:@"isTranslated"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x20000000) == 0)
          {
LABEL_369:
            if ((v287 & 0x40000000) == 0) {
              goto LABEL_370;
            }
            goto LABEL_390;
          }

LABEL_389:
          [v275 addObject:@"sharedRegionNone"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x40000000) == 0)
          {
LABEL_370:
            if ((v287 & 0x80000000) == 0) {
              goto LABEL_371;
            }
            goto LABEL_391;
          }

LABEL_390:
          [v275 addObject:@"sharedRegionSystem"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x80000000) == 0)
          {
LABEL_371:
            if ((v287 & 0x100000000LL) == 0) {
              goto LABEL_372;
            }
            goto LABEL_392;
          }

LABEL_391:
          [v275 addObject:@"sharedRegionOther"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x100000000LL) == 0)
          {
LABEL_372:
            if ((v287 & 0x200000000LL) == 0) {
              goto LABEL_373;
            }
            goto LABEL_393;
          }

LABEL_392:
          [v275 addObject:@"dyldCompactInfoNone"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x200000000LL) == 0)
          {
LABEL_373:
            if ((v287 & 0x400000000LL) == 0) {
              goto LABEL_374;
            }
            goto LABEL_394;
          }

LABEL_393:
          [v275 addObject:@"dyldCompactInfoTooBig"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x400000000LL) == 0)
          {
LABEL_374:
            if ((v287 & 0x800000000LL) == 0) {
              goto LABEL_375;
            }
            goto LABEL_395;
          }

LABEL_394:
          [v275 addObject:@"dyldCompactInfoFaultedIn"];
          v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x800000000LL) == 0)
          {
LABEL_375:
            if ((v287 & 0x1000000000LL) == 0) {
              goto LABEL_377;
            }
LABEL_376:
            [v275 addObject:@"dyldCompactInfoTriedFault"];
            goto LABEL_377;
          }

LABEL_395:
          [v275 addObject:@"dyldCompactInfoMissing"];
          if ((*((void *)ss_trace_buffer + 3) & 0x1000000000LL) != 0) {
            goto LABEL_376;
          }
LABEL_377:
          if ([v275 count])
          {
            [v73 data];
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            [v288 setObject:v275 forKeyedSubscript:@"flags"];
          }

          if (*((void *)ss_trace_buffer + 7))
          {
            objc_msgSend(*(id *)(v24 + 2408), "numberWithUnsignedLongLong:");
            v289 = (void *)objc_claimAutoreleasedReturnValue();
            [v73 data];
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            [v290 setObject:v289 forKeyedSubscript:@"residentMemoryBytes"];
          }

          v291 = self->_frontmostPids;
          [*(id *)(v24 + 2408) numberWithInt:*((unsigned int *)ss_trace_buffer + 25)];
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v291) = -[NSMutableArray containsObject:](v291, "containsObject:", v292);

          if ((_DWORD)v291)
          {
            [v73 data];
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            [v293 setObject:&unk_189E30758 forKeyedSubscript:@"frontmost"];
          }

          v294 = *((void *)ss_trace_buffer + 4);
          v492 = *((void *)ss_trace_buffer + 5);
          v295 = -[OSAStackShotReport problemType](self, "problemType");
          v493 = v294;
          if ([v295 isEqualToString:@"409"])
          {
          }

          else
          {
            v296 = -[OSAStackShotReport problemType](self, "problemType");
            v297 = [v296 isEqualToString:@"509"];

            if (!v297) {
              goto LABEL_399;
            }
          }

          [(id)objc_opt_class() reduceToTwoSigFigures:(unint64_t)(self->super._capture_time - ((double)*((unint64_t *)ss_trace_buffer + 6) - v23))];
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 data];
          v299 = (void *)objc_claimAutoreleasedReturnValue();
          [v299 setObject:v298 forKeyedSubscript:@"processUptime"];

LABEL_399:
          v300 = v499;
          if (v502) {
            v300 = v502;
          }
          v301 = v300;
          v302 = v301;
          if (v301)
          {
            objc_msgSend( v10,  "targetSharedCache:withSlide:atBaseAddress:",  -[OSASharedCacheEntry original](v301, "original") + 8,  -[OSASharedCacheEntry sharedCacheSlide](v301, "sharedCacheSlide"),  (void)-[OSASharedCacheEntry original](v301, "original")[32]);
            if (-[OSASharedCacheEntry layout](v302, "layout"))
            {
              if (-[OSASharedCacheEntry isDefaultSharedCache](v302, "isDefaultSharedCache"))
              {
                if ((v445 & 1) == 0) {
                  objc_msgSend( v10,  "setRootedCacheLibs:count:",  -[OSASharedCacheEntry layout](v302, "layout"),  -[OSASharedCacheEntry layoutImageCount](v302, "layoutImageCount"));
                }
                v445 = 1;
              }

              else
              {
                objc_msgSend( v10,  "setRootedCacheLibs:count:",  -[OSASharedCacheEntry layout](v302, "layout"),  -[OSASharedCacheEntry layoutImageCount](v302, "layoutImageCount"));
                v445 = 0;
              }

              xpc_object_t v13 = v511;
            }

            else
            {
              xpc_object_t v13 = v511;
            }
          }

          else
          {
            xpc_object_t v13 = v511;
            if ((v468 & 1) != 0) {
              -[NSMutableArray addObject:]( self->super._notes,  "addObject:",  @"no shared cache available from the kernel snapshot -- this may impact symbolication");
            }
            v468 = 0;
          }

LABEL_451:
          goto LABEL_452;
        case 2310:
          v512 = v13;
          [v17 top];
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          [v80 setObject:v79 forKeyedSubscript:@"id"];

          v81 = *((_DWORD *)ss_trace_buffer + 26);
          [MEMORY[0x189603FA8] array];
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v82;
          if ((v81 & 1) != 0)
          {
            [v82 addObject:@"TH_WAIT"];
            if ((v81 & 2) == 0)
            {
LABEL_90:
              if ((v81 & 4) == 0) {
                goto LABEL_91;
              }
              goto LABEL_218;
            }
          }

          else if ((v81 & 2) == 0)
          {
            goto LABEL_90;
          }

          [v83 addObject:@"TH_SUSP"];
          if ((v81 & 4) == 0)
          {
LABEL_91:
            if ((v81 & 8) == 0) {
              goto LABEL_92;
            }
            goto LABEL_219;
          }

LABEL_218:
          [v83 addObject:@"TH_RUN"];
          if ((v81 & 8) == 0)
          {
LABEL_92:
            if ((v81 & 0x10) == 0) {
              goto LABEL_93;
            }
            goto LABEL_220;
          }

LABEL_219:
          [v83 addObject:@"TH_UNINT"];
          if ((v81 & 0x10) == 0)
          {
LABEL_93:
            if ((v81 & 0x20) == 0) {
              goto LABEL_94;
            }
            goto LABEL_221;
          }

LABEL_220:
          [v83 addObject:@"TH_TERMINATE"];
          if ((v81 & 0x20) == 0)
          {
LABEL_94:
            if ((v81 & 0x80) == 0) {
              goto LABEL_96;
            }
LABEL_95:
            [v83 addObject:@"TH_IDLE"];
            goto LABEL_96;
          }

LABEL_221:
          [v83 addObject:@"TH_TERMINATE2"];
          if ((v81 & 0x80) != 0) {
            goto LABEL_95;
          }
LABEL_96:
          [v78 data];
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          [v84 setObject:v83 forKeyedSubscript:@"state"];

          v85 = *((void *)ss_trace_buffer + 3);
          if (v85)
          {
            [v10 searchFrame:v85 in:v516 result:0];
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            [v87 setObject:v86 forKeyedSubscript:@"waitEvent"];
          }

          [*(id *)(v24 + 2408) numberWithShort:*((__int16 *)ss_trace_buffer + 57)];
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          [v89 setObject:v88 forKeyedSubscript:@"schedPriority"];

          [*(id *)(v24 + 2408) numberWithShort:*((__int16 *)ss_trace_buffer + 56)];
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          [v91 setObject:v90 forKeyedSubscript:@"basePriority"];

          if (ss_trace_buffer[117])
          {
            DecodeQOS(ss_trace_buffer[117]);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            [v93 setObject:v92 forKeyedSubscript:@"qosRequested"];
          }

          if (ss_trace_buffer[118])
          {
            DecodeQOS(ss_trace_buffer[118]);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            [v95 setObject:v94 forKeyedSubscript:@"qosOverride"];
          }

          if (ss_trace_buffer[116])
          {
            DecodeQOS(ss_trace_buffer[116]);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            [v97 setObject:v96 forKeyedSubscript:@"qosEffective"];
          }

          v98 = *((unsigned int *)ss_trace_buffer + 27);
          if ((_DWORD)v98)
          {
            DecodeThreadFlags(v98, 0LL);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            [v100 setObject:v99 forKeyedSubscript:@"schedFlags"];
          }

          v101 = *((void *)ss_trace_buffer + 10);
          if (v101)
          {
            DecodeThreadFlags(v101, 1LL);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            [v103 setObject:v102 forKeyedSubscript:@"snapshotFlags"];
          }

          v104 = *((void *)ss_trace_buffer + 4);
          if (v104)
          {
            [v10 searchFrame:v104 in:v516 result:0];
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            [v106 setObject:v105 forKeyedSubscript:@"continuation"];
          }

          if (ss_trace_buffer[80] < 0)
          {
            if (v471)
            {
              [v506 parent];
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              [v78 data];
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "truncated_threads");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              [v109 setObject:v108 forKeyedSubscript:v110];
            }

            else
            {
              [v78 data];
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              [v107 setObject:@"Unmapped pages caused truncated backtrace (resampling disabled)" forKeyedSubscript:@"notice"];
            }

            v487 = (v487 + 1);
          }

          v239 = *((void *)ss_trace_buffer + 8);
          v483 = (id)*((void *)ss_trace_buffer + 9);
          if (v501) {
            v240 = v239 * (unint64_t)*v501 / v501[1];
          }
          else {
            v240 = *((void *)ss_trace_buffer + 8);
          }
          [*(id *)(v24 + 2408) numberWithDouble:(double)v240 / 1000000000.0];
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          [v242 setObject:v241 forKeyedSubscript:@"userTime"];

          v243 = *((void *)ss_trace_buffer + 9);
          if (v501) {
            v243 = v243 * *v501 / v501[1];
          }
          [*(id *)(v24 + 2408) numberWithDouble:(double)v243 / 1000000000.0];
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          [v245 setObject:v244 forKeyedSubscript:@"systemTime"];

          v246 = v517->_capture_absoluteTime - *((void *)ss_trace_buffer + 11);
          if (v501) {
            v246 = v246 * *v501 / v501[1];
          }
          [*(id *)(v24 + 2408) numberWithDouble:(double)v246 / 1000000000.0];
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 data];
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          [v248 setObject:v247 forKeyedSubscript:@"lastRunTime"];

          v249 = *((void *)ss_trace_buffer + 12);
          if (v249 != -1)
          {
            v250 = v517->_capture_absoluteTime - v249;
            if (v501) {
              v250 = v250 * *v501 / v501[1];
            }
            [*(id *)(v24 + 2408) numberWithDouble:(double)v250 / 1000000000.0];
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 data];
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            [v252 setObject:v251 forKeyedSubscript:@"lastMadeRunnableTime"];
          }

          v490 = (v490 + 1);
          v493 += v239;
          v492 += (unint64_t)v483;

          id v10 = v505;
          xpc_object_t v17 = v506;
          self = v517;
          xpc_object_t v13 = v512;
          goto LABEL_587;
        case 2312:
        case 2319:
        case 2331:
        case 2332:
        case 2333:
        case 2338:
        case 2345:
        case 2346:
        case 2347:
        case 2348:
        case 2349:
        case 2372:
          goto LABEL_587;
        case 2313:
          v111 = v13;
          [v17 top];
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v114 = (void *)v113;
          if (v113) {
            v115 = (const __CFString *)v113;
          }
          else {
            v115 = @"<unprintable>";
          }
          [v112 data];
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v116;
          v118 = v115;
          v119 = @"name";
          goto LABEL_147;
        case 2318:
          if (!v491) {
            goto LABEL_587;
          }
          v550 = @"bootArgs";
          [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v551 = v120;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v551 forKeys:&v550 count:1];
          v121 = v13;
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v496[2](v496, v122);

          xpc_object_t v13 = v121;
          goto LABEL_447;
        case 2320:
          HIDWORD(v477) = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_587;
        case 2321:
          self->_jetsamLevel = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_587;
        case 2329:
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", "user_usec", v123, v17);

          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = self;
          v125 = "system_usec";
          goto LABEL_421;
        case 2330:
          v126 = *((void *)ss_trace_buffer + 2);
          if (v501) {
            v126 = v126 * *v501 / v501[1];
          }
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:v126];
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:]( self,  "addCustomField:value:into:",  "stackshot_duration_nsec",  v127,  v17);

          v128 = *((void *)ss_trace_buffer + 3);
          if (v501) {
            v128 = v128 * *v501 / v501[1];
          }
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:v128];
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:]( self,  "addCustomField:value:into:",  "stackshot_duration_outer_nsec",  v129,  v17);

          v130 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            v130 = 17;
          }
          if (v130 <= 2309)
          {
            v131 = v501;
            if (v130 == 17 || v130 == 19)
            {
              v132 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_417;
            }

LABEL_414:
            v203 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_415;
          }

          if (v130 == 2310)
          {
            v203 = *((_DWORD *)ss_trace_buffer + 1);
            v131 = v501;
            if (v203 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_418;
              }
              v203 = 112;
            }
          }

          else
          {
            v131 = v501;
            if (v130 != 2312) {
              goto LABEL_414;
            }
            v203 = *((_DWORD *)ss_trace_buffer + 1);
            if (v203 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_418;
              }
              v203 = 32;
            }
          }

LABEL_415:
          v59 = v203 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          v132 = v203 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v59) {
            v132 = 0;
          }
LABEL_417:
          if (v132 < 0x11) {
            goto LABEL_587;
          }
LABEL_418:
          v303 = *((void *)ss_trace_buffer + 4);
          if (v131) {
            v303 = v303 * *v131 / v131[1];
          }
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:v303];
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = self;
          v125 = "stackshot_duration_prior_nsec";
LABEL_421:
          -[OSAStackShotReport addCustomField:value:into:](v124, "addCustomField:value:into:", v125, v120, v17);
          goto LABEL_447;
        case 2337:
          [v17 top];
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v133
            || (v120 = v133, [v133 type] != 2307)
            && [v120 type] != 2353)
          {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.22();
          }

          v134 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            v134 = 17;
          }
          if (v134 <= 2309)
          {
            if (v134 == 17 || v134 == 19)
            {
              v135 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_428;
            }

LABEL_425:
            v204 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_426;
          }

          if (v134 == 2310)
          {
            v204 = *((_DWORD *)ss_trace_buffer + 1);
            if (v204 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_429;
              }
              v204 = 112;
            }
          }

          else
          {
            if (v134 != 2312) {
              goto LABEL_425;
            }
            v204 = *((_DWORD *)ss_trace_buffer + 1);
            if (v204 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_429;
              }
              v204 = 32;
            }
          }

LABEL_426:
          v59 = v204 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          v135 = v204 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v59) {
            v135 = 0;
          }
LABEL_428:
          if (v135 < 8) {
            goto LABEL_447;
          }
LABEL_429:
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v304 = v13;
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          [v120 data];
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          v307 = v306;
          v308 = v305;
          v309 = @"jetsamCoalition";
LABEL_446:
          [v306 setObject:v308 forKeyedSubscript:v309];

          xpc_object_t v13 = v304;
          id v24 = 0x189607000LL;
LABEL_447:

          goto LABEL_587;
        case 2344:
          v111 = v13;
          [v17 top];
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v114 = (void *)v136;
          if (v136) {
            v137 = (const __CFString *)v136;
          }
          else {
            v137 = @"<unknown>";
          }
          [v112 data];
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v116;
          v118 = v137;
          v119 = @"dispatch_queue_label";
LABEL_147:
          [v116 setObject:v118 forKeyedSubscript:v119];

          self = v517;
          goto LABEL_437;
        case 2352:
          v138 = v13;
          [v17 top];
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          [v140 setPid:*((unsigned int *)ss_trace_buffer + 10)];
          [MEMORY[0x189603FC8] dictionary];
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          [v140 data];
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          [v142 setObject:v141 forKeyedSubscript:@"threadById"];

          [MEMORY[0x189607968] numberWithInt:*((unsigned int *)ss_trace_buffer + 10)];
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          [v140 data];
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          [v144 setObject:v143 forKeyedSubscript:@"pid"];

          [NSString stringWithUTF8String:ss_trace_buffer + 44];
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          [v140 data];
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          [v146 setObject:v145 forKeyedSubscript:@"procname"];

          v147 = self->super._notes;
          v148 = (void *)NSString;
          [v140 data];
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          [v149 objectForKeyedSubscript:@"pid"];
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          [v148 stringWithFormat:@"Process %@ is in transition type %@", v150, v151];
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v147, "addObject:", v152);

          self = v517;
          id v10 = v505;
          xpc_object_t v17 = v506;
          goto LABEL_180;
        case 2360:
          [v17 top];
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = *((void *)ss_trace_buffer + 2);
          if (v154
            && *((void *)ss_trace_buffer + 3)
            && *((void *)ss_trace_buffer + 5)
            && *((void *)ss_trace_buffer + 4))
          {
            v513 = v13;
            if (v501) {
              v154 = v154 * *v501 / v501[1];
            }
            [MEMORY[0x189607968] numberWithDouble:(double)v154 / 1000000000.0];
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            [v120 data];
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            [v156 setObject:v155 forKeyedSubscript:@"suspensionLastStart"];

            v157 = *((void *)ss_trace_buffer + 3);
            if (v501) {
              v157 = v157 * *v501 / v501[1];
            }
            [MEMORY[0x189607968] numberWithDouble:(double)v157 / 1000000000.0];
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            [v120 data];
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            [v159 setObject:v158 forKeyedSubscript:@"suspensionLastEnd"];

            v160 = *((void *)ss_trace_buffer + 5);
            if (v501) {
              v160 = v160 * *v501 / v501[1];
            }
            [MEMORY[0x189607968] numberWithDouble:(double)v160 / 1000000000.0];
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            [v120 data];
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            [v162 setObject:v161 forKeyedSubscript:@"suspensionDuration"];

            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            [v120 data];
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            [v164 setObject:v163 forKeyedSubscript:@"suspensionCount"];

            xpc_object_t v13 = v513;
            id v24 = 0x189607000uLL;
          }

          goto LABEL_447;
        case 2371:
          v111 = v13;
          if ([v17 count])
          {
            [v17 top];
            v165 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v165 = 0LL;
          }

          v209 = objc_alloc_init(&OBJC_CLASS___OSASharedCacheEntry);
          -[OSASharedCacheEntry setSharedCacheInfo:](v209, "setSharedCacheInfo:", ss_trace_buffer + 16);
          [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 14)];
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          [v497 setObject:v209 forKeyedSubscript:v210];
          if (-[OSASharedCacheEntry isDefaultSharedCache](v209, "isDefaultSharedCache"))
          {
            v211 = v209;

            v499 = v211;
            self = v517;
          }

          goto LABEL_437;
        case 2373:
          v166 = v24;
          v111 = v13;
          [*(id *)(v166 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 4)];
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          [v497 objectForKeyedSubscript:v167];
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v166 + 2408), "numberWithUnsignedInt:", objc_msgSend(v168, "sharedCacheID"));
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = [v169 isEqual:v167];

          if (v170)
          {
            v171 = v168;

            if ([v17 count])
            {
              [v17 top];
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              if (v172) {
                v173 = v491;
              }
              else {
                v173 = 0;
              }
              if (v173 == 1)
              {
                uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v171, "original") + 8), out);
                v547[0] = @"uuid";
                [NSString stringWithUTF8String:out];
                v503 = (id)objc_claimAutoreleasedReturnValue();
                v548[0] = v503;
                v547[1] = @"slide";
                objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  (void)-[OSASharedCacheEntry original](v171, "original")[32]);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v548[1] = v174;
                [MEMORY[0x189603F68] dictionaryWithObjects:v548 forKeys:v547 count:2];
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                [v172 data];
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                [v176 setObject:v175 forKeyedSubscript:@"taskSpecificSharedCache"];

                xpc_object_t v17 = v506;
                id v10 = v505;
              }
            }

            else
            {
              v172 = 0LL;
            }
          }

          else
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.3(v545, (uint64_t)v167, &v546);
            }
            v171 = v502;
          }

          self = v517;

          v502 = v171;
LABEL_437:
          xpc_object_t v13 = v111;
          id v24 = 0x189607000LL;
          goto LABEL_587;
        case 2374:
          v138 = v13;
          [v17 top];
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          [v178 data];
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          [v180 setObject:v179 forKeyedSubscript:@"csFlags"];

          [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 6)];
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          [v178 data];
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          [v182 setObject:v181 forKeyedSubscript:@"csTrustLevel"];

          goto LABEL_179;
        case 2376:
          v138 = v13;
          [v17 top];
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          [v178 data];
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          [v185 setObject:v184 forKeyedSubscript:@"exclaveScid"];

          v472 = *((unsigned int *)ss_trace_buffer + 6);
LABEL_179:

LABEL_180:
          xpc_object_t v13 = v138;
          id v24 = 0x189607000uLL;
          goto LABEL_587;
        default:
          if ((_DWORD)v27 != 2112)
          {
            if ((_DWORD)v27 == 1503811591) {
              goto LABEL_587;
            }
LABEL_62:
            v59 = v25 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
            LODWORD(v25) = v25 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
            if (v59) {
              xpc_object_t v25 = v25;
            }
            else {
              xpc_object_t v25 = 0LL;
            }
            NSLog(@"Unknown KCDATA %X, size %d, flags %X", v27, v25, v27);
            goto LABEL_587;
          }

          [v17 top];
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            v187 = 17;
          }
          if (v187 <= 2309)
          {
            if (v187 == 17 || v187 == 19)
            {
              v188 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_444;
            }

            goto LABEL_441;
          }

          if (v187 == 2310)
          {
            v205 = *((_DWORD *)ss_trace_buffer + 1);
            if (v205 != 112) {
              goto LABEL_442;
            }
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              v205 = 112;
              goto LABEL_442;
            }
          }

          else
          {
            if (v187 != 2312)
            {
LABEL_441:
              v205 = *((_DWORD *)ss_trace_buffer + 1);
LABEL_442:
              v59 = v205 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
              v188 = v205 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
              if (!v59) {
                v188 = 0;
              }
LABEL_444:
              if (v188 < 0x10) {
                goto LABEL_447;
              }
              goto LABEL_445;
            }

            v205 = *((_DWORD *)ss_trace_buffer + 1);
            if (v205 != 32) {
              goto LABEL_442;
            }
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              v205 = 32;
              goto LABEL_442;
            }
          }

LABEL_445:
          [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v304 = v13;
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          [v120 data];
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          [v311 setObject:v310 forKeyedSubscript:@"jitStartAddress"];

          [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          [v120 data];
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          v307 = v306;
          v308 = v305;
          v309 = @"jitEndAddress";
          goto LABEL_446;
      }
    }

    if ((int)v27 > 18)
    {
      if ((int)v27 > 49)
      {
        switch((_DWORD)v27)
        {
          case '2':
            v501 = (unsigned int *)(ss_trace_buffer + 16);
            break;
          case '3':
            self->_capture_absoluteTime = *((void *)ss_trace_buffer + 2);
            break;
          case '5':
            self->super._capture_time = (double)*((unint64_t *)ss_trace_buffer + 2) / 1000000.0 - v23;
            break;
          default:
            goto LABEL_62;
        }

        goto LABEL_587;
      }

      if ((_DWORD)v27 != 19)
      {
        if ((_DWORD)v27 != 20) {
          goto LABEL_62;
        }
        [v17 pop];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *((void *)ss_trace_buffer + 1);
        if (v45 != [v44 tag]) {
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.15();
        }
        if ([v44 type] != 2308)
        {
          if ([v44 type] == 2307 || objc_msgSend(v44, "type") == 2353)
          {
            [v44 data];
            v189 = (void *)objc_claimAutoreleasedReturnValue();

            if (v189)
            {
              v514 = v13;
              v190 = v493;
              if (v501) {
                v190 = v493 * *v501 / v501[1];
              }
              [*(id *)(v24 + 2408) numberWithDouble:(double)v190 / 1000000000.0];
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              [v44 data];
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              [v192 setObject:v191 forKeyedSubscript:@"userTimeTask"];

              v193 = v492;
              if (v501) {
                v193 = v492 * *v501 / v501[1];
              }
              [*(id *)(v24 + 2408) numberWithDouble:(double)v193 / 1000000000.0];
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              [v44 data];
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              [v195 setObject:v194 forKeyedSubscript:@"systemTimeTask"];

              if (objc_msgSend(v44, "unindexed_frames"))
              {
                objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v44, "unindexed_frames"));
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                [v44 data];
                v197 = (void *)objc_claimAutoreleasedReturnValue();
                [v197 setObject:v196 forKeyedSubscript:@"unindexed_frames"];

                v476 = objc_msgSend(v44, "unindexed_frames") + v476;
                objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v44, "pid"));
                v198 = (void *)objc_claimAutoreleasedReturnValue();
                [v488 addObject:v198];
              }

              objc_msgSend(v44, "truncated_threads");
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              v200 = [v199 count];

              if (v200
                && (objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v44, "pid")),
                    v201 = (void *)objc_claimAutoreleasedReturnValue(),
                    [v489 addObject:v201],
                    v201,
                    (excludeSection(v495, (uint64_t)@"stackResampling") & 1) == 0))
              {
                v318 = [v44 pid];
                objc_msgSend(v44, "truncated_threads");
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                v202 = -[OSAStackShotReport resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:usingSymbolicator:]( self,  "resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:usingSymbolicator:",  v318,  v319,  v10,  v516,  v474,  v473);

                if ((_DWORD)v202)
                {
                  [*(id *)(v24 + 2408) numberWithInt:v202];
                  v320 = (void *)objc_claimAutoreleasedReturnValue();
                  [v44 data];
                  v321 = (void *)objc_claimAutoreleasedReturnValue();
                  [v321 setObject:v320 forKeyedSubscript:@"unindexed_rs_frames"];

                  v475 = (v202 + v475);
                  v202 = objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v44, "pid"));
                  [v478 addObject:v202];

                  LODWORD(v202) = 1;
                }
              }

              else
              {
                LODWORD(v202) = 0;
              }

              if (v491 && ((objc_msgSend(v44, "unindexed_frames") == 0) & ~(_DWORD)v202) == 0)
              {
                [v516 valueForKey:@"details"];
                v322 = (void *)objc_claimAutoreleasedReturnValue();
                [v44 data];
                v323 = (void *)objc_claimAutoreleasedReturnValue();
                [v323 setObject:v322 forKeyedSubscript:@"process_images"];
              }

              if (objc_msgSend(v44, "invalid_images"))
              {
                objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v44, "invalid_images"));
                v324 = (void *)objc_claimAutoreleasedReturnValue();
                [v44 data];
                v325 = (void *)objc_claimAutoreleasedReturnValue();
                [v325 setObject:v324 forKeyedSubscript:@"invalid_images"];

                v470 = objc_msgSend(v44, "invalid_images") + v470;
              }

              if ((v477 & 1) == 0)
              {
                v539 = &unk_189E30788;
                v540 = @"processByPid";
                [MEMORY[0x189603F68] dictionaryWithObjects:&v540 forKeys:&v539 count:1];
                v326 = (void *)objc_claimAutoreleasedReturnValue();
                v496[2](v496, v326);
              }

              objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v44, "pid"));
              v327 = (void *)objc_claimAutoreleasedReturnValue();
              v537[0] = v327;
              [v44 data];
              v328 = (void *)objc_claimAutoreleasedReturnValue();
              v538[0] = v328;
              v537[1] = &unk_189E30770;
              v329 = *(void **)(v24 + 2408);
              v330 = v24;
              pid = v517->_pid;
              v332 = [v44 pid];
              if (pid == v332)
              {
                v333 = 1LL;
              }

              else
              {
                v334 = v517->_frontmostPids;
                objc_msgSend(*(id *)(v330 + 2408), "numberWithInt:", objc_msgSend(v44, "pid"));
                v436 = (void *)objc_claimAutoreleasedReturnValue();
                v333 = -[NSMutableArray containsObject:](v334, "containsObject:");
              }

              [v329 numberWithInt:v333];
              v335 = (void *)objc_claimAutoreleasedReturnValue();
              v538[1] = v335;
              [MEMORY[0x189603F68] dictionaryWithObjects:v538 forKeys:v537 count:2];
              v336 = (void *)objc_claimAutoreleasedReturnValue();
              v496[2](v496, v336);

              if (pid != v332) {
              LOBYTE(v477) = 1;
              }
              id v10 = v505;
              self = v517;
              xpc_object_t v13 = v514;
              id v24 = 0x189607000LL;
            }
          }

          else
          {
            v312 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              v313 = [v44 type];
              *(_DWORD *)out = 67109120;
              *(_DWORD *)&out[4] = v313;
              _os_log_impl( &dword_1861AC000,  v312,  OS_LOG_TYPE_DEFAULT,  "Unknown KCDATA CONTAINER %X",  (uint8_t *)out,  8u);
            }
          }

          goto LABEL_586;
        }

        if (![v506 count]) {
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.14();
        }
        v508 = v13;
        [v44 data];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 objectForKeyedSubscript:@"id"];
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        [v44 data];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 objectForKeyedSubscript:@"exclaveScid"];
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v49) {
          goto LABEL_583;
        }
        objc_msgSend( NSString,  "stringWithFormat:",  @"0x%llX",  objc_msgSend(v49, "unsignedLongLongValue"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 data];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 setObject:v50 forKeyedSubscript:@"exclaveScid"];

        -[OSAExclaveContainer setThreadId:withScId:](v494, "setThreadId:withScId:", v47, v49);
        v52 = -[OSAExclaveContainer getFramesForThread:usingCatalog:](v494, "getFramesForThread:usingCatalog:", v47, v10);
        if (![v52 count]) {
          goto LABEL_582;
        }
        [v44 data];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v53 objectForKeyedSubscript:@"kernelFrames"];
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189603FA8] array];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v465 = v47;
        if ([v54 count] < (unint64_t)v472)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            v403 = [v47 unsignedLongLongValue];
            *(_DWORD *)out = 67109376;
            *(_DWORD *)&out[4] = v472;
            *(_WORD *)&out[8] = 2048;
            *(void *)&out[10] = v403;
            _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Exclave frames offset of %d for thread %llu is invalid",  (uint8_t *)out,  0x12u);
          }

          v480 = v517->super._notes;
          objc_msgSend( NSString,  "stringWithFormat:",  @"Thread %llu with %lu kernel frames has exclave frames but invalid exclave frame offset of %d. Skipping adding exclave frames into kernel frames ",  objc_msgSend(v47, "unsignedLongLongValue"),  objc_msgSend(v54, "count"),  v472);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v480, "addObject:", v56);
LABEL_581:

          v47 = v465;
LABEL_582:

          id v10 = v505;
LABEL_583:
          [v506 top];
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          [v396 data];
          v397 = (void *)objc_claimAutoreleasedReturnValue();

          if (v397)
          {
            [v396 data];
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            [v398 objectForKeyedSubscript:@"threadById"];
            v486 = v49;
            v399 = v47;
            v400 = (void *)objc_claimAutoreleasedReturnValue();

            [v44 data];
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString stringWithFormat:@"%@", v399];
            v402 = (void *)objc_claimAutoreleasedReturnValue();
            [v400 setObject:v401 forKeyedSubscript:v402];

            id v10 = v505;
            v47 = v399;
            v49 = v486;
          }

          self = v517;
          xpc_object_t v13 = v508;
LABEL_586:

          xpc_object_t v17 = v506;
          goto LABEL_587;
        }

        if (v54)
        {
          if ([v54 count])
          {
            v314 = 0LL;
            do
            {
              [v54 objectAtIndexedSubscript:v314];
              v315 = (void *)objc_claimAutoreleasedReturnValue();
              [v55 addObject:v315];

              ++v314;
            }

            while ([v54 count] > v314);
          }

          id v24 = 0x189607000LL;
          if (!(_DWORD)v472)
          {
            v316 = v517->super._notes;
            objc_msgSend( NSString,  "stringWithFormat:",  @"Thread %llu has an incorrect exclave frame offset %d",  objc_msgSend(v465, "unsignedLongLongValue"),  0);
            v317 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v316, "addObject:", v317);
            goto LABEL_579;
          }
        }

        else
        {
          v485 = v52;

          v395 = v517->super._notes;
          objc_msgSend( NSString,  "stringWithFormat:",  @"Thread %llu has exclave frames but no kernel frames",  objc_msgSend(v47, "unsignedLongLongValue"));
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v395, "addObject:", v317);
          v55 = v485;
LABEL_579:
        }

        [v44 data];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 setObject:v55 forKeyedSubscript:@"kernelFrames"];
        goto LABEL_581;
      }

      v60 = -[KCContainer initWithKCData:]( objc_alloc(&OBJC_CLASS___KCContainer),  "initWithKCData:",  ss_trace_buffer,  v13);
      [v17 push:v60];

      if (*((_DWORD *)ss_trace_buffer + 4) != 2307) {
        goto LABEL_587;
      }
      v481 = (id)*((unsigned int *)ss_trace_buffer + 2);

      [v516 removeAllObjects];
      [v500 removeAllObjects];
      v61 = &v14[*((unsigned int *)ss_trace_buffer + 1)];
      v62 = v61 + 16;
      if ((unint64_t)(v61 + 16) > v13)
      {
        v502 = 0LL;
        id v10 = v505;
        xpc_object_t v17 = v506;
        goto LABEL_587;
      }

      v502 = 0LL;
      v212 = 1;
      v515 = v13;
      while (2)
      {
        if ((unint64_t)&v62[*((unsigned int *)v61 + 1)] > v13
          || (v213 = *(_DWORD *)v61, *(_DWORD *)v61 == -242132755))
        {
LABEL_297:
          id v10 = v505;
LABEL_452:
          xpc_object_t v17 = v506;
          goto LABEL_587;
        }

        if ((v213 & 0xFFFFFFF0) == 0x20) {
          v213 = 17;
        }
        if (v213 > 19)
        {
          switch(v213)
          {
            case 20:
              if (!--v212) {
                goto LABEL_297;
              }
              break;
            case 2332:
              [v505 setKernelCache:v61 + 24 address:*((void *)v61 + 2) size:0];
              break;
            case 2373:
              v214 = v24;
              v215 = v13;
              [*(id *)(v214 + 2408) numberWithUnsignedInt:*((unsigned int *)v61 + 4)];
              v216 = (void *)objc_claimAutoreleasedReturnValue();
              [v497 objectForKeyedSubscript:v216];
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              v218 = v217;
              if (v217
                && (objc_msgSend(*(id *)(v214 + 2408), "numberWithUnsignedInt:", objc_msgSend(v217, "sharedCacheID")),
                    v219 = (void *)objc_claimAutoreleasedReturnValue(),
                    v220 = [v219 isEqual:v216],
                    v219,
                    v220))
              {
                v221 = v218;

                v222 = (void *)[v506 count];
                if (v222)
                {
                  [v506 top];
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  v223 = v222 ? v491 : 0;
                  if (v223 == 1)
                  {
                    v504 = v222;
                    uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v221, "original") + 8), out);
                    v541[0] = @"uuid";
                    [NSString stringWithUTF8String:out];
                    v463 = (void *)objc_claimAutoreleasedReturnValue();
                    v542[0] = v463;
                    v541[1] = @"slide";
                    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  (void)-[OSASharedCacheEntry original](v221, "original")[32]);
                    v460 = (void *)objc_claimAutoreleasedReturnValue();
                    v542[1] = v460;
                    [MEMORY[0x189603F68] dictionaryWithObjects:v542 forKeys:v541 count:2];
                    v467 = (void *)objc_claimAutoreleasedReturnValue();
                    [v504 data];
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    [v224 setObject:v467 forKeyedSubscript:@"taskSpecificSharedCache"];

                    v222 = v504;
                  }
                }

                self = v517;
              }

              else
              {
                v235 = (os_log_s *)MEMORY[0x1895F8DA0];
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)out = 138412290;
                  *(void *)&out[4] = v216;
                  _os_log_impl( &dword_1861AC000,  v235,  OS_LOG_TYPE_DEFAULT,  "Expected a task specific shared cache with id %@ but none was found",  (uint8_t *)out,  0xCu);
                }

                v221 = v502;
                self = v517;
              }

              v502 = v221;
              xpc_object_t v13 = v215;
              id v24 = 0x189607000LL;
              break;
          }

LABEL_296:
          v61 = &v62[*((unsigned int *)v61 + 1)];
          v62 = v61 + 16;
          continue;
        }

        break;
      }

      if (v213 != 17)
      {
        if (v213 == 19)
        {
          ++v212;
          if (*((_DWORD *)v61 + 4) == 2356)
          {
            [v506 top];
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            [v225 data];
            v226 = v13;
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "parsePortLabelContainer:", v61, v226);

            xpc_object_t v13 = v226;
          }
        }

        goto LABEL_296;
      }

      v228 = *((void *)v61 + 1);
      v229 = HIDWORD(v228);
      if (HIDWORD(v228) != 48)
      {
        if (HIDWORD(v228) == 2350 || HIDWORD(v228) == 49)
        {
          [v506 top];
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v228)
          {
            v231 = v228;
            v232 = (const unsigned __int8 *)(v61 + 24);
            do
            {
              if (uuid_is_null(v232))
              {
                if (!*((void *)v232 - 1))
                {
                  objc_msgSend(v230, "setInvalid_images:", objc_msgSend(v230, "invalid_images") + 1);
                  goto LABEL_274;
                }

                v233 = v500;
              }

              else
              {
                v233 = v516;
              }

              objc_msgSend(v233, "addImage:address:size:", v232);
LABEL_274:
              v232 += 24;
              --v231;
            }

            while (v231);
          }

          [v516 sortByAddressAndSetInferredSizes];
          self = v517;
          if (!v481)
          {
            if ((_DWORD)v229 == 2350)
            {
              v234 = v516;
              [v505 setKernelTextExecImages:v516];
              goto LABEL_293;
            }

LABEL_292:
            v234 = v516;
            [v505 setKernelImages:v516];
LABEL_293:
            [v234 removeAllObjects];
          }

LABEL_294:
        }

        xpc_object_t v13 = v515;
        goto LABEL_296;
      }

      [v506 top];
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(_DWORD)v228)
      {
LABEL_291:
        [v516 sortByAddressAndSetInferredSizes];
        if (!v481) {
          goto LABEL_292;
        }
        goto LABEL_294;
      }

      v236 = v228;
      v237 = (const unsigned __int8 *)(v61 + 20);
      while (2)
      {
        if (uuid_is_null(v237))
        {
          if (*((_DWORD *)v237 - 1))
          {
            v238 = v500;
            goto LABEL_288;
          }

          objc_msgSend(v230, "setInvalid_images:", objc_msgSend(v230, "invalid_images") + 1);
        }

        else
        {
          v238 = v516;
LABEL_288:
          objc_msgSend(v238, "addImage:address:size:", v237);
        }

        v237 += 20;
        if (!--v236) {
          goto LABEL_291;
        }
        continue;
      }
    }

    if ((int)v27 > 2)
    {
      if ((_DWORD)v27 != 3)
      {
        if ((_DWORD)v27 != 17) {
          goto LABEL_62;
        }
        v509 = v13;
        v57 = *((void *)ss_trace_buffer + 1);
        if (v26 == 17)
        {
          if (SHIDWORD(v57) > 2310)
          {
            switch(HIDWORD(v57))
            {
              case 0x907:
                v58 = 4LL;
                break;
              case 0x908:
              case 0x909:
                goto LABEL_484;
              case 0x90A:
              case 0x90C:
                goto LABEL_433;
              case 0x90B:
              case 0x90D:
                v58 = 16LL;
                break;
              default:
                if (HIDWORD(v57) != 2369) {
                  goto LABEL_484;
                }
                v58 = 48LL;
                break;
            }

LABEL_485:
            v337 = (void *)[v17 count];
            if (v337)
            {
              [v17 top];
              v337 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v484 = v337;
            if (SHIDWORD(v57) <= 2342)
            {
              switch(HIDWORD(v57))
              {
                case 0x913:
                  [MEMORY[0x189603FA8] array];
                  v339 = (void *)objc_claimAutoreleasedReturnValue();
                  [v338 data];
                  v340 = (void *)objc_claimAutoreleasedReturnValue();
                  [v340 setObject:v339 forKeyedSubscript:@"kernelFrames"];

                  if ((_DWORD)v57)
                  {
                    v341 = (unsigned int *)(ss_trace_buffer + 16);
                    v342 = v57;
                    do
                    {
                      v343 = *v341++;
                      [v10 searchFrame:v343 in:v516 result:0];
                      v344 = (void *)objc_claimAutoreleasedReturnValue();
                      [v339 addObject:v344];

                      --v342;
                    }

                    while (v342);
                  }

                  goto LABEL_540;
                case 0x914:
                  [MEMORY[0x189603FA8] array];
                  v339 = (void *)objc_claimAutoreleasedReturnValue();
                  [v366 data];
                  v367 = (void *)objc_claimAutoreleasedReturnValue();
                  [v367 setObject:v339 forKeyedSubscript:@"kernelFrames"];

                  if ((_DWORD)v57)
                  {
                    v368 = (uint64_t *)(ss_trace_buffer + 16);
                    v369 = v57;
                    do
                    {
                      v370 = *v368++;
                      [v10 searchFrame:v370 in:v516 result:0];
                      v371 = (void *)objc_claimAutoreleasedReturnValue();
                      [v339 addObject:v371];

                      --v369;
                    }

                    while (v369);
                  }

LABEL_540:
                  xpc_object_t v17 = v506;
                  goto LABEL_541;
                case 0x915:
                  [v17 parent];
                  v373 = (void *)objc_claimAutoreleasedReturnValue();
                  [MEMORY[0x189603FA8] array];
                  v374 = (void *)objc_claimAutoreleasedReturnValue();
                  [v372 data];
                  v375 = (void *)objc_claimAutoreleasedReturnValue();
                  [v375 setObject:v374 forKeyedSubscript:@"userFrames"];

                  if (!(_DWORD)v57) {
                    goto LABEL_560;
                  }
                  v376 = 0LL;
                  v377 = ss_trace_buffer + 16;
                  v378 = v57;
                  do
                  {
                    v379 = v376;
                    v380 = *v377;
                    v518 = v376;
                    [v505 searchFrame:v380 in:v516 result:&v518];
                    v381 = (void *)objc_claimAutoreleasedReturnValue();
                    v376 = v518;

                    [v374 addObject:v381];
                    if (!v376 && *v377) {
                      objc_msgSend( v373,  "setUnindexed_frames:",  objc_msgSend(v373, "unindexed_frames") + 1);
                    }
                    ++v377;
                    --v378;
                  }

                  while (v378);
                  goto LABEL_559;
                case 0x916:
                  [v17 parent];
                  v373 = (void *)objc_claimAutoreleasedReturnValue();
                  [MEMORY[0x189603FA8] array];
                  v374 = (void *)objc_claimAutoreleasedReturnValue();
                  [v382 data];
                  v383 = (void *)objc_claimAutoreleasedReturnValue();
                  [v383 setObject:v374 forKeyedSubscript:@"userFrames"];

                  if (!(_DWORD)v57) {
                    goto LABEL_560;
                  }
                  v376 = 0LL;
                  v384 = (uint64_t *)(ss_trace_buffer + 16);
                  v385 = v57;
                  do
                  {
                    v386 = v376;
                    v387 = *v384;
                    v519 = v376;
                    [v505 searchFrame:v387 in:v516 result:&v519];
                    v388 = (void *)objc_claimAutoreleasedReturnValue();
                    v376 = v519;

                    [v374 addObject:v388];
                    if (!v376 && *v384) {
                      objc_msgSend( v373,  "setUnindexed_frames:",  objc_msgSend(v373, "unindexed_frames") + 1);
                    }
                    ++v384;
                    --v385;
                  }

                  while (v385);
LABEL_559:

                  self = v517;
LABEL_560:

                  id v10 = v505;
                  id v24 = 0x189607000LL;
                  goto LABEL_567;
                case 0x917:
                case 0x918:
                case 0x919:
                case 0x91A:
                case 0x91B:
                case 0x91C:
                  goto LABEL_534;
                case 0x91D:
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.11();
                  }

                  [v484 data];
                  v389 = (void *)objc_claimAutoreleasedReturnValue();

                  v337 = v484;
                  if (!v389) {
                    goto LABEL_568;
                  }
                  [v484 data];
                  v346 = (void *)objc_claimAutoreleasedReturnValue();
                  [v346 addWaitInfoDesc:ss_trace_buffer + 16 count:v57 elSize:v58];
                  goto LABEL_566;
                default:
                  if (HIDWORD(v57) != 2311) {
                    goto LABEL_534;
                  }
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.10();
                  }

                  [v484 data];
                  v347 = (void *)objc_claimAutoreleasedReturnValue();

                  v337 = v484;
                  if (!v347) {
                    goto LABEL_568;
                  }
                  [MEMORY[0x189603FA8] array];
                  v348 = (void *)objc_claimAutoreleasedReturnValue();
                  [v484 data];
                  v349 = (void *)objc_claimAutoreleasedReturnValue();
                  [v349 setObject:v348 forKeyedSubscript:@"donatingPids"];

                  if ((_DWORD)v57)
                  {
                    v350 = (unsigned int *)(ss_trace_buffer + 16);
                    v351 = v57;
                    do
                    {
                      v352 = *v350++;
                      [*(id *)(v24 + 2408) numberWithInt:v352];
                      v353 = (void *)objc_claimAutoreleasedReturnValue();
                      [v348 addObject:v353];

                      --v351;
                    }

                    while (v351);
                  }

LABEL_541:
                  self = v517;
                  break;
              }

              goto LABEL_567;
            }

            if (SHIDWORD(v57) > 2349)
            {
              if (HIDWORD(v57) == 2350)
              {
LABEL_530:
                if (!v337
                  || (v364 = [v337 type] == 2307, v337 = v484, !v364)
                  && (v364 = [v484 type] == 2353, v337 = v484, !v364))
                {
                  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.5();
                }

                goto LABEL_568;
              }

              if (HIDWORD(v57) != 2361) {
                goto LABEL_534;
              }
              [MEMORY[0x189603FA8] array];
              v354 = (void *)objc_claimAutoreleasedReturnValue();
              if ((_DWORD)v57)
              {
                v355 = v57;
                v356 = ss_trace_buffer + 36;
                do
                {
                  if (*(void *)(v356 - 12) && *((_DWORD *)v356 - 1) && *v356 && *(void *)(v356 - 20))
                  {
                    [MEMORY[0x189603FC8] dictionary];
                    v357 = (void *)objc_claimAutoreleasedReturnValue();
                    [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*(void *)(v356 - 12)];
                    v358 = (void *)objc_claimAutoreleasedReturnValue();
                    [v357 setObject:v358 forKeyedSubscript:@"suspensionThreadID"];

                    [*(id *)(v24 + 2408) numberWithInt:*((unsigned int *)v356 - 1)];
                    v359 = (void *)objc_claimAutoreleasedReturnValue();
                    [v357 setObject:v359 forKeyedSubscript:@"suspensionProcID"];

                    [NSString stringWithUTF8String:v356];
                    v360 = (void *)objc_claimAutoreleasedReturnValue();
                    [v357 setObject:v360 forKeyedSubscript:@"suspensionProcName"];

                    v361 = *(void *)(v356 - 20);
                    if (v501) {
                      v361 = v361 * *v501 / v501[1];
                    }
                    [*(id *)(v24 + 2408) numberWithDouble:(double)v361 / 1000000000.0];
                    v362 = (void *)objc_claimAutoreleasedReturnValue();
                    [v357 setObject:v362 forKeyedSubscript:@"suspensionTime"];

                    [v354 addObject:v357];
                    self = v517;
                  }

                  v356 += 85;
                  --v355;
                }

                while (v355);
              }

              if ([v354 count])
              {
                [v484 data];
                v363 = (void *)objc_claimAutoreleasedReturnValue();
                [v363 setObject:v354 forKeyedSubscript:@"suspensionSources"];
              }

              id v10 = v505;
            }

            else
            {
              if (HIDWORD(v57) != 2343)
              {
                if (HIDWORD(v57) == 2345)
                {
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.12();
                  }

                  [v484 data];
                  v345 = (void *)objc_claimAutoreleasedReturnValue();

                  v337 = v484;
                  if (v345)
                  {
                    [v484 data];
                    v346 = (void *)objc_claimAutoreleasedReturnValue();
                    [v346 addTurnstileInfoDesc:ss_trace_buffer + 16 count:v57 elSize:v58];
LABEL_566:

                    goto LABEL_567;
                  }

LABEL_568:
                  xpc_object_t v13 = v509;
                  goto LABEL_587;
                }

LABEL_534:
                v365 = kcdata_iter_size((uint64_t)ss_trace_buffer);
                NSLog( @"Unknown KCDATA ARRAY type %X, count %d, size %d, flags %llX",  HIDWORD(v57),  v57,  v365,  *((void *)ss_trace_buffer + 1));
                goto LABEL_567;
              }

              if (!v337) {
                goto LABEL_568;
              }
              v364 = [v337 type] == 2370;
              v337 = v484;
              if (!v364) {
                goto LABEL_568;
              }
              objc_msgSend(*(id *)(v24 + 2408), "numberWithInt:", objc_msgSend(v484, "pid"));
              v390 = (void *)objc_claimAutoreleasedReturnValue();
              [v497 objectForKeyedSubscript:v390];
              v391 = (void *)objc_claimAutoreleasedReturnValue();
              v392 = v391;
              if (v391
                && (objc_msgSend(*(id *)(v24 + 2408), "numberWithUnsignedInt:", objc_msgSend(v391, "sharedCacheID")),
                    v393 = (void *)objc_claimAutoreleasedReturnValue(),
                    v394 = [v393 isEqual:v390],
                    v393,
                    v394))
              {
                [v392 setSharedCacheLayout:ss_trace_buffer + 16 andCount:v57];
              }

              else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.3(v543, (uint64_t)v390, &v544);
              }

              self = v517;
            }

LABEL_567:
            v337 = v484;
            goto LABEL_568;
          }

          switch(HIDWORD(v57))
          {
            case 0x30:
              v58 = 20LL;
              goto LABEL_485;
            case 0x31:
              v58 = 24LL;
              goto LABEL_485;
            case 0x81A:
LABEL_433:
              v58 = 8LL;
              goto LABEL_485;
          }
        }

        else if ((_DWORD)v57)
        {
          v58 = (v25 - (*(_DWORD *)ss_trace_buffer & 0xF)) / v57;
          goto LABEL_485;
        }

LABEL_484:
        v58 = 0LL;
        goto LABEL_485;
      }

      v42 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48LL)
      {
        v43 = [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 6)];
        goto LABEL_75;
      }
    }

    else if ((_DWORD)v27 == 1)
    {
      if (ss_trace_buffer != (char *)-48LL)
      {
        v42 = ss_trace_buffer + 16;
        v43 = [NSString stringWithUTF8String:ss_trace_buffer + 48];
        goto LABEL_75;
      }
    }

    else
    {
      if ((_DWORD)v27 != 2) {
        goto LABEL_62;
      }
      v42 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48LL)
      {
        v43 = [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 12)];
LABEL_75:
        v63 = v13;
        v64 = (void *)v43;
        -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", v42, v43, v17);

        xpc_object_t v13 = v63;
      }
    }

LABEL_587:
    ss_trace_buffer = &v14[*((unsigned int *)ss_trace_buffer + 1)];
    uint64_t v14 = ss_trace_buffer + 16;
  }

  if ([v17 count]) {
    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.2();
  }
  -[OSAExclaveContainer appendNotesTo:](v494, "appendNotesTo:", self->super._notes);
  v8 = v496;
  if ((v477 & 1) != 0)
  {
    v526 = &unk_189E307A0;
    v527 = &stru_189E21910;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    v496[2](v496, v404);
  }

  if (v499) {
    v405 = v491;
  }
  else {
    v405 = 0;
  }
  if (v405 == 1)
  {
    uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v499, "original") + 8), out);
    v524 = @"systemDefaultSharedCache";
    v522[0] = @"uuid";
    [NSString stringWithUTF8String:out];
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    v523[0] = v406;
    v522[1] = @"slide";
    objc_msgSend( *(id *)(v24 + 2408),  "numberWithUnsignedLongLong:",  (void)-[OSASharedCacheEntry original](v499, "original")[32]);
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    v523[1] = v407;
    [MEMORY[0x189603F68] dictionaryWithObjects:v523 forKeys:v522 count:2];
    v408 = (void *)objc_claimAutoreleasedReturnValue();
    v525 = v408;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v525 forKeys:&v524 count:1];
    v409 = (void *)objc_claimAutoreleasedReturnValue();
    v496[2](v496, v409);

    self = v517;
  }

  if ((_DWORD)v487)
  {
    v410 = self->super._notes;
    v411 = (void *)NSString;
    v412 = [v489 count];
    [v489 sortedPids];
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    [v411 stringWithFormat:@"resampled %d of %d threads with truncated backtraces from %d pids: %@", v487, v490, v412, v413];
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v410, "addObject:", v414);

    self = v517;
    if (v471)
    {
      v520 = @"postSampleVMStats";
      v415 = -[OSAStackShotReport getVMStatistics](v517, "getVMStatistics");
      v521 = v415;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v521 forKeys:&v520 count:1];
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      v496[2](v496, v416);
    }
  }

  v417 = v498;
  id v9 = v495;
  if ([v498 count])
  {
    v418 = self->super._notes;
    v419 = (void *)NSString;
    v420 = [v498 count];
    [v498 sortedPids];
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    v435 = v420;
    v417 = v498;
    [v419 stringWithFormat:@"resampled %d of %d images missing from %d pids: %@", v469, v470, v435, v421];
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v418, "addObject:", v422);

    self = v517;
  }

  if ((_DWORD)v476)
  {
    v423 = self->super._notes;
    v424 = (void *)NSString;
    v425 = [v488 count];
    [v488 sortedPids];
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    v433 = v425;
    v417 = v498;
    [v424 stringWithFormat:@"%d unindexed user-stack frames from %d pids: %@", v476, v433, v426];
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v423, "addObject:", v427);

    self = v517;
  }

  if ((_DWORD)v475)
  {
    v428 = self->super._notes;
    v429 = (void *)NSString;
    v430 = [v478 count];
    [v478 sortedPids];
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    v434 = v430;
    v417 = v498;
    [v429 stringWithFormat:@"%d unindexed re-sampled frames from %d pids: %@", v475, v434, v431];
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v428, "addObject:", v432);
  }

  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }

LABEL_8:
}

uint64_t excludeSection(void *a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uint64_t v5 = 0LL;
  if (a1 && v3) {
    uint64_t v5 = [v3 BOOLValue] ^ 1;
  }

  return v5;
}

uint64_t kcdata_iter_size(uint64_t a1)
{
  int v1 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 0xFFFFFFF0) == 0x20) {
    int v1 = 17;
  }
  if (v1 <= 2309)
  {
    if (v1 == 17 || v1 == 19) {
      return *(unsigned int *)(a1 + 4);
    }
LABEL_18:
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    goto LABEL_19;
  }

  if (v1 != 2310)
  {
    if (v1 == 2312)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 4);
      if (v4 == 32)
      {
        if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0) {
          return 24LL;
        }
        unsigned int v4 = 32;
      }

      goto LABEL_19;
    }

    goto LABEL_18;
  }

  unsigned int v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 112)
  {
    if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0) {
      return 104LL;
    }
    unsigned int v4 = 112;
  }

__CFString *DecodeQOS(unsigned int a1)
{
  if (a1 < 7) {
    return off_189E204C0[a1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"QOS_CLASS_UNKNOWN (%u)", (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id DecodeThreadFlags(unint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  memcpy(__dst, off_189E202B0, sizeof(__dst));
  __int128 v10 = xmmword_189E204B0;
  [MEMORY[0x189603FA8] array];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 32; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      if (*(void *)&__dst[256 * a2 + 8 * i])
      {
        objc_msgSend(v4, "addObject:");
      }

      else
      {
        [NSString stringWithFormat:@"%@_0x%04X", *(void *)&__dst[8 * a2 - 16], (1 << i)];
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v6];
      }
    }
  }

  for (uint64_t j = 8LL; j != -8; j -= 8LL)

  for (uint64_t k = 504LL; k != -8; k -= 8LL)
  return v4;
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_32:
        int64_t v15 = (void *)MEMORY[0x189604A60];
        goto LABEL_33;
      }
    }

    else
    {
      xpc_object_t v16 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"-1");
      uint64_t v14 = v16;
      if (v12) {
        goto LABEL_9;
      }
      if (v16)
      {
        xpc_object_t v17 = 0LL;
        __int128 v34 = 0LL;
        v44[0] = @"taskingID";
        LOBYTE(v14) = 1;
LABEL_24:
        BOOL v18 = @"-1";
LABEL_25:
        v45[0] = v18;
        v44[1] = @"proxyingDeviceTimeAtReceipt";
        id v26 = (void *)MEMORY[0x189607968];
        [MEMORY[0x189603F50] date];
        int v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 timeIntervalSinceReferenceDate];
        objc_msgSend(v26, "numberWithDouble:");
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v28;
        [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:2];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_object_t v25 = (void *)[v29 mutableCopy];

        if ((v14 & 1) == 0) {
          [v25 setObject:v17 forKeyedSubscript:@"payload"];
        }
        [v11 logPath];
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"tasking.%@.proxy", v9];
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 stringByAppendingPathComponent:v31];
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v37 = v32;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "saving proxy tasking as %@",  buf,  0xCu);
        }

        [v25 writeToFile:v32 atomically:1];
        v42[0] = @"action";
        v42[1] = @"taskId";
        v43[0] = @"staged";
        v43[1] = v10;
        v42[2] = @"blob";
        v43[2] = v32;
        [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:3];
        int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v20 = v34;
        goto LABEL_30;
      }
    }

    uint64_t v20 = 0LL;
    goto LABEL_32;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int128 v37 = v9;
    v38 = 2112;
    v39 = v10;
    __int128 v40 = 2048;
    uint64_t v41 = [v12 length];
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "proxy %@ taskId %@ with rawblob (%lu bytes) is inconsistent",  buf,  0x20u);
  }

  int64_t v15 = (void *)MEMORY[0x189604A60];
LABEL_34:

  return v15;
}

LABEL_30:
          goto LABEL_120;
        }
      }

      __int128 v30 = +[OSATasking getDefaultTasking](&OBJC_CLASS___OSATasking, "getDefaultTasking");
      if (v30) {
        xpc_object_t v17 = (void *)v30;
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:].cold.3((uint64_t)v17, v31, v32);
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:].cold.2((uint64_t)v19, v33, v34);
      }
      [v17 arrayByAddingObjectsFromArray:v19];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSATasking normalizeInstructions:](&OBJC_CLASS___OSATasking, "normalizeInstructions:", v35);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:].cold.1((uint64_t)v36, v37, v38);
      }
      v163[0] = v123;
      v162[0] = @"TaskingID";
      v162[1] = @"TaskingOS";
      v39 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      [v39 buildVersion];
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
      v162[2] = @"TaskingPayload";
      v163[1] = v40;
      v163[2] = v36;
      [MEMORY[0x189603F68] dictionaryWithObjects:v163 forKeys:v162 count:3];
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      v132[0] = MEMORY[0x1895F87A8];
      v132[1] = 3221225472LL;
      v132[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke;
      v132[3] = &unk_189E20530;
      v42 = v41;
      v132[4] = v42;
      v132[6] = &v134;
      v43 = v123;
      v132[5] = v43;
      __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(v132);

      goto LABEL_30;
    }

    if ([v125 isEqualToString:@"ca1"])
    {
      *(void *)&v164 = 0LL;
      *((void *)&v164 + 1) = &v164;
      *(void *)&v165 = 0x2020000000LL;
      BYTE8(v165) = 0;
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      *(void *)&v177 = __Block_byref_object_copy_;
      *((void *)&v177 + 1) = __Block_byref_object_dispose_;
      v178 = 0LL;
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 pathCATasking];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 stringByAppendingPathComponent:@"taskedConfig.json"];
      id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v179 = 138543362;
        *(void *)&v179[4] = v22;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "The location of the CA taskedConfig is %{public}@",  v179,  0xCu);
      }

      if (v22)
      {
        if (v121)
        {
          [MEMORY[0x1896078A8] defaultManager];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          id v24 = [v23 fileExistsAtPath:v22];

          if (v24)
          {
            [MEMORY[0x1896078A8] defaultManager];
            xpc_object_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            id v26 = (id *)(*(void *)&buf[8] + 40LL);
            obuint64_t j = *(id *)(*(void *)&buf[8] + 40LL);
            int v27 = [v25 removeItemAtPath:v22 error:&obj];
            objc_storeStrong(v26, obj);
            *(_BYTE *)(*((void *)&v164 + 1) + 24LL) = v27;

            id v28 = v22;
            id v22 = @"untasked";
          }

          else
          {
            v158[0] = @"action";
            v158[1] = @"taskId";
            v159[0] = @"n/a";
            v159[1] = v123;
            v65 = [MEMORY[0x189603F68] dictionaryWithObjects:v159 forKeys:v158 count:2];
            id v28 = (__CFString *)v135[5];
            v135[5] = v65;
          }
        }

        else
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v179 = 138412290;
            *(void *)&v179[4] = v22;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "saving ca1 tasking as %@",  v179,  0xCu);
          }

          v130[0] = MEMORY[0x1895F87A8];
          v130[1] = 3221225472LL;
          v130[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71;
          v130[3] = &unk_189E20558;
          v130[6] = &v164;
          id v28 = (__CFString *)v124;
          v130[4] = v28;
          id v22 = v22;
          v130[5] = v22;
          v130[7] = buf;
          __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71(v130);
        }
      }

      if (*(_BYTE *)(*((void *)&v164 + 1) + 24LL))
      {
        v156[0] = @"action";
        v156[1] = @"taskId";
        v157[0] = @"saved";
        v157[1] = v123;
        v156[2] = @"blob";
        v157[2] = v22;
        v66 = [MEMORY[0x189603F68] dictionaryWithObjects:v157 forKeys:v156 count:3];
        v67 = (void *)v135[5];
        v135[5] = v66;

        v154[0] = @"TaskingID";
        v154[1] = @"savedAs";
        v155[0] = v123;
        v155[1] = v22;
        [MEMORY[0x189603F68] dictionaryWithObjects:v155 forKeys:v154 count:2];
        v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v69 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
        [v69 setPrefsKey:@"CATaskingID" value:v68 forDomain:@"com.apple.OTACrashCopier" withSync:1];

        AnalyticsNotifyTaskingAvailable();
      }

      else
      {
        if (v135[5]) {
          goto LABEL_64;
        }
        v152 = @"error";
        v70 = *(void *)(*(void *)&buf[8] + 40LL);
        if (v70)
        {
          [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v68 = @"unknown failure to apply ca1 tasking";
        }

        v153 = v68;
        v93 = [MEMORY[0x189603F68] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        v94 = (void *)v135[5];
        v135[5] = v93;

        if (!v70) {
          goto LABEL_64;
        }
      }

LABEL_64:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v164, 8);
      goto LABEL_120;
    }

    if (![v125 isEqualToString:@"awd"]) {
      __assert_rtn( "+[OSATasking applyTasking:taskId:fromBlob:]",  "OSATasking.m",  409,  "0 && Unsupported routing used in tasking");
    }
    if ((v121 & 1) != 0)
    {
      v110 = 0LL;
      v111 = 0LL;
    }

    else
    {
      v129 = 0LL;
      v44 = selectConfigFromBlob((uint64_t)v124, &v129);
      v45 = v129;
      v110 = (void *)v44;
      if (!v44)
      {
        if (v45)
        {
          v144 = @"error";
          v112 = v45;
          [v45 localizedDescription];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = v62;
          v63 = [MEMORY[0x189603F68] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
          v64 = (void *)v135[5];
          v135[5] = v63;

          goto LABEL_120;
        }

        v111 = (void *)v135[5];
        v135[5] = (uint64_t)&unk_189E31930;
LABEL_119:

        goto LABEL_120;
      }

      v111 = v45;
    }
    v46 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    [v46 pathAWDTasking];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 stringByAppendingPathComponent:v125];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 stringByAppendingPathExtension:@"plist"];
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v116) {
      goto LABEL_76;
    }
    v119 = v116;
    objc_msgSend(MEMORY[0x189603F18], "arrayWithContentsOfFile:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isConfigValid(v49) & 1) != 0)
    {
      [MEMORY[0x189611AE8] sharedClient];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = 0u;
      v167 = 0u;
      v164 = 0u;
      v165 = 0u;
      v127 = v49;
      v51 = [v127 countByEnumeratingWithState:&v164 objects:buf count:16];
      if (v51)
      {
        v52 = *(void *)v165;
        v53 = 1;
        do
        {
          for (uint64_t i = 0LL; i != v51; ++i)
          {
            if (*(void *)v165 != v52) {
              objc_enumerationMutation(v127);
            }
            v55 = *(void **)(*((void *)&v164 + 1) + 8 * i);
            [v55 objectForKey:@"Key"];
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            [v55 objectForKey:@"User"];
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            [v55 objectForKey:@"Domain"];
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (([v50 deletePreference:v56 forUser:v57 inDomain:v58] & 1) == 0)
            {
              v53 = 0;
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v179 = 138412546;
                *(void *)&v179[4] = v58;
                *(_WORD *)&v179[12] = 2112;
                *(void *)&v179[14] = v56;
                _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Could not delete preference for domain,key: %@, %@",  v179,  0x16u);
                v53 = 0;
              }
            }
          }

          v51 = [v127 countByEnumeratingWithState:&v164 objects:buf count:16];
        }

        while (v51);

        if ((v53 & 1) == 0)
        {

LABEL_76:
          v74 = v135;
          v75 = (void *)v135[5];
          v76 = &unk_189E31908;
LABEL_77:
          v74[5] = (uint64_t)v76;
LABEL_118:

          goto LABEL_119;
        }
      }

      else
      {

        v53 = 1;
      }

      [MEMORY[0x1896078A8] defaultManager];
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v71 fileExistsAtPath:v119])
      {
        *(void *)&v140 = 0LL;
        v72 = [v71 removeItemAtPath:v119 error:&v140];
        v73 = (id)v140;
        if ((v72 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v179 = 138412546;
            *(void *)&v179[4] = v119;
            *(_WORD *)&v179[12] = 2112;
            *(void *)&v179[14] = v73;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Couldn't delete file for awd task at %@: %@",  v179,  0x16u);
          }

          v53 = 0;
        }
      }

      else
      {
        v73 = 0LL;
      }

      if ((v53 & 1) == 0) {
        goto LABEL_76;
      }
    }

    else
    {
    }

    if (v121)
    {
      v150[0] = @"action";
      v150[1] = @"taskId";
      v151[0] = @"n/a";
      v151[1] = v123;
      v77 = [MEMORY[0x189603F68] dictionaryWithObjects:v151 forKeys:v150 count:2];
      v75 = (void *)v135[5];
      v135[5] = v77;
      goto LABEL_118;
    }

    v78 = v110;
    v79 = v119;
    v108 = v79;
    if (!v78)
    {

LABEL_117:
      v148[0] = @"action";
      v148[1] = @"taskId";
      v149[0] = @"installed";
      v149[1] = v123;
      v148[2] = @"blob";
      v149[2] = v108;
      v99 = [MEMORY[0x189603F68] dictionaryWithObjects:v149 forKeys:v148 count:3];
      v100 = (void *)v135[5];
      v135[5] = v99;

      v146[0] = @"TaskingID";
      v146[1] = @"TaskingOS";
      v147[0] = v123;
      v101 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      [v101 buildVersion];
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v147[1] = v102;
      [MEMORY[0x189603F68] dictionaryWithObjects:v147 forKeys:v146 count:2];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      [v103 setPrefsKey:@"AWDTaskingID" value:v75 forDomain:@"com.apple.OTACrashCopier" withSync:1];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"logging tasks have changed", 0LL, 0LL, 0);
      goto LABEL_118;
    }

    [MEMORY[0x189603FA8] array];
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = 0u;
    v181 = 0u;
    memset(v179, 0, sizeof(v179));
    v109 = v78;
    v80 = [v109 countByEnumeratingWithState:v179 objects:buf count:16];
    if (v80)
    {
      v113 = v80;
      v114 = **(void **)&v179[16];
      v82 = 1;
      *(void *)&v81 = 138413058LL;
      v107 = v81;
LABEL_83:
      v117 = 0LL;
      while (1)
      {
        if (**(void **)&v179[16] != v114) {
          objc_enumerationMutation(v109);
        }
        v83 = *(void **)(*(void *)&v179[8] + 8 * v117);
        objc_msgSend(v83, "objectForKey:", @"User", v107);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        [v83 objectForKey:@"Key"];
        v128 = (id)objc_claimAutoreleasedReturnValue();
        [v83 objectForKey:@"Domain"];
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        [v83 objectForKey:@"Value"];
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v168 = v107;
          v169 = v126;
          v170 = 2112;
          v171 = v122;
          v172 = 2112;
          v173 = v128;
          v174 = 2112;
          v175 = v120;
          _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "writing %@@%@:%@=%@",  v168,  0x2Au);
        }

        [MEMORY[0x189611AE8] sharedClient];
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = [v84 setPreference:v128 forUser:v126 inDomain:v122 toValue:v120];
        if (v118)
        {
          [v115 addObject:v83];
        }

        else
        {
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v85 = v115;
          v86 = [v85 countByEnumeratingWithState:&v140 objects:&v164 count:16];
          if (v86)
          {
            v87 = *(void *)v141;
            do
            {
              for (uint64_t j = 0LL; j != v86; ++j)
              {
                if (*(void *)v141 != v87) {
                  objc_enumerationMutation(v85);
                }
                v89 = *(void **)(*((void *)&v140 + 1) + 8 * j);
                [v89 objectForKey:@"Key"];
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                [v89 objectForKey:@"User"];
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                [v89 objectForKey:@"Domain"];
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                [v84 deletePreference:v90 forUser:v91 inDomain:v92];
              }

              v86 = [v85 countByEnumeratingWithState:&v140 objects:&v164 count:16];
            }

            while (v86);
          }

          v82 = 0;
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v168 = 0;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Applying awd task failed",  v168,  2u);
            v82 = 0;
          }
        }

        if (!v118) {
          break;
        }
        if (++v117 == v113)
        {
          v113 = [v109 countByEnumeratingWithState:v179 objects:buf count:16];
          if (v113) {
            goto LABEL_83;
          }
          break;
        }
      }

      if ((v82 & 1) == 0)
      {

        v74 = v135;
        v75 = (void *)v135[5];
        v76 = &unk_189E318E0;
        goto LABEL_77;
      }
    }

    else
    {
    }

    v95 = [v115 writeToFile:v108 atomically:1];
    v96 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v95)
    {
      if (v96)
      {
        *(_DWORD *)v168 = 138412290;
        v169 = v108;
        v97 = (os_log_s *)MEMORY[0x1895F8DA0];
        v98 = "awd task successfully applied and saved as %@";
LABEL_115:
        _os_log_impl(&dword_1861AC000, v97, OS_LOG_TYPE_DEFAULT, v98, v168, 0xCu);
      }
    }

    else if (v96)
    {
      *(_DWORD *)v168 = 138412290;
      v169 = v108;
      v97 = (os_log_s *)MEMORY[0x1895F8DA0];
      v98 = "Could not write task blob to file: %@";
      goto LABEL_115;
    }

    goto LABEL_117;
  }

  __int128 v10 = (void *)v135[5];
  v135[5] = (uint64_t)&unk_189E31958;

  xpc_object_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
  uint64_t v12 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v13 = [v124 length];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v125;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&v177 = v13;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%@ taskId %@ with rawblob (%lu bytes) is inconsistent",  buf,  0x20u);
  }

LABEL_120:
  v105 = (id)v135[5];
  _Block_object_dispose(&v134, 8);

  return v105;
}

      return;
    case 2007:
      v8 = @"osanalytics_monitor_ca_submission";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2008:
      v8 = @"osanalytics_monitor_hb_diff";
LABEL_17:
      if (a4) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 2009:
      v8 = @"osanalytics_beacon";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    default:
      goto LABEL_30;
  }

void sub_1861B74DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id selectConfigFromBlob(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v44 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:a1 options:0 format:0 error:&v44];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v44;
  BOOL v5 = v4;
  if (!v3)
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v49 = *MEMORY[0x1896075E0];
    v8 = (void *)NSString;
    [v4 domain];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"blob failed to unserialize (error %@:%ld)", v6, objc_msgSend(v5, "code")];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v9;
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    uint64_t v11 = [v7 errorWithDomain:@"OSATasking" code:3 userInfo:v10];

    BOOL v5 = (void *)v10;
    goto LABEL_36;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 objectForKeyedSubscript:@"PayloadContent"];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v26 = (void *)MEMORY[0x189607870];
    uint64_t v51 = *MEMORY[0x1896075E0];
    v52 = @"blob missing payload";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v26 errorWithDomain:@"OSATasking" code:2 userInfo:v9];
    goto LABEL_36;
  }

  [v3 objectForKeyedSubscript:@"PayloadType"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 isEqualToString:@"TaskingConfigurations"];

  if (!v13)
  {
    id v27 = v6;
    goto LABEL_33;
  }

  __int128 v37 = v5;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v36 = v6;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (!v16)
  {
    id v27 = 0LL;
    goto LABEL_30;
  }

  uint64_t v17 = v16;
  __int128 v34 = v3;
  uint64_t v35 = a2;
  uint64_t v18 = *(void *)v41;
  id v38 = v15;
  do
  {
    for (uint64_t i = 0LL; i != v17; ++i)
    {
      if (*(void *)v41 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      [v14 uiCountryCode];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 buildVersion];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 modelCode];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 releaseType];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!matchSelector((uint64_t)@"ReleaseType", v24, v20))
      {

LABEL_20:
LABEL_21:

LABEL_22:
        continue;
      }

      [v14 productVersion];
      xpc_object_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL matched = matchSelector((uint64_t)@"ProductVersion", v25, v20);

      id v15 = v38;
      if (matched)
      {
        [v20 objectForKey:@"ConfigurationContent"];
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }

    uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v55 count:16];
  }

  while (v17);
  id v27 = 0LL;
LABEL_28:
  v3 = v34;
  a2 = v35;
LABEL_30:

  unsigned int v6 = v36;
  BOOL v5 = v37;
  if (![v27 count])
  {
    id v28 = (void *)MEMORY[0x189607870];
    uint64_t v53 = *MEMORY[0x1896075E0];
    v54 = @"no matching configs";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v28 errorWithDomain:@"OSATasking" code:1 userInfo:v29];

    BOOL v5 = (void *)v30;
  }

LABEL_33:
  if (v27 && (isConfigValid(v27) & 1) == 0)
  {
    __int128 v31 = (void *)MEMORY[0x189607870];
    uint64_t v47 = *MEMORY[0x1896075E0];
    v48 = @"content invalid";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v31 errorWithDomain:@"OSATasking" code:4 userInfo:v9];
    unsigned int v6 = v27;
LABEL_36:

    id v27 = 0LL;
    BOOL v5 = (void *)v11;
  }

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v5 localizedDescription];
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v32;
      _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Tasking selection error: %@", buf, 0xCu);
    }

    if (a2) {
      *a2 = v5;
    }
  }

  return v27;
}

BOOL matchSelector(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  BOOL v6 = v5 != 0LL;
  uint64_t v7 = [a3 objectForKey:a1];
  v8 = (void *)v7;
  if (v5 && v7)
  {
    [MEMORY[0x189607A00] regularExpressionWithPattern:v7 options:0 error:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
      BOOL v6 = v10 != 0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        matchSelector_cold_1(v10 != 0, (uint64_t)v5, (uint64_t)v8);
      }
    }

    else
    {
      BOOL v6 = 0LL;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        int v13 = v8;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Invalid regex '%@'",  (uint8_t *)&v12,  0xCu);
        BOOL v6 = 0LL;
      }
    }
  }

  return v6;
}

uint64_t isConfigValid(void *a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (!v2)
  {
    uint64_t v13 = 1LL;
    goto LABEL_36;
  }

  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v16;
  id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
  while (2)
  {
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      if (*(void *)v16 != v4) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v13 = 0LL;
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Invalid PayloadContent entry - expected dictionary",  buf,  2u);
LABEL_35:
        uint64_t v13 = 0LL;
        goto LABEL_36;
      }

      [v7 objectForKey:@"User"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 length])
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Missing or invalid 'User' key",  buf,  2u);
        }

        goto LABEL_34;
      }

      [v7 objectForKey:@"Domain"];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v9 length])
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Missing or invalid 'Domain' key",  buf,  2u);
        }

LABEL_34:
        goto LABEL_35;
      }

      [v7 objectForKey:@"Key"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length])
      {
        [v7 objectForKey:@"Value"];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            uint64_t v20 = v8;
            __int16 v21 = 2112;
            id v22 = v9;
            __int16 v23 = 2112;
            id v24 = v10;
            __int16 v25 = 2112;
            id v26 = v11;
            _os_log_debug_impl(&dword_1861AC000, v5, OS_LOG_TYPE_DEBUG, "validated %@@%@:%@=%@", buf, 0x2Au);
          }

          int v12 = 0;
        }

        else
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v20 = v8;
            __int16 v21 = 2112;
            id v22 = v9;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_impl(&dword_1861AC000, v5, OS_LOG_TYPE_DEFAULT, "Missing 'Value' key for %@ / %@ / %@", buf, 0x20u);
          }

          int v12 = 1;
        }
      }

      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v8;
          __int16 v21 = 2112;
          id v22 = v9;
          _os_log_impl( &dword_1861AC000,  v5,  OS_LOG_TYPE_DEFAULT,  "Missing or invalid 'Key' key for %@ / %@",  buf,  0x16u);
        }

        int v12 = 1;
      }

      if (v12) {
        goto LABEL_35;
      }
      id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    }

    uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v27 count:16];
    uint64_t v13 = 1LL;
    if (v3) {
      continue;
    }
    break;
  }

LABEL_36:
  return v13;
}

void OUTLINED_FUNCTION_0_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_1861B8F40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1861B90D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1861B934C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_69:
        id v26 = 3;
LABEL_70:
        v46 = v52;
LABEL_71:
        --v8;
        v15 += v46 + 2;

        continue;
      }

      if ([v30 hasPrefix:@"d"])
      {
        v12[2](v12, [@"d" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v34 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v34, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"ld"])
      {
        v12[2](v12, [@"ld" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v37 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v37, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"lld"])
      {
        v12[2](v12, [@"lld" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        id v38 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%lld", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v38, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"u"])
      {
        v12[2](v12, [@"u" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_69;
        }
        __memcpy_chk();
        v39 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%u", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v39, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"lu"])
      {
        v12[2](v12, [@"lu" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v40 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v40, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"llu"])
      {
        v12[2](v12, [@"llu" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v41 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%llu", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v41, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"x"])
      {
        v12[2](v12, [@"x" length]);
        if (*v15 > 0xFu || v15[1] != 4) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v42 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%x", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v42, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"lx"])
      {
        v12[2](v12, [@"lx" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        __int128 v43 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%lx", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v43, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"llx"])
      {
        v12[2](v12, [@"llx" length]);
        if (*v15 > 0xFu || v15[1] != 8) {
          goto LABEL_69;
        }
        __memcpy_chk();
        id v44 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
        objc_msgSend(NSString, "stringWithFormat:", @"%llx", 0);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v44, "initWithIntegerArgumentStringValue:", v35);
        [v5 addObject:v36];
        goto LABEL_66;
      }

      if ([v30 hasPrefix:@"p"])
      {
        v12[2](v12, [@"p" length]);
        if (*v15 > 0xFu) {
          goto LABEL_69;
        }
        if (v15[1] == 8)
        {
LABEL_65:
          __memcpy_chk();
          v45 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
          objc_msgSend(NSString, "stringWithFormat:", @"%p", 0);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:]( v45,  "initWithIntegerArgumentStringValue:",  v35);
          [v5 addObject:v36];
LABEL_66:

          v46 = v52;
          id v26 = 0;
          __int128 v17 = v53 + 1;
          goto LABEL_71;
        }
      }

      else
      {
        if (![v30 hasPrefix:@"@"])
        {
          uint64_t v47 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart),  "initWithLiteral:isImmutable:",  @"%",  self->_formatStringIsImmutable);
          [v5 addObject:v47];

          goto LABEL_69;
        }

        v12[2](v12, [@"p" length]);
        if ((*v15 & 0xF0) == 0x40 && v15[1] == 8) {
          goto LABEL_65;
        }
      }

      id v26 = 3;
      __int128 v17 = v53;
      goto LABEL_70;
    }

    id v22 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
    [(id)v56[5] substringToIndex:v21];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( v22,  "initWithLiteral:isImmutable:",  v23,  self->_formatStringIsImmutable);
    [v5 addObject:v24];

    __int16 v25 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart),  "initWithLiteral:isImmutable:",  @"%",  self->_formatStringIsImmutable);
    [v5 addObject:v25];

    v12[2](v12, v21 + 2);
    id v26 = 2;
  }

  while (v26 != 3);
  if ([(id)v56[5] length])
  {
    v48 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
    uint64_t v49 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( v48,  "initWithLiteral:isImmutable:",  v56[5],  self->_formatStringIsImmutable);
    [v5 addObject:v49];
  }

  v50 = (id)[v5 copy];
LABEL_77:
  uint64_t v10 = v50;

LABEL_5:
  _Block_object_dispose(&v55, 8);

  return v10;
}

        [v37 addObject:@"periodic"];
        if ((*((void *)v35 - 25) & 0x2000) != 0) {
          goto LABEL_25;
        }
LABEL_26:
        if (!objc_msgSend(v37, "count", v41))
        {
          if (strcmp((const char *)snapshot + v34 - 268, "SpringBoard"))
          {
            __int128 v43 = @"background";
            if (*((void *)v35 - 25)
              || ([v37 addObject:@"daemon"],
                  __int128 v43 = @"idle",
                  (*((_DWORD *)v35 - 57) & 0x30) == 0x10))
            {
              [v37 addObject:v43];
            }
          }
        }

        v134[0] = @"name";
        processName();
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v110;
        v134[1] = @"pid";
        [MEMORY[0x189607968] numberWithInt:*((unsigned int *)v35 - 68)];
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v135[1] = v108;
        v134[2] = @"uuid";
        [NSString stringWithUTF8String:out];
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v135[2] = v106;
        v134[3] = @"cpuTime";
        v115 = snapshot;
        v118 = v34;
        id v44 = (char *)snapshot + v34;
        [MEMORY[0x189607968] numberWithDouble:(double)*(uint64_t *)((char *)snapshot + v34 - 40) / 1000000.0 + (double)*(uint64_t *)((char *)snapshot + v34 - 48)];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v135[3] = v45;
        v134[4] = @"rpages";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)v44 - 23)];
        v46 = v37;
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
        v135[4] = v47;
        v134[5] = @"purgeable";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)v44 - 21)];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v135[5] = v48;
        v134[6] = @"lifetimeMax";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)v44 - 22)];
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        v135[6] = v49;
        v134[7] = @"fds";
        [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)v44 - 56)];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v135[7] = v50;
        v135[8] = v46;
        v112 = v46;
        v134[8] = @"states";
        v134[9] = @"age";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var0 - *((void *)v44 - 10)];
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        v135[9] = v51;
        v134[10] = @"priority";
        [MEMORY[0x189607968] numberWithInt:*((unsigned int *)v44 - 58)];
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v135[10] = v52;
        v134[11] = @"freeze_skip_reason:";
        uint64_t v53 = *((_DWORD *)v44 - 55);
        v54 = @"(unknown-reason)";
        v135[11] = v54;
        [MEMORY[0x189603F68] dictionaryWithObjects:v135 forKeys:v134 count:12];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v56 = (void *)[v55 mutableCopy];

        if (*((void *)v44 - 8))
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v57 forKeyedSubscript:@"idleDelta"];
        }

        v58 = (uint64_t)v115 + v118;
        v59 = *(void *)((char *)v115 + v118 - 72);
        self = v104;
        if (v59)
        {
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v59 - v104->_snapshot->var0];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v60 forKeyedSubscript:@"killDelta"];

          [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v58 - 88)];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v61 forKeyedSubscript:@"genCount"];
        }

        v62 = *(void *)(v58 - 192);
        if (v62)
        {
          killDescription(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v63 forKeyedSubscript:@"reason"];
        }

        [MEMORY[0x189603FC8] dictionary];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (uint64_t)v115 + v118;
        if (*(void *)((char *)v115 + v118 - 160) || *(void *)(v65 - 152))
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v133[0] = v66;
          [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v65 - 152)];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v133[1] = v67;
          [MEMORY[0x189603F18] arrayWithObjects:v133 count:2];
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 setObject:v68 forKeyedSubscript:@"internal"];
        }

        if (*(void *)((char *)v115 + v118 - 24))
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 setObject:v69 forKeyedSubscript:@"frozen_to_swap_pages"];
        }

        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)((char *)v115 + v118 - 96)];
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 setObject:v70 forKeyedSubscript:@"mem_regions"];

        if (v101)
        {
          v71 = (uint64_t)v115 + v118;
          if (*(void *)((char *)v115 + v118 - 144) || *(void *)(v71 - 136))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = v72;
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v71 - 136)];
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v132[1] = v73;
            [MEMORY[0x189603F18] arrayWithObjects:v132 count:2];
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v74 forKeyedSubscript:@"purgeable_nv"];
          }

          v75 = (uint64_t)v115 + v118;
          if (*(void *)((char *)v115 + v118 - 128) || *(void *)(v75 - 120))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = v76;
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v75 - 120)];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v131[1] = v77;
            [MEMORY[0x189603F18] arrayWithObjects:v131 count:2];
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v78 forKeyedSubscript:@"alternate"];
          }

          if (*(void *)((char *)v115 + v118 - 112))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v79 forKeyedSubscript:@"iokit"];
          }

          if (*(void *)((char *)v115 + v118 - 104))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v80 forKeyedSubscript:@"table"];
          }

          if (*(unint64_t *)((char *)&v115->var0 + v118))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 setObject:v81 forKeyedSubscript:@"neuralPages"];
          }
        }

        if ([v64 count]) {
          [v56 setObject:v64 forKeyedSubscript:@"physicalPages"];
        }
        v82 = (uint64_t)v115 + v118;
        if (*(void *)((char *)v115 + v118 - 56))
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v83 forKeyedSubscript:@"coalition"];
        }

        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v82 - 16)];
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 setObject:v84 forKeyedSubscript:@"csFlags"];

        [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)(v82 - 8)];
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 setObject:v85 forKeyedSubscript:@"csTrustLevel"];

        [v103 addObject:v56];
        __int128 v33 = v121 + 1;
        snapshot = v104->_snapshot;
        __int128 v34 = v118 + 280;
      }

      while (snapshot->var4 > v121 + 1);
    }

    v129[0] = @"processes";
    v129[1] = &unk_189E30848;
    v130[0] = v103;
    v130[1] = &unk_189E307B8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v130 forKeys:v129 count:2];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v99;
    v99[2](v99, v86);
  }
  v87 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  v88 = [v87 appleInternal];

  if (v88)
  {
    if (-[NSMutableArray count](self->_zones, "count"))
    {
      zones = self->_zones;
      v127 = @"zones";
      v128 = zones;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v90);
    }

    if (-[NSMutableArray count](self->_tags, "count"))
    {
      tags = self->_tags;
      v125 = @"tags";
      v126 = tags;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v92);
    }
  }

  if (-[NSMutableArray count](self->super._notes, "count"))
  {
    notes = self->super._notes;
    v123 = @"notes";
    v124 = notes;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v94);
  }

  if (self->_isSuspendedOnlyJetsam) {
    -[OSAJetsamReport _setDumpedSuspendedJetsamLog](self, "_setDumpedSuspendedJetsamLog");
  }
}

void sub_1861BA3D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

__CFString *processName()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int128 v1 = *(_OWORD *)(v0 + 20);
  v6[0] = *(_OWORD *)(v0 + 4);
  v6[1] = v1;
  char v7 = *(_BYTE *)(v0 + 36);
  char v8 = 0;
  if (LOBYTE(v6[0]))
  {
    [NSString stringWithUTF8String:v6];
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v2 = @"unknown";
  }

  uint64_t v3 = @"(unprintable)";
  if (v2) {
    uint64_t v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

__CFString *killDescription(unint64_t a1)
{
  if (a1 < 0x10) {
    return off_189E20650[a1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(unknown-%llu)", a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

CFStringRef freezeSkipReason(unsigned int a1)
{
  if (a1 > 0xA) {
    return @"(unknown-reason)";
  }
  else {
    return off_189E206D0[(char)a1];
  }
}

LABEL_15:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (a4)
  {
    uint64_t v14 = v14;
    *a4 = v14;
  }

          __int128 v16 = objc_msgSend(v10, "copy", v25);
          __int128 v17 = *(void *)(a1 + 32);
          __int128 v18 = *(void **)(v17 + 224);
          *(void *)(v17 + 224) = v16;

          uint64_t v19 = [v6 objectForKeyedSubscript:@"submission_params"];
          uint64_t v20 = *(void *)(a1 + 32);
          __int16 v21 = *(void **)(v20 + 232);
          *(void *)(v20 + 232) = v19;

          id v22 = [v6 objectForKeyedSubscript:@"whitelisted_domains"];
          __int16 v23 = *(void *)(a1 + 32);
          id v24 = *(void **)(v23 + 240);
          *(void *)(v23 + 240) = v22;

          goto LABEL_18;
        }
      }
    }

    uint64_t v10 = &unk_189E31D60;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(&unk_189E31D60, "componentsJoinedByString:", @", ");
      int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      uint64_t v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v14 = "no blacklist tasking: applying default: %@";
      __int128 v15 = OS_LOG_TYPE_INFO;
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unable to load %@", buf, 0xCu);
  }

  if ([v12 length])
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v22 fileExistsAtPath:v12])
    {
      __int16 v23 = v12;
      id v24 = [v23 fileSystemRepresentation];
      v42[0] = MEMORY[0x1895F87A8];
      v42[1] = 3221225472LL;
      v42[2] = __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke;
      v42[3] = &unk_189E207A0;
      __int128 v43 = (OSASafeCreateDirectoryOptions *)v9;
      int v12 = v23;
      id v44 = v12;
      OSASafeOpenReadOnly(v24, v42);

      __int16 v25 = 0LL;
      id v26 = v43;
    }

    else
    {
      id v26 = objc_alloc_init(&OBJC_CLASS___OSASafeCreateDirectoryOptions);
      -[OSASafeCreateDirectoryOptions setCreateIntermediates:](v26, "setCreateIntermediates:", 1LL);
      [v9 objectForKeyedSubscript:@"file-owner-uid"];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSASafeCreateDirectoryOptions setUserID:](v26, "setUserID:", v27);

      -[OSASafeCreateDirectoryOptions setGroupID:](v26, "setGroupID:", &unk_189E30860);
      -[OSASafeCreateDirectoryOptions setFileProtectionNone:](v26, "setFileProtectionNone:", 1LL);
      [MEMORY[0x189604030] fileURLWithPath:v12];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v41 = 0LL;
      id v29 = OSASafeCreateDirectory(v28, 504, v26, &v41);
      __int16 v25 = v41;

      uint64_t v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543362;
          uint64_t v56 = v12;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "created directory '%{public}@'",  v55,  0xCu);
        }
      }

      else
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543618;
          uint64_t v56 = v12;
          v57 = 2114;
          v58 = v25;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to create directory '%{public}@': %{public}@",  v55,  0x16u);
        }

        int v12 = 0LL;
      }
    }

    if (v12)
    {
      if ([v22 isWritableFileAtPath:v12])
      {
        [v9 objectForKeyedSubscript:kPathOptionNoBackup];
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v32 = [v31 BOOLValue];

        if (v32)
        {
          [MEMORY[0x189604030] fileURLWithPath:v12];
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v40 = 0LL;
          __int128 v34 = *MEMORY[0x189603C50];
          [v33 getResourceValue:&v40 forKey:*MEMORY[0x189603C50] error:0];
          uint64_t v35 = v40;
          if ([v35 BOOLValue])
          {
            __int128 v36 = v25;
          }

          else
          {
            v39 = v25;
            __int128 v37 = [v33 setResourceValue:MEMORY[0x189604A88] forKey:v34 error:&v39];
            __int128 v36 = v39;

            if ((v37 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 138543618;
              uint64_t v56 = v12;
              v57 = 2114;
              v58 = v36;
              _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to set NSURLIsExcludedFromBackupKey '%{public}@': %{public}@",  v55,  0x16u);
            }
          }

          __int16 v25 = v36;
        }
      }
    }
  }

  return v12;
}

LABEL_45:
  if (v8 && v7 && v6)
  {
    id v24 = (NSMutableArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:5];
    zones = self->_zones;
    self->_zones = v24;

    id v26 = (NSMutableArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:5];
    tags = self->_tags;
    self->_tags = v26;

    v46 = v7;
    __int128 v43 = v6;
    uint64_t v28 = -[OSAWiredMemoryInfo initWithZoneNames:nameCount:zoneInfo:zoneInfoCount:wiredInfo:wiredInfoCount:]( objc_alloc(&OBJC_CLASS___OSAWiredMemoryInfo),  "initWithZoneNames:nameCount:zoneInfo:zoneInfoCount:wiredInfo:wiredInfoCount:",  v8,  v5,  v7,  v4,  v6,  v3);
    id v29 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"size" ascending:0];
    uint64_t v51 = v29;
    [MEMORY[0x189603F18] arrayWithObjects:&v51 count:1];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[OSAWiredMemoryInfo zoneInfo](v28, "zoneInfo");
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 sortedArrayUsingDescriptors:v30];
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[OSAWiredMemoryInfo vmRegionInfo](v28, "vmRegionInfo");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 sortedArrayUsingDescriptors:v30];
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();

    for (uint64_t j = 0LL; j != 5; ++j)
    {
      if ([v32 count] <= j) {
        break;
      }
      __int128 v36 = self->_zones;
      [v32 objectAtIndexedSubscript:j];
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v36, "addObject:", v37);
    }

    for (uint64_t k = 0LL; k != 5; ++k)
    {
      if ([v34 count] <= k) {
        break;
      }
      v39 = self->_tags;
      [v34 objectAtIndexedSubscript:k];
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v39, "addObject:", v40);
    }

    BOOL v6 = v43;
    char v7 = v46;
  }

  free(v8);
  free(v7);
  free(v6);
}

  if (a6)
  {
    v78 = (void *)v113[5];
    if (v78) {
      *a6 = v78;
    }
  }

  v79 = (id)v119[5];

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);

  return v79;
}

  return v8;
}

LABEL_16:
        if ((v38 & 0x10) != 0) {
          goto LABEL_17;
        }
LABEL_18:
        visibilityEndowmentState = self->_visibilityEndowmentState;
        [MEMORY[0x189607968] numberWithInt:*((unsigned int *)v35 - 68)];
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(visibilityEndowmentState) = -[NSSet containsObject:](visibilityEndowmentState, "containsObject:", v40);

        __int128 v41 = @"frontmost";
        if ((visibilityEndowmentState & 1) != 0
          || (__int128 v41 = @"background", (*(v35 - 200) & 8) != 0))
        {
          [v37 addObject:v41];
        }

        __int128 v42 = *((void *)v35 - 25);
        if ((v42 & 0x100) != 0)
        {
          [v37 addObject:@"resume"];
          __int128 v42 = *((void *)v35 - 25);
          if ((v42 & 0x200) == 0)
          {
LABEL_23:
            if ((v42 & 0x800) == 0) {
              goto LABEL_24;
            }
            goto LABEL_69;
          }
        }

        else if ((v42 & 0x200) == 0)
        {
          goto LABEL_23;
        }

        [v37 addObject:@"suspending"];
        __int128 v42 = *((void *)v35 - 25);
        if ((v42 & 0x800) == 0)
        {
LABEL_24:
          if ((v42 & 0x2000) == 0) {
            goto LABEL_26;
          }
LABEL_25:
          [v37 addObject:@"continuous"];
          goto LABEL_26;
        }
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_18:
    -[__CFString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", @"plist");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [@"/Library/Managed Preferences/mobile/" stringByAppendingPathComponent:v21];
    UserIdentifierForUID = (__CFString *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189603F68] dictionaryWithContentsOfFile:UserIdentifierForUID];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:v7];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.1();
    }
LABEL_21:

    goto LABEL_22;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.5(self);
  }
LABEL_22:

  return v11;
}
}

void OUTLINED_FUNCTION_0_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_7( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

char *OUTLINED_FUNCTION_10(int *a1)
{
  return strerror(*a1);
}

  ;
}

int *OUTLINED_FUNCTION_12()
{
  return __error();
}

  ;
}

uint64_t OSAIsRSDHost()
{
  return 0LL;
}

uint64_t OSAIsRSDDevice()
{
  else {
    return OSAIsDebugEnabledForRSD();
  }
}

BOOL OSAIsRSDDisplay()
{
  return MGGetSInt32Answer() == 10;
}

uint64_t OSAIsDebugEnabledForRSD()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addSuiteNamed:@"com.apple.osanalytics"];
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  __int128 v1 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void OUTLINED_FUNCTION_0_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OSASyncCrashReporter(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_opt_new();
  [v3 addObject:@"com.apple.ReportCrash"];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = (mach_port_t *)MEMORY[0x1895F9630];
    uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v27 = a2;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = (const char *)[v12 UTF8String];
        mach_port_t sp = 0;
        if (bootstrap_look_up(*v9, v13, &sp) || sp + 1 < 2)
        {
          __int128 v17 = (void *)MEMORY[0x189607870];
          uint64_t v34 = *MEMORY[0x1896075E0];
          [NSString stringWithFormat:@"unable to lookup port for %@", v12];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v35 = v18;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = v17;
          uint64_t v21 = 1LL;
LABEL_19:
          [v20 errorWithDomain:@"OSASyncCrashReporter" code:v21 userInfo:v19];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          a2 = v27;
          goto LABEL_20;
        }

        uint64_t v28 = 0LL;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v12;
          _os_log_impl(&dword_1861AC000, v10, OS_LOG_TYPE_DEFAULT, "sending sync request to %@", buf, 0xCu);
        }

        mach_error_t v14 = rc_sync_request(sp, 1LL, 0LL, &v28);
        if (v14)
        {
          id v22 = (void *)MEMORY[0x189607870];
          uint64_t v36 = *MEMORY[0x1896075E0];
          objc_msgSend( NSString,  "stringWithFormat:",  @"sync request failed (mach ipc: %s)",  mach_error_string(v14));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v37 = v18;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = v22;
          uint64_t v21 = 2LL;
          goto LABEL_19;
        }

        int v15 = (int)v28;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v39 = v28;
          _os_log_impl(&dword_1861AC000, v10, OS_LOG_TYPE_DEFAULT, "synced after %lld total events", buf, 0xCu);
        }

        v7 += v15;
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
      __int128 v16 = 0LL;
      a2 = v27;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    __int128 v16 = 0LL;
    unsigned int v7 = 0;
  }

LABEL_20:
  if (a2)
  {
    id v23 = v16;
    *a2 = v23;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v23 localizedDescription];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v39 = v24;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unable to lookup port for %@",  buf,  0xCu);
    }
  }

  if (v16) {
    uint64_t v25 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v25 = v7;
  }

  return v25;
}

  return v11 >= 300.0;
}
}

id OSASanitizePath(void *a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v53 = a1;
  id v3 = a2;
  if (OSASanitizePath_onceToken != -1) {
    dispatch_once(&OSASanitizePath_onceToken, &__block_literal_global_2);
  }
  v52 = v3;
  id v54 = (id)[MEMORY[0x189603FE0] set];
  if (![v53 length])
  {
    __int128 v37 = 0LL;
    goto LABEL_57;
  }

  uint64_t v75 = 0LL;
  v76 = &v75;
  uint64_t v77 = 0x3032000000LL;
  v78 = __Block_byref_object_copy__2;
  v79 = __Block_byref_object_dispose__2;
  id v80 = v53;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3032000000LL;
  v72 = __Block_byref_object_copy__2;
  v73 = __Block_byref_object_dispose__2;
  id v74 = 0LL;
  [v3 objectForKeyedSubscript:@"debug_block"];
  v58 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  id v4 = (dispatch_queue_s *)OSASanitizePath_domain_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __OSASanitizePath_block_invoke_33;
  block[3] = &unk_189E20810;
  v67 = &v75;
  v68 = &v69;
  id v47 = v52;
  id v66 = v47;
  dispatch_sync(v4, block);
  [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:v70[5]];
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)v76[5] lastPathComponent];
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)v76[5] stringByDeletingLastPathComponent];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsSeparatedByString:@"/"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)objc_opt_new();
  [v49 objectForKeyedSubscript:@"MSK"];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50) {
    [v59 addObject:v50];
  }
  if (v58)
  {
    unsigned int v7 = (void *)NSString;
    uint64_t v8 = v70[5];
    [v59 componentsJoinedByString:@"/"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringWithFormat:@"  domain %@ => [%@]", v8, v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v58)[2](v58, v10);
  }

  getRuleForSpecifier((void *)v70[5]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  getRules(0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v56 = shouldMaskFile(v12, 1LL);
  v48 = v12;
  getBundleTypes(v12, 0LL);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v14 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v42 = [v6 count];
    [v6 componentsJoinedByString:@"+"];
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    int v44 = [v59 count];
    [v59 componentsJoinedByString:@"+"];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    int v83 = v42;
    __int16 v84 = 2112;
    id v85 = v43;
    __int16 v86 = 1024;
    int v87 = v44;
    __int16 v88 = 2112;
    v89 = v45;
    __int16 v90 = 1024;
    int v91 = v56;
    _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "parts %d (%@), new_parts %d (%@) mask %d",  buf,  0x28u);
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  obuint64_t j = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
  if (v15)
  {
    uint64_t v57 = *(void *)v62;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v62 != v57) {
          objc_enumerationMutation(obj);
        }
        __int128 v17 = *(__CFString **)(*((void *)&v61 + 1) + 8 * i);
        if (-[__CFString length](v17, "length"))
        {
          if (v11)
          {
            LOBYTE(v56) = shouldMaskFile(v11, v56 & 1);
            uint64_t v18 = getBundleTypes(v11, v60);

            v60 = (void *)v18;
          }

          -[__CFString pathExtension](v17, "pathExtension");
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v19 length]
            && ([v60 objectForKeyedSubscript:v19],
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(),
                (uint64_t v21 = v20) != 0LL))
          {
            uint64_t v22 = getRuleForSpecifier(v20);

            [NSString stringWithFormat:@"bundle(%@)", v19];
            id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            int v24 = 0;
          }

          else
          {
            int v25 = [v54 containsObject:v17];
            if (v11) {
              char v26 = v25;
            }
            else {
              char v26 = 1;
            }
            if (v25) {
              id v23 = @"keep       ";
            }
            else {
              id v23 = @"none       ";
            }
            if ((v26 & 1) != 0)
            {
              uint64_t v22 = 0LL;
              int v24 = v25 ^ 1;
            }

            else
            {
              uint64_t v22 = getSubruleForSpecifier(v11, (uint64_t)v17);
              if (v22)
              {
                int v24 = 0;
                id v23 = @"explicit   ";
              }

              else
              {
                uint64_t v22 = getSubruleForSpecifier(v11, (uint64_t)@"@mask");
                if (v22)
                {
                  int v24 = 1;
                  id v23 = @"mask       ";
                }

                else
                {
                  uint64_t v22 = getSubruleForSpecifier(v11, (uint64_t)@"@keep");
                  if (v22)
                  {
                    int v24 = 0;
                    id v23 = @"keep       ";
                  }

                  else
                  {
                    int v24 = 1;
                    id v23 = @"none       ";
                  }
                }
              }
            }
          }

          if (v58)
          {
            id v27 = (void *)NSString;
            uint64_t v28 = [v59 componentsJoinedByString:@"/"];
            id v29 = (void *)v28;
            __int128 v30 = &stru_189E21910;
            if (v24) {
              __int128 v30 = @" -> *";
            }
            [v27 stringWithFormat:@"    rule <%@> => %@[%@%@]", v23, v28, v17, v30];
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(void, void *))v58)[2](v58, v31);
          }

          if (v24) {
            __int128 v32 = @"*";
          }
          else {
            __int128 v32 = v17;
          }
          [v59 addPart:v32];

          uint64_t v11 = (void *)v22;
        }
      }

      uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
    }

    while (v15);
  }

  if ([v51 length])
  {
    [v47 objectForKeyedSubscript:OSASanitizeOptionKeepFilename];
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 && (objc_opt_respondsToSelector() & 1) != 0 && ([v33 BOOLValue] & 1) == 0)
    {
      if ((v56 & 1) != 0)
      {
        id v35 = v51;
        [v35 pathExtension];
        id v39 = (void *)objc_claimAutoreleasedReturnValue();
        [@"*" stringByAppendingPathExtension:v39];
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v58) {
          goto LABEL_53;
        }
        __int128 v40 = (void *)NSString;
        [v59 componentsJoinedByString:@"/"];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 stringWithFormat:@"    last <masking    > => %@[%@ -> %@]", v36, v35, v51];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *))v58)[2](v58, v41);
      }

      else
      {
        if (!v58) {
          goto LABEL_54;
        }
        v46 = (void *)NSString;
        [v59 componentsJoinedByString:@"/"];
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        [v46 stringWithFormat:@"    last <keeping    > => %@[%@]", v35, v51];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *))v58)[2](v58, v36);
      }
    }

    else
    {
      if (!v58)
      {
LABEL_54:
        [v59 addPart:v51];

        goto LABEL_55;
      }

      uint64_t v34 = (void *)NSString;
      [v59 componentsJoinedByString:@"/"];
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      [v34 stringWithFormat:@"    last <option-keep> => %@[%@]", v35, v51];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v58)[2](v58, v36);
    }

LABEL_53:
    goto LABEL_54;
  }

LABEL_55:
  [v59 componentsJoinedByString:@"/"];
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

LABEL_57:
  return v37;
}

              [v74 setObject:v35 forKeyedSubscript:v79];
            }

            if (++v33 == v76)
            {
              v76 = [v77 countByEnumeratingWithState:&v93 objects:v124 count:16];
              if (!v76)
              {
LABEL_71:

                [v81 setObject:v74 forKeyedSubscript:@"threadState"];
                goto LABEL_72;
              }

              continue;
            }

            goto LABEL_51;
          }
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v129 = @"unknown";
          v130 = v70;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
          v72 = (id)objc_claimAutoreleasedReturnValue();
          [v64 setObject:v72 forKeyedSubscript:v71];
        }

void sub_1861C57C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

void __OSASanitizePath_block_invoke()
{
  v25[2] = *MEMORY[0x1895F89C0];
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.osanalytics.sanitizer", 0LL);
  __int128 v1 = (void *)OSASanitizePath_domain_queue;
  OSASanitizePath_domain_queue = (uint64_t)v0;

  uint64_t v2 = (void *)objc_opt_new();
  v24[0] = @"KPX";
  id v3 = (void *)objc_opt_new();
  [v3 addObject:@"/var/mobile"];
  [v3 sortUsingComparator:&__block_literal_global_72];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    __OSASanitizePath_block_invoke_cold_1(v3);
  }
  v24[1] = @"MSK";
  v25[0] = v3;
  v25[1] = @"/Users/USER";
  [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:@"HomeDirectory"];

  v22[0] = @"KPX";
  getVolumes(0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = @"MSK";
  v23[0] = v5;
  v23[1] = @"/Volumes/NETWORK";
  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:2];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v6 forKeyedSubscript:@"NetworkVolume"];

  v20[0] = @"KPX";
  unsigned int v7 = (void *)objc_opt_new();
  v20[1] = @"MSK";
  v21[0] = v7;
  v21[1] = &stru_189E21910;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v8 forKeyedSubscript:@"SystemVolume"];

  v18[0] = @"KPX";
  uint64_t v9 = (void *)objc_opt_new();
  v18[1] = @"MSK";
  v19[0] = v9;
  v19[1] = @"/Volumes/VOLUME";
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v10 forKeyedSubscript:@"MountedVolume"];

  __int128 v16 = @"KPX";
  getVolumes(1LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v12 forKeyedSubscript:@"StagedVolume"];

  uint64_t v13 = (void *)OSASanitizePath_domainInfos;
  OSASanitizePath_domainInfos = (uint64_t)v2;
  id v14 = v2;

  uint64_t v15 = (void *)OSASanitizePath_orderedDomainList;
  OSASanitizePath_orderedDomainList = (uint64_t)&unk_189E31D90;
}

id getVolumes(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new();
  uint64_t v9 = 0LL;
  int v3 = getmntinfo(&v9, 2);
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 1112LL;
    do
    {
      if (((*((_BYTE *)v9 + v5 - 1047) & 0x10) == 0) != (_DWORD)a1)
      {
        char v6 = *((_BYTE *)&v9->f_bsize + v5);
        *((_BYTE *)&v9->f_bsize + v5) = 0;
        [NSString stringWithUTF8String:(char *)v9 + v5 - 1024];
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)&v9->f_bsize + v5) = v6;
      }

      v5 += 2168LL;
      --v4;
    }

    while (v4);
  }

  [v2 sortUsingComparator:&__block_literal_global_75];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    getVolumes_cold_1(a1, v2);
  }
  return v2;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __OSASanitizePath_block_invoke_33(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    __OSASanitizePath_block_invoke_33_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v9 = (id)OSASanitizePath_orderedDomainList;
  uint64_t v66 = [v9 countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v66)
  {
    uint64_t v11 = a1 + 48;
    uint64_t v12 = *(void *)v74;
    uint64_t v13 = (void *)MEMORY[0x1895F8DA0];
    *(void *)&__int128 v10 = 138413058LL;
    __int128 v61 = v10;
    unint64_t v14 = 0x18C68B000uLL;
    uint64_t v62 = *(void *)v74;
    id v63 = v9;
    uint64_t v68 = a1 + 48;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)v11 + 8LL) + 40LL), *(id *)(*((void *)&v73 + 1) + 8 * v15));
        char v16 = [*(id *)(*(void *)(*(void *)v11 + 8) + 40) isEqualToString:@"StagedVolume"];
        __int128 v17 = @"MountedVolume";
        if ((v16 & 1) == 0)
        {
          char v18 = [*(id *)(*(void *)(*(void *)v11 + 8) + 40) isEqualToString:@"SystemVolume"];
          __int128 v17 = @"MountedVolume";
          if ((v18 & 1) == 0) {
            __int128 v17 = *(__CFString **)(*(void *)(*(void *)v11 + 8LL) + 40LL);
          }
        }

        uint64_t v19 = v17;
        [*(id *)(a1 + 32) objectForKeyedSubscript:v19];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v21 = v13;
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = *(void *)(*(void *)(*(void *)v11 + 8LL) + 40LL);
          if (v20)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0) {
              int v32 = [v20 BOOLValue];
            }
            else {
              int v32 = 0;
            }
          }

          else
          {
            int v32 = 1;
          }

          buf.st_dev = v61;
          *(void *)&buf.st_mode = v31;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v19;
          HIWORD(buf.st_gid) = 2112;
          *(void *)&buf.st_rdev = v20;
          LOWORD(buf.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&buf.st_atimespec.tv_sec + 2) = v32;
          _os_log_debug_impl( &dword_1861AC000,  (os_log_t)v13,  OS_LOG_TYPE_DEBUG,  "evaluate domain %@ (%@) option %@ check %d",  (uint8_t *)&buf,  0x26u);
          uint64_t v12 = v62;
        }

        if (!v20 || (objc_opt_respondsToSelector() & 1) != 0 && [v20 BOOLValue])
        {
          v65 = v19;
          objc_msgSend( *(id *)(v14 + 1904),  "objectForKeyedSubscript:",  *(void *)(*(void *)(*(void *)v11 + 8) + 40),  v61);
          __int128 v64 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 objectForKeyedSubscript:@"KPX"];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          id v23 = v22;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v70;
            while (2)
            {
              uint64_t v27 = 0LL;
              do
              {
                if (*(void *)v70 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void **)(*((void *)&v69 + 1) + 8 * v27);
                if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v30 = *(void *)(*(void *)(*(void *)v68 + 8LL) + 40LL);
                  buf.st_dev = 138412546;
                  *(void *)&buf.st_mode = v30;
                  WORD2(buf.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v28;
                  _os_log_debug_impl( &dword_1861AC000,  (os_log_t)v13,  OS_LOG_TYPE_DEBUG,  "checking domain %@ prefix '%@'",  (uint8_t *)&buf,  0x16u);
                }

                if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hasPrefix:v28])
                {
                  uint64_t v29 = [v28 length];
                  if (v29 == [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length]
                    || objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "characterAtIndex:",  objc_msgSend(v28, "length")) == 47)
                  {
                    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                      __OSASanitizePath_block_invoke_33_cold_1(v68, v38, v39, v40, v41, v42, v43, v44);
                    }
                    uint64_t v45 = objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "substringFromIndex:",  objc_msgSend(v28, "length"));
                    uint64_t v46 = *(void *)(*(void *)(a1 + 40) + 8LL);
                    id v47 = *(void **)(v46 + 40);
                    *(void *)(v46 + 40) = v45;

                    id v9 = v63;
                    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:@"StagedVolume"])
                    {
                      v48 = (void *)NSString;
                      v78[0] = v28;
                      v78[1] = @"System/Library/CoreServices/SystemVersion.plist";
                      [MEMORY[0x189603F18] arrayWithObjects:v78 count:2];
                      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
                      [v48 pathWithComponents:v49];
                      v50 = (void *)objc_claimAutoreleasedReturnValue();

                      if ([v50 length]
                        && (uint64_t v51 = (const char *)[v50 fileSystemRepresentation]) != 0)
                      {
                        int v52 = stat(v51, &buf);
                        id v53 = @"MountedVolume";
                        if (!v52) {
                          id v53 = @"SystemVolume";
                        }
                        v67 = v53;
                        id v35 = v53;
                        id v34 = v28;
                        [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:*(void *)(*(void *)(*(void *)v68 + 8) + 40)];
                        id v54 = (void *)objc_claimAutoreleasedReturnValue();
                        [v54 objectForKeyedSubscript:@"KPX"];
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        [v55 removeObject:v34];
                        [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:v35];
                        int v56 = (void *)objc_claimAutoreleasedReturnValue();

                        [v56 objectForKeyedSubscript:@"KPX"];
                        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

                        [v57 addObject:v34];
                        objc_storeStrong((id *)(*(void *)(*(void *)v68 + 8LL) + 40LL), v67);
                      }

                      else
                      {
                        id v34 = 0LL;
                        id v35 = 0LL;
                      }

                      v58 = v64;
                    }

                    else
                    {
                      id v34 = 0LL;
                      id v35 = 0LL;
                      v58 = v64;
                    }

                    __int128 v37 = v65;
                    goto LABEL_50;
                  }
                }

                ++v27;
              }

              while (v25 != v27);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v62;
          id v9 = v63;
          uint64_t v11 = a1 + 48;
          uint64_t v19 = v65;
          unint64_t v14 = 0x18C68B000LL;
        }

        ++v15;
      }

      while (v15 != v66);
      uint64_t v33 = [v9 countByEnumeratingWithState:&v73 objects:v80 count:16];
      uint64_t v66 = v33;
    }

    while (v33);
  }

  id v34 = 0LL;
  id v35 = 0LL;
  uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8LL);
  __int128 v37 = *(__CFString **)(v36 + 40);
  *(void *)(v36 + 40) = 0LL;
LABEL_50:

  v59 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v59)
  {
    if (v35) {
      [v59 isEqualToString:v35];
    }
  }

  else
  {
    else {
      v60 = @"UnknownType";
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v60);
  }
}

id getRuleForSpecifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    unsigned int v2 = 0;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v2 > 0x1F) {
        break;
      }
      ++v2;
      uint64_t v3 = getRules(v1);

      id v1 = (id)v3;
    }

    while (v3);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v4 = v1;
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = v4;

  return v5;
}

id getRules(void *a1)
{
  id v1 = a1;
  if (getRules_onceToken != -1) {
    dispatch_once(&getRules_onceToken, &__block_literal_global_77);
  }
  if (v1)
  {
    [(id)getRules_rules objectForKeyedSubscript:v1];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = (id)getRules_rules;
  }

  uint64_t v3 = v2;

  return v3;
}

uint64_t shouldMaskFile(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    a2 = [v3 BOOLValue] ^ 1;
  }

  return a2;
}

id getBundleTypes(void *a1, void *a2)
{
  id v3 = a2;
  [a1 objectForKeyedSubscript:@"@bundles"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v6 = v4, (isKindOfClass & 1) == 0)) {
    uint64_t v6 = v3;
  }
  id v7 = v6;

  return v7;
}

id getSubruleForSpecifier(void *a1, uint64_t a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    getRuleForSpecifier(v2);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t __getLocalHomeDirectories_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

uint64_t __getVolumes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

void __getRules_block_invoke()
{
  dispatch_queue_t v0 = (void *)getRules_rules;
  getRules_rules = (uint64_t)&unk_189E31C50;
}

void OUTLINED_FUNCTION_1_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_74:
      uint64_t v28 = v97;
      v60 = v96;
      goto LABEL_75;
    }

    [MEMORY[0x189603FB8] dataWithCapacity:1024];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (fread(__ptr, 1uLL, 1uLL, v17->_stream) && __ptr[0] != 10)
    {
      uint64_t v44 = 0;
      do
      {
        [v43 appendBytes:__ptr length:1];
        if (fread(__ptr, 1uLL, 1uLL, v17->_stream)) {
          uint64_t v45 = __ptr[0] == 10;
        }
        else {
          uint64_t v45 = 1;
        }
        if (v45) {
          break;
        }
      }

      while (v44++ < 0x3FF);
    }

    if (![v43 length])
    {
      if ((v21 & 1) != 0)
      {
LABEL_73:

        goto LABEL_74;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = *p_filepath;
        id v63 = *__error();
        *(_DWORD *)stat buf = 138412546;
        v110 = v62;
        v111 = 1024;
        LODWORD(st_size) = v63;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' rejected for submission: missing metadata (or fread errno %d)",  buf,  0x12u);
      }

      v102 = "rejected-header";
LABEL_68:
      if (v17->_metaData) {
        v78 = 1;
      }
      else {
        v78 = v21;
      }
      if ((v78 & 1) == 0)
      {
        fclose(v17->_stream);
        v17->_stream = 0LL;
      }

      goto LABEL_73;
    }

    id v47 = v39;
    v99 = 0LL;
    v48 = [MEMORY[0x1896078D8] JSONObjectWithData:v43 options:0 error:&v99];
    v94 = v99;
    uint64_t v49 = v17->_metaData;
    v17->_metaData = (NSDictionary *)v48;

    if (v17->_metaData)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v51 = v17->_metaData;
      if ((isKindOfClass & 1) != 0)
      {
        int v52 = -[NSDictionary objectForKey:](v51, "objectForKey:", @"bug_type");
        id v53 = v17->_bugType;
        v17->_bugType = (NSString *)v52;

        if ((v21 & 1) == 0)
        {
          filepath = v17->_filepath;
          uint64_t v92 = v17->_bugType;
          v55 = v101.st_size;
          [v16 objectForKeyedSubscript:@"<whitelist>"];
          int v56 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v55) = [v15 isFile:filepath validForSubmission:v92 reasonableSize:v55 to:v14 internalTypes:v56 result:&v102];

          if ((v55 & 1) == 0)
          {
            uint64_t v57 = v17->_metaData;
            v17->_metaData = 0LL;
          }
        }

LABEL_67:
        uint64_t v39 = v47;
        goto LABEL_68;
      }
    }

    else
    {
      uint64_t v51 = 0LL;
    }

    v17->_metaData = 0LL;

    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v77 = *p_filepath;
        *(_DWORD *)stat buf = 138412546;
        v110 = v77;
        v111 = 2112;
        st_size = (off_t)v94;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' rejected for submission: bad metadata (or json error %@)",  buf,  0x16u);
      }

      v102 = "rejected-metadata";
    }

    goto LABEL_67;
  }

  uint64_t v29 = *v23;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = v15;
    uint64_t v31 = *p_filepath;
    int v32 = *__error();
    *(_DWORD *)stat buf = 138412546;
    v110 = v31;
    uint64_t v15 = v30;
    v111 = 1024;
    LODWORD(st_size) = v32;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' failed to open (errno %d)",  buf,  0x12u);
  }

  v102 = "rejected-fopen";
  uint64_t v28 = a7;
  if (!v17->_stream)
  {
    if (v29 == 2)
    {
      uint64_t v13 = v98;
      if (a7)
      {
        uint64_t v33 = (void *)MEMORY[0x189607870];
        v104 = *MEMORY[0x1896075E0];
        v105 = @"File doesn't exist";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
        id v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 errorWithDomain:@"OSALog" code:1 userInfo:v34];
        *v97 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_89;
    }

    v58 = "rejected-fopen";
LABEL_84:
    if (v28)
    {
      __int16 v86 = (void *)MEMORY[0x189607870];
      v106[0] = *MEMORY[0x1896075E0];
      [NSString stringWithUTF8String:v58];
      int v87 = (void *)objc_claimAutoreleasedReturnValue();
      v106[1] = @"bug_type";
      v107[0] = v87;
      __int16 v88 = (const __CFString *)v17->_bugType;
      if (!v88) {
        __int16 v88 = @"<unknown>";
      }
      v107[1] = v88;
      [MEMORY[0x189603F68] dictionaryWithObjects:v107 forKeys:v106 count:2];
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 errorWithDomain:@"OSALog" code:2 userInfo:v89];
      *uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();

      v58 = v102;
    }

    uint64_t v13 = v98;
    -[OSALog retire:](v17, "retire:", v58);
LABEL_89:
    id v85 = v17;
    __int128 v17 = 0LL;
LABEL_90:

    goto LABEL_92;
  }

LABEL_78:
  v79 = v17->_metaData;
  if (!v79)
  {
    uint64_t v13 = v98;
    goto LABEL_92;
  }

  -[NSDictionary objectForKeyedSubscript:](v79, "objectForKeyedSubscript:", @"incident_id");
  id v80 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = v98;
  if (!v80)
  {
    uint64_t v81 = (NSDictionary *)-[NSDictionary mutableCopy](v17->_metaData, "mutableCopy");
    v82 = -[NSDictionary objectForKeyedSubscript:](v17->_metaData, "objectForKeyedSubscript:", @"incident_id");
    if (!v82)
    {
      [MEMORY[0x189607AB8] UUID];
      int v83 = (void *)objc_claimAutoreleasedReturnValue();
      [v83 UUIDString];
      __int16 v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v84, @"incident_id");
    }

    id v85 = v17->_metaData;
    v17->_metaData = v81;
    goto LABEL_90;
  }

LABEL_92:
  return v17;
}

void sub_1861C89E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

LABEL_103:
    objc_autoreleasePoolPop(context);
    goto LABEL_104;
  }

  id v35 = *(void *)&v131[8];
  obuint64_t j = *(id *)(*(void *)&v131[8] + 40LL);
  v115[0] = MEMORY[0x1895F87A8];
  v115[1] = 3221225472LL;
  v115[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke;
  v115[3] = &unk_189E20A78;
  v116 = v111;
  +[OSALog locallyCreateForSubmission:metadata:options:error:writing:]( &OBJC_CLASS___OSALog,  "locallyCreateForSubmission:metadata:options:error:writing:",  v10,  v15,  v14,  &obj,  v115);
  uint64_t v36 = (OSALog *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v35 + 40), obj);
  +[OSALog logObjForBugType:](&OBJC_CLASS___OSALog, "logObjForBugType:", v10);
  __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (v36) {
      uint64_t v38 = @"success";
    }
    else {
      uint64_t v38 = @"FAILED";
    }
    if (*(void *)(*(void *)&v131[8] + 40LL)) {
      [*(id *)(*(void *)&v131[8] + 40) localizedDescription];
    }
    else {
      -[OSALog filepath](v36, "filepath");
    }
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v130 = 138543874;
    *(void *)&v130[4] = v10;
    *(_WORD *)&v130[12] = 2112;
    *(void *)&v130[14] = v38;
    *(_WORD *)&v130[22] = 2114;
    *(void *)&v130[24] = v68;
    _os_log_impl( &dword_1861AC000,  v37,  OS_LOG_TYPE_DEFAULT,  "local log create type %{public}@ result %@: %{public}@",  v130,  0x20u);
  }

LABEL_104:
  if (a6)
  {
    v98 = *(void **)(*(void *)&v131[8] + 40LL);
    if (v98) {
      *a6 = v98;
    }
  }

  v99 = v36;
  _Block_object_dispose(v131, 8);

  return v99;
}

void sub_1861CA0E8(_Unwind_Exception *a1)
{
}

void sub_1861CA994(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1861CA9A4LL);
  }

  JUMPOUT(0x1861CA9BCLL);
}

LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    +[OSALog markDescriptor:forKey:withObj:].cold.1();
  }
LABEL_15:
}
}

  uint64_t v12 = v57;
  uint64_t v13 = end;
  result.end = v13;
  result.item = v12;
  return result;
}

    char v16 = @"Failed to find base path on which to create directories";
    goto LABEL_69;
  }

  id v9 = [v8 count];
  __int128 v10 = v9 - 1;
  if (v9 == 1)
  {
LABEL_9:
    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = 0LL;
  while (1)
  {
    uint64_t v12 = (void *)MEMORY[0x189604030];
    objc_msgSend(v8, "subarrayWithRange:", 0, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 fileURLWithPathComponents:v13];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = v14;
    uint64_t v15 = open((const char *)[v11 fileSystemRepresentation], 537919488);
    if ((v15 & 0x80000000) == 0)
    {
      uint64_t v19 = v15;
      goto LABEL_15;
    }

    if (*__error() != 2) {
      break;
    }
    if (!--v10)
    {

      goto LABEL_9;
    }
  }

  char v16 = @"Failed to open intermediate path";
LABEL_69:
  if (a4 && v16)
  {
    __int128 v72 = (void *)MEMORY[0x189607870];
    __int128 v73 = *MEMORY[0x1896075E0];
    v94[0] = v16;
    v93[0] = v73;
    v93[1] = @"errno";
    [MEMORY[0x189607968] numberWithInt:*__error()];
    __int128 v74 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v74;
    v93[2] = @"errstr";
    __int128 v75 = (void *)NSString;
    __int128 v76 = __error();
    [v75 stringWithUTF8String:strerror(*v76)];
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v77;
    [MEMORY[0x189603F68] dictionaryWithObjects:v94 forKeys:v93 count:3];
    v78 = v8;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    [v72 errorWithDomain:@"OSAFileOperations" code:2 userInfo:v79];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = v78;
  }

  return v16 == 0LL;
}

void osa_scanDir(const char *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a3;
  uint64_t v8 = a4;
  [NSString stringWithUTF8String:a1];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = opendir(a1);
  if (v9)
  {
    __int128 v10 = v9;
    uint64_t v11 = readdir(v9);
    if (v11)
    {
      uint64_t v12 = v11;
      do
      {
        uint64_t v13 = (void *)MEMORY[0x186E340A4]();
        d_name = v12->d_name;
        if (v12->d_name[0] != 46)
        {
          bzero(__str, 0x400uLL);
          snprintf(__str, 0x400uLL, "%s/%s", a1, v12->d_name);
          int d_type = v12->d_type;
          if (d_type == 4)
          {
            goto LABEL_19;
          }

          if (d_type == 8)
          {
            if ((a2 & 0xC0) != 0)
            {
              [v20 lastPathComponent];
              char v16 = (void *)objc_claimAutoreleasedReturnValue();
              unsigned int v17 = ((a2 & 0x80) == 0) ^ [v16 isEqualToString:@"Retired"];

              if ((a2 & 0x200) == 0 || (v17 & 1) == 0)
              {
                if (!v17) {
                  goto LABEL_19;
                }
LABEL_18:
                ((void (**)(id, const char *, char *))v7)[2](v7, a1, d_name);
                goto LABEL_19;
              }
            }

            else if ((a2 & 0x200) == 0)
            {
              goto LABEL_18;
            }
          }
        }

LABEL_11:
}

  unint64_t v14 = @"recently";
  return v14;
}

void sub_1861CCC50(_Unwind_Exception *a1)
{
}

LABEL_17:
}

  objc_autoreleasePoolPop(v4);
  if (!checkMCFeature_profileConnectionObj || !*a2) {
    return 0LL;
  }
  [(id)checkMCFeature_profileConnectionObj sharedConnection];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 effectiveBoolValueForSetting:*a2] == 1;

  return v9;
}

    if (!v62[5])
    {
      v51[0] = v27;
      v51[1] = 3221225472LL;
      v51[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3;
      v51[3] = &unk_189E210B8;
      v51[4] = self;
      v51[5] = &v61;
      v51[6] = &v55;
      v51[7] = a3;
      [v10 indexOfObjectPassingTest:v51];
      if (!v62[5])
      {
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_absolute_segment, 65));
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v40;
        [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v41;
        uint64_t v42 = [MEMORY[0x189603F18] arrayWithObjects:v67 count:2];
        uint64_t v43 = (void *)v62[5];
        v62[5] = v42;

        if (v11)
        {
          v50[0] = v27;
          v50[1] = 3221225472LL;
          v50[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4;
          v50[3] = &unk_189E210E0;
          v50[4] = &v55;
          v50[5] = a3;
          [v11 indexOfObjectPassingTest:v50];
        }
      }
    }

LABEL_14:
  if ([v7 count])
  {
    [v5 objectForKeyedSubscript:@"exclude-retired"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 BOOLValue];

    if ((v20 & 1) != 0)
    {
      id v21 = 68LL;
    }

    else
    {
      [v5 objectForKeyedSubscript:@"only-retired"];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v23 = [v22 BOOLValue];

      if (v23) {
        id v21 = 132LL;
      }
      else {
        id v21 = 4LL;
      }
    }

    id v34 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", @"only-urgent", v8);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 BOOLValue];

    uint64_t v45 = 0u;
    uint64_t v43 = 0u;
    uint64_t v44 = 0u;
    if (v25) {
      uint64_t v26 = v21 | 0x200;
    }
    else {
      uint64_t v26 = v21;
    }
    uint64_t v42 = 0uLL;
    obuint64_t j = v7;
    uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      uint64_t v30 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v28; ++i)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(obj);
          }
          int v32 = (const char *)[*(id *)(*((void *)&v42 + 1) + 8 * i) fileSystemRepresentation];
          v40[0] = v30;
          v40[1] = 3221225472LL;
          v40[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke;
          v40[3] = &unk_189E20C78;
          uint64_t v41 = v37;
          v38[0] = v30;
          v38[1] = 3221225472LL;
          v38[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2;
          v38[3] = &__block_descriptor_41_e13_B24__0r_8r_16l;
          v38[4] = v26;
          uint64_t v39 = v36;
          osa_scanDir(v32, v26, v40, v38);
        }

        uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }

      while (v28);
    }

    id v5 = v34;
    uint64_t v8 = v33;
  }

  objc_autoreleasePoolPop(v6);
}

  uint64_t v24 = [v11 length];
  if (a5 && v24)
  {
    if (!v13) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.1();
    }
    [v13 signatures];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 objectForKeyedSubscript:v11];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      [v26 objectForKeyedSubscript:@"dupes"];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:a5];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = (void *)[v28 copy];
      [v27 addObject:v29];

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.3();
      }
    }

    else
    {
      v37[0] = @"original";
      [NSString stringWithUTF8String:a5];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      id v34 = (void *)[v35 copy];
      v37[1] = @"dupes";
      v38[0] = v34;
      uint64_t v33 = (void *)[MEMORY[0x189604A58] mutableCopy];
      v38[1] = v33;
      [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:2];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = (void *)[v30 mutableCopy];
      [v13 signatures];
      int v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 setObject:v31 forKeyedSubscript:v11];

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.2();
      }
    }
  }
}

void OUTLINED_FUNCTION_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_8_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1861CE554( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, id location, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1861CF7BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1861CF9E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1861D017C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t checkMCFeature(const char *a1, id *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x186E340A4]();
  if (checkMCFeature_dylib_handle
    || (checkMCFeature_dylib_handle = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration",  4)) != 0)
  {
    if (!checkMCFeature_profileConnectionObj)
    {
      checkMCFeature_profileConnectionObuint64_t j = (uint64_t)objc_getClass("MCProfileConnection");
      if (!checkMCFeature_profileConnectionObj && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unable to find class MCProfileConnection",  (uint8_t *)&v11,  2u);
      }
    }

    if (*a2) {
      goto LABEL_17;
    }
    id v5 = (id *)dlsym((void *)checkMCFeature_dylib_handle, a1);
    if (v5)
    {
      objc_storeStrong(a2, *v5);
      goto LABEL_17;
    }

    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v11 = 136315138;
    uint64_t v12 = (char *)a1;
    unint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v7 = "Unable to load symbol %s";
LABEL_16:
    _os_log_impl(&dword_1861AC000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);
    goto LABEL_17;
  }

  if (MGGetBoolAnswer() && !os_variant_is_recovery())
  {
    objc_autoreleasePoolPop(v4);
    return 1LL;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = dlerror();
    unint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v7 = "Unable to load ManagedConfiguration dylib ('%s')";
    goto LABEL_16;
  }

uint64_t isInternal()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t seedFeedbackPromptingEnabled()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result) {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t OSAIsACDCDevice()
{
  if (OSAIsACDCDevice_onceToken != -1) {
    dispatch_once(&OSAIsACDCDevice_onceToken, &__block_literal_global_6);
  }
  return OSAIsACDCDevice_isACDCDevice;
}

void __OSAIsACDCDevice_block_invoke()
{
  if (os_variant_is_darwinos() && MGGetSInt32Answer() == 12)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v0 = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Device is an ACDC compute module",  v0,  2u);
    }

    OSAIsACDCDevice_isACDCDevice = 1;
  }

void sub_1861D2BB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_2:
  uint64_t v14 = (id)v2;
  [MEMORY[0x189603FE8] null];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = [v14 isEqual:v3];

  if ((v4 & 1) != 0)
  {
LABEL_6:
    [MEMORY[0x189603FE8] null];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 40) + 64) setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];

    goto LABEL_7;
  }

  id v5 = -[OSABinaryImageSegment initWithSymbol:](objc_alloc(&OBJC_CLASS___OSABinaryImageSegment), "initWithSymbol:", v14);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 4_Block_object_dispose(va, 8) = v5;

  [*(id *)(*(void *)(a1 + 40) + 64) setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
LABEL_7:
}

LABEL_21:
    if (a6) {
      *a6 = v56[5];
    }

    uint64_t v22 = (void *)v62[5];
  }

  uint64_t v44 = v22;
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v44;
}

void sub_1861D3D3C(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void runCrashMoverService(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Gathering non-mobile logs via crash_mover",  buf,  2u);
  }

  dispatch_get_global_queue(0LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v3 = dispatch_group_create();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __runCrashMoverService_block_invoke;
  block[3] = &unk_189E20268;
  id v4 = v1;
  id v7 = v4;
  dispatch_group_async(v3, v2, block);
  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_group_wait(v3, v5) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "crash_mover is taking too long!", buf, 2u);
  }
}

void __runCrashMoverService_block_invoke(uint64_t a1)
{
  void v19[2] = *MEMORY[0x1895F89C0];
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0LL, 0LL);
  id v3 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_8);
    xpc_connection_resume(v3);
    v18[0] = @"Extensions";
    v18[1] = @"options";
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      uint64_t v4 = MEMORY[0x189604A58];
    }
    v19[0] = &unk_189E31DC0;
    v19[1] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];
    dispatch_time_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v3, v5);
    uint64_t v7 = MEMORY[0x186E34734]();
    if (v7 == MEMORY[0x1895F9268])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1895F91B0]);
        int v16 = 136315138;
        unsigned int v17 = string;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "crash_mover service FAILED with XPC error: %s",  (uint8_t *)&v16,  0xCu);
      }

      goto LABEL_19;
    }

    if (v7 != MEMORY[0x1895F9250])
    {
LABEL_19:

      goto LABEL_20;
    }

    xpc_dictionary_get_value(v6, "Success");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8;
    if (v8)
    {
      BOOL value = xpc_BOOL_get_value(v8);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = "FAILED";
        if (value) {
          int v11 = "succeeded";
        }
        int v16 = 136315138;
        unsigned int v17 = v11;
        uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v13 = "crash_mover service %s";
        uint32_t v14 = 12;
        goto LABEL_17;
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v13 = "crash_mover service returned ambiguous response, assuming failure";
      uint32_t v14 = 2;
LABEL_17:
      _os_log_impl(&dword_1861AC000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v14);
    }

    goto LABEL_19;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "crash_mover service FAILED to connect",  (uint8_t *)&v16,  2u);
  }

void __runCrashMoverService_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  if (MEMORY[0x186E34734]() == MEMORY[0x1895F9268]
    && v2 != (id)MEMORY[0x1895F91A0]
    && v2 != (id)MEMORY[0x1895F9198]
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1895F91B0]);
    int v7 = 136315138;
    uint64_t v8 = string;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "crash_mover service FAILED on setup: %s",  (uint8_t *)&v7,  0xCu);
  }
}

void logForAppleCare(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x186E340A4]();
  if ([v3 count])
  {
    initR3();
    dispatch_time_t v5 = (void *)qword_18C4A2410;
    [v3 objectAtIndexedSubscript:0];
    xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = openR3((uint64_t)&initR3_r3, [v5 containsObject:v6], a2);

    if ((v7 & 0x80000000) == 0)
    {
      uint64_t v8 = (void *)NSString;
      OSADateFormat(0, a2);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 componentsJoinedByString:@","];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"%@,%@\n", v9, v10];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();

      [v11 dataUsingEncoding:4 allowLossyConversion:1];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
        write(v7, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          logForAppleCare_cold_1(v3);
        }
      }
    }

    close(v7);
  }

  objc_autoreleasePoolPop(v4);
}

void initR3()
{
  initR3_r3 = (int)time(0LL) / 86400;
  if (initR3_onceToken != -1) {
    dispatch_once(&initR3_onceToken, &__block_literal_global_9);
  }
}

uint64_t openR3(uint64_t a1, char a2, double a3)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v5 = 0xFFFFFFFFLL;
  int v24 = -1;
  xpc_object_t v6 = *(void **)(a1 + 16);
  if (v6)
  {
    id v8 = [v6 stringByAppendingPathComponent:@"general.log"];
    uint64_t v9 = (char *)[v8 fileSystemRepresentation];
    mode_t v10 = umask(0);
    if (lstat(v9, &v20) < 0)
    {
      if (*__error() == 2)
      {
        int R3 = createR3(a1, v9, a3, a3);
        *((_DWORD *)v22 + 6) = R3;
      }
    }

    else if ((v20.st_mode & 0xF000) == 0x8000 && v20.st_nlink == 1 && v20.st_uid == *(_DWORD *)(a1 + 4))
    {
      if (v20.st_uid) {
        int v11 = 384;
      }
      else {
        int v11 = 420;
      }
      if ((v20.st_mode & 0xFFF) == v11)
      {
        uint64_t v12 = dispatch_queue_create("com.apple.osanalytics.AppleCareSupport.open", 0LL);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __openR3_block_invoke;
        block[3] = &unk_189E21158;
        void block[4] = &v21;
        block[5] = v9;
        stat v16 = v20;
        double v17 = a3;
        uint64_t v18 = a1;
        char v19 = a2;
        dispatch_sync(v12, block);
      }
    }

    umask(v10);

    uint64_t v5 = *((unsigned int *)v22 + 6);
  }

  _Block_object_dispose(&v21, 8);
  return v5;
}

void sub_1861D5174(_Unwind_Exception *a1)
{
}

uint64_t logEventForAppleCare(void *a1)
{
  id v1 = a1;
  double Current = CFAbsoluteTimeGetCurrent();
  logForAppleCare(v1, Current);

  return 0LL;
}

void logLineForAppleCare(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = (id)[objc_alloc(NSString) initWithUTF8String:a1];
  uint64_t v5 = (void *)[objc_alloc(NSString) initWithUTF8String:a2];
  xpc_object_t v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v7, v5, 0);
  logForAppleCare(v6, a3);
}

void rollAppleCareLogs()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x186E340A4]();
  initR3();
  id v9 = 0LL;
  int v4 = initR3_r3;
  id v8 = (id)qword_18C4A2408;
  uid_t v5 = getuid();
  gid_t v6 = getgid();
  id v7 = @"/Library/Logs/AppleSupport/";

  double Current = CFAbsoluteTimeGetCurrent();
  int v2 = openR3((uint64_t)&initR3_r3, 0, Current);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  if (!v5)
  {
    int v3 = openR3((uint64_t)&v4, 0, Current);
    if ((v3 & 0x80000000) == 0) {
      close(v3);
    }
  }

  purgeR3Logs((uint64_t)&initR3_r3);
  if (!v5) {
    purgeR3Logs((uint64_t)&v4);
  }

  objc_autoreleasePoolPop(v0);
}

void sub_1861D5358(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void purgeR3Logs(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    int v3 = (const char *)[v2 fileSystemRepresentation];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      purgeR3Logs_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
    int v11 = opendir(v3);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = readdir(v11);
      if (v13)
      {
        uint64_t v15 = v13;
        *(void *)&__int128 v14 = 67109634LL;
        __int128 v28 = v14;
        do
        {
          d_name = v15->d_name;
          objc_msgSend(NSString, "stringWithUTF8String:", v15->d_name, v28);
          double v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 rangeOfString:@"general.*\\.log" options:1024];

          if (v15->d_type == 8 && v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int value = 0;
            stat v20 = *(void **)(a1 + 16);
            [NSString stringWithUTF8String:v15->d_name];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            id v22 = [v20 stringByAppendingPathComponent:v21];
            uint64_t v23 = (const char *)[v22 fileSystemRepresentation];

            getxattr(v23, "Day_Seq", &value, 4uLL, 0, 0);
            if (value <= *(_DWORD *)a1 - 14)
            {
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                int v24 = *(_DWORD *)a1 - value;
                if (v24 >= 365) {
                  int v24 = -1;
                }
                *(_DWORD *)stat buf = v28;
                int v31 = 14;
                __int16 v32 = 1024;
                *(_DWORD *)uint64_t v33 = v24;
                *(_WORD *)&v33[4] = 2080;
                *(void *)&v33[6] = d_name;
                _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: purging old (limit %d vs actual %d) %s",  buf,  0x18u);
              }

              unlink(v23);
            }
          }

          uint64_t v15 = readdir(v12);
        }

        while (v15);
      }

      closedir(v12);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *__error();
      uint64_t v26 = __error();
      uint64_t v27 = strerror(*v26);
      *(_DWORD *)stat buf = 67109634;
      int v31 = v25;
      __int16 v32 = 2080;
      *(void *)uint64_t v33 = v3;
      *(_WORD *)&v33[8] = 2080;
      *(void *)&v33[10] = v27;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR[%d] scanning '%s', %s",  buf,  0x1Cu);
    }
  }

void __destructor_8_s16_s24_s32(id *a1)
{
}

void __initR3_block_invoke()
{
  qword_18C4A23F4 = 0LL;
  dispatch_queue_t v0 = getpwnam("mobile");
  if (v0)
  {
    qword_18C4A23F4 = *(void *)&v0->pw_uid;
    [NSString stringWithUTF8String:v0->pw_dir];
    id v1 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"/Library/Logs/AppleSupport/"];
    int v3 = (void *)unk_18C4A2400;
    unk_18C4A2400 = v2;
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR unable to intialize data",  v9,  2u);
  }

  endpwent();
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 buildVersion];
  uint64_t v6 = (void *)qword_18C4A2408;
  qword_18C4A2408 = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x189604010]) initWithArray:&unk_189E31DD8];
  uint64_t v8 = (void *)qword_18C4A2410;
  qword_18C4A2410 = v7;
}

uint64_t createR3(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  double v34 = a4;
  double value = a3;
  uint64_t v6 = 384LL;
  if (!*(_DWORD *)(a1 + 4)) {
    uint64_t v6 = 420LL;
  }
  uint64_t v7 = open_dprotected_np(a2, 2594, 4, 0, v6);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v29 = *__error();
      uint64_t v30 = __error();
      int v31 = strerror(*v30);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)uint64_t v39 = v29;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = a2;
      __int16 v40 = 2080;
      uint64_t v41 = v31;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR[%d] failed to create %s, %s",  buf,  0x1Cu);
    }
  }

  else
  {
    uid_t v9 = *(_DWORD *)(a1 + 4);
    if (v9) {
      fchown(v7, v9, *(_DWORD *)(a1 + 8));
    }
    uint64_t v10 = (const char *)[*(id *)(a1 + 24) UTF8String];
    if (!v10
      || (int v11 = v10, !*v10)
      || (size_t v12 = strlen(v10), fsetxattr(v8, "Version", v11, v12, 0, 0))
      || fsetxattr(v8, "Install", &value, 8uLL, 0, 0)
      || fsetxattr(v8, "Upgrade", &v34, 8uLL, 0, 0)
      || fsetxattr(v8, "Day_Seq", (const void *)a1, 4uLL, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        __int128 v14 = __error();
        uint64_t v15 = strerror(*v14);
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)uint64_t v39 = v13;
        *(_WORD *)&v39[4] = 2080;
        *(void *)&v39[6] = a2;
        __int16 v40 = 2080;
        uint64_t v41 = v15;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR[%d] setting xattrs on %s, %s",  buf,  0x1Cu);
      }
    }

    stat v16 = (__CFString *)MGCopyAnswer();
    v36[0] = @"report";
    v36[1] = @"version";
    v37[0] = @"Device Software Diagnostic Log";
    v37[1] = &unk_189E30B00;
    v36[2] = @"os_build";
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    double v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 productNameVersionBuildString];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    v36[3] = @"model";
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 modelCode];
    uint64_t v21 = (void *)v20;
    id v22 = @"<no_sn>";
    if (v16) {
      id v22 = v16;
    }
    v37[3] = v20;
    v37[4] = v22;
    v36[4] = @"serial";
    v36[5] = @"installed";
    OSADateFormat(0, value);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v23;
    v36[6] = @"updated";
    OSADateFormat(0, v34);
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:7];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();

    id v33 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v25 options:0 error:&v33];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = v33;
    id v28 = v26;
    write(v8, (const void *)[v28 bytes], objc_msgSend(v28, "length"));
    write(v8, "\n", 1uLL);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)uint64_t v39 = a2;
      _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: new %s", buf, 0xCu);
    }
  }

  return v8;
}

void __openR3_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (const char **)(a1 + 40);
  *(_DWORD *)(*((void *)*(v2 - 1) + 1) + 24LL) = open(*(const char **)(a1 + 40), 42);
  int v3 = *(_DWORD *)(*((void *)*(v2 - 1) + 1) + 24LL);
  if (v3 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *__error();
      int v11 = *v2;
      size_t v12 = __error();
      int v13 = strerror(*v12);
      v35.st_dev = 67109634;
      *(_DWORD *)&v35.st_mode = v10;
      LOWORD(v35.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v35.st_ino + 2) = (__darwin_ino64_t)v11;
      HIWORD(v35.st_uid) = 2080;
      *(void *)&v35.st_gid = v13;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR[%d] opening %s, %s",  (uint8_t *)&v35,  0x1Cu);
    }
  }

  else
  {
    if (fstat(v3, &v35)
      && v35.st_nlink == *(unsigned __int16 *)(a1 + 54)
      && v35.st_uid == *(_DWORD *)(a1 + 64)
      && v35.st_mode == *(unsigned __int16 *)(a1 + 52)
      && v35.st_ino == *(void *)(a1 + 56)
      && v35.st_dev == *(_DWORD *)(a1 + 48))
    {
LABEL_22:
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -1;
      return;
    }

    value[0] = *(_OWORD *)"<legacy>";
    memset(&value[1], 0, 48);
    unsigned int v31 = 0;
    double v29 = *(double *)(a1 + 192);
    double v30 = v29;
    ssize_t v4 = fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "Version", value, 0x3FuLL, 0, 0);
    if (v4 >= 1) {
      *((_BYTE *)value + v4) = 0;
    }
    uint64_t v5 = *(void **)(*(void *)(a1 + 200) + 24LL);
    [NSString stringWithUTF8String:value];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v5 isEqualToString:v6];

    fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "Day_Seq", &v31, 4uLL, 0, 0);
    fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "Install", &v30, 8uLL, 0, 0);
    if (v7) {
      fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), "Upgrade", &v29, 8uLL, 0, 0);
    }
    int v8 = **(_DWORD **)(a1 + 200);
    BOOL v9 = v31 == v8 || v8 <= 0;
    if (!v9 || v7 != 1)
    {
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      __int128 v14 = *(void **)(*(void *)(a1 + 200) + 16LL);
      objc_msgSend(NSString, "stringWithFormat:", @"general-%d-%s.log", v31, value);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByAppendingPathComponent:v15];
      stat v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        v33[0] = v16;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: rolling log -> %@",  buf,  0xCu);
      }

      double v17 = *v2;
      id v18 = v16;
      if (rename(v17, (const char *)[v18 fileSystemRepresentation]))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = *__error();
          uint64_t v20 = __error();
          uint64_t v21 = strerror(*v20);
          *(_DWORD *)stat buf = 67109378;
          LODWORD(v33[0]) = v19;
          WORD2(v33[0]) = 2080;
          *(void *)((char *)v33 + 6) = v21;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AppleCareSupport: ERROR[%d] rename failed, %s",  buf,  0x12u);
        }

        unlink(*v2);
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = createR3( *(void *)(a1 + 200),  *(char **)(a1 + 40),  v30,  v29);
    }

    else
    {
      if (*(_BYTE *)(a1 + 208) && v35.st_size > 307200)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "AppleCareSupport: WARN: limit exceeded, ignoring event",  buf,  2u);
        }

        goto LABEL_22;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __openR3_block_invoke_cold_1((uint64_t)v2, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }

LABEL_73:
            break;
          }

          uint64_t v57 = v8;
          break;
        default:
          goto LABEL_75;
      }

LABEL_75:
      int v8 = (kcdata_item_t)(v10 + v8->size);
      int v10 = (unint64_t)&v8[1];
    }

    while (&v8[1] <= end);
  }

__CFString *OSACPUTypeToString(uint64_t a1)
{
  id v1 = @"X86-64";
  if ((int)a1 <= 16777222)
  {
    if ((_DWORD)a1 != 7)
    {
      if ((_DWORD)a1 == 12) {
        return @"ARM";
      }
LABEL_10:
      objc_msgSend(NSString, "stringWithFormat:", @"%08X", a1);
      id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  else if ((_DWORD)a1 != 16777223)
  {
    if ((_DWORD)a1 == 16777228) {
      return @"ARM-64";
    }
    if ((_DWORD)a1 == 33554444) {
      return @"ARM64_32";
    }
    goto LABEL_10;
  }

  return v1;
}

uint64_t OSASafeRemoveFile(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __OSASafeRemoveFile_block_invoke;
  v4[3] = &unk_189E21180;
  v4[4] = &v5;
  v4[5] = a2;
  OSASafeOpen(a1, 0, 0, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1861D7320( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t OSASafeOpenReadOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 0, 0, a2);
}

uint64_t __OSASafeRemoveFile_block_invoke(uint64_t a1, int a2)
{
  uint64_t result = unlinkat(a2, *(const char **)(a1 + 40), 0);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result == 0;
  return result;
}

uint64_t OSASafeRemoveFileAtURL(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  [v3 URLByDeletingLastPathComponent];
  ssize_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v5 isAllowed:v6 forDomain:@"cleanup_paths"];

  if (v7)
  {
    [MEMORY[0x1896078A8] defaultManager];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 removeItemAtURL:v3 error:a2];
  }

  else
  {
    id v10 = [v3 lastPathComponent];
    uint64_t v11 = [v10 fileSystemRepresentation];

    uint64_t v12 = OSASafeRemoveFile([v4 fileSystemRepresentation], v11);
    uint64_t v9 = v12;
    if (a2 && (v12 & 1) == 0)
    {
      int v13 = (void *)MEMORY[0x189607870];
      uint64_t v19 = *MEMORY[0x1896075E0];
      __int128 v14 = (void *)NSString;
      uint64_t v15 = __error();
      [v14 stringWithUTF8String:strerror(*v15)];
      stat v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      double v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:@"OSAFileOperations" code:0 userInfo:v17];
      *a2 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v9 = 0LL;
    }
  }

  return v9;
}

uint64_t OSASafeMoveItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  _OWORD v6[2] = __OSASafeMoveItem_block_invoke;
  v6[3] = &unk_189E211D0;
  v6[4] = &v7;
  v6[5] = a3;
  v6[6] = a2;
  v6[7] = a4;
  OSASafeOpen(a1, 0, 0, v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1861D75E8(_Unwind_Exception *a1)
{
}

uint64_t __OSASafeMoveItem_block_invoke(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __OSASafeMoveItem_block_invoke_2;
  v4[3] = &unk_189E211A8;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  int v6 = a2;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  return OSASafeOpen(v2, 0, 0, v4);
}

uint64_t __OSASafeMoveItem_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = renameatx_np(*(_DWORD *)(a1 + 56), *(const char **)(a1 + 40), a2, *(const char **)(a1 + 48), 4u);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result == 0;
  return result;
}

uint64_t OSASafeMoveItemAtURL(void *a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a1;
  id v7 = [v6 URLByDeletingLastPathComponent];
  uint64_t v8 = [v7 fileSystemRepresentation];

  [v6 lastPathComponent];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = v9;
  uint64_t v11 = [v10 fileSystemRepresentation];

  id v12 = [v5 URLByDeletingLastPathComponent];
  uint64_t v13 = [v12 fileSystemRepresentation];

  [v5 lastPathComponent];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = v14;
  uint64_t v16 = [v15 fileSystemRepresentation];

  uint64_t v17 = OSASafeMoveItem(v8, v11, v13, v16);
  uint64_t v18 = v17;
  if (a3 && (v17 & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v25 = *MEMORY[0x1896075E0];
    uint64_t v20 = (void *)NSString;
    uint64_t v21 = __error();
    [v20 stringWithUTF8String:strerror(*v21)];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 errorWithDomain:@"OSAFileOperations" code:0 userInfo:v23];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

uint64_t OSASafeOpen(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = open((const char *)a1, a2 | 0x20000000, a3);
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t v9 = v8;
      memset(&v29, 0, sizeof(v29));
      if (fstat(v8, &v29))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          OSASafeOpen_cold_2(a1, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      else
      {
        int v17 = v29.st_mode & 0xF000;
        BOOL v19 = v17 == 0x8000 && v29.st_nlink == 1;
        if (v17 == 0x4000 || v19)
        {
          if (v7)
          {
            v7[2](v7, v9);
            a1 = 1LL;
            goto LABEL_22;
          }

          a1 = 0LL;
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_WORD *)stat buf = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Path was safe to open, but no block was provided",  buf,  2u);
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          OSASafeOpen_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);
        }
      }

      a1 = 0LL;
LABEL_22:
      close(v9);
      goto LABEL_23;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      OSASafeOpen_cold_3(a1);
    }
    goto LABEL_10;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29.st_dev) = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Skipping safe open because no path was provided",  (uint8_t *)&v29,  2u);
LABEL_10:
    a1 = 0LL;
  }

LABEL_23:
  return a1;
}

    mach_msg_destroy(&msg);
    return v8;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

uint64_t OSASafeOpenWriteOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 513, 0x1A4u, a2);
}

BOOL OSASafeCreateDirectory(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  id v6 = a1;
  id v7 = a3;
  [v6 pathComponents];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v8 count] < 2)
  {
    uint64_t v16 = @"Too few path components";
    goto LABEL_69;
  }

  if (![v7 createIntermediates])
  {
    [v6 URLByDeletingLastPathComponent];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v8 count];
    id v18 = [v6 URLByDeletingLastPathComponent];
    int v19 = open((const char *)[v18 fileSystemRepresentation], 537919488);

    if ((v19 & 0x80000000) == 0)
    {
      unint64_t v10 = v17 - 1;
LABEL_15:
      id v20 = objc_alloc_init(MEMORY[0x189607978]);
      [v20 setUsesSignificantDigits:1];
      id v85 = v20;
      [v20 setMaximumSignificantDigits:2];
      if (v10 >= [v8 count])
      {
        uint64_t v16 = 0LL;
      }

      else
      {
        uint64_t v81 = a4;
        v82 = v6;
        int v21 = a2;
        int v83 = v8;
        id v84 = v7;
        while (1)
        {
          id v22 = [v8 objectAtIndex:v10];
          uint64_t v23 = (const char *)[v22 fileSystemRepresentation];

          uint64_t v24 = (void *)MEMORY[0x189604030];
          objc_msgSend(v8, "subarrayWithRange:", 0, ++v10);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 fileURLWithPathComponents:v25];
          __int16 v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (mkdirat(v19, v23, a2 & 0x1B6))
          {
            uint64_t v16 = @"Failed to create directory";
            goto LABEL_66;
          }

          int v26 = openat(v19, v23, 537919488);
          if (v26 < 0) {
            break;
          }
          int v27 = v26;
          close(v19);
          memset(&v92, 0, sizeof(v92));
          if (fstat(v27, &v92))
          {
            uint64_t v28 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
              [v82 path];
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v37 = __error();
              uint64_t v38 = strerror(*v37);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v36;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
              _os_log_error_impl( &dword_1861AC000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to stat %{public}@ when checking group ownership: %s",  (uint8_t *)&buf,  0x16u);
            }

            int v29 = 0;
            int v30 = 0;
          }

          else
          {
            uint64_t v28 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (v92.st_mode == v21) {
              goto LABEL_31;
            }
            int v31 = fchmod(v27, v21);
            if (v31 == -1 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              [v82 path];
              __int128 v69 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v70 = __error();
              __int128 v71 = strerror(*v70);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v69;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v71;
              _os_log_error_impl( &dword_1861AC000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to modify permissions while creating %{public}@: %s",  (uint8_t *)&buf,  0x16u);
            }

            if (v21 != 504)
            {
LABEL_31:
              int v86 = 0;
            }

            else
            {
              __int16 v32 = v28;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                int st_mode = v92.st_mode;
                if (v31)
                {
                  double v34 = __error();
                  stat v35 = strerror(*v34);
                }

                else
                {
                  stat v35 = "";
                }

                buf.st_dev = 138544386;
                *(void *)&buf.int st_mode = v88;
                WORD2(buf.st_ino) = 1024;
                *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
                HIWORD(buf.st_uid) = 1024;
                buf.gid_t st_gid = 504;
                LOWORD(buf.st_rdev) = 1024;
                *(dev_t *)((char *)&buf.st_rdev + 2) = v31 == 0;
                *((_WORD *)&buf.st_rdev + 3) = 2082;
                buf.st_atimespec.tv_sec = (__darwin_time_t)v35;
                _os_log_impl( &dword_1861AC000,  v28,  OS_LOG_TYPE_DEFAULT,  "=== Attempted change perms on new dir: %{public}@ from 0x%X to 0x%X with result %d %{public}s",  (uint8_t *)&buf,  0x28u);
              }

              int v86 = 1;
            }

            [v7 userID];
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 groupID];
            __int16 v40 = (void *)objc_claimAutoreleasedReturnValue();
            stat buf = v92;
            BOOL v41 = OSASetOwnership(v27, (uint64_t)&buf, v39, v40);

            dev_t v42 = v41;
            if (!v41 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              [v82 path];
              uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = __error();
              uint64_t v68 = strerror(*v67);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v66;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v68;
              _os_log_error_impl( &dword_1861AC000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to set ownership while creating %{public}@: %s",  (uint8_t *)&buf,  0x16u);
            }

            [v7 groupID];
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
            int v44 = [v43 unsignedIntValue];
            gid_t st_gid = v92.st_gid;

            int v30 = 0;
            if (v44 == 250)
            {
              int v29 = v86;
              if (st_gid != 250)
              {
                uint64_t v46 = v28;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  gid_t v47 = v92.st_gid;
                  v48 = "";
                  if ((v42 & 1) == 0)
                  {
                    uint64_t v49 = __error();
                    v48 = strerror(*v49);
                  }

                  buf.st_dev = 138544386;
                  *(void *)&buf.int st_mode = v88;
                  WORD2(buf.st_ino) = 1024;
                  *(_DWORD *)((char *)&buf.st_ino + 6) = v47;
                  HIWORD(buf.st_uid) = 1024;
                  buf.gid_t st_gid = 250;
                  LOWORD(buf.st_rdev) = 1024;
                  *(dev_t *)((char *)&buf.st_rdev + 2) = v42;
                  *((_WORD *)&buf.st_rdev + 3) = 2082;
                  buf.st_atimespec.tv_sec = (__darwin_time_t)v48;
                  _os_log_impl( &dword_1861AC000,  v28,  OS_LOG_TYPE_DEFAULT,  "=== Attempted change gid on new dir: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s",  (uint8_t *)&buf,  0x28u);
                }

                int v30 = 1;
              }

              int v21 = a2;
            }

            else
            {
              int v29 = v86;
              int v21 = a2;
            }
          }

          if ([v7 fileProtectionNone]
            && fcntl(v27, 63) != 4
            && fcntl(v27, 64, 4LL) == -1
            && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            OSASafeCreateDirectory_cold_1(v95, v82, &v96);
          }

          if ((v29 | v30) == 1)
          {
            getprogname();
            OSAGetBootTime();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              uint64_t v51 = (void *)MEMORY[0x189607968];
              [MEMORY[0x189603F50] date];
              int v52 = (void *)objc_claimAutoreleasedReturnValue();
              [v52 timeIntervalSinceDate:v50];
              objc_msgSend(v51, "numberWithDouble:");
              id v53 = (void *)objc_claimAutoreleasedReturnValue();
              [v85 stringForObjectValue:v53];
              id v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v54 = @"-1";
            }

            OSAGetProcessUptime();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {
              int v56 = (void *)MEMORY[0x189607968];
              [MEMORY[0x189603F50] date];
              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
              [v57 timeIntervalSinceDate:v55];
              objc_msgSend(v56, "numberWithDouble:");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              [v85 stringForObjectValue:v58];
              v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v59 = @"-1";
            }

            [v11 path];
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            [v88 path];
            __int128 v61 = (void *)objc_claimAutoreleasedReturnValue();
            int v91 = v59;
            v89 = v60;
            __int16 v90 = v54;
            uint64_t v62 = v59;
            id v63 = v54;
            id v64 = v61;
            id v65 = v60;
            AnalyticsSendEventLazy();

            uint64_t v8 = v83;
            id v7 = v84;
            int v21 = a2;
          }

          int v19 = v27;
          if (v10 >= [v8 count])
          {
            uint64_t v16 = 0LL;
            int v19 = v27;
            goto LABEL_67;
          }
        }

        uint64_t v16 = @"Failed to open newly created directory";
LABEL_66:

LABEL_67:
        id v6 = v82;
        a4 = v81;
      }

      close(v19);

      goto LABEL_69;
    }

BOOL OSASetOwnership(int a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && (int v9 = *(_DWORD *)(a2 + 16), v9 != [v7 unsignedIntValue]))
  {
    id v10 = v7;
    if (!v8) {
      goto LABEL_7;
    }
  }

  else
  {
    id v10 = 0LL;
    if (!v8) {
      goto LABEL_7;
    }
  }

  int v11 = *(_DWORD *)(a2 + 20);
  if (v11 != [v8 unsignedIntValue])
  {
    id v14 = v8;
    if (v10) {
      uid_t v12 = [v10 unsignedIntValue];
    }
    else {
      uid_t v12 = -1;
    }
    gid_t v13 = [v14 unsignedIntValue];

    goto LABEL_14;
  }

LABEL_7:
  if (v10)
  {
    uid_t v12 = [v10 unsignedIntValue];
    gid_t v13 = -1;
LABEL_14:
    BOOL v15 = fchown(a1, v12, v13) == 0;
    goto LABEL_15;
  }

  BOOL v15 = 1LL;
LABEL_15:

  return v15;
}

id __OSASafeCreateDirectory_block_invoke(uint64_t a1)
{
  v22[16] = *MEMORY[0x1895F89C0];
  v21[0] = @"progname";
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    [NSString stringWithUTF8String:v2];
    id v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = @"<unknown>";
  }

  v22[0] = v3;
  v22[1] = MEMORY[0x189604A88];
  v21[1] = @"create_dir";
  void v21[2] = @"create_dir_success";
  uint64_t v4 = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", *(unsigned __int8 *)(a1 + 78), v3);
  id v5 = *(const __CFString **)(a1 + 32);
  id v6 = *(const __CFString **)(a1 + 40);
  if (!v5) {
    id v5 = @"path sanitize failed";
  }
  id v20 = (void *)v4;
  void v22[2] = v4;
  v22[3] = v5;
  v21[3] = @"start_path";
  v21[4] = @"path";
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"path sanitize failed";
  }
  v22[4] = v7;
  v21[5] = @"original_perms";
  int v8 = *(unsigned __int8 *)(a1 + 78);
  if (*(_BYTE *)(a1 + 78))
  {
    [MEMORY[0x189607968] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 76)];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v9 = &unk_189E30B78;
  }

  v22[5] = v9;
  v21[6] = @"modify_perms";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 79)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  v21[7] = @"modify_perms_success";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v11;
  v22[8] = &unk_189E30B90;
  v21[8] = @"modify_perms_value";
  v21[9] = @"original_gid";
  int v12 = *(unsigned __int8 *)(a1 + 78);
  if (*(_BYTE *)(a1 + 78))
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    gid_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    gid_t v13 = &unk_189E30B78;
  }

  v22[9] = v13;
  v21[10] = @"modify_gid";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v14;
  v21[11] = @"modify_gid_success";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 82)];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v15;
  v22[12] = &unk_189E30BA8;
  v21[12] = @"modify_gid_value";
  v21[13] = @"boot_time_appx";
  uint64_t v16 = *(void *)(a1 + 56);
  v22[13] = *(void *)(a1 + 48);
  v22[14] = v16;
  v21[14] = @"proc_uptime_appx";
  v21[15] = @"framework";
  v22[15] = @"OSAnalytics";
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
  if (v8)
  }

  if (v2) {
  return v17;
  }
}

void sub_1861DC27C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

LABEL_75:
                    v67 = (void *)NSString;
                    objc_msgSend((id)a1[4], "substringWithRange:", v70, v69);
                    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                    [v67 stringWithFormat:@"{%@}", v51];
                    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
                    (*(void (**)(uint64_t, void *))(v57 + 16))(v57, v68);

                    goto LABEL_76;
                  }
                }

                id v54 = [v37 componentsJoinedByString:@"\n"];
              }
            }
          }

          uint64_t v51 = (void *)v54;
          goto LABEL_52;
        }

        [v37 objectForKeyedSubscript:@"flavor"];
        int v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v52 isEqualToString:@"ARM_THREAD_STATE64"])
        {
          id v53 = objc_msgSend((id)a1[6], "formatArm64ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }

        else if ([v52 isEqualToString:@"ARM_THREAD_STATE32"])
        {
          id v53 = objc_msgSend((id)a1[6], "formatArm32ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }

        else
        {
          if (![v52 isEqualToString:@"x86_THREAD_STATE"])
          {
            uint64_t v51 = 0LL;
            goto LABEL_51;
          }

          id v53 = objc_msgSend((id)a1[6], "formatX86ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
        }

        uint64_t v51 = (void *)v53;
LABEL_51:

        goto LABEL_52;
      }

      [MEMORY[0x189607810] characterSetWithCharactersInString:@""];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 stringByTrimmingCharactersInSet:v36];
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37) {
        goto LABEL_35;
      }
LABEL_32:

      uint64_t v16 = v79 + 1;
    }

    while (v79 + 1 != v14);
    id v14 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v14) {
      continue;
    }
    break;
  }

LABEL_79:
  *(void *)(*(void *)(a1[11] + 8LL) + 24LL) = v6 + v4;
}

id symbolicateSpeedTracer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  __int16 v40 = __Block_byref_object_copy__6;
  BOOL v41 = __Block_byref_object_dispose__6;
  id v42 = 0LL;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = __Block_byref_object_copy__6;
  v35[4] = __Block_byref_object_dispose__6;
  id v36 = 0LL;
  if ([v3 length])
  {
    [v4 objectForKeyedSubscript:OSATransformOptionTracerURL];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }

    else
    {
      [MEMORY[0x189604030] URLWithString:@"https://speedtracer.apple.com/api/v2/trace?detail=full"];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v8 = v7;
    [MEMORY[0x189607948] requestWithURL:v7];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setHTTPMethod:@"POST"];
    uint64_t v10 = [v4 objectForKeyedSubscript:OSATransformOptionTracerGroup];
    int v11 = (void *)v10;
    if (v10) {
      int v12 = (const __CFString *)v10;
    }
    else {
      int v12 = @"osatool";
    }
    [v9 setValue:v12 forHTTPHeaderField:@"X-ST-GroupName"];
    int v29 = v8;
    int v30 = v6;
    [MEMORY[0x1896079D8] processInfo];
    gid_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 globallyUniqueString];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v15 = (void *)objc_opt_new();
    objc_msgSend( NSString,  "stringWithFormat:",  @"--%@\r\nContent-Disposition: form-data; name=%@; filename=%@\r\nContent-Type: %@\r\n\r\n",
      v14,
      @"log_content",
      @"tmpname",
      @"application/octet-stream");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 dataUsingEncoding:4];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 appendData:v17];

    [v15 appendData:v3];
    [@"\r\n" dataUsingEncoding:4];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 appendData:v18];

    [NSString stringWithFormat:@"--%@--\r\n", v14];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 dataUsingEncoding:4];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 appendData:v20];

    [v9 setTimeoutInterval:120.0];
    [NSString stringWithFormat:@"multipart/form-data; boundary=%@", v14];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setHTTPContentType:v21];

    [v9 setHTTPBody:v15];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
    [MEMORY[0x189607AA8] ephemeralSessionConfiguration];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607AA0] sessionWithConfiguration:v23];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __symbolicateSpeedTracer_block_invoke;
    v31[3] = &unk_189E21248;
    id v33 = &v37;
    double v34 = v35;
    uint64_t v25 = v22;
    __int16 v32 = v25;
    [v24 dataTaskWithRequest:v9 completionHandler:v31];
    int v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 resume];

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  }

  id v27 = (id)v38[5];
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v27;
}

void sub_1861DD070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __symbolicateSpeedTracer_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v35 = OSATransformResultError;
    v36[0] = v9;
    uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
    gid_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v10 localizedDescription];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)stat buf = 138412290;
      *(void *)__int16 v32 = v14;
      BOOL v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v16 = "speedtracer error response: %@";
LABEL_4:
      _os_log_impl(&dword_1861AC000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v17 = v8;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v17 statusCode];
        objc_msgSend(MEMORY[0x1896078B0], "localizedStringForStatusCode:", objc_msgSend(v17, "statusCode"));
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)__int16 v32 = v18;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v19;
        __int16 v33 = 1024;
        int v34 = [v7 length];
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "SpeedTracer response %d '%@' received %d bytes\n",  buf,  0x18u);
      }
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    obuint64_t j = *(id *)(v20 + 40);
    uint64_t v21 = [MEMORY[0x1896078D8] JSONObjectWithData:v7 options:0 error:&obj];
    objc_storeStrong((id *)(v20 + 40), obj);
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (v24)
      {
        uint64_t v29 = OSATransformResultError;
        uint64_t v30 = v24;
        uint64_t v25 = [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)stat buf = 138412290;
          *(void *)__int16 v32 = v14;
          BOOL v15 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v16 = "failed to extract JSON data from speedtracer result: %@";
          goto LABEL_4;
        }
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_72:
            [v73 addObject:v81];
            if (++v66 == v63)
            {
              id v63 = [v60 countByEnumeratingWithState:&v101 objects:v128 count:16];
              if (!v63)
              {
LABEL_74:
                [v64 setObject:v73 forKeyedSubscript:v71];

                goto LABEL_23;
              }

              goto LABEL_29;
            }
          }

          __int128 v74 = (void *)[v32 mutableCopy];
          v95 = 0u;
          uint64_t v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          uint64_t v77 = v32;
          __int128 v76 = [v77 countByEnumeratingWithState:&v93 objects:v124 count:16];
          if (!v76) {
            goto LABEL_71;
          }
          __int128 v75 = *(void *)v94;
          while (2)
          {
            __int16 v33 = 0LL;
LABEL_51:
            if (*(void *)v94 != v75) {
              objc_enumerationMutation(v77);
            }
            v79 = *(void *)(*((void *)&v93 + 1) + 8 * v33);
            objc_msgSend(v77, "objectForKeyedSubscript:");
            int v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v122 = @"value";
              v123 = v34;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_55;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v35 = (void *)objc_opt_new();
              int v91 = 0u;
              stat v92 = 0u;
              v89 = 0u;
              __int16 v90 = 0u;
              id v36 = v34;
              uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:v121 count:16];
              if (v37)
              {
                uint64_t v38 = *(void *)v90;
                do
                {
                  for (uint64_t j = 0LL; j != v37; ++j)
                  {
                    if (*(void *)v90 != v38) {
                      objc_enumerationMutation(v36);
                    }
                    __int16 v40 = *(void *)(*((void *)&v89 + 1) + 8 * j);
                    v119 = @"value";
                    v120 = v40;
                    [MEMORY[0x189603F68] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
                    BOOL v41 = (void *)objc_claimAutoreleasedReturnValue();
                    [v35 addObject:v41];
                  }

                  uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:v121 count:16];
                }

                while (v37);
              }

              id v42 = [v35 count];
              if (v42 <= 28)
              {
                uint64_t v43 = v42 - 29;
                do
                  [v35 addObject:&unk_189E31CA0];
                while (!__CFADD__(v43++, 1));
              }

LABEL_24:
        ++v69;
      }

      while (v69 != v67);
      v58 = [obj countByEnumeratingWithState:&v114 objects:v131 count:16];
      v67 = v58;
    }

    while (v58);
  }

  return v64;
}

void sub_1861DE0A4(_Unwind_Exception *a1)
{
}

LABEL_47:
          id v54 = &legacyTemplate_109;
          goto LABEL_56;
        }

        v50 = (void *)[v23 mutableCopy];
        objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"308",  @"309",  @"409",  @"509",  0);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        int v52 = [v51 containsObject:v19];

        if (v52)
        {
          if (v45) {
            id v53 = @"9";
          }
          else {
            id v53 = @"109";
          }
        }

        else
        {
          if (([v19 isEqualToString:@"385"] & 1) == 0)
          {
            uint64_t v23 = v100;
            if (![v19 isEqualToString:@"327"])
            {
LABEL_52:
              [MEMORY[0x1896078D8] dataWithJSONObject:v50 options:0 error:0];
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
              {
                int v56 = (void *)[objc_alloc(NSString) initWithData:v55 encoding:4];
                [v99 setObject:v56 forKeyedSubscript:OSATransformResultMetadata];

                uint64_t v23 = v100;
              }

              uint64_t v49 = 0x189607000uLL;
              if (v45) {
                goto LABEL_55;
              }
              goto LABEL_47;
            }

            id v53 = @"227";
LABEL_51:
            [v50 setObject:v53 forKeyedSubscript:@"bug_type"];
            goto LABEL_52;
          }

          id v53 = @"185";
        }

        uint64_t v23 = v100;
        goto LABEL_51;
      }

      uint64_t v46 = (void *)MEMORY[0x189607870];
      v116 = *MEMORY[0x1896075E0];
      v117 = @"unsupported JSON schema version";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 errorWithDomain:@"OSALegacyXform" code:4 userInfo:v17];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v40 = v103;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        -[OSALog bugType](v10, "bugType");
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)stat buf = 138412546;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unsupported log type '%@' effective (%@)",  buf,  0x16u);
      }

      uint64_t v39 = (void *)MEMORY[0x189607870];
      v114 = *MEMORY[0x1896075E0];
      v115 = @"legacy conversion not supported for log type";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      __int16 v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 errorWithDomain:@"OSALegacyXform" code:6 userInfo:v40];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v16 = v102;
LABEL_87:

    goto LABEL_88;
  }

  [v18 augmentWithPrefix:@"Unable to read JSON"];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = v18;
LABEL_88:

  uint64_t v11 = (id)v16;
  id v6 = v105;
LABEL_89:

  if (v24)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      id v85 = [v24 localizedDescription];
      int v86 = [v85 UTF8String];
      *(_DWORD *)stat buf = 136315138;
      *(void *)&uint8_t buf[4] = v86;
      _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    [v7 setObject:v24 forKeyedSubscript:OSATransformResultError];
  }

  return v7;
}

LABEL_10:
      ++v6;
      ++v5;
    }

    while (v6 < self->wired_info_count);
  }

  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }

  return v28;
}

uint64_t OSA_OSX_Legacy_GetUserUUID()
{
  if (!OSA_OSX_Legacy_GetUserUUID___uuid)
  {
    if (_CRGetAnonHostUUID_pred != -1) {
      dispatch_once(&_CRGetAnonHostUUID_pred, &__block_literal_global_10);
    }
    uint64_t v1 = (const void *)_CRGetAnonHostUUID___uuid;
    if (_CRGetAnonHostUUID___uuid)
    {
      CFRetain((CFTypeRef)_CRGetAnonHostUUID___uuid);
      goto LABEL_7;
    }

    id v3 = (const __CFString *)*MEMORY[0x189605198];
    id v4 = (const __CFString *)*MEMORY[0x189605190];
    CFPropertyListRef v5 = CFPreferencesCopyValue( @"userUUID",  @"com.apple.CrashReporter",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605190]);
    if (v5)
    {
      id v6 = v5;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        uint64_t v1 = CFRetain(v6);
        CFRelease(v6);
        if (v1) {
          goto LABEL_7;
        }
      }

      else
      {
        CFRelease(v6);
      }
    }

    id v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    id v9 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x189604DB0]);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v1 = CFUUIDCreateString(v8, v9);
      CFRelease(v10);
      if (v1)
      {
        CFPreferencesSetValue(@"userUUID", v1, @"com.apple.CrashReporter", v3, v4);
        CFPreferencesSynchronize(@"com.apple.CrashReporter", v3, v4);
LABEL_7:
        while (!__ldaxr((unint64_t *)&OSA_OSX_Legacy_GetUserUUID___uuid))
        {
        }

        __clrex();
        CFRelease(v1);
      }
    }
  }

  return OSA_OSX_Legacy_GetUserUUID___uuid;
}

LABEL_60:
    CFRelease(v28);
    uint64_t v28 = 0LL;
    goto LABEL_61;
  }

CFStringRef _CRCopyAnonHostUUIDPath()
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  dispatch_queue_t v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    id v6 = v1;
LABEL_24:
    CFRelease(v6);
    return 0LL;
  }

  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, 0LL);
  if (CFArrayGetCount(v1) < 1) {
    goto LABEL_8;
  }
  CFIndex v3 = 0LL;
  while (1)
  {
    id v4 = (const __CFURL *)CFArrayGetValueAtIndex(v1, v3);
    if (CFURLGetFileSystemRepresentation(v4, 0, &buffer[0].byte0, 1024LL))
    {
    }

    if (CFArrayGetCount(v1) <= ++v3) {
      goto LABEL_8;
    }
  }

  id v7 = (const __CFURL *)CFRetain(v4);
  if (v7)
  {
    CFPropertyListRef v5 = v7;
    CFRelease(v1);
  }

  else
  {
LABEL_8:
    _CRMakeDirectory(ValueAtIndex, 493, 0);
    CFPropertyListRef v5 = (const __CFURL *)CFRetain(ValueAtIndex);
    CFRelease(v1);
    if (!v5) {
      return 0LL;
    }
  }

  id v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  id v9 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x189604DB0], v5, @"Application Support", 1u);
  if (!v9)
  {
LABEL_23:
    id v6 = v5;
    goto LABEL_24;
  }

  uint64_t v10 = v9;
  _CRMakeDirectory(v9, 509, 0);
  uint64_t v11 = CFURLCreateCopyAppendingPathComponent(v8, v10, @"CrashReporter", 1u);
  if (!v11)
  {
    CFRelease(v10);
    goto LABEL_23;
  }

  uint64_t v12 = v11;
  _CRMakeDirectory(v11, 509, 1);
  CFRelease(v10);
  CFRelease(v5);
  uint64_t v13 = CRGetHostUUID___hostUUIDString;
  if (!CRGetHostUUID___hostUUIDString)
  {
    *(void *)&v24.st_dev = 0LL;
    v24.st_ino = 0LL;
    if (gethostuuid(&buffer[0].byte0, (const timespec *)&v24) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _CRCopyAnonHostUUIDPath_cold_1();
      }
      uint64_t v13 = 0LL;
    }

    else
    {
      uint64_t v14 = CFUUIDCreateFromUUIDBytes(v8, buffer[0]);
      if (v14)
      {
        BOOL v15 = v14;
        CFStringRef v16 = CFUUIDCreateString(v8, v14);
        CFRelease(v15);
        while (!__ldaxr((unint64_t *)&CRGetHostUUID___hostUUIDString))
        {
        }

        __clrex();
        CFRelease(v16);
      }

LABEL_31:
      uint64_t v13 = CRGetHostUUID___hostUUIDString;
    }
  }

  uint64_t v20 = CFStringCreateWithFormat(v8, 0LL, @"AnonymousIdentifier_%@.plist", v13);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = CFURLCreateCopyAppendingPathComponent(v8, v12, v20, 0);
    if (v22)
    {
      uint64_t v23 = v22;
      CFStringRef v18 = CFURLCopyFileSystemPath(v22, kCFURLPOSIXPathStyle);
      CFRelease(v23);
    }

    else
    {
      CFStringRef v18 = 0LL;
    }

    CFRelease(v21);
  }

  else
  {
    CFStringRef v18 = 0LL;
  }

  CFRelease(v12);
  return v18;
}

uint64_t _CRMakeDirectory(const __CFURL *a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t result = CFURLGetFileSystemRepresentation(a1, 0, buffer, 1024LL);
  if ((_DWORD)result)
  {
    uint64_t result = stat((const char *)buffer, &v9);
    if ((_DWORD)result)
    {
      mode_t v6 = umask(0);
      mkdir((const char *)buffer, a2);
      umask(v6);
      uint64_t result = geteuid();
      if (a3)
      {
        if (!(_DWORD)result) {
          return chown((const char *)buffer, 0xFFFFFFFF, 0x50u);
        }
      }
    }

    else if ((v9.st_mode & 0xF000) == 0x4000 && a3 != 0 && (v9.st_mode & 0x1FF) != a2)
    {
      return chmod((const char *)buffer, a2);
    }
  }

  return result;
}

id OSAGetBootTime()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)mode_t v6 = 0x1500000001LL;
  size_t v4 = 16LL;
  int v0 = sysctl(v6, 2u, &v5, &v4, 0LL, 0LL);
  uint64_t v1 = 0LL;
  if (v0 != -1 && v5 != 0)
  {
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v5];
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

id OSAGetProcessUptime()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)size_t v4 = 0xE00000001LL;
  int v5 = 1;
  pid_t v6 = getpid();
  size_t v2 = 648LL;
  if (sysctl(v4, 4u, v3, &v2, 0LL, 0LL) < 0)
  {
    int v0 = 0LL;
  }

  else
  {
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v3[0]];
    int v0 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v0;
}

time_t OSADaysSinceEpoch()
{
  time_t result = time(0LL);
  if (result >= 0) {
    return result / 0x15180uLL;
  }
  return result;
}

BOOL OSARandomSelection(unint64_t a1, void *a2)
{
  id v3 = a2;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getTaskingKey:v3];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      a1 = [v5 integerValue];
    }
  }

  BOOL v6 = a1 > arc4random_uniform(0x2710u);

  return v6;
}

__CFString *OSADateFormat(unsigned int a1, double a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if ((a1 & 0x80000000) != 0 || a1 > 7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v24) = a1;
      uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v11 = "unrecognized date format %d";
      uint64_t v12 = buf;
      uint32_t v13 = 8;
LABEL_10:
      _os_log_impl(&dword_1861AC000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, v13);
    }
  }

  else
  {
    double v4 = (double)(uint64_t)floor(a2);
    time_t v16 = (uint64_t)(*MEMORY[0x189604DA8] + v4);
    int v5 = localtime(&v16);
    if (!v5)
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)stat buf = 134217984;
      time_t v24 = v16;
      uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v11 = "unable to convert localtime from %ld secs";
      uint64_t v12 = buf;
      uint32_t v13 = 12;
      goto LABEL_10;
    }

    uint64_t v6 = a1;
    uint64_t v7 = (&formatters)[2 * a1];
    if (strftime((char *)buf, 0x40uLL, v7, v5))
    {
      if (((0x69uLL >> v6) & 1) != 0)
      {
        id v8 = buf;
      }

      else
      {
        id v8 = (uint8_t *)v25;
        stat v9 = fmtcheck((const char *)buf, "unknown-%u");
        if (!snprintf( v25,  0x40uLL,  v9,  (int)((a2 - v4) * 1000000.0) / LODWORD((&formatters)[2 * v6 + 1]))) {
          goto LABEL_11;
        }
      }

      [NSString stringWithUTF8String:v8];
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v14;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      CFStringRef v18 = v7;
      __int16 v19 = 2048;
      time_t v20 = v16;
      __int16 v21 = 1024;
      int v22 = (int)((a2 - v4) * 1000000.0);
      uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v11 = "unable to strftime with format '%s' from %lds+%dus}";
      uint64_t v12 = (uint8_t *)&v17;
      uint32_t v13 = 28;
      goto LABEL_10;
    }
  }

__CFString *OSANSDateFormat(unsigned int a1, void *a2)
{
  return OSADateFormat(a1, v3);
}

double OSATimeIntervalApproximate(double a1)
{
  return floor(a1 / 300.0) * 300.0;
}

void rtcsc_send_realtime(uint64_t a1, uint64_t a2, void *a3)
{
}

void rtcsc_send_base(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  v31[5] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = @"osanalytics_logEr";
  switch((int)a1)
  {
    case 2001:
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      stat v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v9 appleInternal];

      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_30;
    case 2002:
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v11 appleInternal];

      if ((v12 & 1) != 0)
      {
LABEL_5:
        id v8 = @"analyticsd_sub";
        if (a4) {
          goto LABEL_18;
        }
        goto LABEL_29;
      }

      goto LABEL_30;
    case 2003:
      goto LABEL_17;
    case 2004:
      id v8 = @"osanalytics_jetsam";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2005:
      id v8 = @"osanalytics_crashes";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2006:
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = [v13 appleInternal];

      if ((v14 & 1) == 0) {
        goto LABEL_30;
      }
      id v8 = @"osanalytics_monitor";
      if (a4)
      {
LABEL_18:
        id v15 = v7;
        if (objc_opt_class())
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:arc4random()];
          time_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = getkRTCReportingSessionInfoClientType();
          v31[0] = &unk_189E30BD8;
          v30[1] = getkRTCReportingSessionInfoClientVersion();
          v31[1] = &unk_189E30BF0;
          v30[2] = getkRTCReportingSessionInfoBatchEvent();
          v31[2] = MEMORY[0x189604A80];
          v30[3] = getkRTCReportingSessionInfoSessionID();
          v31[3] = v16;
          v30[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
          void v31[4] = MEMORY[0x189604A88];
          [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:5];
          int v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = getkRTCReportingUserInfoClientName();
          v29[0] = @"com.apple.CA";
          v28[1] = getkRTCReportingUserInfoServiceName();
          v29[1] = v8;
          [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:2];
          CFStringRef v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ([(id)rtc_internal_realtime_RTCReportingClass sendOneMessageWithSessionInfo:v17 userInfo:v18 category:a1 type:a2 payload:v15 error:0])
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id v27 = 0;
              _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "RTCReporting Realtime: sendOneMessageWithSessionInfo succeeded",  v27,  2u);
            }
          }

          else
          {
            BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v19) {
              rtcsc_send_base_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
            }
          }
        }
      }

      else
      {
LABEL_29:
        rtc_internal(0, v8, a1, a2, v7);
      }

void rtcsc_send(uint64_t a1, uint64_t a2, void *a3)
{
}

void rtc_internal(char a1, void *a2, __int16 a3, __int16 a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  if (objc_opt_class())
  {
    uint64_t v11 = (dispatch_queue_s *)rtc_internal_rtc_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __rtc_internal_block_invoke_47;
    block[3] = &unk_189E21460;
    id v13 = v10;
    __int16 v15 = a3;
    __int16 v16 = a4;
    char v17 = a1;
    id v14 = v9;
    dispatch_async(v11, block);
  }
}

uint64_t OSARTCIsProcessOfInterest(void *a1)
{
  uint64_t v1 = OSARTCIsProcessOfInterest_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&OSARTCIsProcessOfInterest_onceToken, &__block_literal_global_11);
  }
  uint64_t v3 = [(id)OSARTCIsProcessOfInterest_processSet containsObject:v2];

  return v3;
}

void __OSARTCIsProcessOfInterest_block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"analyticsd",  @"SubmitDiagInfo",  @"osanalyticshelper",  @"OTACrashCopier",  @"ProxiedCrashCopier",  0);
  uint64_t v1 = (void *)OSARTCIsProcessOfInterest_processSet;
  OSARTCIsProcessOfInterest_processSet = v0;
}

void __rtc_internal_realtime_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    __int128 v2 = xmmword_189E213D0;
    uint64_t v3 = 0LL;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  uint64_t v0 = RTCReportingLibraryCore_frameworkLibrary;
  BOOL v1 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      LOWORD(v2) = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "linking RTCReporting.framework",  (uint8_t *)&v2,  2u);
    }

    rtc_internal_realtime_RTCReportingClass = (uint64_t)getRTCReportingClass();
  }

  else if (v1)
  {
    LOWORD(v2) = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "RTCReporting.framework is unavailable",  (uint8_t *)&v2,  2u);
  }

id getRTCReportingClass()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)getRTCReportingClass_softClass;
  uint64_t v7 = getRTCReportingClass_softClass;
  if (!getRTCReportingClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getRTCReportingClass_block_invoke;
    v3[3] = &unk_189E213F0;
    v3[4] = &v4;
    __getRTCReportingClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1861E13FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t getkRTCReportingSessionInfoClientType()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingSessionInfoClientType");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoClientVersion()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingSessionInfoClientVersion");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoBatchEvent()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingSessionInfoBatchEvent");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoSessionID()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingSessionInfoSessionID");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoContainsRealtimeEvents()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingSessionInfoContainsRealtimeEvents");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingUserInfoClientName()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoClientNameSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingUserInfoClientName");
    v5[3] = (uint64_t)v0;
    getkRTCReportingUserInfoClientNameSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

uint64_t getkRTCReportingUserInfoServiceName()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (void *)getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoServiceNameSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    uint64_t v0 = dlsym(v1, "kRTCReportingUserInfoServiceName");
    v5[3] = (uint64_t)v0;
    getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)getkRTCReportingSessionInfoClientType_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *(void *)v0;
}

Class __getRTCReportingClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("RTCReporting");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getRTCReportingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    __getRTCReportingClass_block_invoke_cold_1();
    return (Class)RTCReportingLibrary();
  }

  return result;
}

uint64_t RTCReportingLibrary()
{
  if (!RTCReportingLibraryCore_frameworkLibrary) {
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = RTCReportingLibraryCore_frameworkLibrary;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    __int128 v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

void __rtc_internal_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    __int128 v9 = xmmword_189E213D0;
    uint64_t v10 = 0LL;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  uint64_t v0 = RTCReportingLibraryCore_frameworkLibrary;
  BOOL v1 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      LOWORD(v9) = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "linking RTCReporting.framework",  (uint8_t *)&v9,  2u);
    }

    rtc_internal_RTCReportingClass = (uint64_t)getRTCReportingClass();
    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    __int128 v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.OSAnalytics.RTCReporter", v2);
    uint64_t v4 = (void *)rtc_internal_rtc_queue;
    rtc_internal_rtc_queue = (uint64_t)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1LL);
    uint64_t v6 = (void *)rtc_internal_cfg_semaphore;
    rtc_internal_cfg_semaphore = (uint64_t)v5;

    uint64_t v7 = objc_opt_new();
    id v8 = (void *)rtc_internal_queued_events;
    rtc_internal_queued_events = v7;
  }

  else if (v1)
  {
    LOWORD(v9) = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "RTCReporting.framework is unavailable",  (uint8_t *)&v9,  2u);
  }

void __rtc_internal_block_invoke_47(uint64_t a1)
{
  uint64_t v1 = a1;
  v59[3] = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32) && (unint64_t)[(id)rtc_internal_queued_events count] <= 0x63)
  {
    __int128 v2 = (void *)rtc_internal_queued_events;
    [MEMORY[0x189607968] numberWithUnsignedShort:*(unsigned __int16 *)(v1 + 48)];
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v3;
    [MEMORY[0x189607968] numberWithUnsignedShort:*(unsigned __int16 *)(v1 + 50)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(void *)(v1 + 32);
    v59[1] = v4;
    v59[2] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v59 count:3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v6];
  }

  if (dispatch_semaphore_wait((dispatch_semaphore_t)rtc_internal_cfg_semaphore, 0LL))
  {
    if (*(void *)(v1 + 32))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __rtc_internal_block_invoke_47_cold_3();
      }
    }
  }

  else
  {
    uint64_t v7 = rtc_internal_rtc_reporter;
    uint64_t v8 = [(id)rtc_internal_queued_events count];
    if (v7)
    {
      unint64_t v9 = 0x18C68B000LL;
      if (v8)
      {
        uint64_t v39 = v1;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 134217984;
          uint64_t v58 = [(id)rtc_internal_queued_events count];
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "processing %zu events from queue",  buf,  0xCu);
        }

        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        obuint64_t j = (id)rtc_internal_queued_events;
        uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v49;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(obj);
              }
              id v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              __int16 v15 = (void *)rtc_internal_rtc_reporter;
              [v14 objectAtIndexedSubscript:0];
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
              unsigned __int16 v17 = [v16 intValue];
              [v14 objectAtIndexedSubscript:1];
              CFStringRef v18 = (void *)objc_claimAutoreleasedReturnValue();
              unsigned __int16 v19 = [v18 intValue];
              [v14 objectAtIndexedSubscript:2];
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 sendMessageWithCategory:v17 type:v19 payload:v20 error:0];

              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                __rtc_internal_block_invoke_47_cold_2(buf, v14, &v58);
              }
            }

            uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
          }

          while (v11);
        }

        [(id)rtc_internal_queued_events removeAllObjects];
        unint64_t v9 = 0x18C68B000uLL;
        rtc_internal_lastSend = dispatch_time(0LL, 0LL);
        uint64_t v1 = v39;
      }

      if (*(_BYTE *)(v1 + 52))
      {
        rtc_internal_release_pending = 0;
        dispatch_time_t v21 = *(void *)(v9 + 2192);
        if (v21 <= dispatch_time(0LL, -10000000000LL))
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)gid_t v47 = 0;
            _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "releasing RTCReporting", v47, 2u);
          }

          uint64_t v22 = (void *)rtc_internal_rtc_reporter;
          rtc_internal_rtc_reporter = 0LL;
        }
      }

      if (rtc_internal_rtc_reporter && (rtc_internal_release_pending & 1) == 0)
      {
        rtc_internal_release_pending = 1;
        dispatch_time_t v23 = dispatch_time(*(void *)(v9 + 2192), 10000000000LL);
        uint64_t v24 = (dispatch_queue_s *)rtc_internal_rtc_queue;
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __rtc_internal_block_invoke_49;
        block[3] = &unk_189E20268;
        id v46 = *(id *)(v1 + 40);
        dispatch_after(v23, v24, block);
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
    }

    else if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "intializing RTCReporting...", buf, 2u);
      }

      [MEMORY[0x189607968] numberWithUnsignedInt:arc4random()];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = getkRTCReportingSessionInfoClientType();
      v55[0] = &unk_189E30BD8;
      v54[1] = getkRTCReportingSessionInfoClientVersion();
      v55[1] = &unk_189E30BF0;
      v54[2] = getkRTCReportingSessionInfoBatchEvent();
      v55[2] = MEMORY[0x189604A88];
      v54[3] = getkRTCReportingSessionInfoSessionID();
      v55[3] = v25;
      v54[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
      v55[4] = MEMORY[0x189604A80];
      [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:5];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = getkRTCReportingUserInfoClientName();
      v53[0] = @"com.apple.CA";
      v52[1] = getkRTCReportingUserInfoServiceName();
      v53[1] = *(void *)(v1 + 40);
      [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [objc_alloc((Class)rtc_internal_RTCReportingClass) initWithSessionInfo:v26 userInfo:v27 frameworksToCheck:0];
      uint64_t v29 = (void *)rtc_internal_rtc_reporter;
      rtc_internal_rtc_reporter = v28;

      uint64_t v30 = (void *)rtc_internal_rtc_reporter;
      if (rtc_internal_rtc_reporter)
      {
        v41[0] = MEMORY[0x1895F87A8];
        v41[1] = 3221225472LL;
        v41[2] = __rtc_internal_block_invoke_50;
        v41[3] = &unk_189E21438;
        id v42 = v25;
        id v43 = *(id *)(v1 + 40);
        int v44 = *(_DWORD *)(v1 + 48);
        [v30 startConfigurationWithCompletionHandler:v41];
      }

      else
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v31) {
          __rtc_internal_block_invoke_47_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
      }
    }
  }

uint64_t __rtc_internal_block_invoke_49(uint64_t a1)
{
  return rtc_internal(1LL, *(void *)(a1 + 32), 0LL, 0LL, 0LL);
}

void __rtc_internal_block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v4 = [*(id *)(a1 + 32) intValue];
      v14[0] = 67109120;
      v14[1] = v4;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "configured RTCReporting with session id: %d",  (uint8_t *)v14,  8u);
    }

    rtc_internal(0LL, *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50), 0LL);
  }

  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v5) {
      __rtc_internal_block_invoke_50_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    id v13 = (void *)rtc_internal_rtc_reporter;
    rtc_internal_rtc_reporter = 0LL;
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
}

void OUTLINED_FUNCTION_0_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1861E2AE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_56:
  if (osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles == 1) {
    osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 0;
  }
  if (v84 >= v80)
  {
    if (objc_msgSend(v81, "osa_logTracker_shouldRotateLog:", v17))
    {
      id v63 = a6;
      id v64 = v17;
      +[OSALogTrackerObject sharedTrackers](&OBJC_CLASS___OSALogTrackerObject, "sharedTrackers");
      id v65 = (void *)objc_claimAutoreleasedReturnValue();
      [v65 objectForKey:v14];
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();

      [v66 oldestLogPath];
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v69 = v68;
      if (v67
        && [v68 fileExistsAtPath:v67]
        && ([MEMORY[0x1896078A8] defaultManager],
            __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(),
            __int128 v71 = [v70 removeItemAtPath:v67 error:0],
            v70,
            !v71))
      {
        uint64_t v32 = 0LL;
        if (a8) {
          *a8 = @"Delete oldest file failed";
        }
      }

      else
      {
        uint64_t v32 = 1LL;
        osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 1;
      }

      unsigned __int16 v17 = v64;
      a6 = v63;
    }

    else
    {
      uint64_t v32 = 0LL;
      if (a8) {
        *a8 = @"Log limit exceeded";
      }
    }
  }

  else
  {
    uint64_t v32 = 1LL;
  }

  uint64_t v30 = v84;
  BOOL v31 = v80;
  if (a5) {
LABEL_15:
  }
    *a5 = v30;
LABEL_16:
  if (a6) {
    *a6 = v31;
  }

  return v32;
}

id OSASandboxExtensionForUserSubmissionDirectory(void *a1)
{
  id v1 = a1;
  id v2 = [@"~/Library/Logs/DiagnosticReports/" stringByExpandingTildeInPath];
  id v3 = (void *)[v2 UTF8String];

  if (v3)
  {
    uint64_t v4 = sandbox_extension_issue_file();
    if (v4)
    {
      BOOL v5 = (void *)v4;
      [NSString stringWithUTF8String:v4];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      free(v5);
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        OSASandboxExtensionForUserSubmissionDirectory_cold_1();
      }
      if (*__error() == 1)
      {
        id v7 = v1;
        AnalyticsSendEventLazy();
      }

      id v3 = 0LL;
    }
  }

  return v3;
}

id __OSASandboxExtensionForUserSubmissionDirectory_block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1895F89C0];
  id v2 = getprogname();
  id v3 = v2;
  uint64_t v4 = *(const __CFString **)(a1 + 32);
  BOOL v5 = @"<unknown>";
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = @"<unknown>";
  }
  v9[0] = @"bugType";
  v9[1] = @"progName";
  v10[0] = v6;
  if (v2)
  {
    [NSString stringWithUTF8String:v2];
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v10[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {

  }
  return v7;
}

void OSASandboxConsumeExtension(void *a1, void *a2)
{
  id v3 = a2;
  if (![a1 UTF8String])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      OSASandboxConsumeExtension_cold_1();
    }
    goto LABEL_10;
  }

  if (sandbox_extension_consume() < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      OSASandboxConsumeExtension_cold_2();
    }
LABEL_10:
    v3[2](v3);
    goto LABEL_11;
  }

  v3[2](v3);
  if ((sandbox_extension_release() & 0x80000000) != 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    OSASandboxConsumeExtension_cold_3();
  }
LABEL_11:
}

void OUTLINED_FUNCTION_0_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_3_0()
{
  return __error();
}

id OSAnalyticsHelperServiceConnection()
{
  if (OSAnalyticsHelperServiceConnection_onceToken != -1) {
    dispatch_once(&OSAnalyticsHelperServiceConnection_onceToken, &__block_literal_global_14);
  }
  return (id)OSAnalyticsHelperServiceConnection_connection;
}

void __OSAnalyticsHelperServiceConnection_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0LL, 2uLL);
  id v1 = (void *)OSAnalyticsHelperServiceConnection_connection;
  OSAnalyticsHelperServiceConnection_connection = (uint64_t)mach_service;

  if (OSAnalyticsHelperServiceConnection_connection)
  {
    xpc_connection_set_event_handler( (xpc_connection_t)OSAnalyticsHelperServiceConnection_connection,  &__block_literal_global_3);
    xpc_connection_resume((xpc_connection_t)OSAnalyticsHelperServiceConnection_connection);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446210;
    id v3 = "com.apple.osanalytics.osanalyticshelper";
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Couldn't get XPC connection to %{public}s",  (uint8_t *)&v2,  0xCu);
  }

void __OSAnalyticsHelperServiceConnection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  id v3 = v2;
  if (v2 != (id)MEMORY[0x1895F9198]
    && MEMORY[0x186E34734](v2) == MEMORY[0x1895F9268]
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    int v5 = 136446466;
    uint64_t v6 = "com.apple.osanalytics.osanalyticshelper";
    __int16 v7 = 2082;
    uint64_t v8 = string;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Got xpc error message from %{public}s: %{public}s\n",  (uint8_t *)&v5,  0x16u);
  }
}

id xpc2ns(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  uint64_t v2 = MEMORY[0x186E34734]();
  if (v2 == MEMORY[0x1895F92E8])
  {
    uint64_t v5 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
LABEL_15:
    id v4 = (id)v5;
    goto LABEL_16;
  }

  uint64_t v3 = v2;
  if (v2 == MEMORY[0x1895F9280])
  {
    uint64_t v5 = [MEMORY[0x189607968] numberWithLongLong:xpc_int64_get_value(v1)];
    goto LABEL_15;
  }

  if (v2 == MEMORY[0x1895F9240])
  {
    size_t length = xpc_data_get_length(v1);
    uint64_t v5 = [MEMORY[0x189603F48] dataWithBytes:xpc_data_get_bytes_ptr(v1) length:length];
    goto LABEL_15;
  }

  if (v2 == MEMORY[0x1895F9248])
  {
    uint64_t v5 = [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)(xpc_date_get_value(v1) / 0x3B9ACA00uLL)];
    goto LABEL_15;
  }

  if (v2 == MEMORY[0x1895F9250])
  {
    uint64_t v8 = (void *)objc_opt_new();
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __xpc2ns_block_invoke;
    applier[3] = &unk_189E215C8;
    id v4 = v8;
    id v14 = v4;
    xpc_dictionary_apply(v1, applier);
    uint64_t v9 = v14;
LABEL_19:

    goto LABEL_16;
  }

  if (v2 == MEMORY[0x1895F9220])
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:xpc_array_get_count(v1)];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __xpc2ns_block_invoke_2;
    v11[3] = &unk_189E215F0;
    id v4 = v10;
    id v12 = v4;
    xpc_array_apply(v1, v11);
    uint64_t v9 = v12;
    goto LABEL_19;
  }

  if (v2 == MEMORY[0x1895F9278])
  {
    uint64_t v5 = [MEMORY[0x189603FE8] null];
    goto LABEL_15;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "xpc2ns: unrecognized type: %p", buf, 0xCu);
  }

  id v4 = 0LL;
LABEL_16:

  return v4;
}

uint64_t __xpc2ns_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void **)(a1 + 32);
  [NSString stringWithUTF8String:a2];
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1LL;
}

uint64_t __xpc2ns_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  xpc2ns(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];

  return 1LL;
}

id ns2xpc(void *a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_object_t v2 = xpc_string_create((const char *)[v1 UTF8String]);
LABEL_9:
    xpc_object_t v5 = v2;
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_object_t v2 = xpc_int64_create([v1 longLongValue]);
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v1;
    xpc_object_t v2 = xpc_data_create((const void *)[v3 bytes], objc_msgSend(v3, "length"));
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v1 timeIntervalSince1970];
    xpc_object_t v2 = xpc_date_create((uint64_t)(v4 * 1000000000.0));
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    id v7 = v1;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v26 + 1) + 8 * i);
          id v13 = (const char *)[v12 UTF8String];
          [v7 objectForKeyedSubscript:v12];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          ns2xpc(v14);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_value(v5, v13, v15);
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }

      while (v9);
    }

LABEL_28:
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_object_t v5 = xpc_array_create(0LL, 0LL);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v7 = v1;
    uint64_t v16 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0LL; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v7);
          }
          ns2xpc(*(void *)(*((void *)&v22 + 1) + 8 * j));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_array_append_value(v5, v20);
        }

        uint64_t v17 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }

      while (v17);
    }

    goto LABEL_28;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    id v31 = (id)objc_opt_class();
    id v21 = v31;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "ns2xpc: unrecognized class: %@",  buf,  0xCu);
  }

  xpc_object_t v5 = 0LL;
LABEL_10:

  return v5;
}

uint64_t mach_exception_raise(mach_port_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  int v15 = a2;
  int v17 = 1245184;
  int v18 = a3;
  int v19 = 1245184;
  uint64_t v20 = *MEMORY[0x1895F8468];
  int v21 = a4;
  if (a6 > 2) {
    return 4294966989LL;
  }
  int v9 = 8 * a6;
  __memcpy_chk();
  unsigned int v22 = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x96500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3, v9 + 68, 0x2Cu, reply_port, 0, 0);
  uint64_t v6 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v6;
  }

  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v6;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v6 = 4294966988LL;
LABEL_19:
    mach_msg_destroy(&msg);
    return v6;
  }

  if (msg.msgh_id != 2505)
  {
    uint64_t v6 = 4294966995LL;
    goto LABEL_19;
  }

  uint64_t v6 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_19;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v6 = v16;
  if (v16) {
    goto LABEL_19;
  }
  return v6;
}

uint64_t mach_exception_raise_state( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, mach_msg_size_t *a9)
{
  mach_port_t v9 = MEMORY[0x1895F8858]();
  uint64_t v35 = *MEMORY[0x1895F8468];
  unsigned int v36 = v15;
  if (v10 <= 2)
  {
    unsigned int v16 = v14;
    unsigned int v17 = v13;
    int v18 = v12;
    int v19 = v11;
    unsigned int v20 = v10;
    mach_port_t v21 = v9;
    uint64_t v22 = 8 * v10;
    __memcpy_chk();
    unsigned int v37 = v20;
    uint64_t v23 = (char *)&v34 + v22;
    *(_DWORD *)((char *)&v34 + v22 + 40) = *v19;
    if (v17 <= 0x510)
    {
      __int128 v26 = v23 - 16;
      int v27 = v22 + 4 * v17;
      memcpy(v23 + 48, v18, 4 * v17);
      *((_DWORD *)v26 + 15) = v17;
      mach_port_t reply_port = mig_get_reply_port();
      v34.msgh_remote_port = v21;
      v34.msgh_local_port = reply_port;
      v34.msgh_bits = 5395;
      *(void *)&v34.msgh_voucher_port = 0x96600000000LL;
      if (MEMORY[0x1895FD5F8])
      {
        voucher_mach_msg_set(&v34);
        mach_port_t reply_port = v34.msgh_local_port;
      }

      uint64_t v29 = mach_msg(&v34, 3, v27 + 48, 0x1474u, reply_port, 0, 0);
      uint64_t v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(v34.msgh_local_port);
        return v24;
      }

      if ((_DWORD)v29)
      {
        mig_dealloc_reply_port(v34.msgh_local_port);
        return v24;
      }

      if (v34.msgh_id == 71)
      {
        uint64_t v24 = 4294966988LL;
      }

      else if (v34.msgh_id == 2506)
      {
        if ((v34.msgh_bits & 0x80000000) == 0)
        {
          if (v34.msgh_size - 5229 <= 0xFFFFEBBE)
          {
            if (v34.msgh_remote_port) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = v36 == 0;
            }
            if (!v30 && v34.msgh_size == 36) {
              uint64_t v24 = v36;
            }
            else {
              uint64_t v24 = 4294966996LL;
            }
            goto LABEL_29;
          }

          if (!v34.msgh_remote_port)
          {
            uint64_t v24 = v36;
            if (v36) {
              goto LABEL_29;
            }
            mach_msg_size_t v32 = v38;
            if (v38 <= 0x510 && v38 <= (v34.msgh_size - 44) >> 2)
            {
              size_t v33 = 4LL * v38;
              if (v34.msgh_size == 4 * v38 + 44)
              {
                *int v19 = v37;
                memcpy(v16, &v39, v33);
                uint64_t v24 = 0LL;
                *a9 = v32;
                return v24;
              }
            }
          }
        }

        uint64_t v24 = 4294966996LL;
      }

      else
      {
        uint64_t v24 = 4294966995LL;
      }

LABEL_29:
      mach_msg_destroy(&v34);
      return v24;
    }
  }

  return 4294966989LL;
}

      mach_msg_destroy(&msg);
      return v24;
    }
  }

  return 4294966989LL;
}

uint64_t mach_exception_raise_state_identity( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, void *a10, mach_msg_size_t *a11)
{
  mach_port_t v11 = MEMORY[0x1895F8858]();
  uint64_t v44 = *MEMORY[0x1895F89C0];
  int v35 = 2;
  int v36 = v15;
  int v38 = 1245184;
  mach_msg_size_t v39 = v16;
  v40[1] = 1245184;
  uint64_t v41 = *MEMORY[0x1895F8468];
  int v42 = v17;
  if (v12 <= 2)
  {
    int v18 = v14;
    int v19 = v13;
    unsigned int v20 = v12;
    mach_port_t v21 = v11;
    uint64_t v22 = 8 * v12;
    __memcpy_chk();
    unsigned int v43 = v20;
    uint64_t v23 = (char *)&msg + v22;
    *(_DWORD *)((char *)&msg + v22 + 6_Block_object_dispose(va, 8) = *v19;
    if (a9 <= 0x510)
    {
      __int128 v26 = v23 - 16;
      int v27 = v22 + 4 * a9;
      memcpy(v23 + 76, v18, 4 * a9);
      *((_DWORD *)v26 + 22) = a9;
      mach_port_t reply_port = mig_get_reply_port();
      msg.msgh_remote_port = v21;
      msg.msgh_local_port = reply_port;
      msg.msgh_bits = -2147478253;
      *(void *)&msg.msgh_voucher_port = 0x96700000000LL;
      if (MEMORY[0x1895FD5F8])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t reply_port = msg.msgh_local_port;
      }

      uint64_t v29 = mach_msg(&msg, 3, v27 + 76, 0x1474u, reply_port, 0, 0);
      uint64_t v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(msg.msgh_local_port);
        return v24;
      }

      if ((_DWORD)v29)
      {
        mig_dealloc_reply_port(msg.msgh_local_port);
        return v24;
      }

      if (msg.msgh_id == 71)
      {
        uint64_t v24 = 4294966988LL;
      }

      else if (msg.msgh_id == 2507)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size - 5229 <= 0xFFFFEBBE)
          {
            if (msg.msgh_remote_port) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = v37 == 0;
            }
            if (!v30 && msg.msgh_size == 36) {
              uint64_t v24 = v37;
            }
            else {
              uint64_t v24 = 4294966996LL;
            }
            goto LABEL_29;
          }

          if (!msg.msgh_remote_port)
          {
            uint64_t v24 = v37;
            if (v37) {
              goto LABEL_29;
            }
            mach_msg_size_t v32 = v39;
            if (v39 <= 0x510 && v39 <= (msg.msgh_size - 44) >> 2)
            {
              size_t v33 = 4LL * v39;
              if (msg.msgh_size == 4 * v39 + 44)
              {
                *int v19 = v38;
                memcpy(a10, v40, v33);
                uint64_t v24 = 0LL;
                *a11 = v32;
                return v24;
              }
            }
          }
        }

        uint64_t v24 = 4294966996LL;
      }

      else
      {
        uint64_t v24 = 4294966995LL;
      }

uint64_t rc_sync_request(mach_port_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1895F8468];
  *(void *)&__int128 v13 = a2;
  *((void *)&v13 + 1) = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x96B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3, 0x30u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (msg.msgh_id == 2511)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 44)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v8 = v13;
            if (!(_DWORD)v13)
            {
              *a4 = *(void *)((char *)&v13 + 4);
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = (_DWORD)v13 == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

void SimulateCrash_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v1, 0xCu);
}

void SimulateCrash_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "SimulateCrash() on another process is not supported",  v0,  2u);
}

void matchSelector_cold_1(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = " nope";
  int v4 = 136315650;
  if ((a1 & 1) != 0) {
    uint64_t v3 = "MATCH";
  }
  xpc_object_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG, "%s: %@ vs %@", (uint8_t *)&v4, 0x20u);
}

void __OSASanitizePath_block_invoke_cold_1(void *a1)
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1861AC000, MEMORY[0x1895F8DA0], v1, "%@:\n%@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

void getVolumes_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1861AC000, MEMORY[0x1895F8DA0], v2, "%@:\n%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void __OSASanitizePath_block_invoke_33_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __OSASanitizePath_block_invoke_33_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void logForAppleCare_cold_1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1861AC000, MEMORY[0x1895F8DA0], v2, "AppleCareSupport: event %@", v3, v4, v5, v6, 2u);
}

void purgeR3Logs_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __openR3_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASafeOpen_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASafeOpen_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASafeOpen_cold_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to safely open '%{public}s': %{public}s",  (uint8_t *)&v4,  0x16u);
}

void OSASafeCreateDirectory_cold_1(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v5;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to set file protection class while creating %{public}@",  a1,  0xCu);
}

void _CRCopyAnonHostUUIDPath_cold_1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  uint64_t v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint64_t v5 = v2;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to determine UUID for host. Error: %d %s",  (uint8_t *)v3,  0x12u);
}

void rtcsc_send_base_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t getkRTCReportingSessionInfoClientType_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRTCReportingClass_block_invoke_cold_1(v0);
}

void __getRTCReportingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __rtc_internal_block_invoke_47_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __rtc_internal_block_invoke_47_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

void __rtc_internal_block_invoke_47_cold_2(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG, "sent RTCReporting %@", a1, 0xCu);
}

void __rtc_internal_block_invoke_47_cold_3()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "event queued pending RTCReporting intialization",  v0,  2u);
  OUTLINED_FUNCTION_4();
}

void __rtc_internal_block_invoke_50_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASandboxExtensionForUserSubmissionDirectory_cold_1()
{
  uint64_t v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_0_6( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "Error issuing sandbox extension: %i (%s)",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_2();
}

void OSASandboxConsumeExtension_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Sandbox extension token was missing.",  v0,  2u);
}

void OSASandboxConsumeExtension_cold_2()
{
  uint64_t v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(v0);
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "Failed to consume sandbox extension: %s (%i)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void OSASandboxConsumeExtension_cold_3()
{
  uint64_t v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(v0);
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "Failed to release sandbox extension: %s (%i)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

uint64_t AnalyticsNotifyTaskingAvailable()
{
  return MEMORY[0x18960DA88]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x18960DA98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
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

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x189602A28]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
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

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x189603560](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

uint64_t CSIsNull()
{
  return MEMORY[0x18960E0F8]();
}

uint64_t CSRelease()
{
  return MEMORY[0x18960E150]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x18960E1D0]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x18960E398]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x18960E3F8]();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return MEMORY[0x18960E480]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x18960E508]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x189613728]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1896077C0]();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1896085D8]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1895F85E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1896040F8]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x189604230]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x189604430]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x189604438]();
}

uint64_t _CFPreferencesGetUserIdentifierForUID()
{
  return MEMORY[0x189604458]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x189604478]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1895F8C90]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1895F8C98]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1895F8CD0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void arc4random_addrandom(unsigned __int8 *a1, int a2)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9618](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1895FA9D8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1895FB0D0]();
}

void endpwent(void)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FB2E8](*(void *)&fd, namebuff, size, *(void *)&options);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1895FB338](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FB470](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FB530]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

gid_t getgid(void)
{
  return MEMORY[0x1895FB550]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1895FB598](a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1895FB5C8](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  return MEMORY[0x1895FB760](*(void *)&host, multiuser_mode);
}

kern_return_t host_statistics64( host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1895FB7A0](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FBA18](a1);
}

double log10(double a1)
{
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1895FBE40]();
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FBE98]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1895FBEF8](*(void *)&a1, a2, a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FC268](*(void *)&a1, a2, *(void *)&a3);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1895FC6E0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int remove(const char *a1)
{
  return MEMORY[0x1895FCD08](a1);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1895FCD60](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

uint64_t stackshot_capture_with_config()
{
  return MEMORY[0x1895FCFE0]();
}

uint64_t stackshot_config_create()
{
  return MEMORY[0x1895FCFE8]();
}

uint64_t stackshot_config_dealloc()
{
  return MEMORY[0x1895FCFF0]();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return MEMORY[0x1895FCFF8]();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return MEMORY[0x1895FD000]();
}

uint64_t stackshot_config_set_flags()
{
  return MEMORY[0x1895FD008]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1895FD340]();
}

kern_return_t task_threads( task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1895FD370](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1895FD3B0](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1895FD448](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD470](*(void *)&a1, a2, *(void *)&a3);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FD4A8](a1, a2);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
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

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1895FDB38](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1895FDB58](xdate);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_);
}

uint64_t objc_msgSend_initWithZoneNames_nameCount_zoneInfo_zoneInfoCount_wiredInfo_wiredInfoCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithZoneNames_nameCount_zoneInfo_zoneInfoCount_wiredInfo_wiredInfoCount_);
}

uint64_t objc_msgSend_osa_logTracker_incrementForSubtype_internal_signature_filepath_scan_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_osa_logTracker_incrementForSubtype_internal_signature_filepath_scan_);
}

uint64_t objc_msgSend_osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription_);
}

uint64_t objc_msgSend_resampleTruncatedBacktracesForTask_forThreads_usingCatalog_in_usingSymbolicator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_resampleTruncatedBacktracesForTask_forThreads_usingCatalog_in_usingSymbolicator_);
}

uint64_t objc_msgSend_useStackshotBuffer_size_frontmostPids_atTime_machTime_sequence_isSnapshotDead_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_useStackshotBuffer_size_frontmostPids_atTime_machTime_sequence_isSnapshotDead_);
}