uint64_t sub_100002B6C()
{
  uint64_t v0;
  uint64_t v1;
  os_log_s *LogHandle;
  os_log_type_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  v0 = 0LL;
  while (1)
  {
    v1 = EAPClientModuleAddBuiltinModule(*(_UNKNOWN **)((char *)&off_100010670 + v0));
    if ((_DWORD)v1) {
      break;
    }
    v0 += 16LL;
    if ((_DWORD)v0 == 160) {
      return v1;
    }
  }

  LogHandle = (os_log_s *)EAPLogGetLogHandle();
  v3 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(LogHandle, v3))
  {
    v4 = *(uint64_t *)((char *)&off_100010670 + v0 + 8);
    v6 = 136315394;
    v7 = v4;
    v8 = 1024;
    v9 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v3,  "EAPClientAddBuiltinModule(%s) failed %d",  (uint8_t *)&v6,  0x12u);
  }

  return v1;
}

void start(int a1, char *const *a2)
{
  __int128 theDict = 0uLL;
  uint64_t v107 = 0LL;
  unsigned int v106 = -1;
  int v4 = getopt(a1, a2, "c:g:i:lu:") << 24;
  if (v4 == -16777216) {
    goto LABEL_2;
  }
  v98 = 0LL;
  v99 = 0LL;
  int v5 = 0;
  int v6 = 0;
  gid_t v7 = -1;
  int v8 = -1;
  do
  {
    HIDWORD(v9) = (v4 >> 24) - 99;
    LODWORD(v9) = HIDWORD(v9);
    switch((v9 >> 1))
    {
      case 0u:
        v98 = optarg;
        break;
      case 2u:
        if ((v5 & 1) != 0) {
          goto LABEL_2;
        }
        gid_t v7 = strtoul(optarg, 0LL, 0);
        int v5 = 1;
        break;
      case 3u:
        if (v99) {
          goto LABEL_2;
        }
        v99 = optarg;
        break;
      case 9u:
        if ((v6 & 1) != 0) {
          goto LABEL_2;
        }
        int v8 = strtoul(optarg, 0LL, 0);
        int v6 = 1;
        break;
      default:
        goto LABEL_2;
    }

    int v4 = getopt(a1, a2, "c:g:i:lu:") << 24;
  }

  while (v4 != -16777216);
  if (optind != a1 || v99 == 0LL)
  {
LABEL_2:
    fprintf(__stderrp, "usage:\n%s -i <if_name> [ -u <uid> ] [ -g <gid> ]\n", *(const char **)a2);
    exit(64);
  }

  uid_t v11 = v8;
  if (v8 == -1) {
    uid_t v11 = getuid();
  }
  if (v7 == -1) {
    gid_t v7 = getgid();
  }
  EAPLogInit(2LL);
  int v12 = EAPOLClientEstablishSession(v99);
  if (((v5 | v6) & 1) != 0 && !getuid())
  {
    if ((v5 & 1) != 0)
    {
      uint64_t v13 = setgid(v7);
      if ((v13 & 0x80000000) != 0)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle(v13, v14, v15, v16);
        os_log_type_t v18 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(LogHandle, v18)) {
          goto LABEL_32;
        }
        v19 = __error();
        v20 = strerror(*v19);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v102 = v7;
        *(_WORD *)&v102[4] = 2080;
        *(void *)&v102[6] = v20;
        v21 = "setgid(%d) failed, %s";
        goto LABEL_31;
      }
    }

    if ((v6 & 1) != 0)
    {
      uint64_t v22 = setuid(v11);
      if ((v22 & 0x80000000) != 0)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle(v22, v23, v24, v25);
        os_log_type_t v18 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(LogHandle, v18)) {
          goto LABEL_32;
        }
        v26 = __error();
        v27 = strerror(*v26);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v102 = v11;
        *(_WORD *)&v102[4] = 2080;
        *(void *)&v102[6] = v27;
        v21 = "setuid(%d) failed, %s";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v18, v21, buf, 0x12u);
LABEL_32:
        sub_100003478(77);
      }
    }
  }

  if (v12)
  {
    uint64_t v45 = execv(*(const char **)a2, a2);
    v49 = (os_log_s *)EAPLogGetLogHandle(v45, v46, v47, v48);
    os_log_type_t v50 = _SC_syslog_os_log_mapping(3LL);
    if (!os_log_type_enabled(v49, v50)) {
      goto LABEL_48;
    }
    v51 = __error();
    v52 = strerror(*v51);
    *(_DWORD *)buf = 136315138;
    *(void *)v102 = v52;
    v53 = "exec failed, %s";
    v54 = v49;
    os_log_type_t v55 = v50;
    uint32_t v56 = 12;
    goto LABEL_47;
  }

  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v29 = (const __SCPreferences *)EAPOLControlPrefsInit(Current, sub_1000034F0);
  uint64_t v30 = sub_1000034F8(v29, 0);
  int v31 = v30;
  v35 = (os_log_s *)EAPLogGetLogHandle(v30, v32, v33, v34);
  os_log_type_t v36 = _SC_syslog_os_log_mapping(5LL);
  BOOL v37 = os_log_type_enabled(v35, v36);
  if (v31)
  {
    if (v37)
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v102 = v99;
      *(_WORD *)&v102[8] = 1024;
      *(_DWORD *)&v102[10] = v11;
      __int16 v103 = 1024;
      gid_t v104 = v7;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s START uid %d gid %d", buf, 0x18u);
    }

    v57 = (os_log_s *)EAPLogGetLogHandle(v37, v38, v39, v40);
    os_log_type_t v58 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v57, v58))
    {
LABEL_44:
      uint64_t v59 = LinkAddresses_create();
      uint64_t v107 = v59;
      if (!v59)
      {
        v63 = (os_log_s *)EAPLogGetLogHandle(0LL, v60, v61, v62);
        os_log_type_t v64 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(v63, v64)) {
          goto LABEL_48;
        }
        *(_WORD *)buf = 0;
        v53 = "Could not build interface list";
        v54 = v63;
        os_log_type_t v55 = v64;
        uint32_t v56 = 2;
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v54, v55, v53, buf, v56);
LABEL_48:
        exit(71);
      }

      uint64_t v65 = LinkAddresses_lookup(v59, v99);
      if (!v65)
      {
        v69 = (os_log_s *)EAPLogGetLogHandle(0LL, v66, v67, v68);
        os_log_type_t v70 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(v69, v70)) {
          goto LABEL_60;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v102 = v99;
        v71 = "interface '%s' does not exist";
        goto LABEL_59;
      }

      if (*(_BYTE *)(v65 + 4) != 6)
      {
        v69 = (os_log_s *)EAPLogGetLogHandle(v65, v66, v67, v68);
        os_log_type_t v70 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(v69, v70)) {
          goto LABEL_60;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v102 = v99;
        v71 = "interface '%s' is not ethernet";
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v69, v70, v71, buf, 0xCu);
LABEL_60:
        exit(78);
      }

      CFTypeID v72 = (CFTypeID)sub_10000A304(v99, (int *)(v65 + *(unsigned __int8 *)(v65 + 5) + 8), &theDict);
      *(void *)v105 = v72;
      if (!v72)
      {
        v76 = (os_log_s *)EAPLogGetLogHandle(0LL, v73, v74, v75);
        os_log_type_t v77 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(v76, v77))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v102 = v99;
          _os_log_impl((void *)&_mh_execute_header, v76, v77, "EAPOLSocketSourceCreate(%s) failed", buf, 0xCu);
        }

        goto LABEL_56;
      }

      if (v98)
      {
        if ((void)theDict)
        {
          CFTypeID v72 = fprintf(__stderrp, "Ignoring -c %s\n", v98);
        }

        else
        {
          v78 = (const void *)my_CFPropertyListCreateFromFile(v98);
          *((void *)&theDict + 1) = v78;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (!v78 || (v80 = TypeID, CFTypeID v72 = CFGetTypeID(v78), v72 != v80))
          {
            fprintf(__stderrp, "contents of file %s invalid\n", v98);
            my_CFRelease((char *)&theDict + 8);
            sub_100003478(78);
          }
        }
      }

      if (theDict == 0)
      {
        v81 = (os_log_s *)EAPLogGetLogHandle(v72, v73, v74, v75);
        os_log_type_t v82 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(v81, v82))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v102 = v99;
          _os_log_impl((void *)&_mh_execute_header, v81, v82, "%s: config/control dictionary missing", buf, 0xCu);
        }
      }

      else if (!sub_100002B6C())
      {
        uint64_t v83 = sub_10000B4CC(*(uint64_t *)v105, (CFDictionaryRef)theDict, &v106);
        if (v83)
        {
          v89 = (void *)v83;
          if (!(void)theDict)
          {
            char v100 = 0;
            uint64_t v90 = sub_10000374C(v83, *((const __CFDictionary **)&theDict + 1), &v100);
            v94 = (os_log_s *)EAPLogGetLogHandle(v90, v91, v92, v93);
            os_log_type_t v95 = _SC_syslog_os_log_mapping(5LL);
            if (os_log_type_enabled(v94, v95))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v94,  v95,  "Supplicant_update_configuration says we should stop - exiting",  buf,  2u);
            }

            exit(69);
          }

          setsid();
          chdir("/");
          my_CFRelease(&theDict);
          my_CFRelease((char *)&theDict + 8);
          sub_100005080(v89, v106, v96, v97);
          LinkAddresses_free(&v107);
          CFRunLoopRun();
          sub_100003478(0);
        }

        v87 = (os_log_s *)EAPLogGetLogHandle(0LL, v84, v85, v86);
        os_log_type_t v88 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(v87, v88))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v87, v88, "EAPOLSocketSourceCreateSupplicant failed", buf, 2u);
        }

        sub_10000B408((uint64_t *)v105);
LABEL_56:
        sub_100003478(69);
      }

      sub_100003478(70);
    }

    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v102 = v31;
    v41 = "Verbose mode enabled (LogFlags 0x%x)";
    v42 = v57;
    os_log_type_t v43 = v58;
    uint32_t v44 = 8;
  }

  else
  {
    if (!v37) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)v102 = v99;
    *(_WORD *)&v102[8] = 1024;
    *(_DWORD *)&v102[10] = v11;
    __int16 v103 = 1024;
    gid_t v104 = v7;
    v41 = "%s START uid %d gid %d";
    v42 = v35;
    os_log_type_t v43 = v36;
    uint32_t v44 = 24;
  }

  _os_log_impl((void *)&_mh_execute_header, v42, v43, v41, buf, v44);
  goto LABEL_44;
}

void sub_100003478(int a1)
{
  BOOL v2 = sub_10000C750(1);
  if (v2)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v2, v3, v4, v5);
    os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v7))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "exit", v8, 2u);
    }
  }

  exit(a1);
}

uint64_t sub_1000034F0(const __SCPreferences *a1)
{
  return sub_1000034F8(a1, 1);
}

uint64_t sub_1000034F8(const __SCPreferences *a1, int a2)
{
  uint64_t LogFlags = EAPOLControlPrefsGetLogFlags();
  sub_10000C624(LogFlags, a2);
  if (a1)
  {
    sub_100008F84(a1);
    uint64_t v5 = sub_100007434(a1);
    EAPOLControlPrefsSynchronize(v5);
  }

  return LogFlags;
}

void sub_10000354C(uint64_t a1)
{
  BOOL v2 = (uint64_t *)a1;
  sub_1000035E0(a1);
  sub_100009488(*(void *)(a1 + 24));
  sub_100008B94(*(void *)(a1 + 16));
  if (*(_DWORD *)a1 == 4)
  {
    *(_DWORD *)a1 = 6;
    *(_DWORD *)(a1 + 488) = 0;
    sub_1000035E0(a1);
    sub_100009490(*(void *)(a1 + 24), 2, 0LL, 0);
    sub_100007508((unsigned int *)a1);
  }

  sub_10000364C(&v2);
}

uint64_t sub_1000035E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 280);
  if (v2)
  {
    EAPClientModulePluginFree(v2, a1 + 288);
    *(void *)(a1 + 280) = 0LL;
    my_CFRelease(a1 + 368);
    *(void *)(a1 + 432) = 0LL;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
  }

  my_CFRelease(a1 + 440);
  uint64_t result = my_CFRelease(a1 + 448);
  *(_DWORD *)(a1 + 456) = 0;
  *(void *)(a1 + 464) = 0LL;
  return result;
}

void sub_10000364C(uint64_t **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      sub_100008B5C(v2 + 2);
      my_CFRelease(v2 + 5);
      my_CFRelease(v2 + 6);
      my_CFRelease(v2 + 7);
      my_CFRelease(v2 + 8);
      my_CFRelease(v2 + 9);
      my_CFRelease(v2 + 11);
      my_CFRelease(v2 + 27);
      uint64_t v3 = (CFTypeRef *)v2[12];
      if (v3)
      {
        CFRelease(v3[1]);
        CFRelease(*v3);
        free(v3);
      }

      v2[12] = 0LL;
      my_CFRelease(v2 + 14);
      my_CFRelease(v2 + 13);
      my_CFRelease(v2 + 23);
      uint64_t v4 = (void *)v2[16];
      if (v4) {
        free(v4);
      }
      uint64_t v5 = (void *)v2[18];
      if (v5) {
        free(v5);
      }
      int v6 = (void *)v2[20];
      if (v6) {
        free(v6);
      }
      my_CFRelease(v2 + 1);
      sub_100007024((uint64_t)(v2 + 24));
      sub_100007054((uint64_t)v2);
      sub_1000035E0((uint64_t)v2);
      free(v2);
    }

    *a1 = 0LL;
  }
}

uint64_t sub_10000374C(uint64_t a1, const __CFDictionary *a2, _BYTE *a3)
{
  if (a3) {
    *a3 = 0;
  }
  my_CFRelease(a1 + 240);
  Value = CFDictionaryGetValue(a2, @"ManagerName");
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    *(void *)(a1 + 240) = CFRetain(Value);
  }
  int v8 = CFDictionaryGetValue(a2, @"ClientItemID");
  if (!v8)
  {
    my_CFRelease(a1 + 224);
    my_CFRelease(a1 + 232);
    uint64_t v38 = CFDictionaryGetValue(a2, @"EAPClientConfiguration");
    CFTypeID v39 = CFDictionaryGetTypeID();
    if (v38)
    {
      if (CFGetTypeID(v38) == v39) {
        uint64_t v40 = v38;
      }
      else {
        uint64_t v40 = 0LL;
      }
    }

    else
    {
      uint64_t v40 = 0LL;
    }

    if (v40) {
      Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)v38;
    }
    else {
      Defaultuint64_t AuthenticationProperties = a2;
    }
    ID = CFDictionaryGetValue(a2, @"UniqueIdentifier");
    uint32_t v44 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_27;
  }

  unint64_t v9 = v8;
  CFTypeID v10 = CFDictionaryGetTypeID();
  CFTypeID v11 = CFGetTypeID(v9);
  if (v11 != v10)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v11, v12, v13, v14);
    os_log_type_t v42 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v42)) {
      goto LABEL_171;
    }
    *(_WORD *)v275 = 0;
    os_log_type_t v43 = "invalid item dict";
    goto LABEL_170;
  }

  my_CFRelease(a1 + 224);
  my_CFRelease(a1 + 232);
  uint64_t v15 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (!v15)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v16, v17, v18);
    os_log_type_t v42 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v42)) {
      goto LABEL_171;
    }
    *(_WORD *)v275 = 0;
    os_log_type_t v43 = "couldn't create configuration";
    goto LABEL_170;
  }

  uint64_t v19 = v15;
  uint64_t v20 = EAPOLClientItemIDCreateWithDictionary(v15, v9);
  *(void *)(a1 + 224) = v20;
  *(void *)(a1 + 232) = v19;
  if (!v20)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v21, v22, v23);
    os_log_type_t v42 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v42)) {
      goto LABEL_171;
    }
    *(_WORD *)v275 = 0;
    os_log_type_t v43 = "couldn't instantiate item";
    goto LABEL_170;
  }

  uint64_t v24 = EAPOLClientItemIDGetProfile();
  uint64_t v25 = v24;
  if (!v24)
  {
    Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)EAPOLClientConfigurationGetDefaultAuthenticationProperties(v19);
    ID = 0LL;
    goto LABEL_136;
  }

  uint64_t AuthenticationProperties = EAPOLClientProfileGetAuthenticationProperties(v24);
  if (!AuthenticationProperties)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v27, v28, v29);
    os_log_type_t v42 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v42)) {
      goto LABEL_171;
    }
    *(_WORD *)v275 = 0;
    os_log_type_t v43 = "profile has no authentication properties";
LABEL_170:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v42, v43, v275, 2u);
LABEL_171:
    uint64_t v137 = 0LL;
    if (a3) {
      *a3 = 1;
    }
    return v137;
  }

  Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)AuthenticationProperties;
  ID = (const void *)EAPOLClientProfileGetID(v25);
  uint64_t v276 = 0LL;
  memset(v275, 0, sizeof(v275));
  if (!*(void *)(a1 + 248))
  {
    notify_port[0] = 0;
    uint64_t v32 = notify_register_mach_port(kEAPOLClientConfigurationChangedNotifyKey, notify_port, 0, out_token);
    if ((_DWORD)v32)
    {
      os_log_type_t v36 = (os_log_s *)EAPLogGetLogHandle(v32, v33, v34, v35);
      os_log_type_t v37 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v36, v37))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "notify_register_mach_port() failed", buf, 2u);
      }

      goto LABEL_136;
    }

    *(void *)&v275[8] = a1;
    v205 = (__CFMachPort *)_SC_CFMachPortCreateWithPort("eapolclient", notify_port[0], sub_100007BD0, v275);
    if (v205)
    {
      v206 = v205;
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v205, 0LL);
      if (RunLoopSource)
      {
        v211 = RunLoopSource;
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v211, kCFRunLoopDefaultMode);
        CFRelease(v211);
        *(void *)(a1 + 248) = v206;
        *(_DWORD *)(a1 + 256) = out_token[0];
        goto LABEL_136;
      }

      v268 = (os_log_s *)EAPLogGetLogHandle(0LL, v208, v209, v210);
      os_log_type_t v269 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v268, v269))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v268, v269, "CFMachPortCreateRunLoopSource() failed", buf, 2u);
      }

      CFRelease(v206);
    }

    notify_cancel(out_token[0]);
  }

LABEL_136:
  uint32_t v44 = CFDictionaryGetValue(a2, @"EAPClientConfiguration");
  CFTypeID v143 = CFDictionaryGetTypeID();
  if (v44 && CFGetTypeID(v44) != v143) {
    uint32_t v44 = 0LL;
  }
LABEL_27:
  my_CFRelease(a1 + 40);
  CFDictionaryRef Copy = CFDictionaryCreateCopy(0LL, a2);
  *(void *)(a1 + 40) = Copy;
  if (!*(void *)(a1 + 96))
  {
    *(_BYTE *)(a1 + 500) = 0;
    v49 = (os_log_s *)EAPLogGetLogHandle(Copy, v46, v47, v48);
    os_log_type_t v50 = _SC_syslog_os_log_mapping(6LL);
    CFDictionaryRef Copy = (CFDictionaryRef)os_log_type_enabled(v49, v50);
    if ((_DWORD)Copy)
    {
      if (*(_BYTE *)(a1 + 500)) {
        v51 = "is";
      }
      else {
        v51 = "is not";
      }
      *(_DWORD *)v275 = 136315138;
      *(void *)&v275[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "in-box auth %s requested", v275, 0xCu);
    }
  }

  *(_BYTE *)(a1 + 501) = 0;
  v52 = (os_log_s *)EAPLogGetLogHandle(Copy, v46, v47, v48);
  os_log_type_t v53 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v52, v53))
  {
    if (*(_BYTE *)(a1 + 501)) {
      v54 = "is";
    }
    else {
      v54 = "is not";
    }
    *(_DWORD *)v275 = 136315138;
    *(void *)&v275[4] = v54;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "factory ota auth %s requested", v275, 0xCu);
  }

  *(_BYTE *)(a1 + 499) = 0;
  os_log_type_t v55 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"UserName");
  BOOL v56 = sub_100005388((BOOL)v55);
  v57 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"UserPassword");
  BOOL v58 = sub_100005388((BOOL)v57);
  uint64_t v59 = (CFDictionaryRef *)(a1 + 48);
  my_CFRelease(a1 + 48);
  if (v56
    || v58
    || *(void *)(a1 + 56)
    || *(void *)(a1 + 64)
    || *(void *)(a1 + 96)
    || v25
    || *(_BYTE *)(a1 + 501)
    || v44
    || CFDictionaryContainsKey(DefaultAuthenticationProperties, @"ProfileID"))
  {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(0LL, 0LL, DefaultAuthenticationProperties);
    uint64_t v61 = MutableCopy;
    if (v56) {
      CFDictionaryRemoveValue(MutableCopy, @"UserName");
    }
    if (v58) {
      CFDictionaryRemoveValue(v61, @"UserPassword");
    }
    CFDictionaryRemoveValue(v61, @"ProfileID");
    if (v44) {
      CFDictionaryApplyFunction((CFDictionaryRef)v44, (CFDictionaryApplierFunction)sub_1000053D8, v61);
    }
    if (v25)
    {
      uint64_t v62 = (const void *)EAPOLClientProfileGetID(v25);
      CFDictionarySetValue(v61, @"ProfileID", v62);
    }

    v63 = *(const __CFDictionary **)(a1 + 56);
    if (v63) {
      CFDictionaryApplyFunction(v63, (CFDictionaryApplierFunction)sub_1000053D8, v61);
    }
    os_log_type_t v64 = *(const __CFDictionary **)(a1 + 64);
    if (v64) {
      CFDictionaryApplyFunction(v64, (CFDictionaryApplierFunction)sub_1000053D8, v61);
    }
    uint64_t v65 = *(const void ***)(a1 + 96);
    if (v65 && *v65) {
      CFDictionarySetValue(v61, @"TLSClientIdentityTrustChainCertificates", *v65);
    }
    if (*(_BYTE *)(a1 + 501))
    {
      uint64_t v66 = *(const void **)(a1 + 104);
      if (v66) {
        CFDictionarySetValue(v61, @"TLSClientIdentityTrustChainCertificates", v66);
      }
    }
  }

  else
  {
    uint64_t v61 = (__CFDictionary *)CFRetain(DefaultAuthenticationProperties);
  }

  *uint64_t v59 = v61;
  BOOL v67 = sub_10000C750(2);
  if (v67)
  {
    v71 = *v59;
    unint64_t v72 = (unint64_t)CFDictionaryGetValue(*v59, @"UserPassword");
    unint64_t v73 = (unint64_t)CFDictionaryGetValue(v71, @"NewPassword");
    if (v72 | v73)
    {
      unint64_t v74 = v73;
      uint64_t v75 = CFDictionaryCreateMutableCopy(0LL, 0LL, v71);
      v76 = v75;
      if (v72) {
        CFDictionarySetValue(v75, @"UserPassword", @"XXXXXXXX");
      }
      if (v74) {
        CFDictionarySetValue(v76, @"NewPassword", @"XXXXXXXX");
      }
      os_log_type_t v77 = (const void *)my_CFPropertyListCopyAsXMLString(v76);
      v78 = v76;
    }

    else
    {
      uint64_t v85 = CFDictionaryGetValue(v71, @"TLSClientIdentityTrustChainCertificates");
      CFTypeID v86 = CFArrayGetTypeID();
      if (!v85 || CFGetTypeID(v85) != v86 || !CFArrayGetCount((CFArrayRef)v85)) {
        goto LABEL_82;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)v85);
      Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      if (Count >= 1)
      {
        for (CFIndex i = 0LL; i != Count; ++i)
        {
          ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex((CFArrayRef)v85, i);
          CFDataRef v91 = SecCertificateCopyData(ValueAtIndex);
          CFArrayAppendValue(Mutable, v91);
          CFRelease(v91);
        }
      }

      if (!Mutable)
      {
LABEL_82:
        uint64_t v79 = my_CFPropertyListCopyAsXMLString(v71);
        os_log_type_t v77 = (const void *)v79;
        if (!v79) {
          goto LABEL_86;
        }
        goto LABEL_83;
      }

      uint64_t v92 = CFDictionaryCreateMutableCopy(0LL, 0LL, v71);
      CFDictionarySetValue(v92, @"TLSClientIdentityTrustChainCertificates", Mutable);
      os_log_type_t v77 = (const void *)my_CFPropertyListCopyAsXMLString(v92);
      CFRelease(v92);
      v78 = Mutable;
    }

    CFRelease(v78);
    if (!v77) {
      goto LABEL_86;
    }
LABEL_83:
    uint64_t v93 = (os_log_s *)EAPLogGetLogHandle(v79, v80, v81, v82);
    os_log_type_t v94 = _SC_syslog_os_log_mapping(4294967289LL);
    if (os_log_type_enabled(v93, v94))
    {
      *(_DWORD *)v275 = 138412290;
      *(void *)&v275[4] = v77;
      _os_log_impl((void *)&_mh_execute_header, v93, v94, "update_configuration\n%@", v275, 0xCu);
    }

    CFRelease(v77);
    goto LABEL_86;
  }

  uint64_t v83 = (os_log_s *)EAPLogGetLogHandle(v67, v68, v69, v70);
  os_log_type_t v84 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v83, v84))
  {
    *(_WORD *)v275 = 0;
    _os_log_impl((void *)&_mh_execute_header, v83, v84, "update_configuration", v275, 2u);
  }

LABEL_86:
  ++*(_DWORD *)(a1 + 32);
  my_CFRelease(a1 + 88);
  if (ID)
  {
    CFTypeID v95 = CFStringGetTypeID();
    if (CFGetTypeID(ID) == v95) {
      *(void *)(a1 + 88) = CFRetain(ID);
    }
  }

  *(void *)buf = 0LL;
  if (!*v59)
  {
    CFArrayGetTypeID();
LABEL_122:
    sub_100007024(a1 + 192);
    uint64_t v137 = 1LL;
    goto LABEL_123;
  }

  uint64_t v96 = CFDictionaryGetValue(*v59, @"AcceptEAPTypes");
  CFTypeID v97 = CFArrayGetTypeID();
  if (!v96 || CFGetTypeID(v96) != v97) {
    goto LABEL_122;
  }
  v271 = (_DWORD **)(a1 + 192);
  sub_100007024(a1 + 192);
  CFIndex v98 = CFArrayGetCount((CFArrayRef)v96);
  if (!v98) {
    goto LABEL_144;
  }
  uint64_t v99 = v98;
  char v100 = malloc(4 * v98);
  if (v99 < 1) {
    goto LABEL_143;
  }
  CFIndex v101 = 0LL;
  int v102 = 0;
  int v103 = 0;
  v270 = v96;
  do
  {
    gid_t v104 = CFArrayGetValueAtIndex((CFArrayRef)v96, v101);
    CFTypeID v105 = CFNumberGetTypeID();
    if (!v104 || (v109 = v105, CFTypeID v105 = CFGetTypeID(v104), v105 != v109))
    {
      v127 = (os_log_s *)EAPLogGetLogHandle(v105, v106, v107, v108);
      os_log_type_t v128 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(v127, v128)) {
        goto LABEL_115;
      }
      *(_DWORD *)v275 = 67109120;
      *(_DWORD *)&v275[4] = v101;
      v129 = v127;
      os_log_type_t v130 = v128;
      v131 = "AcceptEAPTypes[%d] contains invalid type, ignoring";
      goto LABEL_113;
    }

    uint64_t v110 = CFNumberGetValue((CFNumberRef)v104, kCFNumberIntType, notify_port);
    if ((_DWORD)v110)
    {
      uint64_t v114 = EAPClientModuleLookup(notify_port[0]);
      if (v114)
      {
        int v118 = v103;
        if (v103 >= 1)
        {
          uint64_t v119 = 0LL;
          do
          {
            if (v100[v119] == notify_port[0])
            {
              v120 = (os_log_s *)EAPLogGetLogHandle(v114, v115, v116, v117);
              os_log_type_t v121 = _SC_syslog_os_log_mapping(5LL);
              uint64_t v114 = os_log_type_enabled(v120, v121);
              if ((_DWORD)v114)
              {
                uint64_t v122 = EAPTypeStr(notify_port[0]);
                *(_DWORD *)v275 = 67109890;
                *(_DWORD *)&v275[4] = v101;
                *(_WORD *)&v275[8] = 2080;
                *(void *)&v275[10] = v122;
                *(_WORD *)&v275[18] = 1024;
                *(_DWORD *)&v275[20] = notify_port[0];
                *(_WORD *)&v275[24] = 1024;
                *(_DWORD *)&v275[26] = v119;
                _os_log_impl( (void *)&_mh_execute_header,  v120,  v121,  "AcceptEAPTypes[%d] %s (%d) already specified at [%d], ignoring",  v275,  0x1Eu);
              }
            }

            ++v119;
          }

          while (v118 != v119);
        }

        mach_port_t v123 = notify_port[0];
        v100[v118] = notify_port[0];
        int v103 = v118 + 1;
        BOOL v124 = v123 > 0x2B;
        uint64_t v125 = (1LL << v123) & 0x80002200000LL;
        if (!v124 && v125 != 0) {
          ++v102;
        }
        uint64_t v96 = v270;
      }

      else
      {
        v135 = (os_log_s *)EAPLogGetLogHandle(0LL, v115, v116, v117);
        os_log_type_t v136 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(v135, v136))
        {
          *(_DWORD *)v275 = 67109376;
          *(_DWORD *)&v275[4] = v101;
          *(_WORD *)&v275[8] = 1024;
          *(_DWORD *)&v275[10] = notify_port[0];
          v129 = v135;
          os_log_type_t v130 = v136;
          v131 = "AcceptEAPTypes[%d] specifies unsupported type %d, ignoring";
          uint32_t v132 = 14;
          goto LABEL_114;
        }
      }
    }

    else
    {
      v133 = (os_log_s *)EAPLogGetLogHandle(v110, v111, v112, v113);
      os_log_type_t v134 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v133, v134))
      {
        *(_DWORD *)v275 = 67109120;
        *(_DWORD *)&v275[4] = v101;
        v129 = v133;
        os_log_type_t v130 = v134;
        v131 = "AcceptEAPTypes[%d] contains invalid number, ignoring";
LABEL_113:
        uint32_t v132 = 8;
LABEL_114:
        _os_log_impl((void *)&_mh_execute_header, v129, v130, v131, v275, v132);
      }
    }

LABEL_115:
    ++v101;
  }

  while (v101 != v99);
  uint64_t v59 = (CFDictionaryRef *)(a1 + 48);
  if (!v103)
  {
LABEL_143:
    free(v100);
    goto LABEL_144;
  }

  *(void *)(a1 + 192) = v100;
  *(_DWORD *)(a1 + 200) = v103;
  if (v102 == v103) {
    *(_BYTE *)(a1 + 208) = 1;
  }
LABEL_144:
  v144 = (const __CFArray *)CFDictionaryGetValue(*v59, @"InnerAcceptEAPTypes");
  CFTypeID v145 = CFArrayGetTypeID();
  if (v144)
  {
    if (CFGetTypeID(v144) == v145) {
      v146 = v144;
    }
    else {
      v146 = 0LL;
    }
  }

  else
  {
    v146 = 0LL;
  }

  uint64_t v147 = sub_10000A0E0(*(void *)(a1 + 24));
  if ((_DWORD)v147 == 1)
  {
    uint64_t v147 = sub_100007D28(*(const __CFDictionary **)(a1 + 48), @"OneTimeUserPassword", 0);
    *(_BYTE *)(a1 + 173) = v147;
    goto LABEL_153;
  }

  if ((_DWORD)v147 != 3)
  {
LABEL_153:
    uint64_t v151 = 1LL;
    goto LABEL_154;
  }

  uint64_t v151 = 3LL;
LABEL_154:
  if (!*(_BYTE *)(a1 + 175)
    && (v156 = CFDictionaryGetValue(*v59, @"UserName"), uint64_t v147 = CFStringGetTypeID(), v156)
    && (v157 = v147, uint64_t v147 = CFGetTypeID(v156), v147 == v157))
  {
    uint64_t v147 = my_CFStringToCString(v156, 134217984LL);
    v152 = (const char *)v147;
  }

  else
  {
    v152 = 0LL;
  }

  if (*(_BYTE *)(a1 + 174))
  {
LABEL_157:
    v153 = 0LL;
  }

  else
  {
    v158 = CFDictionaryGetValue(*v59, @"UserPassword");
    v159 = CFDictionaryGetValue(*v59, @"UserPasswordKeychainItemID");
    CFTypeID v160 = CFStringGetTypeID();
    if (v158 && CFGetTypeID(v158) == v160)
    {
      uint64_t v147 = my_CFStringToCString(v158, 134217984LL);
      v153 = (const char *)v147;
    }

    else
    {
      uint64_t v147 = CFStringGetTypeID();
      if (v159 && (v163 = v147, uint64_t v147 = CFGetTypeID(v159), v147 == v163))
      {
        *(void *)out_token = 0LL;
        *(void *)notify_port = 0LL;
        uint64_t v164 = EAPSecKeychainPasswordItemCopy(0LL, v159, out_token);
        if ((_DWORD)v164)
        {
          int v168 = v164;
          v169 = (os_log_s *)EAPLogGetLogHandle(v164, v165, v166, v167);
          os_log_type_t v170 = _SC_syslog_os_log_mapping(5LL);
          if (os_log_type_enabled(v169, v170))
          {
            *(_DWORD *)v275 = 134217984;
            *(void *)&v275[4] = v168;
            _os_log_impl( (void *)&_mh_execute_header,  v169,  v170,  "SecKeychainFindGenericPassword failed, %ld",  v275,  0xCu);
          }

          v153 = 0LL;
        }

        else
        {
          v153 = (const char *)sub_100007D88(*(const __CFData **)out_token);
        }

        my_CFRelease(out_token);
        uint64_t v147 = my_CFRelease(notify_port);
        if (!v153)
        {
          v265 = (os_log_s *)EAPLogGetLogHandle(v147, v148, v149, v150);
          os_log_type_t v266 = _SC_syslog_os_log_mapping(5LL);
          uint64_t v147 = os_log_type_enabled(v265, v266);
          if ((_DWORD)v147)
          {
            uint64_t v267 = sub_100009408(*(void *)(a1 + 24), 0LL);
            *(_DWORD *)v275 = 136315138;
            *(void *)&v275[4] = v267;
            _os_log_impl( (void *)&_mh_execute_header,  v265,  v266,  "%s: failed to retrieve password from keychain",  v275,  0xCu);
          }

          goto LABEL_157;
        }
      }

      else
      {
        if (v152) {
          goto LABEL_157;
        }
        uint64_t v147 = *(void *)(a1 + 224);
        if (v147
          && (*(void *)notify_port = 0LL,
              *(void *)v275 = 0LL,
              uint64_t v147 = EAPOLClientItemIDCopyPasswordItem(v147, v151, v275, notify_port),
              (_DWORD)v147))
        {
          if (*(void *)notify_port) {
            v153 = (const char *)sub_100007D88(*(const __CFData **)notify_port);
          }
          else {
            v153 = 0LL;
          }
          if (*(void *)v275) {
            v152 = (const char *)sub_100007D88(*(const __CFData **)v275);
          }
          else {
            v152 = 0LL;
          }
          my_CFRelease(v275);
          uint64_t v147 = my_CFRelease(notify_port);
        }

        else
        {
          v153 = 0LL;
          v152 = 0LL;
        }
      }
    }
  }

  if (*(_BYTE *)(a1 + 176))
  {
    BOOL v154 = 0;
    BOOL v155 = 0;
  }

  else
  {
    else {
      int v161 = sub_100007DE4(v146);
    }
    uint64_t v147 = sub_100007D28(*v59, @"TLSCertificateIsRequired", v161);
    BOOL v155 = v147 != 0;
    if (v161)
    {
      uint64_t v147 = (uint64_t)*v59;
      if (*v59)
      {
        v171 = CFDictionaryGetValue((CFDictionaryRef)v147, @"TLSMinimumVersion");
        CFTypeID v172 = CFStringGetTypeID();
        if (v171 && CFGetTypeID(v171) == v172) {
          uint64_t v147 = CFEqual(v171, @"1.3");
        }
        else {
          uint64_t v147 = 0LL;
        }
      }

      BOOL v154 = v147 != 0;
    }

    else
    {
      BOOL v154 = 0;
    }
  }

  v173 = (os_log_s *)EAPLogGetLogHandle(v147, v148, v149, v150);
  os_log_type_t v174 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(v173, v174))
  {
    v175 = "is not";
    if (v154) {
      v175 = "is";
    }
    *(_DWORD *)v275 = 136315138;
    *(void *)&v275[4] = v175;
    _os_log_impl((void *)&_mh_execute_header, v173, v174, "EAP identity privacy %s required", v275, 0xCu);
  }

  if (!v155)
  {
LABEL_222:
    BOOL v195 = 0;
    goto LABEL_238;
  }

  v176 = CFDictionaryGetValue(*v59, @"TLSIdentityHandle");
  if (v176)
  {
    uint64_t SecIdentity = EAPSecIdentityHandleCreateSecIdentity(v176, buf);
    if ((_DWORD)SecIdentity)
    {
      int v181 = SecIdentity;
      v182 = (os_log_s *)EAPLogGetLogHandle(SecIdentity, v178, v179, v180);
      os_log_type_t v183 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v182, v183))
      {
        *(_DWORD *)v275 = 134217984;
        *(void *)&v275[4] = v181;
        _os_log_impl( (void *)&_mh_execute_header,  v182,  v183,  "EAPSecIdentityHandleCreateSecIdentity failed, %ld",  v275,  0xCu);
      }
    }
  }

  if (!*(void *)buf)
  {
    uint64_t v184 = *(void *)(a1 + 224);
    if (v184) {
      *(void *)buf = EAPOLClientItemIDCopyIdentity(v184, v151);
    }
  }

  if (*(_BYTE *)(a1 + 500))
  {
    uint64_t v185 = *(void *)(a1 + 96);
    if (v185)
    {
      v186 = *(const void **)(v185 + 8);
      if (v186) {
        *(void *)buf = CFRetain(v186);
      }
    }
  }

  if (*(_BYTE *)(a1 + 501))
  {
    v187 = *(const void **)(a1 + 112);
    if (v187) {
      *(void *)buf = CFRetain(v187);
    }
  }

  my_CFRelease(a1 + 184);
  v188 = *(__SecIdentity **)buf;
  *(void *)(a1 + 184) = *(void *)buf;
  if (!v154)
  {
    BOOL v195 = 0;
    if (v152 || !v188) {
      goto LABEL_238;
    }
    uint64_t v196 = SecIdentityCopyCertificate(v188, (SecCertificateRef *)notify_port);
    if ((_DWORD)v196)
    {
      int v200 = v196;
      v201 = (os_log_s *)EAPLogGetLogHandle(v196, v197, v198, v199);
      os_log_type_t v202 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v201, v202))
      {
        *(_DWORD *)v275 = 134217984;
        *(void *)&v275[4] = v200;
        _os_log_impl( (void *)&_mh_execute_header,  v201,  v202,  "EAPSecIdentityHandleCreateSecIdentity failed, %ld",  v275,  0xCu);
      }
    }

    else
    {
      v213 = (const void *)EAPSecCertificateCopyUserNameString(*(void *)notify_port);
      CFRelease(*(CFTypeRef *)notify_port);
      if (v213)
      {
        v152 = (const char *)my_CFStringToCString(v213, 134217984LL);
        CFRelease(v213);
LABEL_237:
        BOOL v195 = v152 != 0LL;
        goto LABEL_238;
      }
    }

    v152 = 0LL;
    goto LABEL_237;
  }

  v189 = CFDictionaryGetValue(*v59, @"OuterIdentity");
  CFTypeID v190 = CFStringGetTypeID();
  if (v189)
  {
    CFTypeID v194 = v190;
    CFTypeID v190 = CFGetTypeID(v189);
    if (v190 == v194)
    {
      v152 = (const char *)my_CFStringToCString(v189, 134217984LL);
      goto LABEL_222;
    }
  }

  v203 = (os_log_s *)EAPLogGetLogHandle(v190, v191, v192, v193);
  os_log_type_t v204 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(v203, v204))
  {
    *(_DWORD *)v275 = 138412290;
    *(void *)&v275[4] = @"OuterIdentity";
    _os_log_impl( (void *)&_mh_execute_header,  v203,  v204,  "%@ is not configured, unable to prompt for EAP Identity",  v275,  0xCu);
  }

  BOOL v195 = 0;
  *(_BYTE *)(a1 + 497) = 1;
LABEL_238:
  if ((v153 != 0LL) != (*(void *)buf != 0LL))
  {
    uint64_t v214 = *(unsigned int *)(a1 + 200);
    if ((int)v214 >= 2)
    {
      v215 = *v271;
      if (*v271)
      {
        uint64_t v216 = 0LL;
        while (v215[v216] != 13)
        {
          if (v214 == ++v216) {
            goto LABEL_244;
          }
        }
      }

      else
      {
LABEL_244:
        LODWORD(v216) = -1;
      }

      if (*(void *)buf)
      {
        if ((_DWORD)v216 == -1)
        {
          BOOL v237 = sub_100007D28(*v59, @"TLSCertificateIsRequired", 0);
          if (!v237)
          {
            v241 = (os_log_s *)EAPLogGetLogHandle(v237, v238, v239, v240);
            os_log_type_t v242 = _SC_syslog_os_log_mapping(5LL);
            if (os_log_type_enabled(v241, v242))
            {
              uint64_t v243 = sub_100009408(*(void *)(a1 + 24), 0LL);
              *(_DWORD *)v275 = 136315138;
              *(void *)&v275[4] = v243;
              v223 = "%s: identity specified but EAP-TLS isn't enabled";
              v224 = v241;
              os_log_type_t v225 = v242;
              uint32_t v226 = 12;
LABEL_263:
              _os_log_impl((void *)&_mh_execute_header, v224, v225, v223, v275, v226);
            }
          }
        }

        else
        {
          *(_DWORD *)(a1 + 200) = 1;
          _DWORD *v215 = 13;
          BOOL v217 = sub_10000C750(1);
          if (v217)
          {
            v221 = (os_log_s *)EAPLogGetLogHandle(v217, v218, v219, v220);
            os_log_type_t v222 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(v221, v222))
            {
              *(_WORD *)v275 = 0;
              v223 = "identity is specified, enabling EAP-TLS only";
              v224 = v221;
              os_log_type_t v225 = v222;
              uint32_t v226 = 2;
              goto LABEL_263;
            }
          }
        }
      }

      else if ((_DWORD)v216 != -1)
      {
        BOOL v227 = sub_10000C750(1);
        if (v227)
        {
          v231 = (os_log_s *)EAPLogGetLogHandle(v227, v228, v229, v230);
          os_log_type_t v232 = _SC_syslog_os_log_mapping(6LL);
          if (os_log_type_enabled(v231, v232))
          {
            *(_WORD *)v275 = 0;
            _os_log_impl((void *)&_mh_execute_header, v231, v232, "password is specified, disabling EAP-TLS", v275, 2u);
          }
        }

        if ((v216 & 0x80000000) == 0)
        {
          int v233 = *(_DWORD *)(a1 + 200);
          if (v233 > (int)v216)
          {
            LODWORD(v234) = v233 - 1;
            if (v233 - 1 > (int)v216)
            {
              v235 = *v271;
              uint64_t v236 = v216;
              do
              {
                v235[v236] = v235[v236 + 1];
                uint64_t v234 = *(int *)(a1 + 200) - 1LL;
                ++v236;
              }

              while (v236 < v234);
            }

            *(_DWORD *)(a1 + 200) = v234;
          }
        }
      }
    }
  }

  if (v152) {
    char v244 = 1;
  }
  else {
    char v244 = v155;
  }
  if ((v244 & 1) == 0)
  {
    uint64_t v247 = 0LL;
    uint64_t v248 = *(void *)(a1 + 48);
    char v249 = 1;
    while (1)
    {
      uint64_t v250 = EAPClientModuleLookup((*v271)[v247]);
      if (!v250) {
        goto LABEL_279;
      }
      uint64_t v251 = EAPClientModulePluginUserName(v250, v248);
      *(void *)v275 = v251;
      if (v251)
      {
        v152 = (const char *)my_CFStringToCString(v251, 134217984LL);
        my_CFRelease(v275);
        if (v152)
        {
          BOOL v195 = 1;
          break;
        }

LABEL_291:
        v255 = *(void **)(a1 + 144);
        BOOL v246 = v255 != 0LL;
        if (v255) {
          free(v255);
        }
        int v254 = 0;
        *(void *)(a1 + 144) = 0LL;
        goto LABEL_295;
      }

      int v252 = (*v271)[v247];
      if (v252 == 18 || v252 == 23)
      {
        char v249 = 0;
      }

      else
      {
LABEL_279:
        if (++v247 >= *(int *)(a1 + 200))
        {
          if ((v249 & 1) != 0) {
            goto LABEL_291;
          }
LABEL_288:
          *(_BYTE *)(a1 + 497) = 1;
          goto LABEL_291;
        }
      }
    }
  }

  v245 = *(char **)(a1 + 144);
  if (v152 && v245)
  {
    BOOL v246 = strcmp(*(const char **)(a1 + 144), v152) != 0;
    free(v245);
    *(void *)(a1 + 144) = v152;
  }

  else
  {
    BOOL v246 = v245 != v152;
    if (v245) {
      free(*(void **)(a1 + 144));
    }
    *(void *)(a1 + 144) = v152;
    if (!v152)
    {
      int v254 = 0;
      goto LABEL_295;
    }
  }

  int v254 = strlen(v152);
LABEL_295:
  *(_DWORD *)(a1 + 152) = v254;
  *(_BYTE *)(a1 + 172) = v195;
  v256 = *(char **)(a1 + 160);
  if (v153 && v256)
  {
    unsigned int v257 = strcmp(*(const char **)(a1 + 160), v153) || v246;
    goto LABEL_304;
  }

  unsigned int v257 = v256 != v153 || v246;
  if (v256) {
LABEL_304:
  }
    free(v256);
  *(void *)(a1 + 160) = v153;
  if (v153) {
    int v258 = strlen(v153);
  }
  else {
    int v258 = 0;
  }
  *(_DWORD *)(a1 + 168) = v258;
  if (!*(_BYTE *)(a1 + 208)
    || (v259 = CFDictionaryGetValue(*v59, @"OuterIdentity"), CFTypeID v260 = CFStringGetTypeID(), !v259)
    || CFGetTypeID(v259) != v260)
  {
    v264 = *(void **)(a1 + 128);
    if (v264) {
      uint64_t v137 = 1LL;
    }
    else {
      uint64_t v137 = v257;
    }
    if (v264) {
      free(v264);
    }
    *(void *)(a1 + 128) = 0LL;
LABEL_323:
    *(_DWORD *)(a1 + 136) = 0;
    goto LABEL_123;
  }

  v261 = (const char *)my_CFStringToCString(v259, 134217984LL);
  v262 = v261;
  v263 = *(char **)(a1 + 128);
  if (v261 && v263)
  {
    else {
      uint64_t v137 = 1LL;
    }
    free(v263);
    *(void *)(a1 + 128) = v262;
    goto LABEL_330;
  }

  if (v263 == v261) {
    uint64_t v137 = v257;
  }
  else {
    uint64_t v137 = 1LL;
  }
  if (v263) {
    free(*(void **)(a1 + 128));
  }
  *(void *)(a1 + 128) = v262;
  if (!v262) {
    goto LABEL_323;
  }
LABEL_330:
  *(_DWORD *)(a1 + 136) = strlen(v262);
LABEL_123:
  uint64_t v138 = *(void *)(a1 + 280);
  if (v138) {
    LODWORD(v138) = EAPClientModulePluginEAPType();
  }
  v139 = *(int **)(a1 + 192);
  if (!v139) {
    goto LABEL_132;
  }
  uint64_t v140 = *(unsigned int *)(a1 + 200);
  uint64_t v141 = 0xFFFFFFFFLL;
  while (1)
  {
    int v142 = *v139++;
    if (v142 == (_DWORD)v138) {
      break;
    }
    --v141;
    if (!--v140) {
      goto LABEL_132;
    }
  }

  if (!v141)
  {
LABEL_132:
    sub_1000035E0(a1);
    return 1LL;
  }

  return v137;
}

const char *sub_100004F1C(int a1)
{
  if (a1 > 999)
  {
    switch(a1)
    {
      case 1000:
        return "ErrnoError";
      case 1001:
        return "SecurityError";
      case 1002:
        return "PluginSpecificError";
      default:
        return "<unknown>";
    }
  }

  else
  {
    uint64_t result = "OK";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "Failed";
        break;
      case 2:
        uint64_t result = "AllocationFailed";
        break;
      case 3:
        uint64_t result = "UserInputRequired";
        break;
      case 4:
        uint64_t result = "ConfigurationInvalid";
        break;
      case 5:
        uint64_t result = "ProtocolNotSupported";
        break;
      case 6:
        uint64_t result = "ServerCertificateNotTrusted";
        break;
      case 7:
        uint64_t result = "InnerProtocolNotSupported";
        break;
      case 8:
        uint64_t result = "InternalError";
        break;
      case 9:
        uint64_t result = "UserCancelledAuthentication";
        break;
      case 10:
        uint64_t result = "UnknownRootCertificate";
        break;
      case 11:
        uint64_t result = "NoRootCertificate";
        break;
      case 12:
        uint64_t result = "CertificateExpired";
        break;
      case 13:
        uint64_t result = "CertificateNotYetValid";
        break;
      case 14:
        uint64_t result = "CertificateRequiresConfirmation";
        break;
      case 15:
        uint64_t result = "UserInputNotPossible";
        break;
      case 16:
        uint64_t result = "ResourceUnavailable";
        break;
      case 17:
        uint64_t result = "ProtocolError";
        break;
      case 18:
        uint64_t result = "AuthenticationStalled";
        break;
      case 20:
        uint64_t result = "OtherInputRequired";
        break;
      default:
        return "<unknown>";
    }
  }

  return result;
}

void sub_100005080(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a2;
  int v12 = a2;
  LogHandle = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, a4);
  os_log_type_t v7 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(LogHandle, v7))
  {
    uint64_t v8 = sub_100009408(a1[3], 0LL);
    unsigned int v9 = sub_10000A0E0(a1[3]);
    if (v9 > 3) {
      CFTypeID v10 = "<unknown>";
    }
    else {
      CFTypeID v10 = (&off_100010758)[v9];
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "%s: 802.1X %s Mode", buf, 0x16u);
  }

  if (sub_100009CCC(a1[3]))
  {
    if (v4 == -1) {
      CFTypeID v11 = 0LL;
    }
    else {
      CFTypeID v11 = &v12;
    }
    sub_1000051B4((uint64_t)a1, v11);
  }

  else
  {
    sub_100005328(a1, 0);
  }

void sub_1000051B4(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = 0;
  sub_100007508((unsigned int *)a1);
  *(_DWORD *)(a1 + 120) = -1;
  *(_DWORD *)(a1 + 204) = 0;
  *(void *)(a1 + 488) = 0LL;
  sub_1000035E0(a1);
  sub_100007054(a1);
  if (a2)
  {
    uint64_t v15 = 0LL;
    char v16 = 0;
    int v14 = 9;
    uint64_t v13 = (unsigned __int8 *)&v15;
    EAPOLPacketSetLength(&v15, 5LL);
    BYTE5(v15) = *a2;
    BYTE4(v15) = 1;
    char v16 = 1;
    uint64_t v5 = EAPPacketSetLength((char *)&v15 + 4, 5LL);
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v5, v6, v7, v8);
    os_log_type_t v10 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v10))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v10, "Re-created EAP Request Identity", v12, 2u);
    }

    sub_100005644(a1, 0, &v13, v11);
  }

  else
  {
    sub_100005644(a1, 0, 0LL, v4);
  }

void *sub_100005328(void *result, int a2)
{
  if (!a2)
  {
    uint64_t v2 = (uint64_t)result;
    sub_100009488(result[3]);
    sub_100008B94(*(void *)(v2 + 16));
    *(_DWORD *)uint64_t v2 = 7;
    *(_BYTE *)(v2 + 272) = 1;
    sub_100007508((unsigned int *)v2);
    return sub_10000947C(*(void **)(v2 + 24), (uint64_t)sub_100005644, v2, 0LL);
  }

  return result;
}

BOOL sub_100005388(BOOL result)
{
  if (result)
  {
    v1 = (const __CFString *)result;
    CFTypeID TypeID = CFStringGetTypeID();
    return CFGetTypeID(v1) != TypeID || CFStringGetLength(v1) == 0;
  }

  return result;
}

void sub_1000053D8(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t sub_1000053EC(uint64_t a1, int a2, CFDictionaryRef theDict, uint64_t a4)
{
  unsigned __int8 v18 = 0;
  switch(a2)
  {
    case 1:
      Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Configuration");
      if (!Value) {
        return 1;
      }
      int v6 = sub_10000374C(a1, Value, &v18);
      if (v18) {
        return v18;
      }
      int v7 = v6;
      if (*(_DWORD *)(a1 + 488) != 3) {
        goto LABEL_25;
      }
      if (*(_DWORD *)a1 == 3)
      {
        if ((v7 & 1) == 0) {
          goto LABEL_29;
        }
LABEL_28:
        sub_1000051B4(a1, 0LL);
        return v18;
      }

      if (*(_DWORD *)a1 != 2)
      {
LABEL_25:
        if (!v7) {
          return v18;
        }
        goto LABEL_28;
      }

      if (*(void *)(a1 + 144)) {
        goto LABEL_24;
      }
      return v18;
    case 2:
      return 1;
    case 3:
      if (*(_DWORD *)a1 != 7) {
        sub_100005644(a1, 0, 0LL, a4);
      }
      return v18;
    case 4:
      unsigned int v9 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"UserInput");
      if (v9)
      {
        os_log_type_t v10 = v9;
        CFMutableDictionaryRef Mutable = *(CFMutableDictionaryRef *)(a1 + 56);
        if (!Mutable)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          *(void *)(a1 + 56) = Mutable;
        }

        CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_1000053D8, Mutable);
        if (!sub_100009420(*(void *)(a1 + 24))
          && my_CFDictionaryGetBooleanValue(*(void *)(a1 + 56), @"TLSSaveTrustExceptions", 0LL))
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), @"TLSSaveTrustExceptions", kCFBooleanFalse);
        }
      }

      CFDictionaryRef Copy = CFDictionaryCreateCopy(0LL, *(CFDictionaryRef *)(a1 + 40));
      sub_10000374C(a1, Copy, 0LL);
      my_CFRelease(&Copy);
      BOOL v12 = sub_10000C750(1);
      if (v12)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle(v12, v13, v14, v8);
        os_log_type_t v16 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(LogHandle, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v16, "user_supplied_data", buf, 2u);
        }
      }

      if (*(_DWORD *)a1 == 3)
      {
LABEL_29:
        if (*(void *)(a1 + 472)) {
          sub_100005D00(a1, (void *)(a1 + 472));
        }
      }

      else if (*(_DWORD *)a1 == 2)
      {
LABEL_24:
        sub_1000057F0((unsigned int *)a1, 4LL, 0LL, v8);
      }

      return v18;
    default:
      return v18;
  }

void sub_100005644(uint64_t a1, int a2, unsigned __int8 **a3, uint64_t a4)
{
  uint64_t v6 = dword_100014000;
  if (a2 == 2)
  {
    if (a3) {
      goto LABEL_16;
    }
LABEL_12:
    int v8 = *(_DWORD *)(a1 + 264);
    if (v8 == dword_100014004)
    {
      sub_100009488(*(void *)(a1 + 24));
      sub_100008B94(*(void *)(a1 + 16));
      *(_DWORD *)a1 = 8;
      *(_BYTE *)(a1 + 272) = 1;
      sub_100007508((unsigned int *)a1);
      sub_10000947C(*(void **)(a1 + 24), (uint64_t)sub_100005644, a1, 0LL);
      return;
    }

    *(_DWORD *)(a1 + 264) = v8 + 1;
    goto LABEL_16;
  }

  if (a2 != 1)
  {
    if (a2) {
      return;
    }
    sub_100009488(*(void *)(a1 + 24));
    sub_100008B94(*(void *)(a1 + 16));
    *(_DWORD *)a1 = 1;
    sub_100007508((unsigned int *)a1);
    *(_DWORD *)(a1 + 264) = 0;
    sub_10000947C(*(void **)(a1 + 24), (uint64_t)sub_100005644, a1, 1LL);
    sub_10000A0EC(*(void *)(a1 + 24));
  }

  if (!a3) {
    goto LABEL_12;
  }
  int v7 = *a3;
  if ((*a3)[1] == 3)
  {
    if (v7[4] != 2) {
      return;
    }
LABEL_16:
    sub_100009490(*(void *)(a1 + 24), 1, 0LL, 0);
    sub_100008BD8( *(CFRunLoopTimerRef **)(a1 + 16),  v6,  0,  (__CFRunLoopTimer *)sub_100005644,  (__CFRunLoopTimer *)a1,  (__CFRunLoopTimer *)2,  0LL);
    return;
  }

  if (!(*a3)[1] && v7[4] == 1)
  {
    if (v7[8] == 1) {
      sub_1000057F0((unsigned int *)a1, 0LL, a3, a4);
    }
    else {
      sub_100007198((unsigned int *)a1, 0, a3);
    }
  }

void sub_1000057F0(unsigned int *a1, uint64_t a2, unsigned __int8 **a3, uint64_t a4)
{
  int v5 = a2;
  uint64_t v7 = *a1;
  uint64_t v8 = dword_100014008;
  switch((int)a2)
  {
    case 0:
      ++a1[67];
      a1[51] = 0;
      sub_100009488(*((void *)a1 + 3));
      sub_100008B94(*((void *)a1 + 2));
      *a1 = 2;
      *((_BYTE *)a1 + 498) = 0;
      sub_10000947C(*((void **)a1 + 3), (uint64_t)sub_1000057F0, (uint64_t)a1, 1LL);
      goto LABEL_3;
    case 1:
LABEL_3:
      *((_BYTE *)a1 + 272) = 0;
      unsigned int v9 = *a3;
      if (!(*a3)[1])
      {
        os_log_type_t v10 = v9 + 4;
        if (v9[4] == 1 && v9[8] == 1)
        {
          unsigned int Length = EAPPacketGetLength(v10);
          my_CFRelease(a1 + 54);
          BOOL v12 = (const UInt8 *)memchr(v9 + 9, 0, (int)(Length - 5));
          if (Length >= 6)
          {
            if (v12)
            {
              uint64_t v13 = CFStringCreateWithBytes( 0LL,  v12 + 1,  (int)(Length - 5 + (_DWORD)v9 + 9 - ((_DWORD)v12 + 1)),  0x8000100u,  0);
              *(void *)uint64_t v32 = v13;
              if (v13)
              {
                *((void *)a1 + 27) = CFStringCreateArrayBySeparatingStrings(0LL, v13, @",");
                my_CFRelease(v32);
              }
            }
          }

          BOOL v14 = sub_10000C750(1);
          if (v14)
          {
            LogHandle = (os_log_s *)EAPLogGetLogHandle(v14, v15, v16, v17);
            os_log_type_t v19 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(LogHandle, v19))
            {
              *(_WORD *)uint64_t v32 = 0;
              _os_log_impl((void *)&_mh_execute_header, LogHandle, v19, "EAP Request Identity", v32, 2u);
            }
          }

          uint64_t v20 = v9[5];
          a1[30] = v20;
          BOOL v21 = sub_100007E94((uint64_t)a1, v20);
          if (v21)
          {
            a1[122] = 0;
            *((_BYTE *)a1 + 498) = 1;
            sub_100007508(a1);
            sub_100008BD8( *((CFRunLoopTimerRef **)a1 + 2),  v8,  0,  (__CFRunLoopTimer *)sub_1000057F0,  (__CFRunLoopTimer *)a1,  (__CFRunLoopTimer *)2,  0LL);
          }

          else if (*((_BYTE *)a1 + 497))
          {
            uint64_t v29 = (os_log_s *)EAPLogGetLogHandle(v21, v22, v23, v24);
            os_log_type_t v30 = _SC_syslog_os_log_mapping(5LL);
            if (os_log_type_enabled(v29, v30))
            {
              *(_WORD *)uint64_t v32 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "Acquired: cannot prompt for missing user name",  v32,  2u);
            }

            a1[122] = 15;
            sub_100008094((uint64_t)a1, 0, 0LL);
          }

          else
          {
            if (*((_BYTE *)a1 + 499) || *((_BYTE *)a1 + 500) || *((_BYTE *)a1 + 501)) {
              int v31 = 20;
            }
            else {
              int v31 = 3;
            }
            a1[122] = v31;
            sub_100007508(a1);
          }
        }

        else if (v5)
        {
          sub_100007198(a1, 0, a3);
        }

        else
        {
          v26 = (os_log_s *)EAPLogGetLogHandle(v10, a2, a3, a4);
          os_log_type_t v27 = _SC_syslog_os_log_mapping(5LL);
          if (os_log_type_enabled(v26, v27))
          {
            else {
              uint64_t v28 = (&off_100010710)[v7];
            }
            *(_DWORD *)uint64_t v32 = 136315138;
            *(void *)&v32[4] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "internal error: recursion avoided from state %s",  v32,  0xCu);
          }
        }
      }

      break;
    case 2:
      if ((int)a1[67] >= dword_10001400C)
      {
        a1[67] = 0;
        a1[122] = 18;
        sub_100008094((uint64_t)a1, 0, 0LL);
      }

      else
      {
        sub_100005644(a1, 0LL, 0LL);
      }

      break;
    case 4:
      if (sub_100007E94((uint64_t)a1, a1[30]))
      {
        a1[122] = 0;
        sub_100007508(a1);
        sub_100008BD8( *((CFRunLoopTimerRef **)a1 + 2),  v8,  0,  (__CFRunLoopTimer *)sub_1000057F0,  (__CFRunLoopTimer *)a1,  (__CFRunLoopTimer *)2,  0LL);
      }

      else
      {
        if (*((_BYTE *)a1 + 499) || *((_BYTE *)a1 + 500) || *((_BYTE *)a1 + 501)) {
          int v25 = 20;
        }
        else {
          int v25 = 3;
        }
        a1[122] = v25;
        sub_100007508(a1);
      }

      break;
    default:
      return;
  }

void sub_100005D00(uint64_t a1, void *a2)
{
  uint64_t v2 = (_BYTE *)*a2;
  uint64_t v93 = 0LL;
  if (!*(void *)(a1 + 144)) {
    return;
  }
  switch(v2[4])
  {
    case 1:
      int v5 = v2[8];
      if (!v2[8]) {
        return;
      }
      uint64_t v6 = dword_100014008;
      uint64_t v7 = *(void *)(a1 + 280);
      if (v7) {
        LODWORD(v7) = EAPClientModulePluginEAPType();
      }
      if ((_DWORD)v7 == v5) {
        goto LABEL_20;
      }
      uint64_t v8 = *(void *)(a1 + 192);
      if (!v8) {
        goto LABEL_59;
      }
      int v9 = v2[8];
      int v10 = *(_DWORD *)(a1 + 200);
      if (v10 < 1) {
        goto LABEL_56;
      }
      uint64_t v11 = 0xFFFFFFFFLL;
      BOOL v12 = *(int **)(a1 + 192);
      uint64_t v13 = *(unsigned int *)(a1 + 200);
      break;
    case 2:
      int v15 = v2[8];
      uint64_t v16 = *(void *)(a1 + 280);
      if (v16) {
        LODWORD(v16) = EAPClientModulePluginEAPType();
      }
      if ((_DWORD)v16 != v15) {
        return;
      }
      goto LABEL_20;
    case 3:
      if (*(void *)(a1 + 280)) {
        goto LABEL_20;
      }
      sub_1000066A4(a1, 0, 0LL);
      return;
    case 4:
      if (*(void *)(a1 + 280)) {
        goto LABEL_20;
      }
      *(_DWORD *)(a1 + 488) = 1;
      sub_100008094(a1, 0, 0LL);
      return;
    default:
      goto LABEL_20;
  }

  while (1)
  {
    int v14 = *v12++;
    if (v14 == v9) {
      break;
    }
    --v11;
    if (!--v13) {
      goto LABEL_56;
    }
  }

  if (!v11)
  {
LABEL_56:
    uint64_t v78 = *(int *)(a1 + 204);
    if ((int)v78 >= v10 || (*(_DWORD *)(a1 + 204) = v78 + 1, (int v79 = *(_DWORD *)(v8 + 4 * v78)) == 0))
    {
LABEL_59:
      BOOL v80 = sub_10000C750(1);
      if (v80)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle(v80, v81, v82, v83);
        os_log_type_t v85 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(LogHandle, v85))
        {
          uint64_t v86 = EAPTypeStr(v2[8]);
          int v87 = v2[8];
          *(_DWORD *)buf = 136315394;
          uint64_t v95 = v86;
          __int16 v96 = 1024;
          *(_DWORD *)CFTypeID v97 = v87;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v85, "EAP Request: %s (%d) not enabled", buf, 0x12u);
        }
      }

      sub_10000862C(a1, v2[5], 0);
      int v41 = 5;
      goto LABEL_63;
    }

    sub_1000084E0(v9, a1 + 192);
    sub_10000862C(a1, v2[5], v79);
    sub_100008BD8( *(CFRunLoopTimerRef **)(a1 + 16),  v6,  0,  (__CFRunLoopTimer *)sub_100007198,  (__CFRunLoopTimer *)a1,  (__CFRunLoopTimer *)2,  0LL);
    return;
  }

  sub_100008B94(*(void *)(a1 + 16));
  sub_1000035E0(a1);
  uint64_t v66 = sub_100008784(a1, v2[8], v64, v65);
  if ((v66 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 488) == 3)
    {
      sub_100008914(a1, (uint64_t)a2);
      sub_100007508((unsigned int *)a1);
      return;
    }

    os_log_type_t v88 = (os_log_s *)EAPLogGetLogHandle(v66, v67, v68, v69);
    os_log_type_t v89 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v88, v89)) {
      goto LABEL_64;
    }
    uint64_t v90 = EAPTypeStr(v2[8]);
    int v91 = v2[8];
    int v92 = *(_DWORD *)(a1 + 488);
    *(_DWORD *)buf = 136315650;
    uint64_t v95 = v90;
    __int16 v96 = 1024;
    *(_DWORD *)CFTypeID v97 = v91;
    *(_WORD *)&v97[4] = 1024;
    *(_DWORD *)&v97[6] = v92;
    v54 = "EAP Request: %s (%d) init failed, %d";
    os_log_type_t v55 = v88;
    os_log_type_t v56 = v89;
    uint32_t v57 = 24;
    goto LABEL_39;
  }

  BOOL v70 = sub_10000C750(1);
  if (v70)
  {
    unint64_t v74 = (os_log_s *)EAPLogGetLogHandle(v70, v71, v72, v73);
    os_log_type_t v75 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = EAPTypeStr(v2[8]);
      int v77 = v2[8];
      *(_DWORD *)buf = 136315394;
      uint64_t v95 = v76;
      __int16 v96 = 1024;
      *(_DWORD *)CFTypeID v97 = v77;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "EAP Request: %s (%d) accepted", buf, 0x12u);
    }
  }

  sub_100007508((unsigned int *)a1);
LABEL_20:
  if (!*(void *)(a1 + 280)) {
    return;
  }
  uint64_t v17 = (uint64_t *)(a1 + 440);
  my_CFRelease(a1 + 440);
  my_CFRelease(a1 + 448);
  *(void *)(a1 + 328) = *(void *)(a1 + 144);
  *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 152);
  *(void *)(a1 + 352) = *(void *)(a1 + 160);
  *(_DWORD *)(a1 + 360) = *(_DWORD *)(a1 + 168);
  *(_DWORD *)(a1 + 308) = *(_DWORD *)(a1 + 32);
  sub_100008A1C(a1);
  *(_BYTE *)(a1 + 296) = (sub_10000C618() & 0x1000) == 0;
  int v18 = EAPClientModulePluginProcess(*(void *)(a1 + 280), a1 + 288, v2 + 4, &v93, a1 + 488, a1 + 492);
  os_log_type_t v19 = v93;
  if (v93)
  {
    uint64_t v20 = *(void *)(a1 + 24);
    unsigned int Length = EAPPacketGetLength(v93);
    uint64_t v22 = sub_100009490(v20, 0, v19, Length);
    if ((v22 & 0x80000000) != 0)
    {
      v26 = (os_log_s *)EAPLogGetLogHandle(v22, v23, v24, v25);
      os_log_type_t v27 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v26, v27))
      {
        int v28 = *v93;
        *(_DWORD *)buf = 67109120;
        LODWORD(v95) = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "EAPOLSocketTransmit %d failed", buf, 8u);
      }
    }

    EAPClientModulePluginFreePacket(*(void *)(a1 + 280), a1 + 288, v93);
  }

  uint64_t v29 = EAPClientModulePluginPublishProperties(*(void *)(a1 + 280), a1 + 288);
  *(void *)(a1 + 448) = v29;
  if (v18 == 2)
  {
    uint64_t v42 = EAPClientModulePluginFailureString(*(void *)(a1 + 280), a1 + 288);
    if (v42)
    {
      uint64_t v46 = v42;
      uint64_t v47 = (os_log_s *)EAPLogGetLogHandle(v42, v43, v44, v45);
      os_log_type_t v48 = _SC_syslog_os_log_mapping(5LL);
      uint64_t v42 = os_log_type_enabled(v47, v48);
      if ((_DWORD)v42)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v95 = v46;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "error string '%s'", buf, 0xCu);
      }
    }

    v49 = (os_log_s *)EAPLogGetLogHandle(v42, v43, v44, v45);
    os_log_type_t v50 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v49, v50)) {
      goto LABEL_64;
    }
    uint64_t v51 = sub_100009408(*(void *)(a1 + 24), 0LL);
    uint64_t v52 = *(void *)(a1 + 464);
    int v53 = *(_DWORD *)(a1 + 488);
    *(_DWORD *)buf = 136315650;
    uint64_t v95 = v51;
    __int16 v96 = 2080;
    *(void *)CFTypeID v97 = v52;
    *(_WORD *)&v97[8] = 1024;
    int v98 = v53;
    v54 = "%s %s: authentication failed with status %d";
    os_log_type_t v55 = v49;
    os_log_type_t v56 = v50;
    uint32_t v57 = 28;
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v55, v56, v54, buf, v57);
LABEL_64:
    sub_100008094(a1, 0, 0LL);
    return;
  }

  if (v18 == 1)
  {
    BOOL v58 = (os_log_s *)EAPLogGetLogHandle(v29, v30, v31, v32);
    os_log_type_t v59 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = sub_100009408(*(void *)(a1 + 24), 0LL);
      uint64_t v61 = *(void *)(a1 + 464);
      *(_DWORD *)buf = 136315394;
      uint64_t v95 = v60;
      __int16 v96 = 2080;
      *(void *)CFTypeID v97 = v61;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "%s %s: successfully authenticated", buf, 0x16u);
    }

    sub_1000066A4(a1, 0, 0LL);
  }

  else
  {
    if (v18) {
      return;
    }
    if (*(_DWORD *)(a1 + 488) == 3)
    {
      sub_100008914(a1, (uint64_t)a2);
      uint64_t v33 = EAPClientModulePluginRequireProperties(*(void *)(a1 + 280), a1 + 288);
      *(void *)(a1 + 440) = v33;
      int v34 = *(unsigned __int8 *)(a1 + 497);
      uint64_t v38 = (os_log_s *)EAPLogGetLogHandle(v33, v35, v36, v37);
      if (v34)
      {
        os_log_type_t v39 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = *v17;
          *(_DWORD *)buf = 138412290;
          uint64_t v95 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "Authenticating: can't prompt for missing properties %@",  buf,  0xCu);
        }

        int v41 = 15;
LABEL_63:
        *(_DWORD *)(a1 + 488) = v41;
        goto LABEL_64;
      }

      int v62 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v38, (os_log_type_t)v62))
      {
        uint64_t v63 = *v17;
        *(_DWORD *)buf = 138412290;
        uint64_t v95 = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  (os_log_type_t)v62,  "Authenticating: user input required for properties %@",  buf,  0xCu);
      }
    }

    sub_100007508((unsigned int *)a1);
  }

void sub_100006544(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 268) = 0;
  if (!a2)
  {
    int v10 = *(CFRunLoopTimerRef **)(a1 + 16);
    uint64_t v11 = (__CFRunLoopTimer *)sub_100005328;
    uint64_t v12 = 1LL;
    int v13 = 0;
LABEL_19:
    sub_100008BD8(v10, v12, v13, v11, (__CFRunLoopTimer *)a1, 0LL, 0LL);
    return;
  }

  int v3 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 1) {
    goto LABEL_14;
  }
  if (v3 != 7)
  {
    int v14 = 0;
    uint64_t v15 = 5LL;
    goto LABEL_15;
  }

  if (!*(void *)(a1 + 280))
  {
    int v3 = 7;
LABEL_14:
    uint64_t v15 = 0LL;
    int v14 = 500000;
LABEL_15:
    if (v3 == 4 && sub_1000099E8(*(void *)(a1 + 24)))
    {
      sub_100008B94(*(void *)(a1 + 16));
      return;
    }

    int v10 = *(CFRunLoopTimerRef **)(a1 + 16);
    uint64_t v11 = (__CFRunLoopTimer *)sub_100005644;
    uint64_t v12 = v15;
    int v13 = v14;
    goto LABEL_19;
  }

  if (!sub_1000099E8(*(void *)(a1 + 24)))
  {
    int v3 = *(_DWORD *)a1;
    goto LABEL_14;
  }

  BOOL v4 = sub_10000C750(1);
  if (v4)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v4, v5, v6, v7);
    os_log_type_t v9 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v9))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v9, "Valid PMK Exists", v16, 2u);
    }
  }

  sub_1000066A4(a1, 0, 0LL);
}

void sub_1000066A4(uint64_t a1, int a2, uint64_t *a3)
{
  if (a2 != 1)
  {
    if (!a2)
    {
      sub_100009488(*(void *)(a1 + 24));
      sub_100008B94(*(void *)(a1 + 16));
      *(_DWORD *)(a1 + 268) = 0;
      *(_DWORD *)a1 = 4;
      sub_100007054(a1);
      if (*(_BYTE *)(a1 + 173)) {
        goto LABEL_11;
      }
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"NewPassword");
      CFTypeID TypeID = CFStringGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        uint64_t v6 = *(void **)(a1 + 160);
        if (v6) {
          free(v6);
        }
        uint64_t v7 = (const char *)my_CFStringToCString(Value, 134217984LL);
        *(void *)(a1 + 160) = v7;
        if (v7) {
          *(_DWORD *)(a1 + 168) = strlen(v7);
        }
      }

      if (*(_BYTE *)(a1 + 173))
      {
LABEL_11:
        *(_BYTE *)(a1 + 174) = 1;
        uint64_t v8 = *(void **)(a1 + 160);
        if (v8)
        {
          free(v8);
          *(void *)(a1 + 160) = 0LL;
        }

        *(_DWORD *)(a1 + 168) = 0;
      }

      sub_100007508((unsigned int *)a1);
      sub_10000947C(*(void **)(a1 + 24), (uint64_t)sub_1000066A4, a1, 1LL);
    }

    return;
  }

  sub_100008B94(*(void *)(a1 + 16));
  int v10 = (_BYTE *)*a3;
  if (*(_BYTE *)(*a3 + 1) != 3)
  {
    if (!*(_BYTE *)(*a3 + 1) && v10[4] == 1)
    {
      int v11 = v10[8];
      if (v11 == 2)
      {
        sub_10000829C(*(_DWORD *)a1, (uint64_t)(v10 + 4));
        sub_1000083D0(a1, v10[5]);
      }

      else if (v11 == 1)
      {
        sub_1000057F0(a1, 0LL, a3);
      }

      else
      {
        sub_100007198(a1, 0LL, a3);
      }
    }

    return;
  }

  uint64_t v12 = *a3;
  if (*(_BYTE *)(v12 + 4) != 1) {
    return;
  }
  size_t __len = 0LL;
  uint64_t v13 = EAPClientModulePluginSessionKey(*(void *)(a1 + 280), a1 + 288, &__len);
  if (!v13)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v14, v15, v16);
    os_log_type_t v27 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v27)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v28 = "session key is NULL";
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v27, v28, macOut, 2u);
    return;
  }

  uint64_t v17 = (const void *)v13;
  uint64_t v18 = EAPClientModulePluginServerKey(*(void *)(a1 + 280), a1 + 288, (char *)&__len + 4);
  if (!v18)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v19, v20, v21);
    os_log_type_t v27 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v27)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v28 = "server key is NULL";
    goto LABEL_50;
  }

  uint64_t v22 = (const void *)v18;
  unsigned int Length = EAPOLPacketGetLength(v12);
  size_t v24 = Length + 4LL;
  if (sub_10000C750(16)) {
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(0LL, 0LL);
  }
  else {
    CFMutableDictionaryRef Mutable = 0LL;
  }
  size_t v29 = SHIDWORD(__len);
  uint64_t v30 = malloc(v24);
  memmove(v30, (const void *)v12, v24);
  v30[4] = 0LL;
  v30[5] = 0LL;
  CCHmac(1u, v22, v29, v30, v24, macOut);
  BOOL v32 = *(void *)(v12 + 32) != *(void *)macOut || *(void *)(v12 + 40) != *(void *)&macOut[8];
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0LL, @"Signature: ");
    print_bytes_cfstr(Mutable, macOut, 16LL);
    uint64_t v33 = "INVALID";
    if (!v32) {
      uint64_t v33 = "valid";
    }
    CFStringAppendFormat(Mutable, 0LL, @" is %s", v33);
    free(v30);
    uint64_t v38 = (os_log_s *)EAPLogGetLogHandle(v34, v35, v36, v37);
    os_log_type_t v39 = _SC_syslog_os_log_mapping(4294967289LL);
    if (os_log_type_enabled(v38, v39))
    {
      *(_DWORD *)macOut = 138412290;
      *(void *)&macOut[4] = Mutable;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@", macOut, 0xCu);
    }

    CFRelease(Mutable);
  }

  else
  {
    free(v30);
  }

  if (v32)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v40, v41, v42, v43);
    os_log_type_t v27 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v27)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v28 = "key signature mismatch, ignoring";
    goto LABEL_50;
  }

  int v44 = *(char *)(v12 + 31);
  if (v44 >= 0) {
    unsigned int v45 = 1;
  }
  else {
    unsigned int v45 = 2;
  }
  unsigned int v46 = EAPOLKeyDescriptorGetLength(v12 + 4);
  if (Length < 0x2D)
  {
    BOOL v57 = sub_10000C750(1);
    if (v57)
    {
      uint64_t v61 = (os_log_s *)EAPLogGetLogHandle(v57, v58, v59, v60);
      os_log_type_t v62 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = "Broadcast";
        if (v44 < 0) {
          uint64_t v63 = "Unicast";
        }
        *(_DWORD *)macOut = 136315394;
        *(void *)&macOut[4] = v63;
        *(_WORD *)&macOut[12] = 1024;
        *(_DWORD *)&macOut[14] = v46;
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "set %s key length %d using session key", macOut, 0x12u);
      }
    }

    sub_10000942C(*(void *)(a1 + 24), v45, *(_BYTE *)(v12 + 31) & 0x7F, (uint64_t)v17, v46);
  }

  else
  {
    size_t v47 = (int)__len + 16;
    os_log_type_t v48 = malloc(v47);
    *os_log_type_t v48 = *(_OWORD *)(v12 + 15);
    memmove(v48 + 1, v17, (int)__len);
    dataOut = malloc(Length - 44);
    CCCryptorStatus v50 = CCCrypt(1u, 4u, 0, v48, v47, 0LL, (const void *)(v12 + 48), Length - 44, dataOut, Length - 44, &v67);
    BOOL v51 = sub_10000C750(1);
    if (v50)
    {
      if (v51)
      {
        os_log_type_t v55 = (os_log_s *)EAPLogGetLogHandle(v51, v52, v53, v54);
        os_log_type_t v56 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(v55, v56))
        {
          *(_DWORD *)macOut = 67109120;
          *(_DWORD *)&macOut[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "key process: RC4 decrypt failed %d", macOut, 8u);
        }
      }
    }

    else
    {
      if (v51)
      {
        uint64_t v64 = (os_log_s *)EAPLogGetLogHandle(v51, v52, v53, v54);
        os_log_type_t v65 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(v64, v65))
        {
          uint64_t v66 = "Broadcast";
          if (v44 < 0) {
            uint64_t v66 = "Unicast";
          }
          *(_DWORD *)macOut = 136315394;
          *(void *)&macOut[4] = v66;
          *(_WORD *)&macOut[12] = 1024;
          *(_DWORD *)&macOut[14] = v46;
          _os_log_impl((void *)&_mh_execute_header, v64, v65, "set %s key length %d using descriptor", macOut, 0x12u);
        }
      }

      sub_10000942C(*(void *)(a1 + 24), v45, *(_BYTE *)(v12 + 31) & 0x7F, (uint64_t)dataOut, v46);
    }

    free(dataOut);
    free(v48);
  }

void *sub_100006DFC(uint64_t a1)
{
  uint64_t v17 = v2;
  if (v2)
  {
    uint64_t v6 = v2;
    uint64_t result = malloc(0x1F8uLL);
    if (result)
    {
      result[62] = 0LL;
      *((_OWORD *)result + 29) = 0u;
      *((_OWORD *)result + 30) = 0u;
      *((_OWORD *)result + 27) = 0u;
      *((_OWORD *)result + 28) = 0u;
      *((_OWORD *)result + 25) = 0u;
      *((_OWORD *)result + 26) = 0u;
      *((_OWORD *)result + 23) = 0u;
      *((_OWORD *)result + 24) = 0u;
      *((_OWORD *)result + 21) = 0u;
      *((_OWORD *)result + 22) = 0u;
      *((_OWORD *)result + 19) = 0u;
      *((_OWORD *)result + 20) = 0u;
      *((_OWORD *)result + 17) = 0u;
      *((_OWORD *)result + 18) = 0u;
      *((_OWORD *)result + 15) = 0u;
      *((_OWORD *)result + 16) = 0u;
      *((_OWORD *)result + 13) = 0u;
      *((_OWORD *)result + 14) = 0u;
      *((_OWORD *)result + 11) = 0u;
      *((_OWORD *)result + 12) = 0u;
      *((_OWORD *)result + 9) = 0u;
      *((_OWORD *)result + 10) = 0u;
      *((_OWORD *)result + 7) = 0u;
      *((_OWORD *)result + 8) = 0u;
      *((_OWORD *)result + 5) = 0u;
      *((_OWORD *)result + 6) = 0u;
      *((_OWORD *)result + 3) = 0u;
      *((_OWORD *)result + 4) = 0u;
      *((_OWORD *)result + 1) = 0u;
      *((_OWORD *)result + 2) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      result[2] = v6;
      result[3] = a1;
      return result;
    }

    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v8, v9, v10);
    os_log_type_t v12 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v12))
    {
      __int16 v15 = 0;
      uint64_t v13 = "malloc failed";
      uint64_t v14 = (uint8_t *)&v15;
      goto LABEL_8;
    }
  }

  else
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v3, v4, v5);
    os_log_type_t v12 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v12))
    {
      __int16 v16 = 0;
      uint64_t v13 = "Timer_create failed";
      uint64_t v14 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v12, v13, v14, 2u);
    }
  }

  sub_100008B5C(&v17);
  return 0LL;
}

void *sub_100006F24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100006DFC(a1);
  uint64_t v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 8) = *(_DWORD *)(a2 + 32);
    uint64_t v5 = *(const void **)(a2 + 184);
    if (v5)
    {
      CFRetain(v5);
      v4[23] = *(void *)(a2 + 184);
    }

    v4[6] = CFRetain(*(CFTypeRef *)(a2 + 48));
    uint64_t v6 = *(const __CFDictionary **)(a2 + 56);
    if (v6) {
      v4[7] = CFDictionaryCreateMutableCopy(0LL, 0LL, v6);
    }
    uint64_t v7 = *(const char **)(a2 + 128);
    if (v7)
    {
      v4[16] = strdup(v7);
      *((_DWORD *)v4 + 34) = *(_DWORD *)(a2 + 136);
    }

    uint64_t v8 = *(const char **)(a2 + 144);
    if (v8)
    {
      v4[18] = strdup(v8);
      *((_DWORD *)v4 + 38) = *(_DWORD *)(a2 + 152);
    }

    uint64_t v9 = *(const char **)(a2 + 160);
    if (v9)
    {
      v4[20] = strdup(v9);
      *((_DWORD *)v4 + 42) = *(_DWORD *)(a2 + 168);
    }

    __int128 v10 = *(_OWORD *)(a2 + 192);
    v4[26] = *(void *)(a2 + 208);
    *((_OWORD *)v4 + 12) = v10;
    size_t v11 = 4LL * *(int *)(a2 + 200);
    os_log_type_t v12 = malloc(v11);
    v4[24] = v12;
    memmove(v12, *(const void **)(a2 + 192), v11);
    *((_BYTE *)v4 + 497) = 1;
  }

  return v4;
}

uint64_t sub_100007018(uint64_t result)
{
  *(_BYTE *)(result + 497) = 1;
  return result;
}

void sub_100007024(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
}

void sub_100007054(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 472);
  if (v2)
  {
    uint64_t v3 = (void *)(a1 + 472);
    free(v2);
    *uint64_t v3 = 0LL;
    v3[1] = 0LL;
  }

uint64_t sub_100007084(unsigned int *a1, _DWORD *a2)
{
  *a2 = a1[122];
  return *a1;
}

_DWORD *sub_100007094(_DWORD *result)
{
  if (*result == 3)
  {
    v1 = result;
    BOOL v2 = sub_10000C750(1);
    if (v2)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v2, v3, v4, v5);
      os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v7))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "Simulating EAP Success packet", buf, 2u);
      }
    }

    *(_WORD *)buf = 1;
    EAPOLPacketSetLength(buf, 4LL);
    v11[0] = 3;
    EAPPacketSetLength(v11, 4LL);
    uint64_t v8 = buf;
    int v9 = 8;
    return (_DWORD *)sub_100007198(v1, 1LL, &v8);
  }

  return result;
}

void sub_100007198(unsigned int *a1, int a2, unsigned __int8 **a3)
{
  if (a2 == 2)
  {
    sub_100005644(a1, 0LL, 0LL);
    return;
  }

  uint64_t v6 = *a1;
  if (a2 != 1)
  {
    if (a2) {
      return;
    }
    if (sub_100009420(*((void *)a1 + 3)))
    {
      sub_100009A24(*((void *)a1 + 3), 0LL, 0);
      *((_BYTE *)a1 + 496) = 0;
    }

    *a1 = 3;
    sub_100007508(a1);
    sub_10000947C(*((void **)a1 + 3), (uint64_t)sub_100007198, (uint64_t)a1, 1LL);
  }

  uint64_t v7 = sub_100008B94(*((void *)a1 + 2));
  *((_BYTE *)a1 + 272) = 0;
  __int128 v10 = *a3;
  if (!(*a3)[1])
  {
    uint64_t v11 = (uint64_t)(v10 + 4);
    int v12 = v10[4];
    if ((v12 - 1) < 2)
    {
      int v13 = v10[8];
      if (v13 == 2)
      {
        if (v12 != 2)
        {
          sub_10000829C(*a1, v11);
          sub_1000083D0((uint64_t)a1, v10[5]);
        }

        return;
      }

      if (v13 == 1)
      {
        if (v12 != 2)
        {
          if (a2)
          {
            sub_1000057F0(a1, 0LL, a3);
          }

          else
          {
            LogHandle = (os_log_s *)EAPLogGetLogHandle(v7, v11, v8, v9);
            os_log_type_t v15 = _SC_syslog_os_log_mapping(5LL);
            if (os_log_type_enabled(LogHandle, v15))
            {
              else {
                __int16 v16 = (&off_100010710)[v6];
              }
              int v17 = 136315138;
              uint64_t v18 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v15,  "internal error: recursion avoided from state %s",  (uint8_t *)&v17,  0xCu);
            }
          }
        }

        return;
      }
    }

    else if (v12 != 4 && v12 != 3)
    {
      return;
    }

    sub_100005D00((uint64_t)a1, a3);
  }

const __SCPreferences *sub_100007434(const __SCPreferences *result)
{
  if (result)
  {
    CFPropertyListRef Value = SCPreferencesGetValue(result, @"Supplicant");
    uint64_t result = (const __SCPreferences *)CFDictionaryGetTypeID();
    if (Value)
    {
      BOOL v2 = result;
      uint64_t result = (const __SCPreferences *)CFGetTypeID(Value);
      if (result == v2)
      {
        dword_100014000 = sub_100008E58((const __CFDictionary *)Value, @"StartPeriodSeconds", 5u);
        dword_100014004 = sub_100008E58((const __CFDictionary *)Value, @"StartAttemptsMax", 3u);
        dword_100014008 = sub_100008E58((const __CFDictionary *)Value, @"AuthPeriodSeconds", 5u);
        dword_10001400C = sub_100008E58((const __CFDictionary *)Value, @"AuthAttemptsMax", 4u);
        uint64_t result = (const __SCPreferences *)sub_100008E58( (const __CFDictionary *)Value,  @"HeldPeriodSeconds",  0x3Cu);
        dword_100014010 = (int)result;
      }
    }
  }

  return result;
}

uint64_t sub_100007508(unsigned int *a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v58 = Mutable;
  int v3 = sub_10000A0E0(*((void *)a1 + 3));
  if (v3)
  {
    int v4 = v3;
    sub_100007B78(Mutable, @"Mode", v3);
    if (v4 == 3) {
      CFDictionarySetValue(Mutable, @"SystemMode", kCFBooleanTrue);
    }
  }

  uint64_t v5 = (const void *)*((void *)a1 + 11);
  if (v5) {
    CFDictionarySetValue(Mutable, @"UniqueIdentifier", v5);
  }
  sub_100007B78(Mutable, @"SupplicantState", *a1);
  if (*((_BYTE *)a1 + 272))
  {
    sub_100007B78(Mutable, @"ClientStatus", 0);
    sub_100007B78(Mutable, @"DomainSpecificError", 0);
  }

  else
  {
    int v6 = a1[114];
    if (v6)
    {
      uint64_t v7 = (const char *)*((void *)a1 + 58);
      if (v7)
      {
        *(void *)buf = CFStringCreateWithCString(0LL, v7, 0x600u);
        CFDictionarySetValue(Mutable, @"EAPTypeName", *(const void **)buf);
        my_CFRelease(buf);
      }

      sub_100007B78(Mutable, @"EAPType", v6);
    }

    int v8 = a1[123];
    sub_100007B78(Mutable, @"ClientStatus", a1[122]);
    sub_100007B78(Mutable, @"DomainSpecificError", v8);
    unsigned int v9 = a1[122];
    if (v9 == 3)
    {
      if (*((void *)a1 + 18))
      {
        __int128 v10 = (void *)*((void *)a1 + 55);
        uint64_t v11 = Mutable;
      }

      else
      {
        uint64_t v11 = Mutable;
        __int128 v10 = 0LL;
      }

      sub_100007AF0(v11, v10);
    }

    else if (v9 == 20 && *((_BYTE *)a1 + 499))
    {
      sub_100009448(*((void *)a1 + 3));
    }

    int v12 = (const void *)*((void *)a1 + 56);
    if (v12) {
      CFDictionarySetValue(Mutable, @"AdditionalProperties", v12);
    }
    int v13 = (const void *)*((void *)a1 + 27);
    if (v13) {
      CFDictionarySetValue(Mutable, @"IdentityAttributes", v13);
    }
  }

  sub_100007B78(Mutable, @"ConfigurationGeneration", a1[8]);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v15 = CFDateCreate(0LL, Current);
  CFDictionarySetValue(Mutable, @"LastStatusTimestamp", v15);
  if (*a1 == 4)
  {
    CFTypeRef v16 = (CFTypeRef)*((void *)a1 + 1);
    if (!v16)
    {
      CFTypeRef v16 = CFRetain(v15);
      *((void *)a1 + 1) = v16;
    }

    CFDictionarySetValue(Mutable, @"Timestamp", v16);
  }

  CFRelease(v15);
  if (sub_10000C750(5))
  {
    uint64_t v57 = 0LL;
    uint64_t v17 = sub_10000C750(4);
    if ((_DWORD)v17) {
      unsigned int v21 = -7;
    }
    else {
      unsigned int v21 = -6;
    }
    if ((_DWORD)v17) {
      LODWORD(v22) = 7;
    }
    else {
      LODWORD(v22) = 6;
    }
    if (Mutable && (*a1 == 5 || (uint64_t v17 = sub_10000C750(4), (_DWORD)v17)))
    {
      uint64_t v17 = my_CFPropertyListCopyAsXMLString(Mutable);
      uint64_t v23 = (const __CFString *)v17;
      uint64_t v57 = v17;
    }

    else
    {
      uint64_t v23 = 0LL;
    }

    if (v23) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v22;
    }
    unsigned int v24 = a1[122];
    if (v24 == 1002)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v17, v18, v19, v20);
      os_log_type_t v30 = _SC_syslog_os_log_mapping(v22);
      if (os_log_type_enabled(LogHandle, v30))
      {
        uint64_t v31 = *a1;
        else {
          BOOL v32 = (&off_100010710)[v31];
        }
        int v47 = a1[122];
        os_log_type_t v48 = sub_100004F1C(v47);
        unsigned int v49 = a1[123];
        CCCryptorStatus v50 = ":\n";
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v32;
        if (!v23) {
          CCCryptorStatus v50 = "";
        }
        __int16 v60 = 2080;
        BOOL v51 = &stru_1000109F8;
        uint64_t v61 = v48;
        if (v23) {
          BOOL v51 = v23;
        }
        __int16 v62 = 1024;
        int v63 = v47;
        __int16 v64 = 1024;
        *(_DWORD *)os_log_type_t v65 = v49;
        *(_WORD *)&v65[4] = 2080;
        *(void *)&v65[6] = v50;
        *(_WORD *)&v65[14] = 2112;
        *(void *)&v65[16] = v51;
        uint64_t v43 = "State=%s Status=%s (%d): %d%s%@";
        int v44 = LogHandle;
        os_log_type_t v45 = v30;
        uint32_t v46 = 54;
        goto LABEL_72;
      }
    }

    else if (v24 == 1001)
    {
      uint64_t v25 = (os_log_s *)EAPLogGetLogHandle(v17, v18, v19, v20);
      os_log_type_t v26 = _SC_syslog_os_log_mapping(v22);
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = *a1;
        else {
          int v28 = (&off_100010710)[v27];
        }
        int v37 = a1[122];
        uint64_t v38 = sub_100004F1C(v37);
        uint64_t v39 = EAPSecurityErrorString(a1[123]);
        unsigned int v40 = a1[123];
        uint64_t v41 = ":\n";
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v28;
        if (!v23) {
          uint64_t v41 = "";
        }
        __int16 v60 = 2080;
        uint64_t v42 = &stru_1000109F8;
        uint64_t v61 = v38;
        if (v23) {
          uint64_t v42 = v23;
        }
        __int16 v62 = 1024;
        int v63 = v37;
        __int16 v64 = 2080;
        *(void *)os_log_type_t v65 = v39;
        *(_WORD *)&v65[8] = 1024;
        *(_DWORD *)&v65[10] = v40;
        *(_WORD *)&v65[14] = 2080;
        *(void *)&v65[16] = v41;
        __int16 v66 = 2112;
        size_t v67 = v42;
        uint64_t v43 = "State=%s Status=%s (%d): %s (%d)%s%@";
        int v44 = v25;
        os_log_type_t v45 = v26;
        uint32_t v46 = 64;
LABEL_72:
        _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);
      }
    }

    else
    {
      uint64_t v33 = (os_log_s *)EAPLogGetLogHandle(v17, v18, v19, v20);
      os_log_type_t v34 = _SC_syslog_os_log_mapping(v22);
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = *a1;
        else {
          uint64_t v36 = (&off_100010710)[v35];
        }
        int v52 = a1[122];
        uint64_t v53 = sub_100004F1C(v52);
        *(_DWORD *)buf = 136316162;
        uint64_t v54 = ":\n";
        *(void *)&uint8_t buf[4] = v36;
        if (!v23) {
          uint64_t v54 = "";
        }
        __int16 v60 = 2080;
        uint64_t v61 = v53;
        __int16 v62 = 1024;
        os_log_type_t v55 = &stru_1000109F8;
        if (v23) {
          os_log_type_t v55 = v23;
        }
        int v63 = v52;
        __int16 v64 = 2080;
        *(void *)os_log_type_t v65 = v54;
        *(_WORD *)&v65[8] = 2112;
        *(void *)&v65[10] = v55;
        uint64_t v43 = "State=%s Status=%s (%d)%s%@";
        int v44 = v33;
        os_log_type_t v45 = v34;
        uint32_t v46 = 48;
        goto LABEL_72;
      }
    }

    my_CFRelease(&v57);
  }

  sub_100009CD8(*((void *)a1 + 3), (uint64_t)Mutable);
  return my_CFRelease(&v58);
}

void sub_100007AF0(CFMutableDictionaryRef theDict, void *value)
{
  if (value)
  {
    CFDictionarySetValue(theDict, @"RequiredProperties", value);
  }

  else
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, @"UserName");
    CFDictionarySetValue(theDict, @"RequiredProperties", Mutable);
    my_CFRelease(&Mutable);
  }

uint64_t sub_100007B78(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v6);
  return my_CFRelease(&v6);
}

void sub_100007BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a4 + 224))
  {
    uint64_t v5 = EAPOLClientItemIDGetProfileID();
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
      if (v7)
      {
        uint64_t v11 = (const void *)v7;
        if (!EAPOLClientConfigurationGetProfileWithID(v7, v6))
        {
          LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v12, v13, v14);
          os_log_type_t v16 = _SC_syslog_os_log_mapping(5LL);
          if (os_log_type_enabled(LogHandle, v16))
          {
            uint64_t v17 = sub_100009408(*(void *)(a4 + 24), 0LL);
            int v21 = 136315138;
            uint64_t v22 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v16,  "%s: profile no longer exists, stopping",  (uint8_t *)&v21,  0xCu);
          }

          uint64_t v18 = sub_100009408(*(void *)(a4 + 24), 0LL);
          EAPOLControlStop(v18);
        }

        CFRelease(v11);
      }

      else
      {
        uint64_t v19 = (os_log_s *)EAPLogGetLogHandle(0LL, v8, v9, v10);
        os_log_type_t v20 = _SC_syslog_os_log_mapping(3LL);
        if (os_log_type_enabled(v19, v20))
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "EAPOLClientConfiguration() failed", (uint8_t *)&v21, 2u);
        }
      }
    }
  }

BOOL sub_100007D28(const __CFDictionary *a1, const void *a2, int a3)
{
  if (a1)
  {
    CFPropertyListRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        a3 = CFBooleanGetValue(Value);
      }
    }
  }

  return a3 != 0;
}

void *sub_100007D88(const __CFData *a1)
{
  int Length = CFDataGetLength(a1);
  int v3 = malloc(Length + 1);
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v3, BytePtr, Length);
  *((_BYTE *)v3 + Length) = 0;
  return v3;
}

CFArrayRef sub_100007DE4(const __CFArray *result)
{
  if (result)
  {
    v1 = result;
    CFIndex Count = CFArrayGetCount(result);
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v3 = Count;
      CFIndex v4 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
        CFTypeID TypeID = CFNumberGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID
            && CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr)
            && valuePtr == 13)
          {
            break;
          }
        }

        if (v3 == ++v4) {
          return 0LL;
        }
      }

      return (const __CFArray *)1;
    }
  }

  return result;
}

BOOL sub_100007E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 280);
  if (v4)
  {
    uint64_t v5 = EAPClientModulePluginCopyIdentity(v4, a1 + 288);
    *(void *)buf = v5;
    if (v5)
    {
      uint64_t v6 = (const char *)my_CFStringToCString(v5, 134217984LL);
      my_CFRelease(buf);
      if (v6)
      {
        uint64_t v7 = *(void **)(a1 + 144);
        if (v7) {
          free(v7);
        }
        *(void *)(a1 + 144) = v6;
        *(_DWORD *)(a1 + 152) = strlen(v6);
        *(_BYTE *)(a1 + 172) = 1;
      }
    }
  }

  uint64_t v8 = *(void *)(a1 + 144);
  if (v8)
  {
    uint64_t v9 = 136LL;
    if (*(void *)(a1 + 128))
    {
      uint64_t v10 = *(void *)(a1 + 128);
    }

    else
    {
      uint64_t v9 = 152LL;
      uint64_t v10 = *(void *)(a1 + 144);
    }

    uint64_t v11 = *(unsigned int *)(a1 + v9);
    BOOL v12 = sub_10000C750(1);
    if (v12)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v12, v13, v14, v15);
      os_log_type_t v17 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v17))
      {
        *(_DWORD *)buf = 68157954;
        *(_DWORD *)&uint8_t buf[4] = v11;
        __int16 v29 = 2080;
        uint64_t v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v17, "EAP Response Identity %.*s", buf, 0x12u);
      }
    }

    uint64_t v18 = (uint8_t *)EAPPacketCreate(buf, 256LL, 2LL, a2, 1LL, v10, v11, &v27);
    uint64_t v19 = sub_100009490(*(void *)(a1 + 24), 0, v18, v27);
    if ((v19 & 0x80000000) != 0)
    {
      uint64_t v23 = (os_log_s *)EAPLogGetLogHandle(v19, v20, v21, v22);
      os_log_type_t v24 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v23, v24))
      {
        *(_WORD *)os_log_type_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "EAPOLSocketTransmit failed", v26, 2u);
      }
    }

    if (v18 != buf) {
      free(v18);
    }
  }

  return v8 != 0;
}

void sub_100008094(uint64_t a1, int a2, uint64_t a3)
{
  switch(a2)
  {
    case 2:
      sub_100005644(a1, 0LL, 0LL);
      break;
    case 1:
      uint64_t v9 = *(_BYTE **)a3;
      if (!*(_BYTE *)(*(void *)a3 + 1LL) && v9[4] == 1)
      {
        int v10 = v9[8];
        if (v10 == 2)
        {
          sub_10000829C(*(_DWORD *)a1, (uint64_t)(v9 + 4));
          sub_1000083D0(a1, v9[5]);
        }

        else if (v10 == 1)
        {
          sub_1000057F0(a1, 0LL, a3);
        }

        else
        {
          sub_100007198(a1, 0LL, a3);
        }
      }

      break;
    case 0:
      uint64_t v4 = dword_100014010;
      if (sub_100009420(*(void *)(a1 + 24)))
      {
        sub_100009A24(*(void *)(a1 + 24), 0LL, 0);
        *(_BYTE *)(a1 + 496) = 0;
      }

      sub_100009488(*(void *)(a1 + 24));
      sub_100008B94(*(void *)(a1 + 16));
      *(_DWORD *)a1 = 5;
      sub_100007508((unsigned int *)a1);
      *(_DWORD *)(a1 + 120) = -1;
      *(_DWORD *)(a1 + 204) = 0;
      int v5 = *(_DWORD *)(a1 + 488);
      if (v5 == 1 || v5 == 1001 && ((int v6 = *(_DWORD *)(a1 + 492), v6 == -50) || v6 == -9809))
      {
        if ((*(void *)(a1 + 280) || *(_BYTE *)(a1 + 498)) && !*(_BYTE *)(a1 + 497))
        {
          *(_BYTE *)(a1 + 176) = 1;
          my_CFRelease(a1 + 184);
          *(_BYTE *)(a1 + 175) = 1;
          uint64_t v7 = *(void **)(a1 + 144);
          if (v7)
          {
            free(v7);
            *(void *)(a1 + 144) = 0LL;
          }

          *(_DWORD *)(a1 + 152) = 0;
          *(_BYTE *)(a1 + 172) = 0;
          *(_BYTE *)(a1 + 174) = 1;
          uint64_t v8 = *(void **)(a1 + 160);
          if (v8)
          {
            free(v8);
            *(void *)(a1 + 160) = 0LL;
          }

          *(_DWORD *)(a1 + 168) = 0;
        }
      }

      *(void *)(a1 + 488) = 0LL;
      sub_100007054(a1);
      sub_1000035E0(a1);
      sub_10000947C(*(void **)(a1 + 24), (uint64_t)sub_100008094, a1, 1LL);
      sub_100008BD8( *(CFRunLoopTimerRef **)(a1 + 16),  v4,  0,  (__CFRunLoopTimer *)sub_100008094,  (__CFRunLoopTimer *)a1,  (__CFRunLoopTimer *)2,  0LL);
      break;
  }

uint64_t sub_10000829C(unsigned int a1, uint64_t a2)
{
  unsigned int Length = EAPPacketGetLength(a2);
  if (Length < 6) {
    CFStringRef v5 = 0LL;
  }
  else {
    CFStringRef v5 = CFStringCreateWithBytes(0LL, (const UInt8 *)(a2 + 5), Length - 5, 0x8000100u, 0);
  }
  CFStringRef v11 = v5;
  LogHandle = (os_log_s *)EAPLogGetLogHandle();
  os_log_type_t v7 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(LogHandle, v7))
  {
    if (a1 > 8) {
      uint64_t v8 = "<unknown>";
    }
    else {
      uint64_t v8 = (&off_100010710)[a1];
    }
    uint64_t v9 = &stru_1000109F8;
    if (v5) {
      uint64_t v9 = v5;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "%s: Notification '%@'", buf, 0x16u);
  }

  return my_CFRelease(&v11);
}

void sub_1000083D0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = sub_10000C750(1);
  if (v4)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v4, v5, v6, v7);
    os_log_type_t v9 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v9, "EAP Response Notification", buf, 2u);
    }
  }

  EAPPacketCreate(v19, 5LL, 2LL, a2, 2LL, 0LL, 0LL, v18);
  uint64_t v10 = sub_100009490(*(void *)(a1 + 24), 0, v19, 5u);
  if ((v10 & 0x80000000) != 0)
  {
    __int16 v14 = (os_log_s *)EAPLogGetLogHandle(v10, v11, v12, v13);
    os_log_type_t v15 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)os_log_type_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "EAPOLSocketTransmit notification failed", v16, 2u);
    }
  }

void sub_1000084E0(int a1, uint64_t a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = EAPTypeStr(*(unsigned int *)(*(void *)a2 + 4 * v5));
      CFStringAppendFormat(Mutable, 0LL, @"%s(%d) ", v6, *(unsigned int *)(*(void *)a2 + 4 * v5++));
    }

    while (v5 < *(int *)(a2 + 8));
  }

  if (CFStringGetLength(Mutable) >= 1)
  {
    BOOL v7 = sub_10000C750(1);
    if (v7)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v7, v8, v9, v10);
      os_log_type_t v12 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v12))
      {
        *(_DWORD *)buf = 67109378;
        int v14 = a1;
        __int16 v15 = 2112;
        CFMutableStringRef v16 = Mutable;
        _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v12,  "EAP Request: NAK'ing EAP type %d with %@",  buf,  0x12u);
      }
    }
  }

  CFRelease(Mutable);
}

void sub_10000862C(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = EAPPacketCreate(v15, 15LL, 2LL, a2, 3LL, 0LL, *(unsigned int *)(a1 + 200), &v14);
    uint64_t v5 = (_BYTE *)v4;
    if (*(int *)(a1 + 200) >= 1)
    {
      uint64_t v6 = 0LL;
      do
      {
        *(_BYTE *)(v4 + v6 + 5) = *(_DWORD *)(*(void *)(a1 + 192) + 4 * v6);
        ++v6;
      }

      while (v6 < *(int *)(a1 + 200));
    }
  }

  else
  {
    uint64_t v5 = (_BYTE *)EAPPacketCreate(v15, 15LL, 2LL, a2, 3LL, 0LL, 1LL, &v14);
    v5[5] = 0;
  }

  uint64_t v7 = sub_100009490(*(void *)(a1 + 24), 0, v5, v14);
  if ((v7 & 0x80000000) != 0)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v7, v8, v9, v10);
    os_log_type_t v12 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v12))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v12, "EAPOLSocketTransmit nak failed", v13, 2u);
    }
  }

  if (v5 != v15) {
    free(v5);
  }
}

uint64_t sub_100008784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 456) = 0;
  *(void *)(a1 + 464) = 0LL;
  if (*(void *)(a1 + 280))
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, a4);
    os_log_type_t v5 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v5))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "already initialized", v10, 2u);
    }
  }

  else
  {
    int v6 = a2;
    uint64_t result = EAPClientModuleLookup(a2);
    if (!result) {
      return result;
    }
    uint64_t v9 = result;
    my_CFRelease(a1 + 440);
    my_CFRelease(a1 + 448);
    *(void *)(a1 + 432) = 0LL;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(void *)(a1 + 312) = sub_100009408(*(void *)(a1 + 24), (_DWORD *)(a1 + 320));
    *(_DWORD *)(a1 + 304) = sub_100009464() - 4;
    *(void *)(a1 + 328) = *(void *)(a1 + 144);
    *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 152);
    *(void *)(a1 + 352) = *(void *)(a1 + 160);
    *(_DWORD *)(a1 + 360) = *(_DWORD *)(a1 + 168);
    sub_100008A1C(a1);
    *(void *)(a1 + 384) = *(void *)(a1 + 184);
    *(_BYTE *)(a1 + 296) = (sub_10000C618() & 0x1000) == 0;
    *(_BYTE *)(a1 + 376) = sub_10000A0E0(*(void *)(a1 + 24)) == 3;
    *(_DWORD *)(a1 + 488) = EAPClientModulePluginInit(v9, a1 + 288, a1 + 440, a1 + 492);
    *(void *)(a1 + 464) = EAPClientModulePluginEAPName(v9);
    *(_DWORD *)(a1 + 456) = v6;
    if (*(_DWORD *)(a1 + 488)) {
      return 0LL;
    }
    *(void *)(a1 + 280) = v9;
  }

  return 1LL;
}

void sub_100008914(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 472);
  if (v2 != *(void **)a2)
  {
    *(void *)(a1 + 472) = 0LL;
    *(void *)(a1 + 480) = 0LL;
    unsigned int v5 = *(_DWORD *)(a2 + 8);
    int v6 = malloc(v5);
    *(void *)(a1 + 472) = v6;
    *(_DWORD *)(a1 + 480) = v5;
    memmove(v6, *(const void **)a2, *(unsigned int *)(a2 + 8));
    if (v2) {
      free(v2);
    }
  }

uint64_t sub_10000898C(uint64_t result)
{
  if (!*(_BYTE *)(result + 496))
  {
    uint64_t v1 = result;
    uint64_t result = EAPClientModulePluginMasterSessionKeyCopyBytes(*(void *)(result + 280), result + 288, v2, 64LL);
    if ((_DWORD)result)
    {
      uint64_t result = sub_100009A24(*(void *)(v1 + 24), (uint64_t)v2, result);
      if ((_DWORD)result) {
        *(_BYTE *)(v1 + 496) = 1;
      }
    }
  }

  return result;
}

CFTypeRef sub_100008A1C(uint64_t a1)
{
  CFPropertyListRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"TLSTrustExceptionsDomain");
  CFIndex v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"TLSTrustExceptionsID");
  if (Value) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    CFStringRef v11 = 0LL;
    uint64_t v5 = sub_100009448(*(void *)(a1 + 24));
    if (v5)
    {
      CFStringRef v6 = (CFStringRef)v5;
      uint64_t v7 = @"WirelessSSID";
    }

    else
    {
      CFStringRef v6 = *(CFStringRef *)(a1 + 88);
      if (v6)
      {
        uint64_t v7 = @"ProfileID";
      }

      else
      {
        uint64_t v9 = (const char *)sub_100009408(*(void *)(a1 + 24), 0LL);
        CFStringRef v6 = CFStringCreateWithCString(0LL, v9, 0x600u);
        CFStringRef v11 = v6;
        uint64_t v7 = @"NetworkInterfaceName";
      }
    }

    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(0LL, 0LL, *(CFDictionaryRef *)(a1 + 48));
    CFDictionarySetValue(MutableCopy, @"TLSTrustExceptionsDomain", v7);
    CFDictionarySetValue(MutableCopy, @"TLSTrustExceptionsID", v6);
    *(void *)(a1 + 368) = MutableCopy;
    return (CFTypeRef)my_CFRelease(&v11);
  }

  else
  {
    CFTypeRef result = CFRetain(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 368) = result;
  }

  return result;
}

double sub_100008B34()
{
  v0 = malloc(0x30uLL);
  if (v0)
  {
    double result = 0.0;
    v0[1] = 0u;
    v0[2] = 0u;
    _OWORD *v0 = 0u;
  }

  return result;
}

void sub_100008B5C(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  if (*a1)
  {
    sub_100008B94(*a1);
    free(v1);
    *a1 = 0LL;
  }

uint64_t sub_100008B94(uint64_t result)
{
  if (result)
  {
    *(_BYTE *)(result + 40) = 0;
    *(void *)double result = 0LL;
    uint64_t v1 = result + 32;
    double result = *(void *)(result + 32);
    if (result)
    {
      CFRunLoopTimerInvalidate((CFRunLoopTimerRef)result);
      return my_CFRelease(v1);
    }
  }

  return result;
}

uint64_t sub_100008BD8( CFRunLoopTimerRef *a1, uint64_t a2, int a3, __CFRunLoopTimer *a4, __CFRunLoopTimer *a5, __CFRunLoopTimer *a6, __CFRunLoopTimer *a7)
{
  if (!a1) {
    return 0LL;
  }
  sub_100008B94((uint64_t)a1);
  *((_BYTE *)a1 + 40) = 0;
  if (!a4) {
    return 0LL;
  }
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  uint64_t v14 = 1LL;
  *((_BYTE *)a1 + 40) = 1;
  BOOL v15 = a2 < 1;
  BOOL v16 = a3 < 1000;
  double Current = CFAbsoluteTimeGetCurrent();
  double v18 = 0.0;
  if (!v15 || !v16) {
    double v18 = (double)a2;
  }
  double v19 = v18 + Current;
  double v20 = (double)a3 / 1000000.0;
  if (v15 && v16) {
    double v20 = 0.001;
  }
  v23.info = a1;
  a1[4] = CFRunLoopTimerCreate(0LL, v20 + v19, 0.0, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_100008CF4, &v23);
  uint64_t v21 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v21, a1[4], kCFRunLoopDefaultMode);
  return v14;
}

uint64_t sub_100008CF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(uint64_t (**)(void, void, void))a2;
  if (*(void *)a2)
  {
    if (*(_BYTE *)(a2 + 40))
    {
      *(_BYTE *)(a2 + 40) = 0;
      return v2(*(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
    }
  }

  return result;
}

_OWORD *sub_100008D1C(CFSocketNativeHandle a1)
{
  BOOL v2 = malloc(0x30uLL);
  CFIndex v3 = v2;
  if (v2)
  {
    v2[1] = 0u;
    v2[2] = 0u;
    *BOOL v2 = 0u;
    v7.info = v2;
    *((_DWORD *)v2 + 4) = a1;
    BOOL v4 = CFSocketCreateWithNative(0LL, a1, 1uLL, (CFSocketCallBack)sub_100008DC0, &v7);
    *((void *)v3 + 1) = v4;
    *(void *)CFIndex v3 = CFSocketCreateRunLoopSource(0LL, v4, 0LL);
    double Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)v3, kCFRunLoopDefaultMode);
  }

  return v3;
}

uint64_t sub_100008DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = (uint64_t (*)(void, void))a5[3];
  if (v5) {
    return v5(a5[4], a5[5]);
  }
  return result;
}

void sub_100008DD4(CFRunLoopSourceRef **a1)
{
  if (a1)
  {
    BOOL v2 = *a1;
    if (*a1)
    {
      if (*v2)
      {
        double Current = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(Current, *v2, kCFRunLoopDefaultMode);
        CFSocketInvalidate(v2[1]);
        CFRelease(v2[1]);
        v2[1] = 0LL;
        CFRelease(*v2);
      }

      free(v2);
    }

    *a1 = 0LL;
  }

void *sub_100008E44(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_100008E50(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t sub_100008E58(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  return sub_100008E60(a1, a2, a3, 1);
}

uint64_t sub_100008E60(const __CFDictionary *a1, const void *a2, unsigned int a3, int a4)
{
  unsigned int valuePtr = a3;
  CFPropertyListRef Value = CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr)) {
    unsigned int valuePtr = a3;
  }
  if (a4)
  {
    BOOL v9 = sub_10000C750(8);
    if (v9)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v9, v10, v11, v12);
      os_log_type_t v14 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v14))
      {
        *(_DWORD *)buf = 138412546;
        double v18 = a2;
        __int16 v19 = 1024;
        unsigned int v20 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v14, "%@ = %d", buf, 0x12u);
      }
    }
  }

  return valuePtr;
}

void sub_100008F84(const __SCPreferences *a1)
{
  if (!a1) {
    return;
  }
  CFPropertyListRef Value = (const __CFNumber *)SCPreferencesGetValue(a1, @"MTU");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    uint64_t v4 = CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if (!(_DWORD)v4)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v4, v5, v6, v7);
      os_log_type_t v17 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(LogHandle, v17)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      uint64_t v12 = "com.apple.eapolclient.MTU invalid";
      uint64_t v13 = LogHandle;
      os_log_type_t v14 = v17;
      uint32_t v15 = 2;
      goto LABEL_10;
    }

    int v8 = valuePtr;
    BOOL v9 = (os_log_s *)EAPLogGetLogHandle(v4, v5, v6, v7);
    os_log_type_t v10 = _SC_syslog_os_log_mapping(5LL);
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (v8 > 575)
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)os_log_type_t v45 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Using MTU %d", buf, 8u);
      }

      dword_100014038 = valuePtr;
      goto LABEL_14;
    }

    if (v11)
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)os_log_type_t v45 = valuePtr;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = 576;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = 1280;
      uint64_t v12 = "com.apple.eapolclient.MTU %d < %d, using default %d";
      uint64_t v13 = v9;
      os_log_type_t v14 = v10;
      uint32_t v15 = 20;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
    }
  }

LABEL_14:
  double v18 = (const __CFDictionary *)SCPreferencesGetValue(a1, @"Preauthentication");
  CFTypeID v19 = CFDictionaryGetTypeID();
  if (v18 && CFGetTypeID(v18) == v19)
  {
    unsigned int v20 = (const __CFBoolean *)CFDictionaryGetValue(v18, @"EnablePreauthentication");
    CFTypeID v21 = CFBooleanGetTypeID();
    if (v20)
    {
      if (CFGetTypeID(v20) == v21) {
        LODWORD(v20) = CFBooleanGetValue(v20);
      }
      else {
        LODWORD(v20) = 0;
      }
    }

    BOOL v22 = sub_10000C750(8);
    if (v22)
    {
      os_log_type_t v26 = (os_log_s *)EAPLogGetLogHandle(v22, v23, v24, v25);
      os_log_type_t v27 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v26, v27))
      {
        int v28 = "false";
        if ((_DWORD)v20 == 1) {
          int v28 = "true";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)os_log_type_t v45 = @"EnablePreauthentication";
        *(_WORD *)&v45[8] = 2080;
        uint32_t v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ = %s", buf, 0x16u);
      }
    }

    byte_10001403C = (_DWORD)v20 != 0;
    if ((_DWORD)v20)
    {
      dword_100014014 = sub_100008E60(v18, @"ScanDelayAuthenticatedSeconds", 0xAu, 1);
      dword_100014018 = sub_100008E60(v18, @"ScanDelayRoamSeconds", 0xAu, 1);
      dword_10001401C = sub_100008E60(v18, @"ScanPeriodSeconds", 0xFFFFFFFF, 1);
      dword_100014020 = sub_100008E60(v18, @"NumberOfScans", 1u, 1);
    }
  }

  __int16 v29 = (const __CFDictionary *)SCPreferencesGetValue(a1, @"Testing");
  CFTypeID v30 = CFDictionaryGetTypeID();
  if (v29 && CFGetTypeID(v29) == v30)
  {
    uint64_t v31 = sub_100008E60(v29, @"TransmitPacketLossPercent", 0, 0);
    dword_100014040 = v31;
    if ((_DWORD)v31)
    {
      uint64_t v35 = (os_log_s *)EAPLogGetLogHandle(v31, v32, v33, v34);
      os_log_type_t v36 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)os_log_type_t v45 = dword_100014040;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Will simulate %d%% transmit packet loss", buf, 8u);
      }
    }

    uint64_t v37 = sub_100008E60(v29, @"ReceivePacketLossPercent", 0, 0);
    dword_100014044 = v37;
    if ((_DWORD)v37)
    {
      uint64_t v41 = (os_log_s *)EAPLogGetLogHandle(v37, v38, v39, v40);
      os_log_type_t v42 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v41, v42))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)os_log_type_t v45 = dword_100014044;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Will simulate %d%% receive packet loss", buf, 8u);
      }
    }
  }

uint64_t sub_100009408(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    *a2 = *(_DWORD *)(v2 + 24);
  }
  return v2 + 8;
}

uint64_t sub_100009420(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 64LL);
}

BOOL sub_10000942C(uint64_t a1, unsigned int a2, __int16 a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  return *(_BYTE *)(v5 + 64) && sub_10000C8E8(*(void *)(v5 + 88), a2, a3, a4, a5);
}

uint64_t sub_100009448(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 64)) {
    return *(void *)(v1 + 96);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100009464()
{
  if (dword_100014038) {
    return dword_100014038;
  }
  else {
    return 1280LL;
  }
}

void *sub_10000947C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

uint64_t sub_100009488(uint64_t result)
{
  *(void *)(result + 8) = 0LL;
  return result;
}

uint64_t sub_100009490(uint64_t a1, int a2, const void *a3, unsigned int a4)
{
  unsigned __int8 v6 = a2;
  if (a2)
  {
    int v8 = *(void **)(a1 + 56);
    if (v8) {
      free(v8);
    }
    *(void *)(a1 + 56) = 0LL;
    *(_DWORD *)(a1 + 64) = 0;
  }

  else
  {
    sub_100009500(a1, a3, a4);
  }

  return sub_100009568(*(void *)(a1 + 32), (ether_addr *)a1, v6, (uint64_t)a3, a4);
}

void sub_100009500(uint64_t a1, const void *a2, int a3)
{
  unsigned __int8 v6 = *(void **)(a1 + 56);
  if (v6) {
    free(v6);
  }
  if (a2)
  {
    uint64_t v7 = malloc(a3);
    *(void *)(a1 + 56) = v7;
    memmove(v7, a2, a3);
  }

  else
  {
    a3 = 0;
    *(void *)(a1 + 56) = 0LL;
  }

  *(_DWORD *)(a1 + 64) = a3;
}

uint64_t sub_100009568(uint64_t a1, ether_addr *a2, unsigned __int8 a3, uint64_t a4, unsigned int a5)
{
  if (a4) {
    unsigned int v10 = a5;
  }
  else {
    unsigned int v10 = 0;
  }
  if (a4) {
    int64_t v11 = a5 + 18;
  }
  else {
    int64_t v11 = 18LL;
  }
  __memset_chk(&v53, 0LL, v11, 1600LL);
  if (*(ether_addr **)(a1 + 144) == a2)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (!*(_BYTE *)(a1 + 110))
      {
        sub_10000B8EC(a1, 0LL);
        if (!*(_BYTE *)(a1 + 110))
        {
          BOOL v44 = sub_10000C750(1);
          if (!v44) {
            return 0xFFFFFFFFLL;
          }
          LogHandle = (os_log_s *)EAPLogGetLogHandle(v44, v45, v46, v47);
          os_log_type_t v49 = _SC_syslog_os_log_mapping(6LL);
          if (!os_log_type_enabled(LogHandle, v49)) {
            return 0xFFFFFFFFLL;
          }
          *(_DWORD *)int v52 = 67109120;
          *(_DWORD *)&v52[4] = v10 + 4;
          uint64_t v39 = "Transmit: unknown BSSID, not sending %d bytes";
          uint64_t v40 = v52;
          uint64_t v41 = LogHandle;
          os_log_type_t v42 = v49;
          uint32_t v43 = 8;
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v41, v42, v39, v40, v43);
          return 0xFFFFFFFFLL;
        }
      }

      a2 = (ether_addr *)(a1 + 104);
      __int16 v12 = -29048;
    }

    else
    {
      __int16 v12 = -29048;
      a2 = (ether_addr *)&dword_10000E374;
    }
  }

  else
  {
    __int16 v12 = -14456;
  }

  ether_addr v53 = *a2;
  __int16 v56 = v12;
  int v54 = *(_DWORD *)(a1 + 28);
  __int16 v55 = *(_WORD *)(a1 + 32);
  v57[0] = 1;
  v57[1] = a3;
  EAPOLPacketSetLength(v57, (unsigned __int16)v10);
  if (a4) {
    __memmove_chk(v58, a4, a5, 1582LL);
  }
  *(void *)&v52[10] = 0LL;
  *(void *)&v52[2] = 0LL;
  *(_WORD *)int v52 = 6930;
  if (sub_10000C750(16))
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
    os_log_type_t v14 = ether_ntoa(&v53);
    sub_10000BC30((uint64_t)v14, v57, v10 + 4, 0, Mutable);
    CFStringAppendFormat(Mutable, 0LL, @"\n");
    uint64_t IsValid = EAPOLPacketIsValid(v57, v10 + 4, Mutable);
    CFTypeID v19 = (os_log_s *)EAPLogGetLogHandle(IsValid, v16, v17, v18);
    os_log_type_t v20 = _SC_syslog_os_log_mapping(4294967289LL);
    if (os_log_type_enabled(v19, v20))
    {
      int v50 = 138412290;
      BOOL v51 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@", (uint8_t *)&v50, 0xCu);
    }

    CFRelease(Mutable);
  }

  else if (sub_10000C750(1))
  {
    CFTypeID v21 = ether_ntoa(&v53);
    sub_10000BC30((uint64_t)v21, v57, v10 + 4, 0, 0LL);
  }

  unsigned int v22 = dword_100014040;
  if (!dword_100014040 || (uint64_t v23 = arc4random(), v23 / 0x28F5C28 >= v22))
  {
    int v30 = sub_100008E50(*(void *)(a1 + 56));
    ssize_t v34 = sendto(v30, &v53, v11, 0, (const sockaddr *)v52, 0x12u);
    uint64_t result = 0LL;
    if (v34 >= v11) {
      return result;
    }
    uint64_t v35 = (os_log_s *)EAPLogGetLogHandle(0LL, v31, v32, v33);
    os_log_type_t v36 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v35, v36)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v37 = __error();
    uint64_t v38 = strerror(*v37);
    int v50 = 136315138;
    BOOL v51 = v38;
    uint64_t v39 = "EAPOLSocketSourceTransmit: sendto failed, %s";
    uint64_t v40 = (uint8_t *)&v50;
    uint64_t v41 = v35;
    os_log_type_t v42 = v36;
    uint32_t v43 = 12;
    goto LABEL_29;
  }

  os_log_type_t v27 = (os_log_s *)EAPLogGetLogHandle(v23, v24, v25, v26);
  os_log_type_t v28 = _SC_syslog_os_log_mapping(5LL);
  uint64_t result = os_log_type_enabled(v27, v28);
  if ((_DWORD)result)
  {
    int v50 = 67109120;
    LODWORD(v51) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "Simulating transmit packet loss: dropping %d bytes",  (uint8_t *)&v50,  8u);
    return 0LL;
  }

  return result;
}

void sub_100009948(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 64))
  {
    if (*(void *)(v1 + 144) == a1)
    {
      if (sub_10000CC54())
      {
        BOOL v2 = sub_10000C750(1);
        if (v2)
        {
          LogHandle = (os_log_s *)EAPLogGetLogHandle(v2, v3, v4, v5);
          os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
          if (os_log_type_enabled(LogHandle, v7))
          {
            *(_WORD *)int v8 = 0;
            _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "PMK cache cleared", v8, 2u);
          }
        }
      }
    }
  }

uint64_t sub_1000099E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 144) == a1 && *(_BYTE *)(v1 + 64) && *(_BYTE *)(v1 + 65) && *(_BYTE *)(v1 + 110)) {
    return sub_10000CC5C(*(void *)(v1 + 88), (const ether_addr *)(v1 + 104));
  }
  else {
    return 0LL;
  }
}

BOOL sub_100009A24(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 64) || !*(_BYTE *)(v3 + 65)) {
    return 0LL;
  }
  unsigned __int8 v6 = (const ether_addr *)a1;
  if (*(void *)(v3 + 144) == a1)
  {
    sub_100009C40(*(void *)(a1 + 32));
    if (a3)
    {
      os_log_type_t v14 = sub_10000D608((const char *)(v3 + 8), (uint64_t)sub_10000C544, v3);
      *(void *)(v3 + 72) = v14;
      if (v14)
      {
        *(_BYTE *)(v3 + 68) = *(_BYTE *)(v3 + 67) ^ 1;
        *(_BYTE *)(v3 + 67) = 1;
        BOOL v15 = sub_10000C750(1);
        if (v15)
        {
          LogHandle = (os_log_s *)EAPLogGetLogHandle(v15, v16, v17, v18);
          os_log_type_t v20 = _SC_syslog_os_log_mapping(6LL);
          if (os_log_type_enabled(LogHandle, v20))
          {
            LOWORD(v27) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v20,  "4-way handshake notification scheduled",  (uint8_t *)&v27,  2u);
          }
        }
      }
    }

    BOOL v21 = sub_10000C750(1);
    if (v21)
    {
      uint64_t v25 = (os_log_s *)EAPLogGetLogHandle(v21, v22, v23, v24);
      os_log_type_t v26 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v25, v26))
      {
        int v27 = 67109120;
        LODWORD(v28) = a3;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "set_msk %d", (uint8_t *)&v27, 8u);
      }
    }

    unsigned __int8 v6 = 0LL;
  }

  else
  {
    BOOL v7 = sub_10000C750(1);
    if (v7)
    {
      int64_t v11 = (os_log_s *)EAPLogGetLogHandle(v7, v8, v9, v10);
      os_log_type_t v12 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v11, v12))
      {
        int v27 = 136315394;
        os_log_type_t v28 = ether_ntoa(v6);
        __int16 v29 = 1024;
        unsigned int v30 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "set_msk %s %d", (uint8_t *)&v27, 0x12u);
      }
    }
  }

  return sub_10000CB58(*(void *)(v3 + 88), (uint64_t)v6, a2, a3);
}

void sub_100009C40(uint64_t a1)
{
  BOOL v2 = *(_DWORD **)(a1 + 72);
  if (v2)
  {
    sub_10000D59C(v2);
    *(void *)(a1 + 72) = 0LL;
    BOOL v3 = sub_10000C750(1);
    if (v3)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v3, v4, v5, v6);
      os_log_type_t v8 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v8))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "4-way handshake notification unscheduled", v9, 2u);
      }
    }
  }

uint64_t sub_100009CCC(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 66LL);
}

void sub_100009CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)v2;
  if (*(void *)v2)
  {
    if (*(void *)(v2 + 144) != a1)
    {
      uint64_t v5 = sub_100007084(*(unsigned int **)(a1 + 40), &v36);
      switch((_DWORD)v5)
      {
        case 3:
          if (v36 != 3) {
            return;
          }
          LogHandle = (os_log_s *)EAPLogGetLogHandle(v5, v6, v7, v8);
          os_log_type_t v19 = _SC_syslog_os_log_mapping(5LL);
          if (!os_log_type_enabled(LogHandle, v19)) {
            goto LABEL_19;
          }
          os_log_type_t v20 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315138;
          uint64_t v38 = v20;
          os_log_type_t v12 = "Supplicant %s Authenticating, requires user input";
          break;
        case 4:
          BOOL v21 = sub_10000C750(1);
          if (!v21) {
            goto LABEL_19;
          }
          LogHandle = (os_log_s *)EAPLogGetLogHandle(v21, v22, v23, v24);
          os_log_type_t v19 = _SC_syslog_os_log_mapping(6LL);
          if (!os_log_type_enabled(LogHandle, v19)) {
            goto LABEL_19;
          }
          uint64_t v25 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315138;
          uint64_t v38 = v25;
          os_log_type_t v12 = "Supplicant %s Authenticated - Complete";
          break;
        case 5:
          uint64_t v9 = (os_log_s *)EAPLogGetLogHandle(v5, v6, v7, v8);
          os_log_type_t v10 = _SC_syslog_os_log_mapping(5LL);
          if (!os_log_type_enabled(v9, v10)) {
            goto LABEL_19;
          }
          int64_t v11 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315394;
          uint64_t v38 = v11;
          __int16 v39 = 1024;
          int v40 = v36;
          os_log_type_t v12 = "Supplicant %s Held, status %d";
          uint64_t v13 = v9;
          os_log_type_t v14 = v10;
          uint32_t v15 = 18;
          goto LABEL_18;
        default:
          return;
      }

      uint64_t v13 = LogHandle;
      os_log_type_t v14 = v19;
      uint32_t v15 = 12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
LABEL_19:
      *(_BYTE *)(a1 + 48) = 1;
      *(_BYTE *)(*(void *)(a1 + 32) + 120LL) = 1;
      return;
    }

    int v17 = sub_100007084(*(unsigned int **)(a1 + 40), &v36);
    switch(v17)
    {
      case 4:
        if (!*(_BYTE *)(v2 + 67))
        {
          sub_100009C40(v2);
          sub_10000A050((uint64_t *)v2);
          *(_BYTE *)(v2 + 67) = 1;
        }

        break;
      case 5:
        sub_100009C40(v2);
        *(_BYTE *)(v2 + 67) = 0;
        sub_10000A050((uint64_t *)v2);
        break;
      case 6:
        if (!*(_BYTE *)(*(void *)(a1 + 32) + 64LL)) {
          *(_BYTE *)(v2 + 68) = 1;
        }
        break;
      case 7:
        sub_100009C40(v2);
        *(_BYTE *)(v2 + 67) = 0;
        break;
      default:
        break;
    }

    uint64_t v26 = EAPOLClientReportStatus(v3, a2);
    if ((_DWORD)v26)
    {
      int v30 = v26;
      uint64_t v31 = (os_log_s *)EAPLogGetLogHandle(v26, v27, v28, v29);
      os_log_type_t v32 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = strerror(v30);
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "EAPOLClientReportStatus failed: %s", buf, 0xCu);
      }
    }

    if (byte_10001403C)
    {
      uint64_t v34 = *(void *)(a1 + 32);
      if (*(_BYTE *)(v34 + 64))
      {
        if (v17 == 4)
        {
          if ((dword_100014014 & 0x80000000) == 0) {
            sub_100008BD8( *(CFRunLoopTimerRef **)(v34 + 128),  dword_100014014,  0,  (__CFRunLoopTimer *)sub_10000C0B0,  *(__CFRunLoopTimer **)(a1 + 32),  0LL,  0LL);
          }
        }

        else
        {
          sub_100008B94(*(void *)(v34 + 128));
          sub_10000CD74(*(void *)(v34 + 88));
          for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 152LL); i; uint64_t i = *(void *)(i + 72))
          {
            *(_BYTE *)(i + 48) = 1;
            *(_BYTE *)(*(void *)(i + 32) + 120LL) = 1;
          }
        }
      }
    }
  }

uint64_t *sub_10000A050(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result)
  {
    BOOL v2 = sub_10000C750(1);
    if (v2)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v2, v3, v4, v5);
      os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v7))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "force renew", v8, 2u);
      }
    }

    return (uint64_t *)EAPOLClientForceRenew(v1);
  }

  return result;
}

uint64_t sub_10000A0E0(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 172LL);
}

uint64_t sub_10000A0EC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if (*(_BYTE *)(v1 + 64))
    {
      uint64_t result = LinkAddresses_create();
      uint64_t v20 = result;
      if (result)
      {
        BOOL v2 = (char *)(v1 + 8);
        uint64_t v3 = LinkAddresses_lookup(result, v1 + 8);
        if (v3)
        {
          uint64_t v4 = v3;
          int v5 = *(unsigned __int8 *)(v3 + 4);
          LogHandle = (os_log_s *)EAPLogGetLogHandle();
          if (v5 == 6)
          {
            os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(LogHandle, v7))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v22 = ether_ntoa((const ether_addr *)(v1 + 28));
              _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "current local MAC address: [%s]", buf, 0xCu);
            }

            uint64_t v8 = v4 + *(unsigned __int8 *)(v4 + 5);
            __int16 v9 = *(_WORD *)(v8 + 12);
            *(_DWORD *)(v1 + 28) = *(_DWORD *)(v8 + 8);
            uint64_t v10 = v1 + 28;
            *(_WORD *)(v10 + 4) = v9;
            int64_t v11 = (os_log_s *)EAPLogGetLogHandle();
            os_log_type_t v12 = _SC_syslog_os_log_mapping(6LL);
            if (!os_log_type_enabled(v11, v12)) {
              return LinkAddresses_free(&v20);
            }
            uint64_t v13 = ether_ntoa((const ether_addr *)v10);
            *(_DWORD *)buf = 136315138;
            uint64_t v22 = v13;
            os_log_type_t v14 = "new local MAC address: [%s]";
            uint32_t v15 = v11;
            os_log_type_t v16 = v12;
            goto LABEL_14;
          }

          os_log_type_t v19 = _SC_syslog_os_log_mapping(3LL);
          if (os_log_type_enabled(LogHandle, v19))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v22 = v2;
            os_log_type_t v14 = "interface '%s' is not ethernet";
            uint32_t v15 = LogHandle;
            os_log_type_t v16 = v19;
            goto LABEL_14;
          }
        }

        else
        {
          int v17 = (os_log_s *)EAPLogGetLogHandle();
          os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
          if (os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v22 = v2;
            os_log_type_t v14 = "interface '%s' does not exist";
            uint32_t v15 = v17;
            os_log_type_t v16 = v18;
LABEL_14:
            _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, 0xCu);
          }
        }

        return LinkAddresses_free(&v20);
      }
    }
  }

  return result;
}

char *sub_10000A304(const char *a1, int *a2, void *a3)
{
  uint64_t v83 = 0LL;
  os_log_type_t v84 = 0LL;
  uint64_t v82 = 0LL;
  *a3 = 0LL;
  BOOL v6 = sub_10000C764(a1, &v82);
  if (fstat(0, &v88) || (v88.st_mode & 0xF000) != 0xC000)
  {
    uint64_t v8 = eapol_socket(a1, v6);
    CFSocketNativeHandle v7 = v8;
    if ((_DWORD)v8 == -1)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v8, v9, v10, v11);
      os_log_type_t v33 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(LogHandle, v33))
      {
        uint64_t v34 = __error();
        uint64_t v35 = strerror(*v34);
        v88.st_dev = 136315394;
        *(void *)&v88.st_mode = a1;
        WORD2(v88.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v88.st_ino + 6) = (__darwin_ino64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v33, "eapol_socket(%s) failed, %s", (uint8_t *)&v88, 0x16u);
      }

      os_log_type_t v16 = 0LL;
      BOOL v21 = 0LL;
      CFRunLoopObserverRef v26 = 0LL;
      CFSocketNativeHandle v7 = -1;
      goto LABEL_20;
    }
  }

  else
  {
    CFSocketNativeHandle v7 = 0;
  }

  os_log_type_t v12 = (CFRunLoopSourceRef *)sub_100008D1C(v7);
  os_log_type_t v84 = v12;
  if (!v12)
  {
    int v36 = (os_log_s *)EAPLogGetLogHandle(0LL, v13, v14, v15);
    os_log_type_t v37 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v36, v37))
    {
      LOWORD(v88.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "FDHandler_create failed", (uint8_t *)&v88, 2u);
    }

    os_log_type_t v16 = 0LL;
    goto LABEL_19;
  }

  os_log_type_t v16 = v12;
  int v17 = (char *)malloc(0xB0uLL);
  if (!v17)
  {
    uint64_t v38 = (os_log_s *)EAPLogGetLogHandle(0LL, v18, v19, v20);
    os_log_type_t v39 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v38, v39))
    {
      LOWORD(v88.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "malloc failed", (uint8_t *)&v88, 2u);
    }

LABEL_19:
    BOOL v21 = 0LL;
    CFRunLoopObserverRef v26 = 0LL;
    goto LABEL_20;
  }

  BOOL v21 = v17;
  __int128 v22 = 0uLL;
  *((_OWORD *)v17 + 9) = 0u;
  *((_OWORD *)v17 + 10) = 0u;
  *((_OWORD *)v17 + 7) = 0u;
  *((_OWORD *)v17 + 8) = 0u;
  *((_OWORD *)v17 + 5) = 0u;
  *((_OWORD *)v17 + 6) = 0u;
  *((_OWORD *)v17 + 3) = 0u;
  *((_OWORD *)v17 + 4) = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  *((_OWORD *)v17 + 2) = 0u;
  *(_OWORD *)int v17 = 0u;
  if (v6)
  {
    *(void *)&v88.st_dev = 0LL;
    memset(&v88.st_uid, 0, 24);
    v88.st_ino = (__darwin_ino64_t)v17;
    CFRunLoopObserverRef v26 = CFRunLoopObserverCreate( 0LL,  0x20uLL,  1u,  0LL,  (CFRunLoopObserverCallBack)sub_10000A978,  (CFRunLoopObserverContext *)&v88);
    if (v26)
    {
      sub_100008B34();
      uint64_t v83 = v27;
      if (v27)
      {
        uint64_t v31 = v27;
        __int128 v22 = 0uLL;
        goto LABEL_33;
      }

      __int16 v62 = (os_log_s *)EAPLogGetLogHandle(0LL, v28, v29, v30);
      os_log_type_t v63 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(v62, v63)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      __int16 v64 = "Timer_create failed";
    }

    else
    {
      __int16 v62 = (os_log_s *)EAPLogGetLogHandle(0LL, v23, v24, v25);
      os_log_type_t v63 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(v62, v63)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      __int16 v64 = "CFRunLoopObserverCreate failed";
    }

    int v77 = buf;
    uint64_t v78 = v62;
    os_log_type_t v79 = v63;
    uint32_t v80 = 2;
    goto LABEL_51;
  }

  uint64_t v31 = 0LL;
  CFRunLoopObserverRef v26 = 0LL;
LABEL_33:
  *(void *)&v88.st_dev = v22;
  *(_OWORD *)&v88.st_uid = v22;
  v88.st_atimespec.tv_sec = 0LL;
  v88.st_ino = (__darwin_ino64_t)v21;
  SCDynamicStoreRef v41 = SCDynamicStoreCreate( 0LL,  @"EAPOLClient",  (SCDynamicStoreCallBack)sub_10000A9A8,  (SCDynamicStoreContext *)&v88);
  if (v41)
  {
    uint64_t v45 = v41;
    CFMutableStringRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    BOOL v81 = v6;
    int v87 = Mutable;
    uint64_t v47 = &kSCEntNetAirPort;
    if (!v6) {
      uint64_t v47 = &kSCEntNetLink;
    }
    CFStringRef v86 = SCDynamicStoreKeyCreate( 0LL,  @"%@/%@/%@/%s/%@",  kSCDynamicStoreDomainState,  kSCCompNetwork,  kSCCompInterface,  a1,  *v47);
    CFArrayAppendValue(Mutable, v86);
    my_CFRelease(&v86);
    SCDynamicStoreSetNotificationKeys(v45, Mutable, 0LL);
    my_CFRelease(&v87);
    CFRunLoopSourceRef RunLoopSource = SCDynamicStoreCreateRunLoopSource(0LL, v45, 0LL);
    os_log_type_t v85 = RunLoopSource;
    double Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    my_CFRelease(&v85);
    *((void *)v21 + 19) = 0LL;
    *((void *)v21 + 20) = v21 + 152;
    __strlcpy_chk(v21 + 8, a1, 16LL, 16LL);
    int v50 = strlen(v21 + 8);
    int v51 = *a2;
    *((_DWORD *)v21 + 6) = v50;
    *((_DWORD *)v21 + 7) = v51;
    *((_WORD *)v21 + 16) = *((_WORD *)a2 + 2);
    *((void *)v21 + 7) = v16;
    *((void *)v21 + 17) = v45;
    v21[64] = v81;
    *((void *)v21 + 11) = v82;
    int v52 = sub_100008E44(v16, (uint64_t)sub_10000AB70, (uint64_t)v21, 0LL);
    sub_10000A9A8((uint64_t)v52, v53, (uint64_t)v21);
    uint64_t v54 = EAPOLClientAttach(v21 + 8, sub_10000B154, v21, a3, buf);
    *(void *)BOOL v21 = v54;
    if (!v54)
    {
      uint64_t v58 = (os_log_s *)EAPLogGetLogHandle(0LL, v55, v56, v57);
      os_log_type_t v59 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v58, v59))
      {
        __int16 v60 = strerror(*(int *)buf);
        v88.st_dev = 136315394;
        *(void *)&v88.st_mode = v21 + 8;
        WORD2(v88.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v88.st_ino + 6) = (__darwin_ino64_t)v60;
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "EAPOLClientAttach(%s) failed: %s", (uint8_t *)&v88, 0x16u);
      }
    }

    if (v26)
    {
      *((void *)v21 + 14) = v26;
      uint64_t v61 = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(v61, *((CFRunLoopObserverRef *)v21 + 14), kCFRunLoopDefaultMode);
    }

    *((void *)v21 + 16) = v31;
    return v21;
  }

  os_log_type_t v65 = (os_log_s *)EAPLogGetLogHandle(0LL, v42, v43, v44);
  os_log_type_t v66 = _SC_syslog_os_log_mapping(5LL);
  BOOL v67 = os_log_type_enabled(v65, v66);
  if (v67)
  {
    int v71 = SCError();
    uint64_t v72 = SCErrorString(v71);
    *(_DWORD *)buf = 136315138;
    uint64_t v90 = v72;
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "SCDynamicStoreCreate() failed, %s", buf, 0xCu);
  }

  uint64_t v73 = (os_log_s *)EAPLogGetLogHandle(v67, v68, v69, v70);
  os_log_type_t v74 = _SC_syslog_os_log_mapping(5LL);
  if (os_log_type_enabled(v73, v74))
  {
    int v75 = SCError();
    uint64_t v76 = SCErrorString(v75);
    v88.st_dev = 136315138;
    *(void *)&v88.st_mode = v76;
    __int16 v64 = "link_event_register failed: %s";
    int v77 = (uint8_t *)&v88;
    uint64_t v78 = v73;
    os_log_type_t v79 = v74;
    uint32_t v80 = 12;
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, v78, v79, v64, v77, v80);
  }

LABEL_20:
  if (v82) {
    sub_10000CD50(v82);
  }
  if (v21) {
    free(v21);
  }
  if (v16)
  {
    sub_100008DD4(&v84);
  }

  else if ((v7 & 0x80000000) == 0)
  {
    close(v7);
  }

  if (v26) {
    CFRelease(v26);
  }
  sub_100008B5C(&v83);
  return 0LL;
}

void sub_10000A978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a3 + 120))
  {
    sub_10000BF48();
    *(_BYTE *)(a3 + 120) = 0;
  }

void sub_10000A9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a3 + 64))
  {
    int v4 = *(unsigned __int8 *)(a3 + 66);
    sub_10000B8EC(a3, 0LL);
  }

  else
  {
    int v5 = socket(2, 2, 0);
    if (v5 < 0)
    {
      perror("socket");
      BOOL v8 = 0;
    }

    else
    {
      int v6 = v5;
      *(_OWORD *)buf = 0u;
      memset(v20, 0, sizeof(v20));
      __strlcpy_chk(buf, a3 + 8, 16LL, 16LL);
      BOOL v8 = ioctl(v6, 0xC02C6938uLL, buf) >= 0 && (v20[2] & 3) != 1;
      close(v6);
    }

    *(_BYTE *)(a3 + 66) = v8;
  }

  BOOL v9 = sub_10000C750(1);
  if (v9)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v9, v10, v11, v12);
    os_log_type_t v14 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v14))
    {
      if (*(_BYTE *)(a3 + 66)) {
        uint64_t v15 = "active";
      }
      else {
        uint64_t v15 = "inactive";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v14, "link %s", buf, 0xCu);
    }
  }

  uint64_t v16 = *(void *)(a3 + 144);
  if (v16)
  {
    if (*(_BYTE *)(a3 + 66))
    {
      BOOL v17 = 1;
    }

    else
    {
      uint64_t v18 = *(void **)(v16 + 56);
      if (v18) {
        free(v18);
      }
      *(void *)(v16 + 56) = 0LL;
      *(_DWORD *)(v16 + 64) = 0;
      uint64_t v16 = *(void *)(a3 + 144);
      BOOL v17 = *(_BYTE *)(a3 + 66) != 0;
    }

    sub_100006544(*(void *)(v16 + 40), v17);
  }

void sub_10000AB70(uint64_t a1)
{
  int v2 = sub_100008E50(*(void *)(a1 + 56));
  ssize_t v3 = recv(v2, &v66, 0x640uLL, 0);
  uint64_t v7 = v3;
  if (v3 > 0)
  {
    if ((unint64_t)v3 <= 0xD)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v3, v4, v5, v6);
      os_log_type_t v9 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(LogHandle, v9)) {
        return;
      }
      *(_DWORD *)buf = 67109376;
      LODWORD(v65[0]) = v7;
      WORD2(v65[0]) = 1024;
      *(_DWORD *)((char *)v65 + 6) = 14;
      uint64_t v10 = "Packet truncated (%d < %d)";
      uint64_t v11 = LogHandle;
      os_log_type_t v12 = v9;
      uint32_t v13 = 14;
      goto LABEL_28;
    }

    int v18 = v68;
    unsigned int v19 = __rev16(v68);
    if (v19 != 34958 && v19 != 35015)
    {
      os_log_type_t v32 = (os_log_s *)EAPLogGetLogHandle(v3, v4, v5, v6);
      os_log_type_t v33 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v65[0]) = v19;
        uint64_t v10 = "Unexpected ethertype (%02x)";
        uint64_t v11 = v32;
        os_log_type_t v12 = v33;
        uint32_t v13 = 8;
        goto LABEL_28;
      }

      return;
    }

    int v21 = v3 - 14;
    if ((EAPOLPacketIsValid(v69, (v3 - 14), 0LL) & 1) == 0)
    {
      if (sub_10000C750(1))
      {
        CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
        int v36 = ether_ntoa(&v66);
        CFStringAppendFormat(Mutable, 0LL, @"Ether packet: dest %s ", v36);
        os_log_type_t v37 = ether_ntoa(&v67);
        CFStringAppendFormat(Mutable, 0LL, @"source %s type 0x%04x\n", v37, bswap32(v68) >> 16);
        uint64_t IsValid = EAPOLPacketIsValid(v69, (v7 - 14), Mutable);
        uint64_t v42 = (os_log_s *)EAPLogGetLogHandle(IsValid, v39, v40, v41);
        os_log_type_t v43 = _SC_syslog_os_log_mapping(4294967290LL);
        if (os_log_type_enabled(v42, v43))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v65[0]) = v7;
          WORD2(v65[0]) = 2112;
          *(void *)((char *)v65 + 6) = Mutable;
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Ignoring Receive Packet Size %d\n%@", buf, 0x12u);
        }

        CFRelease(Mutable);
      }

      return;
    }

    if (v18 == 36488)
    {
      *(ether_addr *)(a1 + 80) = v67;
      *(_BYTE *)(a1 + 86) = 1;
      if (*(_BYTE *)(a1 + 64))
      {
        if (!*(_BYTE *)(a1 + 110)
          || (*(_DWORD *)v67.octet == *(_DWORD *)(a1 + 104)
            ? (BOOL v22 = *(unsigned __int16 *)&v67.octet[4] == *(unsigned __int16 *)(a1 + 108))
            : (BOOL v22 = 0),
              !v22))
        {
          sub_10000B8EC(a1, &v67);
        }
      }
    }

    *(void *)(a1 + 40) = v69;
    uint64_t v23 = (void *)(a1 + 40);
    *(_DWORD *)(a1 + 48) = v21;
    if (sub_10000C750(16))
    {
      uint64_t v24 = CFStringCreateMutable(0LL, 0LL);
      uint64_t v25 = ether_ntoa(&v67);
      sub_10000BC30((uint64_t)v25, v69, v7, 1, v24);
      CFStringAppendFormat(v24, 0LL, @"\n");
      uint64_t v26 = EAPOLPacketIsValid(v69, (v7 - 14), v24);
      uint64_t v30 = (os_log_s *)EAPLogGetLogHandle(v26, v27, v28, v29);
      os_log_type_t v31 = _SC_syslog_os_log_mapping(4294967289LL);
      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 138412290;
        v65[0] = v24;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@", buf, 0xCu);
      }

      CFRelease(v24);
    }

    else if (sub_10000C750(1))
    {
      uint64_t v44 = ether_ntoa(&v67);
      sub_10000BC30((uint64_t)v44, v69, v7, 1, 0LL);
    }

    if (v18 == 36488)
    {
      uint64_t v45 = *(void *)(a1 + 144);
      if (v45) {
        goto LABEL_37;
      }
    }

    else
    {
      uint64_t v45 = *(void *)(a1 + 152);
      if (v45)
      {
        while (*(_DWORD *)v45 != *(_DWORD *)v67.octet
             || *(unsigned __int16 *)(v45 + 4) != *(unsigned __int16 *)&v67.octet[4])
        {
          uint64_t v45 = *(void *)(v45 + 72);
          if (!v45) {
            goto LABEL_62;
          }
        }

LABEL_37:
        uint64_t v46 = *(unsigned __int8 **)(v45 + 56);
        if (v46)
        {
          if (v69[1]) {
            BOOL v47 = 0;
          }
          else {
            BOOL v47 = v69[4] == 1;
          }
          if (v47 && v69[5] == v46[1])
          {
            BOOL v48 = sub_10000C750(1);
            if (v48)
            {
              int v52 = (os_log_s *)EAPLogGetLogHandle(v48, v49, v50, v51);
              os_log_type_t v53 = _SC_syslog_os_log_mapping(6LL);
              if (os_log_type_enabled(v52, v53))
              {
                int v54 = *(_DWORD *)(v45 + 64);
                *(_DWORD *)buf = 67109120;
                LODWORD(v65[0]) = v54;
                _os_log_impl((void *)&_mh_execute_header, v52, v53, "Retransmit EAP packet %d bytes", buf, 8u);
              }
            }

            sub_100009568(*(void *)(v45 + 32), (ether_addr *)v45, 0, *(void *)(v45 + 56), *(_DWORD *)(v45 + 64));
            goto LABEL_62;
          }

          free(v46);
          *(void *)(v45 + 56) = 0LL;
          *(_DWORD *)(v45 + 64) = 0;
        }

        unsigned int v56 = dword_100014044;
        if (dword_100014044 && (uint64_t v57 = arc4random(), v57 / 0x28F5C28 < v56))
        {
          uint64_t v61 = (os_log_s *)EAPLogGetLogHandle(v57, v58, v59, v60);
          os_log_type_t v62 = _SC_syslog_os_log_mapping(5LL);
          if (os_log_type_enabled(v61, v62))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65[0]) = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  v62,  "Simulate receive packet loss: dropping %d bytes",  buf,  8u);
          }
        }

        else
        {
          os_log_type_t v63 = *(void (**)(void, void, void *))(v45 + 8);
          if (v63) {
            v63(*(void *)(v45 + 16), *(void *)(v45 + 24), v23);
          }
        }
      }
    }

LABEL_62:
    *uint64_t v23 = 0LL;
    return;
  }

  if (v3 < 0)
  {
    os_log_type_t v14 = (os_log_s *)EAPLogGetLogHandle(v3, v4, v5, v6);
    os_log_type_t v15 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = __error();
      BOOL v17 = strerror(*v16);
      *(_DWORD *)buf = 136315138;
      v65[0] = v17;
      uint64_t v10 = "recv failed %s";
      uint64_t v11 = v14;
      os_log_type_t v12 = v15;
      uint32_t v13 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }

uint64_t sub_10000B154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFDictionaryRef theDict = 0LL;
  if ((_DWORD)a2)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, a4);
    os_log_type_t v20 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v14 = os_log_type_enabled(LogHandle, v20);
    if ((_DWORD)v14)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = a3 + 8;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v20, "%s: EAPOLController died", buf, 0xCu);
    }

    if (*(_DWORD *)(a3 + 172) != 1) {
LABEL_22:
    }
      exit(0);
LABEL_19:
    uint64_t v35 = a3;
    uint64_t v30 = (os_log_s *)EAPLogGetLogHandle(v14, v15, v16, v17);
    os_log_type_t v31 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = a3 + 8;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s STOP", buf, 0xCu);
    }

    *(_BYTE *)(a3 + 68) = 0;
    sub_10000354C(*(void *)(*(void *)(a3 + 144) + 40LL));
    sub_10000B408(&v35);
    goto LABEL_22;
  }

  uint64_t Config = EAPOLClientGetConfig(a1, &theDict);
  if ((_DWORD)Config)
  {
    int __errnum = Config;
    int v21 = (os_log_s *)EAPLogGetLogHandle(Config, v6, v7, v8);
    os_log_type_t v22 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v14 = os_log_type_enabled(v21, v22);
    if (!(_DWORD)v14) {
      goto LABEL_19;
    }
    uint64_t v23 = strerror(__errnum);
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = a3 + 8;
    __int16 v38 = 2080;
    uint64_t v39 = v23;
    uint64_t v24 = "%s: EAPOLClientGetConfig failed, %s";
    uint64_t v25 = v21;
    os_log_type_t v26 = v22;
    uint32_t v27 = 22;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, v27);
    goto LABEL_19;
  }

  if (!theDict)
  {
    uint64_t v28 = (os_log_s *)EAPLogGetLogHandle(0LL, v6, v7, v8);
    os_log_type_t v29 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v14 = os_log_type_enabled(v28, v29);
    if (!(_DWORD)v14) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = a3 + 8;
    uint64_t v24 = "%s: EAPOLClientGetConfig returned NULL control";
    goto LABEL_17;
  }

  CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"Command");
  BOOL v10 = sub_10000B720(Value, &v34);
  if (!v10)
  {
    uint64_t v28 = (os_log_s *)EAPLogGetLogHandle(v10, v11, v12, v13);
    os_log_type_t v29 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v14 = os_log_type_enabled(v28, v29);
    if (!(_DWORD)v14) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = a3 + 8;
    uint64_t v24 = "%s: invalid/missing command";
LABEL_17:
    uint64_t v25 = v28;
    os_log_type_t v26 = v29;
    uint32_t v27 = 12;
    goto LABEL_18;
  }

  uint64_t v14 = sub_1000053EC(*(void *)(*(void *)(a3 + 144) + 40LL), v34, theDict, v13);
  if ((v14 & 1) != 0) {
    goto LABEL_19;
  }
  return my_CFRelease(&theDict);
}

void sub_10000B408(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      sub_100008DD4((CFRunLoopSourceRef **)(v2 + 56));
      if (*(_BYTE *)(v2 + 64)) {
        sub_10000CD50(*(void *)(v2 + 88));
      }
      my_CFRelease(v2 + 96);
      if (*(void *)(v2 + 112))
      {
        double Current = CFRunLoopGetCurrent();
        CFRunLoopRemoveObserver(Current, *(CFRunLoopObserverRef *)(v2 + 112), kCFRunLoopDefaultMode);
        my_CFRelease(v2 + 112);
      }

      my_CFRelease(v2 + 136);
      if (*(_BYTE *)(v2 + 68))
      {
        usleep(0x7A120u);
        sub_10000A050((uint64_t *)v2);
      }

      EAPOLClientDetach(v2);
      sub_100008B5C((uint64_t *)(v2 + 128));
      sub_100009C40(v2);
      free((void *)v2);
    }

    *a1 = 0LL;
  }

uint64_t sub_10000B4CC(uint64_t a1, CFDictionaryRef theDict, _DWORD *a3)
{
  ssize_t v3 = theDict;
  int v32 = 0;
  char v31 = 0;
  os_log_type_t v29 = 0LL;
  uint64_t v30 = 0LL;
  *a3 = -1;
  if (!theDict)
  {
    int v19 = 0;
    goto LABEL_9;
  }

  CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"Command");
  BOOL v6 = sub_10000B720(Value, &v28);
  if (!v6) {
    goto LABEL_23;
  }
  if (v28 != 1)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v6, v7, v8, v9);
    os_log_type_t v25 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v25)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v34 = a1 + 8;
    os_log_type_t v26 = "%s: received stop command";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v25, v26, buf, 0xCu);
    goto LABEL_23;
  }

  BOOL v10 = CFDictionaryGetValue(v3, @"Mode");
  if (v10)
  {
    BOOL v11 = sub_10000B720(v10, &v32);
    if (!v11)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v11, v12, v13, v14);
      os_log_type_t v25 = _SC_syslog_os_log_mapping(5LL);
      if (!os_log_type_enabled(LogHandle, v25)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = a1 + 8;
      os_log_type_t v26 = "%s: Mode property invalid";
      goto LABEL_22;
    }
  }

  uint64_t v15 = (const __CFDictionary *)CFDictionaryGetValue(v3, @"Configuration");
  if (!v15)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(0LL, v16, v17, v18);
    os_log_type_t v25 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v25))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = a1 + 8;
      os_log_type_t v26 = "%s: configuration empty";
      goto LABEL_22;
    }

LABEL_23:
    sub_10000B86C(&v30);
    sub_10000364C(&v29);
    return 0LL;
  }

  ssize_t v3 = v15;
  int v19 = v32;
LABEL_9:
  *(_DWORD *)(a1 + 172) = v19;
  os_log_type_t v20 = sub_10000B784(a1, 0LL);
  uint64_t v30 = v20;
  if (!v20) {
    goto LABEL_23;
  }
  int v21 = v20;
  os_log_type_t v22 = sub_100006DFC((uint64_t)v20);
  os_log_type_t v29 = v22;
  if (!v22) {
    goto LABEL_23;
  }
  uint64_t v23 = (uint64_t)v22;
  if ((v32 & 0xFFFFFFFE) == 2) {
    sub_100007018((uint64_t)v22);
  }
  if (v3)
  {
    sub_10000374C(v23, v3, &v31);
    if (v31) {
      return 0LL;
    }
  }

  v21[5] = v23;
  return v23;
}

BOOL sub_10000B720(const void *a1, void *a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  return a1 && CFGetTypeID(a1) == TypeID && CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, a2) != 0;
}

void *sub_10000B784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x58uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    v4[10] = 0LL;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *(_OWORD *)uint64_t v4 = 0u;
    v4[4] = a1;
    if (a2)
    {
      *(_DWORD *)uint64_t v4 = *(_DWORD *)a2;
      *((_WORD *)v4 + 2) = *(_WORD *)(a2 + 4);
      BOOL v6 = *(void **)(a1 + 160);
      v4[10] = v6;
      *BOOL v6 = v4;
      *(void *)(a1 + 160) = v4 + 9;
      ++*(_DWORD *)(a1 + 168);
    }

    else
    {
      *(void *)(a1 + 144) = v4;
    }
  }

  else
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v8))
    {
      v10[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "malloc failed", (uint8_t *)v10, 2u);
    }
  }

  return v5;
}

void sub_10000B86C(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = v2[4];
      if (v2 == *(void **)(v3 + 144))
      {
        *(void *)(v3 + 144) = 0LL;
      }

      else
      {
        uint64_t v4 = v2[9];
        uint64_t v5 = (void *)v2[10];
        if (v4)
        {
          *(void *)(v4 + 80) = v5;
          uint64_t v5 = (void *)v2[10];
        }

        else
        {
          *(void *)(v3 + 160) = v5;
        }

        *uint64_t v5 = v4;
        --*(_DWORD *)(v3 + 168);
      }

      BOOL v6 = (void *)v2[7];
      if (v6) {
        free(v6);
      }
      free(v2);
    }

    *a1 = 0LL;
  }

void sub_10000B8EC(uint64_t a1, _BYTE *a2)
{
  if (!*(_BYTE *)(a1 + 64)) {
    return;
  }
  if (sub_10000C880(*(void *)(a1 + 88), (uint64_t)v34))
  {
    *(_BYTE *)(a1 + 66) = 1;
    if (a2)
    {
      if (*(_BYTE *)(a1 + 110))
      {
        if (*(_DWORD *)a2 == *(_DWORD *)(a1 + 104) && *((unsigned __int16 *)a2 + 2) == *(unsigned __int16 *)(a1 + 108))
        {
          int v5 = 0;
LABEL_34:
          *(_BYTE *)(a1 + 110) = 1;
          int v21 = *(_DWORD *)a2;
          *(_WORD *)(a1 + 108) = *((_WORD *)a2 + 2);
          *(_DWORD *)(a1 + 104) = v21;
          CFStringRef v22 = sub_10000CDEC(*(void *)(a1 + 88));
          BOOL v23 = sub_10000CA08(*(void *)(a1 + 88)) != 0;
          os_log_type_t v25 = (const __CFString **)(a1 + 96);
          uint64_t v24 = *(const void **)(a1 + 96);
          *(_BYTE *)(a1 + 65) = v23;
          if (v24 && v22 && !CFEqual(v24, v22))
          {
            sub_100008B94(*(void *)(a1 + 128));
            sub_10000CD74(*(void *)(a1 + 88));
          }

          my_CFRelease(a1 + 96);
          *os_log_type_t v25 = v22;
          if (v5)
          {
            BOOL v26 = sub_10000C750(1);
            if (v26)
            {
              LogHandle = (os_log_s *)EAPLogGetLogHandle(v26, v27, v28, v29);
              os_log_type_t v31 = _SC_syslog_os_log_mapping(6LL);
              if (os_log_type_enabled(LogHandle, v31))
              {
                if (*v25) {
                  int v32 = *v25;
                }
                else {
                  int v32 = @"<unknown>";
                }
                os_log_type_t v33 = ether_ntoa((const ether_addr *)a2);
                *(_DWORD *)buf = 138412546;
                uint64_t v37 = (void *)v32;
                __int16 v38 = 2080;
                uint64_t v39 = v33;
                _os_log_impl((void *)&_mh_execute_header, LogHandle, v31, "Associated SSID %@ BSSID %s", buf, 0x16u);
              }
            }
          }

          return;
        }
      }
    }

    else
    {
      if (*(_BYTE *)(a1 + 110)) {
        return;
      }
      a2 = v34;
    }

    if (byte_10001403C)
    {
      uint64_t v12 = *(void *)(a1 + 152);
      if (v12)
      {
        while (*(_DWORD *)v12 != *(_DWORD *)a2 || *(unsigned __int16 *)(v12 + 4) != *((unsigned __int16 *)a2 + 2))
        {
          uint64_t v12 = *(void *)(v12 + 72);
          if (!v12) {
            goto LABEL_30;
          }
        }

        uint64_t v35 = (void *)v12;
        if (sub_10000C750(1))
        {
          BOOL v14 = sub_10000C750(1);
          if (v14)
          {
            uint64_t v18 = (os_log_s *)EAPLogGetLogHandle(v14, v15, v16, v17);
            os_log_type_t v19 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(v18, v19))
            {
              os_log_type_t v20 = ether_ntoa((const ether_addr *)a2);
              *(_DWORD *)buf = 136315138;
              uint64_t v37 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "Removing Supplicant for %s", buf, 0xCu);
            }
          }
        }

        sub_10000364C((uint64_t **)(v12 + 40));
        sub_10000B86C(&v35);
      }

LABEL_30:
      if (*(_BYTE *)(a1 + 110) && (dword_100014018 & 0x80000000) == 0) {
        sub_100008BD8( *(CFRunLoopTimerRef **)(a1 + 128),  dword_100014018,  0,  (__CFRunLoopTimer *)sub_10000C0B0,  (__CFRunLoopTimer *)a1,  0LL,  0LL);
      }
    }

    int v5 = 1;
    goto LABEL_34;
  }

  *(_BYTE *)(a1 + 110) = 0;
  *(_BYTE *)(a1 + 65) = 0;
  sub_100009C40(a1);
  BOOL v6 = sub_10000C750(1);
  if (v6)
  {
    BOOL v10 = (os_log_s *)EAPLogGetLogHandle(v6, v7, v8, v9);
    os_log_type_t v11 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Disassociated", buf, 2u);
    }
  }

  my_CFRelease(a1 + 96);
  sub_100008B94(*(void *)(a1 + 128));
  sub_10000CD74(*(void *)(a1 + 88));
  *(_WORD *)(a1 + 66) = 0;
}

void sub_10000BC30(uint64_t a1, unsigned __int8 *a2, uint64_t a3, int a4, __CFString *a5)
{
  if (a4) {
    uint64_t v9 = "From";
  }
  else {
    uint64_t v9 = "To";
  }
  if (a4) {
    BOOL v10 = "Receive";
  }
  else {
    BOOL v10 = "Transmit";
  }
  if (a2[1])
  {
    if (a5)
    {
      uint64_t v30 = EAPOLPacketTypeStr(a2[1]);
      CFStringAppendFormat(a5, 0LL, @"%s Packet Size %d: EAPOL %s (%d) %s %s", v10, a3, v30, a2[1], v9, a1);
      return;
    }

    LogHandle = (os_log_s *)EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v15))
    {
      uint64_t v16 = EAPOLPacketTypeStr(a2[1]);
      int v17 = a2[1];
      *(_DWORD *)buf = 136316418;
      uint64_t v34 = v10;
      __int16 v35 = 1024;
      int v36 = a3;
      __int16 v37 = 2080;
      uint64_t v38 = v16;
      __int16 v39 = 1024;
      int v40 = v17;
      __int16 v41 = 2080;
      uint64_t v42 = (uint64_t)v9;
      __int16 v43 = 2080;
      *(void *)uint64_t v44 = a1;
      uint64_t v18 = "%s Packet Size %d: EAPOL %s (%d) %s %s";
LABEL_22:
      os_log_type_t v25 = LogHandle;
      os_log_type_t v26 = v15;
      uint32_t v27 = 54;
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v11 = a2[4];
    if ((v11 - 1) > 1)
    {
      if (!a5)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle();
        os_log_type_t v15 = _SC_syslog_os_log_mapping(6LL);
        if (!os_log_type_enabled(LogHandle, v15)) {
          return;
        }
        uint64_t v28 = EAPCodeStr(a2[4]);
        int v29 = a2[4];
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        int v36 = a3;
        __int16 v37 = 2080;
        uint64_t v38 = v28;
        __int16 v39 = 1024;
        int v40 = v29;
        __int16 v41 = 2080;
        uint64_t v42 = (uint64_t)v9;
        __int16 v43 = 2080;
        *(void *)uint64_t v44 = a1;
        uint64_t v18 = "%s Packet Size %d: EAP %s (%d) %s %s";
        goto LABEL_22;
      }

      uint64_t v31 = EAPCodeStr(v11);
      CFStringAppendFormat(a5, 0LL, @"%s Packet Size %d: EAP %s (%d) %s %s", v10, a3, v31, a2[4], v9, a1);
    }

    else
    {
      if (a5)
      {
        uint64_t v12 = EAPCodeStr(v11);
        uint64_t v13 = a2[4];
        uint64_t v32 = EAPTypeStr(a2[8]);
        CFStringAppendFormat( a5,  0LL,  @"%s Packet Size %d: EAP %s (%d) %s (%d) %s %s",  v10,  a3,  v12,  v13,  v32,  a2[8],  v9,  a1);
        return;
      }

      os_log_type_t v19 = (os_log_s *)EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = EAPCodeStr(a2[4]);
        int v22 = a2[4];
        uint64_t v23 = EAPTypeStr(a2[8]);
        int v24 = a2[8];
        *(_DWORD *)buf = 136316930;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        int v36 = a3;
        __int16 v37 = 2080;
        uint64_t v38 = v21;
        __int16 v39 = 1024;
        int v40 = v22;
        __int16 v41 = 2080;
        uint64_t v42 = v23;
        __int16 v43 = 1024;
        *(_DWORD *)uint64_t v44 = v24;
        *(_WORD *)&v44[4] = 2080;
        *(void *)&v44[6] = v9;
        __int16 v45 = 2080;
        uint64_t v46 = a1;
        uint64_t v18 = "%s Packet Size %d: EAP %s (%d) %s (%d) %s %s";
        os_log_type_t v25 = v19;
        os_log_type_t v26 = v20;
        uint32_t v27 = 70;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v18, buf, v27);
      }
    }
  }

void sub_10000BF48()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v3 = (void **)((char *)&v14 - ((v2 + 15) & 0xFFFFFFFF0LL));
  uint64_t v4 = *(void *)(v0 + 152);
  if (v4)
  {
    int v5 = 0;
    do
    {
      if (*(_BYTE *)(v4 + 48)) {
        v3[v5++] = (void *)v4;
      }
      uint64_t v4 = *(void *)(v4 + 72);
    }

    while (v4);
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      *(void *)&__int128 v1 = 136315138LL;
      __int128 v14 = v1;
      do
      {
        os_log_type_t v15 = *v3;
        if (sub_10000C750(1))
        {
          BOOL v7 = sub_10000C750(1);
          if (v7)
          {
            LogHandle = (os_log_s *)EAPLogGetLogHandle(v7, v8, v9, v10);
            os_log_type_t v12 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(LogHandle, v12))
            {
              uint64_t v13 = ether_ntoa((const ether_addr *)v15);
              *(_DWORD *)buf = v14;
              int v17 = v13;
              _os_log_impl((void *)&_mh_execute_header, LogHandle, v12, "Removing Supplicant for %s", buf, 0xCu);
            }
          }
        }

        sub_10000364C((uint64_t **)v15 + 5);
        sub_10000B86C(&v15);
        ++v3;
        --v6;
      }

      while (v6);
    }
  }

void sub_10000C0B0(uint64_t a1)
{
  __int128 v1 = *(const void **)(a1 + 96);
  if (v1)
  {
    sub_10000CEC4(*(void *)(a1 + 88), v1, dword_100014020, (uint64_t)sub_10000C14C, a1);
    BOOL v2 = sub_10000C750(1);
    if (v2)
    {
      LogHandle = (os_log_s *)EAPLogGetLogHandle(v2, v3, v4, v5);
      os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(LogHandle, v7))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "Scan initiated", v8, 2u);
      }
    }
  }

void sub_10000C14C(uint64_t a1, const __CFArray *a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    BOOL v43 = sub_10000C750(1);
    if (!v43) {
      goto LABEL_44;
    }
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v43, v44, v45, v46);
    os_log_type_t v48 = _SC_syslog_os_log_mapping(6LL);
    if (!os_log_type_enabled(LogHandle, v48)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    uint64_t v49 = "Scan complete: no APs";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v48, v49, buf, 2u);
    goto LABEL_44;
  }

  if (!*(_BYTE *)(a3 + 110))
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, a4);
    os_log_type_t v48 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v48)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    uint64_t v49 = "main Supplicant bssid is unknown, skipping";
    goto LABEL_43;
  }

  if (sub_10000C750(1))
  {
    CFIndex Count = CFArrayGetCount(a2);
    CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
    uint64_t v11 = Mutable;
    if (Count >= 1)
    {
      for (CFIndex i = 0LL; i != Count; ++i)
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(a2, i);
        BytePtr = (const ether_addr *)CFDataGetBytePtr(ValueAtIndex);
        if (i) {
          os_log_type_t v15 = ", ";
        }
        else {
          os_log_type_t v15 = "";
        }
        uint64_t v16 = ether_ntoa(BytePtr);
        CFStringAppendFormat(v11, 0LL, @"%s%s", v15, v16);
      }
    }

    int v17 = (os_log_s *)EAPLogGetLogHandle(Mutable, v8, v9, v10);
    os_log_type_t v18 = _SC_syslog_os_log_mapping(4294967289LL);
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = "s";
      *(_DWORD *)buf = 134218498;
      if (Count == 1) {
        os_log_type_t v19 = "";
      }
      CFIndex v52 = Count;
      __int16 v53 = 2080;
      int v54 = v19;
      __int16 v55 = 2112;
      unsigned int v56 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Scan complete: %ld AP%s = { %@ }", buf, 0x20u);
    }

    CFRelease(v11);
  }

  CFIndex v20 = CFArrayGetCount(a2);
  if (v20 >= 1)
  {
    CFIndex v21 = v20;
    for (CFIndex j = 0LL; j != v21; ++j)
    {
      uint64_t v23 = (const __CFData *)CFArrayGetValueAtIndex(a2, j);
      int v24 = CFDataGetBytePtr(v23);
      if (*(_DWORD *)v24 != *(_DWORD *)(a3 + 104) || *((unsigned __int16 *)v24 + 2) != *(unsigned __int16 *)(a3 + 108))
      {
        uint64_t v26 = *(void *)(a3 + 152);
        if (v26)
        {
          while (*(_DWORD *)v26 != *(_DWORD *)v24 || *(unsigned __int16 *)(v26 + 4) != *((unsigned __int16 *)v24 + 2))
          {
            uint64_t v26 = *(void *)(v26 + 72);
            if (!v26) {
              goto LABEL_27;
            }
          }
        }

        else
        {
LABEL_27:
          uint64_t v50 = 0LL;
          uint64_t v28 = (ether_addr *)sub_10000B784(a3, (uint64_t)v24);
          uint64_t v50 = v28;
          if (v28)
          {
            int v29 = sub_100006F24((uint64_t)v28, *(void *)(*(void *)(a3 + 144) + 40LL));
            *(void *)&v50[6].octet[4] = v29;
            if (v29)
            {
              BOOL v33 = sub_10000C750(1);
              if (v33)
              {
                __int16 v37 = (os_log_s *)EAPLogGetLogHandle(v33, v34, v35, v36);
                os_log_type_t v38 = _SC_syslog_os_log_mapping(6LL);
                if (os_log_type_enabled(v37, v38))
                {
                  __int16 v39 = ether_ntoa(v50);
                  *(_DWORD *)buf = 136315138;
                  CFIndex v52 = (CFIndex)v39;
                  _os_log_impl((void *)&_mh_execute_header, v37, v38, "Supplicant %s created", buf, 0xCu);
                }
              }

              sub_100005080(*(void *)&v50[6].octet[4], 0xFFFFFFFFLL);
            }

            else
            {
              int v40 = (os_log_s *)EAPLogGetLogHandle(0LL, v30, v31, v32);
              os_log_type_t v41 = _SC_syslog_os_log_mapping(5LL);
              if (os_log_type_enabled(v40, v41))
              {
                uint64_t v42 = ether_ntoa(v50);
                *(_DWORD *)buf = 136315138;
                CFIndex v52 = (CFIndex)v42;
                _os_log_impl((void *)&_mh_execute_header, v40, v41, "Supplicant create %s failed", buf, 0xCu);
              }

              sub_10000B86C((void **)&v50);
            }
          }
        }
      }
    }
  }

LABEL_44:
  if (dword_10001401C >= 1) {
    sub_100008BD8( *(CFRunLoopTimerRef **)(a3 + 128),  dword_10001401C,  0,  (__CFRunLoopTimer *)sub_10000C0B0,  (__CFRunLoopTimer *)a3,  0LL,  0LL);
  }
}

void sub_10000C544(uint64_t a1, uint64_t a2)
{
  BOOL v3 = sub_10000C750(1);
  if (v3)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(v3, v4, v5, v6);
    os_log_type_t v8 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "4-way handshake complete", v11, 2u);
    }
  }

  int v9 = sub_100007084(*(unsigned int **)(*(void *)(a2 + 144) + 40LL), &v12);
  if (v9 == 3)
  {
    sub_100007094(*(_DWORD **)(*(void *)(a2 + 144) + 40LL));
  }

  else if (v9 == 4 && *(_BYTE *)(a2 + 68))
  {
    sub_10000A050((uint64_t *)a2);
  }

  uint64_t v10 = *(_DWORD **)(a2 + 72);
  if (v10)
  {
    sub_10000D59C(v10);
    *(void *)(a2 + 72) = 0LL;
  }

uint64_t sub_10000C618()
{
  return dword_100014048;
}

void sub_10000C624(int a1, int a2)
{
  int v2 = a1;
  if (dword_100014048 == a1)
  {
    if (a1) {
      return;
    }
  }

  else
  {
    if (a1)
    {
      if (a2)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle();
        os_log_type_t v4 = _SC_syslog_os_log_mapping(5LL);
        if (os_log_type_enabled(LogHandle, v4))
        {
          v7[0] = 67109120;
          v7[1] = v2;
          _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v4,  "Verbose mode enabled (uint64_t LogFlags = 0x%x)",  (uint8_t *)v7,  8u);
        }
      }

      goto LABEL_12;
    }

    if (a2)
    {
      uint64_t v5 = (os_log_s *)EAPLogGetLogHandle();
      os_log_type_t v6 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v5, v6))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Verbose mode disabled", (uint8_t *)v7, 2u);
      }
    }
  }

  int v2 = 4107;
LABEL_12:
  dword_100014048 = v2;
}

BOOL sub_10000C750(int a1)
{
  return (dword_100014048 & a1) != 0;
}

BOOL sub_10000C764(const char *a1, void *a2)
{
  int v4 = Apple80211Open(&v12);
  if (v4)
  {
    int v5 = v4;
    LogHandle = (os_log_s *)EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping(5LL);
    BOOL result = os_log_type_enabled(LogHandle, v7);
    if (result)
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "Apple80211Open failed, %x", buf, 8u);
      return 0LL;
    }
  }

  else
  {
    CFStringRef v9 = CFStringCreateWithCString(0LL, a1, 0x600u);
    int v10 = Apple80211BindToInterface(v12, v9);
    CFRelease(v9);
    uint64_t v11 = v12;
    if (v10)
    {
      Apple80211Close(v12);
      uint64_t v11 = 0LL;
      BOOL result = 0LL;
    }

    else
    {
      BOOL result = 1LL;
    }

    *a2 = v11;
  }

  return result;
}

BOOL sub_10000C880(uint64_t a1, uint64_t a2)
{
  int v3 = Apple80211Get(a1, 9LL, 0LL, a2, 6LL);
  BOOL result = 0LL;
  if (!v3)
  {
    if (*(_DWORD *)a2) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = *(unsigned __int16 *)(a2 + 4) == 0;
    }
    return !v5;
  }

  return result;
}

BOOL sub_10000C8E8(uint64_t a1, unsigned int a2, __int16 a3, uint64_t a4, unsigned int a5)
{
  v10[0] = 1;
  if (a2 > 3) {
    return 0LL;
  }
  LOWORD(v10[3]) = 0x9000500020001uLL >> (16 * a2);
  if (a5 == 5)
  {
    int v8 = 1;
    goto LABEL_7;
  }

  if (a5 != 13) {
    return 0LL;
  }
  int v8 = 2;
LABEL_7:
  v10[2] = v8;
  __memcpy_chk(&v10[4], a4, a5, 132LL);
  v10[1] = a5;
  HIWORD(v10[3]) = a3;
  return Apple80211Set(a1, 3LL, 0LL, v10, 148LL) == 0;
}

uint64_t sub_10000CA08(uint64_t a1)
{
  CFDictionaryRef theDict = 0LL;
  int v1 = Apple80211CopyValue(a1, 2LL, 0LL, &theDict);
  if (v1)
  {
    int v2 = v1;
    LogHandle = (os_log_s *)EAPLogGetLogHandle();
    os_log_type_t v4 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(LogHandle, v4))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  LogHandle,  v4,  "Apple80211CopyValue(APPLE80211_IOC_AUTH_TYPE) failed, 0x%x",  buf,  8u);
    }

    goto LABEL_12;
  }

  if (!theDict
    || (CFPropertyListRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"AUTH_UPPER")) == 0LL
    || !CFNumberGetValue(Value, kCFNumberSInt32Type, buf))
  {
LABEL_12:
    uint64_t v6 = 0LL;
    goto LABEL_13;
  }

  uint64_t v6 = 0LL;
  if (*(int *)buf <= 2047)
  {
    if (*(_DWORD *)buf != 1 && *(_DWORD *)buf != 4 && *(_DWORD *)buf != 128) {
      goto LABEL_13;
    }
LABEL_17:
    uint64_t v6 = 1LL;
    goto LABEL_13;
  }

  if (*(_DWORD *)buf == 2048 || *(_DWORD *)buf == 0x8000 || *(_DWORD *)buf == 0x4000) {
    goto LABEL_17;
  }
LABEL_13:
  my_CFRelease(&theDict);
  return v6;
}

BOOL sub_10000CB58(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if ((a4 | 0x40) != 0x40) {
    return 0LL;
  }
  uint64_t v13 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v10 = 0u;
  memset(&v9[3], 0, 80);
  v9[0] = 1;
  if (a4) {
    __memcpy_chk(&v9[4], a3, a4, 132LL);
  }
  if (a2)
  {
    LODWORD(v10) = *(_DWORD *)a2;
    WORD2(v10) = *(_WORD *)(a2 + 4);
    int v7 = 7;
  }

  else
  {
    int v7 = 9;
  }

  v9[1] = a4;
  v9[2] = v7;
  return Apple80211Set(a1, 3LL, 0LL, v9, 148LL) == 0;
}

uint64_t sub_10000CC54()
{
  return 0LL;
}

uint64_t sub_10000CC5C(uint64_t a1, const ether_addr *a2)
{
  CFMutableStringRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v5 = 0LL;
  if (!Apple80211Get(a1, 83LL, 0LL, Mutable, 8LL))
  {
    CFIndex Count = CFArrayGetCount(Mutable);
    int v7 = ether_ntoa(a2);
    int v8 = CFStringCreateWithCString(0LL, v7, 0x600u);
    if (Count < 1)
    {
LABEL_7:
      uint64_t v5 = 0LL;
    }

    else
    {
      CFIndex v9 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v9);
        CFPropertyListRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"PMKSA_AUTHENTICATOR");
        if (Value)
        {
          uint64_t v5 = 1LL;
          if (CFStringCompare(Value, v8, 1uLL) == kCFCompareEqualTo) {
            break;
          }
        }

        if (Count == ++v9) {
          goto LABEL_7;
        }
      }
    }

    CFRelease(v8);
  }

  CFRelease(Mutable);
  return v5;
}

uint64_t sub_10000CD50(uint64_t a1)
{
  return Apple80211Close(a1);
}

void sub_10000CD74(uint64_t a1)
{
  int v1 = off_100014028;
  if (off_100014028)
  {
    while (1)
    {
      uint64_t v2 = *((void *)v1 + 5);
      if (*(void *)v1 == a1) {
        break;
      }
      int v1 = (void *)*((void *)v1 + 5);
      if (!v2) {
        return;
      }
    }

    int v3 = (void *)*((void *)v1 + 6);
    if (v2)
    {
      *(void *)(v2 + 48) = v3;
      int v3 = (void *)*((void *)v1 + 6);
    }

    else
    {
      off_100014030 = (_UNKNOWN **)*((void *)v1 + 6);
    }

    *int v3 = v2;
    Apple80211EventMonitoringHalt();
    CFRelease(*((CFTypeRef *)v1 + 3));
    free(v1);
  }

CFStringRef sub_10000CDEC(uint64_t a1)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  if (Apple80211Get(a1, 1LL, 0LL, Mutable, 0LL))
  {
    CFRelease(Mutable);
    return 0LL;
  }

  if (!Mutable) {
    return 0LL;
  }
  BytePtr = CFDataGetBytePtr(Mutable);
  CFIndex Length = CFDataGetLength(Mutable);
  CFStringRef v3 = CFStringCreateWithBytes(0LL, BytePtr, Length, 0x8000100u, 0);
  if (!v3)
  {
    uint64_t v6 = CFDataGetBytePtr(Mutable);
    CFIndex v7 = CFDataGetLength(Mutable);
    CFStringRef v3 = CFStringCreateWithBytes(0LL, v6, v7, 0, 0);
  }

  CFRelease(Mutable);
  return v3;
}

uint64_t sub_10000CEC4(uint64_t a1, CFTypeRef cf2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (cf2 && a4)
  {
    int v7 = a3;
    __int128 v10 = (char *)off_100014028;
    if (off_100014028)
    {
      while (*(void *)v10 != a1)
      {
        __int128 v10 = (char *)*((void *)v10 + 5);
        if (!v10) {
          goto LABEL_6;
        }
      }

      CFTypeRef v25 = (CFTypeRef)CFEqual(*((CFTypeRef *)v10 + 3), cf2);
      if (!(_DWORD)v25)
      {
        CFRetain(cf2);
        CFRelease(*((CFTypeRef *)v10 + 3));
        *((void *)v10 + 3) = cf2;
        *((_DWORD *)v10 + 8) = 0;
      }

LABEL_21:
      *((void *)v10 + 1) = a4;
      *((void *)v10 + 2) = a5;
      if (*((_DWORD *)v10 + 8) == 1)
      {
        LogHandle = (os_log_s *)EAPLogGetLogHandle(v25, v26, v27, v28);
        os_log_type_t v39 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(LogHandle, v39)) {
          return 1LL;
        }
        LOWORD(v55) = 0;
        int v40 = "scan already in progress";
        os_log_type_t v41 = LogHandle;
        os_log_type_t v42 = v39;
        uint32_t v43 = 2;
      }

      else
      {
        CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(Mutable, @"SSID_STR", cf2);
        CFDictionarySetValue(Mutable, @"SCAN_MERGE", kCFBooleanFalse);
        int v55 = v7;
        CFNumberRef v45 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v55);
        CFDictionarySetValue(Mutable, @"SCAN_NUM_SCANS", v45);
        CFRelease(v45);
        uint64_t v35 = 1LL;
        int v55 = 1;
        CFNumberRef v46 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v55);
        CFDictionarySetValue(Mutable, @"SCAN_PHY_MODE", v46);
        CFRelease(v46);
        int v55 = 1;
        CFNumberRef v47 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v55);
        CFDictionarySetValue(Mutable, @"SCAN_TYPE", v47);
        CFRelease(v47);
        int v48 = Apple80211ScanAsync(a1, Mutable);
        CFRelease(Mutable);
        if (!v48)
        {
          *((_DWORD *)v10 + 8) = 1;
          return v35;
        }

        __int16 v53 = (os_log_s *)EAPLogGetLogHandle(v49, v50, v51, v52);
        os_log_type_t v54 = _SC_syslog_os_log_mapping(5LL);
        if (!os_log_type_enabled(v53, v54)) {
          return 1LL;
        }
        int v55 = 67109120;
        int v56 = v48;
        int v40 = "Apple80211ScanAsync failed, %d";
        os_log_type_t v41 = v53;
        os_log_type_t v42 = v54;
        uint32_t v43 = 8;
      }

      _os_log_impl((void *)&_mh_execute_header, v41, v42, v40, (uint8_t *)&v55, v43);
      return 1LL;
    }

LABEL_6:
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    uint64_t v12 = Apple80211EventMonitoringInit(a1, sub_10000D2CC, 0LL, Current);
    if ((_DWORD)v12)
    {
      int v16 = v12;
      int v17 = (os_log_s *)EAPLogGetLogHandle(v12, v13, v14, v15);
      os_log_type_t v18 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v17, v18))
      {
        int v55 = 67109120;
        int v56 = v16;
        os_log_type_t v19 = "Apple80211EventMonitoringInit failed, %d";
LABEL_16:
        int v22 = v17;
        os_log_type_t v23 = v18;
        uint32_t v24 = 8;
        goto LABEL_17;
      }
    }

    else
    {
      int started = Apple80211StartMonitoringEvent(a1, 10LL);
      if (!started)
      {
        __int128 v10 = (char *)malloc(0x38uLL);
        *(_OWORD *)(v10 + 8) = 0u;
        *(_OWORD *)(v10 + 24) = 0u;
        *(void *)__int128 v10 = a1;
        CFTypeRef v25 = CFRetain(cf2);
        *((void *)v10 + 5) = 0LL;
        *((void *)v10 + 3) = v25;
        __int16 v37 = off_100014030;
        *((void *)v10 + 6) = off_100014030;
        *__int16 v37 = v10;
        off_100014030 = (_UNKNOWN **)(v10 + 40);
        goto LABEL_21;
      }

      int v30 = started;
      uint64_t v31 = Apple80211EventMonitoringHalt(a1);
      int v17 = (os_log_s *)EAPLogGetLogHandle(v31, v32, v33, v34);
      os_log_type_t v18 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v17, v18))
      {
        int v55 = 67109120;
        int v56 = v30;
        os_log_type_t v19 = "Apple80211StartMonitoringEvent failed, %d";
        goto LABEL_16;
      }
    }
  }

  else
  {
    CFIndex v20 = (os_log_s *)EAPLogGetLogHandle(a1, cf2, a3, a4);
    os_log_type_t v21 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v55) = 0;
      os_log_type_t v19 = "ssid and/or func NULL";
      int v22 = v20;
      os_log_type_t v23 = v21;
      uint32_t v24 = 2;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v19, (uint8_t *)&v55, v24);
    }
  }

  return 0LL;
}

void sub_10000D2CC(uint64_t a1, uint64_t a2, uint64_t a3, CFArrayRef theArray)
{
  if ((_DWORD)a3 != 10)
  {
    int v13 = a3;
    LogHandle = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, theArray);
    os_log_type_t v15 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v15)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    int v33 = v13;
    CFIndex v9 = "unexpected event %d";
    __int128 v10 = LogHandle;
    os_log_type_t v11 = v15;
    uint32_t v12 = 8;
    goto LABEL_9;
  }

  os_log_type_t v4 = off_100014028;
  if (!off_100014028)
  {
LABEL_5:
    int v7 = (os_log_s *)EAPLogGetLogHandle(a1, a2, a3, theArray);
    os_log_type_t v8 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v7, v8)) {
      return;
    }
    *(_WORD *)buf = 0;
    CFIndex v9 = "no callback?";
    __int128 v10 = v7;
    os_log_type_t v11 = v8;
    uint32_t v12 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    return;
  }

  while (*v4 != a2)
  {
    os_log_type_t v4 = (void *)v4[5];
    if (!v4) {
      goto LABEL_5;
    }
  }

  int v16 = (void (*)(void, void, void))v4[1];
  uint64_t v17 = v4[2];
  *((_DWORD *)v4 + 8) = 2;
  os_log_type_t v18 = (const void *)v4[3];
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    goto LABEL_29;
  }
  uint64_t v20 = Count;
  int v30 = v16;
  theArraya = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (v20 >= 1)
  {
    CFIndex v21 = 0LL;
    CFIndex v22 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v21);
      CFPropertyListRef Value = CFDictionaryGetValue(ValueAtIndex, @"SSID_STR");
      if (Value)
      {
        if (CFEqual(Value, v18))
        {
          CFTypeRef v25 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
          CFTypeID TypeID = CFStringGetTypeID();
          if (v25)
          {
            if (CFGetTypeID(v25) == TypeID)
            {
              if (CFStringGetCString(v25, (char *)buf, 32LL, 0x600u))
              {
                uint64_t v27 = ether_aton((const char *)buf);
                if (v27)
                {
                  CFDataRef v28 = CFDataCreate(0LL, v27->octet, 6LL);
                  if (v28)
                  {
                    CFDataRef v29 = v28;
                    v34.location = 0LL;
                    v34.length = v22;
                    if (!CFArrayContainsValue(theArraya, v34, v28))
                    {
                      CFArrayAppendValue(theArraya, v29);
                      ++v22;
                    }

                    CFRelease(v29);
                  }
                }
              }
            }
          }
        }
      }

      ++v21;
    }

    while (v20 != v21);
  }

  if (!CFArrayGetCount(theArraya))
  {
    CFRelease(theArraya);
    int v16 = v30;
LABEL_29:
    v16(a2, 0LL, v17);
    return;
  }

  v30(a2, theArraya, v17);
  if (theArraya) {
    CFRelease(theArraya);
  }
}

void sub_10000D59C(_DWORD *a1)
{
  io_object_t v2 = a1[2];
  if (v2) {
    IOObjectRelease(v2);
  }
  if (*(void *)a1)
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)a1);
    CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(*(IONotificationPortRef *)a1);
  }

  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  free(a1);
}

_OWORD *sub_10000D608(const char *a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v6 = malloc(0x20uLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  *(void *)existing = 0LL;
  io_object_t object = 0;
  int v7 = IOBSDNameMatching(kIOMasterPortDefault, 0, a1);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v7, existing);
  if ((_DWORD)MatchingServices)
  {
    LogHandle = (os_log_s *)EAPLogGetLogHandle(MatchingServices, v9, v10, v11);
    os_log_type_t v13 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(LogHandle, v13))
    {
LABEL_6:
      os_log_type_t v18 = 0LL;
LABEL_7:
      int v19 = 1;
      goto LABEL_8;
    }

    *(_DWORD *)buf = 136315138;
    v57[0] = a1;
    uint64_t v14 = "No such interface %s\n";
    os_log_type_t v15 = LogHandle;
    os_log_type_t v16 = v13;
    uint32_t v17 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
    goto LABEL_6;
  }

  IONotificationPortRef v21 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v21)
  {
    uint64_t v35 = (os_log_s *)EAPLogGetLogHandle(0LL, v22, v23, v24);
    os_log_type_t v36 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v35, v36)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "IONotificationPortCreate failed\n";
    os_log_type_t v15 = v35;
    os_log_type_t v16 = v36;
    uint32_t v17 = 2;
    goto LABEL_5;
  }

  os_log_type_t v18 = v21;
  uint64_t v25 = IOIteratorNext(existing[0]);
  io_object_t object = v25;
  if (!(_DWORD)v25)
  {
    __int16 v37 = (os_log_s *)EAPLogGetLogHandle(v25, v26, v27, v28);
    os_log_type_t v38 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v37, v38)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v39 = "IOIteratorNext no object\n";
    int v40 = v37;
    os_log_type_t v41 = v38;
    uint32_t v42 = 2;
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v40, v41, v39, buf, v42);
    goto LABEL_7;
  }

  uint64_t ParentEntry = IORegistryEntryGetParentEntry(v25, "IOService", &object);
  if ((_DWORD)ParentEntry)
  {
    int v33 = ParentEntry;
    int v34 = 0;
LABEL_30:
    uint32_t v43 = (os_log_s *)EAPLogGetLogHandle(ParentEntry, v30, v31, v32);
    os_log_type_t v44 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v43, v44)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109376;
    LODWORD(v57[0]) = v34;
    WORD2(v57[0]) = 1024;
    *(_DWORD *)((char *)v57 + 6) = v33;
    os_log_type_t v39 = "IORegistryEntryGetParentEntry(%d) failed, kr = 0x%x";
    int v40 = v43;
    os_log_type_t v41 = v44;
    uint32_t v42 = 14;
    goto LABEL_32;
  }

  uint64_t ParentEntry = IORegistryEntryGetParentEntry(object, "IOService", &object);
  if ((_DWORD)ParentEntry)
  {
    int v33 = ParentEntry;
    int v34 = 1;
    goto LABEL_30;
  }

  uint64_t v45 = IOServiceAddInterestNotification( v18,  object,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10000D988,  v6,  &existing[1]);
  if ((_DWORD)v45)
  {
    int v49 = v45;
    uint64_t v50 = (os_log_s *)EAPLogGetLogHandle(v45, v46, v47, v48);
    os_log_type_t v51 = _SC_syslog_os_log_mapping(5LL);
    if (!os_log_type_enabled(v50, v51)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v57[0]) = v49;
    os_log_type_t v39 = "IOServiceAddInterestNotification failed, 0x%x\n";
    int v40 = v50;
    os_log_type_t v41 = v51;
    uint32_t v42 = 8;
    goto LABEL_32;
  }

  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v18);
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  int v19 = 0;
  *(void *)uint64_t v6 = v18;
  *((_DWORD *)v6 + 2) = existing[1];
  *((void *)v6 + 2) = a2;
  *((void *)v6 + 3) = a3;
LABEL_8:
  if (existing[0]) {
    IOObjectRelease(existing[0]);
  }
  if (object) {
    IOObjectRelease(object);
  }
  if (v19)
  {
    if (v18) {
      IONotificationPortDestroy(v18);
    }
    if (existing[1]) {
      IOObjectRelease(existing[1]);
    }
    free(v6);
    return 0LL;
  }

  return v6;
}

uint64_t sub_10000D988(uint64_t result, uint64_t a2, int a3)
{
  if (a3 == -536870608) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(result + 24));
  }
  return result;
}