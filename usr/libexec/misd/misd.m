uint64_t sub_1000022C8( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  xpc_object_t value;
  void *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  xpc_object_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  xpc_object_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  xpc_object_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  xpc_object_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *string_ptr;
  xpc_object_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  char v87;
  xpc_object_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  if (!a1 || xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v10 = "metadata is not dictionary object";
LABEL_4:
    sub_100002740((uint64_t)v10, a2, a3, a4, a5, a6, a7, a8, v106);
    return 0LL;
  }

  value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam[0]);
  if (!value || (v13 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
  {
    v10 = "metadata does not contain low latency flow parameter dictionary.";
    goto LABEL_4;
  }

  v14 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpVersion[0]);
  if (v14 && (v22 = v14, xpc_get_type(v14) == (xpc_type_t)&_xpc_type_uint64))
  {
    v58 = xpc_uint64_get_value(v22);
    v66 = v58;
    if (v58 != 4 && v58 != 96)
    {
      sub_100002740((uint64_t)"IP version (%hhu) is not supported or is invalid", v59, v60, v61, v62, v63, v64, v65, v58);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 1u;
      *(_BYTE *)(a2 + 9) = v58;
    }

    v67 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalIp[0]);
    if (v67 && (v75 = v67, xpc_get_type(v67) == (xpc_type_t)&_xpc_type_string))
    {
      string_ptr = xpc_string_get_string_ptr(v75);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 4u;
      }
    }

    else
    {
      sub_10000277C((uint64_t)"local IP is not present or has incorrect type", v68, v69, v70, v71, v72, v73, v74, v106);
      string_ptr = 0LL;
    }

    v77 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemoteIp[0]);
    if (v77 && (v85 = v77, xpc_get_type(v77) == (xpc_type_t)&_xpc_type_string))
    {
      v86 = xpc_string_get_string_ptr(v85);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 8u;
      }
    }

    else
    {
      sub_10000277C((uint64_t)"remote IP is not present or has incorrect type", v78, v79, v80, v81, v82, v83, v84, v106);
      v86 = 0LL;
    }

    if (v66 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v108 + 12) != 1
        || v86 && inet_pton(2, v86, (char *)&v107 + 12) != 1)
      {
        v10 = "local or remote IPv4 address is malformed.";
        goto LABEL_4;
      }

      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v108);
        *(_DWORD *)(a2 + 40) = HIDWORD(v107);
      }
    }

    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v108) != 1 || v86 && inet_pton(30, v86, &v107) != 1)
      {
        v10 = "local or remote IPv6 address is malformed.";
        goto LABEL_4;
      }

      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v108;
        *(_OWORD *)(a2 + 28) = v107;
      }
    }
  }

  else
  {
    sub_100002740((uint64_t)"IP version is not present", v15, v16, v17, v18, v19, v20, v21, v106);
  }

  v23 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpProtocol[0]);
  if (v23 && (v31 = v23, xpc_get_type(v23) == (xpc_type_t)&_xpc_type_uint64))
  {
    v87 = xpc_uint64_get_value(v31);
    if (v87 != 17 && v87 != 6)
    {
      v10 = "IP protocol is not supported or is invalid.";
      goto LABEL_4;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 2u;
      *(_BYTE *)(a2 + 10) = v87;
    }
  }

  else
  {
    sub_10000277C((uint64_t)"IP protocol is not present or has incorrect type", v24, v25, v26, v27, v28, v29, v30, v106);
  }

  v32 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalPort[0]);
  if (v32)
  {
    v40 = v32;
    if (xpc_get_type(v32) != (xpc_type_t)&_xpc_type_uint64)
    {
LABEL_22:
      v10 = "Local port specified does not have UINT64 type.";
      goto LABEL_4;
    }

    v41 = xpc_uint64_get_value(v40);
    if (v41 - 0x10000 < 0xFFFFFFFFFFFF0001LL)
    {
      sub_100002740((uint64_t)"Illegal local port %llu", v42, v43, v44, v45, v46, v47, v48, v41);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v41) >> 16;
    }
  }

  else
  {
    sub_10000277C((uint64_t)"No local port specified.", v33, v34, v35, v36, v37, v38, v39, v106);
  }

  v49 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemotePort[0]);
  if (v49)
  {
    v57 = v49;
    v91 = xpc_uint64_get_value(v57);
    if (v91 - 0x10000 < 0xFFFFFFFFFFFF0001LL)
    {
      sub_100002740((uint64_t)"Illegal remote port %llu", v92, v93, v94, v95, v96, v97, v98, v91);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v91) >> 16;
    }
  }

  else
  {
    sub_100002740((uint64_t)"No local port specified.", v50, v51, v52, v53, v54, v55, v56, v106);
  }

  v89 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
  if (v89)
  {
    v90 = v89;
    if (xpc_get_type(v89) != (xpc_type_t)&_xpc_type_uint64)
    {
      v10 = "Connection idle timeout does not have UINT64 type.";
      goto LABEL_4;
    }

    if (xpc_uint64_get_value(v90) >= 0x69781)
    {
      sub_100002740( (uint64_t)"Connection idle timeout exceeds max limit of %u seconds",  v99,  v100,  v101,  v102,  v103,  v104,  v105,  432000LL);
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_100002740( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100034E90, 0LL, a1, &a9, v9);
}

uint64_t sub_10000277C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100034E90, 1LL, a1, &a9, v9);
}

void start(int a1, char **a2)
{
  __endptr = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2000000000LL;
  v4 = basename(*a2);
  snprintf((char *)&__str, 0x28uLL, "com.apple.misd.mainQ.%p", &qword_100035470);
  HIBYTE(__str.st_atimespec.tv_sec) = 0;
  qword_100035470 = (uint64_t)dispatch_queue_create((const char *)&__str, 0LL);
  if (!qword_100035470)
  {
    sub_1000036BC(0, (uint64_t)"failed to create main queue", v5, v6, v7, v8, v9, v10, v31);
    goto LABEL_40;
  }

  if (!stat("/AppleInternal", &__str) && (__str.st_mode & 0xF000) == 0x4000 && (__str.st_mode & 0x140) != 0)
  {
    BOOL v11 = 1;
  }

  else if (stat("/System/Library/PreferenceBundles/CarrierSettings.bundle", &__str))
  {
    BOOL v11 = 0;
  }

  else
  {
    BOOL v11 = (__str.st_mode & 0x140) != 0;
    if ((__str.st_mode & 0xF000) != 0x4000) {
      BOOL v11 = 0;
    }
  }

  dword_100035460 = v11;
  while (1)
  {
    int v12 = getopt(a1, a2, "Be:p:P:t:v");
    int v13 = v12;
    if (v12 > 111)
    {
      switch(v12)
      {
        case 'p':
          goto LABEL_22;
        case 't':
          uint64_t v16 = strtol(optarg, &__endptr, 0);
          if (!*optarg || *__endptr || v16 < 0)
          {
            fprintf(__stderrp, "Bad idle timeout: %s\n");
            goto LABEL_40;
          }

          break;
        case 'v':
          dword_10003546C = 1;
          break;
        default:
          goto LABEL_53;
      }
    }

    else if (v12 <= 79)
    {
      if (v12 != 66)
      {
        if (v12 == -1)
        {
          if (dword_10003546C) {
            sub_100003AB4(dword_10003546C);
          }
          if (sub_1000035D8())
          {
            if (dword_100035460)
            {
              sub_1000036BC( 0,  (uint64_t)"allowing special port forwarding for test fixtures",  v17,  v18,  v19,  v20,  v21,  v22,  v31);
              sub_1000199A4();
            }

            *(void *)&__str.st_dev = 1LL;
            __str.st_ino = 0x200000000LL;
            sigaction(1, (const sigaction *)&__str, 0LL);
            sigaction(13, (const sigaction *)&__str, 0LL);
            sigaction(14, (const sigaction *)&__str, 0LL);
            sigaction(24, (const sigaction *)&__str, 0LL);
            sigaction(25, (const sigaction *)&__str, 0LL);
            sigaction(26, (const sigaction *)&__str, 0LL);
            sigaction(27, (const sigaction *)&__str, 0LL);
            sigaction(18, (const sigaction *)&__str, 0LL);
            sigaction(21, (const sigaction *)&__str, 0LL);
            sigaction(22, (const sigaction *)&__str, 0LL);
            sigaction(30, (const sigaction *)&__str, 0LL);
            sigaction(31, (const sigaction *)&__str, 0LL);
            sigaction(2, (const sigaction *)&__str, 0LL);
            sigaction(15, (const sigaction *)&__str, 0LL);
            sigaction(20, (const sigaction *)&__str, 0LL);
            v23 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  2uLL,  0LL,  (dispatch_queue_t)qword_100035470);
            qword_100034EA0 = (uint64_t)v23;
            if (v23)
            {
              dispatch_source_set_event_handler(v23, &stru_100030BD8);
              dispatch_resume((dispatch_object_t)qword_100034EA0);
            }

            v24 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)qword_100035470);
            qword_100034EA8 = (uint64_t)v24;
            if (v24)
            {
              dispatch_source_set_event_handler(v24, &stru_100030C18);
              dispatch_resume((dispatch_object_t)qword_100034EA8);
            }

            snprintf((char *)&__str, 0x22uLL, "com.apple.misd.%p", &qword_100035478);
            BYTE1(__str.st_atimespec.tv_sec) = 0;
            qword_100035478 = (uint64_t)dispatch_queue_create((const char *)&__str, 0LL);
            if (qword_100035478)
            {
              *((_DWORD *)v35 + 6) = 0;
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000LL;
              block[2] = sub_100002DFC;
              block[3] = &unk_100030B98;
              block[4] = &v34;
              dispatch_sync((dispatch_queue_t)qword_100035470, block);
              if (!*((_DWORD *)v35 + 6))
              {
                sub_100002ED4();
                dispatch_main();
              }
            }

            else
            {
              sub_1000036BC(0, (uint64_t)"failed to create process termination queue", v25, v26, v27, v28, v29, v30, v32);
              *((_DWORD *)v35 + 6) = 12;
            }
          }
        }

        else
        {
LABEL_53:
          sub_100002D78(v4);
        }

LABEL_40:
        sub_100002CB4(1LL);
      }

      dword_100034D30 = 0;
    }

    else if (v12 == 80)
    {
LABEL_22:
      if (dword_100035460)
      {
        uint64_t v14 = strtol(optarg, &__endptr, 0);
        if (!*optarg || *__endptr || (v14 < 0x10000 ? (BOOL v15 = v14 <= 0) : (BOOL v15 = 1), v15))
        {
          fprintf(__stderrp, "Bad port : %s\n");
          goto LABEL_40;
        }

        ++dword_100035464;
        if (v13 == 112) {
          word_100035468 = v14;
        }
        else {
          word_10003546A = v14;
        }
      }
    }

    else
    {
      if (v12 != 101) {
        goto LABEL_53;
      }
      __strlcpy_chk(&byte_100035450, optarg, 16LL, 16LL);
    }
  }

  if (v142[0]) {
    freeifaddrs(v142[0]);
  }
  if ((_DWORD)v9)
  {
    v139 = strerror(v9);
    sub_1000036BC(0, (uint64_t)"mis_bcast_fix_addrs: %s", v36, v37, v38, v39, v40, v41, (uint64_t)v139);
  }

  else
  {
    v42.s_addr = *(_DWORD *)(a1 + 680);
    v43 = inet_ntoa(v42);
    snprintf((char *)v142, 0x10uLL, "%s", v43);
    v44.s_addr = *(_DWORD *)(a1 + 684);
    v45 = inet_ntoa(v44);
    snprintf(__str, 0x10uLL, "%s", v45);
    if (v10 != 502 && *(_DWORD *)(a1 + 20) == 201 && (v46 = sub_10000E924((const char *)(a1 + 308)), (_DWORD)v46))
    {
      uint64_t v9 = v46;
      sub_1000036BC(0, (uint64_t)"unable to start router on %s", v47, v48, v49, v50, v51, v52, a1 + 308);
    }

    else
    {
      v53 = (int *)(a1 + 680);
      v54 = (int *)(a1 + 684);
      v55 = sub_10000E3D0((const char *)(a1 + 308), (_DWORD *)(a1 + 680), (_DWORD *)(a1 + 684), 0LL);
      if ((_DWORD)v55)
      {
        uint64_t v9 = v55;
        strerror(v55);
        sub_1000036BC(0, (uint64_t)"mis_aifaddr(%s,%s,%s): %s", v62, v63, v64, v65, v66, v67, a1 + 308);
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"added addr=%s mask=%s on %s", v56, v57, v58, v59, v60, v61, (uint64_t)v142);
        if (v10 == 502)
        {
LABEL_52:
          uint64_t v9 = 0LL;
          *(_BYTE *)(a1 + 701) = 1;
        }

        else
        {
          v69 = 1;
          v70 = 1;
          do
          {
            v71 = if_nametoindex((const char *)(a1 + 308));
            if (v71)
            {
              if (!*v53) {
                goto LABEL_52;
              }
              v78 = v71;
              v79 = socket(17, 3, 2);
              if (v79 < 0)
              {
                uint64_t v9 = *__error();
                sub_1000036BC(0, (uint64_t)"socket: %m", v100, v101, v102, v103, v104, v105, v140);
              }

              else
              {
                v80 = v79;
                v81 = *v54 & *v53;
                v82 = sub_100013104(v79, 1, v81, *v53, *v54, (char *)(a1 + 308), 0, *v53, 1);
                uint64_t v9 = v82;
                if (!(_DWORD)v82 || (_DWORD)v82 == 17)
                {
                  v84 = sub_10000F328(v81, *v54);
                  sub_1000036BC( 1u,  (uint64_t)"subnet route %s %sadded on %s",  v85,  v86,  v87,  v88,  v89,  v90,  (uint64_t)v84);
                  v91 = sub_100013104(v80, 1, 0, *v53, 0, (char *)(a1 + 308), v78, *v53, 3);
                  v98 = v91;
                  if ((_DWORD)v91 && (_DWORD)v91 != 17)
                  {
                    strerror(v91);
                    sub_1000036BC( 0,  (uint64_t)"unable to add scoped default route on %s: %s",  v113,  v114,  v115,  v116,  v117,  v118,  a1 + 308);
                    uint64_t v9 = v98;
                  }

                  else
                  {
                    v99 = "(already) ";
                    if (!(_DWORD)v91) {
                      v99 = (const char *)&unk_10002576D;
                    }
                    sub_1000036BC( 1u,  (uint64_t)"scoped default route %sadded on %s",  v92,  v93,  v94,  v95,  v96,  v97,  (uint64_t)v99);
                    uint64_t v9 = 0LL;
                    if ((_DWORD)v98 && (_DWORD)v98 != 17) {
                      sub_100022F94();
                    }
                  }
                }

                else
                {
                  v106 = sub_10000F328(v81, *v54);
                  strerror(v9);
                  sub_1000036BC( 0,  (uint64_t)"unable to add subnet route %s on %s: %s",  v107,  v108,  v109,  v110,  v111,  v112,  (uint64_t)v106);
                }

                close(v80);
              }

              if (!(_DWORD)v9) {
                goto LABEL_52;
              }
            }

            else
            {
              sub_1000036BC( 0,  (uint64_t)"setup_routes: interface %s is not or no longer valid",  v72,  v73,  v74,  v75,  v76,  v77,  a1 + 308);
              uint64_t v9 = 19LL;
            }

            sub_100012438(a1);
            if ((v70 & 1) == 0)
            {
              strerror(v9);
              sub_1000036BC(0, (uint64_t)"setup_routes(%s) try #%d: %s", v119, v120, v121, v122, v123, v124, a1 + 308);
              sleep(1u);
            }

            v70 = 0;
            ++v69;
          }

          while (v69 != 4);
          strerror(v9);
          sub_1000036BC(0, (uint64_t)"setup_routes(%s): %s", v125, v126, v127, v128, v129, v130, a1 + 308);
        }
      }
    }
  }

  return v9;
}
}

void sub_100002CB4(uint64_t a1)
{
  if (qword_100034E98)
  {
    xpc_connection_cancel((xpc_connection_t)qword_100034E98);
    xpc_release((xpc_object_t)qword_100034E98);
    qword_100034E98 = 0LL;
  }

  if (qword_100035470)
  {
    dispatch_release((dispatch_object_t)qword_100035470);
    qword_100035470 = 0LL;
  }

  if (qword_100035478)
  {
    dispatch_release((dispatch_object_t)qword_100035478);
    qword_100035478 = 0LL;
  }

  if (qword_100034EA0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100034EA0);
    dispatch_release((dispatch_object_t)qword_100034EA0);
    qword_100034EA0 = 0LL;
  }

  if (qword_100034EA8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100034EA8);
    dispatch_release((dispatch_object_t)qword_100034EA8);
    qword_100034EA8 = 0LL;
  }

  sub_100010E68();
  sub_100014718();
  sub_1000118A8();
  sub_100018508();
  sub_100019CE8();
  sub_1000036BC(1u, (uint64_t)"exit: %d", v2, v3, v4, v5, v6, v7, a1);
  sub_100003A5C();
  exit(a1);
}

uint64_t sub_100002D78(const char *a1)
{
  return puts("\t-t TIMEOUT\tIdle timeout");
}

void sub_100002DFC(uint64_t a1)
{
  int v2 = sub_100010E54();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2;
  if (v2)
  {
    v23 = strerror(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    sub_1000036BC(0, (uint64_t)"pdp: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v23);
  }

  else
  {
    int v9 = sub_1000132D4();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v9;
    if (v9)
    {
      v24 = strerror(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      sub_1000036BC(0, (uint64_t)"settings: %s", v10, v11, v12, v13, v14, v15, (uint64_t)v24);
    }

    else
    {
      int v16 = sub_100011870();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v16;
      if (v16)
      {
        uint64_t v25 = strerror(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
        sub_1000036BC(0, (uint64_t)"bcast: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v25);
      }

      else
      {
        sub_10001836C();
      }
    }
  }

void sub_100002ED4()
{
  mach_service = xpc_connection_create_mach_service(off_100034B90[0], (dispatch_queue_t)qword_100035470, 1uLL);
  qword_100034E98 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_1000036BC(0, (uint64_t)"could not start xpc listener", v1, v2, v3, v4, v5, v6, v7);
    sub_100002CB4(12LL);
  }

  xpc_connection_set_event_handler(mach_service, &stru_100030C58);
  xpc_connection_resume((xpc_connection_t)qword_100034E98);
}

void sub_100002F38(id a1)
{
}

void sub_100002F58(id a1)
{
}

void sub_100002F78(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_1000036BC(2u, (uint64_t)"connection %p event from client", v4, v5, v6, v7, v8, v9, (uint64_t)a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)qword_100035470);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100003074;
    handler[3] = &unk_100030C78;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    sub_1000036BC(0, (uint64_t)"xpc connection error: %s", v11, v12, v13, v14, v15, v16, (uint64_t)string);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"unknown message type", v4, v5, v6, v7, v8, v9, v18);
  }

void sub_100003074( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      sub_1000036BC(1u, (uint64_t)"received connection error %p:%s", v20, v21, v22, v23, v24, v25, v19);
      uint64_t v32 = *(_xpc_connection_s **)(a1 + 32);
      v33 = (uint64_t *)qword_1000354C8;
      if (qword_1000354C8)
      {
        do
        {
          uint64_t v34 = *v33;
          if (*(_xpc_connection_s **)(v33[10] + 8) == v32)
          {
            sub_1000036BC(2u, (uint64_t)"found client %p for connection %p", v26, v27, v28, v29, v30, v31, (uint64_t)v33);
            sub_10000BA04(v33);
          }

          v33 = (uint64_t *)v34;
        }

        while (v34);
      }

      xpc_connection_cancel(v32);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unknown message type", v12, v13, v14, v15, v16, v17, a9);
    }

    return;
  }

  if (xpc_dictionary_get_uint64(object, off_100034B98[0]) == 1000)
  {
    xpc_connection_get_audit_token(*(void *)(a1 + 32), buffer);
    if (sub_100003544((uint64_t)buffer, (uint64_t)"com.apple.MobileInternetSharing.allow"))
    {
      int v18 = 1;
    }

    else
    {
      if (!sub_100003544((uint64_t)buffer, (uint64_t)"com.apple.vm.networking"))
      {
        sub_1000036BC( 0,  (uint64_t)"%s: xpc client does not have any vmnet entitlement, nor is it root",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)"client_entitlement_check");
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        proc_name(pid, buffer, 0x40u);
        sub_1000036BC(0, (uint64_t)" %s[%d] client access check failed", v59, v60, v61, v62, v63, v64, (uint64_t)buffer);
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        if (reply)
        {
          v72 = reply;
          xpc_dictionary_set_uint64(reply, off_100034BF8[0], 0x7D2uLL);
          sub_100004868(*(_xpc_connection_s **)(a1 + 32), v72);
          xpc_release(v72);
          return;
        }

        v73 = "xpc_dictionary_create_reply() failed";
        goto LABEL_51;
      }

      int v18 = 2;
    }
  }

  else
  {
    int v18 = 0;
  }

  v35 = (void *)xpc_connection_copy_entitlement_value( *(void *)(a1 + 32),  "com.apple.private.MobileInternetSharingStateException.allow");
  if (v35)
  {
    uint64_t v36 = v35;
    if (xpc_get_type(v35) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v36)) {
      v18 |= 4u;
    }
    xpc_release(v36);
  }

  v37 = *(_xpc_connection_s **)(a1 + 32);
  uint64_t uint64 = xpc_dictionary_get_uint64(object, off_100034B98[0]);
  if (dword_10003546C || byte_100035480)
  {
    pid_t v45 = xpc_connection_get_pid(v37);
    proc_name(v45, buffer, 0x40u);
    sub_1000035B0(uint64);
    sub_1000036BC(2u, (uint64_t)"%s ---> %s", v46, v47, v48, v49, v50, v51, (uint64_t)buffer);
  }

  switch(uint64)
  {
    case 0x3E8uLL:
      sub_1000048C8(v37, object, v18);
      break;
    case 0x3E9uLL:
      sub_100004A84(v37, object);
      break;
    case 0x3EAuLL:
      sub_1000053F0(v37, object);
      break;
    case 0x3EBuLL:
      sub_1000054E4(v37, object);
      break;
    case 0x3ECuLL:
      sub_1000055E8(v37, object);
      break;
    case 0x3EDuLL:
      sub_100005814(v37, object);
      break;
    case 0x3EEuLL:
      sub_100005928(v37, object);
      break;
    case 0x3EFuLL:
      sub_100005A9C(v37, object);
      break;
    case 0x3F0uLL:
      sub_100005B5C(v37, object);
      break;
    case 0x3F1uLL:
      sub_100005CB0(v37, object);
      break;
    case 0x3F2uLL:
      sub_100005E04(v37, object);
      break;
    case 0x3F3uLL:
      sub_100005F08(v37, object);
      break;
    case 0x3F4uLL:
      sub_1000049FC(v37, object);
      break;
    case 0x3F5uLL:
      sub_1000056EC(v37, object);
      break;
    case 0x3F6uLL:
      sub_100006048(v37, object);
      break;
    case 0x3F7uLL:
      sub_10000689C(v37, object);
      break;
    case 0x3F8uLL:
      sub_100006D70(v37, object);
      break;
    case 0x3F9uLL:
      sub_100006E38(v37, object);
      break;
    case 0x3FAuLL:
      sub_100006F28(v37, object, v38, v39, v40, v41, v42, v43);
      break;
    case 0x3FBuLL:
      sub_10000722C(v37, object, v38, v39, v40, v41, v42, v43);
      break;
    default:
      sub_1000036BC(0, (uint64_t)"incorrect xpc request type", v38, v39, v40, v41, v42, v43, v74);
      break;
  }

  if (dword_10003546C || byte_100035480)
  {
    v75 = buffer;
    sub_1000035B0(uint64);
    v73 = "%s <--- %s";
    LOBYTE(reply) = 2;
LABEL_51:
    sub_1000036BC(reply, (uint64_t)v73, v66, v67, v68, v69, v70, v71, (uint64_t)v75);
  }

BOOL sub_100003544(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  BOOL v4 = xpc_get_type(v2) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

const char *sub_1000035B0(uint64_t a1)
{
  else {
    return (&off_100030C98)[a1 - 1000];
  }
}

uint64_t sub_1000035D8()
{
  if (qword_100034EB0) {
    return 1LL;
  }
  uint64_t v1 = SCPreferencesCreate( kCFAllocatorDefault,  @"com.apple.MobileInternetSharing",  @"com.apple.MIS.logging.plist");
  qword_100034EB0 = (uint64_t)v1;
  if (v1)
  {
    if (SCPreferencesSetCallback(v1, (SCPreferencesCallBack)sub_10000371C, 0LL))
    {
      if (SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_100034EB0, (dispatch_queue_t)qword_100035470))
      {
        sub_10000371C((const __SCPreferences *)qword_100034EB0, 3, v2, v3, v4, v5, v6, v7);
        return 1LL;
      }

      uint64_t v8 = "SCPreferencesSetDispatchQueue() failed for logging: %s";
    }

    else
    {
      uint64_t v8 = "SCPreferencesSetCallback() failed for logging: %s";
    }
  }

  else
  {
    uint64_t v8 = "SCPreferencesCreate() failed for logging: %s";
  }

  int v9 = SCError();
  uint64_t v10 = SCErrorString(v9);
  sub_1000036BC(0, (uint64_t)v8, v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  uint64_t result = qword_100034EB0;
  if (qword_100034EB0)
  {
    CFRelease((CFTypeRef)qword_100034EB0);
    uint64_t result = 0LL;
    qword_100034EB0 = 0LL;
  }

  return result;
}

uint64_t sub_1000036BC( unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = sub_100003AB8();
  if ((_DWORD)result) {
    return os_log_with_args(qword_100034EB8, a1, a2, &a9, v9);
  }
  return result;
}

void sub_10000371C( const __SCPreferences *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 & 2) != 0)
  {
    sub_1000036BC(1u, (uint64_t)"logging preference changed", a3, a4, a5, a6, a7, a8, v68);
    Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"MISDLogging");
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        LODWORD(Value) = CFBooleanGetValue(Value);
      }
      else {
        LODWORD(Value) = 0;
      }
    }

    if (byte_100035480 != (_DWORD)Value)
    {
      byte_100035480 = (char)Value;
      if (!dword_10003546C)
      {
        sub_100003AB8();
        uint64_t v17 = "enabled";
        if (!(_DWORD)Value) {
          uint64_t v17 = "disabled";
        }
        sub_1000036BC(1u, (uint64_t)"verbose mode %s", v11, v12, v13, v14, v15, v16, (uint64_t)v17);
      }
    }

    int v18 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"EnablePFLog");
    CFTypeID v19 = CFBooleanGetTypeID();
    if (v18 && CFGetTypeID(v18) == v19) {
      int v26 = CFBooleanGetValue(v18);
    }
    else {
      int v26 = 0;
    }
    if (v26 != byte_100035485)
    {
      byte_100035485 = v26;
      if (v26) {
        uint64_t v27 = "true";
      }
      else {
        uint64_t v27 = "false";
      }
      sub_1000036BC(1u, (uint64_t)"EnablePFLog %s", v20, v21, v22, v23, v24, v25, (uint64_t)v27);
    }

    CFPropertyListRef v28 = SCPreferencesGetValue(a1, @"IPv6OnlyPreferred");
    CFTypeID v29 = CFBooleanGetTypeID();
    int v36 = v28 && CFGetTypeID(v28) == v29 && CFBooleanGetValue((CFBooleanRef)v28) == 0;
    if (v36 != byte_100035482)
    {
      byte_100035482 = v36;
      if (v36) {
        v37 = "true";
      }
      else {
        v37 = "false";
      }
      sub_1000036BC(1u, (uint64_t)"DisableIPv6OnlyPreferred %s", v30, v31, v32, v33, v34, v35, (uint64_t)v37);
    }

    CFPropertyListRef v38 = SCPreferencesGetValue(a1, @"IPv6UsePREF64");
    CFTypeID v39 = CFBooleanGetTypeID();
    int v46 = v38 && CFGetTypeID(v38) == v39 && CFBooleanGetValue((CFBooleanRef)v38) == 0;
    if (v46 != byte_100035483)
    {
      byte_100035483 = v46;
      if (v46) {
        uint64_t v47 = "true";
      }
      else {
        uint64_t v47 = "false";
      }
      sub_1000036BC(1u, (uint64_t)"DisableIPv6UsePREF64 %s", v40, v41, v42, v43, v44, v45, (uint64_t)v47);
    }

    CFPropertyListRef v48 = SCPreferencesGetValue(a1, @"IPv6Enable");
    CFTypeID v49 = CFBooleanGetTypeID();
    int v56 = v48 && CFGetTypeID(v48) == v49 && CFBooleanGetValue((CFBooleanRef)v48) == 0;
    if (v56 != byte_100035481)
    {
      byte_100035481 = v56;
      if (v56) {
        uint64_t v57 = "true";
      }
      else {
        uint64_t v57 = "false";
      }
      sub_1000036BC(1u, (uint64_t)"DisableIPv6 %s", v50, v51, v52, v53, v54, v55, (uint64_t)v57);
    }

    v58 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PREF64OnDualSim");
    CFTypeID v59 = CFBooleanGetTypeID();
    if (v58 && CFGetTypeID(v58) == v59) {
      int v66 = CFBooleanGetValue(v58);
    }
    else {
      int v66 = 0;
    }
    if (v66 != byte_100035484)
    {
      byte_100035484 = v66;
      if (v66) {
        uint64_t v67 = "true";
      }
      else {
        uint64_t v67 = "false";
      }
      sub_1000036BC(1u, (uint64_t)"EnablePREF64OnDualSim %s", v60, v61, v62, v63, v64, v65, (uint64_t)v67);
    }

    SCPreferencesSynchronize(a1);
  }

void sub_100003A5C()
{
  v0 = (const void *)qword_100034EB0;
  if (qword_100034EB0)
  {
    if (dword_10003546C) {
      BOOL v1 = 0;
    }
    else {
      BOOL v1 = byte_100035480 == 0;
    }
    if (!v1)
    {
      byte_100035480 = 0;
      sub_100003AB8();
      v0 = (const void *)qword_100034EB0;
    }

    CFRelease(v0);
    qword_100034EB0 = 0LL;
  }

BOOL sub_100003AB8()
{
  os_log_t v0 = (os_log_t)qword_100034EB8;
  if (!qword_100034EB8)
  {
    os_log_t v0 = os_log_create("com.apple.MobileInternetSharing", "daemon");
    qword_100034EB8 = (uint64_t)v0;
    if (!v0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100021BB0(&v2);
        os_log_t v0 = v2;
      }

      else
      {
        os_log_t v0 = 0LL;
      }
    }
  }

  return v0 != 0LL;
}

uint64_t sub_100003B30(uint64_t a1)
{
  uint64_t v2 = a1;
  return sub_100003B58(0LL, &v2);
}

uint64_t sub_100003B58(uint64_t a1, void *a2)
{
  uint64_t v2 = (uint64_t *)qword_100034EC8;
  if (!qword_100034EC8) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = (uint64_t *)v2[13];
    uint64_t v2 = v6;
  }

  while (v6);
  if (v5 && !qword_100034EC8)
  {
    sub_1000036BC( 1u,  (uint64_t)"no filters left after this remove, freeing the GCD handle",  v7,  v8,  v9,  v10,  v11,  v12,  v14);
    dispatch_source_cancel((dispatch_source_t)qword_100034ED0);
    dispatch_release((dispatch_object_t)qword_100034ED0);
    qword_100034ED0 = 0LL;
  }

  return v5;
}

uint64_t sub_100003C08()
{
  return sub_100003B58(0LL, 0LL);
}

uint64_t sub_100003C14( uint64_t a1, _OWORD *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  uint64_t v66 = a3;
  if (!qword_100034EC0)
  {
    uint64_t v33 = "failed to add low latency rule, nexus controller not present.";
    goto LABEL_12;
  }

  sub_1000036BC(1u, (uint64_t)"modifying low latency rules. remove: %d", a3, a4, a5, a6, a7, a8, a5);
  if ((v8 & 1) == 0)
  {
    uint64_t v34 = qword_100034EC8;
    if (qword_100034EC8)
    {
      unint64_t v35 = a4 / 0x3C + 2;
      while (!sub_100004250(v34, (uint64_t)a2))
      {
        uint64_t v34 = *(void *)(v34 + 104);
        if (!v34) {
          goto LABEL_10;
        }
      }

      sub_1000036BC(1u, (uint64_t)"found matching low latency filter", v13, v14, v15, v16, v17, v18, v64);
      uint64_t v40 = *(void *)(v34 + 48);
      if (v40)
      {
        uint64_t v41 = *(void **)(v34 + 48);
        while (*v41 != a3)
        {
          uint64_t v41 = (void *)v41[1];
          if (!v41) {
            goto LABEL_21;
          }
        }

        uint64_t v33 = "found matching device id in list, this means filter already exists";
        goto LABEL_12;
      }

LABEL_21:
      uint64_t v42 = malloc(0x10uLL);
      *uint64_t v42 = a3;
      v42[1] = v40;
      *(void *)(v34 + 48) = v42;
      if (v35 > *(unsigned __int16 *)(v34 + 98))
      {
        *(_WORD *)(v34 + 98) = v35;
        *(_WORD *)(v34 + 96) = v35;
        sub_1000036BC(2u, (uint64_t)"extending descriptor %p max_time to %hu", v26, v27, v28, v29, v30, v31, v34);
      }

    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, void))(v8 + 592);
    if (!v25) {
      sub_100022094();
    }
    uint64_t v17 = v25(a1 + 20, v8, *(void *)(a1 + 296));
    if (!(_DWORD)v17)
    {
      if ((v7 | 2) == 0x67 && ((*(_BYTE *)(v8 + 584) & 2) == 0 || *(_DWORD *)(v8 + 20) == 204)
        || (uint64_t v17 = sub_10001AFF0((void *)a1), !(_DWORD)v17))
      {
        uint64_t v26 = *(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 608);
        uint64_t v27 = !v4;
        if (!v26) {
          uint64_t v27 = 1;
        }
        if ((v27 & 1) != 0 || (uint64_t v17 = v26(a1 + 20, *(void *)(a1 + 296), v8), !(_DWORD)v17))
        {
          if ((v7 | 2) != 0x67
            && !*(_BYTE *)(v8 + 700)
            && ((uint64_t v36 = *(void *)(a1 + 296), *(_DWORD *)(v36 + 680)) ? (v37 = 1) : (v37 = v4),
                ((v37 & 1) != 0 || *(_BYTE *)(v36 + 564))
             && (CFPropertyListRef v38 = xpc_array_create(0LL, 0LL),
                 xpc_array_set_string(v38, 0xFFFFFFFFFFFFFFFFLL, (const char *)(v8 + 308)),
                 uint64_t v17 = sub_100021210(*(void *)(a1 + 296), v38, v39, v40, v41, v42, v43, v44),
                 xpc_release(v38),
                 (_DWORD)v17)))
          {
            sub_1000036BC(0, (uint64_t)"dns_proxy_insert_interfaces failed %d", v45, v46, v47, v48, v49, v50, v17);
          }

          else
          {
            *(_DWORD *)(a1 + 16) = 2;
            uint64_t v17 = 0LL;
            *(void *)(a1 + 304) = mach_continuous_time();
          }
        }
      }
    }
  }

        uint64_t v2 = v2->ifa_next;
        if (!v2) {
          goto LABEL_24;
        }
      }
    }

    return 0LL;
  }

  return v3;
}

  *(void *)(a1 + 592) = sub_100011A70;
  *(void *)(a1 + 600) = sub_100011C5C;
  *(void *)(a1 + 632) = 0LL;
  *(void *)(a1 + 608) = sub_100011DFC;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(void *)(a1 + 616) = sub_100011F30;
      *(void *)(a1 + 624) = sub_100011FB4;
    }

    if (!*(_DWORD *)(a1 + 304)) {
      sub_100011FE8(a1);
    }
  }

  return 0LL;
}

LABEL_24:
      if (!qword_100034ED0)
      {
        v37 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100035470);
        qword_100034ED0 = (uint64_t)v37;
        if (!v37)
        {
          uint64_t v33 = "failed to create GCD handle for filter traffic query timer";
          goto LABEL_13;
        }

        dispatch_source_set_event_handler(v37, &stru_100030D48);
        uint64_t v54 = (dispatch_source_s *)qword_100034ED0;
        dispatch_time_t v55 = dispatch_walltime(0LL, 60000000000LL);
        dispatch_source_set_timer(v54, v55, 0xDF8475800uLL, 0LL);
        byte_100034EE0 = 1;
        sub_1000036BC(2u, (uint64_t)"created GCD handle and set timer to %d seconds", v56, v57, v58, v59, v60, v61, 60LL);
      }

      if (byte_100034EE0 == 1)
      {
        dispatch_resume((dispatch_object_t)qword_100034ED0);
        byte_100034EE0 = 0;
      }

      uint64_t v32 = "add";
      goto LABEL_30;
    }

LABEL_10:
    int v67 = 786433;
    uint64_t v68 = 0LL;
    sub_1000036BC( 1u,  (uint64_t)"installing filter to ifname %s",  v13,  v14,  v15,  v16,  v17,  v18,  *(void *)(a1 + 296) + 308LL);
    uint64_t v36 = os_nexus_controller_add_traffic_rule(qword_100034EC0, *(void *)(a1 + 296) + 308LL, a2, &v67, 0LL, &v69);
    if (!(_DWORD)v36)
    {
      sub_1000036BC(2u, (uint64_t)"did not find matching filter in list, adding new filter", a3, a4, a5, a6, a7, a8, v65);
      uint64_t v43 = malloc(0x70uLL);
      __int128 v44 = a2[1];
      *uint64_t v43 = *a2;
      v43[1] = v44;
      v43[2] = a2[2];
      *((void *)v43 + 13) = qword_100034EC8;
      qword_100034EC8 = (uint64_t)v43;
      ++qword_100034ED8;
      uint64_t v45 = malloc(0x10uLL);
      *((void *)v43 + 6) = 0LL;
      *((void *)v43 + 7) = 0LL;
      *uint64_t v45 = a3;
      __int16 v46 = a4 / 0x3C + 2;
      *((_WORD *)v43 + 48) = v46;
      *((_WORD *)v43 + 49) = v46;
      sub_1000036BC( 2u,  (uint64_t)"initializing descriptor %p max_time to %hu",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)v43);
      *((void *)v43 + 10) = 0LL;
      *((void *)v43 + 11) = 0LL;
      uint64_t v53 = *((void *)v43 + 7);
      v45[1] = *((void *)v43 + 6);
      *((void *)v43 + 6) = v45;
      *((void *)v43 + 7) = v53 + 1;
      v43[4] = v69;
      goto LABEL_24;
    }

    uint64_t v63 = v36;
    uint64_t v33 = "add low latency rule failed with error code %u.\n";
LABEL_12:
    LOBYTE(v37) = 0;
LABEL_13:
    sub_1000036BC(v37, (uint64_t)v33, a3, a4, a5, a6, a7, a8, v63);
    goto LABEL_14;
  }

  sub_1000036BC(2u, (uint64_t)"device id is %llu", v13, v14, v15, v16, v17, v18, a3);
  uint64_t v19 = sub_100003B58((uint64_t)a2, &v66);
  sub_1000036BC(1u, (uint64_t)"removed %lu filters", v20, v21, v22, v23, v24, v25, v19);
  if (v19)
  {
    uint64_t v32 = "remove";
LABEL_30:
    uint64_t v39 = 1LL;
    sub_1000036BC(1u, (uint64_t)"%s filter operation succeeded", v26, v27, v28, v29, v30, v31, (uint64_t)v32);
    return v39;
  }

    uint64_t v5 = *(void *)v5;
    if (!v5) {
      goto LABEL_11;
    }
  }

  sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"mis_pf_configure_block_ip6");
  uint64_t v29 = 22LL;
LABEL_16:
  xpc_release(v13);
LABEL_17:
  PFUserClearRules(a2, v4);
  return v29;
}

  uint64_t v7 = 0;
LABEL_11:
  a3->var2 = v7;
  if ([a4 misPdpMaxHosts]) {
    int v8 = objc_msgSend(objc_msgSend(a4, "misPdpMaxHosts"), "intValue");
  }
  else {
    int v8 = 3;
  }
  a3->var3 = v8;
  -[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:]( self,  "convertConnectionStatus:ctInterfaceConnStatus:",  [a4 connectionStatus],  &a3->var4);
}

LABEL_14:
  CFPropertyListRef v38 = "add";
  if (v8) {
    CFPropertyListRef v38 = "remove";
  }
  sub_1000036BC(0, (uint64_t)"%s filter operation failed", v26, v27, v28, v29, v30, v31, (uint64_t)v38);
  return 0LL;
}

uint64_t sub_100003FEC()
{
  if (qword_100034EC0) {
    sub_100021C0C();
  }
  uint64_t result = os_nexus_controller_create();
  qword_100034EC0 = result;
  return result;
}

uint64_t sub_10000401C()
{
  uint64_t result = qword_100034EC0;
  if (qword_100034EC0)
  {
    uint64_t result = os_nexus_controller_destroy();
    qword_100034EC0 = 0LL;
  }

  return result;
}

uint64_t sub_100004048( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a2 + 9) == 96) {
    return 0LL;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
  {
    int v12 = socket(30, 2, 0);
    if (v12 < 0)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: failed to create socket: %m",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"mis_translate_addr_for_clat46");
      return 0xFFFFFFFFLL;
    }

    int v19 = v12;
    int v46 = 0;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    if ((unint64_t)__strlcpy_chk(&v44, a1 + 308, 16LL, 16LL) >= 0x10)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: failed to copy external interface name: %m",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"mis_translate_addr_for_clat46");
      goto LABEL_9;
    }

    if (ioctl(v19, 0xC02469C9uLL, &v44) < 0)
    {
      sub_1000036BC( 1u,  (uint64_t)"%s: ext interface %s does not have clat46 prefix: %m",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)"mis_translate_addr_for_clat46");
    }

    else
    {
      int v32 = sub_100007480(a1, 0, 0LL, v27, v28, v29, v30, v31);
      if (v32 != 2)
      {
        if (!v32)
        {
          char v33 = *(_BYTE *)(a2 + 8);
          if ((v33 & 4) != 0) {
            *(_OWORD *)(a2 + 12) = v45;
          }
          if ((v33 & 8) == 0
            || (uint64_t v42 = 0LL,
                int v43 = 0,
                int v41 = *(_DWORD *)(a1 + 1260),
                __memcpy_chk(&v42, a1 + 1244),
                int v40 = *(_DWORD *)(a2 + 40),
                nw_nat64_synthesize_v6(&v41, &v40, a2 + 28)))
          {
            uint64_t v9 = 0LL;
            *(_BYTE *)(a2 + 9) = 96;
            goto LABEL_21;
          }

          sub_1000036BC( 0,  (uint64_t)"%s: failed to synthesize remote address with NAT64 prefix",  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"mis_translate_addr_for_clat46");
        }

LABEL_9:
        uint64_t v9 = 0xFFFFFFFFLL;
LABEL_21:
        close(v19);
        return v9;
      }
    }

    uint64_t v9 = 0LL;
    goto LABEL_21;
  }

  sub_1000036BC( 2u,  (uint64_t)"%s: steering rule does not specify IP version",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_translate_addr_for_clat46");
  return 0LL;
}

BOOL sub_100004250(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 9);
  if (v2 == 96)
  {
    if (*(void *)(a1 + 12) != *(void *)(a2 + 12) || *(void *)(a1 + 20) != *(void *)(a2 + 20)) {
      return 0LL;
    }
    if (*(void *)(a1 + 28) != *(void *)(a2 + 28) || *(void *)(a1 + 36) != *(void *)(a2 + 36)) {
      return 0LL;
    }
  }

  else if (v2 != 4 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24) || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
  {
    return 0LL;
  }

  return 0LL;
}

uint64_t sub_100004308(uint64_t *a1, void *a2)
{
  uint64_t v4 = a1 + 6;
  uint64_t result = a1[6];
  if (result)
  {
    while (1)
    {
      uint64_t v6 = *(void *)(result + 8);
      if (!a2 || *(void *)result == *a2)
      {
        uint64_t v7 = *v4;
        int v8 = v4;
        if (*v4 != result)
        {
          do
          {
            uint64_t v9 = v7;
            uint64_t v7 = *(void *)(v7 + 8);
          }

          while (v7 != result);
          int v8 = (uint64_t *)(v9 + 8);
        }

        *int v8 = v6;
        uint64_t v10 = a1[7];
        if (!v10) {
          sub_100021C34();
        }
        a1[7] = v10 - 1;
        free((void *)result);
        if (!a1[7]) {
          break;
        }
      }

      uint64_t result = v6;
      if (!v6) {
        return result;
      }
    }

    uint64_t v11 = &qword_100034EC8;
    uint64_t v12 = qword_100034EC8;
    if ((uint64_t *)qword_100034EC8 != a1)
    {
      do
      {
        uint64_t v13 = v12;
        uint64_t v12 = *(void *)(v12 + 104);
      }

      while ((uint64_t *)v12 != a1);
      uint64_t v11 = (uint64_t *)(v13 + 104);
    }

    *uint64_t v11 = a1[13];
    if (!qword_100034ED8) {
      sub_100021C5C();
    }
    --qword_100034ED8;
    uint64_t v14 = os_nexus_controller_remove_traffic_rule(qword_100034EC0, a1 + 8);
    if ((_DWORD)v14) {
      sub_1000036BC(0, (uint64_t)"failed to remove steering rule with error %d", v15, v16, v17, v18, v19, v20, v14);
    }
    free(a1);
    return 1LL;
  }

  return result;
}

void sub_10000442C(id a1)
{
  uint64_t v12 = 0LL;
  uint64_t v7 = qword_100034EC8;
  if (qword_100034EC8)
  {
    uint64_t v8 = 0LL;
    do
    {
      if ((PFStateQueryAppendTrafficDescriptor(&v12, v7, v7 + 64) & 1) == 0)
      {
        uint64_t v9 = "failed to append descriptor to query object, skipping query";
        unsigned __int8 v10 = 0;
        goto LABEL_9;
      }

      uint64_t v7 = *(void *)(v7 + 104);
      --v8;
    }

    while (v7);
    if (!v8) {
      goto LABEL_7;
    }
    PFFindStatesByDescriptor(v12, qword_100035470, &stru_100030D88);
  }

  else
  {
LABEL_7:
    uint64_t v9 = "no filters are currently in effect, skipping query";
    unsigned __int8 v10 = 1;
LABEL_9:
    sub_1000036BC(v10, (uint64_t)v9, v1, v2, v3, v4, v5, v6, v11);
  }

void sub_1000044C4(id a1, BOOL a2, void *a3, void *a4)
{
  if (!a2)
  {
    int v46 = "query of PF states returned error status";
LABEL_21:
    sub_1000036BC(0, (uint64_t)v46, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v47);
    goto LABEL_22;
  }

  if (!a3)
  {
    int v46 = "response is NULL";
    goto LABEL_21;
  }

  if (xpc_array_get_count(a3))
  {
    size_t v15 = 0LL;
    do
    {
      xpc_object_t value = xpc_array_get_value(a3, v15);
      PFGetDescriptorStateDetails(value, &v49, 40LL);
      uint64_t v17 = qword_100034EC8;
      while (v17)
      {
        uint64_t v18 = v17;
        uint64_t v17 = *(void *)(v17 + 104);
        if (!uuid_compare((const unsigned __int8 *)(v18 + 64), v50))
        {
          sub_1000036BC(1u, (uint64_t)"found matching descriptor by uuid", v19, v20, v21, v22, v23, v24, v47);
          if (v50[16] && *(_OWORD *)(v18 + 80) != v49)
          {
            sub_1000036BC( 1u,  (uint64_t)"detected ongoing traffic during the timeout period, renewing timeout",  v25,  v26,  v27,  v28,  v29,  v30,  v48);
            sub_1000036BC( 2u,  (uint64_t)"packet count in old %llu new %llu, packet count out old %llu new %llu",  v32,  v33,  v34,  v35,  v36,  v37,  *(void *)(v18 + 80));
            *(_OWORD *)(v18 + 80) = v49;
            *(_WORD *)(v18 + 96) = *(_WORD *)(v18 + 98);
          }

          else
          {
            if (!*(_WORD *)(v18 + 96)) {
              sub_100021C84();
            }
            __int16 v31 = *(_WORD *)(v18 + 96) - 1;
            *(_WORD *)(v18 + 96) = v31;
            if (v31)
            {
              sub_1000036BC(2u, (uint64_t)"descriptor %p remaining time %hu", v25, v26, v27, v28, v29, v30, v18);
            }

            else
            {
              int v38 = sub_100004308((uint64_t *)v18, 0LL);
              __int128 v45 = "failed to remove";
              if (v38) {
                __int128 v45 = "removed";
              }
              sub_1000036BC(1u, (uint64_t)"%s descriptor from the list", v39, v40, v41, v42, v43, v44, (uint64_t)v45);
            }
          }

          break;
        }
      }

      ++v15;
    }

    while (v15 < xpc_array_get_count(a3));
  }

LABEL_22:
  if (!qword_100034EC8)
  {
    sub_1000036BC( 1u,  (uint64_t)"no filters left after this query, freeing the GCD handle",  v9,  v10,  v11,  v12,  v13,  v14,  v47);
    dispatch_source_cancel((dispatch_source_t)qword_100034ED0);
    dispatch_release((dispatch_object_t)qword_100034ED0);
    qword_100034ED0 = 0LL;
  }

  if (a3) {
    xpc_release(a3);
  }
}

uint64_t sub_1000046F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a4 || !result || !a2 || !a3) {
    sub_100021CD4();
  }
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  *(void *)(result + 32) = 0LL;
  *(_DWORD *)(result + 32) = a5;
  if (__CFADD__(dword_100035488++, 1)) {
    sub_100021CAC();
  }
  *(void *)uint64_t result = qword_1000354A0;
  qword_1000354A0 = result;
  return result;
}

void sub_10000475C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    sub_100021CFC();
  }
  uint64_t v9 = &qword_1000354A0;
  uint64_t v10 = &qword_1000354A0;
  while (1)
  {
    uint64_t v10 = (uint64_t *)*v10;
    if (!v10) {
      break;
    }
    if (v10[3] == a1)
    {
      *uint64_t v9 = *v10;
      if (!dword_100035488) {
        sub_100021D24();
      }
      --dword_100035488;
      uint64_t v13 = (_xpc_connection_s *)v10[1];
      uint64_t v12 = (void *)v10[2];
      if (*(_DWORD *)(*(void *)(a1 + 280) + 288LL) == 101) {
        sub_100014AF4(4LL, a2, a3, a4, a5, a6, a7, a8);
      }
      if (v12)
      {
        if (v13)
        {
          xpc_dictionary_set_uint64(v12, off_100034BF8[0], 0x7D3uLL);
          sub_100004868(v13, v12);
          xpc_release(v12);
        }
      }

      sub_1000036BC(1u, (uint64_t)"destroyed service request %s", a3, a4, a5, a6, a7, a8, a1 + 20);
      free(v10);
      return;
    }
  }

void sub_100004868(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v10 = xpc_copy_description(object);
  sub_1000036BC(2u, (uint64_t)"sending reply %p:\n%s", v4, v5, v6, v7, v8, v9, (uint64_t)a1);
  free(v10);
  xpc_connection_send_message(a1, object);
}

uint64_t sub_1000048C8(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v13 = reply;
    uint64_t v14 = sub_10000B3A8((uint64_t)a1);
    if (v14 || (uint64_t v14 = sub_10000B52C((uint64_t)a1, original)) != 0LL)
    {
      uint64_t v21 = sub_10000B7A0(a1, (uint64_t)v14, a3);
      if (v21)
      {
        uint64_t v28 = v21;
        xpc_dictionary_set_uint64(v13, off_100034BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v13, off_100034BA0[0], v28 + 96);
        uint64_t v29 = 1LL;
LABEL_10:
        sub_100004868(a1, v13);
        xpc_release(v13);
        return v29;
      }

      sub_1000036BC(0, (uint64_t)"client creation failed for connection %p", v22, v23, v24, v25, v26, v27, (uint64_t)a1);
      sub_10000B47C(v14, v30, v31, v32, v33, v34, v35, v36);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unable to create endpoint for %p", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    }

    xpc_dictionary_set_uint64(v13, off_100034BF8[0], 0x7D0uLL);
    uint64_t v29 = 0LL;
    goto LABEL_10;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v7, v8, v9, v10, v11, v12, v38);
  return 0LL;
}

BOOL sub_1000049FC(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    sub_10000B960(original, (uint64_t)a1);
    xpc_dictionary_set_uint64(reply, off_100034BF8[0], 0x7D1uLL);
    sub_100004868(a1, reply);
    xpc_release(reply);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v4, v5, v6, v7, v8, v9, v12);
  }

  return reply != 0LL;
}

uint64_t sub_100004A84(_xpc_connection_s *a1, xpc_object_t original)
{
  int v105 = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (!v12 || (uint64_t v19 = v12, (*(_BYTE *)(v12 + 508) & 1) == 0))
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
LABEL_8:
      uint64_t v20 = 0LL;
LABEL_9:
      uint64_t v21 = 2000LL;
LABEL_10:
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], v21);
      sub_100004868(a1, v11);
      xpc_release(v11);
      return v20;
    }

    if (*(void *)(v12 + 24))
    {
      sub_1000036BC( 0,  (uint64_t)"interface creation previously requested on this interface",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v100);
      goto LABEL_8;
    }

    uint64_t v20 = (uint64_t)malloc(0x28uLL);
    if (!v20)
    {
      sub_1000036BC(0, (uint64_t)"unable to create reply service object", v23, v24, v25, v26, v27, v28, (uint64_t)v100);
      goto LABEL_9;
    }

    xpc_object_t value = xpc_dictionary_get_value(original, off_100034C60[0]);
    if (!value || (uint64_t v36 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
    {
      uint64_t v37 = "interface parameter object is not a xpc dictionary";
LABEL_20:
      sub_1000036BC(0, (uint64_t)v37, v30, v31, v32, v33, v34, v35, (uint64_t)v100);
LABEL_21:
      free((void *)v20);
      goto LABEL_8;
    }

    xpc_object_t v38 = xpc_dictionary_get_value(original, off_100034C00[0]);
    if (!v38
      || xpc_get_type(v38) != (xpc_type_t)&_xpc_type_uint64
      || (xpc_object_t v39 = xpc_dictionary_get_value(original, off_100034C08[0])) == 0LL
      || xpc_get_type(v39) != (xpc_type_t)&_xpc_type_uint64
      || (xpc_object_t v40 = xpc_dictionary_get_value(v36, off_100034C70[0])) == 0LL
      || (uint64_t v41 = v40, xpc_get_type(v40) != (xpc_type_t)&_xpc_type_uint64)
      || xpc_uint64_get_value(v41) != 1
      && ((xpc_object_t v45 = xpc_dictionary_get_value(v36, off_100034C68[0])) == 0LL
       || xpc_get_type(v45) != (xpc_type_t)&_xpc_type_string))
    {
      uint64_t v37 = "interface parameter object is not valid for mandatory parameters";
      goto LABEL_20;
    }

    xpc_object_t v42 = xpc_dictionary_get_value(v36, off_100034C80[0]);
    if (v42 && xpc_get_type(v42) != (xpc_type_t)&_xpc_type_uint64
      || (xpc_object_t v43 = xpc_dictionary_get_value(v36, off_100034CB8[0])) != 0LL
      && xpc_get_type(v43) != (xpc_type_t)&_xpc_type_uint64
      || (xpc_object_t v44 = xpc_dictionary_get_value(v36, off_100034C88[0])) != 0LL
      && xpc_get_type(v44) != (xpc_type_t)&_xpc_type_uint64)
    {
      uint64_t v37 = "interface parameter object is not valid for optional parameters";
      goto LABEL_20;
    }

    int uint64 = xpc_dictionary_get_uint64(original, off_100034C00[0]);
    int v47 = xpc_dictionary_get_uint64(v36, off_100034CB8[0]);
    int v104 = uint64;
    if (v47) {
      BOOL v48 = 0;
    }
    else {
      BOOL v48 = uint64 == 201;
    }
    if (v48) {
      int v49 = 500;
    }
    else {
      int v49 = v47;
    }
    xpc_object_t v50 = xpc_dictionary_get_value(v36, off_100034CC0[0]);
    uint64_t v51 = v50;
    if (v50 && xpc_get_type(v50) != (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v37 = "nat64Param object is not a xpc dictionary";
      goto LABEL_20;
    }

    xpc_object_t v52 = xpc_dictionary_get_value(v36, off_100034CC8[0]);
    uint64_t v53 = v52;
    if (v52 && xpc_get_type(v52) != (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v37 = "nat66Param object is not a xpc dictionary";
      goto LABEL_20;
    }

    if (!v51 && v49 == 502)
    {
      uint64_t v37 = "nat64Param not present for nat type NAT64";
      goto LABEL_20;
    }

    memset((char *)&v106[4] + 4, 0, 28);
    memset((char *)&v106[2] + 4, 0, 32);
    memset((char *)v106 + 4, 0, 32);
    LODWORD(v106[0]) = v49;
    if (v49 == 502)
    {
      xpc_object_t v54 = xpc_dictionary_get_value(v51, off_100034CD0[0]);
      if (!v54
        || xpc_get_type(v54) != (xpc_type_t)&_xpc_type_string
        || (xpc_object_t v89 = xpc_dictionary_get_value(v51, off_100034CD8[0])) == 0LL
        || xpc_get_type(v89) != (xpc_type_t)&_xpc_type_string)
      {
        uint64_t v37 = "nat64Param object is not valid for mandatory parameters";
        goto LABEL_20;
      }

      string = xpc_dictionary_get_string(v51, off_100034CD0[0]);
      v91 = xpc_dictionary_get_string(v51, off_100034CD8[0]);
      if (!string || (v92 = v91) == 0LL)
      {
        uint64_t v37 = "Failed to get mandatory nat64 params";
        goto LABEL_20;
      }

      __strlcpy_chk((char *)&v106[3] + 2, string, 46LL, 46LL);
      __strlcpy_chk((char *)v106 + 4, v92, 46LL, 46LL);
    }

    else if (v53 && v49 == 500 && !sub_100005174(v53, (char *)v106 + 4, (_BYTE *)&v106[3] + 2))
    {
      goto LABEL_21;
    }

    dispatch_time_t v55 = (char *)xpc_dictionary_get_string(v36, off_100034C90[0]);
    uint64_t v56 = (char *)xpc_dictionary_get_string(v36, off_100034C98[0]);
    uint64_t v57 = (char *)xpc_dictionary_get_string(v36, off_100034CA0[0]);
    xpc_object_t v63 = xpc_dictionary_get_value(original, off_100034C20[0]);
    if (v63 && xpc_get_type(v63) != (xpc_type_t)&_xpc_type_string)
    {
      uint64_t v37 = "external interface name is not valid";
      goto LABEL_20;
    }

    uint64_t v64 = xpc_dictionary_get_uint64(original, off_100034C08[0]);
    v103 = (char *)xpc_dictionary_get_string(original, off_100034C20[0]);
    v102 = (char *)xpc_dictionary_get_string(v36, off_100034C68[0]);
    uint64_t v101 = xpc_dictionary_get_uint64(v36, off_100034C70[0]);
    uint64_t v65 = xpc_dictionary_get_uint64(v36, off_100034C80[0]);
    uint64_t v66 = xpc_dictionary_get_uint64(v36, off_100034C88[0]);
    int v67 = sub_1000076C4( v104,  v64,  v103,  v102,  v101,  v65,  v66,  0LL,  0LL,  0LL,  v55,  v56,  v57,  *(_DWORD *)(v19 + 508) & 0xFFFFFFFD,  v106,  0,  &v105);
    if (!v67)
    {
      else {
        v99 = xpc_dictionary_get_string(v36, off_100034C68[0]);
      }
      sub_1000036BC(0, (uint64_t)"unable to create service for %s", v93, v94, v95, v96, v97, v98, (uint64_t)v99);
      goto LABEL_21;
    }

    uint64_t v74 = (uint64_t)v67;
    int v75 = sub_1000090B0((uint64_t)v67, v19, v68, v69, v70, v71, v72, v73);
    if (!v75)
    {
      xpc_dictionary_set_string(v11, off_100034C10[0], (const char *)(v74 + 20));
      free((void *)v20);
      uint64_t v20 = 1LL;
      uint64_t v21 = 2001LL;
      goto LABEL_10;
    }

    if (v75 != 36)
    {
      sub_100007268(v74, v76, v77, v78, v79, v80, v81, v82);
      goto LABEL_21;
    }

    sub_1000046F8(v20, (uint64_t)a1, (uint64_t)v11, v74, -1);
    sub_1000036BC(2u, (uint64_t)"reply enqueued %p for interface %s", v83, v84, v85, v86, v87, v88, v20);
    return 1LL;
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, (uint64_t)v100);
    return 0LL;
  }

uint64_t sub_100005174(void *a1, char *a2, _BYTE *a3)
{
  string = xpc_dictionary_get_string(a1, off_100034CD8[0]);
  if (!string)
  {
    uint64_t v20 = "NAT66 RA Prefix is missing/invalid";
LABEL_10:
    sub_1000036BC(string, (uint64_t)v20, v6, v7, v8, v9, v10, v11, v21);
    return 0LL;
  }

  uint64_t v12 = (uint64_t)string;
  if (inet_pton(30, string, v22) != 1)
  {
    uint64_t v21 = v12;
    uint64_t v20 = "NAT66 RA Prefix (%s) is invalid";
LABEL_9:
    LOBYTE(string) = 0;
    goto LABEL_10;
  }

  if (v22[0] != 253)
  {
    uint64_t v21 = v12;
    uint64_t v20 = "NAT66 RA Prefix (%s) must start with fd00::/8";
    goto LABEL_9;
  }

  if (inet_ntop(30, v22, a2, 0x2Eu))
  {
    *a3 = 64;
    return 1LL;
  }

  sub_1000036BC(0, (uint64_t)"NAT66 RA Prefix (%s) is invalid", v13, v14, v15, v16, v17, v18, v12);
  return 0LL;
}

uint64_t sub_10000524C( char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 && !a2 && !a3) {
    return 1LL;
  }
  if (a1 && a2 && a3)
  {
    if (sub_10000CED4(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8)
      && sub_10000CED4(a2, v12, v13, v14, v15, v16, v17, v18)
      && sub_10000CED4(a3, v19, v13, v14, v15, v16, v17, v18))
    {
      in_addr_t v20 = inet_addr(a1);
      in_addr_t v21 = inet_addr(a2);
      in_addr_t v22 = inet_addr(a3);
      if (sub_10000CF4C(v22) && (int)sub_10000F300(v22) < 31)
      {
        if (sub_1000125A8(v20) && sub_1000125A8(v21))
        {
          unsigned int v36 = bswap32(v22 & v20);
          if (bswap32(v20) >= v36)
          {
            sub_1000036BC( 0,  (uint64_t)"end address %s is beyond the allowed range of network mask",  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)a2);
          }

          else
          {
            sub_1000036BC( 0,  (uint64_t)"start address %s is not in the subnet",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)a1);
          }
        }

        else
        {
          sub_1000036BC( 0,  (uint64_t)"start address %s and end address %s must beprivate addresses",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)a1);
        }
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"mask %s is not valid", v23, v24, v25, v26, v27, v28, (uint64_t)a3);
      }
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"start address %s, end address %s or mask %s is invalid",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)a1);
    }
  }

  else
  {
    if (a1) {
      uint64_t v29 = a1;
    }
    else {
      uint64_t v29 = (char *)&unk_10002576D;
    }
    sub_1000036BC( 0,  (uint64_t)"missing dhcp parameters: start address %s, end address %s or mask %s",  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)v29);
  }

  return 0LL;
}

uint64_t sub_1000053F0(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (v12 && (uint64_t v19 = v12, (*(_BYTE *)(v12 + 508) & 1) != 0))
    {
      uint64_t v21 = *(void *)(v12 + 88);
      if (v21)
      {
        sub_100009384(v21, v19);
        uint64_t v24 = sub_100003C08();
        uint64_t v22 = 1LL;
        sub_1000036BC(1u, (uint64_t)"cleared %zu filters", v25, v26, v27, v28, v29, v30, v24);
        uint64_t v23 = 2001LL;
        goto LABEL_9;
      }

      in_addr_t v20 = "service does not exist";
    }

    else
    {
      uint64_t v32 = (uint64_t)a1;
      in_addr_t v20 = "invalid client for connection %p";
      LOBYTE(v21) = 0;
    }

    sub_1000036BC(v21, (uint64_t)v20, v13, v14, v15, v16, v17, v18, v32);
    uint64_t v22 = 0LL;
    uint64_t v23 = 2000LL;
LABEL_9:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v23);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v22;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v32);
  return 0LL;
}

BOOL sub_1000054E4(_xpc_connection_s *a1, xpc_object_t original)
{
  uint64_t value = 0LL;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    BOOL v19 = v12 != 0;
    if (v12)
    {
      sub_100014808((_DWORD *)&value + 1, &value, v13, v14, v15, v16, v17, v18);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C18[0], HIDWORD(value));
      in_addr_t v20 = off_100034C28[0];
      uint64_t v21 = value;
      uint64_t v22 = v11;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client %p for connection %p", v13, v14, v15, v16, v17, v18, 0LL);
      in_addr_t v20 = off_100034BF8[0];
      uint64_t v22 = v11;
      uint64_t v21 = 2000LL;
    }

    xpc_dictionary_set_uint64(v22, v20, v21);
    sub_100004868(a1, v11);
    xpc_release(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v24);
    return 0LL;
  }

  return v19;
}

BOOL sub_1000055E8(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    if (sub_10000B980(original, (uint64_t)a1))
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C18[0]);
      if ((uint64 - 1024) > 0xFFFFFFFB)
      {
        else {
          int v28 = sub_100014A30(uint64, v19, v20, v21, v22, v23, v24, v25);
        }
        BOOL v26 = v28 == 0;
        if (v28) {
          uint64_t v27 = 2000LL;
        }
        else {
          uint64_t v27 = 2001LL;
        }
        goto LABEL_14;
      }

      sub_1000036BC(0, (uint64_t)"%d, not a valid state", v20, v21, v22, v23, v24, v25, uint64);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }

    BOOL v26 = 0LL;
    uint64_t v27 = 2000LL;
LABEL_14:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v26;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v30);
  return 0LL;
}

uint64_t sub_1000056EC(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      int v21 = sub_100015150(string);
      uint64_t v19 = off_100034BF8[0];
      if (!v21)
      {
        xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v11, off_100034C20[0], string);
        uint64_t v20 = 1LL;
        goto LABEL_8;
      }
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      uint64_t v19 = off_100034BF8[0];
    }

    xpc_dictionary_set_uint64(v11, v19, 0x7D0uLL);
    uint64_t v20 = 0LL;
LABEL_8:
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v20;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v23);
  return 0LL;
}

uint64_t sub_100005814(_xpc_connection_s *a1, xpc_object_t original)
{
  LODWORD(value) = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      sub_100014FC8((_WORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C30[0], WORD1(value));
      xpc_dictionary_set_uint64(v11, off_100034C38[0], (unsigned __int16)value);
      uint64_t v19 = 1LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D0uLL);
      uint64_t v19 = 0LL;
    }

    sub_100004868(a1, v11);
    xpc_release(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v21);
    return 0LL;
  }

  return v19;
}

uint64_t sub_100005928(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      xpc_object_t value = xpc_dictionary_get_value(original, off_100034C30[0]);
      if (value
        && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64
        && (uint64_t v27 = xpc_dictionary_get_uint64(original, off_100034C30[0]), v27 < 0x10000))
      {
        __int16 v31 = v27;
        xpc_object_t v32 = xpc_dictionary_get_value(original, off_100034C38[0]);
        if (v32)
        {
          if (xpc_get_type(v32) == (xpc_type_t)&_xpc_type_uint64)
          {
            uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C38[0]);
            if (uint64 < 0x10000)
            {
              uint64_t v19 = sub_100014F2C(v31, uint64);
              if ((_DWORD)v19) {
                uint64_t v29 = 2001LL;
              }
              else {
                uint64_t v29 = 2000LL;
              }
              goto LABEL_12;
            }
          }
        }

        int v28 = "high port is not valid";
      }

      else
      {
        int v28 = "low port is not valid";
      }

      sub_1000036BC(0, (uint64_t)v28, v21, v22, v23, v24, v25, v26, v34);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }

    uint64_t v19 = 0LL;
    uint64_t v29 = 2000LL;
LABEL_12:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v29);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v19;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply failed", v5, v6, v7, v8, v9, v10, v34);
  return 0LL;
}

BOOL sub_100005A9C(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    if (sub_10000B980(original, (uint64_t)a1))
    {
      BOOL v18 = sub_100015108();
      if (v18) {
        uint64_t v19 = 2001LL;
      }
      else {
        uint64_t v19 = 2000LL;
      }
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
      BOOL v18 = 0LL;
      uint64_t v19 = 2000LL;
    }

    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v19);
    sub_100004868(a1, v11);
    xpc_release(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v21);
    return 0LL;
  }

  return v18;
}

uint64_t sub_100005B5C(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v18 = sub_10000B980(original, (uint64_t)a1);
    if (v18)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      unsigned int v26 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        xpc_object_t value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        else {
          uint64_t v34 = 0xFFFFFFFFLL;
        }
        sub_10000BC60(v18, v26, v34, v29, v30, v31, v32, v33, v36);
        uint64_t v18 = 1LL;
        uint64_t v27 = 2001LL;
        goto LABEL_13;
      }

      sub_1000036BC(0, (uint64_t)"invalid iftype %d", v20, v21, v22, v23, v24, v25, uint64);
      uint64_t v18 = 0LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }

    uint64_t v27 = 2000LL;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v18;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v36);
  return 0LL;
}

uint64_t sub_100005CB0(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v18 = sub_10000B980(original, (uint64_t)a1);
    if (v18)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      unsigned int v26 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        xpc_object_t value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        else {
          uint64_t v29 = 0xFFFFFFFFLL;
        }
        sub_10000BD44(v18, v26, v29);
        uint64_t v18 = 1LL;
        uint64_t v27 = 2001LL;
        goto LABEL_13;
      }

      sub_1000036BC(0, (uint64_t)"invalid iftype %d", v20, v21, v22, v23, v24, v25, uint64);
      uint64_t v18 = 0LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }

    uint64_t v27 = 2000LL;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v18;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply failed", v5, v6, v7, v8, v9, v10, v31);
  return 0LL;
}

BOOL sub_100005E04(_xpc_connection_s *a1, xpc_object_t original)
{
  uint64_t value = 0LL;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    BOOL v19 = v12 != 0;
    if (v12)
    {
      sub_10000BE20(v12, (_DWORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C48[0], HIDWORD(value));
      uint64_t v20 = off_100034C50[0];
      uint64_t v21 = value;
      uint64_t v22 = v11;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      uint64_t v20 = off_100034BF8[0];
      uint64_t v22 = v11;
      uint64_t v21 = 2000LL;
    }

    xpc_dictionary_set_uint64(v22, v20, v21);
    sub_100004868(a1, v11);
    xpc_release(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v24);
    return 0LL;
  }

  return v19;
}

uint64_t sub_100005F08(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v11 = reply;
    uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
    if (v12)
    {
      uint64_t v19 = v12;
      uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      unsigned int v27 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        if (xpc_dictionary_get_value(original, off_100034C58[0]))
        {
          unsigned int v35 = xpc_dictionary_get_uint64(original, off_100034C58[0]);
          uint64_t v28 = sub_10000BE50(v19, v27, v35);
          if ((_DWORD)v28) {
            uint64_t v36 = 2001LL;
          }
          else {
            uint64_t v36 = 2000LL;
          }
          goto LABEL_13;
        }

        sub_1000036BC(0, (uint64_t)"host count is not present", v29, v30, v31, v32, v33, v34, v38);
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"invalid iftype %d", v21, v22, v23, v24, v25, v26, uint64);
      }
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }

    uint64_t v28 = 0LL;
    uint64_t v36 = 2000LL;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v36);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return v28;
  }

  sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v38);
  return 0LL;
}

uint64_t sub_100006048(_xpc_connection_s *a1, xpc_object_t original)
{
  *(_OWORD *)xpc_object_t v89 = 0u;
  memset(v90, 0, sizeof(v90));
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, (uint64_t)v81);
    return 0LL;
  }

  uint64_t v11 = reply;
  uint64_t v12 = sub_10000B980(original, (uint64_t)a1);
  if (!v12)
  {
    sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v14, v15, v16, v17, v18, v19, (uint64_t)a1);
    sub_1000036BC(0, (uint64_t)"%s FAILED", v22, v23, v24, v25, v26, v27, (uint64_t)"netrbCreateInterface");
LABEL_22:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D0uLL);
    sub_100004868(a1, v11);
    xpc_release(v11);
    return 0LL;
  }

  uint64_t v20 = v12;
  if ((*(_BYTE *)(v12 + 508) & 0xA) == 0)
  {
    uint64_t v81 = (const char *)a1;
    uint64_t v21 = "invalid client for connection %p";
    goto LABEL_19;
  }

  if (*(void *)(v12 + 24))
  {
    uint64_t v21 = "interface already requested";
LABEL_19:
    unsigned __int8 v31 = 0;
LABEL_20:
    sub_1000036BC(v31, (uint64_t)v21, v14, v15, v16, v17, v18, v19, (uint64_t)v81);
LABEL_21:
    sub_1000036BC(0, (uint64_t)"%s %s[%d] FAILED", v32, v33, v34, v35, v36, v37, (uint64_t)"netrbCreateInterface");
    goto LABEL_22;
  }

  if (*(void *)(v12 + 88))
  {
    uint64_t v21 = "service request previously requested";
    goto LABEL_19;
  }

  if ((sub_10000BBE0(v12, v13, v14, v15, v16, v17, v18, v19) & 1) == 0)
  {
    uint64_t v21 = "unable to create interface";
    goto LABEL_19;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100034C00[0]);
  int v29 = xpc_dictionary_get_uint64(original, off_100034C80[0]);
  if (v29) {
    sub_1000036BC(2u, (uint64_t)"%s: mtu %d", v14, v15, v16, v17, v18, v19, (uint64_t)"netrbCreateInterface");
  }
  if ((uint64 - 202) < 2)
  {
    uint64_t v87 = 0LL;
    BOOL v30 = 0;
  }

  else if ((_DWORD)uint64 == 204)
  {
    uint64_t v87 = (char *)xpc_dictionary_get_string(original, off_100034C20[0]);
    if (!v87 || !*v87)
    {
      uint64_t v21 = "bridged mode requires external interface";
      goto LABEL_19;
    }

    if (!sub_1000067F0(v87))
    {
      uint64_t v81 = v87;
      uint64_t v21 = "external interface '%s' is not valid";
      goto LABEL_19;
    }

    if ((*(_BYTE *)(v20 + 508) & 8) != 0)
    {
      uint64_t v74 = "bridged mode not available to limited clients";
      goto LABEL_76;
    }

    int v29 = sub_100007EDC(v87);
    BOOL v30 = xpc_dictionary_get_BOOL(original, off_100034BD0[0]);
    sub_1000036BC(2u, (uint64_t)"%s: ext_if %s mtu %d%s", v59, v60, v61, v62, v63, v64, (uint64_t)"netrbCreateInterface");
  }

  else
  {
    if ((_DWORD)uint64 != 201)
    {
      uint64_t v81 = (const char *)uint64;
      uint64_t v21 = "not valid operation mode %u";
      goto LABEL_19;
    }

    BOOL v30 = 0;
    uint64_t v87 = off_100034CB0[0];
  }

  sub_1000036BC(1u, (uint64_t)"%s %s[%d]", v14, v15, v16, v17, v18, v19, (uint64_t)"netrbCreateInterface");
  uuid = xpc_dictionary_get_uuid(original, off_100034CE0[0]);
  if (!uuid)
  {
    if ((_DWORD)uint64 == 202)
    {
      uint64_t v81 = sub_10000F488(202);
      uint64_t v21 = "%s only supported with network identifier";
      goto LABEL_19;
    }

    BOOL v85 = v30;
    uint64_t v58 = xpc_dictionary_get_string(original, off_100034C90[0]);
    uint64_t v65 = (char *)xpc_dictionary_get_string(original, off_100034C98[0]);
    uint64_t v66 = xpc_dictionary_get_string(original, off_100034CA0[0]);
    int v67 = (char *)v66;
    uint64_t v84 = v65;
    if ((_DWORD)uint64 == 204)
    {
      if (v58 || v65 || v66)
      {
        uint64_t v21 = "bridged mode doesn't support subnet options";
        goto LABEL_19;
      }
    }

    else
    {
      uint64_t v68 = (char *)v58;
      uint64_t v69 = v58;
      uint64_t v70 = v67;
      int v71 = sub_10000524C(v68, v65, v67, v15, v16, v17, v18, v19);
      int v67 = v70;
      uint64_t v58 = v69;
      uuid = 0LL;
      if (!v71) {
        goto LABEL_21;
      }
    }

    string = v67;
    xpc_object_t value = xpc_dictionary_get_value(original, off_100034CC8[0]);
    if (value)
    {
      if ((_DWORD)uint64 != 201)
      {
        uint64_t v21 = "NAT66 only applies to Internet Sharing mode";
        goto LABEL_19;
      }

      uint64_t v73 = value;
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary)
      {
        uint64_t v21 = "NAT66 object is not an xpc dictionary";
        goto LABEL_19;
      }
    }

    uint64_t v83 = 0LL;
    goto LABEL_65;
  }

  if ((_DWORD)uint64 != 202)
  {
    uint64_t v81 = sub_10000F488(uint64);
    uint64_t v21 = "%s not supported with network identifier";
    goto LABEL_19;
  }

  uint64_t v40 = (char *)xpc_dictionary_get_string(original, off_100034CE8[0]);
  string = (char *)xpc_dictionary_get_string(original, off_100034CA0[0]);
  if (v40)
  {
    if (!sub_10000CED4(v40, v41, v42, v43, v44, v45, v46, v47))
    {
      uint64_t v81 = v40;
      uint64_t v21 = "bad interface IP address: %s";
      goto LABEL_19;
    }

    unsigned __int8 v31 = string;
    if (!string)
    {
      uint64_t v21 = "missing interface network mask";
      goto LABEL_20;
    }

    in_addr_t v48 = inet_addr(string);
    if (!sub_10000CF4C(v48))
    {
      uint64_t v81 = string;
      uint64_t v21 = "mask %s is not valid";
      goto LABEL_19;
    }
  }

  int v49 = (char *)xpc_dictionary_get_string(original, off_100034CF0[0]);
  BOOL v85 = v30;
  if (!v49)
  {
    uint64_t v83 = v40;
    uint64_t v84 = 0LL;
    uint64_t v58 = 0LL;
LABEL_65:
    uint64_t v82 = 0LL;
    goto LABEL_66;
  }

  uint64_t v57 = v49;
  if (!sub_10000CF9C(v49, v50, v51, v52, v53, v54, v55, v56))
  {
    uint64_t v81 = v57;
    uint64_t v21 = "bad interface IPv6 address: %s";
    goto LABEL_19;
  }

  uint64_t v82 = v57;
  uint64_t v83 = v40;
  uint64_t v58 = 0LL;
  uint64_t v84 = 0LL;
LABEL_66:
  if (xpc_dictionary_get_value(original, off_100034BC0[0]) && !xpc_dictionary_get_BOOL(original, off_100034BC0[0]))
  {
    if ((*(_BYTE *)(v20 + 508) & 8) == 0)
    {
      char v76 = 0;
      goto LABEL_73;
    }

    uint64_t v81 = "netrbCreateInterface";
    uint64_t v74 = "%s: invalid configuration: limited client must allocate mac address";
LABEL_76:
    sub_1000036BC(0, (uint64_t)v74, v14, v15, v16, v17, v18, v19, (uint64_t)v81);
    xpc_dictionary_set_uint64(v11, off_100034BE8[0], 0x1771uLL);
    goto LABEL_21;
  }

  int v75 = xpc_dictionary_get_uuid(original, off_100034BA8[0]);
  if (sub_100015DD4(v75, v11))
  {
    uint64_t v21 = "unable to get MAC address";
    goto LABEL_19;
  }

  uint64_t v77 = xpc_dictionary_get_string(v11, off_100034BB0[0]);
  uint64_t v78 = ether_aton(v77);
  __int16 v79 = *(_WORD *)&v78->octet[4];
  *(_DWORD *)(v20 + 9) = *(_DWORD *)v78->octet;
  *(_WORD *)(v20 + 13) = v79;
  char v76 = 1;
LABEL_73:
  *(_BYTE *)(v20 + 76) = xpc_dictionary_get_BOOL(original, off_100034BC8[0]);
  *(_BYTE *)(v20 + 77) = xpc_dictionary_get_BOOL(original, off_100034BD8[0]);
  *(_BYTE *)(v20 + 78) = xpc_dictionary_get_BOOL(original, off_100034BE0[0]);
  *(_BYTE *)(v20 + 79) = v85;
  *(_BYTE *)(v20 + 8) = v76;
  *(_DWORD *)(v20 + 72) = v29;
  if (sub_10000BF18(v20))
  {
    uint64_t v21 = "interface creation failed";
    goto LABEL_19;
  }

  if (v58)
  {
    xpc_dictionary_set_string(v11, off_100034C90[0], v58);
    xpc_dictionary_set_string(v11, off_100034C98[0], v84);
    xpc_dictionary_set_string(v11, off_100034CA0[0], string);
  }

  if (v87) {
    xpc_dictionary_set_string(v11, off_100034C20[0], v87);
  }
  if (v89[0]) {
    xpc_dictionary_set_string(v11, off_100034CD8[0], v89);
  }
  if (uuid)
  {
    xpc_dictionary_set_uuid(v11, off_100034CE0[0], uuid);
    if (v83)
    {
      xpc_dictionary_set_string(v11, off_100034CE8[0], v83);
      xpc_dictionary_set_string(v11, off_100034CA0[0], string);
    }

    if (v82) {
      xpc_dictionary_set_string(v11, off_100034CF0[0], v82);
    }
  }

  *(_DWORD *)(v20 + 48) = uint64;
  *(void *)(v20 + 56) = a1;
  *(void *)(v20 + 64) = v11;
  if (__CFADD__(dword_1000354D0++, 1)) {
    sub_100021D4C();
  }
  return 1LL;
}

BOOL sub_1000067F0(const char *a1)
{
  xpc_object_t v2 = sub_100021000();
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  size_t count = xpc_array_get_count(v2);
  if (count)
  {
    size_t v5 = count;
    string = xpc_array_get_string(v3, 0LL);
    if (!strcmp(string, a1))
    {
      BOOL v11 = 1LL;
    }

    else
    {
      size_t v7 = 1LL;
      do
      {
        size_t v8 = v7;
        if (v5 == v7) {
          break;
        }
        uint64_t v9 = xpc_array_get_string(v3, v7);
        int v10 = strcmp(v9, a1);
        size_t v7 = v8 + 1;
      }

      while (v10);
      BOOL v11 = v8 < v5;
    }
  }

  else
  {
    BOOL v11 = 0LL;
  }

  xpc_release(v3);
  return v11;
}

BOOL sub_10000689C(_xpc_connection_s *a1, void *a2)
{
  if (!sub_100006AEC((uint64_t)a1, a2, (uint64_t *)&v35[1], &xdict)
    || !sub_100006BA4(a2, v35, &v39, &v40, v38, &v37, &v36))
  {
    goto LABEL_15;
  }

  uint64_t v10 = *(void *)&v35[1];
  uint64_t v11 = *(void *)(*(void *)&v35[1] + 88LL);
  if (!v11 || (uint64_t v12 = *(void *)(v11 + 288)) == 0)
  {
    uint64_t v15 = "port forwarding can't find bridge";
LABEL_14:
    sub_1000036BC(0, (uint64_t)v15, v4, v5, v6, v7, v8, v9, (uint64_t)v32);
    goto LABEL_15;
  }

  uint64_t v13 = v40;
  if (v40 == 2)
  {
    int v14 = *(_DWORD *)(v12 + 680);
    if (LODWORD(v38[0]) == v14)
    {
      sub_1000036BC( 0,  (uint64_t)"%s internal address invalid ip '%s'",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)"netrbAddPortForwardingRule");
LABEL_15:
      BOOL v16 = 0LL;
      goto LABEL_16;
    }

    if ((*(_DWORD *)(v12 + 684) & (v14 ^ LODWORD(v38[0]))) != 0)
    {
      uint64_t v32 = "netrbAddPortForwardingRule";
      uint64_t v15 = "%s internal address wrong subnet '%s'";
      goto LABEL_14;
    }
  }

  else
  {
    if (*(_DWORD *)(v12 + 1128) != 500 || *(_BYTE *)(v12 + 1107) || !*(_BYTE *)(v12 + 1178))
    {
      sub_1000036BC( 0,  (uint64_t)"%s IPv6 port forwarding not supported",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)"netrbAddPortForwardingRule");
      goto LABEL_15;
    }

    inet_pton(30, (const char *)(v12 + 1132), &v33);
    if (v33 != v38[0])
    {
      inet_ntop(30, v38, v41, 0x2Eu);
      sub_1000036BC( 0,  (uint64_t)"%s IPv6 address %s not on prefix %s",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"netrbAddPortForwardingRule");
      goto LABEL_15;
    }

    if (!v38[1])
    {
      inet_ntop(30, v38, v41, 0x2Eu);
      sub_1000036BC( 0,  (uint64_t)"%s IPv6 address %s can't be the prefix %s",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)"netrbAddPortForwardingRule");
      goto LABEL_15;
    }
  }

  BOOL v16 = sub_10001CC08(v10, v35[0], v39, v13, v38, v37, v8, v9) == 0;
LABEL_16:
  xpc_object_t v17 = xdict;
  if (xdict)
  {
    if (v16) {
      uint64_t v18 = 2001LL;
    }
    else {
      uint64_t v18 = 2000LL;
    }
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v18);
    sub_100004868(a1, v17);
    xpc_release(v17);
  }

  return v16;
}

uint64_t sub_100006AEC(uint64_t a1, xpc_object_t original, uint64_t *a3, void *a4)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_1000036BC(0, (uint64_t)"port forwarding xpc_dictionary_create_reply() failed", v8, v9, v10, v11, v12, v13, v24);
    uint64_t v22 = 0LL;
LABEL_8:
    uint64_t result = 0LL;
    goto LABEL_9;
  }

  uint64_t v15 = sub_10000B980(original, a1);
  uint64_t v22 = v15;
  if (!v15)
  {
    sub_1000036BC(0, (uint64_t)"port forwarding no client for connection %p", v16, v17, v18, v19, v20, v21, a1);
    goto LABEL_8;
  }

  if (*(_DWORD *)(v15 + 48) != 201)
  {
    sub_1000036BC(0, (uint64_t)"port forwarding rules available only in shared mode", v16, v17, v18, v19, v20, v21, v24);
    goto LABEL_8;
  }

  uint64_t result = 1LL;
LABEL_9:
  *a4 = reply;
  *a3 = v22;
  return result;
}

uint64_t sub_100006BA4(void *a1, _BYTE *a2, _WORD *a3, _BYTE *a4, void *a5, _WORD *a6, uint64_t *a7)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100034CF8[0]);
  if (!value || (uint64_t v20 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
  {
    uint64_t v21 = "port forwarding rule missing/invalid";
LABEL_4:
    sub_1000036BC(0, (uint64_t)v21, v14, v15, v16, v17, v18, v19, v43);
    uint64_t v22 = 0LL;
    goto LABEL_5;
  }

  char uint64 = xpc_dictionary_get_uint64(v20, off_100034D20[0]);
  *a4 = uint64;
  if (uint64 != 2 && uint64 != 30)
  {
    uint64_t v21 = "port forwarding rule invalid address family";
    goto LABEL_4;
  }

  if (a2)
  {
    char v26 = xpc_dictionary_get_uint64(v20, off_100034D08[0]);
    *a2 = v26;
    if (v26 != 6 && v26 != 17)
    {
      uint64_t v21 = "port forwarding rule contains missing/invalid protocol";
      goto LABEL_4;
    }
  }

  if (a3)
  {
    __int16 v28 = xpc_dictionary_get_uint64(v20, off_100034D10[0]);
    *a3 = v28;
    if (!v28)
    {
      uint64_t v21 = "port forwarding rule invalid/missing external port";
      goto LABEL_4;
    }
  }

  if (a6)
  {
    __int16 v29 = xpc_dictionary_get_uint64(v20, off_100034D28);
    *a6 = v29;
    if (!v29)
    {
      uint64_t v21 = "port forwarding rule invalid/missing internal port";
      goto LABEL_4;
    }
  }

  if (a5)
  {
    string = xpc_dictionary_get_string(v20, off_100034D18[0]);
    uint64_t v22 = (uint64_t)string;
    if (!string)
    {
      sub_1000036BC( 0,  (uint64_t)"port forwarding rule missing/invalid internal address",  v31,  v32,  v33,  v34,  v35,  v36,  v43);
LABEL_5:
      uint64_t result = 0LL;
      if (!a7) {
        return result;
      }
      goto LABEL_6;
    }

    if (!inet_pton(*a4, string, a5))
    {
      sub_1000036BC(0, (uint64_t)"port forwarding rule invalid internal address '%s'", v37, v38, v39, v40, v41, v42, v22);
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  uint64_t result = 1LL;
  if (a7) {
LABEL_6:
  }
    *a7 = v22;
  return result;
}

BOOL sub_100006D70(_xpc_connection_s *a1, void *a2)
{
  BOOL v8 = sub_100006AEC((uint64_t)a1, a2, &v14, &xdict)
  xpc_object_t v9 = xdict;
  if (xdict)
  {
    if (v8) {
      uint64_t v10 = 2001LL;
    }
    else {
      uint64_t v10 = 2000LL;
    }
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v10);
    sub_100004868(a1, v9);
    xpc_release(v9);
  }

  return v8;
}

BOOL sub_100006E38(_xpc_connection_s *a1, void *a2)
{
  if (sub_100006AEC((uint64_t)a1, a2, &v10, &xdict)
    && sub_100006BA4(a2, 0LL, 0LL, &v11, 0LL, 0LL, 0LL))
  {
    xpc_object_t v4 = sub_10001D004(v10, v11);
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0LL;
    xpc_object_t v4 = 0LL;
  }

  xpc_object_t v6 = xdict;
  if (xdict)
  {
    if (v5) {
      uint64_t v7 = 2001LL;
    }
    else {
      uint64_t v7 = 2000LL;
    }
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v7);
    if (v4) {
      xpc_dictionary_set_value(v6, off_100034D00[0], v4);
    }
    sub_100004868(a1, v6);
    xpc_release(v6);
  }

  if (v4) {
    xpc_release(v4);
  }
  return v5;
}

uint64_t sub_100006F28( _xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100006F64(a1, a2, 0LL);
}

uint64_t sub_100006F64(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B980(a2, (uint64_t)a1);
  if (!v6)
  {
    sub_1000036BC(0, (uint64_t)"invalid client for connection %p", v7, v8, v9, v10, v11, v12, (uint64_t)a1);
LABEL_19:
    uint64_t v25 = 0LL;
    goto LABEL_20;
  }

  uint64_t v13 = *(void *)(v6 + 88);
  if (!v13)
  {
    sub_1000036BC( 1u,  (uint64_t)"requesting client does not have an associated service, finding service from global list.",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v49);
    uint64_t v13 = qword_100035490;
    if (!qword_100035490)
    {
      uint64_t v20 = "service is not started";
      goto LABEL_18;
    }
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v52 = 0u;
  if ((sub_1000022C8(a2, (uint64_t)&v52, v7, v8, v9, v10, v11, v12) & 1) == 0)
  {
    uint64_t v20 = "request object failed validation test.";
LABEL_18:
    sub_1000036BC(0, (uint64_t)v20, v7, v8, v9, v10, v11, v12, (uint64_t)v49);
    goto LABEL_19;
  }

  uint64_t v51 = 0LL;
  if (BYTE9(v52) == 4 && (~BYTE8(v52) & 0x14) == 0 && PFQueryGatewayAddrAndPortForDescriptor(&v52, &v51))
  {
    DWORD2(v53) = v51;
    WORD6(v54) = WORD2(v51);
    sub_1000036BC( 1u,  (uint64_t)"%s: PFSetGatewayAddrAndPortForDescriptor success",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"netrbModifyLowLatencyFlow");
  }

  else
  {
    sub_1000036BC( 1u,  (uint64_t)"%s: deleting local addr and port",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"netrbModifyLowLatencyFlow");
    BYTE8(v52) &= 0xEBu;
  }

  if ((sub_100004048(*(void *)(v13 + 296), (uint64_t)&v52, v14, v15, v16, v17, v18, v19) & 0x80000000) != 0)
  {
    int v49 = "netrbModifyLowLatencyFlow";
    uint64_t v20 = "%s: failed to translate addresses for 464xlat";
    goto LABEL_18;
  }

  LOBYTE(v52) = 2;
  WORD1(v52) = 48;
  DWORD1(v52) = 3;
  xpc_object_t value = xpc_dictionary_get_value(a2, netrbClientLowLatencyFlowParam[0]);
  xpc_object_t v22 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorDeviceId[0]);
  else {
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  xpc_object_t v37 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
  if (v37 && (uint64_t v41 = v37, xpc_get_type(v37) == (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v42 = xpc_uint64_get_value(v41);
    sub_1000036BC(1u, (uint64_t)"setting connection idle timeout %llu", v43, v44, v45, v46, v47, v48, v42);
  }

  else
  {
    uint64_t v42 = 300LL;
  }

  uint64_t v25 = sub_100003C14(v13, &v52, v24, v42, a3, v38, v39, v40);
LABEL_20:
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    uint64_t v33 = reply;
    if ((_DWORD)v25) {
      uint64_t v34 = 2001LL;
    }
    else {
      uint64_t v34 = 2000LL;
    }
  }

  else
  {
    uint64_t v34 = 2000LL;
    do
    {
      sub_1000036BC(0, (uint64_t)"failed to create xpc reply dictionary.", v27, v28, v29, v30, v31, v32, v50);
      xpc_object_t v35 = xpc_dictionary_create_reply(a2);
    }

    while (!v35);
    uint64_t v33 = v35;
    uint64_t v25 = 0LL;
  }

  xpc_dictionary_set_uint64(v33, off_100034BF8[0], v34);
  sub_100004868(a1, v33);
  xpc_release(v33);
  return v25;
}

uint64_t sub_10000722C( _xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100006F64(a1, a2, 1LL);
}

void sub_100007268( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16)) {
    sub_100021DC4();
  }
  uint64_t v9 = *(void *)(a1 + 280);
  if (v9)
  {
    int v10 = *(_DWORD *)(v9 + 288);
    if (v10 != 101 && (v10 != 103 || (*(_BYTE *)(v9 + 584) & 2) != 0 && *(_DWORD *)(v9 + 20) != 204)) {
      sub_10001C4D0((void *)a1, a2, a3, a4, a5, a6, a7, a8);
    }
  }

  uint64_t v11 = *(void *)(a1 + 288);
  if (v11)
  {
    uint64_t v12 = *(void (**)(void))(v11 + 624);
    if (!v12) {
      sub_100021D9C();
    }
    v12();
  }

  uint64_t v13 = *(uint64_t **)(a1 + 280);
  if (v13)
  {
    sub_100007378(v13, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 280) = 0LL;
  }

  uint64_t v14 = *(uint64_t **)(a1 + 288);
  if (v14)
  {
    sub_100007378(v14, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 288) = 0LL;
  }

  uint64_t v15 = *(uint64_t **)(a1 + 296);
  if (v15)
  {
    sub_100007378(v15, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 296) = 0LL;
  }

  uint64_t v16 = &qword_100035490;
  *uint64_t v16 = *(void *)a1;
  if (!dword_100034EE8) {
    sub_100021D74();
  }
  --dword_100034EE8;
  sub_1000036BC(1u, (uint64_t)"destroying service %s", a3, a4, a5, a6, a7, a8, a1 + 20);
  free((void *)a1);
}

void sub_100007378( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *((_DWORD *)a1 + 2);
  if (!v8) {
    sub_100021DEC();
  }
  int v10 = v8 - 1;
  *((_DWORD *)a1 + 2) = v10;
  if (!v10)
  {
    uint64_t v11 = (void (*)(uint64_t *))a1[75];
    if (v11) {
      v11(a1);
    }
    uint64_t v12 = &qword_100035498;
    *uint64_t v12 = *a1;
    if (!dword_100034F08) {
      sub_100021E14();
    }
    --dword_100034F08;
    int v14 = *((_DWORD *)a1 + 4);
    uint64_t v15 = "external";
    if (v14 != 1) {
      uint64_t v15 = "unknown";
    }
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = "internal";
    }
    sub_1000036BC(2u, (uint64_t)"destroying %s interface (%s) devname %s@%d", a3, a4, a5, a6, a7, a8, (uint64_t)v16);
    free(a1);
  }

uint64_t sub_100007480( uint64_t a1, char a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 1264) != 1 || (a2 & 1) != 0)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    int v11 = socket(30, 2, 0);
    if (v11 < 0)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: failed to create socket: %m",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"mis_query_nat64_prefix");
      *(_DWORD *)(a1 + 1264) = -1;
      return 1LL;
    }

    int v18 = v11;
    if ((unint64_t)__strlcpy_chk(&v35, a1 + 308, 16LL, 16LL) >= 0x10)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: failed to copy interface name: %m",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"mis_query_nat64_prefix");
      uint64_t v10 = 1LL;
LABEL_13:
      *(_DWORD *)(a1 + 1264) = -1;
LABEL_14:
      close(v18);
      return v10;
    }

    if (ioctl(v18, 0xC06069C1uLL, &v35) < 0)
    {
      sub_1000036BC( 1u,  (uint64_t)"%s: interface %s does not have nat64 prefix: %m",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"mis_query_nat64_prefix");
      goto LABEL_12;
    }

    if ((v37 - 13) <= 0xFFFFFFF3)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: invalid NAT64 prefix length",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"mis_query_nat64_prefix");
LABEL_12:
      uint64_t v10 = 2LL;
      goto LABEL_13;
    }

    *(_DWORD *)(a1 + 1264) = 1;
    if (*(void *)(a1 + 1244) == (void)v36
      && *(void *)(a1 + 1252) == *((void *)&v36 + 1)
      && *(_DWORD *)(a1 + 1260) == (unint64_t)v37)
    {
      sub_1000036BC( 1u,  (uint64_t)"%s: same nat64 prefix",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"mis_query_nat64_prefix");
      if (a3)
      {
        char v34 = 0;
        goto LABEL_27;
      }
    }

    else
    {
      *(_OWORD *)(a1 + 1244) = v36;
      *(_DWORD *)(a1 + 1260) = v37;
      if (a3)
      {
        char v34 = 1;
LABEL_27:
        *a3 = v34;
      }
    }

    sub_1000036BC( 1u,  (uint64_t)"%s: successfully queried the NAT64 prefix of external interface %s",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"mis_query_nat64_prefix");
    uint64_t v10 = 0LL;
    goto LABEL_14;
  }

  sub_1000036BC( 0,  (uint64_t)"%s: using cached NAT64 prefix",  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_query_nat64_prefix");
  return 0LL;
}

char *sub_1000076C4( int a1, uint64_t a2, char *__s1, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 *src, uint64_t a10, char *a11, const char *a12, const char *a13, int a14, _OWORD *a15, int a16, int *a17)
{
  unsigned int v17 = a1 - 200;
  if ((a1 - 200) >= 5)
  {
    uint64_t v26 = "incorrect operation mode";
LABEL_8:
    sub_1000036BC(0, (uint64_t)v26, (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, a8, v142);
    goto LABEL_9;
  }

  int v18 = a2 - 300;
  if ((a2 - 300) >= 5)
  {
    uint64_t v142 = a2;
    uint64_t v26 = "incorrect bridge type %u";
    goto LABEL_8;
  }

  int v20 = a7;
  int v21 = a6;
  int v22 = a5;
  uint64_t v25 = dword_1000250C8[v17];
  if ((_DWORD)a5 == 1 && v17 >= 2)
  {
    sub_1000036BC( 0,  (uint64_t)"auth device is specific to internet sharing mode instead of %d",  (uint64_t)__s1,  (uint64_t)a4,  a5,  a6,  a7,  a8,  dword_1000250C8[v17]);
LABEL_9:
    uint64_t v27 = 0LL;
    int v28 = 22;
LABEL_10:
    *a17 = v28;
    return v27;
  }

  if ((_DWORD)a5 == 1 && (_DWORD)a2 != 301)
  {
    sub_1000036BC( 0,  (uint64_t)"auth device should be configured with no bridge instead of %d",  (uint64_t)__s1,  (uint64_t)a4,  a5,  a6,  a7,  a8,  dword_1000250F0[v18]);
    goto LABEL_9;
  }

  if ((_DWORD)a5 == 1) {
    uint64_t v30 = "_auth";
  }
  else {
    uint64_t v30 = a4;
  }
  if ((_DWORD)a5 == 1) {
    int v31 = 101;
  }
  else {
    int v31 = dword_1000250DC[v17];
  }
  if (!a15) {
    sub_100021E3C();
  }
  if ((*(_DWORD *)a15 - 500) >= 3)
  {
    sub_1000036BC(0, (uint64_t)"incorrect NAT type %u", (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, a8, *(unsigned int *)a15);
    goto LABEL_9;
  }

  if (v17 <= 1 && *(_DWORD *)a15 == 501)
  {
    uint64_t v26 = "no NAT specified for internet sharing mode";
    goto LABEL_8;
  }

  int v149 = v31;
  int v147 = dword_1000250F0[v18];
  v152 = (char *)v30;
  BOOL v150 = (_DWORD)a5 != 1;
  if ((_DWORD)a5 != 1 && !if_nametoindex(a4))
  {
    sub_1000036BC(0, (uint64_t)"device name is not valid %s", v32, v33, v34, v35, v36, v37, (uint64_t)a4);
    goto LABEL_9;
  }

  if (__s1)
  {
    int v38 = *__s1;
    if (*__s1)
    {
      if (v17 != 4 && !strncmp(__s1, off_100034CB0[0], 0x10uLL))
      {
        sub_1000036BC(2u, (uint64_t)"%s, using any external interface", v39, v40, v41, v42, v43, v44, (uint64_t)v152);
        int v38 = 1;
      }

      else
      {
        if (!if_nametoindex(__s1))
        {
          sub_1000036BC(0, (uint64_t)"%s, can't find external interface %s", v45, v46, v47, v48, v49, v50, (uint64_t)v152);
          goto LABEL_9;
        }

        int v38 = 0;
      }

      if ((_DWORD)v25 != 201 && (_DWORD)v25 != 204)
      {
        sub_1000036BC( 0,  (uint64_t)"%s, external interface %s is valid only with internet sharing and bridged mode",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)v152);
        goto LABEL_9;
      }
    }
  }

  else
  {
    int v38 = 0;
  }

  unsigned int v148 = v38;
  if (v17 <= 1)
  {
    if (v38)
    {
      uint64_t v51 = qword_100035498;
      if (qword_100035498)
      {
        __s2 = off_100034CB0[0];
        while (*(_DWORD *)(v51 + 16) != 1
             || *(_DWORD *)(v51 + 1128) != 502
             || *(_DWORD *)(v51 + 20) != 201
             || !strncmp((const char *)(v51 + 308), __s2, 0x100uLL))
        {
          uint64_t v51 = *(void *)v51;
          if (!v51) {
            goto LABEL_56;
          }
        }

        sub_1000036BC( 0,  (uint64_t)"VMNet in NAT mode can't be started now due to an active NAT64 InternetSharing session on %s",  v52,  v53,  v54,  v55,  v56,  v57,  v51 + 308);
LABEL_94:
        uint64_t v27 = 0LL;
        int v28 = 16;
        goto LABEL_10;
      }
    }

    else if (__s1)
    {
      if (*(_DWORD *)a15 == 502)
      {
        if (*__s1)
        {
          uint64_t v58 = qword_100035498;
          if (qword_100035498)
          {
            __s2a = off_100034CB0[0];
            while (*(_DWORD *)(v58 + 16) != 1
                 || *(_DWORD *)(v58 + 20) != 201
                 || strncmp((const char *)(v58 + 308), __s2a, 0x100uLL))
            {
              uint64_t v58 = *(void *)v58;
              if (!v58) {
                goto LABEL_56;
              }
            }

            sub_1000036BC( 0,  (uint64_t)"NAT64 InternetSharing session on %s can't be started now due to active VMNet session",  v59,  v60,  v61,  v62,  v63,  v64,  (uint64_t)__s1);
            goto LABEL_94;
          }
        }
      }
    }
  }

LABEL_56:
  uint64_t v65 = (char *)malloc(0x138uLL);
  uint64_t v27 = v65;
  if (!v65)
  {
    uint64_t v84 = strerror(12);
    sub_1000036BC(0, (uint64_t)"unable to create service %s", v85, v86, v87, v88, v89, v90, (uint64_t)v84);
    *a17 = 12;
    return v27;
  }

  BOOL v66 = 0;
  *((void *)v65 + 38) = 0LL;
  *((_OWORD *)v65 + 17) = 0u;
  *((_OWORD *)v65 + 18) = 0u;
  *((_OWORD *)v65 + 15) = 0u;
  *((_OWORD *)v65 + 16) = 0u;
  *((_OWORD *)v65 + 13) = 0u;
  *((_OWORD *)v65 + 14) = 0u;
  *((_OWORD *)v65 + 11) = 0u;
  *((_OWORD *)v65 + 12) = 0u;
  *((_OWORD *)v65 + 9) = 0u;
  *((_OWORD *)v65 + 10) = 0u;
  *((_OWORD *)v65 + 7) = 0u;
  *((_OWORD *)v65 + 8) = 0u;
  *((_OWORD *)v65 + 5) = 0u;
  *((_OWORD *)v65 + 6) = 0u;
  *((_OWORD *)v65 + 3) = 0u;
  *((_OWORD *)v65 + 4) = 0u;
  *((_OWORD *)v65 + 1) = 0u;
  *((_OWORD *)v65 + 2) = 0u;
  char v67 = !v150;
  if (v18 == 1) {
    char v67 = 1;
  }
  *(_OWORD *)uint64_t v65 = 0uLL;
  uint64_t v68 = v152;
  if ((v67 & 1) == 0 && dword_100034D30)
  {
    uint64_t v68 = v152;
    BOOL v66 = sub_100007D98(v152) == 0;
  }

  BOOL v151 = v66;
  uint64_t v69 = sub_100007E84(v68);
  if (v69)
  {
    sub_100007378(v69, v70, v71, v72, v73, v74, v75, v76);
    sub_1000036BC(0, (uint64_t)"device name %s is already used", v77, v78, v79, v80, v81, v82, (uint64_t)v68);
    int v83 = 17;
LABEL_88:
    *a17 = v83;
    free(v27);
    return 0LL;
  }

  if (v22 != 1 && !v21) {
    int v21 = sub_100007EDC(v152);
  }
  uint64_t v91 = sub_100008024(__s1, v149, v25, v148, (uint64_t)a15, v74, v75, v76);
  if (!v91)
  {
    sub_1000036BC(0, (uint64_t)"no external interface to service %s", v92, v93, v94, v95, v96, v97, (uint64_t)v152);
    goto LABEL_87;
  }

  uint64_t v98 = (const char *)(v91 + 308);
  __s2b = (char *)v91;
  int v99 = *(unsigned __int8 *)(v91 + 1107);
  if (!v151)
  {
    v131 = sub_1000082F0( 0,  v25,  v147,  v152,  v98,  v22,  v149,  v21,  v20,  0,  a8,  a11,  a12,  a13,  a14,  v148,  a15,  v99 != 0,  src,  a10,  a16);
    if (v131)
    {
      v108 = v131;
      v110 = 0LL;
      goto LABEL_84;
    }

LABEL_86:
    sub_100007378((uint64_t *)__s2b, v101, v102, v103, v104, v105, v106, v107);
    goto LABEL_87;
  }

  v143 = (char *)(v91 + 308);
  v100 = sub_1000082F0( 0,  v25,  v147,  v152,  v98,  v22,  v149,  v21,  (int)&_mh_execute_header,  (unint64_t)&_mh_execute_header >> 32,  a8,  0LL,  0LL,  0LL,  a14,  v148,  a15,  v99 != 0,  src,  0LL,  a16);
  if (!v100) {
    goto LABEL_86;
  }
  v108 = v100;
  if (v17 == 4) {
    v109 = __s1;
  }
  else {
    v109 = v143;
  }
  v110 = sub_100008720( *((_DWORD *)v100 + 74),  a11,  a12,  a13,  v25,  v147,  v109,  a14,  v148,  a15,  __s2b[1107],  src,  a10,  a16);
  if (!v110)
  {
    sub_100007378(v108, v111, v112, v113, v114, v115, v116, v117);
    sub_100007378((uint64_t *)__s2b, v118, v119, v120, v121, v122, v123, v124);
    sub_1000036BC(0, (uint64_t)"no bridge interface to service %s", v125, v126, v127, v128, v129, v130, (uint64_t)v152);
LABEL_87:
    int v83 = 6;
    goto LABEL_88;
  }

LABEL_84:
  int v132 = dword_100034EEC++;
  *((_DWORD *)v27 + 69) = v132;
  *((_DWORD *)v27 + 4) = 0;
  *((void *)v27 + 36) = v110;
  *((void *)v27 + 37) = __s2b;
  *((void *)v27 + 35) = v108;
  unsigned int v133 = *((_DWORD *)v108 + 72) - 100;
  if (v133 > 4) {
    v134 = "unknown";
  }
  else {
    v134 = off_100030E68[v133];
  }
  snprintf(v27 + 20, 0x100uLL, "%s.%s-%d", "com.apple.MobileInternetSharing", v134, v132);
  *(void *)uint64_t v27 = qword_100035490;
  qword_100035490 = (uint64_t)v27;
  sub_1000036BC(1u, (uint64_t)"creating service %s", v135, v136, v137, v138, v139, v140, (uint64_t)(v27 + 20));
  if (__CFADD__(dword_100034EE8++, 1)) {
    sub_100021E64();
  }
  *a17 = 0;
  return v27;
}

      if (*((_BYTE *)v12 + 281))
      {
        if (*((_BYTE *)v12 + 80) && *(_DWORD *)(a1[35] + 288LL) != 103)
        {
          sub_10001ADB0((uint64_t)v12, v37);
          if (v36) {
            goto LABEL_78;
          }
          goto LABEL_79;
        }
      }

      else if (*(_BYTE *)(v9 + 1178) && *(_DWORD *)(v9 + 288) != 103)
      {
        sub_10001A9B8((uint64_t)v12, v37);
        if (v36) {
          goto LABEL_78;
        }
        goto LABEL_79;
      }

      sub_10001C314((uint64_t)v12, v37);
      if (v36) {
        goto LABEL_78;
      }
      goto LABEL_79;
    }

    PFUserDeleteRules(v36, 0LL, 0LL);
    PFUserDeleteRules(v37, 0LL, 0LL);
LABEL_77:
    uint64_t v35 = 0LL;
    goto LABEL_78;
  }

  uint64_t v34 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0LL);
  if (!v34) {
    return;
  }
  uint64_t v35 = v34;
  if (v26 >= 2)
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    goto LABEL_46;
  }

  PFUserDeleteRules(0LL, 0LL, 0LL);
  PFUserDeleteRules(v35, 0LL, 0LL);
LABEL_82:
  PFUserRelease(v35, 0LL);
}

uint64_t sub_100007D98(const char *a1)
{
  uint64_t v15 = 0LL;
  if (!a1 || !*a1) {
    sub_100021E8C();
  }
  if (getifaddrs(&v15))
  {
    uint64_t v2 = *__error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v14);
    uint64_t v9 = v15;
    if (!v15) {
      return v2;
    }
    goto LABEL_13;
  }

  uint64_t v9 = v15;
  if (v15)
  {
    uint64_t v10 = v15;
    while (1)
    {
      if (!strncmp(a1, v10->ifa_name, 0x10uLL))
      {
        ifa_addr = v10->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18) {
            break;
          }
        }
      }

      uint64_t v10 = v10->ifa_next;
      if (!v10) {
        goto LABEL_12;
      }
    }

    if (ifa_addr->sa_data[4] == 6)
    {
      ifa_data = (unsigned __int8 *)v10->ifa_data;
      if (!ifa_data || *ifa_data != 209)
      {
        uint64_t v2 = 0LL;
        if (!v9) {
          return v2;
        }
        goto LABEL_13;
      }
    }
  }

LABEL_12:
  uint64_t v2 = 22LL;
  if (v9) {
LABEL_13:
  }
    freeifaddrs(v9);
  return v2;
}

    sub_1000036BC(0, (uint64_t)"could not add member %s to interface %s", v21, v22, v23, v24, v25, v26, (uint64_t)a1);
    return v27;
  }

  uint64_t v27 = *__error();
  uint64_t v35 = "socket: %m";
LABEL_25:
  sub_1000036BC(0, (uint64_t)v35, v29, v30, v31, v32, v33, v34, v78);
  if ((_DWORD)v27) {
    goto LABEL_26;
  }
LABEL_20:
  if ((v12 & 1) == 0)
  {
    sub_10000E15C(a1);
    uint64_t v51 = sub_10000CFE8((uint64_t)a1, 1);
    if ((_DWORD)v51)
    {
      uint64_t v27 = v51;
      uint64_t v79 = strerror(v51);
      sub_1000036BC(0, (uint64_t)"bridge add member, setifflags: %s", v52, v53, v54, v55, v56, v57, (uint64_t)v79);
LABEL_30:
      sub_100019330((uint64_t)a1, (uint64_t)__s1);
      goto LABEL_31;
    }

    if (v11) {
      uint64_t v58 = ((*((_DWORD *)v14 + 7) == 304) << 11) | 0x10000;
    }
    else {
      uint64_t v58 = (*((_DWORD *)v14 + 7) == 304) << 11;
    }
    if (v58)
    {
      uint64_t v59 = sub_1000191FC((uint64_t)a1, (uint64_t)__s1, v58);
      if ((_DWORD)v59)
      {
        uint64_t v27 = v59;
        strerror(v59);
        sub_1000036BC( 0,  (uint64_t)"%s(%s) set bridge member flags 0x%x failed: %s",  v66,  v67,  v68,  v69,  v70,  v71,  (uint64_t)__s1);
        goto LABEL_30;
      }

      sub_1000036BC(1u, (uint64_t)"%s(%s) set bridge member flags 0x%x", v60, v61, v62, v63, v64, v65, (uint64_t)__s1);
    }

    if (v13) {
      sub_10000EA48(a1);
    }
    goto LABEL_42;
  }

  if (!v10)
  {
LABEL_42:
    uint64_t v27 = 0LL;
    goto LABEL_43;
  }

  int v38 = sub_1000191FC((uint64_t)a1, (uint64_t)__s1, 0x8000);
  uint64_t v27 = v38;
  if ((_DWORD)v38)
  {
    strerror(v38);
    sub_1000036BC( 0,  (uint64_t)"%s(%s) set bridge member MAC_NAT failed: %s",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)__s1);
  }

  else
  {
    sub_1000036BC(1u, (uint64_t)"%s(%s) set bridge member MAC_NAT", v39, v40, v41, v42, v43, v44, (uint64_t)__s1);
  }

    uint64_t v8 = *(void *)v8;
    if (!v8) {
      goto LABEL_73;
    }
  }

  uint64_t v58 = *(_DWORD *)(v8 + 56);
  uint64_t v114 = *(_DWORD *)(v8 + 52);
  uint64_t v59 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v59)
  {
    BOOL v66 = v59;
    xpc_dictionary_set_string(v59, kPFSubAddress, "127.0.0.1");
    xpc_dictionary_set_uint64(v66, kPFSubLowPort, 0x1F55uLL);
    xpc_dictionary_set_uint64(v66, kPFSubPortOperator, 0LL);
    char v67 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v74 = v67;
    if (v67)
    {
      xpc_dictionary_set_uint64(v67, kPFAction, 8uLL);
      xpc_dictionary_set_uint64(v74, kPFProtocol, 6uLL);
      xpc_dictionary_set_string(v74, kPFInterface, (const char *)(v8 + 20));
      xpc_dictionary_set_uint64(v74, kPFFamily, 2uLL);
      uint64_t v75 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v75)
      {
        uint64_t v76 = v75;
        inet_ntop(2, &v114, string, 0x10u);
        uint64_t v77 = bswap32(v58);
        if ((v77 & 0x80000000) != 0)
        {
          uint64_t v82 = 0;
          do
            int v83 = v82-- + 30;
          while (((v77 >> v83) & 1) != 0);
          uint64_t v78 = -v82;
        }

        else
        {
          uint64_t v78 = 0;
        }

        snprintf(__str, 0x100uLL, "%s/%d", string, v78);
        xpc_dictionary_set_string(v76, kPFSubAddress, __str);
        uint64_t v84 = xpc_dictionary_create(0LL, 0LL, 0LL);
        uint64_t v81 = v84;
        if (v84)
        {
          xpc_dictionary_set_string(v84, kPFSubAddressLabel, kPFAny);
          xpc_dictionary_set_uint64(v81, kPFSubLowPort, 0x15uLL);
          xpc_dictionary_set_uint64(v81, kPFSubPortOperator, 2uLL);
          xpc_dictionary_set_value(v74, kPFFrom, v76);
          xpc_dictionary_set_value(v74, kPFTo, v81);
          xpc_dictionary_set_value(v74, kPFNATRDRAddress, v66);
          if ((sub_10001E1B0(a2, v4, v74) & 1) != 0)
          {
            uint64_t v80 = 0;
          }

          else
          {
            sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v91,  v92,  v93,  v94,  v95,  v96,  (uint64_t)"mis_pf_configure_ftp_proxy");
            uint64_t v80 = 22;
          }
        }

        else
        {
          sub_1000036BC(0, (uint64_t)"unable to create dst xpc dictionary", v85, v86, v87, v88, v89, v90, v112);
          uint64_t v80 = 12;
        }

        xpc_release(v66);
        xpc_release(v76);
        if (!v81)
        {
LABEL_69:
          if (v74) {
            xpc_release(v74);
          }
          if (v80) {
            goto LABEL_108;
          }
          goto LABEL_12;
        }

uint64_t *sub_100007E84(char *__s1)
{
  uint64_t v2 = &qword_100035498;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (!strncmp(__s1, (const char *)v2 + 28, 0x100uLL))
    {
      int v3 = *((_DWORD *)v2 + 2);
      *((_DWORD *)v2 + 2) = v3 + 1;
      if (v3 == -1) {
        sub_100021EB4();
      }
      return v2;
    }
  }

  return v2;
}

uint64_t sub_100007EDC(_BYTE *a1)
{
  if (!a1) {
    sub_100021EDC();
  }
  if (!*a1) {
    sub_100021F04();
  }
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    sub_1000036BC(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v29);
    goto LABEL_12;
  }

  int v9 = v2;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  if ((unint64_t)__strlcpy_chk(&v31, a1, 16LL, 16LL) >= 0x10)
  {
    sub_1000036BC(0, (uint64_t)"strlcpy: %m", v10, v11, v12, v13, v14, v15, v29);
    close(v9);
LABEL_12:
    sub_1000036BC(0, (uint64_t)"could not get mtu for %s, assuming 1500", v16, v17, v18, v19, v20, v21, (uint64_t)a1);
    return 1500LL;
  }

  uint64_t v30 = &v31;
  if (ioctl(v9, 0xC0206933uLL) == -1) {
    sub_1000036BC(0, (uint64_t)"SIOCGIFMTU: %m", v22, v23, v24, v25, v26, v27, (uint64_t)&v31);
  }
  if (close(v9)) {
    sub_1000036BC(0, (uint64_t)"close: %m", v16, v17, v18, v19, v20, v21, (uint64_t)v30);
  }
  uint64_t result = v32;
  return result;
}

uint64_t sub_100008024( char *__s1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v9 = a3;
  if (__s1)
  {
    if (*__s1) {
      int v12 = a4 ^ 1;
    }
    else {
      int v12 = 0;
    }
  }

  else
  {
    int v12 = 0;
  }

  uint64_t v13 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_19:
    if (v12 != v8) {
      int v16 = 102;
    }
    else {
      int v16 = 100;
    }
    if (byte_100035450) {
      int v16 = 102;
    }
    if (a2 == 103) {
      int v17 = 103;
    }
    else {
      int v17 = v16;
    }
    __asm { BR              X13 }
  }

  char v14 = v12 ^ 1 | a4;
  int v15 = v12 | a4;
  while (1)
  {
    if ((v14 & 1) == 0 && !strncmp(__s1, (const char *)(v13 + 308), 0x100uLL) && *(_DWORD *)(v13 + 16) != 1)
    {
      sub_1000036BC(0, (uint64_t)"external interface %s cannot be used", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0LL;
    }

    if (*(_DWORD *)(v13 + 16) == 1
      && *(_DWORD *)(v13 + 20) == v9
      && (!v15 || v8 && *(_BYTE *)(v13 + 564) || __s1 && !strncmp(__s1, (const char *)(v13 + 308), 0x100uLL)))
    {
      break;
    }

    uint64_t v13 = *(void *)v13;
    if (!v13) {
      goto LABEL_19;
    }
  }

  int v18 = *(_DWORD *)(v13 + 8);
  *(_DWORD *)(v13 + 8) = v18 + 1;
  if (v18 == -1) {
    sub_100021F2C();
  }
  sub_1000036BC( 2u,  (uint64_t)"found existing %s interface (%s) devname %s@%d mode %s",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"external");
  return v13;
}

void *sub_1000082F0( int a1, int a2, int a3, const char *a4, const char *a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11, const char *a12, const char *a13, const char *a14, int a15, char a16, _OWORD *a17, char a18, unsigned __int8 *src, uint64_t a20, int a21)
{
  int v21 = a7 - 100;
  uint64_t v27 = malloc(0x500uLL);
  int v28 = v27;
  if (v27)
  {
    int v65 = v21;
    if (a20
      && (*(_DWORD *)(a20 + 32)
       || (*(void *)a20 == *(void *)in6addr_any.__u6_addr8
         ? (BOOL v29 = *(void *)(a20 + 8) == *(void *)&in6addr_any.__u6_addr32[2])
         : (BOOL v29 = 0),
           !v29)))
    {
      if (a12) {
        sub_100021FA4();
      }
      int v30 = a1;
      int v64 = 1;
    }

    else
    {
      int v30 = a1;
      int v64 = 0;
    }

    bzero(v27, 0x500uLL);
    *((_DWORD *)v28 + 2) = 1;
    *((_DWORD *)v28 + 4) = v30;
    *((_DWORD *)v28 + 5) = a2;
    *((_DWORD *)v28 + 6) = a3;
    *((_DWORD *)v28 + 72) = a7;
    *((_DWORD *)v28 + 73) = a9;
    *((_DWORD *)v28 + 76) = a10;
    if (v30) {
      int v31 = 0;
    }
    else {
      int v31 = a8;
    }
    *((_DWORD *)v28 + 74) = v31;
    snprintf((char *)v28 + 28, 0x100uLL, "%s", a4);
    *((_DWORD *)v28 + 71) = a6;
    if (a11)
    {
      *((_DWORD *)v28 + 160) = *(_DWORD *)a11;
      *((_WORD *)v28 + 322) = *(_WORD *)(a11 + 4);
      *((_BYTE *)v28 + 646) = 1;
    }

    if (a12) {
      in_addr_t v32 = inet_addr(a12);
    }
    else {
      in_addr_t v32 = 0;
    }
    *((_DWORD *)v28 + 173) = v32;
    if (a13) {
      in_addr_t v33 = inet_addr(a13);
    }
    else {
      in_addr_t v33 = 0;
    }
    *((_DWORD *)v28 + 174) = v33;
    if (a14) {
      in_addr_t v34 = inet_addr(a14);
    }
    else {
      in_addr_t v34 = 0;
    }
    *((_DWORD *)v28 + 171) = v34;
    snprintf((char *)v28 + 565, 0x10uLL, "%s", a5);
    *((_BYTE *)v28 + 564) = a16;
    *((_DWORD *)v28 + 146) = a15;
    *((_DWORD *)v28 + 310) = a21;
    if (!a17) {
      sub_100021F54();
    }
    uint64_t v41 = src;
    __int128 v42 = a17[3];
    *(_OWORD *)(v28 + 145) = a17[2];
    *(_OWORD *)(v28 + 147) = v42;
    __int128 v43 = a17[5];
    *(_OWORD *)(v28 + 149) = a17[4];
    *(_OWORD *)(v28 + 151) = v43;
    __int128 v44 = a17[1];
    *(_OWORD *)(v28 + 141) = *a17;
    *(_OWORD *)(v28 + 143) = v44;
    *((_BYTE *)v28 + 1107) = a18;
    if (v64)
    {
      *(_OWORD *)((char *)v28 + 676) = *(_OWORD *)(a20 + 28);
      __int128 v45 = *(_OWORD *)(a20 + 16);
      *(_OWORD *)(v28 + 81) = *(_OWORD *)a20;
      *(_OWORD *)(v28 + 83) = v45;
      *((_BYTE *)v28 + 688) = 1;
    }

    if (src) {
      uuid_copy((unsigned __int8 *)v28 + 1224, src);
    }
    switch(v65)
    {
      case 0:
        int v46 = sub_100010F28((uint64_t)v28, (uint64_t)v41, v35, v36, v37, v38, v39, v40);
        if (v46) {
          goto LABEL_39;
        }
        goto LABEL_46;
      case 1:
        int v46 = sub_100016A70((uint64_t)v28);
        if (!v46) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 2:
        goto LABEL_38;
      case 3:
        goto LABEL_45;
      case 4:
        if (a2 == 201)
        {
LABEL_38:
          int v46 = sub_1000118E4((uint64_t)v28);
          if (v46)
          {
LABEL_39:
            uint64_t v53 = "unknown";
            if (v30 == 1) {
              uint64_t v53 = "external";
            }
            if (v30) {
              uint64_t v54 = v53;
            }
            else {
              uint64_t v54 = "internal";
            }
            strerror(v46);
            sub_1000036BC( 0,  (uint64_t)"error creating %s interface for devname %s@%d: %s",  v55,  v56,  v57,  v58,  v59,  v60,  (uint64_t)v54);
            free(v28);
            return 0LL;
          }
        }

        else
        {
LABEL_45:
          int v46 = sub_100012E90((uint64_t)v28);
          if (v46) {
            goto LABEL_39;
          }
        }

LABEL_46:
        if (__CFADD__(dword_100034F08++, 1)) {
          sub_100021F7C();
        }
        *int v28 = qword_100035498;
        qword_100035498 = (uint64_t)v28;
        uint64_t v62 = "external";
        if (v30 != 1) {
          uint64_t v62 = "unknown";
        }
        if (!v30) {
          uint64_t v62 = "internal";
        }
        sub_1000036BC( 2u,  (uint64_t)"creating %s interface (%s), %s, %s devname %s@%d, mtu %d, prefixSharing %s",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)v62);
        return v28;
      default:
        int v46 = 45;
        goto LABEL_39;
    }
  }

  return v28;
}

void *sub_100008720( int a1, char *a2, const char *a3, const char *a4, int a5, int a6, char *__s2, int a8, char a9, _OWORD *a10, char a11, unsigned __int8 *src, uint64_t a13, int a14)
{
  if (a2)
  {
    in_addr_t v40 = inet_addr(a2);
    in_addr_t v39 = inet_addr(a3);
    in_addr_t v14 = inet_addr(a4);
  }

  uint64_t v23 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_29:
    else {
      return sub_1000082F0(0, a5, a6, __str, __s2, 0, 104, a1, 0, 0, 0LL, a2, a3, a4, a8, a9, a10, a11, src, a13, a14);
    }
  }

  while (1)
  {
    if (*(_DWORD *)(v23 + 16)) {
      goto LABEL_11;
    }
    if (*(_DWORD *)(v23 + 288) != 104) {
      goto LABEL_11;
    }
    if (*(_DWORD *)(v23 + 20) != a5) {
      goto LABEL_11;
    }
    if (*(_DWORD *)(v23 + 24) != a6) {
      goto LABEL_11;
    }
    if (*(_DWORD *)(v23 + 296) != a1) {
      goto LABEL_11;
    }
    if (*(_DWORD *)(v23 + 584) != a8) {
      goto LABEL_11;
    }
    in_addr_t v38 = v14;
    int v24 = strncmp((const char *)(v23 + 565), __s2, 0x10uLL);
    in_addr_t v14 = v38;
    if (v24 || a2 && (v40 != *(_DWORD *)(v23 + 692) || v39 != *(_DWORD *)(v23 + 696) || v38 != *(_DWORD *)(v23 + 684))) {
      goto LABEL_11;
    }
    int is_null = uuid_is_null((const unsigned __int8 *)(v23 + 1224));
    if (src) {
      break;
    }
    in_addr_t v14 = v38;
    if (is_null) {
      goto LABEL_22;
    }
LABEL_11:
    uint64_t v23 = *(void *)v23;
    if (!v23) {
      goto LABEL_29;
    }
  }

  in_addr_t v14 = v38;
  if (is_null) {
    goto LABEL_11;
  }
  int v32 = uuid_compare(src, (const unsigned __int8 *)(v23 + 1224));
  in_addr_t v14 = v38;
  if (v32) {
    goto LABEL_11;
  }
LABEL_22:
  int v33 = *(_DWORD *)(v23 + 8);
  *(_DWORD *)(v23 + 8) = v33 + 1;
  if (v33 == -1) {
    sub_100021FF4();
  }
  int v34 = *(_DWORD *)(v23 + 16);
  uint64_t v35 = "external";
  if (v34 != 1) {
    uint64_t v35 = "unknown";
  }
  if (v34) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = "internal";
  }
  sub_1000036BC( 2u,  (uint64_t)"found existing %s interface (%s) devname %s@%d mode %s bridge type %s",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)v36);
  return (void *)v23;
}

void sub_100008A04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2 == 36 || *(_DWORD *)(a1 + 16) != 1) {
    sub_10002201C();
  }
  int v9 = (uint64_t *)qword_1000354A0;
  if (qword_1000354A0)
  {
    int v10 = a2;
    int v11 = 0;
    do
    {
      while (1)
      {
        int v12 = v9;
        int v9 = (uint64_t *)*v9;
        uint64_t v13 = v12[3];
        if (v13)
        {
          if (*(void *)(v13 + 296) == a1) {
            break;
          }
        }

        if (!v9) {
          return;
        }
      }

      if (*(_DWORD *)(v13 + 16) != 1) {
        sub_100022044();
      }
      if (!v10) {
        int v11 = sub_100008BB0(v12[3], (*(_DWORD *)(*(void *)(v13 + 8) + 508LL) >> 3) & 1);
      }
      in_addr_t v14 = (void *)v12[2];
      if (v14)
      {
        int v15 = (_xpc_connection_s *)v12[1];
        if (v15)
        {
          int v16 = (void *)v12[2];
          if (v10 | v11)
          {
            xpc_dictionary_set_uint64(v16, off_100034BF8[0], 0x7D0uLL);
          }

          else
          {
            xpc_dictionary_set_uint64(v16, off_100034BF8[0], 0x7D1uLL);
            xpc_dictionary_set_string(v14, off_100034C10[0], (const char *)(v13 + 20));
            int v17 = *((_DWORD *)v12 + 8);
            if (v17 != -1) {
              xpc_dictionary_set_fd(v14, off_100034BB8[0], v17);
            }
          }

          sub_100004868(v15, v14);
          xpc_release(v14);
        }
      }

      if (v10 | v11)
      {
        sub_100008F04(v13, a2, a3, a4, a5, a6, a7, a8);
        sub_100007268(v13, v18, v19, v20, v21, v22, v23, v24);
      }

      uint64_t v25 = (uint64_t *)qword_1000354A0;
      if ((uint64_t *)qword_1000354A0 == v12)
      {
        uint64_t v26 = &qword_1000354A0;
      }

      else
      {
        do
        {
          uint64_t v26 = v25;
          uint64_t v25 = (uint64_t *)*v25;
        }

        while (v25 != v12);
      }

      *uint64_t v26 = *v12;
      free(v12);
      --dword_100035488;
    }

    while (v9);
  }

uint64_t sub_100008BB0(uint64_t a1, int a2)
{
  if (byte_100035481) {
    goto LABEL_2;
  }
  uint64_t v5 = *(void *)(a1 + 296);
  int v6 = *(_DWORD *)(v5 + 1128);
  if (v6 == 502) {
    goto LABEL_10;
  }
  if (v6 != 500)
  {
LABEL_2:
    BOOL v4 = 0;
    goto LABEL_11;
  }

  if (*(_BYTE *)(v5 + 1107))
  {
    if (!*(_BYTE *)(v5 + 704))
    {
      if (*(_BYTE *)(v5 + 564)) {
        sub_1000220BC();
      }
      goto LABEL_2;
    }

    goto LABEL_10;
  }

  if (*(_BYTE *)(v5 + 564))
  {
LABEL_10:
    BOOL v4 = 1;
    goto LABEL_11;
  }

  BOOL v4 = *(_BYTE *)(v5 + 1105) != 0;
LABEL_11:
  int v7 = *(_DWORD *)(*(void *)(a1 + 280) + 288LL);
  if (*(void *)(a1 + 288)) {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 280);
  }
  int v9 = *(unsigned __int8 *)(v8 + 700);
  if (*(_DWORD *)(v8 + 288) != 104) {
    goto LABEL_21;
  }
  int v10 = *(uint64_t (**)(uint64_t))(v8 + 616);
  if (!v10) {
    sub_10002206C();
  }
  uint64_t v17 = v10(v8);
  if (!(_DWORD)v17)
  {
    if (a2)
    {
      uint64_t v18 = *(void *)(a1 + 280);
      if (*(_BYTE *)(v18 + 646))
      {
        if ((sub_10001966C(*(void *)(a1 + 288) + 308LL, v18 + 308, (int *)(v18 + 640), 0LL) & 1) != 0)
        {
          sub_1000036BC( 1u,  (uint64_t)"%s: successfully set the host filter for bridge %s, interface %s",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"mis_svc_start_internal_interface");
          goto LABEL_21;
        }

        sub_1000036BC( 0,  (uint64_t)"%s: failed to set host filter for bridge %s, interface %s.",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"mis_svc_start_internal_interface");
      }

      else
      {
        sub_1000036BC( 0,  (uint64_t)"%s: mac address is unknown, unable to provision host filter for limited mode",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"mis_svc_start_internal_interface");
      }

      uint64_t v17 = 0LL;
      *__error() = 22;
      goto LABEL_37;
    }

LABEL_37:
  int v28 = *(_DWORD *)(v8 + 288);
  if (v9 || v28 == 101 || (*(_BYTE *)(v8 + 700) ? (BOOL v29 = (_DWORD)v17 == 0) : (BOOL v29 = 1), v29))
  {
    if (v28 == 101 || (_DWORD)v17 != 0) {
      return v17;
    }
    if (*(_BYTE *)(v8 + 700)) {
      return v17;
    }
    int v31 = *(_DWORD *)(v8 + 20);
    if ((v31 | 2) != 0xCB) {
      return v17;
    }
    int v32 = 1;
    *(_BYTE *)(v8 + 700) = 1;
    if (v31 != 201)
    {
      if (v31 != 203) {
        return v17;
      }
      goto LABEL_58;
    }

        sub_100018C58((uint64_t)__s1);
        goto LABEL_38;
      }
    }

    else
    {
      strncpy(__dst, __s1, 0x10uLL);
      *(_OWORD *)((char *)&v86[8] + 4) = xmmword_1000251C0;
      *(_OWORD *)((char *)&v86[10] + 4) = unk_1000251D0;
      *(_OWORD *)((char *)&v86[12] + 4) = xmmword_1000251E0;
      *(_OWORD *)((char *)&v86[14] + 4) = unk_1000251F0;
      strcpy((char *)v86 + 4, "com.apple.MobileInternetSharing");
      *(_OWORD *)((char *)&v86[4] + 4) = xmmword_1000251A0;
      LODWORD(v86[0]) = 31;
      *(_OWORD *)((char *)&v86[6] + 4) = unk_1000251B0;
      int v83 = __dst;
      if (ioctl(v33, 0xC094698FuLL) < 0)
      {
        uint64_t v12 = *__error();
        sub_1000036BC(0, (uint64_t)"SIOCSIFDESC: %m", v46, v47, v48, v49, v50, v51, (uint64_t)__dst);
      }

      else
      {
        uint64_t v12 = 0LL;
      }
    }

    close(v33);
    goto LABEL_27;
  }

LABEL_60:
    int v34 = &dword_1000354D4;
    goto LABEL_61;
  }

  int v33 = *(_DWORD *)(v8 + 20);
  if ((v33 | 2) != 0xCB) {
    return v17;
  }
  *(_BYTE *)(v8 + 700) = 0;
  if (v33 == 201)
  {
    int v32 = -1;
    goto LABEL_60;
  }

  if (v33 == 203)
  {
    int v32 = -1;
LABEL_58:
    int v34 = &dword_1000354D8;
LABEL_61:
    *v34 += v32;
  }

  return v17;
}

uint64_t sub_100008F04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) == 2 && (uint64_t v9 = *(void *)(a1 + 280)) != 0 && *(void *)(a1 + 304))
  {
    if (*(_DWORD *)(v9 + 284) < 2u) {
      goto LABEL_10;
    }
    uint64_t v10 = mach_continuous_time();
    unint64_t v11 = *(void *)(a1 + 304);
    unint64_t v12 = v10 - v11;
    if (v10 < v11) {
      sub_1000220E4();
    }
    if (mach_timebase_info(&info))
    {
      uint64_t v15 = "%s: failed to retrieve time base error(%d)";
    }

    else
    {
      LODWORD(v13) = info.numer;
      LODWORD(v14) = info.denom;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 0x40000000LL;
      v19[2] = sub_10000F6B4;
      v19[3] = &unk_100030E08;
      v19[4] = a1;
      v19[5] = (unint64_t)((double)v13 * 0.000000001 / (double)v14 * (double)v12);
      analytics_send_event_lazy("com.apple.MobileInternetSharing.svc.usage", v19);
      uint64_t v15 = "%s: %s: iftype %d, duration %qu seconds";
    }

    unsigned __int8 v16 = 0;
  }

  else
  {
    uint64_t v15 = "%s: service not started, ignoring event";
    unsigned __int8 v16 = 1;
  }

  sub_1000036BC(v16, (uint64_t)v15, a3, a4, a5, a6, a7, a8, (uint64_t)"mis_send_svc_usage_event");
LABEL_10:
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v17 = *(void *)(a1 + 8);
  if (!v17) {
    return sub_1000036BC(0, (uint64_t)"%s (%s) has been stopped", a3, a4, a5, a6, a7, a8, a1 + 20);
  }
  uint64_t result = sub_1000036BC(0, (uint64_t)"%s: %s (%s) has been stopped", a3, a4, a5, a6, a7, a8, v17 + 356);
  *(void *)(*(void *)(a1 + 8) + 88LL) = 0LL;
  *(void *)(a1 + 8) = 0LL;
  return result;
}

uint64_t sub_1000090B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a2 + 88) || *(void *)(a1 + 8)) {
    return 16LL;
  }
  int v11 = *(_DWORD *)(a1 + 16);
  if (v11)
  {
    if (v11 == 1) {
      return 0LL;
    }
    else {
      return 37LL;
    }
  }

  unsigned int v48 = 0;
  uint64_t v13 = *(void *)(a1 + 280);
  int v14 = *(_DWORD *)(v13 + 288);
  if (v14 != 103)
  {
    int v26 = *(_DWORD *)(v13 + 584);
    if (v14 == 101) {
      sub_1000036BC(1u, (uint64_t)"checking for AUTH service availability", a3, a4, a5, a6, a7, a8, v47);
    }
    int v27 = sub_1000147C8(v14 == 101, v26, a3, a4, a5, a6, a7, a8);
    int v28 = v27;
    if (v27)
    {
      BOOL v29 = strerror(v27);
      sub_1000036BC(1u, (uint64_t)"service not available: %s", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
    }

    unsigned int v48 = v28;
    if ((*(_BYTE *)(a2 + 508) & 2) != 0)
    {
      uint64_t v36 = *(void *)(a1 + 296);
      if (v28) {
        BOOL v37 = (char *)(v36 + 308) == netrbClientAnyExternal[0];
      }
      else {
        BOOL v37 = 0;
      }
      if (v37)
      {
        sub_1000036BC( 1u,  (uint64_t)"%s: starting vmnet with ext_if %s but no cellular",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"mis_svc_start_internal");
      }

      else if (v28 && *(_DWORD *)(v36 + 288) == 100)
      {
        xpc_object_t v38 = "%s: failed to get available service for external interface %s";
        goto LABEL_37;
      }
    }

    else if (v28 && *(_DWORD *)(*(void *)(a1 + 280) + 288LL) == 102)
    {
      goto LABEL_43;
    }
  }

  if (*(_DWORD *)(*(void *)(a1 + 280) + 288LL) != 101 || (sub_100014AB8(&v48) & 1) != 0)
  {
    uint64_t v21 = *(void *)(a1 + 288);
    if (!v21
      || (unsigned int v48 = sub_100018520( (char *)(v21 + 308),  *(_DWORD *)(v21 + 20),  *(_DWORD *)(v21 + 24),  *(unsigned int *)(v21 + 584),  (char *)(v21 + 565),  (*(_DWORD *)(v21 + 1240) >> 1) & 1)) == 0)
    {
      uint64_t v23 = *(void *)(a1 + 296);
      uint64_t v25 = v24(a1 + 20);
      unsigned int v48 = v25;
      if ((_DWORD)v25)
      {
        if ((_DWORD)v25 == 36 || (_DWORD)v25 == 62) {
          *(_DWORD *)(a1 + 16) = 1;
        }
        else {
          sub_1000147E4(v25, v22, v15, v16, v17, v18, v19, v20);
        }
      }

      else
      {
        unsigned int v48 = sub_100008BB0(a1, (*(_DWORD *)(a2 + 508) >> 3) & 1);
      }
    }

    goto LABEL_43;
  }

  if (!v48)
  {
    xpc_object_t v38 = "%s: authentication already complete";
    unsigned __int8 v39 = 1;
    goto LABEL_42;
  }

  xpc_object_t v38 = "%s: authentication cannot be started";
LABEL_37:
  unsigned __int8 v39 = 0;
LABEL_42:
  sub_1000036BC(v39, (uint64_t)v38, v15, v16, v17, v18, v19, v20, (uint64_t)"mis_svc_start_internal");
LABEL_43:
  uint64_t v9 = v48;
  if (*(_DWORD *)(*(void *)(a1 + 280) + 288LL) != 103)
  {
    sub_100014AF4(v48, v22, v15, v16, v17, v18, v19, v20);
    uint64_t v9 = v48;
  }

  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 != 36)
    {
      sub_100008F04(a1, v22, v15, v16, v17, v18, v19, v20);
      sub_100014AF4(v9, v40, v41, v42, v43, v44, v45, v46);
      return v9;
    }

    if (*(_DWORD *)(a1 + 16) != 1) {
      sub_100022184();
    }
  }

  if (*(void *)(a1 + 8)) {
    sub_10002215C();
  }
  *(void *)(a1 + 8) = a2;
  if (*(void *)(a2 + 88)) {
    sub_100022134();
  }
  *(void *)(a2 + 88) = a1;
  sub_1000036BC(0, (uint64_t)"%s: %s has been started", v15, v16, v17, v18, v19, v20, a2 + 356);
  return v9;
}

void sub_100009384(uint64_t a1, uint64_t a2)
{
}

void *sub_1000093B4(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 7; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t result = *(void **)(v3 + 424);
    if (result)
    {
      uint64_t v5 = (void *)(v3 + 424);
      do
      {
        *uint64_t v5 = result[2];
        free(result);
        uint64_t result = (void *)*v5;
      }

      while (*v5);
    }

    uint64_t v6 = a1 + 4 * i;
    signed int v7 = *(_DWORD *)(v6 + 480);
    *(_DWORD *)(v6 + 480) = 0;
    if (v7 >= 1) {
      uint64_t result = (void *)sub_10001508C(i, v7);
    }
  }

  return result;
}

void sub_100009428( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a2 + 88))
  {
    if (*(void *)(a1 + 8))
    {
      sub_100008F04(a1, a2, a3, a4, a5, a6, a7, a8);
      sub_10000475C(a1, v9, v10, v11, v12, v13, v14, v15);
      sub_100007268(a1, v16, v17, v18, v19, v20, v21, v22);
    }
  }

uint64_t sub_100009474()
{
  if (dword_100034D44 != -1) {
    return 0LL;
  }
  notify_key = (const char *)nwi_state_get_notify_key();
  uint64_t v2 = notify_register_dispatch(notify_key, &dword_100034D44, (dispatch_queue_t)qword_100035470, &stru_100030DC8);
  if (!(_DWORD)v2)
  {
    sub_100009500(v2, v3, v4, v5, v6, v7, v8, v9, v10);
    sub_10001D2EC(1u);
    sub_10001D3DC(1u);
    return 0LL;
  }

  sub_1000036BC(0, (uint64_t)"notify_register_dispatch() for NWI key failed", v4, v5, v6, v7, v8, v9, v10);
  uint64_t result = 0xFFFFFFFFLL;
  dword_100034D44 = -1;
  return result;
}

uint64_t sub_100009500( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9 = dword_1000354B8;
  int v10 = dword_1000354BC;
  uint64_t v48 = 0LL;
  if (dword_100034D44 == -1)
  {
    uint64_t v20 = "nwi notifications turned off";
    return sub_1000036BC(2u, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
  }

  uint64_t v47 = nwi_state_copy();
  if (!v47)
  {
    uint64_t v20 = "nwi_state_copy returned no state";
    return sub_1000036BC(2u, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
  }

  sub_1000036BC( 2u,  (uint64_t)"%s: resetting nwi_active in v4 and v6 nwi lists",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"nwi_change_process");
  for (uint64_t i = qword_1000354A8; i; uint64_t i = *(void *)i)
  {
    *(_WORD *)(i + 40) = *(unsigned __int8 *)(i + 41);
    *(_DWORD *)(i + 28) = -1;
  }

  for (uint64_t j = qword_1000354B0; j; uint64_t j = *(void *)j)
  {
    *(_WORD *)(j + 40) = *(unsigned __int8 *)(j + 41);
    *(_DWORD *)(j + 28) = -1;
  }

  dword_1000354B8 = 0;
  dword_1000354BC = 0;
  uint64_t result = sub_10000F714(&v47, 2, (_DWORD *)&v48 + 1);
  if (v47)
  {
    int v14 = result;
    uint64_t result = sub_10000F714(&v47, 30, &v48);
    uint64_t v15 = v47;
    if (v47)
    {
      if (v9 == dword_1000354B8) {
        int v16 = v14;
      }
      else {
        int v16 = 1;
      }
      if (v10 == dword_1000354BC) {
        int v17 = result;
      }
      else {
        int v17 = 1;
      }
      uint64_t v18 = qword_100035498;
      if ((v16 | v17) == 1 && qword_100035498 != 0)
      {
        while (*(_DWORD *)(v18 + 16) != 1 || !*(_BYTE *)(v18 + 564))
        {
          uint64_t v18 = *(void *)v18;
          if (!v18) {
            return nwi_state_release(v15);
          }
        }

        int v21 = HIDWORD(v48);
        if (!v21) {
          int v21 = 1500;
        }
        *(_DWORD *)(v18 + 296) = v21;
        *(_DWORD *)(v18 + 300) = v21 - 40;
        if (v16)
        {
          sub_100019DEC((char *)(v18 + 308), 0LL, 0LL, v21 - 40);
          uint64_t v27 = qword_1000354A8;
          if (qword_1000354A8)
          {
            while (!*(_BYTE *)(v27 + 40) || *(_BYTE *)(v27 + 41))
            {
              uint64_t v27 = *(void *)v27;
              if (!v27) {
                goto LABEL_38;
              }
            }

            sub_10001CA50((char *)(v18 + 308), 1, 0LL, v22, v23, v24, v25, v26, v46);
          }
        }

LABEL_38:
        if (byte_100035481) {
          int v28 = 0;
        }
        else {
          int v28 = v17;
        }
        if (v28 == 1)
        {
          uint64_t v29 = (uint64_t)sub_10001A8C0((char *)(v18 + 308), *(_DWORD *)(v18 + 300));
          uint64_t v37 = qword_1000354B0;
          if (qword_1000354B0)
          {
            while (!*(_BYTE *)(v37 + 40) || *(_BYTE *)(v37 + 41))
            {
              uint64_t v37 = *(void *)v37;
              if (!v37) {
                goto LABEL_48;
              }
            }

            uint64_t v29 = sub_10001CA50((char *)(v18 + 308), 0, 1LL, v32, v33, v34, v35, v36, v46);
          }

          CFRelease(v7);
          if (v28) {
            CFRelease(v28);
          }
          if (v27) {
            CFRelease(v27);
          }
          CFRelease(v25);
          if (!v26) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v17, v18, v19, v20, v21, v22, v43);
      }
    }

    else
    {
      sub_1000036BC(2u, (uint64_t)"no bootpd plist found", v10, v11, v12, v13, v14, v15, v43);
      uint64_t v23 = 0LL;
    }

    uint64_t v29 = 0LL;
    uint64_t v26 = (const __CFArray *)v7;
LABEL_23:
    CFRelease(v26);
LABEL_24:
    if (v23) {
      CFRelease(v23);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v29) {
      CFRelease(v29);
    }
    goto LABEL_31;
  }

  sub_1000036BC(0, (uint64_t)"CFStringCreateWithCString() failed", v1, v2, v3, v4, v5, v6, v43);
LABEL_31:
  byte_1000353D0 = 1;
  return 0LL;
}

  sub_1000036BC(0, (uint64_t)"could not create bridge interface for %s", v13, v14, v15, v16, v17, v18, (uint64_t)__s1);
  return v12;
}

LABEL_48:
          int v38 = sub_10001FB7C(v29, v30, v31, v32, v33, v34, v35, v36);
          if (v38)
          {
            unsigned __int8 v39 = strerror(v38);
            sub_1000036BC(0, (uint64_t)"unable to start rtadvd: %s", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
          }
        }
      }

      return nwi_state_release(v15);
    }
  }

  return result;
}

uint64_t sub_1000097A4()
{
  uint64_t result = dword_100034D44;
  if (dword_100034D44 != -1)
  {
    notify_cancel(dword_100034D44);
    dword_100034D44 = -1;
    uint64_t v1 = (uint64_t *)qword_1000354A8;
    if (qword_1000354A8)
    {
      do
      {
        uint64_t v2 = (uint64_t *)qword_1000354A8;
        if ((uint64_t *)qword_1000354A8 == v1)
        {
          uint64_t v3 = &qword_1000354A8;
        }

        else
        {
          do
          {
            uint64_t v3 = v2;
            uint64_t v2 = (uint64_t *)*v2;
          }

          while (v2 != v1);
        }

        uint64_t v4 = (uint64_t *)*v1;
        *uint64_t v3 = *v1;
        free(v1);
        if (!dword_100034EF0) {
          sub_1000221D4();
        }
        --dword_100034EF0;
        uint64_t v1 = v4;
      }

      while (v4);
    }

    uint64_t v5 = (uint64_t *)qword_1000354B0;
    if (qword_1000354B0)
    {
      do
      {
        uint64_t v6 = (uint64_t *)qword_1000354B0;
        if ((uint64_t *)qword_1000354B0 == v5)
        {
          uint64_t v7 = &qword_1000354B0;
        }

        else
        {
          do
          {
            uint64_t v7 = v6;
            uint64_t v6 = (uint64_t *)*v6;
          }

          while (v6 != v5);
        }

        uint64_t v8 = (uint64_t *)*v5;
        *uint64_t v7 = *v5;
        free(v5);
        if (!dword_100034EF4) {
          sub_1000221AC();
        }
        --dword_100034EF4;
        uint64_t v5 = v8;
      }

      while (v8);
    }

    sub_10001D2EC(0);
    uint64_t result = sub_10001D3DC(0);
  }

  dword_1000354B8 = 0;
  dword_1000354BC = 0;
  return result;
}

uint64_t sub_1000098C8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100022274();
  }
  if (*(_DWORD *)(a1 + 20) != 201) {
    sub_10002224C();
  }
  if (!*(_BYTE *)(a1 + 308)) {
    sub_1000221FC();
  }
  if (*(_BYTE *)(a1 + 564)) {
    sub_100022224();
  }
  if (*(_BYTE *)(a1 + 1107))
  {
    if (*(_DWORD *)(a1 + 288) != 102)
    {
      uint64_t v2 = sub_100009BB4(a1);
      if ((_DWORD)v2)
      {
        uint64_t v9 = v2;
        sub_1000036BC(0, (uint64_t)"unable to listen to IPv6 prefix events", v3, v4, v5, v6, v7, v8, v68);
        return v9;
      }
    }
  }

  if (*(void *)(a1 + 1112)) {
    return 0LL;
  }
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  SCDynamicStoreRef v10 = SCDynamicStoreCreate( kCFAllocatorDefault,  @"com.apple.MobileInternetSharing",  (SCDynamicStoreCallBack)sub_100010548,  &context);
  *(void *)(a1 + 1112) = v10;
  if (!v10)
  {
    uint64_t v37 = __error();
    strerror(*v37);
    sub_1000036BC(0, (uint64_t)"%s, unable to create dynamic store handle: %s", v38, v39, v40, v41, v42, v43, a1 + 308);
    Mutable = 0LL;
LABEL_27:
    uint64_t v9 = 12LL;
    goto LABEL_28;
  }

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    sub_1000036BC( 0,  (uint64_t)"%s, unable to create mutable array for notify keys",  v11,  v12,  v13,  v14,  v15,  v16,  a1 + 308);
    goto LABEL_27;
  }

  uint64_t v18 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a1 + 308), 0x600u);
  if (!v18)
  {
    sub_1000036BC(0, (uint64_t)"CFStringCreateWithCString() failed", v19, v20, v21, v22, v23, v24, v68);
    goto LABEL_27;
  }

  uint64_t v25 = v18;
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v18,  kSCEntNetIPv4);
  if (!NetworkInterfaceEntity)
  {
    uint64_t v50 = "%s, failed to create key kSCEntNetIPv4";
LABEL_26:
    sub_1000036BC(0, (uint64_t)v50, v27, v28, v29, v30, v31, v32, a1 + 308);
    CFRelease(v25);
    goto LABEL_27;
  }

  CFStringRef v33 = NetworkInterfaceEntity;
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(v33);
  if (*(_DWORD *)(a1 + 1128) != 500 || *(_DWORD *)(a1 + 288) != 102) {
    goto LABEL_19;
  }
  CFStringRef v34 = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v25,  kSCEntNetIPv6);
  if (!v34)
  {
    uint64_t v50 = "%s, failed to create key kSCEntNetIPv6";
    goto LABEL_26;
  }

  CFStringRef v35 = v34;
  CFArrayAppendValue(Mutable, v34);
  CFRelease(v35);
LABEL_19:
  CFRelease(v25);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 1112), Mutable, 0LL);
  int v36 = SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(a1 + 1112), (dispatch_queue_t)qword_100035470);
  if (v36)
  {
    sub_100010548(v36, Mutable, a1);
    CFRelease(Mutable);
    return 0LL;
  }

  int v60 = SCError();
  uint64_t v61 = SCErrorString(v60);
  sub_1000036BC(0, (uint64_t)"SCDynamicStoreSetDispatchQueue() failed: %s", v62, v63, v64, v65, v66, v67, (uint64_t)v61);
  uint64_t v9 = 22LL;
LABEL_28:
  uint64_t v51 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v51)
  {
    SCDynamicStoreSetDispatchQueue(v51, 0LL);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(void *)(a1 + 1112) = 0LL;
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  sub_1000036BC(0, (uint64_t)"unable to set dynamic store notification", v44, v45, v46, v47, v48, v49, v69);
  sub_100009E24(a1, v52, v53, v54, v55, v56, v57, v58);
  return v9;
}

uint64_t sub_100009BB4(uint64_t a1)
{
  int v38 = 1;
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_1000222C4();
  }
  if (!*(_BYTE *)(a1 + 1107)) {
    sub_10002229C();
  }
  if (*(void *)(a1 + 1120)) {
    return 0LL;
  }
  int v3 = socket(32, 3, 1);
  int v10 = v3;
  if (v3 == -1)
  {
    uint64_t v31 = "socket() failed";
  }

  else
  {
    uint64_t v39 = 0x100000001LL;
    int v40 = 7;
    CFStringRef v34 = &v39;
    if (ioctl(v3, 0x800C6502uLL) == -1)
    {
      uint64_t v31 = "ioctl(, SIOCSKEVFILT,) failed\n";
    }

    else
    {
      CFStringRef v34 = (uint64_t *)&v38;
      if (ioctl(v10, 0x8004667EuLL) != -1)
      {
        uint64_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v10,  0LL,  (dispatch_queue_t)qword_100035470);
        *(void *)(a1 + 1120) = v11;
        if (v11)
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 0x40000000LL;
          handler[2] = sub_10000FB64;
          handler[3] = &unk_100030E28;
          handler[4] = a1;
          dispatch_source_set_event_handler(v11, handler);
          uint64_t v18 = *(dispatch_source_s **)(a1 + 1120);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 0x40000000LL;
          v35[2] = sub_10000FDA0;
          v35[3] = &unk_100030E48;
          int v36 = v10;
          dispatch_source_set_cancel_handler(v18, v35);
          dispatch_resume(*(dispatch_object_t *)(a1 + 1120));
          uint64_t v42 = 0LL;
          memset(v41, 0, sizeof(v41));
          uint64_t v2 = sub_10000FDA8(a1, (uint64_t)v41, v19, v20, v21, v22, v23, v24);
          if (!(_DWORD)v2)
          {
            sub_100009F24(a1, (unsigned __int8 *)v41, v25, v26, v27, v28, v29, v30);
            return v2;
          }

          sub_1000036BC(0, (uint64_t)"failed to get IPv6 configuration for %s", v25, v26, v27, v28, v29, v30, a1 + 308);
        }

        else
        {
          sub_1000036BC(0, (uint64_t)"dispatch_source_create() failed", v12, v13, v14, v15, v16, v17, (uint64_t)&v38);
          uint64_t v2 = 12LL;
        }

        goto LABEL_15;
      }

      uint64_t v31 = "ioctl(, FIONBIO,) failed";
    }
  }

  sub_1000036BC(0, (uint64_t)v31, v4, v5, v6, v7, v8, v9, (uint64_t)v34);
  uint64_t v2 = *__error();
LABEL_15:
  uint64_t v32 = *(dispatch_source_s **)(a1 + 1120);
  if (v32)
  {
    dispatch_source_cancel(v32);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(void *)(a1 + 1120) = 0LL;
  }

  if (v10 != -1) {
    close(v10);
  }
  return v2;
}

uint64_t sub_100009E24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_1000222EC();
  }
  if (*(_BYTE *)(a1 + 1107))
  {
    if (*(_BYTE *)(a1 + 704))
    {
      uint64_t v13 = 0LL;
      memset(v12, 0, sizeof(v12));
      sub_100009F24(a1, (unsigned __int8 *)v12, a3, a4, a5, a6, a7, a8);
    }
  }

  else
  {
    sub_10000A5D4(a1, (uint64_t)&in6addr_any, a3, a4, a5, a6, a7, a8, *(uint64_t *)&v12[0]);
  }

  if (*(_DWORD *)(a1 + 680)) {
    sub_10000A894(a1, 0, 0LL, a4, a5, a6, a7, a8);
  }
  uint64_t v9 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v9)
  {
    SCDynamicStoreSetDispatchQueue(v9, 0LL);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(void *)(a1 + 1112) = 0LL;
  }

  int v10 = *(dispatch_source_s **)(a1 + 1120);
  if (v10)
  {
    dispatch_source_cancel(v10);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(void *)(a1 + 1120) = 0LL;
  }

  return 0LL;
}

void sub_100009F24( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 1107)) {
    sub_100022314();
  }
  int v10 = (unsigned __int8 *)(a1 + 704);
  int v11 = *(unsigned __int8 *)(a1 + 704);
  if (v11 == *a2)
  {
    if (!*(_BYTE *)(a1 + 704)) {
      return;
    }
    uint64_t v12 = *(unsigned __int8 *)(a1 + 741);
    if ((_DWORD)v12 == a2[37]
      && sub_1000104AC((unsigned __int8 *)(a1 + 720), a2 + 16, v12, a4, a5, a6, a7, a8)
      && *(unsigned __int8 *)(a1 + 876) == a2[172]
      && *(unsigned __int16 *)(a1 + 814) == *((unsigned __int16 *)a2 + 55)
      && *(_DWORD *)(a1 + 860) == *((_DWORD *)a2 + 39)
      && *(_DWORD *)(a1 + 864) == *((_DWORD *)a2 + 40)
      && *(void *)(a1 + 744) == *((void *)a2 + 5)
      && *(void *)(a1 + 752) == *((void *)a2 + 6)
      && *(_DWORD *)(a1 + 848) == *((_DWORD *)a2 + 36))
    {
      if (*v10)
      {
        if (!*(_BYTE *)(a1 + 1106))
        {
          sub_10000EBC0(a1 + 308, 1);
          *(_BYTE *)(a1 + 1106) = 1;
          sub_10001D3DC(1u);
          if (dword_1000354D4)
          {
            char v13 = *(_BYTE *)(a1 + 1106);
            __int128 v14 = *((_OWORD *)v10 + 11);
            __int128 v168 = *((_OWORD *)v10 + 10);
            __int128 v169 = v14;
            uint64_t v170 = *((void *)v10 + 24);
            __int128 v15 = *((_OWORD *)v10 + 7);
            __int128 v164 = *((_OWORD *)v10 + 6);
            __int128 v165 = v15;
            __int128 v16 = *((_OWORD *)v10 + 9);
            __int128 v166 = *((_OWORD *)v10 + 8);
            __int128 v167 = v16;
            __int128 v17 = *((_OWORD *)v10 + 3);
            __int128 v160 = *((_OWORD *)v10 + 2);
            __int128 v161 = v17;
            __int128 v18 = *((_OWORD *)v10 + 5);
            __int128 v162 = *((_OWORD *)v10 + 4);
            __int128 v163 = v18;
            __int128 v19 = *((_OWORD *)v10 + 1);
            __int128 v158 = *(_OWORD *)v10;
            __int128 v159 = v19;
            uint64_t v20 = (char *)(a1 + 308);
LABEL_23:
            sub_10001AC9C(v20, (uint64_t)&v158, v13);
            return;
          }
        }
      }

      return;
    }

    int v11 = *v10;
  }

  if (!v11)
  {
    if (*a2)
    {
      inet_ntop(30, a2 + 16, v171, 0x2Eu);
      sub_1000036BC(2u, (uint64_t)"%s prefix changed from  to %s", v27, v28, v29, v30, v31, v32, a1 + 308);
      sub_10000EBC0(a1 + 308, 1);
      *(_BYTE *)(a1 + 1106) = 1;
      *(_OWORD *)int v10 = *(_OWORD *)a2;
      __int128 v33 = *((_OWORD *)a2 + 8);
      __int128 v35 = *((_OWORD *)a2 + 5);
      __int128 v34 = *((_OWORD *)a2 + 6);
      *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v10 + 8) = v33;
      *((_OWORD *)v10 + 5) = v35;
      *((_OWORD *)v10 + 6) = v34;
      __int128 v37 = *((_OWORD *)a2 + 10);
      __int128 v36 = *((_OWORD *)a2 + 11);
      __int128 v38 = *((_OWORD *)a2 + 9);
      *((void *)v10 + 24) = *((void *)a2 + 24);
      *((_OWORD *)v10 + 10) = v37;
      *((_OWORD *)v10 + 11) = v36;
      *((_OWORD *)v10 + 9) = v38;
      __int128 v40 = *((_OWORD *)a2 + 3);
      __int128 v39 = *((_OWORD *)a2 + 4);
      __int128 v41 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v10 + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v10 + 2) = v41;
      *((_OWORD *)v10 + 3) = v40;
      *((_OWORD *)v10 + 4) = v39;
      sub_10001D3DC(1u);
      if (!dword_1000354D4)
      {
        uint64_t v156 = a1 + 308;
        uint64_t v142 = "%s, no internal interfaces to setup ipv6";
LABEL_60:
        sub_1000036BC(2u, (uint64_t)v142, v42, v43, v44, v45, v46, v47, v156);
        return;
      }

      xpc_object_t v48 = xpc_array_create(0LL, 0LL);
      for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
      {
        if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
        {
          if (!*(_DWORD *)(i + 16) && !*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201) {
            sub_10000EA50((const char *)(i + 308), 1);
          }
          if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
          {
            int v55 = sub_100012BE4(i, a1, 1LL, v50, v51, v52, v53, v54);
            uint64_t v61 = (const char *)(i + 308);
            if (v55) {
              sub_1000036BC(0, (uint64_t)"failed to setup IPv6 on %s", (uint64_t)v61, v56, v57, v58, v59, v60, i + 308);
            }
            else {
              xpc_array_set_string(v48, 0xFFFFFFFFFFFFFFFFLL, v61);
            }
          }
        }
      }

      char v112 = *(_BYTE *)(a1 + 1106) != 0;
LABEL_52:
      __int128 v119 = *((_OWORD *)v10 + 11);
      __int128 v168 = *((_OWORD *)v10 + 10);
      __int128 v169 = v119;
      uint64_t v170 = *((void *)v10 + 24);
      __int128 v120 = *((_OWORD *)v10 + 7);
      __int128 v164 = *((_OWORD *)v10 + 6);
      __int128 v165 = v120;
      __int128 v121 = *((_OWORD *)v10 + 9);
      __int128 v166 = *((_OWORD *)v10 + 8);
      __int128 v167 = v121;
      __int128 v122 = *((_OWORD *)v10 + 3);
      __int128 v160 = *((_OWORD *)v10 + 2);
      __int128 v161 = v122;
      __int128 v123 = *((_OWORD *)v10 + 5);
      __int128 v162 = *((_OWORD *)v10 + 4);
      __int128 v163 = v123;
      __int128 v124 = *((_OWORD *)v10 + 1);
      __int128 v158 = *(_OWORD *)v10;
      __int128 v159 = v124;
      uint64_t v125 = sub_10001AC9C((char *)(a1 + 308), (uint64_t)&v158, v112);
      if ((_DWORD)v125) {
        goto LABEL_64;
      }
      uint64_t v133 = sub_10001FB7C(v125, v126, v127, v128, v129, v130, v131, v132);
      if ((_DWORD)v133)
      {
        v141 = "unable to start rtadvd: %s";
      }

      else
      {
        LODWORD(v133) = sub_100020BD8(v133, v134, v135, v136, v137, v138, v139, v140);
        if (!(_DWORD)v133) {
          goto LABEL_64;
        }
        v141 = "unable to start dhcp6d: %s";
      }

      int v149 = strerror(v133);
      sub_1000036BC(0, (uint64_t)v141, v150, v151, v152, v153, v154, v155, (uint64_t)v149);
LABEL_64:
      if (v48) {
        xpc_release(v48);
      }
      return;
    }

LABEL_39:
    if (sub_1000104AC((unsigned __int8 *)(a1 + 720), a2 + 16, *(unsigned __int8 *)(a1 + 741), a4, a5, a6, a7, a8))
    {
      if (!sub_1000104AC( (unsigned __int8 *)(a1 + 720),  a2 + 16,  *(unsigned __int8 *)(a1 + 741),  v62,  v63,  v64,  v65,  v66)) {
        return;
      }
      inet_ntop(30, a2 + 16, v171, 0x2Eu);
      uint64_t v73 = sub_1000036BC( 1u,  (uint64_t)"%s %s prefix characteristics changed",  v67,  v68,  v69,  v70,  v71,  v72,  (uint64_t)v171);
      *(_OWORD *)int v10 = *(_OWORD *)a2;
      __int128 v75 = *((_OWORD *)a2 + 1);
      __int128 v76 = *((_OWORD *)a2 + 2);
      __int128 v77 = *((_OWORD *)a2 + 4);
      *((_OWORD *)v10 + 3) = *((_OWORD *)a2 + 3);
      *((_OWORD *)v10 + 4) = v77;
      *((_OWORD *)v10 + 1) = v75;
      *((_OWORD *)v10 + 2) = v76;
      __int128 v78 = *((_OWORD *)a2 + 5);
      __int128 v79 = *((_OWORD *)a2 + 6);
      __int128 v80 = *((_OWORD *)a2 + 8);
      *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v10 + 8) = v80;
      *((_OWORD *)v10 + 5) = v78;
      *((_OWORD *)v10 + 6) = v79;
      __int128 v81 = *((_OWORD *)a2 + 9);
      __int128 v82 = *((_OWORD *)a2 + 10);
      __int128 v83 = *((_OWORD *)a2 + 11);
      *((void *)v10 + 24) = *((void *)a2 + 24);
      *((_OWORD *)v10 + 10) = v82;
      *((_OWORD *)v10 + 11) = v83;
      *((_OWORD *)v10 + 9) = v81;
      if (*(_BYTE *)(a1 + 1106))
      {
        if (dword_1000354D4)
        {
LABEL_43:
          int v84 = sub_10001FB7C(v73, v74, v42, v43, v44, v45, v46, v47);
          if (v84)
          {
            v157 = strerror(v84);
            sub_1000036BC(0, (uint64_t)"unable to start rtadvd: %s", v85, v86, v87, v88, v89, v90, (uint64_t)v157);
          }

          return;
        }
      }

      else
      {
        sub_10000EBC0(a1 + 308, 1);
        sub_10001D3DC(1u);
        *(_BYTE *)(a1 + 1106) = 1;
        if (dword_1000354D4)
        {
          __int128 v143 = *((_OWORD *)v10 + 11);
          __int128 v168 = *((_OWORD *)v10 + 10);
          __int128 v169 = v143;
          uint64_t v170 = *((void *)v10 + 24);
          __int128 v144 = *((_OWORD *)v10 + 7);
          __int128 v164 = *((_OWORD *)v10 + 6);
          __int128 v165 = v144;
          __int128 v145 = *((_OWORD *)v10 + 9);
          __int128 v166 = *((_OWORD *)v10 + 8);
          __int128 v167 = v145;
          __int128 v146 = *((_OWORD *)v10 + 3);
          __int128 v160 = *((_OWORD *)v10 + 2);
          __int128 v161 = v146;
          __int128 v147 = *((_OWORD *)v10 + 5);
          __int128 v162 = *((_OWORD *)v10 + 4);
          __int128 v163 = v147;
          __int128 v148 = *((_OWORD *)v10 + 1);
          __int128 v158 = *(_OWORD *)v10;
          __int128 v159 = v148;
          uint64_t v73 = sub_10001AC9C((char *)(a1 + 308), (uint64_t)&v158, 1);
          if ((_DWORD)v73) {
            return;
          }
          goto LABEL_43;
        }
      }

      goto LABEL_59;
    }

    inet_ntop(30, a2 + 16, v171, 0x2Eu);
    inet_ntop(30, (const void *)(a1 + 720), v172, 0x2Eu);
    sub_1000036BC(2u, (uint64_t)"%s prefix changed from %s -> %s", v91, v92, v93, v94, v95, v96, a1 + 308);
    __int128 v97 = *((_OWORD *)v10 + 3);
    *(_OWORD *)(a1 + 936) = *((_OWORD *)v10 + 2);
    *(_OWORD *)(a1 + 952) = v97;
    __int128 v98 = *((_OWORD *)v10 + 7);
    *(_OWORD *)(a1 + 1000) = *((_OWORD *)v10 + 6);
    *(_OWORD *)(a1 + 1016) = v98;
    __int128 v99 = *((_OWORD *)v10 + 5);
    *(_OWORD *)(a1 + 968) = *((_OWORD *)v10 + 4);
    *(_OWORD *)(a1 + 984) = v99;
    *(void *)(a1 + 1096) = *((void *)v10 + 24);
    __int128 v100 = *((_OWORD *)v10 + 11);
    *(_OWORD *)(a1 + 1064) = *((_OWORD *)v10 + 10);
    *(_OWORD *)(a1 + 1080) = v100;
    __int128 v101 = *((_OWORD *)v10 + 9);
    *(_OWORD *)(a1 + 1032) = *((_OWORD *)v10 + 8);
    *(_OWORD *)(a1 + 1048) = v101;
    __int128 v102 = *((_OWORD *)v10 + 1);
    *(_OWORD *)(a1 + 904) = *(_OWORD *)v10;
    *(_OWORD *)(a1 + 920) = v102;
    *(_OWORD *)int v10 = *(_OWORD *)a2;
    __int128 v103 = *((_OWORD *)a2 + 1);
    __int128 v104 = *((_OWORD *)a2 + 2);
    __int128 v105 = *((_OWORD *)a2 + 4);
    *((_OWORD *)v10 + 3) = *((_OWORD *)a2 + 3);
    *((_OWORD *)v10 + 4) = v105;
    *((_OWORD *)v10 + 1) = v103;
    *((_OWORD *)v10 + 2) = v104;
    __int128 v106 = *((_OWORD *)a2 + 5);
    __int128 v107 = *((_OWORD *)a2 + 6);
    __int128 v108 = *((_OWORD *)a2 + 8);
    *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
    *((_OWORD *)v10 + 8) = v108;
    *((_OWORD *)v10 + 5) = v106;
    *((_OWORD *)v10 + 6) = v107;
    __int128 v109 = *((_OWORD *)a2 + 9);
    __int128 v110 = *((_OWORD *)a2 + 10);
    __int128 v111 = *((_OWORD *)a2 + 11);
    *((void *)v10 + 24) = *((void *)a2 + 24);
    *((_OWORD *)v10 + 10) = v110;
    *((_OWORD *)v10 + 11) = v111;
    *((_OWORD *)v10 + 9) = v109;
    if (!*(_BYTE *)(a1 + 1106))
    {
      sub_10000EBC0(a1 + 308, 1);
      sub_10001D3DC(1u);
      *(_BYTE *)(a1 + 1106) = 1;
    }

    if (!dword_1000354D4)
    {
LABEL_59:
      uint64_t v142 = "no internal interfaces to setup ipv6";
      goto LABEL_60;
    }

    xpc_object_t v48 = 0LL;
    char v112 = 1;
    goto LABEL_52;
  }

  if (*a2) {
    goto LABEL_39;
  }
  if (*(_BYTE *)(a1 + 1106))
  {
    sub_10000EBC0(a1 + 308, 0);
    sub_10001D3DC(0);
    *(_BYTE *)(a1 + 1106) = 0;
    if (dword_1000354D4)
    {
      __int128 v21 = *((_OWORD *)v10 + 11);
      __int128 v168 = *((_OWORD *)v10 + 10);
      __int128 v169 = v21;
      uint64_t v170 = *((void *)v10 + 24);
      __int128 v22 = *((_OWORD *)v10 + 7);
      __int128 v164 = *((_OWORD *)v10 + 6);
      __int128 v165 = v22;
      __int128 v23 = *((_OWORD *)v10 + 9);
      __int128 v166 = *((_OWORD *)v10 + 8);
      __int128 v167 = v23;
      __int128 v24 = *((_OWORD *)v10 + 3);
      __int128 v160 = *((_OWORD *)v10 + 2);
      __int128 v161 = v24;
      __int128 v25 = *((_OWORD *)v10 + 5);
      __int128 v162 = *((_OWORD *)v10 + 4);
      __int128 v163 = v25;
      __int128 v26 = *((_OWORD *)v10 + 1);
      __int128 v158 = *(_OWORD *)v10;
      __int128 v159 = v26;
      uint64_t v20 = (char *)(a1 + 308);
      char v13 = 0;
      goto LABEL_23;
    }
  }

  uint64_t v65 = 1020LL;
  if (v64 != 3) {
    LODWORD(qword_100035370) = 1020;
  }
LABEL_41:
  if (dword_10003536C != 1023) {
    dword_10003536C = 1022;
  }
  uint64_t v66 = SCPreferencesCreate(0LL, @"com.apple.MobileInternetSharing", @"com.apple.radios.plist");
  qword_1000353A8 = (uint64_t)v66;
  if (v66)
  {
    if (SCPreferencesSetCallback(v66, (SCPreferencesCallBack)sub_100013C20, 0LL)
      && SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_1000353A8, (dispatch_queue_t)qword_100035470))
    {
      sub_100013C6C();
    }

    else
    {
      uint64_t v68 = SCError();
      SCErrorString(v68);
      sub_1000036BC( 0,  (uint64_t)"%s: radio pref callback setup failed: %s\n",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)"mis_set_load");
      CFRelease((CFTypeRef)qword_1000353A8);
      qword_1000353A8 = 0LL;
    }
  }

  else
  {
    __int128 v75 = SCError();
    SCErrorString(v75);
    sub_1000036BC( 0,  (uint64_t)"%s: SCPreferencesCreate() failed: %s\n",  v76,  v77,  v78,  v79,  v80,  v81,  (uint64_t)"mis_set_load");
  }

  sub_100013D20(0LL, 0, v65, 0LL, 0LL, &v147, 0LL, v67);
  if (!v147)
  {
    if ((_DWORD)qword_100035370 != (_DWORD)v65 || !v63) {
      sub_100014238();
    }
    sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }

  Mutable = (const __CFDictionary *)qword_1000353C0;
  if (!qword_1000353C0)
  {
    int v84 = (const __CFDictionary *)sub_10000F190( "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist",  (int *)&v149,  0);
    if (v84)
    {
      uint64_t v85 = v84;
      qword_1000353C0 = (uint64_t)CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v84);
      CFRelease(v85);
      Mutable = (const __CFDictionary *)qword_1000353C0;
    }

    else
    {
      Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      qword_1000353C0 = (uint64_t)Mutable;
    }

    if (!Mutable)
    {
      uint64_t v95 = "CFDictionaryCreateMutable() failed";
LABEL_101:
      sub_1000036BC(0, (uint64_t)v95, v86, v87, v88, v89, v90, v91, v144);
      goto LABEL_102;
    }
  }

  uint64_t v92 = (CFArrayRef *)&byte_100034F58[168];
  uint64_t v93 = (const __CFArray *)qword_1000353B0;
  if (!qword_1000353B0)
  {
    uint64_t v94 = (const __CFArray *)CFDictionaryGetValue(Mutable, @"MAC_ARRAY");
    uint64_t v93 = v94
        ? CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, v94)
        : CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    qword_1000353B0 = (uint64_t)v93;
    if (!v93)
    {
LABEL_100:
      uint64_t v95 = "CFArrayCreateMutable() failed";
      goto LABEL_101;
    }
  }

  if (!qword_1000353B8)
  {
    uint64_t v96 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, @"MAC_IOUE_ARRAY");
    if (v96) {
      MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, v96);
    }
    else {
      MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    }
    qword_1000353B8 = (uint64_t)MutableCopy;
    if (MutableCopy)
    {
      uint64_t v93 = (const __CFArray *)qword_1000353B0;
      goto LABEL_73;
    }

    goto LABEL_100;
  }

void sub_10000A5D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (byte_100035481) {
    return;
  }
  if (*(_BYTE *)(a1 + 1107)) {
    sub_10002233C();
  }
  int v10 = (void *)(a1 + 648);
  if (*(void *)a2 == *(void *)(a1 + 648) && *(void *)(a2 + 8) == *(void *)(a1 + 656))
  {
    BOOL v15 = *v10 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a1 + 656) == *(void *)&in6addr_any.__u6_addr32[2];
    if (!v15 && !*(_BYTE *)(a1 + 1105))
    {
      sub_10001D3DC(1u);
      *(_BYTE *)(a1 + 1105) = 1;
    }
  }

  else
  {
    uint64_t v12 = *(void *)&in6addr_any.__u6_addr32[2];
    if (*(void *)a2 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a2 + 8) == v12)
    {
      if (*(_BYTE *)(a1 + 1105))
      {
        sub_10001D3DC(0);
        *(_BYTE *)(a1 + 1105) = 0;
        return;
      }
    }

    else if (*v10 != *(void *)in6addr_any.__u6_addr8 || *(void *)(a1 + 656) != v12)
    {
      *(_OWORD *)int v10 = *(_OWORD *)a2;
      if (!*(_BYTE *)(a1 + 1105))
      {
        sub_10001D3DC(1u);
        *(_BYTE *)(a1 + 1105) = 1;
      }

      if (dword_1000354D4) {
        sub_10001CA50((char *)(a1 + 308), 0, 1LL, a4, a5, a6, a7, a8, a9);
      }
      return;
    }

    if (*v10 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a1 + 656) == v12)
    {
      *(_OWORD *)int v10 = *(_OWORD *)a2;
      if (!*(_BYTE *)(a1 + 1105))
      {
        sub_10001D3DC(1u);
        *(_BYTE *)(a1 + 1105) = 1;
      }

      if (dword_1000354D4)
      {
        xpc_object_t v17 = xpc_array_create(0LL, 0LL);
        for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
        {
          if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
          {
            if (!*(_DWORD *)(i + 16) && !*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201) {
              sub_10000EA50((const char *)(i + 308), 1);
            }
            if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
            {
              int v24 = sub_100012BE4(i, a1, 1LL, v19, v20, v21, v22, v23);
              uint64_t v30 = (const char *)(i + 308);
              if (v24) {
                sub_1000036BC( 0,  (uint64_t)"%s: failed to setup IPv6 on %s",  (uint64_t)v30,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"mis_process_v6_addr_change");
              }
              else {
                xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, v30);
              }
            }
          }
        }

        if (xpc_array_get_count(v17))
        {
          if (!sub_100021210(a1, v17, v31, v32, v33, v34, v35, v36))
          {
            __int128 v37 = sub_10001A8C0((char *)(a1 + 308), *(_DWORD *)(a1 + 300));
            if (!(_DWORD)v37)
            {
              uint64_t v45 = sub_10001FB7C((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);
              if ((_DWORD)v45)
              {
                uint64_t v66 = strerror(v45);
                sub_1000036BC(0, (uint64_t)"unable to start rtadvd: %s", v53, v54, v55, v56, v57, v58, (uint64_t)v66);
              }

              else
              {
                int v59 = sub_100020BD8(v45, v46, v47, v48, v49, v50, v51, v52);
                if (v59)
                {
                  strerror(v59);
                  sub_1000036BC(0, (uint64_t)"unable to start dhcp6d for %s: %s", v60, v61, v62, v63, v64, v65, 308LL);
                }
              }
            }
          }
        }

        if (v17) {
          xpc_release(v17);
        }
      }
    }
  }

void sub_10000A894( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v11 = *(_DWORD *)(a1 + 1264);
  if (a2 || *(_DWORD *)(a1 + 680))
  {
    if (sub_10001F9D8() && !byte_100035484)
    {
      sub_1000036BC( 1u,  (uint64_t)"%s: device currently has dual sim, skipping PREF64 configurations",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"mis_process_pref64");
      BOOL v24 = v11 == 1;
      goto LABEL_19;
    }

    uint64_t v25 = sub_100007480(a1, 1, 0LL, v13, v14, v15, v16, v17);
    if ((_DWORD)v25)
    {
      if ((_DWORD)v25 != 2)
      {
        sub_1000036BC( 0,  (uint64_t)"%s: failed to query NAT64 prefix on ext if %s",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"mis_process_pref64");
        return;
      }

      uint64_t v25 = sub_1000036BC( 1u,  (uint64_t)"%s: NAT64 prefix doesn't exist on ext if %s",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"mis_process_pref64");
    }

    if (v11)
    {
      if (v11 != *(_DWORD *)(a1 + 1264))
      {
        BOOL v24 = 1;
LABEL_19:
        int v28 = *(_DWORD *)(a1 + 680);
        if (v28 == a2)
        {
          if (*(_DWORD *)(a1 + 684) == v8)
          {
            if (!a2) {
              return;
            }
            if (!*(_BYTE *)(a1 + 1104))
            {
              sub_10001D2EC(1u);
              *(_BYTE *)(a1 + 1104) = 1;
              if (!v24) {
                return;
              }
              goto LABEL_42;
            }

            goto LABEL_41;
          }

          if (!a2) {
            return;
          }
          goto LABEL_35;
        }

        uint64_t v27 = (int *)(a1 + 680);
        if (a2)
        {
          if (v28)
          {
            *uint64_t v27 = a2;
LABEL_35:
            *(_DWORD *)(a1 + 684) = v8;
            if (!*(_BYTE *)(a1 + 1104))
            {
              sub_10001D2EC(1u);
              *(_BYTE *)(a1 + 1104) = 1;
            }

            if ((_DWORD)qword_1000354D4)
            {
              sub_10001CA50((char *)(a1 + 308), 1, 0LL, v19, v20, v21, v22, v23, v67);
              if (!v24) {
                return;
              }
              goto LABEL_42;
            }

            goto LABEL_41;
          }

          int v39 = *(unsigned __int8 *)(a1 + 1104);
          *(_DWORD *)(a1 + 680) = a2;
          uint64_t v40 = (_DWORD *)(a1 + 684);
          *(_DWORD *)(a1 + 684) = v8;
          if (v39)
          {
LABEL_50:
            if (!(_DWORD)qword_1000354D4) {
              return;
            }
            xpc_object_t v30 = xpc_array_create(0LL, 0LL);
            for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
            {
              if (*(_BYTE *)(i + 700)
                && *(_DWORD *)(i + 20) == 201
                && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
              {
                int v48 = sub_1000125D4(i, a1, v42, v43, v44, v45, v46, v47);
                uint64_t v54 = (const char *)(i + 308);
                if (v48)
                {
                  sub_1000036BC( 0,  (uint64_t)"failed to setup IPv4 on %s",  (uint64_t)v54,  v49,  v50,  v51,  v52,  v53,  i + 308);
                }

                else
                {
                  xpc_array_set_string(v30, 0xFFFFFFFFFFFFFFFFLL, v54);
                }
              }
            }

            if (!xpc_array_get_count(v30)) {
              goto LABEL_44;
            }
            sub_100019DEC((char *)(a1 + 308), v27, v40, *(_DWORD *)(a1 + 300));
            if (!v24) {
              goto LABEL_44;
            }
            goto LABEL_43;
          }

LABEL_49:
          sub_10001D2EC(1u);
          *(_BYTE *)(a1 + 1104) = 1;
          goto LABEL_50;
        }

        goto LABEL_28;
      }
    }

    else
    {
      int v11 = *(_DWORD *)(a1 + 1264);
    }

    BOOL v24 = 0;
    goto LABEL_19;
  }

  uint64_t v27 = (int *)(a1 + 680);
  sub_1000036BC( 1u,  (uint64_t)"%s: both existing and new v4 addresses are not present, skipping PREF64",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_process_v4_change");
  int v28 = *v27;
  if (!*v27) {
    return;
  }
  BOOL v24 = 0;
LABEL_28:
  if (!*(_BYTE *)(a1 + 1104))
  {
    if (v28)
    {
LABEL_41:
      if (!v24) {
        return;
      }
      goto LABEL_42;
    }

    *(_DWORD *)(a1 + 680) = a2;
    uint64_t v40 = (_DWORD *)(a1 + 684);
    *(_DWORD *)(a1 + 684) = v8;
    goto LABEL_49;
  }

  sub_10001D2EC(0);
  *(_BYTE *)(a1 + 1104) = 0;
  if (*(_DWORD *)(a1 + 1264) == 1 && v24)
  {
LABEL_42:
    xpc_object_t v30 = 0LL;
LABEL_43:
    uint64_t v31 = sub_1000036BC( 1u,  (uint64_t)"%s: resetting NETRB state due to PREF64 presence change",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"mis_process_v4_change");
    *(_DWORD *)(a1 + 1264) = 0;
    sub_100014A50(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_44:
    if (v30) {
      xpc_release(v30);
    }
  }

      uint64_t v35 = 0LL;
LABEL_50:
      int v39 = 0LL;
LABEL_51:
      uint64_t v26 = 12LL;
      goto LABEL_55;
    }

    uint64_t v41 = *((unsigned __int8 *)v3 + 344);
    if (!*((_DWORD *)v3 + 13))
    {
      uint64_t v37 = 0LL;
      if (!*((_BYTE *)v3 + 344) || !dword_1000354B8) {
        goto LABEL_71;
      }
      uint64_t v41 = 1;
    }

    if (v41) {
      uint64_t v42 = &kPFShared_v4;
    }
    else {
      uint64_t v42 = &kPFBase_v4;
    }
    uint64_t v37 = PFUserCreate(kPFInternetSharing, *v42, qword_100035470, 0LL);
    if (!v37) {
      goto LABEL_49;
    }
    uint64_t v38 = sub_100019F84((uint64_t)v3, v37);
    if ((_DWORD)v38) {
      goto LABEL_47;
    }
LABEL_71:
    if (*((_BYTE *)v34 + 328))
    {
      if (*((_BYTE *)v3 + 344)) {
        uint64_t v45 = &kPFShared_v6;
      }
      else {
        uint64_t v45 = &kPFBase_nat66;
      }
      uint64_t v46 = PFUserCreate(kPFInternetSharing, *v45, qword_100035470, 0LL);
      int v39 = v46;
      if (v46)
      {
        uint64_t v40 = sub_10001A9B8((uint64_t)v3, v46);
        if (!(_DWORD)v40)
        {
LABEL_88:
          uint64_t v26 = sub_100014C10((char *)v3 + 20, (const char *)v34 + 20);
          if (!(_DWORD)v26)
          {
            uint64_t v35 = 0LL;
            uint64_t v43 = 1;
            if (!v37)
            {
LABEL_58:
              if (!v39) {
                goto LABEL_64;
              }
              if ((v43 & 1) != 0)
              {
                uint64_t v43 = 1;
LABEL_63:
                PFUserRelease(v39, 0LL);
LABEL_64:
                if (!v35) {
                  return v26;
                }
                if ((v43 & 1) != 0)
                {
LABEL_69:
                  PFUserRelease(v35, 0LL);
                  return v26;
                }

uint64_t sub_10000AC0C(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0LL, 0LL);
  for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
  {
    if (!*(_DWORD *)(i + 16)
      && *(_DWORD *)(i + 20) == 201
      && *(_BYTE *)(i + 700)
      && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
    {
      xpc_array_set_string(v2, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
    }
  }

  if (xpc_array_get_count(v2))
  {
    sub_100021790((char *)(a1 + 308), v2, v4, v5, v6, v7, v8, v9);
    uint64_t v17 = (void *)qword_100035490;
    if (qword_100035490)
    {
      do
      {
        if (v17[37] == a1) {
          sub_10001C4D0(v17, v10, v11, v12, v13, v14, v15, v16);
        }
        uint64_t v17 = (void *)*v17;
      }

      while (v17);
    }
  }

  if (v2) {
    xpc_release(v2);
  }
  return 0LL;
}

uint64_t sub_10000ACE8(uint64_t a1, const char *a2)
{
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
  {
    if (!*(_DWORD *)(i + 16) && *(_DWORD *)(i + 20) == 201 && !strncmp((const char *)(i + 565), a2, 0x10uLL))
    {
      snprintf((char *)(i + 565), 0x10uLL, "%s", (const char *)(a1 + 308));
      if (*(_BYTE *)(i + 700)) {
        xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
      }
    }
  }

  if (xpc_array_get_count(v4))
  {
    sub_100021210(a1, v4, v6, v7, v8, v9, v10, v11);
    uint64_t v12 = (void *)qword_100035490;
    if (qword_100035490)
    {
      do
      {
        if (v12[37] == a1) {
          sub_10001AFF0(v12);
        }
        uint64_t v12 = (void *)*v12;
      }

      while (v12);
    }
  }

  if (v4) {
    xpc_release(v4);
  }
  return 0LL;
}

void sub_10000AE00(const char *a1, Boolean *a2, Boolean *a3)
{
  uint64_t v6 = SCPreferencesCreate(0LL, @"com.apple.MobileInternetSharing", 0LL);
  *a2 = 0;
  *a3 = 0;
  if (v6)
  {
    uint64_t v13 = v6;
    uint64_t v14 = (const __SCNetworkService *)sub_10000AF4C(v6, a1);
    if (v14)
    {
      uint64_t v21 = v14;
      uint64_t v22 = SCNetworkServiceCopyProtocol(v14, kSCNetworkProtocolTypeIPv4);
      if (v22)
      {
        uint64_t v23 = v22;
        *a2 = SCNetworkProtocolGetEnabled(v22);
        CFRelease(v23);
      }

      BOOL v24 = SCNetworkServiceCopyProtocol(v21, kSCNetworkProtocolTypeIPv6);
      if (v24)
      {
        uint64_t v31 = v24;
        *a3 = SCNetworkProtocolGetEnabled(v24);
        CFRelease(v31);
      }

      sub_1000036BC( 1u,  (uint64_t)"interface protocol status for %s IPv4: %s, IPv6: %s",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)a1);
      CFRelease(v21);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"failed to find network service for %s", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    }

    CFRelease(v13);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v7, v8, v9, v10, v11, v12, (uint64_t)a1);
  }

CFTypeRef sub_10000AF4C(const __SCPreferences *a1, const char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x600u);
  if (v4)
  {
    CFStringRef v11 = v4;
    uint64_t v12 = SCNetworkSetCopyCurrent(a1);
    if (v12)
    {
      uint64_t v19 = v12;
      uint64_t v20 = SCNetworkSetCopyServices(v12);
      if (v20)
      {
        uint64_t v27 = v20;
        CFIndex Count = CFArrayGetCount(v20);
        if (Count < 1)
        {
LABEL_10:
          CFTypeRef v34 = 0LL;
        }

        else
        {
          CFIndex v29 = Count;
          CFIndex v30 = 0LL;
          while (1)
          {
            ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v27, v30);
            Interface = SCNetworkServiceGetInterface(ValueAtIndex);
            if (Interface)
            {
              CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
              if (BSDName)
              {
                if (CFEqual(BSDName, v11)) {
                  break;
                }
              }
            }

            if (v29 == ++v30) {
              goto LABEL_10;
            }
          }

          CFTypeRef v34 = CFRetain(ValueAtIndex);
        }

        CFRelease(v27);
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"SCNetworkSetCopyServices failed for (%s)", v21, v22, v23, v24, v25, v26, (uint64_t)a2);
        CFTypeRef v34 = 0LL;
      }

      CFRelease(v19);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"SCNetworkSetCopyCurrent failed for (%s)", v13, v14, v15, v16, v17, v18, (uint64_t)a2);
      CFTypeRef v34 = 0LL;
    }

    CFRelease(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"CFStringCreateWithCString() failed for (%s)", v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    return 0LL;
  }

  return v34;
}

void sub_10000B080(uint64_t a1)
{
  SCDynamicStoreRef v2 = SCDynamicStoreCreate(0LL, @"com.apple.MobileInternetSharing", 0LL, 0LL);
  if (v2)
  {
    int v3 = v2;
    SCDynamicStoreRef v4 = SCDynamicStoreCreate(0LL, @"com.apple.MobileInternetSharing", 0LL, 0LL);
    if (!v4) {
      goto LABEL_34;
    }
    SCDynamicStoreRef v11 = v4;
    CFStringRef v12 = CFStringCreateWithCString(0LL, (const char *)(a1 + 308), 0x600u);
    if (!v12)
    {
      CFRelease(v11);
      goto LABEL_34;
    }

    CFStringRef v13 = v12;
    uint64_t v14 = kSCDynamicStoreDomainSetup;
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  kSCEntNetInterface);
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, NetworkServiceEntity);
    CFRelease(NetworkServiceEntity);
    CFDictionaryRef v17 = SCDynamicStoreCopyMultiple(v11, 0LL, Mutable);
    CFRelease(Mutable);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (!v17 || CFGetTypeID(v17) != TypeID)
    {
      sub_1000036BC(0, (uint64_t)"Empty dictionary", v19, v20, v21, v22, v23, v24, v38);
      uint64_t Count = 0LL;
      goto LABEL_28;
    }

    uint64_t Count = CFDictionaryGetCount(v17);
    uint64_t v26 = (const void **)malloc(8 * Count);
    uint64_t v27 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(v17, v27, v26);
    if (Count < 1)
    {
      uint64_t Count = 0LL;
      if (!v26)
      {
LABEL_26:
        if (v27) {
          free(v27);
        }
LABEL_28:
        if (v17) {
          CFRelease(v17);
        }
        CFRelease(v13);
        CFRelease(v11);
        if (Count)
        {
          uint64_t v36 = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, v14, (CFStringRef)Count, kSCEntNetIPv4);
          if (v36)
          {
            uint64_t v37 = v36;
            SCDynamicStoreNotifyValue(v3, v36);
            CFRelease(v37);
          }

          CFRelease((CFTypeRef)Count);
          goto LABEL_35;
        }

LABEL_34:
        sub_1000036BC(1u, (uint64_t)"notify: svcid for %s not found", v5, v6, v7, v8, v9, v10, a1 + 308);
LABEL_35:
        CFRelease(v3);
        return;
      }
    }

    else
    {
      CFStringRef cf1 = v13;
      int v39 = v26;
      uint64_t v28 = (const __CFDictionary **)v26;
      CFIndex v29 = (CFStringRef *)v27;
      while (1)
      {
        CFIndex v30 = *v28;
        CFTypeID v31 = CFDictionaryGetTypeID();
        if (v30)
        {
          if (CFGetTypeID(v30) == v31)
          {
            Value = CFDictionaryGetValue(v30, kSCPropNetInterfaceDeviceName);
            if (Value)
            {
              if (CFEqual(cf1, Value)) {
                break;
              }
            }
          }
        }

        ++v29;
        ++v28;
        if (!--Count) {
          goto LABEL_13;
        }
      }

      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, *v29, @"/");
      if (!ArrayBySeparatingStrings)
      {
        uint64_t Count = 0LL;
LABEL_13:
        uint64_t v14 = kSCDynamicStoreDomainSetup;
        CFStringRef v13 = cf1;
        uint64_t v26 = v39;
        goto LABEL_25;
      }

      CFTypeRef v34 = ArrayBySeparatingStrings;
      uint64_t v14 = kSCDynamicStoreDomainSetup;
      CFStringRef v13 = cf1;
      uint64_t v26 = v39;
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 4)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v34, 3LL);
        uint64_t Count = (uint64_t)CFRetain(ValueAtIndex);
      }

      else
      {
        uint64_t Count = 0LL;
      }

      CFRelease(v34);
    }

LABEL_25:
    free(v26);
    goto LABEL_26;
  }

    if (v25)
    {
      uint64_t v16 = 0LL;
      while (1)
      {
        CFDictionaryRef v17 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v16);
        uint64_t v18 = CFDictionaryGetTypeID();
        if (v17)
        {
          if (CFGetTypeID(v17) == v18)
          {
            uint64_t v19 = (const __CFData *)CFDictionaryGetValue(v17, @"MAC_IOUE");
            uint64_t v20 = CFDataGetTypeID();
            if (v19)
            {
              if (CFGetTypeID(v19) == v20)
              {
                uint64_t v21 = CFDataGetBytePtr(v19);
                if (v21)
                {
                }
              }
            }
          }
        }

        if (v8 == ++v16) {
          return 0LL;
        }
      }
    }

    else
    {
      LODWORD(v16) = 0;
    }

    uint64_t v6 = v24;
  }

  while (!a2 && (_DWORD)v16 != v25);
  if ((_DWORD)v16 == v25) {
    return 0LL;
  }
  return 22LL;
}

          xpc_array_set_string((xpc_object_t)v11[4], 0xFFFFFFFFFFFFFFFFLL, string);
          uint64_t v54 = *((_DWORD *)v11 + 10);
          *((_DWORD *)v11 + 10) = v54 + 1;
          if (v54 == -1) {
            sub_100023C8C();
          }
          uint64_t v46 = 1;
          goto LABEL_27;
        }

        uint64_t v46 = 0;
LABEL_30:
        sub_1000036BC(2u, (uint64_t)"%s: after:", v38, v39, v40, v41, v42, v43, (uint64_t)"dns_proxy_insert_interfaces");
        uint64_t v62 = (void *)v11[4];
        if (v62)
        {
          uint64_t v63 = xpc_array_get_count((xpc_object_t)v11[4]);
          if (v63)
          {
            uint64_t v64 = v63;
            for (uint64_t j = 0LL; j != v64; ++j)
            {
              xpc_array_get_string(v62, j);
              sub_1000036BC(2u, (uint64_t)"%ld. %s", v66, v67, v68, v69, v70, v71, j);
            }
          }
        }

        if ((v46 & 1) != 0) {
          return sub_100021534((uint64_t)v11, v55, v56, v57, v58, v59, v60, v61);
        }
        return 0LL;
      }

      free(v11);
    }

    uint64_t v73 = 12LL;
    strerror(12);
    sub_1000036BC(0, (uint64_t)"%s, dns insert failed %s", v74, v75, v76, v77, v78, v79, (uint64_t)v10);
    return v73;
  }

  sub_1000036BC(2u, (uint64_t)"dns proxy not enabled", a3, a4, a5, a6, a7, a8, v80);
  return 0LL;
}

uint64_t *sub_10000B3A8(uint64_t a1)
{
  uint64_t result = &qword_1000354C0;
  while (1)
  {
    uint64_t result = (uint64_t *)*result;
    if (!result) {
      break;
    }
    if (result[1] == a1)
    {
      int v3 = *((_DWORD *)result + 6);
      if (!v3) {
        sub_100022364();
      }
      *((_DWORD *)result + 6) = v3 + 1;
      return result;
    }
  }

  return result;
}

void sub_10000B3EC( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v10)
  {
    CFDictionaryRef v17 = v10;
    xpc_dictionary_set_uint64(v10, off_100034CA8[0], a1);
    sub_1000036BC(2u, (uint64_t)"sending notification to clients", v18, v19, v20, v21, v22, v23, v25);
    for (uint64_t i = qword_1000354C0; i; uint64_t i = *(void *)i)
      xpc_connection_send_message(*(xpc_connection_t *)(i + 16), v17);
    xpc_release(v17);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"xpc_dictionary_create() failed", v11, v12, v13, v14, v15, v16, a9);
  }

void sub_10000B47C( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *((_DWORD *)a1 + 6);
  if (!v8) {
    sub_10002238C();
  }
  int v10 = v8 - 1;
  *((_DWORD *)a1 + 6) = v10;
  if (!v10)
  {
    if (a1[2])
    {
      sub_1000036BC(2u, (uint64_t)"releasing remote connection %p to client", a3, a4, a5, a6, a7, a8, a1[2]);
      xpc_connection_cancel((xpc_connection_t)a1[2]);
      xpc_release((xpc_object_t)a1[2]);
    }

    uint64_t v11 = &qword_1000354C0;
    *uint64_t v11 = *a1;
    free(a1);
    if (!dword_100034EF8) {
      sub_1000223B4();
    }
    --dword_100034EF8;
  }

void *sub_10000B52C(uint64_t a1, void *a2)
{
  SCDynamicStoreRef v4 = malloc(0x20uLL);
  uint64_t v11 = v4;
  if (!v4)
  {
    sub_1000036BC(0, (uint64_t)"malloc() failed for connection %p", v5, v6, v7, v8, v9, v10, a1);
    return v11;
  }

  *(_OWORD *)SCDynamicStoreRef v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[1] = a1;
  *((_DWORD *)v4 + 6) = 1;
  xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(a2, off_100034BF0[0]);
  if (!value)
  {
    uint64_t v22 = "message does not contain the endpoint connection";
LABEL_10:
    sub_1000036BC(0, (uint64_t)v22, v13, v14, v15, v16, v17, v18, v24);
    free(v11);
    return 0LL;
  }

  uint64_t v19 = xpc_connection_create_from_endpoint(value);
  if (!v19)
  {
    uint64_t v22 = "xpc_connection_create_from_endpoint() failed";
    goto LABEL_10;
  }

  uint64_t v20 = v19;
  v11[2] = v19;
  xpc_connection_set_target_queue(v19, (dispatch_queue_t)qword_100035470);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_10000B668;
  handler[3] = &unk_100030DE8;
  handler[4] = v20;
  void handler[5] = a1;
  handler[6] = v11;
  xpc_connection_set_event_handler(v20, handler);
  xpc_connection_resume(v20);
  *uint64_t v11 = qword_1000354C0;
  qword_1000354C0 = (uint64_t)v11;
  if (__CFADD__(dword_100034EF8++, 1)) {
    sub_1000223DC();
  }
  return v11;
}

void sub_10000B668(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  sub_1000036BC( 1u,  (uint64_t)"event on remote connection %p from client connection %p",  v5,  v6,  v7,  v8,  v9,  v10,  *(void *)(a1 + 32));
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17)
      {
        uint64_t v18 = &qword_1000354C0;
        while (1)
        {
          uint64_t v18 = (uint64_t *)*v18;
          if (!v18) {
            break;
          }
          if (v18[2] == v17)
          {
            sub_1000036BC(2u, (uint64_t)"found remote connection", v11, v12, v13, v14, v15, v16, v25);
            if (!*((_DWORD *)v18 + 6)) {
              sub_100022404();
            }
            sub_1000036BC( 1u,  (uint64_t)"XPC_ERROR_CONNECTION_INVALID for remote %p from connection %p",  v19,  v20,  v21,  v22,  v23,  v24,  *(void *)(a1 + 32));
            xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
            xpc_release(*(xpc_object_t *)(a1 + 32));
            *(void *)(*(void *)(a1 + 48) + 16LL) = 0LL;
            return;
          }
        }
      }
    }

    else if (object == &_xpc_error_termination_imminent)
    {
      sub_1000036BC( 0,  (uint64_t)"XPC_ERROR_TERMINATION_IMMINENT for peer %p from connection %p",  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)(a1 + 32));
    }

    else if (object == &_xpc_error_connection_interrupted)
    {
      sub_1000036BC( 0,  (uint64_t)"XPC_ERROR_CONNECTION_INTERRUPTED for peer %p from connection %p",  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)(a1 + 32));
    }
  }

char *sub_10000B7A0(_xpc_connection_s *a1, uint64_t a2, int a3)
{
  pid_t pid = xpc_connection_get_pid(a1);
  uint64_t v7 = (char *)malloc(0x200uLL);
  uint64_t v8 = v7;
  if (v7)
  {
    *((_OWORD *)v7 + 29) = 0u;
    *((_OWORD *)v7 + 30) = 0u;
    *((_OWORD *)v7 + 27) = 0u;
    *((_OWORD *)v7 + 28) = 0u;
    *((_OWORD *)v7 + 25) = 0u;
    *((_OWORD *)v7 + 26) = 0u;
    *((_OWORD *)v7 + 23) = 0u;
    *((_OWORD *)v7 + 24) = 0u;
    *((_OWORD *)v7 + 21) = 0u;
    *((_OWORD *)v7 + 22) = 0u;
    *((_OWORD *)v7 + 19) = 0u;
    *((_OWORD *)v7 + 20) = 0u;
    *((_OWORD *)v7 + 17) = 0u;
    *((_OWORD *)v7 + 18) = 0u;
    *((_OWORD *)v7 + 15) = 0u;
    *((_OWORD *)v7 + 16) = 0u;
    *((_OWORD *)v7 + 13) = 0u;
    *((_OWORD *)v7 + 14) = 0u;
    *((_OWORD *)v7 + 11) = 0u;
    *((_OWORD *)v7 + 12) = 0u;
    *((_OWORD *)v7 + 9) = 0u;
    *((_OWORD *)v7 + 10) = 0u;
    *((_OWORD *)v7 + 7) = 0u;
    *((_OWORD *)v7 + 8) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
    *((_OWORD *)v7 + 5) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *(_OWORD *)uint64_t v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *(_OWORD *)(v7 + 492) = 0u;
    *((_OWORD *)v7 + 6) = 0u;
    *((void *)v7 + 10) = a2;
    *((_DWORD *)v7 + 127) = a3;
    *((_DWORD *)v7 + 88) = pid;
    proc_name(pid, v7 + 356, 0x40u);
    snprintf(v8 + 96, 0x100uLL, "%s.%p-%p-%d", "com.apple.MobileInternetSharing", v8, a1, dword_100034EFC);
    sub_1000036BC( 2u,  (uint64_t)"client created %s (%p) (%s), client connection %p remote connection %p",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)(v8 + 356));
    uint64_t v15 = qword_1000354C8;
    if (qword_1000354C8)
    {
      uint64_t v16 = qword_1000354C8;
      while (strncmp(v8 + 96, (const char *)(v16 + 96), 0x100uLL)
           || *(_xpc_connection_s **)(*(void *)(v16 + 80) + 8LL) != a1)
      {
        uint64_t v16 = *(void *)v16;
        if (!v16) {
          goto LABEL_7;
        }
      }

      sub_1000036BC(0, (uint64_t)"duplicate mis client id %s", v17, v18, v19, v20, v21, v22, (uint64_t)(v8 + 96));
      free(v8);
      return 0LL;
    }

    else
    {
LABEL_7:
      int v23 = dword_100034EFC++;
      if (v23 == -1) {
        sub_10002242C();
      }
      *(void *)uint64_t v8 = v15;
      qword_1000354C8 = (uint64_t)v8;
      if (!v23)
      {
        sub_100003FEC();
        if (qword_100034F00) {
          sub_100022454();
        }
        qword_100034F00 = os_transaction_create("com.apple.misd.client-create");
      }
    }
  }

  return v8;
}

void sub_10000B960(void *a1, uint64_t a2)
{
  SCDynamicStoreRef v2 = (uint64_t *)sub_10000B980(a1, a2);
  if (v2) {
    sub_10000BA04(v2);
  }
}

uint64_t sub_10000B980(void *a1, uint64_t a2)
{
  string = xpc_dictionary_get_string(a1, off_100034BA0[0]);
  uint64_t v4 = qword_1000354C8;
  if (string) {
    BOOL v5 = qword_1000354C8 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0LL;
  }
  uint64_t v6 = string;
  do
  {
    uint64_t v4 = *(void *)v4;
  }

  while (v4);
  return v4;
}

void sub_10000BA04(uint64_t *a1)
{
  SCDynamicStoreRef v2 = &qword_1000354C8;
  *SCDynamicStoreRef v2 = *a1;
  if (!dword_100034EFC) {
    sub_10002247C();
  }
  --dword_100034EFC;
  sub_1000093B4((uint64_t)a1);
  uint64_t v11 = a1[11];
  if (v11)
  {
    sub_100009428(v11, (uint64_t)a1, v5, v6, v7, v8, v9, v10);
    if (a1[11]) {
      sub_1000224F4();
    }
  }

  uint64_t v12 = (uint64_t *)a1[10];
  if (v12) {
    sub_10000B47C(v12, v4, v5, v6, v7, v8, v9, v10);
  }
  sub_10001D1B8((uint64_t)a1, 2);
  sub_10001D1B8((uint64_t)a1, 30);
  else {
    BOOL v19 = *(unsigned __int16 *)((char *)a1 + 19) == 0;
  }
  if (!v19) {
    sub_1000154A8((uint64_t)a1 + 15);
  }
  uint64_t v20 = a1[3];
  if (v20)
  {
    IOEthernetControllerSetLinkStatus(v20, 0LL);
    IOEthernetControllerSetDispatchQueue(a1[3], 0LL);
    CFRelease((CFTypeRef)a1[3]);
    a1[3] = 0LL;
    if (!dword_1000354D0) {
      sub_1000224CC();
    }
    --dword_1000354D0;
    uint64_t v21 = (void *)a1[8];
    if (v21 && a1[7])
    {
      xpc_dictionary_set_uint64(v21, off_100034BF8[0], 0x7D3uLL);
      sub_100004868((_xpc_connection_s *)a1[7], (xpc_object_t)a1[8]);
      xpc_release((xpc_object_t)a1[8]);
      a1[7] = 0LL;
      a1[8] = 0LL;
    }
  }

  sub_1000036BC(2u, (uint64_t)"detached from %s (%p)", v13, v14, v15, v16, v17, v18, (uint64_t)a1 + 356);
  free(a1);
  if (!dword_100034EFC)
  {
    sub_1000036BC(2u, (uint64_t)"no clients left; resuming idle timer", v22, v23, v24, v25, v26, v27, v28);
    sub_10000401C();
    if (!qword_100034F00) {
      sub_1000224A4();
    }
    os_release((void *)qword_100034F00);
    qword_100034F00 = 0LL;
  }

uint64_t sub_10000BBE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = 0;
  uint64_t v9 = &qword_1000354C8;
  uint64_t v10 = "maximum interfaces per vm reached";
  while (1)
  {
    uint64_t v9 = (uint64_t *)*v9;
    if (!v9) {
      break;
    }
    if (*((_DWORD *)v9 + 88) == *(_DWORD *)(a1 + 352))
    {
      if (v9[3]) {
        ++v8;
      }
    }

    if (v8 == 10) {
      goto LABEL_10;
    }
  }

  if (dword_1000354D0 == 128)
  {
    uint64_t v10 = "maximum interfaces for vm";
LABEL_10:
    sub_1000036BC(0, (uint64_t)v10, a3, a4, a5, a6, a7, a8, vars0);
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_10000BC60( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_100022544();
  }
  uint64_t v12 = a2;
  if (a3 != 0xFFFFFFFFLL)
  {
    uint64_t v13 = a1 + 8LL * a2;
    uint64_t v14 = *(void *)(v13 + 424);
    if (v14)
    {
      uint64_t v15 = *(void **)(v13 + 424);
      while (*v15 != a3)
      {
        uint64_t v15 = (void *)v15[2];
        if (!v15) {
          goto LABEL_7;
        }
      }

      uint64_t v20 = "duplicate device ID found on the list.";
      LOBYTE(v16) = 0;
      return sub_1000036BC(v16, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
    }

LABEL_7:
    uint64_t v16 = malloc(0x18uLL);
    if (!v16)
    {
      uint64_t v20 = "failed to allocate memory.";
      return sub_1000036BC(v16, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
    }

    *(void *)uint64_t v16 = a3;
    v16[2] = a2;
    *((void *)v16 + 2) = v14;
    *(void *)(v13 + 424) = v16;
  }

  uint64_t v17 = a1 + 4 * v12;
  int v18 = *(_DWORD *)(v17 + 480);
  *(_DWORD *)(v17 + 480) = v18 + 1;
  if (v18 == -1) {
    sub_10002256C();
  }
  return sub_10001503C(a2, 1);
}

  if (v23) {
    free(v23);
  }
  if (v32) {
    free(v32);
  }
  if ((_DWORD)v25 == 2) {
    return 0LL;
  }
  return v25;
}

  uint64_t v10 = 0LL;
LABEL_8:
  *(_DWORD *)(a2 + 12) = v10 == 0;
  return v10;
}

void sub_10000BD44(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_100022594();
  }
  uint64_t v5 = a2;
  if (a3 != 0xFFFFFFFFLL)
  {
    uint64_t v6 = a1 + 8LL * a2;
    uint64_t v7 = *(void **)(v6 + 424);
    if (!v7) {
      return;
    }
    int v8 = (void *)(v6 + 424);
    uint64_t v9 = v7;
    while (*v9 != a3)
    {
      uint64_t v9 = (void *)v9[2];
      if (!v9) {
        return;
      }
    }

    if (v7 != v9)
    {
      do
      {
        uint64_t v10 = v7;
        uint64_t v7 = (void *)v7[2];
      }

      while (v7 != v9);
      int v8 = v10 + 2;
      uint64_t v7 = v9;
    }

    *int v8 = v7[2];
    sub_100003B30(a3);
    free(v9);
  }

  uint64_t v11 = a1 + 4 * v5;
  int v12 = *(_DWORD *)(v11 + 480);
  BOOL v13 = __OFSUB__(v12, 1);
  int v14 = v12 - 1;
  if (v14 < 0 == v13)
  {
    *(_DWORD *)(v11 + 480) = v14;
    sub_10001508C(a2, 1u);
  }

uint64_t sub_10000BE20(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = sub_100015030();
  uint64_t result = sub_1000150DC();
  *a3 = result;
  return result;
}

uint64_t sub_10000BE50(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_1000225BC();
  }
  uint64_t v3 = a1 + 4LL * a2;
  unsigned int v4 = *(_DWORD *)(v3 + 480);
  *(_DWORD *)(v3 + 480) = a3;
  if (v4 >= a3)
  {
    if (v4 > a3) {
      sub_10001508C(a2, v4 - a3);
    }
  }

  else
  {
    sub_10001503C(a2, a3 - v4);
  }

  return 1LL;
}

uint64_t sub_10000BEAC(uint64_t result)
{
  return result;
}

uint64_t sub_10000BEBC(uint64_t a1, const char *a2)
{
  uint64_t result = snprintf((char *)(a1 + 308), 0x100uLL, "%s", a2);
  unsigned int v4 = *(uint64_t (**)(uint64_t, void))(a1 + 632);
  if (v4) {
    return v4(a1, 0LL);
  }
  return result;
}

uint64_t sub_10000BF18(uint64_t a1)
{
  uint64_t v2 = sub_100015674((uint64_t)bytes);
  if ((_DWORD)v2)
  {
    uint64_t v9 = v2;
    sub_1000036BC(0, (uint64_t)"error getting mac address for interface", v3, v4, v5, v6, v7, v8, v47);
    goto LABEL_18;
  }

  *(_DWORD *)(a1 + 15) = *(_DWORD *)bytes;
  *(_WORD *)(a1 + 19) = v49;
  CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, bytes, 6LL);
  if (!v10)
  {
    sub_1000036BC(0, (uint64_t)"client %p, CFDataCreate() failed", v11, v12, v13, v14, v15, v16, a1);
LABEL_17:
    uint64_t v9 = 12LL;
    goto LABEL_18;
  }

  CFDataRef v17 = v10;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_1000036BC(0, (uint64_t)"client %p, CFDictionaryCreateMutable() failed", v19, v20, v21, v22, v23, v24, a1);
    uint64_t v44 = v17;
LABEL_16:
    CFRelease(v44);
    goto LABEL_17;
  }

  uint64_t v25 = Mutable;
  CFDictionarySetValue(Mutable, @"EnableMultiPages", kCFBooleanTrue);
  CFDictionarySetValue(v25, kIOEthernetHardwareAddress, v17);
  int v26 = *(_DWORD *)(a1 + 72);
  if (v26) {
    sub_10000C204(v25, @"MaxTransferUnit", v26);
  }
  if (*(_BYTE *)(a1 + 76)) {
    CFDictionarySetValue(v25, @"EnableTSO", kCFBooleanTrue);
  }
  CFDictionarySetValue(v25, @"NamePrefix", @"vmenet");
  sub_10000C204(v25, @"SubType", 9);
  uint64_t v27 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v27)
  {
    sub_1000036BC(0, (uint64_t)"client %p, CFDictionaryCreateMutable() failed", v28, v29, v30, v31, v32, v33, a1);
    CFRelease(v17);
    uint64_t v44 = v25;
    goto LABEL_16;
  }

  CFTypeRef v34 = v27;
  CFDictionarySetValue(v27, @"Product Name", @"VM network interface");
  CFDictionarySetValue(v34, kIOUserEthernetInterfaceRole, @"VMNET");
  CFDictionarySetValue(v34, @"HiddenInterface", kCFBooleanTrue);
  CFDictionarySetValue(v34, @"IsEphemeral", kCFBooleanTrue);
  CFDictionarySetValue(v25, kIOUserEthernetInterfaceMergeProperties, v34);
  uint64_t v35 = IOEthernetControllerCreate(kCFAllocatorDefault, v25);
  *(void *)(a1 + 24) = v35;
  if (!v35)
  {
    uint64_t v9 = 12LL;
    uint64_t v43 = "client %p, ethernet controller create failed";
    goto LABEL_22;
  }

  IOEthernetControllerSetDispatchQueue(v35, qword_100035470);
  IOEthernetControllerRegisterBSDAttachCallback(*(void *)(a1 + 24), sub_10000C268, a1);
  char v42 = 1;
  if (IOEthernetControllerSetLinkStatus(*(void *)(a1 + 24), 1LL))
  {
    uint64_t v9 = 22LL;
    uint64_t v43 = "client %p, ethernet controller set link status failed";
LABEL_22:
    sub_1000036BC(0, (uint64_t)v43, v36, v37, v38, v39, v40, v41, a1);
    char v42 = 0;
    goto LABEL_24;
  }

  uint64_t v9 = 0LL;
LABEL_24:
  CFRelease(v17);
  CFRelease(v34);
  CFRelease(v25);
  if ((v42 & 1) != 0) {
    return 0LL;
  }
LABEL_18:
  uint64_t v45 = *(void *)(a1 + 24);
  if (v45)
  {
    IOEthernetControllerSetDispatchQueue(v45, 0LL);
    CFRelease(*(CFTypeRef *)(a1 + 24));
    *(void *)(a1 + 24) = 0LL;
  }

  return v9;
}

void sub_10000C204(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }

void sub_10000C268( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v106 = 0x200000;
  memset(v105, 0, sizeof(v105));
  int v104 = 0;
  uint64_t v8 = (void *)qword_1000354C8;
  if (!qword_1000354C8)
  {
LABEL_6:
    sub_1000036BC( 0,  (uint64_t)"%s: failed to find mis_client",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_vmnet_interface_attached_callback");
    return;
  }

  while (v8 != (void *)a2 || !*(void *)(a2 + 24) || !*(void *)(a2 + 64))
  {
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_6;
    }
  }

  io_registry_entry_t IONetworkInterfaceObject = IOEthernetControllerGetIONetworkInterfaceObject();
  if (!IONetworkInterfaceObject)
  {
    sub_1000036BC(0, (uint64_t)"client %p, getting network io object failed", v11, v12, v13, v14, v15, v16, a2);
    goto LABEL_33;
  }

  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( IONetworkInterfaceObject,  @"BSD Name",  kCFAllocatorDefault,  0);
  if (!CFProperty)
  {
    sub_1000036BC(0, (uint64_t)"client %p, getting bsd name failed", v18, v19, v20, v21, v22, v23, a2);
    goto LABEL_33;
  }

  uint64_t v24 = CFProperty;
  CFStringGetCString(CFProperty, (char *)(a2 + 32), 16LL, 0x600u);
  sub_1000036BC(2u, (uint64_t)"client %p bsd name %s", v25, v26, v27, v28, v29, v30, a2);
  CFRelease(v24);
  int BSDSocket = IOEthernetControllerGetBSDSocket(*(void *)(a2 + 24));
  *(_DWORD *)(a2 + 52) = BSDSocket;
  if (BSDSocket < 0)
  {
    sub_1000036BC(0, (uint64_t)"client %p, unable to get socket", v32, v33, v34, v35, v36, v37, a2);
    goto LABEL_33;
  }

  if (setsockopt(BSDSocket, 0xFFFF, 4097, &v106, 4u) != -1)
  {
LABEL_11:
    if (setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4098, &v106, 4u) != -1)
    {
      uint64_t v44 = malloc(0x28uLL);
      if (v44)
      {
        uint64_t v51 = v44;
        memset(v110, 0, sizeof(v110));
        __int128 v109 = 0u;
        __int128 v108 = 0u;
        memset(&v107[4], 0, 32);
        *(_DWORD *)__int128 v107 = 501;
        int v52 = *(_DWORD *)(a2 + 48);
        if (v52 == 201)
        {
          *(_DWORD *)__int128 v107 = 500;
          string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CD8[0]);
          if (string)
          {
            __strlcpy_chk(&v107[4], string, 46LL, 46LL);
            BYTE14(v10++*(_DWORD *)(result + 8) = 64;
            xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CD8[0], 0LL);
          }

          int v52 = *(_DWORD *)(a2 + 48);
        }

        __int128 v102 = v51;
        if (v52 == 202)
        {
          uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(*(xpc_object_t *)(a2 + 64), off_100034CE0[0]);
          if (uuid)
          {
            uint64_t v55 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CE8[0]);
            uint64_t v56 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CA0[0]);
            if (v55)
            {
              uint64_t v57 = v56;
              if (!v56) {
                sub_10002260C();
              }
              inet_pton(2, v55, &v105[32]);
              inet_pton(2, v57, &v105[36]);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CE8[0], 0LL);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CA0[0], 0LL);
            }

            uint64_t v58 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CF0[0]);
            if (v58)
            {
              inet_pton(30, v58, v105);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CF0[0], 0LL);
            }
          }
        }

        else
        {
          uuid = 0LL;
        }

        uint64_t v69 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C90[0]);
        uint64_t v70 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C98[0]);
        uint64_t v71 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CA0[0]);
        uint64_t v72 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C20[0]);
        if (*(_BYTE *)(a2 + 8)) {
          uint64_t v73 = a2 + 9;
        }
        else {
          uint64_t v73 = 0LL;
        }
        unsigned int v74 = *(_DWORD *)(a2 + 72);
        if (v74) {
          uint64_t v75 = v74;
        }
        else {
          uint64_t v75 = 1500LL;
        }
        int v76 = *(unsigned __int8 *)(a2 + 78);
        if (*(_BYTE *)(a2 + 79)) {
          v76 |= 2u;
        }
        else {
          uint64_t v77 = 302LL;
        }
        int v84 = sub_1000076C4( *(_DWORD *)(a2 + 48),  v77,  v72,  (char *)(a2 + 32),  2LL,  v75,  0LL,  v73,  uuid,  (uint64_t)v105,  v69,  v70,  v71,  2,  v107,  v76,  &v104);
        if (v69) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C90[0], 0LL);
        }
        if (v70) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C98[0], 0LL);
        }
        if (v71) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CA0[0], 0LL);
        }
        if (v72) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C20[0], 0LL);
        }
        if (uuid) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CE0[0], 0LL);
        }
        if (v84)
        {
          int v85 = sub_1000090B0((uint64_t)v84, a2, v78, v79, v80, v81, v82, v83);
          if (v85 == 36)
          {
            sub_1000046F8((uint64_t)v102, *(void *)(a2 + 56), *(void *)(a2 + 64), (uint64_t)v84, *(_DWORD *)(a2 + 52));
            sub_1000036BC( 2u,  (uint64_t)"reply enqueued %p for interface %s",  v94,  v95,  v96,  v97,  v98,  v99,  (uint64_t)v102);
            goto LABEL_36;
          }

          int v60 = v85;
          if (v85)
          {
            sub_100007268((uint64_t)v84, v86, v87, v88, v89, v90, v91, v92);
          }

          else
          {
            xpc_dictionary_set_string(*(xpc_object_t *)(a2 + 64), off_100034C10[0], v84 + 20);
            xpc_dictionary_set_fd(*(xpc_object_t *)(a2 + 64), off_100034BB8[0], *(_DWORD *)(a2 + 52));
            if (*(_DWORD *)(a2 + 48) != 204)
            {
              uint64_t v93 = *((void *)v84 + 36);
              if (v93) {
                sub_100010CB8(*(void **)(a2 + 64), v93);
              }
            }

            xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100034C80[0], (int)v75);
            int v60 = 0;
          }
        }

        else
        {
          sub_1000036BC(0, (uint64_t)"unable to create service for %s", v78, v79, v80, v81, v82, v83, a2 + 32);
          int v60 = v104;
          if (!v104) {
            sub_1000225E4();
          }
        }

        free(v102);
        goto LABEL_73;
      }

      sub_1000036BC(0, (uint64_t)"unable to create reply service object", v45, v46, v47, v48, v49, v50, (uint64_t)v101);
LABEL_33:
      uint64_t v61 = off_100034BF8;
      uint64_t v62 = 2000LL;
      goto LABEL_34;
    }

    __int128 v101 = (unsigned __int8 *)a2;
    uint64_t v59 = "client %p, set SO_RCVBUF failed";
    goto LABEL_30;
  }

  int v103 = 0;
  *(void *)__int128 v107 = 4LL;
  if (!sysctlbyname("kern.ipc.maxsockbuf", &v103, (size_t *)v107, 0LL, 0LL))
  {
    int v106 = v103;
    if (setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4097, &v106, 4u) == -1)
    {
      sub_1000036BC(0, (uint64_t)"client %p, set SO_SNDBUF failed", v63, v64, v65, v66, v67, v68, a2);
      goto LABEL_31;
    }

    goto LABEL_11;
  }

  uint64_t v59 = "sysctl kern.ipc.maxsockbuf failed";
LABEL_30:
  sub_1000036BC(0, (uint64_t)v59, v38, v39, v40, v41, v42, v43, (uint64_t)v101);
LABEL_31:
  int v60 = *__error();
LABEL_73:
  if (v60) {
    uint64_t v100 = 2000LL;
  }
  else {
    uint64_t v100 = 2001LL;
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100034BF8[0], v100);
  if (v60 != 16) {
    goto LABEL_35;
  }
  uint64_t v61 = off_100034BE8;
  uint64_t v62 = 6000LL;
LABEL_34:
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), *v61, v62);
LABEL_35:
  sub_100004868(*(_xpc_connection_s **)(a2 + 56), *(xpc_object_t *)(a2 + 64));
  xpc_release(*(xpc_object_t *)(a2 + 64));
LABEL_36:
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
}

uint64_t sub_10000C8FC(const char *a1)
{
  uint64_t v46 = 0LL;
  if (getifaddrs(&v46) < 0)
  {
    uint64_t v3 = *__error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v36, v37, v38, v39, v40, v41, v43);
LABEL_24:
    if (v46) {
      freeifaddrs(v46);
    }
  }

  else
  {
    uint64_t v2 = v46;
    if (v46)
    {
      uint64_t v3 = 0LL;
      while (1)
      {
        ifa_addr = v2->ifa_addr;
        if (!ifa_addr) {
          goto LABEL_21;
        }
        int sa_family = ifa_addr->sa_family;
        BOOL v6 = sa_family == 30 || sa_family == 2;
        if (!v6 || strncmp(a1, v2->ifa_name, 0x10uLL)) {
          goto LABEL_21;
        }
        if (sa_family == 2)
        {
          in_addr_t v45 = *(_DWORD *)&ifa_addr->sa_data[2];
          v7.s_addr = v45;
          uint64_t v8 = inet_ntoa(v7);
          snprintf(__str, 0x10uLL, "%s", v8);
          int v9 = sub_10000CAD0(a1, &v45);
          if (v9)
          {
            unsigned int v16 = v9;
            strerror(v9);
            sub_1000036BC(0, (uint64_t)"mis_difaddr(%s,%s): %s", v17, v18, v19, v20, v21, v22, (uint64_t)a1);
            goto LABEL_16;
          }

          sub_1000036BC(0, (uint64_t)"removed addr=%s on %s", v10, v11, v12, v13, v14, v15, (uint64_t)__str);
        }

        else
        {
          __int128 v44 = *(_OWORD *)&ifa_addr->sa_data[6];
          inet_ntop(30, &v44, v47, 0x2Eu);
          int v23 = sub_10000CBF4(a1, &v44);
          if (v23)
          {
            unsigned int v16 = v23;
            strerror(v23);
            sub_1000036BC(0, (uint64_t)"mis_difaddr6(%s,%s): %s", v30, v31, v32, v33, v34, v35, (uint64_t)a1);
LABEL_16:
            if ((_DWORD)v3) {
              uint64_t v3 = v3;
            }
            else {
              uint64_t v3 = v16;
            }
            goto LABEL_21;
          }

          sub_1000036BC(0, (uint64_t)"removed addr=%s on %s", v24, v25, v26, v27, v28, v29, (uint64_t)v47);
        }

uint64_t sub_10000CAD0(const char *a1, _DWORD *a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    in_addr v7 = __error();
    uint64_t v8 = strerror(*v7);
    sub_1000036BC(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }

  else
  {
    int v5 = v4;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v25) = 528;
      HIDWORD(v25) = *a2;
    }

    if (ioctl(v5, 0x80206919uLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      uint64_t v15 = __error();
      unsigned int v16 = strerror(*v15);
      sub_1000036BC(0, (uint64_t)"SIOCDIFADDR: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    close(v5);
  }

  return v6;
}

uint64_t sub_10000CBF4(const char *a1, _OWORD *a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    in_addr v7 = __error();
    uint64_t v8 = strerror(*v7);
    sub_1000036BC(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }

  else
  {
    int v5 = v4;
    __int128 v39 = 0u;
    __int128 v38 = 0u;
    __int128 v37 = 0u;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&char __dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }

    if (ioctl(v5, 0x81206919uLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      uint64_t v15 = __error();
      unsigned int v16 = strerror(*v15);
      sub_1000036BC(0, (uint64_t)"SIOCDIFADDR_IN6: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    close(v5);
  }

  return v6;
}

uint64_t sub_10000CD6C(const char *a1)
{
  *(void *)buffer = 0x600000001LL;
  int v28 = 0;
  size_t v27 = 4LL;
  if (sysctl(buffer, 2u, &v28, &v27, 0LL, 0LL) < 0)
  {
    unsigned int v16 = __error();
    uint64_t v17 = strerror(*v16);
    sub_1000036BC(0, (uint64_t)"failed to get max proc count (%s)", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    goto LABEL_11;
  }

  if (!v28)
  {
LABEL_11:
    uint64_t v24 = "no current processes";
    LOBYTE(v9) = 2;
LABEL_12:
    sub_1000036BC(v9, (uint64_t)v24, v2, v3, v4, v5, v6, v7, v26);
    return 0LL;
  }

  int v8 = 4 * v28;
  uint64_t v9 = (int *)malloc(4LL * v28);
  if (!v9)
  {
    uint64_t v24 = "malloc() failed";
    goto LABEL_12;
  }

  uint64_t v10 = v9;
  int v11 = proc_listallpids(v9, v8);
  if (v11 < 1)
  {
LABEL_9:
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v12 = v11;
    uint64_t v13 = v10;
    while (1)
    {
      int v14 = proc_pidpath(*v13, buffer, 0x400u);
      if (v14 >= 1)
      {
        *((_BYTE *)buffer + v14) = 0;
      }

      ++v13;
      if (!--v12) {
        goto LABEL_9;
      }
    }

    uint64_t v15 = *v13;
  }

  free(v10);
  return v15;
}

BOOL sub_10000CED4( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    return inet_pton(2, a1, &v10) != 0;
  }
  sub_1000036BC(0, (uint64_t)"ip address string is NULL", a3, a4, a5, a6, a7, a8, v9);
  return 0LL;
}

BOOL sub_10000CF4C(unsigned int a1)
{
  int v1 = 0;
  int v2 = 0;
  unsigned int v3 = bswap32(a1);
  while (v1 != 1)
  {
    int v1 = (v3 >> v2) & 1;
LABEL_6:
    if (++v2 == 32) {
      return v1 != 0;
    }
  }

  if (((v3 >> v2) & 1) != 0)
  {
    int v1 = 1;
    goto LABEL_6;
  }

  return 0LL;
}

BOOL sub_10000CF9C( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    return inet_pton(30, a1, &v10) != 0;
  }
  sub_1000036BC(0, (uint64_t)"ipv6 address string is NULL", a3, a4, a5, a6, a7, a8, v9);
  return 0LL;
}

uint64_t sub_10000CFE8(uint64_t a1, int a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    uint64_t v6 = *__error();
    sub_1000036BC(0, (uint64_t)"socket: %m", v7, v8, v9, v10, v11, v12, v22);
    if (v4 == -1) {
      return v6;
    }
    goto LABEL_12;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  if ((unint64_t)__strlcpy_chk(&v23, a1, 16LL, 16LL) > 0xF)
  {
    uint64_t v5 = "strlcpy: %s";
LABEL_11:
    uint64_t v6 = *__error();
    uint64_t v13 = __error();
    int v14 = strerror(*v13);
    sub_1000036BC(0, (uint64_t)v5, v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    goto LABEL_12;
  }

  if (ioctl(v4, 0xC0206911uLL, &v23) < 0)
  {
    uint64_t v5 = "SIOCGIFFLAGS: %s";
    goto LABEL_11;
  }

  LOWORD(v24) = v24 | a2 & ~(unsigned __int16)(a2 >> 31);
  if (ioctl(v4, 0x80206910uLL, &v23) < 0)
  {
    uint64_t v5 = "SIOCSIFFLAGS: %s";
    goto LABEL_11;
  }

  uint64_t v6 = 0LL;
LABEL_12:
  close(v4);
  return v6;
}

uint64_t sub_10000D144(char *a1)
{
  if (!a1) {
    sub_100022634();
  }
  if (!*a1) {
    sub_10002265C();
  }
  __int16 v26 = 0;
  uint64_t v2 = sub_10000CFE8((uint64_t)a1, -1);
  uint64_t v3 = v2;
  if ((_DWORD)v2)
  {
    int v4 = strerror(v2);
    sub_1000036BC(0, (uint64_t)"setifflags: %s", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }

  sub_10000AE00(a1, (Boolean *)&v26 + 1, (Boolean *)&v26);
  if (HIBYTE(v26))
  {
    uint64_t v11 = sub_10000D22C(a1);
    uint64_t v3 = v11;
    if ((_DWORD)v11)
    {
      strerror(v11);
      sub_1000036BC(0, (uint64_t)"protoattach failed (%s): %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }
  }

  if ((_BYTE)v26)
  {
    uint64_t v18 = sub_10000D3C8(a1);
    uint64_t v3 = v18;
    if ((_DWORD)v18)
    {
      strerror(v18);
      sub_1000036BC(0, (uint64_t)"protoattach6 failed (%s): %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
    }
  }

  return v3;
}

uint64_t sub_10000D22C(_BYTE *a1)
{
  if (!a1) {
    sub_100022684();
  }
  if (!*a1) {
    sub_1000226AC();
  }
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    uint64_t v14 = __error();
    uint64_t v15 = strerror(*v14);
    sub_1000036BC(0, (uint64_t)"socket: %s", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    uint64_t v4 = *__error();
    goto LABEL_13;
  }

  int v3 = v2;
  memset(v37, 0, sizeof(v37));
  if ((unint64_t)__strlcpy_chk(v37, a1, 16LL, 16LL) >= 0x10)
  {
    uint64_t v4 = *__error();
    uint64_t v5 = "strlcpy: %s";
LABEL_6:
    uint64_t v6 = __error();
    uint64_t v7 = strerror(*v6);
    sub_1000036BC(0, (uint64_t)v5, v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    goto LABEL_11;
  }

  if (ioctl(v3, 0xC0206950uLL, v37) == -1 && *__error() != 17)
  {
    uint64_t v4 = *__error();
    if ((_DWORD)v4)
    {
      uint64_t v5 = "SIOCPROTOATTACH: %s";
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

LABEL_11:
  if (close(v3))
  {
    int v28 = __error();
    uint64_t v4 = *v28;
    __int128 v29 = strerror(*v28);
    sub_1000036BC(0, (uint64_t)"close: %s", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
  }

LABEL_13:
  if (!(_DWORD)v4) {
    sub_1000036BC(1u, (uint64_t)"attached IPv4 protocol on %s", v22, v23, v24, v25, v26, v27, (uint64_t)a1);
  }
  return v4;
}

  if (!(_DWORD)v17) {
    sub_1000036BC(1u, (uint64_t)"detached IPv4 protocol on %s", v11, v12, v13, v14, v15, v16, (uint64_t)a1);
  }
  return v17;
}

uint64_t sub_10000D3C8(_BYTE *a1)
{
  if (!a1) {
    sub_1000226D4();
  }
  if (!*a1) {
    sub_1000226FC();
  }
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    uint64_t v10 = *__error();
    uint64_t v18 = "socket: %m";
    goto LABEL_13;
  }

  int v3 = v2;
  memset(v27, 0, sizeof(v27));
  if ((unint64_t)__strlcpy_chk(v27, a1, 16LL, 16LL) < 0x10)
  {
    uint64_t v26 = v27;
    if (ioctl(v3, 0xC080696EuLL) != -1 || *__error() == 17)
    {
      uint64_t v10 = 0LL;
      goto LABEL_11;
    }

    uint64_t v10 = *__error();
    if (!(_DWORD)v10) {
      goto LABEL_11;
    }
    uint64_t v11 = "SIOCPROTOATTACH_IN6: %m";
  }

  else
  {
    uint64_t v10 = *__error();
    uint64_t v11 = "strlcpy: %m";
  }

  sub_1000036BC(0, (uint64_t)v11, v4, v5, v6, v7, v8, v9, (uint64_t)v26);
LABEL_11:
  if (!close(v3)) {
    goto LABEL_14;
  }
  uint64_t v10 = *__error();
  uint64_t v18 = "close: %m";
LABEL_13:
  sub_1000036BC(0, (uint64_t)v18, v12, v13, v14, v15, v16, v17, (uint64_t)v26);
LABEL_14:
  if (!(_DWORD)v10) {
    sub_1000036BC(1u, (uint64_t)"attached IPv6 protocol on %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
  }
  return v10;
}

uint64_t sub_10000D54C(char *a1, int a2, int a3, char a4)
{
  if (!a1) {
    sub_100022724();
  }
  if (!*a1) {
    sub_10002274C();
  }
  __int16 v63 = 0;
  uint64_t v8 = sub_10000C8FC(a1);
  uint64_t v9 = v8;
  if ((_DWORD)v8)
  {
    strerror(v8);
    sub_1000036BC(0, (uint64_t)"remove_addrs(%s): %s", v10, v11, v12, v13, v14, v15, (uint64_t)a1);
  }

  if ((a4 & 1) == 0)
  {
    uint64_t v16 = sub_10000CFE8((uint64_t)a1, -1);
    uint64_t v9 = v16;
    if ((_DWORD)v16)
    {
      uint64_t v17 = strerror(v16);
      sub_1000036BC(0, (uint64_t)"setifflags: %s", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    }
  }

  sub_10000AE00(a1, (Boolean *)&v63 + 1, (Boolean *)&v63);
  int v24 = HIBYTE(v63);
  if (HIBYTE(v63))
  {
    if ((a4 & 1) == 0)
    {
      uint64_t v25 = sub_10000D22C(a1);
      uint64_t v9 = v25;
      if ((_DWORD)v25)
      {
        strerror(v25);
        sub_1000036BC(0, (uint64_t)"protoattach(%s): %s", v26, v27, v28, v29, v30, v31, (uint64_t)a1);
      }
    }
  }

  int v32 = v63;
  if (a2 && (_BYTE)v63)
  {
    int v33 = sub_10000D72C(a1);
    if (v33)
    {
      strerror(v33);
      sub_1000036BC(0, (uint64_t)"mis_autoconf_start(%s): %s", v34, v35, v36, v37, v38, v39, (uint64_t)a1);
    }

    uint64_t v40 = sub_10000D884(a1);
    uint64_t v9 = v40;
    if ((_DWORD)v40)
    {
      strerror(v40);
      sub_1000036BC(0, (uint64_t)"mis_ll_start(%s): %s", v41, v42, v43, v44, v45, v46, (uint64_t)a1);
    }

    if ((a4 & 1) == 0)
    {
      uint64_t v47 = sub_10000D3C8(a1);
      uint64_t v9 = v47;
      if ((_DWORD)v47)
      {
        strerror(v47);
        sub_1000036BC(0, (uint64_t)"protoattach6(%s): %s", v48, v49, v50, v51, v52, v53, (uint64_t)a1);
      }
    }
  }

  if (a3) {
    sub_10000D9AC(a1, 1);
  }
  if (v24 || v32)
  {
    uint64_t v54 = sub_10000CFE8((uint64_t)a1, 1);
    uint64_t v9 = v54;
    if ((_DWORD)v54)
    {
      uint64_t v55 = strerror(v54);
      sub_1000036BC(0, (uint64_t)"setifflags: %s", v56, v57, v58, v59, v60, v61, (uint64_t)v55);
    }
  }

  return v9;
}

uint64_t sub_10000D72C(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    uint64_t v5 = __error();
    uint64_t v6 = strerror(*v5);
    sub_1000036BC(0, (uint64_t)"socket: %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    return *__error();
  }

  else
  {
    int v3 = v2;
    __int128 v39 = 0u;
    __int128 v38 = 0u;
    __int128 v37 = 0u;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC1206984uLL, &__dst) == -1)
    {
      uint64_t v4 = *__error();
      uint64_t v13 = __error();
      uint64_t v14 = strerror(*v13);
      sub_1000036BC(0, (uint64_t)"SIOCAUTOCONF_START: %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    close(v3);
  }

  return v4;
}

uint64_t sub_10000D884(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    uint64_t v5 = __error();
    uint64_t v6 = strerror(*v5);
    sub_1000036BC(0, (uint64_t)"socket: %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    return *__error();
  }

  else
  {
    int v3 = v2;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC0806982uLL, __dst) == -1)
    {
      uint64_t v4 = *__error();
      uint64_t v13 = __error();
      uint64_t v14 = strerror(*v13);
      sub_1000036BC(0, (uint64_t)"SIOCLL_START: %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    close(v3);
  }

  return v4;
}

uint64_t sub_10000D9AC(const char *a1, int a2)
{
  uint64_t v4 = SCPreferencesCreate(0LL, @"com.apple.MobileInternetSharing", 0LL);
  if (v4)
  {
    uint64_t v11 = v4;
    uint64_t v12 = (const __SCNetworkService *)sub_10000AF4C(v4, a1);
    if (!v12)
    {
      sub_1000036BC(0, (uint64_t)"Failed to find network service for %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      uint64_t v39 = 0xFFFFFFFFLL;
LABEL_18:
      CFRelease(v11);
      return v39;
    }

    uint64_t v19 = v12;
    if (SCNetworkServiceGetEnabled(v12) == a2) {
      goto LABEL_10;
    }
    if (SCNetworkServiceSetEnabled(v19, a2))
    {
      if (SCPreferencesCommitChanges(v11))
      {
        if (SCPreferencesApplyChanges(v11))
        {
          __int128 v38 = "disabled";
          if (a2) {
            __int128 v38 = "enabled";
          }
          sub_1000036BC( 1u,  (uint64_t)"network service status changed to %s for %s",  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)v38);
LABEL_10:
          uint64_t v39 = 0LL;
LABEL_17:
          CFRelease(v19);
          goto LABEL_18;
        }

        sub_1000036BC(0, (uint64_t)"SCPreferencesApplyChanges for %s failed", v32, v33, v34, v35, v36, v37, (uint64_t)a1);
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"SCPreferencesCommitChanges for %s failed", v26, v27, v28, v29, v30, v31, (uint64_t)a1);
      }
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"SCNetworkServiceSetEnabled for %s failed", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
    }

    uint64_t v39 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }

  sub_1000036BC(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v5, v6, v7, v8, v9, v10, (uint64_t)a1);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000DAE8(char *a1, int a2, char a3)
{
  if (!a1) {
    sub_100022774();
  }
  if (!*a1) {
    sub_10002279C();
  }
  if (a2) {
    sub_10000D9AC(a1, 0);
  }
  int v5 = sub_10000C8FC(a1);
  if (v5)
  {
    strerror(v5);
    sub_1000036BC(0, (uint64_t)"remove_addrs(%s): %s", v6, v7, v8, v9, v10, v11, (uint64_t)a1);
  }

  if ((a3 & 1) == 0)
  {
    int v12 = sub_10000DC24(a1);
    if (v12)
    {
      strerror(v12);
      sub_1000036BC(0, (uint64_t)"protodetach(%s): %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }
  }

  int v19 = sub_10000DD78(a1);
  if (v19)
  {
    strerror(v19);
    sub_1000036BC(0, (uint64_t)"mis_autoconf_stop(%s): %s", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
  }

  int v26 = sub_10000DEB0(a1);
  if (v26)
  {
    strerror(v26);
    sub_1000036BC(0, (uint64_t)"mis_ll_stop(%s): %s", v27, v28, v29, v30, v31, v32, (uint64_t)a1);
  }

  if ((a3 & 1) == 0)
  {
    int v33 = sub_10000DFE8(a1);
    if (v33)
    {
      strerror(v33);
      sub_1000036BC(0, (uint64_t)"protodetach6(%s): %s", v34, v35, v36, v37, v38, v39, (uint64_t)a1);
    }
  }

  uint64_t v40 = sub_10000CFE8((uint64_t)a1, -1);
  uint64_t v41 = v40;
  if ((_DWORD)v40)
  {
    uint64_t v42 = strerror(v40);
    sub_1000036BC(0, (uint64_t)"setifflags: %s", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
  }

  return v41;
}

uint64_t sub_10000DC24(_BYTE *a1)
{
  if (!a1) {
    sub_1000227C4();
  }
  if (!*a1) {
    sub_1000227EC();
  }
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    sub_1000036BC(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, (uint64_t)v31);
    uint64_t v17 = *__error();
    goto LABEL_13;
  }

  int v9 = v2;
  memset(v32, 0, sizeof(v32));
  if ((unint64_t)__strlcpy_chk(v32, a1, 16LL, 16LL) <= 0xF)
  {
    uint64_t v31 = v32;
    if (ioctl(v9, 0xC0206951uLL) != -1)
    {
      uint64_t v17 = 0LL;
      goto LABEL_11;
    }

    uint64_t v10 = "SIOCPROTODETACH: %m";
  }

  else
  {
    uint64_t v10 = "strlcpy: %m";
  }

  uint64_t v17 = *__error();
  sub_1000036BC(0, (uint64_t)v10, v18, v19, v20, v21, v22, v23, (uint64_t)v31);
LABEL_11:
  if (close(v9))
  {
    uint64_t v17 = *__error();
    sub_1000036BC(0, (uint64_t)"close: %m", v24, v25, v26, v27, v28, v29, (uint64_t)v31);
  }

uint64_t sub_10000DD78(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_1000036BC(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v18);
    return *__error();
  }

  else
  {
    int v9 = v2;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    __int128 v22 = 0u;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v9, 0xC1206985uLL) == -1)
    {
      uint64_t v10 = *__error();
      sub_1000036BC(0, (uint64_t)"SIOCAUTOCONF_STOP: %m", v11, v12, v13, v14, v15, v16, (uint64_t)&__dst);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    close(v9);
  }

  return v10;
}

uint64_t sub_10000DEB0(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_1000036BC(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v18);
    return *__error();
  }

  else
  {
    int v9 = v2;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    __int128 v22 = 0u;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v9, 0xC1206983uLL) == -1)
    {
      uint64_t v10 = *__error();
      sub_1000036BC(0, (uint64_t)"SIOCLL_STOP: %m", v11, v12, v13, v14, v15, v16, (uint64_t)&__dst);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    close(v9);
  }

  return v10;
}

uint64_t sub_10000DFE8(_BYTE *a1)
{
  if (!a1) {
    sub_100022814();
  }
  if (!*a1) {
    sub_10002283C();
  }
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    uint64_t v11 = *__error();
    uint64_t v12 = "socket: %m";
    goto LABEL_13;
  }

  int v3 = v2;
  memset(v27, 0, sizeof(v27));
  if ((unint64_t)__strlcpy_chk(v27, a1, 16LL, 16LL) > 0xF)
  {
    uint64_t v4 = "strlcpy: %m";
LABEL_10:
    uint64_t v11 = *__error();
    sub_1000036BC(0, (uint64_t)v4, v13, v14, v15, v16, v17, v18, (uint64_t)v26);
    goto LABEL_11;
  }

  __int128 v26 = v27;
  if (ioctl(v3, 0xC120696FuLL) == -1)
  {
    uint64_t v4 = "SIOCPROTODETACH: %m";
    goto LABEL_10;
  }

  uint64_t v11 = 0LL;
LABEL_11:
  if (!close(v3)) {
    goto LABEL_14;
  }
  uint64_t v11 = *__error();
  uint64_t v12 = "close: %m";
LABEL_13:
  sub_1000036BC(0, (uint64_t)v12, v5, v6, v7, v8, v9, v10, (uint64_t)v26);
LABEL_14:
  if (!(_DWORD)v11) {
    sub_1000036BC(1u, (uint64_t)"detached IPv6 protocol on %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
  }
  return v11;
}

uint64_t sub_10000E15C(_BYTE *a1)
{
  if (!a1) {
    sub_100022864();
  }
  if (!*a1) {
    sub_10002288C();
  }
  int v2 = sub_10000DC24(a1);
  if (v2)
  {
    strerror(v2);
    sub_1000036BC(0, (uint64_t)"protodetach(%s): %s", v3, v4, v5, v6, v7, v8, (uint64_t)a1);
  }

  uint64_t v9 = sub_10000DFE8(a1);
  uint64_t v10 = v9;
  if ((_DWORD)v9)
  {
    strerror(v9);
    sub_1000036BC(0, (uint64_t)"protodetach6(%s): %s", v11, v12, v13, v14, v15, v16, (uint64_t)a1);
  }

  return v10;
}

uint64_t sub_10000E1E8(const char *a1)
{
  uint64_t v12 = 0LL;
  if (!a1 || !*a1) {
    sub_1000228B4();
  }
  if (getifaddrs(&v12))
  {
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v2, v3, v4, v5, v6, v7, v11);
  }

  else
  {
    uint64_t v10 = &v12;
    while (1)
    {
      uint64_t v10 = (ifaddrs **)*v10;
      if (!v10) {
        break;
      }
      if (!strncmp(a1, (const char *)v10[1], 0x10uLL))
      {
        uint64_t v8 = *((unsigned int *)v10 + 4);
        goto LABEL_6;
      }
    }
  }

  uint64_t v8 = 0LL;
LABEL_6:
  if (v12) {
    freeifaddrs(v12);
  }
  return v8;
}

uint64_t sub_10000E278(_BYTE *a1, int a2)
{
  if (!a1) {
    sub_1000228DC();
  }
  if (!*a1) {
    sub_100022904();
  }
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    uint64_t v6 = *__error();
    sub_1000036BC(0, (uint64_t)"socket: %m", v13, v14, v15, v16, v17, v18, v28);
    if (!(_DWORD)v6) {
      return v6;
    }
    goto LABEL_14;
  }

  int v5 = v4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  if ((unint64_t)__strlcpy_chk(&v29, a1, 16LL, 16LL) < 0x10)
  {
    LODWORD(v30) = a2;
    if (ioctl(v5, 0x80206934uLL, &v29) == -1)
    {
      unsigned int v19 = *__error();
      else {
        uint64_t v6 = v19;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = *__error();
    sub_1000036BC(0, (uint64_t)"strlcpy: %m", v7, v8, v9, v10, v11, v12, v28);
  }

  close(v5);
  if ((_DWORD)v6)
  {
LABEL_14:
    uint64_t v20 = strerror(v6);
    sub_1000036BC(0, (uint64_t)"SIOCSIFMTU: %s %d", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  }

  return v6;
}

uint64_t sub_10000E3D0(const char *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    sub_1000036BC(0, (uint64_t)"socket: %m", v9, v10, v11, v12, v13, v14, v24);
    return *__error();
  }

  else
  {
    int v15 = v8;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v27) = 528;
      DWORD1(v27) = *a2;
    }

    if (a3)
    {
      LOWORD(v29) = 528;
      DWORD1(v29) = *a3;
    }

    if (a4 || a2 && (a4 = a2, (sub_10000E1E8(a1) & 0x10) != 0))
    {
      LOWORD(v2++*(_DWORD *)(result + 8) = 528;
      DWORD1(v2++*(_DWORD *)(result + 8) = *a4;
    }

    if (ioctl(v15, 0x8040691AuLL, __dst) == -1)
    {
      uint64_t v16 = *__error();
      sub_1000036BC(0, (uint64_t)"SIOCAIFADDR: %m", v17, v18, v19, v20, v21, v22, v25);
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    close(v15);
  }

  return v16;
}

uint64_t sub_10000E530(const char *a1, _OWORD *a2, __int128 *a3, int a4)
{
  int v8 = socket(30, 2, 0);
  if (v8 < 0)
  {
    uint64_t v11 = __error();
    uint64_t v12 = strerror(*v11);
    sub_1000036BC(0, (uint64_t)"socket: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    return *__error();
  }

  else
  {
    int v9 = v8;
    uint64_t v33 = 0LL;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&char __dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }

    if (a3)
    {
      WORD4(v30) = 7708;
      __int128 v31 = *a3;
    }

    DWORD1(v32) = a4;
    uint64_t v34 = -1LL;
    if (ioctl(v9, 0x8080691AuLL, __dst) == -1)
    {
      uint64_t v10 = *__error();
      uint64_t v19 = __error();
      uint64_t v20 = strerror(*v19);
      sub_1000036BC(0, (uint64_t)"SIOCAIFADDR_IN6: %s", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    close(v9);
  }

  return v10;
}

uint64_t sub_10000E6A0(uint64_t a1)
{
  uint64_t v18 = 0LL;
  if (getifaddrs(&v18))
  {
    uint64_t v2 = *__error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v17);
  }

  else
  {
    int v9 = v18;
    if (v18)
    {
      while (1)
      {
        ifa_addr = v9->ifa_addr;
        if (ifa_addr && ifa_addr->sa_family == 18 && ifa_addr->sa_data[4] == 6)
        {
          uint64_t v11 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
          int v12 = *((_DWORD *)v11 + 2);
          int v13 = *((unsigned __int16 *)v11 + 6);
        }

        int v9 = v9->ifa_next;
        if (!v9)
        {
          uint64_t v2 = 0LL;
          goto LABEL_13;
        }
      }

      uint64_t v2 = 22LL;
LABEL_13:
      uint64_t v15 = v18;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v2 = 0LL;
    }

    freeifaddrs(v15);
  }

  return v2;
}

uint64_t sub_10000E768(uint64_t a1, int *a2, int a3)
{
  uint64_t v20 = 0LL;
  if (!a2) {
    sub_10002292C();
  }
  if (getifaddrs(&v20))
  {
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v6, v7, v8, v9, v10, v11, v19);
    return 0LL;
  }

  else
  {
    int v13 = v20;
    if (v20)
    {
      uint64_t v14 = (const char *)(a1 + 308);
      uint64_t v15 = v20;
      while (strncmp(v14, v15->ifa_name, 0x10uLL) || (v15->ifa_flags & 0x10) == 0)
      {
        uint64_t v15 = v15->ifa_next;
        if (!v15) {
          goto LABEL_9;
        }
      }

      if (a3)
      {
        ifa_netmask = v15->ifa_netmask;
        if (ifa_netmask) {
          int v18 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v18 = -1;
        }
        *a2 = v18;
      }

      uint64_t v12 = 1LL;
    }

    else
    {
LABEL_9:
      uint64_t v12 = 0LL;
    }

    freeifaddrs(v13);
  }

  return v12;
}

uint64_t sub_10000E83C(uint64_t a1)
{
  uint64_t v14 = 0LL;
  if (!*(_BYTE *)(a1 + 308)) {
    sub_100022954();
  }
  if (getifaddrs(&v14))
  {
    uint64_t v2 = *__error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v13);
  }

  else
  {
    uint64_t v9 = v14;
    if (v14)
    {
      uint64_t v10 = v14;
      while (1)
      {
        if (!strncmp((const char *)(a1 + 308), v10->ifa_name, 0x10uLL))
        {
          ifa_addr = v10->ifa_addr;
          if (ifa_addr)
          {
            if (ifa_addr->sa_family == 30
              && ifa_addr->sa_data[6] == 254
              && (ifa_addr->sa_data[7] & 0xC0) == 0x80)
            {
              break;
            }
          }
        }

        uint64_t v10 = v10->ifa_next;
        if (!v10) {
          goto LABEL_14;
        }
      }

      uint64_t v2 = 0LL;
      *(sockaddr *)(a1 + 664) = *(sockaddr *)&ifa_addr->sa_data[6];
    }

    else
    {
LABEL_14:
      uint64_t v2 = 6LL;
    }

    freeifaddrs(v9);
  }

  return v2;
}

uint64_t sub_10000E924(const char *a1)
{
  return sub_10000E92C(a1, 1);
}

uint64_t sub_10000E92C(const char *a1, int a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    uint64_t v7 = __error();
    uint64_t v8 = strerror(*v7);
    sub_1000036BC(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }

  else
  {
    int v5 = v4;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    strncpy(__dst, a1, 0x10uLL);
    LODWORD(v25) = a2;
    if (ioctl(v5, 0xC020698DuLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      uint64_t v15 = __error();
      uint64_t v16 = strerror(*v15);
      sub_1000036BC(0, (uint64_t)"SIOCSETROUTERMODE: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    close(v5);
  }

  return v6;
}

uint64_t sub_10000EA40(const char *a1)
{
  return sub_10000E92C(a1, 0);
}

uint64_t sub_10000EA48(const char *a1)
{
  return sub_10000EA50(a1, 1);
}

uint64_t sub_10000EA50(const char *a1, int a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    uint64_t v7 = __error();
    uint64_t v8 = strerror(*v7);
    sub_1000036BC(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }

  else
  {
    int v5 = v4;
    __int128 v41 = 0u;
    __int128 v40 = 0u;
    __int128 v39 = 0u;
    __int128 v38 = 0u;
    __int128 v37 = 0u;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    __int128 v32 = 0u;
    __int128 v31 = 0u;
    __int128 v30 = 0u;
    __int128 v29 = 0u;
    __int128 v28 = 0u;
    __int128 v27 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    LODWORD(v25) = a2;
    if (ioctl(v5, 0xC1206988uLL, &__dst) == -1)
    {
      uint64_t v6 = *__error();
      uint64_t v15 = __error();
      uint64_t v16 = strerror(*v15);
      sub_1000036BC(0, (uint64_t)"SIOCSETROUTERMODE_IN6: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    close(v5);
  }

  return v6;
}

uint64_t sub_10000EBB8(const char *a1)
{
  return sub_10000EA50(a1, 0);
}

uint64_t sub_10000EBC0(uint64_t a1, int a2)
{
  int v4 = socket(30, 2, 0);
  if ((v4 & 0x80000000) == 0)
  {
    int v11 = v4;
    uint64_t v26 = 0LL;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    memset(v23, 0, sizeof(v23));
    __strlcpy_chk(v23, a1, 16LL, 16LL);
    if (ioctl(v11, 0xC030694CuLL, v23) < 0)
    {
      uint64_t v14 = "SIOCGIFINFO_IN6 on %s: %m";
    }

    else
    {
      if (a2) {
        int v12 = 32;
      }
      else {
        int v12 = 0;
      }
      DWORD1(v24) = DWORD1(v24) & 0xFFFFFFDF | v12;
      uint64_t v13 = 0LL;
      if ((ioctl(v11, 0xC0486957uLL, v23) & 0x80000000) == 0) {
        goto LABEL_11;
      }
      uint64_t v14 = "SIOCSIFINFO_FLAGS on %s: %m";
    }

    uint64_t v13 = *__error();
    sub_1000036BC(0, (uint64_t)v14, v15, v16, v17, v18, v19, v20, a1);
LABEL_11:
    close(v11);
    return v13;
  }

  sub_1000036BC(0, (uint64_t)"socket: %m", v5, v6, v7, v8, v9, v10, v22);
  return *__error();
}

uint64_t sub_10000ED00(posix_spawnattr_t *a1, posix_spawn_file_actions_t *a2)
{
  uint64_t v4 = posix_spawn_file_actions_init(a2);
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    __int128 v41 = strerror(v4);
    sub_1000036BC(0, (uint64_t)"spawn init: %s", v6, v7, v8, v9, v10, v11, (uint64_t)v41);
  }

  else
  {
    if (dword_10003546C) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = byte_100035480 == 0;
    }
    if (v12)
    {
      posix_spawn_file_actions_addopen(a2, 1, "/dev/null", 1, 0);
      posix_spawn_file_actions_addopen(a2, 2, "/dev/null", 1, 0);
    }

    sigset_t v46 = 0;
    uint64_t v13 = posix_spawnattr_init(a1);
    if ((_DWORD)v13)
    {
      uint64_t v5 = v13;
      posix_spawn_file_actions_destroy(a2);
      uint64_t v42 = strerror(v5);
      sub_1000036BC(0, (uint64_t)"posix_spawnattr_init(): %s", v14, v15, v16, v17, v18, v19, (uint64_t)v42);
    }

    else
    {
      uint64_t v20 = posix_spawnattr_setflags(a1, 12);
      if ((_DWORD)v20)
      {
        uint64_t v5 = v20;
        posix_spawnattr_destroy(a1);
        posix_spawn_file_actions_destroy(a2);
        uint64_t v43 = strerror(v5);
        sub_1000036BC(0, (uint64_t)"posix_spawnattr_setflags(): %s", v21, v22, v23, v24, v25, v26, (uint64_t)v43);
      }

      else
      {
        uint64_t v27 = posix_spawnattr_setsigmask(a1, &v46);
        if ((_DWORD)v27)
        {
          uint64_t v5 = v27;
          posix_spawnattr_destroy(a1);
          posix_spawn_file_actions_destroy(a2);
          uint64_t v44 = strerror(v5);
          sub_1000036BC(0, (uint64_t)"posix_spawnattr_setsigmask(): %s", v28, v29, v30, v31, v32, v33, (uint64_t)v44);
        }

        else
        {
          sigset_t v46 = -1;
          uint64_t v5 = posix_spawnattr_setsigdefault(a1, &v46);
          if ((_DWORD)v5)
          {
            posix_spawnattr_destroy(a1);
            posix_spawn_file_actions_destroy(a2);
            uint64_t v45 = strerror(v5);
            sub_1000036BC(0, (uint64_t)"posix_spawnattr_setsigdefault(): %s", v34, v35, v36, v37, v38, v39, (uint64_t)v45);
          }
        }
      }
    }
  }

  return v5;
}

void sub_10000EEA8(const __CFArray *a1, const char *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFStringRef v5 = CFStringCreateWithCString(0LL, a2, 0x600u);
  if (v5)
  {
    CFStringRef v6 = v5;
    v7.location = 0LL;
    v7.length = Count;
    if (!CFArrayContainsValue(a1, v7, v5)) {
      CFArrayAppendValue(a1, v6);
    }
    CFRelease(v6);
  }

void sub_10000EF28(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0LL, cStr, 0x600u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }

void sub_10000EF8C(__CFDictionary *a1, const void *a2, __int16 a3)
{
  __int16 valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberShortType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }

uint64_t sub_10000EFF0( CFPropertyListRef propertyList, const char *a2, uid_t a3, gid_t a4, uint64_t a5, int a6)
{
  uint64_t v6 = 22LL;
  if (propertyList && a2 && (_DWORD)a5)
  {
    CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, propertyList, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
    if (Data)
    {
      CFDataRef v13 = Data;
      snprintf(__str, 0x400uLL, "%s-", a2);
      if (a6 == 1) {
        int v14 = open_dprotected_np(__str, 1537, 4, 0, a5);
      }
      else {
        int v14 = open(__str, 1537, a5);
      }
      int v15 = v14;
      if (v14 < 0)
      {
        uint64_t v6 = *__error();
        CFRelease(v13);
      }

      else
      {
        size_t Length = CFDataGetLength(v13);
        BytePtr = CFDataGetBytePtr(v13);
        if (write(v15, BytePtr, Length) == Length)
        {
          uint64_t v18 = rename(__str, a2);
          if ((_DWORD)v18)
          {
            uint64_t v6 = v18;
            unlink(__str);
          }

          else
          {
            uint64_t v6 = chown(a2, a3, a4);
          }
        }

        else
        {
          uint64_t v6 = *__error();
        }

        CFRelease(v13);
        close(v15);
      }
    }

    else
    {
      return 12LL;
    }
  }

  return v6;
}

size_t sub_10000F190(const char *a1, int *a2, int a3)
{
  int v6 = stat(a1, &v17);
  *a2 = v6;
  if (v6 < 0) {
    return 0LL;
  }
  size_t st_size = v17.st_size;
  if (v17.st_size)
  {
    uint64_t v8 = (UInt8 *)malloc(v17.st_size);
    if (v8)
    {
      uint64_t v9 = v8;
      if (a3 == 1) {
        int v10 = open_dprotected_np(a1, 0, 4, 0);
      }
      else {
        int v10 = open(a1, 0);
      }
      int v12 = v10;
      if ((v10 & 0x80000000) == 0)
      {
        if (read(v10, v9, st_size) == st_size)
        {
          CFDataRef v13 = CFDataCreateWithBytesNoCopy(0LL, v9, st_size, kCFAllocatorNull);
          if (v13)
          {
            int v14 = v13;
            size_t st_size = (size_t)CFPropertyListCreateWithData(kCFAllocatorDefault, v13, 0LL, 0LL, 0LL);
            if (!st_size) {
              *a2 = 12;
            }
            CFRelease(v14);
            goto LABEL_21;
          }

          size_t st_size = 0LL;
          int v15 = 12;
        }

        else
        {
          size_t st_size = 0LL;
          int v15 = *__error();
        }

        *a2 = v15;
LABEL_21:
        free(v9);
        close(v12);
        return st_size;
      }

      *a2 = *__error();
      free(v9);
      return 0LL;
    }

    size_t st_size = 0LL;
    int v11 = 12;
  }

  else
  {
    int v11 = 22;
  }

  *a2 = v11;
  return st_size;
}

uint64_t sub_10000F300(unsigned int a1)
{
  unsigned int v1 = bswap32(a1);
  int v2 = -32;
  while (((v1 >> v2) & 1) == 0)
  {
    if (__CFADD__(v2++, 1)) {
      return 32LL;
    }
  }

  return -v2;
}

char *sub_10000F328(int a1, unsigned int a2)
{
  int v2 = 0;
  int v14 = a1;
  unsigned int v3 = bswap32(a2);
  while (((v3 >> v2) & 1) == 0)
  {
    if (++v2 == 32)
    {
      byte_100034F0C = 0;
      int v4 = 32;
      int v5 = 4;
      goto LABEL_7;
    }
  }

  int v4 = 32 - v2;
  byte_100034F0C = 0;
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
      int v12 = ".";
    }
    else {
      int v12 = (const char *)&unk_10002576D;
    }
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk(&byte_100034F0C, __str, 32LL, 32LL);
    LODWORD(v7) = v7 - 1;
    --v8;
  }

  while (v8);
LABEL_12:
  snprintf(__str, 8uLL, "/%d", v4);
  __strlcat_chk(&byte_100034F0C, __str, 32LL, 32LL);
  return &byte_100034F0C;
}

const char *sub_10000F488(int a1)
{
  else {
    return off_100030E90[a1 - 201];
  }
}

const char *sub_10000F4B0(int a1)
{
  else {
    return off_100030EB0[a1 - 301];
  }
}

uint64_t sub_10000F4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFErrorRef err = 0LL;
  else {
    BOOL v4 = err == 0LL;
  }
  if (v4) {
    return 0LL;
  }
  Domain = CFErrorGetDomain(err);
  if (Domain)
  {
    CFStringGetCString(Domain, buffer, 256LL, 0x600u);
    CFErrorGetCode(err);
    sub_1000036BC(0, (uint64_t)"%s %s job error %s(%ld)", v7, v8, v9, v10, v11, v12, a2);
  }

  CFRelease(err);
  return 22LL;
}

uint64_t sub_10000F5D8(const char *a1, BOOL *a2)
{
  BOOL v4 = SCPreferencesCreate(0LL, @"com.apple.MobileInternetSharing", 0LL);
  if (v4)
  {
    uint64_t v11 = v4;
    uint64_t v12 = (const __SCNetworkService *)sub_10000AF4C(v4, a1);
    if (v12)
    {
      uint64_t v19 = v12;
      *a2 = SCNetworkServiceGetEnabled(v12) != 0;
      sub_1000036BC(1u, (uint64_t)"network service status for %s: %s", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
      CFRelease(v19);
      uint64_t v26 = 0LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"Failed to find network service for %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      uint64_t v26 = 0xFFFFFFFFLL;
    }

    CFRelease(v11);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    return 0xFFFFFFFFLL;
  }

  return v26;
}

xpc_object_t sub_10000F6B4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "iftype", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 280LL) + 284LL));
  xpc_dictionary_set_uint64(v2, "duration", *(void *)(a1 + 40));
  return v2;
}

uint64_t sub_10000F714(void *a1, int a2, _DWORD *a3)
{
  unsigned int v3 = a3;
  int v4 = a2;
  *a3 = 0;
  if (a2 == 2)
  {
    uint64_t v6 = &qword_1000354A8;
    int v72 = 5;
    uint64_t v7 = &dword_1000354B8;
  }

  else
  {
    if (a2 != 30) {
      sub_1000229CC();
    }
    uint64_t v6 = &qword_1000354B0;
    int v72 = 6;
    uint64_t v7 = &dword_1000354BC;
  }

  uint64_t interface_names = nwi_state_get_interface_names(*a1, 0LL, 0LL);
  if ((_DWORD)interface_names)
  {
    uint64_t v15 = interface_names;
    uint64_t v16 = malloc(8LL * (int)interface_names);
    if (v16)
    {
      uint64_t v17 = v16;
      int v18 = nwi_state_get_interface_names(*a1, v16, v15);
      if (v18 >= 1)
      {
        uint64_t v68 = v6;
        uint64_t v25 = 0LL;
        uint64_t v71 = 0LL;
        int v69 = 0;
        int v70 = v4;
        uint64_t v26 = v18;
        uint64_t v67 = v3;
        while (1)
        {
          uint64_t v27 = (const char *)v17[v25];
          if (v27 && *v27 && if_nametoindex((const char *)v17[v25]))
          {
            if (nwi_state_get_ifstate(*a1, v27))
            {
              uint64_t flags = nwi_ifstate_get_flags();
              if ((~(_DWORD)flags & v72) == 0)
              {
                if (v4 != 30) {
                  goto LABEL_32;
                }
                uint64_t v73 = 0LL;
                if (getifaddrs(&v73))
                {
                  sub_1000036BC( 0,  (uint64_t)"%s: getifaddrs: %m",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"mis_interface_has_routable_ipv6_addr");
                  goto LABEL_30;
                }

                __int128 v41 = v73;
                uint64_t v66 = v73;
                if (v73)
                {
                  while (1)
                  {
                    ifa_addr = v41->ifa_addr;
                    if (ifa_addr)
                    {
                      if (ifa_addr->sa_family == 30
                        && !strncmp(v27, v41->ifa_name, 0x10uLL)
                        && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80))
                      {
                        break;
                      }
                    }

                    __int128 v41 = v41->ifa_next;
                    if (!v41)
                    {
                      free(v66);
                      goto LABEL_30;
                    }
                  }

                  free(v66);
                  unsigned int v3 = v67;
LABEL_32:
                  sub_1000036BC( 2u,  (uint64_t)"%s: nwi interface name %s found for %s",  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"mis_nwi_process_state");
                  uint64_t v43 = v68;
                  while (1)
                  {
                    uint64_t v43 = (uint64_t *)*v43;
                    if (!v43) {
                      break;
                    }
                  }

                  uint64_t v44 = malloc(0x30uLL);
                  if (!v44)
                  {
                    uint64_t v59 = __error();
                    strerror(*v59);
                    sub_1000036BC( 0,  (uint64_t)"%s: malloc failed:(%s) for nwi %s",  v60,  v61,  v62,  v63,  v64,  v65,  (uint64_t)"mis_nwi_process_state");
                    free(v17);
                    goto LABEL_57;
                  }

                  uint64_t v43 = (uint64_t *)v44;
                  *((_OWORD *)v44 + 2) = 0u;
                  *(_OWORD *)uint64_t v44 = 0u;
                  *((_OWORD *)v44 + 1) = 0u;
                  snprintf((char *)v44 + 8, 0x10uLL, "%s", v27);
                  *uint64_t v43 = *v68;
                  *uint64_t v68 = (uint64_t)v43;
                  if (v70 == 2)
                  {
                    BOOL v45 = __CFADD__(dword_100034EF0++, 1);
                    if (v45) {
                      sub_10002297C();
                    }
                  }

                  else
                  {
                    BOOL v45 = __CFADD__(dword_100034EF4++, 1);
                    if (v45) {
                      sub_1000229A4();
                    }
                  }

                  HIDWORD(v71) = 1;
LABEL_43:
                  if (flags != v43[4]) {
                    v43[4] = flags;
                  }
                  int v46 = sub_100007EDC((_BYTE *)v43 + 8);
                  int v47 = HIDWORD(v71);
                  if (v46 != *((_DWORD *)v43 + 6))
                  {
                    *((_DWORD *)v43 + 6) = v46;
                    int v47 = 1;
                  }

                  else {
                    int v49 = v71;
                  }
                  *((_BYTE *)v43 + 41) = 1;
                  LODWORD(v71) = v49;
                  HIDWORD(v71) = (*((_BYTE *)v43 + 40) == 0) | v47;
                  *((_DWORD *)v43 + 7) = v69;
                  ++*v7;
                  ++v69;
                }

                else
                {
LABEL_30:
                  unsigned int v3 = v67;
                }

                int v4 = v70;
                goto LABEL_18;
              }

              sub_1000036BC( 2u,  (uint64_t)"%s: skipped interface %s flags 0x%qx",  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"mis_nwi_process_state");
            }

            else
            {
              sub_1000036BC( 0,  (uint64_t)"%s: no state info for %s",  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"mis_nwi_process_state");
            }
          }

          else
          {
            sub_1000036BC( 0,  (uint64_t)"%s: bad interface in nwi state",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"mis_nwi_process_state");
          }

LABEL_18:
          if (++v25 == v26) {
            goto LABEL_59;
          }
        }
      }

      uint64_t v71 = 0LL;
LABEL_59:
      *unsigned int v3 = v71;
      free(v17);
      char v50 = BYTE4(v71);
    }

    else
    {
      uint64_t v51 = __error();
      strerror(*v51);
      sub_1000036BC( 0,  (uint64_t)"%s: malloc failed:(%s) for if_names",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)"mis_nwi_process_state");
LABEL_57:
      nwi_state_release(*a1);
      char v50 = 0;
      *a1 = 0LL;
    }
  }

  else
  {
    sub_1000036BC( 0,  (uint64_t)"%s: no interfaces in nwi state",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"mis_nwi_process_state");
    char v50 = 0;
  }

  return v50 & 1;
}

void sub_10000FB64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 1107)) {
    sub_1000229F4();
  }
  xpc_object_t v2 = (void *)qword_100035498;
  if (qword_100035498)
  {
    while (v2 != (void *)v1 || *(_DWORD *)(v1 + 16) != 1 || *(_DWORD *)(v1 + 20) != 201)
    {
      xpc_object_t v2 = (void *)*v2;
      if (!v2) {
        return;
      }
    }

    unint64_t data = dispatch_source_get_data(*(dispatch_source_t *)(v1 + 1120));
    sub_1000036BC(2u, (uint64_t)"Estimated kernel prefix event bytes available: %ld", v4, v5, v6, v7, v8, v9, data);
    bzero(v45, 0x400uLL);
    int handle = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
    ssize_t v11 = read(handle, v45, 0x400uLL);
    if (v11 == -1) {
      goto LABEL_22;
    }
    ssize_t v18 = v11;
    while (2)
    {
      if (v18 >= 1)
      {
        ssize_t v19 = 0LL;
        while (1)
        {
          uint64_t v20 = &v45[v19];
          v19 += *(unsigned int *)&v45[v19];
          if (v19 > v18) {
            break;
          }
          if (v20[1] == 1
            && v20[2] == 1
            && v20[3] == 7
            && v20[5] == 1
            && if_nametoindex((const char *)(v1 + 308)) == v20[28])
          {
            sub_1000036BC(2u, (uint64_t)"received prefix event for %s", v12, v13, v14, v15, v16, v17, v1 + 308);
            uint64_t v44 = 0LL;
            memset(v43, 0, sizeof(v43));
            if (sub_10000FDA8(v1, (uint64_t)v43, v29, v30, v31, v32, v33, v34)) {
              sub_1000036BC( 0,  (uint64_t)"failed to get IPv6 configuration for %s",  v35,  v36,  v37,  v38,  v39,  v40,  v1 + 308);
            }
            else {
              sub_100009F24(v1, (unsigned __int8 *)v43, v35, v36, v37, v38, v39, v40);
            }
            return;
          }

          if (v19 >= v18) {
            goto LABEL_21;
          }
        }

        sub_1000036BC( 2u,  (uint64_t)"missed SYSPROTO_EVENT event,buffer not big enough",  v12,  v13,  v14,  v15,  v16,  v17,  v41);
LABEL_21:
        bzero(v45, 0x400uLL);
        int v21 = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
        ssize_t v18 = read(v21, v45, 0x400uLL);
        if (v18 != -1) {
          continue;
        }
LABEL_22:
        int v22 = *__error();
        if (v22)
        {
          if (v22 != 35)
          {
            uint64_t v42 = strerror(v22);
            sub_1000036BC(0, (uint64_t)"recv() failed %s", v23, v24, v25, v26, v27, v28, (uint64_t)v42);
          }
        }
      }

      break;
    }
  }

uint64_t sub_10000FDA0(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_10000FDA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 1107)) {
    sub_100022A1C();
  }
  __int128 v10 = *(_OWORD *)(a1 + 880);
  v122[9] = *(_OWORD *)(a1 + 864);
  v122[10] = v10;
  uint64_t v123 = *(void *)(a1 + 896);
  __int128 v11 = *(_OWORD *)(a1 + 816);
  v122[5] = *(_OWORD *)(a1 + 800);
  v122[6] = v11;
  __int128 v12 = *(_OWORD *)(a1 + 848);
  v122[7] = *(_OWORD *)(a1 + 832);
  v122[8] = v12;
  __int128 v13 = *(_OWORD *)(a1 + 752);
  v122[1] = *(_OWORD *)(a1 + 736);
  v122[2] = v13;
  __int128 v14 = *(_OWORD *)(a1 + 784);
  v122[3] = *(_OWORD *)(a1 + 768);
  v122[4] = v14;
  __int128 v15 = *(_OWORD *)(a1 + 720);
  __int128 v121 = *(_OWORD *)(a1 + 704);
  v122[0] = v15;
  BOOL v16 = (v15 | DWORD1(v15) | DWORD2(v15) | HIDWORD(v15)) == 0;
  *(_OWORD *)__int128 v124 = xmmword_100025110;
  int __errnum = 0;
  uint64_t v23 = (char *)sub_100010338((uint64_t)"ICMPV6CTL_ND6_DRLIST", v124, (size_t *)&v120, &__errnum, a5, a6, a7, a8);
  if (!v23)
  {
    uint64_t v25 = __errnum;
    if (__errnum) {
      goto LABEL_4;
    }
    sub_1000036BC(0, (uint64_t)"no usable default IPv6 router", v17, v18, v19, v20, v21, v22, v112);
    return 0LL;
  }

  uint64_t v24 = v120;
  uint64_t v25 = __errnum;
  if (__errnum)
  {
LABEL_4:
    if ((_DWORD)v25 != 2)
    {
      strerror(v25);
      sub_1000036BC(0, (uint64_t)"%s, unable to get default router list: %s", v26, v27, v28, v29, v30, v31, a1 + 308);
    }

    uint64_t v32 = 0LL;
    goto LABEL_7;
  }

  *(_OWORD *)__int128 v124 = xmmword_100025120;
  int __errnum = 0;
  uint64_t v32 = (char *)sub_100010338((uint64_t)"ICMPV6CTL_ND6_PRLIST", v124, (size_t *)&v120, &__errnum, v19, v20, v21, v22);
  if (!v32)
  {
    uint64_t v25 = __errnum;
    if (!__errnum)
    {
      sub_1000036BC(0, (uint64_t)"no usable IPv6 prefix information", v33, v34, v35, v36, v37, v38, v112);
      uint64_t v32 = 0LL;
      uint64_t v25 = 2LL;
      goto LABEL_7;
    }

    goto LABEL_17;
  }

  uint64_t v118 = v120;
  uint64_t v25 = __errnum;
  if (__errnum)
  {
LABEL_17:
    if ((_DWORD)v25 != 2)
    {
      strerror(v25);
      sub_1000036BC(0, (uint64_t)"%s, unable to get prefix list: %s", v39, v40, v41, v42, v43, v44, a1 + 308);
    }

    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100022A44();
  }
  int v46 = (const char *)(a1 + 308);
  unsigned int v47 = if_nametoindex(v46);
  if (!v47)
  {
    uint64_t v25 = *__error();
    sub_1000036BC(0, (uint64_t)"if_nametoindex() failed %s: %m", v72, v73, v74, v75, v76, v77, (uint64_t)v46);
    if ((v25 & 0xFFFFFFFD) == 0) {
      goto LABEL_71;
    }
    sub_1000036BC(0, (uint64_t)"%s, unable to get prefix and default router", v78, v79, v80, v81, v82, v83, (uint64_t)v46);
    goto LABEL_7;
  }

  unsigned int v54 = v47;
  uint64_t v115 = 0LL;
  uint64_t v116 = 0LL;
  uint64_t v114 = a2;
  uint64_t v117 = (char *)v24 + (void)v23;
  uint64_t v55 = v23;
  do
  {
    if ((uint64_t)v118 >= 1 && v54 == *((unsigned __int16 *)v55 + 20))
    {
      uint64_t v56 = v32;
      do
      {
        unsigned int v57 = *((unsigned __int16 *)v56 + 33);
        if (v56[29] != 64) {
          goto LABEL_61;
        }
        __int128 v120 = 0LL;
        if (getifaddrs(&v120))
        {
          int v59 = *__error();
          sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v60, v61, v62, v63, v64, v65, v112);
        }

        else
        {
          uint64_t v68 = v120;
          if (!v120) {
            goto LABEL_61;
          }
          while (1)
          {
            if (!strncmp(v46, v68->ifa_name, 0x10uLL))
            {
              ifa_addr = v68->ifa_addr;
              if (ifa_addr)
              {
                if (ifa_addr->sa_family == 30
                  && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80)
                  && *(void *)&ifa_addr->sa_data[6] == *((void *)v56 + 1))
                {
                  break;
                }
              }
            }

            uint64_t v68 = v68->ifa_next;
            if (!v68)
            {
              int v59 = -1;
              goto LABEL_57;
            }
          }

          int v59 = 0;
LABEL_57:
          if (v120) {
            free(v120);
          }
        }

        if (!v59 && *((_WORD *)v56 + 33))
        {
          uint64_t v66 = 0LL;
          while (*(void *)&v56[v66 + 80] != *((void *)v55 + 1) || *(void *)&v56[v66 + 88] != *((void *)v55 + 2))
          {
            v66 += 28LL;
          }

          if (v16
            || (uint64_t v115 = v56,
                uint64_t v116 = v55,
                sub_1000104AC( (unsigned __int8 *)v122,  (unsigned __int8 *)v56 + 8,  v56[29],  v49,  v50,  v51,  v52,  v53)))
          {
            int v70 = v56;
            uint64_t v71 = v55;
            a2 = v114;
            goto LABEL_70;
          }
        }

LABEL_61:
        v56 += 28 * v57 + 72;
      }

      while (v56 < (char *)v118 + (unint64_t)v32);
    }

    v55 += 48;
  }

  while (v55 < v117);
  a2 = v114;
  int v70 = v115;
  uint64_t v71 = v116;
  if (v115 && v116)
  {
LABEL_70:
    memmove((void *)(a2 + 8), v70, 0x48uLL);
    __int128 v85 = *((_OWORD *)v71 + 1);
    __int128 v84 = *((_OWORD *)v71 + 2);
    *(_OWORD *)(a2 + 80) = *(_OWORD *)v71;
    *(_OWORD *)(a2 + 96) = v85;
    *(_OWORD *)(a2 + 112) = v84;
    *(_BYTE *)a2 = 1;
    inet_ntop(30, (const void *)(a2 + 16), (char *)v124, 0x2Eu);
    sub_1000036BC( 1u,  (uint64_t)"found prefix: %s with prefix length %u for external interface %s",  v86,  v87,  v88,  v89,  v90,  v91,  (uint64_t)v124);
    uint64_t v25 = 0LL;
  }

  else
  {
LABEL_65:
    sub_1000036BC( 0,  (uint64_t)"no ipv6 default router or prefix information for %s",  v48,  v49,  v50,  v51,  v52,  v53,  (uint64_t)v46);
    uint64_t v25 = 2LL;
  }

LABEL_71:
  if (*(_BYTE *)a2)
  {
    int v92 = socket(30, 2, 0);
    if (v92 < 0)
    {
      uint64_t v25 = *__error();
      sub_1000036BC(0, (uint64_t)"socket: %m", v100, v101, v102, v103, v104, v105, v113);
      if (v92 != -1) {
        goto LABEL_81;
      }
    }

    else
    {
      if ((unint64_t)__strlcpy_chk(a2 + 128, v46, 16LL, 16LL) >= 0x10)
      {
        uint64_t v25 = *__error();
        uint64_t v99 = "strlcpy: %m";
        goto LABEL_80;
      }

      if (ioctl(v92, 0xC030694CuLL, a2 + 128) < 0)
      {
        uint64_t v25 = *__error();
        uint64_t v113 = a2 + 128;
        uint64_t v99 = "SIOCGIFINFO_IN6 on %s: %m";
LABEL_80:
        sub_1000036BC(0, (uint64_t)v99, v93, v94, v95, v96, v97, v98, v113);
      }

      else
      {
        uint64_t v25 = 0LL;
      }

LABEL_81:
      close(v92);
    }

    if ((_DWORD)v25)
    {
      strerror(v25);
      sub_1000036BC(0, (uint64_t)"unable to get ND info for %s: %s", v106, v107, v108, v109, v110, v111, (uint64_t)v46);
    }
  }

void *sub_100010338( uint64_t a1, int *a2, size_t *a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v12 = 1;
  while (1)
  {
    if (v12 != 1) {
      sub_1000036BC(0, (uint64_t)"sysctl(%s): trying again (%d of %d)", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a1);
    }
    if (sysctl(a2, 4u, 0LL, &__size, 0LL, 0LL) < 0)
    {
      int v26 = *__error();
LABEL_12:
      strerror(v26);
      sub_1000036BC(0, (uint64_t)"sysctl(%s) failed: %s", v27, v28, v29, v30, v31, v32, a1);
LABEL_13:
      uint64_t v25 = 0LL;
      goto LABEL_17;
    }

    if (!__size) {
      break;
    }
    uint64_t v25 = malloc(__size);
    if (!v25)
    {
      sub_1000036BC(0, (uint64_t)"sysctl(%s): malloc failed", v19, v20, v21, v22, v23, v24, a1);
      int v26 = 12;
      goto LABEL_17;
    }

    if (!sysctl(a2, 4u, v25, &__size, 0LL, 0LL)) {
      goto LABEL_15;
    }
    free(v25);
    int v26 = *__error();
    if (*__error() != 12) {
      goto LABEL_12;
    }
    if (++v12 == 11) {
      goto LABEL_13;
    }
  }

  sub_1000036BC(0, (uint64_t)"sysctl(%s): length is zero", v13, v14, v15, v16, v17, v18, a1);
  uint64_t v25 = 0LL;
LABEL_15:
  int v26 = 0;
LABEL_17:
  size_t v33 = __size;
  if (!v25) {
    size_t v33 = 0LL;
  }
  *a3 = v33;
  *a4 = v26;
  return v25;
}

BOOL sub_1000104AC( unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  if ((int)a3 >= 129)
  {
    sub_1000036BC(0, (uint64_t)"in6_are_prefix_equal: invalid prefix length(%d)\n", a3, a4, a5, a6, a7, a8, a3);
    return 0LL;
  }

  size_t v11 = (unint64_t)a3 >> 3;
  return !bcmp(a1, a2, v11) && ((v8 & 7) == 0 || a1[v11] >> (8 - (v8 & 7)) == a2[v11] >> (8 - (v8 & 7)));
}

void sub_100010548(int a1, CFArrayRef theArray, uint64_t a3)
{
  if (!a3) {
    sub_100022A6C();
  }
  unsigned int v3 = (void *)qword_100035498;
  if (qword_100035498)
  {
    while (v3 != (void *)a3 || *(_DWORD *)(a3 + 16) != 1 || *(_DWORD *)(a3 + 20) != 201)
    {
      unsigned int v3 = (void *)*v3;
      if (!v3) {
        return;
      }
    }

    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0LL;
      uint64_t v9 = a3 + 308;
      __int128 v124 = (void *)(a3 + 648);
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v8);
        if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv4))
        {
          if (!ValueAtIndex || (uint64_t v17 = *(const __SCDynamicStore **)(a3 + 1112)) == 0LL)
          {
            sub_1000036BC( 0,  (uint64_t)"dynamic store ref or IPv4 kSCEntNetIPv4 key not present for %s",  v11,  v12,  v13,  v14,  v15,  v16,  v9);
            goto LABEL_91;
          }

          CFPropertyListRef v18 = SCDynamicStoreCopyValue(v17, ValueAtIndex);
          if (v18)
          {
            uint64_t v24 = v18;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (CFGetTypeID(v24) != TypeID)
            {
              uint64_t v118 = "%s, dynamic store IPv4 kSCEntNetIPv4 is not a CFDictionary";
              goto LABEL_90;
            }

            Value = CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv4Addresses);
            if (!Value) {
              goto LABEL_47;
            }
            size_t v33 = Value;
            CFTypeID v34 = CFArrayGetTypeID();
            if (CFGetTypeID(v33) != v34)
            {
              uint64_t v118 = "%s, dynamic store IPv4 address is not a CFArray";
              goto LABEL_90;
            }

            if (CFArrayGetCount((CFArrayRef)v33))
            {
              int v35 = 1;
              if ((sub_10000E768(a3, (int *)&v127, 1) & 1) == 0)
              {
                uint64_t v36 = CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv4SubnetMasks);
                if (!v36)
                {
                  uint64_t v118 = "%s, dynamic store network mask cannot be NULL";
                  goto LABEL_90;
                }

                uint64_t v37 = v36;
                CFTypeID v38 = CFArrayGetTypeID();
                if (CFGetTypeID(v37) != v38)
                {
                  uint64_t v118 = "%s, dynamic store IPv4 network mask is not a CFArray";
                  goto LABEL_90;
                }

                if (!CFArrayGetCount((CFArrayRef)v37))
                {
                  uint64_t v118 = "%s, dynamic store IPv4 network mask cannot be NULL";
LABEL_90:
                  sub_1000036BC(0, (uint64_t)v118, v26, v27, v28, v29, v30, v31, v9);
                  CFRelease(v24);
LABEL_91:
                  sub_1000036BC(0, (uint64_t)"%s, failed to get IPv4 configuration", v85, v19, v20, v21, v22, v23, v9);
                  return;
                }

                uint64_t v39 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v37, 0LL);
                CFStringGetCString(v39, buffer, 16LL, 0x600u);
                if (inet_pton(2, buffer, &v127) == 1)
                {
                  int v35 = 1;
                }

                else
                {
                  sub_1000036BC( 0,  (uint64_t)"%s, inet_pton() failed for external mask",  v40,  v41,  v42,  v43,  v44,  v45,  v9);
                  int v35 = 0;
                }
              }

              __int128 v84 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v33, 0LL);
              CFStringGetCString(v84, buffer, 16LL, 0x600u);
              if (inet_pton(2, buffer, &v128) != 1)
              {
                uint64_t v118 = "%s, inet_pton() failed for external address";
                goto LABEL_90;
              }

              CFRelease(v24);
              if (!v35) {
                goto LABEL_91;
              }
            }

            else
            {
LABEL_47:
              unsigned int v127 = 0;
              int v128 = 0;
              CFRelease(v24);
            }
          }

          else
          {
            unsigned int v127 = 0;
            int v128 = 0;
          }

          uint64_t v86 = *(unsigned int *)(a3 + 680);
          if (v86 != v128 || (uint64_t v87 = *(unsigned int *)(a3 + 684), v87 != v127))
          {
            inet_ntop(2, (const void *)(a3 + 680), buffer, 0x10u);
            inet_ntop(2, &v128, v143, 0x10u);
            sub_1000036BC(2u, (uint64_t)"%s IPv4 address changed from %s to %s", v88, v89, v90, v91, v92, v93, v9);
            uint64_t v87 = v127;
            LODWORD(v86) = v128;
          }

          sub_10000A894(a3, v86, v87, v19, v20, v21, v22, v23);
        }

        else if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv6))
        {
          in6_addr v126 = in6addr_any;
          if (!ValueAtIndex || (uint64_t v52 = *(const __SCDynamicStore **)(a3 + 1112)) == 0LL)
          {
            sub_1000036BC( 0,  (uint64_t)"dynamic store ref or ipv6 key not present for %s",  v46,  v47,  v48,  v49,  v50,  v51,  v9);
            goto LABEL_64;
          }

          int v59 = (const __CFDictionary *)SCDynamicStoreCopyValue(v52, ValueAtIndex);
          if (v59 && (CFTypeID v60 = CFDictionaryGetTypeID(), CFGetTypeID(v59) == v60))
          {
            uint64_t v61 = CFDictionaryGetValue(v59, kSCPropNetIPv6Addresses);
            if (!v61) {
              goto LABEL_61;
            }
            uint64_t v68 = v61;
            CFTypeID v69 = CFArrayGetTypeID();
            CFTypeID v70 = CFGetTypeID(v68);
            uint64_t v71 = "ipv6 array empty for %s";
            if (v70 != v69) {
              goto LABEL_62;
            }
            CFIndex v125 = CFArrayGetCount((CFArrayRef)v68);
            if (!v125)
            {
LABEL_61:
              uint64_t v71 = "ipv6 array empty for %s";
              goto LABEL_62;
            }

            if (*(_BYTE *)(a3 + 1107)) {
              goto LABEL_33;
            }
            uint64_t v95 = (const __CFArray *)CFDictionaryGetValue(v59, kSCPropNetIPv6Flags);
            if (!v95)
            {
              uint64_t v71 = "ipv6 flags empty for %s";
              goto LABEL_62;
            }

            uint64_t v96 = v95;
            CFTypeID v122 = CFArrayGetTypeID();
            theArraya = v96;
            CFTypeID v97 = CFGetTypeID(v96);
            uint64_t v71 = "ipv6 flags empty for %s";
            if (v97 != v122 || (v98 = CFArrayGetCount(v96), uint64_t v71 = "ipv6 flags count mismatch for %s", v98 != v125))
            {
LABEL_62:
              sub_1000036BC(2u, (uint64_t)v71, v62, v63, v64, v65, v66, v67, v9);
LABEL_63:
              CFRelease(v59);
LABEL_64:
              uint64_t v94 = *(dispatch_source_s **)(a3 + 1120);
              if (v94)
              {
                if (!*(_BYTE *)(a3 + 1107)) {
                  sub_100022A94();
                }
                if (!*(_BYTE *)(a3 + 704)) {
                  goto LABEL_68;
                }
                uint64_t v142 = 0LL;
                __int128 v140 = 0u;
                __int128 v141 = 0u;
                __int128 v138 = 0u;
                __int128 v139 = 0u;
                __int128 v136 = 0u;
                __int128 v137 = 0u;
                __int128 v134 = 0u;
                __int128 v135 = 0u;
                __int128 v132 = 0u;
                __int128 v133 = 0u;
                *(_OWORD *)buffer = 0u;
                __int128 v131 = 0u;
                sub_100009F24(a3, (unsigned __int8 *)buffer, v78, v79, v80, v81, v82, v83);
                uint64_t v94 = *(dispatch_source_s **)(a3 + 1120);
                if (v94)
                {
LABEL_68:
                  dispatch_source_cancel(v94);
                  dispatch_release(*(dispatch_object_t *)(a3 + 1120));
                  *(void *)(a3 + 1120) = 0LL;
                }
              }

              goto LABEL_59;
            }

LABEL_33:
            uint64_t v121 = v9;
            if (v125 >= 1)
            {
              CFIndex v72 = 0LL;
              while (1)
              {
                uint64_t v73 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v68, v72);
                if (v73)
                {
                  uint64_t v74 = v73;
                  uint64_t v75 = v68;
                  CFTypeID v76 = CFStringGetTypeID();
                  BOOL v105 = CFGetTypeID(v74) == v76;
                  uint64_t v68 = v75;
                  if (v105)
                  {
                    CFStringGetCString(v74, buffer, 46LL, 0x600u);
                    if (inet_pton(30, buffer, &v144) == 1
                      && (v144.__u6_addr8[0] != 254 || (v144.__u6_addr8[1] & 0xC0) != 0x80))
                    {
                      if (*(_BYTE *)(a3 + 1107)) {
                        break;
                      }
                      uint64_t v77 = (const __CFNumber *)CFArrayGetValueAtIndex(theArraya, v72);
                      if (CFNumberGetValue(v77, kCFNumberSInt32Type, &valuePtr))
                      {
                        if ((valuePtr & 0x109F) == 0) {
                          break;
                        }
                      }
                    }
                  }
                }

                if (v125 == ++v72) {
                  goto LABEL_45;
                }
              }

              in6_addr v126 = v144;
              uint64_t v9 = v121;
              sub_1000036BC(2u, (uint64_t)"found ipv6 address %s for %s", v62, v63, v64, v65, v66, v67, (uint64_t)buffer);
              CFRelease(v59);
              if (*(_BYTE *)(a3 + 1107))
              {
                if (!*(void *)(a3 + 1120) && sub_100009BB4(a3)) {
                  sub_1000036BC( 0,  (uint64_t)"unable to listen to IPv6 prefix events",  v99,  v100,  v101,  v102,  v103,  v104,  v119);
                }
              }

              else
              {
                BOOL v105 = *v124 == *(void *)v126.__u6_addr8 && *(void *)(a3 + 656) == *(void *)&v126.__u6_addr32[2];
                if (!v105)
                {
                  inet_ntop(30, v124, buffer, 0x2Eu);
                  inet_ntop(30, &v126, v143, 0x2Eu);
                  sub_1000036BC( 2u,  (uint64_t)"%s IPv6 address changed from %s to %s",  v106,  v107,  v108,  v109,  v110,  v111,  v121);
                  sub_10000A5D4(a3, (uint64_t)&v126, v112, v113, v114, v115, v116, v117, v120);
                }
              }

              goto LABEL_59;
            }

LABEL_45:
            uint64_t v9 = v121;
            sub_1000036BC(1u, (uint64_t)"ipv6 is not present for %s", v62, v63, v64, v65, v66, v67, v121);
          }

          else
          {
            sub_1000036BC(2u, (uint64_t)"ipv6 dictionary not present for %s", v53, v54, v55, v56, v57, v58, v9);
          }

          if (v59) {
            goto LABEL_63;
          }
          goto LABEL_64;
        }

LABEL_59:
        ++v8;
      }

      while (v8 != v7);
    }
  }

void sub_100010CB8(void *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 684);
  unsigned int v5 = *(_DWORD *)(a2 + 680);
  int v6 = *(_DWORD *)(a2 + 692);
  if (v6)
  {
    if (v6 != (v5 & v4)) {
      unsigned int v5 = *(_DWORD *)(a2 + 692);
    }
    unsigned int v7 = *(_DWORD *)(a2 + 696);
  }

  else
  {
    unsigned int v7 = bswap32(bswap32(v5 | ~v4) - 1);
  }

  CFIndex v8 = off_100034C90[0];
  unsigned int v12 = v5;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v8, string);
  uint64_t v9 = off_100034C98[0];
  unsigned int v12 = v7;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v9, string);
  __int128 v10 = off_100034CA0[0];
  unsigned int v12 = v4;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v10, string);
  if (*(_DWORD *)(a2 + 1128) == 500 && !*(_BYTE *)(a2 + 1107))
  {
    if (*(_BYTE *)(a2 + 1178))
    {
      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v11, off_100034CD8[0], (const char *)(a2 + 1132));
      xpc_dictionary_set_value(a1, off_100034CC8[0], v11);
      xpc_release(v11);
    }
  }

uint64_t sub_100010E54()
{
  byte_100034F2C = 1;
  return 0LL;
}

void sub_100010E68()
{
  if (byte_100034F2C == 1) {
    byte_100034F2C = 0;
  }
}

uint64_t sub_100010E80(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  uint64_t result = (uint64_t)sub_10001F8F4(a2);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001F8C8((uint64_t)v12);
    *a3 = v12[1];
    if (!(_DWORD)result)
    {
      if (v12[0])
      {
        uint64_t v5 = v13;
        sub_100014FF4(v13);
        sub_1000036BC(0, (uint64_t)"maximum number of wireless tethered hosts is %d", v6, v7, v8, v9, v10, v11, v5);
        return 0LL;
      }

      else
      {
        return 45LL;
      }
    }
  }

  return result;
}

uint64_t sub_100010F28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100022B0C();
  }
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_100022AE4();
  }
  int v9 = dword_100034F30++;
  if (v9 > 0) {
    return 0LL;
  }
  if (v9 < 0) {
    sub_100022ABC();
  }
  if (*(_BYTE *)(a1 + 1269))
  {
    sub_1000111D8(a1, a2, a3, a4, a5, a6, a7, a8);
    return 37LL;
  }

  else
  {
    sub_10001F920(1LL, (uint64_t)sub_100011254, a1);
    sub_10001F9F4();
    uint64_t result = 0LL;
    *(_BYTE *)(a1 + 1269) = 1;
    *(void *)(a1 + 592) = sub_100010FE4;
    *(void *)(a1 + 600) = sub_1000111B8;
    *(void *)(a1 + 632) = 0LL;
  }

  return result;
}

uint64_t sub_100010FE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a2 + 288) != 100) {
    sub_100022B5C();
  }
  if (!dword_100034F30) {
    sub_100022B34();
  }
  BOOL v9 = *(_DWORD *)(a3 + 288) == 101;
  *(_BYTE *)(a2 + 126++*(_DWORD *)(result + 8) = v9;
  if (v9)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: starting tethering authentication",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pdp_activate");
    uint64_t v10 = sub_10001F8C8((uint64_t)v41);
    uint64_t v18 = v10;
    if ((_DWORD)v10) {
      uint64_t v10 = sub_10001486C(0x3FDu, v11, v12, v13, v14, v15, v16, v17);
    }
    if (v41[0])
    {
      if (v41[1])
      {
        sub_100014A94(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_16:
        *(_BYTE *)(a2 + 126++*(_DWORD *)(result + 8) = 0;
        goto LABEL_17;
      }

      unsigned int v25 = 1021;
    }

    else
    {
      unsigned int v25 = 1020;
    }

    sub_10001486C(v25, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_16;
  }

  if (*(_DWORD *)(a2 + 12) || *(_BYTE *)(a2 + 1276))
  {
    sub_1000036BC( 1u,  (uint64_t)"%s: Ignoring PDP context activation request since PDP context is active(%d) or in-progress(%d)",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pdp_activate");
    return 0LL;
  }

  sub_1000036BC(0, (uint64_t)"%s: starting tethering activation", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_activate");
  uint64_t v34 = sub_10001F89C(1LL);
  if (!(_DWORD)v34)
  {
    *(_BYTE *)(a2 + 1276) = 1;
    *(_DWORD *)(a2 + 12) = 0;
    return 36LL;
  }

  uint64_t v18 = v34;
  sub_1000036BC( 0,  (uint64_t)"%s: failed to activate tethering %d",  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"mis_pdp_activate");
LABEL_17:
  *(_DWORD *)(a2 + 12) = v18 == 0;
  if ((_DWORD)v18 == 36) {
    return 36LL;
  }
  sub_100008A04(a2, v18, v19, v20, v21, v22, v23, v24);
  if ((_DWORD)v18 && (_DWORD)v18 != 62)
  {
    uint64_t v26 = strerror(v18);
    sub_1000036BC(0, (uint64_t)"PDP activate failed: %s", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
  }

  return v18;
}

double sub_1000111B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_100022B84();
  }
  return sub_1000111D8(a1, a2, a3, a4, a5, a6, a7, a8);
}

double sub_1000111D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_100022C4C();
  }
  int v8 = dword_100034F30;
  if (!dword_100034F30) {
    sub_100022BAC();
  }
  --dword_100034F30;
  if (v8 <= 1)
  {
    sub_1000117FC(a1, 1LL, a3, a4, a5, a6, a7, a8);
    if (*(void *)(a1 + 1120)) {
      sub_100022C24();
    }
    if (*(void *)(a1 + 1112)) {
      sub_100022BFC();
    }
    if (*(_BYTE *)(a1 + 1269)) {
      sub_100022BD4();
    }
    double result = 0.0;
    *(_OWORD *)(a1 + 592) = 0u;
  }

  return result;
}

void sub_100011254( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    unsigned int v10 = a1 - 1;
    if (!a2 && v10 <= 1) {
      sub_1000036BC( 0,  (uint64_t)"%s: CT callback for %s with NULL info",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pdp_ct_event_cb");
    }
    if (dword_100034F30 && *(_BYTE *)(a3 + 1269))
    {
      sub_10000BEAC(a3);
      switch(v10)
      {
        case 0u:
          uint64_t v39 = "event_tethering_status";
          sub_1000036BC( 1u,  (uint64_t)"%s: conn_available: %s, conn_state: %s, conn_sts_wait: %s, new_ifname: %s, cur_ifname: %s",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_tethering_status");
          if ((*(_BYTE *)(a3 + 1276)
             || *(_BYTE *)(a2 + 16) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 16), 0x100uLL))
            && *(_BYTE *)(a2 + 2)
            && *(_DWORD *)(a2 + 8) == 3)
          {
            goto LABEL_22;
          }

          if (!*(_BYTE *)(a3 + 1270) || *(_BYTE *)(a2 + 2) && *(_DWORD *)(a2 + 8) == 3) {
            goto LABEL_39;
          }
          sub_1000036BC( 1u,  (uint64_t)"%s: tethering connection not available or active, teardown external interface",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_tethering_status");
          goto LABEL_31;
        case 1u:
          uint64_t v39 = "event_connection_status";
          sub_1000036BC( 1u,  (uint64_t)"%s: conn_state: %s, conn_sts_wait: %s, new_ifname: %s, cur_ifname: %s",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_connection_status");
          if (*(_DWORD *)a2 == 3)
          {
            if (*(_BYTE *)(a3 + 1276)
              || *(_BYTE *)(a2 + 8) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 8), 0x100uLL))
            {
LABEL_22:
              sub_1000036BC( 1u,  (uint64_t)"%s: tethering connection active, setup external interface",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v39);
              int v18 = sub_100011680(a3);
              goto LABEL_40;
            }

            goto LABEL_39;
          }

          if (!*(_BYTE *)(a3 + 1270))
          {
LABEL_39:
            int v18 = 0;
            goto LABEL_40;
          }

          sub_1000036BC( 1u,  (uint64_t)"%s: tethering connection not active, teardown external interface",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_connection_status");
LABEL_31:
          *(_DWORD *)(a3 + 12) = 0;
          *(_BYTE *)(a3 + 1270) = 0;
          sub_100009E24(a3, v40, v41, v42, v43, v44, v45, v46);
          if (!*(_BYTE *)(a3 + 1271))
          {
            sub_10000B3EC(0x1388u, v47, v48, v49, v50, v51, v52, v53, v62);
            *(_BYTE *)(a3 + 1271) = 1;
          }

          uint64_t v54 = sub_100014AF4(36LL, v47, v48, v49, v50, v51, v52, v53);
          *(_BYTE *)(a3 + 1276) = 1;
          else {
            int v18 = 0;
          }
LABEL_40:
          *(_DWORD *)(a3 + 1272) = v18;
          sub_100007378((uint64_t *)a3, v11, v12, v13, v14, v15, v16, v17);
          break;
        case 2u:
          sub_1000036BC( 0,  (uint64_t)"%s: CoreTelephony connection went away",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_connection_invalidated");
          sub_1000117FC(a3, 0LL, v19, v20, v21, v22, v23, v24);
          int v18 = 36;
          sub_100014AF4(36LL, v25, v26, v27, v28, v29, v30, v31);
          sub_10001486C(0x3FCu, v32, v33, v34, v35, v36, v37, v38);
          goto LABEL_40;
        case 3u:
          if (!dword_100034F30) {
            goto LABEL_39;
          }
          sub_1000036BC( 0,  (uint64_t)"%s: CoreTelephony connection is now restored",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"event_connection_restored");
          if (dword_100034F30 <= 0) {
            sub_100022ABC();
          }
          if (*(_BYTE *)(a3 + 1269))
          {
            int v18 = 37;
          }

          else
          {
            int v18 = 0;
            *(_BYTE *)(a3 + 1269) = 1;
          }

          goto LABEL_40;
        default:
          sub_1000036BC( 0,  (uint64_t)"%s: unhandled CT event(%d)",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"mis_pdp_ct_event_cb");
          int v18 = 6;
          goto LABEL_40;
      }
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: ignoring unexpected/invalid CT event for %s callback",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pdp_ct_event_cb");
    }
  }

  else
  {
    sub_1000036BC( 0,  (uint64_t)"%s: CT callback for %s with NULL arg",  0LL,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pdp_ct_event_cb");
  }

uint64_t sub_100011680(uint64_t a1)
{
  if (sub_10001F964((uint64_t)__s2))
  {
    sub_1000036BC(0, (uint64_t)"unable to get interface name", v2, v3, v4, v5, v6, v7, v45);
    uint64_t v8 = 19LL;
    sub_1000036BC( 0,  (uint64_t)"%s: mis_pdp_get_name_mtu failed %d",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"mis_pdp_setup_external_interface");
  }

  else
  {
    int v22 = strncmp((const char *)(a1 + 308), __s2, 0x100uLL);
    if (v22)
    {
      snprintf(__str, 0x10uLL, "%s", (const char *)(a1 + 308));
      sub_100009E24(a1, v23, v24, v25, v26, v27, v28, v29);
      sub_10000AC0C(a1);
    }

    sub_10000BEBC(a1, __s2);
    int v30 = sub_100007EDC((_BYTE *)(a1 + 308));
    *(_DWORD *)(a1 + 296) = v30;
    *(_DWORD *)(a1 + 300) = v30 - 40;
    if (v22) {
      sub_10000ACE8(a1, __str);
    }
    sub_1000036BC(0, (uint64_t)"PDP interface is ready [%s, mtu=%d]", v31, v32, v33, v34, v35, v36, a1 + 308);
    uint64_t v8 = sub_1000098C8(a1);
    if ((_DWORD)v8) {
      sub_1000036BC( 0,  (uint64_t)"%s: mis_setup_external_listeners failed %d",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"mis_pdp_setup_external_interface");
    }
  }

  *(_BYTE *)(a1 + 1276) = 0;
  BOOL v37 = v8 == 0;
  *(_DWORD *)(a1 + 12) = v37;
  *(_BYTE *)(a1 + 1270) = v37;
  sub_100014AF4(v8, v15, v16, v17, v18, v19, v20, v21);
  sub_100008A04(a1, v8, v38, v39, v40, v41, v42, v43);
  return v8;
}

uint64_t sub_1000117FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  if ((_DWORD)a2 && dword_100034F30) {
    sub_100022C9C();
  }
  uint64_t result = sub_100009E24(a1, a2, a3, a4, a5, a6, a7, a8);
  *(_BYTE *)(a1 + 1276) = 0;
  if (v8)
  {
    sub_10001F920(0LL, 0LL, 0LL);
    uint64_t result = sub_10001F89C(0LL);
  }

  *(_BYTE *)(a1 + 1269) = 0;
  return result;
}

uint64_t sub_100011870()
{
  byte_100034F34 = 1;
  uint64_t result = sub_100016B40();
  if (!(_DWORD)result)
  {
    sub_1000211D8();
    uint64_t result = sub_10001FA10();
    if (!(_DWORD)result) {
      return sub_100020AD4();
    }
  }

  return result;
}

uint64_t sub_1000118A8()
{
  if (byte_100034F34 == 1)
  {
    sub_100017034();
    sub_1000211F8();
    sub_10001FA8C();
    uint64_t result = nullsub_1();
    byte_100034F34 = 0;
  }

  return result;
}

uint64_t sub_1000118E4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 1128);
  if (v1 == 501) {
    sub_100022CC4();
  }
  int v3 = *(unsigned __int8 *)(a1 + 1107);
  int v5 = v1 == 500 && v3 == 0;
  if (v1 != 502 && v3 == v5) {
    sub_100022CEC();
  }
  int v7 = *(_DWORD *)(a1 + 16);
  sub_10000BEBC(a1, (const char *)(a1 + 28));
  if (v7) {
    goto LABEL_21;
  }
  unsigned int v8 = *(_DWORD *)(a1 + 296);
  if (!v8)
  {
    unsigned int v8 = 1500;
    goto LABEL_17;
  }

  if (v8 <= 0x4FF)
  {
    unsigned int v8 = 1280;
LABEL_17:
    *(_DWORD *)(a1 + 296) = v8;
  }

  if (*(_DWORD *)(a1 + 288) != 104)
  {
    uint64_t v15 = sub_10000E278((_BYTE *)(a1 + 308), v8);
    if ((_DWORD)v15) {
      goto LABEL_30;
    }
  }

  if (!*(_DWORD *)(a1 + 304))
  {
    uint64_t v15 = sub_10001704C();
    if (!(_DWORD)v15)
    {
      uint64_t v16 = sub_10001FACC();
      if ((_DWORD)v16)
      {
        uint64_t v15 = v16;
        sub_100017B64(a1, v17, v18, v19, v20, v21, v22, v23);
      }

      else
      {
        if (v1 == 502) {
          goto LABEL_21;
        }
        uint64_t v25 = sub_100020B28();
        if (!(_DWORD)v25) {
          goto LABEL_21;
        }
        uint64_t v15 = v25;
        sub_100017B64(a1, v26, v27, v28, v29, v30, v31, v32);
        sub_100020988(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }

LABEL_30:
    sub_1000036BC(0, (uint64_t)"%s failed (%d) for %s", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_bcast_init");
    return v15;
  }

uint64_t sub_100011A70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = *(_DWORD *)(a2 + 288);
  if (v10 != 102 && v10 != 104) {
    sub_100022D14();
  }
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    if (!*(_BYTE *)(a2 + 564)) {
      goto LABEL_7;
    }
    if (!*(_BYTE *)(a2 + 564))
    {
LABEL_7:
      uint64_t v17 = sub_1000098C8(a2);
      if ((_DWORD)v17) {
        goto LABEL_29;
      }
    }
  }

  else
  {
    if (*(_BYTE *)(a2 + 700)) {
      goto LABEL_28;
    }
    *(_BYTE *)(a2 + 700) = 1;
    int v18 = qword_1000354D4;
    LODWORD(qword_1000354D4) = qword_1000354D4 + 1;
    if (v18 < 0) {
      sub_100022D64();
    }
    uint64_t v19 = sub_1000125D4(a2, a3, a3, a4, a5, a6, a7, a8);
    if ((_DWORD)v19)
    {
      uint64_t v17 = v19;
      sub_1000036BC( 0,  (uint64_t)"%s: failed to setup IPv4 on %s",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"mis_bcast_start");
      goto LABEL_29;
    }

    uint64_t v26 = sub_100012BE4(a2, a3, 0LL, v21, v22, v23, v24, v25);
    if ((_DWORD)v26)
    {
      uint64_t v17 = v26;
      sub_1000036BC( 0,  (uint64_t)"%s: failed to setup IPv6 on %s",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"mis_bcast_start");
      goto LABEL_29;
    }
  }

  if (*(_DWORD *)(a2 + 16) == 1 && *(_BYTE *)(a2 + 564))
  {
    int v27 = *(_DWORD *)(a2 + 296);
    if (!v27)
    {
      int v27 = 1500;
      *(_DWORD *)(a2 + 296) = 1500;
    }

    *(_DWORD *)(a2 + 300) = v27 - 40;
    goto LABEL_27;
  }

  int v28 = sub_100007EDC((_BYTE *)(a2 + 308));
  *(_DWORD *)(a2 + 296) = v28;
  int v29 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 300) = v28 - 40;
  if (v29 == 1)
  {
LABEL_27:
    sub_1000036BC(0, (uint64_t)"BCAST is ready [%s, mtu=%d ]", v11, v12, v13, v14, v15, v16, a2 + 308);
    goto LABEL_28;
  }

  if (v29)
  {
LABEL_28:
    uint64_t v17 = 0LL;
    goto LABEL_29;
  }

  if (!*(_BYTE *)(a3 + 564) && !*(_DWORD *)(a3 + 680)
    || (uint64_t v17 = sub_1000171AC(a2, a3, v11, v12, v13, v14, v15, v16), !(_DWORD)v17))
  {
    *(_BYTE *)(a2 + 700) = 0;
    uint64_t v17 = 0LL;
    LODWORD(qword_1000354D4) = qword_1000354D4 - 1;
  }

LABEL_29:
  *(_DWORD *)(a2 + 12) = v17 == 0;
  return v17;
}

void sub_100011C5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 632)) {
    sub_100022DDC();
  }
  int v9 = *(_DWORD *)(a1 + 1128);
  *(_DWORD *)(a1 + 12) = 0;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 60++*(_DWORD *)(result + 8) = 0u;
  *(void *)(a1 + 624) = 0LL;
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (*(_DWORD *)(a1 + 20) == 201) {
      sub_100009E24(a1, a2, a3, a4, a5, a6, a7, a8);
    }
    if (*(_BYTE *)(a1 + 564)) {
      sub_1000097A4();
    }
    return;
  }

  if (*(_BYTE *)(a1 + 700))
  {
    *(_BYTE *)(a1 + 700) = 0;
    int v10 = *(_DWORD *)(a1 + 20);
    if (v10 == 203)
    {
      uint64_t v11 = (uint64_t *)((char *)&qword_1000354D4 + 4);
      int v12 = HIDWORD(qword_1000354D4);
      if (SHIDWORD(qword_1000354D4) <= 0) {
        sub_100022DB4();
      }
    }

    else
    {
      if (v10 != 201) {
        goto LABEL_15;
      }
      uint64_t v11 = &qword_1000354D4;
      int v12 = qword_1000354D4;
    }

    *(_DWORD *)uint64_t v11 = v12 - 1;
  }

LABEL_15:
  if (*(_DWORD *)(a1 + 304)) {
    goto LABEL_25;
  }
  sub_100017B64(a1, a2, a3, a4, a5, a6, a7, a8);
  if (*(_DWORD *)(a1 + 20) != 201) {
    goto LABEL_23;
  }
  xpc_object_t v13 = xpc_array_create(0LL, 0LL);
  if (v13)
  {
    uint64_t v21 = v13;
    xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1 + 308));
    sub_100021790((char *)(a1 + 565), v21, v22, v23, v24, v25, v26, v27);
    xpc_release(v21);
  }

  if (byte_100035481) {
    goto LABEL_25;
  }
  sub_100020988((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  if (v9 != 502)
  {
    sub_100020F80(v28, v29, v30, v31, v32, v33, v34, v35);
LABEL_23:
    int v36 = 1;
    goto LABEL_24;
  }

  sub_10001D3DC(0);
  int v36 = 0;
LABEL_24:
  sub_1000122C0(a1, v36, 1);
LABEL_25:
  sub_10000B080(a1);
  if (*(_DWORD *)(a1 + 288) == 104) {
    sub_100019104((char *)(a1 + 308), v37, v38, v39, v40, v41, v42, v43);
  }
}

uint64_t sub_100011DFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a3 + 16) || (int v9 = *(_DWORD *)(a3 + 288), v9 != 102) && v9 != 104) {
    sub_100022E2C();
  }
  if (*(_DWORD *)(a2 + 1128) != 502 && !*(_BYTE *)(a2 + 704) && *(_BYTE *)(a2 + 1107)) {
    sub_100022EA4();
  }
  if (*(_BYTE *)(a3 + 700)) {
    return 0LL;
  }
  *(_BYTE *)(a3 + 700) = 1;
  int v11 = qword_1000354D4;
  LODWORD(qword_1000354D4) = qword_1000354D4 + 1;
  if (v11 < 0) {
    sub_100022E54();
  }
  if (*(_DWORD *)(a3 + 1128) == 502) {
    a1 = sub_10001D3DC(1u);
  }
  uint64_t v12 = sub_10001FB7C(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v12)
  {
    uint64_t v10 = v12;
    strerror(v12);
    sub_1000036BC(0, (uint64_t)"unable to start rtadvd for %s: %s", v20, v21, v22, v23, v24, v25, a3 + 308);
  }

  else if (*(_DWORD *)(a3 + 1128) == 502 || (uint64_t v26 = sub_100020BD8(v12, v13, v14, v15, v16, v17, v18, v19), !(_DWORD)v26))
  {
    *(_BYTE *)(a3 + 700) = 0;
    uint64_t v10 = 0LL;
    LODWORD(qword_1000354D4) = qword_1000354D4 - 1;
  }

  else
  {
    uint64_t v10 = v26;
    strerror(v26);
    sub_1000036BC(0, (uint64_t)"unable to start dhcpd for %s: %s", v27, v28, v29, v30, v31, v32, a3 + 308);
  }

  return v10;
}

uint64_t sub_100011F30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104) {
    sub_100022ECC();
  }
  uint64_t v8 = a2 + 308;
  uint64_t v15 = sub_100018D80((char *)(a2 + 308), (char *)(a1 + 308), a3, 0LL, *(_DWORD *)(a2 + 1240) & 1, 0LL, a7, a8);
  if ((_DWORD)v15) {
    sub_1000036BC(0, (uint64_t)"failed to add member %s to bridge %s", v9, v10, v11, v12, v13, v14, v8);
  }
  return v15;
}

uint64_t sub_100011FB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104) {
    sub_100022EF4();
  }
  return sub_100019424((char *)(a2 + 308), (char *)(a1 + 308), a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100011FE8(uint64_t result)
{
  if (*(_DWORD *)(result + 16) || (uint64_t v1 = result, *(_DWORD *)(result + 304))) {
    sub_100022F1C();
  }
  if (*(_DWORD *)(result + 292))
  {
    *(_DWORD *)(result + 684) = -251658241;
    char v2 = sub_10000F300(0xF0FFFFFF);
    int v3 = *(_DWORD *)(v1 + 292);
    uint64_t result = inet_aton("172.19.73.1", &v30);
    in_addr_t s_addr = v30.s_addr;
    *(_DWORD *)(v1 + 680) = bswap32((bswap32(v30.s_addr & 0xF0FFFFFF) + (v3 - 1) * (16 << -v2)) | 1);
  }

  else
  {
    unsigned int v5 = *(_DWORD *)(result + 692);
    if (v5)
    {
      unsigned int v6 = *(_DWORD *)(result + 684) & v5;
      unsigned int v7 = bswap32(v5);
      unsigned int v8 = bswap32(v6);
      if (v6 == v5) {
        unsigned int v9 = v8 + 1;
      }
      else {
        unsigned int v9 = v7;
      }
      in_addr_t s_addr = bswap32(v9);
      *(_DWORD *)(result + 680) = s_addr;
    }

    else
    {
      if ((*(_BYTE *)(result + 584) & 2) != 0)
      {
        uint64_t result = sub_1000151E4(*(_DWORD *)(result + 20), &v30, &c);
        if ((_DWORD)result)
        {
          if (*(_DWORD *)(v1 + 20) == 201) {
            uint64_t v11 = "192.168.64.1";
          }
          else {
            uint64_t v11 = "192.168.128.1";
          }
          uint64_t result = inet_aton(v11, &v30);
          unsigned int v12 = -256;
        }

        else
        {
          unsigned int v12 = bswap32(c.count[0]);
        }

        in_addr_t s_addr = v30.s_addr;
        *(_DWORD *)(v1 + 680) = bswap32((bswap32(v30.s_addr) & v12) + 1);
        unsigned int v10 = bswap32(v12);
      }

      else
      {
        uint64_t result = inet_aton("172.20.10.1", &v30);
        in_addr_t s_addr = v30.s_addr;
        *(_DWORD *)(v1 + 680) = v30.s_addr & 0xF0FFFFFF | 0x1000000;
        unsigned int v10 = -251658241;
      }

      *(_DWORD *)(v1 + 684) = v10;
    }
  }

  if (!byte_100035481 && *(_DWORD *)(v1 + 1128) == 500 && !*(_BYTE *)(v1 + 1107) && !*(_BYTE *)(v1 + 1178))
  {
    int v33 = *(_DWORD *)(v1 + 684);
    in_addr_t data = s_addr;
    v31.tv_seCC_SHA256_CTX c = 0LL;
    v31.tv_nseCC_SHA256_CTX c = 0LL;
    if ((byte_100034F45 & 1) == 0)
    {
      if (gethostuuid(byte_100034F35, &v31))
      {
        uint64_t v13 = __error();
        uint64_t v14 = strerror(*v13);
        sub_1000036BC(0, (uint64_t)"gethostuuid failed %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      }

      else
      {
        byte_100034F45 = 1;
      }
    }

    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, &data, 4u);
    CC_SHA256_Update(&c, &v33, 4u);
    if (byte_100034F45 == 1) {
      CC_SHA256_Update(&c, byte_100034F35, 0x10u);
    }
    CC_SHA256_Final(md, &c);
    char v27 = -3;
    *(_DWORD *)uint64_t v28 = *(_DWORD *)md;
    *(_DWORD *)&v28[3] = *(_DWORD *)&md[3];
    uint64_t v29 = 0LL;
    *(_BYTE *)(v1 + 117++*(_DWORD *)(result + 8) = 64;
    inet_ntop(30, &v27, (char *)(v1 + 1132), 0x2Eu);
    return sub_1000036BC( 1u,  (uint64_t)"generated ula prefix %s/%d for interface %s",  v21,  v22,  v23,  v24,  v25,  v26,  v1 + 1132);
  }

  return result;
}

uint64_t sub_1000122C0(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 16)) {
    sub_100022F44();
  }
  if (a2)
  {
    int v6 = sub_100012438(a1);
    if (v6)
    {
      strerror(v6);
      sub_1000036BC(0, (uint64_t)"routes_del(%s): %s", v7, v8, v9, v10, v11, v12, a1 + 308);
    }
  }

  if (a3)
  {
    int v13 = sub_10000DEB0((const char *)(a1 + 308));
    if (v13)
    {
      strerror(v13);
      sub_1000036BC(0, (uint64_t)"stop link local(%s): %s:", v14, v15, v16, v17, v18, v19, a1 + 308);
    }
  }

  if (*(_DWORD *)(a1 + 20) == 201)
  {
    if (a2) {
      sub_10000EA40((const char *)(a1 + 308));
    }
    if (a3) {
      sub_10000EBB8((const char *)(a1 + 308));
    }
  }

  uint64_t v20 = (char *)(a1 + 308);
  uint64_t v21 = sub_10000C8FC(v20);
  uint64_t v22 = v21;
  if ((_DWORD)v21)
  {
    strerror(v21);
    sub_1000036BC(0, (uint64_t)"remove_addrs(%s): %s", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
  }

  if (a2)
  {
    uint64_t v29 = sub_10000DC24(v20);
    uint64_t v22 = v29;
    if ((_DWORD)v29)
    {
      strerror(v29);
      sub_1000036BC(0, (uint64_t)"protodetach(%s): %s", v30, v31, v32, v33, v34, v35, (uint64_t)v20);
    }
  }

  if (a3)
  {
    uint64_t v36 = sub_10000DFE8(v20);
    uint64_t v22 = v36;
    if ((_DWORD)v36)
    {
      strerror(v36);
      sub_1000036BC(0, (uint64_t)"protodetach(%s): %s", v37, v38, v39, v40, v41, v42, (uint64_t)v20);
    }
  }

  sub_10000D54C(v20, a3, 0, 0);
  return v22;
}

uint64_t sub_100012438(uint64_t a1)
{
  char v2 = (char *)(a1 + 308);
  uint64_t v3 = if_nametoindex((const char *)(a1 + 308));
  if ((_DWORD)v3)
  {
    if (*(_DWORD *)(a1 + 680))
    {
      int v4 = socket(17, 3, 2);
      if (v4 < 0)
      {
        uint64_t v3 = *__error();
        sub_1000036BC(0, (uint64_t)"socket: %m", v24, v25, v26, v27, v28, v29, v44);
      }

      else
      {
        int v5 = v4;
        int v6 = *(_DWORD *)(a1 + 680);
        int v7 = *(_DWORD *)(a1 + 684);
        int v8 = v7 & v6;
        int v9 = sub_100013104(v4, 2, v7 & v6, v6, v7, v2, 0, v6, 0);
        uint64_t v10 = sub_10000F328(v8, *(_DWORD *)(a1 + 684));
        uint64_t v17 = (uint64_t)v10;
        if (v9)
        {
          strerror(v9);
          sub_1000036BC(0, (uint64_t)"unable to remove subnet route %s on %s: %s", v18, v19, v20, v21, v22, v23, v17);
        }

        else
        {
          sub_1000036BC(1u, (uint64_t)"subnet route %s removed on %s", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
        }

        uint64_t v30 = sub_100013104(v5, 2, 0, *(_DWORD *)(a1 + 680), 0, v2, v3, *(_DWORD *)(a1 + 680), 3);
        uint64_t v3 = v30;
        if ((_DWORD)v30)
        {
          strerror(v30);
          sub_1000036BC( 0,  (uint64_t)"unable to remove scoped default route on %s: %s",  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v2);
        }

        else
        {
          sub_1000036BC(1u, (uint64_t)"scoped default route removed on %s", v31, v32, v33, v34, v35, v36, (uint64_t)v2);
        }

        close(v5);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

BOOL sub_1000125A8(unsigned int a1)
{
  unsigned int v1 = bswap32(a1);
  BOOL v2 = HIBYTE(v1) == 10 || v1 >> 20 == 2753;
  unsigned int v3 = HIWORD(v1);
  return v2 || v3 == 49320;
}

uint64_t sub_1000125D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16)) {
    sub_100023034();
  }
  if (*(_DWORD *)(a1 + 304)) {
    sub_10002300C();
  }
  if (*(_BYTE *)(a1 + 701)) {
    return 0LL;
  }
  int v10 = *(_DWORD *)(a1 + 1128);
  if (*(_DWORD *)(a1 + 20) == 201 && !*(_BYTE *)(a2 + 564) && !*(_DWORD *)(a2 + 680))
  {
    if (*(_BYTE *)(a2 + 308))
    {
      sub_1000036BC( 1u,  (uint64_t)"external interface %s is not configured with IPv4 address",  a3,  a4,  a5,  a6,  a7,  a8,  a2 + 308);
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: external interface name is blank",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_bcast_setup_v4_service");
      if (*(_BYTE *)(a2 + 1276))
      {
        __int128 v137 = "in-progress";
      }

      else if (*(_DWORD *)(a2 + 12))
      {
        __int128 v137 = "active";
      }

      else
      {
        __int128 v137 = "unknown";
      }

      sub_1000036BC(0, (uint64_t)"PDP context state is '%s'", v131, v132, v133, v134, v135, v136, (uint64_t)v137);
    }

    return 0LL;
  }

  sub_10000EA40((const char *)(a1 + 308));
  v142[0] = 0LL;
  if (*(_DWORD *)(a1 + 16)) {
    sub_100022FBC();
  }
  if (getifaddrs(v142) < 0)
  {
    uint64_t v9 = *__error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v30, v31, v32, v33, v34, v35, v138);
  }

  else
  {
    char v12 = sub_10000F300(*(_DWORD *)(a1 + 684));
    unsigned int v13 = *(_DWORD *)(a1 + 680);
    unsigned int v14 = bswap32(v13);
    BOOL v15 = HIBYTE(v14) == 10 || v14 >> 20 == 2753;
    unsigned int v16 = HIWORD(v14);
    char v18 = v15 || v16 == 49320;
    int v19 = *(_DWORD *)(a1 + 692);
    BOOL v20 = 1;
    if (!v19) {
      BOOL v20 = *(_BYTE *)(a1 + 688) != 0;
    }
    if (v142[0])
    {
      int v21 = *(_DWORD *)(a1 + 684);
      char v22 = v20 | v18 ^ 1;
      int v23 = (1 << (32 - v12)) + 1;
      int v24 = 255 << (32 - v12);
      unsigned int v25 = *(_DWORD *)(a1 + 680);
      uint64_t v9 = 49LL;
      while (1)
      {
        unsigned int v26 = v25 & v21;
        uint64_t v27 = v142[0];
        while (1)
        {
          ifa_addr = v27->ifa_addr;
          if (ifa_addr->sa_family == 2)
          {
            int v29 = *(_DWORD *)&ifa_addr->sa_data[2];
            if (v29 == v25 || (*(_DWORD *)&v27->ifa_netmask->sa_data[2] & v29) == v26) {
              break;
            }
          }

          uint64_t v27 = v27->ifa_next;
          if (!v27)
          {
            unsigned int v13 = v25;
            goto LABEL_35;
          }
        }

        if ((v22 & 1) != 0) {
          break;
        }
        unsigned int v25 = bswap32(v23 + bswap32(v26));
        if ((bswap32((v25 ^ v13) & v21) & v24) == 0) {
          goto LABEL_40;
        }
      }

      uint64_t v9 = 48LL;
    }

    else
    {
LABEL_35:
      *(_DWORD *)(a1 + 680) = v13;
      if ((!v19 || !*(_BYTE *)(a1 + 688)) && (*(_BYTE *)(a1 + 584) & 2) != 0) {
        sub_100015304(*(_DWORD *)(a1 + 20), (const void *)(a1 + 680), (const void *)(a1 + 684));
      }
      uint64_t v9 = 0LL;
    }
  }

uint64_t sub_100012BE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_100035481)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: not enabling IPv6 on %s",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_bcast_setup_v6_service");
    return 0LL;
  }

  if (*(_DWORD *)(a1 + 16)) {
    sub_1000230AC();
  }
  if (*(_DWORD *)(a1 + 304)) {
    sub_100023084();
  }
  if (!(_DWORD)a3)
  {
    if (sub_10000DEB0((const char *)(a1 + 308)))
    {
      strerror(0);
      sub_1000036BC(0, (uint64_t)"mis_stop_linklocal(%s): %s:", v12, v13, v14, v15, v16, v17, a1 + 308);
      return 0LL;
    }

    uint64_t v18 = sub_10000D3C8((_BYTE *)(a1 + 308));
    if ((_DWORD)v18)
    {
      uint64_t v9 = v18;
      strerror(v18);
      sub_1000036BC(0, (uint64_t)"unable to attach ipv6 proto %s: %s", v19, v20, v21, v22, v23, v24, a1 + 308);
      return v9;
    }

    uint64_t v31 = sub_10000D884((const char *)(a1 + 308));
    if ((_DWORD)v31)
    {
      uint64_t v9 = v31;
      strerror(v31);
      sub_1000036BC(0, (uint64_t)"unable to start linklocal %s: %s", v32, v33, v34, v35, v36, v37, a1 + 308);
      return v9;
    }

    if (*(_BYTE *)(a1 + 688)
      && (*(_DWORD *)(a1 + 648) || *(_DWORD *)(a1 + 652) || *(_DWORD *)(a1 + 656) || *(_DWORD *)(a1 + 660)))
    {
      inet_ntop(30, (const void *)(a1 + 648), v52, 0x2Eu);
      __int128 v51 = xmmword_100025140;
      if (sub_10000E530((const char *)(a1 + 308), (_OWORD *)(a1 + 648), &v51, 0))
      {
        sub_1000036BC(0, (uint64_t)"failed to set %s address on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v52);
        return 0LL;
      }

      sub_1000036BC(0, (uint64_t)"added %s/%d on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v52);
    }
  }

  if (*(_DWORD *)(a1 + 20) != 201) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 1128) != 502)
  {
    if (*(_BYTE *)(a2 + 1107))
    {
      if (!*(_BYTE *)(a2 + 704)) {
        goto LABEL_13;
      }
    }

    else if (!*(_BYTE *)(a2 + 564) && !*(_BYTE *)(a2 + 1105))
    {
LABEL_13:
      if (*(_BYTE *)(a2 + 308))
      {
        sub_1000036BC( 0,  (uint64_t)"external interface %s is not configured with IPv6 address",  a3,  a4,  a5,  a6,  a7,  a8,  a2 + 308);
      }

      else
      {
        sub_1000036BC( 0,  (uint64_t)"%s: external interface name is blank",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_bcast_setup_v6_service");
        if (*(_BYTE *)(a2 + 1276))
        {
          uint64_t v50 = "in-progress";
        }

        else if (*(_DWORD *)(a2 + 12))
        {
          uint64_t v50 = "active";
        }

        else
        {
          uint64_t v50 = "unknown";
        }

        sub_1000036BC(0, (uint64_t)"PDP context state is '%s'", v44, v45, v46, v47, v48, v49, (uint64_t)v50);
      }

      return 0LL;
    }
  }

  uint64_t v9 = sub_10000EA48((const char *)(a1 + 308));
  if ((_DWORD)v9) {
    sub_1000036BC(0, (uint64_t)"unable to start router6 on %s", v25, v26, v27, v28, v29, v30, a1 + 308);
  }
  return v9;
}

uint64_t sub_100012E90(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 16))
  {
    sub_10000BEBC(a1, (const char *)(a1 + 28));
    unsigned int v2 = *(_DWORD *)(a1 + 296);
    if (v2)
    {
      if (v2 > 0x4FF) {
        goto LABEL_8;
      }
      unsigned int v2 = 1280;
    }

    else
    {
      unsigned int v2 = 1500;
    }

    *(_DWORD *)(a1 + 296) = v2;
LABEL_8:
    if (*(_DWORD *)(a1 + 288) != 104)
    {
      uint64_t result = sub_10000E278((_BYTE *)(a1 + 308), v2);
      if ((_DWORD)result) {
        return result;
      }
    }

    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203)
    {
      uint64_t result = sub_10001704C();
      if ((_DWORD)result) {
        return result;
      }
    }

    goto LABEL_13;
  }

  sub_10000BEBC(a1, "bcast-local");
  *(_DWORD *)(a1 + 296) = 1500;
LABEL_13:
  *(void *)(a1 + 592) = sub_100012F98;
  *(void *)(a1 + 600) = sub_100011C5C;
  *(void *)(a1 + 632) = 0LL;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(void *)(a1 + 616) = sub_100011F30;
      *(void *)(a1 + 624) = sub_100011FB4;
    }

    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203) {
      sub_100011FE8(a1);
    }
  }

  return 0LL;
}

uint64_t sub_100012F98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a2 + 16);
  if (v9) {
    goto LABEL_3;
  }
  if (!*(_BYTE *)(a2 + 700))
  {
    *(_BYTE *)(a2 + 700) = 1;
    int v13 = *(_DWORD *)(a2 + 20);
    if (v13 == 204) {
      goto LABEL_19;
    }
    if (v13 == 203)
    {
      int v14 = HIDWORD(qword_1000354D4)++;
      if (v14 < 0) {
        sub_100023124();
      }
    }

    if (*(_DWORD *)(a2 + 680))
    {
      uint64_t v15 = sub_1000125D4(a2, a3, a3, a4, a5, a6, a7, a8);
      if ((_DWORD)v15)
      {
        uint64_t v10 = v15;
        sub_1000036BC(0, (uint64_t)"failed to setup IPv4 on %s", v16, a4, a5, a6, a7, a8, a2 + 308);
        goto LABEL_8;
      }
    }

    uint64_t v17 = sub_100012BE4(a2, a3, 0LL, a4, a5, a6, a7, a8);
    if ((_DWORD)v17)
    {
      uint64_t v10 = v17;
      sub_1000036BC(0, (uint64_t)"failed to setup IPv6 on %s", a3, a4, a5, a6, a7, a8, a2 + 308);
      goto LABEL_8;
    }

    int v9 = *(_DWORD *)(a2 + 16);
    if (!v9)
    {
LABEL_19:
      int v18 = sub_100007EDC((_BYTE *)(a2 + 308));
      int v9 = *(_DWORD *)(a2 + 16);
      *(_DWORD *)(a2 + 296) = v18;
      if (!v9)
      {
        if (*(_DWORD *)(a2 + 20) == 203)
        {
          uint64_t v10 = sub_1000171AC(a2, a3, a3, a4, a5, a6, a7, a8);
          goto LABEL_8;
        }

        goto LABEL_7;
      }

      goto LABEL_4;
    }

LABEL_3:
    *(_DWORD *)(a2 + 296) = 1500;
LABEL_4:
    if (v9 == 1) {
      sub_1000036BC(0, (uint64_t)"BCAST-LOCAL is ready [%s, mtu=%d]", a3, a4, a5, a6, a7, a8, a2 + 308);
    }
  }

  os_log_t v0 = 0LL;
  unsigned int v1 = dword_1000353D4 + 1;
LABEL_5:
  dword_1000353D4 = v1;
  return v0;
}

uint64_t sub_100013104(int a1, char a2, int a3, int a4, int a5, char *__s, __int16 a7, int a8, char a9)
{
  __int128 v25 = 0u;
  memset(v26, 0, 220);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  BYTE3(v1++*(_DWORD *)(result + 8) = a2;
  BYTE2(v1++*(_DWORD *)(result + 8) = 5;
  int v13 = dword_100034D48++;
  DWORD1(v19) = v13;
  if (a9 & 1 | a3) {
    unsigned int v14 = 2305;
  }
  else {
    unsigned int v14 = 2051;
  }
  *((void *)&v18 + 1) = v14 | 0x3700000000LL;
  if ((a9 & 2) != 0)
  {
    WORD2(v1++*(_DWORD *)(result + 8) = a7;
    v14 |= 0x1000000u;
    DWORD2(v1++*(_DWORD *)(result + 8) = v14;
  }

  WORD6(v23) = 528;
  LODWORD(v24) = a3;
  if ((v14 & 2) != 0)
  {
    WORD6(v24) = 528;
    LODWORD(v25) = a4;
    uint64_t v15 = (char *)&v25 + 12;
  }

  else
  {
    WORD6(v24) = 4628;
    BYTE1(v25) = strlen(__s);
    __memmove_chk((char *)&v25 + 4, __s, BYTE1(v25), 232LL);
    uint64_t v15 = (char *)v26;
  }

  *(_WORD *)uint64_t v15 = 528;
  *((_DWORD *)v15 + 1) = a5;
  *((_WORD *)v15 + ++*(_DWORD *)(result + 8) = 4628;
  unsigned __int8 v16 = strlen(__s);
  v15[21] = v16;
  memmove(v15 + 24, __s, v16);
  *((_WORD *)v15 + 1++*(_DWORD *)(result + 8) = 528;
  *((_DWORD *)v15 + 10) = a8;
  LOWORD(v1++*(_DWORD *)(result + 8) = (_WORD)v15 - ((unsigned __int16)&v23 + 12) + 144;
  else {
    return 0LL;
  }
}

uint64_t sub_1000132D4()
{
  byte_100034F48 = 1;
  os_log_t v0 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.MobileInternetSharing", 0LL, 0LL);
  qword_100034F50 = (uint64_t)v0;
  if (!v0)
  {
    int v39 = SCError();
    SCErrorString(v39);
    sub_1000036BC( 0,  (uint64_t)"%s: SCDynamicStoreCreate() failed: %s",  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)"mis_set_load");
    return 12LL;
  }

  if (!SCDynamicStoreSetDispatchQueue(v0, (dispatch_queue_t)qword_100035470))
  {
    int v46 = SCError();
    SCErrorString(v46);
    sub_1000036BC( 0,  (uint64_t)"%s: SCDynamicStoreSetDispatchQueue() failed: %s",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)"mis_set_load");
    return 12LL;
  }

  if (!SCDynamicStoreSetDisconnectCallBack(qword_100034F50, sub_100013BF0))
  {
    int v53 = SCError();
    SCErrorString(v53);
    sub_1000036BC( 0,  (uint64_t)"%s: SCDynamicStoreSetDisconnectCallBack() failed: %s",  v54,  v55,  v56,  v57,  v58,  v59,  (uint64_t)"mis_set_load");
    return 12LL;
  }

  unsigned int v1 = (const __CFURL *)CFCopyHomeDirectoryURLForUser(@"mobile");
  if (!v1) {
    return 2LL;
  }
  unsigned int v2 = v1;
  unsigned int v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  if (!v3)
  {
    uint64_t v60 = 12LL;
    goto LABEL_114;
  }

  int v4 = v3;
  CFStringGetCString(v3, byte_100034F58, 1024LL, 0x600u);
  int v5 = getpwnam("mobile");
  if (!v5)
  {
    uint64_t v60 = 2LL;
    goto LABEL_113;
  }

  dword_100035358 = v5->pw_gid;
  if (qword_100035360) {
    free((void *)qword_100035360);
  }
  size_t v6 = strlen(byte_100034F58) + 59;
  int v7 = (char *)malloc(v6);
  qword_100035360 = (uint64_t)v7;
  if (!v7)
  {
LABEL_102:
    uint64_t v60 = 12LL;
    goto LABEL_113;
  }

  snprintf(v7, v6, "%s%s", byte_100034F58, "/Library/Preferences/com.apple.MobileInternetSharing.plist");
  *(_OWORD *)&dword_10003536C = 0u;
  *(_OWORD *)&dword_10003537C = 0u;
  unk_10003538C = 0u;
  unk_10003539C = 0LL;
  dword_100035368[0] = 3;
  qword_100035370 = (uint64_t)vdup_n_s32(0x3FCu);
  dword_10003537C = 0;
  if (!qword_100035360) {
    sub_10002314C();
  }
  size_t v8 = sub_10000F190((const char *)qword_100035360, &v148, 1);
  if (!v8)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: failed (%d) to read settings from %s",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"read_settings");
    if (!v148) {
      sub_100023174();
    }
    BOOL v63 = 0;
    int v64 = dword_100035368[0];
    goto LABEL_39;
  }

  uint64_t v15 = (const void *)v8;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(v15) != TypeID) {
    goto LABEL_32;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)v15, @"Version");
  if (!Value) {
    goto LABEL_32;
  }
  __int128 v24 = Value;
  CFTypeID v25 = CFNumberGetTypeID();
  if (CFGetTypeID(v24) != v25) {
    goto LABEL_32;
  }
  uint64_t v26 = CFDictionaryGetValue((CFDictionaryRef)v15, @"State");
  if (!v26) {
    goto LABEL_32;
  }
  uint64_t v27 = v26;
  CFTypeID v28 = CFNumberGetTypeID();
  if (CFGetTypeID(v27) != v28
    || (uint64_t v29 = CFDictionaryGetValue((CFDictionaryRef)v15, @"UState")) == 0LL
    || (uint64_t v30 = v29, v31 = v4, v32 = CFNumberGetTypeID(), v108 = CFGetTypeID(v30) == v32, v4 = v31, !v108))
  {
LABEL_32:
    sub_1000036BC( 0,  (uint64_t)"%s: failed to get properties from plist file",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"read_settings");
    int v62 = 2;
LABEL_33:
    int v148 = v62;
    goto LABEL_34;
  }

  if (!CFNumberGetValue((CFNumberRef)v24, kCFNumberIntType, dword_100035368)
    || !CFNumberGetValue((CFNumberRef)v27, kCFNumberIntType, &qword_100035370)
    || !CFNumberGetValue((CFNumberRef)v30, kCFNumberIntType, &dword_10003536C))
  {
    sub_1000036BC( 0,  (uint64_t)"%s: failed to retrieve property values",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)"read_settings");
    int v62 = 22;
    goto LABEL_33;
  }

  int v148 = sub_1000166E8(v15);
LABEL_34:
  CFRelease(v15);
  BOOL v63 = v148 == 0;
  int v64 = dword_100035368[0];
  if (!v148 && dword_100035368[0] == 3)
  {
    uint64_t v65 = qword_100035370;
    BOOL v63 = 1;
    goto LABEL_41;
  }

LABEL_73:
  __int128 v145 = v4;
  __int128 v146 = v2;
  CFIndex Count = CFArrayGetCount(v93);
  if (Count >= 1)
  {
    CFIndex v99 = Count;
    CFIndex v100 = 0LL;
    char v101 = 0;
    while (1)
    {
      uint64_t v102 = v92;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v92[118], v100);
      if (ValueAtIndex)
      {
        uint64_t v104 = ValueAtIndex;
        CFTypeID v105 = CFDictionaryGetTypeID();
        if (CFGetTypeID(v104) == v105)
        {
          CFBooleanRef v106 = (CFBooleanRef)CFDictionaryGetValue(v104, @"MAC_USED");
          CFTypeID v107 = CFBooleanGetTypeID();
          if (!v106 || (CFGetTypeID(v106) == v107 ? (BOOL v108 = v106 == kCFBooleanFalse) : (BOOL v108 = 0), !v108))
          {
            uint64_t v109 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v104);
            if (!v109)
            {
              sub_1000036BC( 0,  (uint64_t)"CFDictionaryCreateMutableCopy() failed",  v110,  v111,  v112,  v113,  v114,  v115,  v144);
              uint64_t v60 = 12LL;
              int v4 = v145;
LABEL_110:
              unsigned int v2 = v146;
              goto LABEL_113;
            }

            uint64_t v116 = v109;
            CFDictionarySetValue(v109, @"MAC_USED", kCFBooleanFalse);
            CFArraySetValueAtIndex(v102[118], v100, v116);
            CFRelease(v116);
            char v101 = 1;
          }
        }
      }

      ++v100;
      uint64_t v92 = v102;
      if (v99 == v100) {
        goto LABEL_87;
      }
    }
  }

  char v101 = 0;
LABEL_87:
  uint64_t v117 = (const void **)&byte_100034F58[168];
  CFIndex v118 = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (v118 < 1)
  {
    unsigned int v2 = v146;
LABEL_104:
    if ((v101 & 1) == 0)
    {
      uint64_t v60 = 0LL;
      goto LABEL_112;
    }

    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_ARRAY", (const void *)qword_1000353B0);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_IOUE_ARRAY", v117[119]);
    uint64_t v135 = (const void *)qword_1000353C0;
    uid_t v136 = geteuid();
    gid_t v137 = getgid();
    unsigned int v149 = sub_10000EFF0(v135, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v136, v137, 416LL, 0);
    int v4 = v145;
    if (v149)
    {
      CFRelease((CFTypeRef)qword_1000353B0);
      CFRelease(v117[119]);
      CFRelease((CFTypeRef)qword_1000353C0);
      qword_1000353B0 = 0LL;
      v117[119] = 0LL;
      qword_1000353C0 = 0LL;
      sub_1000036BC(0, (uint64_t)"plist write failed for IOUE address", v138, v139, v140, v141, v142, v143, v144);
      uint64_t v60 = v149;
    }

    else
    {
      uint64_t v60 = 0LL;
    }

    goto LABEL_110;
  }

  CFIndex v119 = v118;
  CFIndex v120 = 0LL;
  unsigned int v2 = v146;
  while (1)
  {
    uint64_t v121 = CFArrayGetValueAtIndex((CFArrayRef)v117[119], v120);
    if (!v121) {
      goto LABEL_98;
    }
    uint64_t v122 = v121;
    CFTypeID v123 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v122) != v123) {
      goto LABEL_98;
    }
    CFBooleanRef v124 = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)v122, @"MAC_IOUE_USED");
    CFTypeID v125 = CFBooleanGetTypeID();
    if (v124)
    {
      if (CFGetTypeID(v124) == v125 && v124 == kCFBooleanFalse) {
        goto LABEL_98;
      }
    }

    uint64_t v127 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)v122);
    if (!v127) {
      break;
    }
    uint64_t v134 = v127;
    CFDictionarySetValue(v127, @"MAC_IOUE_USED", kCFBooleanFalse);
    CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v120, v134);
    CFRelease(v134);
    char v101 = 1;
LABEL_98:
    ++v120;
    uint64_t v117 = (const void **)(byte_100034F58 + 168);
    if (v119 == v120) {
      goto LABEL_104;
    }
  }

  sub_1000036BC(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v128, v129, v130, v131, v132, v133, v144);
  uint64_t v60 = 12LL;
LABEL_112:
  int v4 = v145;
LABEL_113:
  CFRelease(v4);
LABEL_114:
  CFRelease(v2);
  return v60;
}

uint64_t sub_100013BF0( const __SCDynamicStore *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1000142E0(a1);
}

uint64_t sub_100013C20(uint64_t a1, char a2)
{
  if ((a2 & 2) != 0)
  {
    if (qword_1000353A8)
    {
      sub_100013C6C();
      return sub_100013D20( 0LL,  0,  qword_100035370,  dword_100035378,  dword_10003537C,  0LL,  0LL,  v2);
    }
  }

  return result;
}

void sub_100013C6C()
{
  if (!qword_1000353A8) {
    sub_10002319C();
  }
  Value = (const __CFBoolean *)SCPreferencesGetValue((SCPreferencesRef)qword_1000353A8, @"AirplaneMode");
  if (Value)
  {
    unsigned int v1 = Value;
    CFTypeID v2 = CFGetTypeID(Value);
    if (v2 == CFBooleanGetTypeID())
    {
      int v3 = byte_1000353A0;
      int v4 = CFBooleanGetValue(v1);
      if (v3 != (v4 != 0))
      {
        byte_1000353A0 = v4 != 0;
        uint64_t v11 = "OFF";
        if (v4) {
          uint64_t v11 = "ON";
        }
        sub_1000036BC(0, (uint64_t)"Airplane Mode is %s", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
      }
    }
  }

  SCPreferencesSynchronize((SCPreferencesRef)qword_1000353A8);
}

uint64_t sub_100013D20( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  int v8 = a7;
  int v10 = a5;
  int v11 = a3;
  __int16 v49 = 0;
  if (a6) {
    *a6 = 0;
  }
  int v48 = a4;
  if (byte_100035450)
  {
    __int16 v49 = 257;
LABEL_5:
    int v14 = 1;
    goto LABEL_8;
  }

  sub_1000036BC(1u, (uint64_t)"checking for carrier provisioning", a3, a4, a5, (uint64_t)a6, a7, a8, v45);
  int v14 = 0;
LABEL_8:
  sub_1000036BC( 1u,  (uint64_t)"doauth(%d) tethering %s supported, user %s authenticated",  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  a1);
  char v47 = a2;
  if (!v14)
  {
    if ((_DWORD)qword_100035370 == 1020)
    {
LABEL_18:
      byte_1000353A1 = HIBYTE(v49) ^ 1;
      uint64_t v24 = 1020LL;
      int v23 = 45;
LABEL_19:
      sub_1000036BC(0, (uint64_t)"state out of bounds or already reset %d", v16, v17, v18, v19, v20, v21, v24);
      if (byte_100035450) {
        int v31 = 0;
      }
      else {
        int v31 = a1;
      }
      BOOL v32 = (v14 & v31) == 0;
      uint64_t v33 = 1020LL;
      if (v32) {
        int v34 = 1020;
      }
      else {
        int v34 = 1021;
      }
      LODWORD(qword_100035370) = v34;
      dword_100035378 = 0;
      if (!v32) {
        uint64_t v33 = 1021LL;
      }
      sub_1000036BC(0, (uint64_t)"netrb state set to %d, reason %d", v25, v26, v27, v28, v29, v30, v33);
      LODWORD(v24) = qword_100035370;
      goto LABEL_28;
    }

LABEL_17:
    sub_1000036BC( 0,  (uint64_t)"resetting netrb state %d, reason %d, tethering support %d",  v16,  v17,  v18,  v19,  v20,  v21,  qword_100035370);
    LODWORD(qword_100035370) = 1020;
    goto LABEL_18;
  }

  if ((_DWORD)a1 && (_DWORD)qword_100035370 == 1021 && dword_100035378 != 2 && dword_100035378 != 4) {
    goto LABEL_17;
  }
  if ((_DWORD)qword_100035370 == 1020)
  {
    if ((_BYTE)v49)
    {
      uint64_t v22 = dword_10003536C;
      int v23 = 45;
    }

    else
    {
      dword_100035378 = 3;
      int v23 = 80;
      uint64_t v22 = 1021LL;
    }

    LODWORD(qword_100035370) = v22;
    sub_1000036BC(0, (uint64_t)"Setting netrb state to %d, reason %d from %d", v16, v17, v18, v19, v20, v21, v22);
    uint64_t v24 = qword_100035370;
  }

  else
  {
    if (!(_BYTE)v49)
    {
      sub_1000036BC(0, (uint64_t)"Setting netrb state to %d from %d", v16, v17, v18, v19, v20, v21, 1021LL);
      LODWORD(qword_100035370) = 1021;
      dword_100035378 = 3;
      byte_1000353A1 = HIBYTE(v49) ^ 1;
      LODWORD(v37) = 80;
      LODWORD(v24) = 1021;
      goto LABEL_33;
    }

    int v23 = 45;
    uint64_t v24 = qword_100035370;
  }

  byte_1000353A1 = HIBYTE(v49) ^ 1;
LABEL_28:
  if (v24 >= 0x3FE)
  {
    int v35 = HIDWORD(qword_100035370);
    if (byte_1000353A0 | byte_1000353A1)
    {
      int v38 = HIDWORD(qword_100035370);
      if (HIDWORD(qword_100035370) == 1020)
      {
        HIDWORD(qword_100035370) = v24;
        int v38 = v24;
      }

      int v36 = 1022;
      LODWORD(qword_100035370) = 1022;
      dword_100035378 = 4;
    }

    else
    {
      if (HIDWORD(qword_100035370) >= 0x3FE)
      {
        LODWORD(qword_100035370) = HIDWORD(qword_100035370);
        *(uint64_t *)((char *)&qword_100035370 + 4) = 1020LL;
        int v36 = v35;
        goto LABEL_47;
      }

      int v36 = v24;
      int v38 = HIDWORD(qword_100035370);
    }

    if ((_DWORD)v24 == v36 && v35 == v38)
    {
LABEL_56:
      if ((_DWORD)v24 == 1023)
      {
        sub_1000036BC(0, (uint64_t)"netrb state is ON", v16, v17, v18, v19, v20, v21, v46);
        LODWORD(v37) = 0;
      }

      else
      {
        BOOL v42 = v24 != 1022;
        if (dword_100035378 == 4) {
          BOOL v42 = 1;
        }
        if ((v47 & 4) == 0) {
          BOOL v42 = 1;
        }
        if (v42) {
          LODWORD(v37) = v23;
        }
        else {
          LODWORD(v37) = 0;
        }
        if ((_DWORD)v24 == 1022 && v42)
        {
          sub_1000036BC(0, (uint64_t)"netrb state is OFF", v16, v17, v18, v19, v20, v21, v46);
          LODWORD(v37) = v23;
        }
      }

      goto LABEL_68;
    }

        uint64_t v15 = v24;
        uint64_t v16 = v23;
        int v4 = v45;
        uint64_t v17 = v44;
        uint64_t v19 = Count;
      }

      ++v20;
    }

    while (v20 != v19);
  }

  if (*v47)
  {
    sub_100017E14(cf, @"Subnets", v14, 1);
    sub_100017E14(cf, @"dhcp_enabled", v15, 0);
    sub_100017E14(cf, @"ignore_allow_deny", v16, 1);
    sub_100017E14(cf, @"detect_other_dhcp_server", v17, 0);
    sub_100017E14(cf, @"ipv6_only_preferred", (CFArrayRef)v4, 1);
    int v38 = geteuid();
    int v39 = getgid();
    int v48 = sub_10000EFF0(cf, "/Library/Preferences/SystemConfiguration/bootpd.plist", v38, v39, 420LL, 0);
  }

  if (v17) {
    CFRelease(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(cf);
  CFRelease(v43);
  if (v4) {
    goto LABEL_41;
  }
  return v48;
}

  xpc_array_set_string((xpc_object_t)v12[42], 0xFFFFFFFFFFFFFFFFLL, v13);
  return 0LL;
}

      ++v26;
    }

    else
    {
LABEL_18:
      xpc_array_set_string(v23, 0xFFFFFFFFFFFFFFFFLL, string);
    }

    if (++v27 != v25) {
      continue;
    }
    break;
  }

  if (v26 <= 0)
  {
    int v10 = &qword_1000354E0;
    goto LABEL_27;
  }

  xpc_release(v22);
  v11[4] = (uint64_t)v23;
  int v10 = &qword_1000354E0;
LABEL_28:
  sub_1000036BC(2u, (uint64_t)"%s: after:", v34, v35, v36, v37, v38, v39, (uint64_t)"dns_proxy_remove_interfaces");
  uint64_t v50 = (void *)v11[4];
  if (v50)
  {
    uint64_t v51 = xpc_array_get_count((xpc_object_t)v11[4]);
    if (v51)
    {
      uint64_t v52 = v51;
      for (uint64_t j = 0LL; j != v52; ++j)
      {
        xpc_array_get_string(v50, j);
        sub_1000036BC(2u, (uint64_t)"%ld. %s", v54, v55, v56, v57, v58, v59, j);
      }
    }
  }

  if (v26 >= 1)
  {
    uint64_t v60 = *((_DWORD *)v11 + 10);
    uint64_t v61 = v60 - v26;
    if (v60 < v26) {
      sub_100023D04();
    }
    *((_DWORD *)v11 + 10) = v61;
    int v62 = v11[3];
    if (v61 < 1)
    {
      if (v62)
      {
        sub_1000036BC(0, (uint64_t)"%s: DNS Proxy stop %p", v44, v45, v46, v47, v48, v49, (uint64_t)"dns_proxy_stop");
        mrc_dns_proxy_invalidate(v11[3]);
        v11[3] = 0LL;
      }
    }

    else if (v62)
    {
      sub_100021534((uint64_t)v11, v43, v44, v45, v46, v47, v48, v49);
    }

    if (!*((_DWORD *)v11 + 10))
    {
      *int v10 = *v11;
      if (!dword_10003544C) {
        sub_100023D2C();
      }
      --dword_10003544C;
      xpc_release((xpc_object_t)v11[4]);
      free(v11);
    }
  }

  return 0LL;
}

LABEL_47:
    int v39 = "silent";
    if ((_DWORD)a1) {
      int v39 = "ask CT";
    }
    if (v36 == 1022) {
      uint64_t v40 = "OFF";
    }
    else {
      uint64_t v40 = "UNKNOWN";
    }
    if (v36 == 1023) {
      uint64_t v41 = "ON";
    }
    else {
      uint64_t v41 = v40;
    }
    sub_1000036BC( 0,  (uint64_t)"set state: %s, pstate %s(%d)->%s(%d), state %s(%d)->%s(%d), reason %s(%d), airplane mode %s, cellular data plan %s",  (uint64_t)"OFF",  (uint64_t)v41,  (uint64_t)"ON",  v19,  v20,  v21,  (uint64_t)v39);
    LODWORD(v24) = qword_100035370;
    goto LABEL_56;
  }

  LODWORD(v37) = v23;
LABEL_33:
  if ((_DWORD)v24 == 1021 && (_DWORD)a1)
  {
    if (dword_100035378 == 3) {
      uint64_t v37 = 80LL;
    }
    else {
      uint64_t v37 = 36LL;
    }
    dword_100035378 = sub_10001661C(v37, v15, v16, v17, v18, v19, v20, v21);
  }

        uint64_t v26 = v38;
        int v35 = 0LL;
LABEL_54:
        int v39 = 0LL;
        goto LABEL_55;
      }

LABEL_68:
  dword_10003537C = v37;
  if ((_DWORD)v37 != v10 || (_DWORD)qword_100035370 != v11 || dword_100035378 != v48)
  {
    if ((_DWORD)qword_100035370 != v11) {
      sub_100014238();
    }
    sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
    if (a6) {
      *a6 = 1;
    }
  }

  if ((_DWORD)v37 == 45 || (_DWORD)v37 == 0) {
    return v37;
  }
  else {
    return 45LL;
  }
}

        xpc_release(v81);
        goto LABEL_69;
      }

      uint64_t v79 = "unable to create src address xpc dictionary";
    }

    else
    {
      uint64_t v79 = "unable to create rule xpc dictionary";
    }

    sub_1000036BC(0, (uint64_t)v79, v68, v69, v70, v71, v72, v73, v112);
    uint64_t v80 = 12;
    uint64_t v81 = v66;
    goto LABEL_68;
  }

  sub_1000036BC(0, (uint64_t)"unable to create rdr xpc dictionary", v60, v61, v62, v63, v64, v65, v112);
LABEL_108:
  uint64_t v7 = 1LL;
LABEL_100:
  PFUserClearRules(a2, v4);
  return v7;
}

                PFUserDeleteRules(v35, 0LL, 0LL);
                goto LABEL_69;
              }

void sub_100014238()
{
  if (!qword_100035360) {
    sub_1000231C4();
  }
  os_log_t v0 = sub_100016864(1);
  if (v0)
  {
    unsigned int v1 = v0;
    CFTypeID v2 = (const char *)qword_100035360;
    uid_t v3 = geteuid();
    int v4 = sub_10000EFF0(v1, v2, v3, dword_100035358, 384LL, 1);
    int v11 = "error";
    if (!v4) {
      int v11 = "success";
    }
    sub_1000036BC(2u, (uint64_t)"wrote changes: %s", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
    CFRelease(v1);
  }

uint64_t sub_1000142E0(const __SCDynamicStore *a1)
{
  if (!a1) {
    sub_1000231EC();
  }
  CFStringRef v2 = SCDynamicStoreKeyCreate(0LL, @"%@", @"com.apple.MobileInternetSharing");
  if (!v2) {
    return 12LL;
  }
  uid_t v3 = v2;
  int v4 = sub_100016864(0);
  if (v4)
  {
    uint64_t v5 = v4;
    CFNumberRef v42 = CFNumberCreate(0LL, kCFNumberIntType, &dword_100035378);
    CFDictionarySetValue(v5, @"Reason", v42);
    CFNumberRef v41 = CFNumberCreate(0LL, kCFNumberIntType, &dword_10003537C);
    CFDictionarySetValue(v5, @"Errnum", v41);
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    uint64_t v7 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    for (uint64_t i = qword_1000353C8; i; uint64_t i = *(void *)i)
    {
      CFStringRef v9 = CFStringCreateWithCString(0LL, (const char *)(i + 12), 0x600u);
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
      size_t count = xpc_array_get_count(*(xpc_object_t *)(i + 32));
      if (count)
      {
        size_t v11 = count;
        for (size_t j = 0LL; j != v11; ++j)
        {
          string = xpc_array_get_string(*(xpc_object_t *)(i + 32), j);
          CFStringRef v14 = CFStringCreateWithCString(0LL, string, 0x600u);
          CFArrayAppendValue(v7, v14);
          CFRelease(v14);
        }
      }
    }

    CFDictionarySetValue(v5, @"InternalInterfaces", v7);
    CFDictionarySetValue(v5, @"ExternalInterfaces", Mutable);
    uint64_t v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &dword_100035380);
    CFDictionarySetValue(v15, @"Max", v16);
    uint64_t v17 = 0LL;
    int v18 = 0;
    do
    {
      v18 += dword_100035368[v17 + 7];
      ++v17;
    }

    while (v17 != 7);
    int valuePtr = v18;
    CFNumberRef v19 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, @"Current", v19);
    uint64_t v43 = v3;
    CFNumberRef v39 = v19;
    CFNumberRef cf = v16;
    if (!dword_100035380) {
      goto LABEL_15;
    }
    uint64_t v20 = 0LL;
    int v21 = 0;
    do
    {
      v21 += dword_100035368[v20 + 7];
      ++v20;
    }

    while (v20 != 7);
    if (v21 >= dword_100035380) {
      uint64_t v22 = (const void **)&kCFBooleanFalse;
    }
    else {
LABEL_15:
    }
      uint64_t v22 = (const void **)&kCFBooleanTrue;
    CFDictionarySetValue(v15, @"MoreAllowed", *v22);
    uint64_t v24 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v25 = -2LL;
    uint64_t v26 = (char *)&unk_100035384;
    do
    {
      if (v25 <= 4)
      {
        uint64_t v27 = (const void *)*((void *)&off_100030F10 + v25);
        CFNumberRef v28 = CFNumberCreate(0LL, kCFNumberIntType, v26);
        if (v28)
        {
          CFNumberRef v29 = v28;
          CFDictionarySetValue(v24, v27, v28);
          CFRelease(v29);
        }
      }

      ++v25;
      v26 += 4;
    }

    while (v25 != 5);
    CFDictionarySetValue(v15, @"Type", v24);
    CFDictionarySetValue(v5, @"Hosts", v15);
    if (v15) {
      CFRelease(v15);
    }
    uid_t v3 = v43;
    if (cf) {
      CFRelease(cf);
    }
    if (v39) {
      CFRelease(v39);
    }
    if (v24) {
      CFRelease(v24);
    }
    if (v42) {
      CFRelease(v42);
    }
    if (v41) {
      CFRelease(v41);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    int v30 = SCDynamicStoreSetValue(a1, v43, v5);
    uint64_t v23 = v30 == 0;
    uint64_t v37 = "success";
    if (!v30) {
      uint64_t v37 = "error";
    }
    sub_1000036BC(0, (uint64_t)"published changes: %s", v31, v32, v33, v34, v35, v36, (uint64_t)v37);
    CFRelease(v5);
  }

  else
  {
    uint64_t v23 = 12LL;
  }

  CFRelease(v3);
  return v23;
}

void sub_100014718()
{
  if (byte_100034F48 == 1)
  {
    if (qword_100035360)
    {
      free((void *)qword_100035360);
      qword_100035360 = 0LL;
    }

    if (qword_1000353A8)
    {
      CFRelease((CFTypeRef)qword_1000353A8);
      qword_1000353A8 = 0LL;
    }

    if (qword_1000353B0)
    {
      CFRelease((CFTypeRef)qword_1000353B0);
      qword_1000353B0 = 0LL;
    }

    if (qword_1000353B8)
    {
      CFRelease((CFTypeRef)qword_1000353B8);
      qword_1000353B8 = 0LL;
    }

    if (qword_1000353C0)
    {
      CFRelease((CFTypeRef)qword_1000353C0);
      qword_1000353C0 = 0LL;
    }

    if (qword_100034F50)
    {
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)qword_100034F50, 0LL);
      CFRelease((CFTypeRef)qword_100034F50);
      qword_100034F50 = 0LL;
    }

    byte_100034F48 = 0;
  }

uint64_t sub_1000147C8( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100013D20( a1,  a2,  qword_100035370,  dword_100035378,  dword_10003537C,  0LL,  0LL,  a8);
}

uint64_t sub_1000147E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100013D20( 0LL,  0,  qword_100035370,  dword_100035378,  dword_10003537C,  0LL,  0LL,  a8);
}

uint64_t sub_100014808( _DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_100013D20( 0LL,  0,  qword_100035370,  dword_100035378,  dword_10003537C,  0LL,  0LL,  a8);
  if (a1) {
    *a1 = qword_100035370;
  }
  if (a2) {
    *a2 = dword_100035378;
  }
  return result;
}

uint64_t sub_10001486C( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

uint64_t sub_10001488C( unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = qword_100035370;
  unsigned int v11 = dword_100035378;
  unsigned int v12 = dword_10003537C;
  if (a2)
  {
    if ((_DWORD)a3) {
      sub_100023214();
    }
    if (a1 != 1022) {
      sub_10002323C();
    }
    else {
      int v13 = dword_10003536C;
    }
    dword_100035378 = 0;
    dword_10003537C = 0;
  }

  else if (qword_100035370 < 0x3FE && byte_100035450 == 0 && a1 > 0x3FD)
  {
    int v13 = 1020;
  }

  else
  {
    int v13 = a1;
  }

  else {
    CFNumberRef v16 = (&off_100030F68)[(int)qword_100035370 - 1020];
  }
  sub_1000036BC( 1u,  (uint64_t)"set state: state %s(%d)->%s(%d), reason: %s(%d)->%s(%d),  errnum %d->%d",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)v16);
  LODWORD(qword_100035370) = v13;
  if (a2) {
    uint64_t v18 = v11;
  }
  else {
    uint64_t v18 = dword_100035378;
  }
  if (a2) {
    uint64_t v19 = v12;
  }
  else {
    uint64_t v19 = dword_10003537C;
  }
  return sub_100013D20(0LL, 0, v10, v18, v19, 0LL, a3, v17);
}

uint64_t sub_100014A30( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

uint64_t sub_100014A50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)qword_100035370 == 1023)
  {
    sub_10001488C(0x3FEu, 0, 0LL, a4, a5, a6, a7, a8);
    return sub_10001488C(0x3FFu, 0, 0LL, v8, v9, v10, v11, v12);
  }

  return result;
}

uint64_t sub_100014A94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

uint64_t sub_100014AB8(_DWORD *a1)
{
  uint64_t result = 0LL;
  *a1 = 0;
  if (qword_100035370 <= 0x3FD)
  {
    if ((_DWORD)qword_100035370 == 1020)
    {
      uint64_t result = 0LL;
      *a1 = 45;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_100014AF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  int v9 = sub_10001661C(a1, a2, a3, a4, a5, a6, a7, a8);
  int v16 = 4;
  if (v9 != 4)
  {
    else {
      int v16 = v9;
    }
  }

  else {
    uint64_t v17 = (&off_100030F38)[dword_100035378];
  }
  sub_1000036BC( 2u,  (uint64_t)"set reason: %s(%d)->%s(%d), errnum %d->%d, state %s(%d), forced %d",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v17);
  if (v16 != dword_100035378 || dword_10003537C != v8)
  {
    dword_100035378 = v16;
    dword_10003537C = v8;
    sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }

  return 0LL;
}

uint64_t sub_100014C10(char *__s1, const char *a2)
{
  int v4 = &qword_1000353C8;
  while (1)
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
  }

  uint64_t v5 = (uint64_t *)malloc(0x28uLL);
  if (!v5) {
    return 12LL;
  }
  int v4 = v5;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  v4[4] = (uint64_t)v6;
  if (!v6)
  {
    free(v4);
    return 12LL;
  }

  snprintf((char *)v4 + 12, 0x10uLL, "%s", __s1);
LABEL_8:
  size_t count = xpc_array_get_count((xpc_object_t)v4[4]);
  if (count)
  {
    size_t v8 = count;
    size_t v9 = 0LL;
    while (1)
    {
      string = xpc_array_get_string((xpc_object_t)v4[4], v9);
      if (!strcmp(string, a2)) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_12;
      }
    }

    sub_1000036BC( 0,  (uint64_t)"%s internal interface already present for external %s",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)string);
    return 22LL;
  }

  else
  {
LABEL_12:
    xpc_array_set_string((xpc_object_t)v4[4], 0xFFFFFFFFFFFFFFFFLL, a2);
    int v17 = *((_DWORD *)v4 + 2);
    *((_DWORD *)v4 + 2) = v17 + 1;
    if (!v17)
    {
      uint64_t *v4 = qword_1000353C8;
      qword_1000353C8 = (uint64_t)v4;
    }

    return sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }

uint64_t sub_100014D64( char *__s1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = &qword_1000353C8;
  uint64_t v11 = &qword_1000353C8;
  do
  {
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11)
    {
      sub_1000036BC(0, (uint64_t)"%s, external interface not present in settings", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0LL;
    }
  }

  while (strcmp(__s1, (const char *)v11 + 12));
  uint64_t v12 = (void *)v11[4];
  xpc_object_t v13 = xpc_array_create(0LL, 0LL);
  size_t count = xpc_array_get_count(v12);
  if (count)
  {
    size_t v15 = count;
    char v16 = 0;
    size_t v17 = 0LL;
    size_t v36 = count - 1;
LABEL_6:
    size_t v18 = v17;
    do
    {
      string = xpc_array_get_string(v12, v18);
      if (!strcmp(string, a2))
      {
        size_t v17 = v18 + 1;
        char v16 = 1;
        if (v36 != v18) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }

      xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v18;
    }

    while (v15 != v18);
    if ((v16 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_14:
    xpc_release(v12);
    v11[4] = (uint64_t)v13;
    sub_1000036BC( 2u,  (uint64_t)"found internal interface %s for external interface %s",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)a2);
    int v27 = *((_DWORD *)v11 + 2);
    if (!v27) {
      sub_100023264();
    }
    int v28 = v27 - 1;
    *((_DWORD *)v11 + 2) = v28;
    if (!v28)
    {
      *uint64_t v10 = *v11;
      xpc_release((xpc_object_t)v11[4]);
      free(v11);
    }

    return sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }

  else
  {
LABEL_19:
    xpc_release(v13);
    sub_1000036BC( 0,  (uint64_t)"%s internal interface not present for %s external interface",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)a2);
    return 22LL;
  }

uint64_t sub_100014F2C(__int16 a1, __int16 a2)
{
  if (dword_100035460) {
    BOOL v2 = dword_100035464 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = (unsigned __int16)word_10003546A;
    int v5 = (unsigned __int16)word_100035468;
    word_100035468 = a1;
    word_10003546A = a2;
    sub_1000199A4();
    if (v5 != (unsigned __int16)word_100035468 || v4 != (unsigned __int16)word_10003546A)
    {
      sub_100014238();
      sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
    }
  }

  return v3;
}

_WORD *sub_100014FC8(_WORD *result, _WORD *a2)
{
  if (result) {
    *uint64_t result = word_100035468;
  }
  if (a2) {
    *a2 = word_10003546A;
  }
  return result;
}

uint64_t sub_100014FF4(uint64_t result)
{
  if ((result & 0x80000000) != 0) {
    sub_10002328C();
  }
  int v1 = dword_100035380;
  dword_100035380 = result;
  if (v1 != (_DWORD)result) {
    return sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }
  return result;
}

uint64_t sub_100015030()
{
  return dword_100035380;
}

uint64_t sub_10001503C(int a1, int a2)
{
  if (!a2) {
    sub_1000232DC();
  }
  BOOL v2 = &dword_100035368[a1];
  int v4 = v2[7];
  uint64_t v3 = v2 + 7;
  int v5 = v4 + a2;
  if (!(v4 + a2)) {
    sub_100023304();
  }
  *uint64_t v3 = v5;
  return sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
}

uint64_t sub_10001508C(int a1, unsigned int a2)
{
  BOOL v2 = &dword_100035368[a1];
  int v5 = v2[7];
  uint64_t v3 = (unsigned int *)(v2 + 7);
  unsigned int v4 = v5;
  if (v5)
  {
    BOOL v6 = v4 >= a2;
    unsigned int v7 = v4 - a2;
    if (!v6) {
      unsigned int v7 = 0;
    }
    *uint64_t v3 = v7;
    sub_1000142E0((const __SCDynamicStore *)qword_100034F50);
  }

  return 0LL;
}

uint64_t sub_1000150DC()
{
  uint64_t v0 = 0LL;
  LODWORD(result) = 0;
  do
  {
    uint64_t result = (dword_100035368[v0 + 7] + result);
    ++v0;
  }

  while (v0 != 7);
  return result;
}

BOOL sub_100015108()
{
  if (!dword_100035380) {
    return 1LL;
  }
  uint64_t v0 = 0LL;
  int v1 = 0;
  do
  {
    v1 += dword_100035368[v0 + 7];
    ++v0;
  }

  while (v0 != 7);
  return v1 < dword_100035380;
}

uint64_t sub_100015150(char *a1)
{
  BOOL v2 = off_100034CB0[0];
  uint64_t v3 = &qword_1000353C8;
  do
  {
    uint64_t v3 = (uint64_t *)*v3;
    if (!v3) {
      return 6LL;
    }
  }

  while (!strncmp((const char *)v3 + 12, v2, 0x10uLL));
  snprintf(a1, 0x10uLL, "%s", (const char *)v3 + 12);
  return 0LL;
}

uint64_t sub_1000151E4(int a1, void *a2, void *a3)
{
  if (!a2 || !a3) {
    sub_10002337C();
  }
  if (!qword_1000353C0) {
    sub_1000233A4();
  }
  if (a1 == 201) {
    int v5 = @"Shared_Net_Address";
  }
  else {
    int v5 = @"Host_Net_Address";
  }
  if (a1 == 201) {
    BOOL v6 = @"Shared_Net_Mask";
  }
  else {
    BOOL v6 = @"Host_Net_Mask";
  }
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, v5);
  size_t v8 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, v6);
  uint64_t result = 19LL;
  if (Value)
  {
    if (v8)
    {
      CFStringGetCString(Value, buffer, 16LL, 0x600u);
      CFStringGetCString(v8, v10, 16LL, 0x600u);
      inet_pton(2, buffer, a2);
      inet_pton(2, v10, a3);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100015304(int a1, const void *a2, const void *a3)
{
  if (!a2 || !a3) {
    sub_1000233CC();
  }
  if (!qword_1000353C0) {
    sub_1000233F4();
  }
  inet_ntop(2, a2, cStr, 0x10u);
  inet_ntop(2, a3, v29, 0x10u);
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, v29, 0x600u);
  CFStringRef v13 = v6;
  if (v5) {
    BOOL v14 = v6 == 0LL;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if (a1 == 201) {
      size_t v17 = @"Shared_Net_Address";
    }
    else {
      size_t v17 = @"Host_Net_Address";
    }
    if (a1 == 201) {
      size_t v18 = @"Shared_Net_Mask";
    }
    else {
      size_t v18 = @"Host_Net_Mask";
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, v17, v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, v18, v13);
    uint64_t v19 = (const void *)qword_1000353C0;
    uid_t v20 = geteuid();
    gid_t v21 = getgid();
    uint64_t v15 = sub_10000EFF0(v19, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v20, v21, 416LL, 0);
    if ((_DWORD)v15) {
      sub_1000036BC(0, (uint64_t)"plist write failed for vmnet subnet", v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_21:
    CFRelease(v5);
    if (!v13) {
      return v15;
    }
    goto LABEL_11;
  }

  sub_1000036BC(0, (uint64_t)"unable to set subnet information in plist", v7, v8, v9, v10, v11, v12, v28);
  uint64_t v15 = 12LL;
  if (v5) {
    goto LABEL_21;
  }
  if (v13) {
LABEL_11:
  }
    CFRelease(v13);
  return v15;
}

uint64_t sub_1000154A8(uint64_t a1)
{
  if (!qword_1000353C0) {
    sub_10002341C();
  }
  if (!qword_1000353B8) {
    sub_100023444();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (Count < 1) {
    return 22LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v4);
    if (ValueAtIndex)
    {
      CFStringRef v6 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        Value = (const __CFData *)CFDictionaryGetValue(v6, @"MAC_IOUE");
        if (Value)
        {
          uint64_t v9 = Value;
          CFTypeID v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }

    if (v3 == ++v4) {
      return 22LL;
    }
  }

  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v6);
  if (!MutableCopy)
  {
    uint64_t v13 = 12LL;
    uint64_t v25 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_21;
  }

  uint64_t v22 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_IOUE_USED", kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v4, v22);
  CFRelease(v22);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_IOUE_ARRAY", (const void *)qword_1000353B8);
  uint64_t v23 = (const void *)qword_1000353C0;
  LODWORD(v22) = geteuid();
  gid_t v24 = getgid();
  uint64_t v13 = sub_10000EFF0(v23, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v22, v24, 416LL, 0);
  if ((_DWORD)v13)
  {
    uint64_t v25 = "plist write failed for IOUE address";
LABEL_21:
    sub_1000036BC(0, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v26);
  }

  return v13;
}

uint64_t sub_100015674(uint64_t a1)
{
  if (!qword_1000353C0) {
    sub_10002346C();
  }
  if (!qword_1000353B8) {
    sub_100023494();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (Count < 1)
  {
LABEL_18:
    sub_10001596C((unsigned __int16 *)bytes, 0LL);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v21 = Mutable;
      CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, bytes, 6LL);
      if (v22)
      {
        CFDataRef v29 = v22;
        CFDictionarySetValue(v21, @"MAC_IOUE", v22);
        CFRelease(v29);
        *(_DWORD *)a1 = *(_DWORD *)bytes;
        *(_WORD *)(a1 + 4) = v48;
        CFDictionarySetValue(v21, @"MAC_IOUE_USED", kCFBooleanTrue);
        CFArrayAppendValue((CFMutableArrayRef)qword_1000353B8, v21);
        uint64_t v30 = v21;
        goto LABEL_21;
      }

      sub_1000036BC(0, (uint64_t)"CFDataCreate() failed", v23, v24, v25, v26, v27, v28, v46);
      CFRelease(v21);
      return 12LL;
    }

    CFNumberRef v41 = "CFDictionaryCreateMutable() failed";
LABEL_24:
    sub_1000036BC(0, (uint64_t)v41, v15, v16, v17, v18, v19, v20, v46);
    return 12LL;
  }

  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v4);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(ValueAtIndex, @"MAC_IOUE_USED");
        CFTypeID v8 = CFBooleanGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == v8 && Value != kCFBooleanTrue)
          {
            CFTypeID v10 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"MAC_IOUE");
            CFTypeID v11 = CFDataGetTypeID();
            if (v10)
            {
              if (CFGetTypeID(v10) == v11)
              {
                BytePtr = CFDataGetBytePtr(v10);
                if (BytePtr)
                {
                  uint64_t v13 = (uint64_t)BytePtr;
                }
              }
            }
          }
        }
      }
    }

    if (v3 == ++v4) {
      goto LABEL_18;
    }
  }

  int v43 = *(_DWORD *)v13;
  *(_WORD *)(a1 + 4) = *(_WORD *)(v13 + 4);
  *(_DWORD *)a1 = v43;
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, ValueAtIndex);
  if (!MutableCopy)
  {
    CFNumberRef v41 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_24;
  }

  uint64_t v45 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_IOUE_USED", kCFBooleanTrue);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v4, v45);
  uint64_t v30 = v45;
LABEL_21:
  CFRelease(v30);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_IOUE_ARRAY", (const void *)qword_1000353B8);
  uint64_t v31 = (const void *)qword_1000353C0;
  uid_t v32 = geteuid();
  gid_t v33 = getgid();
  uint64_t v40 = sub_10000EFF0(v31, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v32, v33, 416LL, 0);
  if ((_DWORD)v40) {
    sub_1000036BC(0, (uint64_t)"plist write failed for IOUE address", v34, v35, v36, v37, v38, v39, v46);
  }
  return v40;
}

uint64_t sub_10001596C(unsigned __int16 *a1, const void *a2)
{
  if (!qword_1000353B0) {
    sub_1000234BC();
  }
  unsigned __int8 Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  if (!qword_1000353B8) {
    sub_1000234E4();
  }
  unsigned __int8 v5 = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  int v6 = Count;
  int v24 = Count;
  int v25 = v5;
  uint64_t v7 = Count;
  uint64_t v8 = v5;
  do
  {
    if (a2)
    {
      CC_MD5(a2, 0x10u, md);
      *(_DWORD *)a1 = *(_DWORD *)md;
      a1[2] = v27;
      goto LABEL_7;
    }

    while (1)
    {
      while (1)
      {
        arc4random_buf(a1, 6uLL);
LABEL_7:
        *(_BYTE *)a1 = *(_BYTE *)a1 & 0xFC | 2;
        if (a2) {
          return 22LL;
        }
      }

      LODWORD(v9) = 0;
      if (v6)
      {
        CFIndex v9 = 0LL;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v9);
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex)
          {
            if (CFGetTypeID(ValueAtIndex) == TypeID)
            {
              CFBooleanRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"MAC_ADDRESS");
              CFTypeID v13 = CFDataGetTypeID();
              if (Value)
              {
                if (CFGetTypeID(Value) == v13)
                {
                  BytePtr = CFDataGetBytePtr(Value);
                  if (BytePtr)
                  {
                  }
                }
              }
            }
          }

          if (v7 == ++v9) {
            goto LABEL_25;
          }
        }

        int v6 = v24;
      }

      if ((_DWORD)v9 == v6) {
        break;
      }
      int v6 = v24;
      if (a2) {
        return 22LL;
      }
    }

uint64_t sub_100015C08(uint64_t a1)
{
  if (!qword_1000353C0) {
    sub_10002350C();
  }
  if (!qword_1000353B0) {
    sub_100023534();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  if (Count < 1) {
    return 22LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v4);
    if (ValueAtIndex)
    {
      int v6 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        CFBooleanRef Value = (const __CFData *)CFDictionaryGetValue(v6, @"MAC_ADDRESS");
        if (Value)
        {
          CFIndex v9 = Value;
          CFTypeID v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }

    if (v3 == ++v4) {
      return 22LL;
    }
  }

  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v6);
  if (!MutableCopy)
  {
    uint64_t v13 = 12LL;
    int v25 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_21;
  }

  CFDataRef v22 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_USED", kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v4, v22);
  CFRelease(v22);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_ARRAY", (const void *)qword_1000353B0);
  uint64_t v23 = (const void *)qword_1000353C0;
  LODWORD(v22) = geteuid();
  gid_t v24 = getgid();
  uint64_t v13 = sub_10000EFF0(v23, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v22, v24, 416LL, 0);
  if ((_DWORD)v13)
  {
    int v25 = "plist write failed for IOUE address";
LABEL_21:
    sub_1000036BC(0, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v26);
  }

  return v13;
}

uint64_t sub_100015DD4(const unsigned __int8 *a1, void *a2)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  uint64_t v5 = Count;
  if (a1 && Count)
  {
    uuid_unparse(a1, out);
    int v6 = kCFAllocatorDefault;
    CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v7)
    {
      CFStringRef v14 = v7;
      if (v5 < 1) {
        goto LABEL_16;
      }
      CFTypeID v107 = (unsigned __int8 *)a1;
      CFIndex v15 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v15);
        if (ValueAtIndex)
        {
          uint64_t v17 = ValueAtIndex;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (CFGetTypeID(v17) == TypeID)
          {
            CFBooleanRef Value = CFDictionaryGetValue(v17, @"UUID_MAC");
            if (Value)
            {
              uint64_t v20 = Value;
              CFTypeID v21 = CFStringGetTypeID();
              if (CFGetTypeID(v20) == v21)
              {
                if (CFEqual(v20, v14)) {
                  break;
                }
              }
            }
          }
        }

        if (v5 == ++v15)
        {
          a1 = v107;
          goto LABEL_16;
        }
      }

      CFBooleanRef v68 = (CFBooleanRef)CFDictionaryGetValue(v17, @"MAC_USED");
      CFTypeID v69 = CFBooleanGetTypeID();
      if (v68)
      {
        CFBooleanRef v76 = kCFBooleanTrue;
        if (CFGetTypeID(v68) == v69 && v68 == kCFBooleanTrue)
        {
          sub_1000036BC( 0,  (uint64_t)"MAC address associated with UUID %s is already being used",  v70,  v71,  v72,  v73,  v74,  v75,  (uint64_t)out);
LABEL_90:
          uint64_t v28 = 0LL;
          uint64_t v29 = 22LL;
          goto LABEL_86;
        }
      }

      else
      {
        CFBooleanRef v76 = kCFBooleanTrue;
      }

      uint64_t v88 = CFDictionaryGetValue(v17, @"MAC_ADDRESS");
      if (!v88 || (uint64_t v95 = v88, v96 = CFDataGetTypeID(), CFGetTypeID(v95) != v96))
      {
        sub_1000036BC(0, (uint64_t)"no MAC address for uuid", v89, v90, v91, v92, v93, v94, v104);
        goto LABEL_90;
      }

      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v17);
      uint64_t v28 = MutableCopy;
      if (!MutableCopy)
      {
        uint64_t v67 = "CFDictionaryCreateMutableCopy() failed";
        goto LABEL_85;
      }

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFMutableDictionaryRef MutableCopy = CFDateCreate(kCFAllocatorDefault, Current);
      if (MutableCopy)
      {
        CFMutableDictionaryRef v98 = MutableCopy;
        CFDictionarySetValue(v28, @"MAC_TIME_USED", MutableCopy);
        CFDictionarySetValue(v28, @"MAC_USED", v76);
        CFRelease(v98);
        CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v15, v28);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_ARRAY", (const void *)qword_1000353B0);
        CFIndex v99 = (const void *)qword_1000353C0;
        uid_t v100 = geteuid();
        gid_t v101 = getgid();
        uint64_t v102 = sub_10000EFF0( v99,  "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist",  v100,  v101,  416LL,  0);
        if (!(_DWORD)v102)
        {
          uint64_t v29 = sub_100016534(a2, (CFDataRef)v95, v107);
          goto LABEL_86;
        }

        uint64_t v29 = v102;
        goto LABEL_72;
      }

      goto LABEL_84;
    }

LABEL_35:
    sub_1000036BC(v7, (uint64_t)"CFStringCreateWithCString() failed", v8, v9, v10, v11, v12, v13, v104);
    return 12LL;
  }

  if (!a1)
  {
    uuid_generate(uu);
    uuid_unparse(uu, out);
    int v6 = kCFAllocatorDefault;
    CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v30)
    {
      CFStringRef v14 = v30;
      do
      {
        if (v5 < 1)
        {
          CFIndex v31 = 0LL;
        }

        else
        {
          CFIndex v31 = 0LL;
          while (1)
          {
            uid_t v32 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v31);
            if (v32)
            {
              gid_t v33 = v32;
              CFTypeID v34 = CFDictionaryGetTypeID();
              if (CFGetTypeID(v33) == v34)
              {
                uint64_t v35 = CFDictionaryGetValue(v33, @"UUID_MAC");
                if (v35)
                {
                  uint64_t v36 = v35;
                  CFTypeID v37 = CFStringGetTypeID();
                  if (CFGetTypeID(v36) == v37)
                  {
                    if (CFEqual(v36, v14)) {
                      break;
                    }
                  }
                }
              }
            }

            if (v5 == ++v31) {
              goto LABEL_32;
            }
          }
        }

        if (v5 == v31)
        {
LABEL_32:
          if (!sub_10001596C((unsigned __int16 *)bytes, uu))
          {
            int v38 = 1;
            a1 = 0LL;
            goto LABEL_38;
          }
        }

        CFRelease(v14);
        uuid_generate(uu);
        uuid_unparse(uu, out);
        CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
      }

      while (v14);
    }

    LOBYTE(v7) = 0;
    goto LABEL_35;
  }

  uuid_unparse(a1, out);
  int v6 = kCFAllocatorDefault;
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
  if (!v7) {
    goto LABEL_35;
  }
  CFStringRef v14 = v7;
LABEL_16:
  if (sub_10001596C((unsigned __int16 *)bytes, a1))
  {
    sub_1000036BC(0, (uint64_t)"mac address conflict with given uuid", v22, v23, v24, v25, v26, v27, v104);
    uint64_t v28 = 0LL;
    uint64_t v29 = 22LL;
    goto LABEL_86;
  }

  int v38 = 0;
LABEL_38:
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v6, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v28 = MutableCopy;
  if (!MutableCopy)
  {
    uint64_t v67 = "CFDictionaryCreateMutable() failed";
LABEL_85:
    sub_1000036BC(MutableCopy, (uint64_t)v67, v40, v41, v42, v43, v44, v45, v104);
    uint64_t v29 = 12LL;
    goto LABEL_86;
  }

  CFDictionarySetValue(MutableCopy, @"UUID_MAC", v14);
  CFMutableDictionaryRef MutableCopy = CFDataCreate(v6, bytes, 6LL);
  if (!MutableCopy)
  {
    uint64_t v67 = "CFDataCreate() failed";
    goto LABEL_85;
  }

  CFMutableDictionaryRef v46 = MutableCopy;
  CFDictionarySetValue(v28, @"MAC_ADDRESS", MutableCopy);
  CFRelease(v46);
  CFAbsoluteTime v47 = CFAbsoluteTimeGetCurrent();
  CFMutableDictionaryRef MutableCopy = CFDateCreate(v6, v47);
  if (!MutableCopy)
  {
LABEL_84:
    uint64_t v67 = "CFDateCreate() failed";
    goto LABEL_85;
  }

  CFMutableDictionaryRef v48 = MutableCopy;
  CFDictionarySetValue(v28, @"MAC_TIME_USED", MutableCopy);
  CFRelease(v48);
  CFDictionarySetValue(v28, @"MAC_USED", kCFBooleanTrue);
  if (v5 < 138)
  {
    CFArrayAppendValue((CFMutableArrayRef)qword_1000353B0, v28);
    goto LABEL_71;
  }

  int v105 = v38;
  BOOL v108 = a1;
  CFBooleanRef v106 = a2;
  CFIndex v49 = 0LL;
  CFIndex v50 = 0LL;
  uint64_t v51 = 0LL;
  while (1)
  {
    uint64_t v52 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v49);
    if (v52)
    {
      uint64_t v59 = v52;
      CFTypeID v60 = CFDictionaryGetTypeID();
      if (CFGetTypeID(v59) == v60)
      {
        CFBooleanRef v61 = (CFBooleanRef)CFDictionaryGetValue(v59, @"MAC_USED");
        CFTypeID v62 = CFBooleanGetTypeID();
        if (!v61) {
          break;
        }
        if (CFGetTypeID(v61) != v62 || v61 != kCFBooleanTrue) {
          break;
        }
      }
    }

LABEL_57:
    if (v5 == ++v49)
    {
      CFIndex v49 = v5;
      goto LABEL_67;
    }
  }

  int v64 = (const __CFDate *)CFDictionaryGetValue(v59, @"MAC_TIME_USED");
  if (v64)
  {
    uint64_t v65 = v64;
    CFTypeID v66 = CFDateGetTypeID();
    if (CFGetTypeID(v65) == v66)
    {
      if (v51)
      {
        if (CFDateCompare(v51, v65, 0LL) == kCFCompareGreaterThan)
        {
          uint64_t v51 = v65;
          CFIndex v50 = v49;
        }
      }

      else
      {
        uint64_t v51 = v65;
        CFIndex v50 = v49;
      }

      goto LABEL_57;
    }
  }

  CFIndex v50 = v49;
LABEL_67:
  a2 = v106;
  if (!v51 && v5 == v49)
  {
    sub_1000036BC(0, (uint64_t)"vm interface create exceeded limit", v53, v54, v55, v56, v57, v58, v104);
    uint64_t v29 = 19LL;
    goto LABEL_86;
  }

  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v50, v28);
  a1 = v108;
  int v38 = v105;
LABEL_71:
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, @"MAC_ARRAY", (const void *)qword_1000353B0);
  uint64_t v77 = (const void *)qword_1000353C0;
  uid_t v78 = geteuid();
  gid_t v79 = getgid();
  uint64_t v29 = sub_10000EFF0(v77, "/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v78, v79, 416LL, 0);
  if ((_DWORD)v29)
  {
LABEL_72:
    sub_1000036BC(0, (uint64_t)"plist write failed for MAC address", v80, v81, v82, v83, v84, v85, v104);
    goto LABEL_86;
  }

  uint64_t v86 = (const __CFData *)CFDictionaryGetValue(v28, @"MAC_ADDRESS");
  if (v38) {
    uint64_t v87 = uu;
  }
  else {
    uint64_t v87 = (unsigned __int8 *)a1;
  }
  sub_100016534(a2, v86, v87);
LABEL_86:
  CFRelease(v14);
  if (v28) {
    CFRelease(v28);
  }
  return v29;
}

    CFRelease(v50);
LABEL_64:
    uint64_t v42 = v166;
    goto LABEL_73;
  }

  sub_1000036BC(2u, (uint64_t)"no internal interfaces to start dhcp", a3, a4, a5, a6, a7, a8, v163);
  return 0LL;
}

            PFUserRelease(v37, 0LL);
            goto LABEL_58;
          }

          goto LABEL_89;
        }

uint64_t sub_100016534(void *a1, CFDataRef theData, _OWORD *a3)
{
  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr)
  {
    snprintf( __str,  0x14uLL,  "%02x:%02x:%02x:%02x:%02x:%02x",  *BytePtr,  BytePtr[1],  BytePtr[2],  BytePtr[3],  BytePtr[4],  BytePtr[5]);
    xpc_dictionary_set_string(a1, off_100034BB0[0], __str);
    *(_OWORD *)uuid = *a3;
    xpc_dictionary_set_uuid(a1, off_100034BA8[0], uuid);
    return 0LL;
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"CFDataGetBytePtr() failed", v6, v7, v8, v9, v10, v11, v13);
    return 12LL;
  }

uint64_t sub_10001661C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)result > 35)
  {
    switch((_DWORD)result)
    {
      case '$':
        return 2LL;
      case 'P':
        return 3LL;
      case '-':
        return 1LL;
    }

    goto LABEL_14;
  }

  if (!(_DWORD)result) {
    return result;
  }
  if ((_DWORD)result == 4) {
    return 5LL;
  }
  if ((_DWORD)result != 19)
  {
LABEL_14:
    sub_1000036BC(0, (uint64_t)"errnum %d has no matching netrbReason value", a3, a4, a5, a6, a7, a8, result);
    return 6LL;
  }

  return 4LL;
}

const void *sub_1000166A8(const void *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!a1) {
    return 0LL;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0LL;
}

uint64_t sub_1000166E8(const void *a1)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 22LL;
  }
  CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"ForwardedPorts");
  uint64_t result = 0LL;
  if (!Value || dword_100035464) {
    return result;
  }
  CFTypeID v5 = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != v5) {
    return 22LL;
  }
  if (CFArrayGetCount((CFArrayRef)Value) < 1) {
    return 22LL;
  }
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, 0LL);
  if (!ValueAtIndex) {
    return 22LL;
  }
  uint64_t v7 = ValueAtIndex;
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (CFGetTypeID(v7) != v8) {
    return 22LL;
  }
  uint64_t v9 = CFDictionaryGetValue((CFDictionaryRef)v7, @"Low");
  uint64_t v10 = CFDictionaryGetValue((CFDictionaryRef)v7, @"High");
  if (!v9) {
    return 22LL;
  }
  uint64_t v11 = v10;
  CFTypeID v12 = CFNumberGetTypeID();
  CFTypeID v13 = CFGetTypeID(v9);
  uint64_t result = 22LL;
  if (v13 == v12 && v11)
  {
    if (sub_1000166A8(v11)
      && CFNumberGetValue((CFNumberRef)v9, kCFNumberShortType, &valuePtr)
      && CFNumberGetValue((CFNumberRef)v11, kCFNumberShortType, &v14))
    {
      word_100035468 = valuePtr;
      word_10003546A = v14;
      sub_1000199A4();
      return 0LL;
    }

    return 22LL;
  }

  return result;
}

__CFDictionary *sub_100016864(int a1)
{
  int v14 = 3;
  int valuePtr = 1020;
  if ((qword_100035370 & 0xFFFFFFFC) == 0x3FC) {
    int valuePtr = qword_100035370;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFDictionarySetValue(Mutable, @"State", v3);
      CFRelease(v4);
    }

    CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberIntType, &dword_10003536C);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(Mutable, @"UState", v5);
      CFRelease(v6);
    }

    CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberIntType, &v14);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFDictionarySetValue(Mutable, @"Version", v7);
      CFRelease(v8);
    }

    if (!dword_100035464)
    {
      if ((unsigned __int16)word_100035468 | (unsigned __int16)word_10003546A)
      {
        CFMutableArrayRef v9 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v11)
          {
            CFTypeID v12 = v11;
            sub_10000EF8C(v11, @"Low", word_100035468);
            sub_10000EF8C(v12, @"High", word_10003546A);
            CFArrayAppendValue(v10, v12);
            CFRelease(v12);
            CFDictionarySetValue(Mutable, @"ForwardedPorts", v10);
          }

          CFRelease(v10);
        }
      }
    }
  }

  return Mutable;
}

uint64_t sub_100016A70(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 101) {
    sub_100023584();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_10002355C();
  }
  *(void *)(a1 + 592) = sub_100016ABC;
  *(void *)(a1 + 600) = sub_100016B10;
  *(void *)(a1 + 632) = 0LL;
  return 0LL;
}

uint64_t sub_100016ABC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a2 + 288) != 101) {
    sub_1000235AC();
  }
  sub_1000036BC(0, (uint64_t)"%s started", a3, a4, a5, a6, a7, a8, a1);
  *(_DWORD *)(a2 + 12) = 1;
  return 0LL;
}

double sub_100016B10(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 101) {
    sub_1000235D4();
  }
  *(void *)(a1 + 632) = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 592) = 0u;
  return result;
}

uint64_t sub_100016B40()
{
  if (!dword_100034D38) {
    return 0LL;
  }
  int v48 = 0;
  CFStringRef v0 = CFStringCreateWithCString(kCFAllocatorDefault, "com.apple.MobileInternetSharing", 0x600u);
  if (v0)
  {
    CFStringRef v7 = v0;
    CFNumberRef v8 = (const __CFDictionary *)sub_10000F190("/Library/Preferences/SystemConfiguration/bootpd.plist", &v48, 0);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v8 && CFGetTypeID(v8) == TypeID)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v8);
      uint64_t v23 = MutableCopy;
      if (MutableCopy)
      {
        CFMutableArrayRef v24 = sub_100017D18(MutableCopy, @"Subnets");
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = sub_100017D18(v23, @"dhcp_enabled");
          uint64_t v27 = sub_100017D18(v23, @"ignore_allow_deny");
          uint64_t v28 = sub_100017D18(v23, @"detect_other_dhcp_server");
          uint64_t v29 = sub_100017D18(v23, @"ipv6_only_preferred");
          CFIndex Count = CFArrayGetCount(v25);
          if (Count >= 1)
          {
            CFIndex v31 = Count;
            char v44 = 0;
            CFMutableDictionaryRef v46 = v27;
            CFAbsoluteTime v47 = v26;
            uint64_t v45 = v28;
            while (2)
            {
              CFIndex v32 = 0LL;
              while (1)
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v25, v32);
                CFTypeID v34 = CFDictionaryGetTypeID();
                if (ValueAtIndex)
                {
                  if (CFGetTypeID(ValueAtIndex) == v34)
                  {
                    CFBooleanRef Value = CFDictionaryGetValue(ValueAtIndex, @"_creator");
                    CFTypeID v36 = CFStringGetTypeID();
                    if (Value)
                    {
                      if (CFGetTypeID(Value) == v36 && CFEqual(Value, v7)) {
                        break;
                      }
                    }
                  }
                }

                if (v31 == ++v32)
                {
                  uint64_t v27 = v46;
                  uint64_t v26 = v47;
                  uint64_t v28 = v45;
                  if ((v44 & 1) == 0) {
                    goto LABEL_38;
                  }
                  goto LABEL_37;
                }
              }

              CFTypeID v37 = CFDictionaryGetValue(ValueAtIndex, @"interface");
              CFTypeID v38 = CFStringGetTypeID();
              if (v37 && CFGetTypeID(v37) == v38)
              {
                uint64_t v26 = v47;
                sub_100017D84(v47, v37);
                uint64_t v27 = v46;
                sub_100017D84(v46, v37);
                sub_100017D84(v45, v37);
                sub_100017D84(v29, v37);
                CFIndex v39 = v32;
                uint64_t v28 = v45;
                CFArrayRemoveValueAtIndex(v25, v39);
                CFIndex v31 = CFArrayGetCount(v25);
                char v44 = 1;
                if (v31 > 0) {
                  continue;
                }
LABEL_37:
                sub_100017E14(v23, @"Subnets", v25, 1);
                sub_100017E14(v23, @"dhcp_enabled", v26, 0);
                sub_100017E14(v23, @"ignore_allow_deny", v27, 1);
                sub_100017E14(v23, @"detect_other_dhcp_server", v28, 0);
                sub_100017E14(v23, @"ipv6_only_preferred", v29, 1);
                uid_t v41 = geteuid();
                gid_t v42 = getgid();
                int v48 = sub_10000EFF0(v23, "/Library/Preferences/SystemConfiguration/bootpd.plist", v41, v42, 420LL, 0);
                sub_100017AF8();
                goto LABEL_38;
              }

              break;
            }

            unlink("/Library/Preferences/SystemConfiguration/bootpd.plist");
            uint64_t v27 = v46;
            uint64_t v26 = v47;
            uint64_t v28 = v45;
          }

uint64_t sub_100016F48()
{
  CFStringRef v0 = (const __CFDictionary *)sub_10000F190("/Library/Preferences/SystemConfiguration/bootpd.plist", &v11, 0);
  if (!v0) {
    return 1LL;
  }
  uint64_t v1 = v0;
  CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(v0, @"bootp_enabled");
  if (Value) {
    BOOL v3 = Value == kCFBooleanFalse;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    && ((uint64_t v4 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"dhcp_enabled")) == 0LL || v4 == kCFBooleanFalse)
    && ((uint64_t v5 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"netboot_enabled")) == 0LL || v5 == kCFBooleanFalse)
    && ((uint64_t v6 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"old_netboot_enabled")) == 0LL
     || v6 == kCFBooleanFalse))
  {
    CFBooleanRef v9 = (CFBooleanRef)CFDictionaryGetValue(v1, @"relay_enabled");
    if (v9) {
      BOOL v10 = v9 == kCFBooleanFalse;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v7 = v10;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  CFRelease(v1);
  return v7;
}

void sub_100017034()
{
  if (byte_1000353D0 == 1) {
    byte_1000353D0 = 0;
  }
}

uint64_t sub_10001704C()
{
  if (dword_1000353D4 < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2LL;
    goto LABEL_5;
  }

  if (!dword_1000353D4)
  {
    if (!dword_100034D38) {
      return 0LL;
    }
    if (access("/usr/libexec/bootpd", 0))
    {
      uint64_t v0 = *__error();
      sub_1000036BC(0, (uint64_t)"%s not available", v9, v10, v11, v12, v13, v14, (uint64_t)"/usr/libexec/bootpd");
      if (!(_DWORD)v0) {
        goto LABEL_3;
      }
    }

    else
    {
      if (dword_100034D4C == -1)
      {
        if (notify_register_dispatch( DHCPSDisabledInterfacesNotificationKey,  &dword_100034D4C,  (dispatch_queue_t)qword_100035470,  &stru_100030FA8))
        {
          sub_1000036BC( 0,  (uint64_t)"notify_register_dispatch() failed for disabled interfaces",  v22,  v23,  v24,  v25,  v26,  v27,  v34);
          sub_1000036BC(0, (uint64_t)"monitoring disabled interfaces failed", v28, v29, v30, v31, v32, v33, v35);
          int v1 = -1;
          uint64_t v0 = 12LL;
          goto LABEL_5;
        }
      }

      else
      {
        sub_1000036BC(2u, (uint64_t)"dhcp disabled monitoring already setup", v3, v4, v5, v6, v7, v8, v34);
      }

      uint64_t v15 = sub_10000F4D8((uint64_t)@"com.apple.bootpd", (uint64_t)"bootpd", 1LL);
      if (!(_DWORD)v15) {
        goto LABEL_3;
      }
      uint64_t v0 = v15;
      sub_1000036BC(0, (uint64_t)"unable to load bootpd job", v16, v17, v18, v19, v20, v21, v34);
    }

    int v1 = -1;
    goto LABEL_5;
  }

uint64_t sub_1000171AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    sub_1000235FC();
  }
  if (dword_1000353D4 < 0)
  {
    sub_1000036BC(2u, (uint64_t)"%s not available", a3, a4, a5, a6, a7, a8, (uint64_t)"bootpd");
    return 19LL;
  }

  if (!dword_100034D38)
  {
    sub_1000036BC(2u, (uint64_t)"%s not enabled", a3, a4, a5, a6, a7, a8, (uint64_t)"bootpd");
    return 19LL;
  }

  if (qword_1000354D4)
  {
    int v12 = 3600;
    int __errnum = 12;
    *(_DWORD *)int valuePtr = 3600;
    uint64_t v13 = SCPreferencesCreate( 0LL,  @"com.apple.MobileInternetSharing",  @"com.apple.InternetSharing.default.plist");
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = (const __CFDictionary *)SCPreferencesGetValue(v13, @"bootpd");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (v15)
      {
        if (CFGetTypeID(v15) == TypeID)
        {
          uint64_t v17 = (const __CFNumber *)CFDictionaryGetValue(v15, @"DHCPLeaseTimeSecs");
          CFTypeID v18 = CFNumberGetTypeID();
          if (v17)
          {
            if (CFGetTypeID(v17) == v18) {
              CFNumberGetValue(v17, kCFNumberIntType, valuePtr);
            }
          }
        }
      }

      CFRelease(v14);
      int v12 = *(_DWORD *)valuePtr;
    }

    if (!*(_BYTE *)(a1 + 700) || !*(_BYTE *)(a1 + 701))
    {
LABEL_88:
      uint64_t v8 = sub_100017AF8();
      if ((_DWORD)v8) {
        return v8;
      }
      int v148 = sub_10000F328(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
      sub_1000036BC( 0,  (uint64_t)"started: [DHCP subnet=%s on %s mtu=%d <---> %s mtu=%d] max-mss=%d",  v149,  v150,  v151,  v152,  v153,  v154,  (uint64_t)v148);
      if (*(_DWORD *)(a1 + 20) == 201)
      {
        v155.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
        uint64_t v156 = inet_ntoa(v155);
        snprintf(valuePtr, 0x10uLL, "%s", v156);
        sub_1000036BC(0, (uint64_t)"  dns: %s", v157, v158, v159, v160, v161, v162, (uint64_t)valuePtr);
      }

      return 0LL;
    }

    if ((*(_DWORD *)(a1 + 20) | 2) != 0xCB) {
      sub_100023624();
    }
    int v19 = *(_DWORD *)(a1 + 1128);
    int v20 = *(_DWORD *)(a2 + 1264);
    uint64_t v21 = (const __CFDictionary *)sub_10000F190("/Library/Preferences/SystemConfiguration/bootpd.plist", &__errnum, 0);
    CFTypeID v22 = CFDictionaryGetTypeID();
    if (v21 && CFGetTypeID(v21) == v22) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v21);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }
    uint64_t v30 = MutableCopy;
    if (!MutableCopy)
    {
      sub_1000036BC(0, (uint64_t)"CFDictionaryCreateMutable/Copy() failed", v24, v25, v26, v27, v28, v29, v163);
      uint64_t v32 = 0LL;
      goto LABEL_82;
    }

    if (v19 == 502) {
      CFMutableArrayRef v31 = 0LL;
    }
    else {
      CFMutableArrayRef v31 = sub_100017D18(MutableCopy, @"Subnets");
    }
    xpc_object_t value = sub_100017D18(v30, @"dhcp_enabled");
    CFNumberRef cf = sub_100017D18(v30, @"ignore_allow_deny");
    __int128 v166 = sub_100017D18(v30, @"detect_other_dhcp_server");
    uint64_t v32 = sub_100017D18(v30, @"ipv6_only_preferred");
    if ((*(_BYTE *)(a1 + 584) & 2) != 0 && *(_DWORD *)(a1 + 20) == 201)
    {
      CFDictionarySetValue(v30, @"use_server_config_for_dhcp_options", kCFBooleanTrue);
      CFBooleanRef v33 = kCFBooleanFalse;
    }

    else
    {
      CFBooleanRef v33 = kCFBooleanFalse;
      CFDictionarySetValue(v30, @"use_server_config_for_dhcp_options", kCFBooleanFalse);
    }

    CFDictionaryRemoveValue(v30, @"dhcp_ignore_client_identifier");
    CFDictionarySetValue(v30, @"bootp_enabled", v33);
    sub_10000EEA8(value, (const char *)(a1 + 308));
    sub_10000EEA8(cf, (const char *)(a1 + 308));
    BOOL v40 = v19 == 502 || v20 == 1;
    int v41 = v40;
    if (v40)
    {
      if (!byte_100035482) {
        sub_10000EEA8(v32, (const char *)(a1 + 308));
      }
      sub_1000036BC(2u, (uint64_t)"config[%s]: dhcp_enabled", v34, v35, v36, v37, v38, v39, a1 + 308);
      BOOL v40 = v19 == 502;
      gid_t v42 = v166;
      if (v40) {
        goto LABEL_67;
      }
    }

    else
    {
      gid_t v42 = v166;
      sub_10000EEA8(v166, (const char *)(a1 + 308));
      sub_1000036BC(2u, (uint64_t)"config[%s]: dhcp_enabled", v43, v44, v45, v46, v47, v48, a1 + 308);
    }

    int v165 = v41;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
LABEL_73:
      if (v42) {
        CFRelease(v42);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v31) {
        CFRelease(v31);
      }
      if (value) {
        CFRelease(value);
      }
      CFRelease(v30);
LABEL_82:
      if (v21) {
        CFRelease(v21);
      }
      if (v32) {
        CFRelease(v32);
      }
      uint64_t v8 = __errnum;
      if (__errnum)
      {
        uint64_t v141 = strerror(__errnum);
        sub_1000036BC(0, (uint64_t)"dhcp_config_create: %s", v142, v143, v144, v145, v146, v147, (uint64_t)v141);
        return v8;
      }

      goto LABEL_88;
    }

    CFIndex v50 = Mutable;
    uint64_t v51 = sub_10000F328(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
    sub_10000EF28(v50, @"name", v51);
    in_addr_t v52 = *(_DWORD *)(a1 + 684) & *(_DWORD *)(a1 + 680);
    v53.in_addr_t s_addr = v52;
    uint64_t v54 = inet_ntoa(v53);
    sub_10000EF28(v50, @"net_address", v54);
    v55.in_addr_t s_addr = v52;
    inet_ntoa(v55);
    sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:net_address [%s]", v56, v57, v58, v59, v60, v61, a1 + 308);
    v62.in_addr_t s_addr = *(_DWORD *)(a1 + 684);
    BOOL v63 = inet_ntoa(v62);
    sub_10000EF28(v50, @"net_mask", v63);
    v64.in_addr_t s_addr = *(_DWORD *)(a1 + 684);
    inet_ntoa(v64);
    sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:net_mask [%s]", v65, v66, v67, v68, v69, v70, a1 + 308);
    if (*(_DWORD *)(a1 + 20) == 201)
    {
      v71.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
      uint64_t v72 = inet_ntoa(v71);
      sub_10000EF28(v50, @"dhcp_router", v72);
      v73.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
      inet_ntoa(v73);
      sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:dhcp_router [%s]", v74, v75, v76, v77, v78, v79, a1 + 308);
      if (*(_DWORD *)(a1 + 20) == 201)
      {
        CFMutableArrayRef v80 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        if (!v80) {
          goto LABEL_57;
        }
        uint64_t v81 = v80;
        v82.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
        uint64_t v83 = inet_ntoa(v82);
        sub_10000EEA8(v81, v83);
        v84.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
        inet_ntoa(v84);
        sub_1000036BC( 2u,  (uint64_t)"config[%s]: Subnets:dhcp_domain_name_server [%s]",  v85,  v86,  v87,  v88,  v89,  v90,  a1 + 308);
        CFDictionarySetValue(v50, @"dhcp_domain_name_server", v81);
        CFRelease(v81);
      }
    }

    sub_10000EF28(v50, @"_creator", "com.apple.MobileInternetSharing");
    CFDictionarySetValue(v50, @"allocate", kCFBooleanTrue);
    sub_10000C204(v50, @"lease_min", v12);
    sub_10000C204(v50, @"lease_max", v12);
    sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:lease_{min,max} [%d]", v91, v92, v93, v94, v95, v96, a1 + 308);
    CFMutableArrayRef v97 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (v97)
    {
      CFMutableArrayRef v98 = v97;
      unsigned int v99 = *(_DWORD *)(a1 + 680);
      unsigned int v100 = *(_DWORD *)(a1 + 684);
      unsigned int v101 = v100 & v99;
      unsigned int v102 = *(_DWORD *)(a1 + 692);
      theArray = v31;
      if (v102 && v101 != v102)
      {
        if (v99 != v102) {
          sub_100023674();
        }
        unsigned int v104 = bswap32(v102) + 1;
      }

      else
      {
        unsigned int v103 = bswap32(v101);
        if (bswap32(v99) != v103 + 1) {
          sub_10002364C();
        }
        unsigned int v104 = v103 + 2;
      }

      int v105 = 1 << -(char)sub_10000F300(v100);
      int v106 = *(_DWORD *)(a1 + 680);
      unsigned int v107 = *(_DWORD *)(a1 + 684);
      unsigned int v108 = v107 & v106;
      unsigned int v109 = *(_DWORD *)(a1 + 696);
      if (!v109 || v105 + bswap32(v108) - 1 == bswap32(v109))
      {
        if (v105 < 4)
        {
          uint64_t v110 = sub_10000F328(v106, v107);
          sub_1000036BC(0, (uint64_t)"not enough hosts on subnet %s", v111, v112, v113, v114, v115, v116, (uint64_t)v110);
          CFRelease(v98);
          CFRelease(v50);
          int __errnum = 49;
          CFMutableArrayRef v31 = theArray;
          goto LABEL_64;
        }

        unsigned int v109 = bswap32(v105 + bswap32(v108) - 2);
      }

      in_addr_t v117 = bswap32(v104);
      v118.in_addr_t s_addr = v117;
      CFIndex v119 = inet_ntoa(v118);
      sub_10000EEA8(v98, v119);
      v120.in_addr_t s_addr = v117;
      inet_ntoa(v120);
      sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:net_range_min [%s]", v121, v122, v123, v124, v125, v126, a1 + 308);
      v127.in_addr_t s_addr = v109;
      uint64_t v128 = inet_ntoa(v127);
      sub_10000EEA8(v98, v128);
      v129.in_addr_t s_addr = v109;
      inet_ntoa(v129);
      sub_1000036BC(2u, (uint64_t)"config[%s]: Subnets:net_range_max [%s]", v130, v131, v132, v133, v134, v135, a1 + 308);
      CFDictionarySetValue(v50, @"net_range", v98);
      CFRelease(v98);
      sub_10000EF28(v50, @"interface", (char *)(a1 + 308));
      CFMutableArrayRef v31 = theArray;
      CFArrayAppendValue(theArray, v50);
      CFRelease(v50);
      CFDictionarySetValue(v30, @"Subnets", theArray);
      gid_t v42 = v166;
      int v41 = v165;
LABEL_67:
      CFDictionarySetValue(v30, @"dhcp_enabled", value);
      CFDictionarySetValue(v30, @"ignore_allow_deny", cf);
      if (v41)
      {
        if (!CFArrayGetCount(v32))
        {
LABEL_72:
          uid_t v139 = geteuid();
          gid_t v140 = getgid();
          int __errnum = sub_10000EFF0(v30, "/Library/Preferences/SystemConfiguration/bootpd.plist", v139, v140, 420LL, 0);
          goto LABEL_73;
        }

        uid_t v136 = @"ipv6_only_preferred";
        gid_t v137 = v30;
        uint64_t v138 = v32;
      }

      else
      {
        uid_t v136 = @"detect_other_dhcp_server";
        gid_t v137 = v30;
        uint64_t v138 = v42;
      }

      CFDictionarySetValue(v137, v136, v138);
      goto LABEL_72;
    }

uint64_t sub_100017AF8()
{
  pid_t v0 = sub_10000CD6C("/usr/libexec/bootpd");
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = kill(v0, 1);
  if ((_DWORD)v1)
  {
    uint64_t v2 = __error();
    uint64_t v3 = strerror(*v2);
    sub_1000036BC(0, (uint64_t)"bootpd(HUP): %s", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }

  return v1;
}

void sub_100017B64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_1000353D4 & 0x80000000) == 0)
  {
    if (dword_1000353D4 >= 2 && qword_1000354D4)
    {
      sub_100017C08(a1, a2, a3, a4, a5, a6, a7, a8, v8);
    }

    else
    {
      sub_100017C08(a1, a2, a3, a4, a5, a6, a7, a8, v8);
      if (dword_100034D4C != -1)
      {
        notify_cancel(dword_100034D4C);
        dword_100034D4C = -1;
      }
    }

    if (dword_1000353D4 >= 1) {
      --dword_1000353D4;
    }
  }

void sub_100017C08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v36 = 0;
  CFStringRef v9 = CFStringCreateWithCString(0LL, (const char *)(a1 + 308), 0x600u);
  if (v9)
  {
    CFStringRef v16 = v9;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t v24 = Mutable;
      CFArrayAppendValue(Mutable, v16);
      int v25 = sub_100017F5C(v24, &v36);
      if (v25)
      {
        uint64_t v26 = "dhcp_interface_config_remove: %s";
      }

      else
      {
        if (!v36) {
          goto LABEL_6;
        }
        pid_t v34 = sub_10000CD6C("/usr/libexec/bootpd");
        if (!v34 || !kill(v34, 1)) {
          goto LABEL_6;
        }
        int v25 = *__error();
        uint64_t v26 = "bootpd(HUP): %s";
      }

      uint64_t v27 = strerror(v25);
      sub_1000036BC(0, (uint64_t)v26, v28, v29, v30, v31, v32, v33, (uint64_t)v27);
LABEL_6:
      CFRelease(v16);
      CFRelease(v24);
      return;
    }

    sub_1000036BC(0, (uint64_t)"CFArrayCreate() failed", v18, v19, v20, v21, v22, v23, v35);
    CFRelease(v16);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"CFStringCreateWithCString() failed", v10, v11, v12, v13, v14, v15, a9);
  }

CFMutableArrayRef sub_100017D18(const __CFDictionary *a1, const void *a2)
{
  CFBooleanRef Value = (const __CFArray *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    return CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, Value);
  }
  else {
    return CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  }
}

CFArrayRef sub_100017D84(const __CFArray *result, const void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    CFIndex Count = CFArrayGetCount(result);
    v8.location = 0LL;
    v8.length = Count;
    FirstIndexOfCFBooleanRef Value = CFArrayGetFirstIndexOfValue(v3, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v6 = FirstIndexOfValue;
      CFIndex v7 = Count - 1;
      do
      {
        CFArrayRemoveValueAtIndex(v3, v6);
        v9.location = 0LL;
        v9.length = v7;
        CFIndex v6 = CFArrayGetFirstIndexOfValue(v3, v9, a2);
        --v7;
      }

      while (v6 != -1);
      return (const __CFArray *)1;
    }
  }

  return result;
}

void sub_100017E14(__CFDictionary *a1, const void *a2, CFArrayRef theArray, int a4)
{
  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      CFRange v8 = a1;
      CFRange v9 = a2;
      CFBooleanRef v10 = theArray;
    }

    else
    {
      if (a4)
      {
        CFDictionaryRemoveValue(a1, a2);
        return;
      }

      CFBooleanRef v10 = kCFBooleanFalse;
      CFRange v8 = a1;
      CFRange v9 = a2;
    }

    CFDictionarySetValue(v8, v9, v10);
  }

void sub_100017EA4(id a1, int a2)
{
  uint64_t v8 = sub_1000036BC(0, (uint64_t)"received dhcp disable notification", v2, v3, v4, v5, v6, v7, v18);
  if (dword_100034D4C == -1)
  {
    sub_1000036BC(1u, (uint64_t)"dhcp disabled interfaces monitoring already stopped", v9, v10, v11, v12, v13, v14, v20);
  }

  else
  {
    uint64_t v15 = DHCPSCopyDisabledInterfaces(v8);
    if (v15)
    {
      CFStringRef v16 = (const __CFArray *)v15;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(v16) == TypeID && CFArrayGetCount(v16))
      {
        sub_100017F5C(v16, &v19);
        if (v19) {
          sub_100017AF8();
        }
      }

      CFRelease(v16);
    }
  }

uint64_t sub_100017F5C(const __CFArray *a1, _BYTE *a2)
{
  unsigned int v48 = 0;
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v47 = a2;
  *a2 = 0;
  uint64_t v4 = (const void *)sub_10000F190("/Library/Preferences/SystemConfiguration/bootpd.plist", (int *)&v48, 0);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4) {
    return v48;
  }
  if (CFGetTypeID(v4) != TypeID)
  {
LABEL_41:
    CFRelease(v4);
    return v48;
  }

  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)v4);
  if (!MutableCopy)
  {
    sub_1000036BC(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v7, v8, v9, v10, v11, v12, v41);
    goto LABEL_41;
  }

  uint64_t v13 = MutableCopy;
  CFTypeRef v43 = v4;
  uint64_t v14 = sub_100017D18(MutableCopy, @"Subnets");
  uint64_t v15 = sub_100017D18(v13, @"dhcp_enabled");
  CFStringRef v16 = sub_100017D18(v13, @"ignore_allow_deny");
  uint64_t v17 = sub_100017D18(v13, @"detect_other_dhcp_server");
  CFNumberRef cf = v13;
  CFMutableArrayRef v18 = sub_100017D18(v13, @"ipv6_only_preferred");
  uint64_t v4 = v18;
  CFIndex v19 = Count;
  if (Count >= 1)
  {
    CFIndex v20 = 0LL;
    uint64_t v44 = v17;
    uint64_t v45 = v18;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v20);
      CFTypeID v22 = CFStringGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v22)
      {
        uint64_t v23 = v16;
        uint64_t v24 = v15;
        CFStringGetCString(ValueAtIndex, buffer, 16LL, 0x600u);
        sub_1000036BC(1u, (uint64_t)"dhcp disabled interface: %s", v25, v26, v27, v28, v29, v30, (uint64_t)buffer);
        if (v14)
        {
          CFIndex v31 = CFArrayGetCount(v14);
          if (v31 >= 1)
          {
            CFIndex v32 = v31;
            CFIndex v33 = 0LL;
            while (1)
            {
              pid_t v34 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v33);
              CFTypeID v35 = CFDictionaryGetTypeID();
              if (v34)
              {
                if (CFGetTypeID(v34) == v35)
                {
                  CFBooleanRef Value = CFDictionaryGetValue(v34, @"interface");
                  CFTypeID v37 = CFStringGetTypeID();
                  if (Value)
                  {
                    if (CFGetTypeID(Value) == v37 && CFEqual(ValueAtIndex, Value)) {
                      break;
                    }
                  }
                }
              }

              if (v32 == ++v33) {
                goto LABEL_17;
              }
            }

            CFArrayRemoveValueAtIndex(v14, v33);
            *uint64_t v47 = 1;
          }
        }

void sub_10001836C()
{
  CFTypeID v22 = 0LL;
  if (getifaddrs(&v22))
  {
    __error();
    sub_1000036BC(0, (uint64_t)"getifaddrs: %m", v0, v1, v2, v3, v4, v5, v21);
  }

  else
  {
    int v6 = socket(2, 2, 0);
    if (v6 < 0)
    {
      __error();
      sub_1000036BC(0, (uint64_t)"socket: %m", v15, v16, v17, v18, v19, v20, v21);
    }

    else
    {
      int v7 = v6;
      for (uint64_t i = v22; i; uint64_t i = i->ifa_next)
      {
        if (strnstr(i->ifa_name, "bridge", 0x10uLL))
        {
          int v32 = 0;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          *(_OWORD *)__n = 0u;
          __int128 v25 = 0u;
          *(_OWORD *)char __dst = 0u;
          strncpy(__dst, i->ifa_name, 0x10uLL);
          if (ioctl(v7, 0xC0946990uLL, __dst) != -1
            && LODWORD(__n[0])
            && !strncmp((const char *)__n + 4, "com.apple.MobileInternetSharing", LODWORD(__n[0]))
            && sub_10001891C(i->ifa_name))
          {
            sub_1000036BC( 0,  (uint64_t)"unable to destroy interface %s",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)i->ifa_name);
          }
        }
      }

      close(v7);
    }

    freeifaddrs(v22);
  }

  byte_1000353D8 = 1;
}

void sub_100018508()
{
  if (byte_1000353D8 == 1) {
    byte_1000353D8 = 0;
  }
}

uint64_t sub_100018520(char *__s1, int a2, int a3, uint64_t a4, char *a5, uint64_t a6)
{
  if (!__s1) {
    sub_10002369C();
  }
  if (!*__s1) {
    sub_1000236C4();
  }
  uint64_t v11 = &qword_1000353E0;
  while (1)
  {
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11) {
      break;
    }
  }

  if (if_nametoindex(__s1))
  {
    uint64_t v12 = sub_10001891C(__s1);
    if ((_DWORD)v12) {
      goto LABEL_38;
    }
  }

  int v19 = socket(2, 2, 0);
  if ((v19 & 0x80000000) == 0)
  {
    *(_OWORD *)char __dst = 0u;
    *(_OWORD *)uint64_t v86 = 0u;
    if ((unint64_t)__strlcpy_chk(__dst, __s1, 16LL, 16LL) <= 0xF)
    {
      in_addr v82 = __dst;
      if ((ioctl(v19, 0xC020697AuLL) & 0x80000000) == 0)
      {
        uint64_t v12 = 0LL;
        goto LABEL_19;
      }

      uint64_t v20 = "SIOCIFCREATE2: %m";
    }

    else
    {
      uint64_t v20 = "strlcpy: %m";
    }

    uint64_t v12 = *__error();
    sub_1000036BC(0, (uint64_t)v20, v27, v28, v29, v30, v31, v32, (uint64_t)v82);
LABEL_19:
    close(v19);
    if (!(_DWORD)v12) {
      goto LABEL_20;
    }
    goto LABEL_38;
  }

  uint64_t v12 = *__error();
  sub_1000036BC(0, (uint64_t)"socket: %m", v21, v22, v23, v24, v25, v26, (uint64_t)v82);
  if (v19 != -1) {
    goto LABEL_19;
  }
  if (!(_DWORD)v12)
  {
LABEL_20:
    int v33 = socket(2, 2, 0);
    if (v33 < 0)
    {
      uint64_t v12 = *__error();
      sub_1000036BC(0, (uint64_t)"socket: %m", v34, v35, v36, v37, v38, v39, (uint64_t)v82);
      if (v33 == -1)
      {
LABEL_27:
        if ((v12 & 0x80000000) != 0)
        {
          sub_1000036BC(0, (uint64_t)"bridge create, add description: %m", v40, v41, v42, v43, v44, v45, (uint64_t)v83);
        }

        else
        {
          in_addr_t v52 = (char *)malloc(0x30uLL);
          if (v52)
          {
            in_addr v53 = v52;
            *((_OWORD *)v52 + 1) = 0u;
            *((_OWORD *)v52 + 2) = 0u;
            *(_OWORD *)in_addr_t v52 = 0u;
            snprintf(v52 + 8, 0x10uLL, "%s", __s1);
            *((_DWORD *)v53 + 10) = 1;
            *((_DWORD *)v53 + 6) = a2;
            *((_DWORD *)v53 + 7) = a3;
            xpc_object_t v54 = xpc_dictionary_create(0LL, 0LL, 0LL);
            *((void *)v53 + 4) = v54;
            if (v54)
            {
              *(void *)in_addr v53 = qword_1000353E0;
              qword_1000353E0 = (uint64_t)v53;
              if (__CFADD__(dword_1000353E8++, 1)) {
                sub_1000236EC();
              }
              if (a2 != 204)
              {
                sub_10000CFE8((uint64_t)__s1, 1);
                if (!(_DWORD)v12) {
                  return v12;
                }
                goto LABEL_38;
              }

              uint64_t v62 = sub_100018D80(a5, __s1, 0LL, 1LL, 0LL, a6, v59, v60);
              uint64_t v12 = v62;
              if (!(_DWORD)v62)
              {
                sub_1000036BC(1u, (uint64_t)"%s external %s%s", v63, v64, v65, v66, v67, v68, (uint64_t)__s1);
                sub_10000CFE8((uint64_t)__s1, 1);
                return v12;
              }

              strerror(v62);
              sub_1000036BC( 0,  (uint64_t)"mis_bridge_add_member(%s) %s, err %s (%d)",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)__s1);
              goto LABEL_37;
            }

            sub_1000036BC(0, (uint64_t)"unable to create bridge members dictionary", v55, v56, v57, v58, v59, v60, v84);
            free(v53);
          }

          sub_10000F488(a2);
          sub_10000F4B0(a3);
          sub_1000036BC( 0,  (uint64_t)"bridge clone failed for %s mode %s bridge type %s",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)__s1);
          uint64_t v12 = 12LL;
        }

uint64_t sub_10001891C(char *a1)
{
  if (!a1) {
    sub_100023714();
  }
  if (!*a1) {
    sub_10002373C();
  }
  memset(v50, 0, 12);
  if (!if_nametoindex(a1))
  {
    uint64_t v30 = 0LL;
    goto LABEL_26;
  }

  int v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    uint64_t v30 = *__error();
    sub_1000036BC(0, (uint64_t)"socket: %m", v31, v32, v33, v34, v35, v36, (uint64_t)v49);
    uint64_t v17 = 0LL;
    goto LABEL_19;
  }

  in_addr v53 = 0LL;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v9 = malloc(0x2000uLL);
  if (!v9)
  {
    sub_1000036BC(0, (uint64_t)"realloc() failed: %m", v10, v11, v12, v13, v14, v15, (uint64_t)v49);
    uint64_t v17 = 0LL;
    uint64_t v30 = 12LL;
    goto LABEL_20;
  }

  size_t v16 = 0x2000LL;
  while (1)
  {
    uint64_t v17 = v9;
    bzero(v9, v16);
    LODWORD(v50[0]) = v16;
    *(void **)((char *)v50 + 4) = v17;
    if ((unint64_t)__strlcpy_chk(&v51, a1, 16LL, 16LL) >= 0x10)
    {
      uint64_t v30 = *__error();
      uint64_t v43 = "strlcpy: %m";
LABEL_17:
      sub_1000036BC(0, (uint64_t)v43, v37, v38, v39, v40, v41, v42, (uint64_t)v49);
      goto LABEL_19;
    }

    __int128 v52 = xmmword_100025160;
    in_addr v53 = v50;
    uint64_t v49 = &v51;
    if (ioctl(v8, 0xC028697BuLL) < 0)
    {
      uint64_t v30 = *__error();
      uint64_t v43 = "SIOCGDRVSPEC: %m";
      goto LABEL_17;
    }

    in_addr v53 = 0LL;
    size_t v16 = (2 * v16);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t v9 = realloc(v17, v16);
    if (!v9)
    {
      sub_1000036BC(0, (uint64_t)"realloc() failed: %m", v24, v25, v26, v27, v28, v29, (uint64_t)&v51);
      free(v17);
      uint64_t v17 = 0LL;
      uint64_t v30 = 12LL;
      goto LABEL_19;
    }
  }

  uint64_t v30 = 0LL;
LABEL_19:
  if (v8 != -1) {
LABEL_20:
  }
    close(v8);
  if (v17 && (_DWORD)v30)
  {
    free(v17);
    *(void **)((char *)v50 + 4) = 0LL;
    goto LABEL_25;
  }

  if ((_DWORD)v30)
  {
LABEL_25:
    sub_1000036BC(0, (uint64_t)"unable to get bridge members", v18, v19, v20, v21, v22, v23, (uint64_t)v49);
  }

  else
  {
    if (LODWORD(v50[0]) >= 0x50)
    {
      uint64_t v45 = 0LL;
      unint64_t v46 = 0LL;
      do
      {
        uint64_t v47 = *(char **)((char *)v50 + 4) + v45;
        if ((*(_BYTE **)((char *)v50 + 4))[v45])
        {
          sub_1000036BC(2u, (uint64_t)"removing bridge %s, member: %s", v18, v19, v20, v21, v22, v23, (uint64_t)a1);
          sub_10000EA40(v47);
          sub_10000EBB8(v47);
          sub_10000D144(v47);
          int v48 = sub_100019330((uint64_t)v47, (uint64_t)a1);
          sub_10000D54C(v47, 1, 1, 1);
          if (v48) {
            sub_1000036BC( 0,  (uint64_t)"unable to delete interface %s member: %s",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)a1);
          }
        }

        ++v46;
        v45 += 80LL;
      }

      while (v46 < LODWORD(v50[0]) / 0x50uLL);
    }

    sub_10000EA40(a1);
    sub_10000EBB8(a1);
    sub_10000DAE8(a1, 0, 0);
    uint64_t v30 = sub_100018C58((uint64_t)a1);
  }

LABEL_26:
  if (*(void **)((char *)v50 + 4))
  {
    free(*(void **)((char *)v50 + 4));
    *(void **)((char *)v50 + 4) = 0LL;
  }

  if ((_DWORD)v30) {
    sub_1000036BC(0, (uint64_t)"unable to destroy interface %s", v2, v3, v4, v5, v6, v7, (uint64_t)a1);
  }
  return v30;
}

uint64_t sub_100018C58(uint64_t a1)
{
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    uint64_t v9 = *__error();
    sub_1000036BC(0, (uint64_t)"socket: %m", v11, v12, v13, v14, v15, v16, (uint64_t)v24);
    if (v2 == -1) {
      return v9;
    }
    goto LABEL_10;
  }

  memset(v25, 0, sizeof(v25));
  if ((unint64_t)__strlcpy_chk(v25, a1, 16LL, 16LL) >= 0x10)
  {
    uint64_t v9 = *__error();
    uint64_t v10 = "strlcpy: %m";
LABEL_9:
    sub_1000036BC(0, (uint64_t)v10, v3, v4, v5, v6, v7, v8, (uint64_t)v24);
    goto LABEL_10;
  }

  uint64_t v24 = v25;
  if (ioctl(v2, 0x80206979uLL) < 0)
  {
    uint64_t v9 = *__error();
    uint64_t v10 = "SIOCIFDESTROY: %m";
    goto LABEL_9;
  }

  sub_1000036BC(2u, (uint64_t)"destroyed interface %s", v17, v18, v19, v20, v21, v22, a1);
  uint64_t v9 = 0LL;
LABEL_10:
  close(v2);
  return v9;
}

uint64_t sub_100018D80( char *a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL value = 0;
  if (!a1) {
    sub_100023764();
  }
  if (!*a1) {
    sub_10002378C();
  }
  if (!__s1) {
    sub_1000237B4();
  }
  if (!*__s1) {
    sub_1000237DC();
  }
  int v10 = a6;
  int v11 = a5;
  char v12 = a4;
  int v13 = a3;
  uint64_t v14 = &qword_1000353E0;
  do
  {
    uint64_t v14 = (uint64_t *)*v14;
    if (!v14)
    {
      sub_1000036BC(0, (uint64_t)"bridge %s does not exist", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
LABEL_11:
      uint64_t v27 = 22LL;
      goto LABEL_12;
    }
  }

  while (strncmp(__s1, (const char *)v14 + 8, 0x10uLL));
  if (xpc_dictionary_get_value((xpc_object_t)v14[4], a1))
  {
    sub_1000036BC(0, (uint64_t)"member %s already added to bridge %s", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    goto LABEL_11;
  }

  if ((v12 & 1) == 0)
  {
    sub_10000F5D8(a1, &value);
    sub_10000DAE8(a1, value, 1);
    sub_10000E924(a1);
  }

  memset(v81, 0, sizeof(v81));
  if ((unint64_t)__strlcpy_chk(v81, a1, 16LL, 16LL) >= 0x10)
  {
    uint64_t v27 = *__error();
    uint64_t v35 = "strlcpy: %m";
    goto LABEL_25;
  }

  int v36 = socket(2, 2, 0);
  if ((v36 & 0x80000000) == 0)
  {
    int v37 = v36;
    uint64_t v27 = sub_100019828((uint64_t)__s1, v36, 0LL, (uint64_t)"BRDGADD", (uint64_t)v81, 1);
    close(v37);
    if (!(_DWORD)v27) {
      goto LABEL_20;
    }
LABEL_26:
    if ((v12 & 1) == 0)
    {
LABEL_31:
      sub_10000EA40(a1);
      sub_10000D54C(a1, 1, value, 0);
    }

LABEL_43:
  xpc_dictionary_set_BOOL((xpc_object_t)v14[4], a1, value);
  if (!xpc_dictionary_get_count((xpc_object_t)v14[4])) {
    sub_100023804();
  }
  sub_10000F488(*((_DWORD *)v14 + 6));
  sub_10000F4B0(*((_DWORD *)v14 + 7));
  sub_1000036BC( 2u,  (uint64_t)"added bridge member %s to bridge %s with mode %s and type %s",  v72,  v73,  v74,  v75,  v76,  v77,  (uint64_t)a1);
  if ((_DWORD)v27) {
    goto LABEL_12;
  }
  return v27;
}

uint64_t sub_100019104( char *__s1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!__s1) {
    sub_10002382C();
  }
  if (!*__s1) {
    sub_100023854();
  }
  uint64_t v9 = &qword_1000353E0;
  int v10 = &qword_1000353E0;
  do
  {
    int v10 = (uint64_t *)*v10;
    if (!v10)
    {
      sub_1000036BC(0, (uint64_t)"could not destroy interface %s", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 22LL;
    }
  }

  while (strncmp(__s1, (const char *)v10 + 8, 0x10uLL));
  int v11 = *((_DWORD *)v10 + 10) - 1;
  *((_DWORD *)v10 + 10) = v11;
  if (v11) {
    sub_1000238A4();
  }
  sub_10000CFE8((uint64_t)__s1, -1);
  sub_100018C58((uint64_t)__s1);
  *uint64_t v9 = *v10;
  if (!dword_1000353E8) {
    sub_10002387C();
  }
  --dword_1000353E8;
  xpc_release((xpc_object_t)v10[4]);
  free(v10);
  return 0LL;
}

uint64_t sub_1000191FC(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v16 = 0u;
  if ((unint64_t)__strlcpy_chk(&v16, a1, 16LL, 16LL) >= 0x10)
  {
    uint64_t v11 = *__error();
    char v12 = "strlcpy: %m";
LABEL_8:
    sub_1000036BC(0, (uint64_t)v12, v5, v6, v7, v8, v9, v10, v16);
    return v11;
  }

  int v13 = socket(2, 2, 0);
  if (v13 < 0)
  {
    uint64_t v11 = *__error();
    char v12 = "socket: %m";
    goto LABEL_8;
  }

  int v14 = v13;
  uint64_t v11 = sub_100019828(a2, v13, 2LL, (uint64_t)"BRDGGIFFLGS", (uint64_t)&v16, 0);
  if (!(_DWORD)v11)
  {
    LODWORD(v17) = v17 | a3;
    uint64_t v11 = sub_100019828(a2, v14, 3LL, (uint64_t)"BRDGSIFFLGS", (uint64_t)&v16, 1);
  }

  close(v14);
  return v11;
}

uint64_t sub_100019330(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)__strlcpy_chk(v14, a1, 16LL, 16LL) >= 0x10)
  {
    uint64_t v9 = *__error();
    uint64_t v10 = "strlcpy: %m";
LABEL_6:
    sub_1000036BC(0, (uint64_t)v10, v3, v4, v5, v6, v7, v8, *(uint64_t *)&v14[0]);
    return v9;
  }

  int v11 = socket(2, 2, 0);
  if (v11 < 0)
  {
    uint64_t v9 = *__error();
    uint64_t v10 = "socket: %m";
    goto LABEL_6;
  }

  int v12 = v11;
  uint64_t v9 = sub_100019828(a2, v11, 1LL, (uint64_t)"BRDGDEL", (uint64_t)v14, 1);
  close(v12);
  return v9;
}

uint64_t sub_100019424( char *a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    sub_1000238CC();
  }
  if (!*a1) {
    sub_1000238F4();
  }
  if (!__s1) {
    sub_10002391C();
  }
  if (!*__s1) {
    sub_100023944();
  }
  uint64_t v10 = &qword_1000353E0;
  do
  {
    uint64_t v10 = (uint64_t *)*v10;
    if (!v10)
    {
      sub_1000036BC(0, (uint64_t)"couldn't find bridge %s", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0LL;
    }
  }

  while (strncmp(__s1, (const char *)v10 + 8, 0x10uLL));
  xpc_object_t value = xpc_dictionary_get_value((xpc_object_t)v10[4], a1);
  if (!value || (__int128 v18 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL))
  {
    sub_1000036BC(0, (uint64_t)"couldn't find member %s for bridge %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    return 0LL;
  }

  sub_1000036BC(2u, (uint64_t)"found member %s for bridge %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
  BOOL v21 = xpc_BOOL_get_value(v18);
  xpc_dictionary_set_value((xpc_object_t)v10[4], a1, 0LL);
  sub_10000EA40(a1);
  sub_10000EBB8(a1);
  sub_10000D144(a1);
  uint64_t v22 = sub_100019330((uint64_t)a1, (uint64_t)__s1);
  if (!(_DWORD)v22)
  {
    sub_10000F488(*((_DWORD *)v10 + 6));
    sub_10000F4B0(*((_DWORD *)v10 + 7));
    sub_1000036BC( 2u,  (uint64_t)"removed bridge member %s to bridge %s with mode %s and type %s",  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)a1);
    sub_10000D54C(a1, 1, v21, 1);
    return 0LL;
  }

  uint64_t v19 = v22;
  if (v21) {
    sub_10000D9AC(a1, 1);
  }
  sub_1000036BC(0, (uint64_t)"couldn't delete member %s from bridge %s", v23, v24, v25, v26, v27, v28, (uint64_t)a1);
  return v19;
}

uint64_t sub_1000195C4(char *__str)
{
  if (!__str) {
    sub_10002396C();
  }
  int v2 = 0;
  while (1)
  {
    snprintf(__str, 0x10uLL, "%s%d", "bridge", v2 + 100);
    if (!if_nametoindex(__str)) {
      break;
    }
    if (++v2 == 2147483547) {
      return 22LL;
    }
  }

  sub_1000036BC(2u, (uint64_t)"creating interface: %s", v3, v4, v5, v6, v7, v8, (uint64_t)__str);
  return 0LL;
}

uint64_t sub_10001966C(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  int v8 = socket(2, 2, 0);
  if ((v8 & 0x80000000) == 0)
  {
    int v15 = v8;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v33 = 0LL;
    if ((unint64_t)__strlcpy_chk(&v31, a1, 16LL, 16LL) <= 0xF)
    {
      if ((unint64_t)__strlcpy_chk((char *)&v29 + 4, a2, 16LL, 16LL) <= 0xF)
      {
        int v18 = v29;
        int v19 = v29 | 1;
        LODWORD(v29) = v29 | 1;
        if (a3)
        {
          int v20 = *a3;
          WORD4(v30) = *((_WORD *)a3 + 2);
          int v19 = v18 | 3;
          DWORD1(v30) = v20;
          LODWORD(v29) = v18 | 3;
        }

        if (a4)
        {
          HIDWORD(v30) = *a4;
          LODWORD(v29) = v19 | 4;
        }

        __int128 v32 = xmmword_100025170;
        uint64_t v33 = &v29;
        uint64_t v16 = 1LL;
        if ((ioctl(v15, 0x8028697BuLL, &v31) & 0x80000000) == 0) {
          goto LABEL_14;
        }
        uint64_t v17 = "%s: failed to set host filter: %s";
      }

      else
      {
        uint64_t v16 = 0LL;
        uint64_t v17 = "%s: member if name is too long: %s";
      }
    }

    else
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = "%s: bridge if name is too long: %s";
    }

    BOOL v21 = __error();
    strerror(*v21);
    sub_1000036BC(0, (uint64_t)v17, v22, v23, v24, v25, v26, v27, (uint64_t)"mis_set_host_filter");
LABEL_14:
    close(v15);
    return v16;
  }

  sub_1000036BC(0, (uint64_t)"%s: failed to create socket", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_set_host_filter");
  return 0LL;
}

uint64_t sub_100019828(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v37 = 0LL;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  if ((unint64_t)__strlcpy_chk(&v35, a1, 16LL, 16LL) < 0x10)
  {
    *(void *)&__int128 v36 = a3;
    *((void *)&v36 + 1) = 80LL;
    uint64_t v37 = a5;
    if (a6) {
      int v19 = ioctl(a2, 0x8028697BuLL, &v35);
    }
    else {
      int v19 = ioctl(a2, 0xC028697BuLL, &v35);
    }
    if (v19 < 0)
    {
      uint64_t v26 = __error();
      uint64_t v12 = *v26;
      strerror(*v26);
      sub_1000036BC(0, (uint64_t)"ioctl(%s, %s, %s) %s: failed %s", v27, v28, v29, v30, v31, v32, a1);
    }

    else
    {
      sub_1000036BC(2u, (uint64_t)"ioctl(%s, %s, %s) %s: success", v20, v21, v22, v23, v24, v25, a1);
      return 0LL;
    }
  }

  else
  {
    uint64_t v11 = __error();
    uint64_t v12 = *v11;
    uint64_t v34 = strerror(*v11);
    sub_1000036BC(0, (uint64_t)"strlcpy: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v34);
  }

  return v12;
}

void sub_1000199A4()
{
  __int16 v0 = word_100035468;
  if ((unsigned __int16)word_100035468 <= (unsigned __int16)word_10003546A)
  {
    if (word_100035468) {
      BOOL v1 = 1;
    }
    else {
      BOOL v1 = word_10003546A == 0;
    }
    if (!v1) {
      word_100035468 = word_10003546A;
    }
  }

  else
  {
    if (word_10003546A) {
      word_100035468 = word_10003546A;
    }
    word_10003546A = v0;
  }

void sub_1000199E8()
{
  CFErrorRef err = 0LL;
  uint64_t v0 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0LL);
  if (v0)
  {
    uint64_t v1 = v0;
    PFUserDeleteRules(v0, 0LL, 0LL);
    PFUserRelease(v1, 0LL);
    uint64_t v2 = PFUserCreate(kPFInternetSharing, kPFBase_v4, qword_100035470, 0LL);
    if (v2)
    {
      uint64_t v3 = v2;
      PFUserDeleteRules(v2, 0LL, 0LL);
      PFUserRelease(v3, 0LL);
      uint64_t v4 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0LL);
      if (v4)
      {
        uint64_t v5 = v4;
        PFUserDeleteRules(v4, 0LL, 0LL);
        PFUserRelease(v5, 0LL);
        uint64_t v6 = PFUserCreate(kPFInternetSharing, kPFBase_nat66, qword_100035470, 0LL);
        if (v6)
        {
          uint64_t v7 = v6;
          PFUserDeleteRules(v6, 0LL, 0LL);
          PFUserRelease(v7, 0LL);
          uint64_t v8 = PFUserCreate(kPFInternetSharing, kPFShared_v4, qword_100035470, 0LL);
          if (v8)
          {
            uint64_t v9 = v8;
            PFUserDeleteRules(v8, 0LL, 0LL);
            PFUserRelease(v9, 0LL);
            uint64_t v10 = PFUserCreate(kPFInternetSharing, kPFShared_v6, qword_100035470, 0LL);
            if (v10)
            {
              uint64_t v11 = v10;
              PFUserDeleteRules(v10, 0LL, 0LL);
              PFUserRelease(v11, 0LL);
              uint64_t v12 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0LL);
              if (v12)
              {
                uint64_t v13 = v12;
                PFUserDeleteRules(v12, 0LL, 0LL);
                PFUserRelease(v13, 0LL);
                uint64_t v14 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0LL);
                if (v14)
                {
                  uint64_t v15 = v14;
                  PFUserDeleteRules(v14, 0LL, 0LL);
                  PFUserRelease(v15, 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  if (!access("/usr/libexec/ftp-proxy", 0))
  {
    if (SMJobSetEnabled( kSMDomainSystemLaunchd,  0LL,  @"com.apple.ftp-proxy-embedded",  1LL,  1LL,  &err)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = err == 0LL;
    }
    if (v16)
    {
      byte_1000353F0 = 1;
    }

    else
    {
      Domain = CFErrorGetDomain(err);
      if (Domain)
      {
        CFStringGetCString(Domain, buffer, 256LL, 0x600u);
        CFErrorGetCode(err);
        sub_1000036BC( 0,  (uint64_t)"%s enabling job error %s(%ld)",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"ftp-proxy");
      }

      CFRelease(err);
    }
  }

  byte_1000353F4 = 1;
}

void sub_100019CE8()
{
  if (byte_1000353F4 == 1)
  {
    if (byte_1000353F0 == 1)
    {
      CFErrorRef err = 0LL;
      if (!SMJobSetEnabled( kSMDomainSystemLaunchd,  0LL,  @"com.apple.ftp-proxy-embedded",  0LL,  1LL,  &err)
        && err != 0LL)
      {
        Domain = CFErrorGetDomain(err);
        if (Domain)
        {
          CFStringGetCString(Domain, buffer, 256LL, 0x600u);
          CFErrorGetCode(err);
          sub_1000036BC(0, (uint64_t)"%s disabling job error %s(%ld)", v2, v3, v4, v5, v6, v7, (uint64_t)"ftp-proxy");
        }

        CFRelease(err);
      }
    }

    byte_1000353F4 = 0;
  }

uint64_t *sub_100019DEC(char *__s1, _DWORD *a2, _DWORD *a3, int a4)
{
  uint64_t v8 = &qword_1000353F8;
  while (1)
  {
    uint64_t v8 = (uint64_t *)*v8;
    if (!v8) {
      return v8;
    }
    if (!strncmp(__s1, (const char *)v8 + 20, 0x10uLL))
    {
      int v9 = *((unsigned __int8 *)v8 + 344);
      if (*((_BYTE *)v8 + 344))
      {
        if (a4) {
          goto LABEL_6;
        }
      }

      else
      {
        if (!*a2) {
          return 0LL;
        }
        *((_DWORD *)v8 + 13) = *a2;
        *((_DWORD *)v8 + 14) = *a3;
        if (a4) {
LABEL_6:
        }
          *((_DWORD *)v8 + 4) = a4;
      }

      if (v9) {
        uint64_t v10 = &kPFShared_v4;
      }
      else {
        uint64_t v10 = &kPFBase_v4;
      }
      uint64_t v11 = PFUserCreate(kPFInternetSharing, *v10, qword_100035470, 0LL);
      if (!v11) {
        return (uint64_t *)12;
      }
      uint64_t v12 = v11;
      if (*((_BYTE *)v8 + 344)) {
        BOOL v13 = dword_1000354B8 == 0;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13)
      {
        PFUserDeleteRules(v11, 0LL, 0LL);
        uint64_t v8 = 0LL;
      }

      else
      {
        uint64_t v8 = (uint64_t *)sub_100019F84((uint64_t)v8, v11);
      }

      PFUserRelease(v12, 0LL);
      return v8;
    }
  }

uint64_t *sub_100019F1C(char *__s1, int a2)
{
  uint64_t v4 = &qword_1000353F8;
  while (1)
  {
    uint64_t v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2)
      {
        int v5 = *((_DWORD *)v4 + 87);
        *((_DWORD *)v4 + 87) = v5 + 1;
        if (v5 == -1) {
          sub_100023994();
        }
      }

      return v4;
    }
  }

  return v4;
}

uint64_t sub_100019F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules(a2);
  if (*(_BYTE *)(a1 + 344))
  {
    uint64_t v5 = qword_1000354A8;
    if (qword_1000354A8)
    {
      while (1)
      {
        if (*(_BYTE *)(v5 + 41))
        {
          uint64_t v6 = sub_10001D4CC((const char *)(v5 + 8), 0, 0, a2, v4);
          if ((_DWORD)v6) {
            break;
          }
        }

        uint64_t v5 = *(void *)v5;
        if (!v5) {
          goto LABEL_8;
        }
      }

LABEL_99:
      uint64_t v7 = v6;
      goto LABEL_100;
    }
  }

  else
  {
    uint64_t v7 = sub_10001D4CC((const char *)(a1 + 20), 0, 0, a2, v4);
    if ((_DWORD)v7) {
      goto LABEL_100;
    }
  }

LABEL_8:
  uint64_t v8 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_73:
    unsigned int v97 = (unsigned __int16)word_100035468;
    unsigned int v98 = (unsigned __int16)word_10003546A;
    int v99 = *(unsigned __int8 *)(a1 + 344);
    if ((unsigned __int16)word_100035468 | (unsigned __int16)word_10003546A)
    {
      if (*(_BYTE *)(a1 + 344)) {
        sub_100023A0C();
      }
      uint64_t v100 = 0LL;
      uint64_t v101 = qword_1000353F8;
      do
      {
        if (!v101) {
          break;
        }
        uint64_t v101 = *(void *)v101;
      }

      while (v101);
      if (!v100) {
        sub_1000239BC();
      }
      unsigned int v103 = *(_DWORD *)(v100 + 52);
      unsigned int v102 = *(_DWORD *)(v100 + 56);
      int v104 = v102 & v103;
      unsigned int v105 = bswap32(v103);
      unsigned int v106 = bswap32(v102 & v103);
      if (v105 != v106 + 1) {
        sub_1000239E4();
      }
      int v107 = bswap32(v106 + 2);
      uint64_t v7 = sub_10001D980( (const char *)(v100 + 20),  (const char *)(a1 + 20),  v104,  v102,  6u,  v97,  v98,  v97,  v98,  SHIDWORD(v112),  v107,  a2,  v4);
      if ((_DWORD)v7) {
        goto LABEL_100;
      }
      uint64_t v7 = sub_10001D980( (const char *)(v100 + 20),  (const char *)(a1 + 20),  v104,  *(_DWORD *)(v100 + 56),  0x11u,  (unsigned __int16)word_100035468,  (unsigned __int16)word_10003546A,  (unsigned __int16)word_100035468,  word_10003546A,  v113,  v107,  a2,  v4);
      if ((_DWORD)v7) {
        goto LABEL_100;
      }
      int v99 = *(unsigned __int8 *)(a1 + 344);
    }

    if (v99)
    {
      for (uint64_t i = qword_1000354A8; i; uint64_t i = *(void *)i)
      {
        if (*(_BYTE *)(i + 41))
        {
          uint64_t v6 = sub_10001DD98((const char *)(i + 8), a2, v4, 2u);
          if ((_DWORD)v6) {
            goto LABEL_99;
          }
        }
      }
    }

    else
    {
      unsigned int v109 = (const char *)(a1 + 20);
      uint64_t v7 = sub_10001DD98(v109, a2, v4, 2u);
      if ((_DWORD)v7) {
        goto LABEL_100;
      }
      for (uint64_t j = qword_1000353F8; j; uint64_t j = *(void *)j)
      {
        if (!*(_DWORD *)(j + 8) && !strncmp((const char *)(j + 36), v109, 0x100uLL))
        {
          uint64_t v6 = sub_10001E064(v109, (const char *)(j + 20), a2, v4);
          if ((_DWORD)v6) {
            goto LABEL_99;
          }
        }
      }
    }

    PFUserCommitRules(a2, v4, 0LL, 0LL);
    return 0LL;
  }

  int v9 = (const char *)(a1 + 20);
  while (1)
  {
    if (!*(_DWORD *)(v8 + 8) && !strncmp((const char *)(v8 + 36), v9, 0x100uLL))
    {
      if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v8 + 16)) {
        unsigned int v10 = *(_DWORD *)(v8 + 16);
      }
      else {
        unsigned int v10 = *(_DWORD *)(a1 + 16);
      }
      uint64_t v6 = sub_10001D4CC((const char *)(v8 + 20), 0, v10, a2, v4);
      if ((_DWORD)v6) {
        goto LABEL_99;
      }
      uint64_t v6 = sub_10001D4CC((const char *)(v8 + 20), 0x32u, 0, a2, v4);
      if ((_DWORD)v6) {
        goto LABEL_99;
      }
      inet_ntop(2, (const void *)(v8 + 52), v115, 0x10u);
      if (*(_BYTE *)(a1 + 344))
      {
        for (uint64_t k = qword_1000354A8; k; uint64_t k = *(void *)k)
        {
          if (*(_BYTE *)(k + 41))
          {
            unsigned int v12 = bswap32(*(_DWORD *)(v8 + 56));
            if ((v12 & 0x80000000) != 0)
            {
              int v14 = 0;
              do
                char v15 = v14-- + 30;
              while (((v12 >> v15) & 1) != 0);
              int v13 = -v14;
            }

            else
            {
              int v13 = 0;
            }

            uint64_t v6 = sub_10001D644((const char *)(k + 8), 2u, v115, v13, a2, v4);
            if ((_DWORD)v6) {
              goto LABEL_99;
            }
            uint64_t v6 = sub_10001D8F8((const char *)(k + 8), 2, a2, v4);
            if ((_DWORD)v6) {
              goto LABEL_99;
            }
          }
        }
      }

      else
      {
        unsigned int v16 = bswap32(*(_DWORD *)(v8 + 56));
        if ((v16 & 0x80000000) != 0)
        {
          int v18 = 0;
          do
            char v19 = v18-- + 30;
          while (((v16 >> v19) & 1) != 0);
          int v17 = -v18;
        }

        else
        {
          int v17 = 0;
        }

        uint64_t v6 = sub_10001D644(v9, 2u, v115, v17, a2, v4);
        if ((_DWORD)v6) {
          goto LABEL_99;
        }
      }

      unsigned int v20 = *(_DWORD *)(v8 + 56);
      int v114 = *(_DWORD *)(v8 + 52);
      xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v21)
      {
        sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v22, v23, v24, v25, v26, v27, v112);
LABEL_106:
        uint64_t v7 = 12LL;
        goto LABEL_100;
      }

      uint64_t v28 = v21;
      xpc_dictionary_set_uint64(v21, kPFAction, 5uLL);
      xpc_dictionary_set_string(v28, kPFInterface, (const char *)(v8 + 20));
      xpc_dictionary_set_uint64(v28, kPFFamily, 2uLL);
      xpc_object_t v29 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v29)
      {
        sub_1000036BC(0, (uint64_t)"unable to create src address xpc dictionary", v30, v31, v32, v33, v34, v35, v112);
LABEL_105:
        xpc_release(v28);
        goto LABEL_106;
      }

      __int128 v36 = v29;
      uint64_t v37 = a1;
      uint64_t v38 = v9;
      inet_ntop(2, &v114, string, 0x10u);
      xpc_dictionary_set_string(v36, kPFSubAddress, string);
      xpc_object_t v39 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v39)
      {
        sub_1000036BC(0, (uint64_t)"unable to create dst address xpc dictionary", v40, v41, v42, v43, v44, v45, v112);
        xpc_release(v36);
        goto LABEL_105;
      }

      uint64_t v46 = v39;
      unsigned int v47 = bswap32(v20);
      if ((v47 & 0x80000000) != 0)
      {
        int v49 = 0;
        do
          char v50 = v49-- + 30;
        while (((v47 >> v50) & 1) != 0);
        int v48 = -v49;
      }

      else
      {
        int v48 = 0;
      }

      snprintf(__str, 0x100uLL, "%s/%d", string, v48);
      xpc_dictionary_set_string(v46, kPFSubAddress, __str);
      xpc_dictionary_set_value(v28, kPFFrom, v36);
      xpc_dictionary_set_value(v28, kPFTo, v46);
      int v57 = sub_10001E1B0(a2, v4, v28);
      if ((v57 & 1) != 0)
      {
        uint64_t v7 = 0LL;
      }

      else
      {
        sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)"mis_pf_configure_nonat");
        uint64_t v7 = 22LL;
      }

      xpc_release(v36);
      xpc_release(v46);
      xpc_release(v28);
      if (!v57) {
        goto LABEL_100;
      }
      int v9 = v38;
      a1 = v37;
      if (byte_1000353F0 == 1 && !*(_BYTE *)(v37 + 344)) {
        break;
      }
    }

uint64_t *sub_10001A8C0(char *__s1, int a2)
{
  uint64_t v4 = &qword_1000353F8;
  while (1)
  {
    uint64_t v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2) {
        *((_DWORD *)v4 + 4) = a2;
      }
      if (*((_BYTE *)v4 + 344)) {
        uint64_t v5 = &kPFShared_v6;
      }
      else {
        uint64_t v5 = &kPFBase_nat66;
      }
      uint64_t v6 = PFUserCreate(kPFInternetSharing, *v5, qword_100035470, 0LL);
      if (!v6) {
        return (uint64_t *)12;
      }
      uint64_t v7 = v6;
      if (*((_BYTE *)v4 + 344)) {
        BOOL v8 = dword_1000354BC == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v8)
      {
        PFUserDeleteRules(v6, 0LL, 0LL);
        uint64_t v4 = 0LL;
      }

      else
      {
        uint64_t v4 = (uint64_t *)sub_10001A9B8((uint64_t)v4, v6);
      }

      PFUserRelease(v7, 0LL);
      return v4;
    }
  }

  return v4;
}

uint64_t sub_10001A9B8(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 281)) {
    return 45LL;
  }
  uint64_t v5 = PFUserBeginRules(a2);
  uint64_t v6 = &qword_1000354B0;
  if (*(_BYTE *)(a1 + 344))
  {
    for (uint64_t i = qword_1000354B0; i; uint64_t i = *(void *)i)
    {
      if (*(_BYTE *)(i + 41))
      {
        uint64_t v8 = sub_10001D4CC((const char *)(i + 8), 0, 0, a2, v5);
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
      }
    }
  }

  else
  {
    uint64_t v2 = sub_10001D4CC((const char *)(a1 + 20), 0, 0, a2, v5);
    if ((_DWORD)v2) {
      goto LABEL_40;
    }
  }

  int v9 = &byte_100034F58[168];
  uint64_t v10 = qword_1000353F8;
  if (qword_1000353F8)
  {
    uint64_t v11 = (const char *)(a1 + 20);
    do
    {
      if (!*(_DWORD *)(v10 + 8)
        && !*(_BYTE *)(v10 + 281)
        && *(_BYTE *)(v10 + 328)
        && !strncmp((const char *)(v10 + 36), v11, 0x100uLL))
      {
        if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v10 + 16)) {
          unsigned int v12 = *(_DWORD *)(v10 + 16);
        }
        else {
          unsigned int v12 = *(_DWORD *)(a1 + 16);
        }
        uint64_t v8 = sub_10001D4CC((const char *)(v10 + 20), 0, v12, a2, v5);
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
        uint64_t v8 = sub_10001D4CC((const char *)(v10 + 20), 0x32u, 0, a2, v5);
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
        char v19 = v11;
        if (*(_BYTE *)(a1 + 344))
        {
          int v13 = v6;
          uint64_t v14 = *v6;
          if (*v6)
          {
            while (1)
            {
              if (*(_BYTE *)(v14 + 41))
              {
                uint64_t v8 = sub_10001D644( (const char *)(v14 + 8),  0x1Eu,  (const char *)(v10 + 282),  *(unsigned __int8 *)(v10 + 328),  a2,  v5);
                if ((_DWORD)v8) {
                  break;
                }
                uint64_t v8 = sub_10001D8F8((const char *)(v14 + 8), 30, a2, v5);
                if ((_DWORD)v8) {
                  break;
                }
              }

              uint64_t v14 = *(void *)v14;
              if (!v14) {
                goto LABEL_31;
              }
            }

LABEL_32:
            uint64_t v2 = v8;
LABEL_40:
            PFUserClearRules(a2, v5);
            return v2;
          }
        }

        else
        {
          int v13 = v6;
          uint64_t v8 = sub_10001D644(v11, 0x1Eu, (const char *)(v10 + 282), *(unsigned __int8 *)(v10 + 328), a2, v5);
          if ((_DWORD)v8) {
            goto LABEL_32;
          }
        }

LABEL_31:
        uint64_t v8 = sub_10001E5EC((const char *)(v10 + 20), a2, v5, 1u);
        uint64_t v6 = v13;
        int v9 = byte_100034F58 + 168;
        uint64_t v11 = v19;
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
      }

      uint64_t v10 = *(void *)v10;
    }

    while (v10);
  }

  if (*(_BYTE *)(a1 + 344))
  {
    for (uint64_t j = *v6; j; uint64_t j = *(void *)j)
    {
      if (*(_BYTE *)(j + 41))
      {
        uint64_t v8 = sub_10001DD98((const char *)(j + 8), a2, v5, 0x1Eu);
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
      }
    }
  }

  else
  {
    unsigned int v16 = (const char *)(a1 + 20);
    uint64_t v2 = sub_10001DD98(v16, a2, v5, 0x1Eu);
    if ((_DWORD)v2) {
      goto LABEL_40;
    }
    for (uint64_t k = (const char *)*((void *)v9 + 127); k; uint64_t k = *(const char **)k)
    {
      if (!*((_DWORD *)k + 2) && !strncmp(k + 36, v16, 0x100uLL))
      {
        uint64_t v8 = sub_10001E064(v16, k + 20, a2, v5);
        if ((_DWORD)v8) {
          goto LABEL_32;
        }
      }
    }
  }

  PFUserCommitRules(a2, v5, 0LL, 0LL);
  return 0LL;
}

uint64_t sub_10001AC9C(char *__s1, uint64_t a2, char a3)
{
  uint64_t v6 = &qword_1000353F8;
  do
  {
    uint64_t v6 = (uint64_t *)*v6;
    if (!v6) {
      return 22LL;
    }
  }

  while (strncmp(__s1, (const char *)v6 + 20, 0x10uLL));
  if (*((_BYTE *)v6 + 344)) {
    sub_100023A34();
  }
  if (!*(_BYTE *)a2) {
    return 0LL;
  }
  *((_OWORD *)v6 + 5) = *(_OWORD *)a2;
  __int128 v7 = *(_OWORD *)(a2 + 16);
  __int128 v8 = *(_OWORD *)(a2 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v6 + ++*(_DWORD *)(result + 8) = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v6 + 9) = v9;
  *((_OWORD *)v6 + 6) = v7;
  *((_OWORD *)v6 + 7) = v8;
  __int128 v10 = *(_OWORD *)(a2 + 80);
  __int128 v11 = *(_OWORD *)(a2 + 96);
  __int128 v12 = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v6 + 12) = *(_OWORD *)(a2 + 112);
  *((_OWORD *)v6 + 13) = v12;
  *((_OWORD *)v6 + 10) = v10;
  *((_OWORD *)v6 + 11) = v11;
  __int128 v13 = *(_OWORD *)(a2 + 144);
  __int128 v14 = *(_OWORD *)(a2 + 160);
  __int128 v15 = *(_OWORD *)(a2 + 176);
  v6[34] = *(void *)(a2 + 192);
  *((_OWORD *)v6 + 15) = v14;
  *((_OWORD *)v6 + 16) = v15;
  *((_OWORD *)v6 + 14) = v13;
  *((_BYTE *)v6 + 280) = a3;
  uint64_t v16 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0LL);
  if (!v16) {
    return 12LL;
  }
  uint64_t v17 = v16;
  uint64_t v18 = sub_10001ADB0((uint64_t)v6, v16);
  PFUserRelease(v17, 0LL);
  return v18;
}

uint64_t sub_10001ADB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules(a2);
  uint64_t v5 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_11:
    PFUserCommitRules(a2, v4, 0LL, 0LL);
    return 0LL;
  }

  while (1)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v6)
    {
      sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v7, v8, v9, v10, v11, v12, v31);
      uint64_t v29 = 12LL;
      goto LABEL_17;
    }

    __int128 v13 = v6;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v14)
    {
      sub_1000036BC(0, (uint64_t)"unable to create return option xpc dictionary", v15, v16, v17, v18, v19, v20, v31);
      uint64_t v29 = 12LL;
      goto LABEL_16;
    }

    xpc_object_t v21 = v14;
    xpc_dictionary_set_uint64(v13, kPFAction, 1uLL);
    xpc_dictionary_set_uint64(v13, kPFDirection, 1uLL);
    xpc_dictionary_set_string(v13, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v13, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v21, kPFSubReturnType, 8uLL);
    xpc_dictionary_set_value(v13, kPFReturnOptions, v21);
    xpc_release(v21);
    if ((sub_10001E1B0(a2, v4, v13) & 1) == 0) {
      break;
    }
    xpc_release(v13);
    if (*(_BYTE *)(a1 + 280)
      && (uint64_t v28 = sub_10001E824( a1,  (const char *)(v5 + 20),  a2,  v4,  1,  1u,  (const void *)(a1 + 96),  *(unsigned __int8 *)(a1 + 117)),  (_DWORD)v28)
      || (uint64_t v28 = sub_10001E5EC((const char *)(v5 + 20), a2, v4, 1u), (_DWORD)v28))
    {
      uint64_t v29 = v28;
      goto LABEL_17;
    }

uint64_t sub_10001AFF0(void *a1)
{
  if (a1[36]) {
    uint64_t v1 = a1[36];
  }
  else {
    uint64_t v1 = a1[35];
  }
  if (*(_DWORD *)(a1[35] + 288LL) == 101) {
    return 0LL;
  }
  uint64_t v3 = sub_100019F1C((char *)(a1[37] + 308LL), 1);
  if (!v3)
  {
    uint64_t v4 = (uint64_t *)sub_10001B558(a1[37], byte_100025230);
    if (!v4)
    {
      sub_1000036BC(0, (uint64_t)"pf clone failed for %s", v5, v6, v7, v8, v9, v10, a1[37] + 308LL);
      return 0xFFFFFFFFLL;
    }

    uint64_t v3 = v4;
    uint64_t *v4 = qword_1000353F8;
    qword_1000353F8 = (uint64_t)v4;
  }

  uint64_t v11 = sub_100019F1C((char *)(v1 + 308), 1);
  if (!v11)
  {
    uint64_t v27 = (xpc_object_t *)sub_10001B558(v1, (const char *)v3 + 20);
    if (!v27)
    {
      sub_1000036BC(0, (uint64_t)"pf clone failed for %s", v28, v29, v30, v31, v32, v33, v1 + 308);
LABEL_29:
      sub_10001B744(v3);
      return 0xFFFFFFFFLL;
    }

    uint64_t v34 = v27;
    *uint64_t v27 = (xpc_object_t)qword_1000353F8;
    qword_1000353F8 = (uint64_t)v27;
    if (*((_DWORD *)v27 + 3) == 104) {
      xpc_array_set_string(v27[42], 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1[35] + 308LL));
    }
    if (*((_BYTE *)v3 + 352))
    {
      if (!*((_DWORD *)v3 + 13))
      {
        sub_1000036BC(0, (uint64_t)"no IPv4 address found for %s", v28, v29, v30, v31, v32, v33, (uint64_t)v3 + 20);
        uint64_t v37 = 0LL;
        uint64_t v35 = 0LL;
        uint64_t v39 = 0LL;
        uint64_t v26 = 49LL;
LABEL_55:
        sub_10001B744((uint64_t *)v34);
        sub_10001B744(v3);
        if (!v37)
        {
          if (!v39)
          {
            if (!v35) {
              return v26;
            }
            goto LABEL_68;
          }

          goto LABEL_62;
        }

        PFUserDeleteRules(v37, 0LL, 0LL);
        char v43 = 0;
        goto LABEL_57;
      }

      uint64_t v35 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0LL);
      if (v35)
      {
        uint64_t v36 = sub_10001B7BC((uint64_t)v3, v35);
        if ((_DWORD)v36)
        {
          uint64_t v26 = v36;
        }

        else
        {
          uint64_t v26 = sub_100014C10((char *)v3 + 20, (const char *)v34 + 20);
          if (!(_DWORD)v26) {
            goto LABEL_69;
          }
        }

        uint64_t v37 = 0LL;
        goto LABEL_54;
      }

      uint64_t v37 = 0LL;
      goto LABEL_50;
    }

    if (*(_DWORD *)(a1[35] + 288LL) == 103)
    {
      uint64_t v37 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0LL);
      if (v37)
      {
        uint64_t v38 = sub_10001BA34((uint64_t)v3, v37);
        if (!(_DWORD)v38)
        {
          uint64_t v39 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0LL);
          if (v39)
          {
            uint64_t v40 = sub_10001C314((uint64_t)v3, v39);
            if (!(_DWORD)v40) {
              goto LABEL_88;
            }
            goto LABEL_82;
          }

          goto LABEL_94;
        }

LABEL_62:
              PFUserDeleteRules(v39, 0LL, 0LL);
              char v43 = 0;
              goto LABEL_63;
            }

LABEL_82:
        uint64_t v26 = v40;
LABEL_89:
        uint64_t v35 = 0LL;
        goto LABEL_55;
      }

      if (*((_BYTE *)v3 + 344)) {
        uint64_t v54 = (uint64_t *)&kPFShared_v6;
      }
      else {
        uint64_t v54 = (uint64_t *)&kPFBase_nat66;
      }
      uint64_t v55 = *v54;
    }

    else
    {
      if (!*((_BYTE *)v3 + 80))
      {
        uint64_t v39 = 0LL;
        goto LABEL_88;
      }

      if (*((_BYTE *)v3 + 344)) {
        sub_100023A5C();
      }
      uint64_t v53 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0LL);
      uint64_t v39 = v53;
      if (v53)
      {
        uint64_t v40 = sub_10001ADB0((uint64_t)v3, v53);
        if (!(_DWORD)v40) {
          goto LABEL_88;
        }
        goto LABEL_82;
      }

      uint64_t v55 = kPFBase_v6;
    }

    sub_1000036BC(0, (uint64_t)"pf user failed for anchor %s", v47, v48, v49, v50, v51, v52, v55);
LABEL_94:
    uint64_t v35 = 0LL;
    goto LABEL_51;
  }

  if (*(_DWORD *)(v1 + 288) != 104) {
    sub_100023A84();
  }
  uint64_t v12 = v11;
  __int128 v13 = (const char *)(a1[35] + 308LL);
  xpc_object_t v14 = (void *)v11[42];
  size_t count = xpc_array_get_count(v14);
  if (count)
  {
    unint64_t v16 = count;
    string = xpc_array_get_string(v14, 0LL);
    if (strcmp(string, v13))
    {
      size_t v24 = 1LL;
      while (v16 != v24)
      {
        uint64_t v25 = xpc_array_get_string(v14, v24++);
        if (!strcmp(v25, v13))
        {
          if (v24 - 1 >= v16) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }

      goto LABEL_17;
    }

LABEL_16:
    sub_1000036BC(0, (uint64_t)"pf rules already present for %s", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
    sub_10001B744(v12);
    goto LABEL_29;
  }

      uint64_t v0 = v0->ifa_next;
      if (!v0)
      {
        uint64_t v11 = v13;
        goto LABEL_28;
      }
    }
  }

  uint64_t v11 = 0LL;
  uint64_t v1 = 0LL;
LABEL_28:
  freeifaddrs(v11);
  return v1;
}

_OWORD *sub_10001B558(uint64_t a1, const char *a2)
{
  uint64_t v4 = malloc(0x190uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    v4[23] = 0u;
    v4[24] = 0u;
    v4[21] = 0u;
    v4[22] = 0u;
    v4[19] = 0u;
    v4[20] = 0u;
    v4[17] = 0u;
    v4[18] = 0u;
    v4[15] = 0u;
    v4[16] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    _OWORD *v4 = 0u;
    int v6 = *(_DWORD *)(a1 + 16);
    if (!v6)
    {
      if (*(_DWORD *)(a1 + 288) == 104)
      {
        xpc_object_t v7 = xpc_array_create(0LL, 0LL);
        *((void *)v5 + 42) = v7;
        if (!v7)
        {
          sub_1000036BC(0, (uint64_t)"xpc_array_create() failed in pf clone", v8, v9, v10, v11, v12, v13, v25);
          free(v5);
          return 0LL;
        }
      }

      snprintf((char *)v5 + 36, 0x10uLL, "%s", a2);
      int v6 = *(_DWORD *)(a1 + 16);
    }

    int v14 = *(_DWORD *)(a1 + 288);
    *((_DWORD *)v5 + 2) = v6;
    *((_DWORD *)v5 + 3) = v14;
    *((_DWORD *)v5 + 4) = *(_DWORD *)(a1 + 300);
    snprintf((char *)v5 + 20, 0x10uLL, "%s", (const char *)(a1 + 308));
    *(_OWORD *)((char *)v5 + 60) = *(_OWORD *)(a1 + 648);
    *(void *)((char *)v5 + 52) = *(void *)(a1 + 680);
    *((_BYTE *)v5 + 280) = *(_BYTE *)(a1 + 1106);
    int v15 = *(unsigned __int8 *)(a1 + 1107);
    *((_BYTE *)v5 + 281) = v15;
    *((_BYTE *)v5 + 344) = *(_BYTE *)(a1 + 564);
    *((_DWORD *)v5 + 87) = 1;
    int v16 = *(_DWORD *)(a1 + 1128);
    *((_BYTE *)v5 + 352) = v16 == 502;
    if (v16 == 502)
    {
      if (v15) {
        sub_100023AAC();
      }
      snprintf((char *)v5 + 353, 0x2EuLL, "%s/96", (const char *)(a1 + 1178));
    }

    else if (v15)
    {
      if (v16 != 500) {
        sub_100023AD4();
      }
      __int128 v17 = *(_OWORD *)(a1 + 880);
      v5[15] = *(_OWORD *)(a1 + 864);
      v5[16] = v17;
      *((void *)v5 + 34) = *(void *)(a1 + 896);
      __int128 v18 = *(_OWORD *)(a1 + 816);
      v5[11] = *(_OWORD *)(a1 + 800);
      v5[12] = v18;
      __int128 v19 = *(_OWORD *)(a1 + 848);
      v5[13] = *(_OWORD *)(a1 + 832);
      v5[14] = v19;
      __int128 v20 = *(_OWORD *)(a1 + 752);
      v5[7] = *(_OWORD *)(a1 + 736);
      v5[8] = v20;
      __int128 v21 = *(_OWORD *)(a1 + 784);
      v5[9] = *(_OWORD *)(a1 + 768);
      v5[10] = v21;
      __int128 v22 = *(_OWORD *)(a1 + 720);
      v5[5] = *(_OWORD *)(a1 + 704);
      v5[6] = v22;
    }

    else if (v16 == 500 && !*((_DWORD *)v5 + 2))
    {
      __int128 v23 = *(_OWORD *)(a1 + 1148);
      *(_OWORD *)((char *)v5 + 282) = *(_OWORD *)(a1 + 1132);
      *(_OWORD *)((char *)v5 + 29++*(_DWORD *)(result + 8) = v23;
      *(_OWORD *)((char *)v5 + 313) = *(_OWORD *)(a1 + 1163);
    }
  }

  return v5;
}

void sub_10001B744(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 87) - 1;
  *((_DWORD *)a1 + 87) = v1;
  if (!v1)
  {
    if (*((_DWORD *)a1 + 3) == 104) {
      xpc_release((xpc_object_t)a1[42]);
    }
    uint64_t v3 = &qword_1000353F8;
    *uint64_t v3 = *a1;
    free(a1);
  }

uint64_t sub_10001B7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules(a2);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v5)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v6, v7, v8, v9, v10, v11, v37);
LABEL_8:
    uint64_t v34 = 12LL;
LABEL_15:
    PFUserClearRules(a2, v4);
    return v34;
  }

  uint64_t v12 = v5;
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v13)
  {
    sub_1000036BC(0, (uint64_t)"unable to create dstAddr xpc dictionary", v14, v15, v16, v17, v18, v19, v37);
    xpc_release(v12);
    goto LABEL_8;
  }

  __int128 v20 = v13;
  xpc_object_t v27 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v27)
  {
    inet_ntop(2, (const void *)(a1 + 52), string, 0x10u);
    xpc_dictionary_set_uint64(v12, kPFAction, 0xDuLL);
    xpc_dictionary_set_uint64(v12, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_string(v20, kPFSubAddress, (const char *)(a1 + 353));
    xpc_dictionary_set_value(v12, kPFTo, v20);
    xpc_dictionary_set_string(v27, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v27, kPFSubLowPort, 0x8000uLL);
    xpc_dictionary_set_uint64(v27, kPFSubHighPort, 0xBFFFuLL);
    xpc_dictionary_set_uint64(v27, kPFSubPortOperator, 0LL);
    xpc_dictionary_set_value(v12, kPFNATRDRAddress, v27);
    if ((sub_10001E1B0(a2, v4, v12) & 1) != 0)
    {
      uint64_t v34 = 0LL;
      int v35 = 1;
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"mis_pf_configure_nat64");
      int v35 = 0;
      uint64_t v34 = 22LL;
    }
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"unable to create natAddr xpc dictionary", v21, v22, v23, v24, v25, v26, v37);
    int v35 = 0;
    uint64_t v34 = 12LL;
  }

  xpc_release(v12);
  xpc_release(v20);
  if (v27) {
    xpc_release(v27);
  }
  if (!v35) {
    goto LABEL_15;
  }
  PFUserCommitRules(a2, v4, 0LL, 0LL);
  return 0LL;
}

uint64_t sub_10001BA34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules(a2);
  uint64_t v5 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_50:
    PFUserCommitRules(a2, v4, 0LL, 0LL);
    return 0LL;
  }

  uint64_t v6 = (const char *)(a1 + 20);
  while (1)
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v7) {
      goto LABEL_51;
    }
    uint64_t v14 = v7;
    xpc_dictionary_set_uint64(v7, kPFAction, 1uLL);
    xpc_dictionary_set_string(v14, kPFInterface, (const char *)(v5 + 20));
    if ((sub_10001E1B0(a2, v4, v14) & 1) == 0)
    {
      sub_1000036BC(0, (uint64_t)"%s: unable to add rule", v15, v16, v17, v18, v19, v20, (uint64_t)"mis_pf_block_all");
      xpc_release(v14);
      uint64_t v42 = 22LL;
      goto LABEL_59;
    }

    xpc_release(v14);
    unsigned int v21 = *(_DWORD *)(v5 + 56);
    int v96 = *(_DWORD *)(v5 + 52);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v7) {
      goto LABEL_51;
    }
    uint64_t v22 = v7;
    xpc_dictionary_set_uint64(v7, kPFAction, 0LL);
    xpc_dictionary_set_string(v22, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v22, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v22, kPFKeepState, 1uLL);
    xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v23) {
      goto LABEL_52;
    }
    uint64_t v30 = v23;
    inet_ntop(2, &v96, v97, 0x10u);
    unsigned int v31 = bswap32(v21);
    if ((v31 & 0x80000000) != 0)
    {
      int v33 = 0;
      do
        char v34 = v33-- + 30;
      while (((v31 >> v34) & 1) != 0);
      int v32 = -v33;
    }

    else
    {
      int v32 = 0;
    }

    snprintf(__str, 0x100uLL, "%s/%d", v97, v32);
    xpc_dictionary_set_string(v30, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFFrom, v30);
    xpc_dictionary_set_value(v22, kPFTo, v30);
    int v41 = sub_10001E1B0(a2, v4, v22);
    if ((v41 & 1) != 0)
    {
      uint64_t v42 = 0LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"%s: unable to add rule", v35, v36, v37, v38, v39, v40, (uint64_t)"mis_pf_pass_subnet");
      uint64_t v42 = 22LL;
    }

    xpc_release(v30);
    xpc_release(v22);
    if (!v41) {
      goto LABEL_59;
    }
    unsigned int v43 = *(_DWORD *)(v5 + 56);
    int v96 = *(_DWORD *)(v5 + 52);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v7)
    {
LABEL_51:
      sub_1000036BC( v7,  (uint64_t)"unable to create rule xpc dictionary",  v8,  v9,  v10,  v11,  v12,  v13,  v95);
      goto LABEL_58;
    }

    uint64_t v22 = v7;
    xpc_dictionary_set_uint64(v7, kPFAction, 0LL);
    xpc_dictionary_set_string(v22, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v22, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v22, kPFKeepState, 1uLL);
    xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v23) {
      goto LABEL_52;
    }
    uint64_t v44 = v23;
    inet_ntop(2, &v96, v97, 0x10u);
    unsigned int v45 = bswap32(v43);
    if ((v45 & 0x80000000) != 0)
    {
      int v47 = 0;
      do
        char v48 = v47-- + 30;
      while (((v45 >> v48) & 1) != 0);
      int v46 = -v47;
    }

    else
    {
      int v46 = 0;
    }

    snprintf(__str, 0x100uLL, "%s/%d", v97, v46);
    xpc_dictionary_set_string(v44, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFFrom, v44);
    xpc_object_t v49 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v49) {
      goto LABEL_53;
    }
    uint64_t v56 = v49;
    strcpy(__str, "224.0.0.0/24");
    xpc_dictionary_set_string(v49, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFTo, v56);
    int v63 = sub_10001E1B0(a2, v4, v22);
    if ((v63 & 1) != 0)
    {
      uint64_t v42 = 0LL;
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v57,  v58,  v59,  v60,  v61,  v62,  (uint64_t)"mis_pf_pass_multicast_ip4");
      uint64_t v42 = 22LL;
    }

    xpc_release(v44);
    xpc_release(v56);
    xpc_release(v22);
    if (!v63) {
      goto LABEL_59;
    }
    unsigned int v64 = *(_DWORD *)(v5 + 56);
    int v96 = *(_DWORD *)(v5 + 52);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v7) {
      goto LABEL_51;
    }
    uint64_t v22 = v7;
    xpc_dictionary_set_uint64(v7, kPFAction, 0LL);
    xpc_dictionary_set_string(v22, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v22, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v22, kPFKeepState, 1uLL);
    xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v23) {
      goto LABEL_52;
    }
    uint64_t v44 = v23;
    inet_ntop(2, &v96, v97, 0x10u);
    unsigned int v65 = bswap32(v64);
    if ((v65 & 0x80000000) != 0)
    {
      int v67 = 0;
      do
        char v68 = v67-- + 30;
      while (((v65 >> v68) & 1) != 0);
      int v66 = -v67;
    }

    else
    {
      int v66 = 0;
    }

    snprintf(__str, 0x100uLL, "%s/%d", v97, v66);
    xpc_dictionary_set_string(v44, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFFrom, v44);
    xpc_object_t v49 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v49)
    {
LABEL_53:
      sub_1000036BC( v49,  (uint64_t)"unable to create dst address xpc dictionary",  v50,  v51,  v52,  v53,  v54,  v55,  v95);
      uint64_t v93 = v44;
      goto LABEL_56;
    }

    uint64_t v69 = v49;
    strcpy(__str, "255.255.255.255");
    xpc_dictionary_set_string(v49, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFTo, v69);
    int v76 = sub_10001E1B0(a2, v4, v22);
    if ((v76 & 1) != 0)
    {
      uint64_t v42 = 0LL;
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v70,  v71,  v72,  v73,  v74,  v75,  (uint64_t)"mis_pf_pass_broadcast_ip4");
      uint64_t v42 = 22LL;
    }

    xpc_release(v44);
    xpc_release(v69);
    xpc_release(v22);
    if (!v76) {
      goto LABEL_59;
    }
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v7) {
      goto LABEL_51;
    }
    uint64_t v22 = v7;
    xpc_dictionary_set_uint64(v7, kPFAction, 0LL);
    xpc_dictionary_set_string(v22, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v22, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v22, kPFKeepState, 1uLL);
    xpc_dictionary_set_string(v22, kPFProtocol, "udp");
    xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v23)
    {
LABEL_52:
      sub_1000036BC( v23,  (uint64_t)"unable to create src address xpc dictionary",  v24,  v25,  v26,  v27,  v28,  v29,  v95);
      goto LABEL_57;
    }

    unsigned int v77 = v23;
    strcpy(__str, "0.0.0.0");
    xpc_dictionary_set_string(v23, kPFSubAddress, __str);
    xpc_dictionary_set_uint64(v77, kPFSubLowPort, 0x44uLL);
    xpc_dictionary_set_uint64(v77, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v22, kPFFrom, v77);
    xpc_object_t v78 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v78) {
      break;
    }
    uint64_t v85 = v78;
    xpc_dictionary_set_string(v78, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v85, kPFSubLowPort, 0x43uLL);
    xpc_dictionary_set_uint64(v85, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v22, kPFTo, v85);
    int v92 = sub_10001E1B0(a2, v4, v22);
    if ((v92 & 1) != 0)
    {
      uint64_t v42 = 0LL;
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v86,  v87,  v88,  v89,  v90,  v91,  (uint64_t)"mis_pf_pass_broadcast_dhcp");
      uint64_t v42 = 22LL;
    }

    xpc_release(v77);
    xpc_release(v85);
    xpc_release(v22);
    if (!v92) {
      goto LABEL_59;
    }
LABEL_49:
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      goto LABEL_50;
    }
  }

  sub_1000036BC(0, (uint64_t)"unable to create dst address xpc dictionary", v79, v80, v81, v82, v83, v84, v95);
  uint64_t v93 = v77;
LABEL_56:
  xpc_release(v93);
LABEL_57:
  xpc_release(v22);
LABEL_58:
  uint64_t v42 = 12LL;
LABEL_59:
  PFUserClearRules(a2, v4);
  return v42;
}

uint64_t sub_10001C314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules(a2);
  uint64_t v5 = qword_1000353F8;
  if (qword_1000353F8)
  {
    while (1)
    {
      if (!*(_DWORD *)(v5 + 8) && !strncmp((const char *)(v5 + 36), (const char *)(a1 + 20), 0x100uLL))
      {
        uint64_t v6 = sub_10001E5EC((const char *)(v5 + 20), a2, v4, 0);
        if ((_DWORD)v6) {
          break;
        }
        sub_1000036BC( 2u,  (uint64_t)"%s: pass fe80::/10 on %s",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"mis_pf_add_hostrules_v6");
        if (*(_DWORD *)(v5 + 60) || *(_DWORD *)(v5 + 64) || *(_DWORD *)(v5 + 68) || *(_DWORD *)(v5 + 72))
        {
          int8x16_t v21 = *(int8x16_t *)(v5 + 60);
          int8x16_t v21 = vandq_s8(v21, (int8x16_t)xmmword_100025140);
          inet_ntop(30, &v21, v22, 0x2Eu);
          sub_1000036BC( 2u,  (uint64_t)"%s: pass %s/64 on %s",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"mis_pf_add_hostrules_v6");
          uint64_t v6 = sub_10001E824(a1, (const char *)(v5 + 20), a2, v4, 0, 0, &v21, 64);
          if ((_DWORD)v6) {
            break;
          }
        }
      }

      uint64_t v5 = *(void *)v5;
      if (!v5) {
        goto LABEL_11;
      }
    }

    uint64_t v19 = v6;
    PFUserClearRules(a2, v4);
  }

  else
  {
LABEL_11:
    PFUserCommitRules(a2, v4, 0LL, 0LL);
    return 0LL;
  }

  return v19;
}

void sub_10001C4D0( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[35];
  if (a1[36]) {
    uint64_t v9 = a1[36];
  }
  else {
    uint64_t v9 = a1[35];
  }
  if (*(_DWORD *)(v8 + 288) == 101) {
    return;
  }
  uint64_t v11 = (const char *)(a1[37] + 308LL);
  uint64_t v12 = &qword_1000353F8;
  do
  {
    uint64_t v12 = (uint64_t *)*v12;
    if (!v12)
    {
      uint64_t v69 = v9 + 308;
      uint64_t v24 = "external interface not present in pf for %s";
LABEL_22:
      sub_1000036BC(0, (uint64_t)v24, a3, a4, a5, a6, a7, a8, v69);
      return;
    }
  }

  while (strncmp(v11, (const char *)v12 + 20, 0x10uLL));
  uint64_t v13 = (const char *)(v9 + 308);
  uint64_t v14 = &qword_1000353F8;
  do
  {
    uint64_t v14 = (uint64_t *)*v14;
    if (!v14)
    {
      uint64_t v69 = v9 + 308;
      uint64_t v24 = "pf not setup on %s";
      goto LABEL_22;
    }
  }

  while (strncmp((const char *)(v9 + 308), (const char *)v14 + 20, 0x10uLL));
  if (*((_DWORD *)v14 + 3) == 104)
  {
    uint64_t v71 = v9;
    uint64_t v15 = (const char *)(v8 + 308);
    uint64_t v16 = (void *)v14[42];
    xpc_object_t v17 = xpc_array_create(0LL, 0LL);
    size_t count = xpc_array_get_count(v16);
    if (!count)
    {
LABEL_31:
      xpc_release(v17);
      sub_1000036BC(1u, (uint64_t)"pf not setup on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v15);
      return;
    }

    size_t v19 = count;
    char v20 = 0;
    size_t v21 = 0LL;
    size_t v70 = count - 1;
LABEL_14:
    char v72 = v20;
    size_t v22 = v21;
    do
    {
      string = xpc_array_get_string(v16, v22);
      if (!strcmp(string, v15))
      {
        size_t v21 = v22 + 1;
        char v20 = 1;
        if (v70 != v22) {
          goto LABEL_14;
        }
        goto LABEL_25;
      }

      xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v22;
    }

    while (v19 != v22);
    if ((v72 & 1) == 0) {
      goto LABEL_31;
    }
LABEL_25:
    xpc_release(v16);
    v14[42] = (uint64_t)v17;
    uint64_t v9 = v71;
  }

  int v25 = *((_DWORD *)v14 + 87);
  int v26 = *((_DWORD *)v12 + 87);
  sub_10001B744(v14);
  sub_10001B744(v12);
  if (v25 > 1) {
    return;
  }
  sub_100014D64((char *)(a1[37] + 308LL), v13, v27, v28, v29, v30, v31, v32);
  uint64_t v33 = a1[35];
  if (*(_DWORD *)(v33 + 1128) != 502)
  {
    if (*(_DWORD *)(v33 + 288) == 103)
    {
      uint64_t v36 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0LL);
      if (!v36)
      {
        uint64_t v50 = kPFHost_v4;
LABEL_71:
        sub_1000036BC(0, (uint64_t)"pf user handle failed for anchor %s", v44, v45, v46, v47, v48, v49, v50);
        return;
      }
    }

    else
    {
      if (*(_BYTE *)(a1[37] + 564LL)) {
        uint64_t v51 = &kPFShared_v4;
      }
      else {
        uint64_t v51 = &kPFBase_v4;
      }
      uint64_t v36 = PFUserCreate(kPFInternetSharing, *v51, qword_100035470, 0LL);
      if (!v36)
      {
        if (*(_BYTE *)(a1[37] + 564LL)) {
          char v68 = (uint64_t *)&kPFShared_v4;
        }
        else {
          char v68 = (uint64_t *)&kPFBase_v4;
        }
        uint64_t v50 = *v68;
        goto LABEL_71;
      }
    }

    if (*(_BYTE *)(v9 + 1107) || !*(_BYTE *)(v9 + 1178) || *(_DWORD *)(v9 + 288) == 103)
    {
      uint64_t v52 = (_BYTE *)a1[37];
      if (v52[1107] && v52[704] && *(_DWORD *)(a1[35] + 288LL) != 103)
      {
        if (v52[564]) {
          sub_100023AFC();
        }
        uint64_t v37 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0LL);
        if (!v37)
        {
          uint64_t v67 = kPFBase_v6;
LABEL_76:
          sub_1000036BC(0, (uint64_t)"pf user failed for anchor %s", v60, v61, v62, v63, v64, v65, v67);
          goto LABEL_77;
        }
      }

      else
      {
        uint64_t v37 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0LL);
        if (!v37)
        {
          sub_1000036BC(0, (uint64_t)"pf user handle failed for anchor %s", v53, v54, v55, v56, v57, v58, kPFHost_v6);
          goto LABEL_77;
        }
      }
    }

    else
    {
      if (*(_DWORD *)(v9 + 1128) != 500) {
        sub_100023B24();
      }
      if (*(_BYTE *)(v9 + 564)) {
        uint64_t v59 = &kPFShared_v6;
      }
      else {
        uint64_t v59 = &kPFBase_nat66;
      }
      uint64_t v37 = PFUserCreate(kPFInternetSharing, *v59, qword_100035470, 0LL);
      if (!v37)
      {
        if (*(_BYTE *)(v9 + 564)) {
          int v66 = (uint64_t *)&kPFShared_v6;
        }
        else {
          int v66 = (uint64_t *)&kPFBase_nat66;
        }
        uint64_t v67 = *v66;
        goto LABEL_76;
      }
    }

    if (v26 > 1)
    {
      uint64_t v35 = 0LL;
LABEL_46:
      if (*((_BYTE *)v12 + 352))
      {
        sub_10001B7BC((uint64_t)v12, v35);
        if (v36) {
LABEL_78:
        }
          PFUserRelease(v36, 0LL);
LABEL_79:
        if (v37) {
          PFUserRelease(v37, 0LL);
        }
        if (v35) {
          goto LABEL_82;
        }
        return;
      }

      if (*((_DWORD *)v12 + 13) || *((_BYTE *)v12 + 344) && dword_1000354B8)
      {
        if (*(_DWORD *)(a1[35] + 288LL) == 103)
        {
LABEL_66:
          sub_10001BA34((uint64_t)v12, v36);
          goto LABEL_84;
        }

        sub_100019F84((uint64_t)v12, v36);
      }

      else if (*(_DWORD *)(a1[35] + 288LL) == 103)
      {
        goto LABEL_66;
      }

uint64_t sub_10001CA50( char *__s1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9 = a3;
  uint64_t v12 = &qword_1000353F8;
  do
  {
    uint64_t v12 = (uint64_t *)*v12;
    if (!v12) {
      return sub_1000036BC(2u, (uint64_t)"pf flush states not required", a3, a4, a5, a6, a7, a8, a9);
    }
    uint64_t result = strncmp(__s1, (const char *)v12 + 20, 0x10uLL);
  }

  while ((_DWORD)result);
  if (a2)
  {
    sub_1000036BC(1u, (uint64_t)"flush ipv4 pf states for %s", a3, a4, a5, a6, a7, a8, (uint64_t)v12 + 20);
    if (*((_BYTE *)v12 + 344)) {
      uint64_t v14 = &kPFShared_v4;
    }
    else {
      uint64_t v14 = &kPFBase_v4;
    }
    uint64_t v15 = PFUserCreate(kPFInternetSharing, *v14, qword_100035470, 0LL);
    if (!v15) {
      return sub_1000036BC( 0,  (uint64_t)"pf handle create failed for %s",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)v12 + 20);
    }
    uint64_t v22 = v15;
    uint64_t result = PFUserClearStates(v15, 0LL);
    if (!v9)
    {
LABEL_10:
      uint64_t v23 = 0LL;
      if (!v22) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
    if (!v9) {
      goto LABEL_10;
    }
  }

  sub_1000036BC(1u, (uint64_t)"flush ipv6 pf states for %s", a3, a4, a5, a6, a7, a8, (uint64_t)v12 + 20);
  uint64_t v24 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0LL);
  uint64_t v23 = v24;
  if (v24)
  {
    uint64_t result = PFUserClearStates(v24, 0LL);
    if (!v22) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  uint64_t result = sub_1000036BC(0, (uint64_t)"pf handle create failed for %s", v25, v26, v27, v28, v29, v30, (uint64_t)v12 + 20);
  if (v22) {
LABEL_16:
  }
    uint64_t result = PFUserRelease(v22, 0LL);
LABEL_17:
  if (v23) {
    return PFUserRelease(v23, 0LL);
  }
  return result;
}

uint64_t sub_10001CC08( uint64_t a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_BYTE *)(a1 + 508) & 8) != 0)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: port forwarding unavailable with limited clients",  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  (uint64_t)"mis_pf_add_port_forwarding_rule");
    return 80LL;
  }

  else
  {
    __int16 v8 = a6;
    int v10 = a4;
    int v11 = a3;
    inet_ntop(a4, a5, v38, 0x2Eu);
    if (v10 == 2) {
      uint64_t v20 = "inet";
    }
    else {
      uint64_t v20 = "inet6";
    }
    if (v10 == 2) {
      uint64_t v21 = &qword_100034D50;
    }
    else {
      uint64_t v21 = &qword_100034D60;
    }
    sub_1000036BC( 0,  (uint64_t)"%s %s(pid %d) %s %s %d -> %s:%d",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"mis_pf_add_port_forwarding_rule");
    uint64_t v28 = *v21;
    if (*v21)
    {
      while (*(unsigned __int8 *)(v28 + 44) != a2 || *(unsigned __int16 *)(v28 + 42) != v11)
      {
        uint64_t v28 = *(void *)v28;
        if (!v28) {
          goto LABEL_12;
        }
      }

      sub_1000036BC(0, (uint64_t)"%s rule for %s %d already exists", v22, v23, v24, v25, v26, v27, (uint64_t)v20);
      return 17LL;
    }

    else
    {
LABEL_12:
      uint64_t v29 = (char *)malloc(0x30uLL);
      uint64_t v30 = (uint64_t *)v29;
      *((void *)v29 + 4) = 0LL;
      *((void *)v29 + 5) = 0LL;
      *((void *)v29 + 3) = 0LL;
      uint64_t v31 = v29 + 24;
      *((void *)v29 + 2) = a1;
      v29[44] = a2;
      *((_WORD *)v29 + 21) = v11;
      *((_WORD *)v29 + 20) = v8;
      v29[45] = v10;
      if (v10 == 2)
      {
        *uint64_t v31 = *a5;
        uint64_t v32 = &off_100034D58;
      }

      else
      {
        *(_OWORD *)uint64_t v31 = *(_OWORD *)a5;
        uint64_t v32 = &off_100034D68;
      }

      uint64_t v34 = *v32;
      *(void *)uint64_t v29 = 0LL;
      *((void *)v29 + 1) = v34;
      *uint64_t v34 = (uint64_t)v29;
      *uint64_t v32 = (uint64_t *)v29;
      uint64_t v33 = sub_10001CE34(v10);
      if ((_DWORD)v33)
      {
        uint64_t v35 = *v30;
        uint64_t v36 = (uint64_t *)v30[1];
        if (*v30)
        {
          *(void *)(v35 + ++*(_DWORD *)(result + 8) = v36;
          uint64_t v36 = (uint64_t *)v30[1];
        }

        else
        {
          *uint64_t v32 = v36;
        }

        *uint64_t v36 = v35;
        free(v30);
      }
    }
  }

  return (uint64_t)v33;
}

uint64_t *sub_10001CE34(int a1)
{
  uint64_t v1 = qword_100035498;
  if (!qword_100035498) {
    return 0LL;
  }
  while (*(_DWORD *)(v1 + 16) != 1 || !*(_BYTE *)(v1 + 564))
  {
    uint64_t v1 = *(void *)v1;
    if (!v1) {
      return 0LL;
    }
  }

  if (a1 == 2) {
    return sub_100019DEC((char *)(v1 + 308), 0LL, 0LL, *(_DWORD *)(v1 + 300));
  }
  else {
    return sub_10001A8C0((char *)(v1 + 308), *(_DWORD *)(v1 + 300));
  }
}

uint64_t sub_10001CE94( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_BYTE *)(a1 + 508) & 8) != 0)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: port forwarding unavailable for limited clients",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pf_remove_port_forwarding_rule");
    return 80LL;
  }

  else
  {
    int v8 = a4;
    int v9 = a3;
    if ((_DWORD)a4 == 2) {
      int v11 = "inet";
    }
    else {
      int v11 = "inet6";
    }
    if ((_DWORD)a4 == 2) {
      uint64_t v12 = &qword_100034D50;
    }
    else {
      uint64_t v12 = &qword_100034D60;
    }
    sub_1000036BC( 0,  (uint64_t)"%s %s(pid %d) %s %s %d",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"mis_pf_remove_port_forwarding_rule");
    uint64_t v19 = (void *)*v12;
    if (*v12)
    {
      while (*((unsigned __int8 *)v19 + 44) != a2 || *((unsigned __int16 *)v19 + 21) != v9)
      {
        uint64_t v19 = (void *)*v19;
        if (!v19) {
          goto LABEL_12;
        }
      }

      uint64_t v21 = (void *)*v19;
      uint64_t v22 = (void *)v19[1];
      if (*v19)
      {
        v21[1] = v22;
        uint64_t v22 = (void *)v19[1];
      }

      else
      {
        if (v8 == 2) {
          uint64_t v23 = &qword_100034D50;
        }
        else {
          uint64_t v23 = &qword_100034D60;
        }
        v23[1] = (uint64_t)v22;
      }

      *uint64_t v22 = v21;
      free(v19);
      return (uint64_t)sub_10001CE34(v8);
    }

    else
    {
LABEL_12:
      sub_1000036BC(0, (uint64_t)"No forwarding rule for %s %s %d", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
      return 2LL;
    }
  }

xpc_object_t sub_10001D004(uint64_t a1, int a2)
{
  uint64_t v2 = &qword_100034D60;
  if (a2 == 2) {
    uint64_t v2 = &qword_100034D50;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    xpc_object_t v5 = 0LL;
    while (*(void *)(v3 + 16) != a1)
    {
LABEL_22:
      uint64_t v3 = *(void *)v3;
      if (!v3) {
        return v5;
      }
    }

    uint64_t v6 = *(unsigned __int8 *)(v3 + 45);
    BOOL v7 = (_DWORD)v6 == 30 || (_DWORD)v6 == 2;
    if (v7
      && (uint64_t v8 = *(unsigned __int16 *)(v3 + 40), *(_WORD *)(v3 + 40))
      && (uint64_t v9 = *(unsigned __int8 *)(v3 + 44),
          uint64_t v10 = *(unsigned __int16 *)(v3 + 42),
          inet_ntop(*(unsigned __int8 *)(v3 + 45), (const void *)(v3 + 24), string, 0x2Eu)))
    {
      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      uint64_t v12 = v11;
      if ((_DWORD)v9) {
        xpc_dictionary_set_uint64(v11, off_100034D08[0], v9);
      }
      if ((_DWORD)v10) {
        xpc_dictionary_set_uint64(v12, off_100034D10[0], v10);
      }
      xpc_dictionary_set_uint64(v12, off_100034D20[0], v6);
      xpc_dictionary_set_uint64(v12, off_100034D28, v8);
      xpc_dictionary_set_string(v12, off_100034D18[0], string);
      if (v5) {
        goto LABEL_21;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
      if (v5)
      {
LABEL_21:
        xpc_array_append_value(v5, v12);
        xpc_release(v12);
        goto LABEL_22;
      }
    }

    xpc_object_t v5 = xpc_array_create(0LL, 0LL);
    goto LABEL_21;
  }

  return 0LL;
}

void sub_10001D1B8(uint64_t a1, int a2)
{
  if (a2 == 2) {
    uint64_t v2 = &qword_100034D50;
  }
  else {
    uint64_t v2 = &qword_100034D60;
  }
  uint64_t v3 = (void *)*v2;
  if (*v2)
  {
    if (a2 == 2) {
      xpc_object_t v5 = &qword_100034D50;
    }
    else {
      xpc_object_t v5 = &qword_100034D60;
    }
    do
    {
      uint64_t v6 = (void *)*v3;
      if (v3[2] == a1)
      {
        inet_ntop(*((unsigned __int8 *)v3 + 45), v3 + 3, v15, 0x2Eu);
        sub_1000036BC(0, (uint64_t)"Remove rule %s(pid %d) %s %d -> %s:%d", v7, v8, v9, v10, v11, v12, v3[2] + 356LL);
        uint64_t v13 = (void *)*v3;
        uint64_t v14 = (void *)v3[1];
        if (*v3)
        {
          v13[1] = v14;
          uint64_t v14 = (void *)v3[1];
        }

        else
        {
          v5[1] = (uint64_t)v14;
        }

        *uint64_t v14 = v13;
        free(v3);
      }

      uint64_t v3 = v6;
    }

    while (v6);
  }

uint64_t sub_10001D2EC(unsigned int a1)
{
  unsigned int v17 = a1;
  *(_OWORD *)uint64_t v18 = xmmword_100025210;
  int v1 = dword_100035400;
  if (a1)
  {
    ++dword_100035400;
    if (v1 > 0) {
      return 0LL;
    }
  }

  else
  {
    --dword_100035400;
    if (v1 != 1) {
      return 0LL;
    }
  }

  uint64_t v3 = sysctl(v18, 4u, 0LL, 0LL, &v17, 4uLL);
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v2 = *__error();
    sub_1000036BC(0, (uint64_t)"setting ip forwarding to %d: %m", v10, v11, v12, v13, v14, v15, v17);
  }

  else
  {
    uint64_t v2 = v3;
    sub_1000036BC(2u, (uint64_t)"ip forwarding set to %d", v4, v5, v6, v7, v8, v9, v17);
  }

  return v2;
}

uint64_t sub_10001D3DC(unsigned int a1)
{
  unsigned int v17 = a1;
  *(_OWORD *)uint64_t v18 = xmmword_100025220;
  int v1 = dword_100035404;
  if (a1)
  {
    ++dword_100035404;
    if (v1 > 0) {
      return 0LL;
    }
  }

  else
  {
    --dword_100035404;
    if (v1 != 1) {
      return 0LL;
    }
  }

  uint64_t v3 = sysctl(v18, 4u, 0LL, 0LL, &v17, 4uLL);
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v2 = *__error();
    sub_1000036BC(0, (uint64_t)"setting ip6 forwarding to %d: %m", v10, v11, v12, v13, v14, v15, v17);
  }

  else
  {
    uint64_t v2 = v3;
    sub_1000036BC(2u, (uint64_t)"ip6 forwarding set to %d", v4, v5, v6, v7, v8, v9, v17);
  }

  return v2;
}

uint64_t sub_10001D4CC(const char *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v10)
  {
    sub_1000036BC(0, (uint64_t)"unable to create xpc rule dictionary", v11, v12, v13, v14, v15, v16, v34);
    return 12LL;
  }

  unsigned int v17 = v10;
  xpc_dictionary_set_uint64(v10, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v17, kPFProtocol, a2);
  xpc_dictionary_set_string(v17, kPFInterface, a1);
  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v18)
  {
    sub_1000036BC(0, (uint64_t)"unable to create sub dictionary", v19, v20, v21, v22, v23, v24, v34);
    xpc_release(v17);
    return 12LL;
  }

  uint64_t v25 = v18;
  xpc_dictionary_set_uint64(v18, kPFSubScrubMaxMSS, a3);
  xpc_dictionary_set_uint64(v25, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v17, kPFScrubOptions, v25);
  if ((sub_10001E1B0(a4, a5, v17) & 1) != 0)
  {
    uint64_t v32 = 0LL;
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"%s: unable to add rule", v26, v27, v28, v29, v30, v31, (uint64_t)"mis_pf_ifscrub");
    uint64_t v32 = 22LL;
  }

  xpc_release(v25);
  xpc_release(v17);
  return v32;
}

uint64_t sub_10001D644(const char *a1, unsigned int a2, const char *a3, int a4, uint64_t a5, uint64_t a6)
{
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v12)
  {
    sub_1000036BC(0, (uint64_t)"unable to create nat xpc dictionary", v13, v14, v15, v16, v17, v18, v44);
    return 12LL;
  }

  uint64_t v19 = v12;
  snprintf(__str, 0x100uLL, "%s:0", a1);
  xpc_dictionary_set_string(v19, kPFSubDynInterface, __str);
  xpc_dictionary_set_uint64(v19, kPFSubLowPort, 0x8000uLL);
  xpc_dictionary_set_uint64(v19, kPFSubHighPort, 0xBFFFuLL);
  xpc_dictionary_set_uint64(v19, kPFSubPortOperator, 0LL);
  xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v20)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v21, v22, v23, v24, v25, v26, v45);
    xpc_release(v19);
    return 12LL;
  }

  uint64_t v27 = v20;
  xpc_dictionary_set_uint64(v20, kPFAction, 4uLL);
  xpc_dictionary_set_string(v27, kPFInterface, a1);
  xpc_dictionary_set_uint64(v27, kPFFamily, a2);
  xpc_dictionary_set_uint64(v27, kPFExtFilter, 3uLL);
  xpc_dictionary_set_uint64(v27, kPFExtMap, 3uLL);
  xpc_object_t v28 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v28)
  {
    uint64_t v35 = v28;
    snprintf(__str, 0x100uLL, "%s/%d", a3, a4);
    xpc_dictionary_set_string(v35, kPFSubAddress, __str);
    xpc_dictionary_set_value(v27, kPFFrom, v35);
    xpc_dictionary_set_value(v27, kPFNATRDRAddress, v19);
    if ((sub_10001E1B0(a5, a6, v27) & 1) != 0)
    {
      uint64_t v42 = 0LL;
    }

    else
    {
      sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)"mis_pf_configure_nat_outbound");
      uint64_t v42 = 22LL;
    }

    xpc_release(v19);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"unable to create src address xpc dictionary", v29, v30, v31, v32, v33, v34, v45);
    uint64_t v42 = 12LL;
    uint64_t v35 = v19;
  }

  xpc_release(v35);
  xpc_release(v27);
  return v42;
}

uint64_t sub_10001D8F8(const char *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2) {
    uint64_t v7 = &qword_100034D50;
  }
  else {
    uint64_t v7 = &qword_100034D60;
  }
  while (1)
  {
    uint64_t v7 = (uint64_t *)*v7;
    if (!v7) {
      break;
    }
    uint64_t result = sub_10001E240( a1,  *((unsigned __int8 *)v7 + 44),  *((unsigned __int16 *)v7 + 21),  *((unsigned __int16 *)v7 + 21),  *((unsigned __int16 *)v7 + 20),  *((unsigned __int16 *)v7 + 20),  *((unsigned __int8 *)v7 + 45),  v7 + 3,  a3,  a4);
    if ((_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t sub_10001D980( const char *a1, const char *a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9, int a10, int a11, uint64_t a12, uint64_t a13)
{
  int v61 = a11;
  uint64_t v19 = sub_10001E240(a2, a5, a6, a7, a8, a9, 2u, &v61, a12, a13);
  if ((_DWORD)v19) {
    return v19;
  }
  int v62 = v61;
  int v63 = a3;
  xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v21)
  {
    sub_1000036BC(0, (uint64_t)"unable to create nat xpc dictionary", v22, v23, v24, v25, v26, v27, v58);
    return 12LL;
  }

  xpc_object_t v28 = v21;
  snprintf(__str, 0x100uLL, "%s:0", a2);
  xpc_dictionary_set_string(v28, kPFSubDynInterface, __str);
  xpc_object_t v29 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v36 = v29;
  if (v29)
  {
    xpc_dictionary_set_uint64(v29, kPFAction, 4uLL);
    xpc_dictionary_set_string(v36, kPFInterface, a1);
    xpc_dictionary_set_uint64(v36, kPFProtocol, a5);
    xpc_dictionary_set_uint64(v36, kPFFamily, 2uLL);
    xpc_object_t v37 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v37)
    {
      uint64_t v38 = v37;
      inet_ntop(2, &v63, string, 0x10u);
      unsigned int v39 = bswap32(a4);
      if ((v39 & 0x80000000) != 0)
      {
        int v43 = 0;
        do
          char v44 = v43-- + 30;
        while (((v39 >> v44) & 1) != 0);
        int v40 = -v43;
      }

      else
      {
        int v40 = 0;
      }

      snprintf(__str, 0x100uLL, "%s/%d", string, v40);
      xpc_dictionary_set_string(v38, kPFSubAddress, __str);
      xpc_object_t v42 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v42)
      {
        uint64_t v51 = 2LL;
        inet_ntop(2, &v62, string, 0x10u);
        xpc_dictionary_set_string(v42, kPFSubAddress, string);
        xpc_dictionary_set_uint64(v42, kPFSubLowPort, a8);
        if (a8 != a9)
        {
          xpc_dictionary_set_uint64(v42, kPFSubHighPort, a9);
          uint64_t v51 = 9LL;
        }

        xpc_dictionary_set_uint64(v42, kPFSubPortOperator, v51);
        xpc_dictionary_set_uint64(v28, kPFSubLowPort, 0x8000uLL);
        xpc_dictionary_set_uint64(v28, kPFSubHighPort, 0xBFFFuLL);
        xpc_dictionary_set_uint64(v28, kPFSubPortOperator, 0LL);
        xpc_dictionary_set_uint64(v36, kPFExtFilter, 1uLL);
        xpc_dictionary_set_uint64(v36, kPFExtMap, 1uLL);
        xpc_dictionary_set_value(v36, kPFFrom, v38);
        xpc_dictionary_set_value(v36, kPFTo, v42);
        xpc_dictionary_set_value(v36, kPFNATRDRAddress, v28);
        if ((sub_10001E1B0(a12, a13, v36) & 1) != 0)
        {
          uint64_t v19 = 0LL;
        }

        else
        {
          sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)"mis_pf_configure_nat_hairpin");
          uint64_t v19 = 22LL;
        }
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"unable to create dst address xpc dictionary", v45, v46, v47, v48, v49, v50, v60);
        uint64_t v19 = 12LL;
      }

      xpc_release(v28);
      xpc_release(v38);
      if (!v42) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }

    uint64_t v41 = "unable to create src address xpc dictionary";
  }

  else
  {
    uint64_t v41 = "unable to create rule xpc dictionary";
  }

  sub_1000036BC(0, (uint64_t)v41, v30, v31, v32, v33, v34, v35, v59);
  uint64_t v19 = 12LL;
  xpc_object_t v42 = v28;
LABEL_24:
  xpc_release(v42);
LABEL_25:
  if (v36) {
    xpc_release(v36);
  }
  return v19;
}

uint64_t sub_10001DD98(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v8)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v9, v10, v11, v12, v13, v14, v53);
    return 12LL;
  }

  uint64_t v15 = v8;
  xpc_dictionary_set_uint64(v8, kPFAction, 0LL);
  xpc_dictionary_set_uint64(v15, kPFFamily, a4);
  xpc_dictionary_set_string(v15, kPFInterface, a1);
  xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 1uLL);
  if ((sub_10001E1B0(a2, a3, v15) & 1) == 0)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: unable to add generic pass all rule",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"mis_pf_configure_ext_filters");
    uint64_t v36 = 22LL;
LABEL_9:
    xpc_object_t v37 = v15;
LABEL_19:
    xpc_release(v37);
    return v36;
  }

  xpc_object_t v22 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v22)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v23, v24, v25, v26, v27, v28, v53);
    uint64_t v36 = 12LL;
    goto LABEL_9;
  }

  xpc_object_t v29 = v22;
  xpc_dictionary_set_uint64(v22, kPFAction, 0LL);
  xpc_dictionary_set_uint64(v29, kPFFamily, a4);
  xpc_dictionary_set_string(v29, kPFInterface, a1);
  xpc_dictionary_set_uint64(v29, kPFProtocol, 0x32uLL);
  if ((sub_10001E1B0(a2, a3, v29) & 1) != 0)
  {
    uint64_t v36 = 0LL;
  }

  else
  {
    sub_1000036BC( 0,  (uint64_t)"%s: unable to add esp rule",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"mis_pf_configure_ext_filters");
    uint64_t v36 = 22LL;
  }

  if (a4 == 2)
  {
    xpc_object_t v38 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v45 = v38;
    if (v38)
    {
      xpc_dictionary_set_uint64(v38, kPFAction, 0LL);
      xpc_dictionary_set_uint64(v45, kPFFamily, 2uLL);
      xpc_dictionary_set_uint64(v45, kPFProtocol, 2uLL);
      xpc_dictionary_set_uint64(v45, kPFKeepState, 1uLL);
      xpc_dictionary_set_BOOL(v45, kPFAllowOpts, 1);
      if ((sub_10001E1B0(a2, a3, v45) & 1) == 0)
      {
        sub_1000036BC( 0,  (uint64_t)"%s: unable to add igmp rule",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)"mis_pf_configure_ext_filters");
        uint64_t v36 = 22LL;
      }
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v39, v40, v41, v42, v43, v44, v53);
      uint64_t v36 = 12LL;
    }
  }

  else
  {
    uint64_t v45 = 0LL;
  }

  xpc_release(v15);
  xpc_release(v29);
  if (v45)
  {
    xpc_object_t v37 = v45;
    goto LABEL_19;
  }

  return v36;
}

uint64_t sub_10001E064(const char *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = if_nametoindex(a1);
  if (v8)
  {
    unsigned int v15 = v8;
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v16)
    {
      uint64_t v23 = v16;
      xpc_dictionary_set_uint64(v16, kPFAction, 0LL);
      xpc_dictionary_set_string(v23, kPFInterface, a2);
      xpc_dictionary_set_uint64(v23, kPFRTableID, v15);
      xpc_dictionary_set_uint64(v23, kPFKeepState, 1uLL);
      xpc_dictionary_set_uint64(v23, kPFExtFilter, 1uLL);
      if ((sub_10001E1B0(a3, a4, v23) & 1) != 0)
      {
        uint64_t v30 = 0LL;
      }

      else
      {
        sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"mis_pf_configure_int_filters");
        uint64_t v30 = 22LL;
      }

      xpc_release(v23);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v17, v18, v19, v20, v21, v22, v32);
      return 12LL;
    }
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"if_nametoindex(%s)", v9, v10, v11, v12, v13, v14, (uint64_t)a1);
    return 6LL;
  }

  return v30;
}

uint64_t sub_10001E1B0(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  if (byte_100035485)
  {
    uint64_t v6 = (void *)qword_100035408;
    if (!qword_100035408)
    {
      qword_100035408 = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64((xpc_object_t)qword_100035408, kPFSubLogFlags, 1uLL);
      uint64_t v6 = (void *)qword_100035408;
    }

    xpc_dictionary_set_value(xdict, kPFLog, v6);
  }

  return PFUserAddRule(a1, a2, xdict);
}

uint64_t sub_10001E240( const char *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, const void *a8, uint64_t a9, uint64_t a10)
{
  if (a3 > a4 || a5 > a6) {
    sub_100023B4C();
  }
  if (a4 - a3 != a6 - a5) {
    sub_100023B74();
  }
  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v18)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rdr xpc dictionary", v19, v20, v21, v22, v23, v24, v54);
    return 12LL;
  }

  uint64_t v25 = v18;
  inet_ntop(a7, a8, string, 0x2Eu);
  xpc_dictionary_set_string(v25, kPFSubAddress, string);
  xpc_object_t v26 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v26)
  {
    sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v27, v28, v29, v30, v31, v32, v54);
    xpc_release(v25);
    return 12LL;
  }

  uint64_t v33 = v26;
  xpc_dictionary_set_uint64(v26, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v33, kPFProtocol, a2);
  xpc_dictionary_set_string(v33, kPFInterface, a1);
  xpc_dictionary_set_uint64(v33, kPFFamily, a7);
  xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v34)
  {
    uint64_t v41 = v34;
    snprintf(__str, 0x100uLL, "%s:0", a1);
    xpc_dictionary_set_string(v41, kPFSubDynInterface, __str);
    xpc_dictionary_set_uint64(v41, kPFSubLowPort, a3);
    if (a3 == a4)
    {
      uint64_t v42 = 2LL;
    }

    else
    {
      xpc_dictionary_set_uint64(v41, kPFSubHighPort, a4);
      uint64_t v42 = 9LL;
    }

    xpc_dictionary_set_uint64(v41, kPFSubPortOperator, v42);
    uint64_t v44 = (const char **)&kPFSubLowPort;
    if (a5 == a6)
    {
      uint64_t v45 = 2LL;
      unsigned int v46 = a5;
    }

    else
    {
      xpc_dictionary_set_uint64(v25, kPFSubLowPort, a5);
      uint64_t v44 = (const char **)&kPFSubHighPort;
      uint64_t v45 = 9LL;
      unsigned int v46 = a6;
    }

    xpc_dictionary_set_uint64(v25, *v44, v46);
    xpc_dictionary_set_uint64(v25, kPFSubPortOperator, v45);
    xpc_dictionary_set_value(v33, kPFTo, v41);
    xpc_dictionary_set_value(v33, kPFNATRDRAddress, v25);
    if ((sub_10001E1B0(a9, a10, v33) & 1) != 0)
    {
      if (a3 == a4) {
        sub_1000036BC( 0,  (uint64_t)"port forwarding enabled on %s proto %s port %d to %s port %d",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)a1);
      }
      else {
        sub_1000036BC( 0,  (uint64_t)"port forwarding enabled on %s proto %s port %d:%d to %s port %d:%d",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)a1);
      }
      uint64_t v43 = 0LL;
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"%s: unable to add rule", v47, v48, v49, v50, v51, v52, (uint64_t)"mis_pf_configure_rdr");
      uint64_t v43 = 22LL;
    }

    xpc_release(v25);
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"unable to create dst xpc dictionary", v35, v36, v37, v38, v39, v40, v54);
    uint64_t v43 = 12LL;
    uint64_t v41 = v25;
  }

  xpc_release(v41);
  xpc_release(v33);
  return v43;
}

uint64_t sub_10001E5EC(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v8)
  {
    unsigned int v15 = v8;
    xpc_dictionary_set_uint64(v8, kPFAction, 0LL);
    xpc_dictionary_set_uint64(v15, kPFDirection, a4);
    xpc_dictionary_set_string(v15, kPFInterface, a1);
    xpc_dictionary_set_uint64(v15, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v16)
    {
      uint64_t v23 = v16;
      strcpy(string, "fe80::/10");
      xpc_dictionary_set_string(v16, kPFSubAddress, string);
      xpc_object_t v24 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v24)
      {
        uint64_t v31 = v24;
        xpc_dictionary_set_string(v24, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v15, kPFFrom, v23);
        xpc_dictionary_set_value(v15, kPFTo, v31);
        if ((sub_10001E1B0(a2, a3, v15) & 1) != 0)
        {
          uint64_t v38 = 0LL;
        }

        else
        {
          sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"mis_pf_configure_pass_ip6_linklocal");
          uint64_t v38 = 22LL;
        }

        xpc_release(v23);
        xpc_release(v31);
        goto LABEL_12;
      }

      sub_1000036BC(0, (uint64_t)"unable to create dst address xpc dictionary", v25, v26, v27, v28, v29, v30, v40);
      xpc_release(v23);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unable to create src address xpc dictionary", v17, v18, v19, v20, v21, v22, v40);
    }

    uint64_t v38 = 12LL;
LABEL_12:
    xpc_release(v15);
    return v38;
  }

  sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v9, v10, v11, v12, v13, v14, v40);
  return 12LL;
}

uint64_t sub_10001E824( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, const void *a7, int a8)
{
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v16)
  {
    uint64_t v23 = v16;
    xpc_dictionary_set_uint64(v16, kPFAction, 0LL);
    xpc_dictionary_set_uint64(v23, kPFDirection, a6);
    xpc_dictionary_set_string(v23, kPFInterface, a2);
    xpc_dictionary_set_uint64(v23, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v23, kPFKeepState, 1uLL);
    if (a5)
    {
      unsigned int v24 = if_nametoindex((const char *)(a1 + 20));
      if (!v24)
      {
        sub_1000036BC(0, (uint64_t)"if_nametoindex(%s)", v25, v26, v27, v28, v29, v30, a1 + 20);
        uint64_t v53 = 6LL;
        goto LABEL_16;
      }

      xpc_dictionary_set_uint64(v23, kPFRTableID, v24);
    }

    xpc_object_t v31 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v31)
    {
      uint64_t v38 = v31;
      inet_ntop(30, a7, v58, 0x2Eu);
      snprintf(__str, 0x36uLL, "%s/%d", v58, a8);
      xpc_dictionary_set_string(v38, kPFSubAddress, __str);
      xpc_object_t v39 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (v39)
      {
        unsigned int v46 = v39;
        xpc_dictionary_set_string(v39, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v23, kPFFrom, v38);
        xpc_dictionary_set_value(v23, kPFTo, v46);
        if ((sub_10001E1B0(a3, a4, v23) & 1) != 0)
        {
          uint64_t v53 = 0LL;
        }

        else
        {
          sub_1000036BC( 0,  (uint64_t)"%s: unable to add rule",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)"mis_pf_configure_pass_ip6_prefix");
          uint64_t v53 = 22LL;
        }

        xpc_release(v38);
        xpc_release(v46);
        goto LABEL_16;
      }

      sub_1000036BC(0, (uint64_t)"unable to create dst address xpc dictionary", v40, v41, v42, v43, v44, v45, v56);
      xpc_release(v38);
    }

    else
    {
      sub_1000036BC(0, (uint64_t)"unable to create src address xpc dictionary", v32, v33, v34, v35, v36, v37, v55);
    }

    uint64_t v53 = 12LL;
LABEL_16:
    xpc_release(v23);
    return v53;
  }

  sub_1000036BC(0, (uint64_t)"unable to create rule xpc dictionary", v17, v18, v19, v20, v21, v22, v55);
  return 12LL;
}

id sub_10001EB50(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  qword_100035418 = (uint64_t)result;
  return result;
}

id sub_10001ED9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleCTNotification:a2 notificationInfo:a3];
}

id sub_10001F0CC(uint64_t a1, void *a2)
{
  return [*(id *)(a1 + 32) activateTethering:0];
}

uint64_t sub_10001F89C(uint64_t a1)
{
  return -[misCTClientSharedInstance activateTethering:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "activateTethering:",  a1);
}

uint64_t sub_10001F8C8(uint64_t a1)
{
  return -[misCTClientSharedInstance getTetheringStatus:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "getTetheringStatus:",  a1);
}

id sub_10001F8F4(uint64_t a1)
{
  return (id)-[misCTClientSharedInstance isDataPlanEnabled:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "isDataPlanEnabled:",  a1);
}

id sub_10001F920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)-[misCTClientSharedInstance registerCellularDataStatusNotification:callback:callbackArg:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "registerCellularDataStatusNotification:callback:callbackArg:",  a1,  a2,  a3);
}

uint64_t sub_10001F964(uint64_t a1)
{
  uint64_t v7 = -[misCTClientSharedInstance getTetheringInterfaceName:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "getTetheringInterfaceName:",  a1);
  if ((_DWORD)v7) {
    sub_1000036BC( 0,  (uint64_t)"%s: failed to get tethering interface name",  v1,  v2,  v3,  v4,  v5,  v6,  (uint64_t)"mis_ctinterface_get_tethering_interface");
  }
  else {
    sub_1000036BC( 1u,  (uint64_t)"%s: tethering interface name: %s",  v1,  v2,  v3,  v4,  v5,  v6,  (uint64_t)"mis_ctinterface_get_tethering_interface");
  }
  return v7;
}

id sub_10001F9D8()
{
  return (id)-[misCTClientSharedInstance isDualSim]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "isDualSim");
}

id sub_10001F9F4()
{
  return -[misCTClientSharedInstance _updateDualSimStatus]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "_updateDualSimStatus");
}

uint64_t sub_10001FA10()
{
  if (!dword_100034D3C) {
    return 0LL;
  }
  if (qword_100035420 || (qword_100035420 = (uint64_t)dispatch_semaphore_create(0LL)) != 0)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    uint64_t result = 0LL;
    byte_100035428 = 1;
  }

  else
  {
    sub_1000036BC(0, (uint64_t)"rtadvd semaphore create failed", v0, v1, v2, v3, v4, v5, v7);
    return 12LL;
  }

  return result;
}

void sub_10001FA8C()
{
  if (byte_100035428 == 1)
  {
    if (qword_100035420)
    {
      dispatch_release((dispatch_object_t)qword_100035420);
      qword_100035420 = 0LL;
    }

    byte_100035428 = 0;
  }

uint64_t sub_10001FACC()
{
  if (!dword_100034D3C) {
    return 0LL;
  }
  if (dword_10003542C < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2LL;
  }

  else if (!dword_10003542C {
         && access("/usr/sbin/rtadvd", 0)
  }
         && (uint64_t v0 = *__error(),
             sub_1000036BC(0, (uint64_t)"%s not available", v2, v3, v4, v5, v6, v7, (uint64_t)"/usr/sbin/rtadvd"),
             (_DWORD)v0))
  {
    int v1 = -1;
  }

  else
  {
    uint64_t v0 = 0LL;
    int v1 = dword_10003542C + 1;
  }

  dword_10003542C = v1;
  return v0;
}

uint64_t sub_10001FB7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = &byte_100034F58[168];
  if (dword_10003542C < 0)
  {
    sub_1000036BC(2u, (uint64_t)"%s not available", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
LABEL_12:
    uint64_t v22 = 0LL;
    goto LABEL_63;
  }

  if (!dword_100034D3C)
  {
    sub_1000036BC(2u, (uint64_t)"%s not enabled", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
    goto LABEL_12;
  }

  if (!dword_1000354D4)
  {
    sub_1000036BC(2u, (uint64_t)"no internal interfaces to start %s", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
    goto LABEL_12;
  }

  pid_t v9 = dword_100035430;
  if (dword_100035430)
  {
    if (!qword_100035438) {
      sub_100023C64();
    }
    if (kill(dword_100035430, 0) != 3)
    {
      unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
      if (sub_1000207D0(v9, (dispatch_queue_t)qword_100035478))
      {
        sub_1000036BC(0, (uint64_t)"rtadvd monitor process failed for process queue", v10, v11, v12, v13, v14, v15, v115);
      }

      else
      {
        if (qword_100035438)
        {
          dispatch_source_cancel((dispatch_source_t)qword_100035438);
          dispatch_release((dispatch_object_t)qword_100035438);
          qword_100035438 = 0LL;
        }

        sub_1000036BC(2u, (uint64_t)"sending KILL to  %s pid %d", v10, v11, v12, v13, v14, v15, (uint64_t)"rtadvd");
        kill(v9, 9);
        dispatch_semaphore_wait((dispatch_semaphore_t)qword_100035420, 0xFFFFFFFFFFFFFFFFLL);
        dword_100035430 = 0;
      }
    }
  }

  uint64_t v29 = (char **)malloc(8LL * dword_1000354D4 + 48);
  *uint64_t v29 = "rtadvd";
  v29[1] = "-c";
  v29[2] = "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf";
  v29[3] = "-f";
  v29[4] = "-s";
  uint64_t v30 = &qword_100035498;
  do
  {
    uint64_t v30 = (uint64_t *)*v30;
    if (!v30)
    {
      uint64_t v36 = qword_100035498;
      if (!qword_100035498) {
        goto LABEL_61;
      }
      char v37 = 0;
      uint64_t v38 = off_100034CB0[0];
      int v39 = 5;
      uint64_t v40 = qword_100035498;
      do
      {
        if (!*(_DWORD *)(v40 + 16)
          && *(_BYTE *)(v40 + 700)
          && *(_DWORD *)(v40 + 20) == 201
          && !strncmp((const char *)(v40 + 565), v38, 0x10uLL))
        {
          if (!*(_BYTE *)(v40 + 1178)) {
            sub_100023C14();
          }
          v29[v39++] = (char *)(v40 + 308);
          char v37 = 1;
        }

        uint64_t v40 = *(void *)v40;
      }

      while (v40);
      uint64_t v41 = v36;
      while (1)
      {
        if (*(_BYTE *)(v41 + 1107))
        {
          if (*(_BYTE *)(v41 + 704)) {
            goto LABEL_46;
          }
        }

        else if (*(_BYTE *)(v41 + 1105))
        {
LABEL_46:
          uint64_t v42 = v36;
          do
          {
            if (*(_BYTE *)(v42 + 700)
              && *(_DWORD *)(v42 + 20) == 201
              && !strncmp((const char *)(v42 + 565), (const char *)(v41 + 308), 0x10uLL))
            {
              v29[v39++] = (char *)(v42 + 308);
              char v37 = 1;
            }

            uint64_t v42 = *(void *)v42;
          }

          while (v42);
        }

        uint64_t v41 = *(void *)v41;
        if (!v41)
        {
          v29[v39] = 0LL;
          if ((v37 & 1) != 0) {
            goto LABEL_54;
          }
LABEL_61:
          uint64_t v22 = 0LL;
          goto LABEL_62;
        }
      }
    }
  }

  while (*((_DWORD *)v30 + 282) != 502);
  sub_1000036BC(1u, (uint64_t)"rtadvd: in nat64 mode", v23, v24, v25, v26, v27, v28, v115);
  xpc_object_t v31 = &qword_100035498;
  do
  {
    xpc_object_t v31 = (uint64_t *)*v31;
    if (!v31) {
      goto LABEL_61;
    }
  }

  while (*((_DWORD *)v31 + 4) != 1);
  uint64_t v32 = qword_100035498;
  if (!qword_100035498) {
    goto LABEL_61;
  }
  char v33 = 0;
  uint64_t v34 = (char *)v31 + 308;
  int v35 = 5;
  do
  {
    if (*(_BYTE *)(v32 + 700) && *(_DWORD *)(v32 + 20) == 201 && !strncmp((const char *)(v32 + 565), v34, 0x10uLL))
    {
      if (*(_DWORD *)(v32 + 1128) != 502) {
        sub_100023C3C();
      }
      v29[v35++] = (char *)(v32 + 308);
      char v33 = 1;
    }

    uint64_t v32 = *(void *)v32;
  }

  while (v32);
  v29[v35] = 0LL;
  if ((v33 & 1) == 0) {
    goto LABEL_61;
  }
LABEL_54:
  snprintf((char *)__str, 0x100uLL, "%s-", "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
  uint64_t v43 = fopen((const char *)__str, "w");
  if (!v43)
  {
    uint64_t v22 = *__error();
    sub_1000036BC(0, (uint64_t)"fopen(%s) failed: %m", v48, v49, v50, v51, v52, v53, (uint64_t)__str);
    if (!(_DWORD)v22) {
      goto LABEL_143;
    }
    goto LABEL_141;
  }

  uint64_t v44 = v43;
  uint64_t v22 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_140:
    fclose(v44);
    rename((const char *)__str, "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    if ((_DWORD)v22) {
      goto LABEL_141;
    }
LABEL_143:
    uint64_t v22 = sub_10000ED00(v120, __str);
    if (!(_DWORD)v22)
    {
      uint64_t v87 = posix_spawn(v119, "/usr/sbin/rtadvd", __str, v120, v29, environ);
      uint64_t v22 = v87;
      if ((_DWORD)v87)
      {
        strerror(v87);
        sub_1000036BC(0, (uint64_t)"spawn %s:%s", v94, v95, v96, v97, v98, v99, (uint64_t)"rtadvd");
      }

      else
      {
        sub_1000036BC(1u, (uint64_t)"spawned %s as pid %d", v88, v89, v90, v91, v92, v93, (uint64_t)"rtadvd");
        int v100 = v119[0];
        *((_DWORD *)v8 + 26++*(_DWORD *)(result + 8) = v119[0];
        if (sub_1000207D0(v100, (dispatch_queue_t)qword_100035470))
        {
          uint64_t v107 = sub_1000036BC(0, (uint64_t)"rtadvd monitor process error", v101, v102, v103, v104, v105, v106, v116);
          sub_1000208A4(v107, v108, v109, v110, v111, v112, v113, v114, v117);
        }
      }

      posix_spawnattr_destroy(v120);
      posix_spawn_file_actions_destroy(__str);
    }

    goto LABEL_62;
  }

  uint64_t v45 = qword_100035498;
  while (*(_DWORD *)(v45 + 16) != 1 || !*(_BYTE *)(v45 + 564))
  {
    uint64_t v45 = *(void *)v45;
    if (!v45)
    {
      char v46 = 1;
      goto LABEL_70;
    }
  }

  char v46 = 0;
  do
  {
LABEL_70:
    if (!*(_DWORD *)(v22 + 16)
      && *(_BYTE *)(v22 + 700)
      && *(_DWORD *)(v22 + 20) == 201
      && !strncmp((const char *)(v22 + 565), off_100034CB0[0], 0x10uLL))
    {
      if (!*(_BYTE *)(v22 + 1178)) {
        sub_100023BC4();
      }
      fprintf(v44, "%s:\\\n", (const char *)(v22 + 308));
      fprintf(v44, "\t:maxinterval#%u", 135);
      fprintf(v44, ":mininterval#%u:\\\n", 45);
      fputc(9, v44);
      int v54 = sub_10000E83C(v22);
      int v55 = dword_1000354BC;
      if (!v54 && dword_1000354BC)
      {
        fprintf(v44, ":raflags#%u", 64);
        int v55 = dword_1000354BC;
      }

      BOOL v56 = v55 == 0;
      int v57 = 9000;
      if (v56) {
        int v57 = 0;
      }
      fprintf(v44, ":rltime#%u:\\\n", v57);
      fprintf( v44,  "\t:addr=%s:prefixlen#%u:pinfoflags#%u\\\n",  (const char *)(v22 + 1132),  *(unsigned __int8 *)(v22 + 1178),  192);
      if (*(_DWORD *)(v22 + 664) || *(_DWORD *)(v22 + 668) || *(_DWORD *)(v22 + 672) || *(_DWORD *)(v22 + 676))
      {
        fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v44);
        inet_ntop(30, (const void *)(v22 + 664), (char *)v120, 0x2Eu);
        fprintf(v44, "\t:rdnssaddr%d=%s:\\\n", 0, (const char *)v120);
      }

      if ((v46 & 1) == 0)
      {
        unsigned int v58 = *(_DWORD *)(v45 + 296);
        if (v58 >= *(_DWORD *)(v22 + 296)) {
          unsigned int v58 = *(_DWORD *)(v22 + 296);
        }
        fprintf(v44, "\t:mtu#%u\n", v58);
      }
    }

    uint64_t v22 = *(void *)v22;
  }

  while (v22);
  uint64_t v59 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_138:
    uint64_t v22 = 0LL;
LABEL_139:
    uint64_t v8 = byte_100034F58 + 168;
    goto LABEL_140;
  }

  while (2)
  {
    if (!*(_DWORD *)(v59 + 16)) {
      goto LABEL_137;
    }
    int v60 = *(unsigned __int8 *)(v59 + 1107);
    if (*(_BYTE *)(v59 + 1107))
    {
      if (!*(_BYTE *)(v59 + 704)) {
        goto LABEL_137;
      }
    }

    else if (!*(_BYTE *)(v59 + 1105) && *(_DWORD *)(v59 + 1128) != 502)
    {
LABEL_137:
      uint64_t v59 = *(void *)v59;
      if (!v59) {
        goto LABEL_138;
      }
      continue;
    }

    break;
  }

  uint64_t v61 = qword_100035498;
  if (!qword_100035498) {
    goto LABEL_137;
  }
  int v62 = (const char *)(v59 + 308);
  uint64_t v63 = 848LL;
  if (!*(_BYTE *)(v59 + 1107)) {
    uint64_t v63 = 296LL;
  }
  uint64_t v118 = v63;
  while (2)
  {
    if (!*(_BYTE *)(v61 + 700) || *(_DWORD *)(v61 + 20) != 201 || strncmp((const char *)(v61 + 565), v62, 0x10uLL))
    {
LABEL_133:
      uint64_t v61 = *(void *)v61;
      if (!v61) {
        goto LABEL_137;
      }
      continue;
    }

    break;
  }

  fprintf(v44, "%s:\\\n", (const char *)(v61 + 308));
  fprintf(v44, "\t:maxinterval#%u", 135);
  fprintf(v44, ":mininterval#%u:\\\n", 45);
  if (v60) {
    fprintf(v44, "\t:chlim#%u", *(unsigned __int8 *)(v59 + 876));
  }
  else {
    fputc(9, v44);
  }
  if (!v60)
  {
    fprintf(v44, ":rltime#%u:\\\n", 9000);
    if (*(_DWORD *)(v61 + 1128) == 502)
    {
      fprintf(v44, "\t:addr0=%s:prefixlen0#%u:pinfoflags0#%u:\\\n", (const char *)(v61 + 1132), 64, 192);
      if (!byte_100035483) {
LABEL_123:
      }
        fprintf(v44, "\t:pref64addr=%s:pref64len#%u:pref64lifetime#%u:\\\n");
    }

    else
    {
      fprintf(v44, "\t:addr0=%s:prefixlen0#%u:pinfoflags0#%u:\\\n");
    }

    goto LABEL_125;
  }

  unsigned int v64 = *(unsigned __int16 *)(v59 + 814);
  if (v64 >= 0x2328) {
    unsigned int v64 = 9000;
  }
  fprintf(v44, ":rltime#%u", v64);
  fprintf(v44, ":rtime#%u", 1000 * *(_DWORD *)(v59 + 860));
  fprintf(v44, ":retrans#%u:\\\n", *(_DWORD *)(v59 + 864));
  inet_ntop(30, (const void *)(v59 + 720), (char *)v120, 0x2Eu);
  if (*(_BYTE *)(v59 + 904))
  {
    fprintf( v44,  "\t:addr0=%s:prefixlen0#%u:pinfoflags0#%u",  (const char *)v120,  *(unsigned __int8 *)(v59 + 741),  192);
    fprintf(v44, ":vltime0#%lu", *(void *)(v59 + 744));
    fwrite(":vltimedecr0#true", 0x11uLL, 1uLL, v44);
    fprintf(v44, ":pltime0#%lu", *(void *)(v59 + 752));
    fwrite(":pltimedecr0#true:\\\n", 0x14uLL, 1uLL, v44);
    inet_ntop(30, (const void *)(v59 + 920), (char *)v120, 0x2Eu);
    int v62 = (const char *)(v59 + 308);
    fprintf( v44,  "\t:addr1=%s:prefixlen1#%u:pinfoflags1#%u",  (const char *)v120,  *(unsigned __int8 *)(v59 + 741),  192);
    fwrite(":vltime1#0", 0xAuLL, 1uLL, v44);
    uint64_t v65 = ":pltime1#0:\\\n";
    size_t v66 = 13LL;
  }

  else
  {
    fprintf(v44, "\t:addr=%s:prefixlen#%u:pinfoflags#%u", (const char *)v120, *(unsigned __int8 *)(v59 + 741), 192);
    fprintf(v44, ":vltime#%lu", *(void *)(v59 + 744));
    fwrite(":vltimedecr#true", 0x10uLL, 1uLL, v44);
    fprintf(v44, ":pltime#%lu", *(void *)(v59 + 752));
    uint64_t v65 = ":pltimedecr#true:\\\n";
    size_t v66 = 19LL;
  }

  fwrite(v65, v66, 1uLL, v44);
  if (*(_DWORD *)(v59 + 1264) != 1 || byte_100035483)
  {
LABEL_125:
    if (*(_DWORD *)(v61 + 664) || *(_DWORD *)(v61 + 668) || *(_DWORD *)(v61 + 672) || *(_DWORD *)(v61 + 676))
    {
      fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v44);
      int v62 = (const char *)(v59 + 308);
      inet_ntop(30, (const void *)(v61 + 664), (char *)v120, 0x2Eu);
      fprintf(v44, "\t:rdnssaddr%d=%s:\\\n", 0, (const char *)v120);
    }

    else if (*(_DWORD *)(v61 + 1128) == 502)
    {
      sub_1000036BC(0, (uint64_t)"%s: IPv6 LL address not found", v67, v68, v69, v70, v71, v72, v61 + 308);
      uint64_t v22 = 6LL;
      goto LABEL_139;
    }

    unsigned int v73 = *(_DWORD *)(v61 + 296);
    if (*(_DWORD *)(v59 + v118) < v73) {
      unsigned int v73 = *(_DWORD *)(v59 + v118);
    }
    fprintf(v44, "\t:mtu#%u\n", v73);
    goto LABEL_133;
  }

  uint64_t v22 = *__error();
  sub_1000036BC( 0,  (uint64_t)"%s: inet_ntop failed for nat64 prefix: %m",  v81,  v82,  v83,  v84,  v85,  v86,  (uint64_t)"rtadvd_config_create");
  fclose(v44);
  uint64_t v8 = &byte_100034F58[168];
  if (!(_DWORD)v22) {
    goto LABEL_143;
  }
LABEL_141:
  uint64_t v74 = strerror(v22);
  sub_1000036BC(0, (uint64_t)"rtadvd_config_create: %s", v75, v76, v77, v78, v79, v80, (uint64_t)v74);
LABEL_62:
  free(v29);
  if (!(_DWORD)v22)
  {
LABEL_63:
    if (*((_DWORD *)v8 + 268)) {
      sub_1000036BC(0, (uint64_t)"started %s", v16, v17, v18, v19, v20, v21, (uint64_t)"rtadvd");
    }
  }

  return v22;
}

uint64_t sub_1000207D0(int a1, dispatch_queue_t queue)
{
  uint64_t v3 = (dispatch_queue_s *)qword_100035478;
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a1, 0x80000000uLL, queue);
  uint64_t v5 = v4;
  if (v3 == queue)
  {
    if (v4)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = sub_1000209EC;
      handler[3] = &unk_100031060;
      handler[4] = v4;
      dispatch_source_set_event_handler(v4, handler);
      uint64_t v6 = v5;
      goto LABEL_6;
    }
  }

  else
  {
    qword_100035438 = (uint64_t)v4;
    if (v4)
    {
      dispatch_source_set_event_handler(v4, &stru_1000310A0);
      uint64_t v6 = (dispatch_object_s *)qword_100035438;
LABEL_6:
      dispatch_resume(v6);
      return 0LL;
    }
  }

  return 12LL;
}

void sub_1000208A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  pid_t v9 = dword_100035430;
  if (dword_100035430 && kill(dword_100035430, 0) != 3)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    if (sub_1000207D0(v9, (dispatch_queue_t)qword_100035478))
    {
      sub_1000036BC(0, (uint64_t)"rtadvd monitor process failed for process queue", v10, v11, v12, v13, v14, v15, a9);
    }

    else
    {
      if (qword_100035438)
      {
        dispatch_source_cancel((dispatch_source_t)qword_100035438);
        dispatch_release((dispatch_object_t)qword_100035438);
        qword_100035438 = 0LL;
      }

      sub_1000036BC(2u, (uint64_t)"sending TERM to  %s pid %d", v10, v11, v12, v13, v14, v15, (uint64_t)"rtadvd");
      kill(v9, 15);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_100035420, 0xFFFFFFFFFFFFFFFFLL);
      dword_100035430 = 0;
    }
  }

void sub_100020988( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_10003542C & 0x80000000) == 0)
  {
    else {
      sub_10001FB7C(a1, a2, a3, a4, a5, a6, a7, a8);
    }
    if (dword_10003542C >= 1) {
      --dword_10003542C;
    }
  }

uint64_t sub_1000209EC(uint64_t a1)
{
  pid_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  waitpid(data, &v10, 1);
  sub_1000036BC(2u, (uint64_t)"%s exit", v3, v4, v5, v6, v7, v8, (uint64_t)"rtadvd");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_100035420);
}

void sub_100020A5C(id a1)
{
  pid_t data = dispatch_source_get_data((dispatch_source_t)qword_100035438);
  waitpid(data, &v8, 1);
  sub_1000036BC(2u, (uint64_t)"%s exit", v2, v3, v4, v5, v6, v7, (uint64_t)"rtadvd");
  if (dword_100035430)
  {
    dword_100035430 = 0;
    dispatch_source_cancel((dispatch_source_t)qword_100035438);
    dispatch_release((dispatch_object_t)qword_100035438);
    qword_100035438 = 0LL;
  }

uint64_t sub_100020AD4()
{
  if (dword_100034D40)
  {
    sub_10000F4D8((uint64_t)@"com.apple.dhcp6d", (uint64_t)"dhcp6d", 0LL);
    byte_100035444 = 0;
    unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
  }

  return 0LL;
}

uint64_t sub_100020B28()
{
  if (dword_100035440 < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2LL;
  }

  else
  {
    if (dword_100035440) {
      goto LABEL_3;
    }
    if (!dword_100034D40) {
      return 0LL;
    }
    if (access("/usr/libexec/dhcp6d", 0)
      && (uint64_t v0 = *__error(),
          sub_1000036BC(0, (uint64_t)"%s not available", v3, v4, v5, v6, v7, v8, (uint64_t)"/usr/libexec/dhcp6d"),
          (_DWORD)v0))
    {
      int v1 = -1;
    }

    else
    {
LABEL_3:
      uint64_t v0 = 0LL;
      int v1 = dword_100035440 + 1;
    }
  }

  dword_100035440 = v1;
  return v0;
}

uint64_t sub_100020BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100035440 < 0)
  {
    uint64_t v47 = "dhcp6d";
    uint64_t v16 = "%s not available";
LABEL_27:
    unsigned __int8 v45 = 1;
    goto LABEL_28;
  }

  if (!dword_100034D40)
  {
    uint64_t v47 = "dhcp6d";
    uint64_t v16 = "%s not enabled";
    goto LABEL_27;
  }

  if (!dword_1000354D4)
  {
    uint64_t v16 = "no internal interfaces to start dhcpd";
    goto LABEL_27;
  }

  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  values = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  for (uint64_t i = qword_100035498; i; uint64_t i = *(void *)i)
  {
    if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
    {
      if (*(_DWORD *)(i + 664)
        || *(_DWORD *)(i + 668)
        || *(_DWORD *)(i + 672)
        || *(_DWORD *)(i + 676)
        || !sub_10000E83C(i))
      {
        sub_10000EEA8(Mutable, (const char *)(i + 308));
        inet_ntop(30, (const void *)(i + 664), v50, 0x2Eu);
        sub_10000EEA8((const __CFArray *)values, v50);
      }

      else
      {
        sub_1000036BC(0, (uint64_t)"dhcp6d: can't get linklocal address on %s", v10, v11, v12, v13, v14, v15, i + 308);
      }
    }
  }

  if (!CFArrayGetCount(Mutable))
  {
    sub_1000036BC(0, (uint64_t)"dhcp6d: no enabled interfaces", v17, v18, v19, v20, v21, v22, (uint64_t)v47);
    CFRelease(Mutable);
    CFRelease(values);
    uint64_t v27 = 22LL;
LABEL_30:
    uint64_t v47 = strerror(v27);
    uint64_t v44 = "dhcp6d_config_create: %s";
    goto LABEL_31;
  }

  uint64_t v23 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v23, @"enabled_interfaces", Mutable);
  CFRelease(Mutable);
  keys = @"dhcp_dns_servers";
  CFDictionaryRef v24 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFDictionarySetValue(v23, @"options", v24);
  CFRelease(v24);
  if (byte_100035480) {
    CFDictionarySetValue(v23, @"verbose", kCFBooleanTrue);
  }
  uid_t v25 = geteuid();
  gid_t v26 = getgid();
  uint64_t v27 = sub_10000EFF0(v23, "/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist", v25, v26, 420LL, 0);
  CFRelease(v23);
  if ((_DWORD)v27) {
    goto LABEL_30;
  }
  if (byte_100035444 != 1)
  {
    uint64_t v27 = sub_10000F4D8((uint64_t)@"com.apple.dhcp6d", (uint64_t)"dhcp6d", 1LL);
    if (!(_DWORD)v27)
    {
      byte_100035444 = 1;
      sub_1000036BC(0, (uint64_t)"started %s", v38, v39, v40, v41, v42, v43, (uint64_t)"dhcp6d");
      return v27;
    }

    uint64_t v44 = "unable to load dhcp6d job";
    goto LABEL_31;
  }

  pid_t v28 = sub_10000CD6C("/usr/libexec/dhcp6d");
  if (v28)
  {
    uint64_t v29 = kill(v28, 1);
    if ((_DWORD)v29)
    {
      uint64_t v27 = v29;
      uint64_t v30 = __error();
      xpc_object_t v31 = strerror(*v30);
      sub_1000036BC(0, (uint64_t)"dhcp6d(HUP): %s", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      uint64_t v47 = strerror(v27);
      uint64_t v44 = "dhcp6d_sighup failed: %s";
LABEL_31:
      sub_1000036BC(0, (uint64_t)v44, v38, v39, v40, v41, v42, v43, (uint64_t)v47);
      return v27;
    }
  }

  uint64_t v16 = "dhcp6d_sighup succeeded";
  unsigned __int8 v45 = 0;
LABEL_28:
  sub_1000036BC(v45, (uint64_t)v16, a3, a4, a5, a6, a7, a8, (uint64_t)v47);
  return 0LL;
}

uint64_t sub_100020F80( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_100035440 & 0x80000000) == 0)
  {
    if (dword_100035440 < 2 || (_DWORD)qword_1000354D4 == 0)
    {
      sub_10000F4D8((uint64_t)@"com.apple.dhcp6d", (uint64_t)"dhcp6d", 0LL);
      byte_100035444 = 0;
      uint64_t result = unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
    }

    else
    {
      uint64_t result = sub_100020BD8(result, a2, a3, a4, a5, a6, a7, a8);
    }

    if (dword_100035440 >= 1) {
      --dword_100035440;
    }
  }

  return result;
}

xpc_object_t sub_100021000()
{
  if (getifaddrs(&v13) == -1) {
    return 0LL;
  }
  uint64_t v0 = v13;
  if (v13)
  {
    xpc_object_t v1 = 0LL;
    while (1)
    {
      if (v0->ifa_addr->sa_family == 18)
      {
        ifa_pid_t data = (unsigned __int8 *)v0->ifa_data;
        if (ifa_data)
        {
          int v3 = *ifa_data;
          ifa_name = v0->ifa_name;
          if (v3 == 6)
          {
            CFStringRef v5 = CFStringCreateWithCString(0LL, v0->ifa_name, 0x8000100u);
            uint64_t v6 = (const void *)_SCNetworkInterfaceCreateWithBSDName(0LL, v5, 0LL);
            CFRelease(v5);
            if (v6)
            {
              if (_SCNetworkInterfaceSupportsVMNETBridgedMode(v6))
              {
                CFRelease(v6);
LABEL_7:
                if (!v1) {
                  xpc_object_t v1 = xpc_array_create(0LL, 0LL);
                }
                xpc_array_set_string(v1, 0xFFFFFFFFFFFFFFFFLL, ifa_name);
                goto LABEL_16;
              }

              if (_SCNetworkInterfaceIsHiddenConfiguration(v6)
                || (CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType((SCNetworkInterfaceRef)v6)) == 0LL)
              {
LABEL_15:
                CFRelease(v6);
                goto LABEL_16;
              }

              CFStringRef v8 = InterfaceType;
              if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211))
              {
                int v9 = strncmp(ifa_name, "en", 2uLL);
                CFRelease(v6);
                if (!v9) {
                  goto LABEL_7;
                }
              }

              else
              {
                int IsPhysicalEthernet = _SCNetworkInterfaceIsPhysicalEthernet(v6);
                CFRelease(v6);
                if (IsPhysicalEthernet) {
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }

void sub_1000211D8()
{
  if (dword_100034D34) {
    byte_100035448 = 1;
  }
}

void sub_1000211F8()
{
  if (byte_100035448 == 1) {
    byte_100035448 = 0;
  }
}

uint64_t sub_100021210( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100034D34)
  {
    uint64_t v10 = (const char *)(a1 + 308);
    uint64_t v11 = &qword_1000354E0;
    while (1)
    {
      uint64_t v11 = (uint64_t *)*v11;
      if (!v11) {
        break;
      }
    }

    uint64_t v18 = (uint64_t *)malloc(0x40uLL);
    if (v18)
    {
      uint64_t v11 = v18;
      *((_OWORD *)v18 + 2) = 0u;
      *((_OWORD *)v18 + 3) = 0u;
      *(_OWORD *)uint64_t v18 = 0u;
      *((_OWORD *)v18 + 1) = 0u;
      BOOL v25 = *(_DWORD *)(a1 + 1128) == 502;
      *((_DWORD *)v18 + 11) = v25;
      if (v25)
      {
        sub_1000036BC( 0,  (uint64_t)"%s: dns64 is supported only on macOS",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"dns_proxy_insert_interfaces");
        if (*((_DWORD *)v11 + 11)) {
          sub_100023CB4();
        }
      }

      xpc_object_t v26 = xpc_array_create(0LL, 0LL);
      v11[4] = (uint64_t)v26;
      if (v26)
      {
        snprintf((char *)v11 + 8, 0x10uLL, "%s", v10);
        *uint64_t v11 = qword_1000354E0;
        qword_1000354E0 = (uint64_t)v11;
        ++dword_10003544C;
LABEL_13:
        sub_1000036BC(2u, (uint64_t)"%s: before:", v12, v13, v14, v15, v16, v17, (uint64_t)"dns_proxy_insert_interfaces");
        uint64_t v27 = (void *)v11[4];
        if (v27)
        {
          size_t count = xpc_array_get_count((xpc_object_t)v11[4]);
          if (count)
          {
            size_t v29 = count;
            for (size_t i = 0LL; i != v29; ++i)
            {
              xpc_array_get_string(v27, i);
              sub_1000036BC(2u, (uint64_t)"%ld. %s", v31, v32, v33, v34, v35, v36, i);
            }
          }
        }

        size_t v37 = xpc_array_get_count(a2);
        if (v37)
        {
          size_t v44 = v37;
          size_t v45 = 0LL;
          char v46 = 0;
          while (1)
          {
            string = xpc_array_get_string(a2, v45);
            uint64_t v48 = (void *)v11[4];
            size_t v49 = xpc_array_get_count(v48);
            if (!v49) {
              goto LABEL_25;
            }
            unint64_t v50 = v49;
            uint64_t v51 = xpc_array_get_string(v48, 0LL);
            if (strcmp(v51, string)) {
              break;
            }
LABEL_27:
            if (++v45 == v44) {
              goto LABEL_30;
            }
          }

          size_t v52 = 1LL;
          while (v50 != v52)
          {
            uint64_t v53 = xpc_array_get_string(v48, v52++);
            if (!strcmp(v53, string))
            {
              if (v52 - 1 < v50) {
                goto LABEL_27;
              }
              break;
            }
          }

uint64_t sub_100021534( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v58 = -1;
  if (!dword_100034D34)
  {
    uint64_t v16 = "dns proxy not enabled";
LABEL_9:
    sub_1000036BC(2u, (uint64_t)v16, a3, a4, a5, a6, a7, a8, v56);
    return v58;
  }

  if (!*(_DWORD *)(a1 + 40))
  {
    uint64_t v16 = "no internal interfaces to start dns proxy";
    goto LABEL_9;
  }

  uint64_t v15 = mrc_dns_proxy_parameters_create(&v58);
  if (v58)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: mrc_dns_proxy_parameters_create failed, %d",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"dns_proxy_start");
    goto LABEL_5;
  }

  int64_t count = xpc_array_get_count(*(xpc_object_t *)(a1 + 32));
  if (count < 1)
  {
LABEL_15:
    if (!strncmp((const char *)(a1 + 8), off_100034CB0[0], 0x10uLL))
    {
      uint64_t v29 = 0LL;
    }

    else
    {
      uint64_t v29 = if_nametoindex((const char *)(a1 + 8));
      if (!(_DWORD)v29)
      {
        sub_1000036BC( 0,  (uint64_t)"%s: external interface %s does not exist",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"dns_proxy_start");
        goto LABEL_5;
      }
    }

    mrc_dns_proxy_parameters_set_output_interface(v15, v29);
    if (*(_DWORD *)(a1 + 44))
    {
      sub_1000036BC( 0,  (uint64_t)"%s: dns64 only supported on macOS",  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)"dns_proxy_start");
      if (*(_DWORD *)(a1 + 44)) {
        sub_100023CDC();
      }
    }

    if (*(void *)(a1 + 24))
    {
      mrc_dns_proxy_invalidate();
      *(void *)(a1 + 24) = 0LL;
    }

    uint64_t v42 = mrc_dns_proxy_create(v15, &v58);
    if (v42)
    {
      uint64_t v49 = v42;
      mrc_dns_proxy_set_queue(v42, qword_100035470);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 0x40000000LL;
      v57[2] = sub_100021AC0;
      v57[3] = &unk_1000310C0;
      v57[4] = v49;
      mrc_dns_proxy_set_event_handler(v49, v57);
      mrc_dns_proxy_activate(v49);
      sub_1000036BC( 0,  (uint64_t)"%s: DNS proxy %p external interface %s",  v50,  v51,  v52,  v53,  v54,  v55,  (uint64_t)"dns_proxy_start");
      *(void *)(a1 + 24) = v49;
      unsigned int v58 = 0;
      if (!v15) {
        return v58;
      }
      goto LABEL_6;
    }

    sub_1000036BC( 0,  (uint64_t)"%s: mrc_dns_proxy_create() failed, %d",  v43,  v44,  v45,  v46,  v47,  v48,  (uint64_t)"dns_proxy_start");
  }

  else
  {
    int64_t v19 = count;
    size_t v20 = 0LL;
    while (1)
    {
      string = xpc_array_get_string(*(xpc_object_t *)(a1 + 32), v20);
      uint64_t v22 = if_nametoindex(string);
      if (!(_DWORD)v22) {
        break;
      }
      mrc_dns_proxy_parameters_add_input_interface(v15, v22);
      if (v19 == ++v20) {
        goto LABEL_15;
      }
    }

    sub_1000036BC( 0,  (uint64_t)"%s: internal interface %s does not exist",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)"dns_proxy_start");
  }

LABEL_5:
  if (v15) {
LABEL_6:
  }
    mrc_release(v15);
  return v58;
}

uint64_t sub_100021790( char *__s2, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!dword_100034D34)
  {
    uint64_t v40 = "dns proxy not enabled";
    unsigned __int8 v41 = 2;
LABEL_24:
    sub_1000036BC(v41, (uint64_t)v40, a3, a4, a5, a6, a7, a8, (uint64_t)v64);
    return 22LL;
  }

  uint64_t v10 = &qword_1000354E0;
  uint64_t v11 = &qword_1000354E0;
  do
  {
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11)
    {
      size_t v64 = __s2;
      uint64_t v40 = "%s, dns lookup external failed";
      unsigned __int8 v41 = 0;
      goto LABEL_24;
    }
  }

  while (strncmp((const char *)v11 + 8, __s2, 0x10uLL));
  sub_1000036BC(2u, (uint64_t)"%s: before:", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_remove_interfaces");
  uint64_t v12 = (void *)v11[4];
  if (v12)
  {
    size_t count = xpc_array_get_count((xpc_object_t)v11[4]);
    if (count)
    {
      size_t v14 = count;
      for (size_t i = 0LL; i != v14; ++i)
      {
        xpc_array_get_string(v12, i);
        sub_1000036BC(2u, (uint64_t)"%ld. %s", v16, v17, v18, v19, v20, v21, i);
      }
    }
  }

  uint64_t v22 = (void *)v11[4];
  xpc_object_t v23 = xpc_array_create(0LL, 0LL);
  size_t v24 = xpc_array_get_count(v22);
  if (!v24)
  {
    int v26 = 0;
LABEL_27:
    xpc_release(v23);
    goto LABEL_28;
  }

  size_t v25 = v24;
  int v26 = 0;
  size_t v27 = 0LL;
  while (2)
  {
    string = xpc_array_get_string(v22, v27);
    size_t v29 = xpc_array_get_count(a2);
    if (v29)
    {
      unint64_t v30 = v29;
      uint64_t v31 = xpc_array_get_string(a2, 0LL);
      if (strcmp(v31, string))
      {
        size_t v32 = 1LL;
        while (v30 != v32)
        {
          uint64_t v33 = xpc_array_get_string(a2, v32++);
          if (!strcmp(v33, string))
          {
            if (v32 - 1 >= v30) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
        }

        goto LABEL_18;
      }

uint64_t sub_100021AC0( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  switch(a2)
  {
    case -1:
      int v9 = a3;
      sub_1000036BC(0, (uint64_t)"%s: %p %s", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_handle_event");
      mrc_release(v8);
      if (v9) {
        uint64_t result = sub_1000036BC( 0,  (uint64_t)"%s: dns proxy failed %d",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"dns_proxy_handle_event");
      }
      else {
        uint64_t result = sub_1000036BC( 0,  (uint64_t)"%s: dns proxy all done",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"dns_proxy_handle_event");
      }
      break;
    default:
      uint64_t result = sub_1000036BC(0, (uint64_t)"%s: %p %s", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_handle_event");
      break;
  }

  return result;
}

void sub_100021BB0(void *a1)
{
  *(_WORD *)uint64_t v2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create os log object",  v2,  2u);
  *a1 = qword_100034EB8;
}

void sub_100021C0C()
{
  __assert_rtn("mis_create_nexus_controller", "mis_lowlatency.c", 542, "nexus_controller_handle == NULL");
}

void sub_100021C34()
{
}

void sub_100021C5C()
{
}

void sub_100021C84()
{
}

void sub_100021CAC()
{
  __assert_rtn("netrbServiceRequestAdd", "mis_rpc.c", 57, "mis_nsvc_request != 0");
}

void sub_100021CD4()
{
  __assert_rtn( "netrbServiceRequestAdd",  "mis_rpc.c",  48,  "service != NULL && connection != NULL && reply != NULL && m != NULL");
}

void sub_100021CFC()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 68, "m != NULL");
}

void sub_100021D24()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 73, "mis_nsvc_request != 0");
}

void sub_100021D4C()
{
}

void sub_100021D74()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 245, "mis_nsvc != 0");
}

void sub_100021D9C()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 221, "m->ms_bridge->mi_delete != NULL");
}

void sub_100021DC4()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 208, "m->ms_svcstate == MIS_SVC_IDLE");
}

void sub_100021DEC()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3447, "mif->mi_refcnt != 0");
}

void sub_100021E14()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3455, "mis_nif != 0");
}

void sub_100021E3C()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 386, "natInfo != NULL");
}

void sub_100021E64()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 568, "mis_nsvc != 0");
}

void sub_100021E8C()
{
  __assert_rtn("mis_is_bridgeable", "mis_impl.c", 4332, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_100021EB4()
{
  __assert_rtn("mis_if_lookup", "mis_impl.c", 3316, "mif->mi_refcnt != 0");
}

void sub_100021EDC()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4577, "ifname != NULL");
}

void sub_100021F04()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4578, "ifname[0] != '\\0'");
}

void sub_100021F2C()
{
  __assert_rtn("mis_if_get_extif", "mis_impl.c", 3491, "mif->mi_refcnt != 0");
}

void sub_100021F54()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3376, "natInfo != NULL");
}

void sub_100021F7C()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3419, "mis_nif != 0");
}

void sub_100021FA4()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3352, "!(if_address_fixed && saddr != NULL)");
}

void sub_100021FCC()
{
  __assert_rtn( "mis_if_create",  "mis_impl.c",  3341,  "iftype == MIS_IFTYPE_PDP || iftype == MIS_IFTYPE_AUTH || iftype == MIS_IFTYPE_BROADCAST || iftype == MIS_IFTYPE_BROA DCAST_LOCAL || iftype == MIS_IFTYPE_BRIDGE");
}

void sub_100021FF4()
{
  __assert_rtn("mis_if_get_bridge", "mis_impl.c", 3565, "mif->mi_refcnt != 0");
}

void sub_10002201C()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 734, "mif_ext->mi_class == MIS_IFCLASS_EXT && result != EINPROGRESS");
}

void sub_100022044()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 738, "m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_10002206C()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 630, "mif_int->mi_add != NULL");
}

void sub_100022094()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 652, "mif_int != NULL && mif_int->mi_start != NULL");
}

void sub_1000220BC()
{
}

void sub_1000220E4()
{
  __assert_rtn("mis_send_svc_usage_event", "mis_impl.c", 5784, "now >= ms->ms_start_time");
}

void sub_10002210C()
{
  __assert_rtn( "mis_svc_start_external_interface",  "mis_impl.c",  590,  "m->ms_ext != NULL && m->ms_ext->mi_start != NULL");
}

void sub_100022134()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 865, "mc->mc_mis == NULL");
}

void sub_10002215C()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 863, "m->ms_client == NULL");
}

void sub_100022184()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 861, "err != EINPROGRESS || m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_1000221AC()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1194, "mis_nnwi_ipv6 != 0");
}

void sub_1000221D4()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1188, "mis_nnwi != 0");
}

void sub_1000221FC()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2233, "mif->mi_name[0] != '\\0'");
}

void sub_100022224()
{
}

void sub_10002224C()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2232, "mif->mi_mode == NETRB_INTERNET_SHARING_MODE");
}

void sub_100022274()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2231, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_10002229C()
{
}

void sub_1000222C4()
{
  __assert_rtn("mis_listen_prefix_events", "mis_impl.c", 2157, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_1000222EC()
{
  __assert_rtn("mis_cleanup_external_listeners", "mis_impl.c", 2253, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022314()
{
}

void sub_10002233C()
{
}

void sub_100022364()
{
}

void sub_10002238C()
{
  __assert_rtn("mis_netrb_remote_connection_release", "mis_impl.c", 2860, "ne->ne_refcnt != 0");
}

void sub_1000223B4()
{
}

void sub_1000223DC()
{
  __assert_rtn("mis_netrb_remote_connection_create", "mis_impl.c", 2963, "mis_nepoint != 0");
}

void sub_100022404()
{
}

void sub_10002242C()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3015, "mis_nclient != 0");
}

void sub_100022454()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3022, "mis_xpc_transaction == NULL");
}

void sub_10002247C()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3058, "mis_nclient != 0");
}

void sub_1000224A4()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3092, "mis_xpc_transaction != NULL");
}

void sub_1000224CC()
{
}

void sub_1000224F4()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3073, "mc->mc_mis == NULL");
}

void sub_10002251C()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3071, "mc->mc_mis->ms_client == mc");
}

void sub_100022544()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3162, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_10002256C()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3195, "mc->mc_host_count[iftype] != 0");
}

void sub_100022594()
{
  __assert_rtn( "mis_client_remove_host",  "mis_impl.c",  3206,  "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000225BC()
{
  __assert_rtn( "mis_client_set_host_count",  "mis_impl.c",  3289,  "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000225E4()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3821, "err != 0");
}

void sub_10002260C()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3763, "interface_network_mask != NULL");
}

void sub_100022634()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4197, "ifname != NULL");
}

void sub_10002265C()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4198, "ifname[0] != '\\0'");
}

void sub_100022684()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4394, "ifname != NULL");
}

void sub_1000226AC()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4395, "ifname[0] != '\\0'");
}

void sub_1000226D4()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4430, "ifname != NULL");
}

void sub_1000226FC()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4431, "ifname[0] != '\\0'");
}

void sub_100022724()
{
  __assert_rtn("interface_back", "mis_impl.c", 4226, "ifname != NULL");
}

void sub_10002274C()
{
  __assert_rtn("interface_back", "mis_impl.c", 4227, "ifname[0] != '\\0'");
}

void sub_100022774()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4275, "ifname != NULL");
}

void sub_10002279C()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4276, "ifname[0] != '\\0'");
}

void sub_1000227C4()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4467, "ifname != NULL");
}

void sub_1000227EC()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4468, "ifname[0] != '\\0'");
}

void sub_100022814()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4502, "ifname != NULL");
}

void sub_10002283C()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4503, "ifname[0] != '\\0'");
}

void sub_100022864()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4312, "ifname != NULL");
}

void sub_10002288C()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4313, "ifname[0] != '\\0'");
}

void sub_1000228B4()
{
  __assert_rtn("mis_get_interface_flags", "mis_impl.c", 4369, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_1000228DC()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4538, "ifname != NULL");
}

void sub_100022904()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4539, "ifname[0] != '\\0'");
}

void sub_10002292C()
{
  __assert_rtn("mis_is_interface_ppp", "mis_impl.c", 4923, "mask != NULL");
}

void sub_100022954()
{
  __assert_rtn("mis_get_linklocal", "mis_impl.c", 4961, "mif->mi_name[0] != '\\0'");
}

void sub_10002297C()
{
}

void sub_1000229A4()
{
}

void sub_1000229CC()
{
  __assert_rtn("mis_nwi_process_state", "mis_impl.c", 960, "af == AF_INET6");
}

void sub_1000229F4()
{
}

void sub_100022A1C()
{
}

void sub_100022A44()
{
  __assert_rtn("mis_get_prefix_router", "mis_impl.c", 2559, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022A6C()
{
  __assert_rtn("mis_dynamic_store_changed", "mis_impl.c", 1669, "mif_ext != NULL");
}

void sub_100022A94()
{
}

void sub_100022ABC()
{
}

void sub_100022AE4()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 293, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022B0C()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 292, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022B34()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 470, "mis_pdp_refcnt != 0");
}

void sub_100022B5C()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 469, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022B84()
{
  __assert_rtn("mis_pdp_stop", "mis_pdp.c", 483, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022BAC()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 341, "mis_pdp_refcnt != 0");
}

void sub_100022BD4()
{
}

void sub_100022BFC()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 349, "mif->mi_SCDynamicStore == NULL");
}

void sub_100022C24()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 348, "mif->mi_prefixDispatchSource == NULL");
}

void sub_100022C4C()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 339, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022C74()
{
  __assert_rtn( "mis_pdp_context_invalidate",  "mis_pdp.c",  358,  "mif->mi_type == MIS_IFTYPE_PDP || mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_100022C9C()
{
  __assert_rtn("mis_pdp_context_invalidate", "mis_pdp.c", 359, "!all || mis_pdp_refcnt == 0");
}

void sub_100022CC4()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 250, "mif->mi_nat_param.ni_nattype != NETRB_NONAT");
}

void sub_100022CEC()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 251, "nat64 || nat66 != mif->mi_prefix_sharing");
}

void sub_100022D14()
{
  __assert_rtn( "mis_bcast_start",  "mis_bcast.c",  879,  "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022D3C()
{
}

void sub_100022D64()
{
}

void sub_100022D8C()
{
}

void sub_100022DB4()
{
}

void sub_100022DDC()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 970, "mif->mi_notify == NULL");
}

void sub_100022E04()
{
  __assert_rtn( "mis_bcast_stop",  "mis_bcast.c",  969,  "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022E2C()
{
  __assert_rtn( "mis_bcast_startv6",  "mis_bcast.c",  1064,  "mif_int->mi_class == MIS_IFCLASS_INT && (mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE)");
}

void sub_100022E54()
{
}

void sub_100022E7C()
{
}

void sub_100022EA4()
{
  __assert_rtn( "mis_bcast_startv6",  "mis_bcast.c",  1066,  "mif_ext->mi_nat_param.ni_nattype == NETRB_NAT64 || mif_ext->mi_prefixinfo.mp_prefix_present || !mif_ext->mi_prefix_sharing");
}

void sub_100022ECC()
{
  __assert_rtn( "mis_bridge_add",  "mis_bcast.c",  1111,  "mif_bridge->mi_class == MIS_IFCLASS_INT && mif_bridge->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022EF4()
{
  __assert_rtn( "mis_bridge_delete",  "mis_bcast.c",  1128,  "mif->mi_class == MIS_IFCLASS_INT && mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022F1C()
{
  __assert_rtn("mis_bcast_init_addr", "mis_bcast.c", 632, "mif->mi_class == MIS_IFCLASS_INT && mif->mi_member == 0");
}

void sub_100022F44()
{
  __assert_rtn("mis_bcast_teardown_interface", "mis_bcast.c", 457, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100022F6C()
{
  __assert_rtn( "mis_bcast_teardown_interface",  "mis_bcast.c",  456,  "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_100022F94()
{
  __assert_rtn("mis_bcast_setup_routes", "mis_bcast.c", 388, "err == 0 || err == EEXIST");
}

void sub_100022FBC()
{
  __assert_rtn("mis_bcast_fix_addrs", "mis_bcast.c", 552, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100022FE4()
{
  __assert_rtn( "mis_bcast_fix_addrs",  "mis_bcast.c",  551,  "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_10002300C()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 725, "mif_int->mi_member == 0");
}

void sub_100023034()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 724, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_10002305C()
{
  __assert_rtn( "mis_bcast_setup_v4_service",  "mis_bcast.c",  722,  "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023084()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 814, "mif_int->mi_member == 0");
}

void sub_1000230AC()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 813, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_1000230D4()
{
  __assert_rtn( "mis_bcast_setup_v6_service",  "mis_bcast.c",  811,  "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_1000230FC()
{
  __assert_rtn( "mis_bcast_local_start",  "mis_bcast.c",  1200,  "mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023124()
{
}

void sub_10002314C()
{
  __assert_rtn("read_settings", "mis_set.c", 651, "plist_path != NULL");
}

void sub_100023174()
{
  __assert_rtn("read_settings", "mis_set.c", 655, "err != 0");
}

void sub_10002319C()
{
  __assert_rtn("mis_set_update_airplane_mode", "mis_set.c", 463, "set_prefs != NULL");
}

void sub_1000231C4()
{
  __assert_rtn("write_settings", "mis_set.c", 1085, "plist_path != NULL");
}

void sub_1000231EC()
{
  __assert_rtn("publish_settings", "mis_set.c", 1110, "sr != NULL");
}

void sub_100023214()
{
}

void sub_10002323C()
{
  __assert_rtn("mis_set_state_common", "mis_set.c", 1175, "state == NETRB_SVC_STATE_OFF");
}

void sub_100023264()
{
  __assert_rtn("mis_remove_settings", "mis_set.c", 1364, "st->st_refcnt != 0");
}

void sub_10002328C()
{
  __assert_rtn("mis_set_max_hosts", "mis_set.c", 1421, "limit >= 0");
}

void sub_1000232B4()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1441, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000232DC()
{
}

void sub_100023304()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1443, "(gset.mset_hosts[iftype] + count) != 0");
}

void sub_10002332C()
{
  __assert_rtn("mis_set_remove_host", "mis_set.c", 1452, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100023354()
{
  __assert_rtn("mis_get_ext", "mis_set.c", 1514, "if_nametoindex(st->st_ext_name) != 0");
}

void sub_10002337C()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1544, "addr != NULL && mask != NULL");
}

void sub_1000233A4()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1545, "vmnet_plist != NULL");
}

void sub_1000233CC()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1573, "addr != NULL && mask != NULL");
}

void sub_1000233F4()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1574, "vmnet_plist != NULL");
}

void sub_10002341C()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1641, "vmnet_plist != NULL");
}

void sub_100023444()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1642, "mac_ioue_array != NULL");
}

void sub_10002346C()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1700, "vmnet_plist != NULL");
}

void sub_100023494()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1701, "mac_ioue_array != NULL");
}

void sub_1000234BC()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1789, "mac_array_plist != NULL");
}

void sub_1000234E4()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1792, "mac_ioue_array != NULL");
}

void sub_10002350C()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1876, "vmnet_plist != NULL");
}

void sub_100023534()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1877, "mac_array_plist != NULL");
}

void sub_10002355C()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 36, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100023584()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 35, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235AC()
{
  __assert_rtn("mis_auth_start", "mis_auth.c", 48, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235D4()
{
  __assert_rtn("mis_auth_stop", "mis_auth.c", 57, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235FC()
{
  __assert_rtn("dhcp_start", "mis_dhcp.c", 935, "mif != NULL");
}

void sub_100023624()
{
  __assert_rtn( "dhcp_interface_config_add",  "mis_dhcp.c",  259,  "mif->mi_mode == NETRB_INTERNET_SHARING_MODE || mif->mi_mode == NETRB_LOCAL_WITH_DHCP_MODE");
}

void sub_10002364C()
{
  __assert_rtn( "bcast_range",  "mis_dhcp.c",  206,  "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_address_info.mi_addr.s_addr & mif->mi_address_info.mi_ne tmask.s_addr) + 1");
}

void sub_100023674()
{
  __assert_rtn( "bcast_range",  "mis_dhcp.c",  196,  "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_saddr.s_addr)");
}

void sub_10002369C()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 510, "bridgeName != NULL");
}

void sub_1000236C4()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 511, "bridgeName[0] != '\\0'");
}

void sub_1000236EC()
{
}

void sub_100023714()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 346, "bridgename != NULL");
}

void sub_10002373C()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 347, "bridgename[0] != '\\0'");
}

void sub_100023764()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 615, "ifname != NULL");
}

void sub_10002378C()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 616, "ifname[0] != '\\0'");
}

void sub_1000237B4()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 617, "bridgename != NULL");
}

void sub_1000237DC()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 618, "bridgename[0] != '\\0'");
}

void sub_100023804()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 714, "xpc_dictionary_get_count(bridge->bridgeMembers) != 0");
}

void sub_10002382C()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 573, "bridgeName != NULL");
}

void sub_100023854()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 574, "bridgeName[0] != '\\0'");
}

void sub_10002387C()
{
}

void sub_1000238A4()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 582, "bridge->bridge_refcnt == 0");
}

void sub_1000238CC()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 733, "ifname != NULL");
}

void sub_1000238F4()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 734, "ifname[0] != '\\0'");
}

void sub_10002391C()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 735, "bridgename != NULL");
}

void sub_100023944()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 736, "bridgename[0] != '\\0'");
}

void sub_10002396C()
{
  __assert_rtn("mis_get_bridge_name", "mis_bridge.c", 783, "bridge_name != NULL");
}

void sub_100023994()
{
  __assert_rtn("mis_pfif_lookup", "mis_pf.c", 2687, "pe->refcnt != 0");
}

void sub_1000239BC()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 513, "pe_last != NULL");
}

void sub_1000239E4()
{
  __assert_rtn( "mis_pf_addrules_v4",  "mis_pf.c",  521,  "ntohl(pe_last->pe_addr.s_addr) == ntohl(pe_last->pe_addr.s_addr & pe_last->pe_netmask.s_addr) + 1");
}

void sub_100023A0C()
{
}

void sub_100023A34()
{
}

void sub_100023A5C()
{
}

void sub_100023A84()
{
  __assert_rtn("mis_pf_start", "mis_pf.c", 891, "mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023AAC()
{
}

void sub_100023AD4()
{
  __assert_rtn("mis_pfif_clone", "mis_pf.c", 2753, "mif->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_100023AFC()
{
}

void sub_100023B24()
{
  __assert_rtn("mis_pf_stop", "mis_pf.c", 1092, "mif_int->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_100023B4C()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1266, "ext_lo_port <= ext_hi_port && int_lo_port <= int_hi_port");
}

void sub_100023B74()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1267, "ext_hi_port - ext_lo_port == int_hi_port - int_lo_port");
}

void sub_100023B9C()
{
  __assert_rtn( "-[misCTClientSharedInstance activateTethering:]",  "mis_ctinterface.m",  236,  "self.ctServerConnection != NULL");
}

void sub_100023BC4()
{
  __assert_rtn("rtadvd_config_create", "mis_rtadvd.c", 108, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_100023BEC()
{
  __assert_rtn( "rtadvd_config_create",  "mis_rtadvd.c",  96,  "strncmp(mif_ext->mi_name, netrbXPCAnyExternal, NETRB_IFNAMSIZ) == 0");
}

void sub_100023C14()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 474, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_100023C3C()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 460, "mif->mi_nat_param.ni_nattype == NETRB_NAT64");
}

void sub_100023C64()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 425, "rtadvd_source != NULL");
}

void sub_100023C8C()
{
  __assert_rtn("dns_proxy_insert_interfaces", "mis_dnsproxy.c", 272, "dns_object->dns_refcnt != 0");
}

void sub_100023CB4()
{
}

void sub_100023CDC()
{
}

void sub_100023D04()
{
  __assert_rtn("dns_proxy_remove_interfaces", "mis_dnsproxy.c", 310, "removed_count <= dns_object->dns_refcnt");
}

void sub_100023D2C()
{
}

id objc_msgSend_processCTConnectionStateChangeNotification_connection_connectionStatus_ctInterfaceConnStatus_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:");
}

id objc_msgSend_userAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 userAuthenticated];
}