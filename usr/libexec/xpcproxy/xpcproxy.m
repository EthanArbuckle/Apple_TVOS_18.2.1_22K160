uint64_t sub_100001EC4()
{
  if (qword_10000C070 != -1) {
    dispatch_once(&qword_10000C070, &stru_100008620);
  }
  return byte_10000C068;
}

void sub_100001F04(id a1)
{
  pid_t v1 = getpid();
  byte_10000C068 = sub_100001F24(v1);
}

uint64_t sub_100001F24(int a1)
{
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  memset(v2, 0, sizeof(v2));
  _os_assumes_log(0LL);
  return 0LL;
}

uint64_t sub_100001FA8()
{
  return qword_10000C030;
}

void *sub_100001FB4(size_t __size)
{
  do
  {
    v2 = calloc(1uLL, __size);
    if (v2) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_100006030(v3);
      }
    }
  }

  while (sub_100003588());
  return v2;
}

uint64_t sub_100002010(uint64_t a1)
{
  uint64_t v2 = getpid();
  return kdebug_trace(a1, v2, 0LL, 0LL, 0LL);
}

uint64_t sub_100002044(void *a1)
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  xpc_object_t empty = 0LL;
  xpc_object_t empty = xpc_array_create_empty();
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000LL;
  applier[2] = sub_1000021B8;
  applier[3] = &unk_100008648;
  applier[4] = &v12;
  xpc_dictionary_apply(a1, applier);
  size_t count = xpc_array_get_count((xpc_object_t)v13[3]);
  do
  {
    if (count < 2) {
      break;
    }
    size_t v3 = 0LL;
    for (size_t i = 1LL; i != count; ++i)
    {
      xpc_object_t value = xpc_array_get_value((xpc_object_t)v13[3], i - 1);
      xpc_object_t v6 = xpc_array_get_value((xpc_object_t)v13[3], i);
      string_ptr = xpc_string_get_string_ptr(value);
      v8 = xpc_string_get_string_ptr(v6);
      if (strcmp(string_ptr, v8) >= 1)
      {
        xpc_retain(value);
        xpc_array_set_value((xpc_object_t)v13[3], i - 1, v6);
        xpc_array_set_value((xpc_object_t)v13[3], i, value);
        xpc_release(value);
        size_t v3 = i;
      }
    }

    size_t count = v3;
  }

  while (v3);
  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_1000021B8(uint64_t a1, char *string)
{
  return 1LL;
}

xpc_object_t sub_1000021E4(int64_t a1, int64_t a2, xpc_object_t object)
{
  if (object && xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return 0LL;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "vers", a1);
  xpc_dictionary_set_int64(empty, "comp", 1LL);
  xpc_dictionary_set_int64(empty, "ccat", a2);
  if (object) {
    xpc_dictionary_set_value(empty, "reqs", object);
  }
  return empty;
}

size_t sub_100002290(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary) {
    return 0LL;
  }
  xpc_object_t empty = xpc_array_create_empty();
  if (sub_1000026AC(a1, empty))
  {
    xpc_release(empty);
    return 0LL;
  }

  if (!empty) {
    return 0LL;
  }
  size_t result = xpc_array_get_count(empty);
  if (!(result >> 59))
  {
    v5 = (void **)sub_100001FB4(32 * result);
    length[0] = (size_t)_NSConcreteStackBlock;
    length[1] = 0x40000000LL;
    length[2] = (size_t)sub_100002D08;
    length[3] = (size_t)&unk_1000086B8;
    length[4] = (size_t)v5;
    xpc_array_apply(empty, length);
    size_t count = xpc_array_get_count(empty);
    length[0] = 0LL;
    xpc_object_t v3 = 0LL;
    if (CESizeSerialization(v5, count, length) == kCENoError)
    {
      v7 = (char *)sub_100001FB4(length[0]);
      char v12 = 1;
      if (CESerializeWithOptions(&unk_1000086D8, &v12, v5, count, v7, &v7[length[0]]) == kCENoError) {
        xpc_object_t v3 = xpc_data_create(v7, length[0]);
      }
      else {
        xpc_object_t v3 = 0LL;
      }
      free(v7);
    }

    size_t v8 = xpc_array_get_count(empty);
    if (v8)
    {
      size_t v9 = v8;
      v10 = v5 + 1;
      do
      {
        v10 += 4;
        --v9;
      }

      while (v9);
    }

    free(v5);
    xpc_release(empty);
    return (size_t)v3;
  }

  __break(1u);
  return result;
}

uint64_t sub_100002448(uint64_t a1, uint64_t a2)
{
  __int128 v13 = 0uLL;
  uint64_t v14 = 0LL;
  char v12 = 1;
  uint64_t v2 = CEValidateWithOptions(&unk_1000086D8, &v12, &v13, a1, a1 + a2);
  uint64_t result = 0LL;
  if (v2 == kCENoError)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v4 = v13;
    *(void *)&__int128 v5 = v14;
    if (CEAcquireUnmanagedContext(&unk_1000086D8) == kCENoError)
    {
      __int128 v4 = v8;
      __int128 v5 = v9;
      __int128 v6 = v10;
      uint64_t v7 = v11;
      return sub_100002FC0(&v4);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

size_t sub_100002518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *((void *)&v15 + 1) = 0LL;
  xpc_object_t v6 = sub_100002638(a1, a2, (int64_t *)&v15 + 1);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  *(void *)&__int128 v15 = 0LL;
  xpc_object_t v8 = sub_100002638(a3, a4, (int64_t *)&v15);
  if (v8)
  {
    __int128 v9 = v8;
    if (v15 == 0)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(empty, "$and", v9);
      xpc_object_t v12 = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v12, "$and", v7);
      xpc_dictionary_set_value(v12, "$or", empty);
      xpc_release(empty);
      xpc_object_t v13 = sub_1000021E4(1LL, 0LL, v12);
      xpc_release(v12);
      size_t v10 = sub_100002290(v13);
      xpc_release(v13);
    }

    else
    {
      size_t v10 = 0LL;
    }

    xpc_release(v7);
  }

  else
  {
    size_t v10 = 0LL;
    __int128 v9 = v7;
  }

  xpc_release(v9);
  return v10;
}

xpc_object_t sub_100002638(uint64_t a1, uint64_t a2, int64_t *a3)
{
  __int128 v4 = (void *)sub_100002448(a1, a2);
  if (!v4) {
    return 0LL;
  }
  __int128 v5 = v4;
  xpc_object_t value = xpc_dictionary_get_value(v4, "reqs");
  xpc_object_t v7 = value;
  if (value) {
    xpc_retain(value);
  }
  *a3 = xpc_dictionary_get_int64(v5, "ccat");
  xpc_release(v5);
  return v7;
}

uint64_t sub_1000026AC(void *a1, void *a2)
{
  uint64_t v8 = 0LL;
  __int128 v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = 4;
  __int128 v4 = (void *)sub_100002044(a1);
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t bytes = 7LL;
  uint64_t v13 = 0LL;
  xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000LL;
  applier[2] = sub_1000027AC;
  applier[3] = &unk_100008670;
  void applier[5] = a2;
  applier[6] = a1;
  applier[4] = &v8;
  xpc_array_apply(v4, applier);
  xpc_release(v4);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  if (!(_DWORD)v5)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t bytes = 8LL;
    uint64_t v13 = 0LL;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    uint64_t v5 = *((unsigned int *)v9 + 6);
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_1000027AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t bytes = 5LL;
  uint64_t v21 = 0LL;
  xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  string_ptr = xpc_string_get_string_ptr(a3);
  v17[3] = 0LL;
  v17[0] = 3LL;
  v17[1] = sub_1000035D4(string_ptr);
  v17[2] = xpc_string_get_length(a3);
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v17, 0x20uLL);
  xpc_object_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = xpc_string_get_string_ptr(a3);
  xpc_object_t value = xpc_dictionary_get_value(v7, v8);
  if (value)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_1000029E0(value, *(void **)(a1 + 40));
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      uint64_t bytes = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
      {
        uint64_t bytes = 0LL;
        uint64_t v21 = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid(&v18) & 1) != 0)
      {
        uint64_t v16 = 0LL;
        uint64_t shared_cache_range = _dyld_get_shared_cache_range(&v16);
      }

      else
      {
        uint64_t shared_cache_range = 0LL;
        uint64_t v18 = 0LL;
        uint64_t v19 = 0LL;
      }

      uint64_t v14 = xpc_string_get_string_ptr(a3);
      _os_log_simple( &_mh_execute_header,  &bytes,  &v18,  shared_cache_range,  16LL,  0LL,  "failed to serialized value for key: %s",  v14);
      return 0LL;
    }

    else
    {
      xpc_object_t v12 = *(void **)(a1 + 40);
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      uint64_t bytes = 6LL;
      uint64_t v21 = 0LL;
      xpc_array_set_data(v12, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      return 1LL;
    }
  }

  else
  {
    uint64_t bytes = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
    {
      uint64_t bytes = 0LL;
      uint64_t v21 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid(&v18) & 1) != 0)
    {
      uint64_t v16 = 0LL;
      uint64_t v11 = _dyld_get_shared_cache_range(&v16);
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
    }

    uint64_t v15 = xpc_string_get_string_ptr(a3);
    _os_log_simple(&_mh_execute_header, &bytes, &v18, v11, 16LL, 0LL, "no value for key: %s", v15);
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 2;
  }

  return result;
}

uint64_t sub_1000029E0(void *a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a1);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v18 = 0LL;
    uint64_t bytes = 2LL;
    int64_t string_ptr = (int64_t)xpc_string_get_string_ptr(a1);
    size_t length = xpc_string_get_length(a1);
LABEL_12:
    v17 = (BOOL (*)(uint64_t, uint64_t, uint64_t))length;
LABEL_16:
    LOBYTE(v18) = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    return 0LL;
  }

  uint64_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    uint64_t bytes = 4LL;
    uint64_t v18 = 0LL;
    int64_t string_ptr = xpc_int64_get_value(a1);
LABEL_15:
    v17 = 0LL;
    goto LABEL_16;
  }

  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    uint64_t bytes = 1LL;
    uint64_t v18 = 0LL;
    int64_t string_ptr = xpc_BOOL_get_value(a1);
    goto LABEL_15;
  }

  if (type == (xpc_type_t)&_xpc_type_data)
  {
    uint64_t v18 = 0LL;
    uint64_t bytes = 9LL;
    int64_t string_ptr = (int64_t)xpc_data_get_bytes_ptr(a1);
    size_t length = xpc_data_get_length(a1);
    goto LABEL_12;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      uint64_t v11 = 0LL;
      xpc_object_t v12 = &v11;
      uint64_t v13 = 0x2000000000LL;
      int v14 = 4;
      v17 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t bytes = 5LL;
      int64_t string_ptr = 0LL;
      xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      uint64_t bytes = (uint64_t)_NSConcreteStackBlock;
      int64_t string_ptr = 0x40000000LL;
      v17 = sub_100002CC0;
      uint64_t v18 = &unk_100008698;
      uint64_t v19 = &v11;
      v20 = a2;
      xpc_array_apply(a1, &bytes);
      uint64_t v8 = *((unsigned int *)v12 + 6);
      if (!(_DWORD)v8)
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = 0LL;
        uint64_t v21 = 6LL;
        uint64_t v22 = 0LL;
        xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &v21, 0x20uLL);
        uint64_t v8 = *((unsigned int *)v12 + 6);
      }

      _Block_object_dispose(&v11, 8);
    }

    else
    {
      uint64_t bytes = 0LL;
      int64_t string_ptr = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
      {
        uint64_t bytes = 0LL;
        int64_t string_ptr = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid(&v21) & 1) != 0)
      {
        uint64_t v11 = 0LL;
        uint64_t shared_cache_range = _dyld_get_shared_cache_range(&v11);
      }

      else
      {
        uint64_t shared_cache_range = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
      }

      name = xpc_type_get_name(v5);
      _os_log_simple(&_mh_execute_header, &bytes, &v21, shared_cache_range, 16LL, 0LL, "unsupported type: %s", name);
      return 1LL;
    }

    return v8;
  }

  return sub_1000026AC(a1, a2);
}

BOOL sub_100002CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_1000029E0(a3, *(void *)(a1 + 40));
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

uint64_t sub_100002D08(uint64_t a1, uint64_t a2, xpc_object_t xdata)
{
  xpc_object_t v3 = (_OWORD *)(*(void *)(a1 + 32) + 32 * a2);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  __int128 v5 = bytes_ptr[1];
  *xpc_object_t v3 = *bytes_ptr;
  v3[1] = v5;
  return 1LL;
}

uint64_t sub_100002D3C()
{
  if (*((void *)&_os_alloc_once_table + 2) == -1LL) {
    uint64_t v0 = *((void *)&_os_alloc_once_table + 3);
  }
  else {
    uint64_t v0 = _os_alloc_once((char *)&_os_alloc_once_table + 16, 216LL, 0LL);
  }
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(void *)(v0 + 48) != -1LL) {
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)sub_100002DC0);
    }
  }

  else
  {
    sub_100002DC0((task_info_t)(v0 + 56));
  }

  return v0 + 56;
}

uint64_t sub_100002DC0(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt)) {
    sub_100006048();
  }
  integer_t v2 = task_info_out[5];
  uint64_t result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7]) {
    sub_100006048();
  }
  return result;
}

const char *_xpc_spawnattr_unpack_string(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (a2 <= a3) {
    return 0LL;
  }
  xpc_object_t v3 = (const char *)(a1 + a3 + 240);
  if (strnlen(v3, a2 - a3) + 1 <= a2 - a3) {
    return v3;
  }
  else {
    return 0LL;
  }
}

uint64_t _xpc_spawnattr_unpack_bytes(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a2 - a3 >= a4) {
    uint64_t v4 = a1 + a3 + 240;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= a3) {
    return 0LL;
  }
  else {
    return v4;
  }
}

const char *_xpc_spawnattr_unpack_strings( uint64_t a1, unint64_t a2, unsigned int a3, const char **a4, uint64_t a5)
{
  if (a3 >= a2) {
    return 0LL;
  }
  uint64_t v5 = a5;
  if (!a5) {
    return *a4;
  }
  unsigned int v7 = a3;
  uint64_t v9 = a1 + 240;
  for (size_t i = a4; ; ++i)
  {
    uint64_t v11 = (const char *)(v9 + v7);
    size_t v12 = strnlen(v11, a2 - v7);
    if (v12 + 1 > a2 - v7) {
      break;
    }
    v7 += v12 + 1;
    *size_t i = v11;
    if (!--v5) {
      return *a4;
    }
  }

  return 0LL;
}

uint64_t _xpc_spawnattr_binprefs_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  xpc_binprefs_alloc();
  uint64_t v4 = v5;
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v6 = 0LL;
    unsigned int v7 = (int *)(*(unsigned int *)(a1 + 36) + a1 + 244);
    do
    {
      xpc_binprefs_add(v4, *(v7 - 1), *v7);
      ++v6;
      v7 += 2;
    }

    while (v6 < *(unsigned int *)(a1 + 32));
  }

  return v4;
}

uint64_t sub_100002FC0(__int128 *a1)
{
  __int128 v2 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v2;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  __int128 v3 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v3;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  return sub_100003030((uint64_t *)&v5);
}

uint64_t sub_100003030(uint64_t *a1)
{
  uint64_t v2 = *a1;
  __int128 v3 = *((_OWORD *)a1 + 1);
  __int128 v22 = *(_OWORD *)a1;
  __int128 v23 = v3;
  __int128 v24 = *((_OWORD *)a1 + 2);
  uint64_t v25 = a1[6];
  switch(der_vm_CEType_from_context(&v22, 0LL))
  {
    case 1u:
      __int128 v18 = *(_OWORD *)a1;
      __int128 v19 = *((_OWORD *)a1 + 1);
      __int128 v20 = *((_OWORD *)a1 + 2);
      uint64_t v21 = a1[6];
      xpc_object_t empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      __int128 v18 = *(_OWORD *)a1;
      __int128 v19 = *((_OWORD *)a1 + 1);
      __int128 v20 = *((_OWORD *)a1 + 2);
      uint64_t v21 = a1[6];
      xpc_object_t empty = xpc_array_create_empty();
LABEL_4:
      uint64_t v5 = (uint64_t)empty;
      __int128 v22 = v18;
      __int128 v23 = v19;
      __int128 v24 = v20;
      uint64_t v25 = v21;
      der_vm_iterate(&v22, empty, sub_1000031DC);
      goto LABEL_10;
    case 3u:
      __int128 v6 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v6;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      int64_t v7 = der_vm_integer_from_context(&v22);
      xpc_object_t no_copy = xpc_int64_create(v7);
      goto LABEL_9;
    case 4u:
      __int128 v9 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v9;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      uint64_t v10 = sub_10000349C((uint64_t)&v22);
      xpc_object_t no_copy = (xpc_object_t)xpc_string_create_no_copy(v10);
      goto LABEL_9;
    case 5u:
      __int128 v11 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v11;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      char v12 = der_vm_BOOL_from_context(&v22);
      xpc_object_t no_copy = xpc_BOOL_create(v12);
      goto LABEL_9;
    case 6u:
      __int128 v13 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v13;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      int v14 = (const void *)der_vm_data_from_context(&v22);
      xpc_object_t no_copy = xpc_data_create(v14, v15);
LABEL_9:
      uint64_t v5 = (uint64_t)no_copy;
LABEL_10:
      uint64_t result = v5;
      break;
    default:
      v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_objectForActiveContext",  "CoreEntitlements: unknown DER type");
      uint64_t result = sub_1000031DC(v17);
      break;
  }

  return result;
}

uint64_t sub_1000031DC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      int64_t v7 = (void *)a1[15];
      __int128 v14 = *(_OWORD *)(a1 + 7);
      __int128 v15 = *(_OWORD *)(a1 + 9);
      __int128 v16 = *(_OWORD *)(a1 + 11);
      uint64_t v17 = a1[13];
      uint64_t v25 = 0LL;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v22 = 0u;
      memset((char *)v26 + 8, 0, 248);
      __int128 v8 = *(_OWORD *)(a1 + 9);
      v20[0] = *(_OWORD *)(a1 + 7);
      v20[1] = v8;
      v20[2] = *(_OWORD *)(a1 + 11);
      uint64_t v21 = a1[13];
      *(void *)&v26[0] = 2LL;
      der_vm_execute(&v22, v20, v26);
      v26[0] = v22;
      v26[1] = v23;
      v26[2] = v24;
      *(void *)&v26[3] = v25;
      __int128 v9 = (char *)sub_10000349C((uint64_t)v26);
      v18[0] = v14;
      v18[1] = v15;
      v18[2] = v16;
      uint64_t v19 = v17;
      v26[0] = xmmword_1000069C0;
      memset(&v26[1], 0, 240);
      der_vm_execute(v20, v18, v26);
      xpc_object_t empty = (xpc_object_t)sub_100003030(v20);
      xpc_dictionary_set_value(v7, v9, empty);
      free(v9);
    }

    else
    {
      xpc_object_t empty = xpc_array_create_empty();
      __int128 v11 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v11;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v26[3] = a1[13];
      if (der_vm_iterate(v26, empty, sub_1000031DC) != kCENoError)
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)sub_10000349C(v13);
      }

      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, empty);
    }

    __int128 v6 = empty;
    goto LABEL_10;
  }

  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      __int128 v4 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v4;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v26[3] = a1[13];
      uint64_t v5 = (void *)sub_100003030(v26);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      __int128 v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1LL;
    }

    uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: not a sequence");
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: unknown DER type");
  }

  return (uint64_t)sub_10000349C(v13);
}

void *sub_10000349C(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v1;
  v7[2] = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v2 = (const void *)der_vm_string_from_context(v7);
  size_t v4 = v3;
  uint64_t v5 = sub_100001FB4(v3 + 1);
  memcpy(v5, v2, v4);
  return v5;
}

void *sub_100003508(int a1, size_t __size)
{
  return malloc(__size);
}

void sub_100003510(int a1, void *a2)
{
}

void sub_100003518( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100003544( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  qword_10000C030 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

uint64_t sub_100003588()
{
  return 1LL;
}

void *sub_1000035A4(const void *a1, size_t __size)
{
  size_t v4 = sub_100001FB4(__size);
  return memcpy(v4, a1, __size);
}

char *sub_1000035D4(const char *a1)
{
  for (size_t i = a1; ; a1 = i)
  {
    uint64_t result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_100006068(v3);
      }
    }

    sub_100003588();
  }

  return result;
}

char *sub_100003624(const char *a1, size_t a2)
{
  size_t v2 = a2;
  int v3 = a1;
  while (1)
  {
    uint64_t result = strndup(a1, a2);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      int v5 = *__error();
      if (v5) {
        sub_100006068(v5);
      }
    }

    sub_100003588();
    a1 = v3;
    a2 = v2;
  }

  return result;
}

char *sub_10000367C(char *a1, ...)
{
  size_t v4 = 0LL;
  while (1)
  {
    vasprintf(&v4, a1, va);
    uint64_t result = v4;
    if (v4) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_100006068(v3);
      }
    }

    sub_100003588();
  }

  return result;
}

uint64_t sub_1000036EC(int a1)
{
  return _os_assert_log(a1);
}

int64_t sub_1000036F4(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  if (_os_alloc_once_table[2] == -1LL) {
    uint64_t v10 = _os_alloc_once_table[3];
  }
  else {
    uint64_t v10 = _os_alloc_once(&_os_alloc_once_table[2], 216LL, 0LL);
  }
  if (*(_BYTE *)v10 || *(_BYTE *)(v10 + 4)) {
    return 141LL;
  }
  xpc_object_t xdicta = 0LL;
  if (!*(_BYTE *)(v10 + 41)) {
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  }
  uint64_t v13 = 2LL;
  if (!*(_BYTE *)(v10 + 88)) {
    uint64_t v13 = 6LL;
  }
  int64_t int64 = _xpc_pipe_interface_routine(*(void *)(v10 + 24), a1, xdict, &xdicta, v13 | a5);
  if (xdicta)
  {
    string = xpc_dictionary_get_string(xdicta, "xpc-fault");
    if (string) {
      sub_100003910(string);
    }
  }

  xpc_object_t v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), xpc_object_t v15 = xdicta, (_DWORD)int64))
  {
    if (v15) {
      xpc_release(v15);
    }
  }

  else
  {
    if (_os_alloc_once_table[2] == -1LL) {
      uint64_t v16 = _os_alloc_once_table[3];
    }
    else {
      uint64_t v16 = _os_alloc_once(&_os_alloc_once_table[2], 216LL, 0LL);
    }
    if (!*(_BYTE *)(v16 + 88))
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      xpc_dictionary_get_audit_token(v15, &v24);
      if (DWORD1(v25) != 1) {
        sub_1000060E4(SDWORD1(v25));
      }
      if (DWORD1(v24)) {
        sub_1000060CC();
      }
      if (a4)
      {
        uint64_t int64 = xpc_dictionary_get_uint64(v15, "req_pid");
        uint64_t v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        uint64_t v20 = sub_100002D3C();
        int v21 = *(_DWORD *)(v20 + 20);
        if (!v21 || (int v22 = *(_DWORD *)(v20 + 28)) == 0) {
          sub_100006048();
        }
        if (v22 != v19) {
          sub_10000609C();
        }
      }
    }

    int64_t int64 = 0LL;
    *a3 = xdicta;
  }

  return int64;
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return sub_1000036F4(a1, a2, a3, 0, 0LL);
}

uint64_t sub_100003910(const char *a1)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  if ((_dyld_get_image_uuid(&_mh_execute_header, &v18) & 1) == 0)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
  }

  if ((_dyld_get_shared_cache_uuid(&v20) & 1) != 0)
  {
    uint64_t v16 = 0LL;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range(&v16);
  }

  else
  {
    uint64_t shared_cache_range = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
  }

  _os_log_simple(&_mh_execute_header, &v18, &v20, shared_cache_range, 16LL, 0LL, "%s (backtrace follows)", a1);
  bzero(&v18, 0x400uLL);
  int v3 = backtrace(&v18, 128);
  size_t v4 = backtrace_symbols(&v18, v3);
  if (v4)
  {
    int v5 = v4;
    if (v3 >= 1)
    {
      uint64_t v6 = v3;
      int64_t v7 = (const char **)v4;
      do
      {
        if (!*v7) {
          break;
        }
        uint64_t v20 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v16 = 0LL;
        uint64_t v17 = 0LL;
        if ((_dyld_get_image_uuid(&_mh_execute_header, &v20) & 1) == 0)
        {
          uint64_t v20 = 0LL;
          uint64_t v21 = 0LL;
        }

        if ((_dyld_get_shared_cache_uuid(&v16) & 1) != 0)
        {
          uint64_t v15 = 0LL;
          uint64_t v8 = _dyld_get_shared_cache_range(&v15);
        }

        else
        {
          uint64_t v8 = 0LL;
          uint64_t v16 = 0LL;
          uint64_t v17 = 0LL;
        }

        __int128 v9 = *v7++;
        _os_log_simple(&_mh_execute_header, &v20, &v16, v8, 16LL, 0LL, "%s", v9);
        --v6;
      }

      while (v6);
    }

    free(v5);
  }

  uint64_t result = os_fault_with_payload(7LL, 9LL, 0LL, 0LL, a1, 0LL);
  if ((_DWORD)result)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &v20) & 1) == 0)
    {
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid(&v16) & 1) != 0)
    {
      uint64_t v15 = 0LL;
      uint64_t v11 = _dyld_get_shared_cache_range(&v15);
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
    }

    int v12 = *__error();
    uint64_t v13 = __error();
    __int128 v14 = (const char *)xpc_strerror(*v13);
    return _os_log_simple( &_mh_execute_header,  &v20,  &v16,  v11,  16LL,  0LL,  "Unable to generate a fault: %d - %s",  v12,  v14);
  }

  return result;
}

double xpc_binprefs_alloc()
{
  uint64_t v0 = sub_100001FB4(0x24uLL);
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  *((_DWORD *)v0 + 8) = 0;
  return result;
}

uint64_t xpc_binprefs_add(uint64_t result, int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(result + 32);
  *(_DWORD *)(result + 4 * v3) = a2;
  *(_DWORD *)(result + 4LL * (*(_DWORD *)(result + 32))++ + 16) = a3;
  return result;
}

uint64_t xpc_binprefs_set_psattr(cpu_type_t *a1, posix_spawnattr_t *a2)
{
  uint64_t result = posix_spawnattr_setarchpref_np(a2, a1[8], a1, a1 + 4, 0LL);
  if ((_DWORD)result) {
    sub_100006030(result);
  }
  return result;
}

uint64_t sub_100003BFC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 1128) = 0x6400000064LL;
  int v4 = posix_spawnattr_init((posix_spawnattr_t *)a1);
  if (v4) {
    sub_100006068(v4);
  }
  uint64_t result = posix_spawn_file_actions_init((posix_spawn_file_actions_t *)(a1 + 8));
  if ((_DWORD)result) {
    sub_100006068(result);
  }
  *(void *)(a1 + 1136) = a2;
  return result;
}

uint64_t sub_100003C50(posix_spawnattr_t *a1, __int16 a2, __int16 a3)
{
  __int16 v8 = 0;
  int v6 = posix_spawnattr_getflags(a1, &v8);
  if (v6) {
    sub_100006068(v6);
  }
  __int16 v8 = v8 & ~a3 | a2;
  uint64_t result = posix_spawnattr_setflags(a1, v8);
  if ((_DWORD)result) {
    sub_100006068(result);
  }
  return result;
}

uint64_t sub_100003CBC( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!*(void *)(a1 + 1136))
  {
    v26 = "Missing program";
    int v27 = 22;
    unsigned int v28 = 580;
    goto LABEL_25;
  }

  int v12 = *(unsigned __int8 *)(a2 + 108);
  unsigned int v13 = *(_DWORD *)(a2 + 236);
  if (setsid() == -1) {
    sub_100006108();
  }
  if (v12) {
    __int16 v14 = 16512;
  }
  else {
    __int16 v14 = 0x4000;
  }
  unsigned int v15 = *(_DWORD *)(a2 + 236);
  if (MEMORY[0xFFFFF4084]) {
    __int16 v16 = (v15 >> 6) & 0x100;
  }
  else {
    __int16 v16 = 0;
  }
  int v17 = *(_DWORD *)(a2 + 236);
  if ((v15 & 0x8000) != 0)
  {
    int v18 = posix_spawnattr_disable_ptr_auth_a_keys_np(v8, 0LL);
    if (v18) {
      sub_100006068(v18);
    }
    int v17 = *(_DWORD *)(a2 + 236);
  }

  if ((v17 & 0x40000) != 0)
  {
    int v19 = posix_spawnattr_set_use_sec_transition_shims_np(v8, 1LL);
    if (v19) {
      sub_100006068(v19);
    }
    int v17 = *(_DWORD *)(a2 + 236);
  }

  sub_100003C50((posix_spawnattr_t *)v8, (v13 >> 8) & 0x200 | v14 | v16 | (v15 >> 22 << 15) | HIWORD(v17) & 0x800, 0);
  uint64_t v20 = (cpu_type_t *)_xpc_spawnattr_binprefs_unpack(a2, a3);
  if (v20)
  {
    uint64_t v21 = v20;
    xpc_binprefs_set_psattr(v20, (posix_spawnattr_t *)v8);
    free(v21);
  }

  qos_class_t v22 = *(_DWORD *)(a2 + 200);
  if (v22)
  {
    int v23 = posix_spawnattr_set_qos_class_np((posix_spawnattr_t *)v8, v22);
    if (v23) {
      sub_100006068(v23);
    }
  }

  int v24 = *(_DWORD *)(a2 + 236);
  if ((v24 & 0x200000) != 0)
  {
    if (*(_BYTE *)(a2 + 228) != 100LL || *(_DWORD *)(a2 + 224))
    {
      int v29 = posix_spawnattr_setcpumonitor(v8);
      if (v29) {
        sub_100006068(v29);
      }
    }
  }

  else if ((v24 & 2) != 0)
  {
    int v30 = posix_spawnattr_setcpumonitor_default(v8);
    if (v30) {
      sub_100006068(v30);
    }
  }

  else if ((v24 & 1) == 0)
  {
    int v25 = posix_spawnattr_setcpumonitor_default(v8);
    if (v25) {
      sub_100006068(v25);
    }
  }

  int v31 = posix_spawnattr_setjetsam_ext( v8,  *(__int16 *)(a2 + 120),  *(unsigned int *)(a2 + 124),  *(unsigned int *)(a2 + 128),  *(unsigned int *)(a2 + 132));
  if (v31) {
    sub_100006068(v31);
  }
  int v32 = posix_spawnattr_set_threadlimit_ext(v8, *(unsigned int *)(a2 + 136));
  if (v32) {
    sub_100006068(v32);
  }
  int v33 = posix_spawnattr_set_max_addr_np(v8, *(void *)(a2 + 140));
  if (v33) {
    sub_100006068(v33);
  }
  int v34 = posix_spawnattr_set_portlimits_ext(v8, *(unsigned int *)(a2 + 148), *(unsigned int *)(a2 + 152));
  if (v34) {
    sub_100006068(v34);
  }
  int v35 = posix_spawnattr_set_filedesclimit_ext(v8, *(unsigned int *)(a2 + 156), *(unsigned int *)(a2 + 160));
  if (v35) {
    sub_100006068(v35);
  }
  int v36 = posix_spawnattr_set_kqworklooplimit_ext(v8, *(unsigned int *)(a2 + 164), *(unsigned int *)(a2 + 168));
  if (v36) {
    sub_100006068(v36);
  }
  if ((*(_BYTE *)(a2 + 239) & 2) != 0)
  {
    int v37 = posix_spawnattr_set_max_addr_np(v8, -1LL);
    if (v37) {
      sub_100006068(v37);
    }
  }

  int v38 = posix_spawnattr_set_crash_behavior_np(v8, *(unsigned __int8 *)(a2 + 176));
  if (v38) {
    sub_100006068(v38);
  }
  int v39 = posix_spawnattr_set_crash_behavior_deadline_np(v8, *(void *)(a2 + 180), 0LL);
  if (v39) {
    sub_100006068(v39);
  }
  int v40 = posix_spawnattr_set_launch_type_np(v8, *(unsigned __int8 *)(a2 + 196));
  if (v40) {
    sub_100006068(v40);
  }
  int v41 = posix_spawnattr_set_crash_count_np(v8, *(unsigned int *)(a2 + 188), *(unsigned int *)(a2 + 192));
  if (v41) {
    sub_100006068(v41);
  }
  int v42 = posix_spawnattr_set_darwin_role_np(v8, *(unsigned int *)(a2 + 116));
  if (v42) {
    sub_100006068(v42);
  }
  int v43 = *(unsigned __int8 *)(a2 + 229);
  if (v43 == 1)
  {
    int v45 = posix_spawnattr_setdataless_iopolicy_np(v8, 1LL);
    if (v45) {
      sub_100006068(v45);
    }
  }

  else if (v43 == 2)
  {
    int v44 = posix_spawnattr_setdataless_iopolicy_np(v8, 2LL);
    if (v44) {
      sub_100006068(v44);
    }
  }

  unsigned int v46 = *(_DWORD *)(a2 + 80);
  if (!v46)
  {
    unsigned int v51 = *(_DWORD *)(a2 + 84);
    if (!v51) {
      goto LABEL_64;
    }
    v50 = 0LL;
    goto LABEL_55;
  }

  v47 = _xpc_spawnattr_unpack_string(a2, a3, v46);
  if (!v47)
  {
    v56 = "Unable to unpack container_id";
    uint64_t v57 = v8;
    unsigned int v58 = 126;
    goto LABEL_63;
  }

  v50 = v47;
  unsigned int v51 = *(_DWORD *)(a2 + 84);
  if (v51)
  {
LABEL_55:
    v53 = _xpc_spawnattr_unpack_string(a2, a3, v51);
    if (v53)
    {
      v54 = v53;
      uint64_t v52 = v8 + 16;
      sandbox_spawnattrs_init(v8 + 16);
      if (!v50) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }

    v56 = "Unable to unpack sandbox profile";
    uint64_t v57 = v8;
    unsigned int v58 = 135;
LABEL_63:
    sub_100004D7C(v57, 22, 0, v58, 0LL, v56, v48, v49, v162);
  }

  uint64_t v52 = v8 + 16;
  sandbox_spawnattrs_init(v8 + 16);
LABEL_58:
LABEL_59:
  int v55 = posix_spawnattr_setmacpolicyinfo_np(v8, "Sandbox", v52, 1104LL);
  if (v55) {
    sub_100006068(v55);
  }
LABEL_64:
  unsigned int v59 = *(_DWORD *)(a2 + 88);
  if (v59)
  {
    v60 = _xpc_spawnattr_unpack_string(a2, a3, v59);
    int v61 = posix_spawnattr_set_subsystem_root_path_np(v8, v60);
    if (v61) {
      sub_100006068(v61);
    }
  }

  uint64_t v62 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v62)
  {
    v63 = (const char **)sub_100001FB4(8 * v62 + 8);
    *(void *)(v8 + 1144) = v63;
    if (!_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 20), v63, *(unsigned int *)(a2 + 16)))
    {
      v79 = "Unable to unpack argv";
      uint64_t v80 = v8;
      unsigned int v81 = 537;
      goto LABEL_76;
    }

    v66 = (void *)(*(void *)(v8 + 1144) + 8LL * *(unsigned int *)(a2 + 16));
  }

  else
  {
    v67 = sub_100001FB4(0x10uLL);
    *(void *)(v8 + 1144) = v67;
    void *v67 = *(void *)(v8 + 1136);
    v66 = v67 + 1;
  }

  void *v66 = 0LL;
  v68 = (const char **)sub_100001FB4(8LL * *(unsigned int *)(a2 + 24) + 56);
  *(void *)(v8 + 1160) = v68;
  uint64_t v72 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v72)
  {
    if (_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 28), v68, v72))
    {
      *(void *)(v8 + 1152) = *(unsigned int *)(a2 + 24);
      goto LABEL_73;
    }

    v79 = "Unable to unpack environment";
    uint64_t v80 = v8;
    unsigned int v81 = 565;
LABEL_76:
    sub_100004D7C(v80, 22, 0, v81, 0LL, v79, v64, v65, v162);
  }

LABEL_73:
  sub_100004C5C((void *)v8, "XXXXXXXX%s=%llx", v69, v70, v72, v71, v64, v65, (char)"XPC_FLAGS");
  if (*(_DWORD *)(v8 + 1128) != -101)
  {
    if (!a4)
    {
      v110 = "Unable to setup identify";
      uint64_t v111 = v8;
      int v112 = 22;
      unsigned int v113 = 354;
      goto LABEL_92;
    }

    sub_100004C5C((void *)v8, "XXXXXXXX%s=%s", v82, v83, v84, v85, v86, v87, (char)"USER");
    sub_100004C5C((void *)v8, "XXXXXXXX%s=%s", v88, v89, v90, v91, v92, v93, (char)"HOME");
    sub_100004C5C((void *)v8, "XXXXXXXX%s=%s", v94, v95, v96, v97, v98, v99, (char)"SHELL");
    unsigned int v106 = *(_DWORD *)(v8 + 1128);
    if (v106 >= 0x1F5 && v106 != -2) {
      sub_100004C5C((void *)v8, "XXXXXXXX%s=%s/tmp", v100, v101, v102, v103, v104, v105, (char)"TMPDIR");
    }
    if (setlogin(*(const char **)(v8 + 1120)))
    {
      int v107 = *__error();
      sub_100004D7C(v8, v107, 0, 0x17Au, 0LL, "setlogin(%s)", v108, v109, *(void *)(v8 + 1120));
    }

    if (setgid(*(_DWORD *)(v8 + 1132)))
    {
      int v114 = *__error();
      sub_100004D7C(v8, v114, 0, 0x181u, 0LL, "setgid(%d)", v115, v116, *(_DWORD *)(v8 + 1132));
    }

    if ((*(_BYTE *)(a2 + 237) & 0x10) == 0)
    {
      int v117 = initgroups(*(const char **)(v8 + 1120), *(_DWORD *)(v8 + 1132));
      if (v117) {
        sub_100004D7C(v8, v117, 0, 0x18Bu, 0LL, "initgroups(%s, %d)", v118, v119, *(void *)(v8 + 1120));
      }
    }

    if (setuid(*(_DWORD *)(v8 + 1128)))
    {
      int v112 = *__error();
      int v162 = *(_DWORD *)(v8 + 1128);
      v110 = "setuid(%d)";
      uint64_t v111 = v8;
      unsigned int v113 = 400;
LABEL_92:
      sub_100004D7C(v111, v112, 0, v113, 0LL, v110, v77, v78, v162);
    }
  }

  xpc_object_t v120 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (*(void *)(v8 + 1152))
  {
    uint64_t v121 = 0LL;
    unint64_t v122 = 0LL;
    do
    {
      v123 = *(const char **)(*(void *)(v8 + 1160) + 8 * v122);
      v124 = strchr(v123, 61);
      if (v124) {
        BOOL v127 = v124 == v123;
      }
      else {
        BOOL v127 = 1;
      }
      if (v127) {
        sub_100004D7C(v8, 22, 0, 0x1D0u, 0LL, "Invalid environment[%zd]: %s", v125, v126, v122);
      }
      v128 = sub_100003624(v123, v124 - v123);
      if (!xpc_dictionary_get_value(v120, v128))
      {
        xpc_dictionary_set_BOOL(v120, v128, 1);
        *(void *)(*(void *)(v8 + 1160) + 8 * v121++) = v123;
      }

      free(v128);
      ++v122;
    }

    while (v122 < *(void *)(v8 + 1152));
  }

  else
  {
    uint64_t v121 = 0LL;
  }

  xpc_release(v120);
  *(void *)(v8 + 1152) = v121;
  *(void *)(*(void *)(v8 + 1160) + 8 * v121) = 0LL;
  unsigned int v129 = *(_DWORD *)(a2 + 64);
  if (v129)
  {
    v132 = _xpc_spawnattr_unpack_string(a2, a3, v129);
    if (!v132)
    {
      v133 = "Unable to unpack cwd";
      uint64_t v134 = v8;
      unsigned int v135 = 224;
      goto LABEL_138;
    }
  }

  else
  {
    v132 = "/";
  }

  unsigned int v136 = *(_DWORD *)(a2 + 68);
  if (v136)
  {
    v137 = _xpc_spawnattr_unpack_string(a2, a3, v136);
    if (!v137)
    {
      v133 = "Unable to unpack stdin";
      uint64_t v134 = v8;
      unsigned int v135 = 241;
      goto LABEL_138;
    }

    v138 = (char *)v137;
    bzero(__str, 0x400uLL);
    if (*v138 != 47)
    {
      v163 = v138;
      v138 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v132, v163);
    }

    int v139 = sub_100004CC0(v138);
    if (v139) {
      sub_100004D7C(v8, v139, 0, 0xFDu, 0LL, "Unable to create stdin directory (%s)", v140, v141, (char)v138);
    }
    int v143 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, v138, 131584, 0x1B6u);
    if (v143) {
      sub_100006068(v143);
    }
  }

  else
  {
    int v142 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, "/dev/null", 0x20000, 0x1B6u);
    if (v142) {
      sub_100006068(v142);
    }
  }

  unsigned int v144 = *(_DWORD *)(a2 + 72);
  if (v144)
  {
    v145 = _xpc_spawnattr_unpack_string(a2, a3, v144);
    if (!v145)
    {
      v133 = "Unable to unpack stdout";
      uint64_t v134 = v8;
      unsigned int v135 = 268;
      goto LABEL_138;
    }

    v146 = (char *)v145;
    bzero(__str, 0x400uLL);
    if (*v146 != 47)
    {
      v164 = v146;
      v146 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v132, v164);
    }

    int v147 = sub_100004CC0(v146);
    if (v147) {
      sub_100004D7C(v8, v147, 0, 0x118u, 0LL, "Unable to create stdout directory (%s)", v148, v149, (char)v146);
    }
    int v151 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, v146, 131594, 0x1B6u);
    if (v151) {
      sub_100006068(v151);
    }
  }

  else
  {
    int v150 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, "/dev/null", 131074, 0x1B6u);
    if (v150) {
      sub_100006068(v150);
    }
  }

  unsigned int v152 = *(_DWORD *)(a2 + 76);
  if (v152)
  {
    v153 = _xpc_spawnattr_unpack_string(a2, a3, v152);
    if (v153)
    {
      v154 = (char *)v153;
      bzero(__str, 0x400uLL);
      if (*v154 != 47)
      {
        v165 = v154;
        v154 = __str;
        snprintf(__str, 0x400uLL, "%s/%s", v132, v165);
      }

      int v155 = sub_100004CC0(v154);
      if (v155) {
        sub_100004D7C(v8, v155, 0, 0x133u, 0LL, "Unable to create stderr directory (%s)", v156, v157, (char)v154);
      }
      int v161 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, v154, 131594, 0x1B6u);
      if (v161) {
        sub_100006068(v161);
      }
      goto LABEL_139;
    }

    v133 = "Unable to unpack stderr";
    uint64_t v134 = v8;
    unsigned int v135 = 295;
LABEL_138:
    sub_100004D7C(v134, 22, 0, v135, 0LL, v133, v130, v131, v162);
  }

  int v158 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, "/dev/null", 131074, 0x1B6u);
  if (v158) {
    sub_100006068(v158);
  }
LABEL_139:
  if ((*(_BYTE *)(a2 + 238) & 1) != 0)
  {
    int v159 = *(_DWORD *)(v8 + 1128);
    if (!v159 || v159 == -101)
    {
      v26 = "extensions cannot run as root";
      a1 = v8;
      int v27 = 1;
      unsigned int v28 = 769;
LABEL_25:
      sub_100004D7C(a1, v27, 0, v28, 0LL, v26, a7, a8, v162);
    }
  }

  return 0LL;
}

uint64_t sub_100004808( posix_spawnattr_t *a1, uint64_t a2, uint64_t a3, xpc_object_t xarray, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a2 + 220);
  if ((_DWORD)v8)
  {
    uint64_t v11 = *(unsigned int *)(a2 + 216);
    unint64_t v12 = 4 * v8;
    if (v12 > a3 - v11) {
      sub_100004D7C((uint64_t)a1, 22, 0, 0x31Du, 0LL, "No space for special ports: %zu > (%zu - %d)", a7, a8, v12);
    }
    char v14 = 0;
    size_t v15 = 0LL;
    uint64_t v16 = a2 + v11 + 240;
    while (1)
    {
      xpc_object_t value = xpc_array_get_value(xarray, v15);
      mach_port_t right = xpc_mach_send_get_right(value);
      mach_port_t v21 = right;
      if (right - 1 >= 0xFFFFFFFE) {
        break;
      }
      int v22 = *(_DWORD *)(v16 + 4 * v15);
      if ((v22 - 128) > 2)
      {
        if (v22 == 4)
        {
          if ((*(_BYTE *)(a2 + 239) & 4) != 0) {
            mach_port_t v21 = 0;
          }
          else {
            mach_port_t v21 = right;
          }
        }

        int v24 = posix_spawnattr_setspecialport_np(a1, v21, v22);
        if (v24) {
          sub_100006068(v24);
        }
      }

      else
      {
        int v31 = 0;
        uint64_t v30 = 0LL;
        if ((v22 - 129) <= 1)
        {
          if ((v14 & 1) != 0)
          {
            v26 = "Already registered ports";
            uint64_t v27 = (uint64_t)a1;
            unsigned int v28 = 820;
LABEL_19:
            sub_100004D7C(v27, 22, 0, v28, 0LL, v26, v19, v20, v29);
          }

          LODWORD(v30) = right;
          char v14 = 1;
          int v23 = posix_spawnattr_set_registered_ports_np(a1, &v30, 1LL);
          if (v23) {
            sub_100006068(v23);
          }
        }
      }
    }

    char v29 = v15;
    v26 = "Invalid special port[%zd]: %d";
    uint64_t v27 = (uint64_t)a1;
    unsigned int v28 = 806;
    goto LABEL_19;
  }

  return 0LL;
}

size_t sub_1000049A8(uint64_t a1, xpc_object_t xarray)
{
  size_t result = xpc_array_get_count(xarray);
  if (result)
  {
    size_t v5 = 0LL;
    do
    {
      xpc_object_t value = xpc_array_get_value(xarray, v5 + 1);
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_int64)
      {
        size_t v15 = "setup_fds bad int type";
        uint64_t v16 = a1;
        unsigned int v17 = 864;
        goto LABEL_13;
      }

      int64_t v9 = xpc_int64_get_value(value);
      if ((v9 & 0x80000000) != 0 || getdtablesize() <= (int)v9)
      {
        getdtablesize();
        sub_100004D7C(a1, 9, 0, 0x364u, 0LL, "setup_fds bad dest: %d table: %d", v13, v14, v9);
      }

      xpc_object_t v10 = xpc_array_get_value(xarray, v5);
      if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_fd)
      {
        size_t v15 = "setup_fds bad fd type";
        uint64_t v16 = a1;
        unsigned int v17 = 873;
LABEL_13:
        sub_100004D7C(v16, 9, 0, v17, 0LL, v15, v7, v8, v18);
      }

      uint64_t port = _xpc_fd_get_port(v10);
      int v12 = posix_spawn_file_actions_add_fileportdup2_np(a1 + 8, port, v9);
      if (v12) {
        sub_100006068(v12);
      }
      v5 += 2LL;
    }

    while (v5 < xpc_array_get_count(xarray));
    return 0LL;
  }

  return result;
}

uint64_t sub_100004AFC(uint64_t a1, uint64_t a2, unint64_t a3, const void *a4, size_t a5)
{
  size_t v8 = *(unsigned int *)(a2 + 12);
  if ((_DWORD)v8) {
    int64_t v9 = (const void *)_xpc_spawnattr_unpack_bytes(a2, a3, *(_DWORD *)(a2 + 8), v8);
  }
  else {
    int64_t v9 = 0LL;
  }
  if ((_DWORD)v8) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (a4 && a5)
  {
    if (v11)
    {
      int v12 = (void *)sub_100002518((uint64_t)a4, a5, (uint64_t)v9, v8);
      if (v12)
      {
        size_t v15 = v12;
        size_t length = xpc_data_get_length(v12);
        *(void *)(a1 + 1176) = length;
        unsigned int v17 = sub_100001FB4(length);
        *(void *)(a1 + 1168) = v17;
        size_t bytes = xpc_data_get_bytes(v15, v17, 0LL, *(void *)(a1 + 1176));
        uint64_t v19 = *(void *)(a1 + 1176);
        xpc_release(v15);
        if (bytes == v19)
        {
          uint64_t v20 = *(void **)(a1 + 1168);
          a5 = *(void *)(a1 + 1176);
          goto LABEL_19;
        }

        int v22 = "Unable to copy merged spawn constraints";
        uint64_t v23 = a1;
        unsigned int v24 = 938;
      }

      else
      {
        int v22 = "Unable to merge spawn constraints";
        uint64_t v23 = a1;
        unsigned int v24 = 933;
      }

      sub_100004D7C(v23, 22, 0, v24, 0LL, v22, v13, v14, v25);
    }

    uint64_t v20 = sub_1000035A4(a4, a5);
    *(void *)(a1 + 1168) = v20;
    *(void *)(a1 + 1176) = a5;
  }

  else
  {
    if (!v11) {
      return 0LL;
    }
    uint64_t v20 = sub_1000035A4(v9, v8);
    *(void *)(a1 + 1168) = v20;
    *(void *)(a1 + 1176) = v8;
    a5 = v8;
  }

LABEL_19:
  uint64_t result = amfi_launch_constraint_set_spawnattr(a1, v20, a5);
  if ((_DWORD)result) {
    sub_100006068(result);
  }
  return result;
}

char *sub_100004C5C( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v14[0] = 0LL;
  v14[1] = &a9;
  vasprintf(v14, a2, &a9);
  BOOL v10 = v14[0];
  *(void *)v14[0] = a1[148];
  a1[148] = v10;
  uint64_t result = v10 + 8;
  uint64_t v12 = a1[145];
  uint64_t v13 = a1[144];
  a1[144] = v13 + 1;
  *(void *)(v12 + 8 * v13) = result;
  return result;
}

uint64_t sub_100004CC0(const char *a1)
{
  size_t v2 = strrchr(a1, 47);
  if (!v2) {
    return 22LL;
  }
  uint64_t v3 = v2;
  char v4 = *v2;
  char *v2 = 0;
  LODWORD(result) = mkpath_np(a1, 0x1F6u);
  if ((_DWORD)result == 17) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = result;
  }
  *uint64_t v3 = v4;
  return result;
}

uint64_t sub_100004D1C(int *a1)
{
  return _os_assert_log(*a1);
}

uint64_t sub_100004D24(const char *a1)
{
  if (byte_10000C100 == 1) {
    sub_100005F38();
  }
  return 1LL;
}

void sub_100004D7C( uint64_t a1, int a2, int a3, unsigned int a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v15, "self", 1);
  xpc_dictionary_set_int64(v15, "code", a2);
  xpc_dictionary_set_int64(v15, "subcode", a3);
  xpc_dictionary_set_uint64(v15, "line", a4);
  xpc_dictionary_set_BOOL(v15, "setup-event", a5 != 0);
  string[0] = 0LL;
  string[1] = &a9;
  vasprintf(string, a6, &a9);
  uint64_t v16 = 0LL;
  if (string[0])
  {
    xpc_dictionary_set_string(v15, "string", string[0]);
    uint64_t v16 = string[0];
  }

  free(v16);
  string[0] = 0LL;
  uint64_t v17 = dyld_image_header_containing_address(v9);
  uint64_t v18 = v17;
  if (v17)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    _dyld_get_image_uuid(v17, v19);
    xpc_dictionary_set_uuid(v15, "uuid", (const unsigned __int8 *)v19);
  }

  xpc_dictionary_set_uint64(v15, "pc", v9 - v18);
  v19[0] = 0LL;
  _xpc_service_routine(701LL, v15, v19);
  if (a5) {
    xpc_set_event("com.apple.launchd.helper", qword_10000C078, a5);
  }
  exit(78);
}

uint64_t start(int a1, uint64_t a2)
{
  if (_os_alloc_once_table[2] == -1LL) {
    uint64_t v4 = _os_alloc_once_table[3];
  }
  else {
    uint64_t v4 = _os_alloc_once(&_os_alloc_once_table[2], 216LL, 0LL);
  }
  if (setenv("PATH", "/usr/bin:/bin:/usr/sbin:/sbin", 1) != -1)
  {
    if (getppid() != 1 && (sub_100001EC4() & 1) == 0)
    {
      size_t v8 = __stdoutp;
      uint64_t v9 = getprogname();
      fprintf(v8, "%s cannot be run directly.\n", v9);
      exit(78);
    }

    if (a1 <= 1) {
LABEL_7:
    }
      exit(66);
    size_t v5 = pthread_self();
    pthread_getname_np(v5, byte_10000C080, 0x80uLL);
    pthread_setname_np(*(const char **)(a2 + 8));
    qword_10000C078 = *(void *)(a2 + 8);
    sub_100005F50(0);
    if ((*(_BYTE *)(v4 + 9) & 2) != 0)
    {
      byte_10000C100 = 1;
      uint64_t v6 = sub_100005294(*(const char **)(a2 + 8), *(const char **)(a2 + 16));
    }

    else
    {
      uint64_t v6 = *(unsigned int *)(v4 + 20);
      if (a1 >= 3)
      {
        int64_t v7 = (int)strtol(*(const char **)(a2 + 16), 0LL, 0);
        uint64_t v6 = *(unsigned int *)(v4 + 20);
        goto LABEL_17;
      }
    }

    int64_t v7 = 0LL;
LABEL_17:
    uint64_t v10 = xpc_pipe_create_from_port(v6, 0LL);
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    pid_t v12 = getpid();
    xpc_dictionary_set_int64(v11, "pid", v12);
    xpc_dictionary_set_BOOL(v11, "configurable", 1);
    xpc_dictionary_set_int64(v11, "hostpid", v7);
    uint64_t data = xpc_pipe_simpleroutine(v10, v11);
    if ((_DWORD)data)
    {
      uint64_t v17 = "controller died";
      int v18 = data;
      unsigned int v19 = 1250;
      goto LABEL_28;
    }

LABEL_18:
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v16, "self", 1);
    sub_100002010(570425372LL);
    xpc_object_t xdict = 0LL;
    sub_100002010(570425376LL);
    size_t length = 0LL;
    uint64_t data = (uint64_t)xpc_dictionary_get_data(xdict, "blob", &length);
    if (data)
    {
      if (length <= 0xEF) {
        sub_100004D7C(data, 22, 0, 0x503u, 0LL, "Insufficient spawnattr length: %zu < %lu", v14, v15, length);
      }
      uint64_t v20 = data;
      uint64_t data = (uint64_t)xpc_dictionary_get_value(xdict, "ports");
      if (data
        && (mach_port_t v21 = (void *)data, data = (uint64_t)xpc_get_type((xpc_object_t)data), (_UNKNOWN *)data == &_xpc_type_array)
        && (uint64_t data = xpc_array_get_count(v21)) != 0)
      {
        uint64_t data = (uint64_t)xpc_dictionary_get_value(xdict, "fds");
        if (data)
        {
          int v22 = (void *)data;
          uint64_t data = (uint64_t)xpc_get_type((xpc_object_t)data);
          if ((_UNKNOWN *)data == &_xpc_type_array)
          {
            uint64_t data = xpc_array_get_count(v22);
            if ((data & 1) == 0) {
              uint64_t data = sub_1000054C4(v20, length - 240, v21, v22);
            }
          }
        }

        uint64_t v17 = "fds invalid";
        int v18 = 22;
        unsigned int v19 = 1299;
      }

      else
      {
        uint64_t v17 = "Special ports invalid";
        int v18 = 22;
        unsigned int v19 = 1291;
      }
    }

    else
    {
      uint64_t v17 = "No spawn attr blob";
      int v18 = 22;
      unsigned int v19 = 1273;
    }

LABEL_28:
    sub_100004D7C(data, v18, 0, v19, 0LL, v17, v14, v15, v26);
  }

  uint64_t v23 = __error();
  uint64_t v24 = _os_assert_log(*v23);
  uint64_t result = _os_crash(v24);
  __break(1u);
  return result;
}

  char v26 = _os_assert_log(v14);
  uint64_t result = _os_crash(v26);
  __break(1u);
  return result;
}

void sub_100005258(int a1)
{
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v2 = 0u;
  snprintf(__str, 0x40uLL, "Could not create shell: code %d", a1);
  pthread_setname_np(__str);
  sub_100005F38();
}

uint64_t sub_100005294(const char *a1, const char *a2)
{
  __int128 v4 = _os_alloc_once_table;
  if (_os_alloc_once_table[2] != -1LL) {
    goto LABEL_20;
  }
  uint64_t v5 = _os_alloc_once_table[3];
  do
  {
    while (revoke("/dev/console") == -1)
    {
      xpc_object_t v16 = __error();
      uint64_t v17 = _os_assert_log(*v16);
      _os_crash(v17);
      __break(1u);
LABEL_20:
      uint64_t v5 = _os_alloc_once(v4 + 2, 216LL, 0LL);
    }

    int v6 = open(a1, 2);
    if (login_tty(v6) == -1)
    {
      close(v6);
      int v6 = -1;
    }
  }

  while (v6 == -1);
  if (a2)
  {
    size_t v7 = strlen(a2);
    if (write(v6, a2, v7) == -1) {
      goto LABEL_27;
    }
  }

  posix_spawnattr_t v34 = 0LL;
  int v8 = posix_spawnattr_init(&v34);
  if (v8)
  {
    uint64_t v18 = _os_assert_log(v8);
    int v9 = _os_crash(v18);
    __break(1u);
    goto LABEL_22;
  }

  int v9 = posix_spawnattr_setflags(&v34, 16448);
  if (v9)
  {
LABEL_22:
    uint64_t v19 = _os_assert_log(v9);
    int v10 = _os_crash(v19);
    __break(1u);
    goto LABEL_23;
  }

  posix_spawn_file_actions_t v33 = 0LL;
  int v10 = posix_spawn_file_actions_init(&v33);
  if (v10)
  {
LABEL_23:
    uint64_t v20 = _os_assert_log(v10);
    int v11 = _os_crash(v20);
    __break(1u);
    goto LABEL_24;
  }

  int v11 = posix_spawn_file_actions_addinherit_np(&v33, 0);
  if (v11)
  {
LABEL_24:
    uint64_t v21 = _os_assert_log(v11);
    int v12 = _os_crash(v21);
    __break(1u);
    goto LABEL_25;
  }

  int v12 = posix_spawn_file_actions_addinherit_np(&v33, 1);
  if (v12)
  {
LABEL_25:
    uint64_t v22 = _os_assert_log(v12);
    int v13 = _os_crash(v22);
    __break(1u);
    goto LABEL_26;
  }

  int v13 = posix_spawn_file_actions_addinherit_np(&v33, 2);
  if (v13)
  {
LABEL_26:
    uint64_t v23 = _os_assert_log(v13);
    _os_crash(v23);
    __break(1u);
LABEL_27:
    uint64_t v24 = __error();
    uint64_t v25 = _os_assert_log(*v24);
    int v14 = _os_crash(v25);
    __break(1u);
    goto LABEL_28;
  }

  *(_OWORD *)__argv = off_100008750;
  *(_OWORD *)__envp = *(_OWORD *)off_100008760;
  __int128 v30 = *(_OWORD *)off_100008770;
  uint64_t v31 = 0LL;
  if ((*(_BYTE *)(v5 + 9) & 1) == 0) {
    goto LABEL_18;
  }
  int v14 = posix_spawnattr_setspecialport_np(&v34, *(_DWORD *)(v5 + 16), 4);
  if (!v14)
  {
    *((void *)&v30 + 1) = 0LL;
LABEL_18:
    pthread_setname_np(byte_10000C080);
    pid_t v28 = 0;
    int v15 = posix_spawn(&v28, "/bin/sh", &v33, &v34, __argv, __envp);
    sub_100005258(v15);
  }

uint64_t sub_1000054C4(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, *(_DWORD *)(a1 + 4));
  if (!type)
  {
    int v11 = "Unable to unpack program";
    int v12 = 22;
    unsigned int v13 = 742;
    goto LABEL_87;
  }

  int v14 = (const char *)type;
  if ((*(_BYTE *)(a1 + 237) & 1) != 0)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0LL, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_1000087A8);
    xpc_connection_activate(mach_service);
    xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v30, "Path", v14);
    uint64_t v31 = xpc_bundle_create(v14, 2LL);
    if (v31)
    {
      int v32 = (void *)v31;
      uint64_t property = xpc_bundle_get_property(v31, 2LL);
      if (property)
      {
        posix_spawnattr_t v34 = (const char *)sandbox_extension_issue_file("com.apple.app-sandbox.read", property, 0LL);
        if (v34)
        {
          int v35 = (char *)v34;
          xpc_dictionary_set_string(v30, "Token", v34);
          free(v35);
        }
      }

      xpc_release(v32);
    }

    uint64_t type = (uint64_t)xpc_connection_send_message_with_reply_sync(mach_service, v30);
    if (!type)
    {
      int v11 = "setup_role_account no reply";
      int v12 = 140;
      unsigned int v13 = 629;
      goto LABEL_87;
    }

    int v36 = (void *)type;
    xpc_connection_cancel(mach_service);
    uint64_t type = (uint64_t)xpc_get_type(v36);
    if ((_UNKNOWN *)type == &_xpc_type_error)
    {
      int v11 = "setup_role_account reply is error";
      int v12 = 22;
      unsigned int v13 = 634;
      goto LABEL_87;
    }

    uint64_t type = (uint64_t)xpc_dictionary_get_value(v36, "Retval");
    if (!type)
    {
      int v11 = "setup_role_account missing RETVAL_KEY";
      int v12 = 153;
      unsigned int v13 = 638;
      goto LABEL_87;
    }

    uint64_t type = xpc_dictionary_get_uint64(v36, "Retval");
    if (type)
    {
      int v11 = "setup_role_account failed";
      int v12 = type;
      unsigned int v13 = 643;
      goto LABEL_87;
    }

    uint64_t type = (uint64_t)xpc_dictionary_get_string(v36, "Path");
    if (!type)
    {
      int v11 = "setup_role_account missing PATH_KEY";
      int v12 = 2;
      unsigned int v13 = 648;
      goto LABEL_87;
    }

    uint64_t type = (uint64_t)sub_1000035D4((const char *)type);
    int v14 = (const char *)type;
    if (!type)
    {
      int v11 = "Unable to setup_role_account";
      int v12 = 1;
      unsigned int v13 = 748;
      goto LABEL_87;
    }
  }

  unsigned int v106 = a3;
  int v15 = a4;
  uint64_t v16 = sub_100003BFC((uint64_t)&v107, (uint64_t)v14);
  unint64_t v19 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v19)
  {
    if (v19 > a2) {
      sub_100004D7C(v16, 22, 0, 0x29Au, 0LL, "Insufficient rlimit: %u > %zd", v9, v10, *(_DWORD *)(a1 + 208));
    }
    uint64_t v38 = *(unsigned int *)(a1 + 204);
    if (20 * v38 > a2) {
      sub_100004D7C(v16, 22, 0, 0x29Eu, 0LL, "Too many rlimits: %d", v9, v10, *(_DWORD *)(a1 + 204));
    }
    if ((_DWORD)v38)
    {
      unint64_t v40 = 0LL;
      uint64_t v41 = a1 + v19 + 240;
      do
      {
        rlim_t v42 = *(void *)v41;
        rlim_t v43 = *(void *)(v41 + 8);
        int v44 = *(unsigned __int16 *)(v41 + 16);
        char v45 = *(_BYTE *)(v41 + 18);
        char v46 = *(_BYTE *)(v41 + 19);
        v113.rlim_cur = 0LL;
        v113.rlim_max = 0LL;
        if (getrlimit(v44, &v113) == -1)
        {
          uint64_t v85 = __error();
          sub_100004D7C((uint64_t)v85, *v85, 0, 0x2ADu, 0LL, "getrlimit(%d)", v86, v87, v44);
        }

        if ((v45 & 1) != 0) {
          v113.rlim_max = v43;
        }
        if ((v46 & 1) != 0) {
          v113.rlim_cur = v42;
        }
        setrlimit(v44, &v113);
        v41 += 20LL;
        ++v40;
      }

      while (v40 < *(unsigned int *)(a1 + 204));
    }
  }

  int v20 = *(_DWORD *)(a1 + 236);
  if ((v20 & 0x100) != 0)
  {
    uint64_t v37 = 0LL;
    uint64_t v22 = v15;
    uint64_t v25 = v106;
    goto LABEL_61;
  }

  unsigned int v21 = *(_DWORD *)(a1 + 40);
  uint64_t v22 = v15;
  if ((v20 & 0x80000) != 0 && !v21)
  {
    uid_t v23 = *(_DWORD *)(a1 + 48);
    *__error() = 0;
    uint64_t v24 = getpwuid(v23);
    uint64_t v25 = v106;
    if (!v24)
    {
      uint64_t v26 = __error();
      if (!*v26) {
        sub_100004D7C((uint64_t)v26, 114, 0, 0xABu, 0LL, "getpwuid(%d)", v27, v28, v23);
      }
      uint64_t v82 = __error();
      sub_100004D7C((uint64_t)v82, *v82, 0, 0xADu, 0LL, "getpwuid(%d)", v83, v84, v23);
    }

    uint64_t v37 = (uint64_t)v24;
    LODWORD(v109) = *(_DWORD *)(a1 + 48);
    gid_t pw_gid = v24->pw_gid;
LABEL_42:
    HIDWORD(v109) = pw_gid;
    goto LABEL_61;
  }

  uint64_t v25 = v106;
  if (v21)
  {
    uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v21);
    uint64_t v39 = type;
    if (!type)
    {
      int v11 = "Unable to unpack username";
      int v12 = 22;
      unsigned int v13 = 281;
      goto LABEL_87;
    }
  }

  else
  {
    uint64_t v39 = 0LL;
  }

  unsigned int v48 = *(_DWORD *)(a1 + 44);
  if (v48)
  {
    uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v48);
    uint64_t v49 = type;
    if (!type)
    {
      int v11 = "Unable to unpack group";
      int v12 = 22;
      unsigned int v13 = 289;
      goto LABEL_87;
    }
  }

  else
  {
    uint64_t v49 = 0LL;
  }

  if (v49) {
    BOOL v50 = v39 == 0;
  }
  else {
    BOOL v50 = 0;
  }
  if (v50) {
    uint64_t v39 = (uint64_t)"root";
  }
  if (v49 | v39)
  {
    *__error() = 0;
    unsigned int v51 = getpwnam((const char *)v39);
    if (!v51)
    {
      if (!*__error())
      {
        uint64_t v52 = sub_100005EB8(a1, (const char *)v39, 0LL);
        v53 = __error();
        sub_100004D7C((uint64_t)v53, 114, *v53, 0xD6u, (uint64_t)v52, "getpwnam(%s)", v54, v55, v39);
      }

      uint64_t v93 = __error();
      sub_100004D7C((uint64_t)v93, *v93, 0, 0xD8u, 0LL, "getpwnam(%s)", v94, v95, v39);
    }

    uint64_t v37 = (uint64_t)v51;
    uint64_t v109 = *(void *)&v51->pw_uid;
    if (v49)
    {
      *__error() = 0;
      uint64_t v88 = getgrnam((const char *)v49);
      if (!v88)
      {
        if (!*__error())
        {
          uint64_t v89 = sub_100005EB8(a1, 0LL, (const char *)v49);
          uint64_t v90 = __error();
          sub_100004D7C((uint64_t)v90, 114, *v90, 0xF8u, (uint64_t)v89, "getgrnam(%s)", v91, v92, v49);
        }

        uint64_t v96 = __error();
        sub_100004D7C((uint64_t)v96, *v96, 0, 0xFAu, 0LL, "getgrnam(%s)", v97, v98, v49);
      }

      gid_t pw_gid = v88->gr_gid;
      goto LABEL_42;
    }
  }

  else
  {
    uint64_t v37 = 0LL;
  }

LABEL_61:
  sub_100003CBC((uint64_t)&v107, a1, a2, v37, v17, v18, v9, v10);
  sub_100004808(&v107, a1, a2, v25, v56, v57, v58, v59);
  sub_1000049A8((uint64_t)&v107, v22);
  int v60 = sub_100004AFC((uint64_t)&v107, a1, a2, 0LL, 0LL);
  if (v60)
  {
    uint64_t v99 = _os_assert_log(v60);
    int v69 = _os_crash(v99);
    __break(1u);
    goto LABEL_100;
  }

  unsigned int v61 = *(_DWORD *)(a1 + 104);
  if (v61)
  {
    uint64_t v62 = _xpc_spawnattr_unpack_string(a1, a2, v61);
    sub_100005CD4(v62);
  }

  if ((*(_BYTE *)(a1 + 237) & 0x20) != 0) {
    umask(*(_WORD *)(a1 + 52));
  }
  unsigned int v63 = *(_DWORD *)(a1 + 64);
  if (v63)
  {
    uint64_t v64 = _xpc_spawnattr_unpack_string(a1, a2, v63);
    if (chdir(v64) == -1)
    {
      uint64_t v65 = __error();
      sub_100004D7C( (uint64_t)v65,  *v65,  0,  0x3B1u,  0LL,  "Unable to set current working directory. path = %s",  v66,  v67,  (char)v64);
    }
  }

  int v68 = *(_DWORD *)(a1 + 236);
  if ((v68 & 4) != 0)
  {
    int v69 = setiopolicy_np(0, 0, 3);
    if (!v69)
    {
      int v68 = *(_DWORD *)(a1 + 236);
      goto LABEL_72;
    }

LABEL_100:
    uint64_t v100 = _os_assert_log(v69);
    int v70 = _os_crash(v100);
    __break(1u);
LABEL_101:
    uint64_t v101 = _os_assert_log(v70);
    int v71 = _os_crash(v101);
    __break(1u);
    goto LABEL_102;
  }

LABEL_72:
  if ((v68 & 8) != 0)
  {
    int v70 = setiopolicy_np(0, 2, 3);
    if (v70) {
      goto LABEL_101;
    }
  }

  if (*(_DWORD *)(a1 + 112) != 1792 || (int v71 = posix_spawnattr_setprocesstype_np(&v107, 1792LL)) == 0)
  {
    pthread_setname_np(byte_10000C080);
    if ((*(_DWORD *)(a1 + 236) & 0x800) != 0) {
      uint64_t v72 = &posix_spawnp;
    }
    else {
      uint64_t v72 = &_posix_spawn;
    }
    sub_100003C50(&v107, 64, 0);
    sub_100002010(570425384LL);
    uint64_t type = ((uint64_t (*)(void, char *, uint64_t *, posix_spawnattr_t *, uint64_t, uint64_t))v72)( 0LL,  v110,  &v108,  &v107,  v111,  v112);
    int v73 = type;
    if (type <= 0x14 && ((1 << type) & 0x102004) != 0)
    {
      uint64_t type = (uint64_t)v110;
      if (*v110 == 47)
      {
        uint64_t type = access(v110, 1);
        if ((_DWORD)type == -1)
        {
          uint64_t v74 = *__error();
          xpc_object_t v75 = sub_100005E40(a1, v110, 0);
          char v76 = (char)v110;
          uint64_t v105 = xpc_strerror(v74);
          sub_100004D7C( v105,  111,  v73,  0x440u,  (uint64_t)v75,  "access(%s, X_OK) failed with errno %d - %s",  v77,  v78,  v76);
        }
      }
    }

    else if ((_DWORD)type == 86)
    {
      xpc_object_t v79 = sub_100005E40(a1, v110, 1);
      sub_100004D7C((uint64_t)v79, 111, 86, 0x424u, (uint64_t)v79, "posix_spawn(%s) EBADARCH", v80, v81, (char)v110);
    }

    int v11 = "posix_spawn(%s)";
    char v104 = (char)v110;
    int v12 = v73;
    unsigned int v13 = 1094;
LABEL_87:
    sub_100004D7C(type, v12, 0, v13, 0LL, v11, v9, v10, v104);
  }

LABEL_102:
  uint64_t v102 = _os_assert_log(v71);
  uint64_t result = _os_crash(v102);
  __break(1u);
  return result;
}

uint64_t sub_100005CD4(const char *a1)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  if ((_dyld_get_image_uuid(&_mh_execute_header, &v13) & 1) == 0)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  if ((_dyld_get_shared_cache_uuid(&v11) & 1) != 0)
  {
    uint64_t v10 = 0LL;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range(&v10);
  }

  else
  {
    uint64_t shared_cache_range = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  uint64_t v3 = _os_log_simple( &_mh_execute_header,  &v13,  &v11,  shared_cache_range,  0LL,  0LL,  "calling cryptex_trampoline_upgrade_wait() for %s",  a1);
  uint64_t v4 = cryptex_trampoline_upgrade_wait_options_create(v3);
  cryptex_trampoline_upgrade_wait_options_set_cryptex_name(v4, a1);
  uint64_t v5 = cryptex_trampoline_upgrade_wait(v4);
  if ((_DWORD)v5)
  {
    uint64_t v6 = v5;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &v13) & 1) == 0)
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid(&v11) & 1) != 0)
    {
      uint64_t v10 = 0LL;
      uint64_t v7 = _dyld_get_shared_cache_range(&v10);
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
    }

    int v8 = (const char *)xpc_strerror(v6);
    _os_log_simple( &_mh_execute_header,  &v13,  &v11,  v7,  16LL,  0LL,  "cryptex_trampoline_upgrade_wait() failed with error %d - %s",  v6,  v8);
  }

  return cryptex_trampoline_upgrade_wait_options_destroy(v4);
}

xpc_object_t sub_100005E40(uint64_t a1, const char *a2, BOOL a3)
{
  if ((*(_BYTE *)(a1 + 236) & 0x80) != 0) {
    return 0LL;
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "Executable", a2);
  xpc_dictionary_set_BOOL(v5, "SkipImmediatePoll", a3);
  return v5;
}

void *sub_100005EB8(uint64_t a1, const char *a2, const char *a3)
{
  if ((*(_BYTE *)(a1 + 236) & 0x80) != 0) {
    return 0LL;
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v6 = v5;
  if (a2) {
    xpc_dictionary_set_string(v5, "UserName", a2);
  }
  if (a3) {
    xpc_dictionary_set_string(v6, "GroupName", a3);
  }
  return v6;
}

void sub_100005F38()
{
  mach_port_t v0 = mach_host_self();
  host_reboot(v0, 4096);
  __break(1u);
}

void *sub_100005F50(int a1)
{
  if (a1)
  {
    if (dlopen("/usr/lib/system/libsystem_notify.dylib", 1)) {
      notify_set_options(0x8000000LL);
    }
    if (!dlopen("/usr/lib/system/libsystem_info.dylib", 1))
    {
LABEL_8:
      uint64_t result = dlopen("/usr/lib/system/libsystem_trace.dylib", 1);
      if (!result) {
        return result;
      }
      return (void *)os_trace_set_mode(256LL);
    }
  }

  else
  {
    notify_set_options(0x8000000LL);
  }

  si_search_module_set_flags("mdns", 1LL);
  si_search_module_set_flags("ds", 1LL);
  if (a1) {
    goto LABEL_8;
  }
  return (void *)os_trace_set_mode(256LL);
}

uint64_t sub_100005FF4(int a1, void *buffer)
{
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64) {
    return 0LL;
  }
  else {
    return *__error();
  }
}

void sub_100006030(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100006048()
{
  qword_10000C030 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void sub_100006068(int a1)
{
  uint64_t v1 = sub_1000036EC(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000607C()
{
  qword_10000C030 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void sub_10000609C()
{
}

void sub_1000060B4()
{
}

void sub_1000060CC()
{
}

void sub_1000060E4(int a1)
{
  uint64_t v1 = sub_10000367C("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100006108()
{
  mach_port_t v0 = __error();
  uint64_t v1 = sub_100004D1C(v0);
  uint64_t v2 = _os_crash(v1);
  __break(1u);
  CEAcquireUnmanagedContext(v2);
}