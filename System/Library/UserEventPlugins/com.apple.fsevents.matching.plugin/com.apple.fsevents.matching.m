void init_fsevents_matching(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  FSEventStreamMultiplexer *v4;
  FSEventStreamMultiplexer *v5;
  void *v6;
  FSEventStreamMultiplexer *v7;
  FSEventStreamMultiplexer *v8;
  void *v9;
  FSEventStreamMultiplexer *v10;
  FSEventStreamMultiplexer *v11;
  void *v12;
  FSEventStreamMultiplexer *v13;
  FSEventStreamMultiplexer *v14;
  void *v15;
  v2 = os_log_create("com.apple.fsevents.matching", "All");
  v3 = (void *)qword_9010;
  qword_9010 = (uint64_t)v2;

  v4 = objc_alloc(&OBJC_CLASS___FSEventStreamMultiplexer);
  v5 = -[FSEventStreamMultiplexer initWithLogHandle:](v4, "initWithLogHandle:", qword_9010);
  v6 = (void *)qword_8FF0;
  qword_8FF0 = (uint64_t)v5;

  [(id)qword_8FF0 setEventStreamCreateFlags:0];
  v7 = objc_alloc(&OBJC_CLASS___FSEventStreamMultiplexer);
  v8 = -[FSEventStreamMultiplexer initWithLogHandle:](v7, "initWithLogHandle:", qword_9010);
  v9 = (void *)qword_8FF8;
  qword_8FF8 = (uint64_t)v8;

  [(id)qword_8FF8 setEventStreamCreateFlags:16];
  v10 = objc_alloc(&OBJC_CLASS___FSEventStreamMultiplexer);
  v11 = -[FSEventStreamMultiplexer initWithLogHandle:](v10, "initWithLogHandle:", qword_9010);
  v12 = (void *)qword_9000;
  qword_9000 = (uint64_t)v11;

  [(id)qword_9000 setEventStreamCreateFlags:4];
  v13 = objc_alloc(&OBJC_CLASS___FSEventStreamMultiplexer);
  v14 = -[FSEventStreamMultiplexer initWithLogHandle:](v13, "initWithLogHandle:", qword_9010);
  v15 = (void *)qword_9008;
  qword_9008 = (uint64_t)v14;

  [(id)qword_9008 setEventStreamCreateFlags:20];
  qword_9018 = a1;
  xpc_event_provider_create();
}

void sub_3100(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a1 == 1)
  {
    if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary) {
      _os_assumes_log(0LL);
    }
    v10 = calloc(1uLL, 0x30uLL);
    v10[1] = a2;
    v11 = (os_log_s *)qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a2;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Client token: %llu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v12 = 0LL;
    while (1)
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, (&off_83A8)[v12]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(value);
      v15 = v14;
      if (v14) {
        break;
      }
      v12 += 2LL;
      if (v12 == 8) {
        goto LABEL_37;
      }
    }

    *((_DWORD *)v10 + 9) = (&off_83A8)[v12 + 1];
    id v16 = v14;
    *((_BYTE *)v10 + 40) = 0;
    xpc_type_t type = xpc_get_type(v16);
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v23 = sub_3AB4(v16);
      objects[0] = v23;
      if (v23)
      {
        string_ptr = xpc_string_get_string_ptr(v23);
        if (sub_3B34(string_ptr))
        {
          v25 = (os_log_s *)qword_9010;
          if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = string_ptr;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "use_watchroot(%s)", (uint8_t *)&buf, 0xCu);
          }

          *((_BYTE *)v10 + 40) = 1;
        }

        v19 = xpc_array_create(objects, 1uLL);

        goto LABEL_36;
      }
    }

    else
    {
      if (type == (xpc_type_t)&_xpc_type_array)
      {
        xpc_object_t v26 = xpc_array_create(0LL, 0LL);
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v50 = sub_3BC0;
        v51 = &unk_83F0;
        v53 = v10 + 5;
        v19 = v26;
        v52 = v19;
        xpc_array_apply(v16, &buf);
        if (!xpc_array_get_count(v19))
        {

          v19 = 0LL;
        }

        goto LABEL_35;
      }

      if (type == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v50 = sub_3CB8;
        v51 = &unk_8418;
        v53 = v10 + 5;
        v19 = v18;
        v52 = v19;
        xpc_dictionary_apply(v16, &buf);
        if (!xpc_dictionary_get_count(v19))
        {

          v19 = 0LL;
        }

LABEL_35:
        goto LABEL_36;
      }
    }

    v19 = 0LL;
LABEL_36:

    v27 = (void *)v10[2];
    v10[2] = v19;

LABEL_37:
    if (!v10[2])
    {
      free(v10);
LABEL_61:

      goto LABEL_62;
    }

    sub_3988((uint64_t)v10);
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    xpc_type_t v28 = xpc_get_type((xpc_object_t)v10[2]);
    if (v28 == (xpc_type_t)&_xpc_type_string)
    {
      v31 = (uint64_t *)malloc(8uLL);
      v32 = xpc_string_get_string_ptr((xpc_object_t)v10[2]);
      uint64_t *v31 = (uint64_t)CFStringCreateWithCString(kCFAllocatorDefault, v32, 0x8000100u);
      size_t count = 1LL;
    }

    else if (v28 == (xpc_type_t)&_xpc_type_array)
    {
      size_t count = xpc_array_get_count((xpc_object_t)v10[2]);
      v31 = (uint64_t *)malloc(8 * count);
      v34 = (void *)v10[2];
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      v50 = sub_4274;
      v51 = &unk_8780;
      v52 = v31;
      xpc_array_apply(v34, &buf);
    }

    else
    {
      if (v28 != (xpc_type_t)&_xpc_type_dictionary)
      {
        v29 = 0LL;
        id v30 = 0LL;
LABEL_60:

        _Block_object_dispose(&v46, 8);
        void *v10 = qword_9028;
        qword_9028 = (uint64_t)v10;
        goto LABEL_61;
      }

      size_t count = xpc_dictionary_get_count((xpc_object_t)v10[2]);
      v31 = (uint64_t *)malloc(8 * count);
      v47[3] = 0LL;
      v35 = (void *)v10[2];
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      v50 = sub_42D0;
      v51 = &unk_87A8;
      v52 = &v46;
      v53 = v31;
      xpc_dictionary_apply(v35, &buf);
    }

    v29 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"token=%llu",  v10[1]);
    CFArrayRef v36 = CFArrayCreate(kCFAllocatorDefault, (const void **)v31, count, &kCFTypeArrayCallBacks);
    v47[3] = 0LL;
    if (count)
    {
      for (unint64_t i = 0LL; i < count; v47[3] = i)
      {
        CFRelease((CFTypeRef)v31[i]);
        unint64_t i = v47[3] + 1;
      }
    }

    free(v31);
    int v38 = *((_DWORD *)v10 + 9);
    BOOL v39 = v38 == 3;
    if (v38 == 3) {
      v40 = &qword_8FF0;
    }
    else {
      v40 = &qword_8FF8;
    }
    v41 = &qword_9000;
    if (!v39) {
      v41 = &qword_9008;
    }
    if (*((_BYTE *)v10 + 40)) {
      v42 = (id *)v41;
    }
    else {
      v42 = (id *)v40;
    }
    id v43 = *v42;
    id v30 = *v42;
    objects[0] = _NSConcreteStackBlock;
    objects[1] = (xpc_object_t)3221225472LL;
    objects[2] = sub_4320;
    objects[3] = &unk_87C8;
    objects[4] = v10;
    unsigned int v44 = [v30 registerClient:v29 ofPaths:v36 withCallback:objects];
    *((_DWORD *)v10 + 8) = v44;
    if ((v44 & 0x80000000) == 0) {
      objc_storeStrong((id *)v10 + 3, v43);
    }
    CFRelease(v36);
    goto LABEL_60;
  }

  if (a1 == 2)
  {
    v7 = &qword_9028;
    v8 = &qword_9028;
    while (1)
    {
      v8 = (uint64_t *)*v8;
      if (!v8) {
        break;
      }
      if (v8[1] == a2)
      {
        uint64_t *v7 = *v8;
        v20 = (void *)v8[3];
        if (v20)
        {
          [v20 unregisterClient:*((unsigned int *)v8 + 8)];
          v21 = (void *)v8[3];
          v8[3] = 0LL;

          *((_DWORD *)v8 + 8) = -1;
        }

        v22 = (void *)v8[2];
        v8[2] = 0LL;

        free(v8);
        break;
      }
    }
  }

LABEL_62:
}

void sub_3730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

os_state_data_s *__cdecl sub_3754(id a1, os_state_hints_s *a2)
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a2->var2 != 3)
  {
    v8 = 0LL;
LABEL_8:
    v9 = 0LL;
    goto LABEL_9;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_8FF0 summary]);
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_8FF8 summary]);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_9000 summary]);
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_9008 summary]);
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  0LL));
  v9 = (os_state_data_s *)calloc(1uLL, (size_t)[v8 length] + 200);
  __strlcpy_chk(v9->var3, "fsevents.matching FSEventStream state", 64LL, 64LL);
  v9->var0 = 1;
  v9->var1.var1 = [v8 length];
  objc_msgSend(v8, "getBytes:length:", v9->var4, objc_msgSend(v8, "length"));
  v10 = (void *)qword_9010;
  if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v14 = 134217984;
    id v15 = [v8 length];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "fsevents.matching state size: %lu bytes", (uint8_t *)&v14, 0xCu);
  }

  if ((unint64_t)[v8 length] > 0x8000)
  {
    uint64_t v12 = (void *)qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_ERROR)) {
      sub_59B8(v12, v8);
    }
    goto LABEL_8;
  }

LABEL_9:
  return v9;
}

void sub_3988(uint64_t a1)
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2020000000LL;
  char v7 = 0;
  int v1 = *(_DWORD *)(a1 + 36);
  if ((v1 - 1) >= 2)
  {
    if (v1 == 4)
    {
      v3 = *(void **)(a1 + 16);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_41F4;
      v4[3] = &unk_8760;
      v4[4] = v6;
      xpc_dictionary_apply(v3, v4);
    }

    else if (v1 == 3)
    {
      v2 = *(void **)(a1 + 16);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_40D4;
      applier[3] = &unk_8738;
      applier[4] = v6;
      xpc_array_apply(v2, applier);
    }

    xpc_event_provider_token_set_state();
  }

  _Block_object_dispose(v6, 8);
}

void sub_3A98(_Unwind_Exception *a1)
{
}

xpc_object_t sub_3AB4(void *a1)
{
  id v1 = a1;
  string_ptr = xpc_string_get_string_ptr(v1);
  if (!string_ptr) {
    goto LABEL_5;
  }
  v3 = sub_3E44(string_ptr, &v7);
  if (!v7)
  {
    xpc_object_t v5 = v1;
    goto LABEL_7;
  }

  v4 = v3;
  if (v3)
  {
    xpc_object_t v5 = xpc_string_create(v3);
    free(v4);
  }

  else
  {
LABEL_5:
    xpc_object_t v5 = 0LL;
  }

LABEL_7:
  return v5;
}

BOOL sub_3B34(const char *a1)
{
  BOOL v2 = 0;
  for (unint64_t i = 0LL; i != 83; ++i)
  {
    size_t v4 = strlen(off_8498[i]);
    if (!strncmp(a1, off_8498[i], v4) && !strchr(&a1[v4], 47)) {
      break;
    }
    BOOL v2 = i > 0x51;
  }

  return v2;
}

uint64_t sub_3BC0(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v4 = sub_3AB4(a3);
  xpc_object_t v5 = v4;
  if (v4)
  {
    if (!**(_BYTE **)(a1 + 40))
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (sub_3B34(string_ptr))
      {
        char v7 = (os_log_s *)qword_9010;
        if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315138;
          v10 = string_ptr;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "use_watchroot[%s]", (uint8_t *)&v9, 0xCu);
        }

        **(_BYTE **)(a1 + 40) = 1;
      }
    }

    xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, v5);
  }

  return 1LL;
}

uint64_t sub_3CB8(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (a2)
    {
      char v7 = sub_3E44(a2, &v11);
      if ((_BYTE)v11)
      {
        v8 = v7;
        a2 = v7;
        if (!v7) {
          goto LABEL_15;
        }
      }

      else
      {
        v8 = 0LL;
      }

      if (!**(_BYTE **)(a1 + 40) && sub_3B34(a2))
      {
        int v9 = (os_log_s *)qword_9010;
        if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = a2;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "use_watchroot{%s}", (uint8_t *)&v11, 0xCu);
        }

        **(_BYTE **)(a1 + 40) = 1;
      }

      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v5);
      free(v8);
    }
  }

  else
  {
    v6 = (os_log_s *)qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = a2;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring path: %s", (uint8_t *)&v11, 0xCu);
    }
  }

LABEL_15:
  return 1LL;
}

char *sub_3E44(const char *a1, _BYTE *a2)
{
  int v9 = 0LL;
  *a2 = 0;
  if (qword_9030 != -1) {
    dispatch_once(&qword_9030, &stru_8458);
  }
  int v4 = *a1;
  if (v4 != 126)
  {
    if (v4 != 47)
    {
      *a2 = 1;
      goto LABEL_17;
    }

    if (!strncmp(a1 + 1, "var/", 4uLL))
    {
      *a2 = 1;
      id v5 = (const char *)qword_9038;
    }

    else
    {
      if (strncmp(a1 + 1, "etc/", 4uLL)) {
        goto LABEL_17;
      }
      *a2 = 1;
      id v5 = (const char *)qword_9040;
    }

    v6 = a1 + 5;
    goto LABEL_16;
  }

  *a2 = 1;
  if (qword_9048 != -1) {
    dispatch_once(&qword_9048, &stru_8478);
  }
  id v5 = (const char *)qword_9050;
  if (qword_9050 && a1[1] == 47)
  {
    v6 = a1 + 2;
LABEL_16:
    asprintf(&v9, "%s/%s", v5, v6);
  }

LABEL_17:
  result = v9;
  if (!v9)
  {
    if (*a2)
    {
      v8 = (os_log_s *)qword_9010;
      if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v11 = a1;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Ignoring path: %s", buf, 0xCu);
      }

      return v9;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_4018(id a1)
{
  qword_9038 = (uint64_t)realpath_DARWIN_EXTSN("/var/", 0LL);
  qword_9040 = (uint64_t)realpath_DARWIN_EXTSN("/etc/", 0LL);
}

void sub_4058(id a1)
{
  id v1 = __s1;
  if (__s1)
  {
    if (!strcmp(__s1, "Aqua"))
    {
      qword_9050 = (uint64_t)getenv("HOME");
      if (!qword_9050)
      {
        _os_assumes_log();
        id v1 = __s1;
      }
    }
  }

  free(v1);
}

BOOL sub_40D4(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr && (id v5 = opendir(string_ptr)) != 0LL)
  {
    v6 = v5;
    char v7 = 0;
    if (!readdir_r(v5, &v12, &v11))
    {
      v8 = v11;
      if (v11)
      {
        while (1)
        {
          d_name = v8->d_name;
          if (strcmp(v8->d_name, "."))
          {
            if (strcmp(d_name, "..")) {
              break;
            }
          }

          char v7 = 0;
          if (!readdir_r(v6, &v12, &v11))
          {
            v8 = v11;
            if (v11) {
              continue;
            }
          }

          goto LABEL_12;
        }

        char v7 = 1;
      }
    }

LABEL_12:
    closedir(v6);
  }

  else
  {
    char v7 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
  return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

BOOL sub_41F4(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = stat(a2, &v8) != 0;
  LOBYTE(a2) = xpc_BOOL_get_value(v5);

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6 ^ a2;
  return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

uint64_t sub_4274(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  *(void *)(*(void *)(a1 + 32) + 8 * a2) = CFStringCreateWithCString(kCFAllocatorDefault, string_ptr, 0x8000100u);
  return 1LL;
}

uint64_t sub_42D0(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(void *)(v4 + 8 * v6) = v3;
  return 1LL;
}

void sub_4320(uint64_t a1)
{
  switch(*(_DWORD *)(*(void *)(a1 + 32) + 36LL))
  {
    case 1:
      xpc_event_provider_token_fire();
    case 2:
      xpc_event_provider_token_set_state();
    case 3:
    case 4:
      sub_3988(*(void *)(a1 + 32));
      break;
    default:
      return;
  }
}

void sub_474C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_4764(uint64_t a1)
{
  BOOL v2 = -[FSEventStreamMultiplexerClient initWithID:name:callback:]( [FSEventStreamMultiplexerClient alloc],  "initWithID:name:callback:",  [*(id *)(a1 + 32) nextAvailableID],  *(void *)(a1 + 40),  *(void *)(a1 + 56));
  if (v2)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v3 = *(id *)(a1 + 48);
    id v4 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v4)
    {
      id v5 = v4;
      char v22 = 0;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          int v9 = objc_autoreleasePoolPush();
          v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToClientsMap]);
          int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

          if (!v11)
          {
            dirent v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToClientsMap]);
            [v13 setObject:v12 forKeyedSubscript:v8];

            char v22 = 1;
          }

          int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToClientsMap]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);
          [v15 addObject:v2];

          objc_autoreleasePoolPop(v9);
        }

        id v5 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v5);
    }

    else
    {
      char v22 = 0;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
    xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexerClient clientID](v2, "clientID"));
    [v17 setObject:v2 forKeyedSubscript:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexerClient clientID](v2, "clientID"));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 intValue];

    objc_msgSend( *(id *)(a1 + 32),  "setNextAvailableID:",  objc_msgSend(*(id *)(a1 + 32), "nextAvailableID") + 1);
    if ((v22 & 1) != 0) {
      [*(id *)(a1 + 32) _refreshStream];
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexerClient name](v2, "name"));
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)__int128 buf = 138543618;
      xpc_type_t v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Client '%{public}@' registered for paths %{public}@", buf, 0x16u);
    }
  }

  else
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_5A50();
    }
  }
}

void sub_4B18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_4B30(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToClientsMap]);
  id v3 = [v2 mutableCopy];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v21 = a1;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToClientsMap]);
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v13]);
          [v14 removeObject:v6];

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v13]);
          id v16 = [v15 count];

          if (!v16)
          {
            [v3 removeObjectForKey:v13];
            char v10 = 1;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }

      while (v9);
    }

    else
    {
      char v10 = 0;
    }

    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(v21 + 32) logHandle]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      *(_DWORD *)__int128 buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Client '%{public}@' unregistered", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(v21 + 32) + 40LL), v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v21 + 32) clients]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(v21 + 48)));
    [v19 removeObjectForKey:v20];

    if ((v10 & 1) != 0) {
      [*(id *)(v21 + 32) _refreshStream];
    }
    *(_BYTE *)(*(void *)(*(void *)(v21 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_5828(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [a2 _handleStream:a1 numEvents:a3 eventPaths:a4 eventFlags:a5 eventIds:a6];
}

void sub_5950( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_5960( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_59B8(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 length];
  _os_log_error_impl( &dword_0,  v3,  OS_LOG_TYPE_ERROR,  "fsevents.matching state is too large to report (%lu bytes)",  (uint8_t *)&v4,  0xCu);
}

void sub_5A50()
{
}

void sub_5A7C()
{
}

void sub_5AA8()
{
}

void sub_5AD4()
{
}

void sub_5B00(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Received invalid path from FSEvents.", buf, 2u);
}

void sub_5B3C(void *a1)
{
  sub_5960(&dword_0, v1, v2, "Failed to create FSEventStream[flags=0x%08x].", v3, v4, v5, v6, 0);
  sub_597C();
}

void sub_5BAC(void *a1)
{
  sub_5960(&dword_0, v1, v2, "Failed to start FSEventStream[flags=0x%08x].", v3, v4, v5, v6, 0);
  sub_597C();
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
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

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}