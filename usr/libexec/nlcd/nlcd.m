uint64_t sub_10000196C(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  os_log_s *v6;
  const char *v7;
  os_log_s *v8;
  uint32_t v9;
  os_log_s *v11;
  int v12;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "nlc_simulate";
      v7 = "%s: message too small";
      v8 = v6;
      v9 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v15, v9);
      return 5LL;
    }

    return 5LL;
  }

  if (*a2 != 21)
  {
    *a5 = 108;
    v11 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = *a2;
      v15 = 136315650;
      v16 = "nlc_simulate";
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v11;
      v9 = 24;
      goto LABEL_9;
    }

    return 5LL;
  }

  if (a2[1])
  {
    *a5 = 107;
    return 5LL;
  }

  v14 = sub_100002EEC(a2);
  *a5 = v14;
  if (v14 == 1) {
    return 0LL;
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100001AE4(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      v17 = "nlc_stop_simulation";
      v7 = "%s: message too small";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v16, v9);
      return 5LL;
    }

    return 5LL;
  }

  if (*a2 != 21)
  {
    *a5 = 108;
    v13 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = *a2;
      int v16 = 136315650;
      v17 = "nlc_stop_simulation";
      __int16 v18 = 1024;
      int v19 = v14;
      __int16 v20 = 1024;
      int v21 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v13;
      uint32_t v9 = 24;
      goto LABEL_13;
    }

    return 5LL;
  }

  if (a2[1] != 1)
  {
    *a5 = 107;
LABEL_11:
    v15 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v7 = "Error stopping simulation";
      v8 = v15;
      uint32_t v9 = 2;
      goto LABEL_13;
    }

    return 5LL;
  }

  int v11 = sub_100002DF4();
  uint64_t result = 0LL;
  *a5 = v11;
  if (v11 != 1) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_100001CA4(uint64_t a1, int *a2, unsigned int a3, _OWORD *a4, _DWORD *a5, uint64_t a6, _DWORD *a7)
{
  if (a3 > 7)
  {
    if (*a2 == 21)
    {
      if (a2[1] == 2)
      {
        *a5 = 208;
        a4[11] = 0u;
        a4[12] = 0u;
        a4[9] = 0u;
        a4[10] = 0u;
        a4[7] = 0u;
        a4[8] = 0u;
        a4[5] = 0u;
        a4[6] = 0u;
        a4[3] = 0u;
        a4[4] = 0u;
        a4[1] = 0u;
        a4[2] = 0u;
        *a4 = 0u;
        *(void *)a4 = 0x200000015LL;
        sub_100003074((uint64_t)a4);
        uint64_t result = 0LL;
        *a7 = 1;
        return result;
      }

      *a7 = 107;
      int v16 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        uint32_t v9 = "Error get simulation status";
        v10 = v16;
        uint32_t v11 = 2;
        goto LABEL_11;
      }
    }

    else
    {
      *a7 = 108;
      int v14 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v15 = *a2;
        int v17 = 136315650;
        __int16 v18 = "nlc_get_status";
        __int16 v19 = 1024;
        int v20 = v15;
        __int16 v21 = 1024;
        int v22 = 21;
        uint32_t v9 = "%s: incompatible version %d, should be %d";
        v10 = v14;
        uint32_t v11 = 24;
        goto LABEL_11;
      }
    }
  }

  else
  {
    *a7 = 107;
    v8 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      __int16 v18 = "nlc_get_status";
      uint32_t v9 = "%s: message too small";
      v10 = v8;
      uint32_t v11 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
    }
  }

  return 5LL;
}

double sub_100001E90()
{
  double result = 0.0;
  xmmword_10000C04C = 0u;
  unk_10000C05C = 0u;
  xmmword_10000C02C = 0u;
  unk_10000C03C = 0u;
  xmmword_10000C01C = 0u;
  return result;
}

uint64_t sub_100001EAC(int a1, _DWORD *a2)
{
  uint64_t v3 = 0LL;
  v4 = (int *)&xmmword_10000C01C + 1;
  while (1)
  {
    int v5 = *v4;
    v4 += 2;
    if (!v5) {
      break;
    }
    if (++v3 == 10)
    {
      if (dword_10000C070) {
        return 106LL;
      }
      uint64_t v3 = 10LL;
      break;
    }
  }

  v7 = (_DWORD *)&xmmword_10000C01C + 2 * v3;
  _DWORD *v7 = a1;
  v8 = v7 + 1;
  do
  {
    int v9 = random();
    *a2 = v9;
    _DWORD *v8 = v9;
  }

  while (!v9);
  ++dword_10000C06C;
  return 1LL;
}

uint64_t sub_100001F38(int a1, int a2)
{
  uint64_t v2 = 0LL;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1)
  {
    v2 += 8LL;
    if (v2 == 80) {
      return 103LL;
    }
  }

  return 1LL;
}

uint64_t sub_100001F7C(int a1, int a2)
{
  uint64_t v2 = 0LL;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2)
  {
    v2 += 8LL;
    if (v2 == 80) {
      return 103LL;
    }
  }

  *(void *)((char *)&xmmword_10000C01C + v2) = 0LL;
  --dword_10000C06C;
  return 1LL;
}

uint64_t sub_100001FD4(uint64_t a1, mach_port_name_t *a2, _DWORD *a3, int *a4, _OWORD *a5)
{
  __int128 v8 = a5[1];
  *(_OWORD *)token.val = *a5;
  *(_OWORD *)&token.val[4] = v8;
  CFErrorRef error = 0LL;
  int v9 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  CFTypeRef v10 = SecTaskCopyValueForEntitlement(v9, @"com.apple.private.nlcd-control", &error);
  CFRelease(v9);
  if (!v10) {
    goto LABEL_9;
  }
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFBooleanGetTypeID())
  {
    CFRelease(v10);
    goto LABEL_9;
  }

  int Value = CFBooleanGetValue((CFBooleanRef)v10);
  CFRelease(v10);
  if (!Value)
  {
LABEL_9:
    int v16 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Process not entitled for this action",  (uint8_t *)&token,  2u);
    }

    int v15 = 0;
    uint64_t v14 = 5LL;
    goto LABEL_12;
  }

  if (dword_10000C06C >= 11)
  {
    v13 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "No more connections available to nlcd",  (uint8_t *)&token,  2u);
    }

    uint64_t v14 = 5LL;
    int v15 = 106;
    goto LABEL_12;
  }

  uint64_t v18 = mach_port_allocate(mach_task_self_, 1u, a2);
  if ((_DWORD)v18)
  {
    uint64_t v14 = v18;
    __int16 v19 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Unable to allocate port for client",  (uint8_t *)&token,  2u);
    }

    goto LABEL_24;
  }

  uint64_t inserted = mach_port_insert_right(mach_task_self_, *a2, *a2, 0x14u);
  if ((_DWORD)inserted)
  {
    uint64_t v14 = inserted;
    __int16 v21 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      int v22 = "Insert right failed on client port";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&token, 2u);
      goto LABEL_23;
    }

    goto LABEL_23;
  }

  uint64_t v23 = mach_port_move_member(mach_task_self_, *a2, dword_10000C080);
  if ((_DWORD)v23)
  {
    uint64_t v14 = v23;
    __int16 v21 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      int v22 = "Unable to add client port to portset";
      goto LABEL_22;
    }

LABEL_23:
    mach_port_destroy(mach_task_self_, *a2);
LABEL_24:
    int v15 = 105;
    goto LABEL_12;
  }

  if (mach_port_request_notification(mach_task_self_, *a2, 70, 1u, *a2, 0x15u, token.val))
  {
    v24 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Unable to register for notifications on client port",  v26,  2u);
    }

    mach_port_destroy(mach_task_self_, *a2);
    uint64_t v14 = 5LL;
    goto LABEL_24;
  }

  if (sub_100001EAC(*a2, a3) == 1)
  {
    uint64_t v14 = 0LL;
    int v15 = 1;
  }

  else
  {
    v25 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Unable to create session for client", v26, 2u);
    }

    mach_port_destroy(mach_task_self_, *a2);
    uint64_t v14 = 5LL;
    int v15 = 102;
  }

LABEL_12:
  *a4 = v15;
  return v14;
}

uint64_t sub_100002368(int a1, int a2, int *a3)
{
  uint64_t v4 = 0LL;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v4 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v4) != a1)
  {
    v4 += 8LL;
    if (v4 == 80)
    {
LABEL_10:
      v6 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to disconnect", v9, 2u);
      }

      int v7 = 103;
      goto LABEL_13;
    }
  }

  uint64_t v5 = 0LL;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v5) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v5 + 4) != a2)
  {
    v5 += 8LL;
    if (v5 == 80) {
      goto LABEL_10;
    }
  }

  *(void *)((char *)&xmmword_10000C01C + v5) = 0LL;
  --dword_10000C06C;
  int v7 = 1;
LABEL_13:
  *a3 = v7;
  return 0LL;
}

uint64_t sub_10000245C()
{
  __int128 v8 = 0LL;
  if ((sub_100002510(&v8, &v7) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v0 = 40268;
LABEL_3:
  uint64_t v1 = v0 + 1;
  unint64_t v2 = v7;
  uint64_t v3 = (char *)v8;
  if (v7 >= 0x160)
  {
    while (*(void *)v3 == 0x4000LL)
    {
      if ((_DWORD)v1 == *((_DWORD *)v3 + 2))
      {
        if (v0++ >= 0xFFFF) {
          break;
        }
        goto LABEL_3;
      }

      int v4 = 184 * *((_DWORD *)v3 + 67) + 352;
      v3 += v4;
      v2 -= v4;
      if (v2 < 0x160) {
        break;
      }
    }
  }

  if (v8) {
    free(v8);
  }
  return v1;
}

uint64_t sub_100002510(void *a1, socklen_t *a2)
{
  int v4 = 0LL;
  socklen_t v5 = 1024;
  socklen_t v17 = 1024;
  do
  {
    socklen_t v6 = v17;
    if (v17 < v5) {
      goto LABEL_7;
    }
    int v7 = 2 * v5;
    socklen_t v5 = 2 * v5 + 200;
    socklen_t v17 = v7 + 200;
    __int128 v8 = realloc(v4, (v7 + 200));
    if (!v8)
    {
      CFTypeID v11 = (os_log_s *)off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "get_dummynet_rules";
      v12 = "%s: realloc\n";
      v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_12;
    }

    int v4 = v8;
  }

  while ((sub_1000027D0(64, v8, &v17) & 0x80000000) == 0);
  int v9 = *__error();
  free(v4);
  if (v9 == 55)
  {
    socklen_t v6 = 0;
    int v4 = 0LL;
LABEL_7:
    *a1 = v4;
    *a2 = v6;
    return 1LL;
  }

  int v15 = (os_log_s *)off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    int v16 = *__error();
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "get_dummynet_rules";
    __int16 v20 = 1024;
    int v21 = v16;
    v12 = "%s: IP_DUMMYNET_GET failed (%d)\n";
    v13 = v15;
    uint32_t v14 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
  }

  return 0xFFFFFFFFLL;
}

void sub_1000026B0(int a1)
{
  DWORD2(v11[0]) = a1;
  socklen_t v4 = 352;
  if (sub_1000027D0(61, v11, &v4))
  {
    unint64_t v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v3 = *__error();
      *(_DWORD *)buf = 136315650;
      socklen_t v6 = "delete_pipe";
      __int16 v7 = 1024;
      int v8 = a1;
      __int16 v9 = 1024;
      int v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s: IP_DUMMYNET_DEL(pipe %d) failed (%d)\n",  buf,  0x18u);
    }
  }
}

uint64_t sub_1000027D0(int a1, void *a2, socklen_t *a3)
{
  int v6 = dword_10000C000;
  if (dword_10000C000 == -1)
  {
    int v6 = socket(2, 3, 255);
    dword_10000C000 = v6;
    if ((v6 & 0x80000000) == 0)
    {
LABEL_3:
      if (a1 == 64) {
        return getsockopt(v6, 0, 64, a2, a3);
      }
      else {
        return setsockopt(v6, 0, a1, a2, *a3);
      }
    }
  }

  else if ((dword_10000C000 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }

  int v8 = (os_log_s *)off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "do_cmd";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: socket unavailable\n", (uint8_t *)&v9, 0xCu);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100002938(int a1, float *a2)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  float v2 = a2[2];
  DWORD2(v12) = a1;
  if (v2 != 0.0)
  {
    double v3 = v2;
    if (v2 < 0.0) {
      double v3 = 0.0;
    }
    if (v2 <= 1.0) {
      double v4 = v3;
    }
    else {
      double v4 = 1.0;
    }
    HIDWORD(v24) = (int)(v4 * 2147483650.0);
  }

  float v5 = *a2;
  if (!*(_DWORD *)a2) {
    goto LABEL_15;
  }
  *((float *)&v12 + 3) = *a2;
  int v6 = *((_DWORD *)a2 + 1);
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_14;
    }
    int v7 = 1000000;
  }

  else
  {
    int v7 = 1000;
  }

  LODWORD(v5) *= v7;
  *((float *)&v12 + 3) = v5;
LABEL_14:
  if ((LODWORD(v5) & 0x80000000) == 0)
  {
LABEL_15:
    if (*((_DWORD *)a2 + 3)) {
      *(float *)&__int128 v13 = a2[3];
    }
    if (*((_DWORD *)a2 + 4))
    {
      *((float *)&v24 + 2) = a2[4];
      if (*((_DWORD *)a2 + 5) == 1) {
        WORD1(v23) = 8;
      }
    }

    socklen_t v10 = 352;
    else {
      return 0LL;
    }
  }

  int v9 = (os_log_s *)off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    socklen_t v10 = 136315138;
    CFTypeID v11 = "config_pipe";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: bandwidth too large\n", (uint8_t *)&v10, 0xCu);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100002ADC(int a1, uint64_t a2)
{
  __int128 v17 = 0LL;
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if ((sub_100002510(&v17, &v16) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  double v4 = v17;
  socklen_t v5 = v16;
  int v6 = (char *)v17;
  do
  {
    if (v5 < 0x160 || (int v7 = v6, *(void *)v6 != 0x4000LL))
    {
      uint64_t v11 = 0LL;
      if (!v17) {
        return v11;
      }
      goto LABEL_15;
    }

    int v8 = 184 * *((_DWORD *)v6 + 67) + 352;
    v6 += v8;
    v5 -= v8;
  }

  while (*((_DWORD *)v7 + 2) != a1);
  int v9 = *((_DWORD *)v7 + 51);
  if (v9)
  {
    if (v9 == 0x7FFFFFFF) {
      float v10 = 1.0;
    }
    else {
      float v10 = (double)v9 / 2147483650.0;
    }
  }

  else
  {
    float v10 = 0.0;
  }

  int v12 = *((_DWORD *)v7 + 4);
  int v13 = *((_DWORD *)v7 + 3) / 1000;
  *(float *)(a2 + 8) = v10;
  *(_DWORD *)a2 = v13;
  *(_DWORD *)(a2 + 4) = 0;
  int v14 = *((_DWORD *)v7 + 50);
  *(_DWORD *)(a2 + 12) = v12;
  *(_DWORD *)(a2 + 16) = v14;
  *(_DWORD *)(a2 + 20) = (*((unsigned __int16 *)v7 + 89) >> 3) & 1;
  uint64_t v11 = 1LL;
  if (v4) {
LABEL_15:
  }
    free(v4);
  return v11;
}

BOOL sub_100002C04()
{
  size_t v3 = 4LL;
  int v0 = sysctlbyname("net.link.generic.system.enable_netagent", &v4, &v3, 0LL, 0LL);
  if (v0)
  {
    int v1 = v0;
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100006A60(v1);
      return 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "enable_netagent = 0x%x\n",  buf,  8u);
    }

    return v4 == 1;
  }

  return result;
}

void sub_100002CFC(int a1)
{
  int v4 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "set enable_netagent %d",  buf,  8u);
  }

  int v2 = sysctlbyname("net.link.generic.system.enable_netagent", 0LL, 0LL, &v4, 4uLL);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006B00(&v4, v3);
    }
  }

void sub_100002DE4()
{
}

void sub_100002DEC()
{
}

uint64_t sub_100002DF4()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315650;
    int v2 = "kc_stop_simulation";
    __int16 v3 = 1024;
    int v4 = dword_10000C070;
    __int16 v5 = 1024;
    int v6 = sub_1000030AC();
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: kc_was_netagent_disabled %d netem_is_simulation_on() %d",  (uint8_t *)&v1,  0x18u);
  }

  if ((_BYTE)dword_10000C070)
  {
    sub_100002CFC(1);
    LOBYTE(dword_10000C070) = 0;
  }

  return sub_100006028();
}

uint64_t sub_100002EEC(_DWORD *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "kc_start_simulation";
    __int16 v7 = 1024;
    int v8 = dword_10000C070;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: kc_was_netagent_disabled %d",  (uint8_t *)&v5,  0x12u);
  }

  int v2 = sub_1000030B8(a1);
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (v3)
    {
      LOWORD(v5) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "simulation using packetfilter",  (uint8_t *)&v5,  2u);
    }

    if (sub_100002C04())
    {
      sub_100002CFC(0);
      LOBYTE(dword_10000C070) = 1;
    }

    return sub_1000061C8((uint64_t)a1);
  }

  if (v3)
  {
    LOWORD(v5) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "simulation using NetEm",  (uint8_t *)&v5,  2u);
  }

  uint64_t result = sub_100003324((uint64_t)a1);
  if ((_DWORD)result != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006B8C();
    }
    return sub_1000061C8((uint64_t)a1);
  }

  return result;
}

uint64_t sub_100003074(uint64_t a1)
{
  else {
    return sub_100005330(a1);
  }
}

uint64_t sub_1000030AC()
{
  return BYTE1(dword_10000C070);
}

uint64_t sub_1000030B8(_DWORD *a1)
{
  size_t v5 = 4LL;
  if (sysctlbyname("net.link.generic.system.if_attach_nx", &v6, &v5, 0LL, 0LL)) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "if_attach_nx = 0x%x\n",  buf,  8u);
  }

  if ((~v6 & 7) != 0) {
    return 0LL;
  }
  if (a1[2])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v2 = "NetEm doesn't support secondary condition";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v2, buf, 2u);
      return 0LL;
    }

    return 0LL;
  }

  if (!a1[29])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v2 = "NetEm doesn't support loopback";
      goto LABEL_20;
    }

    return 0LL;
  }

  if (a1[28] || a1[40] || a1[42] || a1[41] || a1[49] || a1[50] || a1[51])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v2 = "NetEm doesn't support family/proto/port config";
      goto LABEL_20;
    }

    return 0LL;
  }

  if (a1[38] || a1[39] || a1[47] || a1[48])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      return 0LL;
    }
    *(_WORD *)buf = 0;
    int v2 = "NetEm doesn't support qsize config";
    goto LABEL_20;
  }

  uint64_t v3 = 1LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "use NetEm simulation",  buf,  2u);
  }

  return v3;
}

uint64_t sub_100003324(uint64_t a1)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  memset(v12, 0, sizeof(v12));
  LODWORD(v13) = 1;
  unint64_t v1 = *(unsigned int *)(a1 + 172);
  if ((_DWORD)v1)
  {
    int v2 = *(_DWORD *)(a1 + 176);
    if (v2 == 1)
    {
      unsigned int v3 = 1000000;
    }

    else
    {
      if (v2) {
        goto LABEL_8;
      }
      unsigned int v3 = 1000;
    }

    unint64_t v1 = v1 * (unint64_t)v3;
  }

  else
  {
    unint64_t v1 = -1LL;
  }

LABEL_8:
  *((void *)&v13 + 1) = v1;
  float v4 = *(float *)(a1 + 180) * 100000.0;
  LODWORD(v14) = *(_DWORD *)(a1 + 184);
  LODWORD(v15) = v4;
  LODWORD(v17) = 1;
  unint64_t v5 = *(unsigned int *)(a1 + 136);
  if ((_DWORD)v5)
  {
    int v6 = *(_DWORD *)(a1 + 140);
    if (v6 == 1)
    {
      unsigned int v7 = 1000000;
    }

    else
    {
      if (v6) {
        goto LABEL_15;
      }
      unsigned int v7 = 1000;
    }

    unint64_t v5 = v5 * (unint64_t)v7;
  }

  else
  {
    unint64_t v5 = -1LL;
  }

LABEL_15:
  *((void *)&v17 + 1) = v5;
  int v9 = *(unsigned __int8 *)(a1 + 120);
  uint64_t v8 = a1 + 120;
  float v10 = *(float *)(v8 + 24) * 100000.0;
  LODWORD(v18) = *(_DWORD *)(v8 + 28);
  LODWORD(v19) = v10;
  if (v9)
  {
  }

  else if (sub_10000374C((uint64_t)v12, 1))
  {
    return 0LL;
  }

  uint64_t result = 1LL;
  BYTE1(dword_10000C070) = 1;
  return result;
}

uint64_t sub_100003480(uint64_t a1, uint64_t a2)
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  if (a1)
  {
    *__error() = 0;
    int v4 = socket(2, 2, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      __strlcpy_chk(&v24, a1, 16LL, 16LL);
      if (ioctl(v5, 0xC02069D8uLL, &v24) < 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v17 = __error();
          __int128 v18 = strerror(*v17);
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = (uint64_t)v18;
          __int16 v22 = 2080;
          uint64_t v23 = a1;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ioctl get no traffic shaping error %s on %s",  buf,  0x16u);
        }
      }

      else if ((_DWORD)v25)
      {
        uint64_t v6 = 0LL;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v21 = a1;
          unsigned int v7 = "no traffic shaping on %s";
          os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_25;
        }

        goto LABEL_27;
      }

      __strlcpy_chk(a2, a1, 16LL, 16LL);
      if ((ioctl(v5, 0xC0F06991uLL, a2) & 0x80000000) == 0 || *__error() == 2 || *__error() == 6 || *__error() == 19)
      {
        if (*__error() == 6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100006C04();
          }
        }

        else
        {
          if (*__error() != 19)
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
LABEL_26:
              uint64_t v6 = 0LL;
              goto LABEL_27;
            }

            *(_DWORD *)buf = 136315138;
            uint64_t v21 = a1;
            unsigned int v7 = "set interface link parameters on %s";
            os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v8, v7, buf, 0xCu);
            goto LABEL_26;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100006C6C();
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100006CD4(a1);
      }

      uint64_t v6 = 0xFFFFFFFFLL;
LABEL_27:
      close(v5);
      return v6;
    }

    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_100006BD0(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000374C(uint64_t a1, char a2)
{
  if (getifaddrs(&v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006DF0();
    }
    return 0xFFFFFFFFLL;
  }

  int v5 = v9;
  if (v9)
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      if ((v5->ifa_flags & 1) != 0)
      {
        ifa_name = v5->ifa_name;
        if (!v6 || strcmp(v6, v5->ifa_name))
        {
          if ((sub_100003CDC(ifa_name) & 1) != 0)
          {
            if (sub_100003480((uint64_t)v5->ifa_name, a1))
            {
              uint64_t v6 = ifa_name;
              if ((a2 & 1) != 0) {
                return 0xFFFFFFFFLL;
              }
              goto LABEL_19;
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            sub_100006DB0(&v10, (uint64_t *)&v5->ifa_name, &v11);
          }

          uint64_t v6 = ifa_name;
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        sub_100006D70(&v12, (uint64_t)v5, &v13);
      }

LABEL_19:
      int v5 = v5->ifa_next;
      if (!v5)
      {
        os_log_type_t v8 = v9;
        goto LABEL_22;
      }
    }
  }

  os_log_type_t v8 = 0LL;
LABEL_22:
  freeifaddrs(v8);
  return 0LL;
}

uint64_t sub_1000038CC()
{
  if (sub_10000374C((uint64_t)v10, 0))
  {
    BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v0) {
      sub_100006E64(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "netem simulation stop",  v9,  2u);
  }

  BYTE1(dword_10000C070) = 0;
  return 1LL;
}

uint64_t sub_1000039B4(uint64_t a1)
{
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  __int128 v19 = &v20;
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_100006BD0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0LL;
  }

  int v3 = v2;
  if (getifaddrs(&v18) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006DF0();
  }
  uint64_t v4 = v18;
  if (!v18)
  {
LABEL_16:
    close(v3);
    return 0LL;
  }

  while ((v4->ifa_flags & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100006E98(&v31, (uint64_t)v4, &v32);
    }
LABEL_15:
    uint64_t v4 = v4->ifa_next;
    if (!v4) {
      goto LABEL_16;
    }
  }

  p_ifa_name = &v4->ifa_name;
  if ((sub_100003CDC(v4->ifa_name) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100006DB0(&v29, (uint64_t *)&v4->ifa_name, &v30);
    }
    goto LABEL_15;
  }

  __strlcpy_chk(v19, *p_ifa_name, 16LL, 16LL);
  if (ioctl(v3, 0xC0F06992uLL, &v19) < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006ED8(&v16, v17);
    }
    goto LABEL_15;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *p_ifa_name;
    *(_DWORD *)buf = 136315138;
    __int128 v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "get interface link parameters on %s",  buf,  0xCu);
  }

  if (sub_100003C54(v21, (unsigned int *)(a1 + 172), (int *)(a1 + 176))
    || sub_100003C54(v24, (unsigned int *)(a1 + 136), (int *)(a1 + 140)))
  {
    return 0LL;
  }

  *(float *)(a1 + 180) = (float)v23 / 100000.0;
  *(float *)(a1 + 144) = (float)v26 / 100000.0;
  *(_DWORD *)(a1 + 184) = v22;
  *(_DWORD *)(a1 + 148) = v25;
  return 1LL;
}

uint64_t sub_100003C54(unint64_t a1, unsigned int *a2, int *a3)
{
  unsigned int v3 = a1;
  if (a1 > 0xF4240)
  {
    int v4 = 1;
LABEL_5:
    uint64_t result = 0LL;
    *a3 = v4;
    *a2 = v3 / 0xF4240;
    return result;
  }

  if (a1 > 0x3E8)
  {
    int v4 = 0;
    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006F18();
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003CDC(const char *a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  size_t v2 = strlen(off_10000C008);
  if (strncmp(a1, off_10000C008, v2))
  {
    int v3 = socket(2, 2, 0);
    if ((v3 & 0x80000000) == 0)
    {
      int v4 = v3;
      __strlcpy_chk(&v15, a1, 16LL, 16LL);
      if (ioctl(v4, 0xC020699FuLL, &v15))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100006F80();
        }
      }

      else if ((_DWORD)v16 == 6 || (_DWORD)v16 == 255 || (_DWORD)v16 == 144)
      {
        uint64_t v5 = 1LL;
        goto LABEL_14;
      }

      uint64_t v5 = 0LL;
LABEL_14:
      close(v4);
      return v5;
    }

    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_100006BD0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return 0LL;
}

void sub_100003E20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100003E30( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100003E40(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100003E5C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

float *sub_100003E78@<X0>(float *result@<X0>, void *a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  *uint64_t result = a4;
  *a2 = a3;
  return result;
}

uint64_t sub_100003E84(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  a2[1].msgh_remote_port = -300;
  mach_msg_id_t msgh_id = a1->msgh_id;
  if (msgh_id != 70) {
    return 0LL;
  }
  a2->msgh_bits = 0;
  a2->msgh_remote_port = 0;
  uint64_t result = 1LL;
  a2[1].msgh_remote_port = 0;
  return result;
}

uint64_t sub_100003EF4()
{
  if (bootstrap_check_in(bootstrap_port, "com.apple.NetworkLinkConditioner", &sp))
  {
    uint64_t v1 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)size_t v2 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "bootstrap_check_in failed, no port to listen on",  v2,  2u);
    }

    exit(104);
  }

  mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C080);
  return mach_port_move_member(mach_task_self_, sp, dword_10000C080);
}

uint64_t sub_100003FAC()
{
  return mach_msg_server( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003E84,  0x2044u,  dword_10000C080,  50331648);
}

uint64_t start(uint64_t a1, const char **a2)
{
  if (sandbox_init("nlcd", 1uLL, &errorbuf) == -1) {
    sub_100006FE8((const char **)&errorbuf);
  }
  int v3 = *a2;
  int v4 = strrchr(v3, 47);
  if (v4) {
    uint64_t v5 = (uint64_t)(v4 + 1);
  }
  else {
    uint64_t v5 = (uint64_t)v3;
  }
  qword_10000C078 = v5;
  off_10000C010 = os_log_create("com.apple.nlcd", "default");
  sub_100003EF4();
  unsigned int v6 = time(0LL);
  srandom(v6);
  sub_100001E90();
  mach_msg_server( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003E84,  0x2044u,  dword_10000C080,  50331648);
  return 0LL;
}

uint64_t sub_100004080(const char *a1, int a2, void *a3)
{
  if (dword_10000C018)
  {
    unsigned int v6 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }

  if (!a1)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    uint64_t v11 = "%s: conf == NULL";
LABEL_58:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    goto LABEL_59;
  }

  int v7 = *(_DWORD *)a1;
  if (a2)
  {
    if ((v7 & 4) == 0)
    {
      uint64_t v8 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "pf_add_pipe";
        uint64_t v9 = "%s: OUTDIR && !(conf->flags & NLC_FLAG_SIMULATE_UPLINK)";
LABEL_14:
        uint64_t v12 = v8;
        uint32_t v13 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v9, buf, v13);
        goto LABEL_16;
      }

      goto LABEL_16;
    }

    __int128 v15 = (int *)(a1 + 28);
  }

  else
  {
    if ((v7 & 8) == 0)
    {
      uint64_t v8 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "pf_add_pipe";
        uint64_t v9 = "%s: INDIR && !(conf->flags & NLC_FLAG_SIMULATE_DOWNLINK)";
        goto LABEL_14;
      }

LABEL_16:
      uint64_t v14 = 0LL;
      goto LABEL_60;
    }

    __int128 v15 = (int *)(a1 + 64);
  }

  int v16 = sub_10000245C();
  if (v16 == -1)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    uint64_t v11 = "%s: getDummynetPipeNumber() returned -1 ";
    goto LABEL_58;
  }

  int v17 = v16;
  if ((sub_100002938(v16, (float *)v15) & 0x80000000) != 0)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    uint64_t v11 = "%s: config_pipe() returned -1 ";
    goto LABEL_58;
  }

  int v18 = 0;
  char v19 = 1;
  if (a2) {
    uint64_t v20 = 2LL;
  }
  else {
    uint64_t v20 = 1LL;
  }
  int v43 = v17;
  uint64_t v44 = v17;
  uint64_t value = v20;
  while (1)
  {
    char v21 = v19;
    xpc_object_t v22 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v22)
    {
      v39 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        __int16 v48 = 1024;
        int v49 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create pipe %d failed",  buf,  0x12u);
      }

      goto LABEL_78;
    }

    unsigned int v23 = v22;
    xpc_dictionary_set_uint64(v22, kPFAction, 0xBuLL);
    xpc_dictionary_set_uint64(v23, kPFDirection, value);
    xpc_dictionary_set_BOOL(v23, kPFQuick, 1);
    xpc_dictionary_set_BOOL(v23, kPFAllowOpts, 1);
    int v24 = *((_DWORD *)a1 + 1);
    if (v24 == 2 || !(v24 | v18))
    {
      xpc_dictionary_set_uint64(v23, kPFFamily, 2uLL);
      if (v15[6] == 58) {
        uint64_t v25 = 1LL;
      }
      else {
        uint64_t v25 = v15[6];
      }
      goto LABEL_36;
    }

    if (v24 == 30 || (v18 & (v24 == 0)) != 0)
    {
      xpc_dictionary_set_uint64(v23, kPFFamily, 0x1EuLL);
      if (v15[6] == 1) {
        uint64_t v25 = 58LL;
      }
      else {
        uint64_t v25 = v15[6];
      }
LABEL_36:
      xpc_dictionary_set_uint64(v23, kPFProtocol, v25);
    }

    xpc_object_t v26 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v26)
    {
      v40 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_76;
      }
      goto LABEL_77;
    }

    __int128 v27 = v26;
    xpc_dictionary_set_uint64(v26, kPFSubDummyNetPipe, v44);
    xpc_dictionary_set_uint64(v27, kPFSubDummyNetPipeType, 0x4000uLL);
    xpc_dictionary_set_value(v23, kPFDummyNet, v27);
    xpc_release(v27);
    int v28 = v15[8];
    if (!v28) {
      goto LABEL_43;
    }
    float v29 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "pf_add_pipe";
      __int16 v48 = 1024;
      int v49 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s: linkconfig->src_port %u", buf, 0x12u);
    }

    xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v30)
    {
      v40 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
LABEL_76:
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        __int16 v48 = 1024;
        int v49 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create subrule_dn %d failed",  buf,  0x12u);
      }

LABEL_77:
      xpc_release(v23);
LABEL_78:
      uint64_t v14 = 12LL;
      goto LABEL_60;
    }

    float v31 = v30;
    xpc_dictionary_set_string(v30, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v31, kPFSubLowPort, v15[8]);
    xpc_dictionary_set_uint64(v31, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v23, kPFFrom, v31);
    xpc_release(v31);
LABEL_43:
    int v32 = v15[7];
    if (v32)
    {
      __int128 v33 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        __int16 v48 = 1024;
        int v49 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: linkconfig->dst_port %u", buf, 0x12u);
      }

      xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v34)
      {
        v40 = (os_log_s *)off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        goto LABEL_77;
      }

      v35 = v34;
      xpc_dictionary_set_string(v34, kPFSubAddressLabel, kPFAny);
      xpc_dictionary_set_uint64(v35, kPFSubLowPort, v15[7]);
      xpc_dictionary_set_uint64(v35, kPFSubPortOperator, 2uLL);
      xpc_dictionary_set_value(v23, kPFTo, v35);
      xpc_release(v35);
    }

    if (a1[12]) {
      xpc_dictionary_set_string(v23, kPFInterface, a1 + 12);
    }
    char v36 = PFUserAddRule(*a3, a3[1], v23);
    xpc_release(v23);
    if ((v36 & 1) == 0) {
      break;
    }
    uint64_t v14 = *((unsigned int *)a1 + 1);
    if ((_DWORD)v14)
    {
      v42 = (os_log_s *)off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      v47 = "pf_add_pipe";
      __int16 v48 = 1024;
      int v49 = v14;
      uint64_t v9 = "%s: done netlink->family != AF_UNSPEC %u";
      uint64_t v12 = v42;
      uint32_t v13 = 18;
      goto LABEL_15;
    }

    char v19 = 0;
    int v18 = 1;
    if ((v21 & 1) == 0) {
      goto LABEL_60;
    }
  }

  v41 = (os_log_s *)off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", buf, 0xCu);
  }

  sub_1000026B0(v43);
LABEL_59:
  uint64_t v14 = 0xFFFFFFFFLL;
LABEL_60:
  if (dword_10000C018)
  {
    v37 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }

  return v14;
}

uint64_t sub_10000492C(void *a1)
{
  if (dword_10000C018)
  {
    size_t v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }

  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v3)
  {
    int v4 = v3;
    xpc_dictionary_set_uint64(v3, kPFAction, 0xCuLL);
    xpc_dictionary_set_uint64(v4, kPFDirection, 0LL);
    xpc_dictionary_set_BOOL(v4, kPFQuick, 1);
    xpc_dictionary_set_string(v4, kPFInterface, "lo0");
    char v5 = PFUserAddRule(*a1, a1[1], v4);
    xpc_release(v4);
    if ((v5 & 1) != 0)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v8 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        uint64_t v12 = "pf_add_noloopbackrule";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s: PFUserAddRule failed",  (uint8_t *)&v11,  0xCu);
      }

      uint64_t v6 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    int v7 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_noloopbackrule";
      uint64_t v6 = 12LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create failed",  (uint8_t *)&v11,  0xCu);
    }

    else
    {
      uint64_t v6 = 12LL;
    }
  }

  if (dword_10000C018)
  {
    uint64_t v9 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6;
}

uint64_t sub_100004B94(void *a1)
{
  if (dword_10000C018)
  {
    size_t v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }

  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v3)
  {
    int v4 = v3;
    xpc_dictionary_set_uint64(v3, kPFAction, 0LL);
    xpc_dictionary_set_uint64(v4, kPFDirection, 0LL);
    xpc_dictionary_set_BOOL(v4, kPFAllowOpts, 1);
    char v5 = PFUserAddRule(*a1, a1[1], v4);
    xpc_release(v4);
    if ((v5 & 1) != 0)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v8 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        uint64_t v12 = "pf_add_allowoptsrule";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s: PFUserAddRule failed",  (uint8_t *)&v11,  0xCu);
      }

      uint64_t v6 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    int v7 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_allowoptsrule";
      uint64_t v6 = 12LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create",  (uint8_t *)&v11,  0xCu);
    }

    else
    {
      uint64_t v6 = 12LL;
    }
  }

  if (dword_10000C018)
  {
    uint64_t v9 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6;
}

uint64_t sub_100004DE0(void *a1)
{
  if (dword_10000C018)
  {
    size_t v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int128 v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v14, 0xCu);
    }
  }

  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v3)
  {
    uint64_t v9 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int128 v15 = "pf_add_scrubrule";
      uint64_t v8 = 12LL;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create",  (uint8_t *)&v14,  0xCu);
      goto LABEL_17;
    }

LABEL_13:
    uint64_t v8 = 12LL;
    goto LABEL_17;
  }

  int v4 = v3;
  xpc_dictionary_set_uint64(v3, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v4, kPFDirection, 0LL);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v5)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int128 v15 = "pf_add_scrubrule";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s: xpc_dictionary_create subrule_scrub failed",  (uint8_t *)&v14,  0xCu);
    }

    xpc_release(v4);
    goto LABEL_13;
  }

  uint64_t v6 = v5;
  xpc_dictionary_set_uint64(v5, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v4, kPFScrubOptions, v6);
  xpc_release(v6);
  char v7 = PFUserAddRule(*a1, a1[1], v4);
  xpc_release(v4);
  if ((v7 & 1) != 0)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    int v11 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int128 v15 = "pf_add_scrubrule";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s: PFUserAddRule failed",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v8 = 0xFFFFFFFFLL;
  }

LABEL_17:
  if (dword_10000C018)
  {
    uint64_t v12 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int128 v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v14, 0xCu);
    }
  }

  return v8;
}

  if (dword_10000C018)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = 136315138;
      uint32_t v13 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v12, 0xCu);
    }
  }

  if (v4) {
    xpc_release(v4);
  }
  return 0LL;
}

uint64_t sub_1000050C0(void *a1)
{
  if (dword_10000C018)
  {
    size_t v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint32_t v13 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v12, 0xCu);
    }
  }

  xpc_object_t v3 = (void *)PFUserCopyRules_S(*a1);
  int v4 = v3;
  if (v3)
  {
    if (xpc_array_get_count(v3))
    {
      size_t v5 = 0LL;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v4, v5);
        if (!value) {
          break;
        }
        int v7 = sub_1000052CC(value);
        if (v7 >= 1) {
          sub_1000026B0(v7);
        }
        if (xpc_array_get_count(v4) <= ++v5) {
          goto LABEL_17;
        }
      }

      uint64_t v8 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        uint32_t v13 = "pf_delete_pipes";
        uint64_t v9 = "%s: pf_delete_pipes failed";
        goto LABEL_16;
      }
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint32_t v13 = "pf_delete_pipes";
      uint64_t v9 = "%s: PFUserCopyRules_S failed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
    }
  }

uint64_t sub_1000052CC(void *a1)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFDummyNet);
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL sub_100005330(uint64_t a1)
{
  if (dword_10000C018)
  {
    uint64_t v1 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }

  int v2 = sub_1000059E4(v47);
  if (v2) {
    goto LABEL_66;
  }
  xpc_object_t xarray = (xpc_object_t)PFUserCopyRules_S(v47[0]);
  if (!xarray)
  {
    int v32 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s: PFUserCopyRules_S failed", buf, 0xCu);
    }

    goto LABEL_66;
  }

  size_t count = xpc_array_get_count(xarray);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 0;
  unint64_t v45 = count;
  if (!count) {
    goto LABEL_65;
  }
  size_t v4 = 0LL;
  unsigned int v5 = 0;
  uint64_t v6 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  int v44 = -1;
  uint64_t v9 = (const char **)&kPFProtocol;
  while (1)
  {
    xpc_object_t value = xpc_array_get_value(xarray, v4);
    if (!value)
    {
      __int128 v33 = (os_log_s *)off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_65;
      }
      *(_DWORD *)__int16 v48 = 136315138;
      int v49 = "pf_list_rules";
      xpc_object_t v34 = "%s: PFGetUserRules_S failed";
      goto LABEL_63;
    }

    int v11 = value;
    int v12 = sub_1000052CC(value);
    if (v12 < 0)
    {
      char v19 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v48 = 136315394;
        int v49 = "pf_list_rules";
        __int16 v50 = 1024;
        int v51 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s: rule_pipenum %d < 0", v48, 0x12u);
      }

      goto LABEL_49;
    }

    int v43 = v6;
    if (v45 > v5 + 1)
    {
      uint32_t v13 = v9;
      uint64_t v14 = v7;
      xpc_object_t v15 = xpc_array_get_value(xarray, v5 + 1);
      if (!v15)
      {
        __int128 v33 = (os_log_s *)off_10000C010;
        if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
          goto LABEL_65;
        }
        *(_DWORD *)__int16 v48 = 136315138;
        int v49 = "pf_list_rules";
        xpc_object_t v34 = "%s: PFGetUserRules_S failed";
        goto LABEL_63;
      }

      int v16 = v15;
      int v17 = sub_1000052CC(v15);
      if (v17 >= 1 && v12 == v17)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v11, kPFDirection);
        uint64_t v18 = xpc_dictionary_get_uint64(v16, kPFDirection);
        else {
          uint64_t v7 = v14;
        }
      }

      else
      {
        uint64_t v7 = v14;
      }

      uint64_t v9 = v13;
    }

    int v20 = 0;
    __int128 v55 = 0uLL;
    int v56 = 0;
    if (!(_DWORD)v7) {
      int v20 = xpc_dictionary_get_uint64(v11, kPFFamily);
    }
    DWORD2(v53) = xpc_dictionary_get_uint64(v11, *v9);
    xpc_object_t v21 = xpc_dictionary_get_value(v11, kPFFrom);
    if (v21)
    {
      xpc_object_t v22 = v21;
    }

    xpc_object_t v23 = xpc_dictionary_get_value(v11, kPFTo);
    if (v23)
    {
      int v24 = v23;
    }

    if (!v43 || v20 != *v43 && (*v43 != 2 || v20 != 30 || DWORD2(v53) != 58 || *(_DWORD *)(v41 + 24) != 1))
    {
      xpc_dictionary_get_uint64(v11, kPFDirection);
LABEL_44:
      if (v44 < 1)
      {
        uint64_t v8 = a1 + 100 * ++v44 + 8;
        goto LABEL_46;
      }

      __int128 v33 = (os_log_s *)off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_65;
      }
      *(_DWORD *)__int16 v48 = 136315138;
      int v49 = "pf_list_rules";
      xpc_object_t v34 = "%s: too many configs, giving up";
LABEL_63:
      char v36 = v33;
      uint32_t v37 = 12;
      goto LABEL_64;
    }

    uint64_t v25 = xpc_dictionary_get_uint64(v11, kPFDirection);
    if (v25 != 2)
    {
      if (v25 != 1 || (*(_BYTE *)v8 & 8) == 0) {
        goto LABEL_46;
      }
      goto LABEL_44;
    }

    if ((*(_BYTE *)v8 & 4) != 0) {
      goto LABEL_44;
    }
LABEL_46:
    *(_DWORD *)(v8 + 4) = v20;
    uint64_t v6 = (_DWORD *)(v8 + 4);
    __int128 v26 = v55;
    *(_DWORD *)(v8 + 24) = v56;
    *(_OWORD *)(v8 + 8) = v26;
    uint64_t v27 = xpc_dictionary_get_uint64(v11, kPFDirection);
    int v28 = *(_DWORD *)v8;
    if (v27 == 1)
    {
      *(_DWORD *)uint64_t v8 = v28 | 8;
      uint64_t v41 = v8 + 64;
      __int128 v29 = v53;
      *(_OWORD *)(v8 + 64) = *(_OWORD *)buf;
      *(_OWORD *)(v8 + 80) = v29;
      *(_DWORD *)(v8 + 96) = v54;
    }

    else
    {
      *(_DWORD *)uint64_t v8 = v28 | 4;
      uint64_t v41 = v8 + 28;
      int v30 = v54;
      __int128 v31 = v53;
      *(_OWORD *)(v8 + 28) = *(_OWORD *)buf;
      *(_OWORD *)(v8 + 44) = v31;
      *(_DWORD *)(v8 + 60) = v30;
    }

LABEL_49:
    size_t v4 = ++v5;
    if (v45 <= v5) {
      goto LABEL_65;
    }
  }

  v35 = (os_log_s *)off_10000C010;
  if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
    goto LABEL_65;
  }
  *(_DWORD *)__int16 v48 = 136315394;
  int v49 = "pf_list_rules";
  __int16 v50 = 1024;
  int v51 = v12;
  xpc_object_t v34 = "%s: unknown pipe %d";
  char v36 = v35;
  uint32_t v37 = 18;
LABEL_64:
  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v34, v48, v37);
LABEL_65:
  xpc_release(xarray);
  int v2 = 0;
LABEL_66:
  sub_100005BFC(v47);
  if (dword_10000C018)
  {
    v38 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v48 = 136315138;
      int v49 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s:end", v48, 0xCu);
    }
  }

  return v2 == 0;
}

uint64_t sub_1000059E4(uint64_t *a1)
{
  if (dword_10000C018)
  {
    int v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }

  *a1 = 0LL;
  a1[1] = 0LL;
  uint64_t v3 = PFUserCreate(kPFNLC, kPFBase, &_dispatch_main_q, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = PFUserBeginRules();
    if (v5 != -1)
    {
      uint64_t v6 = v5;
      uint64_t result = 0LL;
      *a1 = v4;
      a1[1] = v6;
      return result;
    }

    uint64_t v9 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: PFUserBeginRules failed",  (uint8_t *)&v11,  0xCu);
    }

    PFUserRelease(v4, 0LL);
  }

  else
  {
    uint64_t v8 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: PFUserCreate failed", (uint8_t *)&v11, 0xCu);
    }
  }

  if (dword_10000C018)
  {
    uint64_t v10 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_100005BFC(void *a1)
{
  if (dword_10000C018)
  {
    int v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v4, 0xCu);
    }
  }

  if (*a1) {
    PFUserRelease(*a1, 0LL);
  }
  *a1 = 0LL;
  a1[1] = 0LL;
  if (dword_10000C018)
  {
    uint64_t v3 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v4, 0xCu);
    }
  }

uint64_t sub_100005D24(int a1, uint64_t a2)
{
  if (dword_10000C018)
  {
    int v4 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }

  *(_OWORD *)buf = 0uLL;
  if (ioctl(a1, 0xC0104405uLL, buf) < 0)
  {
    if (*__error() == 2) {
      goto LABEL_18;
    }
    int v12 = (os_log_s *)off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_DWORD *)uint64_t v25 = 136315138;
    __int128 v26 = "pf_find_token";
    uint32_t v13 = "%s: DIOCGETSTARTERS failed";
    uint64_t v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_17;
  }

  uint64_t v5 = malloc(2LL * *(int *)buf);
  if (v5)
  {
    uint64_t v6 = v5;
    *(void *)&buf[8] = v5;
    if (ioctl(a1, 0xC0104405uLL, buf) < 0)
    {
      if (*__error() != 2)
      {
        uint64_t v18 = (os_log_s *)off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v25 = 136315138;
          __int128 v26 = "pf_find_token";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: DIOCGETSTARTERS failed", v25, 0xCu);
        }
      }
    }

    else
    {
      int v7 = *(_DWORD *)buf;
      if (*(int *)buf >= 1)
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = *(void *)&buf[8];
        uint64_t v10 = (const char *)qword_10000C078;
        while (1)
        {
          uint64_t v11 = v9 + v8;
          v8 += 84LL;
        }

        __int128 v21 = *(_OWORD *)(v11 + 16);
        *(_OWORD *)a2 = *(_OWORD *)v11;
        *(_OWORD *)(a2 + 16) = v21;
        __int128 v22 = *(_OWORD *)(v11 + 32);
        __int128 v23 = *(_OWORD *)(v11 + 48);
        __int128 v24 = *(_OWORD *)(v11 + 64);
        *(_DWORD *)(a2 + 80) = *(_DWORD *)(v11 + 80);
        *(_OWORD *)(a2 + 48) = v23;
        *(_OWORD *)(a2 + 64) = v24;
        *(_OWORD *)(a2 + 32) = v22;
        uint64_t v17 = 1LL;
        goto LABEL_23;
      }
    }

LABEL_22:
    uint64_t v17 = 0LL;
LABEL_23:
    free(v6);
    goto LABEL_24;
  }

  int v16 = (os_log_s *)off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v25 = 0;
    uint32_t v13 = "malloc";
    uint64_t v14 = v16;
    uint32_t v15 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, v25, v15);
  }

LABEL_18:
  uint64_t v17 = 0LL;
LABEL_24:
  if (dword_10000C018)
  {
    char v19 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v25 = 136315138;
      __int128 v26 = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:end", v25, 0xCu);
    }
  }

  return v17;
}

uint64_t sub_100006028()
{
  if (dword_10000C018)
  {
    BOOL v0 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }

  sub_1000050C0(buf);
  if ((PFUserDeleteRules(*(void *)buf, 0LL, 0LL) & 1) == 0)
  {
    int v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "pf_delete_rules";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s: PFUserCommitRules failed",  (uint8_t *)&v5,  0xCu);
    }

LABEL_9:
    uint64_t v1 = 0LL;
    goto LABEL_10;
  }

  uint64_t v1 = 1LL;
LABEL_10:
  sub_100005BFC(buf);
  if (dword_10000C018)
  {
    uint64_t v3 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v5, 0xCu);
    }
  }

  return v1;
}

uint64_t sub_1000061C8(uint64_t a1)
{
  if (dword_10000C018)
  {
    int v2 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "pf_add_rules";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&buf, 0xCu);
    }
  }

  if (sub_100006028())
  {
    if (sub_1000059E4((uint64_t *)&buf)
      || sub_100004B94(&buf)
      || sub_100004DE0(&buf))
    {
      goto LABEL_35;
    }

    uint64_t v3 = 0LL;
    int v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      uint64_t v7 = a1 + 100 * v3;
      int v9 = *(_DWORD *)(v7 + 8);
      uint64_t v8 = (const char *)(v7 + 8);
      if (v9)
      {
        if (v4)
        {
          int v4 = 1;
        }

        else if (*(_DWORD *)(a1 + 100 * v3 + 16))
        {
          sub_10000492C(&buf);
          int v4 = v6 & 1;
        }

        else
        {
          int v4 = 0;
        }
      }

      else
      {
        uint64_t v10 = (os_log_s *)off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 v21 = 136315138;
          __int128 v22 = "pf_add_rules";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: done conf->flags == 0", v21, 0xCu);
        }
      }

      char v5 = 0;
      uint64_t v3 = 1LL;
    }

    while ((v6 & 1) != 0);
    if (dword_10000C018)
    {
      uint64_t v11 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v21 = 136315138;
        __int128 v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:begin", v21, 0xCu);
      }
    }

    if ((PFUserCommitRules(buf, *((void *)&buf + 1), 0LL, 0LL) & 1) != 0)
    {
      int v12 = 0;
    }

    else
    {
      uint32_t v15 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v21 = 136315138;
        __int128 v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: PFUserCommitRules failed", v21, 0xCu);
      }

      int v12 = -1;
    }

    if (dword_10000C018)
    {
      int v16 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v21 = 136315138;
        __int128 v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:end", v21, 0xCu);
      }
    }

    if (v12)
    {
LABEL_35:
      uint64_t v17 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v21 = 136315138;
        __int128 v22 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: result != 0", v21, 0xCu);
      }

      sub_1000050C0(&buf);
      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v14 = 1LL;
    }

    sub_100005BFC(&buf);
    if (dword_10000C018)
    {
      uint64_t v18 = (os_log_s *)off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v21 = 136315138;
        __int128 v22 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:end", v21, 0xCu);
      }
    }
  }

  else
  {
    uint32_t v13 = (os_log_s *)off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "pf_add_rules";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s: pf_delete_rules() failed",  (uint8_t *)&buf,  0xCu);
    }

    return 0LL;
  }

  return v14;
}

uint64_t sub_1000065EC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

_DWORD *sub_100006628(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  uint64_t v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }

  *(void *)(a2 + 32) = 0x11000000000000LL;
  uint64_t v5 = result[3];
  __int128 v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)sub_100001FD4(v5, (mach_port_name_t *)(a2 + 28), (_DWORD *)(a2 + 48), (int *)(a2 + 52), v7);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100006700(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100002368(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100006780(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (unsigned int v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (unsigned int v4 = result[8], v4 > 0x400)
    || ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }

  uint64_t result = (_DWORD *)sub_10000196C( result[3],  result + 9,  v4,  *(unsigned int *)((char *)result + v5 + 36),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v7 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_10;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_100006834(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (unsigned int v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (unsigned int v4 = result[8], v4 > 0x400)
    || ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }

  uint64_t result = (_DWORD *)sub_100001AE4( result[3],  result + 9,  v4,  *(unsigned int *)((char *)result + v5 + 36),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v7 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_10;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_1000068E8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (unsigned int v3 = result[1], v3 >= 0x28)
    && v3 <= 0x428
    && (unsigned int v4 = result[8], v4 <= 0x400)
    && ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), v6))
  {
    *(_DWORD *)(a2 + 36) = 1024;
    uint64_t result = (_DWORD *)sub_100001CA4( result[3],  result + 9,  v4,  (_OWORD *)(a2 + 40),  (_DWORD *)(a2 + 36),  *(unsigned int *)((char *)result + v5 + 36),  &v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v7 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      uint64_t v8 = (*(_DWORD *)(a2 + 36) + 3) & 0xFFFFFFFC;
      *(_DWORD *)(a2 + 4) = v8 + 44;
      *(_DWORD *)(a2 + v8 + 40) = v9;
      return result;
    }
  }

  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
  }

  *(NDR_record_t *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_1000069D0(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 40273) >= 0xFFFFFFFB
    && (unsigned int v5 = (void (*)(void))*(&off_1000082C0 + 5 * (v4 - 40268) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_100006A60(int a1)
{
  int v2 = __error();
  int v3 = strerror(*v2);
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2080;
  BOOL v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "error getting enable_netagent sysctl err(%d) %s",  (uint8_t *)v4,  0x12u);
}

void sub_100006B00(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "error setting enable_netagent sysctl to %d, err(%d)",  (uint8_t *)v3,  0xEu);
}

void sub_100006B8C()
{
  *(_WORD *)BOOL v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "NetEm simulation failure, fall back to packetfilter",  v0,  2u);
}

void sub_100006BD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006C04()
{
}

void sub_100006C6C()
{
}

void sub_100006CD4(uint64_t a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100003E6C();
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "ioctl set link params error %s on %s",  v3,  0x16u);
}

void sub_100006D70(float *a1, uint64_t a2, void *a3)
{
}

void sub_100006DB0(float *a1, uint64_t *a2, void *a3)
{
}

void sub_100006DF0()
{
}

void sub_100006E64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006E98(float *a1, uint64_t a2, void *a3)
{
}

void sub_100006ED8(uint8_t *buf, _BYTE *a2)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "ioctl (get link params)",  buf,  2u);
}

void sub_100006F18()
{
}

void sub_100006F80()
{
}

void sub_100006FE8(const char **a1)
{
}