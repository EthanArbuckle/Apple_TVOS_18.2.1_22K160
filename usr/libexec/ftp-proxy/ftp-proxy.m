uint64_t sub_10000317C( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  void *v11;
  size_t count;
  size_t v13;
  size_t v14;
  xpc_object_t value;
  uint64_t uint64;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  sub_100006380(2, "%s:-->", a3, a4, a5, a6, a7, a8, (char)"get_nat_packets");
  if (a2)
  {
    *a2 = 0LL;
    v10 = (void *)PFUserCopyRules_S(a1);
    if (v10)
    {
      v11 = v10;
      count = xpc_array_get_count(v10);
      if (!count)
      {
LABEL_9:
        xpc_release(v11);
        return 0LL;
      }

      v13 = count;
      v14 = 0LL;
      while (1)
      {
        value = xpc_array_get_value(v11, v14);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
          break;
        }
        uint64 = xpc_dictionary_get_uint64(value, kPFRuleID);
        if (sub_100004CC4(uint64))
        {
          *a2 = xpc_dictionary_get_uint64(value, kPFPacketsIn);
          *a2 += xpc_dictionary_get_uint64(value, kPFPacketsOut);
          xpc_dictionary_get_uint64(value, kPFPacketsIn);
          xpc_dictionary_get_uint64(value, kPFPacketsOut);
          sub_100006380(2, "%s:packets in %llu packets out %llu", v17, v18, v19, v20, v21, v22, (char)"get_nat_packets");
        }

        if (v13 == ++v14) {
          goto LABEL_9;
        }
      }

      warn("xpc rule is not of type dictionary");
      xpc_release(v11);
    }

    else
    {
      warn("unable to get rules from anchor");
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100003300( uint64_t a1, unsigned int a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned int a5, uint64_t *a6)
{
  if (!a3 || !a4 || !a5)
  {
    v23 = __error();
    int v24 = 22;
LABEL_17:
    int *v23 = v24;
    return 0xFFFFFFFFLL;
  }

  int v9 = a3[1];
  BOOL v10 = v9 == 30 || v9 == 2;
  if (!v10 || v9 != a4[1])
  {
    v23 = __error();
    int v24 = 43;
    goto LABEL_17;
  }

  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v14)
  {
    v23 = __error();
    int v24 = 12;
    goto LABEL_17;
  }

  v15 = v14;
  xpc_dictionary_set_uint64(v14, kPFAction, 0LL);
  xpc_dictionary_set_uint64(v15, kPFFamily, a3[1]);
  xpc_dictionary_set_uint64(v15, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 1uLL);
  xpc_dictionary_set_BOOL(v15, kPFQuick, 1);
  xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
  xpc_dictionary_set_string(v15, kPFFlags, "S/SA");
  xpc_dictionary_set_uint64(v15, kPFRTableID, 0LL);
  xpc_dictionary_set_uint64(v15, kPFMaxStates, 1uLL);
  xpc_dictionary_set_uint64(v15, kPFDirection, a2);
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v16)
  {
    v17 = v16;
    xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v18)
    {
      v19 = v18;
      if (a3[1] == 2)
      {
        inet_ntop(2, a3 + 4, string, 0x10u);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        v20 = a4 + 4;
        int v21 = 2;
        socklen_t v22 = 16;
      }

      else
      {
        inet_ntop(30, a3 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        v20 = a4 + 8;
        int v21 = 30;
        socklen_t v22 = 46;
      }

      inet_ntop(v21, v20, string, v22);
      xpc_dictionary_set_string(v19, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v19, kPFSubLowPort, a5);
      xpc_dictionary_set_uint64(v19, kPFSubPortOperator, 2uLL);
      uint64_t inserted = PFUserInsertRule_S(a1, v15, 0LL, 0LL);
      *a6 = inserted;
      if (inserted) {
        uint64_t v25 = 0LL;
      }
      else {
        uint64_t v25 = 0xFFFFFFFFLL;
      }
      xpc_release(v19);
    }

    else
    {
      *__error() = 12;
      uint64_t v25 = 0xFFFFFFFFLL;
    }

    xpc_release(v17);
  }

  else
  {
    *__error() = 12;
    uint64_t v25 = 0xFFFFFFFFLL;
  }

  xpc_release(v15);
  return v25;
}

uint64_t sub_100003638( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, uint64_t *a7)
{
  if (!a2 || !a3 || !a4 || !a5 || !a6 || (int v12 = a2[1], v12 != a5[1]))
  {
    int v24 = __error();
    int v25 = 22;
LABEL_16:
    *int v24 = v25;
    return 0xFFFFFFFFLL;
  }

  if (v12 != 30 && v12 != 2 || v12 != a3[1])
  {
    int v24 = __error();
    int v25 = 43;
    goto LABEL_16;
  }

  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v15)
  {
    int v24 = __error();
    int v25 = 12;
    goto LABEL_16;
  }

  xpc_object_t v16 = v15;
  xpc_dictionary_set_uint64(v15, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v16, kPFFamily, a2[1]);
  xpc_dictionary_set_uint64(v16, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v16, kPFExtFilter, 1uLL);
  xpc_dictionary_set_uint64(v16, kPFRTableID, 0LL);
  xpc_dictionary_set_BOOL(v16, kPFNATPass, 1);
  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v17)
  {
    xpc_object_t v18 = v17;
    xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v19)
    {
      v20 = v19;
      if (a2[1] == 2)
      {
        inet_ntop(2, a2 + 4, string, 0x10u);
        xpc_dictionary_set_string(v18, kPFSubAddress, string);
        int v21 = a3 + 4;
        int v22 = 2;
        socklen_t v23 = 16;
      }

      else
      {
        inet_ntop(30, a2 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v18, kPFSubAddress, string);
        int v21 = a3 + 8;
        int v22 = 30;
        socklen_t v23 = 46;
      }

      inet_ntop(v22, v21, string, v23);
      xpc_dictionary_set_string(v20, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v20, kPFSubLowPort, a4);
      xpc_dictionary_set_uint64(v20, kPFSubPortOperator, 2uLL);
      xpc_object_t v28 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v28)
      {
        v29 = v28;
        if (a5[1] == 2)
        {
          v30 = a5 + 4;
          int v31 = 2;
          socklen_t v32 = 16;
        }

        else
        {
          v30 = a5 + 8;
          int v31 = 30;
          socklen_t v32 = 46;
        }

        inet_ntop(v31, v30, string, v32);
        xpc_dictionary_set_string(v29, kPFSubAddress, string);
        xpc_dictionary_set_uint64(v29, kPFSubLowPort, a6);
        xpc_dictionary_set_uint64(v29, kPFSubPortOperator, 0LL);
        xpc_dictionary_set_value(v16, kPFFrom, v18);
        xpc_dictionary_set_value(v16, kPFTo, v20);
        xpc_dictionary_set_value(v16, kPFNATRDRAddress, v29);
        uint64_t inserted = PFUserInsertRule_S(a1, v16, 0LL, 0LL);
        *a7 = inserted;
        if (inserted) {
          uint64_t v26 = 0LL;
        }
        else {
          uint64_t v26 = 0xFFFFFFFFLL;
        }
        xpc_release(v29);
      }

      else
      {
        *__error() = 12;
        uint64_t v26 = 0xFFFFFFFFLL;
      }

      xpc_release(v20);
    }

    else
    {
      *__error() = 12;
      uint64_t v26 = 0xFFFFFFFFLL;
    }

    xpc_release(v18);
  }

  else
  {
    *__error() = 12;
    uint64_t v26 = 0xFFFFFFFFLL;
  }

  xpc_release(v16);
  return v26;
}

void sub_100003A1C()
{
  if (dword_10000C028)
  {
    gettimeofday(&v7, 0LL);
    else {
      double v0 = 0.001;
    }
    if (!qword_10000C038)
    {
      syslog(6, "data transfer complete (no bytes transferred)");
      return;
    }

    if (v0 < 60.0)
    {
      unsigned int v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%.1fs", v0);
      if (v1 == -1) {
        return;
      }
      if (v1 > 0x3E7) {
        goto LABEL_25;
      }
LABEL_17:
      size_t v2 = 1000LL - v1;
      if ((int)qword_10000C038 >= 1)
      {
        size_t v3 = strlen((const char *)&v7);
        int v4 = snprintf( (char *)&v7 + v3,  v2,  ", %d bytes to server) (%.1fKB/s",  qword_10000C038,  (double)(int)qword_10000C038 / v0 * 0.0009765625);
        if (v4 == -1) {
          return;
        }
        if (v2 <= v4) {
          goto LABEL_25;
        }
        v2 -= v4;
      }

      if (SHIDWORD(qword_10000C038) < 1) {
        goto LABEL_24;
      }
      size_t v5 = strlen((const char *)&v7);
      int v6 = snprintf( (char *)&v7 + v5,  v2,  ", %d bytes to client) (%.1fKB/s",  HIDWORD(qword_10000C038),  (double)SHIDWORD(qword_10000C038) / v0 * 0.0009765625);
      if (v6 == -1) {
        return;
      }
      if (v2 > v6) {
LABEL_24:
      }
        __strlcat_chk(&v7, ")", 1000LL, 1000LL);
      goto LABEL_25;
    }

    else {
      unsigned int v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%dh %dm %ds");
    }
    if (v1 <= 0x3E7) {
      goto LABEL_17;
    }
    if (v1 != -1) {
LABEL_25:
    }
      syslog(6, "%s");
  }
}

void sub_100003CDC(const char *a1, int a2)
{
  if (dword_10000C028)
  {
    if (!strncasecmp(a1, "pass ", 5uLL)) {
      int v4 = "PASS XXXX";
    }
    else {
      int v4 = a1;
    }
    if (a2)
    {
      if (!strncasecmp(a1, "user ", 5uLL)
        || !strncasecmp(a1, "retr ", 5uLL)
        || !strncasecmp(a1, "cwd ", 4uLL)
        || !strncasecmp(a1, "stor ", 5uLL))
      {
        int v5 = 6;
      }

      else
      {
        int v5 = 7;
      }

      int v6 = "client:";
    }

    else
    {
      int v5 = 7;
      int v6 = " server:";
    }

    syslog(v5, "%s %s", v6, v4);
  }

uint64_t sub_100003DD0(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = 0LL;
  if (dword_10000C008 != -1)
  {
    close(dword_10000C008);
    dword_10000C008 = -1;
  }

  sub_100004094();
  if (dword_10000C010 != -1)
  {
    close(dword_10000C010);
    dword_10000C010 = -1;
  }

  sub_1000040D0();
  if (!a1)
  {
    sub_100006380(1, "new_dataconn(client)", v6, v7, v8, v9, v10, v11, v30);
    unk_10000C050 = 0LL;
    *(void *)algn_10000C058 = 0LL;
    int v17 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&unk_10000C050);
    dword_10000C008 = v17;
    if (v17 == -1)
    {
      int v21 = "cannot get client listen socket (%m)";
      goto LABEL_29;
    }

    if (listen(v17, 5))
    {
      int v21 = "cannot listen on client socket (%m)";
      goto LABEL_29;
    }

    if (!dword_10000C060) {
      return 0LL;
    }
    uint64_t v18 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0LL);
    if (v18)
    {
      uint64_t v14 = v18;
      if (sub_100003300( v18,  1u,  (unsigned __int8 *)(a2 + 40),  (unsigned __int8 *)(a3 + 40),  (unsigned __int16)word_10000C052,  &v31) != -1)
      {
        xpc_object_t v19 = malloc(0x10uLL);
        uint64_t v16 = v31;
        if (v19)
        {
          void *v19 = qword_10000C078;
          v19[1] = v16;
          qword_10000C078 = (uint64_t)v19;
          PFUserRelease(v14, 0LL);
          return 0LL;
        }

LABEL_24:
        PFUserDeleteRule(v14, v16, 0LL);
      }

LABEL_25:
      PFUserRelease(v14, 0LL);
    }

LABEL_26:
    int v21 = "pf operation failed (%m)";
LABEL_29:
    int v22 = 5;
LABEL_30:
    syslog(v22, v21);
    sub_10000410C(71LL, v23, v24, v25, v26, v27, v28, v29);
  }

  qword_10000C040 = 0LL;
  *(void *)algn_10000C048 = 0LL;
  int v12 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&qword_10000C040);
  dword_10000C010 = v12;
  if (v12 == -1)
  {
    int v21 = "server socket bind() failed (%m)";
LABEL_23:
    int v22 = 6;
    goto LABEL_30;
  }

  if (listen(v12, 5))
  {
    int v21 = "server socket listen() failed (%m)";
    goto LABEL_23;
  }

  if (!dword_10000C060)
  {
    uint64_t v13 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0LL);
    if (v13)
    {
      uint64_t v14 = v13;
      if (sub_100003638( v13,  (unsigned __int8 *)&xmmword_10000C064,  (unsigned __int8 *)(a3 + 40),  bswap32(WORD1(qword_10000C040)) >> 16,  (unsigned __int8 *)(a2 + 40),  bswap32((unsigned __int16)word_10000C052) >> 16,  &v31) != -1)
      {
        xpc_object_t v15 = malloc(0x10uLL);
        uint64_t v16 = v31;
        if (v15)
        {
          void *v15 = qword_10000C078;
          v15[1] = v16;
          qword_10000C078 = (uint64_t)v15;
          PFUserRelease(v14, 0LL);
          qword_10000CCB8 = 0LL;
          return 0LL;
        }

        goto LABEL_24;
      }

      goto LABEL_25;
    }

    goto LABEL_26;
  }

  return 0LL;
}

uint64_t sub_100004094()
{
  uint64_t result = dword_10000C00C;
  if ((dword_10000C00C & 0x80000000) == 0)
  {
    shutdown(dword_10000C00C, 2);
    uint64_t result = close(dword_10000C00C);
    dword_10000C00C = -1;
  }

  return result;
}

uint64_t sub_1000040D0()
{
  uint64_t result = dword_10000C014;
  if ((dword_10000C014 & 0x80000000) == 0)
  {
    shutdown(dword_10000C014, 2);
    uint64_t result = close(dword_10000C014);
    dword_10000C014 = -1;
  }

  return result;
}

void sub_10000410C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  sub_100005EF0(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_100006380(1, "exit: %d", v9, v10, v11, v12, v13, v14, v8);
  exit(v8);
}

void sub_100004140(uint64_t a1, uint64_t a2)
{
  int v4 = *(char **)(a1 + 32);
  if (strlen(v4) >= 0x201)
  {
    syslog(5, "excessively long control command");
    goto LABEL_69;
  }

  if (dword_10000C080 && !strncasecmp(v4, "user ", 5uLL))
  {
    if (!strcasecmp(v4 + 5, "ftp\r\n") || !strcasecmp(v4 + 5, "anonymous\r\n")) {
      goto LABEL_44;
    }
    strcpy(__str, "500 Only anonymous FTP is allowed\r\n");
    size_t v48 = strlen(__str);
    unsigned int v49 = 0;
    while (1)
    {
      ssize_t v50 = send(*(_DWORD *)a1, &__str[v49], v48 - v49, 0);
      if (v50 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          return;
        }
      }

      else
      {
        v49 += v50;
      }
    }
  }

  if (strncasecmp(v4, "eprt ", 5uLL))
  {
    if (!dword_10000C088 && !strncasecmp(v4, "epsv", 4uLL))
    {
      strcpy(__str, "500 EPSV command not understood\r\n");
      sub_100006380(1, "to client (modified): %s", v5, v6, v7, v8, v9, v10, (char)__str);
      size_t v63 = strlen(__str);
      unsigned int v64 = 0;
      while (1)
      {
        ssize_t v65 = send(*(_DWORD *)a1, &__str[v64], v63 - v64, 0);
        if (v65 == -1)
        {
          if (*__error() != 35 && *__error() != 4) {
            return;
          }
        }

        else
        {
          v64 += v65;
        }
      }
    }

    if (strncasecmp(v4, "port ", 5uLL)) {
      goto LABEL_44;
    }
    sub_100006380(1, "Got a PORT command", v11, v12, v13, v14, v15, v16, v104);
    int v17 = (const char *)(*(void *)(a1 + 32) + 5LL);
    v107.ai_flags = 0;
    if (sscanf( v17,  "%u,%u,%u,%u,%u,%u",  &v107,  &v107.ai_family,  &v107.ai_socktype,  &v107.ai_protocol,  &v107.ai_addrlen,  &v107.ai_addrlen + 1) == 6)
    {
      for (uint64_t i = 0LL; i != 24; i += 4LL)
      {
      }

      byte_10000C051 = 2;
      dword_10000C054 = bswap32((v107.ai_family << 16) | (v107.ai_flags << 24) | (v107.ai_socktype << 8) | v107.ai_protocol);
      word_10000C052 = bswap32(*(&v107.ai_addrlen + 1) | (v107.ai_addrlen << 8)) >> 16;
      sub_100006380(1, "client wants us to use %u.%u.%u.%u:%u", v18, v19, v20, v21, v22, v23, v107.ai_flags);
      sub_100003DD0(1, a1, a2);
      dword_10000C084 = 1;
      v25.s_addr = *(_DWORD *)(a2 + 44);
      char v26 = inet_ntoa(v25);
      sub_100006380(1, "we want server to use %s:%u", v27, v28, v29, v30, v31, v32, v26);
      int v4 = __str;
      snprintf( __str,  0x64uLL,  "PORT %u,%u,%u,%u,%u,%u\r\n",  *(unsigned __int8 *)(a2 + 44),  *(unsigned __int8 *)(a2 + 45),  *(unsigned __int8 *)(a2 + 46),  *(unsigned __int8 *)(a2 + 47),  BYTE2(qword_10000C040),  BYTE3(qword_10000C040));
      sub_100006380(1, "to server (modified): %s", v33, v34, v35, v36, v37, v38, (char)__str);
      goto LABEL_45;
    }

LABEL_68:
    syslog(6, "malformed PORT command (%s)");
LABEL_69:
    sub_10000410C(65LL, v90, v91, v92, v93, v94, v95, v96);
  }

  v105 = 0LL;
  v39 = strdup(v4 + 5);
  if (!v39)
  {
    syslog(3, "insufficient memory");
    sub_10000410C(69LL, v97, v98, v99, v100, v101, v102, v103);
  }

  v40 = v39;
  uint64_t v41 = 0LL;
  v43 = v39 + 1;
  int v42 = *v39;
  v109 = 0LL;
  v110 = 0LL;
  v108 = 0LL;
  do
  {
    v44 = strchr(v43, v42);
    if (!v44 || *v44 != v42)
    {
      __endptr = v43;
      goto LABEL_33;
    }

    char *v44 = 0;
    v45 = v44 + 1;
    (&v108)[v41++] = v43;
    v43 = v45;
  }

  while (v41 != 3);
  __endptr = v45;
  v46 = v108;
  unint64_t v47 = strtoul(v108, &__endptr, 10);
  if (!*v46 || *__endptr)
  {
    if (v47 == 2)
    {
LABEL_21:
      int v4 = 0LL;
      strcpy(__str, "522 Protocol not supported, use (1)\r\n");
      goto LABEL_34;
    }

    goto LABEL_67;
  }

  memset(&v107, 0, sizeof(v107));
  if (v47 == 2) {
    goto LABEL_21;
  }
  if (v47 != 1)
  {
LABEL_67:
    int v4 = 0LL;
    strcpy(__str, "501 Protocol not supported\r\n");
    goto LABEL_34;
  }

  v107.ai_socktype = 1;
  *(void *)&v107.ai_flags = 0x200000004LL;
  if (getaddrinfo(v109, v110, &v107, &v105) || v105->ai_next || v105->ai_addrlen > 0x10)
  {
LABEL_33:
    int v4 = 0LL;
    strcpy(__str, "500 Invalid argument; rejected\r\n");
    goto LABEL_34;
  }

  __memcpy_chk(&unk_10000C050, v105->ai_addr);
  v66.s_addr = dword_10000C054;
  char v67 = inet_ntoa(v66);
  sub_100006380(1, "client wants us to use %s:%u", v68, v69, v70, v71, v72, v73, v67);
  sub_100003DD0(1, a1, a2);
  dword_10000C084 = 3;
  v74.s_addr = *(_DWORD *)(a2 + 44);
  char v75 = inet_ntoa(v74);
  sub_100006380(1, "we want server to use %s:%u", v76, v77, v78, v79, v80, v81, v75);
  v82.s_addr = *(_DWORD *)(a2 + 44);
  v83 = inet_ntoa(v82);
  int v4 = __str;
  snprintf(__str, 0x64uLL, "EPRT |%d|%s|%u|\r\n", 1, v83, bswap32(WORD1(qword_10000C040)) >> 16);
  sub_100006380(1, "to server (modified): %s", v84, v85, v86, v87, v88, v89, (char)__str);
LABEL_34:
  free(v40);
  if (v105) {
    freeaddrinfo(v105);
  }
  if (!v4)
  {
    sub_100006380(1, "to client (modified): %s", v51, v52, v53, v54, v55, v56, (char)__str);
    size_t v57 = strlen(__str);
    unsigned int v58 = 0;
    do
    {
      ssize_t v59 = send(*(_DWORD *)a1, &__str[v58], v57 - v58, 0);
      if (v59 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          break;
        }
      }

      else
      {
        v58 += v59;
      }
    }

    while ((v58 & 0x80000000) == 0 && v57 > (int)v58);
  }

LABEL_44:
  if (v4)
  {
LABEL_45:
    size_t v60 = strlen(v4);
    unsigned int v61 = 0;
    do
    {
      ssize_t v62 = send(*(_DWORD *)a2, &v4[v61], v60 - v61, 0);
      if (v62 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          return;
        }
      }

      else
      {
        v61 += v62;
      }
    }

    while ((v61 & 0x80000000) == 0 && v60 > (int)v61);
  }

ssize_t sub_100004868(uint64_t a1, uint64_t a2)
{
  if (strlen(*(const char **)(a1 + 32)) >= 0x401)
  {
    uint64_t v16 = "long FTP control reply";
LABEL_46:
    int v66 = 5;
LABEL_44:
    syslog(v66, v16, v74);
    sub_10000410C(65LL, v67, v68, v69, v70, v71, v72, v73);
  }

  uint64_t v10 = strtol(*(const char **)(a1 + 32), &__endptr, 10);
  uint64_t v11 = *(char **)(a1 + 32);
  uint64_t v12 = *v11;
  if ((v12 & 0x80) != 0)
  {
    __uint32_t v13 = __maskrune(v12, 0x4000uLL);
    uint64_t v11 = *(char **)(a1 + 32);
    LODWORD(v12) = *v11;
  }

  else
  {
    __uint32_t v13 = _DefaultRuneLocale.__runetype[v12] & 0x4000;
  }

  if (v13) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = v10;
  }
  if (!(_DWORD)v12 || (int v15 = *__endptr, v15 != 32) && v15 != 45)
  {
    if ((byte_10000CCC0 & 1) != 0) {
      goto LABEL_15;
    }
    uint64_t v16 = "malformed control reply";
    goto LABEL_43;
  }

  if ((unint64_t)(v14 - 1000) <= 0xFFFFFFFFFFFFFC18LL)
  {
    if ((byte_10000CCC0 & 1) != 0) {
      goto LABEL_15;
    }
    uint64_t v74 = v14;
    uint64_t v16 = "invalid server reply code %ld";
    goto LABEL_43;
  }

  byte_10000CCC0 = v15 == 45;
  if (v14 != 227 || dword_10000C088 != 0)
  {
    if (dword_10000C088)
    {
      if (v14 == 234)
      {
        sub_100006380(1, "Got 'authentication exchange complete' reply", v4, v5, v6, v7, v8, v9, v74);
        sub_100006380(1, "{%s}", v21, v22, v23, v24, v25, v26, *(void *)(a1 + 32));
        dword_10000C084 = 5;
        uint64_t v11 = *(char **)(a1 + 32);
        if (fcntl(*(_DWORD *)a2, 4, 4LL) == -1 || fcntl(*(_DWORD *)a1, 4, 4LL) == -1)
        {
          syslog(3, "fcntl F_SETFL O_NONBLOCK error");
          sub_10000410C(71LL, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }

    goto LABEL_15;
  }

  sub_100006380(1, "Got a PASV reply", v4, v5, v6, v7, v8, v9, v74);
  sub_100006380(1, "{%s}", v34, v35, v36, v37, v38, v39, *(void *)(a1 + 32));
  v40 = *(const char **)(a1 + 32);
  uint64_t v41 = strchr(v40, 40);
  if (!v41)
  {
    uint64_t v41 = strrchr(v40, 32);
    if (!v41)
    {
      uint64_t v16 = "malformed 227 reply";
      goto LABEL_46;
    }
  }

  int v76 = 0;
  if (sscanf(v41 + 1, "%u,%u,%u,%u,%u,%u", &v76, &v77, &v78, &v79, &v80, &v81) != 6)
  {
    uint64_t v74 = *(void *)(a2 + 32);
    uint64_t v16 = "malformed PASV reply (%s)";
    goto LABEL_43;
  }

  for (uint64_t i = 0LL; i != 24; i += 4LL)
  {
    if (*(unsigned int *)((char *)&v76 + i) >= 0x100)
    {
      uint64_t v74 = *(void *)(a2 + 32);
      uint64_t v16 = "malformed PASV reply(%s)";
LABEL_43:
      int v66 = 6;
      goto LABEL_44;
    }
  }

  BYTE1(qword_10000C040) = 2;
  v43.s_addr = bswap32((v77 << 16) | (v76 << 24) | (v78 << 8) | v79);
  HIDWORD(qword_10000C040) = v43;
  WORD1(qword_10000C040) = bswap32(v81 | (v80 << 8)) >> 16;
  char v44 = inet_ntoa(v43);
  sub_100006380(1, "server wants us to use %s:%u", v45, v46, v47, v48, v49, v50, v44);
  sub_100003DD0(0, a2, a1);
  dword_10000C084 = 2;
  if (dword_10000C060) {
    uint64_t v51 = (unsigned __int8 *)&unk_10000C090;
  }
  else {
    uint64_t v51 = (unsigned __int8 *)(a1 + 44);
  }
  v52.s_addr = *(_DWORD *)v51;
  char v53 = inet_ntoa(v52);
  sub_100006380(1, "we want client to use %s:%u", v54, v55, v56, v57, v58, v59, v53);
  uint64_t v11 = __str;
  snprintf( __str,  0x64uLL,  "227 Entering Passive Mode (%u,%u,%u,%u,%u,%u)\r\n",  *v51,  v51[1],  v51[2],  v51[3],  word_10000C052,  HIBYTE(word_10000C052));
  sub_100006380(1, "to client (modified): %s", v60, v61, v62, v63, v64, v65, (char)__str);
LABEL_15:
  size_t v17 = strlen(v11);
  unsigned int v18 = 0;
  while (2)
  {
    ssize_t result = send(*(_DWORD *)a2, &v11[v18], v17 - v18, 0);
    if (result != -1)
    {
      v18 += result;
      goto LABEL_20;
    }

    ssize_t result = (ssize_t)__error();
    if (*(_DWORD *)result == 35 || (ssize_t result = (ssize_t)__error(), *(_DWORD *)result == 4))
    {
LABEL_20:
      continue;
    }

    return result;
  }

uint64_t sub_100004CC4(uint64_t a1)
{
  unsigned int v1 = (void *)qword_10000C078;
  if (!qword_10000C078) {
    return 0LL;
  }
  while (v1[1] != a1)
  {
    unsigned int v1 = (void *)*v1;
    if (!v1) {
      return 0LL;
    }
  }

  return 1LL;
}

void start(int a1, char *const *a2)
{
  int v168 = 1;
  if (sandbox_init("ftp-proxy-embedded", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
    exit(-1);
  }

  int v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
  if (v4 == -1) {
    goto LABEL_4;
  }
  uint64_t v5 = 0LL;
  uint64_t v164 = 0LL;
  do
  {
    uint64_t v6 = v5;
    if (v4 > 96)
    {
      uint64_t v5 = 1LL;
      switch(v4)
      {
        case 'g':
          qword_10000C0A0 = (uint64_t)optarg;
          goto LABEL_44;
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'o':
        case 'q':
        case 's':
          goto LABEL_4;
        case 'm':
          unsigned int v7 = strtol(optarg, __endptr, 10);
          dword_10000C000 = v7;
LABEL_31:
          if (!*optarg) {
            goto LABEL_4;
          }
          if (*__endptr[0]) {
            goto LABEL_4;
          }
          uint64_t v5 = v6;
          if (v7 >= 0x10000) {
            goto LABEL_4;
          }
          break;
        case 'n':
          dword_10000C088 = 1;
          goto LABEL_44;
        case 'p':
          break;
        case 'r':
          dword_10000CCB4 = 1;
          goto LABEL_44;
        case 't':
          uint64_t v164 = strtol(optarg, __endptr, 10);
          goto LABEL_38;
        case 'u':
          off_10000C018 = optarg;
          goto LABEL_44;
        default:
          if (v4 != 97 || !*optarg) {
            goto LABEL_4;
          }
          dword_10000C020 = inet_addr(optarg);
          uint64_t v5 = v6;
          if (dword_10000C020 == -1)
          {
            syslog(5, "%s: invalid address", optarg);
            sub_100005E74();
          }

          return;
      }
    }

    else
    {
      switch(v4)
      {
        case 'M':
          unsigned int v7 = strtol(optarg, __endptr, 10);
          dword_10000C004 = v7;
          goto LABEL_31;
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'T':
        case 'U':
          goto LABEL_4;
        case 'R':
          if (!*optarg) {
            goto LABEL_4;
          }
          uint64_t v8 = strdup(optarg);
          if (!v8)
          {
            syslog(5, "Insufficient memory (malloc failed)");
            goto LABEL_64;
          }

          uint64_t v9 = v8;
          xmmword_10000C064 = 0x210uLL;
          uint64_t v10 = strchr(v8, 58);
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = strtol(v10 + 1, __endptr, 10);
            if (*__endptr[0] || v12 < 1 || v12 >= 0x10000) {
              goto LABEL_4;
            }
            WORD1(xmmword_10000C064) = bswap32(v12) >> 16;
            *uint64_t v11 = 0;
          }

          else
          {
            WORD1(xmmword_10000C064) = 5376;
          }

          DWORD1(xmmword_10000C064) = inet_addr(v9);
          if (DWORD1(xmmword_10000C064) == -1) {
            goto LABEL_4;
          }
          free(v9);
          dword_10000C060 = 1;
          goto LABEL_44;
        case 'S':
          if (!inet_aton(optarg, (in_addr *)&dword_10000C0A8)) {
            goto LABEL_4;
          }
          break;
        case 'V':
          dword_10000C028 = 1;
          goto LABEL_44;
        default:
          if (v4 == 65)
          {
            dword_10000C080 = 1;
LABEL_44:
            uint64_t v5 = v6;
          }

          else
          {
            if (v4 != 68) {
              goto LABEL_4;
            }
            dword_10000CCB0 = strtol(optarg, __endptr, 10);
LABEL_38:
            if (!*optarg) {
              goto LABEL_4;
            }
            uint64_t v5 = v6;
            if (*__endptr[0]) {
              goto LABEL_4;
            }
          }

          break;
      }
    }

    int v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
  }

  while (v4 != -1);
  if (dword_10000C004 < dword_10000C000 || !(_DWORD)v5) {
LABEL_4:
  }
    sub_100005E74();
  openlog(__progname, 9, 24);
  setlinebuf(__stdoutp);
  setlinebuf(__stderrp);
  memset(__endptr, 0, sizeof(__endptr));
  uint64_t v175 = 0LL;
  memset(v172, 0, sizeof(v172));
  uint64_t v173 = 0LL;
  if (dword_10000CCB4) {
    int v20 = 0;
  }
  else {
    int v20 = 10;
  }
  unsigned int v21 = getnameinfo((const sockaddr *)&__endptr[5], 0x10u, byte_10000C0AC, 0x401u, 0LL, 0, v20);
  if (v21 <= 8 && ((1 << v21) & 0x105) != 0)
  {
    unsigned int v28 = getnameinfo((const sockaddr *)&xmmword_10000C064, 0x10u, byte_10000C4AD, 0x401u, 0LL, 0, v20);
    if (v28 <= 8 && ((1 << v28) & 0x105) != 0)
    {
      LODWORD(__endptr[0]) = 0;
      syslog( 6,  "accepted connection from %s:%u to %s:%u",  byte_10000C0AC,  bswap32(WORD1(__endptr[5])) >> 16,  byte_10000C4AD,  bswap32(WORD1(xmmword_10000C064)) >> 16);
      LODWORD(v172[0]) = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v172[5]);
      if (connect(v172[0], (const sockaddr *)&xmmword_10000C064, 0x10u))
      {
        syslog(6, "cannot connect to %s:%u (%m)");
        goto LABEL_66;
      }

      socklen_t v169 = 16;
      getsockname(v172[0], (sockaddr *)&v172[5], &v169);
      unsigned int v29 = getnameinfo((const sockaddr *)&v172[5], 0x10u, byte_10000C8AE, 0x401u, 0LL, 0, v20);
      if (v29 <= 8 && ((1 << v29) & 0x105) != 0)
      {
        sub_100006380(1, "local socket is %s:%u", v22, v23, v24, v25, v26, v27, (char)byte_10000C8AE);
        v171.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
        *(void *)&v171.sa_mask = 0x200000000LL;
        if (sigaction(13, &v171, &v170))
        {
          syslog(3, "sigaction() failed (%m)");
          goto LABEL_204;
        }

        v171.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100005EC4;
        *(void *)&v171.sa_mask = 0LL;
        sigaction(2, &v171, 0LL);
        sigaction(15, &v171, 0LL);
        if (setsockopt((int)__endptr[0], 0xFFFF, 256, &v168, 4u) == -1)
        {
          syslog(5, "cannot set SO_OOBINLINE (%m)");
          goto LABEL_204;
        }

        in_addr v52 = (char *)malloc(0x400uLL);
        __endptr[4] = v52;
        char v53 = (char *)malloc(0x400uLL);
        *(_OWORD *)((char *)__endptr + 4) = xmmword_100007F20;
        LOBYTE(v175) = 1;
        __endptr[3] = v53;
        __endptr[9] = "client";
        HIDWORD(v175) = 0;
        *(_OWORD *)&__endptr[7] = *(_OWORD *)&__endptr[5];
        uint64_t v54 = malloc(0x400uLL);
        v172[4] = v54;
        uint64_t v55 = malloc(0x400uLL);
        v172[3] = v55;
        *(_OWORD *)((char *)v172 + 4) = xmmword_100007F20;
        LOBYTE(v173) = 1;
        v172[9] = "server";
        HIDWORD(v173) = 1;
        *(_OWORD *)&v172[7] = xmmword_10000C064;
        if (!v52 || !v53 || !v54 || !v55)
        {
LABEL_202:
          syslog(5, "insufficient memory");
LABEL_64:
          sub_10000410C(69LL, v37, v38, v39, v40, v41, v42, v43);
        }

        int v62 = 1;
        int v63 = 1;
        while (1)
        {
          int v64 = (int)__endptr[0];
          if (SLODWORD(__endptr[0]) <= dword_10000C008) {
            int v64 = dword_10000C008;
          }
          if (v64 <= dword_10000C00C) {
            int v64 = dword_10000C00C;
          }
          if (v64 <= SLODWORD(v172[0])) {
            int v64 = v172[0];
          }
          if (v64 <= dword_10000C010) {
            int v64 = dword_10000C010;
          }
          if (v64 <= dword_10000C014) {
            int v64 = dword_10000C014;
          }
          int v65 = v64 & ~(v64 >> 31);
          if (v63) {
            int v66 = "alive";
          }
          else {
            int v66 = "dead";
          }
          if (v62) {
            uint64_t v67 = "alive";
          }
          else {
            uint64_t v67 = "dead";
          }
          v163 = v67;
          sub_100006380(3, "client is %s; server is %s", v56, v57, v58, v59, v60, v61, (char)v66);
          unint64_t v68 = (v65 + 1);
          if ((((_BYTE)v65 + 1) & 0x1F) != 0) {
            size_t v69 = (v68 >> 5) + 1;
          }
          else {
            size_t v69 = v68 >> 5;
          }
          uint64_t v70 = (fd_set *)calloc(v69, 4uLL);
          if (!v70) {
            goto LABEL_202;
          }
          uint64_t v71 = v70;
          if (dword_10000C084 == 5)
          {
            if (!(_BYTE)v175) {
              goto LABEL_110;
            }
            int v72 = (int)__endptr[0];
            int v79 = "ready";
            if (!BYTE2(v175)) {
              int v79 = "waiting";
            }
            sub_100006380(3, "client is %s", v73, v74, v75, v76, v77, v78, (char)v79);
            if (BYTE2(v175))
            {
              if ((int)sub_100006730((uint64_t)"secure client to server", (int)__endptr[0], v172[0]) < 1)
              {
                int v80 = 1;
              }

              else
              {
                int v80 = 0;
                BYTE2(v175) = 0;
              }
            }

            else
            {
LABEL_110:
              int v80 = 0;
            }

            if ((_BYTE)v173)
            {
              int v87 = v172[0];
              if (__darwin_check_fd_set_overflow(v172[0], v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + (((unint64_t)v87 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v87;
              }
              uint64_t v94 = "ready";
              if (!BYTE2(v173)) {
                uint64_t v94 = "waiting";
              }
              sub_100006380(3, "server is %s", v88, v89, v90, v91, v92, v93, (char)v94);
              if (BYTE2(v173))
              {
                BYTE2(v173) = 0;
              }
            }

            if (v80)
            {
LABEL_206:
              close((int)__endptr[0]);
              close(v172[0]);
              free(v71);
LABEL_207:
              if (dword_10000C028) {
                syslog(6, "session ended");
              }
LABEL_209:
              sub_10000410C(0LL, v159, v56, v57, v58, v59, v60, v61);
            }
          }

          else
          {
            if ((_BYTE)v175 && sub_100006158((uint64_t)__endptr, (int *)v172))
            {
              sub_100006380(3, "client line buffer is %s", v81, v82, v83, v84, v85, v86, (char)__endptr[4]);
              if (*__endptr[4]) {
                sub_100004140((uint64_t)__endptr, (uint64_t)v172);
              }
              goto LABEL_195;
            }

            if ((_BYTE)v173 && sub_100006158((uint64_t)v172, (int *)__endptr))
            {
              sub_100006380(3, "server line buffer is %s", v121, v122, v123, v124, v125, v126, v172[4]);
              if (*(_BYTE *)v172[4]) {
                sub_100004868((uint64_t)v172, (uint64_t)__endptr);
              }
              goto LABEL_195;
            }

            if ((_BYTE)v175)
            {
              int v127 = (int)__endptr[0];
              unint64_t v128 = dword_10000C008;
              if ((dword_10000C008 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C008, v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + ((v128 >> 3) & 0x1FFFFFFC)) |= 1 << v128;
              }
              unint64_t v129 = dword_10000C00C;
              if ((dword_10000C00C & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C00C, v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + ((v129 >> 3) & 0x1FFFFFFC)) |= 1 << v129;
              }
            }

            if ((_BYTE)v173)
            {
              int v130 = v172[0];
              if (__darwin_check_fd_set_overflow(v172[0], v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + (((unint64_t)v130 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v130;
              }
              unint64_t v131 = dword_10000C010;
              if ((dword_10000C010 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C010, v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + ((v131 >> 3) & 0x1FFFFFFC)) |= 1 << v131;
              }
              unint64_t v132 = dword_10000C014;
              if ((dword_10000C014 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C014, v71, 0)) {
                *(__int32_t *)((char *)v71->fds_bits + ((v132 >> 3) & 0x1FFFFFFC)) |= 1 << v132;
              }
            }
          }

          uint64_t v166 = v164;
          int v167 = 0;
          for (uint64_t i = v164; ; uint64_t i = v166)
          {
            uint64_t v96 = i ? (timeval *)&v166 : 0LL;
            int v97 = select(v68, v71, 0LL, 0LL, v96);
            if (v97 != -1) {
              break;
            }
            if (*__error() != 4 && *__error() != 35)
            {
              syslog(5, "select() failed (%m)");
              goto LABEL_204;
            }
          }

          if (!v97)
          {
            uint64_t v98 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0LL);
            if (!v98
              || (uint64_t v105 = v98,
                  int v106 = sub_10000317C(v98, (uint64_t *)&v178, v99, v100, v101, v102, v103, v104),
                  PFUserRelease(v105, 0LL),
                  v106 < 0)
              || v178.tv_sec == qword_10000CCB8)
            {
              syslog(6, "timeout: no data for %ld seconds");
              goto LABEL_209;
            }

            sub_100006380(3, "transfer: server to client %llu packets", v107, v108, v109, v110, v111, v112, v178.tv_sec);
            qword_10000CCB8 = v178.tv_sec;
          }

          unint64_t v113 = dword_10000C00C;
          if ((dword_10000C00C & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C00C, v71, 0)
            && ((*(unsigned int *)((char *)v71->fds_bits + ((v113 >> 3) & 0x1FFFFFFC)) >> v113) & 1) != 0)
          {
            sub_100006380(3, "transfer: client to server", v114, v115, v116, v117, v118, v119, v161);
            int v120 = sub_100006730((uint64_t)"client to server", dword_10000C00C, dword_10000C014);
            if (v120 <= 0)
            {
              sub_100004094();
              sub_1000040D0();
              sub_100003A1C();
            }

            else
            {
              LODWORD(qword_10000C038) = qword_10000C038 + v120;
            }
          }

          unint64_t v133 = dword_10000C014;
          if ((dword_10000C014 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C014, v71, 0)
            && ((*(unsigned int *)((char *)v71->fds_bits + ((v133 >> 3) & 0x1FFFFFFC)) >> v133) & 1) != 0)
          {
            sub_100006380(3, "transfer: server to client", v134, v135, v136, v137, v138, v139, v161);
            int v140 = sub_100006730((uint64_t)"server to client", dword_10000C014, dword_10000C00C);
            if (v140 <= 0)
            {
              sub_100004094();
              sub_1000040D0();
              sub_100003A1C();
            }

            else
            {
              HIDWORD(qword_10000C038) += v140;
            }
          }

          unint64_t v141 = dword_10000C010;
          if ((dword_10000C010 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C010, v71, 0)
            && ((*(unsigned int *)((char *)v71->fds_bits + ((v141 >> 3) & 0x1FFFFFFC)) >> v141) & 1) != 0)
          {
            sub_100006380(2, "server listen socket ready", v142, v143, v144, v145, v146, v147, v161);
            sub_1000040D0();
            sub_100004094();
            socklen_t v176 = 16;
            dword_10000C014 = accept(dword_10000C010, &v177, &v176);
            if (dword_10000C014 < 0) {
              goto LABEL_210;
            }
            close(dword_10000C010);
            dword_10000C010 = -1;
            if (getuid())
            {
              *(_DWORD *)&v177.sa_data[2] = dword_10000C0A8;
              int v148 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v177);
              dword_10000C00C = v148;
              if (v148 < 0) {
                goto LABEL_211;
              }
            }

            else
            {
              dword_10000C00C = socket(2, 1, 0);
              socklen_t v176 = 1;
              v177.sa_family = 2;
              *(_DWORD *)&v177.sa_data[2] = dword_10000C0A8;
              *(_WORD *)v177.sa_data = 5120;
              if (setsockopt(dword_10000C00C, 0xFFFF, 4, &v176, 4u) == -1)
              {
                syslog(5, "setsockopt() failed (%m)");
                goto LABEL_204;
              }

              if (bind(dword_10000C00C, &v177, 0x10u) == -1)
              {
                syslog(5, "data channel bind() failed (%m)");
LABEL_204:
                sub_10000410C(71LL, v30, v31, v32, v33, v34, v35, v36);
              }

              int v148 = dword_10000C00C;
            }

            if (connect(v148, (const sockaddr *)&unk_10000C050, 0x10u))
            {
              syslog(6, "cannot connect data channel (%m)");
              goto LABEL_66;
            }

            qword_10000C038 = 0LL;
            gettimeofday(&v178, 0LL);
            *(double *)&qword_10000C030 = (double)v178.tv_usec / 1000000.0 + (double)v178.tv_sec;
          }

          unint64_t v149 = dword_10000C008;
          if ((dword_10000C008 & 0x80000000) == 0
            && __darwin_check_fd_set_overflow(dword_10000C008, v71, 0)
            && ((*(unsigned int *)((char *)v71->fds_bits + ((v149 >> 3) & 0x1FFFFFFC)) >> v149) & 1) != 0)
          {
            sub_100006380(2, "client listen socket ready", v150, v151, v152, v153, v154, v155, v161);
            sub_1000040D0();
            sub_100004094();
            socklen_t v176 = 16;
            dword_10000C00C = accept(dword_10000C008, &v177, &v176);
            if (dword_10000C00C < 0)
            {
LABEL_210:
              syslog(5, "accept() failed (%m)");
              goto LABEL_204;
            }

            close(dword_10000C008);
            dword_10000C008 = -1;
            *(void *)&v177.sa_len = 0LL;
            *(void *)&v177.sa_data[6] = 0LL;
            int v156 = sub_1000069A4(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v177);
            dword_10000C014 = v156;
            if (v156 < 0)
            {
LABEL_211:
              syslog(5, "get_backchannel_socket() failed (%m)");
              goto LABEL_204;
            }

            if (connect(v156, (const sockaddr *)&qword_10000C040, 0x10u))
            {
              syslog(5, "connect() failed (%m)", v162, v163);
LABEL_66:
              sub_10000410C(68LL, v44, v45, v46, v47, v48, v49, v50);
            }

            qword_10000C038 = 0LL;
            gettimeofday(&v178, 0LL);
            *(double *)&qword_10000C030 = (double)v178.tv_usec / 1000000.0 + (double)v178.tv_sec;
          }

          if ((_BYTE)v175)
          {
            int v157 = (int)__endptr[0];
            if (__darwin_check_fd_set_overflow((int)__endptr[0], v71, 0))
            {
            }
          }

          if ((_BYTE)v173)
          {
            int v158 = v172[0];
            if (__darwin_check_fd_set_overflow(v172[0], v71, 0))
            {
            }
          }

LABEL_195:
          free(v71);
          if (BYTE1(v175))
          {
            shutdown(v172[0], 1);
            shutdown((int)__endptr[0], 0);
            LOWORD(v175) = 0;
          }

          if (BYTE1(v173))
          {
            shutdown((int)__endptr[0], 1);
            shutdown(v172[0], 0);
            int v62 = 0;
            LOWORD(v173) = 0;
          }

          else
          {
            int v62 = v173;
          }

          int v63 = v175;
        }
      }

      uint64_t v51 = "name resolution failure (local)";
    }

    else
    {
      uint64_t v51 = "name resolution failure (server)";
    }
  }

  else
  {
    uint64_t v51 = "name resolution failure (client)";
  }

  sub_100006380(2, v51, v22, v23, v24, v25, v26, v27, v160);
  goto LABEL_204;
}

void sub_100005E74()
{
}

void sub_100005EC4( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005EF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10000C078)
  {
    uint64_t v8 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (uint64_t *)qword_10000C078;
      if (qword_10000C078)
      {
        do
        {
          uint64_t v12 = (uint64_t *)*v10;
          uint64_t v11 = v10[1];
          if (v11) {
            PFUserDeleteRule(v9, v11, 0LL);
          }
          uint64_t v13 = (uint64_t *)qword_10000C078;
          if ((uint64_t *)qword_10000C078 == v10)
          {
            uint64_t v14 = &qword_10000C078;
          }

          else
          {
            do
            {
              uint64_t v14 = v13;
              uint64_t v13 = (uint64_t *)*v13;
            }

            while (v13 != v10);
          }

          *uint64_t v14 = *v10;
          free(v10);
          uint64_t v10 = v12;
        }

        while (v12);
      }

      PFUserRelease(v9, 0LL);
    }
  }

uint64_t sub_100005FD4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 82) || *(_BYTE *)(a1 + 81)) {
    return 0LL;
  }
  int v3 = *(_DWORD *)(a1 + 12);
  uint64_t v4 = *(int *)(a1 + 16);
  if (v3 <= (int)v4)
  {
    if (v3 != (_DWORD)v4)
    {
      syslog(3, "next_byte(%d) > io_buffer_len(%d)", *(_DWORD *)(a1 + 16), v3);
      exit(71);
    }

    int v5 = 0;
  }

  else
  {
    int v5 = v3 - v4;
    memmove(*(void **)(a1 + 24), (const void *)(*(void *)(a1 + 24) + v4), v3 - (int)v4);
  }

  *(_DWORD *)(a1 + 12) = v5;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v6 = *(int *)(a1 + 8);
  int v7 = v6 - v5;
  if ((int)v6 - v5 <= 128)
  {
    *(_DWORD *)(a1 + 8) = v6 + 128;
    uint64_t v8 = realloc(*(void **)(a1 + 24), v6 + 128);
    if (!v8)
    {
      syslog(6, "Insufficient memory");
      exit(69);
    }

    *(void *)(a1 + 24) = v8;
    int v5 = *(_DWORD *)(a1 + 12);
    int v7 = *(_DWORD *)(a1 + 8) - v5;
  }

  size_t v9 = v7 - 1;
  while (1)
  {
    ssize_t v10 = read(*(_DWORD *)a1, (void *)(*(void *)(a1 + 24) + v5), v9);
    *(_BYTE *)(a1 + 82) = 0;
    if (v10 != -1) {
      break;
    }
    if (*__error() != 35 && *__error() != 4)
    {
      if (*__error() != 54)
      {
        syslog(6, "read() failed on socket from %s (%m)", *(const char **)(a1 + 72));
        exit(65);
      }

      goto LABEL_19;
    }

    int v5 = *(_DWORD *)(a1 + 12);
  }

  if (v10)
  {
    *(_DWORD *)(a1 + 12) += v10;
    return 1LL;
  }

LABEL_19:
  uint64_t result = 0LL;
  *(_BYTE *)(a1 + 81) = 1;
  return result;
}

uint64_t sub_100006158(uint64_t a1, int *a2)
{
  **(_BYTE **)(a1 + 32) = 0;
  int v4 = *(_DWORD *)(a1 + 16);
  if (v4 == *(_DWORD *)(a1 + 12))
  {
    uint64_t result = sub_100005FD4(a1);
    if (!(_DWORD)result) {
      return result;
    }
    int v4 = *(_DWORD *)(a1 + 16);
  }

  uint64_t v6 = *(void *)(a1 + 24);
  int v7 = *(_DWORD *)(a1 + 12);
  if (*(unsigned __int8 *)(v6 + v4) == 255)
  {
    if (v7 - v4 <= 2)
    {
      uint64_t result = sub_100005FD4(a1);
      if (!(_DWORD)result) {
        return result;
      }
      int v4 = *(_DWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 12) - v4 < 3) {
        return 0LL;
      }
      uint64_t v6 = *(void *)(a1 + 24);
    }

    uint64_t v16 = v4 + 2LL;
    *(_DWORD *)(a1 + 16) = v16;
    char v17 = *(_BYTE *)(v6 + v4 + 1);
    if ((v17 + 5) <= 3u)
    {
      v18[0] = -1;
      v18[1] = v17;
      *(_DWORD *)(a1 + 16) = v4 + 3;
      v18[2] = *(_BYTE *)(v6 + v16);
      send(*a2, v18, 3uLL, a2[21]);
    }
  }

  else
  {
    uint64_t v8 = v4;
    int v9 = v4;
    if (v7 > v4)
    {
      ssize_t v10 = (unsigned __int8 *)(v6 + v4);
      int v9 = v4;
      while (1)
      {
        int v12 = *v10++;
        int v11 = v12;
        if (v12 == 10) {
          break;
        }
        if (!v11)
        {
          syslog(6, "got NUL byte from %s - bye!", *(const char **)(a1 + 72));
          exit(65);
        }

        if (v7 == ++v9) {
          return sub_100005FD4(a1);
        }
      }
    }

    if (v9 == v7) {
      return sub_100005FD4(a1);
    }
    int v13 = v9 - v4;
    uint64_t v14 = *(void **)(a1 + 32);
    if (v9 - v4 > *(_DWORD *)(a1 + 4) - 5)
    {
      *(_DWORD *)(a1 + 4) = v13 + 256;
      uint64_t v14 = realloc(v14, v13 + 256);
      if (!v14)
      {
        syslog(6, "Insufficient memory");
        exit(69);
      }

      *(void *)(a1 + 32) = v14;
      int v4 = *(_DWORD *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v8 = v4;
    }

    int v15 = v9 - v4 + 1;
    memcpy(v14, (const void *)(v6 + v8), v15);
    *(_DWORD *)(a1 + 16) += v15;
    *(_BYTE *)(*(void *)(a1 + 32) + sub_100005EF0(v8, v9, v10, v11, v12, v13, v14, v15) = 0;
  }

  return 1LL;
}

void sub_100006380( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_10000CCB0 >= a1) {
    vsyslog(7, a2, &a9);
  }
}

uint64_t sub_1000063BC(int a1, uint64_t a2, uint64_t a3, sockaddr *a4)
{
  socklen_t v20 = 16;
  if (getsockname(a1, a4, &v20))
  {
    uint64_t v8 = "getsockname() failed (%m)";
LABEL_5:
    int v9 = 3;
    goto LABEL_6;
  }

  socklen_t v20 = 16;
  if (getpeername(a1, (sockaddr *)a3, &v20))
  {
    uint64_t v8 = "getpeername() failed (%m)";
    goto LABEL_5;
  }

  if (dword_10000C060) {
    return 0LL;
  }
  uint64_t v11 = PFUserCreate(kPFFTPProxy, kPFBase, &_dispatch_main_q, 0LL);
  if (v11)
  {
    uint64_t v12 = v11;
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v13 || !v14 || (uint64_t v16 = v15) == 0LL)
    {
      syslog(6, "xpc_dictionary_create failed");
      PFUserRelease(v12, 0LL);
      return 0xFFFFFFFFLL;
    }

    xpc_dictionary_set_uint64(v13, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v13, kPFProtocol, 6uLL);
    xpc_dictionary_set_uint64(v13, kPFDirection, 2uLL);
    *(_OWORD *)string = 0u;
    memset(v22, 0, sizeof(v22));
    inet_ntop(2, (const void *)(a3 + 4), string, 0x2Eu);
    xpc_dictionary_set_string(v14, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v14, kPFSubLowPort, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
    xpc_dictionary_set_uint64(v14, kPFSubPortOperator, 0LL);
    *(_OWORD *)string = 0u;
    memset(v22, 0, sizeof(v22));
    inet_ntop(2, &a4->sa_data[2], string, 0x2Eu);
    xpc_dictionary_set_string(v16, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v16, kPFSubLowPort, bswap32(*(unsigned __int16 *)a4->sa_data) >> 16);
    xpc_dictionary_set_uint64(v16, kPFSubPortOperator, 0LL);
    xpc_dictionary_set_value(v13, kPFFrom, v14);
    xpc_dictionary_set_value(v13, kPFTo, v16);
    char v17 = (void *)PFUserNATLook_S(v12, v13);
    xpc_release(v16);
    xpc_release(v14);
    xpc_release(v13);
    PFUserRelease(v12, 0LL);
    if (v17)
    {
      *(void *)a2 = 0LL;
      *(void *)(a2 + 8) = 0LL;
      xpc_object_t value = xpc_dictionary_get_value(v17, kPFNATDest);
      *(_WORD *)(a2 + 2) = bswap32(xpc_dictionary_get_uint64(value, kPFSubLowPort)) >> 16;
      uint64_t v19 = xpc_dictionary_get_string(value, kPFSubAddress);
      inet_pton(2, v19, (void *)(a2 + 4));
      xpc_release(v17);
      uint64_t result = 0LL;
      *(_WORD *)a2 = 528;
      return result;
    }

    uint64_t v8 = "PFUserNATLook failed";
  }

  else
  {
    uint64_t v8 = "pf user create failed";
  }

  int v9 = 6;
LABEL_6:
  syslog(v9, v8);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100006730(uint64_t a1, int a2, int a3)
{
  if (ioctl(a2, 0x40047307uLL) < 0)
  {
    int v15 = *__error();
    uint64_t v31 = a1;
    uint64_t v16 = "cannot ioctl(SIOCATMARK) socket from %s (%m)";
LABEL_16:
    int v17 = 3;
LABEL_29:
    syslog(v17, v16, v31, v32);
    *__error() = v15;
    return 0xFFFFFFFFLL;
  }

  BOOL v6 = v33 != 0;
  while (1)
  {
    ssize_t v7 = recv(a2, v34, 0x1000uLL, v6);
    ssize_t v14 = v7;
    if (!v6 || v7 != -1) {
      break;
    }
    if (*__error() == 22)
    {
      ssize_t v14 = recv(a2, v34, 0x1000uLL, 0);
      BOOL v6 = 0LL;
      break;
    }

    BOOL v6 = 1LL;
LABEL_10:
    if (*__error() != 35 && *__error() != 4)
    {
      int v15 = *__error();
      uint64_t v31 = a1;
      BOOL v32 = v6;
      uint64_t v16 = "xfer_data (%s): failed (%m) with flags 0%o";
      goto LABEL_16;
    }
  }

  if (v14 == -1) {
    goto LABEL_10;
  }
  if (!v14)
  {
    sub_100006380(3, "EOF on read socket", v8, v9, v10, v11, v12, v13, (char)&v33);
    return 0LL;
  }

  sub_100006380(3, "got %d bytes from socket", v8, v9, v10, v11, v12, v13, v14);
  if (v14 < 1) {
    return 0LL;
  }
  uint64_t v18 = 0LL;
  LODWORD(v19) = 0;
  do
  {
    socklen_t v20 = &v34[v18];
    size_t v21 = v14 - v18;
    while (1)
    {
      while (1)
      {
        ssize_t v22 = send(a3, v20, v21, v6);
        if (v22 != -1) {
          break;
        }
        if (*__error() != 35 && *__error() != 4)
        {
          int v15 = *__error();
          uint64_t v16 = "write failed (%m)";
          int v17 = 6;
          goto LABEL_29;
        }
      }

      int v29 = v22;
      if (v22) {
        break;
      }
      sub_100006380(3, "zero-length write", v23, v24, v25, v26, v27, v28, v31);
    }

    sub_100006380(3, "wrote %d bytes to socket", v23, v24, v25, v26, v27, v28, v22);
    uint64_t v19 = (v19 + v29);
    uint64_t v18 = (int)v19;
  }

  while (v14 > (int)v19);
  return v19;
}

uint64_t sub_1000069A4(int a1, signed int a2, signed int a3, signed int a4, int a5, uint64_t a6)
{
  if (a5 == -1) {
    int v6 = -1;
  }
  else {
    int v6 = 1;
  }
  unsigned int v7 = a3 - a2;
  if (a3 < a2) {
    goto LABEL_16;
  }
  signed int v9 = a4;
  if (a4 == -1) {
    signed int v9 = arc4random() % (v7 + 1) + a2;
  }
  if (v9 < a2 || v9 > a3)
  {
LABEL_16:
    uint64_t v43 = __error();
    int v44 = 22;
LABEL_17:
    int *v43 = v44;
    return 0xFFFFFFFFLL;
  }

  uint64_t v92 = 0LL;
  uint64_t v13 = _NETRBClientCreate(0LL, 0LL, 0LL);
  if (!v13)
  {
    char v47 = strerror(12);
    sub_100006380(1, "_NETRBClientCreate: %s\n", v48, v49, v50, v51, v52, v53, v47);
    *__error() = 22;
    char v88 = strerror(12);
    sub_100006380(1, "unable to attach to server: %s\n", v54, v55, v56, v57, v58, v59, v88);
    return 0xFFFFFFFFLL;
  }

  uint64_t v20 = v13;
  sub_100006380(1, "_NETRBClientCreate: %s\n", v14, v15, v16, v17, v18, v19, (char)"OK");
  size_t v21 = __s1;
  int ExtName = _NETRBClientGetExtName(v20, __s1);
  if (__s1[0]) {
    int v29 = ExtName;
  }
  else {
    int v29 = 0;
  }
  if ((v29 & 1) != 0)
  {
    sub_100006380(1, "external interface name from MIS %s", v23, v24, v25, v26, v27, v28, (char)__s1);
    _NETRBClientDestroy(v20);
    if (getifaddrs(&v92))
    {
      uint64_t v36 = __error();
      char v87 = strerror(*v36);
      sub_100006380(1, "getifaddrs: %s", v37, v38, v39, v40, v41, v42, v87);
      return 0xFFFFFFFFLL;
    }

    uint64_t v70 = v92;
    if (!v92)
    {
LABEL_47:
      sub_100006380(1, "unable to get external interface address for %s", v30, v31, v32, v33, v34, v35, (char)__s1);
      freeifaddrs(v92);
      return 0xFFFFFFFFLL;
    }

    uint64_t v71 = v92;
    while (1)
    {
      if (!strncmp(__s1, v71->ifa_name, 0x10uLL))
      {
        ifa_addr = v71->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 2) {
            break;
          }
        }
      }

      uint64_t v71 = v71->ifa_next;
      if (!v71) {
        goto LABEL_47;
      }
    }

    LODWORD(v21) = *(_DWORD *)&ifa_addr->sa_data[2];
    freeifaddrs(v70);
  }

  else
  {
    sub_100006380(1, "unable to get external interface used by MIS", v23, v24, v25, v26, v27, v28, v86);
    _NETRBClientDestroy(v20);
  }

  if (v7 > 0x7FFFFFFE)
  {
LABEL_40:
    uint64_t v43 = __error();
    int v44 = 35;
    goto LABEL_17;
  }

  unsigned int v60 = v7 + 1;
  while (1)
  {
    uint64_t v61 = socket(2, a1, 0);
    uint64_t v45 = v61;
    *(void *)&v93.sa_len = 512LL;
    *(void *)&v93.sa_data[6] = 0LL;
    int v62 = (int)v21;
    if ((v29 & 1) == 0)
    {
      int v62 = dword_10000C020;
      if (dword_10000C020 == -1)
      {
        if (!a6) {
          goto LABEL_30;
        }
        int v62 = *(_DWORD *)(a6 + 4);
      }
    }

    *(_DWORD *)&v93.sa_data[2] = v62;
LABEL_30:
    int v91 = 1;
    if (setsockopt(v61, 0xFFFF, 4, &v91, 4u) == -1)
    {
      sub_100006380(1, "failed to set SO_REUSEADDR %s(%d)", v63, v64, v65, v66, v67, v68, (char)__s1);
      return 0xFFFFFFFFLL;
    }

    *(_WORD *)v93.sa_data = bswap32(v9) >> 16;
    if (!bind(v45, &v93, 0x10u)) {
      break;
    }
    if (*__error() != 48) {
      return 0xFFFFFFFFLL;
    }
    close(v45);
    if (v9 + v6 <= a3) {
      signed int v69 = v9 + v6;
    }
    else {
      signed int v69 = a2;
    }
    if (v9 + v6 >= a2) {
      signed int v9 = v69;
    }
    else {
      signed int v9 = a3;
    }
  }

  if (a6) {
    *(sockaddr *)a6 = v93;
  }
  if (v29)
  {
    unsigned int v90 = if_nametoindex(__s1);
    if (v90)
    {
      if (setsockopt(v45, 0, 25, &v90, 4u) < 0)
      {
        int v79 = __error();
        char v89 = strerror(*v79);
        sub_100006380(1, "setscokopt failed: %s", v80, v81, v82, v83, v84, v85, v89);
      }
    }

    else
    {
      sub_100006380(1, "if_nametoindex failed for %s", v73, v74, v75, v76, v77, v78, (char)__s1);
    }
  }

  return v45;
}