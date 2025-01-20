uint64_t compileRequestMain(unsigned int *a1)
{
  (*(void (**)(void, void, void, void, void, void))(**((void **)a1 + 4) + 24LL))( *(void *)(*((void *)a1 + 4) + 8LL),  *a1,  a1[1],  *((void *)a1 + 1),  *((void *)a1 + 2),  *((void *)a1 + 3));
  return 0LL;
}

int main(int argc, const char **argv, const char **envp)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  gTimer = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, global_queue);
  idle_timer_init();
  xpc_main((xpc_connection_handler_t)MTLCompilerServiceHandleEvent);
}

void initialize_sandbox(void)
{
  if (getenv("TMPDIR")) {
    unsetenv("TMPDIR");
  }
  bzero(v0, 0x400uLL);
  _set_user_dir_suffix("com.apple.MTLCompilerService");
  if (!confstr(65537, v0, 0x400uLL) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    initialize_sandbox();
  }
}

void idle_timer_init(void)
{
  v0 = getenv("MTL_IDLE_EXIT_TIMEOUT_SECONDS");
  g_idle_timer_reason = (uint64_t)"EV";
  int v1 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  if (!v0)
  {
    if (v1 != 7)
    {
      g_idle_timer_seconds = 0LL;
      return;
    }

    g_idle_timer_reason = (uint64_t)"HomePod";
    v0 = "60";
  }

  g_idle_timer_seconds = atoll(v0);
  if (g_idle_timer_seconds >= 1)
  {
    v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)serial_queue(void)::_serial_queue);
    g_idle_timer = (uint64_t)v2;
    if (v2)
    {
      dispatch_source_set_event_handler_f(v2, (dispatch_function_t)idle_timer_exit);
      idle_timer_reset();
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      idle_timer_init();
    }
  }
}

void MTLCompilerServiceHandleEvent(xpc_connection_t connection)
{
}

void idle_timer_exit(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134349314;
    uint64_t v2 = g_idle_timer_seconds;
    __int16 v3 = 2082;
    uint64_t v4 = g_idle_timer_reason;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Idle exit MTLCompilerService after %{public}lld seconds (reason: %{public}s).",  (uint8_t *)&v1,  0x16u);
  }

  _Exit(0);
}

void idle_timer_reset(void)
{
  if (g_idle_timer)
  {
    dispatch_time_t v0 = dispatch_time(0LL, 1000000000 * g_idle_timer_seconds);
    dispatch_source_set_timer((dispatch_source_t)g_idle_timer, v0, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)g_idle_timer);
  }

void ___ZL12serial_queuev_block_invoke(id a1)
{
  serial_queue(void)::_serial_queue = (uint64_t)dispatch_queue_create(0LL, 0LL);
}

void ___ZL29MTLCompilerServiceHandleEventPU24objcproto13OS_xpc_object8NSObject_block_invoke( id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    if (g_idle_timer) {
      dispatch_suspend((dispatch_object_t)g_idle_timer);
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v38 = ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke;
    v39 = &unk_100004380;
    v40 = a2;
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "requestType");
    if ((_DWORD)uint64 == 9)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      remote_connection = xpc_dictionary_get_remote_connection(a2);
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
      goto LABEL_38;
    }

    value = (SandboxExtensionContainer *)xpc_dictionary_get_value(a2, "sandboxTokens");
    v7 = SandboxExtensionContainer::CompilerSandboxExtensions(value);
    SandboxExtensionContainer::SetSandbox((SandboxExtensionContainer *)v7, value);
    int v8 = xpc_dictionary_get_uint64(a2, "llvmVersion");
    string = xpc_dictionary_get_string(a2, "client_name");
    if (string) {
      v10 = (char *)string;
    }
    else {
      v10 = "(unknown client)";
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v10);
    handler = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = ___ZL3ctxiRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke;
    v31 = &__block_descriptor_44_e5_v8__0l;
    LODWORD(v33) = v8;
    v32 = __p;
    v11 = (void *)ctx(int,std::string const&)::context;
    if (v36 < 0) {
      operator delete(__p[0]);
    }
    v12 = xpc_dictionary_get_string(a2, "pluginPath");
    if (v12)
    {
      v13 = v12;
      xpc_object_t v14 = xpc_dictionary_get_value(a2, "targetData");
      if (v14)
      {
        v15 = v14;
        bytes_ptr = xpc_data_get_bytes_ptr(v14);
        size_t length = xpc_data_get_length(v15);
      }

      else
      {
        bytes_ptr = 0LL;
        size_t length = 0LL;
      }

      uint64_t v18 = (*(uint64_t (**)(void, const char *, const void *, size_t))(*v11 + 32LL))( v11[1],  v13,  bytes_ptr,  length);
      if ((_DWORD)v18 == -1)
      {
        handler = 0LL;
        asprintf_l((char **)&handler, 0LL, "- Could not load compiler plugin at %s", v13);
        v38((uint64_t)v37, 2u, 0LL, 0LL, (const char *)handler);
        free(handler);
LABEL_38:
        idle_timer_reset();
        return;
      }
    }

    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }

    xpc_object_t v19 = xpc_dictionary_get_value(a2, "data");
    if (xpc_get_type(v19) == (xpc_type_t)&_xpc_type_data)
    {
      v20 = xpc_data_get_bytes_ptr(v19);
      size_t v21 = xpc_data_get_length(v19);
    }

    else
    {
      v20 = 0LL;
      size_t v21 = 0LL;
    }

    if ((_DWORD)uint64 == 16)
    {
      xpc_object_t v22 = xpc_dictionary_get_value(a2, "machOFD");
      if (xpc_get_type(v22) == (xpc_type_t)&_xpc_type_fd)
      {
        v20[3] = xpc_fd_dup(v22);
        *((_BYTE *)v20 + 129) = 0;
      }
    }

    v23 = getenv("MTL_HANG_TIMER_LENGTH_IN_SECONDS");
    if (v23)
    {
      uint64_t v24 = atoi(v23);
      int v25 = 2;
    }

    else
    {
      int v25 = 0;
      uint64_t v24 = 700LL;
    }

    handler = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
    v31 = &unk_1000043A8;
    v32 = (void **)v37;
    v33 = v10;
    int v34 = v25;
    dispatch_source_set_event_handler((dispatch_source_t)gTimer, &handler);
    if (v24 < 1)
    {
      (*(void (**)(void, uint64_t, uint64_t, void *, size_t, void *))(*v11 + 24LL))( v11[1],  v18,  uint64,  v20,  v21,  v37);
    }

    else
    {
      v26 = (dispatch_source_s *)gTimer;
      dispatch_time_t v27 = dispatch_time(0LL, 1000000000LL * (int)v24);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      dispatch_activate((dispatch_object_t)gTimer);
      (*(void (**)(void, uint64_t, uint64_t, void *, size_t, void *))(*v11 + 24LL))( v11[1],  v18,  uint64,  v20,  v21,  v37);
      dispatch_source_set_timer((dispatch_source_t)gTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }

    goto LABEL_38;
  }

void ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke( uint64_t a1, unsigned int a2, const void *a3, size_t a4, const char *a5)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    v11 = reply;
    if (a2)
    {
      xpc_dictionary_set_uint64(reply, "error", a2);
      if (a5) {
        xpc_dictionary_set_string(v11, "errorMessage", a5);
      }
    }

    else
    {
      xpc_object_t v12 = xpc_data_create(a3, a4);
      xpc_dictionary_set_uint64(v11, "error", 0LL);
      xpc_dictionary_set_value(v11, "reply", v12);
      xpc_release(v12);
    }

    remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(remote_connection, v11);
    xpc_release(v11);
  }

__int128 *SandboxExtensionContainer::CompilerSandboxExtensions(SandboxExtensionContainer *this)
{
  if ((v1 & 1) == 0
  {
    xmmword_100008010 = 0u;
    unk_100008020 = 0u;
    SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton = 0u;
    __cxa_atexit( (void (*)(void *))SandboxExtensionContainer::~SandboxExtensionContainer,  &SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton,  (void *)&_mh_execute_header);
  }

  return &SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton;
}

BOOL SandboxExtensionContainer::SetSandbox(SandboxExtensionContainer *this, xpc_object_t xarray)
{
  if (xarray)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke;
    applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
    applier[4] = this;
    if (!xpc_array_apply(xarray, applier))
    {
      SandboxExtensionContainer::ResetSandbox(this);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
      v5[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
      v5[4] = this;
      return xpc_array_apply(xarray, v5);
    }
  }

  else if (*(void *)this != *((void *)this + 1))
  {
    SandboxExtensionContainer::ResetSandbox(this);
  }

  return 1LL;
}

uint64_t ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = std::string::append(&v15, *(const std::string::value_type **)(a1 + 40));
  __int128 v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__l.__cap_ = v2->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0LL;
  v2->__r_.__value_.__l.__cap_ = 0LL;
  v2->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v4 = std::string::append(&v16, ". Timeout type was ");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__l.__cap_ = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  int v6 = *(_DWORD *)(a1 + 48);
  v7 = "API Specified";
  int v8 = "Unknown";
  if (v6 == 2) {
    int v8 = "Environment Variable";
  }
  if (v6 != 1) {
    v7 = v8;
  }
  if (v6) {
    v9 = v7;
  }
  else {
    v9 = "Default";
  }
  v10 = std::string::append(&v19, v9);
  __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  int64_t cap = v10->__r_.__value_.__l.__cap_;
  __int128 v17 = v11;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    xpc_object_t v12 = &v17;
    if (cap < 0) {
      xpc_object_t v12 = (__int128 *)v17;
    }
    LODWORD(v19.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v19.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s",  (uint8_t *)&v19,  0xCu);
  }

  if (cap >= 0) {
    v13 = &v17;
  }
  else {
    v13 = (__int128 *)v17;
  }
  uint64_t result = abort_with_reason(21LL, 2LL, v13, 0LL);
  __break(1u);
  return result;
}

void sub_100002870( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZL24isProbGuardMallocEnabledv_block_invoke(id a1)
{
  if (malloc_num_zones >= 1)
  {
    uint64_t v1 = 0LL;
    while (1)
    {
      zone_name = malloc_get_zone_name(*(malloc_zone_t **)(malloc_zones + 8 * v1));
      if (!strncmp(zone_name, "ProbGuardMallocZone", 0x14uLL)) {
        break;
      }
      if (++v1 >= malloc_num_zones) {
        return;
      }
    }

    isProbGuardMallocEnabled(void)::uint64_t result = 1;
  }

void __clang_call_terminate(void *a1)
{
}

void SandboxExtensionContainer::~SandboxExtensionContainer(SandboxExtensionContainer *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }

  __int128 v3 = (void **)this;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void SandboxExtensionContainer::ResetSandbox(SandboxExtensionContainer *this)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 3);
  __int128 v3 = (uint64_t *)*((void *)this + 4);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = *v2++;
      sandbox_extension_release(v4);
    }

    while (v2 != v3);
    uint64_t v2 = (uint64_t *)*((void *)this + 3);
  }

  *((void *)this + 4) = v2;
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

BOOL ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke( uint64_t a1, unint64_t a2, xpc_object_t xstring)
{
  uint64_t v4 = *(void **)(a1 + 32);
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[1] - *v4) >> 3) > a2)
  {
    int v6 = string_ptr;
    v7 = (void *)(*v4 + 24 * a2);
    size_t v8 = strlen(string_ptr);
    if (*((char *)v7 + 23) < 0)
    {
      if (v8 == v7[1])
      {
        if (v8 == -1LL) {
          goto LABEL_11;
        }
        v7 = (void *)*v7;
        return memcmp(v7, v6, v8) == 0;
      }
    }

    else if (v8 == *((unsigned __int8 *)v7 + 23))
    {
      if (v8 == -1LL) {
LABEL_11:
      }
        std::string::__throw_out_of_range[abi:ne180100]();
      return memcmp(v7, v6, v8) == 0;
    }
  }

  return 0LL;
}

BOOL ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke_2( uint64_t a1, int a2, xpc_object_t xstring)
{
  __int128 v3 = *(SandboxExtensionContainer **)(a1 + 32);
  string_ptr = (char *)xpc_string_get_string_ptr(xstring);
  return SandboxExtensionContainer::ExtendSandbox(v3, string_ptr);
}

BOOL SandboxExtensionContainer::ExtendSandbox(SandboxExtensionContainer *this, char *a2)
{
  size_t v21 = a2;
  uint64_t v4 = sandbox_extension_consume(a2);
  uint64_t v5 = v4;
  if (v4 != -1)
  {
    unint64_t v6 = *((void *)this + 5);
    v7 = (uint64_t *)*((void *)this + 4);
    if ((unint64_t)v7 >= v6)
    {
      v9 = (uint64_t *)*((void *)this + 3);
      uint64_t v10 = v7 - v9;
      unint64_t v11 = v6 - (void)v9;
      unint64_t v12 = (uint64_t)(v6 - (void)v9) >> 2;
      if (v12 <= v10 + 1) {
        unint64_t v12 = v10 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFF8LL) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        xpc_object_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)this + 40, v13);
        v9 = (uint64_t *)*((void *)this + 3);
        v7 = (uint64_t *)*((void *)this + 4);
      }

      else
      {
        xpc_object_t v14 = 0LL;
      }

      std::string v15 = (uint64_t *)&v14[8 * v10];
      std::string v16 = &v14[8 * v13];
      uint64_t *v15 = v5;
      size_t v8 = v15 + 1;
      while (v7 != v9)
      {
        uint64_t v17 = *--v7;
        *--std::string v15 = v17;
      }

      *((void *)this + 3) = v15;
      *((void *)this + 4) = v8;
      *((void *)this + 5) = v16;
      if (v9) {
        operator delete(v9);
      }
    }

    else
    {
      uint64_t *v7 = v4;
      size_t v8 = v7 + 1;
    }

    *((void *)this + 4) = v8;
    unint64_t v18 = *((void *)this + 1);
    if (v18 >= *((void *)this + 2))
    {
      uint64_t v19 = std::vector<std::string>::__emplace_back_slow_path<char const*&>((uint64_t *)this, &v21);
    }

    else
    {
      std::string::basic_string[abi:ne180100]<0>(*((void **)this + 1), a2);
      uint64_t v19 = v18 + 24;
      *((void *)this + 1) = v18 + 24;
    }

    *((void *)this + 1) = v19;
  }

  return v5 != -1;
}

void sub_100002CC4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_100002D1C(_Unwind_Exception *a1)
{
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::vector<long long>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_100002DA4(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const*&>(uint64_t *a1, char **a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_ = __v.__begin_;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, *a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_100002F28( _Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer( std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

uint64_t ___ZL3ctxiRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t result = MTLConnectionCtx::MTLConnectionCtx((uint64_t)v2, *(_DWORD *)(a1 + 40), *(void *)(a1 + 32));
  ctx(int,std::string const&)::context = (uint64_t)v2;
  return result;
}

void sub_1000031CC(_Unwind_Exception *a1)
{
}

uint64_t MTLConnectionCtx::MTLConnectionCtx(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 16) = a2;
  unint64_t v6 = (CompilerPluginInterface *)operator new(0x30uLL);
  CompilerPluginInterface::CompilerPluginInterface(v6, a2);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = (*((uint64_t (**)(uint64_t))v6 + 1))(a3);
  return a1;
}

void sub_100003240(_Unwind_Exception *a1)
{
}

void CompilerPluginInterface::CompilerPluginInterface(CompilerPluginInterface *this, int a2)
{
  *((_DWORD *)this + 10) = a2;
  uint64_t v3 = "/System/Library/PrivateFrameworks/MTLCompiler.framework/Versions/32023/MTLCompiler";
  if (a2 != 32023) {
    uint64_t v3 = 0LL;
  }
  if (a2 == 32024) {
    unint64_t v4 = "/System/Library/PrivateFrameworks/MTLCompiler.framework/Versions/32024/MTLCompiler";
  }
  else {
    unint64_t v4 = v3;
  }
  unint64_t v5 = dlopen(v4, 5);
  *(void *)this = v5;
  if (v5)
  {
    *((void *)this + 1) = dlsym(v5, "MTLCodeGenServiceCreate");
    *((void *)this + 2) = dlsym(*(void **)this, "MTLCodeGenServiceDestroy");
    *((void *)this + 3) = dlsym(*(void **)this, "MTLCodeGenServiceBuildRequest");
    *((void *)this + 4) = dlsym(*(void **)this, "MTLCodeGenServiceSetPluginPath");
  }

  else
  {
    unint64_t v6 = dlerror();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      CompilerPluginInterface::CompilerPluginInterface((uint64_t)v6);
    }
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + 8) = 0u;
  }

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void initialize_sandbox()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to configure _CS_DARWIN_USER_TEMP_DIR: %{errno}d",  (uint8_t *)v1,  8u);
}

void idle_timer_init()
{
  int v0 = 136446210;
  uint64_t v1 = g_idle_timer_reason;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create idle timer, idle exit %{public}s is disabled.",  (uint8_t *)&v0,  0xCu);
}

void CompilerPluginInterface::CompilerPluginInterface(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to dlopen MTLCompiler framework with error: %s",  (uint8_t *)&v1,  0xCu);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}