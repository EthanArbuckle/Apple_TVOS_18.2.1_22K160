uint64_t sub_100000F94(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v4;
  const char *v5;
  _DWORD *v7;
  uint64_t v8;
  v4 = 0LL;
  v5 = "__cstring";
  do
  {
    if (*a2 == *(void *)v5 && a2[1] == *((void *)v5 + 1))
    {
      v8 = *(void *)(a1 + 40) + 8 * v4;
      *(_DWORD *)(v8 + 16) = a3;
      v7 = (_DWORD *)(v8 + 20);
      goto LABEL_10;
    }

    ++v4;
    v5 += 16;
  }

  while (v4 != 5);
  if (*a2 ^ 0x74736E6F635F5FLL | a2[1]) {
    return 0LL;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
  v7 = (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 28LL);
LABEL_10:
  *v7 = a4;
  return 0LL;
}

uint64_t sub_10000101C(void *a1, uint64_t a2)
{
  uint64_t result = 0LL;
  int v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 26)
  {
    if (v4 == 44 || v4 == 33)
    {
      v14 = (_BYTE *)a1[9];
      if (!v14 || !*(_DWORD *)(a2 + 16)) {
        goto LABEL_58;
      }
      goto LABEL_29;
    }

    if (v4 != 27) {
      goto LABEL_59;
    }
    v11 = (_OWORD *)a1[8];
    if (v11) {
      _OWORD *v11 = *(_OWORD *)(a2 + 8);
    }
    uint64_t v12 = a1[9];
    if (v12) {
      *(void *)(v12 + 8) = a2 + 8;
    }
    v13 = a1 + 5;
LABEL_26:
    v14 = (_BYTE *)(*(void *)(*v13 + 8LL) + 24LL);
LABEL_29:
    uint64_t result = 0LL;
    _BYTE *v14 = 1;
    goto LABEL_59;
  }

  switch(v4)
  {
    case 1:
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = *(unsigned int *)(a2 + 36);
      v15 = (_BYTE *)a1[9];
      if (v15)
      {
        if ((*(_BYTE *)(a2 + 52) & 8) != 0) {
          _BYTE *v15 = 1;
        }
        unint64_t v16 = *(unsigned int *)(a2 + 48);
        if (68 * (unint64_t)v16 + 56 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v16)
          {
            uint64_t v26 = a1[4];
            uint64_t v27 = a2 + 56;
            unint64_t v28 = 1LL;
            do
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v26 + 16))( v26,  v27,  *(unsigned int *)(v27 + 40),  *(unsigned int *)(v27 + 36));
              if ((_DWORD)result) {
                BOOL v29 = 1;
              }
              else {
                BOOL v29 = v28 >= v16;
              }
              ++v28;
              v27 += 68LL;
            }

            while (!v29);
            break;
          }

          goto LABEL_58;
        }

LABEL_34:
        uint64_t result = 88LL;
        break;
      }

LABEL_58:
      uint64_t result = 0LL;
      break;
    case 12:
      unsigned int v18 = *(_DWORD *)(a2 + 4);
      uint64_t v17 = *(unsigned int *)(a2 + 8);
      v20 = (uint64_t *)(a2 + v17);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = *(uint64_t *)((char *)v20 + 15);
      BOOL v24 = v21 == 0x6C2F687461707240LL && v22 == 0x5F676E616C636269LL;
      if (!v24 || v23 != 0x6E6173612E74725FLL) {
        goto LABEL_58;
      }
      v13 = a1 + 7;
      goto LABEL_26;
    case 25:
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = *(void *)(a2 + 48);
      v5 = (_BYTE *)a1[9];
      if (v5)
      {
        if ((*(_BYTE *)(a2 + 68) & 8) != 0) {
          _BYTE *v5 = 1;
        }
        unint64_t v6 = *(unsigned int *)(a2 + 64);
        if (80 * (unint64_t)v6 + 72 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v6)
          {
            uint64_t v7 = a1[4];
            uint64_t v8 = a2 + 72;
            unint64_t v9 = 1LL;
            while (!HIDWORD(*(void *)(v8 + 40)))
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 16))( v7,  v8,  *(unsigned int *)(v8 + 48));
              if ((_DWORD)result) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = v9 >= v6;
              }
              ++v9;
              v8 += 80LL;
              if (v10) {
                goto LABEL_59;
              }
            }

            uint64_t result = 34LL;
            break;
          }

          goto LABEL_58;
        }

        goto LABEL_34;
      }

      goto LABEL_58;
  }

LABEL_59:
  if (!a1[9] && *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    if (*(void *)(*(void *)(a1[6] + 8LL) + 24LL)) {
      return 89LL;
    }
  }

  return result;
}

void sub_1000012A8()
{
  int v0 = dword_10000C090;
  if (dword_10000C090 != -1) {
    goto LABEL_5;
  }
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  int v0 = open((const char *)qword_10000C198, 0x100000);
  dword_10000C090 = v0;
  if ((v0 & 0x80000000) == 0)
  {
LABEL_5:
    uint64_t v1 = openat(v0, "roles.plist", 256);
    if ((_DWORD)v1 == -1)
    {
      if (*__error() != 2) {
        _os_assumes_log(0LL);
      }
      goto LABEL_15;
    }

    v2 = -[NSFileHandle initWithFileDescriptor:](objc_alloc(&OBJC_CLASS___NSFileHandle), "initWithFileDescriptor:", v1);
    id v14 = 0LL;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataToEndOfFileAndReturnError:](v2, "readDataToEndOfFileAndReturnError:", &v14));
    id v4 = v14;
    v5 = v4;
    if (v3)
    {
      -[NSFileHandle closeFile](v2, "closeFile");

      unint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  1LL,  0LL,  0LL));
      if (v6)
      {
        v13 = v6;
      }

      goto LABEL_16;
    }

    NSErrorDomain v7 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v4 domain]);
    NSErrorDomain v8 = v7;
    if (v7 == NSCocoaErrorDomain)
    {
      id v9 = [v5 code];

      if (v9 == (id)260)
      {
LABEL_14:
        -[NSFileHandle closeFile](v2, "closeFile");

LABEL_15:
        unint64_t v6 = 0LL;
LABEL_16:
        v13 = objc_alloc_init(&OBJC_CLASS___NSArray);

LABEL_17:
        uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v13));
        v11 = (void *)qword_10000C158;
        qword_10000C158 = v10;

        return;
      }
    }

    else
    {
    }

    _os_assumes_log(0LL);
    goto LABEL_14;
  }

  uint64_t v12 = *__error();
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
  qword_10000C148 = v12;
  __break(1u);
}

void start()
{
}

void sub_100001534()
{
  qword_10000C160 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd_helper", 0LL, 0LL);
  mach_service = xpc_connection_create_mach_service("com.apple.logd_helper", (dispatch_queue_t)qword_10000C160, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000085C8);
  xpc_connection_activate(mach_service);
  qword_10000C168 = (uint64_t)mach_service;
}

void sub_10000159C(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_1000015FC((_xpc_connection_s *)a2);
  }

  else
  {
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10000C148 = (uint64_t)type;
    __break(1u);
  }
}

void sub_1000015FC(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000LL;
  v2[2] = sub_10000169C;
  v2[3] = &unk_1000085E8;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_10000C160);
  xpc_connection_activate(a1);
}

#error "10000177C: switch analysis failed: switch information is incomplete or incorrect (funcsize=62)"
void sub_1000017A8(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 *uuid;
  unsigned __int8 *v5;
  int v6;
  void v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    v5 = uuid;
    if (sub_10000651C(uuid))
    {
      unint64_t v6 = 0;
    }

    else
    {
      NSErrorDomain v8 = 0LL;
      id v9 = &v8;
      uint64_t v10 = 0x2000000000LL;
      v11 = 2;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 0x40000000LL;
      v7[2] = sub_100004F7C;
      v7[3] = &unk_1000087D8;
      v7[4] = &v8;
      v7[5] = v5;
      dyld_for_each_installed_shared_cache(v7);
      unint64_t v6 = *((_DWORD *)v9 + 6);
      _Block_object_dispose(&v8, 8);
    }
  }

  else
  {
    unint64_t v6 = 22;
  }

  sub_100003254(a1, xdict, v6);
}

void sub_1000018A8(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid) {
    int v5 = sub_100004730(uuid);
  }
  else {
    int v5 = 22;
  }
  sub_100003254(a1, xdict, v5);
}

void sub_1000018F4(_xpc_connection_s *a1, xpc_object_t xdict)
{
  kern_return_t v14;
  vm_address_t v15;
  vm_address_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  unsigned int v20;
  vm_address_t v21;
  CFStringRef *v22;
  unsigned int *v23;
  size_t v24;
  _DWORD *v25;
  size_t v26;
  int v27;
  unint64_t v28;
  int v29;
  BOOL v30;
  __int128 v31;
  int v32;
  unsigned int *v33;
  void *v34;
  unsigned int v35;
  CFStringRef *v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  CFArrayRef v42;
  unsigned int v43;
  uint64_t v44;
  vm_size_t v45;
  CFDictionaryRef v46;
  int v47;
  vm_address_t v48;
  uint64_t v49;
  char *__base;
  void context[11];
  unsigned int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  vm_address_t address;
  void v62[4];
  _OWORD v63[5];
  int v64;
  char __b[1024];
  if (qword_10000C1D8 != -1) {
    dispatch_once(&qword_10000C1D8, &stru_100008A88);
  }
  if (!byte_10000C108 || (uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid")) == 0LL)
  {
    int v6 = 22;
    goto LABEL_49;
  }

  int v5 = uuid;
  if (sub_10000651C(uuid))
  {
    int v6 = 0;
LABEL_49:
    sub_100003254(a1, xdict, v6);
    return;
  }

  address = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  v57 = 0LL;
  v58 = &v57;
  v59 = 0x2000000000LL;
  v60 = 0;
  v53 = 0LL;
  v54 = &v53;
  v55 = 0x2000000000LL;
  v56 = 0;
  CFArrayRef v7 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10000C0A8, 9LL, &kCFTypeArrayCallBacks);
  if (!v7)
  {
    int v6 = 88;
LABEL_48:
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    goto LABEL_49;
  }

  CFArrayRef v8 = v7;
  id v9 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, v7);
  if (!v9)
  {
    int v6 = 12;
LABEL_47:
    CFRelease(v8);
    goto LABEL_48;
  }

  uint64_t v10 = v9;
  CFTypeID v11 = CFGetTypeID(v9);
  if (v11 != CFDictionaryGetTypeID()) {
    goto LABEL_45;
  }
  unsigned int Count = CFDictionaryGetCount(v10);
  vm_size_t v13 = (vm_page_size + 232LL * Count + 15) & -(uint64_t)vm_page_size;
  id v14 = vm_allocate(mach_task_self_, &address, v13, 1);
  if (v14)
  {
    _os_assumes_log(v14);
LABEL_45:
    int v6 = 88;
    goto LABEL_46;
  }

  v15 = address;
  unint64_t v16 = address;
  *(void *)address = 0x264736368LL;
  uint64_t v17 = (char *)(v16 + 16);
  v43 = 5 * Count;
  context[0] = _NSConcreteStackBlock;
  context[1] = 0x40000000LL;
  context[2] = sub_100004AA0;
  context[3] = &unk_1000086F0;
  v44 = Count;
  v52 = Count;
  v48 = v15;
  v49 = (uint64_t)&v17[120 * Count + 32 * Count];
  context[6] = v15;
  context[7] = v17;
  context[4] = &v53;
  context[5] = &v57;
  context[8] = v49 + 40LL * Count;
  context[9] = v49;
  __base = &v17[120 * Count];
  context[10] = __base;
  CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_100004F1C, context);
  if (*((_BYTE *)v54 + 24))
  {
    _os_assumes_log(1LL);
    int v6 = 88;
    goto LABEL_31;
  }

  v45 = v13;
  v46 = v10;
  unsigned int v18 = *(unsigned int *)(address + 8);
  v19 = *(unsigned int *)(address + 12);
  qsort_b(v17, v18, 0x18uLL, &stru_100008730);
  qsort_b(&v17[120 * Count + 40 * Count + 32 * Count], v18, 0x10uLL, &stru_100008770);
  v47 = 24 * v18 + 16 + 32 * v19;
  v20 = *((_DWORD *)v58 + 6) + v47;
  if ((_DWORD)v19)
  {
    uint64_t v21 = v48 + 24LL * v43;
    uint64_t v22 = (CFStringRef *)(v21 + 32LL * Count + 48);
    uint64_t v23 = (unsigned int *)(v21 + 44);
    BOOL v24 = v19;
    while (1)
    {
      *uint64_t v23 = v20;
      if (!CFStringGetCString(*v22, __b, 1024LL, 0x8000100u)) {
        break;
      }
      v20 += strnlen(__b, 0x400uLL) + 1;
      v22 += 5;
      v23 += 8;
      if (!--v24) {
        goto LABEL_17;
      }
    }

    int v6 = 2;
    goto LABEL_30;
  }

LABEL_17:
  v42 = v8;
  qsort_b(__base, v19, 0x20uLL, &stru_1000087B0);
  if ((_DWORD)v18)
  {
    v25 = (_DWORD *)(v48 + 32);
    uint64_t v26 = v18;
    uint64_t v27 = 24 * v18 + 16 + 32 * v19;
    while (1)
    {
      unint64_t v28 = *(void *)(v49 + 40LL * *v25 + 16);
      *(v25 - 2) = v27;
      *v25 = sub_1000065DC((uint64_t)__base, v19, v28);
      BOOL v29 = *(v25 - 1);
      v30 = __CFADD__(v27, v29);
      v27 += v29;
      if (v30) {
        break;
      }
      v25 += 6;
      if (!--v26) {
        goto LABEL_26;
      }
    }

    int v6 = 88;
    CFArrayRef v8 = v42;
    goto LABEL_30;
  }

  uint64_t v27 = 32 * v19 + 16;
LABEL_26:
  if (*((_DWORD *)v58 + 6) + v47 != v27)
  {
    v41 = _os_assert_log(0LL);
    _os_crash(v41);
    __break(1u);
  }

  v64 = -1431655766;
  *(void *)&v31 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v63[3] = v31;
  v63[4] = v31;
  v63[1] = v31;
  v63[2] = v31;
  v63[0] = v31;
  sub_100003980(v5, 3u, (uint64_t)v63);
  CFArrayRef v8 = v42;
  if (v32)
  {
    int v6 = 0;
LABEL_30:
    vm_size_t v13 = v45;
    uint64_t v10 = v46;
LABEL_31:
    vm_deallocate(mach_task_self_, address, v13);
LABEL_46:
    CFRelease(v10);
    goto LABEL_47;
  }

  v62[0] = address;
  v62[1] = 24LL * v18 + 16;
  v62[2] = __base;
  v62[3] = 32 * v19;
  if (_os_trace_writev(DWORD1(v63[0]), v62, 2LL) == -1) {
    goto LABEL_52;
  }
  if ((_DWORD)v18)
  {
    v33 = (unsigned int *)(v48 + 28);
    v34 = (void *)(24LL * v43 + 72LL * v44 + v48 + 24);
    while (1)
    {
      v35 = *v33;
      v33 += 6;
      if (_os_trace_write(DWORD1(v63[0]), *v34, v35) == -1) {
        break;
      }
      v34 += 2;
      if (!--v18) {
        goto LABEL_37;
      }
    }

LABEL_52:
    v40 = __error();
    _os_assumes_log(*v40);
    v39 = *__error();
LABEL_53:
    vm_size_t v13 = v45;
    uint64_t v10 = v46;
    goto LABEL_54;
  }

LABEL_37:
  if ((_DWORD)v19)
  {
    v36 = (CFStringRef *)(32 * v44 + 24LL * v43 + v48 + 48);
    while (CFStringGetCString(*v36, __b, 1024LL, 0x8000100u))
    {
      v37 = DWORD1(v63[0]);
      v38 = strnlen(__b, 0x400uLL);
      if (_os_trace_write(v37, __b, v38 + 1) == -1) {
        goto LABEL_52;
      }
      v36 += 5;
      if (!--v19) {
        goto LABEL_42;
      }
    }

    v39 = 2LL;
    goto LABEL_53;
  }

LABEL_42:
  vm_size_t v13 = v45;
  uint64_t v10 = v46;
  if (lseek(SDWORD1(v63[0]), 0LL, 1) == v20)
  {
    v39 = 0LL;
LABEL_54:
    int v6 = sub_100003DDC((uint64_t)v63, v39);
    goto LABEL_31;
  }

  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
  qword_10000C148 = v20;
  __break(1u);
}

void sub_100001F08(_xpc_connection_s *a1, xpc_object_t xdict)
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&out[16] = v4;
  *(_OWORD *)uuid_string_t out = v4;
  string = xpc_dictionary_get_string(xdict, "path");
  if (!string || (int v6 = string, (uuid = xpc_dictionary_get_uuid(xdict, "uuid")) == 0LL))
  {
    int v22 = 22;
    goto LABEL_53;
  }

  uint64_t v8 = (uint64_t)uuid;
  uuid_unparse(uuid, out);
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v52[3] = v9;
  v52[4] = v9;
  v52[1] = v9;
  v52[2] = v9;
  v52[0] = v9;
  xpc_object_t array = xpc_dictionary_get_array(xdict, "sections");
  CFTypeID v11 = array;
  if (array)
  {
    if (xpc_array_get_count(array) == 5)
    {
      size_t v12 = 0LL;
      vm_size_t v13 = (void *)v52 + 1;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v11, v12);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data) {
          break;
        }
        memset(__str, 170, 16);
        data = xpc_array_get_data(v11, v12, (size_t *)&__str[8]);
        uint64_t v16 = *(void *)&__str[8];
        *(v13 - 1) = data;
        void *v13 = v16;
        ++v12;
        v13 += 2;
        if (v12 == 5) {
          goto LABEL_8;
        }
      }
    }

LABEL_48:
    int v22 = 22;
    goto LABEL_53;
  }

LABEL_8:
  if (!xpc_dictionary_get_BOOL(xdict, "ftab"))
  {
    char v42 = xpc_dictionary_get_BOOL(xdict, "fake_uuid");
    if (v11) {
      v43 = v52;
    }
    else {
      v43 = 0LL;
    }
    int v22 = sub_100003F74((uint64_t)v6, v8, (uint64_t)v43, v42);
    goto LABEL_53;
  }

  uint64_t v17 = xpc_dictionary_get_string(xdict, "role");
  if (!v17) {
    goto LABEL_48;
  }
  uint64_t v18 = (uint64_t)v17;
  size_t v48 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v47 = 0LL;
  memset(__b, 170, sizeof(__b));
  v19 = opendir("/private/var/tmp/FTABHarvest");
  if (!v19)
  {
    memset(__str, 170, sizeof(__str));
    v45 = __error();
    v46 = strerror(*v45);
    snprintf(__str, 0x400uLL, "Error opening FTAB harvesting folder %s", v46);
    sub_1000033AC((uint64_t)__str);
    int v22 = 9;
    goto LABEL_57;
  }

  v20 = v19;
  uint64_t v21 = 0LL;
  int v22 = 0;
  while (1)
  {
    uint64_t v23 = readdir(v20);
    if (!v23) {
      break;
    }
    int v22 = 2;
    if ((v23->d_type | 2) == 0xA)
    {
      snprintf(__b, 0x400uLL, "%s/%s", "/private/var/tmp/FTABHarvest", v23->d_name);
      uint64_t v24 = _os_trace_mmap_at(4294967294LL, __b, 0LL, &v48);
      uint64_t v21 = (void *)v24;
      if (v24)
      {
        if (v48 >> 31)
        {
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Invalid FTAB size 0x%zx", v48);
          sub_1000033AC((uint64_t)__str);
          munmap(v21, v48);
          int v22 = 2;
        }

        else
        {
          size_t v57 = v48;
          int v51 = -1431655766;
          uint64_t v50 = v24;
          if (v48 < 0x30) {
            goto LABEL_22;
          }
          if (!*(_DWORD *)(v24 + 4) || *(void *)(v24 + 32) != 0x62617466736F6B72LL) {
            goto LABEL_19;
          }
          uint64_t v27 = v24 + 48;
          uint64_t v28 = *(unsigned int *)(v24 + 40);
          if (16 * v28 + 48 > v48)
          {
LABEL_22:
            int v22 = 22;
            goto LABEL_23;
          }

          if (!(_DWORD)v28)
          {
            int v22 = 2;
            goto LABEL_23;
          }

          uint64_t v30 = 0LL;
          while (2)
          {
            uint64_t v31 = v27 + 16 * v30;
            size_t v32 = *(unsigned int *)(v31 + 4);
            if (v48 >= v32 && (unint64_t v33 = *(unsigned int *)(v31 + 8), v48 - v32 >= v33))
            {
              uint64_t v34 = 0LL;
              size_t v35 = v24 + v32;
              while (1)
              {
                uint64_t v36 = dword_1000070F4[v34];
                if (v36 + 64 > v33) {
                  goto LABEL_38;
                }
                uint64_t v37 = v35 + v36;
                if (*(_DWORD *)v37 == 1684632949) {
                  break;
                }
                if (++v34 == 8) {
                  goto LABEL_38;
                }
              }

              *(_OWORD *)__str = *(_OWORD *)(v37 + 16);
              if (*(void *)__str == *(void *)v8 && *(void *)&__str[8] == *(void *)(v8 + 8))
              {
                int v51 = *(_DWORD *)(v27 + 16 * v30);
                int v39 = sub_1000032BC(v24, v48, "_osl", &v50, &v57);
                if (v39)
                {
                  int v40 = v39;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding OS LOG file in FTAB 0x%x");
LABEL_45:
                  sub_1000033AC((uint64_t)__str);
                  int v22 = v40;
                  goto LABEL_24;
                }

                int v41 = sub_1000032BC(v50, v57, &v51, &v49, &v47);
                if (v41)
                {
                  int v40 = v41;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding tag %.4s in OS LOG FTAB 0x%x");
                  goto LABEL_45;
                }

                closedir(v20);
                goto LABEL_60;
              }

LABEL_38:
              ++v30;
              int v22 = 2;
              if (v30 != v28) {
                continue;
              }
            }

            else
            {
LABEL_19:
              int v22 = 9;
            }

            break;
          }

LABEL_23:
          *(void *)&v56[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uuid_string_t v56 = v29;
          *(_OWORD *)&v56[16] = v29;
          uuid_unparse((const unsigned __int8 *)v8, v56);
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Error finding UUID %s in ftab 0x%x", v56, v22);
          sub_1000033AC((uint64_t)__str);
LABEL_24:
          munmap(v21, v48);
        }
      }

      else
      {
        memset(__str, 170, sizeof(__str));
        v25 = __error();
        uint64_t v26 = strerror(*v25);
        snprintf(__str, 0x400uLL, "Error mapping FTAB: %s err: %s", __b, v26);
        sub_1000033AC((uint64_t)__str);
        int v22 = 2;
      }
    }
  }

  closedir(v20);
  if (v22)
  {
    *(void *)&v56[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v44 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v56 = v44;
    *(_OWORD *)&v56[16] = v44;
    uuid_unparse((const unsigned __int8 *)v8, v56);
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Error finding OS LOG section for uuid: %s", v56);
    sub_1000033AC((uint64_t)__str);
    goto LABEL_57;
  }

LABEL_60:
  *(_OWORD *)uuid_string_t v56 = xmmword_100007070;
  LODWORD(v57) = 1;
  HIDWORD(v57) = v47;
  *(void *)__str = v56;
  *(void *)&__str[8] = 16LL;
  *(void *)&__str[16] = &v57;
  *(void *)&__str[24] = 8LL;
  *(void *)&__str[32] = v49;
  *(void *)&__str[40] = v47;
  *(void *)&__str[48] = v6;
  *(void *)&__str[56] = strlen(v6) + 1;
  int v22 = sub_1000038D4((unsigned __int8 *)v8, 1u, (uint64_t)__str, 4LL);
  munmap(v21, v48);
  sub_100005FB4(v18);
  if (v22)
  {
LABEL_57:
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Harvesting from ftab failed(uuid: %s, err: 0x%x)");
    goto LABEL_58;
  }

  memset(__str, 170, sizeof(__str));
  snprintf(__str, 0x400uLL, "Harvesting from ftab succeded: %s");
LABEL_58:
  sub_1000033AC((uint64_t)__str);
LABEL_53:
  sub_100003254(a1, xdict, v22);
}

void sub_1000025DC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  kern_return_t v12;
  kern_return_t v13;
  kern_return_t v14;
  kern_return_t v15;
  kern_return_t v16;
  kern_return_t v17;
  kern_return_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_port_t connection;
  mach_vm_size_t size;
  mach_vm_address_t address;
  __int128 v24;
  int v25;
  int v26;
  uuid_string_t out;
  void v28[6];
  _OWORD __b[64];
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v4;
  *(_OWORD *)&out[16] = v4;
  uuid = xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    int v6 = (unsigned __int8 *)uuid;
    uuid_unparse(uuid, out);
    if (xpc_dictionary_get_string(xdict, "path"))
    {
      BOOL v7 = xpc_dictionary_get_BOOL(xdict, "coproc_free_only");
      string = xpc_dictionary_get_string(xdict, "role");
      size = 0xAAAAAAAAAAAAAAAALL;
      address = 0LL;
      connection = -1431655766;
      int v9 = sub_100005C98(&connection, string, v6);
      if (v9)
      {
        int v10 = v9;
        memset(__b, 170, sizeof(__b));
        snprintf( (char *)__b,  0x400uLL,  "Harvesting failed: can't connect to RTBuddyClient(returned: 0x%x, role: %s)",  v10,  string);
        sub_1000033AC((uint64_t)__b);
        int v11 = 22;
        goto LABEL_15;
      }

      if (v7)
      {
        int v11 = 0;
      }

      else
      {
        *(void *)&__b[0] = 0xAAAAAAAA00000000LL;
        *((void *)&__b[0] + 1) = &size;
        id v14 = IOConnectCallMethod(connection, 0, 0LL, 0, __b, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
        if (v14)
        {
          v15 = v14;
          memset(__b, 170, sizeof(__b));
          snprintf( (char *)__b,  0x400uLL,  "Harvesting failed: can't get OSLog segment size(returned: 0x%x, role: %s)",  v15,  string);
          sub_1000033AC((uint64_t)__b);
          int v11 = 22;
          goto LABEL_14;
        }

        uint64_t v16 = mach_vm_allocate(mach_task_self_, &address, size, 1);
        if (v16)
        {
          uint64_t v17 = v16;
          memset(__b, 170, sizeof(__b));
          snprintf( (char *)__b,  0x400uLL,  "Harvesting failed: can't allocate memory for OSLog segment(returned: 0x%x, vm_size: 0x%llx, role: %s)",  v17,  size,  string);
          sub_1000033AC((uint64_t)__b);
          int v11 = 12;
          goto LABEL_14;
        }

        *(void *)&__b[0] = 0xAAAAAAAA00000001LL;
        *((void *)&__b[0] + 1) = address;
        uint64_t v18 = IOConnectCallMethod(connection, 0, 0LL, 0, __b, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
        if (v18)
        {
          v19 = v18;
          memset(__b, 170, sizeof(__b));
          snprintf( (char *)__b,  0x400uLL,  "Harvesting failed: can't copy OSLogSegment to allocated memory(returned: 0x%x, addr: 0x%llx, role: %s)",  v19,  address,  string);
          sub_1000033AC((uint64_t)__b);
          int v11 = 22;
        }

        else
        {
          uint64_t v24 = xmmword_100007070;
          v25 = 1;
          uint64_t v26 = size;
          v28[0] = &v24;
          v28[1] = 24LL;
          v28[2] = address;
          v28[3] = size;
          v28[4] = string;
          v28[5] = strlen(string) + 1;
          int v11 = sub_1000038D4(v6, 1u, (uint64_t)v28, 3LL);
        }

        v20 = mach_vm_deallocate(mach_task_self_, address, size);
        if (v20)
        {
          qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: mach_vm_deallocate failed";
          qword_10000C148 = v20;
          __break(1u);
        }
      }

      __b[0] = xmmword_100007090;
      size_t v12 = IOConnectCallMethod(connection, 0, 0LL, 0, __b, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
      if (v12)
      {
        vm_size_t v13 = v12;
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "OSLog segment memory free failed(returned: 0x%x, role: %s)", v13, string);
        sub_1000033AC((uint64_t)__b);
      }

LABEL_14:
      IOServiceClose(connection);
      sub_100005FB4((uint64_t)string);
      if (!v11)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "Harvesting from memory succeded: %s");
        goto LABEL_16;
      }

LABEL_15:
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Harvesting from memory failed(uuid: %s, err: 0x%x)");
LABEL_16:
      sub_1000033AC((uint64_t)__b);
      goto LABEL_17;
    }
  }

  int v11 = 22;
LABEL_17:
  sub_100003254(a1, xdict, v11);
}

void sub_100002A0C(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 uint64 = xpc_dictionary_get_uint64(xdict, "directory");
  switch(uint64)
  {
    case 0u:
      if (qword_10000C1B0 != -1) {
        dispatch_once(&qword_10000C1B0, &stru_1000089C8);
      }
      int v5 = (const char *)qword_10000C198;
      if (qword_10000C198) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 1u:
      if (qword_10000C1B0 != -1) {
        dispatch_once(&qword_10000C1B0, &stru_1000089C8);
      }
      int v5 = (const char *)qword_10000C1A0;
      if (!qword_10000C1A0) {
        goto LABEL_21;
      }
      goto LABEL_13;
    case 2u:
      if (qword_10000C1B0 != -1) {
        dispatch_once(&qword_10000C1B0, &stru_1000089C8);
      }
      int v5 = (const char *)qword_10000C1A8;
      if (qword_10000C1A8) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 3u:
      int v5 = (const char *)_os_trace_prefsdir_path();
      if (!v5) {
        goto LABEL_21;
      }
LABEL_13:
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Migrating: %s", v5);
      sub_1000033AC((uint64_t)__b);
      mode_t v6 = word_100007180[6 * uint64 + 4];
      int v7 = mkpathat_np(-2, v5, v6);
      if (v7) {
        BOOL v8 = v7 == 17;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        if (fchmodat(-2, v5, v6, 32))
        {
          memset(__b, 170, sizeof(__b));
          int v9 = __error();
          snprintf(__b, 0x400uLL, "Failed to chmod %s, error %d", v5, *v9);
          sub_1000033AC((uint64_t)__b);
          int v10 = 1;
        }

        else
        {
          int v10 = 0;
        }

        v24[0] = (char *)v5;
        v24[1] = 0LL;
        size_t v12 = fts_open(v24, 2132, 0LL);
        if (v12)
        {
          vm_size_t v13 = v12;
          id v14 = fts_read(v12);
          if (v14)
          {
            v15 = v14;
            do
            {
              switch(v15->fts_info)
              {
                case 2u:
                  v15->fts_errno = 62;
                  goto LABEL_31;
                case 4u:
                case 7u:
                case 0xAu:
LABEL_31:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "%s, error %d");
                  goto LABEL_32;
                case 6u:
                case 8u:
                  goto LABEL_28;
                case 0xCu:
                case 0xDu:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "Warning: %s is a symlink", v15->fts_path);
                  sub_1000033AC((uint64_t)__b);
LABEL_28:
                  if (fchownat(-2, v15->fts_path, 0x110u, 0x110u, 32))
                  {
                    memset(__b, 170, sizeof(__b));
                    __error();
                    snprintf(__b, 0x400uLL, "Failed to chown %s, error %d");
LABEL_32:
                    sub_1000033AC((uint64_t)__b);
                    ++v10;
                  }

                  break;
                default:
                  break;
              }

              v15 = fts_read(v13);
            }

            while (v15);
          }

          fts_close(v13);
          if (!v10)
          {
            memset(__b, 170, sizeof(__b));
            snprintf(__b, 0x400uLL, "%s/%s", v5, ".migrated");
            int v16 = openat(-2, __b, 1538, 420LL);
            if (v16 < 0)
            {
              memset(__str, 170, sizeof(__str));
              uint64_t v21 = __error();
              snprintf(__str, 0x400uLL, "Failed to create marker file %s, error %d", __b, *v21);
              sub_1000033AC((uint64_t)__str);
            }

            else
            {
              int v17 = v16;
              if (fchown(v16, 0x110u, 0x110u) == -1)
              {
                int v22 = __error();
                _os_assumes_log(*v22);
              }

              if (close(v17) == -1)
              {
                int v18 = *__error();
                uint64_t v19 = *__error();
                if (v18 == 9)
                {
                  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                  qword_10000C148 = v19;
                  __break(1u);
                  JUMPOUT(0x100002F10LL);
                }

                _os_assumes_log(v19);
                v20 = __error();
                _os_assumes_log(*v20);
              }
            }
          }

          int v11 = 0;
        }

        else
        {
          int v11 = *__error();
          memset(__b, 170, sizeof(__b));
          snprintf(__b, 0x400uLL, "Failed to open %s, error %d", v5, v11);
          sub_1000033AC((uint64_t)__b);
        }
      }

      else
      {
        int v11 = v7;
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Failed to create %s, error %d", v5, v11);
        sub_1000033AC((uint64_t)__b);
      }

      break;
    default:
LABEL_21:
      int v11 = 22;
      break;
  }

  sub_100003254(a1, xdict, v11);
}

void sub_100002F50(_xpc_connection_s *a1, void *a2)
{
}

void sub_100002F58(_xpc_connection_s *a1, void *a2)
{
}

void sub_100002F60()
{
  int v0 = &stru_100008988;
  uint64_t v1 = (void *)qword_10000C158;
  if (!qword_10000C158)
  {
    sub_1000012A8();
    uint64_t v1 = (void *)qword_10000C158;
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      mode_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) UTF8String];
        sub_1000061F4(v7, (const char *)v7);
        mode_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }

    while (v4);
  }
}

void sub_10000307C(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uuid = xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    uint64_t v5 = (uint64_t)uuid;
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v6;
    *(_OWORD *)&out[16] = v6;
    uuid_copy(dst, uuid);
    uuid_unparse(dst, out);
    uint64_t v7 = CSGetBinaryPathForExclaveWithUUIDBytes(dst);
    if (v7)
    {
      int v8 = sub_100003F74(v7, v5, 0LL, 0);
      if (v8)
      {
        int v9 = v8;
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Harvesting from exclave failed (uuid: %s, err: %#x)", out, v9);
        sub_1000033AC((uint64_t)__b);
        __int128 v10 = a1;
        xpc_object_t v11 = xdict;
        int v12 = v9;
      }

      else
      {
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Harvesting from exclave succeded: %s", out);
        sub_1000033AC((uint64_t)__b);
        __int128 v10 = a1;
        xpc_object_t v11 = xdict;
        int v12 = 0;
      }
    }

    else
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Harvesting from exclave failed (uuid: %s, err: %#x)", out, 2);
      sub_1000033AC((uint64_t)__b);
      __int128 v10 = a1;
      xpc_object_t v11 = xdict;
      int v12 = 2;
    }

    sub_100003254(v10, v11, v12);
  }

  else
  {
    sub_100003254(a1, xdict, 22);
  }

void sub_100003254(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    __int128 v6 = reply;
    xpc_dictionary_set_int64(reply, "status", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }

uint64_t sub_1000032BC(uint64_t a1, unint64_t a2, _DWORD *a3, void *a4, void *a5)
{
  *a4 = 0LL;
  *a5 = 0LL;
  uint64_t v5 = 22LL;
  if (a2 >= 0x30 && a1 && a3)
  {
    if (*(_DWORD *)(a1 + 4) && *(void *)(a1 + 32) == 0x62617466736F6B72LL)
    {
      uint64_t v7 = *(unsigned int *)(a1 + 40);
      if (16 * v7 + 48 <= a2)
      {
        if (!(_DWORD)v7) {
          return 2LL;
        }
        uint64_t v8 = 0LL;
        for (i = (_DWORD *)(a1 + 48); *i != *a3; i += 4)
        {
          ++v8;
          uint64_t v5 = 2LL;
          if (v7 == v8) {
            return v5;
          }
        }

        uint64_t v10 = a1 + 48 + 16 * v8;
        unint64_t v11 = *(unsigned int *)(v10 + 4);
        if (a2 >= v11)
        {
          unint64_t v12 = *(unsigned int *)(v10 + 8);
          if (a2 - v11 >= v12)
          {
            uint64_t v5 = 0LL;
            *a4 = a1 + v11;
            *a5 = v12;
            return v5;
          }
        }
      }

      return 22LL;
    }

    else
    {
      return 9LL;
    }
  }

  return v5;
}

uint64_t sub_100003394(uint64_t a1)
{
  return 1LL;
}

void sub_1000033AC(uint64_t a1)
{
  if (qword_10000C170 != -1) {
    dispatch_once_f(&qword_10000C170, 0LL, (dispatch_function_t)sub_100003478);
  }
  if (!dispatch_get_specific(off_10000C098))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000LL;
    v2[2] = sub_1000035EC;
    v2[3] = &unk_100008668;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_10000C178, v2);
  }

int *sub_100003478()
{
  if (!qword_10000C180)
  {
    uint64_t v1 = *__error();
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_10000C148 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_10000C148 = v2;
    __break(1u);
    return result;
  }

  qword_10000C178 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_10000C180, 0LL, 0LL);
  dispatch_queue_set_specific((dispatch_queue_t)qword_10000C178, off_10000C098, (void *)qword_10000C178, 0LL);
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  asprintf((char **)&qword_10000C188, "%s/%s.0.log", (const char *)qword_10000C198, "logd_helper");
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  uint64_t result = (int *)asprintf((char **)&qword_10000C190, "%s/%s.1.log", (const char *)qword_10000C198, "logd_helper");
  if (!qword_10000C188 || !qword_10000C190) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_1000035EC(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
  memset(__b, 170, sizeof(__b));
  memset(v10, 170, 18);
  v8.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)int v9 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v8.tm_mon = v2;
  *(_OWORD *)&v8.tm_isuuid_t dst = v2;
  *(_OWORD *)&v8.tm_sec = v2;
  time_t v7 = time(0LL);
  localtime_r(&v7, &v8);
  strftime(v9, 0x1AuLL, "%F %T%z", &v8);
  id v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v9, v3, v4, v1);
  if ((int)result >= 1)
  {
    unsigned int v6 = result;
    if (result >= 0x400)
    {
      __b[1022] = 10;
      unsigned int v6 = 1023;
    }

    dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
    sub_100003728();
    uint64_t result = dword_10000C0A0;
    if ((dword_10000C0A0 & 0x80000000) == 0)
    {
      _os_trace_write(dword_10000C0A0, __b, v6);
      return sub_100003770();
    }
  }

  return result;
}

void sub_100003728()
{
  if (dword_10000C0A0 < 0)
  {
    sub_100003834();
    if ((dword_10000C0A0 & 0x80000000) == 0) {
      sub_100003770();
    }
  }

uint64_t sub_100003770()
{
  off_t v0 = lseek(dword_10000C0A0, 0LL, 2);
  uint64_t result = fsync(dword_10000C0A0);
  if (v0 >= 0x100000)
  {
    if (close(dword_10000C0A0) != -1)
    {
LABEL_3:
      rename((const char *)qword_10000C188, (const char *)qword_10000C190);
      return sub_100003834();
    }

    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }

    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10000C148 = result;
    __break(1u);
  }

  return result;
}

uint64_t sub_100003834()
{
  uint64_t result = open((const char *)qword_10000C188, 778, 420LL);
  dword_10000C0A0 = result;
  if ((result & 0x80000000) == 0) {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

void sub_100003884()
{
  if (qword_10000C170 != -1) {
    dispatch_once_f(&qword_10000C170, 0LL, (dispatch_function_t)sub_100003478);
  }
  dispatch_sync((dispatch_queue_t)qword_10000C178, &stru_1000086A8);
}

uint64_t sub_1000038D4(unsigned __int8 *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  int v11 = -1431655766;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  void v10[3] = v6;
  v10[4] = v6;
  v10[1] = v6;
  v10[2] = v6;
  v10[0] = v6;
  sub_100003980(a1, a2, (uint64_t)v10);
  uint64_t v8 = v7;
  if (!(_DWORD)v7)
  {
    if (_os_trace_writev(DWORD1(v10[0]), a3, a4) == -1) {
      uint64_t v8 = *__error();
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  return sub_100003DDC((uint64_t)v10, v8);
}

void sub_100003980(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  LODWORD(v6) = mkpath_np(__b, 0x1EDu);
  if ((_DWORD)v6 && (_DWORD)v6 != 17)
  {
    uint64_t v6 = (int)v6;
LABEL_36:
    _os_assumes_log(v6);
LABEL_37:
    *(void *)a3 = -1LL;
    return;
  }

  if (chown(__b, 0x110u, 0x110u) == -1) {
    goto LABEL_33;
  }
  while (1)
  {
    uint64_t v7 = open(__b, 17826052);
    if ((_DWORD)v7 == -1)
    {
      uint64_t v21 = __error();
      _os_assumes_log(*v21);
      __error();
      goto LABEL_37;
    }

    int v8 = v7;
    if (qword_10000C1B8 != -1) {
      dispatch_once(&qword_10000C1B8, &stru_100008A08);
    }
    if (byte_10000C1C0)
    {
      uint64_t v25 = 0LL;
      __int128 v24 = xmmword_100007118;
      int v23 = 4;
      uint64_t v7 = fsetattrlist(v8, &v24, &v23, 4uLL, 0);
      if ((_DWORD)v7 == -1)
      {
LABEL_26:
        int v17 = __error();
        _os_assumes_log(*v17);
        __error();
        goto LABEL_30;
      }
    }

    if (a2 - 1 < 2)
    {
      uint64_t v9 = 1LL;
      uint64_t v10 = (_BYTE *)(a3 + 8);
      do
      {
        *uint64_t v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
        int v11 = v10 + 2;
        v10[1] = a0123456789abcd[a1[v9++] & 0xF];
        v10 += 2;
      }

      while (v9 != 16);
      goto LABEL_16;
    }

    if (a2 != 3) {
      break;
    }
    uint64_t v12 = 0LL;
    vm_size_t v13 = (_BYTE *)(a3 + 8);
    do
    {
      _BYTE *v13 = a0123456789abcd[(unint64_t)a1[v12] >> 4];
      int v11 = v13 + 2;
      v13[1] = a0123456789abcd[a1[v12++] & 0xF];
      v13 += 2;
    }

    while (v12 != 16);
LABEL_16:
    _BYTE *v11 = 0;
    snprintf(__str, 0x400uLL, "%s/%s", __b, (const char *)(a3 + 8));
    __strlcat_chk(__str, ".XXXXXXXX", 1024LL, 1024LL);
    if (qword_10000C1B8 != -1) {
      dispatch_once(&qword_10000C1B8, &stru_100008A08);
    }
    if (byte_10000C1C0) {
      id v14 = (unsigned __int8 *)mkstemp_dprotected_np(__str, 4, 0);
    }
    else {
      id v14 = (unsigned __int8 *)mkostemp(__str, 0x1000000);
    }
    a1 = v14;
    if ((_DWORD)v14 == -1) {
      goto LABEL_26;
    }
    if (a2 != 2
      || (boot_uuid = (const void *)_os_trace_get_boot_uuid(),
          fsetxattr((int)a1, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0) != -1))
    {
      if (fchmod((int)a1, 0x1A4u) != -1)
      {
        *(_DWORD *)a3 = v8;
        *(_DWORD *)(a3 + 4) = (_DWORD)a1;
        int v16 = strrchr(__str, 47);
        strcpy((char *)(a3 + 41), v16 + 1);
        return;
      }
    }

    int v18 = __error();
    _os_assumes_log(*v18);
    __error();
    if (unlink(__str) == -1)
    {
      int v22 = __error();
      _os_assumes_log(*v22);
    }

    if (close((int)a1) == -1)
    {
      a2 = *__error();
      uint64_t v7 = *__error();
      if (a2 == 9) {
        goto LABEL_41;
      }
      _os_assumes_log(v7);
    }

LABEL_30:
    if (close(v8) != -1) {
      goto LABEL_37;
    }
    int v19 = *__error();
    uint64_t v6 = *__error();
    if (v19 != 9) {
      goto LABEL_36;
    }
    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10000C148 = v6;
    __break(1u);
LABEL_33:
    v20 = __error();
    _os_assumes_log(*v20);
  }

  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
  qword_10000C148 = a2;
  __break(1u);
LABEL_41:
  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10000C148 = v7;
  __break(1u);
}

uint64_t sub_100003DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!(_DWORD)a2)
  {
    if (fchown(*(_DWORD *)(a1 + 4), 0x110u, 0x110u) == -1)
    {
      int v8 = __error();
      _os_assumes_log(*v8);
    }

    if (fsync(*(_DWORD *)(a1 + 4)) == -1)
    {
      uint64_t v9 = __error();
      _os_assumes_log(*v9);
    }

    uint64_t v2 = renameat(*(_DWORD *)a1, (const char *)(a1 + 41), *(_DWORD *)a1, (const char *)(a1 + 8));
    if ((_DWORD)v2 == -1)
    {
      uint64_t v10 = __error();
      _os_assumes_log(*v10);
      uint64_t v2 = *__error();
    }
  }

  if ((*(_DWORD *)(a1 + 4) & 0x80000000) == 0)
  {
    if ((_DWORD)v2 && unlinkat(*(_DWORD *)a1, (const char *)(a1 + 41), 0) == -1)
    {
      uint64_t v7 = __error();
      _os_assumes_log(*v7);
    }

    if (close(*(_DWORD *)(a1 + 4)) == -1)
    {
      int v5 = *__error();
      uint64_t result = *__error();
      if (v5 == 9)
      {
        qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10000C148 = result;
        __break(1u);
        goto LABEL_21;
      }

      _os_assumes_log(result);
    }
  }

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || close(*(_DWORD *)a1) != -1) {
    return v2;
  }
  int v6 = *__error();
  uint64_t result = *__error();
  if (v6 != 9)
  {
    _os_assumes_log(result);
    return v2;
  }

LABEL_21:
  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10000C148 = result;
  __break(1u);
  return result;
}

uint64_t sub_100003F74(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  size_t v32 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (unsigned int *)_os_trace_mmap_at(4294967294LL, a1, 0LL, &v32);
  if (!v8) {
    return *__error();
  }
  uint64_t v9 = v8;
  size_t v10 = v32;
  if (v32 >> 31)
  {
    munmap(v8, v32);
    return 34LL;
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 0x40000000LL;
  uint64_t v26 = sub_100004220;
  uint64_t v27 = &unk_1000086C8;
  char v31 = a4;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v30 = a1;
  if (v32 >= 4)
  {
    int v13 = *v8;
    int v12 = 88;
    if ((int)*v8 <= -805638659)
    {
      switch(v13)
      {
        case -1095041334:
          if (v32 < 8) {
            goto LABEL_19;
          }
          unsigned int v15 = bswap32(v8[1]);
          int v16 = 1;
          break;
        case -889275714:
          if (v32 < 8) {
            goto LABEL_19;
          }
          int v16 = 0;
          unsigned int v15 = v8[1];
          break;
        case -822415874:
LABEL_17:
          if (v32 < 0x1C) {
            goto LABEL_19;
          }
LABEL_18:
          int v12 = sub_100004220((uint64_t)v25, v8, v32);
          goto LABEL_19;
        default:
          goto LABEL_19;
      }

      if (20LL * v15 != 20 * v15 || v32 - 8 < 20 * v15) {
        goto LABEL_19;
      }
      unint64_t v18 = v15;
      if (!v15)
      {
        int v12 = 0;
        goto LABEL_19;
      }

      int v19 = v8 + 5;
      unint64_t v20 = 1LL;
      while (1)
      {
        unsigned int v21 = *(v19 - 1);
        if (v16)
        {
          unsigned int v21 = bswap32(v21);
          unsigned int v22 = bswap32(*v19);
        }

        else
        {
          unsigned int v22 = *v19;
        }

        if (v10 < v21 || v10 - v21 < v22) {
          goto LABEL_6;
        }
        int v12 = v26((uint64_t)v25, (unsigned int *)((char *)v9 + v21), v22);
        v19 += 5;
        if (v12) {
          BOOL v23 = 1;
        }
        else {
          BOOL v23 = v20 >= v18;
        }
        ++v20;
        if (v23) {
          goto LABEL_19;
        }
      }
    }

    if (v13 != -17958193)
    {
      if (v13 == -17958194) {
        goto LABEL_17;
      }
      if (v13 != -805638658) {
        goto LABEL_19;
      }
    }

    if (v32 < 0x20) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

LABEL_6:
  int v12 = 88;
LABEL_19:
  if (munmap(v9, v32) == -1)
  {
    __int128 v24 = __error();
    _os_assumes_log(*v24);
  }

  if (v12) {
    unsigned int v14 = v12;
  }
  else {
    unsigned int v14 = 2;
  }
  if (v12 == 89) {
    return 0LL;
  }
  else {
    return v14;
  }
}

uint64_t sub_100004220(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v72[5] = v6;
  v72[6] = v6;
  v72[3] = v6;
  v72[4] = v6;
  v72[1] = v6;
  v72[2] = v6;
  v72[0] = v6;
  unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
  v70[1] = v6;
  v70[2] = v6;
  memset(uu, 170, sizeof(uu));
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x2000000000LL;
  char v68 = 0;
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x2000000000LL;
  char v64 = 0;
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2000000000LL;
  uint64_t v60 = 0LL;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2000000000LL;
  uint64_t v56 = 0LL;
  uint64_t v76 = 0LL;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v73 = 0u;
  BYTE1(v73) = _dyld_is_memory_immutable(a2, 28LL) ^ 1;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 0x40000000LL;
  v52[2] = sub_100000F94;
  v52[3] = &unk_100008560;
  v52[4] = &v53;
  _OWORD v52[5] = &v73;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 0x40000000LL;
  __int128 v44 = sub_10000101C;
  v45 = &unk_100008588;
  uint64_t v50 = uu;
  int v51 = &v73;
  v46 = v52;
  uint64_t v47 = &v65;
  size_t v48 = &v57;
  uint64_t v49 = &v61;
  if (a3 >= 4)
  {
    if (*a2 == -17958194)
    {
      if (a3 >= 0x1C)
      {
        unint64_t v7 = a2[5];
        if (a3 - 28 >= v7)
        {
          char v9 = 0;
          int v8 = a2 + 7;
LABEL_53:
          int v31 = 0;
          unsigned int v32 = a2[4];
          BOOL v33 = v32 == 0;
          if (v32 && v7 >= 8)
          {
            unint64_t v34 = v7;
            unsigned int v35 = 1;
            while (1)
            {
              unint64_t v36 = v8[1];
              BOOL v15 = v34 >= v36;
              v34 -= v36;
              if (!v15) {
                goto LABEL_9;
              }
              int v31 = 0;
              int v37 = *v8;
              if ((int)*v8 > 26)
              {
                switch(v37)
                {
                  case 44:
                    else {
                      char v40 = 0;
                    }
                    if ((v40 & 1) == 0) {
                      goto LABEL_9;
                    }
                    goto LABEL_88;
                  case 33:
                    else {
                      char v41 = v9;
                    }
                    if ((v41 & 1) != 0) {
                      goto LABEL_9;
                    }
                    goto LABEL_88;
                  case 27:
LABEL_69:
LABEL_88:
                    int v31 = v44(v43, (uint64_t)v8);
                    break;
                }
              }

              else
              {
                switch(v37)
                {
                  case 1:
                    else {
                      char v39 = v9;
                    }
                    if ((v39 & 1) != 0) {
                      goto LABEL_9;
                    }
                    break;
                  case 12:
                    goto LABEL_69;
                  case 25:
                    char v38 = v9 ^ 1;
                    if ((v38 & 1) != 0) {
                      goto LABEL_9;
                    }
                    break;
                  default:
                    goto LABEL_89;
                }

                if (!strcmp((const char *)v8 + 8, "__TEXT")
                  || !strcmp((const char *)v8 + 8, "__CTF")
                  || !strcmp((const char *)v8 + 8, "__OS_LOG"))
                {
                  goto LABEL_88;
                }

                int v31 = 0;
              }

LABEL_89:
              if (v31) {
                BOOL v42 = 1;
              }
              else {
                BOOL v42 = v35 >= v32;
              }
              BOOL v33 = v42;
              if (v34 >= 8)
              {
                int v8 = (_DWORD *)((char *)v8 + v36);
                ++v35;
                if (!v33) {
                  continue;
                }
              }

              break;
            }
          }

          if (v33) {
            int v10 = v31;
          }
          else {
            int v10 = 88;
          }
          goto LABEL_10;
        }
      }
    }

    else if (*a2 == -17958193 && a3 >= 0x20)
    {
      unint64_t v7 = a2[5];
      if (a3 - 32 >= v7)
      {
        int v8 = a2 + 8;
        char v9 = 1;
        goto LABEL_53;
      }
    }
  }

LABEL_9:
  int v10 = 88;
LABEL_10:
  if (*((_BYTE *)v62 + 24) && !(_DWORD)v75) {
    *(void *)&__int128 v75 = v54[3];
  }
  for (uint64_t i = 0LL; i != 40; i += 8LL)
  {
    unint64_t v12 = *(unsigned int *)((char *)&v74 + i + 4);
    if ((_DWORD)v12)
    {
      unint64_t v13 = *(unsigned int *)((char *)&v73 + i + 16);
      BOOL v15 = a3 >= v13;
      unint64_t v14 = a3 - v13;
      BOOL v15 = v15 && v14 >= v12;
      if (!v15) {
        goto LABEL_26;
      }
    }
  }

  if (v10 != 89 && v10 || !*((_BYTE *)v66 + 24) || (uint64_t v16 = v58[3]) == 0)
  {
    uuid_clear(uu);
LABEL_26:
    uint64_t v16 = 0LL;
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  if (!v16) {
    return 0LL;
  }
  int v17 = *(unsigned __int8 *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 56))
  {
    uint64_t v29 = *(void **)(a1 + 32);
    if (v29)
    {
      if (*v29 != *(void *)uu || v29[1] != *(void *)&uu[8]) {
        return 0LL;
      }
    }
  }

  if ((_BYTE)v73 && !*(void *)(a1 + 40)) {
    return 1LL;
  }
  uint64_t v18 = 0LL;
  unsigned int v19 = 0;
  v70[0] = xmmword_100007080;
  unint64_t v20 = (unsigned int *)&v74;
  int v21 = 1;
  while (1)
  {
    uint64_t v22 = v20[1];
    if ((_DWORD)v22) {
      break;
    }
LABEL_39:
    v20 += 2;
    v18 += 16LL;
    if (v18 == 80) {
      goto LABEL_40;
    }
  }

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23)
  {
    if (*(void *)(v23 + v18 + 8) != v22) {
      return 72LL;
    }
    v72[v21] = *(_OWORD *)(v23 + v18);
  }

  else
  {
    __int128 v24 = &v72[v21];
    *__int128 v24 = (char *)a2 + *v20;
    v24[1] = v22;
  }

  if (v18 != 64)
  {
    uint64_t v25 = (char *)v70 + 8 * v19++;
    HIDWORD(v70[0]) = v19;
    *((void *)v25 + 2) = *(void *)v20;
    ++v21;
    goto LABEL_39;
  }

LABEL_40:
  *(void *)&v72[0] = v70;
  *((void *)&v72[0] + 1) = 8LL * v19 + 16;
  uint64_t v26 = *(const char **)(a1 + 48);
  uint64_t v27 = (const char **)&v72[v21];
  *uint64_t v27 = v26;
  v27[1] = (const char *)(strlen(v26) + 1);
  if (v17) {
    uint64_t v28 = *(unsigned __int8 **)(a1 + 32);
  }
  else {
    uint64_t v28 = uu;
  }
  LODWORD(result) = sub_1000038D4(v28, 1u, (uint64_t)v72, (v21 + 1));
  if ((_DWORD)result) {
    return result;
  }
  else {
    return 89LL;
  }
}

uint64_t sub_100004730(unsigned __int8 *a1)
{
  *(void *)&out.sysname[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out.sysname = v3;
  *(_OWORD *)&out.sysname[16] = v3;
  uuid_unparse(a1, out.sysname);
  values[0] = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out.sysname, 0x8000100u);
  if (values[0])
  {
    CFArrayRef v4 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 1LL, &kCFTypeArrayCallBacks);
    if (v4)
    {
      CFArrayRef v5 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10000C0F0, 3LL, &kCFTypeArrayCallBacks);
      if (v5 && (__int128 v6 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID(v4, v5)) != 0LL)
      {
        unint64_t v7 = v6;
        Value = CFDictionaryGetValue(v6, values[0]);
        char v9 = Value;
        if (Value) {
          CFRetain(Value);
        }
        CFRelease(v7);
      }

      else
      {
        char v9 = 0LL;
      }
    }

    else
    {
      char v9 = 0LL;
      CFArrayRef v5 = 0LL;
    }

    if (values[0]) {
      CFRelease(values[0]);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (v5) {
      CFRelease(v5);
    }
    memset(values, 170, sizeof(values));
    if (v9)
    {
      CFTypeID v10 = CFGetTypeID(v9);
      if (v10 == CFDictionaryGetTypeID())
      {
        uint64_t v1 = &selRef_UTF8String;
        if (qword_10000C1D8 == -1) {
          goto LABEL_19;
        }
      }

      else
      {
        uint64_t v22 = _os_assert_log(0LL);
        _os_crash(v22);
        __break(1u);
      }

      dispatch_once(&qword_10000C1D8, &stru_100008A88);
LABEL_19:
      if (byte_10000C108)
      {
        BytePtr = 0LL;
        unint64_t Length = 0LL;
      }

      else
      {
        uint64_t v18 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v9, @"OSBundleLogStrings");
        if (!v18) {
          goto LABEL_29;
        }
        unsigned int v19 = v18;
        CFTypeID v20 = CFGetTypeID(v18);
        if (v20 != CFDataGetTypeID()) {
          goto LABEL_29;
        }
        BytePtr = CFDataGetBytePtr(v19);
        unint64_t Length = CFDataGetLength(v19);
      }

      unint64_t v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, @"OSBundleExecutablePath");
      if (v13)
      {
        unint64_t v14 = v13;
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 != CFStringGetTypeID()
          || (uint64_t v16 = (const char *)values, !CFStringGetCString(v14, (char *)values, 1024LL, 0x8000100u)))
        {
LABEL_29:
          uint64_t v17 = 22LL;
          goto LABEL_41;
        }
      }

      else
      {
        memset(&out, 170, sizeof(out));
        if (uname(&out) || !strcasestr(out.version, "development")) {
          uint64_t v16 = "/kernel";
        }
        else {
          uint64_t v16 = "/kernel.development";
        }
      }

      __int128 v23 = xmmword_100007080;
      v24[0] = &v23;
      v24[1] = 16LL;
      uint64_t v25 = 0LL;
      unint64_t v26 = 0LL;
      uint64_t v27 = v16;
      size_t v28 = 0xAAAAAAAAAAAAAAAALL;
      size_t v28 = strlen(v16) + 1;
      if (!byte_10000C108)
      {
        uint64_t v17 = 22LL;
        if (!BytePtr || Length < 8) {
          goto LABEL_41;
        }
        uint64_t v25 = BytePtr + 8;
        unint64_t v26 = Length - 8;
        HIDWORD(v23) = *((_DWORD *)BytePtr + 1);
      }

      uint64_t v17 = sub_1000038D4(a1, 2u, (uint64_t)v24, 3LL);
LABEL_41:
      CFRelease(v9);
      return v17;
    }
  }

  return 2LL;
}

unint64_t sub_100004AA0(unint64_t result, CFTypeRef cf, const void *a3)
{
  if (cf)
  {
    unint64_t v3 = result;
    if (!*(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL))
    {
      CFTypeID v5 = CFGetTypeID(cf);
      uint64_t result = CFStringGetTypeID();
      if (a3)
      {
        if (v5 == result)
        {
          CFTypeID v6 = CFGetTypeID(a3);
          uint64_t result = CFDictionaryGetTypeID();
          if (v6 == result)
          {
            Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleExecutablePath");
            if (Value)
            {
              int v8 = Value;
              CFTypeID v9 = CFGetTypeID(Value);
              uint64_t result = CFStringGetTypeID();
              if (v9 != result) {
                return result;
              }
            }

            else
            {
              memset(&v40[24], 170, 0x500uLL);
              if (uname((utsname *)&v40[24]) || !strcasestr(&v40[792], "development")) {
                int v8 = @"/kernel";
              }
              else {
                int v8 = @"/kernel.development";
              }
            }

            uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleTextUUID");
            if (result)
            {
              CFTypeID v10 = (const void *)result;
              CFTypeID TypeID = CFDataGetTypeID();
              uint64_t result = CFGetTypeID(v10);
              if (TypeID == result)
              {
                uint64_t result = CFDataGetLength((CFDataRef)v10);
                if (result == 16)
                {
                  unint64_t v12 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleLogStrings");
                  unint64_t v13 = v12;
                  if (v12)
                  {
                    CFTypeID v14 = CFGetTypeID(v12);
                    if (v14 == CFDataGetTypeID())
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      uint64_t result = CFDataGetLength(v13);
                      if (result < 8) {
                        return result;
                      }
                      goto LABEL_22;
                    }

                    unint64_t v13 = 0LL;
                  }

                  BytePtr = 0LL;
LABEL_22:
                  memset(v40, 170, 32);
                  uint64_t result = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)a3,  @"OSBundleCacheLoadAddress");
                  if (result)
                  {
                    uint64_t v16 = (const void *)result;
                    CFTypeID v17 = CFNumberGetTypeID();
                    uint64_t result = CFGetTypeID(v16);
                    if (v17 == result)
                    {
                      uint64_t result = CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt64Type, &v40[24]);
                      if ((_DWORD)result)
                      {
                        uint64_t result = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)a3,  @"OSBundleLoadAddress");
                        if (result)
                        {
                          uint64_t v18 = (const void *)result;
                          CFTypeID v19 = CFNumberGetTypeID();
                          uint64_t result = CFGetTypeID(v18);
                          if (v19 == result)
                          {
                            uint64_t result = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &v40[16]);
                            if ((_DWORD)result)
                            {
                              uint64_t result = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)a3,  @"OSBundleExecLoadAddress");
                              if (result)
                              {
                                CFTypeID v20 = (const void *)result;
                                CFTypeID v21 = CFNumberGetTypeID();
                                uint64_t result = CFGetTypeID(v20);
                                if (v21 == result)
                                {
                                  uint64_t result = CFNumberGetValue((CFNumberRef)v20, kCFNumberSInt64Type, &v40[8]);
                                  if ((_DWORD)result)
                                  {
                                    uint64_t result = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)a3,  @"OSBundleExecLoadSize");
                                    if (result)
                                    {
                                      uint64_t v22 = (const void *)result;
                                      CFTypeID v23 = CFNumberGetTypeID();
                                      uint64_t result = CFGetTypeID(v22);
                                      if (v23 == result)
                                      {
                                        uint64_t result = CFNumberGetValue((CFNumberRef)v22, kCFNumberSInt64Type, v40);
                                        if ((_DWORD)result)
                                        {
                                          if (*(void *)&v40[16] && *(void *)&v40[8])
                                          {
                                            uint64_t result = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)a3,  @"OSBundleKextsInKernelText");
                                            if (result) {
                                              *(void *)char v40 = 0LL;
                                            }
                                            uint64_t v24 = *(void *)(v3 + 48);
                                            uint64_t v25 = *(unsigned int *)(v24 + 12);
                                            if (v25 >= *(_DWORD *)(v3 + 88))
                                            {
LABEL_48:
                                              *(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = 1;
                                            }

                                            else
                                            {
                                              unsigned int v26 = *(_DWORD *)(v24 + 8);
                                              if (BytePtr)
                                              {
                                                unint64_t v27 = *((unsigned int *)BytePtr + 1);
                                                if ((_DWORD)v27)
                                                {
                                                  unint64_t v28 = 0LL;
                                                  uint64_t v29 = (uint64_t)&BytePtr[8 * v27 + 8];
                                                  uint64_t v30 = (unsigned int *)(BytePtr + 12);
                                                  do
                                                  {
                                                    int v31 = *v30;
                                                    if (*v30)
                                                    {
                                                      uint64_t v32 = *(void *)(v3 + 56) + 24LL * v26;
                                                      *(_DWORD *)(v32 + 16) = v25;
                                                      *(void *)uint64_t v32 = *(void *)&v40[16]
                                                                     + *(v30 - 1)
                                                                     - *(void *)&v40[24];
                                                      *(_DWORD *)(v32 + 12) = v31;
                                                      uint64_t v33 = *(void *)(*(void *)(v3 + 40) + 8LL);
                                                      int v34 = *(_DWORD *)(v33 + 24);
                                                      *(_DWORD *)(v33 + 24) = v34 + v31;
                                                      if (__CFADD__(v34, v31)) {
                                                        goto LABEL_48;
                                                      }
                                                      *(void *)(*(void *)(v3 + 64) + 16LL * v26 + 8) = v29;
                                                      *(void *)(*(void *)(v3 + 64) + 16LL * v26) = *(void *)(*(void *)(v3 + 56) + 24LL * v26);
                                                      v29 += *v30;
                                                      ++v26;
                                                      unint64_t v27 = *((unsigned int *)BytePtr + 1);
                                                    }

                                                    ++v28;
                                                    v30 += 2;
                                                  }

                                                  while (v28 < v27);
                                                  uint64_t v24 = *(void *)(v3 + 48);
                                                }
                                              }

                                              *(_DWORD *)(v24 + 8) = v26;
                                              *(void *)(*(void *)(v3 + 72) + 40 * v25 + 24) = v13;
                                              *(void *)(*(void *)(v3 + 72) + 40 * v25 + 32) = v8;
                                              uint64_t v35 = *(void *)(v3 + 72) + 40 * v25;
                                              *(void *)(v35 + 8) = *(void *)&v40[16] - *(void *)&v40[24];
                                              uint64_t v36 = *(void *)&v40[8] - *(void *)&v40[24];
                                              *(void *)(v35 + 16) = *(void *)&v40[8] - *(void *)&v40[24];
                                              uint64_t v37 = *(void *)(v3 + 80) + 32 * v25;
                                              *(void *)uint64_t v37 = v36;
                                              *(_DWORD *)(v37 + 8) = *(_DWORD *)v40;
                                              char v38 = (unsigned __int8 *)(v37 + 12);
                                              char v39 = CFDataGetBytePtr((CFDataRef)v10);
                                              uuid_copy(v38, v39);
                                              ++*(_DWORD *)(*(void *)(v3 + 48) + 12LL);
                                              return sub_100004730((unsigned __int8 *)(*(void *)(v3 + 80)
                                                                                     + 32 * v25
                                                                                     + 12));
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100004F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

int sub_100004F34(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_100004F4C(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_100004F64(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

void sub_100004F7C(uint64_t a1, uint64_t a2)
{
  kern_return_t v7;
  vm_address_t v8;
  vm_address_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t base_address;
  size_t v14;
  size_t v15;
  int v16;
  unsigned int v17;
  unsigned int *v18;
  int *v19;
  size_t v20;
  int v21;
  _DWORD *v22;
  int v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  __int128 v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  void **v31;
  void **v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  void *v36;
  int v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  vm_size_t v41;
  uint64_t v42;
  void v43[11];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  vm_address_t address;
  void __b[128];
  uuid_string_t out;
  unsigned __int8 uu[16];
  vm_address_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  void v70[2];
  memset(uu, 170, sizeof(uu));
  dyld_shared_cache_copy_uuid(a2, uu);
  CFArrayRef v4 = *(void **)(a1 + 40);
  if (*v4 == *(void *)uu && v4[1] == *(void *)&uu[8])
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&out[16] = v5;
    *(_OWORD *)utsname out = v5;
    uuid_unparse(uu, out);
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Harvesting: %s", out);
    sub_1000033AC((uint64_t)__b);
    address = 0xAAAAAAAAAAAAAAAALL;
    v52 = 0LL;
    uint64_t v53 = &v52;
    v54 = 0x2000000000LL;
    uint64_t v55 = 0;
    vm_size_t v6 = (vm_page_size + 1760015) & -(uint64_t)vm_page_size;
    unint64_t v7 = vm_allocate(mach_task_self_, &address, v6, 1);
    if (v7)
    {
      _os_assumes_log(v7);
      uint64_t v37 = 12;
LABEL_34:
      _Block_object_dispose(&v52, 8);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v37;
      memset(__b, 170, sizeof(__b));
      snprintf( (char *)__b,  0x400uLL,  "Harvest Complete for %s: %d",  out,  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      sub_1000033AC((uint64_t)__b);
      return;
    }

    int v8 = address;
    CFTypeID v9 = address;
    *(void *)address = 0x264736368LL;
    CFTypeID v10 = (void *)(v9 + 16);
    int v11 = (void **)(v8 + 1520016);
    size_t v48 = 0LL;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2000000000LL;
    int v51 = 0;
    __int128 v44 = 0LL;
    v45 = &v44;
    v46 = 0x2000000000LL;
    uint64_t v47 = 0;
    unint64_t v12 = v8 + 1200016;
    base_address = dyld_shared_cache_get_base_address(a2);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 0x40000000LL;
    void v43[2] = sub_100005550;
    v43[3] = &unk_100008850;
    v43[6] = address;
    v43[7] = base_address;
    v43[4] = &v44;
    v43[5] = &v48;
    v43[8] = v10;
    v43[9] = v8 + 1520016;
    v43[10] = v8 + 1200016;
    dyld_shared_cache_for_each_image(a2, v43);
    CFTypeID v14 = *(unsigned int *)(address + 12);
    if (*((_DWORD *)v53 + 6) || *((_BYTE *)v45 + 24))
    {
      _os_assumes_log(1LL);
      uint64_t v35 = 88;
      goto LABEL_30;
    }

    BOOL v42 = a1;
    CFTypeID v15 = *(unsigned int *)(address + 8);
    char v40 = 24LL * v15 + 16;
    uint64_t v16 = v40 + 32 * v14;
    qsort_b(v10, v15, 0x18uLL, &stru_100008890);
    CFTypeID v17 = *((_DWORD *)v49 + 6) + v16;
    if ((_DWORD)v14)
    {
      uint64_t v18 = (unsigned int *)(v8 + 1200044);
      CFTypeID v19 = (int *)(v8 + 1520024);
      CFTypeID v20 = v14;
      do
      {
        *uint64_t v18 = v17;
        v18 += 8;
        CFTypeID v21 = *v19;
        v19 += 6;
        v17 += v21 + 1;
        --v20;
      }

      while (v20);
    }

    char v41 = v6;
    qsort_b((void *)(v8 + 1200016), v14, 0x20uLL, &stru_1000088D0);
    if ((_DWORD)v15)
    {
      uint64_t v22 = (_DWORD *)(v8 + 32);
      CFTypeID v23 = v40 + 32 * v14;
      while (1)
      {
        uint64_t v24 = (unint64_t)v11[3 * *v22 + 2];
        *(v22 - 2) += v16;
        *uint64_t v22 = sub_1000065DC(v12, v14, v24);
        uint64_t v25 = *(v22 - 1);
        unsigned int v26 = __CFADD__(v23, v25);
        v23 += v25;
        if (v26) {
          break;
        }
        v22 += 6;
        if (!--v15) {
          goto LABEL_15;
        }
      }

      uint64_t v35 = 88;
      vm_size_t v6 = v41;
      a1 = v42;
      goto LABEL_30;
    }

    CFTypeID v23 = v40 + 32 * v14;
LABEL_15:
    if (*((_DWORD *)v49 + 6) + v16 != v23)
    {
      char v39 = _os_assert_log(0LL);
      _os_crash(v39);
      __break(1u);
    }

    v70[0] = 0xAAAAAAAAAAAAAAAALL;
    v70[1] = 0xAAAAAAAAAAAAAAAALL;
    dyld_shared_cache_copy_uuid(a2, v70);
    v69 = -1431655766;
    *(void *)&unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v67 = v27;
    char v68 = v27;
    uint64_t v65 = v27;
    v66 = v27;
    char v64 = v27;
    sub_100003980((unsigned __int8 *)v70, 3u, (uint64_t)&v64);
    vm_size_t v6 = v41;
    a1 = v42;
    if (v28) {
      goto LABEL_31;
    }
    uint64_t v60 = address;
    uint64_t v61 = v40;
    v62 = v12;
    uint64_t v63 = 32 * v14;
    if (_os_trace_writev(DWORD1(v64), &v60, 2LL) != -1)
    {
      __b[1] = 0x40000000LL;
      *(_OWORD *)&__b[9] = v66;
      *(_OWORD *)&__b[11] = v67;
      *(_OWORD *)&__b[13] = v68;
      *(_OWORD *)&__b[5] = v64;
      __b[0] = _NSConcreteStackBlock;
      __b[2] = sub_10000583C;
      __b[3] = &unk_100008948;
      __b[4] = &v52;
      LODWORD(__b[15]) = v69;
      *(_OWORD *)&__b[7] = v65;
      dyld_shared_cache_for_each_image(a2, __b);
      uint64_t v29 = *((unsigned int *)v53 + 6);
      if ((_DWORD)v29)
      {
LABEL_28:
        uint64_t v35 = sub_100003DDC((uint64_t)&v64, v29);
LABEL_30:
        *((_DWORD *)v53 + 6) = v35;
LABEL_31:
        if ((_DWORD)v14)
        {
          do
          {
            uint64_t v36 = *v11;
            v11 += 3;
            free(v36);
            --v14;
          }

          while (v14);
        }

        vm_deallocate(mach_task_self_, address, v6);
        uint64_t v37 = *((_DWORD *)v53 + 6);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        goto LABEL_34;
      }

      if (!(_DWORD)v14)
      {
LABEL_26:
        if (lseek(SDWORD1(v64), 0LL, 1) != v17)
        {
          qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
          qword_10000C148 = v17;
          __break(1u);
          return;
        }

        uint64_t v29 = *((unsigned int *)v53 + 6);
        goto LABEL_28;
      }

      uint64_t v30 = 1;
      while (1)
      {
        int v31 = &v11[3 * v30 - 3];
        uint64_t v60 = (vm_address_t)*v31;
        uint64_t v61 = (*((_DWORD *)v31 + 2) + 1);
        if (v30 >= v14)
        {
          uint64_t v33 = 1LL;
        }

        else
        {
          uint64_t v32 = &v11[3 * v30];
          v62 = (uint64_t)*v32;
          uint64_t v63 = (*((_DWORD *)v32 + 2) + 1);
          uint64_t v33 = 2LL;
        }

        if (_os_trace_writev(DWORD1(v64), &v60, v33) == -1) {
          break;
        }
        int v34 = v30 + 1;
        v30 += 2;
      }
    }

    char v38 = __error();
    _os_assumes_log(*v38);
    uint64_t v29 = *__error();
    *((_DWORD *)v53 + 6) = v29;
    goto LABEL_28;
  }

void sub_100005550(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[4];
  if (!*(_BYTE *)(*(void *)(v2 + 8) + 24LL))
  {
    uint64_t v25 = 0LL;
    unsigned int v26 = &v25;
    uint64_t v27 = 0x2000000000LL;
    int v28 = -1431655766;
    uint64_t v4 = a1[6];
    int v28 = *(_DWORD *)(v4 + 8);
    uint64_t v5 = *(unsigned int *)(v4 + 12);
    if (v5 >> 4 < 0x271)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = &v21;
      uint64_t v23 = 0x2000000000LL;
      uint64_t v24 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x2000000000LL;
      uint64_t v20 = 0LL;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000LL;
      v16[2] = sub_100005AE0;
      v16[3] = &unk_100008800;
      uint64_t v7 = a1[7];
      v16[4] = v2;
      v16[5] = &v21;
      v16[6] = &v17;
      v16[7] = v7;
      dyld_image_for_each_segment_info(a2, v16);
      v14[0] = _NSConcreteStackBlock;
      v14[2] = sub_100005B64;
      v14[3] = &unk_100008828;
      uint64_t v8 = a1[5];
      v14[4] = a1[4];
      v14[5] = &v25;
      uint64_t v9 = a1[8];
      v14[7] = a1[7];
      v14[8] = v9;
      v14[1] = 0x40000000LL;
      int v15 = v5;
      v14[6] = v8;
      dyld_image_for_each_section_info(a2, v14);
      *(_DWORD *)(a1[6] + 8LL) = *((_DWORD *)v26 + 6);
      installname = (const char *)dyld_image_get_installname(a2);
      if (!installname)
      {
        memset(&v30[28], 170, 0x3E4uLL);
        strcpy(v30, "Warning: missing image path");
        sub_1000033AC((uint64_t)v30);
        installname = "<missing image path>";
      }

      memset(uu, 170, sizeof(uu));
      if ((dyld_image_copy_uuid(a2, uu) & 1) == 0)
      {
        memset(&v30[28], 170, 0x3E4uLL);
        strcpy(v30, "Warning: missing image uuid");
        sub_1000033AC((uint64_t)v30);
        uuid_clear(uu);
      }

      *(void *)(a1[9] + 24 * v5) = _os_trace_strdup(installname);
      int v11 = strlen(installname);
      uint64_t v12 = a1[9] + 24 * v5;
      *(_DWORD *)(v12 + 8) = v11;
      *(void *)(v12 + 16) = v22[3];
      uint64_t v13 = a1[10] + 32 * v5;
      *(void *)uint64_t v13 = v22[3];
      *(_DWORD *)(v13 + 8) = v18[3];
      *(_OWORD *)(v13 + 12) = *(_OWORD *)uu;
      ++*(_DWORD *)(a1[6] + 12LL);
      _Block_object_dispose(&v17, 8);
      _Block_object_dispose(&v21, 8);
    }

    else
    {
      memset(&v30[37], 170, 0x3DBuLL);
      strcpy(v30, "Exceeded LOGD_HELPER_MAX_IMAGE_COUNT");
      sub_1000033AC((uint64_t)v30);
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    }

    _Block_object_dispose(&v25, 8);
  }

uint64_t sub_10000583C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (!*(_DWORD *)(*(void *)(v2 + 8) + 24LL))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    v5[2] = sub_1000058F8;
    v5[3] = &unk_100008920;
    __int128 v3 = *(_OWORD *)(result + 88);
    __int128 v8 = *(_OWORD *)(result + 72);
    __int128 v9 = v3;
    __int128 v10 = *(_OWORD *)(result + 104);
    int v11 = *(_DWORD *)(result + 120);
    __int128 v4 = *(_OWORD *)(result + 56);
    __int128 v6 = *(_OWORD *)(result + 40);
    __int128 v7 = v4;
    v5[4] = v2;
    v5[5] = a2;
    return dyld_image_for_each_section_info(a2, v5);
  }

  return result;
}

uint64_t sub_1000058F8(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t result = sub_1000059D0(a2, a3);
  if ((_DWORD)result)
  {
    v10[1] = 0x40000000LL;
    __int128 v7 = *(_OWORD *)(a1 + 96);
    __int128 v13 = *(_OWORD *)(a1 + 80);
    __int128 v14 = v7;
    __int128 v15 = *(_OWORD *)(a1 + 112);
    __int128 v8 = *(_OWORD *)(a1 + 64);
    __int128 v11 = *(_OWORD *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[2] = sub_100005A5C;
    void v10[3] = &unk_1000088F8;
    int v16 = *(_DWORD *)(a1 + 128);
    __int128 v12 = v8;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    return dyld_image_content_for_section(v9, a2, a3, v10);
  }

  return result;
}

BOOL sub_1000059D0(const char *a1, const char *a2)
{
  if (strcmp(a1, "__TEXT") && strcmp(a1, "__CTF")) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  do
  {
    int v6 = strcmp(a2, &aCstring[v5]);
    BOOL result = v6 == 0;
    if (!v6) {
      break;
    }
    BOOL v7 = v5 == 64;
    v5 += 16LL;
  }

  while (!v7);
  return result;
}

int *sub_100005A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = (int *)_os_trace_write(*(unsigned int *)(a1 + 44), a2, a4);
  if (result == (int *)-1LL)
  {
    int v6 = __error();
    _os_assumes_log(*v6);
    BOOL result = __error();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *result;
  }

  return result;
}

int sub_100005AB0(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_100005AC8(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

uint64_t sub_100005AE0(void *a1, char *__s1, unint64_t a3, uint64_t a4)
{
  uint64_t result = strcmp(__s1, "__TEXT");
  if (!(_DWORD)result)
  {
    unint64_t v8 = a1[7];
    BOOL v9 = a3 >= v8;
    unint64_t v10 = a3 - v8;
    if (v9)
    {
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = v10;
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
    }

    else
    {
      uint64_t result = _os_assumes_log(0LL);
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t sub_100005B64(uint64_t a1, const char *a2, const char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t result = sub_1000059D0(a2, a3);
  if ((_DWORD)result)
  {
    unint64_t v9 = *(void *)(a1 + 56);
    BOOL v10 = a4 >= v9;
    unint64_t v11 = a4 - v9;
    if (v10)
    {
      unsigned int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      if (v12 >> 4 >= 0xC35)
      {
        uint64_t v17 = _os_assert_log(0LL);
        uint64_t result = _os_crash(v17);
        __break(1u);
      }

      else
      {
        uint64_t v13 = *(void *)(a1 + 64);
        *(_DWORD *)(v13 + 24LL * v12 + 16) = *(_DWORD *)(a1 + 72);
        *(void *)(v13 + 24LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) = v11;
        *(_DWORD *)(v13 + 24LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + 8) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
        *(_DWORD *)(v13 + 24LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + 12) = a5;
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v15 = *(unsigned int *)(v14 + 24);
        BOOL v10 = __CFADD__(v15, a5);
        unint64_t v16 = v15 + a5;
        *(_DWORD *)(v14 + 24) = v16;
        if (v10 || HIDWORD(v16))
        {
          uint64_t result = _os_assumes_log(1LL);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
        }

        else
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
      }
    }

    else
    {
      uint64_t result = _os_assumes_log(0LL);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t sub_100005C98(io_connect_t *a1, const char *a2, const unsigned __int8 *a3)
{
  kern_return_t v15;
  kern_return_t v16;
  io_iterator_t existing;
  uuid_string_t out;
  void __b[128];
  existing = -1431655766;
  memset(__b, 170, sizeof(__b));
  snprintf((char *)__b, 0x400uLL, "IOP connect to coproc %s\n", a2);
  sub_1000033AC((uint64_t)__b);
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"role", v7);
  unint64_t v8 = IOServiceMatching("RTBuddy");
  CFDictionaryAddValue(v8, @"IOPropertyMatch", Mutable);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v8, &existing);
  if ((_DWORD)MatchingServices)
  {
    uint64_t v10 = MatchingServices;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "IOServiceGetMatchingServices returned 0x%08X\n", v10);
    sub_1000033AC((uint64_t)__b);
  }

  else
  {
    io_service_t v11 = IOIteratorNext(existing);
    if (v11)
    {
      io_object_t v12 = v11;
      uint64_t v10 = IOServiceOpen(v11, mach_task_self_, 0, a1);
      if ((_DWORD)v10)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOServiceOpen returned 0x%08X\n", v10);
        sub_1000033AC((uint64_t)__b);
      }

      if (a3)
      {
        *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)utsname out = v13;
        *(_OWORD *)&out[16] = v13;
        uuid_unparse(a3, out);
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOP connect to subrole uuid %s \n", out);
        sub_1000033AC((uint64_t)__b);
        mach_port_t v14 = *a1;
        __b[0] = 0xAAAAAAAAAAAAAAAALL;
        __b[1] = 0xAAAAAAAAAAAAAAAALL;
        uuid_copy((unsigned __int8 *)__b, a3);
        uint64_t v15 = IOConnectCallMethod(v14, 2u, 0LL, 0, __b, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
        if (v15)
        {
          unint64_t v16 = v15;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "attach to firmware role using uuid returned 0x%08X\n", v16);
          sub_1000033AC((uint64_t)__b);
        }
      }

      IOObjectRelease(v12);
    }

    else
    {
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Coprocessor %s not found.\n", a2);
      sub_1000033AC((uint64_t)__b);
      uint64_t v10 = 4LL;
    }

    IOObjectRelease(existing);
  }

  CFRelease(Mutable);
  CFRelease(@"IOPropertyMatch");
  CFRelease(@"role");
  CFRelease(v7);
  return v10;
}

void sub_100005FB4(uint64_t a1)
{
  if (!qword_10000C158) {
    sub_1000012A8();
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  [(id)qword_10000C158 addObject:v10];
  if (dword_10000C090 != -1) {
    goto LABEL_8;
  }
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  dword_10000C090 = open((const char *)qword_10000C198, 0x100000);
  if ((dword_10000C090 & 0x80000000) == 0)
  {
LABEL_8:
    memset(v12, 170, 22);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    id v2 = (id)objc_claimAutoreleasedReturnValue([(id)qword_10000C158 allObjects]);
    snprintf(__str, 0x1EuLL, "%s.tmp", "roles.plist");
    __int128 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v2,  200LL,  0LL,  0LL));

    uint64_t v4 = openat(dword_10000C090, __str, 1794, 420LL);
    if ((_DWORD)v4 == -1)
    {
      CFStringRef v7 = __error();
      _os_assumes_log(*v7);
    }

    else
    {
      uint64_t v5 = v4;
      fchown(v4, 0x110u, 0x110u);
      int v6 = -[NSFileHandle initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:",  v5);
      -[NSFileHandle writeData:error:](v6, "writeData:error:", v3, 0LL);
      -[NSFileHandle synchronizeAndReturnError:](v6, "synchronizeAndReturnError:", 0LL);
      -[NSFileHandle closeAndReturnError:](v6, "closeAndReturnError:", 0LL);
      if (renameat(dword_10000C090, __str, dword_10000C090, "roles.plist") == -1)
      {
        unint64_t v8 = __error();
        _os_assumes_log(*v8);
      }
    }

LABEL_13:
    return;
  }

  uint64_t v9 = *__error();
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
  qword_10000C148 = v9;
  __break(1u);
}

void sub_1000061F4(id a1, const char *a2)
{
  mach_port_t connection = -1431655766;
  if (!sub_100005C98(&connection, a2, 0LL))
  {
    __int128 inputStruct = xmmword_1000070A0;
    IOConnectCallMethod(connection, 0, 0LL, 0, &inputStruct, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
    IOServiceClose(connection);
  }

void sub_100006290(id a1)
{
  qword_10000C198 = (uint64_t)"/private/var/db/diagnostics";
  qword_10000C1A0 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_10000C1A8 = (uint64_t)"/private/var/db/uuidtext";
}

void sub_1000062C4(id a1)
{
  byte_10000C1C0 = MKBDeviceFormattedForContentProtection(a1) == 1;
}

uint64_t sub_1000062E8(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  uint64_t result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_10000C1A8);
  CFStringRef v7 = &__str[(int)result];
  size_t v8 = 1024LL - (int)result;
  if (a2 - 17 < 2) {
    return snprintf(v7, v8, "%02X", *a1);
  }
  if (a2 != 3)
  {
    if (a2 == 19) {
      return snprintf(v7, v8, "dsc");
    }
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_10000C148 = a2;
    __break(1u);
    goto LABEL_13;
  }

  uint64_t result = snprintf(v7, v8, "dsc");
  if ((int)result + 33LL >= v8)
  {
LABEL_13:
    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_10000C148 = v8;
    __break(1u);
    return result;
  }

  uint64_t v9 = 0LL;
  v7[(int)result] = 47;
  id v10 = &v7[(int)result + 1];
  do
  {
    *id v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
    v10[1] = a0123456789abcd[a1[v9] & 0xF];
    v10 += 2;
    ++v9;
  }

  while (v9 != 16);
  *id v10 = 0;
  return result;
}

void sub_100006490(id a1)
{
  uint64_t v1 = getpid();
  int v2 = SANDBOX_CHECK_NO_REPORT;
  if (qword_10000C1B0 != -1) {
    dispatch_once(&qword_10000C1B0, &stru_1000089C8);
  }
  byte_10000C1D0 = sandbox_check(v1, "file-read-data", v2 | 1u) == 0;
}

BOOL sub_10000651C(unsigned __int8 *a1)
{
  if (qword_10000C1C8 != -1) {
    dispatch_once(&qword_10000C1C8, &stru_100008A48);
  }
  if (!byte_10000C1D0) {
    return 0LL;
  }
  memset(__b, 170, sizeof(__b));
  sub_1000062E8(a1, 3u, __b);
  return access(__b, 0) == 0;
}

uint64_t sub_1000065DC(uint64_t a1, unsigned int a2, unint64_t a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v3 = 0;
  do
  {
    uint64_t v4 = (a2 + v3) >> 1;
    unint64_t v5 = *(void *)(a1 + 32 * v4);
    BOOL v6 = a3 >= v5;
    unint64_t v7 = a3 - v5;
    if (v6)
    {
      unsigned int v3 = v4 + 1;
    }

    else
    {
      a2 = (a2 + v3) >> 1;
    }
  }

  while (v3 < a2);
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4) {
    return 0xFFFFFFFFLL;
  }
  return v4;
}

void sub_100006634(id a1)
{
  size_t v1 = 1024LL;
  byte_10000C108 = sysctlbyname("kern.filesetuuid", __b, &v1, 0LL, 0LL) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0LL, 0LL))
  {
    if (strstr(__b, "libtrace_kic=0")) {
      byte_10000C108 = 0;
    }
    if (strstr(__b, "libtrace_kic=1")) {
      byte_10000C108 = 1;
    }
  }