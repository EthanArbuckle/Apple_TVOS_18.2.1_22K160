int *libSystem_initializer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  xpc_object_t empty;
  void *v16;
  os_log_s *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *result;
  xpc_object_t object;
  __int16 v27;
  char v28;
  void v29[3];
  char has_internal_diagnostics;
  uint64_t v31;
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838225LL, 0LL, 0LL, 0LL, 0LL);
  }
  __libkernel_init(&libSystem_initializer_libkernel_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 1LL, 0LL, 0LL, 0LL);
  }
  __libplatform_init(0LL, a3, a4, a5);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 2LL, 0LL, 0LL, 0LL);
  }
  __pthread_init(&libSystem_initializer_libpthread_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 3LL, 0LL, 0LL, 0LL);
  }
  _libc_initializer(&libSystem_initializer_libc_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 4LL, 0LL, 0LL, 0LL);
  }
  _sanitizers_init(a3, a4);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 14LL, 0LL, 0LL, 0LL);
  }
  v8 = __malloc_init(a4);
  if (MEMORY[0xFFFFFC100]) {
    v8 = kdebug_trace(735838224LL, 5LL, 0LL, 0LL, 0LL);
  }
  v9 = _dyld_initializer(v8);
  if (MEMORY[0xFFFFFC100]) {
    v9 = kdebug_trace(735838224LL, 7LL, 0LL, 0LL, 0LL);
  }
  v10 = libdispatch_init(v9);
  if (MEMORY[0xFFFFFC100]) {
    v10 = kdebug_trace(735838224LL, 8LL, 0LL, 0LL, 0LL);
  }
  _libxpc_initializer(v10);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 9LL, 0LL, 0LL, 0LL);
  }
  v11 = setenv("DT_BYPASS_LEAKS_CHECK", "1", 1);
  _libtrace_init(v11);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 10LL, 0LL, 0LL, 0LL);
  }
  v12 = _container_init(a4);
  if (MEMORY[0xFFFFFC100]) {
    v12 = kdebug_trace(735838224LL, 12LL, 0LL, 0LL, 0LL);
  }
  __libdarwin_init(v12);
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838224LL, 13LL, 0LL, 0LL, 0LL);
  }
  v29[0] = 2LL;
  v29[1] = &dlopen;
  v29[2] = &dlsym;
  has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.libsystem");
  v31 = 0LL;
  __malloc_late_init(v29);
  if (getpid() != 1
    && os_variant_allows_internal_security_policies("com.apple.libsystem")
    && _os_feature_enabled_impl("Libsystem", "posix_spawn_filtering"))
  {
    object = &dword_0 + 3;
    v27 = 0;
    v28 = 1;
    __libkernel_init_late(&object);
  }

  if (_simple_getenv(a3, "ActivePrewarm"))
  {
    v13 = xpc_pipe_create("com.apple.dasd.end-prewarm", 6LL);
    if (v13)
    {
      v14 = (void *)v13;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v16 = empty;
        object = 0LL;
        xpc_pipe_routine(v14, empty, &object);
        xpc_release(v14);
        xpc_release(v16);
        if (object) {
          xpc_release(object);
        }
        goto LABEL_40;
      }

      xpc_release(v14);
      v17 = os_log_create("com.apple.libsystem", "duet.prewarm");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_40;
      }
    }

    else
    {
      v17 = os_log_create("com.apple.libsystem", "duet.prewarm");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_40;
      }
    }

    libSystem_initializer_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }

LABEL_40:
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace(735838226LL, 0LL, 0LL, 0LL, 0LL);
  }
  result = __error();
  *result = 0;
  return result;
}

uint64_t libSystem_atfork_prepare(char a1)
{
  uint64_t v2 = _dyld_dlopen_atfork_prepare();
  if ((a1 & 1) == 0) {
    uint64_t v2 = _pthread_atfork_prepare_handlers(v2);
  }
  uint64_t v3 = _libSC_info_fork_prepare(v2);
  uint64_t v4 = xpc_atfork_prepare(v3);
  uint64_t v5 = dispatch_atfork_prepare(v4);
  uint64_t v6 = _dyld_atfork_prepare(v5);
  uint64_t v7 = _malloc_fork_prepare(v6);
  uint64_t v8 = cc_atfork_prepare(v7);
  uint64_t v9 = _libc_fork_prepare(v8);
  return _pthread_atfork_prepare(v9);
}

uint64_t libSystem_atfork_parent(char a1)
{
  uint64_t v2 = _pthread_atfork_parent();
  uint64_t v3 = cc_atfork_parent(v2);
  uint64_t v4 = _malloc_fork_parent(v3);
  uint64_t v5 = _libc_fork_parent(v4);
  uint64_t v6 = _dyld_atfork_parent(v5);
  uint64_t v7 = dispatch_atfork_parent(v6);
  uint64_t v8 = xpc_atfork_parent(v7);
  uint64_t v9 = _libSC_info_fork_parent(v8);
  uint64_t result = _dyld_dlopen_atfork_parent(v9);
  if ((a1 & 1) == 0) {
    return _pthread_atfork_parent_handlers(result);
  }
  return result;
}

uint64_t libSystem_atfork_child(char a1)
{
  uint64_t v2 = _mach_fork_child();
  uint64_t v3 = _pthread_atfork_child(v2);
  uint64_t v4 = cc_atfork_child(v3);
  uint64_t v5 = _malloc_fork_child(v4);
  uint64_t v6 = _libc_fork_child(v5);
  uint64_t v7 = _dyld_fork_child(v6);
  uint64_t v8 = dispatch_atfork_child(v7);
  uint64_t v9 = _libcoreservices_fork_child(v8);
  uint64_t v10 = _asl_fork_child(v9);
  uint64_t v11 = _notify_fork_child(v10);
  uint64_t v12 = xpc_atfork_child(v11);
  uint64_t v13 = _libtrace_fork_child(v12);
  uint64_t v14 = _libSC_info_fork_child(v13);
  uint64_t result = _dyld_dlopen_atfork_child(v14);
  if ((a1 & 1) == 0) {
    return _pthread_atfork_child_handlers(result);
  }
  return result;
}

uint64_t libSystem_init_after_boot_tasks_4launchd()
{
  uint64_t result = os_variant_allows_internal_security_policies("com.apple.libsystem");
  if ((_DWORD)result)
  {
    uint64_t result = _os_feature_enabled_impl("Libsystem", "posix_spawn_filtering");
    if ((_DWORD)result)
    {
      __int128 v1 = xmmword_1DD0;
      return __libkernel_init_after_boot_tasks(&v1);
    }
  }

  return result;
}

const char *__asan_default_options()
{
  int v0 = open("/System/Library/Preferences/com.apple.asan.options", 0);
  if (v0 == -1) {
    return "color=never:handle_segv=0:handle_sigbus=0:handle_sigill=0:handle_sigfpe=0:external_symbolizer_path=:log_path="
  }
           "stderr:log_exe_name=0:print_module_map=2:detect_odr_violation=0:halt_on_error=1";
  int v1 = v0;
  size_t v2 = 1023LL;
  uint64_t v3 = &dynamic_asan_opts;
  do
  {
    ssize_t v4 = read(v1, &dynamic_asan_opts, v2);
    v2 -= v4;
  }

  while (v4 > 0);
  close(v1);
  if (!dynamic_asan_opts) {
    return "color=never:handle_segv=0:handle_sigbus=0:handle_sigill=0:handle_sigfpe=0:external_symbolizer_path=:log_path="
  }
           "stderr:log_exe_name=0:print_module_map=2:detect_odr_violation=0:halt_on_error=1";
  return v3;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void libSystem_initializer_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}