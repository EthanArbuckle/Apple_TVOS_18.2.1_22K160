void sub_100000B88()
{
  void *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  in_addr_t *v6;
  in_addr v7;
  char *v8;
  uint64_t v9;
  in_addr v10;
  char *v11;
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint8_t *v16;
  __int16 v17;
  char *v18;
  uint8_t v19[40];
  v0 = (void *)qword_1000189C8;
  v1 = 0LL;
  v2 = 0;
  do
  {
    v3 = *v0 + 96 * v1;
    if (!sub_10000C760((uint64_t)qword_1000189D0)
      || (v4 = (const char *)nullsub_1(v3), sub_100000DAC(v4)))
    {
      if (sub_10000C3C8(v3) && (sub_10000C36C(v3) & 8) == 0)
      {
        v12 = v2;
        if ((int)sub_10000C374(v3) >= 1)
        {
          v5 = 0LL;
          do
          {
            v6 = (in_addr_t *)sub_10000C37C(v3, v5);
            v7.s_addr = *v6;
            v8 = inet_ntoa(v7);
            __strlcpy_chk(v19, v8, 32LL, 32LL);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v9 = nullsub_1(v3);
              v10.s_addr = v6[1];
              v11 = inet_ntoa(v10);
              *(_DWORD *)buf = 136315650;
              v14 = v9;
              v15 = 2080;
              v16 = v19;
              v17 = 2080;
              v18 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "interface %s: ip %s mask %s",  buf,  0x20u);
            }

            v5 = (v5 + 1);
          }

          while ((int)v5 < (int)sub_10000C374(v3));
        }

        v2 = v12 + 1;
      }
    }

    ++v1;
    v0 = (void *)qword_1000189C8;
  }

  while (v1 < *(int *)(qword_1000189C8 + 8));
  if (!v2)
  {
LABEL_22:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "no available interfaces",  v19,  2u);
    }

    if ((byte_1000189E0 & 1) == 0) {
      exit(2);
    }
  }
}

uint64_t sub_100000DAC(const char *a1)
{
  int v2 = 0;
  while (1)
  {
    v3 = (const char *)sub_10000C77C((uint64_t)&unk_1000189D0, v2);
    if (!strcmp(a1, v3)) {
      break;
    }
  }

  return 1LL;
}

void sub_100000E2C()
{
  v0 = sub_10000BB20();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "interface list initialization failed",  v2,  2u);
    }

    exit(1);
  }

  uint64_t v1 = (uint64_t)v0;
  sub_10000C2F0(&qword_1000189C8);
  qword_1000189C8 = v1;
}

void sub_100000EB4()
{
  v0 = inetroute_list_init();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v3) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "can't get inetroutes list",  (uint8_t *)&v3,  2u);
    }

    exit(1);
  }

  uint64_t v1 = (uint64_t)v0;
  inetroute_list_free((void **)&qword_1000189E8);
  qword_1000189E8 = v1;
  if (byte_1000180B0)
  {
    Mutable = CFStringCreateMutable(0LL, 0LL);
    inetroute_list_print_cfstr(Mutable, (int *)qword_1000189E8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 138412290;
      v4 = Mutable;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Routes:\n%@",  (uint8_t *)&v3,  0xCu);
    }

    CFRelease(Mutable);
  }

uint64_t sub_100000FE4(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_1000189F0) >> 6) & 1;
}

uint64_t sub_100000FFC(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_1000189F0) >> 7) & 1;
}

uint64_t sub_100001014(uint64_t a1)
{
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a1 + 76) & 0x7FFFFFFD | 0x80000000;
  return sub_10000102C(1LL);
}

uint64_t sub_10000102C(uint64_t result)
{
  if (result | dword_1000194A8)
  {
    int v1 = result;
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)qword_1000194A0, @"com.apple.bootpd.DHCPServer");
    if (v1)
    {
      int v2 = (void *)qword_1000189C8;
      if (*(int *)(qword_1000189C8 + 8) >= 1)
      {
        uint64_t v3 = 0LL;
        uint64_t v4 = 0LL;
        Mutable = 0LL;
        do
        {
          if ((*(_DWORD *)(*v2 + v3 + 76) & 0x80000000) != 0)
          {
            v6 = (const char *)nullsub_1();
            CFStringRef v7 = CFStringCreateWithCString(0LL, v6, 0x8000100u);
            if (v7)
            {
              CFStringRef v8 = v7;
              if (!Mutable) {
                Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
              }
              CFArrayAppendValue(Mutable, v8);
              CFRelease(v8);
            }
          }

          ++v4;
          int v2 = (void *)qword_1000189C8;
          v3 += 96LL;
        }

        while (v4 < *(int *)(qword_1000189C8 + 8));
        values = Mutable;
        if (Mutable)
        {
          v10 = @"DisabledInterfaces";
          CFDictionaryRef v9 = CFDictionaryCreate( 0LL,  (const void **)&v10,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          SCDynamicStoreAddTemporaryValue((SCDynamicStoreRef)qword_1000194A0, @"com.apple.bootpd.DHCPServer", v9);
          CFRelease(v9);
        }
      }
    }

    result = notify_post("com.apple.bootpd.DHCPDisabledInterfaces");
    dword_1000194A8 = v1;
  }

  return result;
}

void sub_1000011A4(const __CFDictionary *a1, const void *a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      if ((sub_100008990(Value, a4) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid '%s' property",  (uint8_t *)&v7,  0xCu);
      }
    }
  }

void sub_10000125C()
{
}

void start(int a1, char *const *a2)
{
  v39.s_addr = 0;
  byte_1000180B0 = 0;
  byte_1000181C0 = 0;
  sub_10000C72C(qword_1000189D0);
  sub_100000E2C();
  int v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
  if (v4 == -1)
  {
    char v36 = 0;
    int v5 = 1;
LABEL_35:
    if (fstat(0, &buf) < 0)
    {
      char v8 = v36;
    }

    else
    {
      HIDWORD(v9) = buf.st_mode & 0xF000;
      LODWORD(v9) = HIDWORD(v9) - 0x2000;
      char v8 = v36;
      if ((v9 >> 13) > 4)
      {
        dword_100018080 = 0;
        gettimeofday((timeval *)&qword_100018A00, 0LL);
        if ((byte_1000189E0 & 1) == 0)
        {
          v20 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
          dispatch_source_set_event_handler(v20, &stru_100014580);
          dispatch_time_t v21 = dispatch_time(0LL, 15000000000LL);
          dispatch_source_set_timer(v20, v21, 0x37E11D600uLL, 0LL);
          dispatch_resume(v20);
        }

        goto LABEL_58;
      }
    }

    *(_OWORD *)&buf.st_dev = xmmword_100010CA0;
    if ((v8 & 1) == 0)
    {
      if (fork()) {
        exit(0);
      }
      for (int i = 0; i != 10; ++i)
        close(i);
      open("/", 0);
      dup2(0, 1);
      dup2(0, 2);
      int v11 = open("/dev/tty", 2);
      if (v11 >= 1)
      {
        int v12 = v11;
        ioctl(v11, 0x20007471uLL, 0LL);
        close(v12);
      }
    }

    int v13 = socket(2, 2, 0);
    dword_100018080 = v13;
    if (v13 < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        goto LABEL_101;
      }
      *(_WORD *)v37 = 0;
      v14 = "socket call failed";
      goto LABEL_47;
    }

    HIWORD(buf.st_dev) = 17152;
    *(_DWORD *)&buf.st_mode = 0;
    if (bind(v13, (const sockaddr *)&buf, 0x10u) < 0)
    {
      int v17 = 10;
      while (1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v18 = __error();
          v19 = strerror(*v18);
          *(_DWORD *)v37 = 136315138;
          v38 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "bind call failed: %s",  v37,  0xCu);
        }

        if (*__error() != 48) {
          goto LABEL_101;
        }
        if (!--v17) {
          break;
        }
        sleep(0xAu);
        if ((bind(dword_100018080, (const sockaddr *)&buf, 0x10u) & 0x80000000) == 0) {
          goto LABEL_58;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        v14 = "exiting";
LABEL_47:
        p_stat buf = v37;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_82:
        uint32_t v27 = 2;
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v16, v14, p_buf, v27);
      }

LABEL_101:
      exit(1);
    }

LABEL_58:
    v22 = fopen("/var/run/bootpd.pid", "w");
    if (v22)
    {
      v23 = v22;
      pid_t v24 = getpid();
      fprintf(v23, "%d\n", v24);
      fclose(v23);
    }

    if ((v8 & 1) != 0) {
      byte_100018A10 = 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "server starting",  (uint8_t *)&buf,  2u);
    }

    *(_DWORD *)v37 = 1;
    if (setsockopt(dword_100018080, 0, 20, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      v25 = __error();
      v26 = strerror(*v25);
      buf.st_dev = 136315138;
      *(void *)&buf.st_mode = v26;
      v14 = "setsockopt(IP_RECVIF) failed: %s";
      p_stat buf = (uint8_t *)&buf;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v27 = 12;
      goto LABEL_83;
    }

    if (setsockopt(dword_100018080, 0xFFFF, 4356, v37, 4u) < 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "setsockopt(SO_RECV_ANYIF) failed",  (uint8_t *)&buf,  2u);
    }

    if (setsockopt(dword_100018080, 0xFFFF, 32, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_BROADCAST) failed";
    }

    else if (setsockopt(dword_100018080, 0, 7, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(IPPROTO_IP, IP_RECVDSTADDR) failed";
    }

    else
    {
      if ((setsockopt(dword_100018080, 0xFFFF, 4, v37, 4u) & 0x80000000) == 0)
      {
        *(_DWORD *)v37 = 900;
        if (setsockopt(dword_100018080, 0xFFFF, 4230, v37, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = __error();
          v29 = strerror(*v28);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v29;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "setsockopt(SO_TRAFFIC_CLASS) failed, %s",  (uint8_t *)&buf,  0xCu);
        }

        *(_DWORD *)v37 = 0;
        if (setsockopt(dword_100018080, 0xFFFF, 4352, v37, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v30 = __error();
          v31 = strerror(*v30);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v31;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "setsockopt(SO_DEFUNCTOK) failed, %s",  (uint8_t *)&buf,  0xCu);
        }

        *(_DWORD *)v37 = 1;
        if (ioctl(dword_100018080, 0x8004667EuLL, v37) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v32 = __error();
          v33 = strerror(*v32);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v33;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ioctl FIONBIO failed, %s",  (uint8_t *)&buf,  0xCu);
        }

        v34 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  dword_100018080,  0LL,  &_dispatch_main_q);
        dispatch_source_set_event_handler(v34, &stru_100014540);
        dispatch_resume(v34);
        v35 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  1uLL,  0LL,  &_dispatch_main_q);
        dispatch_source_set_event_handler(v35, &stru_1000145C0);
        dispatch_resume(v35);
        signal(1, (void (__cdecl *)(int))1);
        if (v5) {
          sub_100004DFC();
        }
        dispatch_main();
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_101;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_REUSEADDR) failed";
    }

    p_stat buf = (uint8_t *)&buf;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_82;
  }

  char v36 = 0;
  int v5 = 1;
  while (1)
  {
    if ((char)v4 <= 79)
    {
      if ((char)v4 != 68)
      {
        if ((char)v4 == 73)
        {
          int v5 = 0;
        }

        else if ((char)v4 == 72)
        {
LABEL_77:
          sub_10000125C();
        }

        goto LABEL_34;
      }

      int v6 = dword_1000189F4 | 2;
    }

    else
    {
      switch((char)v4)
      {
        case 'b':
          byte_1000189F8 = 1;
          goto LABEL_34;
        case 'c':
        case 'e':
        case 'g':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 's':
        case 'u':
          goto LABEL_34;
        case 'd':
          char v36 = 1;
          goto LABEL_34;
        case 'f':
          off_100018098 = optarg;
          goto LABEL_34;
        case 'h':
          goto LABEL_77;
        case 'i':
          if (sub_100000DAC(optarg))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              buf.st_dev = 136315138;
              *(void *)&buf.st_mode = optarg;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "interface %s already specified",  (uint8_t *)&buf,  0xCu);
            }
          }

          else
          {
            sub_10000C824((uint64_t)qword_1000189D0, (uint64_t)optarg);
          }

          goto LABEL_34;
        case 'o':
          int v7 = atoi(optarg);
          if ((v7 - 17) <= 0xFFFFFFEF)
          {
            printf("max hops value %s must be in the range 1..16\n");
            goto LABEL_101;
          }

          dword_1000180A0 = v7;
          goto LABEL_34;
        case 'p':
          word_100018084 = strtoul(optarg, 0LL, 0);
          printf("Priority set to %d\n", (unsigned __int16)word_100018084);
          goto LABEL_34;
        case 'q':
          dword_1000180A8 = 1;
          goto LABEL_34;
        case 'r':
          dword_1000189F4 |= 0x10u;
          if (!inet_aton(optarg, &v39) || v39.s_addr + 1 <= 1)
          {
            printf("Invalid relay server ip address %s\n");
            goto LABEL_101;
          }

          if (sub_10000B9DC((uint64_t *)qword_1000189C8, v39.s_addr))
          {
            printf("Relay server ip address %s specifies this host\n");
            goto LABEL_101;
          }

          sub_100001C6C(v39.s_addr);
          goto LABEL_34;
        case 't':
          off_100018088 = optarg;
          goto LABEL_34;
        case 'v':
          byte_1000189FC = 1;
          goto LABEL_34;
        default:
          if ((char)v4 == 80)
          {
            byte_1000189E0 = 1;
            goto LABEL_34;
          }

          int v6 = dword_1000189F4 | 1;
          break;
      }
    }

    dword_1000189F4 = v6;
LABEL_34:
    int v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
    if (v4 == -1) {
      goto LABEL_35;
    }
  }

_DWORD *sub_100001C6C(int a1)
{
  if (qword_100018A38)
  {
    uint64_t v2 = dword_100018A40;
    uint64_t v3 = ++dword_100018A40;
    result = realloc((void *)qword_100018A38, 4 * v3);
    qword_100018A38 = (uint64_t)result;
    if (!result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "realloc failed, exiting",  v5,  2u);
      }

      exit(1);
    }

    result[v2] = a1;
  }

  else
  {
    result = malloc(4uLL);
    qword_100018A38 = (uint64_t)result;
    _DWORD *result = a1;
    dword_100018A40 = 1;
  }

  return result;
}

void sub_100001D30(id a1)
{
  __int128 v141 = xmmword_100010CA0;
  qword_100019258 = (uint64_t)&qword_100019278;
  dword_100019260 = 1;
  qword_100019268 = (uint64_t)&unk_100019288;
  qword_100019270 = 512LL;
  qword_100019278 = (uint64_t)&byte_100018A48;
  unk_100019280 = 2048LL;
  qword_100019248 = (uint64_t)&v141;
  dword_100019250 = 16;
  ssize_t v1 = recvmsg(dword_100018080, (msghdr *)&qword_100019248, 0);
  if (v1 < 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    *(_DWORD *)stat buf = 6291714;
    int v5 = "recvmsg failed, %m";
    int v6 = buf;
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    uint32_t v8 = 4;
    goto LABEL_8;
  }

  unint64_t v2 = v1;
  if ((byte_100018A44 & 1) == 0)
  {
    sub_100004F5C(0LL);
    if (gethostname(&byte_1000180B3, 0x100uLL))
    {
      byte_1000180B3 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 6291714;
        uint64_t v3 = "gethostname() failed, %m";
        uint32_t v4 = 4;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v3, buf, v4);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&buf[4] = &byte_1000180B3;
      uint64_t v3 = "server name %s";
      uint32_t v4 = 12;
      goto LABEL_11;
    }

    sub_100000E2C();
    sub_100000B88();
    sub_100000EB4();
    sub_10000102C(0LL);
    CFPropertyListRef v9 = sub_100008548(off_100018098);
    if (v9)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v9) != TypeID)
      {
        CFRelease(v9);
        CFPropertyListRef v9 = 0LL;
      }
    }

    dword_1000189F0 = dword_1000189F4;
    byte_1000181C0 = byte_1000189FC;
    byte_1000180B0 = byte_100018A10;
    if (!v9)
    {
      dword_100018A34 = 0;
LABEL_50:
      if (qword_100019488)
      {
        free((void *)qword_100019488);
        qword_100019488 = 0LL;
      }

      if (qword_100019490)
      {
        free((void *)qword_100019490);
        qword_100019490 = 0LL;
      }

      dword_100019498 = 0;
      dword_10001949C = 0;
      if (v9)
      {
        Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"allow");
        CFTypeID v33 = CFArrayGetTypeID();
        if (Value && CFGetTypeID(Value) == v33 && CFArrayGetCount(Value) >= 1) {
          qword_100019488 = (uint64_t)sub_100004C14(Value, &dword_100019498);
        }
        v34 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"deny");
        CFTypeID v35 = CFArrayGetTypeID();
        if (v34 && CFGetTypeID(v34) == v35 && CFArrayGetCount(v34) >= 1) {
          qword_100019490 = (uint64_t)sub_100004C14(v34, &dword_10001949C);
        }
      }

      dword_1000180AC = 0;
      sub_1000011A4( (const __CFDictionary *)v9,  @"reply_threshold_seconds",  (uint64_t)"reply_threshold_seconds",  &dword_1000180AC);
      byte_1000180B1 = 0;
      LODWORD(__dst[0].tv_sec) = 0;
      sub_1000011A4( (const __CFDictionary *)v9,  @"dhcp_ignore_client_identifier",  (uint64_t)"dhcp_ignore_client_identifier",  __dst);
      if (LODWORD(__dst[0].tv_sec)) {
        byte_1000180B1 = 1;
      }
      byte_1000180B2 = 0;
      LODWORD(__dst[0].tv_sec) = 0;
      sub_1000011A4((const __CFDictionary *)v9, @"dhcp_supply_bootfile", (uint64_t)"dhcp_supply_bootfile", __dst);
      if (LODWORD(__dst[0].tv_sec))
      {
        byte_1000180B2 = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 136315138;
          *(void *)&buf[4] = "dhcp_supply_bootfile";
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s is enabled",  buf,  0xCu);
        }
      }

      dword_1000180A4 = sub_1000049B4( (const __CFDictionary *)v9,  @"use_server_config_for_dhcp_options",  (uint64_t)"use_server_config_for_dhcp_options",  1LL);
      SubnetListFree((uint64_t **)&qword_1000181B8);
      if (v9)
      {
        char v36 = CFDictionaryGetValue((CFDictionaryRef)v9, @"Subnets");
        CFTypeID v37 = CFArrayGetTypeID();
        if (v36)
        {
          if (CFGetTypeID(v36) == v37)
          {
            qword_1000181B8 = (uint64_t)SubnetListCreateWithArray(v36);
            if (qword_1000181B8)
            {
              if (byte_1000181C0)
              {
                Mutable = CFStringCreateMutable(0LL, 0LL);
                SubnetListPrintCFString(Mutable, qword_1000181B8);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 138412290;
                  *(void *)&buf[4] = Mutable;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%@",  buf,  0xCu);
                }

                CFRelease(Mutable);
              }
            }
          }
        }

        sub_100005AD8();
        CFRelease(v9);
      }

      else
      {
        sub_100005AD8();
      }

      res_9_init();
      qword_100018A20 = 0LL;
      if (qword_100018A18)
      {
        free((void *)qword_100018A18);
        qword_100018A18 = 0LL;
      }

      unint64_t v128 = v2;
      if (qword_100018A28)
      {
        free((void *)qword_100018A28);
        qword_100018A28 = 0LL;
      }

      dword_100018A30 = 0;
      dword_100018A14 = 0;
      int nscount = _res.nscount;
      if (nscount)
      {
        __dst[0].tv_sec = 0LL;
        if (byte_1000180B0)
        {
          tv_sec = CFStringCreateMutable(0LL, 0LL);
          __dst[0].tv_sec = (__darwin_time_t)tv_sec;
          int nscount = _res.nscount;
        }

        else
        {
          tv_sec = 0LL;
        }

        qword_100018A18 = (uint64_t)malloc(4LL * nscount);
        if (nscount >= 1)
        {
          uint64_t v41 = 0LL;
          p_sin_addr = &_res.nsaddr_list[0].sin_addr;
          do
          {
            in_addr_t s_addr = p_sin_addr->s_addr;
            p_sin_addr += 4;
            v43.in_addr_t s_addr = s_addr;
            if (s_addr + 1 >= 2 && LOBYTE(v43.s_addr) != 127)
            {
              int v45 = dword_100018A14;
              *(in_addr *)(qword_100018A18 + 4LL * dword_100018A14) = v43;
              if (tv_sec)
              {
                v46 = inet_ntoa(v43);
                CFStringAppendFormat(tv_sec, 0LL, @" %s", v46);
                int v45 = dword_100018A14;
                int nscount = _res.nscount;
              }

              dword_100018A14 = v45 + 1;
            }

            ++v41;
          }

          while (v41 < nscount);
        }

        if (!dword_100018A14)
        {
          free((void *)qword_100018A18);
          qword_100018A18 = 0LL;
          sub_100008518((const void **)__dst);
          tv_sec = (__CFString *)__dst[0].tv_sec;
        }

        if (tv_sec)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)&buf[4] = tv_sec;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "DNS servers: %@",  buf,  0xCu);
            tv_sec = (__CFString *)__dst[0].tv_sec;
          }

          CFRelease(tv_sec);
        }

        if (dword_100018A14)
        {
          __dst[0].tv_sec = 0LL;
          if (byte_1000180B0)
          {
            v47 = CFStringCreateMutable(0LL, 0LL);
            __dst[0].tv_sec = (__darwin_time_t)v47;
          }

          else
          {
            v47 = 0LL;
          }

          if (_res.defdname[0])
          {
            if (*(_DWORD *)_res.defdname != 1633906540 || *(_WORD *)&_res.defdname[4] != 108)
            {
              qword_100018A20 = (uint64_t)_res.defdname;
              if (byte_1000180B0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = _res.defdname;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "DNS domain: %s",  buf,  0xCu);
                }
              }
            }
          }

          uint64_t v49 = 0LL;
          while (_res.dnsrch[v49])
          {
            if (v47) {
              CFStringAppendFormat(v47, 0LL, @" %s", _res.dnsrch[v49]);
            }
            if (++v49 == 6) {
              goto LABEL_119;
            }
          }

          if ((_DWORD)v49)
          {
LABEL_119:
            qword_100018A28 = (uint64_t)sub_100009BB4((uint64_t)_res.dnsrch, v49, 0LL, &dword_100018A30, 1);
            if (!v47) {
              goto LABEL_123;
            }
            goto LABEL_120;
          }

          sub_100008518((const void **)__dst);
          v47 = (__CFString *)__dst[0].tv_sec;
          if (!__dst[0].tv_sec) {
            goto LABEL_123;
          }
LABEL_120:
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)&buf[4] = v47;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "DNS search: %@",  buf,  0xCu);
            v47 = (__CFString *)__dst[0].tv_sec;
          }

          CFRelease(v47);
        }
      }

LABEL_123:
      byte_100018A44 = 1;
      unint64_t v2 = v128;
      goto LABEL_124;
    }

    int v11 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, @"ipv6_only_wait");
    if (v11)
    {
      if ((sub_100008990(v11, __dst) & 1) != 0)
      {
        int v12 = (LODWORD(__dst[0].tv_sec) != 0) << 24;
LABEL_23:
        dword_100018A34 = v12;
        int v13 = CFDictionaryGetValue((CFDictionaryRef)v9, @"bootp_enabled");
        sub_100004A80((uint64_t)v13, 1);
        v14 = CFDictionaryGetValue((CFDictionaryRef)v9, @"dhcp_enabled");
        sub_100004A80((uint64_t)v14, 2);
        v15 = CFDictionaryGetValue((CFDictionaryRef)v9, @"relay_enabled");
        sub_100004A80((uint64_t)v15, 16);
        os_log_type_t v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"relay_ip_list");
        CFTypeID v17 = CFArrayGetTypeID();
        if (v16 && CFGetTypeID(v16) == v17)
        {
          CFIndex Count = CFArrayGetCount(v16);
          if (qword_100018A38)
          {
            free((void *)qword_100018A38);
            qword_100018A38 = 0LL;
            dword_100018A40 = 0;
          }

          if (Count >= 1)
          {
            for (CFIndex i = 0LL; Count != i; ++i)
            {
              ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, i);
              CFTypeID v21 = CFStringGetTypeID();
              if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v21) {
                continue;
              }
              if ((sub_100008844(ValueAtIndex, (in_addr *)__dst) & 1) != 0)
              {
                in_addr_t v22 = __dst[0].tv_sec;
                if ((LODWORD(__dst[0].tv_sec) + 1) > 1)
                {
                  if (!sub_10000B9DC((uint64_t *)qword_1000189C8, __dst[0].tv_sec))
                  {
                    sub_100001C6C(__dst[0].tv_sec);
                    continue;
                  }

                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v27.in_addr_t s_addr = __dst[0].tv_sec;
                    v28 = inet_ntoa(v27);
                    *(_DWORD *)stat buf = 136315138;
                    *(void *)&buf[4] = v28;
                    v25 = "Relay server ip address %s specifies this host";
LABEL_44:
                    uint32_t v26 = 12;
LABEL_45:
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v25,  buf,  v26);
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v23.in_addr_t s_addr = v22;
                  pid_t v24 = inet_ntoa(v23);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v24;
                  v25 = "Invalid relay server ip address %s";
                  goto LABEL_44;
                }
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)stat buf = 0;
                v25 = "Invalid relay server ip address";
                uint32_t v26 = 2;
                goto LABEL_45;
              }
            }
          }
        }

        v29 = CFDictionaryGetValue((CFDictionaryRef)v9, @"ignore_allow_deny");
        sub_100004A80((uint64_t)v29, 32);
        v30 = CFDictionaryGetValue((CFDictionaryRef)v9, @"detect_other_dhcp_server");
        sub_100004A80((uint64_t)v30, 64);
        v31 = CFDictionaryGetValue((CFDictionaryRef)v9, @"ipv6_only_preferred");
        sub_100004A80((uint64_t)v31, 128);
        goto LABEL_50;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        *(void *)&buf[4] = "ipv6_only_wait";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid '%s' property",  buf,  0xCu);
      }
    }

    int v12 = 0;
    goto LABEL_23;
  }

LABEL_124:
  if (v2 >= 0xEC && byte_100018A4A <= 0x10u)
  {
    *(_DWORD *)stat buf = 0;
    v50 = sub_100004D88(7, buf);
    if (v50) {
      BOOL v51 = *(_DWORD *)buf == 4;
    }
    else {
      BOOL v51 = 0;
    }
    int v52 = !v51;
    if (v51) {
      v53 = v50;
    }
    else {
      v53 = 0LL;
    }
    if (byte_1000180B0)
    {
      v54 = v50;
      BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v52)
      {
        if (v55)
        {
          *(_WORD *)stat buf = 0;
          v56 = "no destination address";
          uint32_t v57 = 2;
LABEL_141:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v56, buf, v57);
        }
      }

      else if (v55)
      {
        v58.in_addr_t s_addr = *v54;
        v59 = inet_ntoa(v58);
        *(_DWORD *)stat buf = 136315138;
        *(void *)&buf[4] = v59;
        v56 = "destination address %s";
        uint32_t v57 = 12;
        goto LABEL_141;
      }
    }

    LODWORD(v130) = 0;
    v60 = sub_100004D88(20, &v130);
    if (!v60) {
      return;
    }
    if (!(_DWORD)v130) {
      return;
    }
    v61 = v60;
    unint64_t v62 = *((unsigned __int8 *)v60 + 5);
    if (v62 > 0x10) {
      return;
    }
    __memmove_chk(buf, v60 + 2, v62, 17LL);
    buf[*((unsigned __int8 *)v61 + 5)] = 0;
    uint64_t v63 = sub_10000BA9C((uint64_t *)qword_1000189C8, buf);
    if (v63)
    {
      uint64_t v64 = v63;
      if (sub_10000C3C8(v63))
      {
        if ((int)sub_10000C760((uint64_t)qword_1000189D0) < 1 || sub_100000DAC(buf))
        {
          int v65 = *(_DWORD *)(v64 + 76);
          if ((v65 & 0x80000000) == 0)
          {
            char v66 = v65 | dword_1000189F0;
            if ((v66 & 0x1F) != 0)
            {
              if (byte_100018A4A == 6 && (v66 & 0x20) == 0)
              {
                if (qword_100019490
                  && bsearch( &unk_100018A64,  (const void *)qword_100019490,  dword_10001949C,  6uLL,  (int (__cdecl *)(const void *, const void *))sub_10000CE48))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                    return;
                  }
                  v67 = ether_ntoa((const ether_addr *)&unk_100018A64);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v67;
                  int v5 = "%s is in deny list, ignoring";
LABEL_237:
                  int v6 = buf;
                  goto LABEL_173;
                }

                if (qword_100019488
                  && !bsearch( &unk_100018A64,  (const void *)qword_100019488,  dword_100019498,  6uLL,  (int (__cdecl *)(const void *, const void *))sub_10000CE48))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                    return;
                  }
                  v103 = ether_ntoa((const ether_addr *)&unk_100018A64);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v103;
                  int v5 = "%s is not in the allow list, ignoring";
                  goto LABEL_237;
                }
              }

              gettimeofday((timeval *)&qword_100018A00, 0LL);
              if (byte_100018A48 != 1) {
                goto LABEL_200;
              }
              unint64_t v130 = v64;
              __src = &byte_100018A48;
              unsigned int v132 = v2;
              v133 = 0LL;
              v134 = v53;
              v135 = &qword_100018A00;
              sub_1000090D8(v136);
              if (sub_100009288(v136, (uint64_t)&byte_100018A48, v2, 0LL)
                && (v133 = v136, (v68 = sub_1000091DC((uint64_t)v136, 53, buf, 0LL)) != 0LL))
              {
                char v69 = 0;
                unsigned int v70 = *v68;
              }

              else
              {
                unsigned int v70 = 0;
                char v69 = 1;
              }

              if (byte_1000181C0)
              {
                v71 = CFStringCreateMutable(0LL, 0LL);
                sub_1000097C0(v71, (unsigned __int8 *)&byte_100018A48, v2);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 138412290;
                  *(void *)&buf[4] = v71;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "---- Client Request ----\n%@",  buf,  0xCu);
                }

                CFRelease(v71);
              }

              if (!byte_100018A74 || !strcmp(&byte_100018A74, &byte_1000180B3))
              {
                int v72 = dword_100018A5C;
                if (!dword_100018A5C || v72 == sub_10000C384(v64))
                {
                  int v73 = *(_DWORD *)(v64 + 76);
                  if ((v69 & 1) != 0 || v73 < 0 || ((v73 | dword_1000189F0) & 2) == 0)
                  {
                    v139 = 0LL;
                    v140 = 0LL;
                    if (v132 < 0x12C) {
                      goto LABEL_199;
                    }
                    v74 = __src;
                    unsigned int v75 = bswap32(*((unsigned __int16 *)__src + 4));
                    int v76 = dword_1000180AC;
                    if (dword_1000180AC > HIWORD(v75))
                    {
                      if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)stat buf = 67109376;
                        *(_DWORD *)&buf[4] = HIWORD(v75);
                        *(_WORD *)&buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v76;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "rq->bp_secs %d < threshold %d",  buf,  0xEu);
                      }

                      goto LABEL_199;
                    }

                    memcpy(__dst, __src, 0x12CuLL);
                    LOBYTE(__dst[0].tv_sec) = 2;
                    int v117 = *((_DWORD *)__src + 3);
                    if (v117)
                    {
                      v138.in_addr_t s_addr = *((_DWORD *)__src + 3);
                    }

                    else
                    {
                      *(void *)stat buf = 0LL;
                      *(_OWORD *)&buf[8] = v130;
                      *(_DWORD *)stat buf = *((_DWORD *)__src + 6);
                      if (!sub_100005678( *((unsigned __int8 *)__src + 1),  (char *)__src + 28,  *((unsigned __int8 *)__src + 2),  (unsigned int (*)(uint64_t, void))sub_100003D38,  (uint64_t)buf,  &v138,  (char **)&v139,  (char **)&v140)) {
                        goto LABEL_199;
                      }
                      LODWORD(__dst[1].tv_sec) = v138;
                    }

                    v74[235] = 0;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v120 = nullsub_1(v130);
                      v121 = v139;
                      if (!v139)
                      {
                        v122.in_addr_t s_addr = v138.s_addr;
                        v121 = inet_ntoa(v122);
                      }

                      *(_DWORD *)stat buf = 136315650;
                      *(void *)&buf[4] = v120;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = v121;
                      *(_WORD *)&buf[22] = 2080;
                      v143 = v74 + 108;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "BOOTP request [%s]: %s requested file '%s'",  buf,  0x20u);
                    }

                    if (sub_100003738(v74 + 108, (uint64_t)v139, v140, (char *)&__dst[6].tv_usec + 4, 128))
                    {
                      if (*((_DWORD *)v74 + 59) == 1666417251)
                      {
                        sub_100009550((uint64_t)buf, &__dst[15], 60);
                        sub_1000040EC((char *)v139, v138.s_addr, v130, (uint64_t *)buf, 0LL, 0);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)v137 = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "added vendor extensions",  v137,  2u);
                        }

                        if (sub_100009558((uint64_t)buf, 255, 0, 0LL))
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v137 = 0;
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "couldn't add end tag",  v137,  2u);
                          }
                        }

                        else
                        {
                          *(&__dst[14].tv_usec + 1) = 1666417251;
                        }
                      }

                      HIDWORD(__dst[1].tv_sec) = sub_10000C384(v130);
                      __strlcpy_chk(&__dst[2].tv_usec + 1, &byte_1000180B3, 64LL, 64LL);
                      if (sub_100003D88(v130, (uint64_t)__dst, 0x12Cu, 0, 0LL)
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                      {
                        v123 = v139;
                        v124.in_addr_t s_addr = v138.s_addr;
                        v125 = inet_ntoa(v124);
                        *(_DWORD *)stat buf = 136315650;
                        *(void *)&buf[4] = v123;
                        *(_WORD *)&buf[12] = 2080;
                        *(void *)&buf[14] = v125;
                        *(_WORD *)&buf[22] = 1024;
                        LODWORD(v143) = 300;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "reply sent %s %s pktsize %d",  buf,  0x1Cu);
                      }
                    }

                    if (v139) {
                      free(v139);
                    }
                    if (v140) {
                      free(v140);
                    }
                    goto LABEL_199;
                  }

                  sub_100006188((uint64_t *)&v130, v70, 1);
                }
              }

LABEL_199:
              sub_1000090DC((uint64_t)v136);
LABEL_200:
              v77 = aPrivateTftpboo;
              if (qword_100018A38
                && v2 >= 0x12C
                && ((*(_DWORD *)(v64 + 76) | dword_1000189F0) & 0x10) != 0)
              {
                if (byte_100018A48 != 2)
                {
                  if (byte_100018A48 == 1)
                  {
                    char v78 = byte_100018A4B;
                    if (dword_1000180A0 > byte_100018A4B
                      && dword_1000180AC <= bswap32((unsigned __int16)word_100018A50) >> 16)
                    {
                      uint64_t v129 = v2;
                      int v126 = dword_100018A60;
                      if (!dword_100018A60)
                      {
                        dword_100018A60 = sub_10000C384(v64);
                        char v78 = byte_100018A4B;
                      }

                      byte_100018A4B = v78 + 1;
                      if (dword_100018A40 >= 1)
                      {
                        uint64_t v79 = 0LL;
                        int v127 = 0;
                        v80 = (os_log_s *)&_os_log_default;
                        while (1)
                        {
                          in_addr_t v81 = *(_DWORD *)(*((void *)v77 + 327) + 4 * v79);
LABEL_227:
                          if (++v79 >= dword_100018A40) {
                            goto LABEL_228;
                          }
                        }

                        if (byte_1000181C0) {
                          BOOL v82 = v127 == 0;
                        }
                        else {
                          BOOL v82 = 0;
                        }
                        if (v82)
                        {
                          v83 = CFStringCreateMutable(0LL, 0LL);
                          sub_1000097C0(v83, (unsigned __int8 *)&byte_100018A48, v129);
                          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)stat buf = 138412290;
                            *(void *)&buf[4] = v83;
                            _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEBUG,  "==== Relayed Request ====\n%@",  buf,  0xCu);
                          }

                          CFRelease(v83);
                          int v127 = 1;
                        }

                        v84 = v80;
                        int v85 = dword_100018080;
                        v86 = off_100018090;
                        v87 = (const char *)nullsub_1(v64);
                        int v88 = byte_100018A49;
                        int v89 = sub_10000C384(v64);
                        int v90 = sub_10000FE04(v85, v86, v87, v88, 0LL, v81, v89, 0x43u, 0x44u, &byte_100018A48, v129);
                        v80 = v84;
                        if (v90 < 0)
                        {
                          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                          {
                            v98.in_addr_t s_addr = v81;
                            v99 = inet_ntoa(v98);
                            *(_DWORD *)stat buf = 136315394;
                            *(void *)&buf[4] = v99;
                            v94 = v84;
                            os_log_type_t v95 = OS_LOG_TYPE_DEFAULT;
                            v96 = "send to %s failed, %m";
                            uint32_t v97 = 14;
                            goto LABEL_225;
                          }
                        }

                        else if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v91 = nullsub_1(v64);
                          v92.in_addr_t s_addr = v81;
                          v93 = inet_ntoa(v92);
                          *(_DWORD *)stat buf = 136315394;
                          *(void *)&buf[4] = v91;
                          *(_WORD *)&buf[12] = 2080;
                          *(void *)&buf[14] = v93;
                          v94 = v84;
                          os_log_type_t v95 = OS_LOG_TYPE_INFO;
                          v96 = "Relayed Request [%s] to %s";
                          uint32_t v97 = 22;
LABEL_225:
                          _os_log_impl((void *)&_mh_execute_header, v94, v95, v96, buf, v97);
                        }

                        v77 = aPrivateTftpboo;
                        goto LABEL_227;
                      }

LABEL_228:
                      if (!v126) {
                        dword_100018A60 = 0;
                      }
                      --byte_100018A4B;
                    }
                  }

                  goto LABEL_254;
                }

                if (dword_100018A60)
                {
                  uint64_t v100 = sub_10000B9DC((uint64_t *)qword_1000189C8, dword_100018A60);
                  if (v100)
                  {
                    uint64_t v101 = v100;
                    if ((word_100018A52 & 0x80) != 0)
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)stat buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "replying using broadcast IP address",  buf,  2u);
                      }

                      int v102 = -1;
                    }

                    else
                    {
                      int v102 = dword_100018A58;
                    }

                    if (byte_1000181C0)
                    {
                      v104 = CFStringCreateMutable(0LL, 0LL);
                      sub_1000097C0(v104, (unsigned __int8 *)&byte_100018A48, v2);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)stat buf = 138412290;
                        *(void *)&buf[4] = v104;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "==== Relayed Reply ====\n%@",  buf,  0xCu);
                      }

                      CFRelease(v104);
                    }

                    int v105 = dword_100018080;
                    v106 = off_100018090;
                    v107 = (const char *)nullsub_1(v101);
                    int v108 = byte_100018A49;
                    int v109 = sub_10000C384(v101);
                    int v110 = sub_10000FE04( v105,  v106,  v107,  v108,  (uint64_t)&unk_100018A64,  v102,  v109,  0x44u,  0x43u,  &byte_100018A48,  v2);
                    BOOL v111 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
                    if (v110 < 0)
                    {
                      if (!v111) {
                        goto LABEL_254;
                      }
                      v118.in_addr_t s_addr = v102;
                      v119 = inet_ntoa(v118);
                      *(_DWORD *)stat buf = 136315394;
                      *(void *)&buf[4] = v119;
                      v115 = "send %s failed, %m";
                      uint32_t v116 = 14;
                    }

                    else
                    {
                      if (!v111) {
                        goto LABEL_254;
                      }
                      uint64_t v112 = nullsub_1(v101);
                      v113.in_addr_t s_addr = v102;
                      v114 = inet_ntoa(v113);
                      *(_DWORD *)stat buf = 136315394;
                      *(void *)&buf[4] = v112;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = v114;
                      v115 = "Relayed Response [%s] to %s";
                      uint32_t v116 = 22;
                    }

                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  v115,  buf,  v116);
                  }
                }
              }

LABEL_254:
              if (!byte_1000181C0) {
                return;
              }
              gettimeofday(__dst, 0LL);
              sub_10000CB70(__dst[0].tv_sec, __dst[0].tv_usec, qword_100018A00, *(int *)algn_100018A08, (uint64_t)&v130);
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
                return;
              }
              *(_DWORD *)stat buf = 134218240;
              *(void *)&buf[4] = v130;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = (_DWORD)__src;
              int v5 = "service time %lu.%06d seconds";
              int v6 = buf;
              os_log_type_t v7 = OS_LOG_TYPE_INFO;
              uint32_t v8 = 18;
LABEL_8:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v7, v5, v6, v8);
              return;
            }
          }

          if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            return;
          }
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          int v5 = "ignoring request on %s (no services enabled)";
        }

        else
        {
          if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            return;
          }
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          int v5 = "ignoring request on %s";
        }
      }

      else
      {
        if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        LODWORD(__dst[0].tv_sec) = 136315138;
        *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
        int v5 = "ignoring request on %s (no IP address)";
      }
    }

    else
    {
      if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      LODWORD(__dst[0].tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
      int v5 = "unknown interface %s";
    }

    int v6 = (uint8_t *)__dst;
LABEL_173:
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    uint32_t v8 = 12;
    goto LABEL_8;
  }

BOOL sub_100003738(_BYTE *a1, uint64_t a2, _BYTE *a3, char *a4, int a5)
{
  if (!a1 || (uint32_t v8 = a1, !*a1))
  {
    if (!a3 || (uint32_t v8 = a3, !*a3))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        CFPropertyListRef v9 = "no replyfile";
        v10 = v19;
        uint32_t v11 = 2;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v9, v10, v11);
      }

      return 1LL;
    }
  }

  __strlcpy_chk(v19, v8, 1024LL, 1024LL);
  if (v19[0] == 47)
  {
    __strlcpy_chk(__s, v19, 1024LL, 1024LL);
    if (!a2) {
      goto LABEL_13;
    }
  }

  else
  {
    __strlcpy_chk(__s, aPrivateTftpboo, 1024LL, 1024LL);
    __strlcat_chk(__s, "/", 1024LL, 1024LL);
    __strlcat_chk(__s, v19, 1024LL, 1024LL);
    if (!a2) {
      goto LABEL_13;
    }
  }

  int v12 = strlen(__s);
  __strlcat_chk(__s, ".", 1024LL, 1024LL);
  __strlcat_chk(__s, a2, 1024LL, 1024LL);
  if ((access(__s, 4) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  __s[v12] = 0;
LABEL_13:
  if ((access(__s, 4) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  if (byte_1000189F8 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315138;
      *(void *)CFTypeID v17 = __s;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "boot file %s* missing",  (uint8_t *)&v16,  0xCu);
    }

LABEL_14:
    int v13 = strlen(__s);
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v13 < a5)
    {
      if (v14)
      {
        int v16 = 136315138;
        *(void *)CFTypeID v17 = __s;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "replyfile %s",  (uint8_t *)&v16,  0xCu);
      }

      strlcpy(a4, __s, a5);
      return 1LL;
    }

    if (v14)
    {
      int v16 = 67109376;
      *(_DWORD *)CFTypeID v17 = v13;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = a5;
      CFPropertyListRef v9 = "boot file name too long %d >= %d";
      v10 = (uint8_t *)&v16;
      uint32_t v11 = 14;
      goto LABEL_20;
    }

    return 1LL;
  }

  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (result)
  {
    int v16 = 136315138;
    *(void *)CFTypeID v17 = __s;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "boot file %s* missing - not replying",  (uint8_t *)&v16,  0xCu);
    return 0LL;
  }

  return result;
}

BOOL sub_100003A58(int a1, int a2, uint64_t a3)
{
  if (a2)
  {
    if (qword_1000181B8) {
      return SubnetListAreAddressesOnSameSupernet(qword_1000181B8, a1, a2);
    }
    return 0LL;
  }

  int v5 = HIBYTE(a1);
  int v6 = BYTE2(a1);
  int v7 = BYTE1(a1);
  int v8 = a1;
  unsigned int v9 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
  if (sub_10000C3E8(a3, v9) != -1)
  {
    if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return 1LL;
    }
    int v23 = 136316162;
    uint64_t v24 = nullsub_1(a3);
    __int16 v25 = 1024;
    *(_DWORD *)uint32_t v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    __int16 v27 = 1024;
    int v28 = v6;
    __int16 v29 = 1024;
    int v30 = v5;
    v10 = "%s: %d.%d.%d.%d on subnet";
    uint32_t v11 = 36;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v23, v11);
    return 1LL;
  }

  int v12 = sub_10000C474(a3);
  uint64_t v13 = *(unsigned int *)qword_1000189E8;
  if ((int)v13 >= 1)
  {
    BOOL v14 = *(unsigned __int8 **)(qword_1000189E8 + 8);
    while (1)
    {
      if (v14[9] == 18 && v12 == *((unsigned __int16 *)v14 + 5))
      {
        int v15 = *((_DWORD *)v14 + 1);
        if (v15)
        {
          if ((v15 & v9) == *(_DWORD *)v14) {
            break;
          }
        }
      }

      v14 += 28;
      if (!--v13) {
        goto LABEL_17;
      }
    }

    if (!byte_1000181C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return 1LL;
    }
    uint64_t v18 = nullsub_1(a3);
    int v19 = *v14;
    int v20 = v14[1];
    int v21 = v14[2];
    int v22 = v14[3];
    int v23 = 136317186;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    *(_DWORD *)uint32_t v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    __int16 v27 = 1024;
    int v28 = v6;
    __int16 v29 = 1024;
    int v30 = v5;
    __int16 v31 = 1024;
    int v32 = v19;
    __int16 v33 = 1024;
    int v34 = v20;
    __int16 v35 = 1024;
    int v36 = v21;
    __int16 v37 = 1024;
    int v38 = v22;
    v10 = "%s: %d.%d.%d.%d on subnet route %d.%d.%d.%d";
    uint32_t v11 = 60;
    goto LABEL_8;
  }

LABEL_17:
  if (byte_1000181C0)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v16 = nullsub_1(a3);
    v17.in_addr_t s_addr = v9;
    int v23 = 136315394;
    uint64_t v24 = v16;
    __int16 v25 = 2080;
    *(void *)uint32_t v26 = inet_ntoa(v17);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: ip %s not reachable",  (uint8_t *)&v23,  0x16u);
  }

  return 0LL;
}

BOOL sub_100003D38(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) != a2) {
    return sub_100003A58(a2, *(_DWORD *)a1, *(void *)(a1 + 8));
  }
  return v2;
}

BOOL sub_100003D88(uint64_t a1, uint64_t a2, unsigned int a3, int a4, in_addr_t *a5)
{
  in_addr_t v7 = *(_DWORD *)(a2 + 12);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v8.in_addr_t s_addr = v7;
      *(_DWORD *)stat buf = 136315138;
      uint32_t v26 = inet_ntoa(v8);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "reply ciaddr %s",  buf,  0xCu);
    }

    uint64_t v9 = 0LL;
LABEL_5:
    unsigned int v10 = 68;
    unsigned __int16 v11 = 67;
    goto LABEL_23;
  }

  in_addr_t v7 = *(_DWORD *)(a2 + 24);
  if (!v7)
  {
    if (a4 || (*(_WORD *)(a2 + 10) & 0x80) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "replying using broadcast IP address",  buf,  2u);
      }

      uint64_t v9 = 0LL;
      in_addr_t v7 = -1;
    }

    else
    {
      BOOL v14 = (in_addr_t *)(a2 + 16);
      if (a5) {
        BOOL v14 = a5;
      }
      in_addr_t v7 = *v14;
      uint64_t v9 = a2 + 28;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v15.in_addr_t s_addr = v7;
      uint64_t v16 = inet_ntoa(v15);
      *(_DWORD *)stat buf = 136315138;
      uint32_t v26 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "replying to %s",  buf,  0xCu);
    }

    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v13.in_addr_t s_addr = v7;
    *(_DWORD *)stat buf = 136315138;
    uint32_t v26 = inet_ntoa(v13);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "reply giaddr %s",  buf,  0xCu);
  }

  if (a4)
  {
    uint64_t v9 = 0LL;
    *(_WORD *)(a2 + 10) |= 0x8000u;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  unsigned int v10 = 67;
  unsigned __int16 v11 = 68;
LABEL_23:
  int v17 = dword_100018080;
  uint64_t v18 = off_100018090;
  int v19 = (const char *)nullsub_1(a1);
  int v20 = sub_10000C458(a1);
  int v21 = sub_10000C384(a1);
  if ((sub_10000FE04(v17, v18, v19, v20, v9, v7, v21, v10, v11, (void *)a2, a3) & 0x80000000) != 0)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)stat buf = 6291714;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "transmit failed, %m",  buf,  4u);
      return 0LL;
    }
  }

  else
  {
    if (byte_1000181C0)
    {
      Mutable = CFStringCreateMutable(0LL, 0LL);
      sub_1000097C0(Mutable, (unsigned __int8 *)a2, a3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 138412290;
        uint32_t v26 = (char *)Mutable;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "==== Server Reply ====\n%@",  buf,  0xCu);
      }

      CFRelease(Mutable);
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_1000040EC(char *a1, unsigned int a2, uint64_t a3, uint64_t *a4, _BYTE *a5, unsigned int a6)
{
  int v54 = sub_100009798((uint64_t)a4);
  if (qword_1000181B8)
  {
    uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_1000181B8, a2, 1);
    if (!SubnetForAddress) {
      uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_1000181B8, a2, 0);
    }
  }

  else
  {
    uint64_t SubnetForAddress = 0LL;
  }

  if (a5) {
    uint64_t v11 = a6;
  }
  else {
    uint64_t v11 = 5LL;
  }
  if (!a5) {
    a5 = &unk_100010C9A;
  }
  if ((int)v11 >= 1)
  {
    __src = 0LL;
    uint64_t v12 = 0LL;
    int v56 = 0;
    in_addr v13 = (os_log_s *)&_os_log_default;
    BOOL v14 = "couldn't add hostname: %s";
    while (1)
    {
      int v15 = *a5;
      if ((v15 - 50) >= 0xA)
      {
        if (*a5 > 0x3Cu)
        {
          if (v15 == 61 || v15 == 255) {
            goto LABEL_13;
          }
          goto LABEL_26;
        }

        if (*a5) {
          break;
        }
      }

LABEL_13:
      ++a5;
      if (!--v11) {
        return sub_100009798((uint64_t)a4) - v54;
      }
    }

    if (v15 == 12)
    {
      if (!a1) {
        goto LABEL_13;
      }
      int v16 = strlen(a1);
      int v17 = sub_100009770(a4);
      *(_DWORD *)stat buf = 136315138;
      *(void *)v59 = v17;
      uint64_t v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      int v20 = v14;
      goto LABEL_22;
    }

  *a1 = i;
}

LABEL_26:
    if (SubnetForAddress)
    {
      OptionPtrAndLength = (void *)SubnetGetOptionPtrAndLength(SubnetForAddress, v15, &v57);
      BOOL v23 = OptionPtrAndLength != 0LL;
      if (OptionPtrAndLength
        && sub_100009558((uint64_t)a4, *a5, v57, OptionPtrAndLength)
        && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v14;
        __int16 v25 = v13;
        uint64_t v26 = v12;
        uint64_t v27 = SubnetForAddress;
        int v28 = a1;
        int v29 = *a5;
        int v30 = sub_100009770(a4);
        *(_DWORD *)stat buf = 67109378;
        *(_DWORD *)v59 = v29;
        a1 = v28;
        uint64_t SubnetForAddress = v27;
        uint64_t v12 = v26;
        in_addr v13 = v25;
        BOOL v14 = v24;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = v30;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add option %d: %s", buf, 0x12u);
      }
    }

    else
    {
      BOOL v23 = 0;
    }

    if (v23 || !dword_1000180A4) {
      goto LABEL_87;
    }
    if (!v56)
    {
      uint64_t v31 = sub_10000C3E8(a3, a2);
      if ((_DWORD)v31 != -1) {
        uint64_t v12 = sub_10000C37C(a3, v31);
      }
      __src = (_DWORD *)inetroute_default(qword_1000189E8);
    }

    unsigned int v32 = *a5;
    int v56 = 1;
    if (v32 <= 5)
    {
      if (v32 == 1)
      {
        if (!v12) {
          goto LABEL_69;
        }
        uint64_t v51 = v12;
        v42 = (_DWORD *)(v12 + 4);
        if (sub_100009558((uint64_t)a4, 1, 4, v42))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            in_addr v43 = sub_100009770(a4);
            *(_DWORD *)stat buf = 136315138;
            *(void *)v59 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "couldn't add subnet_mask: %s",  buf,  0xCu);
          }

          int v56 = 1;
          uint64_t v12 = v51;
          goto LABEL_13;
        }

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v46.in_addr_t s_addr = *v42;
          v47 = inet_ntoa(v46);
          uint64_t v48 = nullsub_1(a3);
          *(_DWORD *)stat buf = 136315394;
          *(void *)v59 = v47;
          *(_WORD *)&v59[8] = 2080;
          *(void *)&v59[10] = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "subnet mask %s derived from %s",  buf,  0x16u);
          int v56 = 1;
          uint64_t v12 = v51;
          goto LABEL_88;
        }

        int v56 = 1;
        uint64_t v12 = v51;
        goto LABEL_87;
      }

      if (v32 != 3) {
        goto LABEL_87;
      }
      int v56 = 1;
      if (!__src) {
        goto LABEL_13;
      }
      if (!v12) {
        goto LABEL_13;
      }
      int v37 = *(_DWORD *)(v12 + 4);
      int v36 = *(_DWORD *)(v12 + 8);
      int v56 = 1;
      if ((*__src & v37) != v36 || (v37 & a2) != v36) {
        goto LABEL_13;
      }
      if (sub_100009558((uint64_t)a4, 3, 4, __src))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = sub_100009770(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)v59 = v38;
          int v34 = v13;
          __int16 v35 = "couldn't add router: %s";
          goto LABEL_59;
        }

  *a4 = v6;
  return v5;
}

    sub_10000EEF4(a1, (uint64_t)v9);
  }

  return v9;
}

LABEL_69:
        int v56 = 1;
        goto LABEL_13;
      }

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        v44 = v13;
        int v45 = "default route added as router";
        goto LABEL_85;
      }
    }

    else
    {
      if (v32 != 6)
      {
        if (v32 != 15)
        {
          if (v32 != 119) {
            goto LABEL_87;
          }
          if (qword_100018A28)
          {
            if (sub_100009558((uint64_t)a4, 119, dword_100018A30, (void *)qword_100018A28))
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v33 = sub_100009770(a4);
                *(_DWORD *)stat buf = 136315138;
                *(void *)v59 = v33;
                int v34 = v13;
                __int16 v35 = "couldn't add domain search: %s";
                goto LABEL_59;
              }

              goto LABEL_69;
            }

            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)stat buf = 0;
              v44 = v13;
              int v45 = "domain search added";
LABEL_85:
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, v45, buf, 2u);
              int v56 = 1;
              goto LABEL_88;
            }
          }

          goto LABEL_86;
        }

        if (qword_100018A20)
        {
          int v40 = strlen((const char *)qword_100018A20);
          if (sub_100009558((uint64_t)a4, 15, v40, (void *)qword_100018A20))
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v41 = sub_100009770(a4);
              *(_DWORD *)stat buf = 136315138;
              *(void *)v59 = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "couldn't add domain name: %s",  buf,  0xCu);
            }

            int v56 = 1;
            BOOL v14 = "couldn't add hostname: %s";
            goto LABEL_13;
          }

          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "default domain name added", buf, 2u);
            int v56 = 1;
            BOOL v14 = "couldn't add hostname: %s";
            goto LABEL_88;
          }

          int v56 = 1;
        }

        else
        {
          int v56 = 1;
        }

        BOOL v14 = "couldn't add hostname: %s";
LABEL_87:
        if (v23) {
          goto LABEL_13;
        }
LABEL_88:
        if (*a5 != 108 || ((*(_DWORD *)(a3 + 76) | dword_1000189F0) & 0x80) == 0) {
          goto LABEL_13;
        }
        if (sub_100009558((uint64_t)a4, 108, 4, &dword_100018A34))
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          uint64_t v49 = sub_100009770(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)v59 = v49;
          uint64_t v18 = v13;
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
          int v20 = "couldn't add ipv6 only preferred: %s";
LABEL_22:
          uint32_t v21 = 12;
        }

        else
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
            goto LABEL_13;
          }
          *(_WORD *)stat buf = 0;
          uint64_t v18 = v13;
          os_log_type_t v19 = OS_LOG_TYPE_INFO;
          int v20 = "IPv6-only preferred option added";
          uint32_t v21 = 2;
        }

        _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, v21);
        goto LABEL_13;
      }

      if (!dword_100018A14) {
        goto LABEL_69;
      }
      if (sub_100009558((uint64_t)a4, 6, 4 * dword_100018A14, (void *)qword_100018A18))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          in_addr v39 = sub_100009770(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)v59 = v39;
          int v34 = v13;
          __int16 v35 = "couldn't add dns servers: %s";
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        }

        goto LABEL_69;
      }

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        v44 = v13;
        int v45 = "default dns servers added";
        goto LABEL_85;
      }
    }

LABEL_86:
    int v56 = 1;
    goto LABEL_87;
  }

  return sub_100009798((uint64_t)a4) - v54;
}

void sub_100004924(id a1)
{
  if (v2.tv_sec - qword_100018A00 >= 300)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)ssize_t v1 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "idle, exiting",  v1,  2u);
    }

    exit(0);
  }

void sub_1000049A8(id a1)
{
  byte_100018A44 = 0;
}

BOOL sub_1000049B4(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      if ((sub_100008990(Value, &v8) & 1) != 0)
      {
        return v8 != 0;
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v10 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid '%s' property",  buf,  0xCu);
      }
    }
  }

  return a4;
}

uint64_t sub_100004A80(uint64_t result, int a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = (const __CFString *)result;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (CFGetTypeID(v3) == TypeID)
  {
    BOOL result = CFEqual(v3, kCFBooleanTrue);
    if (!(_DWORD)result) {
      return result;
    }
    goto LABEL_4;
  }

  CFTypeID v5 = CFStringGetTypeID();
  if (CFGetTypeID(v3) == v5)
  {
    uint64_t v6 = 1LL;
    ValueAtIndex = v3;
    goto LABEL_7;
  }

  CFTypeID v10 = CFArrayGetTypeID();
  BOOL result = CFGetTypeID(v3);
  if (result == v10)
  {
    BOOL result = CFArrayGetCount((CFArrayRef)v3);
    if (!result)
    {
LABEL_4:
      dword_1000189F0 |= a2;
      return result;
    }

    uint64_t v6 = result;
    if (result >= 1)
    {
      ValueAtIndex = 0LL;
LABEL_7:
      for (CFIndex i = 0LL; i != v6; ++i)
      {
        if (!ValueAtIndex || i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v3, i);
          BOOL result = CFStringGetTypeID();
          if (!ValueAtIndex) {
            continue;
          }
          uint64_t v9 = result;
          BOOL result = CFGetTypeID(ValueAtIndex);
          if (result != v9) {
            continue;
          }
        }

        BOOL result = CFStringGetCString(ValueAtIndex, buffer, 17LL, 0x600u);
        if ((_DWORD)result && buffer[0])
        {
          BOOL result = sub_10000BA9C((uint64_t *)qword_1000189C8, buffer);
          if (result) {
            *(_DWORD *)(result + 76) |= a2;
          }
        }
      }
    }
  }

  return result;
}

char *sub_100004C14(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFTypeID v5 = (char *)malloc(6 * Count);
  if (Count < 1) {
    goto LABEL_12;
  }
  CFIndex v6 = 0LL;
  int v7 = 0;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
    CFTypeID TypeID = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        if (CFStringGetCString(ValueAtIndex, buffer, 64LL, 0x600u))
        {
          if (strlen(buffer) >= 2)
          {
            CFTypeID v10 = ether_aton(&buffer[2 * (*(unsigned __int16 *)buffer == 11313)]);
            if (v10)
            {
              uint64_t v11 = &v5[6 * v7];
              int v12 = *(_DWORD *)v10->octet;
              *((_WORD *)v11 + 2) = *(_WORD *)&v10->octet[4];
              *(_DWORD *)uint64_t v11 = v12;
              ++v7;
            }
          }
        }
      }
    }

    ++v6;
  }

  while (Count != v6);
  if (v7)
  {
    qsort(v5, v7, 6uLL, (int (__cdecl *)(const void *, const void *))sub_10000CE48);
  }

  else
  {
LABEL_12:
    free(v5);
    int v7 = 0;
    CFTypeID v5 = 0LL;
  }

  *a2 = v7;
  return v5;
}

unsigned int *sub_100004D88(int a1, _DWORD *a2)
{
  *a2 = 0;
  timeval v2 = (unsigned int *)qword_100019268;
  while (v2[1] || v2[2] != a1)
  {
    timeval v2 = (unsigned int *)((char *)v2 + ((*v2 + 3LL) & 0x1FFFFFFFCLL));
  }

  if (*v2 < 0xC) {
    return 0LL;
  }
  *a2 = *v2 - 12;
  return v2 + 3;
}

uint64_t sub_100004DFC()
{
  v0 = CFDictionaryCreate( 0LL,  (const void **)&kSCDynamicStoreUseSessionKeys,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  qword_1000194A0 = (uint64_t)SCDynamicStoreCreateWithOptions( 0LL,  @"com.apple.network.bootpd",  v0,  (SCDynamicStoreCallBack)sub_100004F50,  0LL);
  CFRelease(v0);
  if (!qword_1000194A0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SCDynamicStoreCreate failed",  v4,  2u);
    }

    exit(2);
  }

  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4);
  Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_1000194A0, 0LL, Mutable);
  CFRelease(Mutable);
  return SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)qword_1000194A0, &_dispatch_main_q);
}

void sub_100004F50()
{
  byte_100018A44 = 0;
}

void sub_100004F5C(const char *a1)
{
  if (a1) {
    ssize_t v1 = a1;
  }
  else {
    ssize_t v1 = "/etc/bootptab";
  }
  timeval v2 = fopen(v1, "r");
  if (!v2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)stat buf = 136315138;
    in_addr v46 = v1;
    int v22 = "can't open %s";
    BOOL v23 = buf;
    os_log_type_t v24 = OS_LOG_TYPE_INFO;
    uint32_t v25 = 12;
    goto LABEL_59;
  }

  uint64_t v3 = v2;
  int v4 = fileno(v2);
  if (!fstat(v4, &v32) && v32.st_mtimespec.tv_sec == qword_1000194B0)
  {
    fclose(v3);
    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    in_addr v46 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "re-reading %s",  buf,  0xCu);
  }

  qword_1000194B0 = v32.st_mtimespec.tv_sec;
  CFTypeID v5 = (void *)qword_1000194B8;
  if (qword_1000194B8)
  {
    do
    {
      CFIndex v6 = (void *)*v5;
      hostfree(&qword_1000194B8, v5);
      CFTypeID v5 = v6;
    }

    while (v6);
  }

  if (fgets((char *)buf, 256, v3))
  {
    int v26 = 0;
    int v7 = 0;
    int v8 = 0;
    BOOL v9 = 1;
    while (1)
    {
      int v10 = strlen((const char *)buf);
      if (v10) {
        buf[v10 - 1] = 0;
      }
      uint64_t v31 = buf;
      ++v8;
      if (buf[0] <= 0x23u && ((1LL << buf[0]) & 0x900000001LL) != 0) {
        goto LABEL_20;
      }
      if (!v9) {
        break;
      }
      BOOL v9 = buf[0] != 37;
LABEL_20:
    }

    int v27 = v7 + 1;
    sub_100005524(&v31, v8, v42, 63);
    sub_100005524(&v31, v8, v44, 64);
    sscanf(v44, "%d", &v29);
    sub_100005524(&v31, v8, v44, 64);
    int v12 = v43;
    __strlcpy_chk(v43, v44, 64LL, 64LL);
    uint64_t v13 = 0LL;
    int v14 = 1;
    do
    {
      for (CFIndex i = v12 + 1; ; ++i)
      {
        unsigned int v16 = *(i - 1);
        if (v16 <= 0x3A && ((1LL << v16) & 0x400400000000001LL) != 0) {
          break;
        }
      }

      *(i - 1) = 0;
      if (sscanf(v12, "%x", &v28) != 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v33 = 136315394;
          int v34 = v44;
          __int16 v35 = 1024;
          int v36 = v8;
          int v20 = "bad hex address: %s, at line %d of bootptab";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, v33, 0x12u);
        }

LABEL_43:
        BOOL v9 = 0;
        int v7 = v27;
        goto LABEL_20;
      }

      int v18 = v28;
      uint64_t v19 = v13 + 1;
      v37[v13] = v28;
      if (v18) {
        int v14 = 0;
      }
      if (!v16) {
        break;
      }
      ++v13;
      int v12 = i;
    }

    while (v19 != 32);
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v33 = 136315394;
        int v34 = v44;
        __int16 v35 = 1024;
        int v36 = v8;
        int v20 = "zero hex address: %s, at line %d of bootptab";
        goto LABEL_42;
      }

      goto LABEL_43;
    }

    if (v29 != 1 || (_DWORD)v19 == 6)
    {
      sub_100005524(&v31, v8, v44, 64);
      in_addr_t v30 = inet_addr(v44);
      int v7 = v27;
      if (v30 + 1 > 1)
      {
        sub_100005524(&v31, v8, v38, 127);
        hostadd(&qword_1000194B8, 0LL, v29, (uint64_t)v37, v19, &v30, v42, (const char *)v38);
        BOOL v9 = 0;
        ++v26;
        goto LABEL_20;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_52;
      }
      *(_DWORD *)__int16 v33 = 136315394;
      int v34 = v44;
      __int16 v35 = 1024;
      int v36 = v8;
      uint32_t v21 = "bad internet address: %s, at line %d of bootptab";
    }

    else
    {
      int v7 = v27;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:
        BOOL v9 = 0;
        goto LABEL_20;
      }

      *(_DWORD *)__int16 v33 = 136315394;
      int v34 = v44;
      __int16 v35 = 1024;
      int v36 = v8;
      uint32_t v21 = "bad hex address: %s, at line %d of bootptab";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v33, 0x12u);
    goto LABEL_52;
  }

  int v7 = 0;
  int v26 = 0;
LABEL_57:
  fclose(v3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v38 = 67109376;
    int v39 = v26;
    __int16 v40 = 1024;
    int v41 = v7 - v26;
    int v22 = "Loaded %d entries from bootptab (%d bad)";
    BOOL v23 = v38;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    uint32_t v25 = 14;
LABEL_59:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v24, v22, v23, v25);
  }

void sub_100005524(_BYTE **a1, int a2, _BYTE *a3, int a4)
{
  for (CFIndex i = *a1; ; ++i)
  {
    int v8 = *i;
    if (v8 != 9 && v8 != 32) {
      break;
    }
  }

  if (*i)
  {
    for (uint64_t j = 0LL; ; ++j)
    {
      if (v8 <= 0x20u && ((1LL << v8) & 0x100000201LL) != 0)
      {
        a3[j] = 0;
        i += j;
        goto LABEL_13;
      }

      a3[j] = v8;
      if (a4 <= 2) {
        break;
      }
      LOBYTE(v8) = i[j + 1];
      --a4;
    }

    a3[j + 1] = 0;
    i += j;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = a3;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "string truncated: %s, on line %d of bootptab",  (uint8_t *)&v10,  0x12u);
    }
  }

  else
  {
    *a3 = 0;
  }

uint64_t sub_100005678( int a1, void *a2, unsigned int a3, unsigned int (*a4)(uint64_t, void), uint64_t a5, _DWORD *a6, char **a7, char **a8)
{
  uint64_t v8 = qword_1000194B8;
  if (!qword_1000194B8) {
    return 0LL;
  }
  size_t v17 = a3;
  while (*(unsigned __int8 *)(v8 + 20) != a1
       || *(unsigned __int8 *)(v8 + 21) != a3
       || bcmp(a2, (const void *)(v8 + 22), v17)
       || a4 && !a4(a5, *(unsigned int *)(v8 + 16)))
  {
    uint64_t v8 = *(void *)v8;
    if (!v8) {
      return 0LL;
    }
  }

  if (a7) {
    *a7 = strdup(*(const char **)(v8 + 280));
  }
  if (a8) {
    *a8 = strdup(*(const char **)(v8 + 288));
  }
  *a6 = *(_DWORD *)(v8 + 16);
  return 1LL;
}

uint64_t sub_10000575C(int a1, char **a2, char **a3)
{
  uint64_t v3 = qword_1000194B8;
  if (!qword_1000194B8) {
    return 0LL;
  }
  while (*(_DWORD *)(v3 + 16) != a1)
  {
    uint64_t v3 = *(void *)v3;
    if (!v3) {
      return 0LL;
    }
  }

  if (a2) {
    *a2 = strdup(*(const char **)(v3 + 280));
  }
  if (a3) {
    *a3 = strdup(*(const char **)(v3 + 288));
  }
  return 1LL;
}

uint64_t sub_1000057D0(uint64_t *a1)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  sub_10000E858(a1);
  sub_10000E86C((uint64_t)a1, 104857600);
  sub_10000E8F4(a1);
  uint64_t result = 0LL;
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  return result;
}

uint64_t sub_100005834(uint64_t a1, uint64_t a2, int a3, uint64_t *a4, in_addr *a5)
{
  CFTypeID v5 = *(void **)(a1 + 8);
  if (!v5) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v9 = sub_10000F4FC(*v5, v5[1], "ip_address", 0LL);
    if (v9 << 32 != 0xFFFFFFFF00000000LL)
    {
      uint64_t v10 = v5[1];
      if (*(_DWORD *)(v10 + 24LL * (int)v9 + 8))
      {
        if (inet_aton(**(const char ***)(v10 + 24LL * (int)v9 + 16), &v18) && sub_100003A58(v18.s_addr, a3, a2))
        {
          uint64_t v11 = sub_10000F4FC(*v5, v5[1], "lease", 0LL);
          if (v11 << 32 == 0xFFFFFFFF00000000LL) {
            break;
          }
          uint64_t v12 = v5[1];
          if (*(_DWORD *)(v12 + 24LL * (int)v11 + 8))
          {
            uint64_t v13 = strtol(**(const char ***)(v12 + 24LL * (int)v11 + 16), 0LL, 0);
            if ((v13 != 0x7FFFFFFFFFFFFFFFLL || *__error() != 34) && *a4 > v13) {
              break;
            }
          }
        }
      }
    }

    CFTypeID v5 = (void *)v5[5];
    if (!v5) {
      return 0LL;
    }
  }

  uint64_t v19 = v5;
  sub_100005A20((uint64_t *)&v19);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v15.in_addr_t s_addr = v18.s_addr;
    unsigned int v16 = inet_ntoa(v15);
    *(_DWORD *)stat buf = 136315138;
    uint32_t v21 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "dhcp: reclaimed address %s",  buf,  0xCu);
  }

  a5->in_addr_t s_addr = v18.s_addr;
  return 1LL;
}

uint64_t sub_100005A20(uint64_t *a1)
{
  uint64_t v2 = *a1;
  sub_10000EE98((uint64_t)&xmmword_1000194C8, *a1);
  sub_10000E828(v2);
  *a1 = 0LL;
  sub_10000ED14((unsigned int **)&xmmword_1000194C8, "/var/db/dhcpd_leases");
  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

uint64_t sub_100005A80(uint64_t a1)
{
  ssize_t v1 = sub_1000091DC(a1, 57, &v4, 0LL);
  uint64_t result = 548LL;
  if (v1 && v4 == 2)
  {
    unsigned int v3 = bswap32(*(unsigned __int16 *)v1) >> 16;
    if (v3 <= 0x224) {
      return 548LL;
    }
    else {
      return v3;
    }
  }

  return result;
}

void sub_100005AD8()
{
  if ((byte_1000194C0 & 1) != 0)
  {
    if (sub_1000057D0((uint64_t *)&v0))
    {
      sub_10000E8F4((uint64_t *)&xmmword_1000194C8);
      xmmword_1000194C8 = v0;
      qword_1000194D8 = v1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 67109120;
        int v3 = HIDWORD(qword_1000194D8);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcp: re-reading lease list (%d entries)",  buf,  8u);
      }
    }
  }

  else if (sub_1000057D0((uint64_t *)&xmmword_1000194C8))
  {
    byte_1000194C0 = 1;
  }

uint64_t sub_100005BCC(uint64_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t *a6)
{
  uint64_t v8 = a1;
  int __src = a3;
  __int128 v10 = a5[1];
  __int128 v9 = a5[2];
  *(_OWORD *)a1 = *a5;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  __int128 v11 = a5[3];
  __int128 v12 = a5[4];
  __int128 v13 = a5[6];
  *(_OWORD *)(a1 + 80) = a5[5];
  *(_OWORD *)(a1 + 96) = v13;
  *(_OWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v12;
  __int128 v14 = a5[7];
  __int128 v15 = a5[8];
  __int128 v16 = a5[10];
  *(_OWORD *)(a1 + 144) = a5[9];
  *(_OWORD *)(a1 + 160) = v16;
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = v15;
  __int128 v17 = a5[11];
  __int128 v18 = a5[12];
  __int128 v19 = a5[13];
  *(_OWORD *)(a1 + 220) = *(_OWORD *)((char *)a5 + 220);
  *(_OWORD *)(a1 + 192) = v18;
  *(_OWORD *)(a1 + 208) = v19;
  *(_OWORD *)(a1 + 176) = v17;
  *(_DWORD *)(a1 + 20) = a3;
  *(_BYTE *)(a1 + 3) = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 2;
  *(_DWORD *)(a1 + 236) = 1666417251;
  sub_100009550((uint64_t)a6, (void *)(a1 + 240), a2 - 240);
  if (sub_100009744((uint64_t)a6, a4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109378;
      LODWORD(v26[0]) = a4;
      WORD2(v26[0]) = 2080;
      *(void *)((char *)v26 + 6) = sub_100009770(a6);
      int v20 = "make_dhcp_reply: couldn't add dhcp message tag %d: %s";
      uint32_t v21 = 18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v20, buf, v21);
      return 0LL;
    }

    return 0LL;
  }

  if (sub_100009558((uint64_t)a6, 54, 4, &__src))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v22 = sub_100009770(a6);
      *(_DWORD *)stat buf = 136315138;
      v26[0] = v22;
      int v20 = "make_dhcp_reply: couldn't add server identifier tag: %s";
      uint32_t v21 = 12;
      goto LABEL_7;
    }

    return 0LL;
  }

  return v8;
}

void sub_100005D94(int *a1, uint64_t a2, _DWORD *a3)
{
}

uint64_t sub_100005E18(int a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v4 = qword_1000181B8;
  if (!qword_1000181B8) {
    return 0LL;
  }
  if (a1)
  {
    *a4 = a1;
    return SubnetListAcquireAddress(v4, a4, (uint64_t (*)(uint64_t, uint64_t))sub_1000081BC, a3);
  }

  uint64_t v9 = 0LL;
  while (1)
  {
    *a4 = *(_DWORD *)(sub_10000C37C(a2, v9) + 8);
    uint64_t result = SubnetListAcquireAddress(qword_1000181B8, a4, (uint64_t (*)(uint64_t, uint64_t))sub_1000081BC, a3);
    if (result) {
      break;
    }
    uint64_t v9 = (v9 + 1);
  }

  return result;
}

uint64_t sub_100005EEC(const char *a1, const char *a2, in_addr_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  if (a4)
  {
    __int128 v10 = sub_1000080E8(a4, a5);
    *(void *)&__str[8] = 0LL;
    uint64_t v26 = 0LL;
    *(void *)__str = "name";
    if (v10) {
      sub_10000F5FC((uint64_t)&__str[8], v10, 0LL);
    }
    __int128 v23 = *(_OWORD *)__str;
    uint64_t v24 = v26;
    sub_10000F1F4((int *)&v19, (uint64_t)&v23, 0LL);
    sub_10000F594(&__str[8]);
    free(v10);
  }

  v11.in_addr_t s_addr = a3;
  __int128 v12 = inet_ntoa(v11);
  unint64_t v13 = v19;
  *(void *)&__str[8] = 0LL;
  uint64_t v26 = 0LL;
  *(void *)__str = "ip_address";
  if (v12) {
    sub_10000F5FC((uint64_t)&__str[8], v12, 0LL);
  }
  __int128 v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_10000F1F4((int *)&v19, (uint64_t)&v23, v13);
  sub_10000F594(&__str[8]);
  unint64_t v14 = v19;
  *(void *)&__str[8] = 0LL;
  uint64_t v26 = 0LL;
  *(void *)__str = "hw_address";
  if (a2) {
    sub_10000F5FC((uint64_t)&__str[8], a2, 0LL);
  }
  __int128 v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_10000F1F4((int *)&v19, (uint64_t)&v23, v14);
  sub_10000F594(&__str[8]);
  unint64_t v15 = v19;
  *(void *)&__str[8] = 0LL;
  uint64_t v26 = 0LL;
  *(void *)__str = "identifier";
  if (a1) {
    sub_10000F5FC((uint64_t)&__str[8], a1, 0LL);
  }
  __int128 v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_10000F1F4((int *)&v19, (uint64_t)&v23, v15);
  sub_10000F594(&__str[8]);
  snprintf(__str, 0x80uLL, "0x%lx", a6);
  unint64_t v16 = v19;
  *((void *)&v23 + 1) = 0LL;
  uint64_t v24 = 0LL;
  *(void *)&__int128 v23 = "lease";
  sub_10000F5FC((uint64_t)&v23 + 8, __str, 0LL);
  __int128 v21 = v23;
  uint64_t v22 = v24;
  sub_10000F1F4((int *)&v19, (uint64_t)&v21, v16);
  sub_10000F594((void *)&v23 + 1);
  __int128 v17 = sub_10000E7D8(v19, v20);
  sub_10000E930((uint64_t *)&xmmword_1000194C8, (uint64_t)v17);
  sub_10000ED14((unsigned int **)&xmmword_1000194C8, "/var/db/dhcpd_leases");
  sub_10000F3AC((unsigned int *)&v19);
  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

void sub_100006188(uint64_t *a1, unsigned int a2, int a3)
{
  *(void *)&v191[1] = 0LL;
  *(void *)v190 = 0LL;
  int v189 = 0;
  v188 = 0LL;
  unsigned int __src = 0;
  unsigned int v183 = 0;
  int v184 = 0;
  uint64_t v6 = a1[1];
  if (byte_1000180B2) {
    int v7 = (char **)&v191[1];
  }
  else {
    int v7 = 0LL;
  }
  v187.in_addr_t s_addr = 0;
  unsigned int v8 = sub_100005A80(a1[3]);
  if (v8 >= 0x5DC) {
    int v9 = 1500;
  }
  else {
    int v9 = v8;
  }
  __int128 v10 = sub_1000091DC(a1[3], 61, v191, 0LL);
  if (!v10
    || (int)v191[0] < 2
    || (in_addr v11 = v10 + 1, v12 = *v10, v13 = v191[0] - 1, --v191[0], byte_1000180B1) && *(_BYTE *)(v6 + 2))
  {
    int v12 = *(unsigned __int8 *)(v6 + 1);
    int v13 = *(unsigned __int8 *)(v6 + 2);
    v191[0] = v13;
    if (!v13)
    {
      unint64_t v15 = 0LL;
      goto LABEL_22;
    }

    in_addr v11 = (void *)(v6 + 28);
  }

  unint64_t v14 = identifierToStringWithBuffer(v12, (uint64_t)v11, v13, __str, 128);
  unint64_t v15 = v14;
  if (!v14)
  {
LABEL_22:
    unint64_t v16 = 0LL;
    goto LABEL_330;
  }

  int v179 = v9;
  unint64_t v16 = v14;
  if (!v12)
  {
    unint64_t v16 = identifierToStringWithBuffer(*(unsigned __int8 *)(v6 + 1), v6 + 28, *(unsigned __int8 *)(v6 + 2), v202, 48);
    if (!v16) {
      goto LABEL_330;
    }
  }

  int v175 = a3;
  __int128 v17 = sub_1000091DC(a1[3], 12, &v189, 0LL);
  int v18 = v189;
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  uint64_t v177 = (uint64_t)v17;
  if (v17 && v18)
  {
    if (!v19) {
      goto LABEL_31;
    }
    if (a2 > 8) {
      uint64_t v20 = "<unknown>";
    }
    else {
      uint64_t v20 = off_1000145E0[a2];
    }
    uint64_t v22 = nullsub_1(*a1);
    *(_DWORD *)stat buf = 136316162;
    *(void *)v200 = v20;
    *(_WORD *)&v200[8] = 2080;
    *(void *)&v200[10] = v22;
    *(_WORD *)&v200[18] = 2080;
    *(void *)&v200[20] = v15;
    *(_WORD *)&v200[28] = 1040;
    *(_DWORD *)&v200[30] = v189;
    *(_WORD *)&v200[34] = 2080;
    v201[0] = v17;
    __int128 v23 = "DHCP %s [%s]: %s <%.*s>";
    uint32_t v24 = 48;
  }

  else
  {
    if (!v19) {
      goto LABEL_31;
    }
    if (a2 > 8) {
      __int128 v21 = "<unknown>";
    }
    else {
      __int128 v21 = off_1000145E0[a2];
    }
    uint64_t v25 = nullsub_1(*a1);
    *(_DWORD *)stat buf = 136315650;
    *(void *)v200 = v21;
    *(_WORD *)&v200[8] = 2080;
    *(void *)&v200[10] = v25;
    *(_WORD *)&v200[18] = 2080;
    *(void *)&v200[20] = v15;
    __int128 v23 = "DHCP %s [%s]: %s";
    uint32_t v24 = 32;
  }

  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v23, buf, v24);
LABEL_31:
  v174 = sub_1000091DC(a1[3], 51, &v185, 0LL);
  v181 = v15;
  v178 = v16;
  if (!v12)
  {
    BOOL v28 = 0;
LABEL_36:
    *(_DWORD *)v192 = 0;
    *(void *)&v200[4] = *a1;
    *(void *)&v200[12] = 0LL;
    int v34 = *(_DWORD *)(v6 + 12);
    *(_DWORD *)stat buf = *(_DWORD *)(v6 + 24);
    *(_DWORD *)v200 = v34;
    __int16 v35 = (unsigned int *)sub_10000EF54( (uint64_t *)&xmmword_1000194C8,  v15,  (unsigned int (*)(uint64_t, void))sub_100003D38,  (uint64_t)buf,  &v187,  v192);
    stat v32 = v35;
    *(void *)v190 = v35;
    if (*(_DWORD *)v192 == 1) {
      BOOL v28 = 1;
    }
    BOOL v173 = v28;
    if (v35)
    {
      if (qword_1000181B8 && (uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_1000181B8, v187.s_addr, 1)) != 0)
      {
        uint64_t v37 = SubnetForAddress;
        if ((SubnetDoesAllocate(SubnetForAddress) & 1) != 0)
        {
          uint64_t v38 = *v32;
          if (!(_DWORD)v38) {
            goto LABEL_181;
          }
          int v39 = (const char ***)(*((void *)v32 + 1) + 16LL);
          while (strcmp("lease", (const char *)*(v39 - 2)))
          {
            v39 += 3;
            if (!--v38) {
              goto LABEL_181;
            }
          }

          if (*((_DWORD *)v39 - 2) && (uint64_t v112 = **v39) != 0LL)
          {
            uint64_t v113 = strtol(v112, 0LL, 0);
            if (v113 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v15 = (char *)v181;
              if (*__error() == 34)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v204 = 136315138;
                  v205 = (void *)v112;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "S_lease_time_expiry: lease '%s' bad",  v204,  0xCu);
                }

                uint64_t v33 = 0LL;
              }

              else
              {
                uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
              }

              sub_10000EEF4((uint64_t *)&xmmword_1000194C8, (uint64_t)v32);
LABEL_269:
              unsigned int MaxLease = SubnetGetMaxLease(v37);
              unsigned int MinLease = SubnetGetMinLease(v37);
              if (v174)
              {
                unsigned int v148 = bswap32(*(_DWORD *)v174);
                unsigned int __src = v148;
                if (v148 > MaxLease)
                {
                  int v31 = 0;
                  unsigned int v149 = MaxLease;
                  LODWORD(v32) = 0;
LABEL_274:
                  unsigned int __src = v149;
LABEL_305:
                  int v30 = 2;
                  uint64_t v29 = v37;
                  goto LABEL_53;
                }

                if (v148 >= MinLease)
                {
                  int v31 = 0;
                  LODWORD(v32) = 0;
                  goto LABEL_305;
                }
              }

              else
              {
                uint64_t v150 = *(void *)a1[5];
                if (v150 + MinLease < v33)
                {
                  int v31 = 0;
                  LODWORD(v32) = 0;
                  unsigned int v149 = v33 - v150;
                  goto LABEL_274;
                }
              }

              int v31 = 0;
              LODWORD(v32) = 0;
              unsigned int __src = MinLease;
              goto LABEL_305;
            }

            uint64_t v33 = v113;
            sub_10000EEF4((uint64_t *)&xmmword_1000194C8, (uint64_t)v32);
            unint64_t v15 = (char *)v181;
            if (v33 != -1) {
              goto LABEL_269;
            }
            int v30 = 2;
          }

          else
          {
LABEL_181:
            sub_10000EEF4((uint64_t *)&xmmword_1000194C8, (uint64_t)v32);
            int v30 = 2;
            unint64_t v15 = (char *)v181;
          }

          uint64_t v29 = v37;
          goto LABEL_34;
        }
      }

      else
      {
        uint64_t v37 = 0LL;
      }

      sub_100005A20((uint64_t *)v190);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        v40.in_addr_t s_addr = v187.s_addr;
        int v41 = inet_ntoa(v40);
        *(_DWORD *)v204 = 136315394;
        v205 = v15;
        __int16 v206 = 2080;
        v207 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcpd: removing %s binding for %s",  v204,  0x16u);
      }

      *(void *)v190 = 0LL;
      LODWORD(v32) = 1;
      uint64_t v29 = v37;
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    int v30 = 0;
    uint64_t v33 = 0LL;
    int v31 = 1;
    goto LABEL_53;
  }

  *(_OWORD *)&v200[4] = (unint64_t)*a1;
  int v26 = *(_DWORD *)(v6 + 12);
  *(_DWORD *)stat buf = *(_DWORD *)(v6 + 24);
  *(_DWORD *)v200 = v26;
  int v27 = sub_100005678( v12,  v11,  v191[0],  (unsigned int (*)(uint64_t, void))sub_100003D38,  (uint64_t)buf,  &v187,  (char **)&v188,  v7);
  BOOL v28 = *(_DWORD *)&v200[12] == 1;
  if (!v27) {
    goto LABEL_36;
  }
  BOOL v173 = *(_DWORD *)&v200[12] == 1;
  uint64_t v29 = 0LL;
  int v30 = 1;
LABEL_34:
  int v31 = 0;
  LODWORD(v32) = 0;
  unsigned int __src = -1;
  uint64_t v33 = -1LL;
LABEL_53:
  int v42 = v179 - 28;
  switch(a2)
  {
    case 1u:
      int v43 = v31;
      uint64_t v44 = qword_1000194E0;
      if (!qword_1000194E0) {
        goto LABEL_191;
      }
      size_t v45 = v191[0];
      while (*(unsigned __int8 *)(v44 + 20) != v12
           || (_DWORD)v45 != *(unsigned __int8 *)(v44 + 21)
           || bcmp(v11, (const void *)(v44 + 22), v45))
      {
        uint64_t v44 = *(void *)v44;
        if (!v44) {
          goto LABEL_191;
        }
      }

      hostfree(&qword_1000194E0, (void *)v44);
LABEL_191:
      if (sub_100007E7C(*a1, a1[3]))
      {
        unint64_t v16 = (char *)v178;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "client IPv6-only preferred",  buf,  2u);
        }

        in_addr_t s_addr = 0;
        v187.in_addr_t s_addr = 0;
        unsigned int v115 = 3600;
      }

      else
      {
        unint64_t v16 = (char *)v178;
        if (v43)
        {
          if (!v175) {
            goto LABEL_330;
          }
          uint64_t v116 = sub_100005E18(*(_DWORD *)(v6 + 24), *a1, a1[5], &v187);
          if (!v116
            && (!sub_100005834( (uint64_t)&xmmword_1000194C8,  *a1,  *(_DWORD *)(v6 + 24),  (uint64_t *)a1[5],  &v187)
             || !qword_1000181B8
             || (uint64_t v116 = SubnetListGetSubnetForAddress(qword_1000181B8, v187.s_addr, 1)) == 0))
          {
            unint64_t v16 = (char *)v178;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)stat buf = 0;
              v94 = "no ip addresses";
              os_log_type_t v95 = buf;
              os_log_type_t v96 = OS_LOG_TYPE_DEFAULT;
              uint32_t v97 = 2;
              goto LABEL_220;
            }

            goto LABEL_330;
          }

          unsigned int v117 = SubnetGetMaxLease(v116);
          unsigned int v118 = SubnetGetMinLease(v116);
          if (v174)
          {
            unsigned int v119 = bswap32(*(_DWORD *)v174);
            unsigned int __src = v119;
            unint64_t v16 = (char *)v178;
            if (v119 <= v117)
            {
              unint64_t v15 = (char *)v181;
              if (v119 < v118) {
                unsigned int __src = v118;
              }
            }

            else
            {
              unsigned int __src = v117;
              unint64_t v15 = (char *)v181;
            }
          }

          else
          {
            unsigned int __src = v118;
            unint64_t v15 = (char *)v181;
            unint64_t v16 = (char *)v178;
          }
        }

        v134 = hostadd(&qword_1000194E0, (_OWORD *)a1[5], v12, (uint64_t)v11, v191[0], &v187, 0LL, 0LL);
        if (!v134) {
          goto LABEL_330;
        }
        unsigned int v115 = __src;
        in_addr_t s_addr = v187.s_addr;
        *((void *)v134 + 39) = __src;
      }

      unsigned int __src = bswap32(v115);
      uint64_t v135 = *a1;
      uint64_t v136 = sub_10000C3E8(*a1, s_addr);
      if ((_DWORD)v136 == -1) {
        int v137 = sub_10000C384(v135);
      }
      else {
        int v137 = *(_DWORD *)sub_10000C37C(v135, v136);
      }
      unsigned int v183 = 2;
      uint64_t v138 = sub_100005BCC((uint64_t)buf, v42, v137, 2, (_OWORD *)v6, (uint64_t *)v204);
      if (v138)
      {
        uint64_t v63 = v138;
        in_addr_t v139 = v187.s_addr;
        *(_DWORD *)(v138 + 12) = 0;
        *(_DWORD *)(v138 + 16) = v139;
        if (*(void *)&v191[1]) {
          __strlcpy_chk(v138 + 108, *(void *)&v191[1], 128LL, 128LL);
        }
        if (!sub_100009558((uint64_t)v204, 51, 4, &__src))
        {
          int v64 = 0;
          int v69 = 3;
          goto LABEL_142;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v140 = sub_100009770((uint64_t *)v204);
          *(_DWORD *)v192 = 136315138;
          *(void *)v193 = v140;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcpd: couldn't add lease time tag: %s",  v192,  0xCu);
        }
      }

      unint64_t v15 = (char *)v181;
      goto LABEL_330;
    case 3u:
      int v172 = v31;
      uint64_t v171 = v29;
      v180 = (in_addr_t *)sub_1000091DC(a1[3], 54, &v182, 0LL);
      uint64_t v48 = sub_1000091DC(a1[3], 50, &v182, 0LL);
      uint64_t v49 = (unsigned int *)v48;
      if (v48) {
        int v50 = *(_DWORD *)v48;
      }
      else {
        int v50 = 0;
      }
      int v176 = v30;
      uint64_t v65 = *a1;
      uint64_t v66 = sub_10000C3E8(*a1, v50);
      if ((_DWORD)v66 == -1) {
        unsigned int v67 = sub_10000C384(v65);
      }
      else {
        unsigned int v67 = *(_DWORD *)sub_10000C37C(v65, v66);
      }
      if (v180)
      {
        uint64_t v70 = qword_1000194E0;
        if (qword_1000194E0)
        {
          size_t v71 = v191[0];
          do
          {
            if (*(unsigned __int8 *)(v70 + 20) == v12
              && (_DWORD)v71 == *(unsigned __int8 *)(v70 + 21)
              && !bcmp(v11, (const void *)(v70 + 22), v71))
            {
              break;
            }

            uint64_t v70 = *(void *)v70;
          }

          while (v70);
        }

        int v72 = v42;
        int v73 = v67;
        if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "SELECT", buf, 2u);
        }

        in_addr_t v74 = *v180;
        int v30 = v176;
        if (*v180 != v73)
        {
          if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v81.in_addr_t s_addr = v74;
            BOOL v82 = inet_ntoa(v81);
            *(_DWORD *)stat buf = 136315138;
            *(void *)v200 = v82;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "client selected %s",  buf,  0xCu);
          }

          if (v70) {
            hostfree(&qword_1000194E0, (void *)v70);
          }
          if (v176 == 2) {
            sub_100005A20((uint64_t *)v190);
          }
          if (sub_100000FE4(*a1))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v83.in_addr_t s_addr = *v180;
              v84 = inet_ntoa(v83);
              uint64_t v85 = nullsub_1(*a1);
              *(_DWORD *)stat buf = 136315394;
              *(void *)v200 = v84;
              *(_WORD *)&v200[8] = 2080;
              *(void *)&v200[10] = v85;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcpd: detected another DHCP server %s, disabling DHCP on %s",  buf,  0x16u);
            }

            sub_100001014(*a1);
          }

          goto LABEL_329;
        }

        if (v70) {
          char v75 = 0;
        }
        else {
          char v75 = v172;
        }
        if ((v75 & 1) == 0)
        {
          if (v70)
          {
            v187.in_addr_t s_addr = *(_DWORD *)(v70 + 16);
            uint64_t v76 = *(void *)(v70 + 312);
            uint64_t v33 = 0xFFFFFFFFLL;
            if (v76 != 0xFFFFFFFFLL) {
              uint64_t v33 = *(void *)a1[5] + v76;
            }
            unsigned int __src = *(void *)(v70 + 312);
          }

          if (v49)
          {
            in_addr_t v77 = *v49;
            if (*v49 == v187.s_addr)
            {
              if ((v172 & 1) == 0)
              {
                int v30 = v176;
                if (v176 == 2)
                {
                  if (v177 && v189 > 0)
                  {
                    __int128 v141 = sub_1000080E8(v177, v189);
                    v142 = *(int **)v190;
                    sub_10000F6B4(*(int **)v190, "name", v141, &v184);
                    free(v141);
                  }

                  else
                  {
                    v142 = *(int **)v190;
                  }

                  sub_100005D94(v142, v33, &v184);
                }

                int v69 = 4;
                goto LABEL_115;
              }

              if (qword_1000181B8) {
                uint64_t v171 = SubnetListGetSubnetForAddress(qword_1000181B8, *v49, 1);
              }
              if (v171)
              {
                sub_100005EEC(v181, v178, v187.s_addr, v177, v189, v33);
                int v69 = 4;
                int v30 = v176;
LABEL_115:
                unsigned int __src = bswap32(__src);
                unsigned int v183 = 5;
                char v78 = (in_addr *)sub_100005BCC((uint64_t)buf, v72, v73, 5, (_OWORD *)v6, (uint64_t *)v204);
                uint64_t v63 = (uint64_t)v78;
                v78[4].in_addr_t s_addr = v187.s_addr;
                if (*(void *)&v191[1]) {
                  __strlcpy_chk(&v78[27], *(void *)&v191[1], 128LL, 128LL);
                }
                if (!sub_100009558((uint64_t)v204, 51, 4, &__src))
                {
                  int v64 = 0;
                  goto LABEL_142;
                }

                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
                  goto LABEL_329;
                }
                uint64_t v79 = sub_100009770((uint64_t *)v204);
                *(_DWORD *)v192 = 136315138;
                *(void *)v193 = v79;
                v80 = "dhcpd: couldn't add lease time tag: %s";
                goto LABEL_162;
              }

              uint64_t v161 = sub_100007EF8( (uint64_t)buf,  v42,  v73,  &v183,  "unexpected server failure",  (_OWORD *)v6,  (uint64_t *)v204);
              if (!v161) {
                goto LABEL_329;
              }
              uint64_t v63 = v161;
              int v30 = v176;
              int v64 = 0;
LABEL_232:
              int v69 = 4;
              goto LABEL_142;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v130.in_addr_t s_addr = v77;
              v131 = inet_ntoa(v130);
              *(_DWORD *)stat buf = 136316418;
              *(void *)v200 = v181;
              *(_WORD *)&v200[8] = 2080;
              *(void *)&v200[10] = v131;
              *(_WORD *)&v200[18] = 1024;
              *(_DWORD *)&v200[20] = LOBYTE(v187.s_addr);
              *(_WORD *)&v200[24] = 1024;
              *(_DWORD *)&v200[26] = BYTE1(v187.s_addr);
              *(_WORD *)&v200[30] = 1024;
              *(_DWORD *)&v200[32] = BYTE2(v187.s_addr);
              LOWORD(v201[0]) = 1024;
              *(_DWORD *)((char *)v201 + 2) = HIBYTE(v187.s_addr);
              in_addr v122 = "dhcpd: host %s sends SELECT with wrong IP address %s, should be %d.%d.%d.%d";
              uint32_t v123 = 46;
              goto LABEL_229;
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 136315138;
            *(void *)v200 = v181;
            in_addr v122 = "dhcpd: host %s sends SELECT without Requested IP option";
            uint32_t v123 = 12;
LABEL_229:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v122, buf, v123);
          }

          uint64_t v132 = sub_100007EF8( (uint64_t)buf,  v42,  v73,  &v183,  "protocol error in SELECT state",  (_OWORD *)v6,  (uint64_t *)v204);
          if (!v132) {
            goto LABEL_329;
          }
          uint64_t v63 = v132;
          int v64 = 1;
          goto LABEL_232;
        }

LABEL_329:
        unint64_t v15 = (char *)v181;
        unint64_t v16 = (char *)v178;
        goto LABEL_330;
      }

      if (sub_100007E7C(*a1, a1[3]))
      {
        int v72 = v42;
        unsigned int __src = 3600;
        v187.in_addr_t s_addr = 0;
        int v69 = 0;
        int v73 = v67;
        int v30 = v176;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "client IPv6-only preferred",  buf,  2u);
          int v69 = 0;
        }

        goto LABEL_115;
      }

      int v73 = v67;
      if (!v49)
      {
        if (!*(_DWORD *)(v6 + 12))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_329;
          }
          *(_DWORD *)stat buf = 136315138;
          *(void *)v200 = v181;
          v80 = "dhcpd: host %s in unknown state";
          uint64_t v100 = buf;
          os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
          goto LABEL_163;
        }

        int v72 = v42;
        int v30 = v176;
        if (!byte_1000180B0) {
          goto LABEL_280;
        }
        unint64_t v128 = (_DWORD *)a1[4];
        if (!v128 || *v128 == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)stat buf = 0;
            uint64_t v129 = "rebind";
            goto LABEL_279;
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)stat buf = 0;
          uint64_t v129 = "renew";
LABEL_279:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v129, buf, 2u);
        }

LABEL_280:
        if (v172)
        {
          if (!(_DWORD)v32)
          {
            if (!byte_1000180B0) {
              goto LABEL_329;
            }
            BOOL v162 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            if (v173)
            {
              if (!v162) {
                goto LABEL_329;
              }
              *(_WORD *)stat buf = 0;
              v80 = "Client binding is not applicable";
            }

            else
            {
              if (!v162) {
                goto LABEL_329;
              }
              *(_WORD *)stat buf = 0;
              v80 = "No binding for client";
            }

            uint64_t v100 = buf;
            os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
            uint32_t v102 = 2;
            goto LABEL_173;
          }

          int v69 = 0;
          goto LABEL_283;
        }

        v152 = (_DWORD *)a1[4];
        if (!v152 || *v152 == -1 || *(_DWORD *)(v6 + 24))
        {
          unsigned int v153 = *(_DWORD *)(v6 + 12);
          in_addr_t v154 = v187.s_addr;
          uint64_t v133 = v171;
          if (v153 != v187.s_addr)
          {
            if (!byte_1000180B0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_329;
            }
            *(_DWORD *)stat buf = 67110912;
            *(_DWORD *)v200 = v153;
            *(_WORD *)&v200[4] = 1024;
            *(_DWORD *)&v200[6] = BYTE1(v153);
            *(_WORD *)&v200[10] = 1024;
            *(_DWORD *)&v200[12] = BYTE2(v153);
            *(_WORD *)&v200[16] = 1024;
            *(_DWORD *)&v200[18] = HIBYTE(v153);
            *(_WORD *)&v200[22] = 1024;
            *(_DWORD *)&v200[24] = v154;
            *(_WORD *)&v200[28] = 1024;
            *(_DWORD *)&v200[30] = BYTE1(v154);
            *(_WORD *)&v200[34] = 1024;
            LODWORD(v201[0]) = BYTE2(v154);
            WORD2(v201[0]) = 1024;
            *(_DWORD *)((char *)v201 + 6) = HIBYTE(v154);
            v80 = "Incorrect ciaddr %d.%d.%d.%d should be %d.%d.%d.%d";
            uint64_t v100 = buf;
            os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
            uint32_t v102 = 50;
            goto LABEL_173;
          }

          int v69 = 8;
LABEL_291:
          if (v30 == 1)
          {
            unsigned int __src = -1;
            goto LABEL_115;
          }

          if (v177 && v189 >= 1)
          {
            v155 = sub_1000080E8(v177, v189);
            sub_10000F6B4(*(int **)v190, "name", v155, &v184);
            free(v155);
            uint64_t v133 = v171;
          }

          uint64_t v156 = v133;
          unsigned int v157 = SubnetGetMaxLease(v133);
          unsigned int v158 = SubnetGetMaxLease(v156);
          unsigned int v159 = v158;
          if (v174)
          {
            unsigned int v160 = bswap32(*(_DWORD *)v174);
            unsigned int __src = v160;
            if (v160 > v157)
            {
              unsigned int __src = v157;
              unsigned int v160 = v157;
              goto LABEL_318;
            }

            if (v160 < v158)
            {
              unsigned int __src = v158;
              unsigned int v160 = v158;
            }
          }

          else
          {
            unsigned int __src = v158;
            BOOL v163 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            unsigned int v160 = v159;
            if (v163)
            {
              v164.in_addr_t s_addr = v187.s_addr;
              v165 = inet_ntoa(v164);
              v166 = off_100014628[v69];
              *(_DWORD *)stat buf = 136315394;
              *(void *)v200 = v165;
              *(_WORD *)&v200[8] = 2080;
              *(void *)&v200[10] = v166;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "dhcpd: %s lease extended to %s client",  buf,  0x16u);
              unsigned int v160 = __src;
            }
          }

          if (v160 == -1)
          {
            uint64_t v167 = -1LL;
            goto LABEL_320;
          }

LABEL_318:
          uint64_t v167 = *(void *)a1[5] + v160;
LABEL_320:
          sub_100005D94(*(int **)v190, v167, &v184);
          goto LABEL_115;
        }

        in_addr_t v168 = *(_DWORD *)(v6 + 12);
        if (v168 != v187.s_addr)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v169.in_addr_t s_addr = v168;
            v170 = inet_ntoa(v169);
            *(_DWORD *)stat buf = 136316162;
            *(void *)v200 = v170;
            *(_WORD *)&v200[8] = 1024;
            *(_DWORD *)&v200[10] = LOBYTE(v187.s_addr);
            *(_WORD *)&v200[14] = 1024;
            *(_DWORD *)&v200[16] = BYTE1(v187.s_addr);
            *(_WORD *)&v200[20] = 1024;
            *(_DWORD *)&v200[22] = BYTE2(v187.s_addr);
            *(_WORD *)&v200[26] = 1024;
            *(_DWORD *)&v200[28] = HIBYTE(v187.s_addr);
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcpd: client ciaddr=%s should use %d.%d.%d.%d",  buf,  0x24u);
            in_addr_t v168 = *(_DWORD *)(v6 + 12);
          }

          v187.in_addr_t s_addr = v168;
        }

        int v69 = 7;
LABEL_234:
        uint64_t v133 = v171;
        goto LABEL_291;
      }

      if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "init-reboot", buf, 2u);
      }

      int v30 = v176;
      if (v172)
      {
        if (!(_DWORD)v32)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_329;
          }
          v144.in_addr_t s_addr = *v49;
          v145 = inet_ntoa(v144);
          *(_DWORD *)stat buf = 136315394;
          *(void *)v200 = v181;
          *(_WORD *)&v200[8] = 2080;
          *(void *)&v200[10] = v145;
          v80 = "dhcpd: INIT-REBOOT host %s binding for %s with another server";
          uint64_t v100 = buf;
          os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
          uint32_t v102 = 22;
          goto LABEL_173;
        }

        int v72 = v42;
        int v69 = 6;
LABEL_283:
        v143 = "requested address no longer available";
        goto LABEL_284;
      }

      int v72 = v42;
      int v69 = 6;
      if (*v49 == v187.s_addr) {
        goto LABEL_234;
      }
      v143 = "requested address incorrect";
LABEL_284:
      uint64_t v151 = sub_100007EF8((uint64_t)buf, v72, v73, &v183, v143, (_OWORD *)v6, (uint64_t *)v204);
      if (!v151) {
        goto LABEL_329;
      }
      uint64_t v63 = v151;
      int v64 = 1;
LABEL_142:
      if (byte_1000180B0)
      {
LABEL_143:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v91 = off_100014628[v69];
          *(_DWORD *)v192 = 136315138;
          *(void *)v193 = v91;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "state=%s",  v192,  0xCu);
        }
      }

LABEL_145:
      unsigned int v92 = bswap32(*(unsigned __int16 *)(v6 + 8));
      int v93 = dword_1000180AC;
      if (dword_1000180AC <= HIWORD(v92))
      {
        if (!v63) {
          goto LABEL_329;
        }
        if (v183 == 5 || v183 == 2)
        {
          in_addr v98 = sub_1000091DC(a1[3], 55, &v182, 0LL);
          if (!*(void *)&v191[1])
          {
            *(_OWORD *)(v63 + 220) = 0u;
            *(_OWORD *)(v63 + 204) = 0u;
            *(_OWORD *)(v63 + 188) = 0u;
            *(_OWORD *)(v63 + 172) = 0u;
            *(_OWORD *)(v63 + 156) = 0u;
            *(_OWORD *)(v63 + 140) = 0u;
            *(_OWORD *)(v63 + 124) = 0u;
            *(_OWORD *)(v63 + 108) = 0u;
          }

          __strlcpy_chk(v63 + 44, &byte_1000180B3, 64LL, 64LL);
          if (v98) {
            sub_1000040EC((char *)v188, v187.s_addr, *a1, (uint64_t *)v204, v98, v182);
          }
          if (sub_100009558((uint64_t)v204, 255, 0, 0LL))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v99 = sub_100009770((uint64_t *)v204);
              *(_DWORD *)v192 = 136315138;
              *(void *)v193 = v99;
              v80 = "couldn't add end tag: %s";
LABEL_162:
              uint64_t v100 = v192;
              os_log_type_t v101 = OS_LOG_TYPE_INFO;
LABEL_163:
              uint32_t v102 = 12;
LABEL_173:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v101, v80, v100, v102);
              goto LABEL_329;
            }

            goto LABEL_329;
          }
        }

        unsigned int v103 = sub_10000971C((uint64_t)v204) + 240;
        if (v103 <= 0x12C) {
          unsigned int v104 = 300;
        }
        else {
          unsigned int v104 = v103;
        }
        if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          if (v183 > 8) {
            int v105 = "<unknown>";
          }
          else {
            int v105 = off_1000145E0[v183];
          }
          *(_DWORD *)v192 = 136315394;
          *(void *)v193 = v105;
          *(_WORD *)&v193[8] = 1024;
          LODWORD(v194) = v104;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Sending: DHCP %s (size %d)",  v192,  0x12u);
        }

        if (!sub_100003D88(*a1, v63, v104, v64, &v187.s_addr)) {
          goto LABEL_329;
        }
        uint64_t v120 = v188;
        unint64_t v15 = (char *)v181;
        unint64_t v16 = (char *)v178;
        if (!v188 && *(void *)v190)
        {
          v121 = (void *)sub_100008150(*(unsigned int **)v190, "name");
          v188 = v121;
          if (v121)
          {
            uint64_t v120 = strdup((const char *)v121);
            v188 = v120;
          }

          else
          {
            uint64_t v120 = 0LL;
          }
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          if (v183 > 8) {
            in_addr v124 = "<unknown>";
          }
          else {
            in_addr v124 = off_1000145E0[v183];
          }
          if (v120) {
            v125 = (const char *)v120;
          }
          else {
            v125 = "<no hostname>";
          }
          v126.in_addr_t s_addr = v187.s_addr;
          int v127 = inet_ntoa(v126);
          *(_DWORD *)v192 = 136315906;
          *(void *)v193 = v124;
          *(_WORD *)&v193[8] = 2080;
          v194 = v125;
          __int16 v195 = 2080;
          v196 = v127;
          __int16 v197 = 1024;
          unsigned int v198 = v104;
          v94 = "%s sent %s %s pktsize %d";
          os_log_type_t v95 = v192;
          os_log_type_t v96 = OS_LOG_TYPE_INFO;
          uint32_t v97 = 38;
          goto LABEL_220;
        }
      }

      else
      {
        unint64_t v15 = (char *)v181;
        unint64_t v16 = (char *)v178;
        if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v192 = 67109376;
          *(_DWORD *)v193 = HIWORD(v92);
          *(_WORD *)&v193[4] = 1024;
          *(_DWORD *)&v193[6] = v93;
          v94 = "rp->dp_secs %d < threshold %d";
          os_log_type_t v95 = v192;
          os_log_type_t v96 = OS_LOG_TYPE_DEBUG;
          uint32_t v97 = 14;
LABEL_220:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v96, v94, v95, v97);
        }
      }

LABEL_330:
      if (v188) {
        free(v188);
      }
      if (*(void *)&v191[1]) {
        free(*(void **)&v191[1]);
      }
      if (v15 != __str) {
        free(v15);
      }
      if (v16 && v16 != v15 && v16 != v202) {
        free(v16);
      }
      return;
    case 4u:
      uint64_t v51 = sub_1000091DC(a1[3], 54, v204, 0LL);
      int v52 = (int *)sub_1000091DC(a1[3], 50, v204, 0LL);
      if (!v51) {
        goto LABEL_329;
      }
      v53 = (in_addr_t *)v52;
      if (!v52) {
        goto LABEL_329;
      }
      uint64_t v54 = *a1;
      uint64_t v55 = sub_10000C3E8(*a1, *v52);
      if ((_DWORD)v55 == -1) {
        unsigned int v56 = sub_10000C384(v54);
      }
      else {
        unsigned int v56 = *(_DWORD *)sub_10000C37C(v54, v55);
      }
      if (*(_DWORD *)v51 == v56)
      {
        if (v30 == 2 && v187.s_addr == *v53)
        {
          v86 = *(int **)v190;
          sub_10000F7C8(*(uint64_t *)v190, "identifier", &v184);
          sub_100005D94(v86, *(void *)a1[5] + 600LL, &v184);
          sub_10000F6B4(v86, "declined", v181, &v184);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v87.in_addr_t s_addr = v187.s_addr;
            int v88 = inet_ntoa(v87);
            *(_DWORD *)stat buf = 136315394;
            *(void *)v200 = v88;
            *(_WORD *)&v200[8] = 2080;
            *(void *)&v200[10] = v181;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "dhcpd: IP %s declined by %s",  buf,  0x16u);
          }

          if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v89.in_addr_t s_addr = v187.s_addr;
            int v90 = inet_ntoa(v89);
            *(_DWORD *)stat buf = 136315138;
            *(void *)v200 = v90;
            in_addr v46 = "marking host %s as declined";
            uint32_t v47 = 12;
            goto LABEL_64;
          }
        }

        goto LABEL_141;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_329;
      }
      v106.in_addr_t s_addr = *v53;
      v107 = inet_ntoa(v106);
      int v108 = *v51;
      int v109 = v51[1];
      int v110 = v51[2];
      int v111 = v51[3];
      *(_DWORD *)stat buf = 136316418;
      *(void *)v200 = v181;
      *(_WORD *)&v200[8] = 2080;
      *(void *)&v200[10] = v107;
      *(_WORD *)&v200[18] = 1024;
      *(_DWORD *)&v200[20] = v108;
      *(_WORD *)&v200[24] = 1024;
      *(_DWORD *)&v200[26] = v109;
      *(_WORD *)&v200[30] = 1024;
      *(_DWORD *)&v200[32] = v110;
      LOWORD(v201[0]) = 1024;
      *(_DWORD *)((char *)v201 + 2) = v111;
      v80 = "dhcpd: host %s declines IP %s from server %d.%d.%d.%d";
      uint64_t v100 = buf;
      os_log_type_t v101 = OS_LOG_TYPE_DEBUG;
      uint32_t v102 = 46;
      goto LABEL_173;
    case 7u:
      if (v30 == 2)
      {
        if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v57.in_addr_t s_addr = v187.s_addr;
          in_addr v58 = inet_ntoa(v57);
          *(_DWORD *)stat buf = 136315138;
          *(void *)v200 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s released by client, setting expiration to now",  buf,  0xCu);
        }

        v59 = *(int **)v190;
        snprintf((char *)buf, 0x20uLL, "0x%lx", *(void *)a1[5]);
        sub_10000F6B4(v59, "lease", (const char *)buf, &v184);
      }

      goto LABEL_141;
    case 8u:
      v187.in_addr_t s_addr = *(_DWORD *)(v6 + 12);
      uint64_t v60 = *a1;
      uint64_t v61 = sub_10000C3E8(*a1, v187.s_addr);
      if ((_DWORD)v61 == -1) {
        int v62 = sub_10000C384(v60);
      }
      else {
        int v62 = *(_DWORD *)sub_10000C37C(v60, v61);
      }
      unsigned int v183 = 5;
      uint64_t v68 = sub_100005BCC((uint64_t)buf, v42, v62, 5, (_OWORD *)v6, (uint64_t *)v204);
      if (!v68) {
        goto LABEL_329;
      }
      uint64_t v63 = v68;
      int v64 = 0;
      int v69 = 0;
      goto LABEL_142;
    default:
      if (!byte_1000180B0)
      {
        uint64_t v63 = 0LL;
        int v64 = 0;
        goto LABEL_145;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v63 = 0LL;
        int v69 = 0;
        int v64 = 0;
        goto LABEL_143;
      }

      *(_WORD *)stat buf = 0;
      in_addr v46 = "unknown message ignored";
      uint32_t v47 = 2;
LABEL_64:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v46, buf, v47);
LABEL_141:
      int v64 = 0;
      int v69 = 0;
      uint64_t v63 = 0LL;
      goto LABEL_142;
  }

uint64_t sub_100007E7C(uint64_t a1, uint64_t a2)
{
  int v3 = sub_1000091DC(a2, 55, &v7, 0LL);
  uint64_t v4 = 0LL;
  if (v3)
  {
    int v5 = v7;
    if (v7 >= 1)
    {
      while (*v3 != 108)
      {
        ++v3;
        if (!--v5) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return v4;
}

uint64_t sub_100007EF8(uint64_t a1, int a2, int a3, _DWORD *a4, char *a5, _OWORD *a6, uint64_t *a7)
{
  if (byte_1000180B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315138;
    uint64_t v22 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "sending a NAK: '%s'",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v14 = sub_100005BCC(a1, a2, a3, 6, a6, a7);
  uint64_t v15 = v14;
  if (v14)
  {
    *(_DWORD *)(v14 + 12) = 0;
    *(_DWORD *)(v14 + 16) = 0;
    if (a5 && (int v16 = strlen(a5), sub_100009558((uint64_t)a7, 56, v16, a5)))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        return 0LL;
      }
      __int128 v17 = sub_100009770(a7);
      int v21 = 136315138;
      uint64_t v22 = (void *)v17;
      int v18 = "dhcpd: couldn't add NAK message type: %s";
    }

    else
    {
      if (!sub_100009558((uint64_t)a7, 255, 0, 0LL))
      {
        *a4 = 6;
        return v15;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        return 0LL;
      }
      BOOL v19 = sub_100009770(a7);
      int v21 = 136315138;
      uint64_t v22 = (void *)v19;
      int v18 = "dhcpd: couldn't add end tag: %s";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0xCu);
    return 0LL;
  }

  return v15;
}

_BYTE *sub_1000080E8(uint64_t a1, int a2)
{
  if (a2 < 1) {
    return 0LL;
  }
  uint64_t result = malloc((a2 + 1));
  uint64_t v5 = 0LL;
  do
  {
    int v6 = *(unsigned __int8 *)(a1 + v5);
    if (v6 == 10 || v6 == 0) {
      LOBYTE(v6) = 46;
    }
    result[v5++] = v6;
  }

  while (a2 != v5);
  result[a2] = 0;
  return result;
}

uint64_t sub_100008150(unsigned int *a1, char *__s1)
{
  uint64_t v2 = *a1;
  if (!(_DWORD)v2) {
    return 0LL;
  }
  for (uint64_t i = *((void *)a1 + 1) + 16LL; strcmp(__s1, *(const char **)(i - 16)); i += 24LL)
  {
    if (!--v2) {
      return 0LL;
    }
  }

  if (*(_DWORD *)(i - 8)) {
    return **(void **)i;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000081BC(void *a1, in_addr_t a2)
{
  uint64_t v6 = qword_1000194E0;
  if (qword_1000194E0)
  {
    while (*(_DWORD *)(v6 + 16) != a2)
    {
      uint64_t v6 = *(void *)v6;
      if (!v6) {
        return 0LL;
      }
    }

    unint64_t v7 = *a1 - *(void *)(v6 + 296);
    if (v7 <= 0x3B)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v8.in_addr_t s_addr = a2;
        int v9 = 136315394;
        __int128 v10 = inet_ntoa(v8);
        __int16 v11 = 1024;
        int v12 = 60 - v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "dhcpd: %s will remain pending %d secs",  (uint8_t *)&v9,  0x12u);
      }

      return 1LL;
    }

    hostfree(&qword_1000194E0, (void *)v6);
  }

  return 0LL;
}

uint64_t sub_100008300(int a1)
{
  if (a1 < 0) {
    return 0LL;
  }
  else {
    return close(a1);
  }
}

uint64_t sub_100008310()
{
  uint64_t v0 = open(__str, 2, 0LL);
  if ((v0 & 0x80000000) != 0)
  {
    if (*__error() != 16) {
      return v0;
    }
    for (int i = 1; ; ++i)
    {
      snprintf(__str, 0x100uLL, "/dev/bpf%d", i);
      uint64_t v0 = open(__str, 2, 0LL);
      if ((v0 & 0x80000000) == 0) {
        break;
      }
      if (*__error() != 16) {
        return v0;
      }
    }
  }

  int v3 = 900;
  ioctl(v0, 0x8004427BuLL, &v3);
  return v0;
}

uint64_t sub_100008418(int a1, uint64_t a2)
{
  return ioctl(a1, 0x8020426CuLL, v4);
}

uint64_t sub_100008490(int a1)
{
  uint64_t v4 = 6LL;
  int v2 = 1;
  int v3 = &v4;
  return ioctl(a1, 0x80104267uLL, &v2);
}

ssize_t sub_100008500(int a1, const void *a2, int a3)
{
  return write(a1, a2, a3);
}

void sub_100008518(const void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

CFPropertyListRef sub_100008548(const char *a1)
{
  if (stat(a1, &v11) < 0) {
    return 0LL;
  }
  off_t st_size = v11.st_size;
  if (!v11.st_size) {
    return 0LL;
  }
  int v3 = malloc(v11.st_size);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  int v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }

  unint64_t v7 = CFDataCreateWithBytesNoCopy(0LL, (const UInt8 *)v4, st_size, kCFAllocatorNull);
  if (v7)
  {
    in_addr v8 = v7;
    CFPropertyListRef v9 = CFPropertyListCreateWithData(0LL, v7, 0LL, 0LL, 0LL);
    CFRelease(v8);
  }

  else
  {
    CFPropertyListRef v9 = 0LL;
  }

  free(v4);
  return v9;
}

uint64_t sub_100008624(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0LL;
  v11.length = CFStringGetLength(a1);
  v11.location = 0LL;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_1000086A8(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFIndex v9 = Count;
  signed int v10 = 8 * Count;
  if (a2)
  {
    int v12 = (UInt8 *)(a2 + v10);
  }

  else
  {
    int v12 = 0LL;
  }

  if (Count >= 1)
  {
    CFIndex v13 = 0LL;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v13);
      CFTypeID TypeID = CFStringGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID) {
        return 0LL;
      }
      if (a2)
      {
        int v16 = *a3 - v10;
        if (v16 < 0) {
          return 0LL;
        }
        int v17 = sub_100008624(ValueAtIndex, v12, v16, 0);
        *(void *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }

      else
      {
        int v17 = sub_100008624(ValueAtIndex, v12, 0, 0);
      }

      v10 += v17;
    }

    while (v9 != ++v13);
  }

  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1LL;
}

void *sub_1000087BC(const __CFArray *a1, _DWORD *a2)
{
  *a2 = 0;
  uint64_t v4 = malloc(__size);
  if (!sub_1000086A8(a1, (uint64_t)v4, (unsigned int *)&__size, &__size_4))
  {
    free(v4);
    return 0LL;
  }

  *a2 = __size_4;
  return v4;
}

uint64_t sub_100008844(const __CFString *a1, in_addr *a2)
{
  a2->in_addr_t s_addr = 0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0LL;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64LL, 0x600u);
  if ((_DWORD)result) {
    return inet_aton(buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_1000088F4(const __CFString *a1, _DWORD *a2)
{
  unint64_t v3 = strtoul(__str, 0LL, 0);
  if (v3 == -1LL) {
    return 0LL;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0LL;
  }
  *a2 = v4;
  return 1LL;
}

uint64_t sub_100008990(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0LL;
  }

  if (CFGetTypeID(a1) == TypeID) {
    return (sub_1000088F4(a1, a2) & 1) != 0;
  }
  CFTypeID v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    CFTypeID v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!(_DWORD)result) {
        return result;
      }
      return 1LL;
    }

    return 0LL;
  }

  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1LL;
}

UInt8 *sub_100008A50(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex usedBufLen = 0LL;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0LL, 0LL, &usedBufLen);
  CFIndex v7 = usedBufLen;
  if (!usedBufLen) {
    return 0LL;
  }
  int v8 = (UInt8 *)malloc(usedBufLen + 1);
  v11.CFIndex location = location;
  v11.CFIndex length = length;
  CFStringGetBytes(a1, v11, a3, 0, 0, v8, v7, &usedBufLen);
  v8[usedBufLen] = 0;
  return v8;
}

UInt8 *sub_100008B04(const __CFString *a1, CFStringEncoding a2)
{
  v5.CFIndex length = CFStringGetLength(a1);
  v5.CFIndex location = 0LL;
  return sub_100008A50(a1, v5, a2);
}

CFDataRef sub_100008B38(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0LL, theString, 0x8000100u, 0);
}

char *sub_100008B50(unsigned int a1)
{
  if (a1 <= 0xE) {
    return (char *)&unk_100014670 + 24 * a1;
  }
  else {
    return 0LL;
  }
}

void sub_100008B6C(CFMutableStringRef theString, int a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = a4;
  switch(a2)
  {
    case 1:
      CFStringAppendFormat(theString, 0LL, @"\n");
      sub_10000CBA0(theString, (uint64_t)a3, v4);
      return;
    case 2:
      if (*a3) {
        int v8 = "TRUE";
      }
      else {
        int v8 = "FALSE";
      }
      CFStringAppendFormat(theString, 0LL, @"%s", v8);
      return;
    case 3:
      uint64_t v7 = *a3;
      goto LABEL_10;
    case 4:
      uint64_t v7 = bswap32(*(unsigned __int16 *)a3) >> 16;
      goto LABEL_10;
    case 5:
    case 6:
      uint64_t v7 = bswap32(*(_DWORD *)a3);
LABEL_10:
      CFStringAppendFormat(theString, 0LL, @"0x%x", v7);
      return;
    case 9:
      CFStringAppendFormat(theString, 0LL, @"%.*s", a4, a3);
      return;
    case 10:
      CFStringAppendFormat(theString, 0LL, @"%d.%d.%d.%d", *a3, a3[1], a3[2], a3[3]);
      return;
    case 13:
      int v20 = 0;
      CFIndex v9 = (unsigned __int8 *)sub_10000A330((uint64_t)a3, a4, &v20);
      CFStringAppendFormat(theString, 0LL, @"{");
      if (!v9) {
        goto LABEL_29;
      }
      if (v20 >= 1)
      {
        for (uint64_t i = 0LL; i < v20; CFStringAppendFormat(theString, 0LL, @"%s%s", v11, *(void *)&v9[8 * i++]))
        {
          if (i) {
            CFRange v11 = ", ";
          }
          else {
            CFRange v11 = "";
          }
        }
      }

      break;
    case 14:
      CFIndex v9 = (unsigned __int8 *)sub_10000AC64(a3, a4, &v19);
      CFStringAppendFormat(theString, 0LL, @"{");
      if (!v9) {
        goto LABEL_29;
      }
      if (v19 >= 1)
      {
        int v12 = 0;
        CFIndex v13 = v9;
        do
        {
          if (v12) {
            uint64_t v14 = "; ";
          }
          else {
            uint64_t v14 = "";
          }
          CFStringAppendFormat( theString,  0LL,  @"%s%d.%d.%d.%d/%d, %d.%d.%d.%d",  v14,  *v13,  v13[1],  v13[2],  v13[3],  *((unsigned int *)v13 + 1),  v13[8],  v13[9],  v13[10],  v13[11]);
          ++v12;
          v13 += 12;
        }

        while (v12 < v19);
      }

      break;
    default:
      return;
  }

  free(v9);
LABEL_29:
  CFStringAppendFormat(theString, 0LL, @"}", v15, v16, v17, v18);
}

void sub_100008E04(CFMutableStringRef theString, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = a3;
  if (a2 <= 0xE && (unsigned int v6 = *((_DWORD *)&unk_100014670 + 6 * a2 + 1)) != 0)
  {
    if (v6 <= 0xE)
    {
      uint64_t v7 = *((int *)&unk_100014670 + 6 * v6);
      int v8 = (int)a4 / (int)v7;
      CFStringAppendFormat(theString, 0LL, @"{");
      if (v8 >= 1)
      {
        for (int i = 0; i != v8; ++i)
        {
          if (i) {
            CFStringAppendFormat(theString, 0LL, @", ");
          }
          sub_100008B6C(theString, v6, v4, v7);
          v4 += v7;
        }
      }

      CFStringAppendFormat(theString, 0LL, @"}");
    }
  }

  else
  {
    sub_100008B6C(theString, a2, a3, a4);
  }

BOOL sub_100008F1C(CFMutableStringRef theString, unsigned __int8 *a2)
{
  uint64_t v3 = *a2;
  unsigned int v4 = *((_DWORD *)&unk_1000147D8 + 4 * v3);
  if (v4 >= 0xF)
  {
    CFStringAppendFormat(theString, 0LL, @"unknown type %d\n", *((unsigned int *)&unk_1000147D8 + 4 * v3));
  }

  else
  {
    uint64_t v5 = a2[1];
    unsigned int v6 = a2 + 2;
    CFStringAppendFormat( theString,  0LL,  @"%s (%s): ",  *((void *)&unk_1000147D8 + 2 * v3 + 1),  *((void *)&unk_100014670 + 3 * v4 + 1));
    if ((_DWORD)v3 == 53)
    {
      unint64_t v7 = *v6;
      if (v7 > 8) {
        int v8 = "<unknown>";
      }
      else {
        int v8 = (&off_1000157D8)[v7];
      }
      CFStringAppendFormat(theString, 0LL, @"%s ", v8);
    }

    sub_100008E04(theString, v4, v6, v5);
    CFStringAppendFormat(theString, 0LL, @"\n", v10);
  }

  return v4 < 0xF;
}

char *sub_10000902C(unsigned int a1)
{
  if (a1 <= 0xFF) {
    return (char *)&unk_1000147D8 + 16 * a1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100009044(char *__s2)
{
  uint64_t v2 = 0LL;
  for (int i = (const char **)&off_1000147E0; strcmp(*i, __s2); i += 2)
  {
    if (++v2 == 256)
    {
      if (!strncmp(__s2, "option_", 7uLL)) {
        unsigned int v4 = __s2 + 7;
      }
      else {
        unsigned int v4 = __s2;
      }
      unsigned int v5 = strtoul(v4, 0LL, 10);
      if (v5 >= 0x101uLL) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v5;
      }
    }
  }

  return v2;
}

uint64_t sub_1000090E0(void *a1, unsigned __int8 *a2, int a3, char *a4)
{
  if (a4) {
    *a4 = 0;
  }
  sub_10000C72C(a1);
  if (a3 < 1)
  {
    int v8 = 0;
    if ((a3 & 0x80000000) == 0) {
      return 1LL;
    }
    goto LABEL_16;
  }

  while (1)
  {
    int v8 = *a2;
    if (*a2) {
      break;
    }
    ++a2;
    --a3;
LABEL_9:
    if (a3 <= 0) {
      goto LABEL_14;
    }
  }

  if (v8 != 255)
  {
    uint64_t v9 = a2[1];
    sub_10000C824((uint64_t)a1, (uint64_t)a2);
    a3 -= v9 + 2;
    a2 += v9 + 2;
    goto LABEL_9;
  }

  sub_10000C824((uint64_t)a1, (uint64_t)a2);
  --a3;
LABEL_14:
  if ((a3 & 0x80000000) == 0) {
    return 1LL;
  }
LABEL_16:
  if (a4) {
    snprintf(a4, 0x100uLL, "parse failed near tag %d", v8);
  }
  sub_10000C734((uint64_t)a1);
  return 0LL;
}

unsigned __int8 *sub_1000091DC(uint64_t a1, int a2, _DWORD *a3, int *a4)
{
  uint64_t result = 0LL;
  if (a2 && a2 != 255)
  {
    if (a4) {
      int v9 = *a4;
    }
    else {
      int v9 = 0;
    }
    while (1)
    {
      uint64_t v10 = (unsigned __int8 *)sub_10000C77C(a1, v9);
      if (*v10 == a2) {
        break;
      }
      ++v9;
    }

    if (a3) {
      *a3 = v10[1];
    }
    if (a4) {
      *a4 = v9 + 1;
    }
    return v10 + 2;
  }

  return result;
}

uint64_t sub_100009288(void *a1, uint64_t a2, unsigned int a3, char *a4)
{
  if (a4)
  {
    *a4 = 0;
    if (a3 <= 0xEF)
    {
      snprintf(a4, 0x100uLL, "packet is too short: %d < %d", a3, 240);
      return 0LL;
    }

    if (*(_DWORD *)(a2 + 236) != 1666417251)
    {
      uint64_t result = 0LL;
      strcpy(a4, "missing magic number");
      return result;
    }
  }

  else if (a3 < 0xF0 || *(_DWORD *)(a2 + 236) != 1666417251)
  {
    return 0LL;
  }

  uint64_t result = sub_1000090E0(a1, (unsigned __int8 *)(a2 + 240), a3 - 240, a4);
  if ((_DWORD)result)
  {
    int v9 = sub_1000091DC((uint64_t)a1, 52, &v12, 0LL);
    if (v9 && v12 == 1)
    {
      uint64_t v10 = v9;
      sub_10000C72C(v11);
      if ((*v10 | 2) == 3 && sub_1000090E0(v11, (unsigned __int8 *)(a2 + 108), 128, 0LL))
      {
        sub_10000C970((uint64_t)a1, (uint64_t)v11);
        sub_10000C734((uint64_t)v11);
      }

      if ((*v10 & 0xFE) == 2)
      {
        if (sub_1000090E0(v11, (unsigned __int8 *)(a2 + 44), 64, 0LL))
        {
          sub_10000C970((uint64_t)a1, (uint64_t)v11);
          sub_10000C734((uint64_t)v11);
        }
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_100009410(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C760(a2);
  CFStringAppendFormat(a1, 0LL, @"Options count is %d\n", v4);
  uint64_t result = sub_10000C760(a2);
  if ((int)result >= 1)
  {
    int v6 = 0;
    do
    {
      unint64_t v7 = (unsigned __int8 *)sub_10000C77C(a2, v6);
      if (!sub_100008F1C(a1, v7)) {
        CFStringAppendFormat(a1, 0LL, @"undefined tag %d len %d\n", *v7, v7[1]);
      }
      ++v6;
      uint64_t result = sub_10000C760(a2);
    }

    while (v6 < (int)result);
  }

  return result;
}

double sub_1000094D4(uint64_t a1, void *a2, int a3, int a4)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 24snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 16snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 8snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)a1 = 287454020LL;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 296) = a4;
  return result;
}

double sub_100009550(uint64_t a1, void *a2, int a3)
{
  return sub_1000094D4(a1, a2, a3, 1);
}

uint64_t sub_100009558(uint64_t a1, int a2, int a3, void *__src)
{
  *(_BYTE *)(a1 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0;
  unsigned int v5 = (char *)(a1 + 40);
  if (a3 >= 256)
  {
    snprintf(v5, 0x100uLL, "tag %d option %d > %d", __src);
    return 1LL;
  }

  if (*(void *)a1 != 287454020LL)
  {
    int v6 = "dhcpoa_t not initialized - internal error!!!";
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 24))
  {
    int v6 = "attempt to add data after end tag";
LABEL_7:
    __strlcpy_chk(v5, v6, 256LL, 256LL);
    return 1LL;
  }

  if (a2)
  {
    if (a2 == 255)
    {
      uint64_t v8 = *(int *)(a1 + 20);
      if ((int)v8 >= *(_DWORD *)(a1 + 16))
      {
        snprintf(v5, 0x100uLL, "can't add end tag %d > %d", __src);
        return 1LL;
      }

      *(_BYTE *)(*(void *)(a1 + 8) + v8) = -1;
      ++*(_DWORD *)(a1 + 20);
      *(_DWORD *)(a1 + 24) = 1;
      goto LABEL_24;
    }

    int v11 = a3 + 2;
    uint64_t v12 = *(int *)(a1 + 20);
    if (a3 + 2 + (int)v12 + *(_DWORD *)(a1 + 296) > *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add tag %d (%d > %d)", __src);
      return 2LL;
    }

    *(_BYTE *)(*(void *)(a1 + 8) + v12) = a2;
    *(_BYTE *)(*(int *)(a1 + 20) + *(void *)(a1 + 8) + 1LL) = a3;
    if (a3) {
      memmove((void *)(*(int *)(a1 + 20) + *(void *)(a1 + 8) + 2LL), __src, a3);
    }
    int v13 = *(_DWORD *)(a1 + 28);
    int v14 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 28) = v14;
    *(_DWORD *)(a1 + 32) = v13;
    int v10 = v11 + v14;
  }

  else
  {
    uint64_t v9 = *(int *)(a1 + 20);
    if (*(_DWORD *)(a1 + 296) + (int)v9 >= *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add pad tag %d > %d", __src);
      return 2LL;
    }

    *(_BYTE *)(*(void *)(a1 + 8) + v9) = 0;
    int v10 = *(_DWORD *)(a1 + 20) + 1;
  }

  *(_DWORD *)(a1 + 2snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v10;
LABEL_24:
  uint64_t result = 0LL;
  ++*(_DWORD *)(a1 + 36);
  return result;
}

uint64_t sub_10000971C(uint64_t result)
{
  if (result)
  {
    if (*(void *)result == 287454020LL) {
      return *(unsigned int *)(result + 20);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100009744(uint64_t a1, char a2)
{
  char __src = a2;
  return sub_100009558(a1, 53, 1, &__src);
}

const char *sub_100009770(uint64_t *a1)
{
  uint64_t result = "<bad parameter>";
  if (a1)
  {
    uint64_t v4 = *a1;
    uint64_t v3 = a1 + 5;
    if (v4 == 287454020) {
      return (const char *)v3;
    }
  }

  return result;
}

uint64_t sub_100009798(uint64_t result)
{
  if (result)
  {
    if (*(void *)result == 287454020LL) {
      return *(unsigned int *)(result + 36);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void sub_1000097C0(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  unsigned int v3 = a3;
  if (a3 > 0xEB)
  {
    sub_1000090D8(v7);
    sub_100009288(v7, (uint64_t)a2, v3, 0LL);
    sub_100009850(theString, a2, v6, (uint64_t)v7);
    sub_1000090DC((uint64_t)v7);
  }

  else
  {
    CFStringAppendFormat(theString, 0LL, @"Packet is too short %d < %d\n", a3, 236LL);
  }

void sub_100009850(__CFString *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  CFStringAppendFormat(a1, 0LL, @"op = ");
  int v7 = *a2;
  if (v7 == 2)
  {
    CFStringAppendFormat(a1, 0LL, @"BOOTREPLY\n");
  }

  else if (v7 == 1)
  {
    CFStringAppendFormat(a1, 0LL, @"BOOTREQUEST\n");
  }

  else
  {
    CFStringAppendFormat(a1, 0LL, @"OP(%d)\n", *a2);
  }

  CFStringAppendFormat(a1, 0LL, @"htype = %d\n", a2[1]);
  CFStringAppendFormat(a1, 0LL, @"flags = 0x%x\n", bswap32(*((unsigned __int16 *)a2 + 5)) >> 16);
  unsigned int v8 = a2[2];
  if (v8 >= 0x11)
  {
    int v10 = 16;
    CFStringAppendFormat(a1, 0LL, @"hlen = %d (invalid > %lu)\n", a2[2], 16LL);
    uint64_t v9 = "[truncated] ";
  }

  else
  {
    CFStringAppendFormat(a1, 0LL, @"hlen = %d\n", a2[2]);
    uint64_t v9 = "";
    int v10 = v8;
  }

  CFStringAppendFormat(a1, 0LL, @"hops = %d\n", a2[3]);
  CFStringAppendFormat(a1, 0LL, @"xid = 0x%lx\n", bswap32(*((_DWORD *)a2 + 1)));
  CFStringAppendFormat(a1, 0LL, @"secs = %hu\n", bswap32(*((unsigned __int16 *)a2 + 4)) >> 16);
  int v11 = inet_ntop(2, a2 + 12, v16, 0x10u);
  CFStringAppendFormat(a1, 0LL, @"ciaddr = %s\n", v11);
  uint64_t v12 = inet_ntop(2, a2 + 16, v16, 0x10u);
  CFStringAppendFormat(a1, 0LL, @"yiaddr = %s\n", v12);
  int v13 = inet_ntop(2, a2 + 20, v16, 0x10u);
  CFStringAppendFormat(a1, 0LL, @"siaddr = %s\n", v13);
  int v14 = inet_ntop(2, a2 + 24, v16, 0x10u);
  CFStringAppendFormat(a1, 0LL, @"giaddr = %s\n", v14);
  CFStringAppendFormat(a1, 0LL, @"chaddr = %s", v9);
  if (v10)
  {
    for (uint64_t i = 0LL; i != v10; CFStringAppendFormat(a1, 0LL, @"%0x", a2[i++ + 28]))
    {
      if (i) {
        CFStringAppendFormat(a1, 0LL, @":");
      }
    }
  }

  CFStringAppendFormat(a1, 0LL, @"\n");
  CFStringAppendFormat(a1, 0LL, @"sname = %.*s\n", 64LL, a2 + 44);
  CFStringAppendFormat(a1, 0LL, @"file = %.*s\n", 128LL, a2 + 108);
  if (a4)
  {
    if ((int)sub_1000090D4(a4) >= 1)
    {
      CFStringAppendFormat(a1, 0LL, @"options:\n");
      sub_100009410(a1, a4);
    }
  }

void *sub_100009BB4(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  unsigned int v5 = a4;
  uint64_t v6 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v7 = a1;
  if (!a3)
  {
    uint64_t v69 = 0LL;
    __int128 v68 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    int v8 = 128;
    uint64_t v9 = &v60;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    goto LABEL_7;
  }

  int v8 = *a4;
  if (!*a4)
  {
LABEL_5:
    int v10 = 0;
    goto LABEL_84;
  }

  __int128 v68 = 0u;
  uint64_t v69 = 0LL;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  uint64_t v9 = (__int128 *)a3;
  LOBYTE(v68) = 1;
LABEL_7:
  *((void *)&v68 + 1) = v9;
  HIDWORD(v69) = v8;
  uint64_t v70 = 0LL;
  uint64_t v71 = 0LL;
  char v72 = a5;
  if (a2 < 1)
  {
    int v10 = 0;
LABEL_66:
    if (!v6)
    {
      uint64_t v6 = malloc(v10);
      memcpy(v6, *((const void **)&v68 + 1), v10);
    }

    goto LABEL_83;
  }

  uint64_t v11 = 0LL;
  uint64_t v53 = a2;
  while (1)
  {
    uint64_t v55 = v11;
    uint64_t v12 = *(const char **)(v7 + 8 * v11);
    int v56 = v69;
    unsigned int v13 = strlen(v12);
    int v14 = (char *)malloc((int)v13 + 26LL);
    uint64_t v15 = malloc(0x30uLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((void *)v15 + 4) = v15;
    }

    uint64_t v16 = v14 + 24;
    *(void *)int v14 = v15;
    *((void *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    int v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!v72)
    {
      goto LABEL_63;
    }

    uint64_t v58 = v71;
    if ((int)v71 < 1)
    {
      unsigned int v25 = 0;
LABEL_41:
      if ((sub_10000A868((uint64_t)&v60, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_74:
        if ((v69 & 0x80000000) != 0 || (int)v69 > SHIDWORD(v69))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v56);
          uint64_t v7 = a1;
        }

        else
        {
          LODWORD(v69) = v56;
          uint64_t v7 = a1;
        }

        sub_10000A960((void **)v14);
        free(v14);
        goto LABEL_79;
      }

      uint64_t v26 = 0LL;
      unsigned int v39 = 0;
      char v38 = 1;
      goto LABEL_43;
    }

    uint64_t v24 = 0LL;
    unsigned int v25 = 0;
    uint64_t v26 = 0LL;
    in_addr v57 = v70;
    uint64_t v27 = *((void *)&v68 + 1);
    do
    {
      uint64_t v28 = v57[v24];
      if (!v28) {
        break;
      }
      unsigned int v29 = 0;
      uint64_t v30 = *(unsigned int *)(v28 + 40);
      int v31 = *(void **)v14;
      uint64_t v32 = *(unsigned int *)(*(void *)v14 + 40LL);
      do
      {
        unsigned int v33 = v29;
        int v34 = (unsigned __int8 *)(v27 + *(unsigned int *)(*(void *)(v28 + 32) + 4 * v30 - 4));
        size_t v35 = *v34;
        int v36 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v31[4] + 4 * v32 - 4));
        if ((_DWORD)v35 != *v36) {
          break;
        }
        int v37 = memcmp(v34 + 1, v36 + 1, v35);
        unsigned int v29 = v33 + 1;
        --v30;
        --v32;
      }

      while (!v37);
      if (v33 > v25) {
        uint64_t v26 = v28;
      }
      ++v24;
    }

    while (v24 != v58);
    if (!v26) {
      goto LABEL_41;
    }
    char v38 = 0;
    unsigned int v39 = *(_DWORD *)(v26 + 40) - v25;
LABEL_43:
    in_addr v40 = *(void **)v14;
    uint64_t v41 = *(unsigned int *)(*(void *)v14 + 40LL);
    if ((int)v41 >= 1)
    {
      uint64_t v42 = 0LL;
      uint64_t v43 = v41 - v25;
      do
      {
        if (v42 >= (int)v43)
        {
          int v46 = *(_DWORD *)(*(void *)(v26 + 32) + 4LL * (int)v39);
          if (v43 == v42)
          {
            __int16 __src = bswap32(v46 | 0xC000) >> 16;
          }

          ++v39;
          uint64_t v44 = *(void **)v14;
        }

        else
        {
          uint64_t v44 = *(void **)v14;
          uint64_t v45 = *(unsigned int *)(*(void *)(*(void *)v14 + 32LL) + 4 * v42);
          if ((v38 & 1) == 0)
          {
            if (!sub_10000A868( (uint64_t)&v60,  (void *)(*((void *)v14 + 1) + v45),  *(unsigned __int8 *)(*((void *)v14 + 1) + v45) + 1)) {
              goto LABEL_74;
            }
            uint64_t v44 = *(void **)v14;
          }

          int v46 = v45 + v56;
        }

        *(_DWORD *)(v44[4] + 4 * v42++) = v46;
      }

      while (v41 != v42);
      in_addr v40 = *(void **)v14;
    }

    int v47 = v71;
    uint64_t v48 = SHIDWORD(v71);
    if (HIDWORD(v71) == (_DWORD)v71)
    {
      if (HIDWORD(v71))
      {
        HIDWORD(v71) *= 2;
        uint64_t v49 = reallocf(v70, 16 * v48);
        uint64_t v70 = v49;
        int v47 = v71;
      }

      else
      {
        HIDWORD(v71) = 8;
        uint64_t v49 = malloc(0x40uLL);
        int v47 = 0;
        uint64_t v70 = v49;
      }
    }

    else
    {
      uint64_t v49 = v70;
    }

    LODWORD(v71) = v47 + 1;
    v49[v47] = v40;
    *(void *)int v14 = 0LL;
LABEL_63:
    sub_10000A960((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v55 + 1;
    if (v55 + 1 == v53)
    {
      int v10 = v69;
      uint64_t v6 = a3;
      unsigned int v5 = a4;
      goto LABEL_66;
    }
  }

  uint64_t v17 = 0LL;
  size_t v18 = 0LL;
  int v19 = 0;
  int v20 = 0;
  uint64_t v21 = v13;
  uint64_t v22 = v13 + 1;
  while (1)
  {
    if (v17 != v21)
    {
      int v23 = v12[v17];
      if (v23 != 46)
      {
        ++v17;
        *(_BYTE *)(*((void *)v14 + 1) + v17) = v23;
        ++v20;
        goto LABEL_19;
      }
    }

    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_70;
    }

    if (v20 >= 64) {
      break;
    }
    sub_10000A7E0(*(int **)v14, v18);
    *(_BYTE *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v22)
    {
      uint64_t v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }

  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_70:
  sub_10000A960((void **)v14);
  free(v14);
  else {
    LODWORD(v69) = v56;
  }
LABEL_79:
  unsigned int v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v55));
  if (a3) {
    int v10 = v69;
  }
  else {
    int v10 = 0;
  }
  uint64_t v6 = 0LL;
LABEL_83:
  sub_10000A1A8((uint64_t)&v60);
LABEL_84:
  *unsigned int v5 = v10;
  return v6;
}

void sub_10000A1A8(uint64_t a1)
{
  unsigned int v3 = (void **)(a1 + 152);
  uint64_t v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
      do
      {
        sub_10000A960((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8LL;
      }

      while (v5 < *(int *)(a1 + 160));
      uint64_t v2 = *v3;
    }

    free(v2);
  }

  void *v3 = 0LL;
  *(void *)(a1 + 16snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0LL;
}

CFDataRef sub_10000A21C(const __CFArray *a1, char a2)
{
  LODWORD(length) = 0;
  unsigned int v3 = sub_1000087BC(a1, &v8);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (UInt8 *)sub_100009BB4((uint64_t)v3, v8, 0LL, &length, a2);
  free(v4);
  CFDataRef v6 = CFDataCreate(0LL, v5, (int)length);
  free(v5);
  return v6;
}

CFDataRef sub_10000A2A4(const __CFString *a1)
{
  LODWORD(length) = 0;
  uint64_t v1 = sub_100008B04(a1, 0x8000100u);
  CFDataRef v6 = v1;
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  unsigned int v3 = (UInt8 *)sub_100009BB4((uint64_t)&v6, 1, 0LL, &length, 0);
  free(v2);
  if (!v3) {
    return 0LL;
  }
  CFDataRef v4 = CFDataCreate(0LL, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_10000A330(uint64_t a1, unsigned int a2, int *a3)
{
  __src[0] = 0LL;
  memset(v12, 0, sizeof(v12));
  __src[1] = v12;
  uint64_t v14 = 0x8000000000LL;
  int v4 = sub_10000A440(a1, a2, (uint64_t)v12, 0);
  int v5 = v4;
  if (v4)
  {
    size_t v6 = (int)v14;
    uint64_t v7 = (char *)malloc((int)v14 + 8LL * v4);
    int v8 = &v7[8 * v5];
    memcpy(v8, __src[1], v6);
    if (v5 >= 1)
    {
      uint64_t v9 = 0LL;
      do
      {
        *(void *)&v7[v9] = v8;
        v8 += strlen(v8) + 1;
        v9 += 8LL;
      }

      while (8LL * v5 != v9);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v7) {
    int v10 = v5;
  }
  else {
    int v10 = 0;
  }
  *a3 = v10;
  sub_10000A78C(v12);
  return v7;
}

uint64_t sub_10000A440(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0LL;
  if (a1 && a2)
  {
    size_t v7 = 0LL;
    size_t v8 = 0LL;
    uint64_t v4 = 0LL;
    unsigned int v9 = 0;
    v30[1] = (void *)0x800000000LL;
    memset(v29, 0, sizeof(v29));
    v30[0] = v29;
    char v10 = 1;
    unsigned int v11 = a2;
    do
    {
      uint64_t v12 = (unsigned __int8 *)(a1 + v8);
      unsigned int v13 = *v12;
      if ((~v13 & 0xC0) != 0)
      {
        if (v8 >= v7)
        {
          if (v13 >= 0x40)
          {
            fprintf(__stderrp, "label length %d > %d\n");
            goto LABEL_48;
          }

          unsigned int v18 = v13 + 1;
          if (v11 <= v13)
          {
            fprintf(__stderrp, "label truncated %d < %d\n");
            goto LABEL_48;
          }

          size_t v7 = v18 + v7;
          v11 -= v18;
        }

        if (*v12)
        {
          char __src = 46;
          if (SLODWORD(v30[1]) < 1) {
            goto LABEL_29;
          }
          if (*(_DWORD *)v30[0] != (_DWORD)v8)
          {
            uint64_t v19 = 1LL;
            do
            {
              unint64_t v20 = v19;
              if (LODWORD(v30[1]) == v19) {
                break;
              }
              int v21 = *((_DWORD *)v30[0] + v19++);
            }

            while (v21 != (_DWORD)v8);
            if (v20 >= LODWORD(v30[1])) {
LABEL_29:
            }
              sub_10000A7E0((int *)v29, v8);
          }

          if ((v10 & 1) == 0) {
            sub_10000A868(a3, &__src, 1);
          }
          sub_10000A868(a3, v12 + 1, v13);
          char v10 = 0;
          size_t v8 = v8 + v13 + 1;
        }

        else
        {
          char __src = 0;
          char v10 = 1;
          sub_10000A868(a3, &__src, 1);
          uint64_t v4 = (v4 + 1);
          unsigned int v9 = v7;
          size_t v8 = v7;
          if (a4) {
            break;
          }
        }
      }

      else
      {
        if (a4)
        {
          uint64_t v22 = __stderrp;
          int v23 = "single name with pointers\n";
          size_t v24 = 26LL;
          goto LABEL_47;
        }

        if (v8 >= v7)
        {
          if (v11 <= 1)
          {
            uint64_t v22 = __stderrp;
            int v23 = "truncated pointer value\n";
            size_t v24 = 24LL;
            goto LABEL_47;
          }

          size_t v7 = (v7 + 2);
          v11 -= 2;
        }

        unsigned int v14 = bswap32(*(_WORD *)v12 & 0xFF3F);
        if (v8 <= HIWORD(v14))
        {
          uint64_t v22 = __stderrp;
          int v23 = "pointer points at or ahead of current position\n";
          size_t v24 = 47LL;
          goto LABEL_47;
        }

        size_t v8 = HIWORD(v14);
        if (v9 <= v8)
        {
          uint64_t v22 = __stderrp;
          int v23 = "attempt to create infinite loop\n";
          size_t v24 = 32LL;
          goto LABEL_47;
        }

        if (SLODWORD(v30[1]) < 1) {
          goto LABEL_38;
        }
        if (*(_DWORD *)v30[0] != (_DWORD)v8)
        {
          uint64_t v15 = 1LL;
          do
          {
            unint64_t v16 = v15;
            if (LODWORD(v30[1]) == v15) {
              break;
            }
            int v17 = *((_DWORD *)v30[0] + v15++);
          }

          while (v17 != (_DWORD)v8);
          if (v16 >= LODWORD(v30[1]))
          {
LABEL_38:
            uint64_t v22 = __stderrp;
            int v23 = "attempt to point off into the weeds\n";
            size_t v24 = 36LL;
            goto LABEL_47;
          }
        }
      }
    }

    while (v8 < a2);
    if ((_DWORD)v4) {
      goto LABEL_49;
    }
    uint64_t v22 = __stderrp;
    if (*(_DWORD *)(a3 + 144))
    {
      int v23 = "name missing end label\n";
      size_t v24 = 23LL;
    }

    else
    {
      int v23 = "empty list\n";
      size_t v24 = 11LL;
    }

LABEL_47:
    fwrite(v23, v24, 1uLL, v22);
LABEL_48:
    sub_10000A78C((_OWORD *)a3);
    uint64_t v4 = 0LL;
LABEL_49:
    if (v30[0] && v30[0] != v29) {
      free(v30[0]);
    }
  }

  return v4;
}

double sub_10000A78C(_OWORD *a1)
{
  if (!*((_BYTE *)a1 + 128))
  {
    uint64_t v2 = (_OWORD *)*((void *)a1 + 17);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }

  *((void *)a1 + 18) = 0LL;
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_10000A7E0(int *result, size_t __size)
{
  int v2 = __size;
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[11];
  if ((_DWORD)v4 == result[10])
  {
    result[11] = 2 * v4;
    int v5 = (void *)*((void *)result + 4);
    if (v5 == (void *)v3)
    {
      size_t v6 = malloc(8 * v4);
      *(void *)(v3 + 32) = v6;
      double result = (int *)memmove(v6, (const void *)v3, 4 * v4);
    }

    else
    {
      double result = (int *)reallocf(v5, 8 * v4);
      *(void *)(v3 + 32) = result;
    }
  }

  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_10000A868(uint64_t a1, void *__src, int a3)
{
  int v7 = *(_DWORD *)(a1 + 144);
  int v6 = *(_DWORD *)(a1 + 148);
  if (v6 - v7 >= a3)
  {
    unsigned int v9 = *(char **)(a1 + 136);
  }

  else
  {
    if (*(_BYTE *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v6 - v7);
      return 0LL;
    }

    if (a3 <= 128) {
      int v10 = 128;
    }
    else {
      int v10 = a3;
    }
    int v11 = v6 + v10;
    *(_DWORD *)(a1 + 148) = v11;
    uint64_t v12 = *(void **)(a1 + 136);
    if (v12 == (void *)a1)
    {
      unsigned int v9 = (char *)malloc(v11);
      *(void *)(a1 + 136) = v9;
      memcpy(v9, (const void *)a1, v7);
    }

    else
    {
      unsigned int v9 = (char *)reallocf(v12, v11);
      *(void *)(a1 + 136) = v9;
      int v7 = *(_DWORD *)(a1 + 144);
    }
  }

  memcpy(&v9[v7], __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1LL;
}

void sub_10000A960(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[4];
      if (v3) {
        BOOL v4 = v3 == v2;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        free(v3);
      }
      free(v2);
      *a1 = 0LL;
    }
  }

void *sub_10000A9A8(unsigned __int8 *a1, int a2, void *a3, int *a4)
{
  int v5 = a3;
  int v6 = 0;
  if (a1 && a2)
  {
    int v7 = a1;
    if (a3)
    {
      int v8 = *a4;
      if (!*a4)
      {
        int v6 = 0;
        goto LABEL_26;
      }

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v31 = 0LL;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v26 = 0u;
      unsigned int v9 = (__int128 *)a3;
      LOBYTE(v3snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 1;
    }

    else
    {
      uint64_t v31 = 0LL;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v26 = 0u;
      int v8 = 64;
      unsigned int v9 = &v26;
    }

    *((void *)&v30 + 1) = v9;
    HIDWORD(v31) = v8;
    if (a2 < 1)
    {
      int v6 = 0;
      if (a3)
      {
LABEL_24:
        sub_10000AC18(&v26);
        goto LABEL_26;
      }
    }

    else
    {
      uint64_t v10 = a2;
      do
      {
        unsigned __int8 __src = *((_DWORD *)v7 + 1);
        int v11 = __src;
        if (v11)
        {
          unsigned int v12 = v11 & 0xF8;
          if ((v11 & 7) != 0) {
            unsigned int v12 = (v11 & 0xF8) + 8;
          }
        }

        if ((sub_10000B648((uint64_t)&v26, v7 + 8, 4uLL) & 1) == 0)
        {
LABEL_19:
          uint64_t v13 = sub_10001052C();
          uint64_t v14 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v13, v14))
          {
            uint64_t v15 = _os_log_pack_size(26LL);
            unint64_t v16 = (char *)v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
            int v17 = __error();
            uint64_t v18 = _os_log_pack_fill( v16,  v15,  *v17,  &_mh_execute_header,  "failed to add %d.%d.%d.%d",  v24[0],  v24[2],  (_DWORD)v26,  DWORD2(v26));
            int v19 = *v7;
            int v20 = v7[1];
            int v21 = v7[2];
            int v22 = v7[3];
            *(_DWORD *)uint64_t v18 = 67109888;
            *(_DWORD *)(v18 + 4) = v19;
            *(_WORD *)(v18 + 8) = 1024;
            *(_DWORD *)(v18 + 1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v20;
            *(_WORD *)(v18 + 14) = 1024;
            *(_DWORD *)(v18 + 16) = v21;
            *(_WORD *)(v18 + 2snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 1024;
            *(_DWORD *)(v18 + 22) = v22;
            __SC_log_send(5LL, v13, v14, v16);
          }

          int v6 = 0;
          int v5 = 0LL;
          goto LABEL_24;
        }

        v7 += 12;
        --v10;
      }

      while (v10);
      int v6 = v31;
      if (v5) {
        goto LABEL_24;
      }
    }

    int v5 = malloc(v6);
    memcpy(v5, *((const void **)&v30 + 1), v6);
    goto LABEL_24;
  }

double sub_10000AC18(_OWORD *a1)
{
  if (!*((_BYTE *)a1 + 64))
  {
    int v2 = (_OWORD *)*((void *)a1 + 9);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }

  *((void *)a1 + 1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0LL;
  double result = 0.0;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

_DWORD *sub_10000AC64(unsigned __int8 *a1, int a2, _DWORD *a3)
{
  BOOL v4 = 0LL;
  LODWORD(v5) = 0;
  if (a1 && a2)
  {
    uint64_t v8 = sub_10000AD04(a1, a2, 0LL, 0LL);
    uint64_t v5 = v8;
    if (!(_DWORD)v8)
    {
LABEL_6:
      BOOL v4 = 0LL;
      goto LABEL_7;
    }

    BOOL v4 = malloc(12LL * (int)v8);
    if (sub_10000AD04(a1, a2, v4, v5) != (_DWORD)v5)
    {
      free(v4);
      LODWORD(v5) = 0;
      goto LABEL_6;
    }
  }

LABEL_7:
  *a3 = v5;
  return v4;
}

uint64_t sub_10000AD04(unsigned __int8 *a1, int a2, _DWORD *__dst, uint64_t a4)
{
  if (a2 >= 1)
  {
    unsigned int v5 = a2;
    uint64_t v7 = 0LL;
    uint64_t v34 = a4;
    uint64_t v8 = (int)a4;
    for (uint64_t i = __dst; ; i += 3)
    {
      unsigned int v10 = *a1;
      if (v10 >= 0x21) {
        break;
      }
      LODWORD(v11) = v10 + 8;
      if ((v10 & 7) != 0) {
        unint64_t v11 = v11;
      }
      else {
        unint64_t v11 = *a1;
      }
      unint64_t v12 = v11 >> 3;
      unsigned int v13 = (v11 >> 3) + 5;
      int v14 = v5 - v13;
      if (v5 < v13)
      {
        uint64_t v21 = sub_10001052C();
        uint64_t v22 = _SC_syslog_os_log_mapping(5LL);
        if (__SC_log_enabled(5LL, v21, v22))
        {
          uint64_t v23 = _os_log_pack_size(14LL);
          size_t v24 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
          unsigned int v25 = __error();
          uint64_t v26 = _os_log_pack_fill( v24,  v23,  *v25,  &_mh_execute_header,  "truncated descriptor %d < %d",  v34,  v35);
          *(_DWORD *)uint64_t v26 = 67109376;
          *(_DWORD *)(v26 + 4) = v5;
          *(_WORD *)(v26 + 8) = 1024;
          *(_DWORD *)(v26 + 1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v13;
          __SC_log_send(5LL, v21, v22, v24);
        }

        return 0LL;
      }

      if (__dst)
      {
        if (v7 >= v8)
        {
          uint64_t v27 = sub_10001052C();
          uint64_t v28 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v27, v28))
          {
            uint64_t v29 = _os_log_pack_size(8LL);
            __int128 v30 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v31 = __error();
            uint64_t v32 = (_DWORD *)_os_log_pack_fill( v30,  v29,  *v31,  &_mh_execute_header,  "supplied route list too small (%d elements)",  v34);
            _DWORD *v32 = 67109120;
            v32[1] = v34;
            __SC_log_send(5LL, v27, v28, v30);
          }

          return 0LL;
        }

        *uint64_t i = 0;
        i[1] = v10;
        memcpy(i, a1 + 1, v11 >> 3);
        i[2] = *(_DWORD *)&a1[v12 + 1];
      }

      ++v7;
      a1 += v13;
      v5 -= v13;
      if (v14 <= 0) {
        return v7;
      }
    }

    uint64_t v15 = sub_10001052C();
    uint64_t v16 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v15, v16))
    {
      uint64_t v17 = _os_log_pack_size(8LL);
      uint64_t v18 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      int v19 = __error();
      int v20 = (_DWORD *)_os_log_pack_fill( v18,  v17,  *v19,  &_mh_execute_header,  "prefix length is %d (> 32)",  v34);
      _DWORD *v20 = 67109120;
      v20[1] = v10;
      __SC_log_send(5LL, v15, v16, v18);
    }
  }

  return 0LL;
}

in_addr *sub_10000B01C(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (!Count) {
    goto LABEL_28;
  }
  uint64_t v5 = Count;
  if ((Count & 1) != 0)
  {
    uint64_t v18 = sub_10001052C();
    uint64_t v19 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v18, v19))
    {
      uint64_t v20 = _os_log_pack_size(2LL);
      uint64_t v21 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = __error();
      *(_WORD *)_os_log_pack_fill( v21,  v20,  *v22,  &_mh_execute_header,  "Classless route requires pairs of IP address values") = 0;
      __SC_log_send(5LL, v18, v19, v21);
    }

    goto LABEL_28;
  }

  if (Count >= 0) {
    uint64_t v6 = Count;
  }
  else {
    uint64_t v6 = Count + 1;
  }
  uint64_t v7 = v6 >> 1;
  uint64_t v8 = (in_addr *)malloc(12 * (v6 >> 1) + 12);
  unsigned int v9 = v8;
  if (v5 < 2) {
    goto LABEL_27;
  }
  uint64_t v42 = a2;
  int v43 = 0;
  unsigned int v10 = v8 + 3;
  CFIndex v11 = 1LL;
  uint64_t v12 = v7;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v11 - 1);
    int v14 = (const __CFString *)CFArrayGetValueAtIndex(a1, v11);
    CFTypeID TypeID = CFStringGetTypeID();
    if (!ValueAtIndex
      || CFGetTypeID(ValueAtIndex) != TypeID
      || (CFTypeID v16 = CFStringGetTypeID(), !v14)
      || CFGetTypeID(v14) != v16)
    {
      uint64_t v23 = sub_10001052C();
      uint64_t v24 = _SC_syslog_os_log_mapping(5LL);
      a2 = v42;
      uint64_t v25 = _os_log_pack_size(2LL);
      uint64_t v26 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v27 = __error();
      *(_WORD *)_os_log_pack_fill( v26,  v25,  *v27,  &_mh_execute_header,  "Classless route array contains non-string") = 0;
      goto LABEL_25;
    }

    if ((sub_10000B45C(ValueAtIndex, v10, (int *)&v10[1]) & 1) == 0)
    {
      uint64_t v23 = sub_10001052C();
      uint64_t v24 = _SC_syslog_os_log_mapping(5LL);
      a2 = v42;
      if (__SC_log_enabled(5LL, v23, v24))
      {
        uint64_t v32 = _os_log_pack_size(12LL);
        uint64_t v26 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
        unsigned int v33 = __error();
        uint64_t v34 = _os_log_pack_fill( v26,  v32,  *v33,  &_mh_execute_header,  "Invalid route destination descriptor '%@'");
        *(_DWORD *)uint64_t v34 = 138412290;
        *(void *)(v34 + 4) = ValueAtIndex;
LABEL_25:
        uint64_t v28 = v23;
        uint64_t v29 = v24;
        __int128 v30 = v26;
LABEL_26:
        __SC_log_send(5LL, v28, v29, v30);
      }

LABEL_27:
      free(v9);
LABEL_28:
      LODWORD(v7) = 0;
      unsigned int v9 = 0LL;
      goto LABEL_29;
    }

    if ((sub_100008844(v14, v10 + 2) & 1) == 0)
    {
      uint64_t v35 = sub_10001052C();
      uint64_t v36 = _SC_syslog_os_log_mapping(5LL);
      a2 = v42;
      if (__SC_log_enabled(5LL, v35, v36))
      {
        uint64_t v37 = _os_log_pack_size(12LL);
        char v38 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
        unsigned int v39 = __error();
        uint64_t v40 = _os_log_pack_fill(v38, v37, *v39, &_mh_execute_header, "Invalid route gateway address '%@'");
        *(_DWORD *)uint64_t v40 = 138412290;
        *(void *)(v40 + 4) = v14;
        uint64_t v28 = v35;
        uint64_t v29 = v36;
        __int128 v30 = v38;
        goto LABEL_26;
      }

      goto LABEL_27;
    }

    if ((v10->s_addr != 0) | v43 & 1)
    {
      v10 += 3;
    }

    else
    {
      uint64_t v17 = *(void *)&v10->s_addr;
      v9[2].in_addr_t s_addr = v10[2].s_addr;
      *(void *)&v9->in_addr_t s_addr = v17;
      int v43 = 1;
    }

    v11 += 2LL;
    --v12;
  }

  while (v12);
  a2 = v42;
  if ((v43 & 1) == 0)
  {
    v9[2].in_addr_t s_addr = 0;
    LODWORD(v7) = v7 + 1;
    *(void *)&v9->in_addr_t s_addr = 0LL;
  }

LABEL_29:
  *a2 = v7;
  return v9;
}

uint64_t sub_10000B45C(const __CFString *a1, in_addr *a2, int *a3)
{
  uint64_t v5 = sub_100008B04(a1, 0x600u);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    uint64_t v7 = strchr((const char *)v5, 47);
    if (v7)
    {
      *uint64_t v7 = 0;
      unsigned int v8 = strtoul(v7 + 1, 0LL, 0);
      if (v8 >= 0x21)
      {
        uint64_t v9 = sub_10001052C();
        uint64_t v10 = _SC_syslog_os_log_mapping(5LL);
        if (__SC_log_enabled(5LL, v9, v10))
        {
          uint64_t v11 = _os_log_pack_size(8LL);
          uint64_t v12 = (char *)&v21 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
          unsigned int v13 = __error();
          int v14 = (_DWORD *)_os_log_pack_fill( v12,  v11,  *v13,  &_mh_execute_header,  "invalid prefix length %d",  v21);
          _DWORD *v14 = 67109120;
          v14[1] = v8;
          __SC_log_send(5LL, v9, v10, v12);
        }

        goto LABEL_22;
      }
    }

    else
    {
      unsigned int v8 = -1;
    }

    if (inet_aton(v6, a2) == 1)
    {
      int v16 = bswap32(a2->s_addr);
      if (v8) {
        int v17 = -1 << -(char)v8;
      }
      else {
        int v17 = 0;
      }
      else {
        int v18 = 24;
      }
      if (v16 >= 0) {
        int v18 = 8;
      }
      int v19 = -1 << -(char)v18;
      if (v8 != -1)
      {
        int v18 = v8;
        int v19 = v17;
      }

      if ((v19 & v16) == 0)
      {
        int v18 = 0;
        a2->in_addr_t s_addr = 0;
      }

      *a3 = v18;
      uint64_t v15 = 1LL;
      goto LABEL_23;
    }

LABEL_22:
    uint64_t v15 = 0LL;
LABEL_23:
    free(v6);
    return v15;
  }

  return 0LL;
}

      uint64_t v9 = (void *)v9[4];
      if (!v9) {
        return v9;
      }
    }

    int v21 = 0LL;
    uint64_t v22 = (void *)(v12 + 24LL * v11 + 16);
    uint64_t v23 = (void *)(v17 + 24LL * (int)v16 + 16);
    while (1)
    {
      if (!strcmp(*(const char **)(*v22 + 8 * v21), a2)
        && inet_aton(*(const char **)(*v23 + 8LL * (v21 % *v19)), a5))
      {
        if (a6) {
          *a6 = 1;
        }
        if (!a3 || a5 && a3(a4, a5->s_addr)) {
          break;
        }
      }
    }

uint64_t sub_10000B648(uint64_t a1, void *__src, size_t __n)
{
  unsigned int v3 = __n;
  int v6 = *(_DWORD *)(a1 + 80);
  uint64_t v7 = *(int *)(a1 + 84);
  if ((int)v7 - v6 >= (int)__n)
  {
    int v16 = *(char **)(a1 + 72);
    goto LABEL_6;
  }

  if (!*(_BYTE *)(a1 + 64))
  {
    *(_DWORD *)(a1 + 84) = v7 + 64;
    int v17 = *(void **)(a1 + 72);
    if (v17 == (void *)a1)
    {
      int v16 = (char *)malloc(v7 + 64);
      *(void *)(a1 + 72) = v16;
      memcpy(v16, (const void *)a1, v6);
    }

    else
    {
      uint64_t result = (uint64_t)reallocf(v17, v7 + 64);
      *(void *)(a1 + 72) = result;
      if (!result) {
        return result;
      }
      int v16 = (char *)result;
      int v6 = *(_DWORD *)(a1 + 80);
    }

LABEL_6:
    memcpy(&v16[v6], __src, v3);
    *(_DWORD *)(a1 + 80) += v3;
    return 1LL;
  }

  uint64_t v8 = sub_10001052C();
  uint64_t v9 = _SC_syslog_os_log_mapping(5LL);
  uint64_t result = __SC_log_enabled(5LL, v8, v9);
  if ((_DWORD)result)
  {
    uint64_t v11 = _os_log_pack_size(14LL);
    uint64_t v12 = (char *)v18 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    unsigned int v13 = __error();
    uint64_t v14 = _os_log_pack_fill( v12,  v11,  *v13,  &_mh_execute_header,  "user-supplied buffer failed to add data with length %d (> %d)",  v18[0],  v18[2]);
    int v15 = *(_DWORD *)(a1 + 84) - *(_DWORD *)(a1 + 80);
    *(_DWORD *)uint64_t v14 = 67109376;
    *(_DWORD *)(v14 + 4) = v3;
    *(_WORD *)(v14 + 8) = 1024;
    *(_DWORD *)(v14 + 1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v15;
    __SC_log_send(5LL, v8, v9, v12);
    return 0LL;
  }

  return result;
}

void *sub_10000B80C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_10000C72C(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_10000B840(uint64_t *a1)
{
  uint64_t v1 = (uint64_t)a1;
  while (sub_10000C7A0(a1, 0, &v3))
  {
    if (v3)
    {
      int v2 = *(void (**)(void))(v1 + 16);
      if (v2) {
        v2();
      }
    }

    a1 = (uint64_t *)v1;
  }

  sub_10000C734(v1);
}

uint64_t sub_10000B8A8(_OWORD *a1, int a2)
{
  if (a2 < 32)
  {
    unsigned int v2 = 0;
  }

  else
  {
    unsigned int v2 = 0;
    unsigned int v3 = a2;
    do
    {
      a2 = v3 - 32;
      uint16x8_t v4 = *(uint16x8_t *)a1;
      uint16x8_t v5 = *((uint16x8_t *)a1 + 1);
      a1 += 2;
      v2 += vaddvq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v4.i8, *(uint16x4_t *)v5.i8),  (int32x4_t)vaddl_high_u16(v4, v5)));
      BOOL v6 = v3 > 0x3F;
      v3 -= 32;
    }

    while (v6);
  }

  if (a2 < 8)
  {
    int v7 = a2;
    if (!a2) {
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
    }
  }

  else
  {
    do
    {
      int v7 = a2 - 8;
      uint16x4_t v8 = *(uint16x4_t *)a1;
      a1 = (_OWORD *)((char *)a1 + 8);
      v2 += vaddvq_s32((int32x4_t)vmovl_u16(v8));
      BOOL v6 = a2 > 0xF;
      a2 -= 8;
    }

    while (v6);
    if (!v7) {
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
    }
  }

  unsigned int v2 = HIWORD(v2) + (unsigned __int16)v2;
  if (HIWORD(v2)) {
    v2 -= 0xFFFF;
  }
  int v9 = v7 - 2;
  if (v7 < 2)
  {
    uint64_t v11 = (unsigned __int8 *)a1;
  }

  else
  {
    uint64_t v10 = v9 & 0xFFFFFFFE;
    uint64_t v11 = (unsigned __int8 *)a1 + v10 + 2;
    for (unsigned int i = v7; i > 1; i -= 2)
    {
      int v13 = *(unsigned __int16 *)a1;
      a1 = (_OWORD *)((char *)a1 + 2);
      v2 += v13;
    }

    int v9 = v7 - v10 - 4;
  }

  if (v9 == -1) {
    v2 += *v11;
  }
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

__n128 sub_10000B9A8(__n128 *a1)
{
  unsigned int v2 = malloc(0x10uLL);
  if (v2)
  {
    __n128 result = *a1;
    *unsigned int v2 = *a1;
  }

  return result;
}

uint64_t sub_10000B9DC(uint64_t *a1, int a2)
{
  uint64_t v4 = 0LL;
  if (!a1) {
    goto LABEL_3;
  }
LABEL_2:
  for (int i = *((_DWORD *)a1 + 2); ; int i = 0)
  {
    if (v4 >= i) {
      return 0LL;
    }
    uint64_t v6 = *a1;
    uint64_t v7 = *a1 + 96 * v4 + 24;
LABEL_9:
    ++v4;
    if (a1) {
      goto LABEL_2;
    }
LABEL_3:
    ;
  }

  uint64_t v8 = 0LL;
  while (*(_DWORD *)sub_10000B8A4(v7, v8) != a2)
  {
    uint64_t v8 = (v8 + 1);
  }

  return v6 + 96 * v4;
}

uint64_t sub_10000BA9C(uint64_t *a1, char *__s2)
{
  uint64_t v4 = -96LL;
  uint64_t v5 = -1LL;
  while (1)
  {
    int v6 = a1 ? *((_DWORD *)a1 + 2) : 0;
    if (++v5 >= v6) {
      break;
    }
    uint64_t v7 = v4 + 96;
    uint64_t v8 = *a1;
    int v9 = strcmp((const char *)(*a1 + v4 + 96), __s2);
    uint64_t v4 = v7;
    if (!v9) {
      return v8 + v7;
    }
  }

  return 0LL;
}

void *sub_10000BB20()
{
  uint64_t v0 = malloc(0x10uLL);
  uint64_t v1 = v0;
  if (v0 && !sub_10000BB64((uint64_t)v0))
  {
    free(v1);
    return 0LL;
  }

  return v1;
}

uint64_t sub_10000BB64(uint64_t a1)
{
  uint64_t v76 = 0LL;
  *(void *)a1 = 0LL;
  int v2 = getifaddrs(&v76);
  unsigned int v3 = v76;
  if (v2 < 0) {
    goto LABEL_88;
  }
  if (!v76)
  {
LABEL_90:
    uint64_t result = *(void *)a1;
    if (*(void *)a1)
    {
      free((void *)result);
      uint64_t result = 0LL;
      *(void *)a1 = 0LL;
    }

    return result;
  }

  int v4 = 0;
  uint64_t v5 = v76;
  while (v5->ifa_addr)
  {
    uint64_t v5 = v5->ifa_next;
    --v4;
    if (!v5) {
      goto LABEL_8;
    }
  }

  if (!v4)
  {
LABEL_88:
    if (v3) {
      freeifaddrs(v3);
    }
    goto LABEL_90;
  }

LABEL_8:
  int v6 = -v4;
  uint64_t v7 = malloc(96LL * -v4);
  *(void *)a1 = v7;
  if (!v7) {
    goto LABEL_88;
  }
  int v8 = socket(2, 2, 0);
  unsigned int v3 = v76;
  if (v8 < 0) {
    goto LABEL_88;
  }
  int v10 = v8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v6;
  size_t v11 = 96LL;
  if (!v3) {
    goto LABEL_93;
  }
  mach_port_t v73 = kIOMainPortDefault;
  uint64_t v71 = kCFAllocatorDefault;
  *(void *)&__int128 v9 = 136315906LL;
  __int128 v74 = v9;
  int v75 = v8;
  do
  {
    ifa_addr = v3->ifa_addr;
    if (!ifa_addr) {
      goto LABEL_82;
    }
    ifa_name = v3->ifa_name;
    int sa_family = ifa_addr->sa_family;
    if (sa_family == 2)
    {
      uint64_t v21 = 96LL * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
      uint64_t v22 = -96LL;
      do
      {
        uint64_t v23 = v22 + 96;
        if (v21 == v22 + 96) {
          goto LABEL_30;
        }
        uint64_t v24 = *(void *)a1;
        int v25 = strcmp((const char *)(*(void *)a1 + v22 + 96), ifa_name);
        uint64_t v22 = v23;
      }

      while (v25);
      if (v24)
      {
        uint64_t v26 = v24 + v23;
LABEL_32:
        int v38 = *(_DWORD *)&ifa_addr->sa_data[2];
        ifa_netmask = v3->ifa_netmask;
        if (ifa_netmask) {
          int v40 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v40 = 0;
        }
        if ((*(_WORD *)(v26 + 16) & 2) != 0 && (ifa_dstaddr = v3->ifa_dstaddr) != 0LL) {
          int v42 = *(_DWORD *)&ifa_dstaddr->sa_data[2];
        }
        else {
          int v42 = 0;
        }
        int v43 = malloc(0x10uLL);
        if (v43)
        {
          *int v43 = v38;
          v43[1] = v40;
          v43[2] = v40 & v38;
          v43[3] = v42;
        }

        sub_10000B89C(v26 + 24, v43);
        goto LABEL_82;
      }

LABEL_30:
      uint64_t v37 = sub_10000C6AC((uint64_t *)a1, (uint64_t)ifa_name);
      if (v37)
      {
        uint64_t v26 = v37;
        *(_WORD *)(v37 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }

      uint64_t v44 = sub_10001052C();
      uint64_t v45 = _SC_syslog_os_log_mapping(5LL);
      goto LABEL_45;
    }

    if (sa_family != 18) {
      goto LABEL_82;
    }
    uint64_t v15 = 96LL * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
    uint64_t v16 = -96LL;
    do
    {
      uint64_t v17 = v16 + 96;
      if (v15 == v16 + 96) {
        goto LABEL_25;
      }
      uint64_t v18 = *(void *)a1;
      int v19 = strcmp((const char *)(*(void *)a1 + v16 + 96), ifa_name);
      uint64_t v16 = v17;
    }

    while (v19);
    if (v18)
    {
      uint64_t v20 = v18 + v17;
      goto LABEL_27;
    }

LABEL_25:
    uint64_t v27 = sub_10000C6AC((uint64_t *)a1, (uint64_t)ifa_name);
    if (!v27)
    {
      uint64_t v44 = sub_10001052C();
      uint64_t v45 = _SC_syslog_os_log_mapping(5LL);
LABEL_45:
      uint64_t v46 = _os_log_pack_size(2LL);
      int v47 = (char *)&v71 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v48 = *__error();
      *(_WORD *)_os_log_pack_fill(v47, v46, v48, &_mh_execute_header, "interfaces: S_next_entry returns NULL", v71) = 0;
      __SC_log_send(5LL, v44, v45, v47);
      goto LABEL_82;
    }

    uint64_t v20 = v27;
    *(_WORD *)(v27 + 16) = v3->ifa_flags;
LABEL_27:
    unsigned int v28 = ifa_addr->sa_data[4];
    if (v28 >= 0x11)
    {
      uint64_t v29 = sub_10001052C();
      uint64_t v30 = _SC_syslog_os_log_mapping(5LL);
      if (__SC_log_enabled(5LL, v29, v30))
      {
        uint64_t v31 = _os_log_pack_size(34LL);
        uint64_t v32 = (char *)&v71 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
        unsigned int v33 = __error();
        uint64_t v34 = _os_log_pack_fill( v32,  v31,  *v33,  &_mh_execute_header,  "%s: link type %d address length %d > %ld",  (const char *)v71,  v72,  (_DWORD)v74,  *((void *)&v74 + 1));
        int v35 = ifa_addr->sa_data[2];
        int v36 = ifa_addr->sa_data[4];
        *(_DWORD *)uint64_t v34 = v74;
        *(void *)(v34 + 4) = ifa_name;
        *(_WORD *)(v34 + 12) = 1024;
        *(_DWORD *)(v34 + 14) = v35;
        *(_WORD *)(v34 + 18) = 1024;
        *(_DWORD *)(v34 + 2snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v36;
        *(_WORD *)(v34 + 24) = 2048;
        unsigned int v28 = 16;
        *(void *)(v34 + 26) = 16LL;
        __SC_log_send(5LL, v29, v30, v32);
        int v10 = v75;
      }

      else
      {
        unsigned int v28 = 16;
      }
    }

    *(_BYTE *)(v20 + 74) = v28;
    memmove((void *)(v20 + 56), &ifa_addr->sa_data[ifa_addr->sa_data[3] + 6], v28);
    char v49 = ifa_addr->sa_data[2];
    *(_BYTE *)(v20 + 75) = v49;
    *(_WORD *)(v20 + 72) = *(_WORD *)ifa_addr->sa_data;
    ifa_data = (char *)v3->ifa_data;
    if (ifa_data) {
      char v49 = *ifa_data;
    }
    *(_BYTE *)(v20 + 18) = v49;
    if (sub_10000C47C(v10, (uint64_t)ifa_name, (uint64_t)v80))
    {
      if (*(_BYTE *)(v20 + 18) == 6)
      {
        uint64_t v51 = sub_10000C50C(v10, (uint64_t)ifa_name);
        if ((v51 & 0x4000) != 0) {
          *(_BYTE *)(v20 + 19) |= 8u;
        }
        if ((v80[16] & 0xE0) == 0x80)
        {
          char v52 = *(_BYTE *)(v20 + 19);
          *(_BYTE *)(v20 + 19) = v52 | 1;
          if ((v51 & 0x100000) != 0)
          {
            char v66 = v52 | 3;
            goto LABEL_70;
          }

          keys = @"IOInterfaceName";
          values = (void *)CFStringCreateWithCString(0LL, ifa_name, 0x8000100u);
          in_addr_t v77 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          keys = @"IOPropertyMatch";
          uint64_t v53 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&v77,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFRelease(v77);
          io_service_t MatchingService = IOServiceGetMatchingService(v73, v53);
          if (MatchingService)
          {
            io_object_t v55 = MatchingService;
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IO80211InterfaceRole", v71, 0);
            if (CFProperty)
            {
              in_addr v57 = CFProperty;
              CFTypeID TypeID = CFStringGetTypeID();
              BOOL v59 = CFGetTypeID(v57) == TypeID && CFEqual(v57, @"Infrastructure") != 0;
              CFRelease(v57);
              IOObjectRelease(v55);
              if (v59)
              {
                char v66 = *(_BYTE *)(v20 + 19) | 0x10;
LABEL_70:
                *(_BYTE *)(v20 + 19) = v66;
              }
            }

            else
            {
              IOObjectRelease(v55);
            }
          }
        }

        else
        {
          CFStringRef v60 = CFStringCreateWithCString(0LL, ifa_name, 0x8000100u);
          uint64_t v61 = _SCNetworkInterfaceCreateWithBSDName(0LL, v60, 0LL);
          if (v61)
          {
            __int128 v62 = (const void *)v61;
            int IsTetheredHotspot = _SCNetworkInterfaceIsTetheredHotspot();
            int IsCarPlay = _SCNetworkInterfaceIsCarPlay(v62);
            CFRelease(v62);
            if (IsCarPlay)
            {
              if (IsTetheredHotspot) {
                char v65 = 36;
              }
              else {
                char v65 = 32;
              }
              CFRelease(v60);
            }

            else
            {
              CFRelease(v60);
              if (!IsTetheredHotspot) {
                goto LABEL_71;
              }
              char v65 = 4;
            }

            char v66 = *(_BYTE *)(v20 + 19) | v65;
            goto LABEL_70;
          }

          CFRelease(v60);
        }
      }

LABEL_71:
      if (v82 < 1)
      {
        int v68 = 0;
        unint64_t v67 = 0LL;
        uint64_t v69 = 0LL;
      }

      else
      {
        unint64_t v67 = (unint64_t)(v81 & 2) << 31;
        if ((v81 & 1) != 0) {
          int v68 = (v81 >> 2) & 1;
        }
        else {
          int v68 = 0;
        }
        if ((v81 & 1) == 0) {
          unint64_t v67 = 0LL;
        }
        uint64_t v69 = 1LL;
        if ((v81 & 1) == 0) {
          uint64_t v69 = 0LL;
        }
      }

      *(void *)(v20 + 8snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v69 | v67;
      *(_DWORD *)(v20 + 88) = v68;
    }

LABEL_82:
    unsigned int v3 = v3->ifa_next;
  }

  while (v3);
  size_t v11 = 96LL * *(int *)(a1 + 8) + 96;
LABEL_93:
  *(void *)a1 = reallocf(*(void **)a1, v11);
  if (v76) {
    freeifaddrs(v76);
  }
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  return 1LL;
}

void sub_10000C2F0(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (*(int *)(v2 + 8) >= 1)
      {
        uint64_t v3 = 0LL;
        uint64_t v4 = 24LL;
        do
        {
          sub_10000B840((uint64_t *)(*(void *)v2 + v4));
          ++v3;
          v4 += 96LL;
        }

        while (v3 < *(int *)(v2 + 8));
      }

      if (*(void *)v2) {
        free(*(void **)v2);
      }
      free((void *)v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_10000C36C(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 16);
}

uint64_t sub_10000C374(uint64_t a1)
{
  return sub_1000090D4(a1 + 24);
}

uint64_t sub_10000C37C(uint64_t a1, uint64_t a2)
{
  return sub_10000B8A4(a1 + 24, a2);
}

unsigned int *sub_10000C384(uint64_t a1)
{
  uint64_t result = (unsigned int *)sub_10000B8A4(a1 + 24, 0LL);
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t sub_10000C3A8(uint64_t a1)
{
  return *(unsigned int *)(sub_10000B8A4(a1 + 24, 0LL) + 12);
}

BOOL sub_10000C3C8(uint64_t a1)
{
  return (int)sub_1000090D4(a1 + 24) > 0;
}

uint64_t sub_10000C3E8(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 24;
  int v4 = sub_1000090D4(a1 + 24);
  if (v4 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = sub_10000B8A4(v3, v6);
    if ((*(_DWORD *)(v7 + 4) & a2) == *(_DWORD *)(v7 + 8)) {
      break;
    }
    uint64_t v6 = (v6 + 1);
    if (v5 == (_DWORD)v6) {
      return 0xFFFFFFFFLL;
    }
  }

  return v6;
}

uint64_t sub_10000C458(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 75);
  if (v1 == 144) {
    unsigned int v2 = 24;
  }
  else {
    unsigned int v2 = -1;
  }
  if (v1 == 6) {
    return 1LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_10000C474(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 72);
}

uint64_t sub_10000C47C(int a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)(a3 + 28) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __strlcpy_chk(a3, a2, 16LL, 16LL);
  if (ioctl(a1, 0xC02C6938uLL, a3) != -1) {
    return 1LL;
  }
  if (*__error() != 102) {
    return 0LL;
  }
  *(_DWORD *)(a3 + 24) = 3;
  uint64_t result = 1LL;
  *(_DWORD *)(a3 + 32) = 1;
  return result;
}

uint64_t sub_10000C50C(int a1, uint64_t a2)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __strlcpy_chk(&v13, a2, 16LL, 16LL);
  if (ioctl(a1, 0xC020698EuLL, &v13) != -1) {
    return v14;
  }
  if (*__error() != 6 && *__error() != 82 && *__error() != 22)
  {
    uint64_t v5 = sub_10001052C();
    uint64_t v6 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v5, v6))
    {
      uint64_t v7 = _os_log_pack_size(22LL);
      int v8 = (char *)&v13 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __int128 v9 = __error();
      uint64_t v10 = _os_log_pack_fill( v8,  v7,  *v9,  &_mh_execute_header,  "%s: SIOCGIFEFLAGS failed status, %s",  (const char *)v13,  *((const char **)&v13 + 1));
      size_t v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = a2;
      *(_WORD *)(v10 + 12) = 2080;
      *(void *)(v10 + 14) = v12;
      __SC_log_send(5LL, v5, v6, v8);
    }
  }

  return 0LL;
}

uint64_t sub_10000C6AC(uint64_t *a1, uint64_t a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  if (v2 >= *((_DWORD *)a1 + 3)) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  *((_DWORD *)a1 + 2) = v2 + 1;
  uint64_t v4 = v3 + 96LL * v2;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 8snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __strlcpy_chk(v4, a2, 16LL, 16LL);
  sub_10000B80C((void *)(v4 + 24), (uint64_t)j__free, (uint64_t)sub_10000B9A8);
  return v4;
}

void *sub_10000C72C(void *result)
{
  unsigned int *result = 0LL;
  result[1] = 0LL;
  return result;
}

void sub_10000C734(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

uint64_t sub_10000C760(uint64_t result)
{
  if (result)
  {
    if (*(void *)result) {
      return *(unsigned int *)(result + 12);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10000C77C(uint64_t a1, int a2)
{
  if (*(void *)a1 && *(_DWORD *)(a1 + 12) > a2) {
    return *(void *)(*(void *)a1 + 8LL * a2);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000C7A0(uint64_t *a1, unsigned int a2, void *a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if ((a2 & 0x80000000) == 0)
  {
    int v6 = *((_DWORD *)a1 + 3);
    if (v6 > (int)a2)
    {
      if (a3) {
        *a3 = *(void *)(v3 + 8LL * a2);
      }
      if ((int)(v6 + ~a2) >= 1)
      {
        memmove((void *)(*a1 + 8LL * a2), (const void *)(*a1 + 8LL * (a2 + 1)), 8LL * (v6 + ~a2));
        int v6 = *((_DWORD *)a1 + 3);
      }

      *((_DWORD *)a1 + 3) = v6 - 1;
      return 1LL;
    }
  }

  return result;
}

BOOL sub_10000C824(uint64_t a1, uint64_t a2)
{
  BOOL result = sub_10000C864(a1);
  if (result)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v6 + 1;
    *(void *)(v5 + 8 * v6) = a2;
    return 1LL;
  }

  return result;
}

BOOL sub_10000C864(uint64_t a1)
{
  int v2 = *(void **)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  if (!v2)
  {
    if (!v3)
    {
      int v3 = 16;
      *(_DWORD *)(a1 + 8) = 16;
    }

    *(_DWORD *)(a1 + 12) = 0;
    int v2 = malloc(8LL * v3);
    goto LABEL_7;
  }

  if (v3 == *(_DWORD *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 8) = 2 * v3;
    int v2 = realloc(v2, 16LL * v3);
LABEL_7:
    *(void *)a1 = v2;
  }

  return v2 != 0LL;
}

BOOL sub_10000C8D4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    return 0LL;
  }
  int v6 = *(_DWORD *)(a1 + 12);
  BOOL result = sub_10000C864(a1);
  if (v6 <= (int)a3)
  {
    if (!result) {
      return result;
    }
    uint64_t v8 = *(void *)a1;
    uint64_t v9 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v9 + 1;
    *(void *)(v8 + 8 * v9) = a2;
  }

  else
  {
    if (!result) {
      return result;
    }
    memmove( (void *)(*(void *)a1 + 8LL * a3 + 8),  (const void *)(*(void *)a1 + 8LL * a3),  8LL * (int)(*(_DWORD *)(a1 + 12) - a3));
    *(void *)(*(void *)a1 + 8LL * a3) = a2;
    ++*(_DWORD *)(a1 + 12);
  }

  return 1LL;
}

uint64_t sub_10000C970(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 12);
  if (!v2) {
    return 1LL;
  }
  int v5 = *(_DWORD *)(a1 + 12) + v2;
  if (v5 <= *(_DWORD *)(a1 + 8))
  {
    uint64_t result = *(void *)a1;
    if (*(void *)a1)
    {
LABEL_9:
      memmove((void *)(result + 8LL * *(int *)(a1 + 12)), *(const void **)a2, 8LL * *(int *)(a2 + 12));
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
      return 1LL;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 8) = v5;
    int v6 = *(void **)a1;
    if (*(void *)a1) {
      uint64_t result = (uint64_t)realloc(v6, 8LL * v5);
    }
    else {
      uint64_t result = (uint64_t)malloc(8LL * v5);
    }
    *(void *)a1 = result;
    if (result) {
      goto LABEL_9;
    }
  }

  return result;
}

char *sub_10000CA08(int a1, unsigned int a2)
{
  int v2 = 0;
  int v14 = a1;
  unsigned int v3 = bswap32(a2);
  while (((v3 >> v2) & 1) == 0)
  {
    if (++v2 == 32)
    {
      byte_1000194E8 = 0;
      int v4 = 32;
      int v5 = 4;
      goto LABEL_7;
    }
  }

  int v4 = 32 - v2;
  byte_1000194E8 = 0;
  unsigned int v6 = 39 - v2;
  if (v6 < 8) {
    goto LABEL_12;
  }
  int v5 = v6 >> 3;
LABEL_7:
  uint64_t v7 = (v5 - 1);
  uint64_t v8 = v7 + 1;
  uint64_t v9 = (unsigned __int8 *)&v14;
  do
  {
    int v11 = *v9++;
    int v10 = v11;
    if ((_DWORD)v7) {
      uint64_t v12 = ".";
    }
    else {
      uint64_t v12 = "";
    }
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk(&byte_1000194E8, __str, 32LL, 32LL);
    LODWORD(v7) = v7 - 1;
    --v8;
  }

  while (v8);
LABEL_12:
  if ((v4 & 7) != 0)
  {
    snprintf(__str, 8uLL, "/%d", v4);
    __strlcat_chk(&byte_1000194E8, __str, 32LL, 32LL);
  }

  return &byte_1000194E8;
}

uint64_t sub_10000CB70(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  *(void *)a5 = result - a3;
  *(_DWORD *)(a5 + 8) = a2 - a4;
  if (a2 - a4 < 0)
  {
    *(_DWORD *)(a5 + 8) = a2 - a4 + 1000000;
    *(void *)a5 = result - a3 - 1;
  }

  return result;
}

void sub_10000CBA0(CFMutableStringRef theString, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v5 = 0LL;
    int v6 = 0;
    do
    {
      if (!v6) {
        CFStringAppendFormat(theString, 0LL, @"%04x ", v5);
      }
      int v8 = *(char *)(a2 + v5);
      if (v8 < 0) {
        __uint32_t v9 = __maskrune(*(unsigned __int8 *)(a2 + v5), 0x40000uLL);
      }
      else {
        __uint32_t v9 = _DefaultRuneLocale.__runetype[*(unsigned __int8 *)(a2 + v5)] & 0x40000;
      }
      unsigned __int8 v10 = *(_BYTE *)(a2 + v5);
      if (v9) {
        char v11 = v8;
      }
      else {
        char v11 = 46;
      }
      v14[v6] = v11;
      CFStringAppendFormat(theString, 0LL, @" %02x", v10);
      if (v6 == 7)
      {
        CFStringAppendFormat(theString, 0LL, @" ");
        int v6 = 8;
      }

      else if (v6 == 15)
      {
        char v15 = 0;
        CFStringAppendFormat(theString, 0LL, @"  %s\n", v14);
        int v6 = 0;
      }

      else
      {
        ++v6;
      }

      ++v5;
    }

    while (a3 != (_DWORD)v5);
    if (v6)
    {
      if (v6 >= 8) {
        uint64_t v12 = "";
      }
      else {
        uint64_t v12 = " ";
      }
      if (v6 <= 15)
      {
        uint64_t v13 = v6;
        do
        {
          CFStringAppendFormat(theString, 0LL, @"   ");
          v14[v13++] = 32;
        }

        while ((_DWORD)v13 != 16);
      }

      char v15 = 0;
      CFStringAppendFormat(theString, 0LL, @"  %s%s\n", v12, v14);
    }
  }

void sub_10000CD88(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v9 = 0LL;
    uint64_t v10 = a3;
    do
    {
      if (v9)
      {
        if (a4 != 32 || (v9 & 7) != 0) {
          *(_WORD *)char v11 = a4;
        }
        else {
          strcpy(v11, "  ");
        }
      }

      else
      {
        v11[0] = 0;
      }

      CFStringAppendFormat(theString, 0LL, @"%s%02x", v11, *(unsigned __int8 *)(a2 + v9++));
    }

    while (v10 != v9);
  }

void sub_10000CE40(__CFString *a1, uint64_t a2, int a3)
{
}

uint64_t sub_10000CE48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + v2) - *(unsigned __int8 *)(a2 + v2);
    if ((_DWORD)v3) {
      break;
    }
    if ((_DWORD)++v2 == 6) {
      return 0LL;
    }
  }

  return v3;
}

char *identifierToStringWithBuffer(int a1, uint64_t a2, int a3, char *__str, int a5)
{
  int v8 = 3 * a3 + 4;
  size_t v9 = v8;
  if (__str && (uint64_t v10 = __str, v8 <= a5) || (uint64_t v10 = (char *)malloc(v8)) != 0LL)
  {
    snprintf(v10, v9, "%x%c", a1, 44LL);
    if (a3 >= 1)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (v11) {
          uint64_t v12 = ":";
        }
        else {
          uint64_t v12 = "";
        }
        snprintf(__stra, 4uLL, "%s%x", v12, *(unsigned __int8 *)(a2 + v11));
        strlcat(v10, __stra, v9);
        ++v11;
      }

      while (a3 != v11);
    }
  }

  return v10;
}

uint64_t SubnetDoesAllocate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t SubnetGetMaxLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t SubnetGetMinLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t SubnetGetOptionPtrAndLength(uint64_t a1, int a2, _DWORD *a3)
{
  if (a2 == 1)
  {
    *a3 = 4;
    return a1 + 12;
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 56);
    if (v4 < 1)
    {
      return 0LL;
    }

    else
    {
      for (uint64_t i = *(void *)(a1 + 48) + 8LL; *(_DWORD *)(i - 8) != a2; i += 16LL)
      {
        if (!--v4) {
          return 0LL;
        }
      }

      *a3 = *(_DWORD *)(i - 4);
      return *(void *)i;
    }
  }

uint64_t *SubnetListCreateWithArray(const void *a1)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
  {
    syslog(5, "subnets: type is not an array");
    return 0LL;
  }

  uint64_t v3 = (uint64_t *)malloc(0x20uLL);
  int v4 = v3;
  if (v3)
  {
    *(_OWORD *)uint64_t v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    sub_10000B80C(v3, (uint64_t)j__free_0, 0LL);
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v6 = 0LL;
      CFIndex v56 = Count;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
        int v58 = 0;
        CFTypeID v8 = CFDictionaryGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v8)
        {
          io_object_t v55 = "subnet element is not a dictionary";
          goto LABEL_97;
        }

        v62[0] = 0;
        Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"name");
        if (Value)
        {
          CFTypeID v10 = CFStringGetTypeID();
          if (CFGetTypeID(Value) != v10)
          {
            io_object_t v55 = "Invalid 'name' property";
            goto LABEL_97;
          }

          int v11 = sub_100008624(Value, 0LL, 0, 0);
          int v12 = v11 >= 2 ? v11 : 0;
        }

        else
        {
          int v12 = 0;
        }

        uint64_t v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"supernet");
        if (v13)
        {
          CFTypeID v14 = CFStringGetTypeID();
          if (CFGetTypeID(v13) != v14)
          {
            io_object_t v55 = "Invalid 'supernet' property";
            goto LABEL_97;
          }

          int v15 = sub_100008624(v13, 0LL, 0, 0);
          int v16 = v15 >= 2 ? v15 : 0;
          int v57 = v16;
          int v17 = v16 + v12;
        }

        else
        {
          int v57 = 0;
          int v17 = v12;
        }

        uint64_t v18 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_address");
        CFTypeID v19 = CFStringGetTypeID();
        uint64_t v20 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_mask");
        CFTypeID v21 = CFStringGetTypeID();
        if (!v20 || CFGetTypeID(v20) != v21 || !sub_100008844(v20, &v60))
        {
          io_object_t v55 = "Invalid/missing 'net_mask' property";
          goto LABEL_97;
        }

        uint64_t v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_range");
        CFTypeID v23 = CFArrayGetTypeID();
        if (!v22 || CFGetTypeID(v22) != v23)
        {
          io_object_t v55 = "Invalid/missing 'net_range' property";
          goto LABEL_97;
        }

        if (CFArrayGetCount((CFArrayRef)v22) != 2)
        {
          io_object_t v55 = "'net_range' property must specify 2 values";
          goto LABEL_97;
        }

        uint64_t v24 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 0LL);
        if (!sub_10000DCD0(v24) || !sub_100008844(v24, (in_addr *)&v59))
        {
          io_object_t v55 = "Invalid 'net_range' range start";
          goto LABEL_97;
        }

        int v25 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 1LL);
        if (!sub_10000DCD0(v25) || !sub_100008844(v25, (in_addr *)&v59 + 1))
        {
          io_object_t v55 = "Invalid 'net_range' range end";
          goto LABEL_97;
        }

        if ((v59 & v60.s_addr) != v61.s_addr)
        {
          io_object_t v55 = "'net_range' start not within subnet";
          goto LABEL_97;
        }

        if ((HIDWORD(v59) & v60.s_addr) != v61.s_addr)
        {
          io_object_t v55 = "'net_range' end not within subnet";
          goto LABEL_97;
        }

        if (bswap32(v59) > bswap32(HIDWORD(v59)))
        {
          io_object_t v55 = "'net_range' start > end";
          goto LABEL_97;
        }

        if (!v12)
        {
          uint64_t v26 = sub_10000CA08(v61.s_addr, v60.s_addr);
          Value = 0LL;
          int v12 = strlen(v26) + 1;
          v17 += v12;
        }

        uint64_t v27 = sub_10000DD10((const __CFDictionary *)ValueAtIndex, &v58);
        unsigned int v28 = v27;
        if (v27)
        {
          unsigned int v29 = (v58 + 7) & 0xFFFFFFF8;
          int v58 = v29 + 16 * CFArrayGetCount(v27);
          v17 += v58;
        }

        uint64_t v30 = (const char **)malloc(v17 + 64LL);
        *(_OWORD *)uint64_t v30 = 0u;
        *((_OWORD *)v30 + 1) = 0u;
        *((_OWORD *)v30 + 2) = 0u;
        *((_OWORD *)v30 + 3) = 0u;
        sub_10000E504((uint64_t)v30, (CFDictionaryRef)ValueAtIndex);
        in_addr_t s_addr = v60.s_addr;
        *((in_addr *)v30 + 2) = v61;
        *((_DWORD *)v30 + 3) = s_addr;
        v30[2] = v59;
        *((_BYTE *)v30 + 24) = sub_10000E5A0((const __CFDictionary *)ValueAtIndex);
        uint64_t v32 = (UInt8 *)(v30 + 8);
        if (v28)
        {
          *((_DWORD *)v30 + 14) = CFArrayGetCount(v28);
          uint64_t v33 = v58;
          v30[6] = (const char *)sub_10000E5FC(v28, (uint64_t)(v30 + 8), v58);
          v32 += v33;
          CFRelease(v28);
          int v34 = *((_DWORD *)v30 + 14);
          if (v34 >= 1)
          {
            int v35 = v30[6];
            int v36 = v35 + 8;
            int v37 = *((_DWORD *)v30 + 14);
            while (*((_DWORD *)v36 - 2) != 3)
            {
              v36 += 2;
              if (!--v37)
              {
                int v38 = 0LL;
                goto LABEL_49;
              }
            }

            int v38 = (int *)*v36;
LABEL_49:
            unsigned int v39 = v35 + 4;
            while (*((_DWORD *)v39 - 1) != 121)
            {
              v39 += 16;
              if (!--v34) {
                goto LABEL_65;
              }
            }

            if (v38)
            {
              uint64_t v40 = *(void *)(v39 + 4);
              if (v40)
              {
                unsigned int v41 = *(_DWORD *)v39;
                if (!*(_BYTE *)v40 && v41 >= 5)
                {
                  int v43 = *v38;
                  if (!*(_DWORD *)(v40 + 1) && v43 != 0) {
                    *(_DWORD *)(v40 + 1) = v43;
                  }
                }
              }
            }
          }
        }

LABEL_65:
        char *v30 = (const char *)v32;
        if (Value)
        {
          sub_100008624(Value, v32, v12, 0);
        }

        else
        {
          uint64_t v45 = sub_10000CA08(v61.s_addr, v60.s_addr);
          strncpy((char *)v32, v45, v12);
        }

        if (v57)
        {
          sub_100008624(v13, &v32[v12], v57, 0);
          v30[5] = (const char *)&v32[v12];
        }

        *((_DWORD *)v30 + 9) = (_DWORD)v59;
        int v46 = sub_1000090D4(v4);
        if (v46 >= 1)
        {
          int v47 = v46;
          uint64_t v48 = 0LL;
          while (1)
          {
            uint64_t v49 = sub_10000B8A4(v4, v48);
            unsigned int v50 = *(_DWORD *)(v49 + 16);
            unsigned int v51 = *((_DWORD *)v30 + 4);
            if (v51 == v50) {
              break;
            }
            unsigned int v52 = bswap32(v51);
            unsigned int v53 = bswap32(v50);
            if (v52 < v53)
            {
              if (bswap32(*((_DWORD *)v30 + 5)) < v53)
              {
                sub_10000B8A0(v4, v30, v48);
                goto LABEL_79;
              }

              break;
            }

            if (bswap32(*(_DWORD *)(v49 + 20)) >= v52) {
              break;
            }
            uint64_t v48 = (v48 + 1);
            if (v47 == (_DWORD)v48) {
              goto LABEL_76;
            }
          }

          syslog(5, "subnets: '%s' net_range overlaps with subnet '%s'", *v30, *(const char **)v49);
          free(v30);
LABEL_98:
          sub_10000B840(v4);
          free(v4);
          return 0LL;
        }

LABEL_76:
        sub_10000B89C(v4, v30);
LABEL_79:
        if (++v6 == v56) {
          return v4;
        }
      }

      io_object_t v55 = "Invalid/missing 'net_address' property";
LABEL_97:
      __strlcpy_chk(v62, v55, 256LL, 256LL);
      syslog(5, "subnets: create failed, %s", v62);
      goto LABEL_98;
    }
  }

  return v4;
}

void SubnetListFree(uint64_t **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      sub_10000B840(*a1);
      free(v2);
      *a1 = 0LL;
    }
  }

void SubnetListPrintCFString(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000090D4(a2);
  int v5 = v4;
  CFStringAppendFormat(a1, 0LL, @"Subnets[%d]\n", v4);
  if (v5 >= 1)
  {
    uint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = sub_10000B8A4(a2, v6);
      uint64_t v6 = (v6 + 1);
      CFStringAppendFormat(a1, 0LL, @"%2d. ", v6);
      CFTypeID v8 = *(char **)v7;
      if (!*(void *)v7) {
        CFTypeID v8 = sub_10000CA08(*(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
      }
      CFStringAppendFormat(a1, 0LL, @"Subnet '%s'", v8);
      if (*(void *)(v7 + 40)) {
        CFStringAppendFormat(a1, 0LL, @": supernet %s\n", *(void *)(v7 + 40));
      }
      else {
        CFStringAppendFormat(a1, 0LL, @"\n", v20);
      }
      v9.in_addr_t s_addr = *(_DWORD *)(v7 + 8);
      CFTypeID v10 = inet_ntoa(v9);
      CFStringAppendFormat(a1, 0LL, @"\tNetwork: %s", v10);
      v11.in_addr_t s_addr = *(_DWORD *)(v7 + 12);
      int v12 = inet_ntoa(v11);
      CFStringAppendFormat(a1, 0LL, @"/%s\n", v12);
      v13.in_addr_t s_addr = *(_DWORD *)(v7 + 16);
      CFTypeID v14 = inet_ntoa(v13);
      CFStringAppendFormat(a1, 0LL, @"\tRange: %s..", v14);
      v15.in_addr_t s_addr = *(_DWORD *)(v7 + 20);
      int v16 = inet_ntoa(v15);
      CFStringAppendFormat(a1, 0LL, @"%s\n", v16);
      int v17 = "yes";
      if (!*(_BYTE *)(v7 + 24)) {
        int v17 = "no";
      }
      CFStringAppendFormat(a1, 0LL, @"\tAllocate: %s\n", v17);
      if (*(_BYTE *)(v7 + 24)) {
        CFStringAppendFormat( a1,  0LL,  @"\tLease Min: %d   Lease Max: %d\n",  *(unsigned int *)(v7 + 28),  *(unsigned int *)(v7 + 32));
      }
      if (*(_DWORD *)(v7 + 56))
      {
        CFStringAppendFormat(a1, 0LL, @"\tOptions:\n");
        CFStringAppendFormat(a1, 0LL, @"\t%6s %6s   %s\n", "Code", "Length", "Data");
        if (*(int *)(v7 + 56) >= 1)
        {
          uint64_t v18 = 0LL;
          uint64_t v19 = 0LL;
          do
          {
            CFStringAppendFormat( a1,  0LL,  @"\t%6d %6d   ",  *(unsigned int *)(*(void *)(v7 + 48) + v18),  *(unsigned int *)(*(void *)(v7 + 48) + v18 + 4));
            sub_10000CE40(a1, *(void *)(*(void *)(v7 + 48) + v18 + 8), *(_DWORD *)(*(void *)(v7 + 48) + v18 + 4));
            CFStringAppendFormat(a1, 0LL, @"\n");
            ++v19;
            v18 += 16LL;
          }

          while (v19 < *(int *)(v7 + 56));
        }
      }
    }

    while ((_DWORD)v6 != v5);
  }

uint64_t SubnetListAcquireAddress( uint64_t a1, _DWORD *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  int v8 = *a2;
  int v9 = sub_1000090D4(a1);
  if (v9 < 1) {
    return 0LL;
  }
  int v10 = v9;
  uint64_t v11 = 0LL;
  while (1)
  {
    uint64_t v12 = sub_10000B8A4(a1, v11);
    if ((*(_DWORD *)(v12 + 12) & v8) == *(_DWORD *)(v12 + 8)) {
      break;
    }
    uint64_t v11 = (v11 + 1);
    if (v10 == (_DWORD)v11) {
      return 0LL;
    }
  }

  uint64_t v13 = v12;
  int v14 = sub_1000090D4(a1);
  if (v14 < 1) {
    return 0LL;
  }
  int v15 = v14;
  int v25 = a2;
  uint64_t v16 = 0LL;
  int v26 = v14;
  while (1)
  {
    uint64_t v17 = sub_10000B8A4(a1, v16);
    uint64_t v18 = v17;
    if (v17 != v13 && (*(_DWORD *)(v17 + 12) & v8) != *(_DWORD *)(v17 + 8))
    {
      uint64_t v22 = *(const char **)(v17 + 40);
      if (!v22) {
        goto LABEL_21;
      }
      CFTypeID v23 = *(const char **)(v13 + 40);
      if (!v23 || strcmp(v22, v23)) {
        goto LABEL_21;
      }
    }

    if (!*(_BYTE *)(v18 + 24)) {
      goto LABEL_21;
    }
    unsigned int v19 = bswap32(*(_DWORD *)(v18 + 20));
    unsigned int v20 = bswap32(*(_DWORD *)(v18 + 36));
    if (v20 == v19 + 1) {
      unsigned int v20 = bswap32(*(_DWORD *)(v18 + 16));
    }
    if (v20 <= v19) {
      break;
    }
LABEL_17:
    int v15 = v26;
    *(_DWORD *)(v18 + 36) = bswap32(v19 + 1);
LABEL_21:
    uint64_t v16 = (v16 + 1);
    if ((_DWORD)v16 == v15) {
      return 0LL;
    }
  }

  if (a3)
  {
    while (1)
    {
      uint64_t v21 = bswap32(v20);
      if ((a3(a4, v21) & 1) == 0) {
        break;
      }
      if (++v20 > v19) {
        goto LABEL_17;
      }
    }
  }

  else
  {
    LODWORD(v21) = bswap32(v20);
  }

  _DWORD *v25 = v21;
  *(_DWORD *)(v18 + 36) = v21;
  return v18;
}

uint64_t SubnetListGetSubnetForAddress(uint64_t a1, unsigned int a2, int a3)
{
  int v6 = sub_1000090D4(a1);
  if (a3) {
    uint64_t v7 = (unsigned int (*)(uint64_t, void))sub_10000DB94;
  }
  else {
    uint64_t v7 = (unsigned int (*)(uint64_t, void))sub_10000DB80;
  }
  if (v6 < 1) {
    return 0LL;
  }
  int v8 = v6;
  uint64_t v9 = 0LL;
  while (1)
  {
    uint64_t v10 = sub_10000B8A4(a1, v9);
    if (v7(v10, a2)) {
      break;
    }
    uint64_t v9 = (v9 + 1);
    if (v8 == (_DWORD)v9) {
      return 0LL;
    }
  }

  return v10;
}

BOOL sub_10000DB80(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 12) & a2) == *(_DWORD *)(a1 + 8);
}

BOOL sub_10000DB94(_DWORD *a1, unsigned int a2)
{
  if ((a1[3] & a2) == a1[2] && (unsigned int v2 = bswap32(a2), v2 >= bswap32(a1[4]))) {
    return v2 <= bswap32(a1[5]);
  }
  else {
    return 0LL;
  }
}

BOOL SubnetListAreAddressesOnSameSupernet(uint64_t a1, int a2, int a3)
{
  int v6 = sub_1000090D4(a1);
  if (v6 < 1)
  {
LABEL_5:
    uint64_t v10 = 0LL;
  }

  else
  {
    int v7 = v6;
    uint64_t v8 = 0LL;
    while (1)
    {
      uint64_t v9 = sub_10000B8A4(a1, v8);
      if ((*(_DWORD *)(v9 + 12) & a2) == *(_DWORD *)(v9 + 8)) {
        break;
      }
      uint64_t v8 = (v8 + 1);
      if (v7 == (_DWORD)v8) {
        goto LABEL_5;
      }
    }

    uint64_t v10 = v9;
  }

  int v11 = sub_1000090D4(a1);
  if (v11 < 1) {
    return 0LL;
  }
  int v12 = v11;
  uint64_t v13 = 0LL;
  while (1)
  {
    uint64_t v14 = sub_10000B8A4(a1, v13);
    if ((*(_DWORD *)(v14 + 12) & a3) == *(_DWORD *)(v14 + 8)) {
      break;
    }
    uint64_t v13 = (v13 + 1);
    if (v12 == (_DWORD)v13) {
      return 0LL;
    }
  }

  if (!v10) {
    return 0LL;
  }
  if (v10 != v14)
  {
    if (*(void *)(v10 + 40))
    {
      int v15 = *(const char **)(v14 + 40);
      if (v15) {
        return strcmp(*(const char **)(v10 + 40), v15) == 0;
      }
    }

    return 0LL;
  }

  return 1LL;
}

const void *sub_10000DCD0(const void *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1) {
    return 0LL;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0LL;
}

__CFArray *sub_10000DD10(const __CFDictionary *a1, _DWORD *a2)
{
  *a2 = 0;
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0LL;
  }
  CFIndex v5 = Count;
  in_addr v60 = a2;
  size_t v6 = 8 * Count;
  int v7 = (const void **)malloc(8 * Count);
  uint64_t v8 = (const void **)malloc(v6);
  CFDictionaryGetKeysAndValues(a1, v7, v8);
  theArray = CFArrayCreateMutable(0LL, v5, &kCFTypeArrayCallBacks);
  if (v5 >= 1)
  {
    uint64_t v9 = 0LL;
    int v62 = 0;
    while (1)
    {
      uint64_t v10 = (const __CFString *)v7[v9];
      ValueAtIndex = (const __CFString *)v8[v9];
      if (!CFStringHasPrefix(v10, @"dhcp_")) {
        goto LABEL_35;
      }
      v67.CFIndex length = CFStringGetLength(v10) - 5;
      v67.CFIndex location = 5LL;
      int v12 = (char *)sub_100008A50(v10, v67, 0x8000100u);
      if (!v12) {
        goto LABEL_35;
      }
      uint64_t v13 = v12;
      unsigned int v14 = sub_100009044(v12);
      unsigned int valuePtr = v14;
      if (v14 == 1) {
        goto LABEL_34;
      }
      unsigned int v15 = v14;
      if (v14 == -1)
      {
        syslog(5, "subnets: unrecognized option '%s'");
        goto LABEL_34;
      }

      __str[0] = 0;
      CFTypeID TypeID = CFDataGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == TypeID)
      {
        uint64_t v17 = (const __CFData *)CFRetain(ValueAtIndex);
      }

      else
      {
        uint64_t v21 = (unsigned int *)sub_10000902C(v15);
        if (!v21)
        {
          uint64_t v30 = "Unknown tag";
          goto LABEL_28;
        }

        uint64_t v22 = (int *)v21;
        CFTypeID v23 = sub_100008B50(*v21);
        int v24 = *v22;
        if (!v23)
        {
          snprintf(__str, 0x100uLL, "Unknown type %d");
          goto LABEL_33;
        }

        int v25 = v23;
        CFTypeID v26 = CFArrayGetTypeID();
        if (!ValueAtIndex)
        {
          CFStringGetTypeID();
LABEL_32:
          CFNumberGetTypeID();
          CFBooleanGetTypeID();
          CFArrayGetTypeID();
          goto LABEL_33;
        }

        if (CFGetTypeID(ValueAtIndex) != v26) {
          goto LABEL_21;
        }
        if (!CFArrayGetCount((CFArrayRef)ValueAtIndex))
        {
          uint64_t v30 = "Empty array";
LABEL_28:
          __strlcpy_chk(__str, v30, 256LL, 256LL);
LABEL_33:
          syslog(5, "subnets: Failed to convert '%s': %s");
          goto LABEL_34;
        }

        if (!*((_DWORD *)v25 + 4))
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, 0LL);
          CFTypeID v27 = CFStringGetTypeID();
          if (!ValueAtIndex) {
            goto LABEL_32;
          }
        }

        else
        {
LABEL_21:
          CFTypeID v27 = CFStringGetTypeID();
        }

        if (CFGetTypeID(ValueAtIndex) == v27)
        {
          if (*((_DWORD *)v25 + 1) && (v28 = v24 == 12, int v24 = *((_DWORD *)v25 + 1), v28))
          {
            unsigned int v29 = "Type requires IP address pairs";
          }

          else
          {
            switch(v24)
            {
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
                if ((sub_1000088F4(ValueAtIndex, v65) & 1) == 0)
                {
                  unsigned int v29 = "Invalid IP number";
                  break;
                }

                Copy = sub_10000E73C(v24, *(unsigned int *)v65);
                if (!Copy)
                {
                  uint64_t v33 = "Failed to convert to numeric";
LABEL_73:
                  __strlcpy_chk(__str, v33, 256LL, 256LL);
                }

                goto LABEL_13;
              case 9:
                uint64_t v17 = sub_100008B38(ValueAtIndex);
                goto LABEL_12;
              case 10:
                if ((sub_100008844(ValueAtIndex, (in_addr *)v65) & 1) != 0)
                {
                  uint64_t v17 = CFDataCreate(0LL, v65, 4LL);
                  goto LABEL_12;
                }

                unsigned int v29 = "Invalid IP address";
                break;
              case 13:
                Copy = sub_10000A2A4(ValueAtIndex);
                if (Copy) {
                  goto LABEL_13;
                }
                uint64_t v33 = "Failed to encode DNS search";
                goto LABEL_73;
              default:
                snprintf(__str, 0x100uLL, "Failed to convert from string to %s", *((const char **)v25 + 1));
                goto LABEL_76;
            }
          }

LABEL_75:
          __strlcpy_chk(__str, v29, 256LL, 256LL);
LABEL_76:
          Copy = 0LL;
          goto LABEL_13;
        }

        CFTypeID v31 = CFNumberGetTypeID();
        if (CFGetTypeID(ValueAtIndex) != v31)
        {
          CFTypeID v32 = CFBooleanGetTypeID();
          if (CFGetTypeID(ValueAtIndex) != v32)
          {
            CFTypeID v36 = CFArrayGetTypeID();
            if (CFGetTypeID(ValueAtIndex) != v36) {
              goto LABEL_33;
            }
            CFIndex v37 = CFArrayGetCount((CFArrayRef)ValueAtIndex);
            uint64_t v38 = v37;
            switch(v24)
            {
              case 7:
              case 8:
                theData = CFDataCreateMutable(0LL, v37 * *(int *)v25);
                if (v38 < 1) {
                  goto LABEL_64;
                }
                CFIndex v39 = 0LL;
                while (1)
                {
                  uint64_t v40 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v39);
                  if ((sub_100008990(v40, v65) & 1) == 0) {
                    break;
                  }
                  if (*(_DWORD *)v25 == 1)
                  {
                    bytes[0] = v65[0];
                    unsigned int v41 = theData;
                    CFIndex v42 = 1LL;
                  }

                  else
                  {
                    *(_WORD *)bytes = bswap32(*(unsigned __int16 *)v65) >> 16;
                    unsigned int v41 = theData;
                    CFIndex v42 = 2LL;
                  }

                  CFDataAppendBytes(v41, bytes, v42);
                  if (v38 == ++v39)
                  {
LABEL_64:
                    int v43 = theData;
                    Copy = CFDataCreateCopy(0LL, theData);
                    goto LABEL_92;
                  }
                }

                __strlcpy_chk(__str, "Invalid number", 256LL, 256LL);
                Copy = 0LL;
                int v43 = theData;
LABEL_92:
                unsigned int v53 = v43;
                goto LABEL_100;
              case 11:
                goto LABEL_79;
              case 12:
                if ((v37 & 1) != 0)
                {
                  uint64_t v30 = "Type requires pairs of IP address values";
                  goto LABEL_28;
                }

LABEL_79:
                CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 4 * v37);
                uint64_t v45 = Mutable;
                if (v38 < 1) {
                  goto LABEL_85;
                }
                CFIndex v46 = 0LL;
                uint64_t v57 = v38;
                theDataa = Mutable;
                break;
              case 13:
                Copy = sub_10000A21C((const __CFArray *)ValueAtIndex, 1);
                if (Copy) {
                  goto LABEL_14;
                }
                uint64_t v30 = "Failed to encode DNS search";
                goto LABEL_28;
              case 14:
                uint64_t v49 = (unsigned __int8 *)sub_10000B01C((const __CFArray *)ValueAtIndex, v65);
                if (!v49) {
                  goto LABEL_76;
                }
                unsigned int v50 = v49;
                unsigned int v51 = (const UInt8 *)sub_10000A9A8(v49, *(int *)v65, 0LL, (int *)bytes);
                if (v51)
                {
                  unsigned int v52 = (UInt8 *)v51;
                  Copy = CFDataCreate(0LL, v51, *(int *)bytes);
                  free(v52);
                }

                else
                {
                  Copy = 0LL;
                }

                free(v50);
                goto LABEL_13;
              default:
                snprintf(__str, 0x100uLL, "Can't convert array to %s");
                goto LABEL_33;
            }

            while (1)
            {
              int v47 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v46);
              CFTypeID v48 = CFStringGetTypeID();
              if (!v47 || CFGetTypeID(v47) != v48)
              {
                uint64_t v54 = "Can't convert non-string to IP address";
                goto LABEL_98;
              }

              if ((sub_100008844(v47, (in_addr *)v65) & 1) == 0) {
                break;
              }
              uint64_t v45 = theDataa;
              CFDataAppendBytes(theDataa, v65, 4LL);
              if (v57 == ++v46)
              {
LABEL_85:
                Copy = CFDataCreateCopy(0LL, v45);
                goto LABEL_99;
              }
            }

            uint64_t v54 = "Invalid IP address";
LABEL_98:
            __strlcpy_chk(__str, v54, 256LL, 256LL);
            Copy = 0LL;
            uint64_t v45 = theDataa;
LABEL_99:
            unsigned int v53 = v45;
LABEL_100:
            CFRelease(v53);
            goto LABEL_13;
          }
        }

        if (*((_DWORD *)v25 + 1))
        {
          BOOL v28 = v24 == 12;
          int v24 = *((_DWORD *)v25 + 1);
          if (v28)
          {
            unsigned int v29 = "Type requires pairs of IP address values";
            goto LABEL_75;
          }
        }

        CFTypeID v34 = CFBooleanGetTypeID();
        if (CFGetTypeID(ValueAtIndex) == v34)
        {
          unsigned int v35 = CFEqual(ValueAtIndex, kCFBooleanTrue) != 0;
          *(_DWORD *)char v65 = v35;
        }

        else
        {
          if (!CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, v65))
          {
            unsigned int v29 = "Failed to convert to numeric";
            goto LABEL_75;
          }

          unsigned int v35 = *(_DWORD *)v65;
        }

        uint64_t v17 = sub_10000E73C(v24, v35);
      }

LABEL_12:
      Copy = v17;
LABEL_13:
      if (!Copy) {
        goto LABEL_33;
      }
LABEL_14:
      v62 += CFDataGetLength(Copy);
      unsigned int v19 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFNumberRef v20 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v19, @"Tag", v20);
      CFRelease(v20);
      CFDictionarySetValue(v19, @"Data", Copy);
      CFRelease(Copy);
      CFArrayAppendValue(theArray, v19);
      CFRelease(v19);
LABEL_34:
      free(v13);
LABEL_35:
      if (++v9 == v5) {
        goto LABEL_102;
      }
    }
  }

  int v62 = 0;
LABEL_102:
  free(v7);
  free(v8);
  io_object_t v55 = theArray;
  if (!CFArrayGetCount(theArray))
  {
    CFRelease(theArray);
    return 0LL;
  }

  _DWORD *v60 = v62;
  return v55;
}

uint64_t sub_10000E504(uint64_t a1, CFDictionaryRef theDict)
{
  Value = (const __CFString *)CFDictionaryGetValue(theDict, @"lease_max");
  int v5 = sub_100008990(Value, &v10);
  int v6 = v10;
  if (!v5) {
    int v6 = 86400;
  }
  *(_DWORD *)(a1 + 32) = v6;
  int v7 = (const __CFString *)CFDictionaryGetValue(theDict, @"lease_min");
  uint64_t result = sub_100008990(v7, &v10);
  unsigned int v9 = v10;
  if (!v10) {
    unsigned int v9 = 3600;
  }
  if (!(_DWORD)result) {
    unsigned int v9 = 3600;
  }
  *(_DWORD *)(a1 + 28) = v9;
  if (*(_DWORD *)(a1 + 32) < v9) {
    *(_DWORD *)(a1 + 32) = v9;
  }
  return result;
}

BOOL sub_10000E5A0(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"allocate");
  CFTypeID TypeID = CFBooleanGetTypeID();
  return Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
}

uint64_t sub_10000E5FC(const __CFArray *a1, uint64_t a2, int a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v7 = 16 * Count;
  if (16 * Count > (unint64_t)a3)
  {
    syslog(5, "copyOptionsDataArrayToOptionTLVList %d < %d");
    return 0LL;
  }

  CFIndex v8 = Count;
  if (Count >= 1)
  {
    CFIndex v9 = 0LL;
    unsigned int v10 = (char *)(a2 + v7);
    int v11 = a3 - v7;
    for (uint64_t i = (void *)(a2 + 8); ; i += 2)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v9);
      Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"Data");
      unsigned int v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Tag");
      CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
      int Length = CFDataGetLength(Value);
      *((_DWORD *)i - 2) = valuePtr;
      *((_DWORD *)i - 1) = Length;
      *uint64_t i = v10;
      if (v11 < Length) {
        break;
      }
      BytePtr = CFDataGetBytePtr(Value);
      memcpy(v10, BytePtr, Length);
      v10 += Length;
      ++v9;
      v11 -= Length;
      if (v8 == v9) {
        return a2;
      }
    }

    syslog(5, "copyOptionsDataArrayToOptionTLVList option %d < %d");
    return 0LL;
  }

  return a2;
}

CFDataRef sub_10000E73C(int a1, unsigned int a2)
{
  uint64_t v10 = v2;
  uint64_t v11 = v3;
  switch(a1)
  {
    case 2:
      BOOL v8 = a2 != 0;
      goto LABEL_6;
    case 3:
      BOOL v8 = a2;
LABEL_6:
      uint64_t v4 = (UInt8 *)&v8;
      CFIndex v5 = 1LL;
      goto LABEL_8;
    case 4:
      *(_WORD *)bytes = bswap32(a2) >> 16;
      uint64_t v4 = bytes;
      CFIndex v5 = 2LL;
      goto LABEL_8;
    case 5:
    case 6:
      unsigned int v9 = bswap32(a2);
      uint64_t v4 = (UInt8 *)&v9;
      CFIndex v5 = 4LL;
LABEL_8:
      CFDataRef result = CFDataCreate(0LL, v4, v5);
      break;
    default:
      CFDataRef result = 0LL;
      break;
  }

  return result;
}

void *sub_10000E7D8(unsigned int a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x30uLL);
  if (v4)
  {
    void *v4 = sub_10000F414(a1, a2);
    v4[1] = v5;
    v4[4] = 0LL;
    v4[5] = 0LL;
  }

  return v4;
}

void sub_10000E828(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  free((void *)a1);
}

void *sub_10000E858(void *result)
{
  result[1] = 0LL;
  result[2] = 0LL;
  unsigned int *result = 0LL;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_10000E86C(uint64_t a1, int a2)
{
  if (a2 <= 10) {
    int v2 = 10;
  }
  else {
    int v2 = a2;
  }
  *(_DWORD *)(a1 + 16) = v2;
  int v3 = *(_DWORD *)(a1 + 20);
  int v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(void *)(a1 + 8) = 0LL;
      BOOL v8 = (void *)a1;
    }

    else
    {
      uint64_t v6 = *(void *)(a1 + 8);
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = *(void *)(v6 + 40);
        sub_10000E828(v7);
        --v4;
      }

      while (v4);
      *(void *)(a1 + 8) = v6;
      BOOL v8 = (void *)(v6 + 32);
      if (!v6) {
        BOOL v8 = (void *)a1;
      }
    }

    *BOOL v8 = 0LL;
    *(_DWORD *)(a1 + 2snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = *(_DWORD *)(a1 + 16);
  }

uint64_t sub_10000E8F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *(void *)(result + 32);
      sub_10000E828(result);
      uint64_t result = v3;
    }

    while (v3);
  }

  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  return result;
}

uint64_t *sub_10000E930(uint64_t *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *result;
    *(void *)(a2 + 32) = *result;
    *(void *)(a2 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0LL;
    if (v2) {
      uint64_t v3 = (void *)(v2 + 40);
    }
    else {
      uint64_t v3 = result + 1;
    }
    void *v3 = a2;
    unsigned int *result = a2;
    ++*((_DWORD *)result + 5);
  }

  return result;
}

uint64_t sub_10000E964(uint64_t *a1, char *__filename)
{
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v3 = fopen(__filename, "r");
  if (v3)
  {
    int v4 = v3;
    int v5 = 0;
    int v6 = 0;
LABEL_3:
    int v7 = v5;
    while (1)
    {
      int v8 = 1023;
      unsigned int v9 = __s;
      do
      {
        int v10 = fgetc(v4);
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }

      while (v10 != 10);
      if (v9 == __s) {
        break;
      }
      *unsigned int v9 = 0;
      ++v6;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v34))
      {
        int v5 = 1;
        if (v7 && v7 != 3)
        {
          fprintf(__stderrp, "unexpected '{' at line %d\n");
          goto LABEL_35;
        }

        goto LABEL_3;
      }

      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v34))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf(__stderrp, "unexpected '}' at line %d\n");
          goto LABEL_35;
        }

        int v5 = 3;
        if ((_DWORD)v25)
        {
          uint64_t v18 = sub_10000E7D8(v25, v26);
          if (v18)
          {
            uint64_t v20 = *a1;
            uint64_t v19 = a1[1];
            _DWORD v18[4] = 0LL;
            v18[5] = v19;
            uint64_t v21 = (void *)(v19 + 32);
            if (!v20) {
              uint64_t v21 = a1;
            }
            *uint64_t v21 = v18;
            a1[1] = (uint64_t)v18;
            ++*((_DWORD *)a1 + 5);
          }

          sub_10000F3AC((unsigned int *)&v25);
          int v5 = 3;
        }

        goto LABEL_3;
      }

      bzero(v31, 0x300uLL);
      int v11 = strlen(__s);
      int v12 = strchr(__s, 61);
      int v13 = strspn(__s, " \t\n");
      int v14 = v13;
      if (v13 != v11)
      {
        if (v12)
        {
          unsigned int v15 = (_DWORD)v12 - __s;
          unsigned int v16 = v15 - v13;
          if (v15 - v13 >= 0x80)
          {
            unsigned int v16 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v6);
            unsigned int v15 = (_DWORD)v12 - __s;
          }

          unsigned int v17 = v11 - v15 - 2;
          if (v17 >= 0x300)
          {
            unsigned int v17 = 767;
            fprintf(__stderrp, "value truncated to %d bytes at line %d\n", 767, v6);
          }

          __strncpy_chk(v32, &__s[v14], v16, 128LL);
          v32[v16] = 0;
          __strncpy_chk(v31, v12 + 1, v17, 768LL);
          v31[v17] = 0;
          *((void *)&v29 + 1) = 0LL;
          uint64_t v30 = 0LL;
          *(void *)&__int128 v29 = v32;
          sub_10000F5FC((uint64_t)&v29 + 8, v31, 0LL);
        }

        else
        {
          unsigned int v22 = ~v13 + v11;
          if (v22 >= 0x80)
          {
            unsigned int v22 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v6);
          }

          __strncpy_chk(v32, &__s[v14], v22, 128LL);
          v32[v22] = 0;
          *((void *)&v29 + 1) = 0LL;
          uint64_t v30 = 0LL;
          *(void *)&__int128 v29 = v32;
        }

        __int128 v27 = v29;
        uint64_t v28 = v30;
        sub_10000F1F4((int *)&v25, (uint64_t)&v27, 0xFFFFFFFFFFFFFFFFLL);
        sub_10000F594((void *)&v29 + 1);
        int v5 = 2;
        goto LABEL_3;
      }
    }

LABEL_35:
    fclose(v4);
  }

  else
  {
    perror(__filename);
  }

  sub_10000F3AC((unsigned int *)&v25);
  return 1LL;
}

uint64_t sub_10000ED14(unsigned int **a1, const char *a2)
{
  int v4 = fopen(__str, "w");
  if (v4)
  {
    int v5 = v4;
    for (uint64_t i = *a1; i; uint64_t i = (unsigned int *)*((void *)i + 4))
    {
      fwrite("{\n", 2uLL, 1uLL, v5);
      if (*i)
      {
        uint64_t v7 = 0LL;
        unint64_t v8 = 0LL;
        do
        {
          if (*(_DWORD *)(*((void *)i + 1) + v7 + 8)) {
            fprintf(v5, "\t%s=%s\n");
          }
          else {
            fprintf(v5, "\t%s\n");
          }
          ++v8;
          v7 += 24LL;
        }

        while (v8 < *i);
      }

      fwrite("}\n", 2uLL, 1uLL, v5);
    }

    fclose(v5);
    rename(__str, a2);
    return 1LL;
  }

  else
  {
    perror(__str);
    return 0LL;
  }

uint64_t sub_10000EE98(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a2 + 40);
    if (v2) {
      *(void *)(v2 + 32) = *(void *)(a2 + 32);
    }
    uint64_t v3 = *(void *)(a2 + 32);
    if (v3) {
      *(void *)(v3 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = v2;
    }
    if (*(void *)result == a2) {
      *(void *)uint64_t result = v3;
    }
    if (*(void *)(result + 8) == a2) {
      *(void *)(result + 8) = *(void *)(a2 + 40);
    }
    *(void *)(a2 + 32) = 0LL;
    *(void *)(a2 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0LL;
    --*(_DWORD *)(result + 20);
  }

  return result;
}

uint64_t *sub_10000EEF4(uint64_t *result, uint64_t a2)
{
  if (*result != a2)
  {
    uint64_t v3 = result;
    uint64_t result = (uint64_t *)sub_10000EE98((uint64_t)result, a2);
    if (a2)
    {
      uint64_t v4 = *v3;
      *(void *)(a2 + 32) = *v3;
      *(void *)(a2 + 4snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = 0LL;
      if (v4) {
        int v5 = (uint64_t *)(v4 + 40);
      }
      else {
        int v5 = v3 + 1;
      }
      *int v5 = a2;
      uint64_t *v3 = a2;
      ++*((_DWORD *)v3 + 5);
    }
  }

  return result;
}

void *sub_10000EF54( uint64_t *a1, const char *a2, unsigned int (*a3)(uint64_t, void), uint64_t a4, in_addr *a5, _DWORD *a6)
{
  if (a6) {
    *a6 = 0;
  }
  unsigned int v9 = (void *)*a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v10 = sub_10000F4FC(*v9, v9[1], "identifier", 0LL);
      if (v10 << 32 != 0xFFFFFFFF00000000LL)
      {
        int v11 = v10;
        uint64_t v12 = v9[1];
        uint64_t v13 = v12 + 24LL * (int)v10;
        int v15 = *(_DWORD *)(v13 + 8);
        int v14 = (_DWORD *)(v13 + 8);
        if (v15)
        {
          if (!a5 && !strcmp(**(const char ***)(v12 + 24LL * (int)v10 + 16), a2))
          {
            if (a6) {
              *a6 = 1;
            }
            goto LABEL_26;
          }

          uint64_t v16 = sub_10000F4FC(*v9, v12, "ip_address", 0LL);
          if (v16 << 32 != 0xFFFFFFFF00000000LL)
          {
            uint64_t v17 = v9[1];
            uint64_t v18 = v17 + 24LL * (int)v16;
            int v20 = *(_DWORD *)(v18 + 8);
            uint64_t v19 = (_DWORD *)(v18 + 8);
            if (v20)
            {
              if (*v14) {
                break;
              }
            }
          }
        }
      }

void *sub_10000F10C(uint64_t *a1, int a2)
{
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v5 = sub_10000F4FC(*v2, v2[1], "ip_address", 0LL);
      if (v5 << 32 != 0xFFFFFFFF00000000LL)
      {
        uint64_t v6 = v2[1];
        uint64_t v7 = v6 + 24LL * (int)v5;
        int v9 = *(_DWORD *)(v7 + 8);
        unint64_t v8 = (unsigned int *)(v7 + 8);
        if (v9) {
          break;
        }
      }

LABEL_10:
      uint64_t v2 = (void *)v2[4];
      if (!v2) {
        return v2;
      }
    }

    uint64_t v10 = 0LL;
    int v11 = (void *)(v6 + 24LL * (int)v5 + 16);
    while (!inet_aton(*(const char **)(*v11 + 8 * v10), &v14) || v14.s_addr != a2)
    {
    }

    sub_10000EEF4(a1, (uint64_t)v2);
  }

  return v2;
}

uint64_t sub_10000F1F4(int *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (void *)*((void *)a1 + 1);
  unsigned int v7 = *a1;
  unsigned int v8 = *a1 + 1;
  if (v6)
  {
    int v9 = (char *)realloc(v6, 24LL * v8);
    unsigned int v7 = *a1;
  }

  else
  {
    int v9 = (char *)malloc(24LL * v8);
  }

  *((void *)a1 + 1) = v9;
  unint64_t v10 = v7;
  if (v7 <= a3)
  {
    a3 = v7;
  }

  else
  {
    uint64_t v11 = 24LL * v7;
    do
    {
      uint64_t v12 = *((void *)a1 + 1) + v11;
      --v10;
      *(_OWORD *)uint64_t v12 = *(_OWORD *)(v12 - 24);
      *(void *)(v12 + 16) = *(void *)(v12 - 8);
      v11 -= 24LL;
    }

    while (v10 > a3);
    int v9 = (char *)*((void *)a1 + 1);
  }

  uint64_t v13 = (char **)&v9[24 * a3];
  in_addr v14 = *(const char **)a2;
  uint64_t v15 = *(void *)(a2 + 8);
  uint64_t v16 = *(const char ***)(a2 + 16);
  uint64_t v17 = strdup(v14);
  uint64_t result = sub_10000F498(v15, v16);
  *uint64_t v13 = v17;
  v13[1] = (char *)result;
  v13[2] = v19;
  ++*a1;
  return result;
}

void *sub_10000F2D8(int *a1, uint64_t a2)
{
  int v2 = a2;
  sub_10000F37C(*((void *)a1 + 1) + 24 * a2);
  int v4 = v2 + 1;
  int v5 = *a1;
  if (v2 + 1 < *a1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 24LL * v4;
    do
    {
      uint64_t v8 = *((void *)a1 + 1);
      uint64_t v9 = v8 + 24LL * v2;
      unint64_t v10 = (__int128 *)(v8 + v7);
      __int128 v11 = *v10;
      *(void *)(v9 + 16) = *((void *)v10 + 2);
      *(_OWORD *)uint64_t v9 = v11;
      int v2 = v6++;
      int v5 = *a1;
      v7 += 24LL;
    }

    while (*a1 > v6);
  }

  uint64_t v12 = (void *)*((void *)a1 + 1);
  *a1 = v5 - 1;
  uint64_t result = realloc(v12, 24LL * (v5 - 1));
  *((void *)a1 + 1) = result;
  return result;
}

void sub_10000F37C(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
  }

  sub_10000F594((void *)(a1 + 8));
}

void sub_10000F3AC(unsigned int *a1)
{
  int v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      uint64_t v3 = 0LL;
      unint64_t v4 = 0LL;
      do
      {
        sub_10000F37C(*((void *)a1 + 1) + v3);
        ++v4;
        v3 += 24LL;
      }

      while (v4 < *a1);
      int v2 = (void *)*((void *)a1 + 1);
    }

    free(v2);
    *(void *)a1 = 0LL;
    *((void *)a1 + 1) = 0LL;
  }

uint64_t sub_10000F414(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char *)malloc(24LL * a1);
  if (v3)
  {
    int v5 = v4 + 16;
    uint64_t v6 = (const char ***)(a2 + 16);
    uint64_t v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_10000F498(*(v6 - 1), *v6);
      *int v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }

    while (v7);
  }

  return v3;
}

uint64_t sub_10000F498(unsigned int a1, const char **a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char **)malloc(8LL * a1);
  if (v3)
  {
    int v5 = v4;
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }

    while (v6);
  }

  return v3;
}

uint64_t sub_10000F4FC(unsigned int a1, uint64_t a2, char *__s1, const char *a4)
{
  uint64_t v4 = a1;
  if (!a1) {
    return -1LL;
  }
  uint64_t v7 = 0LL;
  for (uint64_t i = (const char ***)(a2 + 16); strcmp(__s1, (const char *)*(i - 2)); i += 3)
  {
    if (v4 == ++v7) {
      return -1LL;
    }
  }

  if (a4)
  {
    uint64_t v9 = *((unsigned int *)i - 2);
    if ((_DWORD)v9)
    {
      for (uint64_t j = *i; strcmp(a4, *j); ++j)
      {
        if (!--v9) {
          return -1LL;
        }
      }

      return v7;
    }

    return -1LL;
  }

  return v7;
}

void sub_10000F594(void *a1)
{
  int v2 = (void *)a1[1];
  if (v2)
  {
    unint64_t v3 = *(unsigned int *)a1;
    if ((_DWORD)v3)
    {
      for (unint64_t i = 0LL; i < v3; ++i)
      {
        uint64_t v5 = a1[1];
        uint64_t v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(void *)(v5 + 8 * i) = 0LL;
          unint64_t v3 = *(unsigned int *)a1;
        }
      }

      int v2 = (void *)a1[1];
    }

    free(v2);
    *a1 = 0LL;
    a1[1] = 0LL;
  }

char *sub_10000F5FC(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 8);
  LODWORD(v7) = *(_DWORD *)a1;
  if (v6)
  {
    uint64_t v8 = realloc(v6, 8LL * (*(_DWORD *)a1 + 1));
    LODWORD(v7) = *(_DWORD *)a1;
  }

  else
  {
    uint64_t v8 = malloc(8LL * (v7 + 1));
  }

  *(void *)(a1 + 8) = v8;
  unint64_t v7 = v7;
  unint64_t v9 = v7;
  if (v7 > a3)
  {
    unint64_t v10 = v7;
    do
    {
      *(void *)(*(void *)(a1 + 8) + 8 * v1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = *(void *)(*(void *)(a1 + 8) + 8 * v10 - 8);
      --v10;
    }

    while (v10 > a3);
    uint64_t v8 = *(void **)(a1 + 8);
    unint64_t v9 = a3;
  }

  uint64_t result = strdup(a2);
  v8[v9] = result;
  *(_DWORD *)a1 = v7 + 1;
  return result;
}

void sub_10000F6B4(int *a1, char *__s1, const char *a3, _DWORD *a4)
{
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)a1;
  if (!*(void *)a1)
  {
LABEL_5:
    unint64_t v10 = -1LL;
LABEL_9:
    uint64_t v16 = 0LL;
    __int128 v15 = (unint64_t)__s1;
    if (a3) {
      sub_10000F5FC((uint64_t)&v15 + 8, a3, 0LL);
    }
    __int128 v13 = v15;
    uint64_t v14 = v16;
    sub_10000F1F4(a1, (uint64_t)&v13, v10);
    sub_10000F594((void *)&v15 + 1);
    if (a4) {
      *a4 = 1;
    }
    return;
  }

  unint64_t v10 = 0LL;
  uint64_t v11 = *((void *)a1 + 1);
  uint64_t v12 = (const char **)v11;
  while (strcmp(__s1, *v12))
  {
    ++v10;
    v12 += 3;
    if (v9 == v10) {
      goto LABEL_5;
    }
  }

  if (!a3 || sub_10000F4FC(v8, v11, __s1, a3) != v10)
  {
    sub_10000F2D8(a1, v10);
    goto LABEL_9;
  }

uint64_t sub_10000F7C8(uint64_t result, char *__s1, _DWORD *a3)
{
  uint64_t v3 = *(unsigned int *)result;
  if (*(_DWORD *)result)
  {
    uint64_t v6 = (int *)result;
    uint64_t v7 = 0LL;
    for (unint64_t i = *(const char ***)(result + 8); ; i += 3)
    {
      uint64_t result = strcmp(__s1, *i);
      if (!(_DWORD)result) {
        break;
      }
      v7 += (uint64_t)&_mh_execute_header;
      if (!--v3) {
        return result;
      }
    }

    if (v7 != 0xFFFFFFFF00000000LL)
    {
      uint64_t result = (uint64_t)sub_10000F2D8(v6, v7 >> 32);
      if (a3) {
        *a3 = 1;
      }
    }
  }

  return result;
}

void hostfree(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  if (!v3) {
    uint64_t v3 = a1;
  }
  void *v3 = *a2;
  if (*a2) {
    *(void *)(*a2 + 8LL) = a2[1];
  }
  uint64_t v4 = (void *)a2[35];
  if (v4)
  {
    free(v4);
    a2[35] = 0LL;
  }

  uint64_t v5 = (void *)a2[36];
  if (v5) {
    free(v5);
  }
  free(a2);
}

_OWORD *hostadd( uint64_t *a1, _OWORD *a2, char a3, uint64_t a4, unsigned int a5, _DWORD *a6, const char *a7, const char *a8)
{
  uint64_t v16 = malloc(0x140uLL);
  uint64_t v17 = v16;
  if (v16)
  {
    v16[18] = 0u;
    v16[19] = 0u;
    char v16[16] = 0u;
    v16[17] = 0u;
    v16[14] = 0u;
    v16[15] = 0u;
    v16[12] = 0u;
    v16[13] = 0u;
    v16[10] = 0u;
    v16[11] = 0u;
    v16[8] = 0u;
    v16[9] = 0u;
    v16[6] = 0u;
    v16[7] = 0u;
    v16[4] = 0u;
    v16[5] = 0u;
    v16[2] = 0u;
    v16[3] = 0u;
    *uint64_t v16 = 0u;
    v16[1] = 0u;
    if (a2) {
      *(_OWORD *)((char *)v16 + 296) = *a2;
    }
    *((_BYTE *)v16 + 2snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = a3;
    *((_BYTE *)v16 + 21) = a5;
    if (a5 >= 0x100) {
      uint64_t v18 = 256LL;
    }
    else {
      uint64_t v18 = a5;
    }
    __memmove_chk((char *)v16 + 22, a4, v18, 298LL);
    if (a6) {
      *((_DWORD *)v17 + 4) = *a6;
    }
    if (a7) {
      *((void *)v17 + 35) = strdup(a7);
    }
    if (a8) {
      *((void *)v17 + 36) = strdup(a8);
    }
    uint64_t v19 = *a1;
    *(void *)uint64_t v17 = *a1;
    *((void *)v17 + 1) = 0LL;
    if (v19) {
      *(void *)(v19 + 8) = v17;
    }
    *a1 = (uint64_t)v17;
  }

  return v17;
}

_DWORD *inetroute_list_init()
{
  CFTypeID v23 = 0LL;
  *(_OWORD *)int v24 = xmmword_100010D10;
  uint64_t v25 = 1LL;
  if (sysctl(v24, 6u, 0LL, &__size, 0LL, 0LL) < 0)
  {
    perror("route-sysctl-estimate");
    goto LABEL_47;
  }

  uint64_t v0 = (unsigned __int16 *)malloc(__size);
  if (!v0)
  {
LABEL_47:
    inetroute_list_free(&v23);
    return 0LL;
  }

  int v1 = v0;
  if (sysctl(v24, 6u, v0, &__size, 0LL, 0LL) < 0)
  {
    perror("sysctl of routing table");
    goto LABEL_46;
  }

  int v2 = malloc(0x18uLL);
  CFTypeID v23 = v2;
  v2[4] = -1;
  *int v2 = 0;
  uint64_t v3 = malloc(0x38uLL);
  *((void *)v2 + 1) = v3;
  if (!v3)
  {
LABEL_46:
    free(v1);
    goto LABEL_47;
  }

  if ((uint64_t)__size >= 1)
  {
    int v4 = 0;
    unint64_t v5 = (unint64_t)v1 + __size;
    int v6 = 2;
    uint64_t v7 = v1;
    do
    {
      uint64_t v8 = v7 + 46;
      int v9 = *((_DWORD *)v7 + 3);
      if ((v9 & 1) != 0)
      {
        uint64_t v14 = (*v8 & 0xFC) + 4LL;
        if ((*v8 & 3) == 0) {
          uint64_t v14 = *v8;
        }
        if (*v8) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 4LL;
        }
        unint64_t v10 = v7 + 46;
        v8 += v15;
        if ((v9 & 2) != 0)
        {
LABEL_9:
          uint64_t v11 = (*v8 & 0xFC) + 4LL;
          if ((*v8 & 3) == 0) {
            uint64_t v11 = *v8;
          }
          if (*v8) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 4LL;
          }
          __int128 v13 = v8;
          v8 += v12;
          goto LABEL_22;
        }
      }

      else
      {
        unint64_t v10 = 0LL;
        if ((v9 & 2) != 0) {
          goto LABEL_9;
        }
      }

      __int128 v13 = 0LL;
LABEL_22:
      if ((v9 & 4) != 0) {
        uint64_t v16 = v8;
      }
      else {
        uint64_t v16 = 0LL;
      }
      if (v10 && (v9 & 4) != 0 && *((_BYTE *)v10 + 1) == 2 && v13 && (v7[4] & 4) == 0)
      {
        if (v4 == v6)
        {
          int v6 = 2 * v4;
          uint64_t v17 = realloc(*((void **)v2 + 1), 56LL * v4);
          *((void *)v2 + 1) = v17;
          if (!v17) {
            goto LABEL_46;
          }
          int v4 = *v2;
        }

        else
        {
          uint64_t v17 = (_DWORD *)*((void *)v2 + 1);
        }

        int v18 = v4;
        uint64_t v19 = (char *)&v17[7 * v4];
        *(void *)uint64_t v19 = 0LL;
        *((void *)v19 + 1) = 0LL;
        *((_DWORD *)v19 + 6) = 0;
        *((void *)v19 + 2) = 0LL;
        *(_DWORD *)uint64_t v19 = *((_DWORD *)v10 + 1);
        if (*v16) {
          v17[7 * v18 + 1] = *((_DWORD *)v16 + 1);
        }
        if ((*((_BYTE *)v7 + 11) & 1) == 0 && !*((_DWORD *)v10 + 1)) {
          v2[4] = *v2;
        }
        __int128 v20 = *(_OWORD *)v13;
        if (v13[1] == 18) {
          v17[7 * v18 + 6] = *((_DWORD *)v13 + 4);
        }
        *(_OWORD *)&v17[7 * v18 + 2] = v20;
        int v4 = *v2 + 1;
        *int v2 = v4;
      }

      uint64_t v7 = (unsigned __int16 *)((char *)v7 + *v7);
    }

    while ((unint64_t)v7 < v5);
  }

  free(v1);
  return v2;
}

void inetroute_list_free(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        free(v3);
        int v2 = *a1;
      }

      v2[1] = 0LL;
      free(*a1);
      *a1 = 0LL;
    }
  }

uint64_t inetroute_default(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 == -1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 8) + 28LL * v1;
  int v3 = *(unsigned __int8 *)(v2 + 9);
  uint64_t v4 = v2 + 12;
  if (v3 == 2) {
    return v4;
  }
  else {
    return 0LL;
  }
}

void inetroute_list_print_cfstr(__CFString *a1, int *a2)
{
  if (*a2 >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = *((void *)a2 + 1) + v4;
      int v7 = *(unsigned __int8 *)(v6 + 9);
      uint64_t v8 = sub_10000CA08(*(_DWORD *)v6, *(_DWORD *)(v6 + 4));
      int v9 = v8;
      if (v7 == 18)
      {
        CFStringAppendFormat(a1, 0LL, @"%s ==> link %d\n", v8, *(unsigned __int16 *)(v6 + 10));
      }

      else
      {
        unint64_t v10 = inet_ntop(2, (const void *)(v6 + 12), v11, 0x10u);
        CFStringAppendFormat(a1, 0LL, @"%s ==> %s\n", v9, v10);
      }

      ++v5;
      v4 += 28LL;
    }

    while (v5 < *a2);
  }

ssize_t sub_10000FE04( int a1, _WORD *a2, const char *a3, int a4, uint64_t a5, int a6, int a7, unsigned int a8, unsigned __int16 a9, void *a10, int a11)
{
  if ((byte_100019508 & 1) == 0)
  {
    byte_100019508 = 1;
    dword_10001950C = arc4random();
  }

  if ((a4 == 24 || a4 == 1) && (a5 || a6 == -1))
  {
    int v20 = sub_1000101F8((uint64_t)a3);
    if (v20 < 0)
    {
      return 0xFFFFFFFFLL;
    }

    else
    {
      int v21 = v20;
      CFIndex v46 = a3;
      unsigned int v48 = a9;
      if (a4 == 24)
      {
        *(void *)a2 = -1LL;
        a2[8] = 8;
        unsigned int v22 = (char *)(a2 + 9);
        CFTypeID v23 = (char *)(a2 + 13);
        int v24 = a2 + 23;
        int v25 = 46;
      }

      else
      {
        unsigned int v22 = (char *)(a2 + 7);
        CFTypeID v23 = (char *)(a2 + 11);
        int v24 = a2 + 21;
        if (a6 == -1)
        {
          int v31 = -1;
          a2[2] = -1;
        }

        else
        {
          int v31 = *(_DWORD *)a5;
          a2[2] = *(_WORD *)(a5 + 4);
        }

        *(_DWORD *)a2 = v31;
        a2[6] = 8;
        int v25 = 42;
      }

      int v32 = v25 + a11;
      memmove(v24, a10, a11);
      *(_DWORD *)CFTypeID v23 = a7;
      *((_DWORD *)v23 + 1) = a6;
      *((_WORD *)v23 + 4) = 4352;
      unsigned int v33 = bswap32(a11 + 8) >> 16;
      *((_WORD *)v23 + 5) = v33;
      *((_WORD *)v22 + 1snprintf(__str, 0x100uLL, "/dev/bpf%d", 0) = __rev16(v48);
      *((_WORD *)v22 + 11) = __rev16(a8);
      *((_DWORD *)v22 + 6) = (unsigned __int16)v33;
      *((_WORD *)v22 + 13) = sub_10000B8A8(v23, a11 + 20);
      *(void *)unsigned int v22 = 0LL;
      *((void *)v22 + 1) = 0LL;
      char *v22 = 69;
      *((_DWORD *)v22 + 2) = 4607;
      *((_DWORD *)v22 + 3) = a7;
      *((_DWORD *)v22 + 4) = a6;
      *((_WORD *)v22 + 1) = bswap32(a11 + 28) >> 16;
      unsigned int v34 = dword_10001950C++;
      *((_WORD *)v22 + 2) = bswap32(v34) >> 16;
      *((_WORD *)v22 + 5) = sub_10000B8A8(v22, 20);
      ssize_t v19 = sub_100008500(v21, a2, v32);
      if ((v19 & 0x80000000) != 0)
      {
        uint64_t v35 = sub_10001052C();
        uint64_t v36 = _SC_syslog_os_log_mapping(3LL);
        if (__SC_log_enabled(3LL, v35, v36))
        {
          uint64_t v37 = _os_log_pack_size(28LL);
          uint64_t v38 = (char *)&v45 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
          CFIndex v39 = __error();
          uint64_t v40 = _os_log_pack_fill( v38,  v37,  *v39,  &_mh_execute_header,  "bpf_write(%s) failed: %s (%d)",  v45,  v46,  v47);
          unsigned int v41 = __error();
          CFIndex v42 = strerror(*v41);
          int v43 = *__error();
          *(_DWORD *)uint64_t v40 = 136315650;
          *(void *)(v40 + 4) = v46;
          *(_WORD *)(v40 + 12) = 2080;
          *(void *)(v40 + 14) = v42;
          *(_WORD *)(v40 + 22) = 1024;
          *(_DWORD *)(v40 + 24) = v43;
          __SC_log_send(3LL, v35, v36, v38);
        }
      }

      sub_100008300(v21);
    }
  }

  else if (a1 < 0)
  {
    uint64_t v26 = sub_10001052C();
    uint64_t v27 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v26, v27))
    {
      uint64_t v28 = _os_log_pack_size(2LL);
      __int128 v29 = (char *)&v45 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v30 = __error();
      *(_WORD *)_os_log_pack_fill( v29,  v28,  *v30,  &_mh_execute_header,  "neither bpf nor socket send available") = 0;
      __SC_log_send(3LL, v26, v27, v29);
    }

    return 0LL;
  }

  else
  {
    *(void *)&v49.sa_data[6] = 0LL;
    *(_WORD *)&v49.sa_len = 528;
    *(_WORD *)v49.sa_data = __rev16(a8);
    *(_DWORD *)&v49.sa_data[2] = a6;
    if (sendto(a1, a10, a11, 0, &v49, 0x10u) >= a11) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return v19;
}

uint64_t sub_1000101F8(uint64_t a1)
{
  uint64_t v2 = sub_100008310();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) != 0)
  {
    uint64_t v13 = sub_10001052C();
    uint64_t v14 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v13, v14))
    {
      uint64_t v15 = _os_log_pack_size(18LL);
      uint64_t v16 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = __error();
      uint64_t v18 = _os_log_pack_fill( v16,  v15,  *v17,  &_mh_execute_header,  "Transmitter: bpf_fd() failed, %s (%d)",  v32,  (_DWORD)v33);
      ssize_t v19 = __error();
      int v20 = strerror(*v19);
      int v21 = *__error();
      *(_DWORD *)uint64_t v18 = 136315394;
      *(void *)(v18 + 4) = v20;
      *(_WORD *)(v18 + 12) = 1024;
      *(_DWORD *)(v18 + 14) = v21;
      __SC_log_send(3LL, v13, v14, v16);
    }
  }

  else
  {
    if ((sub_100008490(v2) & 0x80000000) != 0)
    {
      uint64_t v22 = sub_10001052C();
      uint64_t v23 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v22, v23))
      {
        uint64_t v24 = _os_log_pack_size(18LL);
        int v25 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v26 = __error();
        uint64_t v27 = _os_log_pack_fill( v25,  v24,  *v26,  &_mh_execute_header,  "Transmitter: failed to set filter, %s (%d)",  v32,  (_DWORD)v33);
        uint64_t v28 = __error();
        __int128 v29 = strerror(*v28);
        int v30 = *__error();
        *(_DWORD *)uint64_t v27 = 136315394;
        *(void *)(v27 + 4) = v29;
        *(_WORD *)(v27 + 12) = 1024;
        *(_DWORD *)(v27 + 14) = v30;
        __SC_log_send(3LL, v22, v23, v25);
      }

      goto LABEL_11;
    }

    if ((sub_100008418(v3, a1) & 0x80000000) != 0)
    {
      if (*__error() != 6)
      {
        uint64_t v4 = sub_10001052C();
        uint64_t v5 = _SC_syslog_os_log_mapping(3LL);
        if (__SC_log_enabled(3LL, v4, v5))
        {
          uint64_t v6 = _os_log_pack_size(28LL);
          int v7 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v8 = __error();
          uint64_t v9 = _os_log_pack_fill( v7,  v6,  *v8,  &_mh_execute_header,  "Transmitter: bpf_setif (%s) failed: %s (%d)",  v32,  v33,  v34);
          unint64_t v10 = __error();
          uint64_t v11 = strerror(*v10);
          int v12 = *__error();
          *(_DWORD *)uint64_t v9 = 136315650;
          *(void *)(v9 + 4) = a1;
          *(_WORD *)(v9 + 12) = 2080;
          *(void *)(v9 + 14) = v11;
          *(_WORD *)(v9 + 22) = 1024;
          *(_DWORD *)(v9 + 24) = v12;
          __SC_log_send(3LL, v4, v5, v7);
        }
      }

LABEL_11:
      sub_100008300(v3);
      return 0xFFFFFFFFLL;
    }
  }

  return v3;
}

uint64_t sub_10001052C()
{
  return qword_100019510;
}