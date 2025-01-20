void init_notification_matching(uint64_t a1)
{
  if (qword_41C8 != -1) {
    dispatch_once(&qword_41C8, &stru_4118);
  }
  *(void *)calloc(1uLL, 0x20uLL) = a1;
  xpc_event_provider_create();
}

void sub_37BC(id a1)
{
  __int128 v1 = off_4138;
  qword_41D0 = (uint64_t)CFSetCreate(0LL, (const void **)&v1, 2LL, &kCFTypeSetCallBacks);
  if (!qword_41D0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_3C8C();
  }
}

void sub_3850(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a1 == 2)
  {
    v13 = a4 + 3;
    v14 = a4 + 3;
    while (1)
    {
      v14 = (void *)*v14;
      if (!v14) {
        break;
      }
      if (v14[2] == a2)
      {
        uint64_t v15 = a4[2];
        v16 = *(void (**)(uint64_t, void *))(v15 + 24);
        uint64_t v17 = (*(uint64_t (**)(void))(v15 + 8))();
        v16(v17, v14);
        for (i = (void *)a4[3]; i != v14; i = (void *)*i)
          v13 = i;
        void *v13 = *v14;
        free(v14);
        return;
      }
    }
  }

  else
  {
    if (a1 != 1) {
      return;
    }
    v7 = calloc(1uLL, 0x18uLL);
    v7[1] = a4[1];
    v7[2] = a2;
    void *v7 = a4[3];
    a4[3] = v7;
    CFStringRef v8 = sub_3A3C(a3, "Name");
    CFStringRef v9 = sub_3A3C(a3, "Object");
    if (!v8)
    {
      _os_assumes_log(0LL);
      if (!v9) {
        return;
      }
      goto LABEL_8;
    }

    if (CFSetContainsValue((CFSetRef)qword_41D0, v8))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        CFStringRef v20 = v8;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Subscribed for disnoted notification: %@",  (uint8_t *)&v19,  0xCu);
      }
    }

    v10 = *(uint64_t (**)(void))(a4[2] + 8LL);
    v11 = *(void (**)(uint64_t, void *, void (*)(uint64_t, uint64_t, const __CFString *, uint64_t, uint64_t), CFStringRef, CFStringRef, uint64_t))(a4[2] + 16LL);
    uint64_t v12 = v10();
    v11(v12, v7, sub_3AA8, v8, v9, 4LL);
    CFRelease(v8);
    if (v9) {
LABEL_8:
    }
      CFRelease(v9);
  }
}

CFStringRef sub_3A3C(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 0LL;
  }
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string) {
    return 0LL;
  }
  string_ptr = xpc_string_get_string_ptr(v3);
  return CFStringCreateWithCString(kCFAllocatorDefault, string_ptr, 0x8000100u);
}

void sub_3AA8(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFIndex Length = CFStringGetLength(a3);
  CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v11 = (char *)malloc(v10);
  if (v11)
  {
    uint64_t v12 = v11;
    if (CFStringGetCString(a3, v11, v10, 0x8000100u)) {
      xpc_dictionary_set_string(v8, "Name", v12);
    }
    free(v12);
  }

  sub_3C2C(v8, "Object", a4);
  sub_3C2C(v8, "UserInfo", a5);
  xpc_event_provider_token_fire();
}

void sub_3C2C(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(a1, a2, v5);
      xpc_release(v6);
    }
  }

void sub_3C8C()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create a CF set.", v0, 2u);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}