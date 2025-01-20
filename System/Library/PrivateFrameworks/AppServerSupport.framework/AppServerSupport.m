uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_crash_msg();
}

  ;
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t _xpc_mach_port_close_recv( mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return mach_port_destruct(*MEMORY[0x1895FBBE0], name, srdelta, guard);
}

uint64_t launch_get_running_pid_4SB(const char *a1, _DWORD *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = _xpc_service_routine();
  if (!(_DWORD)v4) {
    *a2 = xpc_dictionary_get_int64(0LL, "pid");
  }

  return v4;
}

id _create_app_request(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  xpc_dictionary_set_string(v2, "name", a1);
  return v2;
}

uint64_t _launch_get_last_exit_reason_4SB(const char *a1, uint64_t *a2, uint64_t a3)
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = _xpc_service_routine();
  if (!(_DWORD)v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(0LL, "termination-state");
    *a2 = uint64;
    if (uint64 == 128)
    {
      int v8 = xpc_dictionary_get_uint64(0LL, "os-namespace");
      uint64_t v9 = xpc_dictionary_get_uint64(0LL, "os-code");
      *(_DWORD *)a3 = v8;
      *(void *)(a3 + 8) = v9;
    }
  }

  return v6;
}

id _os_launch_job_log()
{
  if (_os_launch_job_log_once != -1) {
    dispatch_once(&_os_launch_job_log_once, &__block_literal_global);
  }
  return (id)_os_launch_job_log_log;
}

LABEL_16:
      }
    }

    else if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
    {
      _os_launch_job_log();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (const char *)&unk_186C8F9CE;
        if ((_DWORD)v7 == 36) {
          uint64_t v9 = " (EINPROGRESS)";
        }
        *(_DWORD *)buf = 138543618;
        v15 = self;
        v16 = 2080;
        *(void *)v17 = v9;
        v10 = "%{public}@: remove succeeded%s";
        v11 = v8;
        v12 = 22;
        goto LABEL_15;
      }

      goto LABEL_16;
    }

    goto LABEL_21;
  }

  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl( &dword_186C88000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: remove on a job with no handle (ESRCH)",  buf,  0xCu);
    }

    v7 = 3LL;
LABEL_21:

    if (!a3) {
      return (_DWORD)v7 == 0;
    }
    goto LABEL_22;
  }

  v7 = 3LL;
  if (!a3) {
    return (_DWORD)v7 == 0;
  }
LABEL_22:
  if ((_DWORD)v7)
  {
    +[OSLaunchdError createXPCError:](&OBJC_CLASS___OSLaunchdError, "createXPCError:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (_DWORD)v7 == 0;
}
}

LABEL_10:
    goto LABEL_11;
  }

  v12 = v11;
  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v9;
      v18 = 1024;
      *(_DWORD *)v19 = v12;
      v19[2] = 2080;
      *(void *)&v19[3] = xpc_strerror();
      _os_log_impl( &dword_186C88000,  v14,  OS_LOG_TYPE_DEFAULT,  "copyJobWithLabel for label %{public}@ failed with error %d: %s",  buf,  0x1Cu);
    }

    v13 = 0LL;
    goto LABEL_10;
  }

  v13 = 0LL;
LABEL_11:

  return v13;
}

LABEL_11:
    goto LABEL_12;
  }

  v7 = v6;
  if (!+[OSLaunchdJob disableLogging_4watchdogd](&OBJC_CLASS___OSLaunchdJob, "disableLogging_4watchdogd"))
  {
    _os_launch_job_log();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v13 = a3;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v7;
      LOWORD(v14[0]) = 2080;
      *(void *)((char *)v14 + 2) = xpc_strerror();
      _os_log_impl(&dword_186C88000, v9, OS_LOG_TYPE_DEFAULT, "copyJobWithPid:%d failed with error %d: %s", buf, 0x18u);
    }

    int v8 = 0LL;
    goto LABEL_11;
  }

  int v8 = 0LL;
LABEL_12:

  return v8;
}

void ___os_launch_job_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.libxpc.OSLaunchdJob", "all");
  v1 = (void *)_os_launch_job_log_log;
  _os_launch_job_log_log = (uint64_t)v0;
}

double OUTLINED_FUNCTION_3_0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_6(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return _os_crash_msg();
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_18C6A9B78;
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _launch_job_routine()
{
  return MEMORY[0x1895F8D20]();
}

uint64_t _launch_job_routine_async()
{
  return MEMORY[0x1895F8D28]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895F8D70]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t _xpc_domain_routine()
{
  return MEMORY[0x1895F9190]();
}

uint64_t _xpc_service_routine()
{
  return MEMORY[0x1895F91F8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1895FAE98]();
}

void free(void *a1)
{
}

kern_return_t mach_port_destruct( ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1895FBB30](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FD7E8]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD820](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1895FD850](xarray, index);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

uint64_t xpc_copy_short_description()
{
  return MEMORY[0x1895FDAD0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x1895FDBC8]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x1895FDF20]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x1895FDF60]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

uint64_t objc_msgSend_initWithLabel_instance_requestedJetsamPriority_additionalProperties_program_processType_keepAlive_runAtLoad_enableTransactions_endpoints_serviceType_path_xpcBundle_hostPID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithLabel_instance_requestedJetsamPriority_additionalProperties_program_processType_keepAlive_runAtLoad_enableTransactions_endpoints_serviceType_path_xpcBundle_hostPID_);
}

uint64_t objc_msgSend_initWithState_pid_lastSpawnError_lastExitStatus_additionalPropertiesDict_removing_instance_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithState_pid_lastSpawnError_lastExitStatus_additionalPropertiesDict_removing_instance_);
}

uint64_t objc_msgSend_initWithWait4Status_os_reason_namespace_os_reason_code_os_reason_flags_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithWait4Status_os_reason_namespace_os_reason_code_os_reason_flags_);
}