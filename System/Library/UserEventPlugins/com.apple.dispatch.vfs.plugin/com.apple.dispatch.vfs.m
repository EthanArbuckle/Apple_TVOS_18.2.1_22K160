void init_dispatch_vfs(uint64_t a1)
{
  qword_4168 = (uint64_t)os_log_create("com.apple.dispatch.vfs", (const char *)&unk_3F07);
  *(void *)calloc(1uLL, 0x18uLL) = a1;
  xpc_event_provider_create();
}

void sub_3810(uint64_t a1, uint64_t a2, void *a3, char *context)
{
  if (qword_4170 != -1) {
    dispatch_once_f(&qword_4170, context, (dispatch_function_t)sub_3930);
  }
  if (a1 == 2)
  {
    v9 = (void **)(context + 16);
    v10 = context + 16;
    while (1)
    {
      v10 = (void *)*v10;
      if (!v10) {
        break;
      }
      if (v10[1] == a2)
      {
        for (i = *v9; i != v10; i = (void *)*i)
          v9 = (void **)i;
        *v9 = (void *)*v10;
        free(v10);
        return;
      }
    }
  }

  else if (a1 == 1)
  {
    v8 = calloc(1uLL, 0x28uLL);
    v8[1] = a2;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 0x40000000LL;
    applier[2] = sub_3A34;
    applier[3] = &unk_40F8;
    applier[4] = v8;
    xpc_dictionary_apply(a3, applier);
    void *v8 = *((void *)context + 2);
    *((void *)context + 2) = v8;
  }
}

void sub_3930()
{
  v1[0] = 0LL;
  v1[1] = v1;
  v1[2] = 0x2000000000LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_3BA8;
  block[3] = &unk_4120;
  block[4] = v1;
  if (qword_4178 != -1) {
    dispatch_once(&qword_4178, block);
  }
  xpc_event_provider_get_queue();
}

uint64_t sub_3A34(uint64_t a1, char *__s1, void *a3)
{
  if (a3 != &_xpc_BOOL_false)
  {
    if (!strcmp(__s1, "LowDisk"))
    {
      if (a3 == &_xpc_BOOL_true || xpc_get_type(a3) == (xpc_type_t)&_xpc_type_int64)
      {
        *(void *)(*(void *)(a1 + 32) + 32LL) |= 0x1204uLL;
      }
    }

    else if (!strcmp(__s1, "VeryLowDisk"))
    {
      if (a3 == &_xpc_BOOL_true || xpc_get_type(a3) == (xpc_type_t)&_xpc_type_int64)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x1200LL;
        goto LABEL_17;
      }
    }

    else if (!strcmp(__s1, "NearLowDisk"))
    {
      if (a3 == &_xpc_BOOL_true)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x2000LL;
        goto LABEL_17;
      }
    }

    else
    {
      int v6 = strcmp(__s1, "DesiredDisk");
      if (a3 == &_xpc_BOOL_true && !v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x4000LL;
LABEL_17:
        *(void *)(v7 + 32) = v8;
      }
    }
  }

  return 1LL;
}

uint64_t sub_3BA8(uint64_t a1)
{
  uint64_t result = mach_timebase_info(&info);
  double v3 = 1.0;
  if (!(_DWORD)result) {
    double v3 = (double)(info.numer / info.denom);
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
  return result;
}

void sub_3BF4(uint64_t a1)
{
  uint64_t data = dispatch_source_get_data((dispatch_source_t)qword_4180);
  double v3 = (os_log_s *)qword_4168;
  if (os_log_type_enabled((os_log_t)qword_4168, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = data;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Got VFS event: %lu", (uint8_t *)&v10, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "_Flags", data);
  uint64_t v5 = mach_absolute_time();
  int v6 = *(void **)(*(void *)(a1 + 40) + 16LL);
  if (v6)
  {
    unint64_t v7 = (unint64_t)(*(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) * (double)v5);
    do
    {
      if ((v6[4] & data) != 0
        && ((v6[4] & data) != 4 || (uint64_t v8 = v6[2]) == 0 || v8 >= 1 && ((v9 = v6[3]) == 0 || v9 + 1000000000 * v8 <= v7)))
      {
        v6[3] = v7;
        xpc_event_provider_token_fire();
      }

      int v6 = (void *)*v6;
    }

    while (v6);
  }

  xpc_release(v4);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}