void sub_189442B4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_189442E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1894432B8(_Unwind_Exception *a1)
{
}
}

void sub_18944364C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_189443974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id PPSMetricMonitorLogHandleForCategory(uint64_t a1)
{
  if (PPSMetricMonitorLogHandleForCategory_onceToken != -1) {
    dispatch_once(&PPSMetricMonitorLogHandleForCategory_onceToken, &__block_literal_global_0);
  }
  if (PPSMetricMonitorLogHandleForCategory_logHandles[a1]) {
    v2 = (void *)PPSMetricMonitorLogHandleForCategory_logHandles[a1];
  }
  else {
    v2 = (void *)MEMORY[0x1895F8DA8];
  }
  return v2;
}

void __PPSMetricMonitorLogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerMetricMonitor", "unspecified");
  v1 = (void *)PPSMetricMonitorLogHandleForCategory_logHandles[0];
  PPSMetricMonitorLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.PerfPowerMetricMonitor", "client");
  uint64_t v3 = (void *)qword_18C505858;
  qword_18C505858 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.PerfPowerMetricMonitor", "service");
  v5 = (void *)qword_18C505860;
  qword_18C505860 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.PerfPowerMetricMonitor", "xpc");
  v7 = (void *)qword_18C505868;
  qword_18C505868 = (uint64_t)v6;
}

void sub_1894442C4(_Unwind_Exception *a1)
{
}

void sub_189444620( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_18944480C(_Unwind_Exception *a1)
{
}

void sub_189444A10(_Unwind_Exception *a1)
{
}

void sub_189444B8C(_Unwind_Exception *a1)
{
}

void sub_189444DFC(_Unwind_Exception *a1)
{
}

void sub_189445134(_Unwind_Exception *a1)
{
}

void sub_189445748(_Unwind_Exception *a1)
{
}

void sub_1894459B8(_Unwind_Exception *a1)
{
}

LABEL_12:
  v25 = 0;
LABEL_14:

  return v25;
}

void sub_189445E18(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1894475E0(_Unwind_Exception *a1)
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

id PPSTimeStringFromDate(void *a1)
{
  uint64_t v1 = PPSTimeStringFromDate_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&PPSTimeStringFromDate_onceToken, &__block_literal_global_4);
  }
  [(id)PPSTimeStringFromDate_dateFormatter stringFromDate:v2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __PPSTimeStringFromDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  uint64_t v1 = (void *)PPSTimeStringFromDate_dateFormatter;
  PPSTimeStringFromDate_dateFormatter = (uint64_t)v0;

  return [(id)PPSTimeStringFromDate_dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
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