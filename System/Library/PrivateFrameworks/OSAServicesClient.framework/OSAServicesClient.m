void sub_1861A6D54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_4(id *a1)
{
  return [*a1 count];
}

id OSADiagnosticMonitorServerInterface()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x189604010];
  uint64_t v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setClasses:v3 forSelector:sel_registerForEvents_replyHandler_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_registerForWrites_replyHandler_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t OSADiagnosticMonitorClientInterface()
{
  return [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C68D4E8];
}

id DiagnosticMonitorLog()
{
  if (DiagnosticMonitorLog_onceToken != -1) {
    dispatch_once(&DiagnosticMonitorLog_onceToken, &__block_literal_global_0);
  }
  return (id)DiagnosticMonitorLog___log;
}

void __DiagnosticMonitorLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.osanalytics", "DiagnosticMonitor");
  v1 = (void *)DiagnosticMonitorLog___log;
  DiagnosticMonitorLog___log = (uint64_t)v0;
}

void sub_1861A82E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1861A83EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1861A8938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       -[OSAServicesClient queryKey:](self, "queryKey:", @"InverseDeviceID");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", @"<no_entitlement>"))
  {

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( &dword_1861A4000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error while retrieving crashreporterKey. Does this process have the entitlement - com.apple.osanalytics.otataski ng-service-access ?",  v4,  2u);
    }

    if (crashreporterKey_onceToken != -1) {
      dispatch_once(&crashreporterKey_onceToken, &__block_literal_global_80);
    }
    uint64_t v2 = @"baadbaadbaaadbaaaadbaadbaadbaaadbaaaad03";
  }

  return v2;
}

void __37__OSAServicesClient_crashreporterKey__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
  if (v0) {
    __37__OSAServicesClient_crashreporterKey__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (id)awdKey
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0LL;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__OSAServicesClient_awdKey__block_invoke;
  v7[3] = &unk_189E1D720;
  v7[4] = &v8;
  -[OTAAgentServices awdKeyWithReply:](synchRemoteObjectProxy, "awdKeyWithReply:", v7);
  if ([(id)v9[5] isEqualToString:@"<no_entitlement>"])
  {
    uint64_t v3 = (void *)v9[5];
    v9[5] = (uint64_t)@"baadbaadbaaadbaaaadbaadbaadbaaadbaaaad03";

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( &dword_1861A4000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error while retrieving awdKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?",  v6,  2u);
    }

    if (awdKey_onceToken != -1) {
      dispatch_once(&awdKey_onceToken, &__block_literal_global_82);
    }
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __27__OSAServicesClient_awdKey__block_invoke(uint64_t a1, void *a2)
{
}

void __27__OSAServicesClient_awdKey__block_invoke_81()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
  if (v0) {
    __37__OSAServicesClient_crashreporterKey__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (unsigned)uidForUser:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = getpwnam((const char *)[v3 UTF8String]);
  if (v4)
  {
    unsigned int pw_uid = v4->pw_uid;
    if (!pw_uid && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v7 = "Modifying defaults as root is not allowed, skipping request";
      uint32_t v8 = 2;
LABEL_7:
      _os_log_impl(&dword_1861A4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
      unsigned int pw_uid = 0;
    }
  }

  else
  {
    unsigned int pw_uid = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v7 = "Unknown user '%@', skipping request";
      uint32_t v8 = 12;
      goto LABEL_7;
    }
  }

  return pw_uid;
}

- (void).cxx_destruct
{
}

- (void)queryKey:.cold.1()
{
  __assert_rtn( "-[OSAServicesClient queryKey:]",  "OSAServicesClient.m",  93,  "CFEqual(question, kMGQInverseDeviceID)");
}

void __37__OSAServicesClient_crashreporterKey__block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end