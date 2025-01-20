@interface Libsysdiagnose
+ (BOOL)cancelActiveSysdiagnoseWithError:(id *)a3;
+ (BOOL)isSysdiagnoseInProgressWithError:(id *)a3;
+ (BOOL)verifyReply:(id)a3 withExpectedType:(_xpc_type_s *)a4 forError:(id *)a5;
+ (id)createSysdiagnoseRequest:(id)a3;
+ (id)fetchDiagnosticIDFromDeviceSource:(unint64_t)a3 WithMaxCount:(unint64_t)a4 withError:(id *)a5;
+ (id)fetchRemoteDiagnosticIDsWithError:(id *)a3;
+ (id)getSysdiagnoseCrashLog;
+ (id)sendSysdiagnoseRequest:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6;
+ (id)setupConnection;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 andProgressHandler:(id)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 withProgressHandler:(id)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressCallback:(id)a6;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6;
+ (int)addErrorString:(id)a3 WithCode:(id)a4 forError:(id *)a5;
+ (void)createMetrics:(id *)a3 fromResponse:(id)a4;
+ (void)sysdiagnoseWithMetadata:(id)a3 onCompletion:(id)a4;
@end

@implementation Libsysdiagnose

+ (id)setupConnection
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v2, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_resume(mach_service);
  if (!mach_service)
  {
    v4 = (os_log_s *)_log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_187DBA000, v4, OS_LOG_TYPE_DEFAULT, "Connection failed", v6, 2u);
    }
  }

  return mach_service;
}

void __33__Libsysdiagnose_setupConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1895B7B3C](a2) == MEMORY[0x1895F9268])
  {
    v2 = (os_log_s *)_log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl( &dword_187DBA000,  v2,  OS_LOG_TYPE_DEFAULT,  "XPC connection to com.apple.sysdiagnose.service.xpc failed",  v3,  2u);
    }
  }

+ (id)createSysdiagnoseRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "REQUEST_TYPE", 1uLL);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"SDRequestSourceShell"];
  if (v5)
  {
    v6 = (void *)v5;
    [v3 objectForKeyedSubscript:@"verbose"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      xpc_dictionary_set_fd(v4, "stdout", 1);
      xpc_dictionary_set_fd(v4, "stderr", 2);
    }
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  [v3 allKeys];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    v29 = v8;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        [v3 objectForKey:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          xpc_dictionary_set_BOOL( v4, (const char *)[v13 UTF8String], objc_msgSend(v14, "BOOLValue"));
          goto LABEL_21;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          xpc_dictionary_set_string( v4, (const char *)[v13 UTF8String], (const char *)objc_msgSend(v14, "UTF8String"));
          goto LABEL_21;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [MEMORY[0x1896078F8] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            uint64_t v16 = [v13 UTF8String];
            id v17 = v15;
            uint64_t v18 = [v17 bytes];
            size_t v19 = [v17 length];
            v20 = v4;
            v21 = (const char *)v16;
            v22 = (const void *)v18;
            v8 = v29;
            goto LABEL_19;
          }

          goto LABEL_20;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [MEMORY[0x1896078F8] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            uint64_t v23 = [v13 UTF8String];
            id v24 = v15;
            uint64_t v25 = [v24 bytes];
            size_t v19 = [v24 length];
            v20 = v4;
            v21 = (const char *)v23;
            v8 = v29;
            v22 = (const void *)v25;
LABEL_19:
            xpc_dictionary_set_data(v20, v21, v22, v19);
          }

+ (int)addErrorString:(id)a3 WithCode:(id)a4 forError:(id *)a5
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = *MEMORY[0x1896075E0];
  v12[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"libsysdiagnoseError",  (int)objc_msgSend(v8, "intValue"),  v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(a5) = [v8 intValue];
  }

  return (int)a5;
}

+ (void)createMetrics:(id *)a3 fromResponse:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x189603FC8];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke;
  applier[3] = &unk_18A1407B0;
  id v9 = v7;
  id v11 = v9;
  xpc_dictionary_apply(v6, applier);

  id v8 = (id)[v9 count];
  if (v8) {
    id v8 = (id)[v9 copy];
  }
  *a3 = v8;
}

uint64_t __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x1895B7B3C]() == MEMORY[0x1895F9258])
  {
    [NSString stringWithUTF8String:a2];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithDouble:xpc_double_get_value(v5)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }

  return 1LL;
}

+ (BOOL)verifyReply:(id)a3 withExpectedType:(_xpc_type_s *)a4 forError:(id *)a5
{
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"xpc connection returned a null object",  &unk_18A141100,  a5);
    goto LABEL_9;
  }

  id v9 = (_xpc_type_s *)MEMORY[0x1895B7B3C](v7);
  if (v9 == a4)
  {
    BOOL v11 = 1;
  }

  else
  {
    if (v9 == (_xpc_type_s *)MEMORY[0x1895F9268])
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s",  xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1895F91B0]));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  v12,  &unk_18A141118,  a5);

      goto LABEL_9;
    }

    uint64_t v10 = (os_log_s *)_log_context;
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187DBA000, v10, OS_LOG_TYPE_DEFAULT, "unrecognized message event.", buf, 2u);
LABEL_9:
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (id)sendSysdiagnoseRequest:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  id v62 = 0LL;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  id v56 = 0LL;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x3032000000LL;
  v49[3] = __Block_byref_object_copy__64;
  v49[4] = __Block_byref_object_dispose__65;
  id v50 = (id)[v11 copy];
  [a1 setupConnection];
  uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x3032000000LL;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    id v48 = 0LL;
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v42 = dispatch_semaphore_create(0LL);
    uint64_t v31 = 0LL;
    __int128 v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    __int128 v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v36 = dispatch_semaphore_create(0LL);
    uint64_t v27 = 0LL;
    v28 = (double *)&v27;
    uint64_t v29 = 0x2020000000LL;
    uint64_t v30 = 0LL;
    uint64_t v13 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke;
    handler[3] = &unk_18A1407D8;
    uint64_t v23 = &v43;
    id v24 = &v27;
    id v22 = v11;
    uint64_t v25 = v49;
    v26 = &v31;
    xpc_connection_set_event_handler(v12, handler);
    v20[0] = v13;
    v20[1] = 3221225472LL;
    v20[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_70;
    v20[3] = &unk_18A140800;
    v20[4] = &v43;
    v20[5] = &v51;
    v20[7] = &v37;
    v20[8] = a4;
    v20[6] = &v57;
    xpc_connection_send_message_with_reply(v12, v10, 0LL, v20);
    dispatch_semaphore_wait((dispatch_semaphore_t)v38[5], 0xFFFFFFFFFFFFFFFFLL);
    v14 = (dispatch_semaphore_s *)v32[5];
    dispatch_time_t v15 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000LL);
    dispatch_semaphore_wait(v14, v15);
    if (v52[5])
    {
      if (v28[3] < 100.0)
      {
        uint64_t v16 = (os_log_s *)_log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)size_t v19 = 0;
          _os_log_impl(&dword_187DBA000, v16, OS_LOG_TYPE_DEFAULT, "Timed out waiting for progress updates.", v19, 2u);
        }
      }
    }

    if (a5) {
      *a5 = (id) v44[5];
    }
    if (a4) {
      *a4 = (id)[(id)v58[5] copy];
    }
    id v17 = (id)v52[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);
  }

  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Failed to create the xpc_connection",  &unk_18A141100,  a5);
    id v17 = 0LL;
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v17;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke( void *a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[Libsysdiagnose verifyReply:withExpectedType:forError:]( &OBJC_CLASS___Libsysdiagnose,  "verifyReply:withExpectedType:forError:",  v3,  MEMORY[0x1895F9250],  &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    *(double *)(*(void *)(a1[6] + 8) + 24) = xpc_dictionary_get_double( v3,  (const char *)[@"percentage" UTF8String]);
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)[@"phase" UTF8String]);
    string = xpc_dictionary_get_string(v3, (const char *)[@"diagnosticID" UTF8String]);
    uint64_t v8 = *(void *)(a1[6] + 8LL);
    double v9 = *(double *)(v8 + 24);
    if (v9 >= 0.0)
    {
      if (a1[4])
      {
        uint64_t v12 = string;
        if (v9 > 100.0)
        {
          *(void *)(v8 + 24) = 0x4059000000000000LL;
          uint64_t v13 = (os_log_s *)_log_context;
          if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_ERROR)) {
            __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1(v13);
          }
        }

        id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
        [MEMORY[0x189607968] numberWithDouble:*(double *)(*(void *)(a1[6] + 8) + 24)];
        dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setObject:v15 forKey:@"percentage"];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:uint64];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setObject:v16 forKey:@"phase"];

        if (v12)
        {
          [NSString stringWithUTF8String:v12];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 setObject:v17 forKey:@"diagnosticID"];
        }

        uint64_t v18 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
        size_t v19 = (void *)[v14 copy];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

        double v9 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL);
      }

      if (v9 >= 100.0) {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8LL) + 40LL));
      }
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", xpc_dictionary_get_string(v3, "error"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = *(void *)(a1[5] + 8LL);
      id v20 = *(id *)(v11 + 40);
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  v10,  &unk_18A141130,  &v20);
      objc_storeStrong((id *)(v11 + 40), v20);
    }
  }
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_70( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[Libsysdiagnose verifyReply:withExpectedType:forError:]( &OBJC_CLASS___Libsysdiagnose,  "verifyReply:withExpectedType:forError:",  v3,  MEMORY[0x1895F9250],  &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    sleep(2u);
    +[Libsysdiagnose getSysdiagnoseCrashLog](&OBJC_CLASS___Libsysdiagnose, "getSysdiagnoseCrashLog");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v14);
      dispatch_time_t v15 = (void *)NSString;
      id v14 = v14;
      objc_msgSend( v15,  "stringWithFormat:",  @"XPC reply failed, found a latest sysdiagnose crash log in last 10 minutes at %s",  objc_msgSend(v14, "UTF8String"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = *(void *)(a1[4] + 8LL);
      id v19 = *(id *)(v17 + 40);
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  v16,  &unk_18A141130,  &v19);
      objc_storeStrong((id *)(v17 + 40), v19);
    }

    goto LABEL_10;
  }

  string = xpc_dictionary_get_string(v3, "path");
  if (!string)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", xpc_dictionary_get_string(v3, "error"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = *(void *)(a1[4] + 8LL);
    id v20 = *(id *)(v18 + 40);
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  v14,  &unk_18A141130,  &v20);
    objc_storeStrong((id *)(v18 + 40), v20);
    goto LABEL_10;
  }

  id v7 = string;
  uint64_t v8 = [NSString stringWithUTF8String:string];
  uint64_t v9 = *(void *)(a1[5] + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = (os_log_s *)_log_context;
  if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v24 = v7;
    _os_log_impl(&dword_187DBA000, v11, OS_LOG_TYPE_DEFAULT, "xpc response: %{public}s\n", buf, 0xCu);
  }

  if (a1[8])
  {
    uint64_t v12 = *(void *)(a1[6] + 8LL);
    id v21 = *(id *)(v12 + 40);
    +[Libsysdiagnose createMetrics:fromResponse:](&OBJC_CLASS___Libsysdiagnose, "createMetrics:fromResponse:", &v21, v3);
    id v13 = v21;
    id v14 = *(id *)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_10:
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8LL) + 40LL));
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressCallback:(id)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  if (!_log_context)
  {
    os_log_t v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    id v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;
  }

  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  dispatch_semaphore_t v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke;
  v20[3] = &unk_18A140828;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  uint64_t v23 = &v33;
  id v24 = &v27;
  v26 = a4;
  id v15 = v11;
  id v22 = v15;
  _os_activity_initiate(&dword_187DBA000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = (id) v28[5];
  }

  else
  {
    uint64_t v16 = (os_log_s *)_log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v17;
      _os_log_impl(&dword_187DBA000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }

  id v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

void __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = +[Libsysdiagnose sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:",  v2,  v3,  &obj,  *(void *)(a1 + 40));
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v10 = *(void *)(v8 + 40);
    uint64_t v9 = (id *)(v8 + 40);
    if (!v10)
    {
      id v11 = 0LL;
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Unknown error",  &unk_18A141148,  &v11);
      objc_storeStrong(v9, v11);
    }
  }
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  if (!_log_context)
  {
    os_log_t v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    id v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;
  }

  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  dispatch_semaphore_t v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke;
  v20[3] = &unk_18A140878;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  uint64_t v23 = &v33;
  v26 = a4;
  id v24 = &v27;
  _os_activity_initiate(&dword_187DBA000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = (id) v28[5];
  }

  else
  {
    uint64_t v16 = (os_log_s *)_log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v17;
      _os_log_impl(&dword_187DBA000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }

  id v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__64;
  id v19 = __Block_byref_object_dispose__65;
  id v20 = (id)[*(id *)(a1 + 40) copy];
  if (v16[5])
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2;
    v14[3] = &unk_18A140850;
    v14[4] = &v15;
    uint64_t v3 = (void *)MEMORY[0x1895B795C](v14);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = +[Libsysdiagnose sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:",  v2,  v4,  &obj,  v3);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v11 = *(void *)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    if (!v11)
    {
      id v12 = 0LL;
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Unknown error",  &unk_18A141148,  &v12);
      objc_storeStrong(v10, v12);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  [a2 objectForKeyedSubscript:@"percentage"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 doubleValue];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:",  a3,  a4,  a5,  0LL);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:",  a3,  0LL,  a4,  0LL);
}

+ (void)sysdiagnoseWithMetadata:(id)a3 onCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_get_global_queue(21LL, 0LL);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke;
  v10[3] = &unk_18A1408A0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0LL;
  +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:",  v2,  0LL,  &v6,  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 andProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:",  a3,  0LL,  a4,  a5);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 withProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressCallback:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:withProgressCallback:",  a3,  0LL,  a4,  a5);
}

+ (BOOL)isSysdiagnoseInProgressWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  size_t v22 = 4LL;
  *(void *)v26 = 0x600000001LL;
  if (sysctl(v26, 2u, &v23, &v22, 0LL, 0LL) == -1)
  {
    id v21 = "sysctl(... kern.maxproc ...)";
LABEL_31:
    perror(v21);
    return 0;
  }

  int v5 = v23;
  id v6 = (char *)malloc(4LL * v23);
  if (!v6)
  {
    id v21 = "malloc";
    goto LABEL_31;
  }

  uint64_t v7 = v6;
  int v8 = proc_listallpids(v6, 4 * v5);
  if (v8 == -1)
  {
    perror("proc_listallpids");
    goto LABEL_17;
  }

  if (v8 < 1)
  {
LABEL_17:
    free(v7);
    return 0;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 4LL * v8;
  while (1)
  {
    bzero(buffer, 0x400uLL);
    int v11 = *(_DWORD *)&v7[v9];
    proc_pidpath(v11, buffer, 0x400u);
    BOOL v12 = buffer[0] == 0x62696C2F7273752FLL && buffer[1] == 0x7379732F63657865LL;
    BOOL v13 = v12 && buffer[2] == 0x65736F6E67616964LL;
    if (v13 && v25 == 100) {
      break;
    }
    v9 += 4LL;
    if (v10 == v9) {
      goto LABEL_17;
    }
  }

  free(v7);
  if (v11 < 1) {
    return 0;
  }
  [a1 setupConnection];
  uint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v18, "REQUEST_TYPE", 7uLL);
    xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(v17, v18);
    if ([a1 verifyReply:v19 withExpectedType:MEMORY[0x1895F9250] forError:a3]
      && xpc_dictionary_get_uint64(v19, "RESPONSE_TYPE") == 1)
    {
      string = xpc_dictionary_get_string(v19, "status");
      BOOL v15 = strcmp(string, "Running") == 0;
    }

    else
    {
      BOOL v15 = 0;
    }
  }

  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Failed to create the xpc_connection to sysdiagnose",  &unk_18A141100,  a3);
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)cancelActiveSysdiagnoseWithError:(id *)a3
{
  int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 4uLL);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    else {
      BOOL v8 = 0;
    }
  }

  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Failed to create the xpc_connection for cancellation",  &unk_18A141100,  a3);
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)fetchDiagnosticIDFromDeviceSource:(unint64_t)a3 WithMaxCount:(unint64_t)a4 withError:(id *)a5
{
  char v7 = a3;
  uint64_t v65 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v9 = (void *)MEMORY[0x189604030];
  [MEMORY[0x189611B08] sharedInstance];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 pathSubmission];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fileURLWithPath:v12 isDirectory:1];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    goto LABEL_21;
  }
  [MEMORY[0x1896078A8] defaultManager];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  *MEMORY[0x189603C48],  *MEMORY[0x189603D00],  *MEMORY[0x189603D10],  0);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 enumeratorAtURL:v13 includingPropertiesForKeys:v15 options:7 errorHandler:&__block_literal_global_97];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16) {
    goto LABEL_20;
  }
  id v48 = v13;
  char v49 = v7;
  id v50 = a5;
  unint64_t v51 = a4;
  v52 = v8;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  v47 = v16;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (!v18)
  {
    id v20 = 0LL;
    goto LABEL_19;
  }

  uint64_t v19 = v18;
  id v20 = 0LL;
  uint64_t v21 = *(void *)v58;
  do
  {
    for (uint64_t i = 0LL; i != v19; ++i)
    {
      if (*(void *)v58 != v21) {
        objc_enumerationMutation(v17);
      }
      int v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      [v23 lastPathComponent];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v24 containsString:@".tar"])
      {
      }

      else
      {
        [v23 lastPathComponent];
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = [v25 containsString:@".tar.gz"];

        if (!v26) {
          continue;
        }
      }

      [v23 lastPathComponent];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = extractDiagnosticID(v27);

      if (v28)
      {
        [v52 addObject:v28];
        id v20 = (void *)v28;
      }

      else
      {
        id v20 = 0LL;
      }
    }

    uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v64 count:16];
  }

  while (v19);
LABEL_19:

  a4 = v51;
  BOOL v8 = v52;
  char v7 = v49;
  a5 = v50;
  uint64_t v16 = v47;
  BOOL v13 = v48;
LABEL_20:

LABEL_21:
LABEL_22:
  if ((v7 & 2) != 0)
  {
    +[Libsysdiagnose fetchRemoteDiagnosticIDsWithError:]( &OBJC_CLASS___Libsysdiagnose,  "fetchRemoteDiagnosticIDsWithError:",  a5);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = v29;
    if (v29 && [v29 count])
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        __int128 v34 = 0LL;
        uint64_t v35 = *(void *)v54;
        do
        {
          uint64_t v36 = 0LL;
          uint64_t v37 = v34;
          do
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v31);
            }
            extractDiagnosticID(*(void **)(*((void *)&v53 + 1) + 8 * v36));
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34) {
              [v8 addObject:v34];
            }
            ++v36;
            uint64_t v37 = v34;
          }

          while (v33 != v36);
          uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }

        while (v33);
      }
    }
  }

  if ([v8 count])
  {
    [v8 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 reverseObjectEnumerator];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 allObjects];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v40;
      _os_log_impl( &dword_187DBA000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Considering the following diagnosticIDs %@",  buf,  0xCu);
    }

    unint64_t v41 = [v40 count];
    if (v41 >= a4) {
      unint64_t v42 = a4;
    }
    else {
      unint64_t v42 = v41;
    }
    if (a4) {
      unint64_t v43 = v42;
    }
    else {
      unint64_t v43 = v41;
    }
    objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", 0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 objectsAtIndexes:v44];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187DBA000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Did not match any diagnosticIDs.",  buf,  2u);
    }

    id v45 = v8;
  }

  return v45;
}

uint64_t __75__Libsysdiagnose_fetchDiagnosticIDFromDeviceSource_WithMaxCount_withError___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [a3 localizedDescription];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138412290;
    char v7 = v4;
    _os_log_impl(&dword_187DBA000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1LL;
}

+ (id)fetchRemoteDiagnosticIDsWithError:(id *)a3
{
  id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "REQUEST_TYPE", 9uLL);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    char v7 = v6;
    if (v6 && MEMORY[0x1895B7B3C](v6) == MEMORY[0x1895F9250] && xpc_dictionary_get_uint64(v7, "RESPONSE_TYPE") == 1)
    {
      xpc_dictionary_get_value(v7, "archive_list");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FA8] array];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        size_t count = xpc_array_get_count(v8);
        if (count)
        {
          size_t v11 = count;
          for (size_t i = 0LL; i != v11; ++i)
          {
            string = xpc_array_get_string(v8, i);
            if (string)
            {
              [NSString stringWithUTF8String:string];
              id v14 = (void *)objc_claimAutoreleasedReturnValue();
              [v9 addObject:v14];
            }
          }
        }

        id v15 = v9;
      }

      else
      {
        +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"sysdiagnose server returned malformed response",  &unk_18A141100,  a3);
        id v15 = 0LL;
      }
    }

    else
    {
      +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Couldn't get valid reply from sysdiagnose server",  &unk_18A141100,  a3);
      id v15 = 0LL;
    }
  }

  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:]( &OBJC_CLASS___Libsysdiagnose,  "addErrorString:WithCode:forError:",  @"Failed to create the xpc_connection for fetching diagnosticIDs from remote device",  &unk_18A141100,  a3);
    id v15 = 0LL;
  }

  return v15;
}

+ (id)getSysdiagnoseCrashLog
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v2 = [MEMORY[0x189604030] fileURLWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/"];
  [MEMORY[0x1896078A8] defaultManager];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", *MEMORY[0x189603D00], *MEMORY[0x189603D10], 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = (void *)v2;
  [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&__block_literal_global_112];
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:-600.0];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v7)
  {
    id v29 = 0LL;
    id v33 = 0LL;
    id v31 = 0LL;
    goto LABEL_25;
  }

  uint64_t v8 = v7;
  id v29 = 0LL;
  id v33 = 0LL;
  id v31 = 0LL;
  uint64_t v9 = *(void *)v37;
  uint64_t v28 = *MEMORY[0x189603B88];
  uint64_t v10 = @"sysdiagnose";
  uint64_t v32 = *(void *)v37;
  do
  {
    uint64_t v11 = 0LL;
    uint64_t v34 = v8;
    do
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      BOOL v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
      [v12 absoluteString];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 lastPathComponent];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v14 containsString:v10] & 1) == 0) {
        goto LABEL_9;
      }
      [v12 absoluteString];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 lastPathComponent];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v16 containsString:@"sysdiagnose_helper"])
      {

LABEL_9:
LABEL_10:

        goto LABEL_19;
      }

      id v17 = v10;
      id v18 = v6;
      [v12 absoluteString];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = [v19 hasSuffix:@".ips"];

      if (!v20) {
        goto LABEL_17;
      }
      id v35 = 0LL;
      [v12 getResourceValue:&v35 forKey:v28 error:0];
      id v21 = v35;

      if ([v21 compare:v30] != 1)
      {
        id v33 = v21;
LABEL_17:
        id v6 = v18;
        uint64_t v9 = v32;
        uint64_t v10 = v17;
        goto LABEL_18;
      }

      id v6 = v18;
      uint64_t v10 = v17;
      if (!v31 || [v29 compare:v21] != 1)
      {
        id v22 = v12;

        id v23 = v21;
        BOOL v13 = v29;
        id v33 = v23;
        id v29 = v23;
        id v31 = v22;
        uint64_t v9 = v32;
        uint64_t v8 = v34;
        goto LABEL_10;
      }

      id v33 = v21;
      uint64_t v9 = v32;
LABEL_18:
      uint64_t v8 = v34;
LABEL_19:
      ++v11;
    }

    while (v8 != v11);
    uint64_t v24 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
    uint64_t v8 = v24;
  }

  while (v24);
LABEL_25:

  [v31 path];
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __40__Libsysdiagnose_getSysdiagnoseCrashLog__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [a3 localizedDescription];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_187DBA000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1LL;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_187DBA000, log, OS_LOG_TYPE_ERROR, "More than 100 progress reported", v1, 2u);
}

@end