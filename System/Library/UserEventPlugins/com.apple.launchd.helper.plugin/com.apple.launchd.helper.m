void init_launchd_helper(uint64_t a1)
{
  qword_4138 = a1;
  xpc_event_provider_create();
}

void sub_36C4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 1)
  {
    v8 = calloc(1uLL, 0x48uLL);
    v8[1] = a2;
    string = xpc_dictionary_get_string(a3, "Executable");
    if (string)
    {
      if (*string == 47)
      {
        v8[2] = strdup(string);
        os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)qword_4148);
        v8[3] = v10;
        v11 = sub_3A30((const char *)v8[2]);
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          CFIndex v12 = (CFIndex)v11;
          v13 = (os_log_s *)qword_4148;
          if (os_signpost_enabled((os_log_t)qword_4148))
          {
            LODWORD(buf.version) = 136446210;
            *(CFIndex *)((char *)&buf.version + 4) = v12;
            _os_signpost_emit_with_name_impl( &dword_0,  v13,  OS_SIGNPOST_EVENT,  v10,  "EventsChangedForExecutable",  "executable_missing=%{public, signpost.telemetry:string1}s enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
          }
        }
      }
    }

    xpc_object_t value = xpc_dictionary_get_value(a3, "UID");
    if (value)
    {
      v15 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
      {
        v8[5] = xpc_retain(v15);
        *((_BYTE *)v8 + 64) = 1;
      }
    }

    v16 = xpc_dictionary_get_string(a3, "UserName");
    if (v16)
    {
      v8[6] = strdup(v16);
      *((_BYTE *)v8 + 64) = 1;
    }

    v17 = xpc_dictionary_get_string(a3, "GroupName");
    if (v17)
    {
      v8[7] = strdup(v17);
      *((_BYTE *)v8 + 64) = 1;
    }

    BOOL v18 = xpc_dictionary_get_BOOL(a3, "SkipImmediatePoll");
    void *v8 = launchd_helper_events;
    launchd_helper_events = (uint64_t)v8;
    if (!v18) {
      sub_3A74((uint64_t)v8);
    }
    v19 = (const char *)v8[2];
    if (v19)
    {
      values = (void *)CFStringCreateWithCString(kCFAllocatorDefault, v19, 0x8000100u);
      v20 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
      buf.version = 0LL;
      memset(&buf.retain, 0, 24);
      buf.info = v8;
      FSEventStreamRef v21 = FSEventStreamCreate( kCFAllocatorDefault,  (FSEventStreamCallback)sub_3C60,  &buf,  v20,  0xFFFFFFFFFFFFFFFFLL,  0.05,  4u);
      v8[4] = v21;
      if (!v21) {
        _os_assumes_log(0LL);
      }
      xpc_event_provider_get_queue();
    }
  }

  else if (a1 == 2)
  {
    v4 = &launchd_helper_events;
    v5 = &launchd_helper_events;
    while (1)
    {
      v5 = (uint64_t *)*v5;
      if (!v5) {
        break;
      }
      if (v5[1] == a2)
      {
        uint64_t *v4 = *v5;
        free((void *)v5[2]);
        v22 = (void *)v5[5];
        if (v22) {
          xpc_release(v22);
        }
        free((void *)v5[6]);
        free((void *)v5[7]);
        v23 = (__FSEventStream *)v5[4];
        if (v23)
        {
          FSEventStreamStop(v23);
          FSEventStreamInvalidate((FSEventStreamRef)v5[4]);
          FSEventStreamRelease((FSEventStreamRef)v5[4]);
          v5[4] = 0LL;
        }

        free(v5);
        return;
      }
    }
  }
}

char *sub_3A30(const char *a1)
{
  v1 = a1;
  if (!strncmp(a1, "/var/", 5uLL)) {
    return strrchr(v1, 47) + 1;
  }
  return (char *)v1;
}

const char *sub_3A74(uint64_t a1)
{
  v2 = *(const char **)(a1 + 16);
  if (v2)
  {
    result = (const char *)stat(v2, &v19);
    if ((_DWORD)result) {
      return result;
    }
    if ((v19.st_mode & 0xF000) != 0x8000 || (v19.st_mode & 0x49) == 0) {
      return result;
    }
    v5 = sub_3A30(*(const char **)(a1 + 16));
    os_signpost_id_t v6 = *(void *)(a1 + 24);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v5;
      v8 = (os_log_s *)qword_4148;
      if (os_signpost_enabled((os_log_t)qword_4148))
      {
        LODWORD(buf.pw_name) = 136446210;
        *(char **)((char *)&buf.pw_name + 4) = v7;
        _os_signpost_emit_with_name_impl( &dword_0,  v8,  OS_SIGNPOST_EVENT,  v6,  "PollStateForExecutable",  "executable_found=%{public, signpost.telemetry:string1}s enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
      }
    }

    *(void *)(a1 + 24) = 0LL;
    unint64_t v9 = 1LL;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  os_signpost_id_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    uid_t value = xpc_uint64_get_value(v10);
    result = (const char *)getpwuid_r(value, &buf, (char *)&v19, 0x1000uLL, &v18);
    if ((_DWORD)result) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v18 == 0LL;
    }
    if (v12) {
      unint64_t v13 = v9;
    }
    else {
      unint64_t v13 = v9 + 1;
    }
    if (v12) {
      return result;
    }
    ++v9;
  }

  else
  {
    unint64_t v13 = v9;
  }

  result = *(const char **)(a1 + 48);
  if (result)
  {
    ++v9;
    result = (const char *)getpwnam_r(result, &buf, (char *)&v19, 0x1000uLL, &v18);
    if (!(_DWORD)result && v18 != 0LL) {
      ++v13;
    }
  }

  if (v13 >= v9)
  {
    result = *(const char **)(a1 + 56);
    if (result)
    {
      ++v9;
      result = (const char *)getgrnam_r(result, &v16, (char *)&v19, 0x1000uLL, &v17);
      if ((_DWORD)result) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v17 == 0LL;
      }
      if (!v15) {
        ++v13;
      }
    }

    if (v13 >= v9) {
      xpc_event_provider_token_set_state();
    }
  }

  return result;
}

const char *sub_3C60(uint64_t a1, uint64_t a2)
{
  return sub_3A74(a2);
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

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}