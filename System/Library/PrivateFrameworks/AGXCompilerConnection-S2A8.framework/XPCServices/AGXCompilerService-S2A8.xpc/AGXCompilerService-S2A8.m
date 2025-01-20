void start()
{
  xpc_main((xpc_connection_handler_t)sub_100003758);
}

void sub_100003758(_xpc_connection_s *a1)
{
}

void sub_1000037AC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100008068);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_100008068))
    {
      sub_100003AFC();
      __cxa_guard_release(&qword_100008068);
    }
  }
}

void sub_1000037F0(id a1, void *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    if (xpc_dictionary_get_BOOL(a2, "connection_ping"))
    {
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
    }

    else
    {
      uint64_t v22 = 0LL;
      v23 = &v22;
      uint64_t v24 = 0x2000000000LL;
      sub_1000037AC();
      v25 = &qword_100008040;
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_100003A68;
      block[3] = &unk_1000041A8;
      block[4] = &v22;
      block[5] = a2;
      if (qword_100008070 != -1) {
        dispatch_once(&qword_100008070, block);
      }
      size_t length = 0LL;
      data = xpc_dictionary_get_data(a2, "state", &length);
      size_t v19 = 0LL;
      v6 = xpc_dictionary_get_data(a2, "bitcode", &v19);
      size_t v17 = 0LL;
      bytes = 0LL;
      string = xpc_dictionary_get_string(a2, "log_file_name");
      v8 = *(dispatch_source_s **)(v23[3] + 8);
      dispatch_time_t v9 = dispatch_time(0LL, 70000000000LL);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      dispatch_resume(*(dispatch_object_t *)(v23[3] + 8));
      uint64_t v10 = v23[3];
      uint64_t v12 = *(void *)(v10 + 16);
      uint64_t v11 = *(void *)(v10 + 24);
      uint64_t v13 = *(unsigned int *)(v10 + 32);
      if (string) {
        char v14 = (*(uint64_t (**)(uint64_t, const void *, size_t, const void *, size_t, uint64_t, const char *))(v12 + 32))( v11,  data,  length,  v6,  v19,  v13,  string);
      }
      else {
        char v14 = (*(uint64_t (**)(uint64_t, const void *, size_t, const void *, size_t, uint64_t, void **, size_t *))(v12 + 24))( v11,  data,  length,  v6,  v19,  v13,  &bytes,  &v17);
      }
      BOOL v15 = v14;
      dispatch_suspend(*(dispatch_object_t *)(v23[3] + 8));
      xpc_dictionary_set_BOOL(reply, "error", v15);
      if (bytes)
      {
        xpc_object_t v16 = xpc_data_create(bytes, v17);
        xpc_dictionary_set_value(reply, "reply", v16);
        xpc_release(v16);
      }

      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
      if (bytes) {
        (*(void (**)(void))(*(void *)(v23[3] + 16) + 40LL))(*(void *)(v23[3] + 24));
      }
      _Block_object_dispose(&v22, 8);
    }
  }

uint64_t sub_100003A68(uint64_t a1)
{
  size_t length = 0LL;
  data = xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 40), "compiler_options", &length);
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 32LL) = xpc_dictionary_get_uint64( *(xpc_object_t *)(a1 + 40),  "architecture");
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t result = (*(uint64_t (**)(const void *, size_t, void))(*(void *)(v3 + 16) + 8LL))( data,  length,  *(unsigned int *)(v3 + 32));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 24LL) = result;
  return result;
}

void *sub_100003AFC()
{
  qword_100008040 = 0LL;
  qword_100008050 = 0LL;
  unk_100008058 = 0LL;
  dword_100008060 = 0;
  qword_100008040 = (uint64_t)dispatch_queue_create(0LL, 0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  qword_100008048 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100003C68;
  handler[3] = &unk_100004180;
  handler[4] = &qword_100008040;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100008048, handler);
  v1 = operator new(0x30uLL);
  v2 = dlopen("/System/Library/PrivateFrameworks/AGXCompilerCore-S2A8.framework/AGXCompilerCore-S2A8", 5);
  void *v1 = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    v1[1] = dlsym(v2, "GLCompilerCreate");
    v1[2] = dlsym(v3, "GLCompilerDelete");
    v1[3] = dlsym(v3, "GLCompilerBuildRequest");
    v1[4] = dlsym(v3, "GLCompilerLogBuildRequest");
    uint64_t result = dlsym(v3, "GLCompilerReleaseReply");
  }

  else
  {
    v5 = __stderrp;
    v6 = dlerror();
    fprintf(v5, "AGX: ERROR: %s\n", v6);
    uint64_t result = 0LL;
    *(_OWORD *)(v1 + 1) = 0u;
    *(_OWORD *)(v1 + 3) = 0u;
  }

  v1[5] = result;
  qword_100008050 = (uint64_t)v1;
  return result;
}

void sub_100003C68(uint64_t a1)
{
  qword_100008008 = (uint64_t)"Compiler service plugin hung";
  abort();
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}