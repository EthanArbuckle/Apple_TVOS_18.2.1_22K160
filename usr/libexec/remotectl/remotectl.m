uint64_t start(int a1, uint64_t a2)
{
  int v2;
  char **v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  const char *v10;
  char v11;
  char *v12;
  unsigned __int8 *v13;
  int v14;
  char v15;
  int v16;
  char *v17;
  unsigned __int8 *v18;
  char *v19;
  size_t v20;
  int v22;
  const char *v23;
  const char *v24;
  const char *v25;
  _BYTE *v26;
  dispatch_queue_s *v27;
  uint64_t started;
  void *v29;
  dispatch_source_t v30;
  void *v31;
  dispatch_time_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  id v37;
  uint64_t v38;
  int *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  size_t v44;
  id v45;
  uint64_t v47;
  int *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  unsigned int v53;
  const char *v54;
  int v55;
  int v56;
  uint64_t v57;
  int v58;
  const char *v59;
  int v60;
  const char *v61;
  int v62;
  int v63;
  id v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void block[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  uint64_t v77;
  void v78[3];
  char v79;
  void v80[3];
  int v81;
  int v82;
  int v83;
  _BYTE v84[24];
  char *v85;
  void *v86;
  void *v87;
  uint64_t *v88;
  unsigned __int8 *v89;
  char *v90;
  int v91;
  char v92;
  char v93;
  uuid_t uu;
  __int128 handler;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  v2 = a1 - 1;
  if (a1 <= 1) {
    goto LABEL_117;
  }
  v5 = (char **)(a2 + 8);
  v6 = *(const char **)(a2 + 8);
  v7 = strcmp(v6, "list");
  if (!(_DWORD)v7)
  {
    remote_device_browse_present(v7, &_dispatch_main_q, &stru_100021068);
    dispatch_main();
  }

  if (!strcmp(v6, "browse"))
  {
    v11 = 0;
    v70 = 0LL;
    v12 = 0LL;
    v13 = 0LL;
    v14 = 0;
    v15 = 0;
    v80[0] = 0LL;
    v80[1] = v80;
    v80[2] = 0x2020000000LL;
    v81 = 0;
    v78[0] = 0LL;
    v78[1] = v78;
    v78[2] = 0x2020000000LL;
    v79 = 0;
    v72 = 0LL;
    v73 = &v72;
    v74 = 0x3032000000LL;
    v75 = sub_1000046E8;
    v76 = sub_1000046F8;
    v77 = 0LL;
    memset(uu, 170, sizeof(uu));
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v16 = getopt(v2, v5, "d:t:s");
          if (v16 == 100) {
            break;
          }
          switch(v16)
          {
            case 115:
              v11 = 1;
              break;
            case 116:
              v70 = strtoull(optarg, 0LL, 10);
              break;
            case -1:
              *(void *)v84 = _NSConcreteStackBlock;
              *(void *)&v84[8] = 3221225472LL;
              *(void *)&v84[16] = sub_100004700;
              v85 = (char *)&unk_1000210D8;
              v89 = v13;
              v90 = v12;
              v86 = v80;
              v87 = v78;
              v92 = v15 & 1;
              v93 = v11 & 1;
              v91 = v14;
              v88 = &v72;
              v26 = objc_retainBlock(v84);
              v27 = &_dispatch_main_q;
              started = remote_device_start_browsing(0LL, &_dispatch_main_q, v26);
              v29 = (void *)v73[5];
              v73[5] = started;

              if (signal(2, (void (__cdecl *)(int))1) != (void (__cdecl *)(int))-1LL)
              {
                v30 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  2uLL,  0LL,  &_dispatch_main_q);
                v31 = (void *)qword_100025050;
                qword_100025050 = (uint64_t)v30;

                *(void *)&handler = _NSConcreteStackBlock;
                *((void *)&handler + 1) = 3221225472LL;
                *(void *)&v96 = sub_100004B48;
                *((void *)&v96 + 1) = &unk_100021100;
                *(void *)&v97 = v80;
                *((void *)&v97 + 1) = &v72;
                dispatch_source_set_event_handler((dispatch_source_t)qword_100025050, &handler);
                dispatch_activate((dispatch_object_t)qword_100025050);
                if (v70) {
                  v32 = dispatch_time(0LL, 1000000000 * v70);
                }
                else {
                  v32 = -1LL;
                }
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_100004B68;
                block[3] = &unk_100021100;
                block[4] = v80;
                block[5] = &v72;
                dispatch_after(v32, &_dispatch_main_q, block);

                dispatch_main();
              }

              block[0] = 0LL;
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              handler = 0u;
              v64 = &_os_log_default;
              v65 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              v66 = *__error();
              if (v65) {
                v67 = 3LL;
              }
              else {
                v67 = 2LL;
              }
              v82 = 67109120;
              v83 = v66;
              v68 = _os_log_send_and_compose_impl( v67,  block,  &handler,  80LL,  &_mh_execute_header,  &_os_log_default,  16LL);

              v69 = _os_crash_msg(block[0], v68);
              sub_100018478(v69);
            default:
              sub_1000022B4();
          }
        }

        if (uuid_parse(optarg, uu)) {
          break;
        }
        v18 = (unsigned __int8 *)calloc(1uLL, 0x10uLL);
        v13 = v18;
        if (!v18)
        {
          block[0] = 0LL;
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          handler = 0u;
          v37 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            v38 = 3LL;
          }
          else {
            v38 = 2LL;
          }
          v39 = __error();
          v40 = strerror(*v39);
          *(_DWORD *)v84 = 136315650;
          *(void *)&v84[4] = "known-constant allocation";
          *(_WORD *)&v84[12] = 2048;
          *(void *)&v84[14] = 16LL;
          *(_WORD *)&v84[22] = 2080;
          v85 = v40;
          v41 = _os_log_send_and_compose_impl(v38, block, &handler, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

          v42 = _os_crash_msg(block[0], v41);
          sub_100018478(v42);
        }

        uuid_copy(v18, uu);
        printf("Browse for uuid: %s\n");
LABEL_12:
        v15 = 1;
      }

      v14 = remote_device_type_parse(optarg);
      v17 = optarg;
      if (v14)
      {
        printf("Browse for type: %s\n");
        goto LABEL_12;
      }

      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v19 = strdup(v17);
          if (v19) {
            break;
          }
          __os_temporary_resource_shortage();
        }

        v12 = v19;
      }

      else
      {
        v12 = strdup(v17);
        v20 = strlen(v17);
        if (!v12)
        {
          v44 = v20;
          block[0] = 0LL;
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          handler = 0u;
          v45 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            v47 = 3LL;
          }
          else {
            v47 = 2LL;
          }
          v48 = __error();
          v49 = strerror(*v48);
          *(_DWORD *)v84 = 136315650;
          *(void *)&v84[4] = "known-constant allocation";
          *(_WORD *)&v84[12] = 2048;
          *(void *)&v84[14] = v44;
          *(_WORD *)&v84[22] = 2080;
          v85 = v49;
          v50 = _os_log_send_and_compose_impl(v47, block, &handler, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

          v51 = _os_crash_msg(block[0], v50);
          sub_100018478(v51);
        }
      }

      printf("Browse for device: %s\n", optarg);
      v14 = 0;
      v15 = 1;
    }
  }

  v8 = strcmp(v6, "show");
  if (a1 == 3 && !v8)
  {
    v9 = *(const char **)(a2 + 16);
    v10 = 0LL;
LABEL_29:
    sub_100002520(v9, v10);
    return 0LL;
  }

  if (a1 == 4 && !v8)
  {
    v9 = *(const char **)(a2 + 16);
    v10 = *(const char **)(a2 + 24);
    goto LABEL_29;
  }

  v22 = strcmp(v6, "get-property");
  if (a1 == 4 && !v22)
  {
    v23 = *(const char **)(a2 + 16);
    v24 = *(const char **)(a2 + 24);
    v25 = 0LL;
LABEL_41:
    sub_100002598(v23, v25, v24);
    return 0LL;
  }

  if (a1 == 5 && !v22)
  {
    v23 = *(const char **)(a2 + 16);
    v25 = *(const char **)(a2 + 24);
    v24 = *(const char **)(a2 + 32);
    goto LABEL_41;
  }

  if (!strcmp(v6, "dumpstate")) {
    sub_100002680();
  }
  if (!strcmp(v6, "echo"))
  {
    sub_1000028BC(v2, v5);
    return 0LL;
  }

  if (!strcmp(v6, "echo-file")) {
    sub_100002C2C(v2, (uint64_t)v5);
  }
  if (!strcmp(v6, "netcat"))
  {
    sub_100002D98(v2, v5);
    return 0LL;
  }

  v33 = strcmp(v6, "relay");
  if (a1 >= 4 && !v33)
  {
    sub_100002F48(v2, v5);
    return 0LL;
  }

  if (!strcmp(v6, "relay-child"))
  {
    sub_100003418(v2, v5);
    return 0LL;
  }

  v34 = strcmp(v6, "convert-bridge-version");
  if (a1 == 4 && !v34)
  {
    sub_10000366C(*(void *)(a2 + 16), *(const char **)(a2 + 24));
    return 0LL;
  }

  v35 = strcmp(v6, "heartbeat");
  if (a1 == 3 && !v35) {
    sub_10000371C(*(const char **)(a2 + 16));
  }
  if (!strcmp(v6, "trampoline")) {
    sub_100003744(v2, v5);
  }
  v36 = strcmp(v6, "reset");
  if (a1 == 3 && !v36)
  {
    sub_100003B38(*(const char **)(a2 + 16));
    return 0LL;
  }

  v43 = strcmp(v6, "alias");
  if (a1 == 4 && !v43)
  {
    sub_100003B6C(*(const char **)(a2 + 16), *(void *)(a2 + 24));
    return 0LL;
  }

  v52 = strcmp(v6, "synctime");
  v53 = a1 - 3;
  if (a1 == 3 && !v52)
  {
    sub_100003BB0(*(const char **)(a2 + 16));
    return 0LL;
  }

  if (!os_variant_has_internal_content("com.apple.xpc.remoted")) {
LABEL_117:
  }
    sub_1000022B4();
  v54 = *v5;
  v55 = strcmp(*v5, "loopback");
  if (v53 <= 1 && !v55)
  {
    sub_100003BE4(*(const char **)(a2 + 16));
    return 0LL;
  }

  v56 = strcmp(v54, "bonjour");
  if (v53 <= 1 && !v56)
  {
    if (a1 == 4) {
      v57 = *(void *)(a2 + 24);
    }
    else {
      v57 = 0LL;
    }
    sub_100003CA0(*(const char **)(a2 + 16), v57);
    return 0LL;
  }

  v58 = strcmp(v54, "network");
  if (v53 <= 1 && !v58)
  {
    if (a1 == 4) {
      v59 = *(const char **)(a2 + 24);
    }
    else {
      v59 = 0LL;
    }
    sub_100003D34(*(const char **)(a2 + 16), v59);
    return 0LL;
  }

  v60 = strcmp(v54, "compute");
  if (v53 > 1 || v60)
  {
    v62 = strcmp(v54, "identity");
    if (a1 == 3 && !v62)
    {
      sub_100003F40(*(const char **)(a2 + 16));
      return 0LL;
    }

    v63 = strcmp(v54, "setup-ssh");
    if (a1 <= 3 && !v63)
    {
      sub_100003FF0(v2, v5);
      return 0LL;
    }

    if (!strcmp(v54, "ssh-tunnel"))
    {
      sub_10000C8A4(v2, (uint64_t *)v5);
      return 0LL;
    }

    if (!strcmp(v54, "ssh-tunnel-callback"))
    {
      sub_10000D980(v2, (uint64_t *)v5);
      return 0LL;
    }

    if (!strcmp(v54, "ssh-tunnel-privileged"))
    {
      sub_10000E384(v2, (uint64_t *)v5);
      return 0LL;
    }

    goto LABEL_117;
  }

  if (a1 == 4) {
    v61 = *(const char **)(a2 + 24);
  }
  else {
    v61 = 0LL;
  }
  sub_100003E18(*(const char **)(a2 + 16), v61);
  return 0LL;
}

void sub_100002254( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_1000022B4()
{
  if (os_variant_has_internal_content("com.apple.xpc.remoted"))
  {
    fwrite("\nAppleInternal commands:\n\n", 0x1AuLL, 1uLL, __stderrp);
    fwrite("usage: remotectl loopback (attach [--tls]|connect|detach|suspend|resume)\n", 0x49uLL, 1uLL, __stderrp);
    fwrite("usage: remotectl bonjour ((enable|enable-loopback interface_name)|(disable))\n", 0x4DuLL, 1uLL, __stderrp);
    fwrite( "usage: remotectl network ((enable interface_name)|disable|(connect address)|(disconnect name|uuid|trait))\n",  0x6AuLL,  1uLL,  __stderrp);
    fwrite( "usage: remotectl compute ((listen interface_name)|(browse interface_name)|(disconnect name|uuid|trait)|(tls [requi red|optional])\n",  0x81uLL,  1uLL,  __stderrp);
    fwrite("usage: remotectl setup-ssh [-f]\n", 0x20uLL, 1uLL, __stderrp);
    fwrite("usage: remotectl ssh-tunnel [ssh_host]\n", 0x27uLL, 1uLL, __stderrp);
  }

  exit(64);
}

void sub_100002520(const char *a1, const char *a2)
{
  id v3 = sub_100004B88(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v8 = v4;
  if (a2)
  {
    id v5 = sub_1000050FC(v4, (uint64_t)a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!v6) {
      errx(65, "Unable to find service %s", a2);
    }
    v7 = v6;
    sub_10000514C(v6, 0LL);
  }

  else
  {
    sub_100004C48(v4, 0);
  }
}

void sub_100002598(const char *a1, const char *a2, const char *a3)
{
  id v5 = sub_100004B88(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v15 = v6;
  if (!a2)
  {
    v10 = (void *)remote_device_copy_property(v6, a3);
    if (v10) {
      goto LABEL_4;
    }
LABEL_6:
    name = (const char *)remote_device_get_name(v15);
    v13 = "/";
    v14 = "";
    if (a2) {
      v14 = a2;
    }
    else {
      v13 = "";
    }
    errx(66, "No such property %s on %s%s%s", a3, name, v13, v14);
  }

  id v7 = sub_1000050FC(v6, (uint64_t)a2);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!v8) {
    errx(65, "Unable to find service %s", a2);
  }
  v9 = (void *)v8;
  v10 = (void *)remote_service_copy_property(v8, a3);

  if (!v10) {
    goto LABEL_6;
  }
LABEL_4:
  v11 = (char *)xpc_copy_clean_description(v10);
  puts(v11);
  free(v11);
}

void sub_100002680()
{
  v0 = (void *)local_device_copy_description();
  v1 = (void *)local_device_copy_service_names();
  v2 = (__SecIdentity *)local_device_copy_identity();
  if (v0 && v1)
  {
    id v3 = v0;
    id v4 = v1;
    puts("Local device");
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    uuid = xpc_dictionary_get_uuid(v3, "UUID");
    if (uuid)
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v8;
      *(_OWORD *)&out[16] = v8;
      uuid_unparse(uuid, out);
      printf("\tUUID: %s\n", out);
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "device_messaging_protocol_version");
    printf("\tMessaging Protocol Version: %llu\n", uint64);
    string = xpc_dictionary_get_string(v6, "ProductType");
    if (string) {
      printf("\tProduct Type: %s\n", string);
    }
    v11 = xpc_dictionary_get_string(v6, "BuildVersion");
    v12 = xpc_dictionary_get_string(v6, "OSVersion");
    BOOL v13 = xpc_dictionary_get_BOOL(v6, "AppleInternal");
    if (v11 && v12)
    {
      v14 = "";
      if (v13) {
        v14 = " AppleInternal";
      }
      printf("\tOS Build: %s (%s)%s\n", v12, v11, v14);
    }

    id v15 = (_BYTE *)xpc_copy_clean_description(v6);
    printf("\tProperties: ");
    sub_1000051F8(v15, "\t");
    free(v15);
    putchar(10);
    puts("\tServices:");
    xpc_array_apply(v4, &stru_1000211A8);

    sub_10000538C(v2);
    putchar(10);
  }

  v16 = &_dispatch_main_q;
  remote_device_browse_present(0LL, &_dispatch_main_q, &stru_100021188);

  dispatch_main();
}

void sub_10000288C(_Unwind_Exception *exception_object)
{
}

void sub_1000028BC(int a1, char **a2)
{
  uint64_t v4 = 0LL;
  id v5 = 0LL;
  while (1)
  {
    while (1)
    {
      int v6 = getopt(a1, a2, "v:d:");
      if (v6 != 100) {
        break;
      }
      id v7 = sub_100004B88(optarg);
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

      id v5 = (void *)v8;
    }

    if (v6 == -1) {
      break;
    }
    if (v6 != 118) {
      sub_1000022B4();
    }
    uint64_t v4 = strtoll(optarg, 0LL, 10);
  }

  dispatch_queue_t v9 = dispatch_queue_create("echo", 0LL);
  if (!v5)
  {
    id v5 = (void *)remote_device_copy_unique_of_type(3LL);
    if (!v5)
    {
      fwrite("No coproc device found, falling back to external.\n", 0x32uLL, 1uLL, __stderrp);
      id v5 = (void *)remote_device_copy_unique_of_type(5LL);
      if (!v5)
      {
        fwrite("No external device found, falling back to loopback.\n", 0x34uLL, 1uLL, __stderrp);
        id v5 = (void *)remote_device_copy_unique_of_type(1LL);
        if (!v5)
        {
          v21 = __stderrp;
          v22 = "No loopback device found.\n";
          size_t v23 = 26LL;
          goto LABEL_32;
        }
      }
    }
  }

  if (remote_device_get_state(v5) != 2)
  {
    v21 = __stderrp;
    v22 = "Device not in state CONNECTED\n";
    size_t v23 = 30LL;
LABEL_32:
    fwrite(v22, v23, 1uLL, v21);
    goto LABEL_34;
  }

  id v10 = sub_1000050FC(v5, (uint64_t)"com.apple.internal.xpc.remote.echo");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    fprintf(__stderrp, "Service %s not found.\n", "com.apple.internal.xpc.remote.echo");
LABEL_34:
    exit(1);
  }

  v24 = (void *)v11;
  v12 = (void *)xpc_remote_connection_create_with_remote_service(v11, v9, 0LL);
  xpc_remote_connection_set_event_handler(v12, &stru_1000211E8);
  if (v4) {
    xpc_remote_connection_set_local_service_version(v12, v4);
  }
  xpc_remote_connection_activate(v12);
  uint64_t remote_service_version = xpc_remote_connection_get_remote_service_version(v12);
  if (remote_service_version) {
    fprintf(__stderrp, "Remote Service Version: %lld\n", remote_service_version);
  }
  size_t v25 = 0LL;
  v14 = fgetln(__stdinp, &v25);
  if (v14 && v25 >= 2)
  {
    id v15 = v14;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v15));
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v16,  4LL,  0LL));
      v18 = (void *)v17;
      if (v17)
      {
        v19 = (void *)_CFXPCCreateXPCObjectFromCFObject(v17);
        if (!v19) {
          fwrite("Unable to render as XPC message\n", 0x20uLL, 1uLL, __stderrp);
        }
        xpc_remote_connection_send_message(v12, v19);
      }

      else
      {
        fwrite("Rejecting invalid input message\n", 0x20uLL, 1uLL, __stderrp);
      }

      id v15 = fgetln(__stdinp, &v25);
      if (v15) {
        BOOL v20 = v25 > 1;
      }
      else {
        BOOL v20 = 0;
      }
    }

    while (v20);
  }

  xpc_remote_connection_send_barrier(v12, &stru_100021228);
  xpc_remote_connection_cancel(v12);
  fwrite("Connection cancelled, waiting for invalid error...\n", 0x33uLL, 1uLL, __stderrp);
}

void sub_100002C2C(int a1, uint64_t a2)
{
  if (a1 == 3)
  {
    id v3 = *(const char **)(a2 + 8);
    v2 = *(const char **)(a2 + 16);
    fprintf(__stderrp, "Sending %s to %s.\n", v2, v3);
    dispatch_queue_t v4 = dispatch_queue_create("echo", 0LL);
    id v5 = sub_100004B88(v3);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (remote_device_get_state(v6) == 2)
    {
      id v7 = sub_1000050FC(v6, (uint64_t)"com.apple.internal.xpc.remote.echo");
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
      if (!v8) {
        errx(69, "Service %s not found.");
      }
      uint64_t v9 = xpc_remote_connection_create_with_remote_service(v8, v4, 0LL);
      xpc_remote_connection_set_event_handler(v9, &stru_100021248);
      xpc_remote_connection_activate(v9);
      xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
      uint64_t v11 = (void *)xpc_file_transfer_create_with_path(v2, &stru_100021288);
      if (!v11) {
        err(66, "Unable to create file transfer object");
      }
      xpc_dictionary_set_value(v10, "file", v11);
      xpc_dictionary_set_BOOL(v10, "DisableFileReflection", 1);
      v12 = (char *)xpc_copy_clean_description(v10);
      fprintf(__stderrp, "Sending Message: %s\n", v12);
      free(v12);
      xpc_remote_connection_send_message(v9, v10);
      dispatch_main();
    }

    errx(69, "Device not in state CONNECTED");
  }

  sub_1000022B4();
}

void sub_100002D98(int a1, char **a2)
{
  char v4 = 0;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "F");
    char v4 = 1;
  }

  while (v6 == 70);
  if (v6 != -1 || a1 - optind != 2) {
    sub_1000022B4();
  }
  id v7 = &a2[optind];
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  id v10 = sub_100004B88(*v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1000050FC(v11, (uint64_t)v9);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  if (!v13) {
    errx(65, "Unable to find service %s/%s", v8, v9);
  }
  v14 = (void *)v13;
  int v15 = sub_1000058C0();
  if (v15 == -1) {
    errx(69, "Unable to connect to %s/%s", v8, v9);
  }
  int v16 = v15;
  if ((v5 & 1) != 0)
  {
    uint64_t v17 = malloc(0x10uLL);
    __int128 v20 = off_1000212A8;
    v19.msg_name = 0LL;
    *(&v19.msg_namelen + 1) = -1431655766;
    v19.msg_namelen = 0;
    v19.msg_iov = (iovec *)&v20;
    *(&v19.msg_iovlen + 1) = -1431655766;
    v19.msg_iovlen = 1;
    v19.msg_control = v17;
    *(void *)&v19.msg_controllen = 16LL;
    *(void *)uint64_t v17 = 0xFFFF00000010LL;
    v17[2] = 1;
    v17[3] = v16;
    ssize_t v18 = sendmsg(1, &v19, 0);
    if (v18 < 0) {
      sub_100018494(v18);
    }
  }

  else
  {
    sub_100005918(0, 1, v15);
  }
}

void sub_100002F48(int a1, char **a2)
{
  LODWORD(v4) = 0;
  char v5 = 0LL;
  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v6 = v7;
      int v8 = getopt(a1, a2, "b:p:s");
      uint64_t v7 = 1LL;
    }

    while (v8 == 115);
    if (v8 == -1) {
      break;
    }
    if (v8 == 112)
    {
      uint64_t v9 = optarg;
      *__error() = 0;
      unint64_t v4 = strtoul(v9, 0LL, 0);
      if (*__error()) {
        sub_1000186A0(v9);
      }
      if (v4 >= 0x10000) {
        sub_100018688();
      }
    }

    else
    {
      if (v8 != 98) {
        goto LABEL_30;
      }
      char v5 = optarg;
    }
  }

  if (a1 - optind != 2) {
LABEL_30:
  }
    sub_1000022B4();
  id v10 = &a2[optind];
  uint64_t v11 = *v10;
  id v12 = v10[1];
  if (v5) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = "::";
  }
  uint64_t v38 = 0LL;
  v39 = 0LL;
  int v14 = inet_pton(30, v13, &v38);
  if (v14 != 1)
  {
    if (v14) {
      sub_1000184A8();
    }
    v37 = 0LL;
    int v15 = inet_pton(30, v37, &v38);
    if (v15 != 1)
    {
      if (v15 != -1)
      {
        if (!v15) {
          sub_100018670();
        }
        sub_100018558(&v47, &v40);
      }

      sub_1000184A8();
    }
  }

  uint64_t v16 = v38;
  uint64_t v17 = v39;
  id v18 = sub_100004B88(v11);
  msghdr v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = sub_1000050FC(v19, (uint64_t)v12);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  if (!v21) {
    errx(65, "Unable to find service %s/%s", v11, v12);
  }
  v22 = (void *)v21;
  uint64_t v23 = socket(30, 1, 0);
  if ((_DWORD)v23 == -1) {
    sub_1000185D8(v23);
  }
  int v24 = v23;
  LODWORD(v38) = 0;
  if (setsockopt(v23, 41, 27, &v38, 4u)) {
    sub_10001864C();
  }
  *(_WORD *)&v40.sa_len = 7680;
  *(_WORD *)v40.sa_data = bswap32(v4) >> 16;
  *(_DWORD *)&v40.sa_data[2] = 0;
  *(void *)&v40.sa_data[6] = v16;
  v41 = v17;
  LODWORD(v42) = 0;
  if (bind(v24, &v40, 0x1Cu) == -1) {
    sub_1000185EC();
  }
  uint64_t v25 = listen(v24, 128);
  if ((_DWORD)v25 == -1) {
    sub_100018610(v25);
  }
  LODWORD(v47) = 28;
  uint64_t v26 = getsockname(v24, &v40, (socklen_t *)&v47);
  if ((_DWORD)v26 == -1) {
    sub_100018624(v26);
  }
  unsigned int v27 = *(unsigned __int16 *)v40.sa_data;
  int v28 = sub_1000058C0();
  if (v28 == -1) {
LABEL_49:
  }
    errx(69, "Unable to connect to %s/%s", v11, v12);
  int v29 = v28;
  unsigned int v30 = __rev16(v27);
  if ((v6 & 1) != 0)
  {
    printf("Listening on %s port %d...\n", v13, v30);
    close(v29);
    while (1)
    {
      while (1)
      {
        int v31 = accept(v24, 0LL, 0LL);
        if (v31 != -1) {
          break;
        }
        v35 = __error();
        if (*v35 != 4) {
          sub_100018638((uint64_t)v35);
        }
      }

      int v32 = v31;
      int v33 = sub_1000058C0();
      if (v33 == -1) {
        break;
      }
      int v34 = v33;
      unint64_t v47 = __PAIR64__(v33, v32);
      v36 = 0LL;
      v37 = 0LL;
      *(void *)&v40.sa_len = "remotectl";
      *(void *)&v40.sa_data[6] = "relay-child";
      v41 = "-i";
      v42 = v37;
      v43 = "-o";
      v44 = v36;
      v45 = "-s";
      uint64_t v46 = 0LL;
      sub_100005AC4((char *const *)&v40, (uint64_t)&v47);
      close(v32);
      close(v34);
    }

    goto LABEL_49;
  }

  printf("%d\n", v30);
  fflush(__stdoutp);
  unint64_t v47 = __PAIR64__(v29, v24);
  v36 = 0LL;
  v37 = 0LL;
  *(void *)&v40.sa_len = "remotectl";
  *(void *)&v40.sa_data[6] = "relay-child";
  v41 = "-l";
  v42 = v37;
  v43 = "-o";
  v44 = v36;
  v45 = 0LL;
  sub_100005AC4((char *const *)&v40, (uint64_t)&v47);
  close(v24);
  close(v29);
}

void sub_100003418(int a1, char *const *a2)
{
  unint64_t v4 = os_log_create("com.apple.RemoteServiceDiscovery", "relay-child");
  uint64_t v5 = 0LL;
  int v6 = -1;
  int v7 = -1;
  int v8 = -1;
  while (1)
  {
    while (1)
    {
      uint64_t v9 = v5;
      do
      {
        uint64_t v5 = v9;
        int v10 = getopt(a1, a2, "l:i:o:s");
        uint64_t v9 = 1LL;
      }

      while (v10 == 115);
      if (v10 <= 107) {
        break;
      }
      if (v10 == 111)
      {
        int v8 = strtol(optarg, 0LL, 0);
      }

      else
      {
        if (v10 != 108) {
LABEL_22:
        }
          sub_1000022B4();
        int v6 = strtol(optarg, 0LL, 0);
      }
    }

    if (v10 == -1) {
      break;
    }
    if (v10 != 105) {
      goto LABEL_22;
    }
    int v7 = strtol(optarg, 0LL, 0);
  }

  if ((v5 & 1) != 0)
  {
    pid_t v11 = getppid();
    if (v11 == 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "parent exited, exiting", buf, 2u);
      }

      exit(1);
    }

    pid_t v12 = v11;
    uint64_t v13 = dispatch_queue_create("relay-child", 0LL);
    int v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, v12, 0x80000000uLL, v13);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100005CDC;
    handler[3] = &unk_1000212C0;
    id v18 = v4;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_activate(v14);
  }

  else
  {
    uint64_t v13 = 0LL;
    int v14 = 0LL;
  }

  if (v6 != -1)
  {
    while (1)
    {
      int v15 = accept(v6, 0LL, 0LL);
      if (v15 != -1) {
        break;
      }
      uint64_t v16 = __error();
      if (*v16 != 4) {
        sub_100018638((uint64_t)v16);
      }
    }

    int v7 = v15;
    close(v6);
  }

  sub_100005918(v7, v7, v8);
}

uint64_t sub_10000366C(uint64_t a1, const char *a2)
{
  __int16 v8 = 0;
  if ((bridge_version_read_plist(a1, v9, &v8) & 1) == 0) {
    sub_100018714();
  }
  memset(v7, 0, sizeof(v7));
  if ((bridge_version_serialize(v9, &v8, v7) & 1) == 0) {
    sub_1000186FC();
  }
  id v3 = fopen(a2, "wx");
  if (!v3) {
    sub_1000186D0();
  }
  unint64_t v4 = v3;
  size_t v5 = fwrite(v7, 0x20uLL, 1uLL, v3);
  if (v5 <= 0x1F) {
    sub_1000186E8(v5);
  }
  uint64_t result = fclose(v4);
  if ((_DWORD)result) {
    sub_1000186E8(result);
  }
  return result;
}

void sub_10000371C(const char *a1)
{
  id v1 = sub_100004B88(a1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  remote_device_heartbeat(v2, &_dispatch_main_q, &stru_100021300);
  dispatch_main();
}

void sub_100003744(int a1, char *const *a2)
{
  os_log_t v23 = os_log_create("com.apple.RemoteServiceDiscovery", "rsdtrampoline");
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_1000046E8;
  v34[4] = sub_1000046F8;
  v34[5] = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  v33[3] = 0LL;
  if (optind != 1 || a1 < 1)
  {
LABEL_6:
    size_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x14uLL, 0LL, &_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006070;
    handler[3] = &unk_100021350;
    void handler[4] = v23;
    handler[5] = v33;
    handler[6] = v34;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_activate(v5);
    dispatch_main();
  }

  while (1)
  {
    for (int i = -1; ; int i = atoi(optarg))
    {
      int v7 = getopt(a1, a2, "2:");
      if (v7 != 50) {
        break;
      }
    }

    if (v7 != -1) {
      goto LABEL_33;
    }
    uint64_t v8 = optind;
    uint64_t v9 = (a1 - optind);
    uint64_t v10 = 0LL;
    pid_t v11 = &a2[optind];
    while (strcmp(v11[v10], "--"))
    {
      if (v9 == ++v10)
      {
        LODWORD(v10) = v9;
        goto LABEL_17;
      }
    }

    optind = 1;
LABEL_17:
    if (v10 <= 1) {
LABEL_34:
    }
      sub_1000022B4();
    uint64_t v12 = v10;
    int v24 = *v11;
    uint64_t v13 = calloc(v10, 8uLL);
    int v14 = v13;
    if (!v13) {
      break;
    }
    unint64_t v15 = 0LL;
    uint64_t v16 = &v11[v10];
    a1 = v9 - v10;
    do
    {
      v13[v15 / 8] = (&a2[v8 + 1])[v15 / 8];
      v15 += 8LL;
    }

    while (8 * v12 - 8 != v15);
    uint64_t v17 = &_dispatch_main_q;
    handler[7] = _NSConcreteStackBlock;
    handler[8] = 3221225472LL;
    handler[9] = sub_100005D80;
    handler[10] = &unk_100021328;
    int v31 = i;
    int v29 = v14;
    id v18 = v23;
    uint64_t v26 = v18;
    unsigned int v27 = v33;
    unsigned int v30 = v24;
    int v28 = v34;
    remote_service_listen();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *v14;
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Trampoline started for %{public}s -> %{public}s",  buf,  0x16u);
    }

    BOOL v20 = optind != 1 || a1 <= 0;
    a2 = v16;
    if (v20) {
      goto LABEL_6;
    }
  }

  uint64_t v32 = 0LL;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v38 = 0u;
  memset(buf, 0, sizeof(buf));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v21 = 3LL;
  }
  else {
    uint64_t v21 = 2LL;
  }
  int v35 = 134217984;
  uint64_t v36 = 0LL;
  uint64_t v22 = _os_log_send_and_compose_impl(v21, &v32, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(v32, v22);
  __break(1u);
LABEL_33:
  sub_1000022B4();
}

void sub_100003AFC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_100003B38(const char *a1)
{
  id v1 = sub_100004B88(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  if ((remote_device_reset() & 1) == 0) {
    sub_10001872C();
  }
}

void sub_100003B6C(const char *a1, uint64_t a2)
{
  id v3 = sub_100004B88(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  if ((remote_device_set_alias(v4, a2) & 1) == 0) {
    sub_100018748();
  }
}

void sub_100003BB0(const char *a1)
{
  id v1 = sub_100004B88(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  if ((remote_device_timesync() & 1) == 0) {
    sub_100018764();
  }
}

uint64_t sub_100003BE4(const char *a1)
{
  if (!strcmp(a1, "attach"))
  {
    uint64_t result = remote_control_attach_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }

  else if (!strcmp(a1, "connect"))
  {
    uint64_t result = remote_control_connect_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }

  else if (!strcmp(a1, "detach"))
  {
    uint64_t result = remote_control_detach_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }

  else if (!strcmp(a1, "suspend"))
  {
    uint64_t result = remote_control_suspend_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }

  else
  {
    if (strcmp(a1, "resume")) {
      sub_1000022B4();
    }
    uint64_t result = remote_control_resume_loopback();
    if ((result & 1) == 0) {
LABEL_11:
    }
      exit(1);
  }

  return result;
}

uint64_t sub_100003CA0(const char *a1, uint64_t a2)
{
  int v4 = strcmp(a1, "enable");
  if (a2 && !v4)
  {
    uint64_t result = remote_control_enable_bonjour(a2);
    if ((result & 1) != 0) {
      return result;
    }
LABEL_8:
    exit(1);
  }

  int v6 = strcmp(a1, "enable-loopback");
  if (!a2 || v6)
  {
    int v7 = strcmp(a1, "disable");
    if (a2 || v7) {
      sub_1000022B4();
    }
    uint64_t result = remote_control_disable_bonjour();
    if ((result & 1) == 0) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t result = remote_control_enable_bonjour_loopback(a2);
    if ((result & 1) == 0) {
      goto LABEL_8;
    }
  }

  return result;
}

void sub_100003D34(const char *a1, const char *a2)
{
  int v4 = strcmp(a1, "enable");
  if (!a2 || v4)
  {
    int v5 = strcmp(a1, "disable");
    if (a2 || v5)
    {
      int v6 = strcmp(a1, "connect");
      if (a2 && !v6)
      {
        if ((remote_control_connect_network_peer(a2) & 1) == 0) {
          goto LABEL_17;
        }
        return;
      }

      int v7 = strcmp(a1, "disconnect");
      if (!a2 || v7) {
        sub_1000022B4();
      }
      id v8 = sub_100004B88(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      if ((remote_device_disconnect() & 1) != 0)
      {

        return;
      }
    }

    else if ((remote_control_disable_network_peer() & 1) != 0)
    {
      return;
    }

LABEL_17:
    exit(1);
  }

  if ((remote_control_enable_network_peer(a2) & 1) == 0) {
    goto LABEL_17;
  }
}

void sub_100003E18(const char *a1, const char *a2)
{
  int v4 = strcmp(a1, "browse");
  if (!a2 || v4)
  {
    int v5 = strcmp(a1, "listen");
    if (!a2 || v5)
    {
      int v6 = strcmp(a1, "disconnect");
      if (!a2 || v6)
      {
        if (strcmp(a1, "tls")) {
          goto LABEL_21;
        }
        if (!a2)
        {
          sub_100006214();
          return;
        }

        int v8 = strcmp(a2, "required");
        if (v8)
        {
          if (strcmp(a2, "optional")) {
LABEL_21:
          }
            sub_1000022B4();
        }
      }

      else
      {
        id v7 = sub_100004B88(a2);
        id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
        if ((remote_device_disconnect() & 1) == 0) {
          goto LABEL_20;
        }
      }
    }

    else if (!remote_compute_node_listen(a2))
    {
LABEL_20:
      exit(1);
    }
  }

  else if (!remote_compute_controller_browse(a2))
  {
    goto LABEL_20;
  }
}

void sub_100003F40(const char *a1)
{
  if (!strcmp(a1, "show"))
  {
    id v2 = (__SecIdentity *)local_device_copy_identity();
    sub_10000538C(v2);
    if (v2) {
      CFRelease(v2);
    }
  }

  else if (!strcmp(a1, "delete"))
  {
    if ((local_device_delete_identity() & 1) == 0) {
      goto LABEL_10;
    }
  }

  else
  {
    if (strcmp(a1, "create")) {
      sub_1000022B4();
    }
    if ((local_device_create_identity() & 1) == 0) {
LABEL_10:
    }
      exit(1);
  }

void sub_100003FD4(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100003FF0(int a1, char *const *a2)
{
  char v4 = 0;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "f");
    char v4 = 1;
  }

  while (v6 == 102);
  if (v6 != -1) {
    sub_1000022B4();
  }
  id v7 = NSHomeDirectory();
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@".ssh"]);
  uint64_t v10 = (const char *)[v9 UTF8String];

  int v11 = open(v10, 0x100000);
  if ((v11 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v12 = *__error();
  if (v12)
  {
    if (v12 != 2)
    {
      uint64_t v32 = __error();
      err(*v32, "failed to open directory %s");
    }

    if (mkdir(v10, 0x1C0u) == -1)
    {
      int v33 = __error();
      err(*v33, "failed to mkdir %s");
    }

    int v11 = open(v10, 0x100000);
    if (v11 == -1)
    {
      int v34 = __error();
      err(*v34, "failed to open created directory %s");
    }
  }

  int v13 = openat(v11, ".RSDSetupDone", 1);
  if ((v13 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v14 = *__error();
  if (v14)
  {
    if (v14 != 2)
    {
      unint64_t v15 = __error();
      warnc(*v15, "failed to open cookie file");
    }
  }

  else if ((v5 & 1) == 0)
  {
    puts("RSD ssh has been setup before. Pass -f to force redo the setup");
    exit(0);
  }

  int v16 = openat(v11, "config", 521, 420LL);
  int v17 = v16;
  if (v16 == -1)
  {
    unsigned int v30 = __error();
    err(*v30, "failed to open or create %s/config file", v10);
  }

  if (write(v16, __dst, 0x126uLL) == -1)
  {
    int v31 = __error();
    err(*v31, "failed to write RSD ssh config to %s/config file", v10);
  }

  if (v13 == -1)
  {
    int v13 = openat(v11, ".RSDSetupDone", 513, 420LL);
    if (v13 == -1)
    {
      id v18 = __error();
      warnc(*v18, "failed to create the cookie file");
      int v13 = -1;
    }
  }

  uint64_t result = close(v17);
  if ((_DWORD)result == -1)
  {
    uint64_t v35 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v21 = *__error();
    if (v20) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    int v37 = 67109120;
    int v38 = v21;
    uint64_t v23 = _os_log_send_and_compose_impl(v22, &v35, &v39, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v24 = _os_crash_msg(v35, v23);
    sub_100018478(v24);
  }

  if (v13 != -1)
  {
    uint64_t result = close(v13);
    if ((_DWORD)result == -1)
    {
      uint64_t v35 = 0LL;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v39 = 0u;
      BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v26 = *__error();
      if (v25) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      int v37 = 67109120;
      int v38 = v26;
      uint64_t v28 = _os_log_send_and_compose_impl(v27, &v35, &v39, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v29 = _os_crash_msg(v35, v28);
      sub_100018478(v29);
    }
  }

  if (v11 != -1)
  {
    uint64_t result = close(v11);
    if ((_DWORD)result == -1) {
      sub_100018780(&v35, &v39);
    }
  }

  return result;
}

void sub_100004444( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, unsigned int a13, unsigned int a14)
{
}

void sub_100004494(id a1, OS_remote_device *a2, BOOL a3)
{
  BOOL v3 = a3;
  char v4 = a2;
  if (v3) {
    exit(0);
  }
  char v5 = v4;
  memset(uu, 170, sizeof(uu));
  remote_device_copy_uuid();
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  uuid_unparse(uu, out);
  name = (const char *)remote_device_get_name(v5);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  if (remote_device_get_state(v5) == 1)
  {
    printf("%s %-16s\n", out, name);
  }

  else if (remote_device_get_state(v5) == 2)
  {
    uint64_t v8 = remote_device_copy_product_type(v5);
    if (v8) {
      id v9 = (char *)v8;
    }
    else {
      id v9 = "-";
    }
    uint64_t v10 = (void *)remote_device_copy_property(v5, "HWModel");
    int v11 = v10;
    if (v10 && (string_ptr = xpc_string_get_string_ptr(v10)) != 0LL) {
      int v13 = strdup(string_ptr);
    }
    else {
      int v13 = 0LL;
    }

    if (v13) {
      int v14 = v13;
    }
    else {
      int v14 = "-";
    }
    uint64_t v15 = remote_device_copy_os_version(v5);
    if (v15) {
      int v16 = (char *)v15;
    }
    else {
      int v16 = "-";
    }
    uint64_t v17 = remote_device_copy_os_build(v5);
    if (v17) {
      id v18 = (char *)v17;
    }
    else {
      id v18 = "-";
    }
    uint64_t v19 = remote_device_copy_bridge_version_string(v5);
    if (v19) {
      BOOL v20 = (char *)v19;
    }
    else {
      BOOL v20 = "-";
    }
    alias = (const char *)remote_device_get_alias(v5);
    if (alias) {
      snprintf(__str, 0x80uLL, "%s(%s)", name, alias);
    }
    else {
      __strlcpy_chk(__str, name, 128LL, 128LL);
    }
    int v22 = remote_device_copy_internal_build(v5);
    uint64_t v23 = "AppleInternal";
    if (!v22) {
      uint64_t v23 = "-";
    }
    printf("%s %-16s %-12s %-8s %s (%s/%s) %s\n", out, __str, v9, v14, v16, v18, v20, v23);
    if (v9 != "-") {
      free(v9);
    }
    if (v13) {
      free(v13);
    }
    if (v18 != "-") {
      free(v18);
    }
    if (v16 != "-") {
      free(v16);
    }
    if (v20 != "-") {
      free(v20);
    }
  }
}

uint64_t sub_1000046E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000046F8(uint64_t a1)
{
}

void sub_100004700(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 64));
    printf("Browse Complete: ");
    unsigned int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) - 1;
    if (v9 < 3)
    {
      puts(off_100021370[v9]);
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) || !*(_BYTE *)(a1 + 76)) {
        exit(0);
      }
      exit(-1);
    }

    sub_10001883C();
  }

  __int128 v6 = v5;
  int v12 = _NSConcreteStackBlock;
  __int128 v7 = *(_OWORD *)(a1 + 48);
  __int128 v17 = *(_OWORD *)(a1 + 32);
  __int128 v18 = v7;
  uint64_t v13 = 3221225472LL;
  int v14 = sub_100004A20;
  uint64_t v15 = &unk_100021090;
  char v21 = *(_BYTE *)(a1 + 77);
  char v22 = *(_BYTE *)(a1 + 76);
  id v16 = v6;
  int v20 = *(_DWORD *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 64);
  id v8 = v6;
  remote_device_set_connected_callback();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004B38;
  v10[3] = &unk_1000210B0;
  char v11 = *(_BYTE *)(a1 + 77);
  remote_device_set_disconnected_callback(v8, &_dispatch_main_q, v10);
}

uint64_t sub_10000488C(const char *a1, void *a2, int a3)
{
  id v5 = a2;
  name = (const char *)remote_device_get_name(v5);
  memset(uu, 170, sizeof(uu));
  remote_device_copy_uuid(v5, uu);

  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&out[16] = v7;
  *(_OWORD *)uuid_string_t out = v7;
  uuid_unparse(uu, out);
  if (a3)
  {
    *(_OWORD *)__str = 0u;
    __int128 v18 = 0u;
    time_t v16 = time(0LL);
    id v8 = localtime(&v16);
    __int128 v10 = *(_OWORD *)&v8->tm_mon;
    __int128 v9 = *(_OWORD *)&v8->tm_isdst;
    __int128 v11 = *(_OWORD *)&v8->tm_sec;
    v15.tm_zone = v8->tm_zone;
    *(_OWORD *)&v15.tm_mon = v10;
    *(_OWORD *)&v15.tm_isdst = v9;
    *(_OWORD *)&v15.tm_sec = v11;
    v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v14, 0LL);
    memset(v21, 170, 20);
    strftime(v21, 0x14uLL, "%Y-%m-%d %H:%M:%S", &v15);
    memset(v13, 170, 6);
    strftime(v13, 6uLL, "%z", &v15);
    snprintf(__str, 0x20uLL, "%s.%06d%s", v21, v14.tv_usec, v13);
    printf("%s ", __str);
  }

  return printf("%-16s %s (%s)\n", a1, name, out);
}

void sub_100004A20(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 85))
  {
    int v3 = *(_DWORD *)(a1 + 80);
    char v4 = *(const unsigned __int8 **)(a1 + 64);
    id v5 = *(const char **)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    if (remote_device_get_type() == v3)
    {
LABEL_3:

      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      remote_device_browser_cancel(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
      return;
    }

    if (v4)
    {
      memset(uu2, 170, sizeof(uu2));
      remote_device_copy_uuid(v6, uu2);
      if (!uuid_compare(v4, uu2)) {
        goto LABEL_3;
      }
    }

    else if (v5)
    {
      name = (const char *)remote_device_get_name(v6);
      if (!strcmp(v5, name)) {
        goto LABEL_3;
      }
    }
  }

uint64_t sub_100004B38(uint64_t a1, void *a2)
{
  return sub_10000488C("DISCONNECT", a2, *(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_100004B48(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 2;
  return remote_device_browser_cancel(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

uint64_t sub_100004B68(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 3;
  return remote_device_browser_cancel(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

id sub_100004B88(const char *a1)
{
  id v2 = strstr(a1, ".rsd");
  if (v2) {
    char *v2 = 0;
  }
  memset(uu, 170, sizeof(uu));
  if (uuid_parse(a1, uu))
  {
    if (remote_device_type_parse(a1))
    {
      int v3 = (void *)remote_device_copy_unique_of_type();
      if (!v3) {
LABEL_10:
      }
        errx(65, "Unable to find device %s.\n", a1);
    }

    else
    {
      int v3 = (void *)remote_device_copy_device_with_name(a1);
      if (!v3) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    int v3 = (void *)remote_device_copy_device_with_uuid(uu);
    if (!v3) {
      goto LABEL_10;
    }
  }

  return v3;
}

void sub_100004C48(void *a1, char a2)
{
  id v3 = a1;
  uint64_t type = remote_device_get_type();
  description = (const char *)remote_device_type_get_description(type);
  name = (const char *)remote_device_get_name(v3);
  printf("Found %s (%s)\n", name, description);
  alias = (const char *)remote_device_get_alias(v3);
  if (alias) {
    printf("\tAlias Name: %s\n", alias);
  }
  int state = remote_device_get_state(v3);
  __int128 v9 = (const char *)remote_device_state_get_description();
  __int128 v10 = v9;
  if (state == 2)
  {
    int connectable = remote_device_get_connectable(v3);
    int v12 = "not-connectable";
    if (connectable) {
      int v12 = "connectable";
    }
    printf("\tState: %s (%s)\n", v10, v12);
    memset(uu, 170, sizeof(uu));
    remote_device_copy_uuid(v3, uu);
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v13;
    *(_OWORD *)&out[16] = v13;
    uuid_unparse(uu, out);
    printf("\tUUID: %s\n", out);
    timeval v14 = (const char *)remote_device_copy_product_type(v3);
    if (v14)
    {
      tm v15 = (char *)v14;
      printf("\tProduct Type: %s\n", v14);
      free(v15);
    }

    time_t v16 = (char *)remote_device_copy_os_build(v3);
    uint64_t v17 = remote_device_copy_os_version(v3);
    __int128 v18 = (char *)v17;
    if (v16 && v17)
    {
      int v19 = remote_device_copy_internal_build(v3);
      int v20 = "";
      if (v19) {
        int v20 = " AppleInternal";
      }
      printf("\tOS Build: %s (%s)%s\n", v18, v16, v20);
    }

    free(v16);
    free(v18);
    uint64_t messaging_protocol_version = remote_device_get_messaging_protocol_version(v3);
    printf("\tMessaging Protocol Version: %llu\n", messaging_protocol_version);
    int v22 = remote_device_xpc_remote_connection_tls_enabled(v3);
    uint64_t v23 = "disabled";
    if (v22) {
      uint64_t v23 = "enabled";
    }
    printf("\tEncrypted RemoteXPC: %s\n", v23);
    *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v42 = v24;
    __int128 v43 = v24;
    __int128 v41 = v24;
    if (remote_device_get_heartbeat_stats(v3, &v41))
    {
      __uint64_t v25 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      puts("\tHeartbeat:");
      if (*((void *)&v41 + 1)) {
        printf( "\t\tLast successful heartbeat sent %.3fs ago, received %.3fs ago (took %.3fs)\n",  (double)(v25 - (unint64_t)v41) / 1000000000.0,  (double)(v25 - *((void *)&v41 + 1)) / 1000000000.0,  (double)(unint64_t)(*((void *)&v41 + 1) - v41) / 1000000000.0);
      }
      if ((void)v42) {
        printf("\t\tOutstanding heartbeat sent %.3fs ago\n", (double)(v25 - (unint64_t)v42) / 1000000000.0);
      }
      if (*((void *)&v42 + 1)) {
        printf("\t\tLast incoming heartbeat received %.3fs ago\n", (double)(v25 - *((void *)&v42 + 1)) / 1000000000.0);
      }
      printf("\t\t%llu heartbeats sent, %llu received\n", (void)v43, *((void *)&v43 + 1));
    }

    __int128 v26 = (void *)remote_device_copy_properties(v3);
    __int128 v27 = (_BYTE *)xpc_copy_clean_description(v26);

    printf("\tProperties: ");
    sub_1000051F8(v27, "\t");
    free(v27);
    putchar(10);
    puts("\tServices:");
    __int128 v28 = (void *)remote_device_copy_service_names(v3);
    if (!v28 || (__int128 v29 = v28, xpc_get_type(v28) != (xpc_type_t)&_xpc_type_array)) {
      sub_100018854(out, &v41);
    }
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10000525C;
    applier[3] = &unk_100021128;
    char v40 = a2;
    id v30 = v3;
    id v39 = v30;
    xpc_array_apply(v29, applier);
    puts("\tLocal Services:");
    __int128 v31 = (void *)remote_device_copy_local_service_names(v30);
    if (!v31 || (uint64_t v32 = v31, xpc_get_type(v31) != (xpc_type_t)&_xpc_type_array)) {
      sub_1000188D0(out, &v41);
    }
    xpc_array_apply(v32, &stru_100021168);
  }

  else
  {
    printf("\tState: %s\n", v9);
    latest_connect_uint64_t result = remote_device_get_latest_connect_result(v3);
    if (latest_connect_result < 0)
    {
      puts("\t No connect() results");
    }

    else
    {
      int v34 = latest_connect_result;
      if (latest_connect_result) {
        uint64_t v35 = strerror(latest_connect_result);
      }
      else {
        uint64_t v35 = "No error";
      }
      printf("\tconnect() result: %d (%s)\n", v34, v35);
    }

    uint64_t v36 = (void *)remote_device_copy_properties(v3);
    int v37 = (_BYTE *)xpc_copy_clean_description(v36);

    printf("\tProperties: ");
    sub_1000051F8(v37, "\t");
    free(v37);
    putchar(10);
  }

  putchar(10);
}

id sub_1000050FC(void *a1, uint64_t a2)
{
  id v3 = a1;
  char v4 = (void *)remote_device_copy_service(v3, a2);

  return v4;
}

void sub_10000514C(void *a1, const char *a2)
{
  id v3 = a1;
  if (!a2) {
    a2 = "";
  }
  id v7 = v3;
  uint64_t version = remote_service_get_version();
  if (version) {
    printf("%sVersion: %lld\n", a2, version);
  }
  id v5 = (void *)remote_service_copy_properties(v7);
  if (xpc_dictionary_get_count(v5))
  {
    printf("%sProperties: ", a2);
    id v6 = (_BYTE *)xpc_copy_clean_description(v5);
    sub_1000051F8(v6, a2);
    free(v6);
    putchar(10);
  }
}

_BYTE *sub_1000051F8(_BYTE *result, const char *a2)
{
  char v2 = *result;
  if (*result)
  {
    char v4 = result + 1;
    do
    {
      uint64_t result = (_BYTE *)putc(v2, __stdoutp);
      if (*(v4 - 1) == 10) {
        uint64_t result = (_BYTE *)fputs(a2, __stdoutp);
      }
      int v5 = *v4++;
      char v2 = v5;
    }

    while (v5);
  }

  return result;
}

uint64_t sub_10000525C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  printf("\t\t%s\n", string_ptr);
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = xpc_string_get_string_ptr(v4);
    id v8 = (void *)remote_device_copy_service(v6, v7);
    __int128 v9 = v8;
    if (v8) {
      sub_10000514C(v8, "\t\t\t");
    }
  }

  return 1LL;
}

BOOL sub_1000052E0(id a1, unint64_t a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  printf("\t\t%s\n", string_ptr);
  return 1;
}

void sub_100005314(id a1, OS_remote_device *a2, BOOL a3)
{
  BOOL v3 = a3;
  id v4 = a2;
  if (v3) {
    exit(0);
  }
  int v5 = v4;
  sub_100004C48(v4, 1);
}

BOOL sub_100005358(id a1, unint64_t a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  printf("\t\t%s\n", string_ptr);
  return 1;
}

void sub_10000538C(__SecIdentity *a1)
{
  SecCertificateRef certificateRef = 0LL;
  SecKeyRef privateKeyRef = 0LL;
  puts("\tIdentity:");
  if (a1)
  {
    if (SecIdentityCopyPrivateKey(a1, &privateKeyRef))
    {
      uint64_t v20 = 0LL;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v25 = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      int v23 = 134217984;
      uint64_t v24 = 0LL;
      uint64_t v9 = _os_log_send_and_compose_impl(v8, &v20, &v25, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v10 = _os_crash_msg(v20, v9);
      sub_100018478(v10);
    }

    char v2 = SecKeyCopyPublicKey(privateKeyRef);
    BOOL v3 = v2;
    if (!v2)
    {
      uint64_t v20 = 0LL;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v25 = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      int v23 = 134217984;
      uint64_t v24 = 0LL;
      uint64_t v12 = _os_log_send_and_compose_impl(v11, &v20, &v25, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v13 = _os_crash_msg(v20, v12);
      sub_100018478(v13);
    }

    id v4 = SecKeyCopyExternalRepresentation(v2, 0LL);
    if (!v4)
    {
      uint64_t v20 = 0LL;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v25 = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      int v23 = 134217984;
      uint64_t v24 = 0LL;
      uint64_t v15 = _os_log_send_and_compose_impl(v14, &v20, &v25, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v16 = _os_crash_msg(v20, v15);
      sub_100018478(v16);
    }

    int v5 = v4;

    if (SecIdentityCopyCertificate(a1, &certificateRef))
    {
      uint64_t v20 = 0LL;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v25 = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      int v23 = 134217984;
      uint64_t v24 = 0LL;
      uint64_t v18 = _os_log_send_and_compose_impl(v17, &v20, &v25, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v19 = _os_crash_msg(v20, v18);
      sub_100018478(v19);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData sha256](v5, "sha256"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 base64EncodedStringWithOptions:0]);
    printf("\t\tPublic key SHA256: %s\n", (const char *)[v7 UTF8String]);

    if (certificateRef) {
      CFRelease(certificateRef);
    }

    CFRelease(v3);
  }

  else
  {
    puts("\t\tnone");
  }

  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
}

void sub_1000056F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

void sub_100005770(id a1, OS_xpc_object *a2)
{
  object = a2;
  char v2 = (char *)xpc_copy_clean_description();
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    fprintf(__stderrp, "Error: %s\n", v2);
    exit(1);
  }

  puts(v2);
  free(v2);
}

void sub_1000057F0(id a1)
{
}

void sub_100005800(id a1, OS_xpc_object *a2)
{
  object = a2;
  char v2 = (const char *)xpc_copy_clean_description();
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error) {
    errx(70, "Connection got error: %s", v2);
  }
  fprintf(__stderrp, "Reply: %s\n", v2);
}

void sub_10000587C(id a1, int a2)
{
  if (!a2)
  {
    fwrite("File Transfer Complete!\n", 0x18uLL, 1uLL, __stderrp);
    exit(0);
  }

  errc(70, a2, "File Transfer Failed");
}

uint64_t sub_1000058C0()
{
  uint64_t connected_socket = remote_service_create_connected_socket();
  uint64_t v1 = connected_socket;
  if ((_DWORD)connected_socket != -1)
  {
    int v2 = fcntl(connected_socket, 3, 0LL);
    fcntl(v1, 4, v2 & 0xFFFFFFFB);
  }

  return v1;
}

void sub_100005918(int a1, int a2, int a3)
{
  uint64_t v6 = valloc(0x20000uLL);
  uint64_t v7 = kqueue();
  if ((v7 & 0x80000000) != 0) {
    sub_100018970(v7);
  }
  int v8 = v7;
  changelist.ident = a1;
  *(_DWORD *)&changelist.filter = 0x1FFFF;
  memset(&changelist.fflags, 0, 20);
  uint64_t v19 = a3;
  int v20 = 0x1FFFF;
  uint64_t v22 = 0LL;
  uint64_t v21 = 0LL;
  int v23 = 0;
  uint64_t v9 = kevent(v7, &changelist, 2, 0LL, 0, 0LL);
  if ((_DWORD)v9) {
    sub_1000189C0(v9);
  }
  while (1)
  {
    do
    {
      while (1)
      {
        timeuuid_string_t out = (timespec)xmmword_10001A610;
        int v10 = kevent(v8, 0LL, 0, &changelist, 1, &timeout);
        if ((v10 & 0x80000000) == 0) {
          break;
        }
        uint64_t v16 = __error();
        if (*v16 != 4) {
          sub_100018984((uint64_t)v16);
        }
      }
    }

    while (!v10);
    if (changelist.data >= 0x20000uLL) {
      intptr_t data = 0x20000LL;
    }
    else {
      intptr_t data = changelist.data;
    }
    ssize_t v12 = read(changelist.ident, v6, data);
    if (v12 < 0) {
      sub_100018998(v12);
    }
    size_t v13 = v12;
    if (v12)
    {
      if (LODWORD(changelist.ident) == a1) {
        int v14 = a3;
      }
      else {
        int v14 = a2;
      }
      ssize_t v15 = write(v14, v6, v13);
      if (v15 < 0) {
        sub_1000189AC(v15);
      }
    }
  }

  close(v8);
  close(a1);
  if (a2 != a1) {
    close(a2);
  }
  close(a3);
  free(v6);
}

uint64_t sub_100005AC4(char *const *a1, uint64_t a2)
{
  uint32_t bufsize = 1024;
  _NSGetExecutablePath(__b, &bufsize);
  posix_spawn_file_actions_t v13 = (posix_spawn_file_actions_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawn_file_actions_init(&v13)) {
    sub_100018CC8(&v12, v15);
  }
  uint64_t v4 = 0LL;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (posix_spawn_file_actions_addinherit_np(&v13, *(_DWORD *)(a2 + 4 * v4))) {
      sub_100018C60(&v12, v15);
    }
    char v5 = 0;
    uint64_t v4 = 1LL;
  }

  while ((v6 & 1) != 0);
  int v7 = open("/dev/null", 2);
  if (v7 != -1)
  {
    if (posix_spawn_file_actions_adddup2(&v13, v7, 0)) {
      sub_100018BF8(&v12, v15);
    }
    if (posix_spawn_file_actions_adddup2(&v13, v7, 1)) {
      sub_100018B90(&v12, v15);
    }
    if (posix_spawn_file_actions_adddup2(&v13, v7, 2)) {
      sub_100018B28(&v12, v15);
    }
  }

  posix_spawnattr_t v12 = (posix_spawnattr_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawnattr_init(&v12)) {
    sub_100018AC0(&v11, v15);
  }
  if (posix_spawnattr_setflags(&v12, 2)) {
    sub_100018A58(&v11, v15);
  }
  if (posix_spawnattr_setflags(&v12, 0x4000)) {
    sub_1000189F0(&v11, v15);
  }
  v15[0] = -1;
  int v8 = _NSGetEnviron();
  int v9 = posix_spawn(v15, __b, &v13, &v12, a1, *v8);
  if (v9) {
    sub_1000189D4(v9);
  }
  posix_spawn_file_actions_destroy(&v13);
  uint64_t result = posix_spawnattr_destroy(&v12);
  if (v7 != -1) {
    return close(v7);
  }
  return result;
}

void sub_100005CDC(uint64_t a1)
{
  uint64_t v1 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "parent exited, exiting", v2, 2u);
  }

  exit(1);
}

void sub_100005D30(id a1, BOOL a2)
{
  BOOL v2 = a2;
  BOOL v3 = "failure";
  if (a2) {
    BOOL v3 = "success";
  }
  fprintf(__stderrp, "Heartbeat %s\n", v3);
  exit(!v2);
}

uint64_t sub_100005D80(uint64_t a1, int a2)
{
  int v4 = fcntl(a2, 3, 0LL);
  fcntl(a2, 4, v4 & 0xFFFFFFFB);
  posix_spawn_file_actions_t v23 = (posix_spawn_file_actions_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawn_file_actions_init(&v23)) {
    sub_100018CC8(&v22, buf);
  }
  int v5 = *(_DWORD *)(a1 + 72);
  if (v5 == -1)
  {
    if (posix_spawn_file_actions_adddup2(&v23, a2, 0)) {
      sub_100018F58(&v22, buf);
    }
    if (posix_spawn_file_actions_adddup2(&v23, a2, 1)) {
      sub_100018EF0(&v22, buf);
    }
  }

  else if (posix_spawn_file_actions_adddup2(&v23, a2, v5))
  {
    sub_100018FC0(&v22, buf);
  }

  posix_spawnattr_t v22 = (posix_spawnattr_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawnattr_init(&v22)) {
    sub_100018AC0(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 2)) {
    sub_100018A58(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 0x4000)) {
    sub_1000189F0(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 12)) {
    sub_100018E88(&v21, buf);
  }
  sigset_t v19 = 0;
  sigset_t v20 = -1;
  if (posix_spawnattr_setsigdefault(&v22, &v20)) {
    sub_100018E20(&v21, buf);
  }
  if (posix_spawnattr_setsigmask(&v22, &v19)) {
    sub_100018DB8(&v21, buf);
  }
  LODWORD(v21) = -1;
  char v6 = *(char *const **)(a1 + 56);
  int v7 = *v6;
  int v8 = _NSGetEnviron();
  int v9 = posix_spawn((pid_t *)&v21, v7, &v23, &v22, v6, *v8);
  int v10 = *(os_log_s **)(a1 + 32);
  if (v9)
  {
    int v11 = v9;
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
      sub_100018D30(a1, v11, v10);
    }
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = v12;
      __int16 v26 = 1024;
      int v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Accepted service, started pid %d",  buf,  0x12u);
    }

    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v14 = *(void *)(v13 + 24);
    if (!v14)
    {
      uint64_t v15 = os_transaction_create("rsdtrampoline");
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24);
    }

    *(void *)(v13 + 24) = v14 + 1;
  }

  close(a2);
  posix_spawn_file_actions_destroy(&v23);
  return posix_spawnattr_destroy(&v22);
}

int *sub_100006070(void *a1)
{
  int v9 = 0;
  do
  {
    while (1)
    {
      uint64_t result = (int *)wait3(&v9, 1, 0LL);
      if ((_DWORD)result == -1) {
        break;
      }
      int v3 = (int)result;
      if (!(_DWORD)result) {
        return result;
      }
      int v4 = (os_log_s *)a1[4];
      if ((v9 & 0x7F) != 0)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v11 = v3;
          __int16 v12 = 1024;
          int v13 = v9 & 0x7F;
          _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Reaped child %d, terminated with signal %d",  buf,  0xEu);
        }
      }

      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reaped child %d, exited normally", buf, 8u);
      }

      uint64_t v5 = *(void *)(a1[5] + 8LL);
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        *(void *)(v5 + 24) = v6 - 1;
        if (*(void *)(*(void *)(a1[5] + 8LL) + 24LL)) {
          continue;
        }
      }

      uint64_t v7 = *(void *)(a1[6] + 8LL);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0LL;
    }

    uint64_t result = __error();
  }

  while (*result == 4);
  return result;
}

uint64_t sub_100006214()
{
  char v2 = 0;
  if (v2) {
    v0 = "required";
  }
  else {
    v0 = "not required";
  }
  return printf("TLS is currently %s for the compute platform\n", v0);
}

uint64_t sub_100006270(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result != -1)
  {
    uint64_t result = close(result);
    if ((_DWORD)result == -1) {
      sub_100019028(&v2, v3);
    }
  }

  return result;
}

uint64_t sub_1000062D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

double sub_1000062F0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

double sub_100006334(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL sub_10000634C()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_100006358(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

uint64_t sub_100006364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

BOOL sub_10000637C(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

  ;
}

uint64_t sub_100006398(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

void sub_1000063A4(uint64_t a1, const char *a2)
{
}

char *sub_1000063AC(int *a1)
{
  return strerror(*a1);
}

void sub_1000063B4(uint64_t a1, const char *a2)
{
}

uint64_t sub_1000063BC(uint64_t a1, os_log_s *a2, uint64_t a3, uid_t a4, gid_t a5, int a6, int a7)
{
  LODWORD(v301) = a7;
  int v273 = a6;
  gid_t v277 = a5;
  uid_t v278 = a4;
  uint64_t v308 = a3;
  os_log_t v307 = a2;
  uint64_t v306 = a1;
  uint64_t v265 = type metadata accessor for DispatchTime(0LL);
  uint64_t v264 = *(void *)(v265 - 8);
  __chkstk_darwin(v265);
  v263 = &v259[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v276 = type metadata accessor for String.Encoding(0LL);
  uint64_t v275 = *(void *)(v276 - 8);
  __chkstk_darwin(v276);
  v274 = &v259[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v294 = type metadata accessor for DispatchWorkItemFlags(0LL);
  *(void *)&__int128 v293 = *(void *)(v294 - 8);
  __chkstk_darwin(v294);
  v292 = &v259[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v291 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v290 = *(void *)(v291 - 8);
  __chkstk_darwin(v291);
  v289 = &v259[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v288 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v286 = *(void *)(v288 - 8);
  __chkstk_darwin(v288);
  v287 = &v259[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v12 = type metadata accessor for IPv6Address(0LL);
  uint64_t v305 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  v272 = &v259[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = __chkstk_darwin(v13);
  v270 = &v259[-v16];
  uint64_t v17 = __chkstk_darwin(v15);
  v285 = &v259[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  v284 = &v259[-v20];
  uint64_t v21 = __chkstk_darwin(v19);
  posix_spawn_file_actions_t v23 = &v259[-v22];
  __chkstk_darwin(v21);
  uint64_t v25 = &v259[-v24];
  uint64_t v26 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  v269 = &v259[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v30 = __chkstk_darwin(v28);
  v283 = &v259[-v31];
  __chkstk_darwin(v30);
  int v33 = &v259[-v32];
  uint64_t v34 = type metadata accessor for Logger(0LL);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = __chkstk_darwin(v34);
  v266 = &v259[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v38 = __chkstk_darwin(v36);
  v262 = &v259[-v39];
  uint64_t v40 = __chkstk_darwin(v38);
  v267 = &v259[-v41];
  uint64_t v42 = __chkstk_darwin(v40);
  v271 = &v259[-v43];
  uint64_t v44 = __chkstk_darwin(v42);
  v300 = &v259[-v45];
  uint64_t v46 = __chkstk_darwin(v44);
  v299 = &v259[-v47];
  __chkstk_darwin(v46);
  v49 = &v259[-v48];
  uint64_t v50 = sub_10000C778();
  uint64_t v281 = v35;
  v51 = *(void (**)(void))(v35 + 16);
  uint64_t v52 = v12;
  uint64_t v302 = v50;
  uint64_t v297 = v34;
  v303 = (uint64_t (*)(_BYTE *, uint64_t, uint64_t))v51;
  v51(v49);
  v304 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v27 + 16);
  v304(v33, v306, v26);
  v53 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v305 + 16);
  v280 = v25;
  v53(v25, v308, v12);
  v282 = v23;
  uint64_t v54 = ((uint64_t (*)(_BYTE *, os_log_t, uint64_t))v53)(v23, v307, v12);
  v279 = v49;
  v55 = (os_log_s *)Logger.logObject.getter(v54);
  os_log_type_t v56 = static os_log_type_t.info.getter();
  int v57 = v56;
  BOOL v58 = os_log_type_enabled(v55, v56);
  uint64_t v298 = v26;
  v296 = (void (*)(_BYTE *, os_log_t, uint64_t))v53;
  if (v58)
  {
    uint64_t v59 = v26;
    uint64_t v60 = swift_slowAlloc(26LL, -1LL);
    uint64_t v261 = swift_slowAlloc(64LL, -1LL);
    uint64_t aBlock = v261;
    *(_DWORD *)uint64_t v60 = 33555202;
    __int16 v61 = ((uint64_t (*)(void))NWEndpoint.Port.rawValue.getter)();
    v268 = *(void (**)(_BYTE *, uint64_t))(v27 + 8);
    v268(v33, v59);
    LOWORD(v313) = v61;
    uint64_t v62 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, (char *)&v313 + 2, v60 + 4, v60 + 6);
    *(_WORD *)(v60 + 6) = 2080;
    int v260 = v57;
    v63 = v280;
    uint64_t v64 = IPv6Address.debugDescription.getter(v62);
    unint64_t v66 = v65;
    uint64_t v313 = sub_1000086A8(v64, v65, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, &v314, v60 + 8, v60 + 16);
    swift_bridgeObjectRelease(v66);
    v67 = *(uint64_t (**)(_BYTE *, uint64_t))(v305 + 8);
    uint64_t v68 = v67(v63, v52);
    *(_WORD *)(v60 + 16) = 2080;
    v69 = v282;
    uint64_t v70 = IPv6Address.debugDescription.getter(v68);
    unint64_t v72 = v71;
    uint64_t v313 = sub_1000086A8(v70, v71, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, &v314, v60 + 18, v60 + 26);
    swift_bridgeObjectRelease(v72);
    v282 = v67;
    v67(v69, v52);
    _os_log_impl( (void *)&_mh_execute_header,  v55,  (os_log_type_t)v260,  "SSH tunnel privileged helper started. Will listen on %hu and attempt to create a utun from %s -> %s",  (uint8_t *)v60,  0x1Au);
    uint64_t v73 = v261;
    swift_arrayDestroy(v261, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v73, -1LL, -1LL);
    swift_slowDealloc(v60, -1LL, -1LL);
  }

  else
  {
    v268 = *(void (**)(_BYTE *, uint64_t))(v27 + 8);
    v268(v33, v26);
    v74 = *(void (**)(_BYTE *, uint64_t))(v305 + 8);
    v74(v280, v52);
    v75 = v282;
    v282 = v74;
    v74(v75, v52);
  }

  uint64_t v76 = v297;
  uint64_t v305 = *(void *)(v281 + 8);
  ((void (*)(_BYTE *, uint64_t))v305)(v279, v297);
  uint64_t v77 = v52;
  int v78 = (int)v301;
  int v79 = tcsetpgrp(0, (pid_t)v301);
  uint64_t v80 = v308;
  v81 = v304;
  v82 = v300;
  if (v79)
  {
    uint64_t v83 = v303(v299, v302, v76);
    v84 = (os_log_s *)Logger.logObject.getter(v83);
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = swift_slowAlloc(18LL, -1LL);
      v87 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v86 = 67109378;
      LODWORD(aBlock) = v78;
      uint64_t v88 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v86 + 4, v86 + 8);
      *(_WORD *)(v86 + 8) = 2112;
      int v89 = errno.getter(v88);
      unint64_t v90 = sub_100008D40();
      uint64_t v91 = swift_allocError(&type metadata for Errno, v90, 0LL, 0LL);
      _DWORD *v92 = v89;
      uint64_t v93 = _swift_stdlib_bridgeErrorToNSError(v91);
      uint64_t aBlock = v93;
      v82 = v300;
      int v78 = (int)v301;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v311, v86 + 10, v86 + 18);
      uint64_t *v87 = v93;
      uint64_t v80 = v308;
      _os_log_impl( (void *)&_mh_execute_header,  v84,  v85,  "Failed returning foreground to remotectl at %d: %@",  (uint8_t *)v86,  0x12u);
      uint64_t v94 = sub_1000080BC(&qword_100024D90);
      swift_arrayDestroy(v87, 1LL, v94);
      v95 = v87;
      v81 = v304;
      swift_slowDealloc(v95, -1LL, -1LL);
      swift_slowDealloc(v86, -1LL, -1LL);
    }

    ((void (*)(_BYTE *, uint64_t))v305)(v299, v76);
  }

  uint64_t v96 = v303(v82, v302, v76);
  v97 = (os_log_s *)Logger.logObject.getter(v96);
  os_log_type_t v98 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v97, v98))
  {
    uint64_t v99 = v76;
    v100 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v100 = 67109120;
    v81 = v304;
    LODWORD(aBlock) = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v100 + 4, v100 + 8);
    _os_log_impl( (void *)&_mh_execute_header,  v97,  v98,  "SSH tunnel privileged helper returned foreground to %d",  v100,  8u);
    v101 = v100;
    uint64_t v76 = v99;
    swift_slowDealloc(v101, -1LL, -1LL);
  }

  ((void (*)(_BYTE *, uint64_t))v305)(v82, v76);
  type metadata accessor for TCPPacketTunnelServer(0LL);
  uint64_t v102 = (uint64_t)v283;
  v81(v283, v306, v298);
  uint64_t v103 = (uint64_t)v284;
  uint64_t v104 = v80;
  v105 = v296;
  v296(v284, (os_log_t)v104, v77);
  uint64_t v106 = (uint64_t)v285;
  v105(v285, v307, v77);
  v301 = sub_10000C6A8();
  uint64_t v107 = (uint64_t)v287;
  void *v287 = *v301;
  (*(void (**)(uint64_t, void, uint64_t))(v286 + 104))( v107,  enum case for DispatchTimeInterval.seconds(_:),  v288);
  uint64_t v108 = sub_100009AF4(v102, v103, v106, v107);
  v109 = (void (__cdecl *)(int))SIG_IGN.getter(v108);
  signal(2, v109);
  sub_100007E24(0LL, (unint64_t *)&qword_100024D80, &OBJC_CLASS___OS_dispatch_source_ptr);
  sub_100007E24(0LL, (unint64_t *)&qword_1000249B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v110 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v111 = static OS_dispatch_source.makeSignalSource(signal:queue:)(2LL, v110);

  uint64_t ObjectType = swift_getObjectType(v111);
  v311[3] = sub_100007FDC;
  uint64_t v312 = v108;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  v311[0] = 1107296256LL;
  v311[1] = sub_100007FE4;
  v311[2] = &unk_100021388;
  v113 = _Block_copy(&aBlock);
  uint64_t v114 = swift_retain(v108);
  uint64_t v115 = v77;
  v116 = v289;
  static DispatchQoS.unspecified.getter(v114);
  v117 = v292;
  sub_100008028();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v116, v117, v113, ObjectType);
  _Block_release(v113);
  (*(void (**)(_BYTE *, uint64_t))(v293 + 8))(v117, v294);
  (*(void (**)(_BYTE *, uint64_t))(v290 + 8))(v116, v291);
  swift_release(v312);
  OS_dispatch_source.activate()();
  uint64_t v118 = v295;
  (*(void (**)(void))(*(void *)v108 + 184LL))();
  if (v118)
  {
    v119 = (_BYTE *)v108;
LABEL_28:
    swift_release(v119);
    v201 = (_BYTE *)v111;
    return swift_unknownObjectRelease(v201);
  }

  v300 = (_BYTE *)v108;
  gid_t v120 = v277;
  if (setgid(v277) == -1)
  {
    uint64_t aBlock = 0LL;
    v311[0] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(21LL);
    uint64_t v191 = swift_bridgeObjectRelease(v311[0]);
    v192 = "Could not set gid: ";
LABEL_27:
    uint64_t aBlock = 0xD000000000000013LL;
    v311[0] = (unint64_t)(v192 - 32) | 0x8000000000000000LL;
    uint64_t v193 = errno.getter(v191);
    v194._countAndFlagsBits = Errno.description.getter(v193);
    object = v194._object;
    String.append(_:)(v194);
    swift_bridgeObjectRelease(object);
    uint64_t v196 = aBlock;
    uint64_t v197 = v311[0];
    unint64_t v198 = sub_100008268();
    uint64_t v199 = swift_allocError(&type metadata for String, v198, 0LL, 0LL);
    uint64_t *v200 = v196;
    v200[1] = v197;
    swift_willThrow(v199);
    v119 = v300;
    goto LABEL_28;
  }

  if (setuid(v278) == -1)
  {
    uint64_t aBlock = 0LL;
    v311[0] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(21LL);
    uint64_t v191 = swift_bridgeObjectRelease(v311[0]);
    v192 = "Could not set uid: ";
    goto LABEL_27;
  }

  uint64_t v294 = 0LL;
  uint64_t v295 = v115;
  v299 = (_BYTE *)v111;
  id v121 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t aBlock = 0LL;
  v311[0] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(30LL);
  swift_bridgeObjectRelease(v311[0]);
  uint64_t aBlock = 0x6D65722F706D742FLL;
  v311[0] = 0xEF2E6C746365746FLL;
  int v122 = v273;
  LODWORD(v313) = v273;
  v123._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
  v124 = v123._object;
  String.append(_:)(v123);
  swift_bridgeObjectRelease(v124);
  v125._countAndFlagsBits = 0x2D7265706C65682ELL;
  v125._object = (void *)0xED00007964616572LL;
  String.append(_:)(v125);
  uint64_t v126 = v311[0];
  NSString v127 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v126);
  LODWORD(v313) = v122;
  uint64_t aBlock = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
  v311[0] = v128;
  v129._countAndFlagsBits = 0x594441455220LL;
  v129._object = (void *)0xE600000000000000LL;
  String.append(_:)(v129);
  uint64_t v130 = aBlock;
  uint64_t v131 = v311[0];
  v132 = v274;
  static String.Encoding.utf8.getter();
  uint64_t v133 = String.data(using:allowLossyConversion:)(v132, 0LL, v130, v131);
  unint64_t v135 = v134;
  swift_bridgeObjectRelease(v131);
  (*(void (**)(_BYTE *, uint64_t))(v275 + 8))(v132, v276);
  Class isa = 0LL;
  if (v135 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100008CE8(v133, v135);
  }

  uint64_t v137 = sub_1000080BC(&qword_1000249B8);
  uint64_t inited = swift_initStackObject(v137, v309);
  *(_OWORD *)(inited + 16) = xmmword_10001A640;
  uint64_t v139 = v278;
  *(void *)(inited + 32) = NSFileOwnerAccountID;
  *(void *)(inited + 40) = v139;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 72) = NSFileGroupOwnerAccountID;
  *(void *)(inited + 80) = v120;
  *(void *)(inited + 104) = &type metadata for Int;
  *(void *)(inited + 112) = NSFilePosixPermissions;
  *(void *)(inited + 144) = &type metadata for Int;
  *(void *)(inited + 120) = 438LL;
  v140 = NSFileOwnerAccountID;
  v141 = NSFileGroupOwnerAccountID;
  v142 = NSFilePosixPermissions;
  unint64_t v143 = sub_1000080FC(inited);
  type metadata accessor for FileAttributeKey();
  sub_1000090B4( &qword_1000249C0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A7B8);
  Class v144 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v143);
  LODWORD(v143) = [v121 createFileAtPath:v127 contents:isa attributes:v144];

  os_log_t v145 = v307;
  if (!(_DWORD)v143)
  {
    unint64_t v203 = sub_100008268();
    uint64_t v204 = swift_allocError(&type metadata for String, v203, 0LL, 0LL);
    void *v205 = 0xD000000000000026LL;
    v205[1] = 0x800000010001C340LL;
    swift_willThrow(v204);
    swift_release(v300);
    v201 = v299;
    return swift_unknownObjectRelease(v201);
  }

  uint64_t v146 = (*(uint64_t (**)(void))(*(void *)v300 + 168LL))();
  if (v147) {
    uint64_t v148 = v146;
  }
  else {
    uint64_t v148 = 1853191285LL;
  }
  if (v147) {
    v149 = v147;
  }
  else {
    v149 = (void *)0xE400000000000000LL;
  }
  v292 = (_BYTE *)sub_1000080BC(&qword_1000249D0);
  uint64_t v150 = swift_allocObject(v292, 64LL, 7LL);
  __int128 v293 = xmmword_10001A650;
  *(_OWORD *)(v150 + 16) = xmmword_10001A650;
  uint64_t aBlock = 0LL;
  v311[0] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(69LL);
  v151._countAndFlagsBits = 0xD00000000000001DLL;
  v151._object = (void *)0x800000010001C370LL;
  String.append(_:)(v151);
  v152._countAndFlagsBits = v148;
  v152._object = v149;
  String.append(_:)(v152);
  v153._countAndFlagsBits = 0x206D6F726620LL;
  v153._object = (void *)0xE600000000000000LL;
  String.append(_:)(v153);
  uint64_t v154 = v308;
  v156._countAndFlagsBits = IPv6Address.debugDescription.getter(v155);
  v157 = v156._object;
  String.append(_:)(v156);
  swift_bridgeObjectRelease(v157);
  v158._countAndFlagsBits = 540945696LL;
  v158._object = (void *)0xE400000000000000LL;
  String.append(_:)(v158);
  v160._countAndFlagsBits = IPv6Address.debugDescription.getter(v159);
  v161 = v160._object;
  String.append(_:)(v160);
  swift_bridgeObjectRelease(v161);
  v162._countAndFlagsBits = 0xD000000000000018LL;
  v162._object = (void *)0x800000010001C390LL;
  String.append(_:)(v162);
  uint64_t v163 = aBlock;
  uint64_t v164 = v311[0];
  *(void *)(v150 + 56) = &type metadata for String;
  *(void *)(v150 + 32) = v163;
  *(void *)(v150 + 40) = v164;
  print(_:separator:terminator:)(v150, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  swift_bridgeObjectRelease(v150);
  v165 = v271;
  uint64_t v166 = v297;
  v303(v271, v302, v297);
  v167 = v270;
  uint64_t v168 = v295;
  v169 = v296;
  v296(v270, (os_log_t)v154, v295);
  v169(v272, v145, v168);
  v170 = v269;
  v304(v269, v306, v298);
  uint64_t v171 = swift_bridgeObjectRetain(v149);
  v172 = (os_log_s *)Logger.logObject.getter(v171);
  os_log_type_t v173 = static os_log_type_t.info.getter();
  int v174 = v173;
  if (os_log_type_enabled(v172, v173))
  {
    uint64_t v175 = swift_slowAlloc(36LL, -1LL);
    os_log_t v307 = v172;
    uint64_t v176 = v175;
    uint64_t v308 = swift_slowAlloc(96LL, -1LL);
    uint64_t aBlock = v308;
    *(_DWORD *)uint64_t v176 = 136315906;
    LODWORD(v306) = v174;
    swift_bridgeObjectRetain(v149);
    uint64_t v313 = sub_1000086A8(v148, (unint64_t)v149, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, &v314, v176 + 4, v176 + 12);
    uint64_t v177 = swift_bridgeObjectRelease_n(v149, 3LL);
    *(_WORD *)(v176 + 12) = 2080;
    uint64_t v178 = IPv6Address.debugDescription.getter(v177);
    unint64_t v180 = v179;
    uint64_t v313 = sub_1000086A8(v178, v179, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, &v314, v176 + 14, v176 + 22);
    swift_bridgeObjectRelease(v180);
    v181 = v167;
    v182 = (uint64_t (*)(_BYTE *, uint64_t))v282;
    uint64_t v183 = ((uint64_t (*)(_BYTE *, uint64_t))v282)(v181, v168);
    *(_WORD *)(v176 + 22) = 2080;
    v184 = v272;
    uint64_t v185 = IPv6Address.debugDescription.getter(v183);
    unint64_t v187 = v186;
    uint64_t v313 = sub_1000086A8(v185, v186, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, &v314, v176 + 24, v176 + 32);
    swift_bridgeObjectRelease(v187);
    uint64_t v188 = v182(v184, v168);
    *(_WORD *)(v176 + 32) = 512;
    LOWORD(v187) = NWEndpoint.Port.rawValue.getter(v188);
    v268(v170, v298);
    LOWORD(v313) = v187;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v313, (char *)&v313 + 2, v176 + 34, v176 + 36);
    os_log_t v189 = v307;
    _os_log_impl( (void *)&_mh_execute_header,  v307,  (os_log_type_t)v306,  "SSH tunnel privileged helper created %s from %s -> %s and is listening for a tunnel connection on ::1:%hu.",  (uint8_t *)v176,  0x24u);
    uint64_t v190 = v308;
    swift_arrayDestroy(v308, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v190, -1LL, -1LL);
    uint64_t v166 = v297;
    swift_slowDealloc(v176, -1LL, -1LL);
  }

  else
  {
    v268(v170, v298);
    swift_bridgeObjectRelease_n(v149, 2LL);
    v206 = (void (*)(_BYTE *, uint64_t))v282;
    ((void (*)(_BYTE *, uint64_t))v282)(v167, v168);
    v206(v272, v168);
  }

  uint64_t v207 = ((uint64_t (*)(_BYTE *, uint64_t))v305)(v165, v166);
  v208 = v301;
  uint64_t v209 = 0LL;
  v210 = v300;
  v211 = *(uint64_t (**)(uint64_t))(*(void *)v300 + 144LL);
  do
  {
    uint64_t v207 = v211(v207);
    uint64_t v213 = v212;
    unint64_t v215 = v214;
    if (v214 >> 62) {
      goto LABEL_39;
    }
    swift_release(v207);
    swift_release(v213);
    uint64_t result = swift_release(v215);
    if (__OFADD__(*v208, 5LL))
    {
      __break(1u);
      return result;
    }

    if (*v208 + 5LL < v209)
    {
      (*(void (**)(uint64_t))(*(void *)v210 + 192LL))(result);
      v242 = v267;
      uint64_t v243 = v303(v267, v302, v166);
      v244 = (os_log_s *)Logger.logObject.getter(v243);
      os_log_type_t v245 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v244, v245))
      {
        v246 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)v246 = 134217984;
        uint64_t aBlock = *v208;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v311, v246 + 4, v246 + 12);
        _os_log_impl( (void *)&_mh_execute_header,  v244,  v245,  "SSH tunnel privileged helper waited longer than TCPPacketTunnelServer's timeout (%ld) for a connection.",  v246,  0xCu);
        swift_slowDealloc(v246, -1LL, -1LL);
      }

      ((void (*)(_BYTE *, uint64_t))v305)(v242, v166);
      unint64_t v247 = sub_100008268();
      uint64_t v248 = swift_allocError(&type metadata for String, v247, 0LL, 0LL);
      unint64_t v250 = 0xD00000000000002FLL;
      v251 = "remotectl ssh-tunnel out waiting for connection";
      goto LABEL_54;
    }

    uint64_t v207 = sleep(1u);
  }

  while (!__OFADD__(v209++, 1LL));
  __break(1u);
LABEL_39:
  uint64_t v217 = sub_1000082AC(v207, v213, v215);
  uint64_t v218 = v211(v217);
  v221 = v220;
  unint64_t v222 = v219;
  if (!(v219 >> 62))
  {
    swift_release(v218);
    swift_release(v221);
    swift_release(v222);
    v252 = v262;
    uint64_t v253 = v303(v262, v302, v166);
    v254 = (os_log_s *)Logger.logObject.getter(v253);
    os_log_type_t v255 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v254, v255))
    {
      v256 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v256 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v254,  v255,  "SSH tunnel privileged helper still listening after wait loop.",  v256,  2u);
      swift_slowDealloc(v256, -1LL, -1LL);
    }

    ((void (*)(_BYTE *, uint64_t))v305)(v252, v166);
    unint64_t v257 = sub_100008268();
    uint64_t v248 = swift_allocError(&type metadata for String, v257, 0LL, 0LL);
    unint64_t v250 = 0xD000000000000027LL;
    goto LABEL_53;
  }

  if (v219 >> 62 != 1)
  {
    unint64_t v258 = sub_100008268();
    uint64_t v248 = swift_allocError(&type metadata for String, v258, 0LL, 0LL);
    unint64_t v250 = 0xD000000000000027LL;
LABEL_53:
    v251 = "remotectl ssh-tunnel failed to connect.";
LABEL_54:
    unint64_t *v249 = v250;
    v249[1] = (unint64_t)(v251 - 32) | 0x8000000000000000LL;
    swift_willThrow(v248);
    swift_unknownObjectRelease(v299);
    return swift_release(v210);
  }

  swift_release(v218);
  swift_release(v222 & 0x3FFFFFFFFFFFFFFFLL);
  v223 = v292;
  uint64_t v224 = swift_allocObject(v292, 64LL, 7LL);
  *(_OWORD *)(v224 + 16) = v293;
  uint64_t aBlock = 0LL;
  v311[0] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(72LL);
  v225._countAndFlagsBits = 0xD000000000000020LL;
  v225._object = (void *)0x800000010001C3B0LL;
  String.append(_:)(v225);
  uint64_t v226 = (*(uint64_t (**)(void))(*(void *)v221 + 176LL))();
  if (v227)
  {
    unint64_t v228 = v227;
  }

  else
  {
    uint64_t v226 = 1853191285LL;
    unint64_t v228 = 0xE400000000000000LL;
  }

  unint64_t v229 = v228;
  String.append(_:)(*(Swift::String *)&v226);
  swift_bridgeObjectRelease(v228);
  v230._countAndFlagsBits = 0xD000000000000026LL;
  v230._object = (void *)0x800000010001C3E0LL;
  String.append(_:)(v230);
  uint64_t v231 = aBlock;
  uint64_t v232 = v311[0];
  *(void *)(v224 + 56) = &type metadata for String;
  *(void *)(v224 + 32) = v231;
  *(void *)(v224 + 40) = v232;
  print(_:separator:terminator:)(v224, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  uint64_t v233 = swift_bridgeObjectRelease(v224);
  v234 = v263;
  j___s8Dispatch0A4TimeV13distantFutureACvgZ(v233);
  (*(void (**)(_BYTE *))(*(void *)v210 + 200LL))(v234);
  (*(void (**)(_BYTE *, uint64_t))(v264 + 8))(v234, v265);
  uint64_t v235 = swift_allocObject(v223, 64LL, 7LL);
  *(_OWORD *)(v235 + 16) = v293;
  *(void *)(v235 + 56) = &type metadata for String;
  *(void *)(v235 + 32) = 0xD000000000000010LL;
  *(void *)(v235 + 40) = 0x800000010001C410LL;
  print(_:separator:terminator:)(v235, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  swift_bridgeObjectRelease(v235);
  v236 = v266;
  uint64_t v237 = v303(v266, v302, v166);
  v238 = (os_log_s *)Logger.logObject.getter(v237);
  os_log_type_t v239 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v238, v239))
  {
    v240 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v240 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v238,  v239,  "SSH tunnel privileged server disconnected. Exiting...",  v240,  2u);
    v241 = v240;
    v236 = v266;
    swift_slowDealloc(v241, -1LL, -1LL);
    swift_release(v210);
    swift_unknownObjectRelease(v299);

    v210 = v221;
  }

  else
  {

    swift_release(v221);
    swift_unknownObjectRelease(v299);
  }

  swift_release(v210);
  return ((uint64_t (*)(_BYTE *, uint64_t))v305)(v236, v166);
}

uint64_t sub_100007E24(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_100007E5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000C778();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "SSH tunnel privileged helper received SIGINT, shutting down server...",  v10,  2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v11 = sub_1000080BC(&qword_1000249D0);
  uint64_t v12 = swift_allocObject(v11, 64LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_10001A650;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 32) = 0xD000000000000017LL;
  *(void *)(v12 + 40) = 0x800000010001C710LL;
  print(_:separator:terminator:)(v12, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  uint64_t v13 = swift_bridgeObjectRelease(v12);
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192LL))(v13);
}

uint64_t sub_100007FDC()
{
  return sub_100007E5C(v0);
}

uint64_t sub_100007FE4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100008010(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008020(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100008028()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v1 = sub_1000090B4( (unint64_t *)&unk_100024F70,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v2 = sub_1000080BC(&qword_100024A20);
  unint64_t v3 = sub_1000090F4();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

uint64_t sub_1000080BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000080FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000080BC(&qword_100024A10);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100008EE8(v7, (uint64_t)&v14);
    uint64_t v8 = v14;
    unint64_t result = sub_100008E68(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_100008F30(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_1000249E0)
  {
    ForeignTypeMetaintptr_t data = swift_getForeignTypeMetadata(0LL, &unk_100021440);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000249E0);
    }
  }

unint64_t sub_100008268()
{
  unint64_t result = qword_1000249C8;
  if (!qword_1000249C8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000249C8);
  }

  return result;
}

uint64_t sub_1000082AC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = a3;
  if (a3 >> 62)
  {
    if (a3 >> 62 != 1) {
      return result;
    }
    uint64_t v3 = a3 & 0x3FFFFFFFFFFFFFFFLL;
  }

  swift_release(result);
  swift_release(a2);
  return swift_release(v3);
}

uint64_t sub_1000082FC(uint64_t a1, uint64_t a2)
{
  return sub_100008444(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100008308(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_10000837C(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_1000083F8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100008438(uint64_t a1, uint64_t a2)
{
  return sub_100008444(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100008444(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100008480(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000084C0(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100008530(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_1000085B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000085FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100008624(uint64_t a1)
{
  uint64_t v2 = sub_1000090B4( &qword_1000249C0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A7B8);
  uint64_t v3 = sub_1000090B4( &qword_100024A00,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A70C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000086A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008778(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008E28((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100008E28((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100008E08(v12);
  return v7;
}

uint64_t sub_100008778(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100008930(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100008930(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000089C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100008B9C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008B9C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000089C4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100008B38(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100008B38(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_1000080BC(&qword_100024A08);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008B9C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_1000080BC(&qword_100024A08);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100008CE8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008CFC(result, a2);
  }
  return result;
}

uint64_t sub_100008CFC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100008D40()
{
  unint64_t result = qword_1000249D8;
  if (!qword_1000249D8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Errno, &type metadata for Errno);
    atomic_store(result, (unint64_t *)&qword_1000249D8);
  }

  return result;
}

uint64_t sub_100008D84()
{
  return sub_1000090B4( &qword_1000249E8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A6D0);
}

uint64_t sub_100008DB0()
{
  return sub_1000090B4( &qword_1000249F0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A6A4);
}

uint64_t sub_100008DDC()
{
  return sub_1000090B4( &qword_1000249F8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10001A740);
}

uint64_t sub_100008E08(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008E28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100008E68(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100008F40(a1, v7);
}

uint64_t sub_100008EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000080BC(&qword_100024A18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100008F30(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100008F40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

uint64_t sub_1000090B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1000090F4()
{
  unint64_t result = qword_100024F80;
  if (!qword_100024F80)
  {
    uint64_t v1 = sub_100009140(&qword_100024A20);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100024F80);
  }

  return result;
}

uint64_t sub_100009140(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100009194(uint64_t a1, unsigned int a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3)
  {
    if (a1 <= 1) {
      a1 = 1LL;
    }
    if (a1 == 1)
    {
      return swift_willThrow(result);
    }

    else
    {
      sleep(a2);
      uint64_t v8 = swift_errorRelease(v3);
      return ((uint64_t (*)(uint64_t))a3)(v8);
    }
  }

  return result;
}

uint64_t sub_100009220(uint64_t a1, void *a2)
{
  uint64_t v4 = String.utf8CString.getter(a1, a2);
  int v5 = remote_control_enable_network_peer(v4 + 32);
  uint64_t result = swift_release(v4);
  if (!v5)
  {
    _StringGuts.grow(_:)(34LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v7._countAndFlagsBits = a1;
    v7._object = a2;
    String.append(_:)(v7);
    unint64_t v8 = sub_100008268();
    uint64_t v9 = swift_allocError(&type metadata for String, v8, 0LL, 0LL);
    void *v10 = 0xD000000000000020LL;
    v10[1] = 0x800000010001C730LL;
    return swift_willThrow(v9);
  }

  return result;
}

uint64_t sub_1000092F8()
{
  uint64_t result = remote_control_disable_network_peer();
  if (!(_DWORD)result)
  {
    unint64_t v1 = sub_100008268();
    uint64_t v2 = swift_allocError(&type metadata for String, v1, 0LL, 0LL);
    *uint64_t v3 = 0xD000000000000022LL;
    v3[1] = 0x800000010001C760LL;
    return swift_willThrow(v2);
  }

  return result;
}

uint64_t sub_100009364(uint64_t a1)
{
  uint64_t v2 = IPv6Address.debugDescription.getter(a1);
  uint64_t v4 = v3;
  uint64_t v5 = String.utf8CString.getter(v2, v3);
  swift_bridgeObjectRelease(v4);
  LODWORD(v4) = remote_control_connect_network_peer(v5 + 32);
  uint64_t result = swift_release(v5);
  if (!(_DWORD)v4)
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(37LL);
    v7._object = (void *)0x800000010001C790LL;
    v7._countAndFlagsBits = 0xD000000000000023LL;
    String.append(_:)(v7);
    uint64_t v8 = type metadata accessor for IPv6Address(0LL);
    _print_unlocked<A, B>(_:_:)( a1,  &v14,  v8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v9 = v14;
    unint64_t v10 = v15;
    unint64_t v11 = sub_100008268();
    uint64_t v12 = swift_allocError(&type metadata for String, v11, 0LL, 0LL);
    void *v13 = v9;
    v13[1] = v10;
    return swift_willThrow(v12);
  }

  return result;
}

uint64_t sub_100009460(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!(a3 >> 62))
  {
    uint64_t v16 = 0LL;
    unint64_t v17 = 0xE000000000000000LL;
    swift_retain(a1);
    swift_retain(a2);
    _StringGuts.grow(_:)(16LL);
    v10._object = (void *)0xEA00000000002867LL;
    v10._countAndFlagsBits = 0x6E696E657473696CLL;
    String.append(_:)(v10);
    uint64_t v15 = a1;
    uint64_t v11 = type metadata accessor for NWListener(0LL);
    _print_unlocked<A, B>(_:_:)( &v15,  &v16,  v11,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v12._countAndFlagsBits = 8236LL;
    v12._object = (void *)0xE200000000000000LL;
    String.append(_:)(v12);
    uint64_t v15 = a2;
    uint64_t v13 = type metadata accessor for UtunSocket(0LL);
    _print_unlocked<A, B>(_:_:)( &v15,  &v16,  v13,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    goto LABEL_5;
  }

  if (a3 >> 62 == 1)
  {
    uint64_t v16 = 0LL;
    unint64_t v17 = 0xE000000000000000LL;
    swift_retain(a1);
    swift_retain(a2);
    _StringGuts.grow(_:)(17LL);
    v5._countAndFlagsBits = 0x657463656E6E6F63LL;
    v5._object = (void *)0xEA00000000002864LL;
    String.append(_:)(v5);
    uint64_t v15 = a1;
    uint64_t v6 = type metadata accessor for NWConnection(0LL);
    _print_unlocked<A, B>(_:_:)( &v15,  &v16,  v6,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v7._countAndFlagsBits = 8236LL;
    v7._object = (void *)0xE200000000000000LL;
    String.append(_:)(v7);
    uint64_t v15 = a2;
    uint64_t v8 = type metadata accessor for UtunSocket(0LL);
    _print_unlocked<A, B>(_:_:)( &v15,  &v16,  v8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v9._countAndFlagsBits = 41LL;
    v9._object = (void *)0xE100000000000000LL;
    String.append(_:)(v9);
LABEL_5:
    swift_release(a1);
    swift_release(a2);
    return v16;
  }

  return 0x656E6E6F63736964LL;
}

uint64_t sub_10000965C()
{
  return sub_100009460(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

unint64_t sub_100009668()
{
  unint64_t result = qword_1000249B0;
  if (!qword_1000249B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000249B0);
  }

  return result;
}

void sub_1000096A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_retain_n(v0, 2LL);
  oslog = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v16 = v5;
    uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
    swift_beginAccess(v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state, v15, 0LL, 0LL);
    uint64_t v7 = *v6;
    uint64_t v8 = v6[1];
    unint64_t v9 = v6[2];
    sub_100009900(v7, v8, v9);
    uint64_t v10 = sub_100009460(v7, v8, v9);
    unint64_t v12 = v11;
    sub_1000082AC(v7, v8, v9);
    uint64_t v14 = sub_1000086A8(v10, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v4 + 4, v4 + 12);
    swift_release_n(v1, 2LL);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "State changed to %s", v4, 0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  else
  {
    swift_release_n(v0, 2LL);
  }

uint64_t sub_100009894()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state, v4, 0LL, 0LL);
  uint64_t v2 = *(void *)v1;
  sub_100009900(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
  return v2;
}

uint64_t sub_100009900(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = a3;
  if (a3 >> 62)
  {
    if (a3 >> 62 != 1) {
      return result;
    }
    uint64_t v3 = a3 & 0x3FFFFFFFFFFFFFFFLL;
  }

  swift_retain(result);
  swift_retain(a2);
  return swift_retain(v3);
}

uint64_t sub_100009950(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
  swift_beginAccess(v3 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state, v12, 1LL, 0LL);
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  unint64_t v10 = v7[2];
  uint64_t *v7 = a1;
  v7[1] = a2;
  _OWORD v7[2] = a3;
  sub_100009900(a1, a2, a3);
  sub_1000082AC(v8, v9, v10);
  sub_1000096A4();
  return sub_1000082AC(a1, a2, a3);
}

void (*sub_1000099F8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess(v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state, a1, 33LL, 0LL);
  return sub_100009A40;
}

void sub_100009A40(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1000096A4();
  }
}

uint64_t sub_100009A70()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  if (v2 >> 62)
  {
    if (v2 >> 62 != 1) {
      return 0LL;
    }
    uint64_t v5 = v2 & 0x3FFFFFFFFFFFFFFFLL;
  }

  swift_release(v1);
  uint64_t v6 = swift_release(v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 176LL))(v6);
  swift_release(v4);
  return v7;
}

uint64_t sub_100009AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  sub_100009B58(a1, a2, a3, a4);
  return v9;
}

uint64_t sub_100009B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v40 = v6;
  __chkstk_darwin(v6);
  uint64_t v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v37 = sub_100009668();
  uint64_t v45 = 0LL;
  unint64_t v46 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(24LL);
  unint64_t v14 = v46;
  uint64_t v15 = (void **)sub_10000C3B8();
  uint64_t v16 = *v15;
  unint64_t v17 = (unint64_t)v15[1];
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v14);
  uint64_t v45 = v16;
  unint64_t v46 = v17;
  v18._countAndFlagsBits = 0xD000000000000016LL;
  v18._object = (void *)0x800000010001C7D0LL;
  String.append(_:)(v18);
  uint64_t v20 = v45;
  unint64_t v19 = v46;
  static DispatchQoS.unspecified.getter();
  uint64_t v45 = &_swiftEmptyArrayStorage;
  uint64_t v21 = sub_1000090B4( &qword_100024A28,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v22 = sub_1000080BC(&qword_100024A30);
  uint64_t v23 = sub_10000ADB4((unint64_t *)&qword_100024A38, &qword_100024A30);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v45, v22, v23, v8, v21);
  uint64_t v24 = v38;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))( v38,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v40);
  *(void *)(v5 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( v20,  v19,  v13,  v10,  v24,  0LL);
  uint64_t v25 = *v15;
  uint64_t v26 = v15[1];
  swift_bridgeObjectRetain(v26);
  Logger.init(subsystem:category:)(v25, v26, 0xD000000000000015LL, 0x800000010001C7F0LL);
  uint64_t v27 = OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_exitSemaphore;
  *(void *)(v5 + v27) = dispatch_semaphore_create(0LL);
  uint64_t v28 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port;
  uint64_t v29 = type metadata accessor for NWEndpoint.Port(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32LL))(v28, v41, v29);
  uint64_t v30 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress;
  uint64_t v31 = type metadata accessor for IPv6Address(0LL);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32LL);
  v32(v30, v42, v31);
  v32(v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress, v43, v31);
  uint64_t v33 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_timeout;
  uint64_t v34 = type metadata accessor for DispatchTimeInterval(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32LL))(v33, v44, v34);
  uint64_t v35 = (void *)(v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
  void *v35 = 0LL;
  v35[1] = 0LL;
  v35[2] = 0x8000000000000000LL;
  return v5;
}

uint64_t sub_100009E88()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchTime(0LL);
  uint64_t v58 = *(void *)(v2 - 8);
  uint64_t v59 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  int v57 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v53 - v5;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for IPv6Address(0LL);
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  v63 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v60 = (char *)&v53 - v13;
  uint64_t v14 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for NWProtocolTCP.Options(0LL);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  uint64_t v19 = NWProtocolTCP.Options.init()();
  dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter(1LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter(2LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter(2LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter(2LL);
  type metadata accessor for NWParameters(0LL);
  swift_retain(v19);
  uint64_t v20 = NWParameters.__allocating_init(tls:tcp:)(0LL, v19);
  NWParameters.acceptLocalOnly.setter(1LL);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))( v17,  &v1[OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port],  v14);
  uint64_t v21 = type metadata accessor for NWListener(0LL);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  uint64_t v22 = swift_retain(v20);
  uint64_t v23 = v64;
  uint64_t v24 = NWListener.init(using:on:)(v22, v17);
  if (v23)
  {
    swift_release(v19);
    return swift_release(v20);
  }

  else
  {
    uint64_t v25 = v24;
    uint64_t v64 = v20;
    uint64_t v53 = v7;
    uint64_t v54 = v9;
    v55 = v6;
    swift_retain(v1);
    sub_10000A8A4((uint64_t)sub_10000A450, (uint64_t)v1);
    NWListener.newConnectionHandler.setter(sub_10000A450, v1);
    swift_release(v1);
    swift_retain(v1);
    sub_10000A8A4((uint64_t)sub_10000A8A0, (uint64_t)v1);
    NWListener.stateUpdateHandler.setter(sub_10000A8A0, v1);
    swift_release(v1);
    type metadata accessor for UtunSocket(0LL);
    uint64_t v26 = (void *)*((void *)v1 + 2);
    uint64_t v56 = v25;
    uint64_t v27 = (uint64_t)v60;
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
    uint64_t v29 = v62;
    v28(v60, &v1[OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress], v62);
    uint64_t v30 = (uint64_t)v63;
    v28(v63, &v1[OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress], v29);
    id v31 = v26;
    uint64_t v32 = sub_10001565C(v31, v27, v30);
    uint64_t v33 = (uint64_t)v31;
    uint64_t v34 = v56;
    uint64_t v35 = *(uint64_t (**)(void, char *))(*(void *)v32 + 240LL);
    swift_retain(v1);
    uint64_t v37 = v35(sub_10000AC30, v1);
    uint64_t v39 = v38;
    swift_release(v1);
    sub_100009220(v37, v39);
    swift_bridgeObjectRelease(v39);
    uint64_t v62 = v33;
    NWListener.start(queue:)(v33);
    aBlock[4] = sub_10000ACB4;
    unint64_t v66 = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100007FE4;
    aBlock[3] = &unk_100021530;
    v63 = (char *)_Block_copy(aBlock);
    v67 = &_swiftEmptyArrayStorage;
    uint64_t v40 = sub_1000090B4( (unint64_t *)&unk_100024F70,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    swift_retain(v1);
    uint64_t v41 = sub_1000080BC(&qword_100024A20);
    uint64_t v42 = sub_10000ADB4((unint64_t *)&qword_100024F80, &qword_100024A20);
    uint64_t v43 = v34;
    uint64_t v44 = v54;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v67, v41, v42, v53, v40);
    uint64_t v45 = type metadata accessor for DispatchWorkItem(0LL);
    swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
    uint64_t v46 = DispatchWorkItem.init(flags:block:)(v44, v63);
    swift_release(v66);
    uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v1 + 152LL);
    swift_retain(v43);
    swift_retain(v32);
    swift_retain(v46);
    uint64_t v48 = v47(v43, v32, v46);
    v49 = v57;
    static DispatchTime.now()(v48);
    uint64_t v50 = v55;
    + infix(_:_:)(v49, &v1[OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_timeout]);
    uint64_t v51 = v59;
    uint64_t v52 = *(void (**)(char *, uint64_t))(v58 + 8);
    v52(v49, v59);
    OS_dispatch_queue.asyncAfter(deadline:execute:)(v50, v46);
    swift_release(v19);
    swift_release(v64);
    swift_release(v43);
    swift_release(v32);
    swift_release(v46);
    return ((uint64_t (*)(char *, uint64_t))v52)(v50, v51);
  }

void sub_10000A450(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(uint64_t (**)(void))(*v1 + 144LL);
  uint64_t v5 = v4();
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v7;
  if (v7 >> 62)
  {
    sub_1000082AC(v5, v6, v7);
    uint64_t v13 = swift_retain_n(v1, 2LL);
    log = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(log, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v16 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = v4();
      uint64_t v19 = v18;
      unint64_t v21 = v20;
      uint64_t v22 = sub_100009460(v17, v18, v20);
      unint64_t v24 = v23;
      sub_1000082AC(v17, v19, v21);
      uint64_t v27 = sub_1000086A8(v22, v24, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 4, v15 + 12);
      swift_release_n(v2, 2LL);
      swift_bridgeObjectRelease(v24);
      _os_log_impl((void *)&_mh_execute_header, log, v14, "In state %s, rejecting new connection", v15, 0xCu);
      swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {
      swift_release_n(v1, 2LL);
    }
  }

  else
  {
    dispatch thunk of DispatchWorkItem.cancel()();
    NWListener.cancel()();
    swift_retain(v1);
    sub_10000A8A4((uint64_t)sub_10000C08C, (uint64_t)v1);
    NWConnection.stateUpdateHandler.setter(sub_10000C08C, v1);
    swift_release(v1);
    type metadata accessor for TCPPacketTunnel(0LL);
    swift_retain(a1);
    swift_retain(v9);
    uint64_t v11 = sub_100012768(a1, v9);
    uint64_t v12 = NWConnection.start(queue:)(v1[2]);
    (*(void (**)(uint64_t))(*(void *)v11 + 128LL))(v12);
    sub_100009364((uint64_t)v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*v1 + 152LL);
    swift_retain(a1);
    swift_retain(v9);
    swift_retain(v11);
    v25(a1, v9, v11 | 0x4000000000000000LL);
    swift_release(v8);
    swift_release(v9);
    swift_release(v10);
    swift_release(v11);
  }

uint64_t sub_10000A8A4(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

Swift::Int sub_10000A8B4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for NWListener.State(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v37 - v9;
  uint64_t v11 = v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_logger;
  uint64_t v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v12 = v42((char *)&v37 - v9, a1, v4);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc(12LL, -1LL);
    uint64_t v40 = v11;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v39 = a1;
    uint64_t v18 = v17;
    uint64_t v44 = v17;
    uint64_t v41 = v1;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v38 = v16 + 4;
    uint64_t v19 = sub_1000090B4( &qword_100024B50,  (uint64_t (*)(uint64_t))&type metadata accessor for NWListener.State,  (uint64_t)&protocol conformance descriptor for NWListener.State);
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v4, v19);
    unint64_t v22 = v21;
    uint64_t v43 = sub_1000086A8(v20, v21, &v44);
    uint64_t v2 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v38, v16 + 12);
    swift_bridgeObjectRelease(v22);
    unint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "NWListener in state %s", v16, 0xCu);
    swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v24 = v18;
    a1 = v39;
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    unint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v10, v4);
  }

  v42(v8, a1, v4);
  Swift::Int result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if ((_DWORD)result == enum case for NWListener.State.waiting(_:)
    || (_DWORD)result == enum case for NWListener.State.failed(_:))
  {
    Swift::Int result = ((uint64_t (*)(char *, uint64_t))v23)(v8, v4);
LABEL_15:
    uint64_t v28 = (*(uint64_t (**)(Swift::Int))(*(void *)v2 + 144LL))(result);
    uint64_t v31 = v29;
    unint64_t v32 = v30;
    if (v30 >> 62) {
      return sub_1000082AC(v28, v29, v30);
    }
    swift_release(v28);
    swift_release(v31);
    uint64_t v33 = swift_release(v32);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Listener ended without a connection, shutting down.",  v36,  2u);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    return sub_10000B0F0();
  }

  if ((_DWORD)result != enum case for NWListener.State.setup(_:)
    && (_DWORD)result != enum case for NWListener.State.ready(_:))
  {
    if ((_DWORD)result != enum case for NWListener.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v23)(v8, v4);
    }
    goto LABEL_15;
  }

  return result;
}

uint64_t sub_10000AC30(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v2 + 144LL))();
  uint64_t v8 = v6;
  if (v7 >> 62 != 1) {
    return sub_1000082AC(v5, v6, v7);
  }
  uint64_t v9 = v7 & 0x3FFFFFFFFFFFFFFFLL;
  swift_release(v5);
  swift_release(v8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v9 + 136LL))(a1, a2);
  return swift_release(v9);
}

uint64_t sub_10000ACB4()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
  uint64_t v4 = v1;
  unint64_t v5 = v3;
  if (v3 >> 62) {
    return sub_1000082AC(v1, v2, v3);
  }
  swift_release(v2);
  uint64_t v6 = swift_release(v5);
  unint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Listener timed out waiting for an incoming connection", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  NWListener.cancel()();
  return swift_release(v4);
}

uint64_t sub_10000AD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000ADAC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000ADB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100009140(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000ADF4(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v6;
    *(_DWORD *)unint64_t v5 = 136315138;
    uint64_t v13 = sub_1000086A8(0x656E6E6F63736964LL, 0xEC00000029287463LL, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t result = (*(uint64_t (**)(void))(*(void *)v2 + 144LL))();
  uint64_t v10 = result;
  uint64_t v11 = v9;
  if (v9 >> 62)
  {
    if (v9 >> 62 != 1) {
      return result;
    }
    swift_release(v8);
    swift_release(v11 & 0x3FFFFFFFFFFFFFFFLL);
    NWConnection.cancel()();
    uint64_t v11 = v10;
  }

  else
  {
    swift_release(v8);
    NWListener.cancel()();
    dispatch thunk of DispatchWorkItem.cancel()(v12);
    swift_release(v10);
  }

  return swift_release(v11);
}

uint64_t sub_10000AFB0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

uint64_t sub_10000AFD8()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  unint64_t v3 = (char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port;
  uint64_t v4 = type metadata accessor for NWEndpoint.Port(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  unint64_t v5 = (char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress;
  uint64_t v6 = type metadata accessor for IPv6Address(0LL);
  unint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  v7((char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress, v6);
  uint64_t v8 = (char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_timeout;
  uint64_t v9 = type metadata accessor for DispatchTimeInterval(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  sub_1000082AC( *(uint64_t *)((char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state),  *(uint64_t *)((char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state + 8),  *(unint64_t *)((char *)v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state + 16));
  return swift_deallocClassInstance(v0, *((unsigned int *)*v0 + 12), *((unsigned __int16 *)*v0 + 26));
}

Swift::Int sub_10000B0F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for NWListener.State(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 144LL))(v8);
  uint64_t v13 = v11;
  unint64_t v15 = v14;
  unint64_t v16 = v12;
  if (!(v12 >> 62))
  {
    uint64_t v31 = v11;
    NWListener.state.getter();
    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
    if ((_DWORD)v23 != enum case for NWListener.State.failed(_:))
    {
      if ((_DWORD)v23 == enum case for NWListener.State.cancelled(_:))
      {
LABEL_16:
        dispatch thunk of DispatchWorkItem.cancel()(v23);
        uint64_t v27 = sub_1000092F8();
        (*(void (**)(uint64_t))(*(void *)v15 + 272LL))(v27);
        (*(void (**)(void, void, unint64_t))(*(void *)v1 + 152LL))( 0LL,  0LL,  0x8000000000000000LL);
        OS_dispatch_semaphore.signal()();
        swift_release(v31);
        swift_release(v15);
        unint64_t v29 = v16;
        return swift_release(v29);
      }

      uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
      os_log_type_t v25 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Shutting down utun before NWListener is shut down",  v26,  2u);
        swift_slowDealloc(v26, -1LL, -1LL);
      }
    }

    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_16;
  }

  if (v12 >> 62 != 1) {
    return OS_dispatch_semaphore.signal()();
  }
  uint64_t v17 = swift_release(v12 & 0x3FFFFFFFFFFFFFFFLL);
  uint64_t v31 = v13;
  NWConnection.state.getter(v17);
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if ((_DWORD)v18 == enum case for NWConnection.State.failed(_:)) {
    goto LABEL_8;
  }
  if ((_DWORD)v18 != enum case for NWConnection.State.cancelled(_:))
  {
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Shutting down utun before NWConnection is shut down",  v21,  2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

LABEL_8:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  uint64_t v22 = sub_1000092F8();
  (*(void (**)(uint64_t))(*(void *)v15 + 272LL))(v22);
  (*(void (**)(void, void, unint64_t))(*(void *)v1 + 152LL))(0LL, 0LL, 0x8000000000000000LL);
  OS_dispatch_semaphore.signal()();
  swift_release(v31);
  unint64_t v29 = v15;
  return swift_release(v29);
}

Swift::Int sub_10000B9AC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v12 = v11((char *)&v34 - v9, a1, v4);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc(12LL, -1LL);
    uint64_t v37 = v1;
    unint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    os_log_type_t v35 = v11;
    uint64_t v18 = v17;
    uint64_t v39 = v17;
    uint64_t v36 = a1;
    *(_DWORD *)unint64_t v16 = 136315138;
    uint64_t v34 = v16 + 4;
    uint64_t v19 = sub_1000090B4( &qword_100024B58,  (uint64_t (*)(uint64_t))&type metadata accessor for NWConnection.State,  (uint64_t)&protocol conformance descriptor for NWConnection.State);
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v4, v19);
    unint64_t v22 = v21;
    uint64_t v38 = sub_1000086A8(v20, v21, &v39);
    a1 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v34, v16 + 12);
    swift_bridgeObjectRelease(v22);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "NWConnection in state %s", v16, 0xCu);
    swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v24 = v18;
    uint64_t v11 = v35;
    swift_slowDealloc(v24, -1LL, -1LL);
    os_log_type_t v25 = v16;
    uint64_t v2 = v37;
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {

    uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v10, v4);
  }

  v11(v8, a1, v4);
  Swift::Int result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if ((_DWORD)result == enum case for NWConnection.State.waiting(_:)
    || (_DWORD)result == enum case for NWConnection.State.failed(_:))
  {
    Swift::Int result = ((uint64_t (*)(char *, uint64_t))v23)(v8, v4);
  }

  else
  {
    if ((_DWORD)result == enum case for NWConnection.State.setup(_:)
      || (_DWORD)result == enum case for NWConnection.State.preparing(_:)
      || (_DWORD)result == enum case for NWConnection.State.ready(_:))
    {
      return result;
    }

    if ((_DWORD)result != enum case for NWConnection.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v23)(v8, v4);
    }
  }

  Swift::Int result = (*(uint64_t (**)(Swift::Int))(*(void *)v2 + 144LL))(result);
  uint64_t v32 = v31;
  uint64_t v33 = v30;
  if (v30 >> 62)
  {
    if (v30 >> 62 != 1) {
      return result;
    }
    uint64_t v33 = v30 & 0x3FFFFFFFFFFFFFFFLL;
  }

  swift_release(result);
  swift_release(v32);
  swift_release(v33);
  return sub_10000B0F0();
}

uint64_t sub_10000BCB8()
{
  return type metadata accessor for TCPPacketTunnelServer(0LL);
}

uint64_t type metadata accessor for TCPPacketTunnelServer(uint64_t a1)
{
  uint64_t result = qword_100025490;
  if (!qword_100025490) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TCPPacketTunnelServer);
  }
  return result;
}

uint64_t sub_10000BCFC(uint64_t a1)
{
  v7[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v7[1] = *(void *)(result - 8) + 64LL;
    _OWORD v7[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = type metadata accessor for NWEndpoint.Port(319LL);
    if (v4 <= 0x3F)
    {
      v7[3] = *(void *)(result - 8) + 64LL;
      uint64_t result = type metadata accessor for IPv6Address(319LL);
      if (v5 <= 0x3F)
      {
        uint64_t v8 = *(void *)(result - 8) + 64LL;
        uint64_t v9 = v8;
        uint64_t result = type metadata accessor for DispatchTimeInterval(319LL);
        if (v6 <= 0x3F)
        {
          uint64_t v10 = *(void *)(result - 8) + 64LL;
          uint64_t v11 = &unk_10001A8D8;
          return swift_updateClassMetadata2(a1, 256LL, 8LL, v7, a1 + 80);
        }
      }
    }
  }

  return result;
}

uint64_t destroy for TCPPacketTunnelServer.State(uint64_t a1)
{
  return sub_1000082AC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t *_s15SSHPacketTunnel21TCPPacketTunnelServerC5StateOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_100009900(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *assignWithCopy for TCPPacketTunnelServer.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_100009900(*a2, v4, v5);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_1000082AC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for TCPPacketTunnelServer.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for TCPPacketTunnelServer.State(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v6 = a1[1];
  unint64_t v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_1000082AC(v4, v6, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for TCPPacketTunnelServer.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 > 0x1FFFFD && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2097150);
  }
  if (((((*(void *)(a1 + 16) >> 43) >> 19) | (4 {
  else
  }
    int v3 = (((*(void *)(a1 + 16) >> 43) >> 19) | (4
                                                              * ((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7 | (*(void *)(a1 + 8) >> 50) & 0x3C00 | ((*(void *)(a1 + 8) & 7) << 7) | (*(void *)(a1 + 16) >> 43) & 0x60000 | ((*(void *)(a1 + 16) & 7) << 14)))) ^ 0x1FFFFF;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for TCPPacketTunnelServer.State( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FFFFD)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 2097150;
    if (a3 >= 0x1FFFFE) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 0x1FFFFE) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2)
    {
      unint64_t v3 = ((-a2 >> 2) & 0x7FFFF) - (a2 << 19);
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007LL;
      uint64x2_t v4 = (uint64x2_t)vdupq_n_s64(v3);
      *(int8x16_t *)(result + 8) = vorrq_s8( vandq_s8( (int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10001A860),  (int8x16_t)vdupq_n_s64(7uLL)),  vandq_s8( (int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10001A870),  (int8x16_t)vdupq_n_s64(0xF000000000000000LL)));
    }
  }

  return result;
}

uint64_t sub_10000C004(void *a1)
{
  uint64_t v1 = a1[2] >> 62;
  else {
    return (*a1 >> 3) + 2;
  }
}

uint64_t sub_10000C024(uint64_t result)
{
  *(void *)(result + 16) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

int8x16_t sub_10000C034(uint64_t a1, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v3 = *(void *)(a1 + 16) & 0xFFFFFFFFFFFFFF8LL | (a2 << 62);
    int8x16_t result = vandq_s8(*(int8x16_t *)a1, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFF8uLL));
    *(int8x16_t *)a1 = result;
    *(void *)(a1 + 16) = v3;
  }

  else
  {
    *(void *)a1 = 8LL * (a2 - 2);
    result.i64[0] = 0LL;
    *(_OWORD *)(a1 + 8) = xmmword_10001A880;
  }

  return result;
}

ValueMetadata *type metadata accessor for TCPPacketTunnelServer.State()
{
  return &type metadata for TCPPacketTunnelServer.State;
}

uint64_t sub_10000C090()
{
  uint64_t v0 = String.utf8CString.getter(78LL, 0xE100000000000000LL);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t result = swift_release(v0);
  if (v1) {
    dword_100025868 = -1067168253;
  }
  else {
    __break(1u);
  }
  return result;
}

int *sub_10000C0D4()
{
  if (qword_1000254A0 != -1) {
    swift_once(&qword_1000254A0, sub_10000C090);
  }
  return &dword_100025868;
}

uint64_t NWConnection.State.description.getter()
{
  uint64_t v1 = type metadata accessor for NWError(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64x2_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v0, v5);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (v9 == enum case for NWConnection.State.waiting(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    uint64_t v15 = 0LL;
    unint64_t v16 = 0xE000000000000000LL;
    uint64_t v10 = 0x28676E6974696177LL;
    unint64_t v11 = 0xE800000000000000LL;
LABEL_5:
    String.append(_:)(*(Swift::String *)&v10);
    _print_unlocked<A, B>(_:_:)( v4,  &v15,  v1,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v12._countAndFlagsBits = 41LL;
    v12._object = (void *)0xE100000000000000LL;
    String.append(_:)(v12);
    uint64_t v13 = v15;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v13;
  }

  if (v9 == enum case for NWConnection.State.failed(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    uint64_t v15 = 0LL;
    unint64_t v16 = 0xE000000000000000LL;
    uint64_t v10 = 0x2864656C696166LL;
    unint64_t v11 = 0xE700000000000000LL;
    goto LABEL_5;
  }

  if (v9 == enum case for NWConnection.State.setup(_:)) {
    return 0x7075746573LL;
  }
  if (v9 == enum case for NWConnection.State.preparing(_:)) {
    return 0x6E69726170657270LL;
  }
  if (v9 == enum case for NWConnection.State.ready(_:)) {
    return 0x7964616572LL;
  }
  if (v9 == enum case for NWConnection.State.cancelled(_:)) {
    return 0x656C6C65636E6163LL;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0x6E776F6E6B6E75LL;
}

void *sub_10000C3B8()
{
  return &unk_100021608;
}

uint64_t sub_10000C3C4(uint64_t a1)
{
  return sub_10000C420(a1, qword_100025870, 8080LL);
}

uint64_t sub_10000C3D4()
{
  return sub_10000C510( &qword_100025530,  (uint64_t (*)(void))&type metadata accessor for NWEndpoint.Port,  (uint64_t)qword_100025870);
}

uint64_t sub_10000C3F8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000C410(uint64_t a1)
{
  return sub_10000C420(a1, qword_100025888, 8089LL);
}

uint64_t sub_10000C420(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = sub_1000080BC(&qword_100024B68);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for NWEndpoint.Port(0LL);
  sub_10000C6B4(v8, a2);
  uint64_t v9 = sub_10000C3F8(v8, (uint64_t)a2);
  NWEndpoint.Port.init(rawValue:)(a3);
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1LL, v8);
  if ((_DWORD)result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(v9, v7, v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C4EC()
{
  return sub_10000C510( &qword_100025538,  (uint64_t (*)(void))&type metadata accessor for NWEndpoint.Port,  (uint64_t)qword_100025888);
}

uint64_t sub_10000C510(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v5 = a2(0LL);
  return sub_10000C3F8(v5, a3);
}

uint64_t sub_10000C554(uint64_t a1)
{
  return sub_10000C5A8(a1, qword_1000258A0, 0xEC000000323A3A33LL);
}

uint64_t sub_10000C56C()
{
  return sub_10000C510( &qword_100025540,  (uint64_t (*)(void))&type metadata accessor for IPv6Address,  (uint64_t)qword_1000258A0);
}

uint64_t sub_10000C590(uint64_t a1)
{
  return sub_10000C5A8(a1, qword_1000258B8, 0xEC000000313A3A33LL);
}

uint64_t sub_10000C5A8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = sub_1000080BC(&qword_100024B60);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for IPv6Address(0LL);
  sub_10000C6B4(v8, a2);
  uint64_t v9 = sub_10000C3F8(v8, (uint64_t)a2);
  IPv6Address.init(_:)(0x3131613A33306466LL, a3);
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1LL, v8);
  if ((_DWORD)result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(v9, v7, v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C684()
{
  return sub_10000C510( &qword_100025548,  (uint64_t (*)(void))&type metadata accessor for IPv6Address,  (uint64_t)qword_1000258B8);
}

void *sub_10000C6A8()
{
  return &unk_10001A928;
}

uint64_t *sub_10000C6B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_10000C6F4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000C6B4(v0, qword_1000258D0);
  sub_10000C3F8(v0, (uint64_t)qword_1000258D0);
  uint64_t v1 = (uint64_t *)sub_10000C3B8();
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain(v3);
  return Logger.init(subsystem:category:)(v2, v3, 0xD000000000000012LL, 0x800000010001CD70LL);
}

uint64_t sub_10000C778()
{
  if (qword_100025550 != -1) {
    swift_once(&qword_100025550, sub_10000C6F4);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_10000C3F8(v0, (uint64_t)qword_1000258D0);
}

char *sub_10000C7C0(int a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    BOOL v4 = a1 < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v6 = a2 + 1;
  uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    uint64_t v8 = String.init(cString:)(v3);
    uint64_t v10 = v9;
    if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
      uint64_t v7 = sub_10000F540(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
    }
    unint64_t v12 = *((void *)v7 + 2);
    unint64_t v11 = *((void *)v7 + 3);
    if (v12 >= v11 >> 1) {
      uint64_t v7 = sub_10000F540((char *)(v11 > 1), v12 + 1, 1, v7);
    }
    *((void *)v7 + 2) = v12 + 1;
    uint64_t v13 = &v7[16 * v12];
    *((void *)v13 + 4) = v8;
    *((void *)v13 + 5) = v10;
    uint64_t v14 = *v6++;
    uint64_t v3 = v14;
    BOOL v15 = a1-- != 0;
  }

  while (v14 && a1 != 0 && v15);
  return v7;
}

uint64_t sub_10000C8A4(int a1, uint64_t *a2)
{
  return sub_10000E390(a1, a2, (void (*)(void))sub_10000C8B0);
}

uint64_t sub_10000C8B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000080BC(&qword_100024B60);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v161 = (char *)&v145 - v8;
  uint64_t v9 = type metadata accessor for IPv6Address(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v145 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  unint64_t v16 = (char *)&v145 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  Swift::String v158 = (char *)&v145 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v145 - v19;
  uint64_t v21 = sub_1000080BC(&qword_100024B68);
  uint64_t v22 = __chkstk_darwin(v21);
  Swift::String v160 = (char *)&v145 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v22);
  uint64_t v159 = (char *)&v145 - v24;
  uint64_t v25 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v26 = a1;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v36 = *(void *)(a1 + 16);
  if (!v36) {
    goto LABEL_22;
  }
  uint64_t v149 = v31;
  uint64_t v147 = v35;
  os_log_t v145 = v13;
  uint64_t v146 = v7;
  uint64_t v148 = v2;
  uint64_t v150 = v16;
  Swift::String v153 = v20;
  uint64_t v154 = v33;
  uint64_t v156 = v10;
  uint64_t v157 = v9;
  uint64_t v151 = v34;
  Swift::String v152 = (char *)&v145 - v32;
  uint64_t v155 = v30;
  swift_bridgeObjectRetain(v26);
  uint64_t v162 = 0LL;
  uint64_t v163 = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v164 = 0LL;
  uint64_t v165 = 0LL;
  uint64_t v166 = 0LL;
  v167 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v168 = 0LL;
  v169 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v40 = (uint64_t *)(v26 + 40);
  uint64_t v41 = v26;
  while (2)
  {
    uint64_t v43 = *(v40 - 1);
    uint64_t v42 = *v40;
    switch(v39)
    {
      case 0LL:
        if (v43 == 0x6E6E75742D687373LL && v42 == 0xEA00000000006C65LL) {
          goto LABEL_4;
        }
        uint64_t v26 = v41;
        if ((_stringCompareWithSmolCheck(_:_:expecting:)( *(v40 - 1),  *v40,  0x6E6E75742D687373LL,  0xEA00000000006C65LL,  0LL) & 1) != 0) {
          goto LABEL_4;
        }
        __break(1u);
        goto LABEL_58;
      case 1LL:
        swift_bridgeObjectRetain(*v40);
        swift_bridgeObjectRelease(v168);
        uint64_t v26 = v41;
        uint64_t v163 = v43;
        uint64_t v168 = v42;
        goto LABEL_4;
      case 2LL:
        swift_bridgeObjectRetain(*v40);
        swift_bridgeObjectRelease(v169);
        uint64_t v26 = v41;
        uint64_t v38 = v43;
        v169 = (void *)v42;
        goto LABEL_4;
      case 3LL:
        swift_bridgeObjectRetain(*v40);
        swift_bridgeObjectRelease(v167);
        uint64_t v26 = v41;
        uint64_t v165 = v43;
        v167 = (void *)v42;
        goto LABEL_4;
      case 4LL:
        swift_bridgeObjectRetain(*v40);
        swift_bridgeObjectRelease(v166);
        uint64_t v26 = v41;
        uint64_t v164 = v43;
        uint64_t v166 = (void *)v42;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain(*v40);
        swift_bridgeObjectRelease(v37);
        if (v39 != 5)
        {
          swift_bridgeObjectRelease(v42);
          swift_bridgeObjectRelease(v41);
          swift_bridgeObjectRelease(v167);
          swift_bridgeObjectRelease(v166);
          swift_bridgeObjectRelease(v169);
          swift_bridgeObjectRelease(v168);
          unint64_t v170 = 0LL;
          unint64_t v171 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(52LL);
          unint64_t v58 = 0xD000000000000032LL;
          unint64_t v59 = 0x800000010001C8D0LL;
LABEL_31:
          String.append(_:)(*(Swift::String *)&v58);
          goto LABEL_32;
        }

        uint64_t v162 = v43;
        uint64_t v37 = (void *)v42;
        uint64_t v26 = v41;
LABEL_4:
        ++v39;
        v40 += 2;
        if (v36 != v39) {
          continue;
        }
        uint64_t v45 = v38;
        swift_bridgeObjectRelease(v26);
        uint64_t v46 = v168;
        if (!v168)
        {
          swift_bridgeObjectRelease(v37);
          swift_bridgeObjectRelease(v167);
          swift_bridgeObjectRelease(v166);
          swift_bridgeObjectRelease(v169);
LABEL_22:
          unint64_t v170 = 0LL;
          unint64_t v171 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(50LL);
          swift_bridgeObjectRelease(v171);
          unint64_t v170 = 0xD000000000000030LL;
          unint64_t v171 = 0x800000010001C910LL;
LABEL_32:
          if (qword_100025558 != -1) {
LABEL_58:
          }
            swift_once(&qword_100025558, sub_10000D710);
          uint64_t v76 = qword_1000258E8;
          v75 = (void *)unk_1000258F0;
          swift_bridgeObjectRetain(unk_1000258F0);
          v77._countAndFlagsBits = v76;
          v77._object = v75;
          String.append(_:)(v77);
          swift_bridgeObjectRelease(v75);
          unint64_t v78 = v170;
          unint64_t v79 = v171;
          unint64_t v80 = sub_100008268();
          uint64_t v81 = swift_allocError(&type metadata for String, v80, 0LL, 0LL);
          unint64_t *v82 = v78;
          v82[1] = v79;
          return swift_willThrow(v81);
        }

        uint64_t v47 = v37;
        uint64_t v48 = v169;
        if (v169)
        {
          swift_bridgeObjectRetain(v169);
          uint64_t v49 = (uint64_t)v159;
          v169 = v48;
          NWEndpoint.Port.init(_:)(v45, v48);
          uint64_t v51 = v154;
          uint64_t v50 = v155;
          int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 48))(v49, 1LL, v155);
          uint64_t v53 = v157;
          uint64_t v54 = (uint64_t)v161;
          v55 = v167;
          if (v52 == 1)
          {
            swift_bridgeObjectRelease(v46);
            swift_bridgeObjectRelease(v47);
            swift_bridgeObjectRelease(v55);
            swift_bridgeObjectRelease(v166);
            sub_10000F688(v49, &qword_100024B68);
            unint64_t v170 = 0LL;
            unint64_t v171 = 0xE000000000000000LL;
            _StringGuts.grow(_:)(23LL);
            swift_bridgeObjectRelease(v171);
            unint64_t v170 = 0xD000000000000012LL;
            unint64_t v171 = 0x800000010001C9D0LL;
            v56._countAndFlagsBits = v45;
            int v57 = v169;
            v56._object = v169;
            String.append(_:)(v56);
            swift_bridgeObjectRelease(v57);
            unint64_t v58 = 10LL;
            unint64_t v59 = 0xE100000000000000LL;
            goto LABEL_31;
          }

          swift_bridgeObjectRelease(v169);
          uint64_t v61 = *(void (**)(void))(v51 + 32);
          ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v149, v49, v50);
          uint64_t v60 = (uint64_t)v152;
          v61();
        }

        else
        {
          sub_10000C3D4();
          uint64_t v51 = v154;
          uint64_t v50 = v155;
          uint64_t v60 = (uint64_t)v152;
          (*(void (**)(void))(v154 + 16))();
          uint64_t v53 = v157;
          uint64_t v54 = (uint64_t)v161;
          v55 = v167;
        }

        uint64_t v62 = (uint64_t)v160;
        uint64_t v63 = v165;
        if (v55)
        {
          swift_bridgeObjectRetain(v55);
          NWEndpoint.Port.init(_:)(v63, v55);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v62, 1LL, v50) == 1)
          {
            swift_bridgeObjectRelease(v168);
            swift_bridgeObjectRelease(v47);
            swift_bridgeObjectRelease(v166);
            sub_10000F688(v62, &qword_100024B68);
            unint64_t v170 = 0LL;
            unint64_t v171 = 0xE000000000000000LL;
            _StringGuts.grow(_:)(25LL);
            swift_bridgeObjectRelease(v171);
            unint64_t v170 = 0xD000000000000014LL;
            unint64_t v171 = 0x800000010001C9B0LL;
            v64._countAndFlagsBits = v63;
            v64._object = v55;
            String.append(_:)(v64);
            swift_bridgeObjectRelease(v55);
            v65._countAndFlagsBits = 10LL;
            v65._object = (void *)0xE100000000000000LL;
            String.append(_:)(v65);
            if (qword_100025558 != -1) {
              swift_once(&qword_100025558, sub_10000D710);
            }
            uint64_t v67 = qword_1000258E8;
            unint64_t v66 = (void *)unk_1000258F0;
            swift_bridgeObjectRetain(unk_1000258F0);
            v68._countAndFlagsBits = v67;
            v68._object = v66;
            String.append(_:)(v68);
            swift_bridgeObjectRelease(v66);
            unint64_t v69 = v170;
            unint64_t v70 = v171;
            unint64_t v71 = sub_100008268();
            uint64_t v72 = swift_allocError(&type metadata for String, v71, 0LL, 0LL);
            *uint64_t v73 = v69;
            v73[1] = v70;
            swift_willThrow(v72);
            return (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v60, v50);
          }

          swift_bridgeObjectRelease(v55);
          uint64_t v97 = v62;
          os_log_type_t v98 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32);
          uint64_t v99 = v147;
          v98(v147, v97, v50);
          uint64_t v84 = v151;
          v98(v151, v99, v50);
          uint64_t v85 = v162;
          if (!v47)
          {
LABEL_40:
            uint64_t v100 = sub_10000C684();
            (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v153, v100, v53);
            goto LABEL_42;
          }
        }

        else
        {
          uint64_t v83 = sub_10000C4EC();
          uint64_t v84 = v151;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v151, v83, v50);
          uint64_t v85 = v162;
          if (!v47) {
            goto LABEL_40;
          }
        }

        swift_bridgeObjectRetain(v47);
        IPv6Address.init(_:)(v85, v47);
        uint64_t v86 = v156;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v156 + 48))(v54, 1LL, v53) == 1)
        {
          swift_bridgeObjectRelease(v168);
          swift_bridgeObjectRelease(v166);
          sub_10000F688(v54, &qword_100024B60);
          unint64_t v170 = 0LL;
          unint64_t v171 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(23LL);
          swift_bridgeObjectRelease(v171);
          unint64_t v170 = 0xD000000000000012LL;
          unint64_t v171 = 0x800000010001C990LL;
          v87._countAndFlagsBits = v85;
          v87._object = v47;
          String.append(_:)(v87);
          swift_bridgeObjectRelease(v47);
          v88._countAndFlagsBits = 10LL;
          v88._object = (void *)0xE100000000000000LL;
          String.append(_:)(v88);
          if (qword_100025558 != -1) {
            swift_once(&qword_100025558, sub_10000D710);
          }
          uint64_t v90 = qword_1000258E8;
          int v89 = (void *)unk_1000258F0;
          swift_bridgeObjectRetain(unk_1000258F0);
          v91._countAndFlagsBits = v90;
          v91._object = v89;
          String.append(_:)(v91);
          swift_bridgeObjectRelease(v89);
          unint64_t v92 = v170;
          unint64_t v93 = v171;
          unint64_t v94 = sub_100008268();
          uint64_t v95 = swift_allocError(&type metadata for String, v94, 0LL, 0LL);
          *uint64_t v96 = v92;
          v96[1] = v93;
          swift_willThrow(v95);
          goto LABEL_55;
        }

        swift_bridgeObjectRelease(v47);
        v101 = *(void (**)(char *, uint64_t, uint64_t))(v86 + 32);
        uint64_t v102 = v158;
        v101(v158, v54, v53);
        v101(v153, (uint64_t)v102, v53);
LABEL_42:
        uint64_t v103 = v166;
        uint64_t v104 = v164;
        if (v166)
        {
          swift_bridgeObjectRetain(v166);
          uint64_t v105 = (uint64_t)v146;
          IPv6Address.init(_:)(v104, v103);
          uint64_t v106 = v156;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v156 + 48))(v105, 1LL, v53) == 1)
          {
            swift_bridgeObjectRelease(v168);
            sub_10000F688(v105, &qword_100024B60);
            unint64_t v170 = 0LL;
            unint64_t v171 = 0xE000000000000000LL;
            _StringGuts.grow(_:)(21LL);
            swift_bridgeObjectRelease(v171);
            unint64_t v170 = 0xD000000000000010LL;
            unint64_t v171 = 0x800000010001C970LL;
            v107._countAndFlagsBits = v104;
            v107._object = v103;
            String.append(_:)(v107);
            swift_bridgeObjectRelease(v103);
            v108._countAndFlagsBits = 10LL;
            v108._object = (void *)0xE100000000000000LL;
            String.append(_:)(v108);
            if (qword_100025558 != -1) {
              swift_once(&qword_100025558, sub_10000D710);
            }
            uint64_t v110 = qword_1000258E8;
            v109 = (void *)unk_1000258F0;
            swift_bridgeObjectRetain(unk_1000258F0);
            v111._countAndFlagsBits = v110;
            v111._object = v109;
            String.append(_:)(v111);
            swift_bridgeObjectRelease(v109);
            unint64_t v112 = v170;
            unint64_t v113 = v171;
            unint64_t v114 = sub_100008268();
            uint64_t v115 = swift_allocError(&type metadata for String, v114, 0LL, 0LL);
            unint64_t *v116 = v112;
            v116[1] = v113;
            swift_willThrow(v115);
            (*(void (**)(char *, uint64_t))(v156 + 8))(v153, v157);
            goto LABEL_55;
          }

          swift_bridgeObjectRelease(v103);
          v119 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 32);
          gid_t v120 = v145;
          v119(v145, v105, v53);
          uint64_t v118 = (uint64_t)v150;
          v119(v150, (uint64_t)v120, v53);
        }

        else
        {
          uint64_t v117 = sub_10000C56C();
          uint64_t v118 = (uint64_t)v150;
          (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v150, v117, v53);
        }

        uint64_t v121 = v168;
        uint64_t v122 = (uint64_t)v153;
        uint64_t v123 = v148;
        sub_10001045C(v163, v168, v118, v60, (uint64_t)v153, v84);
        if (!v123)
        {
          swift_bridgeObjectRelease(v121);
          uint64_t v133 = *(void (**)(uint64_t, uint64_t))(v156 + 8);
          v133(v118, v53);
          v133(v122, v53);
LABEL_55:
          unint64_t v134 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
          v134(v84, v50);
          return ((uint64_t (*)(uint64_t, uint64_t))v134)(v60, v50);
        }

        swift_bridgeObjectRelease(v121);
        if (qword_100025550 != -1) {
          swift_once(&qword_100025550, sub_10000C6F4);
        }
        uint64_t v124 = type metadata accessor for Logger(0LL);
        sub_10000C3F8(v124, (uint64_t)qword_1000258D0);
        swift_errorRetain(v123);
        uint64_t v125 = swift_errorRetain(v123);
        uint64_t v126 = (os_log_s *)Logger.logObject.getter(v125);
        os_log_type_t v127 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v126, v127))
        {
          uint64_t v128 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          Swift::String v129 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
          *(_DWORD *)uint64_t v128 = 138412290;
          swift_errorRetain(v123);
          uint64_t v130 = _swift_stdlib_bridgeErrorToNSError(v123);
          unint64_t v170 = v130;
          uint64_t v84 = v151;
          uint64_t v60 = (uint64_t)v152;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v128 + 4, v128 + 12);
          *Swift::String v129 = v130;
          uint64_t v51 = v154;
          swift_errorRelease(v123);
          swift_errorRelease(v123);
          _os_log_impl((void *)&_mh_execute_header, v126, v127, "remotectl ssh-tunnel failed: %@", v128, 0xCu);
          uint64_t v131 = sub_1000080BC(&qword_100024D90);
          swift_arrayDestroy(v129, 1LL, v131);
          v132 = v129;
          uint64_t v50 = v155;
          swift_slowDealloc(v132, -1LL, -1LL);
          swift_slowDealloc(v128, -1LL, -1LL);
        }

        else
        {
          swift_errorRelease(v123);
          swift_errorRelease(v123);
        }

        unint64_t v170 = 0LL;
        unint64_t v171 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(31LL);
        v135._countAndFlagsBits = 0xD00000000000001DLL;
        v135._object = (void *)0x800000010001C950LL;
        String.append(_:)(v135);
        uint64_t v172 = v123;
        uint64_t v136 = sub_1000080BC((uint64_t *)&unk_100024D70);
        _print_unlocked<A, B>(_:_:)( &v172,  &v170,  v136,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        unint64_t v137 = v170;
        unint64_t v138 = v171;
        unint64_t v139 = sub_100008268();
        uint64_t v140 = swift_allocError(&type metadata for String, v139, 0LL, 0LL);
        unint64_t *v141 = v137;
        v141[1] = v138;
        swift_willThrow(v140);
        swift_errorRelease(v123);
        uint64_t v142 = v157;
        unint64_t v143 = *(void (**)(char *, uint64_t))(v156 + 8);
        v143(v150, v157);
        v143(v153, v142);
        Class v144 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
        v144(v84, v50);
        return ((uint64_t (*)(uint64_t, uint64_t))v144)(v60, v50);
    }
  }

void sub_10000D710()
{
  uint64_t v0 = type metadata accessor for IPv6Address(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = 0LL;
  unint64_t v23 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(91LL);
  v8._countAndFlagsBits = 0xD000000000000028LL;
  v8._object = (void *)0x800000010001CCE0LL;
  String.append(_:)(v8);
  uint64_t v9 = sub_10000C3D4();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v21(v7, v9, v4);
  _print_unlocked<A, B>(_:_:)( v7,  &v22,  v4,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v7, v4);
  v11._countAndFlagsBits = 0x50497475643C203ELL;
  v11._object = (void *)0xEC000000203F3F20LL;
  String.append(_:)(v11);
  uint64_t v12 = sub_10000C56C();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v13(v3, v12, v0);
  _print_unlocked<A, B>(_:_:)( v3,  &v22,  v0,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14(v3, v0);
  v15._object = (void *)0x800000010001CD10LL;
  v15._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v15);
  uint64_t v16 = sub_10000C4EC();
  v21(v7, v16, v4);
  _print_unlocked<A, B>(_:_:)( v7,  &v22,  v4,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v10(v7, v4);
  v17._countAndFlagsBits = 0x6C61636F6C3C203ELL;
  v17._object = (void *)0xEE00203F3F205049LL;
  String.append(_:)(v17);
  uint64_t v18 = sub_10000C684();
  v13(v3, v18, v0);
  _print_unlocked<A, B>(_:_:)( v3,  &v22,  v0,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v14(v3, v0);
  v19._countAndFlagsBits = 62LL;
  v19._object = (void *)0xE100000000000000LL;
  String.append(_:)(v19);
  qword_1000258E8 = v22;
  unk_1000258F0 = v23;
}

uint64_t sub_10000D980(int a1, uint64_t *a2)
{
  return sub_10000E390(a1, a2, (void (*)(void))sub_10000D98C);
}

uint64_t sub_10000D98C(uint64_t a1)
{
  uint64_t v3 = sub_1000080BC(&qword_100024B60);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  Swift::String v8 = (char *)&v93 - v7;
  uint64_t v9 = type metadata accessor for IPv6Address(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (os_log_s *)((char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v11);
  Swift::String v15 = (char *)&v93 - v14;
  uint64_t v16 = sub_1000080BC(&qword_100024B68);
  __chkstk_darwin(v16);
  uint64_t v104 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = *(void *)(a1 + 16);
  if (!v23) {
    goto LABEL_19;
  }
  uint64_t v96 = v15;
  uint64_t v97 = v8;
  unint64_t v93 = v1;
  unint64_t v94 = v13;
  uint64_t v95 = v6;
  uint64_t v98 = v9;
  uint64_t v99 = v10;
  uint64_t v100 = v22;
  uint64_t v101 = v19;
  uint64_t v102 = v20;
  swift_bridgeObjectRetain(a1);
  uint64_t v107 = 0LL;
  uint64_t v108 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v109 = 0LL;
  uint64_t v110 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v111 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v103 = a1;
  uint64_t v28 = (unint64_t *)(a1 + 40);
  unint64_t v105 = (unint64_t)"nnel-callback failed: ";
  unint64_t v106 = 0x800000010001CB30LL;
  while (2)
  {
    uint64_t v29 = *(v28 - 1);
    unint64_t v30 = *v28;
    switch(v27)
    {
      case 0LL:
        if (v29 == 0xD000000000000013LL && v30 == v106
          || (_stringCompareWithSmolCheck(_:_:expecting:)( *(v28 - 1),  *v28,  0xD000000000000013LL,  v105 | 0x8000000000000000LL,  0LL) & 1) != 0)
        {
          goto LABEL_4;
        }

        __break(1u);
        goto LABEL_42;
      case 1LL:
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v111);
        uint64_t v108 = v29;
        unint64_t v111 = v30;
        goto LABEL_4;
      case 2LL:
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v26);
        uint64_t v110 = v29;
        uint64_t v26 = (void *)v30;
        goto LABEL_4;
      case 3LL:
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v25);
        uint64_t v109 = v29;
        uint64_t v25 = (void *)v30;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v24);
        if (v27 != 4)
        {
          swift_bridgeObjectRelease(v30);
          swift_bridgeObjectRelease(v103);
          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v26);
          swift_bridgeObjectRelease(v111);
          unint64_t v46 = sub_100008268();
          uint64_t v36 = swift_allocError(&type metadata for String, v46, 0LL, 0LL);
          unint64_t v38 = 0xD00000000000003ALL;
          uint64_t v39 = "remotectl ssh-tunnel-callback excepts no more than 4 args.";
          goto LABEL_20;
        }

        uint64_t v107 = v29;
        uint64_t v24 = (void *)v30;
LABEL_4:
        ++v27;
        v28 += 2;
        if (v23 != v27) {
          continue;
        }
        swift_bridgeObjectRelease(v103);
        unint64_t v31 = v111;
        if (!v111)
        {
          swift_bridgeObjectRelease(v24);
          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v26);
LABEL_19:
          unint64_t v35 = sub_100008268();
          uint64_t v36 = swift_allocError(&type metadata for String, v35, 0LL, 0LL);
          unint64_t v38 = 0xD000000000000046LL;
          uint64_t v39 = "Specify tunnel host as first argument to remotectl ssh-tunnel-callback";
LABEL_20:
          unint64_t *v37 = v38;
          v37[1] = (unint64_t)(v39 - 32) | 0x8000000000000000LL;
          return swift_willThrow(v36);
        }

        if (!v26)
        {
          uint64_t v34 = 7104878LL;
          uint64_t v32 = (uint64_t)v104;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v102 + 56))(v104, 1LL, 1LL, v101);
          uint64_t v26 = (void *)0xE300000000000000LL;
LABEL_22:
          swift_bridgeObjectRelease(v24);
          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v31);
          sub_10000F688(v32, &qword_100024B68);
          unint64_t v112 = 0LL;
          unint64_t v113 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(37LL);
          swift_bridgeObjectRelease(v113);
          unint64_t v112 = 0xD000000000000023LL;
          unint64_t v113 = 0x800000010001CA80LL;
          v40._countAndFlagsBits = v34;
          v40._object = v26;
          String.append(_:)(v40);
          swift_bridgeObjectRelease(v26);
          unint64_t v41 = v112;
          unint64_t v42 = v113;
          unint64_t v43 = sub_100008268();
          uint64_t v36 = swift_allocError(&type metadata for String, v43, 0LL, 0LL);
          unint64_t *v44 = v41;
          v44[1] = v42;
          return swift_willThrow(v36);
        }

        swift_bridgeObjectRetain(v26);
        uint64_t v32 = (uint64_t)v104;
        NWEndpoint.Port.init(_:)(v110, v26);
        a1 = v101;
        uint64_t v33 = v102;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v32, 1LL, v101) == 1)
        {
          uint64_t v34 = v110;
          goto LABEL_22;
        }

        swift_bridgeObjectRelease(v26);
        uint64_t v47 = (uint64_t)v100;
        (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v100, v32, a1);
        if (!v25)
        {
          uint64_t v53 = 7104878LL;
          uint64_t v48 = (uint64_t)v97;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v97, 1LL, 1LL, v98);
          int v52 = (void *)0xE300000000000000LL;
LABEL_29:
          swift_bridgeObjectRelease(v31);
          swift_bridgeObjectRelease(v24);
          sub_10000F688(v48, &qword_100024B60);
          unint64_t v112 = 0LL;
          unint64_t v113 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(32LL);
          swift_bridgeObjectRelease(v113);
          unint64_t v112 = 0xD00000000000001ELL;
          unint64_t v113 = 0x800000010001CAB0LL;
          v54._countAndFlagsBits = v53;
          v54._object = v52;
          String.append(_:)(v54);
          swift_bridgeObjectRelease(v52);
          unint64_t v55 = v112;
          unint64_t v56 = v113;
          unint64_t v57 = sub_100008268();
          uint64_t v58 = swift_allocError(&type metadata for String, v57, 0LL, 0LL);
          *unint64_t v59 = v55;
          v59[1] = v56;
          swift_willThrow(v58);
          return (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v100, a1);
        }

        swift_bridgeObjectRetain(v25);
        uint64_t v48 = (uint64_t)v97;
        IPv6Address.init(_:)(v109, v25);
        uint64_t v49 = v98;
        uint64_t v50 = v99;
        uint64_t v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v99 + 48);
        if (v51(v48, 1LL, v98) == 1)
        {
          int v52 = v25;
          uint64_t v53 = v109;
          goto LABEL_29;
        }

        swift_bridgeObjectRelease(v25);
        uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 32);
        v60(v96, v48, v49);
        if (!v24)
        {
          uint64_t v62 = 7104878LL;
          uint64_t v61 = (uint64_t)v95;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v95, 1LL, 1LL, v49);
          uint64_t v24 = (void *)0xE300000000000000LL;
          goto LABEL_37;
        }

        swift_bridgeObjectRetain(v24);
        uint64_t v61 = (uint64_t)v95;
        uint64_t v62 = v107;
        IPv6Address.init(_:)(v107, v24);
        if (v51(v61, 1LL, v49) == 1)
        {
LABEL_37:
          uint64_t v75 = v50;
          swift_bridgeObjectRelease(v111);
          sub_10000F688(v61, &qword_100024B60);
          unint64_t v112 = 0LL;
          unint64_t v113 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(35LL);
          swift_bridgeObjectRelease(v113);
          unint64_t v112 = 0xD000000000000021LL;
          unint64_t v113 = 0x800000010001CAD0LL;
          v76._countAndFlagsBits = v62;
          v76._object = v24;
          String.append(_:)(v76);
          swift_bridgeObjectRelease(v24);
          unint64_t v77 = v112;
          unint64_t v78 = v113;
          unint64_t v79 = sub_100008268();
          uint64_t v80 = swift_allocError(&type metadata for String, v79, 0LL, 0LL);
          *uint64_t v81 = v77;
          v81[1] = v78;
          swift_willThrow(v80);
          (*(void (**)(char *, uint64_t))(v75 + 8))(v96, v49);
          return (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v100, a1);
        }

        swift_bridgeObjectRelease(v24);
        uint64_t v63 = v94;
        v60((char *)v94, v61, v49);
        unint64_t v64 = v111;
        uint64_t v65 = (uint64_t)v96;
        unint64_t v66 = v93;
        sub_100013DC0(v108, v111, v47, (uint64_t)v96, v63);
        uint64_t v26 = v66;
        if (v66)
        {
          swift_bridgeObjectRelease(v64);
          if (qword_100025550 != -1) {
LABEL_42:
          }
            swift_once(&qword_100025550, sub_10000C6F4);
          uint64_t v67 = type metadata accessor for Logger(0LL);
          sub_10000C3F8(v67, (uint64_t)qword_1000258D0);
          swift_errorRetain(v26);
          uint64_t v68 = swift_errorRetain(v26);
          unint64_t v69 = (os_log_s *)Logger.logObject.getter(v68);
          os_log_type_t v70 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v69, v70))
          {
            unint64_t v71 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v72 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
            *(_DWORD *)unint64_t v71 = 138412290;
            swift_errorRetain(v26);
            uint64_t v73 = _swift_stdlib_bridgeErrorToNSError(v26);
            unint64_t v112 = v73;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v112, &v113, v71 + 4, v71 + 12);
            *uint64_t v72 = v73;
            swift_errorRelease(v26);
            swift_errorRelease(v26);
            _os_log_impl((void *)&_mh_execute_header, v69, v70, "remotectl ssh-tunnel-callback failed: %@", v71, 0xCu);
            uint64_t v74 = sub_1000080BC(&qword_100024D90);
            swift_arrayDestroy(v72, 1LL, v74);
            swift_slowDealloc(v72, -1LL, -1LL);
            swift_slowDealloc(v71, -1LL, -1LL);
          }

          else
          {
            swift_errorRelease(v26);
            swift_errorRelease(v26);
          }

          uint64_t v83 = v94;

          unint64_t v112 = 0LL;
          unint64_t v113 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(40LL);
          v84._countAndFlagsBits = 0xD000000000000026LL;
          v84._object = (void *)0x800000010001CB00LL;
          String.append(_:)(v84);
          unint64_t v114 = v26;
          uint64_t v85 = sub_1000080BC((uint64_t *)&unk_100024D70);
          _print_unlocked<A, B>(_:_:)( &v114,  &v112,  v85,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          unint64_t v86 = v112;
          unint64_t v87 = v113;
          unint64_t v88 = sub_100008268();
          uint64_t v89 = swift_allocError(&type metadata for String, v88, 0LL, 0LL);
          *uint64_t v90 = v86;
          v90[1] = v87;
          swift_willThrow(v89);
          swift_errorRelease(v26);
          uint64_t v91 = v98;
          unint64_t v92 = *(void (**)(os_log_s *, uint64_t))(v99 + 8);
          v92(v83, v98);
          v92((os_log_s *)v96, v91);
          return (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v100, a1);
        }

        else
        {
          swift_bridgeObjectRelease(v64);
          v82 = *(void (**)(os_log_s *, uint64_t))(v99 + 8);
          v82(v63, v49);
          v82((os_log_s *)v65, v49);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v102 + 8))(v47, a1);
        }
    }
  }

uint64_t sub_10000E384(int a1, uint64_t *a2)
{
  return sub_10000E390(a1, a2, (void (*)(void))sub_10000E460);
}

uint64_t sub_10000E390(int a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v4 = sub_10000C7C0(a1, a2);
  a3();
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10000E460(uint64_t a1)
{
  uint64_t v3 = sub_1000080BC(&qword_100024B60);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v142 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  Swift::String v8 = (char *)&v142 - v7;
  uint64_t v9 = type metadata accessor for IPv6Address(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v142 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  Swift::String v15 = (os_log_s *)((char *)&v142 - v14);
  uint64_t v16 = sub_1000080BC(&qword_100024B68);
  __chkstk_darwin(v16);
  uint64_t v154 = (char *)&v142 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for NWEndpoint.Port(0LL);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v142 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = *(char **)(a1 + 16);
  if (!v23)
  {
    uint64_t v59 = 0LL;
    uint64_t v166 = 0LL;
    unint64_t v57 = 0LL;
    unint64_t v55 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v60 = 0LL;
    goto LABEL_22;
  }

  uint64_t v146 = v8;
  Class v144 = v6;
  unint64_t v142 = v1;
  unint64_t v143 = (os_log_s *)v13;
  uint64_t v149 = v10;
  os_log_t v145 = v15;
  uint64_t v147 = (uint64_t *)v9;
  uint64_t v148 = v22;
  uint64_t v152 = v20;
  uint64_t v150 = v19;
  swift_bridgeObjectRetain(a1);
  uint64_t v24 = 0LL;
  uint64_t v159 = 0LL;
  Swift::String v160 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v164 = 0LL;
  uint64_t v165 = 0LL;
  uint64_t v156 = 0LL;
  uint64_t v157 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v162 = 0LL;
  uint64_t v163 = 0LL;
  uint64_t v158 = 0LL;
  uint64_t v166 = 0LL;
  uint64_t v161 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v151 = a1;
  uint64_t v28 = (uint64_t *)(a1 + 40);
  unint64_t v153 = (unint64_t)"nnel-privileged failed: ";
  unint64_t v155 = 0x800000010001CCC0LL;
  while (2)
  {
    uint64_t v30 = *(v28 - 1);
    uint64_t v31 = *v28;
    switch((unint64_t)v27)
    {
      case 0uLL:
        if (v30 == 0xD000000000000015LL && v31 == v155) {
          goto LABEL_4;
        }
        uint64_t v32 = v24;
        char v33 = _stringCompareWithSmolCheck(_:_:expecting:)( *(v28 - 1),  *v28,  0xD000000000000015LL,  v153 | 0x8000000000000000LL,  0LL);
        uint64_t v24 = v32;
        if ((v33 & 1) != 0) {
          goto LABEL_4;
        }
        __break(1u);
        goto LABEL_62;
      case 1uLL:
        uint64_t v34 = v26;
        unint64_t v35 = v25;
        uint64_t v36 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v161);
        uint64_t v24 = v36;
        uint64_t v25 = v35;
        uint64_t v26 = v34;
        uint64_t v159 = v30;
        uint64_t v161 = v31;
        goto LABEL_4;
      case 2uLL:
        uint64_t v37 = v26;
        unint64_t v38 = v25;
        uint64_t v39 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v166);
        uint64_t v24 = v39;
        uint64_t v25 = v38;
        uint64_t v26 = v37;
        uint64_t v158 = v30;
        uint64_t v166 = (void *)v31;
        goto LABEL_4;
      case 3uLL:
        uint64_t v40 = v26;
        unint64_t v41 = v25;
        uint64_t v42 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v163);
        uint64_t v24 = v42;
        uint64_t v25 = v41;
        uint64_t v26 = v40;
        uint64_t v157 = v30;
        uint64_t v163 = (void *)v31;
        goto LABEL_4;
      case 4uLL:
        unint64_t v43 = v25;
        uint64_t v44 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v162);
        uint64_t v24 = v44;
        uint64_t v25 = v43;
        uint64_t v26 = v30;
        uint64_t v162 = (char *)v31;
        goto LABEL_4;
      case 5uLL:
        uint64_t v45 = v26;
        unint64_t v46 = v25;
        uint64_t v47 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v165);
        uint64_t v24 = v47;
        uint64_t v25 = v46;
        uint64_t v26 = v45;
        uint64_t v156 = v30;
        uint64_t v165 = (void *)v31;
        goto LABEL_4;
      case 6uLL:
        uint64_t v29 = v24;
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v164);
        uint64_t v24 = v29;
        uint64_t v25 = (void *)v30;
        uint64_t v164 = (void *)v31;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain(*v28);
        swift_bridgeObjectRelease(v160);
        if (v27 != (char *)7)
        {
          swift_bridgeObjectRelease(v31);
          swift_bridgeObjectRelease(v151);
          swift_bridgeObjectRelease(v164);
          swift_bridgeObjectRelease(v165);
          swift_bridgeObjectRelease(v162);
          swift_bridgeObjectRelease(v163);
          swift_bridgeObjectRelease(v166);
          swift_bridgeObjectRelease(v161);
          unint64_t v75 = sub_100008268();
          uint64_t v67 = swift_allocError(&type metadata for String, v75, 0LL, 0LL);
          *Swift::String v76 = 0xD000000000000037LL;
          v76[1] = 0x800000010001CB50LL;
          return swift_willThrow(v67);
        }

        uint64_t v24 = v30;
        Swift::String v160 = (void *)v31;
LABEL_4:
        ++v27;
        v28 += 2;
        if (v23 != v27) {
          continue;
        }
        uint64_t v48 = v24;
        swift_bridgeObjectRelease(v151);
        uint64_t v49 = v161;
        if (!v161)
        {
          uint64_t v19 = v150;
          uint64_t v20 = v152;
          uint64_t v23 = v162;
          unint64_t v57 = v163;
          uint64_t v58 = v164;
          unint64_t v55 = v165;
          uint64_t v59 = v159;
          uint64_t v60 = v160;
LABEL_22:
          uint64_t v50 = (uint64_t)v154;
          int v56 = 1;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v154, 1LL, 1LL, v19);
          uint64_t v49 = 0LL;
LABEL_23:
          swift_bridgeObjectRelease(v60);
          swift_bridgeObjectRelease(v58);
          swift_bridgeObjectRelease(v55);
          swift_bridgeObjectRelease(v23);
          swift_bridgeObjectRelease(v57);
          swift_bridgeObjectRelease(v166);
          sub_10000F688(v50, &qword_100024B68);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(37LL);
          swift_bridgeObjectRelease(v168);
          unint64_t v167 = 0xD000000000000023LL;
          unint64_t v168 = 0x800000010001CB90LL;
          if (v56) {
            uint64_t v61 = 7104878LL;
          }
          else {
            uint64_t v61 = v59;
          }
          if (v56) {
            unint64_t v62 = 0xE300000000000000LL;
          }
          else {
            unint64_t v62 = v49;
          }
          unint64_t v63 = v62;
          String.append(_:)(*(Swift::String *)&v61);
          swift_bridgeObjectRelease(v62);
          unint64_t v64 = v167;
          unint64_t v65 = v168;
          unint64_t v66 = sub_100008268();
          uint64_t v67 = swift_allocError(&type metadata for String, v66, 0LL, 0LL);
          *uint64_t v68 = v64;
          v68[1] = v65;
          return swift_willThrow(v67);
        }

        swift_bridgeObjectRetain(v161);
        uint64_t v50 = (uint64_t)v154;
        NWEndpoint.Port.init(_:)(v159, v49);
        uint64_t v51 = v152;
        uint64_t v52 = v150;
        int v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v152 + 48))(v50, 1LL, v150);
        uint64_t v54 = v149;
        unint64_t v55 = v165;
        if (v53 == 1)
        {
          int v56 = 0;
          uint64_t v23 = v162;
          unint64_t v57 = v163;
          uint64_t v58 = v164;
          uint64_t v59 = v159;
          uint64_t v60 = v160;
          goto LABEL_23;
        }

        uint64_t v159 = v26;
        swift_bridgeObjectRelease(v49);
        (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v148, v50, v52);
        os_log_type_t v70 = v166;
        if (!v166)
        {
          uint64_t v74 = v52;
          uint64_t v72 = 7104878LL;
          uint64_t v71 = (uint64_t)v146;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t *))(v54 + 56))(v146, 1LL, 1LL, v147);
          os_log_type_t v70 = (void *)0xE300000000000000LL;
LABEL_36:
          swift_bridgeObjectRelease(v160);
          swift_bridgeObjectRelease(v164);
          swift_bridgeObjectRelease(v55);
          swift_bridgeObjectRelease(v162);
          swift_bridgeObjectRelease(v163);
          sub_10000F688(v71, &qword_100024B60);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(32LL);
          swift_bridgeObjectRelease(v168);
          unint64_t v167 = 0xD00000000000001ELL;
          unint64_t v168 = 0x800000010001CBC0LL;
          v77._countAndFlagsBits = v72;
          v77._object = v70;
          String.append(_:)(v77);
          swift_bridgeObjectRelease(v70);
          unint64_t v78 = v167;
          unint64_t v79 = v168;
          unint64_t v80 = sub_100008268();
          uint64_t v81 = swift_allocError(&type metadata for String, v80, 0LL, 0LL);
          unint64_t *v82 = v78;
          v82[1] = v79;
          swift_willThrow(v81);
          return (*(uint64_t (**)(char *, uint64_t))(v152 + 8))(v148, v74);
        }

        swift_bridgeObjectRetain(v166);
        uint64_t v71 = (uint64_t)v146;
        uint64_t v72 = v158;
        IPv6Address.init(_:)(v158, v70);
        uint64_t v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v54 + 48);
        uint64_t v28 = v147;
        if (v73(v71, 1LL, v147) == 1)
        {
          uint64_t v74 = v52;
          unint64_t v55 = v165;
          goto LABEL_36;
        }

        uint64_t v161 = (uint64_t)v25;
        swift_bridgeObjectRelease(v70);
        uint64_t v83 = *(void (**)(os_log_s *, uint64_t, uint64_t *))(v54 + 32);
        v83(v145, v71, v28);
        Swift::String v84 = v163;
        if (!v163)
        {
          uint64_t v86 = 7104878LL;
          uint64_t v85 = (uint64_t)v144;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t *))(v54 + 56))(v144, 1LL, 1LL, v28);
          Swift::String v84 = (void *)0xE300000000000000LL;
LABEL_41:
          swift_bridgeObjectRelease(v160);
          swift_bridgeObjectRelease(v164);
          swift_bridgeObjectRelease(v165);
          swift_bridgeObjectRelease(v162);
          sub_10000F688(v85, &qword_100024B60);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(34LL);
          swift_bridgeObjectRelease(v168);
          unint64_t v167 = 0xD000000000000020LL;
          unint64_t v168 = 0x800000010001CBE0LL;
          v87._countAndFlagsBits = v86;
          v87._object = v84;
          String.append(_:)(v87);
          swift_bridgeObjectRelease(v84);
          unint64_t v88 = v167;
          unint64_t v89 = v168;
          unint64_t v90 = sub_100008268();
          uint64_t v91 = swift_allocError(&type metadata for String, v90, 0LL, 0LL);
          unint64_t *v92 = v88;
          v92[1] = v89;
          swift_willThrow(v91);
          (*(void (**)(os_log_s *, uint64_t *))(v54 + 8))(v145, v28);
          unint64_t v93 = *(uint64_t (**)(uint64_t, uint64_t))(v152 + 8);
          uint64_t v94 = (uint64_t)v148;
          return v93(v94, v150);
        }

        swift_bridgeObjectRetain(v163);
        uint64_t v85 = (uint64_t)v144;
        IPv6Address.init(_:)(v157, v84);
        if (v73(v85, 1LL, v28) == 1)
        {
          uint64_t v86 = v157;
          goto LABEL_41;
        }

        uint64_t v95 = 7104878LL;
        swift_bridgeObjectRelease(v84);
        v83(v143, v85, v28);
        uint64_t v25 = v165;
        if (!v165)
        {
          uint64_t v25 = (void *)0xE300000000000000LL;
          uint64_t v26 = (uint64_t)v148;
LABEL_57:
          swift_bridgeObjectRelease(v160);
          swift_bridgeObjectRelease(v164);
          swift_bridgeObjectRelease(v162);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(29LL);
          swift_bridgeObjectRelease(v168);
          uint64_t v118 = "Invalid gid in argument 4: ";
LABEL_64:
          unint64_t v167 = 0xD00000000000001BLL;
          unint64_t v168 = (unint64_t)(v118 - 32) | 0x8000000000000000LL;
          v119._countAndFlagsBits = v95;
          v119._object = v25;
          String.append(_:)(v119);
          swift_bridgeObjectRelease(v25);
          unint64_t v120 = v167;
          unint64_t v121 = v168;
          unint64_t v122 = sub_100008268();
          uint64_t v123 = swift_allocError(&type metadata for String, v122, 0LL, 0LL);
          unint64_t *v124 = v120;
          v124[1] = v121;
          swift_willThrow(v123);
          uint64_t v125 = *(void (**)(char *, uint64_t *))(v54 + 8);
          v125((char *)v143, v28);
LABEL_65:
          uint64_t v126 = v145;
          goto LABEL_66;
        }

        swift_bridgeObjectRetain(v165);
        uint64_t v96 = v156;
        unint64_t v97 = sub_10000F2E4(v156, (unint64_t)v25);
        uint64_t v26 = (uint64_t)v148;
        if ((v97 & 0x100000000LL) != 0)
        {
          uint64_t v95 = v96;
          goto LABEL_57;
        }

        gid_t v98 = v97;
        swift_bridgeObjectRelease(v25);
        uint64_t v25 = v162;
        if (!v162)
        {
          uint64_t v25 = (void *)0xE300000000000000LL;
LABEL_60:
          swift_bridgeObjectRelease(v160);
          swift_bridgeObjectRelease(v164);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(29LL);
          swift_bridgeObjectRelease(v168);
          uint64_t v118 = "Invalid uid in argument 5: ";
          goto LABEL_64;
        }

        swift_bridgeObjectRetain(v162);
        uint64_t v99 = v159;
        unint64_t v100 = sub_10000F2E4(v159, (unint64_t)v25);
        if ((v100 & 0x100000000LL) != 0)
        {
          uint64_t v95 = v99;
          goto LABEL_60;
        }

        uid_t v101 = v100;
        swift_bridgeObjectRelease(v25);
        uint64_t v25 = v164;
        if (!v164)
        {
          uint64_t v25 = (void *)0xE300000000000000LL;
LABEL_63:
          swift_bridgeObjectRelease(v160);
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(29LL);
          swift_bridgeObjectRelease(v168);
          uint64_t v118 = "Invalid pid in argument 6: ";
          goto LABEL_64;
        }

        uid_t v102 = v101;
        swift_bridgeObjectRetain(v164);
        uint64_t v31 = v161;
        unint64_t v103 = sub_10000F2E4(v161, (unint64_t)v25);
        if ((v103 & 0x100000000LL) != 0)
        {
LABEL_62:
          uint64_t v95 = v31;
          uint64_t v54 = v149;
          goto LABEL_63;
        }

        int v104 = v103;
        swift_bridgeObjectRelease(v25);
        unint64_t v105 = v160;
        if (!v160)
        {
          unint64_t v105 = (void *)0xE300000000000000LL;
LABEL_70:
          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(30LL);
          swift_bridgeObjectRelease(v168);
          unint64_t v167 = 0xD00000000000001CLL;
          unint64_t v168 = 0x800000010001CC70LL;
          v127._countAndFlagsBits = v95;
          v127._object = v105;
          String.append(_:)(v127);
          swift_bridgeObjectRelease(v105);
          unint64_t v128 = v167;
          unint64_t v129 = v168;
          unint64_t v130 = sub_100008268();
          uint64_t v131 = swift_allocError(&type metadata for String, v130, 0LL, 0LL);
          unint64_t *v132 = v128;
          v132[1] = v129;
          swift_willThrow(v131);
          uint64_t v125 = *(void (**)(char *, uint64_t *))(v149 + 8);
          v125((char *)v143, v28);
          goto LABEL_65;
        }

        swift_bridgeObjectRetain(v160);
        unint64_t v106 = sub_10000F2E4(v48, (unint64_t)v105);
        if ((v106 & 0x100000000LL) != 0)
        {
          uint64_t v95 = v48;
          goto LABEL_70;
        }

        unint64_t v107 = v106;
        swift_bridgeObjectRelease(v105);
        if (((v107 | v104) & 0x80000000) != 0)
        {
          __break(1u);
LABEL_75:
          swift_once(&qword_100025550, sub_10000C6F4);
LABEL_53:
          uint64_t v110 = type metadata accessor for Logger(0LL);
          sub_10000C3F8(v110, (uint64_t)qword_1000258D0);
          swift_errorRetain(v107);
          uint64_t v111 = swift_errorRetain(v107);
          unint64_t v112 = (os_log_s *)Logger.logObject.getter(v111);
          os_log_type_t v113 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v112, v113))
          {
            unint64_t v114 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v115 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
            *(_DWORD *)unint64_t v114 = 138412290;
            swift_errorRetain(v107);
            uint64_t v116 = _swift_stdlib_bridgeErrorToNSError(v107);
            unint64_t v167 = v116;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, &v168, v114 + 4, v114 + 12);
            *uint64_t v115 = v116;
            swift_errorRelease(v107);
            swift_errorRelease(v107);
            _os_log_impl( (void *)&_mh_execute_header,  v112,  v113,  "remotectl ssh-tunnel-privileged failed: %@",  v114,  0xCu);
            uint64_t v117 = sub_1000080BC(&qword_100024D90);
            swift_arrayDestroy(v115, 1LL, v117);
            swift_slowDealloc(v115, -1LL, -1LL);
            swift_slowDealloc(v114, -1LL, -1LL);
          }

          else
          {
            swift_errorRelease(v107);
            swift_errorRelease(v107);
          }

          unint64_t v167 = 0LL;
          unint64_t v168 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(42LL);
          v133._countAndFlagsBits = 0xD000000000000028LL;
          v133._object = (void *)0x800000010001CC90LL;
          String.append(_:)(v133);
          unint64_t v169 = v107;
          uint64_t v134 = sub_1000080BC((uint64_t *)&unk_100024D70);
          _print_unlocked<A, B>(_:_:)( &v169,  &v167,  v134,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          unint64_t v135 = v167;
          unint64_t v136 = v168;
          unint64_t v137 = sub_100008268();
          uint64_t v138 = swift_allocError(&type metadata for String, v137, 0LL, 0LL);
          *unint64_t v139 = v135;
          v139[1] = v136;
          swift_willThrow(v138);
          swift_errorRelease(v107);
          uint64_t v140 = *(void (**)(char *, uint64_t *))(v149 + 8);
          v141 = v147;
          v140((char *)v143, v147);
          v140((char *)v145, v141);
          return (*(uint64_t (**)(char *, uint64_t))(v152 + 8))(v148, v150);
        }

        else
        {
          uint64_t v108 = v145;
          unint64_t v109 = v142;
          sub_1000063BC(v26, v145, (uint64_t)v143, v102, v98, v104, v107);
          unint64_t v107 = v109;
          if (v109)
          {
            if (qword_100025550 == -1) {
              goto LABEL_53;
            }
            goto LABEL_75;
          }

          uint64_t v125 = *(void (**)(char *, uint64_t *))(v149 + 8);
          v125((char *)v143, v28);
          uint64_t v126 = v108;
LABEL_66:
          v125((char *)v126, v28);
          unint64_t v93 = *(uint64_t (**)(uint64_t, uint64_t))(v152 + 8);
          uint64_t v94 = v26;
          return v93(v94, v150);
        }
    }
  }

unint64_t sub_10000F2E4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    uint64_t v21 = 0LL;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }

  if ((a2 & 0x1000000000000000LL) == 0)
  {
    if ((a2 & 0x2000000000000000LL) == 0)
    {
      if ((a1 & 0x1000000000000000LL) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(a1, a2);
      }
      uint64_t v7 = sub_10000F7A8(v6, v4, 10LL);
      LODWORD(v8) = (_DWORD)v7;
      char v27 = BYTE4(v7) & 1;
      char v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }

    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    int v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            uint64_t v15 = v3 - 2;
            if (v15)
            {
              uint64_t v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_35;
                }
                uint64_t v18 = 10LL * v8;
                if ((v18 & 0xFFFFFFFF00000000LL) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v18 + v17;
                char v9 = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_38;
                }
              }
            }

            goto LABEL_37;
          }
        }

        goto LABEL_35;
      }
    }

    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            uint64_t v19 = v3 - 1;
            if (v19)
            {
              uint64_t v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                unsigned int v24 = *v23 - 48;
                if (v24 > 9) {
                  goto LABEL_35;
                }
                uint64_t v25 = 10LL * v8;
                if ((v25 & 0xFFFFFFFF00000000LL) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v25 + v24;
                char v9 = 0;
                ++v23;
                if (!--v19) {
                  goto LABEL_38;
                }
              }
            }

            goto LABEL_37;
          }
        }

        goto LABEL_35;
      }

      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          int v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            uint64_t v11 = v3 - 2;
            if (v11)
            {
              uint64_t v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  goto LABEL_35;
                }
                uint64_t v14 = 10LL * v8;
                if ((v14 & 0xFFFFFFFF00000000LL) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v14 - v13;
                char v9 = 0;
                ++v12;
                if (!--v11) {
                  goto LABEL_38;
                }
              }
            }

LABEL_37:
            char v9 = 0;
            goto LABEL_38;
          }

LABEL_53:
          char v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }

LABEL_35:
        LODWORD(v8) = 0;
        char v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease(a2);
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }

      __break(1u);
    }

    __break(1u);
    goto LABEL_53;
  }

  unint64_t v8 = sub_10000F6C4(a1, a2, 10LL);
  swift_bridgeObjectRelease(a2);
  uint64_t v20 = HIDWORD(v8) & 1;
LABEL_39:
  uint64_t v21 = v8;
  if ((_DWORD)v20) {
    uint64_t v21 = 0LL;
  }
  return v21 | ((unint64_t)v20 << 32);
}

char *sub_10000F540(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_1000080BC(&qword_100024B70);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000FF5C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_10000F64C(void *a1)
{
  unint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_10000F688(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000080BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000F6C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v4 = String.init<A>(_:)( &v14,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000LL) == 0)
  {
    if ((v5 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }

  uint64_t v6 = sub_10000FA28(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease(v7);
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }

LABEL_7:
  int64_t v12 = sub_10000F7A8(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12 | ((((unint64_t)v12 >> 32) & 1) << 32);
}

unsigned __int8 *sub_10000F7A8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }

        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }

        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }

              else
              {
                char v22 = -55;
              }
            }

            else
            {
              char v22 = -48;
            }

            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000LL) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }

          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }

        goto LABEL_71;
      }

LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }

  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }

        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }

        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }

              else
              {
                char v30 = -55;
              }
            }

            else
            {
              char v30 = -48;
            }

            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000LL) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }

          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }

        goto LABEL_71;
      }

      goto LABEL_72;
    }

    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }

        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }

        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }

              else
              {
                char v11 = -55;
              }
            }

            else
            {
              char v11 = -48;
            }

            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000LL) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }

LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }

      goto LABEL_72;
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000FA28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v2 = a1;
  }
  uint64_t v3 = 7LL;
  if (((a2 >> 60) & ((a1 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v3 = 11LL;
  }
  unint64_t v4 = String.subscript.getter(15LL, v3 | (v2 << 16), a1, a2);
  unint64_t v6 = v5;
  uint64_t v9 = sub_10000FAA4(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10000FAA4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = a3;
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v12 = sub_10000FBE8(a1, a2, a3, a4);
    if (v12)
    {
      uint64_t v9 = v12;
      unint64_t v8 = (unint64_t)sub_100008B38(v12, 0LL);
      unint64_t v5 = sub_10000FCD4((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      uint64_t v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }

    else
    {
      unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }

    uint64_t v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(void *)(v8 + 16));
    swift_release(v8);
    return v14;
  }

  else
  {
    unint64_t v8 = a1 >> 16;
    uint64_t v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000LL) == 0)
    {
      if ((a3 & 0x1000000000000000LL) != 0)
      {
        uint64_t v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }

LABEL_11:
      uint64_t v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10) {
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
      goto LABEL_5;
    }

    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }

unint64_t sub_10000FBE8( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((result & 0xC) == 4LL << v8)
  {
    uint64_t result = sub_10000FEE4(result, a3, a4);
    unint64_t v7 = result;
  }

  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_10000FEE4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000LL) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }

  else if ((a4 & 0x1000000000000000LL) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }

  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }

  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }

  __break(1u);
  return result;
}

unint64_t sub_10000FCD4( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0LL;
    goto LABEL_33;
  }

  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    void v9[3] = a7;
    v9[4] = v12;
    return v11;
  }

  uint64_t v11 = 0LL;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000LL) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4LL << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10000FEE4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000LL) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000LL) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter(a6, a7);
        }
        char v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000LL) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }

    uint64_t result = sub_10000FEE4(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }

    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000FEE4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  unint64_t v6 = a1 >> 16;
  uint64_t v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v13 = String.UTF16View.index(_:offsetBy:)(15LL, v6, a2);
    uint64_t v14 = v13 + (v7 << 16);
    unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v16 = v14 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v16 = v15;
    }
    return v16 | 4;
  }

  else
  {
    uint64_t v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15LL, v6);
    uint64_t v9 = v8 + (v7 << 16);
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v11 = v9 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v11 = v10;
    }
    return v11 | 8;
  }

uint64_t sub_10000FF5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

id sub_10001004C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6, void *a7, int a8)
{
  int v46 = a5;
  int v47 = a8;
  v50._countAndFlagsBits = a6;
  v50._object = a7;
  v49._countAndFlagsBits = a3;
  v49._object = a4;
  uint64_t v48 = a1;
  uint64_t v9 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_1000080BC((uint64_t *)&unk_100024F60);
  __chkstk_darwin(v13);
  unint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v20 = [objc_allocWithZone(NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1LL, 1LL, v16);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))( v12,  enum case for URL.DirectoryHint.inferFromPath(_:),  v9);
  URL.init(filePath:directoryHint:relativeTo:)(0x6E69622F7273752FLL, 0xEC0000006873732FLL, v12, v15);
  URL._bridgeToObjectiveC()(v21);
  unint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  [v20 setExecutableURL:v23];

  uint64_t v24 = sub_1000080BC(&qword_100024B70);
  uint64_t v25 = swift_allocObject(v24, 128LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_10001A930;
  *(void *)(v25 + 32) = 28461LL;
  *(void *)(v25 + 40) = 0xE200000000000000LL;
  *(void *)(v25 + 48) = 0xD000000000000018LL;
  *(void *)(v25 + 56) = 0x800000010001CE70LL;
  *(void *)(v25 + 64) = 21037LL;
  *(void *)(v25 + 72) = 0xE200000000000000LL;
  uint64_t v52 = 0LL;
  unint64_t v53 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(17LL);
  swift_bridgeObjectRelease(v53);
  uint64_t v52 = 0x3A5D313A3A5BLL;
  unint64_t v53 = 0xE600000000000000LL;
  LOWORD(v10) = v46;
  __int16 v51 = v46;
  v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt16,  &protocol witness table for UInt16);
  object = v26._object;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(object);
  v28._countAndFlagsBits = 0x3A5D313A3A5B3ALL;
  v28._object = (void *)0xE700000000000000LL;
  String.append(_:)(v28);
  __int16 v51 = v47;
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt16,  &protocol witness table for UInt16);
  char v30 = v29._object;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v30);
  unint64_t v31 = v53;
  *(void *)(v25 + 80) = v52;
  *(void *)(v25 + 88) = v31;
  *(void *)(v25 + 96) = v48;
  *(void *)(v25 + 104) = a2;
  uint64_t v52 = 0LL;
  unint64_t v53 = 0xE000000000000000LL;
  swift_bridgeObjectRetain(a2);
  _StringGuts.grow(_:)(57LL);
  v32._countAndFlagsBits = 0xD000000000000031LL;
  v32._object = (void *)0x800000010001CE90LL;
  String.append(_:)(v32);
  __int16 v51 = v10;
  v33._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt16,  &protocol witness table for UInt16);
  uint64_t v34 = v33._object;
  String.append(_:)(v33);
  swift_bridgeObjectRelease(v34);
  v35._countAndFlagsBits = 32LL;
  v35._object = (void *)0xE100000000000000LL;
  String.append(_:)(v35);
  String.append(_:)(v49);
  v36._countAndFlagsBits = 32LL;
  v36._object = (void *)0xE100000000000000LL;
  String.append(_:)(v36);
  String.append(_:)(v50);
  unint64_t v37 = v53;
  *(void *)(v25 + 112) = v52;
  *(void *)(v25 + 120) = v37;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  [v20 setArguments:isa];

  uint64_t v52 = 0LL;
  unsigned __int8 v39 = [v20 launchAndReturnError:&v52];
  uint64_t v40 = v52;
  if ((v39 & 1) != 0)
  {
    id v41 = (id)v52;
  }

  else
  {
    id v42 = (id)v52;
    _convertNSErrorToError(_:)(v40);

    swift_willThrow(v43);
  }

  return v20;
}

void sub_10001045C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v93 = a6;
  uint64_t v91 = a3;
  uint64_t v92 = a5;
  uint64_t v87 = a4;
  uint64_t v88 = a1;
  uint64_t v89 = a2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v84 = *(void *)(v6 - 8);
  uint64_t v85 = v6;
  __chkstk_darwin(v6);
  uint64_t v83 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v82 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  unint64_t v80 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(1024LL, &type metadata for Int8);
  *(void *)(v9 + 16) = 1024LL;
  uint64_t v90 = v9;
  uint64_t v10 = (char *)(v9 + 32);
  bzero((void *)(v9 + 32), 0x400uLL);
  uint32_t bufsize = 1024;
  if (_NSGetExecutablePath(v10, &bufsize) == -1)
  {
    swift_bridgeObjectRelease(v90);
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t v11 = String.init(cString:)(v10);
    uint64_t v13 = v12;
    uint64_t v14 = sub_1000080BC(&qword_1000249D0);
    uint64_t v15 = swift_allocObject(v14, 64LL, 7LL);
    __int128 v86 = xmmword_10001A650;
    *(_OWORD *)(v15 + 16) = xmmword_10001A650;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 32) = 0xD000000000000052LL;
    *(void *)(v15 + 40) = 0x800000010001CD90LL;
    ((void (*)(void))print(_:separator:terminator:))();
    swift_bridgeObjectRelease(v15);
    pid_t v16 = getpgrp();
    gid_t v17 = getegid();
    LODWORD(v15) = getuid();
    pid_t v18 = getpid();
    uint64_t v19 = sub_1000080BC(&qword_100024B70);
    uint64_t v20 = swift_allocObject(v19, 176LL, 7LL);
    *(_OWORD *)(v20 + 16) = xmmword_10001A940;
    *(void *)(v20 + 32) = v11;
    *(void *)(v20 + 40) = v13;
    *(void *)(v20 + 48) = 0xD000000000000015LL;
    *(void *)(v20 + 56) = 0x800000010001CCC0LL;
    LOWORD(aBlock) = NWEndpoint.Port.rawValue.getter();
    *(void *)(v20 + 64) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt16,  &protocol witness table for UInt16);
    *(void *)(v20 + 72) = v21;
    *(void *)(v20 + 80) = ((uint64_t (*)(void))IPv6Address.debugDescription.getter)();
    *(void *)(v20 + 88) = v22;
    *(void *)(v20 + 96) = ((uint64_t (*)(void))IPv6Address.debugDescription.getter)();
    *(void *)(v20 + 104) = v23;
    LODWORD(aBlock) = v15;
    *(void *)(v20 + 112) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt32,  &protocol witness table for UInt32);
    *(void *)(v20 + 120) = v24;
    LODWORD(aBlock) = v17;
    *(void *)(v20 + 128) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt32,  &protocol witness table for UInt32);
    *(void *)(v20 + 136) = v25;
    LODWORD(aBlock) = v18;
    *(void *)(v20 + 144) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    *(void *)(v20 + 152) = v26;
    LODWORD(aBlock) = v16;
    *(void *)(v20 + 160) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    *(void *)(v20 + 168) = v27;
    id v28 = v94;
    id v29 = sub_1000124C4();
    swift_bridgeObjectRelease(v20);
    if (v28)
    {
      swift_bridgeObjectRelease(v90);
      return;
    }

    uint64_t v78 = v14;
    uint64_t v79 = 0LL;
    id v94 = v29;
    uint64_t aBlock = 0LL;
    unint64_t v96 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(30LL);
    swift_bridgeObjectRelease(v96);
    uint64_t aBlock = 0x6D65722F706D742FLL;
    unint64_t v96 = 0xEF2E6C746365746FLL;
    pid_t v101 = v18;
    v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    object = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(object);
    v32._countAndFlagsBits = 0x2D7265706C65682ELL;
    v32._object = (void *)0xED00007964616572LL;
    String.append(_:)(v32);
    unint64_t v33 = v96;
    uint64_t v34 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
    id v35 = [v34 defaultManager];
    NSString v36 = String._bridgeToObjectiveC()();
    unsigned __int8 v37 = [v35 fileExistsAtPath:v36];

    if ((v37 & 1) != 0)
    {
LABEL_9:
      swift_bridgeObjectRelease(v90);
      id v43 = [v34 defaultManager];
      NSString v44 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v33);
      uint64_t aBlock = 0LL;
      unsigned int v45 = [v43 removeItemAtPath:v44 error:&aBlock];

      id v46 = (id)aBlock;
      if (v45)
      {
        uint64_t v47 = swift_allocObject(v78, 64LL, 7LL);
        *(_OWORD *)(v47 + 16) = v86;
        *(void *)(v47 + 56) = &type metadata for String;
        *(void *)(v47 + 32) = 0xD000000000000037LL;
        *(void *)(v47 + 40) = 0x800000010001CE10LL;
        id v48 = v46;
        print(_:separator:terminator:)(v47, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
        uint64_t v49 = swift_bridgeObjectRelease(v47);
        uint64_t v50 = IPv6Address.debugDescription.getter(v49);
        uint64_t v52 = v51;
        uint64_t v53 = NWEndpoint.Port.rawValue.getter();
        int v54 = v53;
        uint64_t v55 = IPv6Address.debugDescription.getter(v53);
        unint64_t v57 = v56;
        int v58 = NWEndpoint.Port.rawValue.getter();
        uint64_t v59 = v79;
        id v60 = sub_10001004C(v88, v89, v50, v52, v54, v55, v57, v58);
        if (!v59)
        {
          unint64_t v66 = v60;
          swift_bridgeObjectRelease(v52);
          uint64_t v67 = swift_bridgeObjectRelease(v57);
          uint64_t v68 = (void (__cdecl *)(int))SIG_IGN.getter(v67);
          signal(2, v68);
          sub_100007E24(0LL, (unint64_t *)&qword_100024D80, &OBJC_CLASS___OS_dispatch_source_ptr);
          sub_100007E24(0LL, (unint64_t *)&qword_1000249B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
          unint64_t v69 = (void *)static OS_dispatch_queue.main.getter();
          uint64_t v70 = static OS_dispatch_source.makeSignalSource(signal:queue:)(2LL, v69);

          uint64_t ObjectType = swift_getObjectType(v70);
          uint64_t v72 = swift_allocObject(&unk_100021628, 24LL, 7LL);
          *(void *)(v72 + 16) = v66;
          uint64_t v99 = sub_100010F10;
          uint64_t v100 = v72;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          unint64_t v96 = 1107296256LL;
          unint64_t v97 = sub_100007FE4;
          gid_t v98 = &unk_100021640;
          uint64_t v73 = _Block_copy(&aBlock);
          id v74 = v66;
          unint64_t v75 = v80;
          static DispatchQoS.unspecified.getter();
          Swift::String v76 = v83;
          sub_100008028();
          OS_dispatch_source.setEventHandler(qos:flags:handler:)(v75, v76, v73, ObjectType);
          _Block_release(v73);
          (*(void (**)(char *, uint64_t))(v84 + 8))(v76, v85);
          (*(void (**)(char *, uint64_t))(v81 + 8))(v75, v82);
          swift_release(v100);
          OS_dispatch_source.resume()();
          id v77 = v94;
          [v94 waitUntilExit];

          swift_unknownObjectRelease(v70);
          return;
        }

        swift_bridgeObjectRelease(v52);
        swift_bridgeObjectRelease(v57);
      }

      else
      {
        id v64 = (id)aBlock;
        _convertNSErrorToError(_:)(v46);

        swift_willThrow(v65);
      }
    }

    else
    {
      uint64_t v38 = 62LL;
      while (1)
      {
        --v38;
        id v39 = v94;
        sleep(1u);
        id v40 = [v34 defaultManager];
        NSString v41 = String._bridgeToObjectiveC()();
        unsigned int v42 = [v40 fileExistsAtPath:v41];

        if (v42) {
          goto LABEL_9;
        }
      }

      swift_bridgeObjectRelease(v90);
      swift_bridgeObjectRelease(v33);
      unint64_t v61 = sub_100008268();
      uint64_t v62 = swift_allocError(&type metadata for String, v61, 0LL, 0LL);
      void *v63 = 0xD00000000000001ALL;
      v63[1] = 0x800000010001CDF0LL;
      swift_willThrow(v62);
    }
  }

uint64_t sub_100010CB4(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000080BC(&qword_1000249D0);
  uint64_t v7 = swift_allocObject(v6, 64LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_10001A650;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 32) = 0xD000000000000012LL;
  *(void *)(v7 + 40) = 0x800000010001CE50LL;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease(v7);
  uint64_t result = kill((pid_t)[a1 processIdentifier], 9);
  if ((_DWORD)result)
  {
    uint64_t v9 = sub_10000C778();
    uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v13 = 138412290;
      int v15 = errno.getter();
      unint64_t v16 = sub_100008D40();
      uint64_t v17 = swift_allocError(&type metadata for Errno, v16, 0LL, 0LL);
      _DWORD *v18 = v15;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError(v17);
      uint64_t v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 4, v13 + 12);
      uint64_t *v14 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to shut down SSH: %@", v13, 0xCu);
      uint64_t v20 = sub_1000080BC(&qword_100024D90);
      swift_arrayDestroy(v14, 1LL, v20);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return result;
}

uint64_t sub_100010EEC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100010F10()
{
  return sub_100010CB4(*(void **)(v0 + 16));
}

uint64_t sub_100010F18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010F28(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_100010F30()
{
  unint64_t result = qword_100024A38;
  if (!qword_100024A38)
  {
    uint64_t v1 = sub_100009140(&qword_100024A30);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100024A38);
  }

  return result;
}

uint64_t sub_100010F7C()
{
  return 10LL;
}

uint64_t sub_100010F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = a3;
  uint64_t v37 = a4;
  uint64_t v45 = a2;
  uint64_t v46 = a1;
  uint64_t v34 = type metadata accessor for IPv6Address(0LL);
  uint64_t v44 = *(void *)(v34 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v36 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  id v35 = (char *)&v33 - v8;
  uint64_t v9 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for NWEndpoint.Host(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for NWProtocolTCP.Options(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = NWProtocolTCP.Options.init()();
  dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter(1LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter(2LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter(2LL);
  dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter(2LL);
  dispatch thunk of NWProtocolTCP.Options.connectionTimeout.setter(a5);
  type metadata accessor for NWConnection(0LL);
  uint64_t v40 = v14;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v20 = v34;
  uint64_t v42 = v13;
  v19(v16, v46, v13);
  uint64_t v41 = v10;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v43 = v9;
  v21(v12, v45, v9);
  type metadata accessor for NWParameters(0LL);
  swift_retain(v18);
  uint64_t v22 = NWParameters.__allocating_init(tls:tcp:)(0LL, v18);
  uint64_t v23 = v16;
  uint64_t v25 = v37;
  uint64_t v24 = v38;
  uint64_t v26 = NWConnection.__allocating_init(host:port:using:)(v23, v12, v22);
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
  id v28 = v35;
  v27(v35, v24, v20);
  id v29 = v36;
  v27(v36, v25, v20);
  uint64_t v30 = (*(uint64_t (**)(uint64_t, char *, char *))(v39 + 152))(v26, v28, v29);
  swift_release(v18);
  unint64_t v31 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v31(v25, v20);
  v31(v24, v20);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v45, v43);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v46, v42);
  return v30;
}

uint64_t sub_100011228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  sub_10001128C(a1, a2, a3);
  return v7;
}

uint64_t sub_10001128C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v60 = a3;
  uint64_t v4 = v3;
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  __chkstk_darwin(v5);
  __int16 v51 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v57 = type metadata accessor for IPv6Address(0LL);
  uint64_t v66 = *(void *)(v57 - 8);
  uint64_t v7 = __chkstk_darwin(v57);
  uint64_t v59 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  int v58 = (char *)&v50 - v9;
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  __chkstk_darwin(v10);
  os_log_type_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v3 + 32) = 0LL;
  unint64_t v54 = sub_100009668();
  id v64 = 0LL;
  unint64_t v65 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(24LL);
  unint64_t v19 = v65;
  uint64_t v20 = (uint64_t *)sub_10000C3B8();
  uint64_t v21 = (void *)*v20;
  unint64_t v22 = v20[1];
  uint64_t v50 = v20;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v19);
  id v64 = v21;
  unint64_t v65 = v22;
  v23._countAndFlagsBits = 0xD000000000000016LL;
  v23._object = (void *)0x800000010001CF20LL;
  String.append(_:)(v23);
  uint64_t v25 = v64;
  unint64_t v24 = v65;
  static DispatchQoS.unspecified.getter(v26);
  id v64 = &_swiftEmptyArrayStorage;
  uint64_t v27 = sub_1000090B4( &qword_100024A28,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v28 = sub_1000080BC(&qword_100024A30);
  unint64_t v29 = sub_100010F30();
  uint64_t v30 = v13;
  uint64_t v31 = v57;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v64, v28, v29, v30, v27);
  (*(void (**)(char *, void, uint64_t))(v55 + 104))( v12,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v56);
  Swift::String v32 = v15;
  uint64_t v33 = v60;
  uint64_t v34 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v25, v24, v18, v32, v12, 0LL);
  *(void *)(v4 + 40) = v34;
  uint64_t v35 = OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelClient_exitSemaphore;
  *(void *)(v4 + v35) = dispatch_semaphore_create(0LL);
  type metadata accessor for UtunSocket(0LL);
  NSString v36 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
  uint64_t v37 = (uint64_t)v58;
  v36(v58, v63, v31);
  uint64_t v38 = (uint64_t)v59;
  v36(v59, v33, v31);
  id v39 = v34;
  uint64_t v40 = v61;
  uint64_t v41 = sub_10001565C(v39, v37, v38);
  if (v40)
  {
    swift_release(v62);
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v42(v33, v31);
    v42(v63, v31);
    swift_release(*(void *)(v4 + 32));

    uint64_t v43 = type metadata accessor for TCPPacketTunnelClient(0LL);
    swift_deallocPartialClassInstance( v4,  v43,  *(unsigned int *)(*(void *)v4 + 48LL),  *(unsigned __int16 *)(*(void *)v4 + 52LL));
  }

  else
  {
    uint64_t v44 = v62;
    *(void *)(v4 + 16) = v41;
    *(void *)(v4 + 24) = v44;
    uint64_t v46 = *v50;
    uint64_t v45 = v50[1];
    swift_retain(v44);
    swift_bridgeObjectRetain(v45);
    uint64_t v47 = v51;
    Logger.init(subsystem:category:)(v46, v45, 0xD000000000000015LL, 0x800000010001A930LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v52 + 32))( v4 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelClient_logger,  v47,  v53);
    swift_retain(v4);
    sub_10000A8A4((uint64_t)sub_100011718, v4);
    NWConnection.stateUpdateHandler.setter(sub_100011718, v4);
    swift_release(v44);
    id v48 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v48(v33, v31);
    v48(v63, v31);
    swift_release(v4);
  }

  return v4;
}

uint64_t type metadata accessor for TCPPacketTunnelClient(uint64_t a1)
{
  uint64_t result = qword_100025570;
  if (!qword_100025570) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TCPPacketTunnelClient);
  }
  return result;
}

uint64_t sub_10001171C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v11 = v10((char *)&v28 - v8, a1, v3);
  os_log_type_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc(12LL, -1LL);
    uint64_t v31 = v1;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    unint64_t v29 = v10;
    uint64_t v17 = v16;
    uint64_t v33 = v16;
    uint64_t v30 = a1;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v28 = v15 + 4;
    uint64_t v18 = sub_1000090B4( &qword_100024B58,  (uint64_t (*)(uint64_t))&type metadata accessor for NWConnection.State,  (uint64_t)&protocol conformance descriptor for NWConnection.State);
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter(v3, v18);
    unint64_t v21 = v20;
    uint64_t v32 = sub_1000086A8(v19, v20, &v33);
    a1 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v28, v15 + 12);
    swift_bridgeObjectRelease(v21);
    unint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v9, v3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "NWConnection in state %s", v15, 0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v23 = v17;
    uint64_t v10 = v29;
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {

    unint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v9, v3);
  }

  v10(v7, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if ((_DWORD)result == enum case for NWConnection.State.waiting(_:)
    || (_DWORD)result == enum case for NWConnection.State.failed(_:))
  {
    v22(v7, v3);
    return sub_100011FC4();
  }

  if ((_DWORD)result != enum case for NWConnection.State.setup(_:)
    && (_DWORD)result != enum case for NWConnection.State.preparing(_:)
    && (_DWORD)result != enum case for NWConnection.State.ready(_:))
  {
    if ((_DWORD)result != enum case for NWConnection.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v22)(v7, v3);
    }
    return sub_100011FC4();
  }

  return result;
}

void sub_1000119E8()
{
}

void sub_100011A10()
{
}

uint64_t sub_100011A30()
{
  uint64_t v2 = v0;
  type metadata accessor for TCPPacketTunnel(0LL);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_retain(v3);
  swift_retain(v4);
  uint64_t v5 = sub_100012768(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(*(void *)v4 + 240LL);
  swift_retain(v5);
  uint64_t v7 = v6(sub_100011B3C, v5);
  uint64_t v9 = v8;
  swift_release(v5);
  if (v1)
  {
    uint64_t v10 = v5;
  }

  else
  {
    sub_100009220(v7, v9);
    swift_bridgeObjectRelease(v9);
    uint64_t v12 = NWConnection.start(queue:)(*(void *)(v2 + 40));
    (*(void (**)(uint64_t))(*(void *)v5 + 128LL))(v12);
    uint64_t v10 = *(void *)(v2 + 32);
    *(void *)(v2 + 32) = v5;
  }

  return swift_release(v10);
}

uint64_t sub_100011B3C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t sub_100011B48()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v43 - v8;
  NWConnection.state.getter(v7);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v9, v2);
  BOOL v12 = v10 == enum case for NWConnection.State.setup(_:)
     || v10 == enum case for NWConnection.State.preparing(_:)
     || v10 == enum case for NWConnection.State.ready(_:);
  p_prots = &OBJC_PROTOCOL___NSObject.prots;
  if (v12)
  {
    uint64_t v14 = swift_retain_n(v0, 2LL);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = swift_slowAlloc(32LL, -1LL);
      uint64_t v45 = v18;
      uint64_t v46 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v44 = v17 + 4;
      NWConnection.state.getter(v18);
      uint64_t v19 = sub_1000090B4( &qword_100024B58,  (uint64_t (*)(uint64_t))&type metadata accessor for NWConnection.State,  (uint64_t)&protocol conformance descriptor for NWConnection.State);
      uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v2, v19);
      unint64_t v22 = v21;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      uint64_t v48 = sub_1000086A8(v20, v22, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v44, v17 + 12);
      swift_release_n(v1, 2LL);
      swift_bridgeObjectRelease(v22);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "NWConnection in state %s at deinit", v17, 0xCu);
      uint64_t v23 = v45;
      swift_arrayDestroy(v45, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      unint64_t v24 = v17;
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {

      uint64_t v25 = swift_release_n(v0, 2LL);
    }
  }

  else
  {
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }

  (*(void (**)(uint64_t))(**(void **)(v1 + 16) + 152LL))(v25);
  if (v26)
  {
    swift_bridgeObjectRelease(v26);
    uint64_t v27 = swift_retain_n(v1, 2LL);
    uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
    os_log_type_t v29 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v31 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v48 = v31;
      uint64_t v32 = (*(uint64_t (**)(void))(**(void **)(v1 + 16) + 152LL))();
      uint64_t v34 = v33;
      uint64_t v46 = v32;
      uint64_t v47 = v33;
      unint64_t v35 = sub_1000123E4();
      uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UtunSocket.State, v35);
      unint64_t v38 = v37;
      swift_bridgeObjectRelease(v34);
      uint64_t v46 = sub_1000086A8(v36, v38, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v30 + 4, v30 + 12);
      swift_release_n(v1, 2LL);
      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Utun in state %s at deinit, not disconnected.", v30, 0xCu);
      swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v39 = v31;
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
      swift_slowDealloc(v39, -1LL, -1LL);
      swift_slowDealloc(v30, -1LL, -1LL);
    }

    else
    {

      swift_release_n(v1, 2LL);
    }
  }

  swift_release(*(void *)(v1 + 16));
  swift_release(*(void *)(v1 + 24));
  swift_release(*(void *)(v1 + 32));

  uint64_t v40 = (char *)p_prots[173] + v1;
  uint64_t v41 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v41 - 8) + 8LL))(v40, v41);

  return v1;
}

uint64_t sub_100011FA0()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

Swift::Int sub_100011FC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NWConnection.state.getter(v4);
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if ((_DWORD)v7 == enum case for NWConnection.State.waiting(_:)
    || (_DWORD)v7 == enum case for NWConnection.State.failed(_:))
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_10;
  }

  if ((_DWORD)v7 != enum case for NWConnection.State.cancelled(_:))
  {
    uint64_t v9 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v10 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Shutting down utun before NWConnection is shut down", v11, 2u);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    goto LABEL_9;
  }

LABEL_10:
  uint64_t v12 = sub_1000092F8();
  (*(void (**)(uint64_t))(**(void **)(v1 + 16) + 272LL))(v12);
  return OS_dispatch_semaphore.signal()();
}

unint64_t sub_1000123E4()
{
  unint64_t result = qword_100024B78;
  if (!qword_100024B78)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001AAA8, &type metadata for UtunSocket.State);
    atomic_store(result, (unint64_t *)&qword_100024B78);
  }

  return result;
}

uint64_t sub_100012428()
{
  return type metadata accessor for TCPPacketTunnelClient(0LL);
}

uint64_t sub_100012430(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = &unk_10001A988;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

id sub_1000124C4()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = [objc_allocWithZone(NSTask) init];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setLaunchPath:v6];

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v5 setArguments:isa];

  [v5 launch];
  pid_t v8 = getpgid((pid_t)[v5 processIdentifier]);
  if (tcsetpgrp(0, v8))
  {
    uint64_t v9 = sub_10000C778();
    uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v27 = v0;
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = swift_slowAlloc(8LL, -1LL);
      uint64_t v26 = v1;
      uint64_t v15 = (void *)v14;
      *(_DWORD *)os_log_type_t v13 = 138412290;
      uint64_t v25 = v13 + 4;
      int v16 = errno.getter();
      unint64_t v17 = sub_100008D40();
      uint64_t v18 = swift_allocError(&type metadata for Errno, v17, 0LL, 0LL);
      _DWORD *v19 = v16;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError(v18);
      uint64_t v28 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v25, v13 + 12);
      *uint64_t v15 = v20;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to set sudo process to foreground: %@", v13, 0xCu);
      uint64_t v21 = sub_1000080BC(&qword_100024D90);
      swift_arrayDestroy(v15, 1LL, v21);
      unint64_t v22 = v15;
      uint64_t v1 = v26;
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }

  kill((pid_t)[v5 processIdentifier], 19);
  return v5;
}

uint64_t sub_100012768(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  sub_1000127B4(a1, a2);
  return v5;
}

void *sub_1000127B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v36 = a2;
  uint64_t v37 = a1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  unint64_t v35 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  __chkstk_darwin(v6);
  pid_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v32 = sub_100009668();
  uint64_t v40 = 0LL;
  unint64_t v41 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(18LL);
  unint64_t v15 = v41;
  int v16 = (void **)sub_10000C3B8();
  unint64_t v17 = *v16;
  unint64_t v18 = (unint64_t)v16[1];
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v15);
  uint64_t v40 = v17;
  unint64_t v41 = v18;
  v19._object = (void *)0x800000010001CFA0LL;
  v19._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v19);
  uint64_t v21 = v40;
  unint64_t v20 = v41;
  static DispatchQoS.unspecified.getter(v22);
  uint64_t v40 = &_swiftEmptyArrayStorage;
  uint64_t v23 = sub_1000090B4( &qword_100024A28,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v24 = sub_1000080BC(&qword_100024A30);
  unint64_t v25 = sub_100010F30();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v40, v24, v25, v9, v23);
  (*(void (**)(char *, void, uint64_t))(v33 + 104))( v8,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v34);
  v3[4] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v21, v20, v14, v11, v8, 0LL);
  uint64_t v26 = OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_exitSemaphore;
  *(void *)((char *)v3 + v26) = dispatch_semaphore_create(0LL);
  uint64_t v27 = v37;
  v3[2] = v36;
  v3[3] = v27;
  uint64_t v28 = *v16;
  uint64_t v29 = v16[1];
  swift_bridgeObjectRetain(v29);
  uint64_t v30 = v35;
  Logger.init(subsystem:category:)(v28, v29, 0x656B636150504354LL, 0xEF6C656E6E755474LL);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))( (uint64_t)v3 + OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_logger,  v30,  v39);
  return v3;
}

uint64_t sub_100012A70()
{
  return swift_release(v0);
}

void sub_100012AB4(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
}

void sub_100012AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NWConnection.SendCompletion(0LL);
  __chkstk_darwin(v3);
  __asm { BR              X11 }

uint64_t sub_100012B50()
{
  *(_WORD *)(v5 - 90) = bswap32(BYTE6(v1)) >> 16;
  uint64_t v6 = sub_1000136E4((_BYTE *)(v5 - 90), (_BYTE *)(v5 - 88));
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFLL;
  *(void *)(v5 - 128) = *(void *)(v0 + 24);
  *uint64_t v3 = sub_1000137A4;
  v3[1] = (uint64_t (*)(uint64_t))v0;
  uint64_t v9 = enum case for NWConnection.SendCompletion.contentProcessed(_:);
  uint64_t v10 = *(void (**)(uint64_t (**)(uint64_t), uint64_t, uint64_t))(v2 + 104);
  *(void *)(v5 - 112) = v10;
  v10(v3, v9, v4);
  ((void (*)(void))type metadata accessor for NWConnection.ContentContext)(0LL);
  *(void *)(v5 - 136) = v2;
  sub_1000137C4(v6, v8);
  uint64_t v11 = swift_retain(v0);
  *(void *)(v5 - 120) = v1;
  uint64_t v12 = ((uint64_t (*)(uint64_t))static NWConnection.ContentContext.defaultMessage.getter)(v11);
  ((void (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t (**)(uint64_t)))NWConnection.send(content:contentContext:isComplete:completion:))( v6,  v8,  v12,  1LL,  v3);
  swift_release(v12);
  sub_100008CFC(v6, v8);
  uint64_t v13 = v4;
  uint64_t v14 = *(void (**)(uint64_t (**)(uint64_t), uint64_t))(*(void *)(v5 - 136) + 8LL);
  v14(v3, v13);
  *uint64_t v3 = sub_100013808;
  v3[1] = (uint64_t (*)(uint64_t))v0;
  (*(void (**)(uint64_t (**)(uint64_t), uint64_t, uint64_t))(v5 - 112))(v3, v9, v13);
  uint64_t v15 = swift_retain(v0);
  uint64_t v16 = ((uint64_t (*)(uint64_t))static NWConnection.ContentContext.defaultMessage.getter)(v15);
  ((void (*)(void, void, uint64_t, uint64_t, uint64_t (**)(uint64_t)))NWConnection.send(content:contentContext:isComplete:completion:))( *(void *)(v5 - 104),  *(void *)(v5 - 120),  v16,  1LL,  v3);
  swift_release(v16);
  sub_100008CFC(v6, v8);
  return ((uint64_t (*)(uint64_t (**)(uint64_t), uint64_t))v14)(v3, v13);
}

uint64_t sub_100012DB8(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = sub_1000080BC(&qword_100024D58);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for NWError(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v29 - v14;
  sub_1000138F8(a1, (uint64_t)v8);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  unint64_t v17 = *(uint64_t (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v18 = v17(v13, v15, v9);
  Swift::String v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v32 = a3;
    uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v31 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v33 = a2;
    *(_DWORD *)uint64_t v21 = 138412290;
    uint64_t v30 = v21 + 4;
    uint64_t v22 = sub_1000090B4( (unint64_t *)&unk_100024D60,  (uint64_t (*)(uint64_t))&type metadata accessor for NWError,  (uint64_t)&protocol conformance descriptor for NWError);
    uint64_t v23 = swift_allocError(v9, v22, 0LL, 0LL);
    v17(v24, v13, v9);
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError(v23);
    uint64_t v34 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v30, v21 + 12);
    uint64_t v26 = v31;
    *uint64_t v31 = v25;
    uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
    v27(v13, v9);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v32, v21, 0xCu);
    uint64_t v28 = sub_1000080BC(&qword_100024D90);
    swift_arrayDestroy(v26, 1LL, v28);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {

    uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
    v27(v13, v9);
  }

  NWConnection.cancel()();
  return ((uint64_t (*)(char *, uint64_t))v27)(v15, v9);
}

uint64_t sub_100013074()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

void sub_1000130EC(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_1000080BC(&qword_100024D58);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for NWError(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  unint64_t v17 = (char *)&v38 - v16;
  if ((a3 & 1) != 0)
  {
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "TCP connection closed when reading header", v20, 2u);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    NWConnection.cancel()();
  }

  else
  {
    sub_1000138F8(a4, (uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10) == 1)
    {
      uint64_t v21 = sub_100013940((uint64_t)v9);
      if (a2 >> 60 != 15) {
        __asm { BR              X9 }
      }

      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
      os_log_type_t v23 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "No error on connection, but Data was nil when reading header",  v24,  2u);
        swift_slowDealloc(v24, -1LL, -1LL);
      }
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v17, v9, v10);
      uint64_t v25 = *(uint64_t (**)(char *, char *, uint64_t))(v11 + 16);
      uint64_t v26 = v25(v14, v17, v10);
      uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v40 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        unint64_t v41 = v29;
        *(_DWORD *)uint64_t v29 = 138412290;
        uint64_t v39 = v29 + 4;
        uint64_t v30 = sub_1000090B4( (unint64_t *)&unk_100024D60,  (uint64_t (*)(uint64_t))&type metadata accessor for NWError,  (uint64_t)&protocol conformance descriptor for NWError);
        uint64_t v31 = swift_allocError(v10, v30, 0LL, 0LL);
        v25(v32, v14, v10);
        uint64_t v33 = _swift_stdlib_bridgeErrorToNSError(v31);
        uint64_t v42 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v39, v29 + 12);
        uint64_t v34 = v40;
        *uint64_t v40 = v33;
        uint64_t v35 = *(void (**)(char *, uint64_t))(v11 + 8);
        v35(v14, v10);
        uint64_t v36 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "TCP connection error %@ when reading header, shutting down...",  v41,  0xCu);
        uint64_t v37 = sub_1000080BC(&qword_100024D90);
        swift_arrayDestroy(v34, 1LL, v37);
        swift_slowDealloc(v34, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {

        uint64_t v35 = *(void (**)(char *, uint64_t))(v11 + 8);
        v35(v14, v10);
      }

      NWConnection.cancel()();
      v35(v17, v10);
    }
  }

uint64_t sub_1000136E4(_BYTE *__src, _BYTE *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1000137A4(uint64_t a1)
{
  return sub_100012DB8(a1, v1, "Failed to send message header %@. Shutting down connection.");
}

uint64_t sub_1000137C4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100013808(uint64_t a1)
{
  return sub_100012DB8(a1, v1, "Failed to send message %@. Shutting down connection.");
}

uint64_t sub_100013828()
{
  return type metadata accessor for TCPPacketTunnel(0LL);
}

uint64_t type metadata accessor for TCPPacketTunnel(uint64_t a1)
{
  uint64_t result = qword_100025590;
  if (!qword_100025590) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TCPPacketTunnel);
  }
  return result;
}

uint64_t sub_10001386C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000138F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000080BC(&qword_100024D58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013940(uint64_t a1)
{
  uint64_t v2 = sub_1000080BC(&qword_100024D58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_100013980(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
}

void sub_10001398C(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_1000080BC(&qword_100024D58);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for NWError(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v15);
  os_log_type_t v20 = (char *)&v41 - v19;
  if ((a3 & 1) != 0)
  {
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "TCP connection closed when reading message", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    NWConnection.cancel()();
  }

  else
  {
    sub_1000138F8(a4, (uint64_t)v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
    {
      uint64_t v24 = sub_100013940((uint64_t)v12);
      if (a2 >> 60 == 15)
      {
        uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
        os_log_type_t v26 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "No error on connection, but Data was nil when reading header",  v27,  2u);
          swift_slowDealloc(v27, -1LL, -1LL);
        }
      }

      else
      {
        uint64_t v40 = *(void (**)(uint64_t, unint64_t))(**(void **)(v5 + 16) + 264LL);
        sub_1000137C4(a1, a2);
        v40(a1, a2);
        swift_retain(v5);
        NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)(2LL, 2LL, sub_100013DBC, v5);
        swift_release(v5);
        sub_100008CE8(a1, a2);
      }
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v20, v12, v13);
      os_log_type_t v28 = *(uint64_t (**)(char *, char *, uint64_t))(v14 + 16);
      uint64_t v29 = v28(v17, v20, v13);
      uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
      os_log_type_t v31 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v43 = v5;
        unint64_t v32 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v42 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)unint64_t v32 = 138412290;
        unint64_t v41 = v32 + 4;
        uint64_t v33 = sub_1000090B4( (unint64_t *)&unk_100024D60,  (uint64_t (*)(uint64_t))&type metadata accessor for NWError,  (uint64_t)&protocol conformance descriptor for NWError);
        uint64_t v34 = swift_allocError(v13, v33, 0LL, 0LL);
        v28(v35, v17, v13);
        uint64_t v36 = _swift_stdlib_bridgeErrorToNSError(v34);
        uint64_t v44 = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v41, v32 + 12);
        uint64_t v37 = v42;
        uint64_t *v42 = v36;
        uint64_t v38 = *(void (**)(char *, uint64_t))(v14 + 8);
        v38(v17, v13);
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "TCP connection error %@ when reading message, shutting down...",  v32,  0xCu);
        uint64_t v39 = sub_1000080BC(&qword_100024D90);
        swift_arrayDestroy(v37, 1LL, v39);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v32, -1LL, -1LL);
      }

      else
      {

        uint64_t v38 = *(void (**)(char *, uint64_t))(v14 + 8);
        v38(v17, v13);
      }

      NWConnection.cancel()();
      v38(v20, v13);
    }
  }

uint64_t sub_100013DC0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, os_log_s *a5)
{
  os_log_t v158 = a5;
  uint64_t v159 = a4;
  uint64_t v160 = a3;
  uint64_t v155 = a1;
  unint64_t v156 = a2;
  uint64_t v5 = type metadata accessor for NWEndpoint.Host(0LL);
  __chkstk_darwin(v5);
  os_log_t v145 = &v132[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = type metadata accessor for IPv6Address(0LL);
  uint64_t v157 = *(void **)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v136 = &v132[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = __chkstk_darwin(v8);
  v141 = &v132[-v11];
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v150 = &v132[-v13];
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v149 = &v132[-v15];
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = &v132[-v17];
  __chkstk_darwin(v16);
  uint64_t v146 = &v132[-v19];
  uint64_t v20 = type metadata accessor for NWEndpoint.Port(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  unint64_t v135 = &v132[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v147 = &v132[-v25];
  __chkstk_darwin(v24);
  uint64_t v27 = &v132[-v26];
  uint64_t v28 = type metadata accessor for Logger(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = __chkstk_darwin(v28);
  unint64_t v32 = &v132[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v33 = __chkstk_darwin(v30);
  unint64_t v137 = &v132[-v34];
  __chkstk_darwin(v33);
  uint64_t v36 = &v132[-v35];
  uint64_t v37 = sub_10000C778();
  uint64_t v152 = v29;
  uint64_t v38 = *(void (**)(void))(v29 + 16);
  uint64_t v139 = v37;
  uint64_t v154 = v28;
  uint64_t v39 = v146;
  uint64_t v140 = (void (*)(_BYTE *, uint64_t, uint64_t))v38;
  v38(v36);
  uint64_t v142 = v21;
  uint64_t v40 = *(void (**)(void))(v21 + 16);
  unint64_t v41 = v27;
  uint64_t v161 = v20;
  unint64_t v153 = v40;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v40)(v27, v160, v20);
  unint64_t v42 = v156;
  uint64_t v43 = (void (*)(_BYTE *, os_log_t, uint64_t))v157[2];
  v43(v39, (os_log_t)v159, v7);
  Class v144 = v18;
  uint64_t v44 = v7;
  v43(v18, v158, v7);
  uint64_t v45 = swift_bridgeObjectRetain_n(v42, 2LL);
  unint64_t v143 = v36;
  uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v47 = static os_log_type_t.info.getter();
  int v48 = v47;
  BOOL v49 = os_log_type_enabled(v46, v47);
  uint64_t v138 = v32;
  uint64_t v148 = v43;
  if (v49)
  {
    uint64_t v50 = swift_slowAlloc(42LL, -1LL);
    os_log_t v134 = v46;
    uint64_t v51 = v50;
    uint64_t v52 = swift_slowAlloc(128LL, -1LL);
    uint64_t v164 = v52;
    *(_DWORD *)uint64_t v51 = 136315906;
    int v133 = v48;
    swift_bridgeObjectRetain(v42);
    uint64_t v162 = sub_1000086A8(v155, v42, &v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v51 + 4, v51 + 12);
    uint64_t v53 = swift_bridgeObjectRelease_n(v42, 3LL);
    *(_WORD *)(v51 + 12) = 2080;
    uint64_t v54 = NWEndpoint.Port.debugDescription.getter(v53);
    unint64_t v56 = v55;
    uint64_t v162 = sub_1000086A8(v54, v55, &v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v51 + 14, v51 + 22);
    swift_bridgeObjectRelease(v56);
    uint64_t v142 = *(void *)(v142 + 8);
    uint64_t v57 = ((uint64_t (*)(_BYTE *, uint64_t))v142)(v41, v161);
    *(_WORD *)(v51 + 22) = 2080;
    uint64_t v58 = IPv6Address.debugDescription.getter(v57);
    unint64_t v60 = v59;
    uint64_t v162 = sub_1000086A8(v58, v59, &v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v51 + 24, v51 + 32);
    swift_bridgeObjectRelease(v60);
    uint64_t v61 = v39;
    uint64_t v62 = (_BYTE *)v157[1];
    uint64_t v63 = ((uint64_t (*)(_BYTE *, uint64_t))v62)(v61, v44);
    *(_WORD *)(v51 + 32) = 2080;
    id v64 = v144;
    uint64_t v65 = IPv6Address.debugDescription.getter(v63);
    unint64_t v67 = v66;
    uint64_t v162 = sub_1000086A8(v65, v66, &v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v51 + 34, v51 + 42);
    swift_bridgeObjectRelease(v67);
    uint64_t v146 = v62;
    ((void (*)(_BYTE *, uint64_t))v62)(v64, v44);
    os_log_t v68 = v134;
    _os_log_impl( (void *)&_mh_execute_header,  v134,  (os_log_type_t)v133,  "SSH tunnel callback started. Connecting to %s:%s and creating a utun from %s -> %s",  (uint8_t *)v51,  0x2Au);
    swift_arrayDestroy(v52, 4LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v52, -1LL, -1LL);
    swift_slowDealloc(v51, -1LL, -1LL);

    uint64_t v157 = *(void **)(v152 + 8);
    ((void (*)(_BYTE *, uint64_t))v157)(v143, v154);
    uint64_t v69 = v44;
    unint64_t v70 = v156;
  }

  else
  {
    swift_bridgeObjectRelease_n(v42, 2LL);
    uint64_t v142 = *(void *)(v142 + 8);
    ((void (*)(_BYTE *, uint64_t))v142)(v41, v161);
    uint64_t v71 = (_BYTE *)v157[1];
    uint64_t v69 = v7;
    ((void (*)(_BYTE *, uint64_t))v71)(v39, v7);
    uint64_t v146 = v71;
    ((void (*)(_BYTE *, uint64_t))v71)(v144, v7);

    uint64_t v157 = *(void **)(v152 + 8);
    ((void (*)(_BYTE *, uint64_t))v157)(v143, v154);
    unint64_t v70 = v42;
  }

  uint64_t v72 = v155;
  os_log_t v73 = v158;
  uint64_t v74 = v160;
  uint64_t v75 = (uint64_t)v145;
  Swift::String v76 = v153;
  type metadata accessor for TCPPacketTunnelClient(0LL);
  swift_bridgeObjectRetain(v70);
  NWEndpoint.Host.init(_:)(v72, v70);
  uint64_t v77 = (uint64_t)v147;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v76)(v147, v74, v161);
  uint64_t v78 = v148;
  uint64_t v79 = (uint64_t)v149;
  v148(v149, (os_log_t)v159, v69);
  uint64_t v80 = v69;
  uint64_t v81 = (uint64_t)v150;
  v78(v150, v73, v80);
  uint64_t v82 = sub_100010F7C();
  uint64_t v83 = v151;
  uint64_t result = sub_100010F84(v75, v77, v79, v81, v82);
  if (!v83)
  {
    unint64_t v85 = v156;
    __int128 v86 = (void *)v80;
    uint64_t v87 = result;
    uint64_t v88 = (*(uint64_t (**)(void))(*(void *)result + 176LL))();
    uint64_t v150 = (_BYTE *)v87;
    uint64_t v89 = (*(uint64_t (**)(uint64_t))(**(void **)(v87 + 16) + 176LL))(v88);
    uint64_t v91 = 1853191285LL;
    if (v90) {
      uint64_t v91 = v89;
    }
    uint64_t v151 = v91;
    unint64_t v92 = v85;
    if (v90) {
      unint64_t v93 = v90;
    }
    else {
      unint64_t v93 = 0xE400000000000000LL;
    }
    id v94 = v137;
    v140(v137, v139, v154);
    uint64_t v95 = v135;
    v153();
    unint64_t v96 = (void (*)(_BYTE *, os_log_t, void *))v78;
    v78(v141, (os_log_t)v159, (uint64_t)v86);
    unint64_t v97 = v136;
    v96(v136, v158, v86);
    swift_bridgeObjectRetain_n(v92, 2LL);
    uint64_t v98 = swift_bridgeObjectRetain_n(v93, 2LL);
    uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
    os_log_type_t v100 = static os_log_type_t.info.getter();
    LODWORD(v160) = v100;
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = swift_slowAlloc(52LL, -1LL);
      uint64_t v157 = v86;
      uint64_t v102 = v101;
      uint64_t v159 = swift_slowAlloc(160LL, -1LL);
      uint64_t v164 = v159;
      *(_DWORD *)uint64_t v102 = 136316162;
      os_log_t v158 = v99;
      swift_bridgeObjectRetain(v92);
      uint64_t v162 = sub_1000086A8(v155, v92, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v102 + 4, v102 + 12);
      uint64_t v103 = swift_bridgeObjectRelease_n(v92, 3LL);
      *(_WORD *)(v102 + 12) = 2080;
      uint64_t v104 = NWEndpoint.Port.debugDescription.getter(v103);
      unint64_t v106 = v105;
      uint64_t v162 = sub_1000086A8(v104, v105, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v102 + 14, v102 + 22);
      swift_bridgeObjectRelease(v106);
      ((void (*)(_BYTE *, uint64_t))v142)(v95, v161);
      *(_WORD *)(v102 + 22) = 2080;
      swift_bridgeObjectRetain(v93);
      uint64_t v162 = sub_1000086A8(v151, v93, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v102 + 24, v102 + 32);
      uint64_t v107 = swift_bridgeObjectRelease_n(v93, 3LL);
      *(_WORD *)(v102 + 32) = 2080;
      uint64_t v108 = v141;
      uint64_t v109 = IPv6Address.debugDescription.getter(v107);
      unint64_t v111 = v110;
      uint64_t v162 = sub_1000086A8(v109, v110, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v102 + 34, v102 + 42);
      swift_bridgeObjectRelease(v111);
      unint64_t v112 = v108;
      os_log_type_t v113 = v157;
      unint64_t v114 = (void (*)(_BYTE *, void *))v146;
      uint64_t v115 = ((uint64_t (*)(_BYTE *, void *))v146)(v112, v157);
      *(_WORD *)(v102 + 42) = 2080;
      uint64_t v116 = IPv6Address.debugDescription.getter(v115);
      unint64_t v118 = v117;
      uint64_t v162 = sub_1000086A8(v116, v117, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v102 + 44, v102 + 52);
      swift_bridgeObjectRelease(v118);
      v114(v97, v113);
      os_log_t v119 = v158;
      _os_log_impl( (void *)&_mh_execute_header,  v158,  (os_log_type_t)v160,  "SSH tunnel connected to %s:%s on %s from %s -> %s.",  (uint8_t *)v102,  0x34u);
      uint64_t v120 = v159;
      swift_arrayDestroy(v159, 5LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v120, -1LL, -1LL);
      swift_slowDealloc(v102, -1LL, -1LL);

      unint64_t v121 = *(void **)(v152 + 8);
      uint64_t v122 = ((uint64_t (*)(_BYTE *, uint64_t))v121)(v137, v154);
    }

    else
    {
      swift_bridgeObjectRelease_n(v92, 2LL);
      ((void (*)(_BYTE *, uint64_t))v142)(v95, v161);
      swift_bridgeObjectRelease_n(v93, 2LL);
      uint64_t v123 = (void (*)(_BYTE *, void *))v146;
      ((void (*)(_BYTE *, void *))v146)(v141, v86);
      v123(v97, v86);

      unint64_t v121 = v157;
      uint64_t v122 = ((uint64_t (*)(_BYTE *, uint64_t))v157)(v94, v154);
    }

    uint64_t v124 = v150;
    (*(void (**)(uint64_t))(*(void *)v150 + 160LL))(v122);
    uint64_t v125 = v138;
    v140(v138, v139, v154);
    uint64_t v126 = swift_bridgeObjectRetain(v93);
    Swift::String v127 = (os_log_s *)Logger.logObject.getter(v126);
    os_log_type_t v128 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v127, v128))
    {
      uint64_t v129 = swift_slowAlloc(12LL, -1LL);
      uint64_t v157 = v121;
      unint64_t v130 = (uint8_t *)v129;
      uint64_t v131 = swift_slowAlloc(32LL, -1LL);
      uint64_t v164 = v131;
      *(_DWORD *)unint64_t v130 = 136315138;
      swift_bridgeObjectRetain(v93);
      uint64_t v162 = sub_1000086A8(v151, v93, &v164);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, &v163, v130 + 4, v130 + 12);
      swift_bridgeObjectRelease_n(v93, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v127, v128, "SSH tunnel exited. %s is now closed.", v130, 0xCu);
      swift_arrayDestroy(v131, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v131, -1LL, -1LL);
      swift_slowDealloc(v130, -1LL, -1LL);
      swift_release(v124);

      return ((uint64_t (*)(_BYTE *, uint64_t))v157)(v138, v154);
    }

    else
    {

      swift_release(v124);
      swift_bridgeObjectRelease_n(v93, 2LL);
      return ((uint64_t (*)(_BYTE *, uint64_t))v121)(v125, v154);
    }
  }

  return result;
}

uint64_t NWListener.State.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWListener.State(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for NWListener.State.waiting(_:))
  {
    uint64_t v7 = 0x676E6974696177LL;
  }

  else if (v6 == enum case for NWListener.State.failed(_:))
  {
    uint64_t v7 = 0x64656C696166LL;
  }

  else
  {
    if (v6 == enum case for NWListener.State.setup(_:)) {
      return 0x7075746573LL;
    }
    if (v6 == enum case for NWListener.State.ready(_:)) {
      return 0x7964616572LL;
    }
    if (v6 == enum case for NWListener.State.cancelled(_:)) {
      return 0x656C6C65636E6163LL;
    }
    uint64_t v7 = 0x6E776F6E6B6E75LL;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

void sub_100014ADC(uint64_t a1)
{
  __asm { BR              X10 }

uint64_t sub_100014B10()
{
  v5[0] = 0LL;
  v5[1] = 0xE000000000000000LL;
  swift_errorRetain(v0);
  _StringGuts.grow(_:)(29LL);
  v1._countAndFlagsBits = 0xD00000000000001BLL;
  v1._object = (void *)0x800000010001D100LL;
  String.append(_:)(v1);
  unint64_t v4 = v0;
  uint64_t v2 = sub_1000080BC((uint64_t *)&unk_100024D70);
  _print_unlocked<A, B>(_:_:)( &v4,  v5,  v2,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  sub_100014CA8(v0);
  return v5[0];
}

unint64_t sub_100014CA8(unint64_t result)
{
  unint64_t v1 = result >> 62;
  if (!(result >> 62)) {
    return swift_errorRelease(result);
  }
  if ((_DWORD)v1 == 2 || (_DWORD)v1 == 1)
  {
    result &= 0x3FFFFFFFFFFFFFFFuLL;
    return swift_errorRelease(result);
  }

  return result;
}

void sub_100014CCC()
{
}

ssize_t FileDescriptor._recv(into:)(void *a1, uint64_t a2, int a3)
{
  if (a1) {
    size_t v4 = a2 - (void)a1;
  }
  else {
    size_t v4 = 0LL;
  }
  ssize_t result = recv(a3, a1, v4, 0);
  if (result < 0) {
    return errno.getter();
  }
  return result;
}

void sub_100014D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v28 = a1;
  uint64_t v5 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000080BC((uint64_t *)&unk_100024F60);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v16 = [objc_allocWithZone(NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1LL, 1LL, v12);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))( v8,  enum case for URL.DirectoryHint.inferFromPath(_:),  v5);
  URL.init(filePath:directoryHint:relativeTo:)(0x66692F6E6962732FLL, 0xEE006769666E6F63LL, v8, v11);
  URL._bridgeToObjectiveC()(v17);
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  [v16 setExecutableURL:v19];

  uint64_t v20 = sub_1000080BC(&qword_100024B70);
  uint64_t v21 = swift_allocObject(v20, 128LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_10001A930;
  *(void *)(v21 + 32) = v28;
  *(void *)(v21 + 40) = a2;
  *(void *)(v21 + 48) = 0x3674656E69LL;
  *(void *)(v21 + 56) = 0xE500000000000000LL;
  uint64_t v22 = swift_bridgeObjectRetain(a2);
  uint64_t v23 = IPv6Address.debugDescription.getter(v22);
  *(void *)(v21 + 64) = v23;
  *(void *)(v21 + 72) = v24;
  *(void *)(v21 + 80) = IPv6Address.debugDescription.getter(v23);
  *(void *)(v21 + 88) = v25;
  *(void *)(v21 + 96) = 0x656C786966657270LL;
  *(void *)(v21 + 104) = 0xE90000000000006ELL;
  *(void *)(v21 + 112) = 3682865LL;
  *(void *)(v21 + 120) = 0xE300000000000000LL;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  [v16 setArguments:isa];

  id v31 = v16;
  sub_100009194(5LL, 1u, (uint64_t (*)(void))sub_10001830C);
}

void sub_100014FD0(uint64_t a1, uint64_t a2)
{
  v22[0] = a1;
  uint64_t v3 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000080BC((uint64_t *)&unk_100024F60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v14 = [objc_allocWithZone(NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1LL, 1LL, v10);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))( v6,  enum case for URL.DirectoryHint.inferFromPath(_:),  v3);
  URL.init(filePath:directoryHint:relativeTo:)(0x66692F6E6962732FLL, 0xEE006769666E6F63LL, v6, v9);
  URL._bridgeToObjectiveC()(v15);
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  [v14 setExecutableURL:v17];

  uint64_t v18 = sub_1000080BC(&qword_100024B70);
  uint64_t v19 = swift_allocObject(v18, 80LL, 7LL);
  *(_OWORD *)(v19 + 16) = xmmword_10001A640;
  *(void *)(v19 + 32) = v22[0];
  *(void *)(v19 + 40) = a2;
  *(void *)(v19 + 48) = 7697517LL;
  *(void *)(v19 + 56) = 0xE300000000000000LL;
  v22[7] = 9000LL;
  swift_bridgeObjectRetain(a2);
  *(void *)(v19 + 64) = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt,  &protocol witness table for UInt);
  *(void *)(v19 + 72) = v20;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  [v14 setArguments:isa];

  v22[4] = v14;
  sub_100009194(5LL, 1u, (uint64_t (*)(void))sub_10001830C);
}

uint64_t sub_100015254(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0x656E6E6F63736964LL;
  }
  String.append(_:)(*(Swift::String *)&a1);
  v2._countAndFlagsBits = 41LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  return 0x657463656E6E6F63LL;
}

uint64_t sub_1000152D0(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3) {
    return v4 == 0;
  }
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  if (v5 == *a2 && v3 == v4) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(v5, v3, *a2, v4, 0LL);
  }
}

uint64_t sub_10001531C()
{
  return sub_100015254(*v0, v0[1]);
}

void sub_100015324()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_retain_n(v0, 2LL);
  oslog = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_beginAccess(v0 + 128, v15, 0LL, 0LL);
    uint64_t v6 = *(void **)(v0 + 136);
    if (v6)
    {
      uint64_t v7 = *(void *)(v0 + 128);
      unint64_t v14 = 0xEA00000000002864LL;
      swift_bridgeObjectRetain(v6);
      v8._countAndFlagsBits = v7;
      v8._object = v6;
      String.append(_:)(v8);
      v9._countAndFlagsBits = 41LL;
      v9._object = (void *)0xE100000000000000LL;
      String.append(_:)(v9);
      swift_bridgeObjectRelease(v6);
      uint64_t v10 = 0x657463656E6E6F63LL;
      unint64_t v11 = 0xEA00000000002864LL;
    }

    else
    {
      unint64_t v11 = 0xEC00000064657463LL;
      uint64_t v10 = 0x656E6E6F63736964LL;
    }

    uint64_t v13 = sub_1000086A8(v10, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v4 + 4, v4 + 12);
    swift_release_n(v1, 2LL);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Changed to state %s", v4, 0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  else
  {
    swift_release_n(v0, 2LL);
  }

uint64_t sub_10001552C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain(*(void *)(v0 + 136));
  return v1;
}

void sub_100015574(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 136);
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  swift_bridgeObjectRelease(v5);
  sub_100015324();
}

void (*sub_1000155C8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess(v1 + 128, a1, 33LL, 0LL);
  return sub_100015608;
}

void sub_100015608(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_100015324();
  }
}

uint64_t sub_100015638()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
  if (!v2) {
    return 0LL;
  }
  return result;
}

uint64_t sub_10001565C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  sub_1000156C0(a1, a2, a3);
  return v7;
}

uint64_t sub_1000156C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  Swift::String v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  uint64_t *v9 = 0LL;
  v9[1] = 0LL;
  uint64_t v57 = v9;
  uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer);
  uint64_t v11 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = __DataStorage.init(length:)(0xFFFFLL);
  void *v10 = 0xFFFF00000000LL;
  v10[1] = v12 | 0x4000000000000000LL;
  uint64_t v13 = (uint64_t *)sub_10000C3B8();
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  swift_bridgeObjectRetain(v15);
  Logger.init(subsystem:category:)(v14, v15, 0x6B636F536E757455LL, 0xEA00000000007465LL);
  uint64_t v59 = v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_logger;
  uint64_t v60 = v8;
  uint64_t v61 = v7;
  (*(void (**)(void))(v8 + 32))();
  uint64_t v16 = v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress;
  uint64_t v17 = type metadata accessor for IPv6Address(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(void))(v18 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v19)(v16, a2, v17);
  uint64_t v58 = v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelDestinationAddress;
  v19();
  uint64_t v20 = socket(32, 2, 2);
  if ((v20 & 0x80000000) != 0)
  {
    int v37 = errno.getter(v20);
    unint64_t v38 = sub_100008D40();
    uint64_t v39 = swift_allocError(&type metadata for Errno, v38, 0LL, 0LL);
    *uint64_t v40 = v37;
    unint64_t v41 = sub_1000174C0();
    uint64_t v42 = swift_allocError(&type metadata for UtunSocketError, v41, 0LL, 0LL);
    uint64_t *v43 = v39;
    swift_willThrow(v42);

    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v44(a3, v17);
    v44(a2, v17);
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
    sub_100017504(*v57, v57[1]);
    v44(v16, v17);
    v44(v58, v17);
    sub_100008CFC( *(void *)(v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer),  *(void *)(v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer + 8));
    uint64_t v53 = type metadata accessor for UtunSocket(0LL);
    swift_deallocPartialClassInstance( v4,  v53,  *(unsigned int *)(*(void *)v4 + 48LL),  *(unsigned __int16 *)(*(void *)v4 + 52LL));
    return v4;
  }

  uint64_t v21 = v20;
  uint64_t v55 = v16;
  uint64_t v56 = a3;
  memset(v63, 0, sizeof(v63));
  unint64_t v22 = sub_1000173D0(0x60uLL, 0xD00000000000001ALL, 0x800000010001D120LL);
  unint64_t v24 = v23;
  unint64_t v26 = v25;
  unint64_t v28 = v27;
  swift_bridgeObjectRetain(v27);
  sub_100015C0C(v22, v24, v26, v28, (uint64_t)&v63[4], (uint64_t)&v64);
  swift_bridgeObjectRelease(v28);
  uint64_t v29 = sub_10000C0D4();
  uint64_t v30 = ioctl(_:_:_:)(v21, *v29, v63);
  if ((v30 & 0x80000000) != 0
    || (v31 = fcntl(_:_:)(v21, 3), uint64_t v30 = fcntl(_:_:_:)(v21, 4, v31 | 4), (v30 & 0x80000000) != 0))
  {
    int v45 = errno.getter(v30);
    unint64_t v46 = sub_100008D40();
    uint64_t v47 = swift_allocError(&type metadata for Errno, v46, 0LL, 0LL);
    *int v48 = v45;
    uint64_t v49 = v47 | 0x4000000000000000LL;
    unint64_t v50 = sub_1000174C0();
    uint64_t v51 = swift_allocError(&type metadata for UtunSocketError, v50, 0LL, 0LL);
    *uint64_t v52 = v49;
    swift_willThrow(v51);

    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v44(v56, v17);
    v44(a2, v17);
    uint64_t v16 = v55;
    goto LABEL_7;
  }

  int v32 = *(_DWORD *)v63;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&v63[4];
  *(_OWORD *)(v4 + 40) = *(_OWORD *)&v63[20];
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&v63[36];
  *(_OWORD *)(v4 + 72) = *(_OWORD *)&v63[52];
  __int128 v33 = *(_OWORD *)&v63[84];
  *(_OWORD *)(v4 + 88) = *(_OWORD *)&v63[68];
  *(_OWORD *)(v4 + 104) = v33;
  *(_DWORD *)(v4 + 16) = v21;
  *(_DWORD *)(v4 + 20) = v32;
  sub_100017484();
  id v34 = a1;
  uint64_t v35 = static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(v21, a1);

  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v36(v56, v17);
  v36(a2, v17);
  *(void *)(v4 + 128) = 0LL;
  *(void *)(v4 + 136) = 0LL;
  *(void *)(v4 + 120) = v35;
  return v4;
}

unint64_t sub_100015C0C( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v20 = result;
  unint64_t v21 = a2;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  if (!a5) {
    return result;
  }
  v18[2] = &v20;
  v18[3] = a5;
  v18[4] = a6;
  v18[5] = a5;
  uint64_t result = sub_10001702C((uint64_t (*)(void, void))sub_1000183F0, (uint64_t)v18, result, a2, a3, a4);
  if ((result & 1) == 0) {
    return result;
  }
  unint64_t v7 = v20;
  unint64_t v8 = v21;
  unint64_t v9 = v21 >> 14;
  if (v21 >> 14 == v20 >> 14) {
    return result;
  }
  uint64_t v11 = v22;
  uint64_t v10 = v23;
  uint64_t v12 = (v22 >> 59) & 1;
  if ((v23 & 0x1000000000000000LL) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4LL << v12;
  uint64_t v14 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000LL) == 0) {
    uint64_t v14 = v22 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v19 = v14;
  swift_bridgeObjectRetain(v23);
  uint64_t v15 = 0LL;
  unint64_t v16 = v7;
  while (1)
  {
    uint64_t result = Substring.UTF8View.subscript.getter(v16, v7, v8, v11, v10);
    char v17 = result;
    if ((v16 & 0xC) == v13)
    {
      uint64_t result = sub_10000FEE4(v16, v11, v10);
      unint64_t v16 = result;
      if ((v10 & 0x1000000000000000LL) == 0)
      {
LABEL_11:
        unint64_t v16 = (v16 & 0xFFFFFFFFFFFF0000LL) + 65540;
        goto LABEL_15;
      }
    }

    else if ((v10 & 0x1000000000000000LL) == 0)
    {
      goto LABEL_11;
    }

    if (v19 <= v16 >> 16) {
      goto LABEL_20;
    }
    uint64_t result = String.UTF8View._foreignIndex(after:)(v16, v11, v10);
    unint64_t v16 = result;
LABEL_15:
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    *(_BYTE *)(a5 + v15++) = v17;
    if (v9 == v16 >> 14) {
      return swift_bridgeObjectRelease(v10);
    }
  }

  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_100015DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v21[0] = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v6 = *(void *)(v21[0] - 8LL);
  __chkstk_darwin(v21[0]);
  unint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion + 8);
  void *v13 = a1;
  v13[1] = a2;
  swift_retain(a2);
  sub_100017504(v14, v15);
  memset(v24, 0, sizeof(v24));
  uint64_t ObjectType = swift_getObjectType(*(void *)(v3 + 120));
  aBlock[4] = sub_100017550;
  uint64_t v23 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100007FE4;
  aBlock[3] = &unk_100021678;
  char v17 = _Block_copy(aBlock);
  uint64_t v18 = swift_retain(v3);
  static DispatchQoS.unspecified.getter(v18);
  sub_100008028();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v12, v8, v17, ObjectType);
  _Block_release(v17);
  (*(void (**)(char *, void))(v6 + 8))(v8, v21[0]);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release(v23);
  BYTE1(v24[0]) = 32;
  WORD1(v24[0]) = 2;
  DWORD1(v24[0]) = *(_DWORD *)(v3 + 20);
  int v25 = 1;
  v21[4] = &v25;
  v21[5] = v24;
  v21[6] = v3;
  uint64_t v19 = v21[1];
  uint64_t result = sub_100009194(255LL, 0, (uint64_t (*)(void))sub_10001756C);
  if (!v19) {
    return aBlock[0];
  }
  return result;
}

void sub_100015FA8()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType(*(void *)(v0 + 120));
  uint64_t v3 = OS_dispatch_source.data.getter(ObjectType);
  if (v3 < 0)
  {
    __break(1u);
    JUMPOUT(0x1000166C4LL);
  }

  uint64_t v4 = v3;
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer, &v22, 33LL, 0LL);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  swift_retain(v1);
  uint64_t v20 = Data._Representation.subscript.getter(0LL, v4, v6, v7);
  uint64_t v21 = v8;
  sub_100017F78((uint64_t)&v20);
  uint64_t v10 = v9;
  swift_release(v1);
  uint64_t v11 = v20;
  unint64_t v12 = v21;
  sub_100016CA0(v20, v21);
  sub_100008CFC(v11, v12);
  uint64_t v13 = swift_endAccess(&v22);
  if (v10 <= 0)
  {
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received 0 bytes from utun, closing connection...", v16, 2u);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    (*(void (**)(void))(*(void *)v1 + 272LL))();
  }

  else if (v4 == v10)
  {
    if (*(void *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion)) {
      __asm { BR              X10 }
    }
  }

  else
  {
    char v17 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v19 = 134218240;
      uint64_t v22 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v19 + 4, v19 + 12);
      *(_WORD *)(v19 + 12) = 2048;
      uint64_t v22 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v19 + 14, v19 + 22);
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "Expected to read %ld bytes but read %ld instead.",  (uint8_t *)v19,  0x16u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }
  }

void sub_1000166D4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void sub_100016724()
{
  uint64_t v18 = v0;
  __int16 v19 = v2;
  char v20 = BYTE2(v2);
  char v21 = BYTE3(v2);
  char v22 = BYTE4(v2);
  char v23 = BYTE5(v2);
  uint64_t v3 = *(unsigned int *)(v1 + 16);
  swift_retain(v1);
  int v4 = FileDescriptor._write(_:retryOnInterrupt:)(&v18, (char *)&v18 + BYTE6(v2), 1LL, v3);
  if ((v5 & 1) != 0)
  {
    int v6 = v4;
    int v17 = v4;
    unint64_t v7 = sub_100008D40();
    swift_willThrowTypedImpl(&v17, &type metadata for Errno, v7);
    uint64_t v8 = swift_allocError(&type metadata for Errno, v7, 0LL, 0LL);
    _DWORD *v9 = v6;
    swift_release(v1);
    swift_errorRetain(v8);
    uint64_t v10 = swift_errorRetain(v8);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v13 = 138412290;
      swift_errorRetain(v8);
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError(v8);
      uint64_t v18 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v13 + 4, v13 + 12);
      uint64_t *v14 = v15;
      swift_errorRelease(v8);
      swift_errorRelease(v8);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not write to utun: %@", v13, 0xCu);
      uint64_t v16 = sub_1000080BC(&qword_100024D90);
      swift_arrayDestroy(v14, 1LL, v16);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_errorRelease(v8);
    }

    else
    {
      swift_errorRelease(v8);

      swift_errorRelease(v8);
      swift_errorRelease(v8);
    }
  }

  else
  {
    swift_release(v1);
  }

uint64_t sub_100016ADC()
{
  uint64_t v1 = FileDescriptor._close()(*(unsigned int *)(v0 + 16));
  if ((v1 & 0x100000000LL) == 0) {
    return (*(uint64_t (**)(void, void))(*(void *)v0 + 160LL))(0LL, 0LL);
  }
  int v3 = v1;
  int v6 = v1;
  unint64_t v4 = sub_100008D40();
  swift_willThrowTypedImpl(&v6, &type metadata for Errno, v4);
  uint64_t result = swift_allocError(&type metadata for Errno, v4, 0LL, 0LL);
  *char v5 = v3;
  return result;
}

uint64_t sub_100016B84()
{
  uint64_t v1 = v0;
  uint64_t result = swift_beginAccess(v0 + 128, v11, 0LL, 0LL);
  if (*((void *)v0 + 17))
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = *((void *)v0 + 15);
    uint64_t ObjectType = swift_getObjectType(*((void *)v1 + 15));
    char v5 = OS_dispatch_source.isCancelled.getter(ObjectType);
    uint64_t result = swift_unknownObjectRelease(v3);
    if ((v5 & 1) != 0)
    {
      swift_bridgeObjectRelease(*((void *)v1 + 17));
      int v6 = &v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_logger];
      uint64_t v7 = type metadata accessor for Logger(0LL);
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
      sub_100017504( *(void *)&v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion],  *(void *)&v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion + 8]);
      uint64_t v8 = &v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress];
      uint64_t v9 = type metadata accessor for IPv6Address(0LL);
      uint64_t v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL);
      v10(v8, v9);
      v10(&v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelDestinationAddress], v9);
      sub_100008CFC( *(void *)&v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer],  *(void *)&v1[OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer + 8]);
      return swift_deallocClassInstance( v1,  *(unsigned int *)(*(void *)v1 + 48LL),  *(unsigned __int16 *)(*(void *)v1 + 52LL));
    }
  }

  __break(1u);
  return result;
}

void sub_100016CA0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100016D08()
{
  uint64_t v5 = v2;
  __int16 v6 = v3;
  char v7 = BYTE2(v3);
  char v8 = BYTE3(v3);
  char v9 = BYTE4(v3);
  char v10 = BYTE5(v3);
  return Data._Representation.replaceSubrange(_:with:count:)(v1, v0, &v5, BYTE6(v3));
}

uint64_t sub_100016E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v11 += a1 - result;
  }

  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v14 = __DataStorage._length.getter();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  if (v11) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  return Data._Representation.replaceSubrange(_:with:count:)(a5, a6, v11, v16);
}

uint64_t sub_100016F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v8 += a1 - result;
  }

  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0LL;
  }
  int v15 = FileDescriptor._write(_:retryOnInterrupt:)(v8, v14, 1LL, *(unsigned int *)(a4 + 16));
  if ((v16 & 1) != 0)
  {
    int v17 = v15;
    int v20 = v15;
    unint64_t v18 = sub_100008D40();
    swift_willThrowTypedImpl(&v20, &type metadata for Errno, v18);
    swift_allocError(&type metadata for Errno, v18, 0LL, 0LL);
    _DWORD *v19 = v17;
  }

  return swift_release(a4);
}

uint64_t sub_10001702C( uint64_t (*a1)(void, void), uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if ((a6 & 0x1000000000000000LL) != 0) {
    return (a6 & 0x1000000000000000LL) >> 60;
  }
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    uint64_t v13 = HIBYTE(a6) & 0xF;
    v15[0] = a5;
    v15[1] = a6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v12 = v15;
  }

  else if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v12 = (void *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v13 = a5 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v12 = (void *)_StringObject.sharedUTF8.getter(a5, a6);
  }

  uint64_t result = sub_1000170FC((uint64_t)v12, v13, a3, a4, a5, a6, a1);
  if (!v6) {
    return (a6 & 0x1000000000000000LL) >> 60;
  }
  return result;
}

uint64_t sub_1000170FC( uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t (*a7)(void, void))
{
  unint64_t v10 = a3;
  uint64_t v11 = result;
  uint64_t v12 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000LL) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4LL << v12;
  unint64_t v14 = a3 & 0xC;
  unint64_t v15 = a3;
  if (v14 == 4LL << v12)
  {
    int v17 = a7;
    uint64_t result = sub_10000FEE4(a3, a5, a6);
    a7 = v17;
    unint64_t v15 = result;
    if ((a6 & 0x1000000000000000LL) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }

  else if ((a6 & 0x1000000000000000LL) == 0)
  {
    goto LABEL_5;
  }

  unint64_t v26 = a7;
  unint64_t v18 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000LL) != 0) {
    unint64_t v18 = HIBYTE(a6) & 0xF;
  }
  if (v18 < v15 >> 16) {
    goto LABEL_31;
  }
  uint64_t result = String.UTF8View._foreignDistance(from:to:)(15LL, v15, a5, a6);
  int64_t v16 = result;
  a7 = v26;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t v19 = v10;
    int v20 = a7;
    uint64_t result = sub_10000FEE4(v19, a5, a6);
    a7 = v20;
    unint64_t v10 = result;
  }

LABEL_6:
  if ((a4 & 0xC) == v13)
  {
    char v21 = a7;
    uint64_t result = sub_10000FEE4(a4, a5, a6);
    a7 = v21;
    a4 = result;
    if ((a6 & 0x1000000000000000LL) == 0) {
      goto LABEL_8;
    }
  }

  else if ((a6 & 0x1000000000000000LL) == 0)
  {
LABEL_8:
    uint64_t result = (a4 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }

  unint64_t v22 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x2000000000000000LL) == 0) {
    unint64_t v22 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (v22 < v10 >> 16) {
    goto LABEL_29;
  }
  if (v22 < a4 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }

  char v23 = a7;
  uint64_t result = String.UTF8View._foreignDistance(from:to:)(v10, a4, a5, a6);
  a7 = v23;
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }

  uint64_t v24 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v11) {
    uint64_t v25 = v11 + v16;
  }
  else {
    uint64_t v25 = 0LL;
  }
  return a7(v25, v24);
}

  char v7 = v5 | 7;
  return sub_100017300(15LL, v7, v4, v3);
}

uint64_t sub_100017300(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v6 = a2;
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((a2 & 0xC) == 4LL << v8)
  {
    uint64_t result = sub_10000FEE4(a2, a3, a4);
    unint64_t v6 = result;
  }

  if ((v7 & 0xC) == v9)
  {
    uint64_t result = sub_10000FEE4(v7, a3, a4);
    unint64_t v7 = result;
  }

  uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  if ((a4 & 0x2000000000000000LL) != 0) {
    uint64_t v10 = HIBYTE(a4) & 0xF;
  }
  if (v6 >> 14 <= 4 * v10 && v6 >> 14 >= v7 >> 14) {
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000173D0(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_10:
    uint64_t v9 = 7LL;
    if ((v4 & 0x800000000000000LL) == 0) {
      uint64_t v9 = 11LL;
    }
    uint64_t v10 = String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)(15LL, a2, v5 | v9, v4, v3);
    if ((v11 & 1) == 0)
    {
      unint64_t v7 = v10;
      return sub_100017300(15LL, v7, v4, v3);
    }

    if ((v4 & 0x800000000000000LL) == 0)
    {
      unint64_t v7 = v5 | 0xB;
      return sub_100017300(15LL, v7, v4, v3);
    }

    goto LABEL_6;
  }

  unint64_t v3 = a3;
  unint64_t v4 = a2;
  a2 = a1;
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000LL) == 0) {
    unint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v6 << 16;
  if ((a3 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if (v6 >= a1)
  {
    unint64_t v7 = (a1 << 16) | 4;
    return sub_100017300(15LL, v7, v4, v3);
  }

unint64_t sub_100017484()
{
  unint64_t result = qword_100024D80;
  if (!qword_100024D80)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_source);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100024D80);
  }

  return result;
}

unint64_t sub_1000174C0()
{
  unint64_t result = qword_100024D88;
  if (!qword_100024D88)
  {
    unint64_t result = swift_getWitnessTable(")n", &type metadata for UtunSocketError);
    atomic_store(result, (unint64_t *)&qword_100024D88);
  }

  return result;
}

uint64_t sub_100017504(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t type metadata accessor for UtunSocket(uint64_t a1)
{
  uint64_t result = qword_100025850;
  if (!qword_100025850) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UtunSocket);
  }
  return result;
}

uint64_t sub_100017554(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100017564(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_10001756C(uint64_t *a1@<X8>)
{
  uint64_t v5 = v2;
  uint64_t v8 = (int *)v1[2];
  uint64_t v7 = v1[3];
  uint64_t v9 = v1[4];
  int v10 = *v8;
  *(_DWORD *)(v7 + 8) = *v8;
  int v11 = *(_DWORD *)(v7 + 4);
  int v12 = *(_DWORD *)(v7 + 28);
  __int128 v13 = *(_OWORD *)(v7 + 12);
  *(_DWORD *)uint64_t v42 = *(_DWORD *)v7;
  *(_DWORD *)&v42[4] = v11;
  *(_DWORD *)&v42[8] = v10;
  *(_OWORD *)&v42[12] = v13;
  int v43 = v12;
  uint64_t v14 = connect(*(_DWORD *)(v9 + 16), (const sockaddr *)v42, 0x20u);
  if ((v14 & 0x80000000) != 0)
  {
    int v31 = errno.getter(v14);
    unint64_t v32 = sub_100008D40();
    uint64_t v33 = swift_allocError(&type metadata for Errno, v32, 0LL, 0LL);
    *id v34 = v31;
    uint64_t p_prots = v33 | 0x8000000000000000LL;
    unint64_t v35 = sub_1000174C0();
    uint64_t v36 = swift_allocError(&type metadata for UtunSocketError, v35, 0LL, 0LL);
    uint64_t *v37 = p_prots;
    swift_willThrow(v36);
    int v38 = *v8 + 1;
    if (*v8 != -1) {
      goto LABEL_15;
    }
    __break(1u);
  }

  else
  {
    *(void *)uint64_t v42 = 1853191285LL;
    *(void *)&v42[8] = 0xE400000000000000LL;
    if (!*v8)
    {
      __break(1u);
      goto LABEL_17;
    }

    LODWORD(v44) = *v8 - 1;
    v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt32,  &protocol witness table for UInt32);
    object = v15._object;
    String.append(_:)(v15);
    swift_bridgeObjectRelease(object);
    unint64_t v3 = *(void *)&v42[8];
    uint64_t v41 = *(void *)v42;
    swift_retain_n(v9, 4LL);
    uint64_t v17 = swift_bridgeObjectRetain_n(v3, 2LL);
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v18 = static os_log_type_t.info.getter();
    uint64_t p_prots = (uint64_t)&OBJC_PROTOCOL___NSObject.prots;
    if (os_log_type_enabled(v4, v18))
    {
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      uint64_t v40 = swift_slowAlloc(96LL, -1LL);
      *(void *)uint64_t v42 = v40;
      *(_DWORD *)uint64_t v20 = 136315650;
      swift_bridgeObjectRetain(v3);
      uint64_t v44 = sub_1000086A8(v41, v3, (uint64_t *)v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v20 + 4, v20 + 12);
      uint64_t v21 = swift_bridgeObjectRelease_n(v3, 3LL);
      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v22 = IPv6Address.debugDescription.getter(v21);
      unint64_t v24 = v23;
      uint64_t v44 = sub_1000086A8(v22, v23, (uint64_t *)v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v20 + 14, v20 + 22);
      swift_bridgeObjectRelease(v24);
      uint64_t v25 = swift_release_n(v9, 2LL);
      *(_WORD *)(v20 + 22) = 2080;
      uint64_t v26 = IPv6Address.debugDescription.getter(v25);
      unint64_t v28 = v27;
      uint64_t v44 = sub_1000086A8(v26, v27, (uint64_t *)v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v20 + 24, v20 + 32);
      unint64_t v29 = v28;
      uint64_t p_prots = 0x100025000LL;
      swift_bridgeObjectRelease(v29);
      swift_release_n(v9, 2LL);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  v18,  "Setting %s IP to %s and tunnel destination to %s",  (uint8_t *)v20,  0x20u);
      swift_arrayDestroy(v40, 3LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1LL, -1LL);
      uint64_t v30 = v20;
      uint64_t v5 = v2;
      swift_slowDealloc(v30, -1LL, -1LL);

      goto LABEL_8;
    }
  }

  swift_bridgeObjectRelease_n(v3, 2LL);
  swift_release_n(v9, 4LL);
LABEL_8:
  sub_100014D24( v41,  v3,  v9 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress,  v9 + *(void *)(p_prots + 1600));
  if (v5)
  {
    swift_bridgeObjectRelease(v3);
    int v38 = *v8 + 1;
    if (*v8 != -1) {
      goto LABEL_15;
    }
    __break(1u);
  }

  sub_100014FD0(v41, v3);
  if (!v5) {
    goto LABEL_14;
  }
  swift_bridgeObjectRelease(v3);
  int v38 = *v8 + 1;
  if (*v8 != -1)
  {
LABEL_15:
    *uint64_t v8 = v38;
    return;
  }

  __break(1u);
LABEL_14:
  uint64_t v39 = *(void (**)(uint64_t, unint64_t))(*(void *)v9 + 160LL);
  swift_bridgeObjectRetain(v3);
  v39(v41, v3);
  swift_getObjectType(*(void *)(v9 + 120));
  OS_dispatch_source.activate()();
  *a1 = v41;
  a1[1] = v3;
  int v38 = *v8 + 1;
  if (*v8 != -1) {
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
}

unint64_t *initializeBufferWithCopyOfBuffer for UtunSocketError( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1000179A8(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_1000179A8(unint64_t result)
{
  unint64_t v1 = result >> 62;
  if (!(result >> 62)) {
    return swift_errorRetain(result);
  }
  if ((_DWORD)v1 == 2 || (_DWORD)v1 == 1)
  {
    result &= 0x3FFFFFFFFFFFFFFFuLL;
    return swift_errorRetain(result);
  }

  return result;
}

unint64_t destroy for UtunSocketError(unint64_t *a1)
{
  return sub_100014CA8(*a1);
}

unint64_t *assignWithCopy for UtunSocketError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_1000179A8(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_100014CA8(v4);
  return a1;
}

void *initializeWithTake for UtunSocketError(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for UtunSocketError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_100014CA8(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for UtunSocketError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xD && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for UtunSocketError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }

  return result;
}

uint64_t sub_100017AE8(void *a1)
{
  return *a1 >> 62;
}

void *sub_100017AF4(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_100017B04(uint64_t *result, uint64_t a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for UtunSocketError()
{
  return &type metadata for UtunSocketError;
}

uint64_t sub_100017B28()
{
  return type metadata accessor for UtunSocket(0LL);
}

uint64_t sub_100017B30(uint64_t a1)
{
  v5[0] = (char *)&value witness table for Builtin.Int32 + 64;
  v5[1] = &unk_10001AB00;
  v5[2] = &unk_10001AB18;
  v5[3] = &unk_10001AB30;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v5[4] = *(void *)(result - 8) + 64LL;
    v5[5] = &unk_10001AB30;
    uint64_t result = type metadata accessor for IPv6Address(319LL);
    if (v4 <= 0x3F)
    {
      uint64_t v6 = *(void *)(result - 8) + 64LL;
      uint64_t v7 = v6;
      uint64_t v8 = &unk_10001AB48;
      return swift_updateClassMetadata2(a1, 256LL, 9LL, v5, a1 + 80);
    }
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for UtunSocket.State(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for UtunSocket.State(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for UtunSocket.State(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for UtunSocket.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for UtunSocket.State(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UtunSocket.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for UtunSocket.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

uint64_t sub_100017D40(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100017D5C(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *type metadata accessor for UtunSocket.State()
{
  return &type metadata for UtunSocket.State;
}

uint64_t sub_100017D8C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100017DC0(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[5];
  *(_DWORD *)(a1 + 96) = *((_DWORD *)a2 + 24);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_100017DEC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 100)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100017E0C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 96) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 100) = v3;
  return result;
}

void type metadata accessor for ctl_info()
{
  if (!qword_100024F50)
  {
    ForeignTypeMetaintptr_t data = swift_getForeignTypeMetadata(0LL, &unk_100021828);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100024F50);
    }
  }

uint64_t sub_100017EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v9 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }

  BOOL v10 = __OFSUB__(a2, a1);
  int64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }

  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    size_t v13 = v11;
  }
  else {
    size_t v13 = v12;
  }
  ssize_t v14 = recv(*(_DWORD *)(a4 + 16), (void *)(v8 + v9), v13, 0);
  ssize_t v15 = v14;
  if (v14 < 0)
  {
    int v16 = errno.getter(v14);
    unint64_t v17 = sub_100008D40();
    uint64_t v18 = swift_allocError(&type metadata for Errno, v17, 0LL, 0LL);
    _DWORD *v19 = v16;
    swift_willThrow(v18);
  }

  return v15;
}

void sub_100017F78(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_100017FD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v11 = v3;
  LOWORD(v12) = a1;
  BYTE2(v12) = BYTE2(a1);
  HIBYTE(v12) = BYTE3(a1);
  unsigned __int8 v13 = BYTE4(a1);
  unsigned __int8 v14 = BYTE5(a1);
  unsigned __int8 v15 = BYTE6(a1);
  ssize_t v4 = recv(*(_DWORD *)(v2 + 16), &v11, BYTE6(a1), 0);
  if (v4 < 0)
  {
    uint64_t v5 = errno.getter(v4);
    unint64_t v7 = sub_100008D40();
    uint64_t v8 = swift_allocError(&type metadata for Errno, v7, 0LL, 0LL);
    _DWORD *v9 = v5;
    swift_willThrow(v8);
  }

  else
  {
    uint64_t v5 = v4;
  }

  unint64_t v6 = v12 | ((unint64_t)v13 << 32) | ((unint64_t)v14 << 40) | ((unint64_t)v15 << 48);
  void *v1 = v11;
  v1[1] = v6;
  return v5;
}

id sub_10001830C()
{
  return sub_100018320();
}

id sub_100018320()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v11 = 0LL;
  unsigned int v2 = [v1 launchAndReturnError:&v11];
  id v3 = v11;
  if (v2)
  {
    id v4 = v11;
    [v1 waitUntilExit];
    id result = [v1 terminationStatus];
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v6 = [v1 terminationStatus] | 0xC000000000000000;
    unint64_t v7 = sub_1000174C0();
    uint64_t v8 = swift_allocError(&type metadata for UtunSocketError, v7, 0LL, 0LL);
    unint64_t *v9 = v6;
  }

  else
  {
    id v10 = v11;
    _convertNSErrorToError(_:)(v3);
  }

  return (id)swift_willThrow(v8);
}

void *sub_1000183F0(void *__src, size_t __len)
{
  if (__src)
  {
    if ((__len & 0x8000000000000000LL) != 0)
    {
      __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.copyMemory with negative count",  54LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1549LL,  0);
      __break(1u);
    }

    else
    {
      return memmove(*(void **)(v2 + 40), __src, __len);
    }
  }

  return __src;
}

void sub_10001847C()
{
}

void sub_100018494(uint64_t a1)
{
}

void sub_1000184A8()
{
  uint64_t v0 = __error();
  errx(71, "inet_pton(): %d", *v0);
}

void sub_1000184D0(void *a1, _OWORD *a2)
{
  if (sub_10000637C((os_log_s *)&_os_log_default)) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  id v3 = __error();
  sub_1000063AC(v3);
  sub_100006384();
  uint64_t v7 = sub_100006364(v2, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100006398(v7);
  __break(1u);
}

void sub_100018558(void *a1, _OWORD *a2)
{
  if (sub_10000634C()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_1000062D8(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_1000185D8(uint64_t a1)
{
}

void sub_1000185EC()
{
  uint64_t v0 = __error();
  sub_1000063A4((uint64_t)v0, "bind(): %d");
}

void sub_100018610(uint64_t a1)
{
}

void sub_100018624(uint64_t a1)
{
}

void sub_100018638(uint64_t a1)
{
}

void sub_10001864C()
{
  uint64_t v0 = __error();
  sub_1000063A4((uint64_t)v0, "setsockopt(): %d");
}

void sub_100018670()
{
}

void sub_100018688()
{
}

void sub_1000186A0(const char *a1)
{
  uint64_t v2 = __error();
  err(65, "strtoul %s: %d", a1, *v2);
}

void sub_1000186D0()
{
}

void sub_1000186E8(uint64_t a1)
{
}

void sub_1000186FC()
{
}

void sub_100018714()
{
}

void sub_10001872C()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_reset failed");
}

void sub_100018748()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_set_alias failed");
}

void sub_100018764()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_timesync");
}

void sub_100018780(void *a1, _OWORD *a2)
{
  if (sub_10000637C((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10001883C()
{
}

void sub_100018854(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100006364(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006398(v6);
  __break(1u);
}

void sub_1000188D0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100006364(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006398(v6);
  __break(1u);
}

void sub_10001894C(uint64_t a1)
{
  name = (const char *)remote_device_get_name(a1);
  errx(75, "Device %s not connected yet", name);
}

void sub_100018970(uint64_t a1)
{
}

void sub_100018984(uint64_t a1)
{
}

void sub_100018998(uint64_t a1)
{
}

void sub_1000189AC(uint64_t a1)
{
}

void sub_1000189C0(uint64_t a1)
{
}

void sub_1000189D4(int a1)
{
}

void sub_1000189F0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018A58(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018AC0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018B28(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018B90(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018BF8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018C60(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018CC8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018D30(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 64);
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: Could not spawn child process: %{darwin.errno}d",  (uint8_t *)&v4,  0x12u);
}

void sub_100018DB8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018E20(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018E88(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018EF0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018F58(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100018FC0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000062D8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100006358(v6);
  __break(1u);
}

void sub_100019028(void *a1, _OWORD *a2)
{
  if (sub_10000637C((os_log_s *)&_os_log_default)) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  uint64_t v6 = sub_100006364(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  uint64_t v7 = sub_100006398(v6);
  __break(1u);
  __DataStorage.init(bytes:length:copy:deallocator:offset:)(v7);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return _[a1 sha256];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}