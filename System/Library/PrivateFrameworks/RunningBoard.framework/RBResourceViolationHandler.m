@interface RBResourceViolationHandler
+ (id)sharedInstance;
- (void)handleCPUViolationMessage:(uint64_t)a1 fromConnection:(void *)a2;
- (void)handleMessage:(void *)a3 fromConnection:;
- (void)startWithAssertionManager:(uint64_t)a1;
@end

@implementation RBResourceViolationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  return (id)sharedInstance_shared;
}

void __44__RBResourceViolationHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RBResourceViolationHandler);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;
}

- (void)handleCPUViolationMessage:(uint64_t)a1 fromConnection:(void *)a2
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "pid");
    [MEMORY[0x1896122E0] identifierWithPid:uint64];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_process_log();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = uint64;
      _os_log_impl(&dword_188634000, v7, OS_LOG_TYPE_DEFAULT, "handleCPUViolationMessage on pid:%d", (uint8_t *)v12, 8u);
    }

    if ([*(id *)(a1 + 8) invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:v6])
    {
      rbs_process_log();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "handleCPUViolationMessage removed assertions",  (uint8_t *)v12,  2u);
      }
    }

    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      xpc_dictionary_get_remote_connection(v4);
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v10, reply);

      rbs_process_log();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:].cold.2();
      }
    }

    else
    {
      rbs_process_log();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:].cold.1();
      }
    }
  }
}

- (void)handleMessage:(void *)a3 fromConnection:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int uint64 = xpc_dictionary_get_uint64(v5, "cmd");
    if (uint64 == 1)
    {
      activity_block[0] = MEMORY[0x1895F87A8];
      activity_block[1] = 3221225472LL;
      activity_block[2] = __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke;
      activity_block[3] = &unk_18A255970;
      activity_block[4] = a1;
      id v10 = v5;
      id v11 = v6;
      _os_activity_initiate(&dword_188634000, "handleCPUViolationMessage", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }

    else
    {
      rbs_general_log();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleMessage:fromConnection:].cold.1(uint64, v8);
      }
    }
  }
}

void __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke(uint64_t a1)
{
}

- (void)startWithAssertionManager:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.runningboard.resourceviolationhandler", v5);
    v7 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v6;

    objc_storeStrong((id *)(a1 + 8), a2);
    xpc_connection_t mach_service = xpc_connection_create_mach_service( (const char *)*MEMORY[0x1896124B8],  *(dispatch_queue_t *)(a1 + 16),  1uLL);
    v9 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = mach_service;

    id v10 = *(_xpc_connection_s **)(a1 + 24);
    if (v10)
    {
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke;
      handler[3] = &unk_18A2559C0;
      handler[4] = a1;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 24));
      rbs_general_log();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_188634000, v11, OS_LOG_TYPE_DEFAULT, "Resource violation server running", v12, 2u);
      }
    }

    else
    {
      rbs_general_log();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler startWithAssertionManager:].cold.1();
      }
    }
  }
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1895CA750]();
  if (v4 == MEMORY[0x1895F9238])
  {
    id v13 = v3;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2;
    v14[3] = &unk_18A255998;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v13;
    xpc_connection_set_event_handler((xpc_connection_t)v13, v14);
    xpc_connection_resume((xpc_connection_t)v13);
  }

  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x1895F9268])
    {
      if (v3 == (id)MEMORY[0x1895F91A0])
      {
        rbs_general_log();
        dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1();
        }
      }

      else
      {
        if (v3 != (id)MEMORY[0x1895F9198]) {
          goto LABEL_7;
        }
        rbs_general_log();
        dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2();
        }
      }
    }

    else
    {
      rbs_general_log();
      dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
      }
    }
  }

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  rbs_general_log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_188634000, v4, OS_LOG_TYPE_DEFAULT, "received incoming resource violation message", v14, 2u);
  }

  uint64_t v5 = MEMORY[0x1895CA750](v3);
  if (v5 == MEMORY[0x1895F9250])
  {
    -[RBResourceViolationHandler handleMessage:fromConnection:](*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
  }

  else
  {
    uint64_t v6 = v5;
    if (v5 == MEMORY[0x1895F9268])
    {
      if (v3 == (id)MEMORY[0x1895F91A0])
      {
        rbs_general_log();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1();
        }
      }

      else
      {
        if (v3 != (id)MEMORY[0x1895F9198]) {
          goto LABEL_9;
        }
        rbs_general_log();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2();
        }
      }
    }

    else
    {
      rbs_general_log();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      }
    }
  }

- (void).cxx_destruct
{
}

- (void)handleCPUViolationMessage:fromConnection:.cold.1()
{
}

- (void)handleCPUViolationMessage:fromConnection:.cold.2()
{
}

- (void)handleMessage:(int)a1 fromConnection:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "unrecognized command for resource violation server: %ul",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startWithAssertionManager:.cold.1()
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1()
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2()
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1()
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2()
{
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end