void sub_18876C934( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

LABEL_30:
        v13 = 0LL;
        goto LABEL_31;
      }

      -[HIDPreferencesHelperClient setDomain:value:domain:](self, "setDomain:value:domain:", v11, 0LL, v10);
      v13 = 0LL;
      v12 = 0LL;
      v14 = 0LL;
LABEL_53:

      _Block_object_dispose(&v41, 8);
      return v14;
    default:
      _IOHIDLogCategory();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[HIDPreferencesHelperClient handleMessage:].cold.3();
      }

      goto LABEL_29;
  }
}

void sub_18876D5C0(_Unwind_Exception *a1)
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

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_18876EC2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_22:
}
}

LABEL_26:
}

void OUTLINED_FUNCTION_2_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

const char *OUTLINED_FUNCTION_8(xpc_type_t type)
{
  return xpc_type_get_name(type);
}

uint64_t HIDPreferencesCreateInstance()
{
  return 0LL;
}

void HIDPreferencesSetForInstance( int a1, CFStringRef key, CFPropertyListRef value, const __CFString *a4, const __CFString *a5, CFStringRef applicationID)
{
}

void HIDPreferencesSetMultipleForInstance( int a1, CFDictionaryRef keysToSet, CFArrayRef keysToRemove, const __CFString *a4, const __CFString *a5, CFStringRef applicationID)
{
}

CFPropertyListRef HIDPreferencesCopyForInstance( int a1, CFStringRef key, const __CFString *a3, const __CFString *a4, CFStringRef applicationID)
{
  return CFPreferencesCopyValue(key, applicationID, a3, a4);
}

CFDictionaryRef HIDPreferencesCopyMultipleForInstance( int a1, CFArrayRef keysToFetch, const __CFString *a3, const __CFString *a4, CFStringRef applicationID)
{
  return CFPreferencesCopyMultiple(keysToFetch, applicationID, a3, a4);
}

uint64_t HIDPreferencesSynchronizeForInstance( int a1, const __CFString *a2, const __CFString *a3, CFStringRef applicationID)
{
  return CFPreferencesSynchronize(applicationID, a2, a3);
}

CFPropertyListRef HIDPreferencesCopyDomainForInstance(int a1, CFStringRef key, CFStringRef applicationID)
{
  return CFPreferencesCopyAppValue(key, applicationID);
}

void HIDPreferencesSetDomainForInstance( int a1, CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void HIDPreferencesSet( const __CFString *a1, const void *a2, CFStringRef userName, CFStringRef hostName, CFStringRef applicationID)
{
}

CFPropertyListRef HIDPreferencesCopy( const __CFString *a1, CFStringRef userName, CFStringRef hostName, CFStringRef applicationID)
{
  return CFPreferencesCopyValue(a1, applicationID, userName, hostName);
}

uint64_t HIDPreferencesSynchronize(CFStringRef userName, CFStringRef hostName, CFStringRef applicationID)
{
  return CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFDictionaryRef HIDPreferencesCopyMultiple( const __CFArray *a1, CFStringRef userName, CFStringRef hostName, CFStringRef applicationID)
{
  return CFPreferencesCopyMultiple(a1, applicationID, userName, hostName);
}

void HIDPreferencesSetMultiple( const __CFDictionary *a1, const __CFArray *a2, CFStringRef userName, CFStringRef hostName, CFStringRef applicationID)
{
}

void sub_1887703D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x189608638]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
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

void objc_release(id a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1895FE0C0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}