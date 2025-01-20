}

LABEL_20:
          goto LABEL_21;
        }

        v26 = (os_log_s *)_log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_187DBA000, v26, OS_LOG_TYPE_DEFAULT, "Undefined type in the metadata", buf, 2u);
        }

LABEL_21:
        ++v12;
      }

      while (v10 != v12);
      v27 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      v10 = v27;
    }

    while (v27);
  }

  return v4;
}

void sub_187DBC348(_Unwind_Exception *a1)
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

uint64_t __Block_byref_object_copy__64(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895B795C](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
}

void sub_187DBCFFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id extractDiagnosticID(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v1;
    __int16 v14 = 2112;
    v15 = @"(remote:){0,1}(sysdiagnose_){1}[0-9]{4}\\.[0-9]{2}\\.[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}[-+]{1}[0-9]{4}";
    _os_log_impl(&dword_187DBA000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "comparing %@ to pattern %@", buf, 0x16u);
  }

  id v11 = 0LL;
  [MEMORY[0x189607A00] regularExpressionWithPattern:@"(remote:){0,1}(sysdiagnose_){1}[0-9]{4}\\.[0-9]{2}\\.[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}[-+]{1}[0-9]{4}" options:1 error:&v11];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v11;
  if (v2)
  {
    objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 range];
      objc_msgSend(v1, "substringWithRange:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v1;
        _os_log_impl( &dword_187DBA000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "File %@ did not match diagnosticID pattern",  buf,  0xCu);
      }

      v8 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v3 localizedDescription];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl( &dword_187DBA000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to compile regex with error: %@",  buf,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void perror(const char *a1)
{
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8B0](buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
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

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return result;
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

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}