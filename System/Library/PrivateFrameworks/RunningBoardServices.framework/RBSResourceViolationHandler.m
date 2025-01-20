@interface RBSResourceViolationHandler
+ (void)notifyCPUViolation:(int)a3;
@end

@implementation RBSResourceViolationHandler

+ (void)notifyCPUViolation:(int)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  mach_service = xpc_connection_create_mach_service("com.apple.runningboard.resource_notify", 0LL, 2uLL);
  if (mach_service)
  {
    rbs_process_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = a3;
      _os_log_impl( &dword_185F67000,  v5,  OS_LOG_TYPE_DEFAULT,  "Notified CPU resource violation on pid:%d",  (uint8_t *)v23,  8u);
    }

    xpc_connection_set_event_handler(mach_service, &__block_literal_global_13);
    xpc_connection_resume(mach_service);
    v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "cmd", 1uLL);
    xpc_dictionary_set_uint64(v6, "pid", a3);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
    if (!v7)
    {
      rbs_general_log();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[RBSResourceViolationHandler notifyCPUViolation:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  else
  {
    rbs_general_log();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      +[RBSResourceViolationHandler notifyCPUViolation:].cold.1((os_log_s *)v6, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

+ (void)notifyCPUViolation:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)notifyCPUViolation:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end