id STCreateErrorWithInfo( void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  os_log_s *v20;
  void *v21;
  void *v22;
  void *v23;
  CFStringRef v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  CFStringRef v41;
  uint64_t v42;
  v42 = *MEMORY[0x1895F89C0];
  v15 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  [NSString stringWithFormat:@"[%s:%d][%s] %@", a7, a8, a6, v16];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  STGetLogHandle();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v25 = &stru_18A24C1A8;
    *(_DWORD *)buf = 136448002;
    v27 = "STCreateErrorWithInfo";
    v28 = 2080;
    if (v17) {
      v25 = v17;
    }
    v29 = a7;
    v30 = 1024;
    v31 = a8;
    v32 = 2080;
    v33 = a6;
    v34 = 2112;
    v35 = v15;
    v36 = 2048;
    v37 = a2;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v25;
    _os_log_error_impl( &dword_1884F9000,  v20,  OS_LOG_TYPE_ERROR,  "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n",  buf,  0x4Eu);
  }

  if (v18)
  {
    v21 = (void *)[v18 mutableCopy];
  }

  else
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v22 = v21;
  [v21 setObject:v19 forKey:*MEMORY[0x189607490]];
  if (v17) {
    [v22 setObject:v17 forKey:*MEMORY[0x189607798]];
  }
  [MEMORY[0x189607870] errorWithDomain:v15 code:a2 userInfo:v22];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id STCreateError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return STCreateErrorWithInfo(a1, a2, a3, a4, 0LL, a5, a6, a7);
}

LABEL_11:
  }

  return v4;
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

id STGetLogHandle()
{
  if (STGetLogHandle_onceToken != -1) {
    dispatch_once(&STGetLogHandle_onceToken, &__block_literal_global);
  }
  return (id)STGetLogHandle_logHandle;
}

void __STGetLogHandle_block_invoke()
{
  v0 = STGetLoggingCategory();
  os_log_t v1 = os_log_create("com.apple.StreamingExtractor", v0);
  v2 = (void *)STGetLogHandle_logHandle;
  STGetLogHandle_logHandle = (uint64_t)v1;
}

id STGetSignpostHandle()
{
  if (STGetSignpostHandle_onceToken != -1) {
    dispatch_once(&STGetSignpostHandle_onceToken, &__block_literal_global_2);
  }
  return (id)STGetSignpostHandle_signpostHandle;
}

void __STGetSignpostHandle_block_invoke()
{
  v0 = STGetLoggingCategory();
  os_log_t v1 = os_log_create("com.apple.StreamingExtractor.signposts", v0);
  v2 = (void *)STGetSignpostHandle_signpostHandle;
  STGetSignpostHandle_signpostHandle = (uint64_t)v1;
}
}

void sub_1884FC478( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
}

void sub_1884FDAD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
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

void sub_18850051C(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_3_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_6(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
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

void OUTLINED_FUNCTION_13(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_16(uint64_t a1@<X8>)
{
  *(void *)(v1 - 56) = a1;
}

  ;
}

void OUTLINED_FUNCTION_18( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_20(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t OUTLINED_FUNCTION_21(void *a1, const char *a2)
{
  return [a1 UTF8String];
}

void OUTLINED_FUNCTION_22(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x260], 8) = a1;
}

uint64_t OUTLINED_FUNCTION_23(void *a1, const char *a2)
{
  return [a1 UTF8String];
}

const char *STGetLoggingCategory()
{
  return "framework";
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void free(void *a1)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1895FDA38]();
}

uint64_t objc_msgSend_remote_prepareForExtractionToPath_sandboxExtensionToken_options_withCompletionBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_remote_prepareForExtractionToPath_sandboxExtensionToken_options_withCompletionBlock_);
}