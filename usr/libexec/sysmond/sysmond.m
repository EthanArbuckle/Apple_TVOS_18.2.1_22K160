uint64_t start()
{
  BOOL v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _xpc_connection_s *mach_service;
  if (mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10000CDB8))
  {
    v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v0) {
      sub_100007478(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

  else
  {
    if (!mach_port_insert_right(mach_task_self_, dword_10000CDB8, dword_10000CDB8, 0x14u))
    {
      mach_service = xpc_connection_create_mach_service(SYSMON_XPC_SERVICE_NAME, 0LL, 1uLL);
      xpc_connection_set_event_handler(mach_service, &stru_1000083B8);
      xpc_connection_resume(mach_service);
      dispatch_main();
    }

    v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v8) {
      sub_100007440(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_1000043E8(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = (void *)xpc_connection_copy_entitlement_value(a2, "com.apple.sysmond.client");
    if (v3 && (v4 = v3, xpc_release(v3), v4 == &_xpc_BOOL_true))
    {
      v5 = _NSConcreteStackBlock;
      *(void *)&__int128 v6 = 0x40000000LL;
      *((void *)&v6 + 1) = sub_100004538;
      v7 = &unk_1000083D8;
      v8 = a2;
      xpc_connection_set_event_handler((xpc_connection_t)a2, &v5);
      xpc_connection_resume((xpc_connection_t)a2);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v5) = 67109378;
        HIDWORD(v5) = xpc_connection_get_pid((xpc_connection_t)a2);
        LOWORD(v6) = 2080;
        *(void *)((char *)&v6 + 2) = "com.apple.sysmond.client";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Client %d denied; missing %s entitlement.",
          (uint8_t *)&v5,
          0x12u);
      }

      xpc_connection_cancel((xpc_connection_t)a2);
    }
  }
}

void sub_100004538(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = sub_100005BBC(object);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_object_t v6 = sub_100005C68(v4);
      _os_object_release(v5);
      xpc_dictionary_set_mach_send(v6, "force_deserialization_on_clientside", dword_10000CDB8);
      if (v6)
      {
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v6);
        xpc_release(v6);
      }
    }

    else
    {
      xpc_dictionary_set_mach_send(0LL, "force_deserialization_on_clientside", dword_10000CDB8);
    }
  }

void sub_1000045F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

BOOL sub_100004604(uint64_t a1)
{
  int v2 = sub_100005B50(a1);
  int v3 = proc_pidinfo(v2, 18, 0LL, &buffer, 192);
  if (v3 == 192)
  {
    if (v8 != v2) {
      sub_1000074B0();
    }
    sub_1000063D8(a1, 1, buffer);
    sub_1000063D8(a1, 2, v6);
    sub_1000063D8(a1, 3, v7);
    sub_1000063D8(a1, 5, v9);
    sub_1000063D8(a1, 6, v10);
    sub_1000063D8(a1, 7, v11);
    sub_1000063D8(a1, 8, v12);
    sub_1000063D8(a1, 9, v13);
    sub_1000063D8(a1, 10, v14);
    sub_1000063D8(a1, 11, v15);
    sub_1000064AC(a1, 12, v16);
    sub_1000064AC(a1, 13, v17);
    sub_1000063D8(a1, 14, v18);
    sub_1000063D8(a1, 15, v19);
    sub_1000063D8(a1, 16, value);
    sub_100006390(a1, 17, value_4);
    sub_1000063D8(a1, 18, v22);
    sub_100006390(a1, 19, v23[0]);
    sub_100006464(a1, 20, 1000000000LL * *(void *)&v23[1] + 1000 * v24);
    sub_1000063D8(a1, 55, v9);
    sub_100006348(a1, 56, (buffer & 0x800000) != 0);
    sub_1000063D8(a1, 69, v25);
    sub_1000063D8(a1, 70, v26);
    sub_1000063D8(a1, 71, 0LL);
  }

  return v3 == 192;
}

BOOL sub_100004838(uint64_t a1)
{
  int v2 = sub_100005B50(a1);
  int v3 = proc_pidinfo(v2, 4, 0LL, v9, 96);
  if (v3 == 96)
  {
    sub_1000063D8(a1, 21, v9[0]);
    sub_1000063D8(a1, 22, v9[1]);
    uint64_t v4 = sub_1000049CC(v9[2]);
    sub_1000063D8(a1, 23, v4);
    uint64_t v5 = sub_1000049CC(v9[3]);
    sub_1000063D8(a1, 24, v5);
    uint64_t v6 = sub_1000049CC(v9[4]);
    sub_1000063D8(a1, 25, v6);
    uint64_t v7 = sub_1000049CC(v9[5]);
    sub_1000063D8(a1, 26, v7);
    sub_100006390(a1, 27, value);
    sub_100006390(a1, 28, value_4);
    sub_1000063D8(a1, 29, v12 & ~(v12 >> 31));
    sub_100006390(a1, 30, v13);
    sub_100006390(a1, 31, v14);
    sub_100006390(a1, 32, v15);
    sub_100006390(a1, 33, v16);
    sub_100006390(a1, 34, v17);
    sub_100006390(a1, 35, v18);
    sub_100006390(a1, 36, v19);
    sub_100006390(a1, 37, v20);
    sub_100006390(a1, 38, (int)v21);
  }

  return v3 == 96;
}

unint64_t sub_1000049CC(unint64_t a1)
{
  if (qword_10000CDC0 != -1) {
    dispatch_once(&qword_10000CDC0, &stru_100008418);
  }
  return (unint64_t)(*(double *)&qword_10000CAF0 * (double)a1 / *(double *)&qword_10000CAF8);
}

BOOL sub_100004A30(uint64_t a1)
{
  int v2 = sub_100005B50(a1);
  int v3 = proc_pidinfo(v2, 12, 0LL, &value, 16);
  if (v3 == 16)
  {
    sub_1000063D8(a1, 39, value);
    sub_1000063D8(a1, 40, HIDWORD(value));
    sub_1000063D8(a1, 41, v6);
    sub_1000063D8(a1, 42, v7);
  }

  return v3 == 16;
}

BOOL sub_100004AC0(uint64_t a1)
{
  uint64_t v2 = sub_100005B50(a1);
  int v3 = proc_pid_rusage(v2, 2, buffer);
  if (!v3)
  {
    sub_1000063D8(a1, 63, v24);
    uint64_t v4 = mach_absolute_time();
    unint64_t v5 = v4 - v24;
    uint64_t v6 = sub_1000049CC(v4 - v24);
    sub_1000063D8(a1, 61, v6);
    uint64_t v7 = sub_1000049CC(v18);
    sub_1000063D8(a1, 23, v7);
    uint64_t v8 = sub_1000049CC(*((unint64_t *)&v18 + 1));
    sub_1000063D8(a1, 24, v8);
    sub_1000063D8(a1, 47, v19.u64[0]);
    sub_1000063D8(a1, 46, v19.u64[1]);
    sub_1000063D8(a1, 29, v20);
    sub_1000063D8(a1, 65, v21);
    sub_1000063D8(a1, 22, v22);
    sub_1000063D8(a1, 66, v23);
    uint64_t v16 = 0LL;
    memset(v15, 0, sizeof(v15));
    uint64_t v9 = sub_100005B58(a1);
    pm_sample_task_and_pid(v9, v2, v15, v4, -28LL);
    *(_OWORD *)((char *)&v15[8] + 4) = v18;
    *(int8x16_t *)((char *)&v15[9] + 4) = vextq_s8(v19, v19, 8uLL);
    *(_OWORD *)((char *)&v15[19] + 8) = v25;
    *((void *)&v15[20] + 1) = v20;
    double v10 = pm_energy_impact(v15);
    if (sub_100005B50(a1))
    {
      double v11 = v10 * 1000000000.0;
      sub_1000063D8(a1, 60, (unint64_t)v11);
      unint64_t v12 = sub_1000049CC(v5);
      sub_100006420(a1, 62, (double)(unint64_t)v11 * 100.0 / (double)v12);
    }

    else
    {
      sub_1000063D8(a1, 60, 0LL);
    }

    xpc_object_t v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
    sub_1000062F8(a1, 64, (uint64_t)v13);
    xpc_release(v13);
    sub_1000063D8(a1, 72, v25);
    sub_1000063D8(a1, 73, *((uint64_t *)&v25 + 1));
  }

  return v3 == 0;
}

BOOL sub_100004D60(uint64_t a1)
{
  int v2 = sub_100005B50(a1);
  int v3 = proc_pidinfo(v2, 20, 1uLL, buffer, 40);
  if (v3 == 40) {
    sub_1000063D8(a1, 75, buffer[0]);
  }
  return v3 == 40;
}

void sub_100004DC0(id a1)
{
  kern_return_t v1;
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;
  v1 = mach_timebase_info(&info);
  if (v1)
  {
    _os_assumes_log(v1);
  }

  else
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&qword_10000CAF0 = (double)v2;
    *(double *)&qword_10000CAF8 = (double)v3;
  }

void *sub_100004E0C(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_100005E64();
  xpc_object_t v5 = xpc_retain(a1);
  v4[2] = v5;
  size_t v6 = sub_1000060CC(v5);
  v4[3] = v6;
  v4[4] = calloc(v6, 8uLL);
  v4[5] = a2;
  sub_1000063D8((uint64_t)v4, 1, a2);
  return v4;
}

xpc_object_t sub_100004E70(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0LL, 0LL);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 0x40000000LL;
  __int128 v25 = sub_10000504C;
  uint64_t v26 = &unk_100008520;
  uint64_t v27 = a1;
  xpc_object_t v28 = v2;
  unsigned int v3 = proc_listpids(1u, 0, 0LL, 0);
  if ((v3 & 0x80000000) == 0)
  {
    unint64_t v4 = v3;
    xpc_object_t v5 = malloc(v3);
    if (v5)
    {
      size_t v6 = v5;
      while (1)
      {
        unsigned int v7 = proc_listpids(1u, 0, v6, v4);
        if ((v7 & 0x80000000) != 0)
        {
          uint64_t v9 = (uint64_t *)v6;
          goto LABEL_26;
        }

        unsigned int v8 = v7;
        if (v4 >= v7 + 4) {
          break;
        }
        v4 += 64LL;
        size_t v6 = reallocf(v6, v4);
        if (!v6) {
          return v2;
        }
      }

      unint64_t v10 = v7 >> 2;
      double v11 = (uint64_t *)malloc(8 * v10);
      unint64_t v12 = v11;
      if (v8 >= 4)
      {
        if (v10 <= 1) {
          uint64_t v13 = 1LL;
        }
        else {
          uint64_t v13 = v8 >> 2;
        }
        int v14 = (int *)v6;
        int v15 = v11;
        do
        {
          int v16 = *v14++;
          int v17 = proc_pidinfo(v16, 20, 1uLL, buffer, 40);
          uint64_t v18 = buffer[0];
          if (v17 != 40) {
            uint64_t v18 = 1LL;
          }
          *v15++ = v18;
          --v13;
        }

        while (v13);
      }

      free(v6);
      qsort_b(v12, v8 >> 2, 8uLL, &stru_100008560);
      if (*v12 != 1) {
        sub_1000074B0();
      }
      sub_10000504C((uint64_t)v24, 1uLL);
      if (v8 >= 8)
      {
        uint64_t v19 = 2LL;
        if (v10 > 2) {
          uint64_t v19 = v8 >> 2;
        }
        uint64_t v20 = v19 - 1;
        uint64_t v21 = v12 + 1;
        uint64_t v22 = 1LL;
        do
        {
          if (*v21 != v22)
          {
            ((void (*)(void *))v25)(v24);
            uint64_t v22 = *v21;
          }

          ++v21;
          --v20;
        }

        while (v20);
      }

      uint64_t v9 = v12;
LABEL_26:
      free(v9);
    }
  }

  return v2;
}

void sub_10000504C(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = sub_100004E0C(*(void **)(a1 + 32), a2);
  uint64_t v7 = 0LL;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  unint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_10000511C;
  v6[3] = &unk_100008500;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100006034(v4, (uint64_t)v6);
  if (!*((_BYTE *)v8 + 24))
  {
    xpc_object_t v5 = sub_100006228((uint64_t)v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }

  j___os_object_release(v3);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_10000511C(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0LL;
  while (1)
  {
    if (dword_100008438[v4] == a2)
    {
      result = sub_1000062B8(*(void *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        result = (*(uint64_t (**)(void))&dword_100008438[v4 + 2])(*(void *)(v3 + 40));
        if ((result & 1) == 0) {
          break;
        }
      }
    }

    v4 += 4LL;
    if (v4 == 48) {
      return result;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = 1;
  return result;
}

BOOL sub_1000051A0(uint64_t a1)
{
  int v2 = coalition_info_resource_usage(*(void *)(a1 + 40), value, 352LL);
  if (!v2)
  {
    sub_1000063D8(a1, 2, value[0]);
    sub_1000063D8(a1, 3, value[1]);
    sub_1000063D8(a1, 4, value[2]);
    sub_1000063D8(a1, 5, v6);
    sub_1000063D8(a1, 6, v7[0]);
    sub_1000063D8(a1, 7, v7[1]);
    sub_1000063D8(a1, 8, v8[0]);
    sub_1000063D8(a1, 9, v8[1]);
    uint64_t v30 = 0LL;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v22 = 0LL;
    *(_OWORD *)&v23[8] = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    int v12 = 0;
    *(_OWORD *)&v13[12] = 0u;
    __int128 v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v7;
    __int128 v26 = v9;
    *(void *)((char *)&v11 + 4) = v6;
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v8;
    double v3 = pm_energy_impact(v10);
    if (*(void *)(a1 + 40) == 1LL) {
      double v3 = 0.0;
    }
    sub_100006420(a1, 12, v3);
  }

  return v2 == 0;
}

uint64_t sub_100005320(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1LL)
  {
    sub_1000064AC(a1, 13, "com.apple.system");
    sub_1000064AC(a1, 14, "com.apple.system");
    return 1LL;
  }

  uint64_t result = xpc_coalition_copy_info();
  if (result)
  {
    double v3 = (void *)result;
    if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_NAME);
      if (string) {
        sub_1000064AC(a1, 13, string);
      }
      xpc_object_t v5 = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
      if (v5) {
        sub_1000064AC(a1, 14, v5);
      }
      xpc_release(v3);
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

int sub_1000053F8(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 > *(void *)a3;
  }
}

BOOL sub_100005410(uint64_t a1)
{
  kern_return_t v3;
  integer_t task_info_out[8];
  uint64_t v6;
  uint64_t v7;
  mach_msg_type_number_t task_info_outCnt;
  task_name_t v2 = sub_100005B58(a1);
  task_info_outCnt = 12;
  double v3 = task_info(v2, 0x15u, task_info_out, &task_info_outCnt);
  if (!v3)
  {
    sub_1000063D8(a1, 48, v6);
    sub_1000063D8(a1, 49, v7);
  }

  return v3 == 0;
}

uint64_t sub_100005480(uint64_t a1)
{
  if (sub_100005B50(a1))
  {
    ipc_space_inspect_t v2 = sub_100005B58(a1);
    if (!mach_port_space_basic_info(v2, &basic_info)) {
      sub_1000063D8(a1, 50, basic_info.iisb_table_inuse);
    }
  }

  return 1LL;
}

BOOL sub_1000054D4(uint64_t a1)
{
  kern_return_t v3;
  int64_t value;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt;
  task_t v2 = sub_100005B58(a1);
  get_default = 0;
  policy_infoCnt = 2;
  double v3 = task_policy_get(v2, 8u, (task_policy_t)&value, &policy_infoCnt, &get_default);
  if (!v3)
  {
    sub_100006390(a1, 57, (int)value);
    sub_100006390(a1, 58, SHIDWORD(value));
  }

  return v3 == 0;
}

BOOL sub_100005548(uint64_t a1)
{
  kern_return_t v3;
  integer_t task_info_out[12];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t value;
  uint64_t v10;
  mach_msg_type_number_t task_info_outCnt;
  task_name_t v2 = sub_100005B58(a1);
  task_info_outCnt = 93;
  double v3 = task_info(v2, 0x17u, task_info_out, &task_info_outCnt);
  if (!v3)
  {
    sub_1000063D8(a1, 59, value);
    sub_1000063D8(a1, 67, v10 + v6 - v8);
    sub_1000063D8(a1, 68, v7);
    sub_1000063D8(a1, 74, v10);
  }

  return v3 == 0;
}

uint64_t sub_1000055F0(uint64_t a1)
{
  *(void *)__int128 v15 = 0x3100000001LL;
  int v16 = sub_100005B50(a1);
  if (sub_100005B50(a1))
  {
    if (qword_10000CDC8 != -1) {
      dispatch_once(&qword_10000CDC8, &stru_1000085A0);
    }
    size_t v14 = dword_10000CDD0;
    task_name_t v2 = (char *)malloc(dword_10000CDD0);
    if (sysctl(v15, 3u, v2, &v14, 0LL, 0LL)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v14 >= 4;
    }
    if (!v3)
    {
      free(v2);
      return 0LL;
    }

    unint64_t v6 = *(unsigned int *)v2;
    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    size_t v8 = v14 - 4;
    if (v14 != 4)
    {
      unint64_t v9 = 0LL;
      int v10 = 0;
      __int128 v11 = v2 + 4;
      do
      {
        int v12 = v10;
        int v10 = *v11;
        if (*v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13 && memchr(v11, 0, v8))
        {
          if (v9)
          {
            if (v9 <= v6) {
              xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, v11);
            }
          }

          else
          {
            sub_1000064AC(a1, 43, v11);
          }

          ++v9;
          int v10 = *v11;
        }

        ++v11;
        --v8;
      }

      while (v8);
    }

    sub_1000062F8(a1, 44, (uint64_t)v7);
    xpc_release(v7);
    free(v2);
  }

  else
  {
    xpc_object_t v5 = xpc_array_create(0LL, 0LL);
    xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "kernel_task");
    sub_1000062F8(a1, 44, (uint64_t)v5);
    xpc_release(v5);
  }

  return 1LL;
}

void sub_1000057E8(id a1)
{
  size_t v1 = 4LL;
  if (sysctlbyname("kern.argmax", &dword_10000CDD0, &v1, 0LL, 0LL)) {
    dword_10000CDD0 = 0x40000;
  }
}

xpc_object_t sub_100005838(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0LL, 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  size_t v14 = sub_100005984;
  __int128 v15 = &unk_100008AA8;
  uint64_t v16 = a1;
  xpc_object_t v17 = v2;
  unsigned int v3 = proc_listpids(1u, 0, 0LL, 0);
  if ((v3 & 0x80000000) == 0)
  {
    unint64_t v4 = v3;
    xpc_object_t v5 = (char *)malloc(v3);
    if (v5)
    {
      unint64_t v6 = v5;
      while (1)
      {
        unsigned int v7 = proc_listpids(1u, 0, v6, v4);
        unsigned int v8 = v7;
        if ((v7 & 0x80000000) != 0)
        {
LABEL_7:
          qsort_b(v6, (unint64_t)(int)v8 >> 2, 4uLL, &stru_100008AE8);
          goto LABEL_11;
        }

        if (v4 >= v7 + 4) {
          break;
        }
        v4 += 64LL;
        unint64_t v6 = (char *)reallocf(v6, v4);
        if (!v6) {
          goto LABEL_7;
        }
      }

      size_t v9 = v7 >> 2;
      qsort_b(v6, v9, 4uLL, &stru_100008AE8);
      if (v8 >= 4)
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = 4 * v9;
        do
        {
          v14((uint64_t)v13, *(_DWORD *)&v6[v10]);
          v10 += 4LL;
        }

        while (v11 != v10);
      }

LABEL_11:
      free(v6);
    }
  }

  return v2;
}

void sub_100005984(uint64_t a1, int a2)
{
  uint64_t v3 = sub_100005AE8(*(void **)(a1 + 32), a2);
  uint64_t v7 = 0LL;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  unint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_100005A54;
  v6[3] = &unk_100008A88;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100006034(v4, (uint64_t)v6);
  if (!*((_BYTE *)v8 + 24))
  {
    xpc_object_t v5 = sub_100006228(v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }

  j___os_object_release(v3);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_100005A54(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0LL;
  while (1)
  {
    if (dword_1000085C0[v4] == a2)
    {
      uint64_t result = sub_1000062B8(*(void *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        uint64_t result = (*(uint64_t (**)(void))&dword_1000085C0[v4 + 2])(*(void *)(v3 + 40));
        if ((result & 1) == 0) {
          break;
        }
      }
    }

    v4 += 4LL;
    if (v4 == 304) {
      return result;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = 1;
  return result;
}

int sub_100005AD8(id a1, const void *a2, const void *a3)
{
  return *(_DWORD *)a2 - *(_DWORD *)a3;
}

uint64_t sub_100005AE8(void *a1, int a2)
{
  uint64_t v4 = sub_100005E24();
  xpc_object_t v5 = xpc_retain(a1);
  *(void *)(v4 + 16) = v5;
  size_t v6 = sub_1000060CC(v5);
  *(void *)(v4 + 24) = v6;
  *(void *)(v4 + 32) = calloc(v6, 8uLL);
  *(_DWORD *)(v4 + 40) = a2;
  *(_DWORD *)(v4 + 44) = 0;
  sub_1000063D8(v4, 4, a2);
  return v4;
}

uint64_t sub_100005B50(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_100005B58(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 44);
  if (!(_DWORD)result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if ((_DWORD)v3)
    {
    }

    else if (task_name_for_pid(mach_task_self_, 0, &tn))
    {
      return *(unsigned int *)(a1 + 44);
    }

    uint64_t result = tn;
    *(_DWORD *)(a1 + 44) = tn;
  }

  return result;
}

uint64_t sub_100005BBC(void *a1)
{
  uint64_t v2 = sub_100005E84();
  *(void *)(v2 + 16) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_TYPE);
  xpc_object_t value = xpc_dictionary_get_value(a1, SYSMON_XPC_KEY_ATTRIBUTES);
  *(void *)(v2 + 24) = value;
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_data)
  {
    xpc_retain(*(xpc_object_t *)(v2 + 24));
    *(void *)(v2 + 32) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_FLAGS);
  }

  else
  {
    _os_assumes_log(0LL);
    *(void *)(v2 + 24) = 0LL;
    j___os_object_release(v2);
    return 0LL;
  }

  return v2;
}

xpc_object_t sub_100005C68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  size_t v1 = *(void **)(a1 + 24);
  size_t length = xpc_data_get_length(v1);
  uint64_t v4 = malloc(length);
  if (xpc_data_get_bytes(v1, v4, 0LL, length) != length) {
    _os_assumes_log(0LL);
  }
  if (v2 == 3)
  {
    size_t v6 = v4 + 1;
    char v7 = v4[1];
    if ((v7 & 4) != 0) {
      *v4 |= 0x22u;
    }
    if ((v7 & 8) != 0)
    {
      *v4 |= 2u;
      goto LABEL_13;
    }
  }

  else if (v2 == 1)
  {
    char v5 = v4[6];
    if ((v5 & 8) != 0)
    {
      *v4 |= 0x10u;
      v4[2] |= 0x80u;
      v4[3] |= 1u;
    }

    if ((v5 & 0x10) != 0)
    {
      *v4 |= 0x10u;
      size_t v6 = v4 + 7;
      char v7 = v4[7];
LABEL_13:
      *size_t v6 = v7 | 0x10;
    }
  }

  xpc_object_t v8 = xpc_data_create(v4, length);
  free(v4);
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_HEADER, v8);
  switch(v2)
  {
    case 3LL:
      xpc_object_t v10 = sub_100004E70((uint64_t)v8);
      break;
    case 2LL:
      xpc_object_t v10 = sub_1000064F4(v8);
      break;
    case 1LL:
      xpc_object_t v10 = sub_100005838((uint64_t)v8);
      break;
    default:
      goto LABEL_22;
  }

  uint64_t v11 = v10;
  if (v10)
  {
    xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TABLE, v10);
    xpc_release(v11);
  }

LABEL_22:
  xpc_object_t v12 = xpc_date_create_from_current();
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TIMESTAMP, v12);
  xpc_release(v12);
  xpc_release(v8);
  return v9;
}

uint64_t sub_100005E24()
{
  uint64_t v0 = objc_opt_class(&OBJC_CLASS___OS_sysmond_process);
  return _os_object_alloc(v0, 48LL);
}

uint64_t sub_100005E44()
{
  uint64_t v0 = objc_opt_class(&OBJC_CLASS___OS_sysmond_system);
  return _os_object_alloc(v0, 48LL);
}

uint64_t sub_100005E64()
{
  uint64_t v0 = objc_opt_class(&OBJC_CLASS___OS_sysmond_coalition);
  return _os_object_alloc(v0, 48LL);
}

uint64_t sub_100005E84()
{
  uint64_t v0 = objc_opt_class(&OBJC_CLASS___OS_sysmond_request);
  return _os_object_alloc(v0, 40LL);
}

size_t sub_100006034(void *a1, uint64_t a2)
{
  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  size_t result = xpc_data_get_length(a1);
  if (result)
  {
    size_t v6 = result;
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      unsigned int v8 = bytes_ptr[i];
      if (bytes_ptr[i])
      {
        do
        {
          unsigned int v9 = __clz(__rbit32(v8));
          v8 &= ~(1 << v9);
          size_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, (8 * (_DWORD)i) | v9);
        }

        while ((_BYTE)v8);
      }
    }
  }

  return result;
}

uint64_t sub_1000060CC(void *a1)
{
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  for (uint64_t i = 0LL; length; --length)
  {
    unsigned int v5 = *bytes_ptr++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    i += v6.u32[0];
  }

  return i;
}

uint64_t sub_100006124(void *a1, int a2)
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2000000000LL;
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = -1LL;
  v10[3] = -1LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_1000061D0;
  v4[3] = &unk_100008B10;
  int v5 = a2;
  v4[4] = v10;
  v4[5] = &v6;
  sub_100006034(a1, (uint64_t)v4);
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t sub_1000061D0(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 48) == a2)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 40) + 8LL);
    if (*(void *)(v2 + 24) != -1LL) {
      sub_1000074B0();
    }
    *(void *)(v2 + 24) = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  }

  return result;
}

xpc_object_t sub_100006228(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    for (size_t i = 0LL; i < v2; ++i)
    {
      if (!*(void *)(*(void *)(a1 + 32) + 8 * i))
      {
        xpc_object_t v4 = xpc_null_create();
        size_t v2 = *(void *)(a1 + 24);
        *(void *)(*(void *)(a1 + 32) + 8 * i) = v4;
      }
    }
  }

  xpc_object_t v5 = xpc_array_create(*(xpc_object_t **)(a1 + 32), v2);
  if (*(void *)(a1 + 24))
  {
    unint64_t v6 = 0LL;
    do
    {
      xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 8 * v6));
      unint64_t v7 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 32) + 8 * v6++) = 0LL;
    }

    while (v6 < v7);
  }

  return v5;
}

BOOL sub_1000062B8(uint64_t a1, int a2)
{
  uint64_t v3 = sub_100006124(*(void **)(a1 + 16), a2);
  return (v3 & 0x8000000000000000LL) == 0 && *(void *)(*(void *)(a1 + 32) + 8 * v3) != 0LL;
}

uint64_t sub_1000062F8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = sub_100006124(*(void **)(a1 + 16), a2);
  if ((result & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(void *)(v6 + 8 * result))
    {
      *(void *)(v6 + 8 * result) = a3;
      return (uint64_t)xpc_retain(*(xpc_object_t *)(*(void *)(a1 + 32) + 8 * result));
    }
  }

  return result;
}

void sub_100006348(uint64_t a1, int a2, BOOL value)
{
  xpc_object_t v5 = xpc_BOOL_create(value);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_100006390(uint64_t a1, int a2, int64_t value)
{
  xpc_object_t v5 = xpc_int64_create(value);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_1000063D8(uint64_t a1, int a2, uint64_t value)
{
  xpc_object_t v5 = xpc_uint64_create(value);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_100006420(uint64_t a1, int a2, double a3)
{
  xpc_object_t v5 = xpc_double_create(a3);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_100006464(uint64_t a1, int a2, int64_t interval)
{
  xpc_object_t v5 = xpc_date_create(interval);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_1000064AC(uint64_t a1, int a2, char *string)
{
  xpc_object_t v5 = xpc_string_create(string);
  sub_1000062F8(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

xpc_object_t sub_1000064F4(void *a1)
{
  xpc_object_t v2 = xpc_array_create(0LL, 0LL);
  uint64_t v3 = sub_1000065A8(a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_1000065F4;
  v6[3] = &unk_100008D70;
  v6[4] = v3;
  sub_100006034(a1, (uint64_t)v6);
  xpc_object_t v4 = sub_100006228(v3);
  xpc_array_set_value(v2, 0xFFFFFFFFFFFFFFFFLL, v4);
  xpc_release(v4);
  j___os_object_release(v3);
  return v2;
}

uint64_t sub_1000065A8(void *a1)
{
  uint64_t v2 = sub_100005E44();
  xpc_object_t v3 = xpc_retain(a1);
  *(void *)(v2 + 16) = v3;
  size_t v4 = sub_1000060CC(v3);
  *(void *)(v2 + 24) = v4;
  *(void *)(v2 + 32) = calloc(v4, 8uLL);
  *(_DWORD *)(v2 + 40) = 0;
  return v2;
}

uint64_t sub_1000065F4(uint64_t result, int a2)
{
  uint64_t v3 = result;
  for (uint64_t i = 0LL; i != 144; i += 4LL)
  {
    if (dword_100008B30[i] == a2)
    {
      uint64_t result = sub_1000062B8(*(void *)(v3 + 32), a2);
      if ((result & 1) == 0) {
        uint64_t result = (*(uint64_t (**)(void))&dword_100008B30[i + 2])(*(void *)(v3 + 32));
      }
    }
  }

  return result;
}

uint64_t sub_100006660(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 40);
  if (!(_DWORD)result)
  {
    uint64_t result = mach_host_self();
    *(_DWORD *)(a1 + 40) = result;
  }

  return result;
}

BOOL sub_10000668C(uint64_t a1)
{
  kern_return_t v3;
  uint64_t v4;
  integer_t v6;
  unsigned int value;
  unsigned int value_4;
  _DWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  mach_msg_type_number_t host_info64_outCnt;
  host_t v2 = sub_100006660(a1);
  host_info64_outCnt = 38;
  uint64_t v3 = host_statistics64(v2, 4, &v6, &host_info64_outCnt);
  if (!v3)
  {
    sub_1000063D8(a1, 1, v6 - v19);
    sub_1000063D8(a1, 2, value);
    sub_1000063D8(a1, 3, value_4);
    sub_1000063D8(a1, 4, v9[0]);
    sub_1000063D8(a1, 5, *(uint64_t *)&v9[1]);
    sub_1000063D8(a1, 6, v10);
    sub_1000063D8(a1, 7, v11);
    sub_1000063D8(a1, 8, v12);
    sub_1000063D8(a1, 9, v13);
    sub_1000063D8(a1, 10, v14);
    sub_1000063D8(a1, 11, v15);
    sub_1000063D8(a1, 12, v16);
    sub_1000063D8(a1, 13, v17);
    sub_1000063D8(a1, 14, v18);
    sub_1000063D8(a1, 15, v19);
    sub_1000063D8(a1, 16, v20);
    sub_1000063D8(a1, 17, v21);
    sub_1000063D8(a1, 18, v22);
    sub_1000063D8(a1, 19, v23);
    sub_1000063D8(a1, 20, v24);
    sub_1000063D8(a1, 21, v25);
    sub_1000063D8(a1, 33, v26);
    sub_1000063D8(a1, 34, v27);
    sub_1000063D8(a1, 35, v28);
    if (qword_10000CDE0 != -1) {
      dispatch_once(&qword_10000CDE0, &stru_100008DB0);
    }
    size_t v4 = qword_10000CDD8;
    sub_1000063D8(a1, 36, qword_10000CDD8);
    sub_1000063D8(a1, 37, v28 + v4);
    sub_1000063D8(a1, 38, v4 - (v6 - v19));
  }

  return v3 == 0;
}

uint64_t sub_1000068DC(uint64_t a1)
{
  kern_return_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  integer_t info_out[4];
  mach_msg_type_number_t processor_setsCnt;
  processor_set_name_array_t processor_sets;
  host_priv_t v2 = sub_100006660(a1);
  uint64_t v3 = host_processor_sets(v2, &processor_sets, &processor_setsCnt);
  if (v3)
  {
LABEL_13:
    _os_assumes_log(v3);
    return 0LL;
  }

  if (processor_setsCnt)
  {
    size_t v4 = 0LL;
    xpc_object_t v5 = 0LL;
    while (1)
    {
      xpc_object_t v10 = 4;
      uint64_t v3 = processor_set_statistics(processor_sets[v4], 4, info_out, &v10);
      if (v3) {
        goto LABEL_13;
      }
      uint64_t v6 = info_out[1];
      unint64_t v7 = mach_port_deallocate(mach_task_self_, processor_sets[v4]);
      if (v7) {
        _os_assumes_log(v7);
      }
      v5 += v6;
    }
  }

  xpc_object_t v5 = 0LL;
LABEL_10:
  sub_1000063D8(a1, 24, v5);
  uint64_t v8 = mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)processor_sets, 4LL * processor_setsCnt);
  if (v8) {
    _os_assumes_log(v8);
  }
  return 1LL;
}

void sub_1000069E8(id a1)
{
  size_t v1 = 8LL;
  sysctlbyname("hw.memsize", &qword_10000CDD8, &v1, 0LL, 0LL);
  qword_10000CDD8 /= vm_kernel_page_size;
}

void sub_100006A4C(int a1, void *a2)
{
}

uint64_t sub_100006A54(void *context)
{
  if (qword_10000CDF0 != -1) {
    dispatch_once(&qword_10000CDF0, &stru_100008E18);
  }
  dispatch_sync_f((dispatch_queue_t)qword_10000CDF8, context, (dispatch_function_t)sub_100006B18);
  return 1LL;
}

void sub_100006AB4(id a1)
{
  qword_10000CDF8 = (uint64_t)dispatch_queue_create("process_get_libtop_memory mutex", 0LL);
  *(_OWORD *)&v1.version = xmmword_100008DD0;
  *(_OWORD *)&v1.release = *(_OWORD *)&off_100008DE0;
  v1.equal = 0LL;
  qword_10000CDE8 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, 0LL, &v1);
}

void sub_100006B18(uint64_t a1)
{
  uint64_t v1 = a1;
  int v2 = sub_100005B50(a1);
  vm_map_read_t v3 = sub_100005B58(v1);
  size_t v4 = (char *)calloc(1uLL, 0x4C0uLL);
  *((_DWORD *)v4 + 1) = v2;
  xpc_object_t v5 = (int *)(v4 + 936);
  *((_DWORD *)v4 + 234) = 0;
  uint64_t v6 = qword_10000CE30;
  if (!qword_10000CE30)
  {
    qword_10000CE30 = 12LL;
    if (sysctlnametomib("sysctl.proc_cputype", dword_10000CE00, (size_t *)&qword_10000CE30))
    {
      qword_10000CE30 = 0LL;
      goto LABEL_9;
    }

    uint64_t v6 = qword_10000CE30;
    if (!qword_10000CE30) {
      goto LABEL_3;
    }
  }

  dword_10000CE00[v6] = v2;
  v42[0] = 4LL;
  if (!sysctl(dword_10000CE00, v6 + 1, v5, v42, 0LL, 0LL))
  {
LABEL_3:
    vm_size_t v7 = vm_kernel_page_size;
    *((_DWORD *)v4 + 302) = 0;
    address[0] = 0LL;
    mach_msg_type_number_t infoCnt = 5;
    if (mach_vm_region(v3, address, &size, 12, &info, &infoCnt, &object_name))
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      int v11 = 0;
      uint64_t v39 = 0LL;
LABEL_5:
      uint64_t v12 = v36 + v8;
      *((void *)v4 + 4) = v36 + v8;
      *((void *)v4 + 5) = v9;
      *((void *)v4 + 6) = v10;
      *((void *)v4 + 7) = v39;
      *((void *)v4 + 8) = v37;
      *((_DWORD *)v4 + 18) = v11;
      *((_DWORD *)v4 + 19) = 0;
LABEL_6:
      sub_1000063D8(v1, 53, v12);
      sub_1000063D8(v1, 54, *((void *)v4 + 6));
      goto LABEL_9;
    }

    int v11 = 0;
    vm_size_t v38 = v7;
    uint64_t v39 = 0LL;
    uint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v33 = v1;
    while (1)
    {
      int v13 = *v5;
      if (*v5 <= 16777222)
      {
        if (v13 == 7) {
          goto LABEL_21;
        }
        if (v13 != 12)
        {
          if (v13 != 18) {
            goto LABEL_72;
          }
LABEL_21:
          uint64_t v14 = 0x20000000LL;
          mach_vm_address_t v15 = 2415919104LL;
          goto LABEL_28;
        }

        uint64_t v14 = 0x40000000LL;
        mach_vm_address_t v15 = 0x40000000LL;
      }

      else if (v13 > 16777233)
      {
        if (v13 == 16777234)
        {
          mach_vm_address_t v15 = 0x7FFF60000000LL;
          uint64_t v14 = 2684354560LL;
        }

        else
        {
          if (v13 != 33554444) {
LABEL_72:
          }
            sub_1000074C8(v13);
          uint64_t v14 = 2281701376LL;
          mach_vm_address_t v15 = 436207616LL;
        }
      }

      else if (v13 == 16777223)
      {
        mach_vm_address_t v15 = 0x7FF800000000LL;
        uint64_t v14 = 0x7FE000000LL;
      }

      else
      {
        if (v13 != 16777228) {
          goto LABEL_72;
        }
        uint64_t v14 = 0x180000000LL;
        mach_vm_address_t v15 = 0x180000000LL;
      }

LABEL_28:
      mach_vm_address_t v16 = v15 + v14;
      int v17 = v50;
      if (v15 <= address[0] && v16 > address[0])
      {
        v39 += v7 * v48;
        if (!*((_DWORD *)v4 + 302) && v50 == 3)
        {
          mach_vm_address_t v41 = address[0];
          mach_vm_size_t v40 = size;
          mach_msg_type_number_t infoCnt = 9;
          if (mach_vm_region(v3, &v41, &v40, 10, (vm_region_info_t)v42, &infoCnt, &object_name)) {
            goto LABEL_5;
          }
          if (v43) {
            *((_DWORD *)v4 + 302) = 1;
          }
          int v17 = v50;
        }

        if (v17 != 2) {
          goto LABEL_49;
        }
        ++v11;
LABEL_47:
        vm_size_t v7 = v38;
        v8 += (v49 + (unint64_t)v48) * v38;
        goto LABEL_48;
      }

      ++v11;
      int v19 = v47;
      if (v50 == 1 && v47 == 1) {
        goto LABEL_47;
      }
      switch(v50)
      {
        case 1u:
        case 4u:
          int v20 = *((_DWORD *)v4 + 1);
          if (v20)
          {
            uint64_t v35 = v10;
            unint64_t v21 = info;
            unsigned int v32 = v49;
            mach_vm_size_t v34 = size;
            Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000CDE8, (const void *)info);
            if (Value)
            {
              uint64_t v23 = Value;
              if (*(_DWORD *)Value == v20)
              {
                uint64_t v1 = v33;
                Value[1] += v34;
                unsigned int v24 = *((_DWORD *)Value + 7) + 1;
                *((_DWORD *)Value + 7) = v24;
                xpc_object_t v5 = (int *)(v4 + 936);
                vm_size_t v7 = v38;
                goto LABEL_59;
              }

              *(_DWORD *)Value = v20;
              Value[1] += v34;
              unsigned int v24 = 1;
              *((_DWORD *)Value + 7) = 1;
            }

            else
            {
              __int128 v25 = malloc(0x40uLL);
              if (!v25)
              {
                uint64_t v12 = *((void *)v4 + 4);
                uint64_t v1 = v33;
                goto LABEL_6;
              }

              uint64_t v23 = v25;
              *__int128 v25 = v20;
              v25[1] = v21;
              *((void *)v25 + 1) = v34;
              v25[4] = v17;
              v25[5] = v32;
              v25[6] = v19;
              v25[7] = 1;
              CFDictionarySetValue((CFMutableDictionaryRef)qword_10000CDE8, (const void *)v21, v25);
              unsigned int v24 = v23[7];
            }

            uint64_t v1 = v33;
            vm_size_t v7 = v38;
            v23[8] = 3;
            *((void *)v23 + 6) = 0LL;
            *((void *)v23 + 7) = 0LL;
            *((void *)v23 + 5) = 0LL;
            xpc_object_t v5 = (int *)(v4 + 936);
LABEL_59:
            if (v24 >= 2)
            {
              int v26 = v23[8];
              if (v26 != 3) {
                v23[4] = v26;
              }
              v9 -= *((void *)v23 + 6);
              v35 -= *((void *)v23 + 7);
              v36 -= *((void *)v23 + 5);
            }

            v23[8] = 3;
            *((void *)v23 + 6) = 0LL;
            *((void *)v23 + 7) = 0LL;
            *((void *)v23 + 5) = 0LL;
            int v27 = v23[4];
            if (v27 == 6)
            {
LABEL_67:
              uint64_t v10 = v35;
            }

            else
            {
              if (v27 == 4 && v23[6] == v24)
              {
                v23[8] = 4;
                v23[4] = 6;
                vm_size_t v28 = v7 * v23[5];
                v36 += v28;
                uint64_t v29 = *((void *)v23 + 1);
                *((void *)v23 + 5) = v28;
                *((void *)v23 + 6) = v29;
                v9 += v29;
                goto LABEL_67;
              }

              vm_size_t v30 = v7 * v23[5];
              *((void *)v23 + 7) = v30;
              uint64_t v10 = v30 + v35;
            }

            if (v50 == 1)
            {
              vm_size_t v31 = v7 * v48;
              v8 += v31;
              v9 += v31;
            }

            goto LABEL_49;
          }

          xpc_object_t v5 = (int *)(v4 + 936);
          if (v50 != 1)
          {
LABEL_54:
            vm_size_t v7 = v38;
            goto LABEL_49;
          }

          vm_size_t v7 = v38;
          v8 += v38 * v48;
          break;
        case 2u:
        case 8u:
          goto LABEL_47;
        case 3u:
          v37 += size;
          goto LABEL_54;
        default:
          sub_1000074F8();
      }

LABEL_48:
      v9 += size;
LABEL_49:
      address[0] += size;
      mach_msg_type_number_t infoCnt = 5;
      if (mach_vm_region(v3, address, &size, 12, &info, &infoCnt, &object_name)) {
        goto LABEL_5;
      }
    }
  }

LABEL_9:
  free(v4);
}

uint64_t sub_1000070B4(uint64_t a1)
{
  if (sysctl(dword_10000CDA0, 6u, 0LL, &__size, 0LL, 0LL) < 0) {
    return 0LL;
  }
  int v2 = (unsigned __int16 *)malloc(__size);
  if (!v2) {
    sub_1000074B0();
  }
  vm_map_read_t v3 = v2;
  if (sysctl(dword_10000CDA0, 6u, v2, &__size, 0LL, 0LL) < 0)
  {
    free(v3);
    return 0LL;
  }

  if (v3 >= (unsigned __int16 *)((char *)v3 + __size))
  {
    uint64_t v7 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = v3;
    do
    {
      if (*((_BYTE *)v8 + 3) == 18)
      {
        v6 += *((void *)v8 + 9);
        v4 += *((void *)v8 + 7);
        v7 += *((void *)v8 + 13);
        v5 += *((void *)v8 + 12);
      }

      uint64_t v8 = (unsigned __int16 *)((char *)v8 + *v8);
    }

    while (v8 < (unsigned __int16 *)((char *)v3 + __size));
  }

  free(v3);
  sub_1000063D8(a1, 29, v4);
  sub_1000063D8(a1, 31, v6);
  sub_1000063D8(a1, 30, v5);
  sub_1000063D8(a1, 32, v7);
  return 1LL;
}

BOOL sub_100007210(uint64_t a1)
{
  kern_return_t MatchingServices;
  kern_return_t v4;
  io_object_t v5;
  io_registry_entry_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  kern_return_t v11;
  CFDictionaryRef Value;
  CFDictionaryRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  uint64_t v19;
  uint64_t valuePtr;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  int v2 = IOServiceMatching("IOBlockStorageDriver");
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing);
  uint64_t v4 = MatchingServices;
  if (MatchingServices)
  {
    _os_assumes_log(MatchingServices);
  }

  else
  {
    int v19 = a1;
    uint64_t v5 = IOIteratorNext(existing);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      do
      {
        valuePtr = 0LL;
        properties = 0LL;
        int v11 = IORegistryEntryCreateCFProperties(v6, &properties, kCFAllocatorDefault, 0);
        if (v11)
        {
          _os_assumes_log(v11);
        }

        else if (properties)
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Statistics");
          if (Value)
          {
            int v13 = Value;
            uint64_t v14 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Operations (Read)");
            if (v14)
            {
              CFNumberGetValue(v14, kCFNumberSInt64Type, &valuePtr);
              v7 += valuePtr;
            }

            mach_vm_address_t v15 = (const __CFNumber *)CFDictionaryGetValue(v13, @"Bytes (Read)");
            if (v15)
            {
              CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
              v9 += valuePtr;
            }

            mach_vm_address_t v16 = (const __CFNumber *)CFDictionaryGetValue(v13, @"Operations (Write)");
            if (v16)
            {
              CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr);
              v8 += valuePtr;
            }

            int v17 = (const __CFNumber *)CFDictionaryGetValue(v13, @"Bytes (Write)");
            if (v17)
            {
              CFNumberGetValue(v17, kCFNumberSInt64Type, &valuePtr);
              v10 += valuePtr;
            }
          }

          CFRelease(properties);
        }

        IOObjectRelease(v6);
        uint64_t v6 = IOIteratorNext(existing);
      }

      while (v6);
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v7 = 0LL;
    }

    IOIteratorReset(existing);
    IOObjectRelease(existing);
    sub_1000063D8(v19, 27, v9);
    sub_1000063D8(v19, 28, v10);
    sub_1000063D8(v19, 25, v7);
    sub_1000063D8(v19, 26, v8);
    uint64_t v4 = 0;
  }

  return v4 == 0;
}

void sub_100007440( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007478( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000074B0()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_1000074C8(int a1)
{
}

void sub_1000074F8()
{
}