void wd_optin_service_register(void *a1, void *a2, void *a3)
{
  id v5;
  dispatch_queue_s *v6;
  id v7;
  void (**v8)(void, void);
  _xpc_connection_s *mach_service;
  void *v10;
  _xpc_connection_s *v11;
  void v12[4];
  _xpc_connection_s *v13;
  void (**v14)(void, void);
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5) {
    wd_optin_service_register_cold_1();
  }
  if (!v6) {
    wd_optin_service_register_cold_1();
  }
  v8 = (void (**)(void, void))v7;
  if (!v7) {
    wd_optin_service_register_cold_1();
  }
  if (runtime_optin_supported())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0LL, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global);
    xpc_connection_activate(mach_service);
    wd_generate_optin_service_req(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __wd_optin_service_register_block_invoke_21;
    v12[3] = &unk_18A3AED30;
    v13 = mach_service;
    v14 = v8;
    v11 = mach_service;
    xpc_connection_send_message_with_reply(v11, v10, v6, v12);
  }

  else
  {
    *__error() = 45;
    v8[2](v8, 0LL);
  }
}

BOOL runtime_optin_supported()
{
  if ((os_variant_is_darwinos() & 1) != 0)
  {
    if (is_virtual_machine_onceToken != -1) {
      dispatch_once(&is_virtual_machine_onceToken, &__block_literal_global_25);
    }
    if (is_virtual_machine_result)
    {
      BOOL result = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (result)
      {
        runtime_optin_supported_cold_2(result, v1, v2, v3, v4, v5, v6, v7);
        return 0LL;
      }
    }

    else
    {
      if (watchdog_monitoring_enabled_onceToken != -1) {
        dispatch_once(&watchdog_monitoring_enabled_onceToken, &__block_literal_global_27);
      }
      if (watchdog_monitoring_enabled_wdt_enabled != 1) {
        return 1LL;
      }
      BOOL result = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (result)
      {
        runtime_optin_supported_cold_1(result, v15, v16, v17, v18, v19, v20, v21);
        return 0LL;
      }
    }
  }

  else
  {
    BOOL result = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (result)
    {
      runtime_optin_supported_cold_3(result, v8, v9, v10, v11, v12, v13, v14);
      return 0LL;
    }
  }

  return result;
}

void __wd_optin_service_register_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1895E7C8C](a2) != MEMORY[0x1895F9268])
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v2) {
      __wd_optin_service_register_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

id wd_generate_optin_service_req(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "watchdogd_request_command", 0LL);
  if (!v1) {
    goto LABEL_4;
  }
  id v8 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v1 format:200 options:0 error:&v8];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
    xpc_dictionary_set_data( v2,  "watchdogd_optin_service_identifier",  (const void *)[v5 bytes],  objc_msgSend(v5, "length"));

LABEL_4:
    id v6 = v2;
    goto LABEL_8;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    wd_generate_optin_service_req_cold_1(v4);
  }

  id v6 = 0LL;
LABEL_8:

  return v6;
}

void __wd_optin_service_register_block_invoke_21(uint64_t a1, void *a2)
{
}

uint64_t check_and_log_result(void *a1)
{
  id v1 = a1;
  if (MEMORY[0x1895E7C8C]() == MEMORY[0x1895F9268])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      check_and_log_result_cold_1(v1);
    }
    uint64_t v3 = __error();
    uint64_t v2 = 0LL;
    int v4 = 61;
    goto LABEL_7;
  }

  if (MEMORY[0x1895E7C8C](v1) != MEMORY[0x1895F9250])
  {
    uint64_t v2 = 0LL;
    goto LABEL_8;
  }

  int int64 = xpc_dictionary_get_int64(v1, "watchdogd_request_result");
  if (int64 != 1)
  {
    if (int64)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        check_and_log_result_cold_2(int64);
      }
      uint64_t v3 = __error();
      if ((int64 & 0xFFFFFFFE) == 2)
      {
        uint64_t v2 = 0LL;
        int v4 = 1;
      }

      else
      {
        uint64_t v2 = 0LL;
        int v4 = 22;
      }
    }

    else
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v7) {
        check_and_log_result_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      uint64_t v3 = __error();
      uint64_t v2 = 0LL;
      int v4 = 94;
    }

LABEL_7:
    *uint64_t v3 = v4;
    goto LABEL_8;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1894AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "optin registration successful", v15, 2u);
  }

  uint64_t v2 = 1LL;
LABEL_8:

  return v2;
}

uint64_t wd_optin_service_register_sync(void *a1)
{
  id v1 = a1;
  if (!v1) {
    wd_optin_service_register_cold_1();
  }
  uint64_t v2 = v1;
  if (runtime_optin_supported())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0LL, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_22);
    xpc_connection_activate(mach_service);
    wd_generate_optin_service_req(v2);
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(mach_service, v4);
    uint64_t v6 = check_and_log_result(v5);
    xpc_connection_cancel(mach_service);
  }

  else
  {
    uint64_t v6 = 0LL;
    *__error() = 45;
  }

  return v6;
}

void __wd_optin_service_register_sync_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1895E7C8C](a2) != MEMORY[0x1895F9268])
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v2) {
      __wd_optin_service_register_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

uint64_t __is_virtual_machine_block_invoke()
{
  int v2 = 0;
  size_t v1 = 4LL;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL);
  if (!(_DWORD)result) {
    is_virtual_machine_uint64_t result = v2 != 0;
  }
  return result;
}

uint64_t __watchdog_monitoring_enabled_block_invoke()
{
  if (get_current_bootargs_onceToken != -1) {
    dispatch_once(&get_current_bootargs_onceToken, &__block_literal_global_29);
  }
  uint64_t result = os_parse_boot_arg_from_buffer_int();
  return result;
}

void __get_current_bootargs_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  size_t v0 = 1024LL;
  if (sysctlbyname("kern.bootargs", &boot_args_str, &v0, 0LL, 0LL))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __get_current_bootargs_block_invoke_cold_1();
    }
    _os_crash();
    __break(1u);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v2 = &boot_args_str;
    _os_log_impl( &dword_1894AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "retrieved current device boot-args: %s",  buf,  0xCu);
  }

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_assert_log();
}

void wd_optin_service_register_cold_1()
{
}

void runtime_optin_supported_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void runtime_optin_supported_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void runtime_optin_supported_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __wd_optin_service_register_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void wd_generate_optin_service_req_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1( &dword_1894AC000,  MEMORY[0x1895F8DA0],  v2,  "Unable to create plist out of services - %s",  v3,  v4,  v5,  v6,  2u);
}

void check_and_log_result_cold_1(void *a1)
{
}

void check_and_log_result_cold_2(int a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_1894AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "optin registration failed due to %d",  (uint8_t *)v1,  8u);
  OUTLINED_FUNCTION_2();
}

void check_and_log_result_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0( &dword_1894AC000,  MEMORY[0x1895F8DA0],  a3,  "result doesn't have a valid return",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_2();
}

void __get_current_bootargs_block_invoke_cold_1()
{
  size_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1( &dword_1894AC000,  MEMORY[0x1895F8DA0],  v1,  "could not retrieve device boot-args, failed with error: %s",  v2,  v3,  v4,  v5,  2u);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_parse_boot_arg_from_buffer_int()
{
  return MEMORY[0x1895FC5D8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
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

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}