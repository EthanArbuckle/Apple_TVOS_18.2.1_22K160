void sub_100001AA0(int a1)
{
  os_release((void *)qword_1000103C8);
  qword_1000103C8 = 0LL;
  if (dword_100010390 != -1)
  {
    close(dword_100010390);
    dword_100010390 = -1;
  }

  if (qword_1000103B0) {
    xpc_connection_cancel((xpc_connection_t)qword_1000103B0);
  }
  if (qword_1000103B8) {
    CFRelease((CFTypeRef)qword_1000103B8);
  }
  if (qword_1000103C0) {
    CFRelease((CFTypeRef)qword_1000103C0);
  }
  exit(a1);
}

uint64_t sub_100001B14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_1000103C8, 0LL, a1, &a9, v9);
}

uint64_t sub_100001B50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_1000103C8, 1LL, a1, &a9, v9);
}

uint64_t sub_100001B8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_1000103C8, 2LL, a1, &a9, v9);
}

uint64_t sub_100001BC8(const char *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000103B8);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v4) = -1;
  }

  else
  {
    CFIndex v3 = Count;
    CFIndex v4 = 0LL;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000103B8, v4);
      if (!strncmp(a1, ValueAtIndex, 0x40uLL)) {
        break;
      }
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }
  }

  return (unsigned __int16)v4;
}

uint64_t sub_100001C3C(uint64_t a1, const char *a2)
{
  CFIndex v3 = (const __CFArray *)qword_1000103C0;
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000103C0);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v6) = -1;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v3, v6);
      if (!strncmp(a2, ValueAtIndex, 0x40uLL)) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }

  return (unsigned __int16)v6;
}

uint64_t sub_100001CB4()
{
  return dword_100010390;
}

const char *sub_100001CC0(uint64_t a1)
{
  if (a1 > 3222291537LL)
  {
    if (a1 <= 3295691826LL)
    {
      if (a1 <= 3223864408LL)
      {
        if (a1 == 3222291538LL) {
          return "DIOCXCOMMIT";
        }
        if (a1 == 3222291539LL) {
          return "DIOCXROLLBACK";
        }
      }

      else
      {
        switch(a1)
        {
          case 3223864409LL:
            return "DIOCSETIFFLAG";
          case 3223864410LL:
            return "DIOCCLRIFFLAG";
          case 3235398674LL:
            return "DIOCCLRSTATES";
        }
      }
    }

    else if (a1 > 3424666629LL)
    {
      switch(a1)
      {
        case 3424666630LL:
          return "DIOCGETRULES";
        case 3424666651LL:
          return "DIOCINSERTRULE";
        case 3424666652LL:
          return "DIOCDELETERULE";
      }
    }

    else
    {
      switch(a1)
      {
        case 3295691827LL:
          return "DIOCBEGINADDRS";
        case 3295691828LL:
          return "DIOCADDADDR";
        case 3424666628LL:
          return "DIOCADDRULE";
      }
    }
  }

  else if (a1 <= 3221505047LL)
  {
    if (a1 <= 536888341)
    {
      if (a1 == 536888321) {
        return "DIOCSTART";
      }
      if (a1 == 536888322) {
        return "DIOCSTOP";
      }
    }

    else
    {
      switch(a1)
      {
        case 536888342LL:
          return "DIOCCLRSTATUS";
        case 536888405LL:
          return "DIOCCLRSRCNODES";
        case 1074283528LL:
          return "DIOCSTARTREF";
      }
    }
  }

  else if (a1 > 3222291460LL)
  {
    switch(a1)
    {
      case 3222291461LL:
        return "DIOCGETSTARTERS";
      case 3222291465LL:
        return "DIOCSTOPREF";
      case 3222291537LL:
        return "DIOCXBEGIN";
    }
  }

  else
  {
    switch(a1)
    {
      case 3221505048LL:
        return "DIOCSETDEBUG";
      case 3221767197LL:
        return "DIOCSETTIMEOUT";
      case 3221767208LL:
        return "DIOCSETLIMIT";
    }
  }

  return "UNKNOWN";
}

void start(int a1, char *const *a2)
{
  CFIndex v4 = *a2;
  if (sandbox_init("pfd", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
  }

  while (1)
  {
    int v5 = getopt(a1, a2, "D");
    if (v5 != 68) {
      break;
    }
    dword_100010398 = 1;
  }

  if (v5 == -1)
  {
    sub_1000020B8();
    sub_100002104();
    sub_1000025E8();
    sub_1000026E8();
    sub_100002874();
    sub_1000028D4();
    dispatch_main();
  }

  sub_100002070(v4);
  exit(1);
}

uint64_t sub_100002070(const char *a1)
{
  return puts("\t-D\tEnable PF debugging");
}

void sub_1000020B8()
{
  qword_1000103C8 = (uint64_t)os_log_create(off_100010000[0], "daemon");
  if (!qword_1000103C8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000082F4();
  }
}

void sub_100002104()
{
  if (dword_100010390 != -1) {
    sub_100001AA0(22);
  }
  int v0 = open("/dev/pfm", 2);
  dword_100010390 = v0;
  if (v0 == -1)
  {
    sub_100001B14((uint64_t)"%s: %m", v1, v2, v3, v4, v5, v6, v7, (uint64_t)"__PFDInitPFSetup");
    goto LABEL_60;
  }

  if (fcntl(v0, 2, 1LL) == -1)
  {
    sub_100001B14((uint64_t)"%s: fcntl(FD_CLOEXEC): %m", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"__PFDInitPFSetup");
LABEL_60:
    v87 = __error();
    sub_100001AA0(*v87);
  }

  xmmword_1000103D0 = xmmword_1000088C0;
  unk_1000103E0 = xmmword_1000088D0;
  xmmword_1000103F0 = xmmword_1000088E0;
  unk_100010400 = xmmword_1000088F0;
  xmmword_100010410 = xmmword_100008900;
  unk_100010420 = xmmword_100008910;
  qword_100010430 = 0x9600000000LL;
  if (dword_100010398) {
    int v15 = 3;
  }
  else {
    int v15 = 1;
  }
  LODWORD(v91[0]) = v15;
  if (ioctl(dword_100010390, 0xC0044418uLL, v91)) {
    sub_100001B14((uint64_t)"%s: %m", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"DIOCSETDEBUG");
  }
  if (LODWORD(v91[0]) > 3) {
    v23 = "<invalid>";
  }
  else {
    v23 = off_10000C488[SLODWORD(v91[0])];
  }
  sub_100001B8C((uint64_t)"pf debug level set to '%s'", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
  unint64_t v24 = 0LL;
  *(void *)&v91[0] = 0LL;
  do
  {
    LODWORD(v91[0]) = v24;
    int v25 = ioctl(dword_100010390, 0xC0084427uLL, v91, v89, v90);
    if (v25)
    {
      int v41 = v25;
      sub_100001B14((uint64_t)"%s: DIOCGETLIMIT index %d", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"__PFDSetLimits");
      goto LABEL_56;
    }

    uint64_t v33 = dword_100008928[v24];
    if (DWORD1(v91[0]) <= v33
      && (DWORD1(v91[0]) = dword_100008928[v24], ioctl(dword_100010390, 0xC0084428uLL)))
    {
      int v41 = *__error();
      if (v41 == 16)
      {
        sub_100001B14( (uint64_t)"Current pool size exceeds requested hard limit",  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)v91);
        goto LABEL_56;
      }

      unint64_t v89 = v24;
      uint64_t v90 = v33;
      sub_100001B14((uint64_t)"%s[%d,%d]: %m", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"DIOCSETLIMIT");
    }

    else
    {
      int v41 = 0;
    }

    if (v24 > 4) {
      break;
    }
    ++v24;
  }

  while (!v41);
  if (v41) {
    goto LABEL_56;
  }
  unint64_t v42 = 0LL;
  do
  {
    *(void *)&v91[0] = __PAIR64__(*((_DWORD *)&xmmword_1000103D0 + v42), v42);
    if (ioctl(dword_100010390, 0xC008441DuLL, v91, v89, v90))
    {
      int v41 = *__error();
      unint64_t v89 = v42;
      uint64_t v90 = *((unsigned int *)&xmmword_1000103D0 + v42);
      sub_100001B14((uint64_t)"%s[%d,%d]: %m", v43, v44, v45, v46, v47, v48, v49, (uint64_t)"DIOCSETTIMEOUT");
    }

    else
    {
      int v41 = 0;
    }

    if (v42 > 0x18) {
      break;
    }
    ++v42;
  }

  while (!v41);
  if (v41) {
LABEL_56:
  }
    sub_100001AA0(v41);
  uint64_t v92 = 0x10000000000LL;
  memset(v91, 0, sizeof(v91));
  if (ioctl(dword_100010390, 0xC0284459uLL, v91))
  {
    int v57 = *__error();
    sub_100001B14((uint64_t)"%s: %m", v58, v59, v60, v61, v62, v63, v64, (uint64_t)"DIOCSETIFFLAG");
    if (v57)
    {
      int v86 = v57;
      goto LABEL_62;
    }
  }

  v91[0] = 0uLL;
  if (ioctl(dword_100010390, 0xC0104405uLL, v91) < 0)
  {
    if (*__error() == 2)
    {
      v84 = "no pf starter references held";
LABEL_46:
      sub_100001B50((uint64_t)v84, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v88);
      goto LABEL_49;
    }

    goto LABEL_47;
  }

  v65 = malloc(2LL * SLODWORD(v91[0]));
  if (!v65)
  {
    v85 = "malloc failed";
LABEL_48:
    sub_100001B14((uint64_t)v85, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v88);
LABEL_49:
    int v86 = *__error();
    if ((v86 & 0xFFFFFFFD) == 0) {
      return;
    }
LABEL_62:
    sub_100001AA0(v86);
  }

  v73 = v65;
  *((void *)&v91[0] + 1) = v65;
  v88 = (const char *)v91;
  if (ioctl(dword_100010390, 0xC0104405uLL) < 0)
  {
    free(v73);
    if (*__error() == 2)
    {
      v84 = "no pf enabled references";
      goto LABEL_46;
    }

LABEL_47:
    v88 = "DIOCGETSTARTERS";
    v85 = "%s: %m";
    goto LABEL_48;
  }

  int v74 = v91[0];
  if (SLODWORD(v91[0]) >= 1)
  {
    uint64_t v75 = 0LL;
    uint64_t v76 = *((void *)&v91[0] + 1);
    while (strncmp((const char *)(v76 + v75 + 20), "pfd", 0x40uLL))
    {
      v75 += 84LL;
    }

    sub_100001B8C((uint64_t)"token found %llu", v77, v78, v79, v80, v81, v82, v83, *(void *)(v76 + v75));
    qword_1000103A0 = *(void *)(v76 + v75);
  }

LABEL_52:
  free(v73);
}

void sub_1000025E8()
{
  int v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &v8);
  qword_1000103B8 = (uint64_t)v0;
  if (!v0)
  {
    sub_100001B14((uint64_t)"unable to create an array for anchor priority", v1, v2, v3, v4, v5, v6, v7, v8.version);
    sub_100001AA0(12);
  }

  CFArrayAppendValue(v0, off_1000100D0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, kPFThreadBR[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_100010100[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100D8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F0[0]);
}

void sub_1000026E8()
{
  int v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &v8);
  qword_1000103C0 = (uint64_t)v0;
  if (!v0)
  {
    sub_100001B14((uint64_t)"unable to create an array for default priority", v1, v2, v3, v4, v5, v6, v7, v8.version);
    sub_100001AA0(12);
  }

  CFArrayAppendValue(v0, off_100010110[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010118[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010120[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010128[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010130[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010138[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010140[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010148[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010150[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010158[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, kPFThreadBR_nat64[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010160[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010168[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010170[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010178[0]);
}

void sub_100002874()
{
  mach_service = xpc_connection_create_mach_service(off_100010008[0], &_dispatch_main_q, 1uLL);
  qword_1000103B0 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_100001B14((uint64_t)"could not start xpc listener", v1, v2, v3, v4, v5, v6, v7, v8);
    sub_100001AA0(12);
  }

  xpc_connection_set_event_handler(mach_service, &stru_10000C408);
  xpc_connection_resume((xpc_connection_t)qword_1000103B0);
}

void sub_1000028D4()
{
  v5.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v5.sa_mask = 0x200000000LL;
  sigaction(1, &v5, 0LL);
  sigaction(13, &v5, 0LL);
  sigaction(14, &v5, 0LL);
  sigaction(24, &v5, 0LL);
  sigaction(25, &v5, 0LL);
  sigaction(26, &v5, 0LL);
  sigaction(27, &v5, 0LL);
  sigaction(18, &v5, 0LL);
  sigaction(21, &v5, 0LL);
  sigaction(22, &v5, 0LL);
  sigaction(30, &v5, 0LL);
  sigaction(31, &v5, 0LL);
  sigaction(29, &v5, 0LL);
  sigaction(15, &v5, 0LL);
  sigaction(2, &v5, 0LL);
  int v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0LL, &_dispatch_main_q);
  uint64_t v1 = v0;
  if (v0)
  {
    dispatch_source_set_event_handler(v0, &stru_10000C448);
    dispatch_resume(v1);
  }

  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  if (v2)
  {
    uint64_t v3 = v2;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000LL;
    v4[2] = sub_100002B3C;
    v4[3] = &unk_10000C468;
    v4[4] = v1;
    v4[5] = v2;
    dispatch_source_set_event_handler(v2, v4);
    dispatch_resume(v3);
  }
}

void sub_100002A94(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100001B8C((uint64_t)"new peer %p", v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    sub_100002B74((_xpc_connection_s *)a2);
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
      sub_100001B14((uint64_t)"xpc connection error: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)string);
      sub_100001AA0(22);
    }

    sub_100001B14((uint64_t)"unknown message type", v4, v5, v6, v7, v8, v9, v10, v19);
  }

void sub_100002B3C(uint64_t a1)
{
}

void sub_100002B74(_xpc_connection_s *a1)
{
  if (__CFADD__(dword_100010438++, 1)) {
    sub_100008338();
  }
  xpc_connection_set_target_queue(a1, &_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100002C00;
  handler[3] = &unk_10000C4A8;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100002C00( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      sub_100001B14((uint64_t)"unknown message type", v13, v14, v15, v16, v17, v18, v19, a9);
      return;
    }

    goto LABEL_23;
  }

  uint64_t v20 = *(void *)(a1 + 32);
  CFErrorRef error = 0LL;
  xpc_connection_get_audit_token(v20, __size);
  audit_token_t token = __size[0];
  uint64_t v21 = SecTaskCreateWithAuditToken(0LL, &token);
  if (!v21) {
    goto LABEL_22;
  }
  uint64_t v22 = v21;
  CFTypeRef v23 = SecTaskCopyValueForEntitlement(v21, @"com.apple.pf.allow", &error);
  CFErrorRef v24 = error;
  if (!error && v23)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    BOOL v26 = TypeID == CFGetTypeID(v23) && CFEqual(v23, kCFBooleanTrue) != 0;
    goto LABEL_12;
  }

  BOOL v26 = 0;
  if (v23)
  {
LABEL_12:
    CFRelease(v23);
    CFErrorRef v24 = error;
  }

  if (v24) {
    CFRelease(v24);
  }
  CFRelease(v22);
  if (v26)
  {
    uint64_t v27 = *(_xpc_connection_s **)(a1 + 32);
    uint64_t v28 = off_100010000;
    uint64_t uint64 = xpc_dictionary_get_uint64(object, off_100010010[0]);
    switch(uint64)
    {
      case 0x3E9uLL:
        *(void *)token.val = 0LL;
        CFErrorRef error = 0LL;
        uint64_t v37 = 0LL;
        uint64_t v38 = *(const char **)token.val;
        int v39 = sub_100001BC8(*(const char **)token.val);
        uint64_t v40 = (const char *)error;
        int v41 = sub_100001C3C((uint64_t)v38, (const char *)error);
        xpc_object_t value = xpc_dictionary_get_value(object, off_100010030[0]);
        if (!value)
        {
          uint64_t v52 = "no rule to insert";
          goto LABEL_177;
        }

        uint64_t v50 = value;
        xpc_object_t v51 = xpc_dictionary_get_value(object, off_100010038[0]);
        if (!v51 || xpc_get_type(v51) != (xpc_type_t)&_xpc_type_uint64)
        {
          uint64_t v52 = "incorrect type for priority";
          goto LABEL_177;
        }

        unsigned __int16 v295 = xpc_dictionary_get_uint64(object, off_100010038[0]);
        *(void *)__size[0].val = 0LL;
        LOWORD(__size[0].val[2]) = 0;
        uint64_t v37 = sub_1000045F0(v38, v40, v39, v41, __size);
        if (!v37) {
          goto LABEL_201;
        }
        BOOL v303 = sub_100005EC4(v38, v40, v37, v295, v50, v413);
        if (!v303) {
          sub_10000437C(v38, v40, (uint64_t)__size, v306, v307, v308, v309, v310, v406);
        }
        if (!sub_1000060E4(v303, v304, v305, v306, v307, v308, v309, v310))
        {
          sub_100004488(v38, v40, *(uint64_t *)v413, v37);
          goto LABEL_203;
        }

        xpc_object_t reply = xpc_dictionary_create_reply(object);
        if (reply)
        {
          xpc_object_t v100 = reply;
          xpc_dictionary_set_uint64(reply, off_100010010[0], 0x7D1uLL);
          v148 = off_100010040[0];
          uint64_t v150 = *(void *)v413;
          v149 = v100;
          goto LABEL_181;
        }

        sub_100001B14((uint64_t)"xpc_dictionary_create_reply failed", v312, v313, v314, v315, v316, v317, v318, v406);
        sub_100004488(v38, v40, *(uint64_t *)v413, v37);
        sub_10000437C(v38, v40, (uint64_t)__size, v336, v337, v338, v339, v340, v409);
        goto LABEL_186;
      case 0x3EAuLL:
        *(void *)__size[0].val = 0LL;
        *(void *)token.val = 0LL;
        if (sub_100004090(object, (const char **)__size, (const char **)&token))
        {
          xpc_object_t v85 = xpc_dictionary_get_value(object, off_100010040[0]);
          if (!v85 || xpc_get_type(v85) != (xpc_type_t)&_xpc_type_uint64)
          {
            sub_100001B14((uint64_t)"Incorrect type for insertion id", v86, v87, v88, v89, v90, v91, v92, v406);
            xpc_object_t v100 = xpc_dictionary_create_reply(object);
            uint64_t v37 = 0LL;
            if (v100) {
              goto LABEL_180;
            }
            goto LABEL_185;
          }

          uint64_t v279 = xpc_dictionary_get_uint64(object, off_100010040[0]);
          v280 = *(const char **)__size[0].val;
          v281 = *(const char **)token.val;
          uint64_t v37 = sub_100004AEC(*(const char **)__size[0].val, *(const char **)token.val);
          if (sub_100004488(v280, v281, v279, v37))
          {
            int v282 = sub_100005FA0(v37, &error);
            char v146 = v282;
            if (v282 && !(_DWORD)error)
            {
              CStringPtr = CFStringGetCStringPtr(v37, 0);
              sub_100001B8C( (uint64_t)"no rules exist in the anchor %s after deleting a single rule",  v284,  v285,  v286,  v287,  v288,  v289,  v290,  (uint64_t)CStringPtr);
              sub_100005CF0(v280, v281);
              xpc_object_t v100 = xpc_dictionary_create_reply(object);
              if (v100) {
                goto LABEL_80;
              }
              goto LABEL_185;
            }
          }

          else
          {
            char v146 = 0;
          }
        }

        else
        {
          char v146 = 0;
          uint64_t v37 = 0LL;
        }

        xpc_object_t v147 = xpc_dictionary_create_reply(object);
        if (!v147) {
          goto LABEL_185;
        }
        xpc_object_t v100 = v147;
        if ((v146 & 1) == 0) {
          goto LABEL_180;
        }
        goto LABEL_80;
      case 0x3EBuLL:
        *(void *)token.val = 0LL;
        CFErrorRef error = 0LL;
        uint64_t v37 = 0LL;
        xpc_object_t v101 = xpc_dictionary_get_value(object, off_100010020[0]);
        if (v101 && xpc_get_type(v101) == (xpc_type_t)&_xpc_type_string)
        {
          uint64_t v38 = *(const char **)token.val;
          int v291 = sub_100001BC8(*(const char **)token.val);
          uint64_t v40 = (const char *)error;
          int v292 = sub_100001C3C((uint64_t)v38, (const char *)error);
          xpc_object_t v293 = xpc_dictionary_get_value(object, off_100010028[0]);
          if (v293 && xpc_get_type(v293) == (xpc_type_t)&_xpc_type_array)
          {
            xpc_object_t v319 = xpc_dictionary_get_value(object, off_100010028[0]);
            *(void *)__size[0].val = 0LL;
            LOWORD(__size[0].val[2]) = 0;
            uint64_t v37 = sub_1000045F0(v38, v40, v291, v292, __size);
            if (v37)
            {
              BOOL v320 = sub_100004B7C(v38, v40, v37, v319);
              if (v320)
              {
                if (sub_1000060E4(v320, v321, v322, v323, v324, v325, v326, v327))
                {
                  xpc_object_t v328 = xpc_dictionary_create_reply(object);
                  if (!v328)
                  {
                    sub_100001B14( (uint64_t)"xpc_dictionary_create_reply failed",  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v406);
                    sub_100005CF0(v38, v40);
                    goto LABEL_186;
                  }

                  xpc_object_t v100 = v328;
LABEL_80:
                  v148 = off_100010010[0];
                  v149 = v100;
                  uint64_t v150 = 2001LL;
LABEL_181:
                  xpc_dictionary_set_uint64(v149, v148, v150);
                  sub_100004034(v27, v100);
                  v171 = v100;
LABEL_182:
                  xpc_release(v171);
LABEL_183:
                  if (!v37) {
                    return;
                  }
LABEL_186:
                  CFRelease(v37);
                  return;
                }

                sub_100005CF0(v38, v40);
              }

              else
              {
LABEL_203:
                sub_10000437C(v38, v40, (uint64_t)__size, v323, v324, v325, v326, v327, v406);
              }
            }

            else
            {
LABEL_201:
              sub_100001B14((uint64_t)"unable to create anchors", v296, v297, v298, v299, v300, v301, v302, v406);
            }

LABEL_178:
            xpc_object_t v294 = xpc_dictionary_create_reply(object);
            if (!v294)
            {
LABEL_185:
              sub_100001B14((uint64_t)"xpc_dictionary_create_reply failed", v93, v94, v95, v96, v97, v98, v99, v406);
              if (!v37) {
                return;
              }
              goto LABEL_186;
            }

            xpc_object_t v100 = v294;
LABEL_180:
            v148 = off_100010010[0];
            v149 = v100;
            uint64_t v150 = 2000LL;
            goto LABEL_181;
          }

          uint64_t v52 = "Incorrect type for rule array";
        }

        else
        {
          uint64_t v52 = "Incorrect type for sub app";
        }

LABEL_177:
        sub_100001B14((uint64_t)v52, v43, v44, v45, v46, v47, v48, v49, v406);
        uint64_t v37 = 0LL;
        goto LABEL_178;
      case 0x3ECuLL:
        *(void *)__size[0].val = 0LL;
        *(void *)token.val = 0LL;
        BOOL v102 = sub_100005CF0(*(const char **)__size[0].val, *(const char **)token.val);
        goto LABEL_58;
      case 0x3EDuLL:
        *(void *)__size[0].val = 0LL;
        *(void *)token.val = 0LL;
        int v103 = sub_100004090(object, (const char **)__size, (const char **)&token);
        uint64_t v37 = 0LL;
        xpc_object_t v104 = 0LL;
        LOBYTE(error) = v103;
        if (v103)
        {
          uint64_t v37 = sub_100004AEC(*(const char **)__size[0].val, *(const char **)token.val);
          xpc_object_t v104 = sub_10000618C(v37, &error);
        }

        xpc_object_t v105 = xpc_dictionary_create_reply(object);
        if (v105)
        {
          v113 = v105;
          if ((_BYTE)error)
          {
            xpc_dictionary_set_uint64(v105, off_100010010[0], 0x7D1uLL);
            if (v104) {
              xpc_dictionary_set_value(v113, off_100010028[0], v104);
            }
          }

          else
          {
            xpc_dictionary_set_uint64(v105, off_100010010[0], 0x7D0uLL);
          }

          sub_100004034(v27, v113);
          xpc_release(v113);
        }

        else
        {
          sub_100001B14((uint64_t)"xpc_dictionary_create_reply failed", v106, v107, v108, v109, v110, v111, v112, v406);
        }

        if (!v104) {
          goto LABEL_183;
        }
        v171 = v104;
        goto LABEL_182;
      case 0x3EEuLL:
        xpc_object_t v121 = xpc_dictionary_get_value(object, off_100010030[0]);
        if (v121)
        {
          xpc_object_t v129 = xpc_dictionary_create(0LL, 0LL, 0LL);
          if (v129)
          {
            LOBYTE(v121) = sub_100006F40(v121, v129);
          }

          else
          {
            sub_100001B14((uint64_t)"xpc_dictionary_create failed %m", v122, v123, v124, v125, v126, v127, v128, v406);
            LOBYTE(v121) = 0;
          }
        }

        else
        {
          sub_100001B14((uint64_t)"no nat rule to check", v114, v115, v116, v117, v118, v119, v120, v406);
          xpc_object_t v129 = 0LL;
        }

        xpc_object_t v172 = xpc_dictionary_create_reply(object);
        if (v172)
        {
          v180 = v172;
          if ((v121 & 1) != 0)
          {
            xpc_dictionary_set_uint64(v172, off_100010010[0], 0x7D1uLL);
            xpc_dictionary_set_value(v180, off_100010030[0], v129);
          }

          else
          {
            xpc_dictionary_set_uint64(v172, off_100010010[0], 0x7D0uLL);
          }

          sub_100004034(v27, v180);
          xpc_release(v180);
        }

        else
        {
          sub_100001B14((uint64_t)"xpc_dictionary_create_reply failed", v173, v174, v175, v176, v177, v178, v179, v406);
        }

        if (!v129) {
          return;
        }
        v145 = v129;
        goto LABEL_75;
      case 0x3EFuLL:
        *(void *)__size[0].val = 0LL;
        *(void *)token.val = 0LL;
        if (!sub_100004090(object, (const char **)__size, (const char **)&token))
        {
LABEL_70:
          xpc_object_t v77 = xpc_dictionary_create_reply(object);
          if (!v77) {
            goto LABEL_76;
          }
          goto LABEL_71;
        }

        BOOL v102 = sub_100006E1C(*(const char **)__size[0].val, *(const char **)token.val);
LABEL_58:
        BOOL v130 = v102;
        xpc_object_t v131 = xpc_dictionary_create_reply(object);
        if (!v131) {
          goto LABEL_76;
        }
        xpc_object_t v77 = v131;
        if (!v130) {
          goto LABEL_71;
        }
        v132 = off_100010010[0];
        uint64_t v133 = 2001LL;
        goto LABEL_72;
      default:
        if (uint64 != 3000)
        {
          if (uint64 == 3001)
          {
            if (object
              && xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary
              && (xpc_object_t v151 = xpc_dictionary_get_value(object, off_100010050[0])) != 0LL
              && (v152 = v151, xpc_get_type(v151) == (xpc_type_t)&_xpc_type_dictionary))
            {
              token.val[0] = 0;
              xpc_object_t v153 = xpc_dictionary_get_value(v152, off_1000100A8[0]);
              if (v153
                && (v161 = v153, xpc_get_type(v153) == (xpc_type_t)&_xpc_type_data)
                && xpc_data_get_bytes(v161, &token, 0LL, 4uLL) == 4)
              {
                xpc_object_t v162 = xpc_dictionary_get_value(v152, off_1000100B0[0]);
                if (v162
                  && (v170 = v162, uint64_t v9 = (char *)&_xpc_type_uint64, xpc_get_type(v162) == (xpc_type_t)&_xpc_type_uint64)
                  && xpc_uint64_get_value(v170) < 0x10000)
                {
                  unsigned __int16 v341 = xpc_uint64_get_value(v170);
                  xpc_object_t v342 = xpc_dictionary_get_value(v152, off_1000100C8[0]);
                  if (v342
                    && (v350 = v342, xpc_get_type(v342) == (xpc_type_t)&_xpc_type_uint64)
                    && xpc_uint64_get_value(v350) < 0x100)
                  {
                    unsigned __int8 v351 = xpc_uint64_get_value(v350);
                  }

                  else
                  {
                    sub_100001B14( (uint64_t)"%s: invalid param ip proto",  v343,  v344,  v345,  v346,  v347,  v348,  v349,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    unsigned __int8 v351 = 0;
                  }

                  LODWORD(error) = 0;
                  xpc_object_t v352 = xpc_dictionary_get_value(v152, off_1000100B8[0]);
                  if (v352
                    && (v360 = v352, xpc_get_type(v352) == (xpc_type_t)&_xpc_type_data)
                    && xpc_data_get_bytes(v360, &error, 0LL, 4uLL) == 4)
                  {
                    int v361 = 1;
                  }

                  else
                  {
                    sub_100001B14( (uint64_t)"%s: invalid param ext lan addr",  v353,  v354,  v355,  v356,  v357,  v358,  v359,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    int v361 = 0;
                  }

                  xpc_object_t v362 = xpc_dictionary_get_value(v152, off_1000100C0[0]);
                  if (v362
                    && (v370 = v362, xpc_get_type(v362) == (xpc_type_t)&_xpc_type_uint64)
                    && xpc_uint64_get_value(v370) < 0x10000)
                  {
                    unsigned __int16 v371 = xpc_uint64_get_value(v370);
                  }

                  else
                  {
                    sub_100001B14( (uint64_t)"%s: invalid param ext lan port",  v363,  v364,  v365,  v366,  v367,  v368,  v369,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    unsigned __int16 v371 = 0;
                  }

                  uint64_t v372 = sub_100001CB4();
                  if ((v372 & 0x80000000) != 0)
                  {
                    sub_100001B14( (uint64_t)"%s: dev",  v373,  v374,  v375,  v376,  v377,  v378,  v379,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                  }

                  else
                  {
                    uint64_t v9 = (char *)v372;
                    if ((ioctl(v372, 0xC0104419uLL, __size) & 0x80000000) == 0)
                    {
                      size_t v387 = (int)__size[0].val[0];
                      v388 = malloc((int)__size[0].val[0]);
                      uint64_t v80 = v388;
                      if (v388)
                      {
                        *(void *)&__size[0].val[2] = v388;
                        bzero(v388, v387);
                        if ((ioctl((int)v9, 0xC0104419uLL, __size) & 0x80000000) == 0)
                        {
                          if ((int)__size[0].val[0] >= 1)
                          {
                            uint64_t v403 = 0LL;
                            uint64_t v9 = 0LL;
                            char v79 = 0;
                            while (1)
                            {
                              uint64_t v404 = *(void *)&__size[0].val[2] + v403;
                              if (*(_BYTE *)(*(void *)&__size[0].val[2] + v403 + 282) == 2
                                && (*(_DWORD *)(v404 + 24) != *(_DWORD *)(v404 + 48)
                                 || *(unsigned __int16 *)(*(void *)&__size[0].val[2] + v403 + 40) != *(unsigned __int16 *)(*(void *)&__size[0].val[2] + v403 + 64))
                                && *(_DWORD *)(v404 + 24) == token.val[0]
                                && *(unsigned __int16 *)(*(void *)&__size[0].val[2] + v403 + 40) == v341)
                              {
                                if (v361 && *(_DWORD *)(*(void *)&__size[0].val[2] + v403 + 72) != (_DWORD)error
                                  || v371 && *(unsigned __int16 *)(*(void *)&__size[0].val[2] + v403 + 88) != v371
                                  || v351 && *(unsigned __int8 *)(*(void *)&__size[0].val[2] + v403 + 284) != v351)
                                {
                                  goto LABEL_33;
                                }

                                if ((v79 & 1) != 0)
                                {
                                  sub_100001B14( (uint64_t)"%s: found multiple nat states, aborting",  v396,  v397,  v398,  v399,  v400,  v401,  v402,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                                  char v79 = 0;
                                  goto LABEL_33;
                                }

                                char v79 = 1;
                                uint64_t v9 = (char *)(*(void *)&__size[0].val[2] + v403);
                              }

                              v403 += 297LL;
                            }
                          }

                          char v79 = 0;
                          uint64_t v9 = 0LL;
LABEL_33:
                          xpc_object_t v81 = xpc_dictionary_create_reply(object);
                          if (v81)
                          {
                            uint64_t v82 = v81;
                            uint64_t v83 = off_100010010[0];
                            if ((v79 & 1) != 0)
                            {
                              xpc_dictionary_set_uint64(v81, off_100010010[0], 0x7D1uLL);
                              xpc_dictionary_set_data(v82, off_100010098[0], v9 + 48, 4uLL);
                              uint64_t v83 = off_1000100A0[0];
                              uint64_t v84 = *((unsigned __int16 *)v9 + 32);
                              xpc_object_t v81 = v82;
                            }

                            else
                            {
                              uint64_t v84 = 2000LL;
                            }

                            xpc_dictionary_set_uint64(v81, v83, v84);
                            sub_100004034(v27, v82);
                          }

                          if (v80) {
                            free(v80);
                          }
                          return;
                        }

                        sub_100001B14( (uint64_t)"%s: ioctl DIOCGETSTATES (second), err %d",  v396,  v397,  v398,  v399,  v400,  v401,  v402,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                      }

                      else
                      {
                        sub_100001B14( (uint64_t)"%s: malloc %zu",  v389,  v390,  v391,  v392,  v393,  v394,  v395,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                      }

                      char v79 = 0;
                      goto LABEL_33;
                    }

                    sub_100001B14( (uint64_t)"%s: ioctl DIOCGETSTATES (first), err %d",  v380,  v381,  v382,  v383,  v384,  v385,  v386,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                  }
                }

                else
                {
                  sub_100001B14( (uint64_t)"%s: invalid param lan port",  v163,  v164,  v165,  v166,  v167,  v168,  v169,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                }
              }

              else
              {
                sub_100001B14( (uint64_t)"%s: invalid param lan addr",  v154,  v155,  v156,  v157,  v158,  v159,  v160,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
              }
            }

            else
            {
              sub_100001B14( (uint64_t)"%s: invalid param query_obj",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
            }

            char v79 = 0;
            uint64_t v80 = 0LL;
            goto LABEL_33;
          }

          sub_100001B14((uint64_t)"incorrect xpc request type", v30, v31, v32, v33, v34, v35, v36, v406);
          xpc_object_t v144 = xpc_dictionary_create_reply(object);
          if (!v144) {
            goto LABEL_76;
          }
          xpc_object_t v77 = v144;
LABEL_71:
          v132 = off_100010010[0];
          xpc_object_t v131 = v77;
          uint64_t v133 = 2000LL;
LABEL_72:
          xpc_dictionary_set_uint64(v131, v132, v133);
          uint64_t v78 = v27;
          goto LABEL_73;
        }

        if (object
          && xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary
          && (xpc_object_t v181 = xpc_dictionary_get_value(object, off_100010048[0])) != 0LL
          && (v182 = v181, xpc_get_type(v181) == (xpc_type_t)&_xpc_type_dictionary)
          && (xpc_object_t v183 = xpc_dictionary_get_value(v182, off_100010058[0])) != 0LL
          && (v184 = v183, xpc_get_type(v183) == (xpc_type_t)&_xpc_type_array))
        {
          int v185 = sub_100001CB4();
          if ((ioctl(v185, 0xC0104419uLL, __size) & 0x80000000) == 0)
          {
            sub_100001B50( (uint64_t)"required buffer length is %d. sizeof pfsync_state is %u",  v186,  v187,  v188,  v189,  v190,  v191,  v192,  __size[0].val[0]);
            unint64_t v193 = ((int)__size[0].val[0] & 0xFFFFFFFFFFFFFFF8LL) + 8;
            size_t v194 = v193 + 40 * xpc_array_get_count(v184) + 8 * (v193 / 0x129) + 96;
            v195 = (char *)malloc(v194);
            v134 = v195;
            if (v195)
            {
              *(void *)&__size[0].val[2] = v195;
              bzero(v195, v194);
              v408 = __size;
              if (ioctl(v185, 0xC0104419uLL) < 0)
              {
                sub_100001B14( (uint64_t)"%s: ioctl DIOCGETSTATES (second), err %d",  v203,  v204,  v205,  v206,  v207,  v208,  v209,  (uint64_t)"__PFDQueryStatesByDescriptor");
              }

              else
              {
                int v210 = __size[0].val[0];
                unint64_t v410 = (int)__size[0].val[0] & 0xFFFFFFFFFFFFFFF8LL;
                v211 = &v134[v410];
                *((_WORD *)v211 + 8) = 529;
                *((_WORD *)v211 + 20) = 7697;
                *((_WORD *)v211 + 32) = 518;
                *((_WORD *)v211 + 44) = 7686;
                uint64_t v212 = (uint64_t)&v134[v410 + 104];
                uint64_t v213 = *(void *)&__size[0].val[2];
                if (v210 >= 1)
                {
                  uint64_t v214 = 0LL;
                  while (1)
                  {
                    int v215 = *(unsigned __int8 *)(v213 + v214 + 282);
                    if (v215 == 30) {
                      break;
                    }
                    if (v215 == 2)
                    {
                      int v216 = *(unsigned __int8 *)(v213 + v214 + 284);
                      v217 = &v134[v410 + 56];
                      if (v216 != 6)
                      {
                        v217 = &v134[v410 + 8];
LABEL_124:
                        if (v216 != 17) {
                          goto LABEL_128;
                        }
                      }

                      goto LABEL_127;
                    }

LABEL_128:
                    v214 += 297LL;
                  }

                  int v216 = *(unsigned __int8 *)(v213 + v214 + 284);
                  if (v216 != 6)
                  {
                    v217 = &v134[v410 + 32];
                    goto LABEL_124;
                  }

                  v217 = &v134[v410 + 80];
LABEL_127:
                  ++*(_DWORD *)v217;
                  goto LABEL_128;
                }

LABEL_129:
                *(void *)&v134[v410 + 24] = v212;
                uint64_t v218 = v212 + 8LL * *(unsigned int *)&v134[v410 + 8];
                *(void *)&v134[v410 + 48] = v218;
                uint64_t v219 = v218 + 8LL * *(unsigned int *)&v134[v410 + 32];
                *(void *)&v134[v410 + 72] = v219;
                *(void *)&v134[v410 + 96] = v219 + 8LL * *(unsigned int *)&v134[v410 + 56];
                *(void *)token.val = &v134[v410 + 8];
                if (v210 >= 1)
                {
                  uint64_t v220 = 0LL;
                  while (1)
                  {
                    int v221 = *(unsigned __int8 *)(v213 + v220 + 282);
LABEL_142:
                    v220 += 297LL;
                  }

                  if (v221 == 2)
                  {
                    int v222 = *(unsigned __int8 *)(v213 + v220 + 284);
                    uint64_t v223 = (uint64_t)&v134[v410 + 56];
                    if (v222 == 6) {
                      goto LABEL_141;
                    }
                    uint64_t v223 = (uint64_t)&v134[v410 + 8];
                  }

                  else
                  {
                    if (v221 != 30)
                    {
LABEL_139:
                      sub_100001B50( (uint64_t)"skipping state that is using IP Version %hhu and IP protocol %hhu.",  v203,  v204,  v205,  v206,  v207,  v208,  v209,  *(unsigned __int8 *)(v213 + v220 + 282));
                      int v210 = __size[0].val[0];
                      goto LABEL_142;
                    }

                    int v222 = *(unsigned __int8 *)(v213 + v220 + 284);
                    if (v222 == 6)
                    {
                      uint64_t v223 = (uint64_t)&v134[v410 + 80];
LABEL_141:
                      uint64_t v224 = *(unsigned int *)(v223 + 4);
                      *(void *)(*(void *)(v223 + 16) + 8 * v224) = v213 + v220;
                      *(_DWORD *)(v223 + 4) = v224 + 1;
                      goto LABEL_142;
                    }

                    uint64_t v223 = (uint64_t)&v134[v410 + 32];
                  }

                  if (v222 == 17) {
                    goto LABEL_141;
                  }
                  goto LABEL_139;
                }

LABEL_143:
                sub_100001B50( (uint64_t)"finished adding states to dictionary",  v203,  v204,  v205,  v206,  v207,  v208,  v209,  (uint64_t)v408);
                if (xpc_array_get_count(v184))
                {
                  size_t v225 = 0LL;
                  v226 = (unsigned __int8 *)&v134[v411 + 120 + (int)v410];
                  while (1)
                  {
                    xpc_object_t v227 = xpc_array_get_value(v184, v225);
                    if (!v227 || (v235 = v227, xpc_get_type(v227) != (xpc_type_t)&_xpc_type_dictionary))
                    {
                      sub_100001B14( (uint64_t)"input descriptor array index %u is not dictionary type",  v228,  v229,  v230,  v231,  v232,  v233,  v234,  v225);
                      goto LABEL_253;
                    }

                    xpc_object_t v236 = xpc_dictionary_get_value(v235, off_100010060[0]);
                    if (!v236 || (v244 = v236, xpc_get_type(v236) != (xpc_type_t)&_xpc_type_data))
                    {
                      sub_100001B14( (uint64_t)"input descriptor array index %u does not or has wrong type of descriptor",  v237,  v238,  v239,  v240,  v241,  v242,  v243,  v225);
                      goto LABEL_253;
                    }

                    bytes_ptr = xpc_data_get_bytes_ptr(v244);
                    size_t length = xpc_data_get_length(v244);
                    xpc_object_t v247 = xpc_dictionary_get_value(v235, off_100010068[0]);
                    if (!v247 || (v255 = v247, xpc_get_type(v247) != (xpc_type_t)&_xpc_type_uuid))
                    {
                      sub_100001B14( (uint64_t)"input descriptor array index %u does not or has wrong type of descriptor id",  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v225);
                      goto LABEL_253;
                    }

                    if (length != 48)
                    {
                      sub_100001B14( (uint64_t)"invalid input array element %u: incorrect length",  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v225);
                      goto LABEL_253;
                    }

                    if (*bytes_ptr != 2) {
                      break;
                    }
                    bytes = xpc_uuid_get_bytes(v255);
                    uuid_copy(v226, bytes);
                    int v262 = sub_10000414C( (uint64_t *)&token,  (uint64_t)bytes_ptr,  (uint64_t)(v226 - 16),  v257,  v258,  v259,  v260,  v261);
                    uint64_t v263 = *(void *)xpc_uuid_get_bytes(v255);
                    xpc_uuid_get_bytes(v255);
                    if (v262) {
                      v271 = "some states matched with descriptor %llu %llu";
                    }
                    else {
                      v271 = "no states matched with descriptor %llu %llu";
                    }
                    sub_100001B50((uint64_t)v271, v264, v265, v266, v267, v268, v269, v270, v263);
                    ++v225;
                    v226 += 40;
                    if (v225 >= xpc_array_get_count(v184)) {
                      goto LABEL_157;
                    }
                  }

                  uint64_t v407 = v225;
                  v405 = "invalid input array element %u: incorrect object type";
                }

                else
                {
LABEL_157:
                  xpc_object_t empty = xpc_array_create_empty();
                  if (empty)
                  {
                    v273 = empty;
                    xpc_object_t v274 = xpc_dictionary_create_reply(object);
                    if (v274)
                    {
                      xpc_object_t v77 = v274;
                      xpc_dictionary_set_uint64(v274, off_100010010[0], 0x7D1uLL);
                      if (xpc_array_get_count(v184))
                      {
                        size_t v275 = 0LL;
                        v276 = &v134[v411 + 136 + (int)v410];
                        do
                        {
                          xpc_object_t v277 = xpc_dictionary_create_empty();
                          xpc_dictionary_set_uint64(v277, off_100010088[0], *((void *)v276 - 4));
                          xpc_dictionary_set_uint64(v277, off_100010090[0], *((void *)v276 - 3));
                          xpc_dictionary_set_uuid(v277, off_100010078[0], (const unsigned __int8 *)v276 - 16);
                          char v278 = *v276;
                          v276 += 40;
                          xpc_dictionary_set_BOOL(v277, off_100010080[0], v278);
                          xpc_array_append_value(v273, v277);
                          xpc_release(v277);
                          ++v275;
                        }

                        while (v275 < xpc_array_get_count(v184));
                      }

                      xpc_dictionary_set_value(v77, off_100010070[0], v273);
                      xpc_release(v273);
                      goto LABEL_67;
                    }

LABEL_163:
                    sub_100001B14( (uint64_t)"xpc_dictionary_create_reply failed",  v136,  v137,  v138,  v139,  v140,  v141,  v142,  v407);
                    xpc_object_t v77 = 0LL;
                    char v143 = 1;
LABEL_164:
                    if (v134) {
                      free(v134);
                    }
                    if ((v143 & 1) != 0) {
                      return;
                    }
                    goto LABEL_74;
                  }

                  v405 = "xpc_array_create_empty failed";
                }

                sub_100001B14((uint64_t)v405, v248, v249, v250, v251, v252, v253, v254, v407);
LABEL_253:
                uint64_t v28 = off_100010000;
              }
            }

            else
            {
              sub_100001B14( (uint64_t)"%s: malloc %zu",  v196,  v197,  v198,  v199,  v200,  v201,  v202,  (uint64_t)"__PFDQueryStatesByDescriptor");
            }

LABEL_65:
            xpc_object_t v135 = xpc_dictionary_create_reply(object);
            if (v135)
            {
              xpc_object_t v77 = v135;
              xpc_dictionary_set_uint64(v135, v28[2], 0x7D0uLL);
LABEL_67:
              sub_100004034(v27, v77);
              char v143 = 0;
              goto LABEL_164;
            }

            goto LABEL_163;
          }

          sub_100001B14( (uint64_t)"%s: ioctl DIOCGETSTATES (first), err %d",  v186,  v187,  v188,  v189,  v190,  v191,  v192,  (uint64_t)"__PFDQueryStatesByDescriptor");
        }

        else
        {
          sub_100001B14( (uint64_t)"%s: invalid param",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"__PFDQueryStatesByDescriptor");
        }

        v134 = 0LL;
        goto LABEL_65;
    }
  }

LABEL_22:
  name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  sub_100001B14((uint64_t)"%s[%d] does not have entitlements ", v54, v55, v56, v57, v58, v59, v60, (uint64_t)name);
  if (&_xpc_type_dictionary == &_xpc_type_error)
  {
LABEL_23:
    uint64_t v61 = *(void *)(a1 + 32);
    xpc_dictionary_get_string(object, _xpc_error_key_description);
    sub_100001B50((uint64_t)"%p: %s", v62, v63, v64, v65, v66, v67, v68, v61);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (!dword_100010438) {
      sub_100008360();
    }
    --dword_100010438;
    return;
  }

  xpc_object_t v69 = xpc_dictionary_create_reply(object);
  if (!v69)
  {
LABEL_76:
    sub_100001B14((uint64_t)"xpc_dictionary_create_reply failed", v70, v71, v72, v73, v74, v75, v76, v406);
    return;
  }

  xpc_object_t v77 = v69;
  xpc_dictionary_set_uint64(v69, off_100010010[0], 0x7D2uLL);
  uint64_t v78 = *(_xpc_connection_s **)(a1 + 32);
LABEL_73:
  sub_100004034(v78, v77);
LABEL_74:
  v145 = v77;
LABEL_75:
  xpc_release(v145);
}

void sub_100004034(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v11 = xpc_copy_description(object);
  sub_100001B8C((uint64_t)"%p:\n%s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)a1);
  free(v11);
  xpc_connection_send_message(a1, object);
}

uint64_t sub_100004090(void *a1, const char **a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100010018[0]);
  if (!value || xpc_get_type(value) != (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v14 = "Incorrect type for app";
LABEL_4:
    sub_100001B14((uint64_t)v14, v7, v8, v9, v10, v11, v12, v13, v17);
    return 0LL;
  }

  xpc_object_t v16 = xpc_dictionary_get_value(a1, off_100010020[0]);
  if (!v16 || xpc_get_type(v16) != (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v14 = "Incorrect type for sub app";
    goto LABEL_4;
  }

  *a2 = xpc_dictionary_get_string(a1, off_100010018[0]);
  *a3 = xpc_dictionary_get_string(a1, off_100010020[0]);
  return 1LL;
}

uint64_t sub_10000414C( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  for (unint64_t i = 0LL; i != 4; ++i)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    {
      int v25 = *(unsigned __int8 *)(a2 + 9);
      if ((i & 1) != 0 && v25 == 4) {
        continue;
      }
      if ((i & 1) == 0 && v25 == 96) {
        continue;
      }
    }

    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
    {
      int v26 = *(unsigned __int8 *)(a2 + 10);
      if (i <= 1 && v26 == 6) {
        continue;
      }
      if (i >= 2 && v26 == 17) {
        continue;
      }
    }

    uint64_t v12 = *a1;
    *(_BYTE *)(a3 + 32) = 0;
    *(void *)a3 = 0LL;
    uint64_t v13 = v12 + 24 * i;
    unsigned int v16 = *(_DWORD *)(v13 + 4);
    uint64_t v15 = (unsigned int *)(v13 + 4);
    unint64_t v14 = v16;
    if (v16)
    {
      unint64_t v17 = 0LL;
      uint64_t v18 = (void *)(v12 + 24 * i + 16);
      do
      {
        uint64_t v19 = *(void *)(*v18 + 8 * v17);
        if (((*(_BYTE *)(a2 + 8) & 0x10) == 0 || *(unsigned __int16 *)(a2 + 44) == *(unsigned __int16 *)(v19 + 40))
          && ((*(_BYTE *)(a2 + 8) & 0x20) == 0 || *(unsigned __int16 *)(a2 + 46) == *(unsigned __int16 *)(v19 + 88))
          && ((*(_BYTE *)(a2 + 8) & 2) == 0 || *(unsigned __int8 *)(a2 + 10) == *(unsigned __int8 *)(v19 + 284)))
        {
          if ((*(_BYTE *)(a2 + 8) & 1) == 0) {
            goto LABEL_34;
          }
          int v20 = *(unsigned __int8 *)(a2 + 9);
          if (v20 == 96)
          {
            if (*(_BYTE *)(v19 + 282) != 2)
            {
              if ((*(_BYTE *)(a2 + 8) & 4) == 0
                || (*(void *)(a2 + 12) == *(void *)(v19 + 24)
                  ? (BOOL v21 = *(void *)(a2 + 20) == *(void *)(v19 + 32))
                  : (BOOL v21 = 0),
                    v21))
              {
                if ((*(_BYTE *)(a2 + 8) & 8) == 0
                  || (*(void *)(a2 + 28) == *(void *)(v19 + 72)
                    ? (BOOL v22 = *(void *)(a2 + 36) == *(void *)(v19 + 80))
                    : (BOOL v22 = 0),
                      v22))
                {
LABEL_34:
                  *(_BYTE *)(a3 + 32) = 1;
                  *(void *)a3 = v23;
                  *(void *)(a3 + 8) = v24;
                  goto LABEL_35;
                }
              }
            }
          }

          else if (v20 != 4 {
                 || *(_BYTE *)(v19 + 282) != 30
          }
                 && ((*(_BYTE *)(a2 + 8) & 4) == 0 || *(_DWORD *)(a2 + 24) == *(_DWORD *)(v19 + 48))
                 && ((*(_BYTE *)(a2 + 8) & 8) == 0 || *(_DWORD *)(a2 + 40) == *(_DWORD *)(v19 + 72)))
          {
            goto LABEL_34;
          }
        }

        sub_100001B50((uint64_t)"state did not match filter", a2, a3, a4, a5, a6, a7, a8, v29);
        unint64_t v14 = *v15;
LABEL_35:
        ++v17;
      }

      while (v17 < v14);
    }
  }

  if (*(_BYTE *)(a3 + 32)) {
    uint64_t v27 = "found";
  }
  else {
    uint64_t v27 = "did not find";
  }
  sub_100001B8C((uint64_t)"%s matching states for the descriptor", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v27);
  return *(unsigned __int8 *)(a3 + 32);
}

void sub_10000437C( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v12 = 0LL;
  while (!*(void *)(a3 + 8 * v12))
  {
LABEL_8:
    if (++v12 == 10) {
      return;
    }
  }

  if (v12 > 4) {
    uint64_t v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s%s", "com.apple", a1);
  }
  else {
    uint64_t v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s", "/", v22);
  }
  BOOL v21 = v13;
  if (v13)
  {
    sub_100004488(a1, a2, *(void *)(a3 + 8 * v12), v13);
    CFRelease(v21);
    goto LABEL_8;
  }

  sub_100001B14( (uint64_t)"PFDRuleDeleteAnchorIDs failed creating anchor strings.",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  a9);
}

BOOL sub_100004488(const char *a1, const char *a2, uint64_t a3, CFStringRef theString)
{
  BOOL result = 0LL;
  if (a1 && a2 && theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      uint64_t v16 = CStringPtr;
      bzero(v36, 0xC20uLL);
      if (strncmp(v16, "/", 0x40uLL))
      {
        snprintf(__str, 0x40uLL, "%s%s", a1, a2);
        strncpy(v40, __str, 0x40uLL);
      }

      snprintf(v38, 0x40uLL, "%s", v16);
      uint64_t v39 = a3;
      uint64_t v17 = ioctl(dword_100010390, 0xCC20441CuLL);
      if ((_DWORD)v17)
      {
        int v25 = *__error();
        int v26 = sub_100001CC0(3424666652LL);
        sub_100001B14((uint64_t)"%s: %m", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);
        return v25 == 0;
      }

      else
      {
        if (!v37) {
          sub_100005DE0(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v36);
        }
        return 1LL;
      }
    }

    else
    {
      sub_100001B14((uint64_t)"CFStringGetCStringPtr failed", v9, v10, v11, v12, v13, v14, v15, v34);
      return 0LL;
    }
  }

  return result;
}

CFStringRef sub_1000045F0(const char *a1, const char *a2, int a3, int a4, void *a5)
{
  CFStringRef v5 = 0LL;
  if (!a1 || !a2) {
    return v5;
  }
  snprintf(__str, 0x40uLL, "%s%s", "com.apple.", a1);
  snprintf(v31, 0x40uLL, "%s", a2);
  snprintf(v30, 0x40uLL, "%s%s", a1, a2);
  CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s%s%s");
  if (!v5)
  {
    sub_100001B14( (uint64_t)"CFStringCreateWithFormat failed in anchor create",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)__str);
    return v5;
  }

  if (!strncmp(a1, off_1000100D0[0], 0x40uLL))
  {
    BOOL v21 = strncmp(a1, off_1000100D8[0], 0x40uLL) == 0;
  }

  else
  {
    int v18 = strncmp(a1, kPFThreadBR[0], 0x40uLL);
    int v19 = strncmp(a1, off_1000100E8[0], 0x40uLL);
    int v20 = strncmp(a1, off_1000100D8[0], 0x40uLL);
    BOOL v21 = v20 == 0;
    if (v19 && v18)
    {
      int v22 = 0;
      int v23 = 0;
      BOOL v21 = 0;
      if (v20) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }

    if (v18)
    {
      int v23 = 0;
      goto LABEL_15;
    }
  }

  if (sub_10000496C((uint64_t)__str, (uint64_t)"/", 0LL, a3, 2u, a5))
  {
LABEL_21:
    CFRelease(v5);
    sub_10000437C(a1, a2, (uint64_t)a5, v24, v25, v26, v27, v28, (uint64_t)__str);
    return 0LL;
  }

  int v23 = 1;
LABEL_15:
  int v22 = 1;
  if (!v21) {
    goto LABEL_19;
  }
LABEL_17:
  BOOL v21 = 1;
LABEL_19:
  if (sub_10000496C((uint64_t)__str, (uint64_t)"/", 0LL, a3, 0, a5 + 3)
    || sub_10000496C((uint64_t)__str, (uint64_t)"/", 0LL, a3, 1u, a5 + 4)
    || v23 && sub_10000496C((uint64_t)v31, (uint64_t)__str, v30, a4, 2u, a5 + 5)
    || v22 && sub_10000496C((uint64_t)v31, (uint64_t)__str, v30, a4, 4u, a5 + 6)
    || v21 && sub_10000496C((uint64_t)v31, (uint64_t)__str, v30, a4, 5u, a5 + 7)
    || sub_10000496C((uint64_t)v31, (uint64_t)__str, v30, a4, 0, a5 + 8)
    || sub_10000496C((uint64_t)v31, (uint64_t)__str, v30, a4, 1u, a5 + 9))
  {
    goto LABEL_21;
  }

  return v5;
}

uint64_t sub_10000496C(uint64_t a1, uint64_t a2, const char *a3, int a4, unsigned int a5, void *a6)
{
  if (a5 <= 5 && ((0x37u >> a5) & 1) != 0) {
    char v35 = 0xB0800040002uLL >> (8 * a5);
  }
  int v34 = a4;
  if (a3) {
    strncpy(v33, a3, 0x40uLL);
  }
  if (ioctl(dword_100010390, 0xCC20441BuLL, v30))
  {
    uint64_t v19 = 0LL;
    int v20 = *__error();
    if (v20 && v20 != 17)
    {
      uint64_t v19 = v20;
      BOOL v21 = sub_100001CC0(3424666651LL);
      sub_100001B14((uint64_t)"%s - anchor %s(%s): %m", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v21);
    }
  }

  else
  {
    if (a6) {
      *a6 = v32[214];
    }
    sub_100001B8C((uint64_t)"inserted - anchor %s-%s", v12, v13, v14, v15, v16, v17, v18, a2);
    return 0LL;
  }

  return v19;
}

CFStringRef sub_100004AEC(const char *a1, const char *a2)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, SystemEncoding);
}

BOOL sub_100004B7C(const char *a1, const char *a2, const __CFString *a3, void *a4)
{
  BOOL result = 1LL;
  if (a2 && a1 && a3 && a4)
  {
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    if (CStringPtr)
    {
      uint64_t v16 = CStringPtr;
      snprintf(__str, 0x40uLL, "%s%s", a1, a2);
      memcpy(__dst, &unk_1000089C0, sizeof(__dst));
      uint64_t v17 = &__dst[4];
      uint64_t v18 = 8LL;
      do
      {
        if (v18 != 2) {
          __strlcpy_chk(v17, v16, 64LL, 1024LL);
        }
        v17 += 1032;
        --v18;
      }

      while (v18);
      if (!sub_100004D38(0xC0104451uLL, (uint64_t)__dst))
      {
        int64_t count = xpc_array_get_count(a4);
        if (count < 1) {
          return sub_100004D38(0xC0104452uLL, (uint64_t)__dst) == 0;
        }
        int64_t v20 = count;
        size_t v21 = 0LL;
        while (1)
        {
          xpc_object_t value = xpc_array_get_value(a4, v21);
          if (v20 == ++v21) {
            return sub_100004D38(0xC0104452uLL, (uint64_t)__dst) == 0;
          }
        }

        sub_100001B14((uint64_t)"rule %d failed during commit", v23, v24, v25, v26, v27, v28, v29, v21);
      }

      sub_100004D38(0xC0104453uLL, (uint64_t)__dst);
    }

    else
    {
      sub_100001B14((uint64_t)"CFStringGetCStringPtr failed", v9, v10, v11, v12, v13, v14, v15, v30);
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_100004D38(unint64_t a1, uint64_t a2)
{
  v13[0] = 0x40800000008LL;
  v13[1] = a2;
  if (!ioctl(dword_100010390, a1, v13)) {
    return 0LL;
  }
  uint64_t v3 = *__error();
  uint64_t v4 = sub_100001CC0(a1);
  sub_100001B14((uint64_t)"%s: %m", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  return v3;
}

uint64_t sub_100004DB4(void *a1, const char *a2, uint64_t a3, int a4, const char *a5, void *a6)
{
  uint64_t v108 = v111;
  if (!ioctl(dword_100010390, 0xC4704433uLL)
    || (uint64_t v11 = *__error(),
        uint64_t v12 = sub_100001CC0(3295691827LL),
        sub_100001B14((uint64_t)"%s: %m", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12),
        !(_DWORD)v11))
  {
    xpc_object_t value = xpc_dictionary_get_value(a1, off_100010188[0]);
    if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
    {
      bzero(v116, 0xC20uLL);
      LOBYTE(v29) = xpc_dictionary_get_uint64(a1, off_100010188[0]);
      char v151 = v29;
      if (v29 >= 2uLL)
      {
        if ((v29 & 0xFE) == 2)
        {
          unsigned int v37 = 0;
        }

        else if ((v29 & 0xFE) == 4)
        {
          unsigned int v37 = 2;
        }

        else
        {
          char v38 = v29 - 8;
          if ((v29 - 8) < 7u && ((0x63u >> v38) & 1) != 0)
          {
            unint64_t v29 = 0xE0D0E0E0E0908uLL >> (8 * v38);
            unsigned int v37 = 4;
          }

          else if ((unint64_t)v29 - 11 >= 2)
          {
            sub_100001B14((uint64_t)"incorrect type of action", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v108);
            unsigned int v37 = 22;
            LOBYTE(v29) = v151;
          }

          else
          {
            unsigned int v37 = 5;
          }
        }
      }

      else
      {
        unsigned int v37 = 1;
      }

      if (v29 <= 0xDu && ((1 << v29) & 0x2110) != 0)
      {
        uint64_t v11 = sub_1000075F0(v115, a1, off_1000101E0[0]);
        if ((_DWORD)v11) {
          return v11;
        }
        if (v151 == 13) {
          char uint64 = 2;
        }
        else {
          char uint64 = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
        }
        char v113 = uint64;
        if (ioctl(dword_100010390, 0xC4704434uLL, v111))
        {
          uint64_t v11 = *__error();
          int v41 = sub_100001CC0(3295691828LL);
          sub_100001B14((uint64_t)"%s: %m", v42, v43, v44, v45, v46, v47, v48, (uint64_t)v41);
          return v11;
        }
      }

      if (a3) {
        int v117 = *(_DWORD *)(a3 + 1032LL * v37 + 1028);
      }
      int v139 = a4;
      int v118 = v112;
      snprintf(v119, 0x40uLL, "%s", a2);
      strncpy(v138, a5, 0x40uLL);
      string = xpc_dictionary_get_string(a1, off_1000101A0[0]);
      if (string) {
        snprintf(v130, 0x10uLL, "%s", string);
      }
      xpc_object_t v50 = xpc_dictionary_get_value(a1, off_100010198[0]);
      xpc_object_t v51 = xpc_dictionary_get_value(a1, off_100010308[0]);
      xpc_object_t v52 = xpc_dictionary_get_value(a1, off_100010310[0]);
      xpc_object_t v53 = xpc_dictionary_get_value(a1, off_1000101B8[0]);
      if (v53 && xpc_get_type(v53) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v155 = xpc_dictionary_get_BOOL(a1, off_1000101B8[0]);
      }
      xpc_object_t v54 = xpc_dictionary_get_value(a1, off_1000101A8[0]);
      xpc_object_t v55 = xpc_dictionary_get_value(a1, off_100010318[0]);
      xpc_object_t v56 = xpc_dictionary_get_value(a1, off_100010320[0]);
      xpc_object_t v57 = xpc_dictionary_get_value(a1, off_1000101B0[0]);
      xpc_object_t v58 = xpc_dictionary_get_value(a1, off_100010370[0]);
      xpc_object_t v59 = xpc_dictionary_get_value(a1, off_100010368[0]);
      xpc_object_t v60 = xpc_dictionary_get_value(a1, off_100010360[0]);
      if (v60 && xpc_get_type(v60) == (xpc_type_t)&_xpc_type_uint64)
      {
        int v61 = xpc_dictionary_get_uint64(a1, off_100010360[0]);
        v150 |= v61;
      }

      xpc_object_t v62 = xpc_dictionary_get_value(a1, off_100010328[0]);
      if (v62)
      {
        if (xpc_get_type(v62) == (xpc_type_t)&_xpc_type_uint64)
        {
          int v63 = xpc_dictionary_get_uint64(a1, off_100010328[0]);
          v150 |= v63;
          if ((v150 & 8) != 0) {
            int v142 = 17040131;
          }
        }
      }

      xpc_object_t v64 = xpc_dictionary_get_value(a1, off_100010330[0]);
      xpc_object_t v65 = xpc_dictionary_get_value(a1, off_100010338[0]);
      if (v65 && xpc_get_type(v65) == (xpc_type_t)&_xpc_type_uint64)
      {
        LOWORD(v142) = xpc_dictionary_get_uint64(a1, off_100010338[0]) | 0x300;
        HIWORD(v142) = 260;
      }

      xpc_object_t v66 = xpc_dictionary_get_value(a1, off_100010340[0]);
      if (v66)
      {
        if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_uint64)
        {
          HIWORD(v142) = xpc_dictionary_get_uint64(a1, off_100010340[0]) | 0x100;
          if (!(_WORD)v142) {
            LOWORD(v142) = 771;
          }
        }
      }

      xpc_object_t v67 = xpc_dictionary_get_value(a1, off_1000102E0[0]);
      xpc_object_t v68 = xpc_dictionary_get_value(a1, off_1000102D0[0]);
      xpc_object_t v69 = xpc_dictionary_get_value(a1, off_1000102D8[0]);
      xpc_object_t v70 = xpc_dictionary_get_value(a1, off_100010300[0]);
      xpc_object_t v71 = xpc_dictionary_get_value(a1, off_1000102F0[0]);
      xpc_object_t v72 = xpc_dictionary_get_value(a1, off_1000102F8[0]);
      xpc_object_t v73 = xpc_dictionary_get_value(a1, off_1000101E8[0]);
      xpc_object_t v74 = xpc_dictionary_get_value(a1, off_1000101F0[0]);
      xpc_object_t v75 = xpc_dictionary_get_value(a1, off_100010220[0]);
      xpc_object_t v76 = xpc_dictionary_get_value(a1, off_100010228[0]);
      if (v76 && xpc_get_type(v76) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v166 = xpc_dictionary_get_BOOL(a1, off_100010228[0]);
      }
      xpc_object_t v77 = xpc_dictionary_get_string(a1, off_100010348[0]);
      if (v77) {
        snprintf(v131, 0x40uLL, "%s", v77);
      }
      uint64_t v78 = xpc_dictionary_get_string(a1, off_100010350[0]);
      if (v78) {
        snprintf(v132, 0x40uLL, "%s", v78);
      }
      xpc_object_t v79 = xpc_dictionary_get_value(a1, off_100010358[0]);
      if (v79 && xpc_get_type(v79) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v156 = xpc_dictionary_get_BOOL(a1, off_100010358[0]);
      }
      xpc_object_t v80 = xpc_dictionary_get_value(a1, off_100010248[0]);
      xpc_object_t v81 = xpc_dictionary_get_value(a1, off_100010240[0]);
      xpc_object_t v82 = xpc_dictionary_get_value(a1, off_100010250[0]);
      xpc_object_t v83 = xpc_dictionary_get_value(a1, off_100010258[0]);
      if (v83 && xpc_get_type(v83) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v157 = xpc_dictionary_get_BOOL(a1, off_100010258[0]);
      }
      xpc_object_t v84 = xpc_dictionary_get_value(a1, off_100010260[0]);
      xpc_object_t v85 = xpc_dictionary_get_value(a1, off_100010380[0]);
      xpc_object_t v86 = xpc_dictionary_get_value(a1, off_100010378[0]);
      uint64_t v11 = sub_1000075F0(v120, a1, off_1000101C0[0]);
      if (!(_DWORD)v11)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102A8[0]);
        xpc_object_t v87 = xpc_dictionary_get_value(a1, __str);
        if (v87 && xpc_get_type(v87) == (xpc_type_t)&_xpc_type_BOOL) {
          BOOL v124 = xpc_dictionary_get_BOOL(a1, __str);
        }
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102C0[0]);
        xpc_object_t v88 = xpc_dictionary_get_value(a1, __str);
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        xpc_object_t v89 = xpc_dictionary_get_value(a1, __str);
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B8[0]);
        xpc_object_t v90 = xpc_dictionary_get_value(a1, __str);
        uint64_t v11 = sub_1000075F0(v125, a1, "to");
        if (!(_DWORD)v11)
        {
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102A8[0]);
          xpc_object_t v91 = xpc_dictionary_get_value(a1, __str);
          if (v91 && xpc_get_type(v91) == (xpc_type_t)&_xpc_type_BOOL) {
            BOOL v129 = xpc_dictionary_get_BOOL(a1, __str);
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102C0[0]);
          xpc_object_t v92 = xpc_dictionary_get_value(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
          xpc_object_t v93 = xpc_dictionary_get_value(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B8[0]);
          xpc_object_t v94 = xpc_dictionary_get_value(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102C0[0]);
          xpc_object_t v95 = xpc_dictionary_get_value(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B0[0]);
          xpc_object_t v96 = xpc_dictionary_get_value(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B8[0]);
          xpc_object_t v97 = xpc_dictionary_get_value(a1, __str);
          if (v151 == 13)
          {
            char v159 = 30;
            char v136 = 2;
          }

          if (a3)
          {
            uint64_t v98 = 3424666628LL;
            int v99 = ioctl(dword_100010390, 0xCC204404uLL, v116);
          }

          else
          {
            uint64_t v98 = 3424666651LL;
            int v99 = ioctl(dword_100010390, 0xCC20441BuLL, v116);
          }

          if (v99)
          {
            uint64_t v11 = *__error();
            xpc_object_t v100 = sub_100001CC0(v98);
            sub_100001B14((uint64_t)"%s: %m", v101, v102, v103, v104, v105, v106, v107, (uint64_t)v100);
          }

          else
          {
            uint64_t v11 = 0LL;
          }

          if (a6) {
            *a6 = v137;
          }
        }
      }
    }

    else
    {
      sub_100001B14((uint64_t)"incorrect action value", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v108);
      return 22LL;
    }
  }

  return v11;
}

BOOL sub_100005CF0(const char *a1, const char *a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    bzero(v22, 0xC20uLL);
    strncpy(v24, __str, 0x40uLL);
    uint64_t v4 = ioctl(dword_100010390, 0xCC20441CuLL);
    if ((_DWORD)v4)
    {
      int v12 = *__error();
      uint64_t v13 = sub_100001CC0(3424666652LL);
      sub_100001B14((uint64_t)"%s: %m", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      return v12 == 0;
    }

    else
    {
      if (!v23) {
        sub_100005DE0(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v22);
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_100005DE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!qword_1000103A0) {
    return sub_100001B8C((uint64_t)"pf is already disabled", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  uint64_t v26 = qword_1000103A0;
  uint64_t v25 = (const char *)&v26;
  if (ioctl(dword_100010390, 0xC0104409uLL))
  {
    if (*__error() == 2)
    {
      int v23 = "pf not enabled";
    }

    else
    {
      uint64_t v25 = sub_100001CC0(3222291465LL);
      int v23 = "%s: %m";
    }

    return sub_100001B14((uint64_t)v23, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);
  }

  else
  {
    if (v27) {
      uint64_t result = sub_100001B8C( (uint64_t)"pf still enabled with %llu other reference%s",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v27);
    }
    else {
      uint64_t result = sub_100001B8C((uint64_t)"pf disabled", v9, v10, v11, v12, v13, v14, v15, (uint64_t)&v26);
    }
    qword_1000103A0 = 0LL;
  }

  return result;
}

BOOL sub_100005EC4(const char *a1, const char *a2, const __CFString *a3, int a4, void *a5, void *a6)
{
  BOOL result = 0LL;
  if (a1 && a2 && a3 && a5)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    if (CStringPtr)
    {
      return sub_100004DB4(a5, CStringPtr, 0LL, a4, __str, a6) == 0;
    }

    else
    {
      sub_100001B14((uint64_t)"CFStringGetCStringPtr failed", v13, v14, v15, v16, v17, v18, v19, v20);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100005FA0(const __CFString *a1, _DWORD *a2)
{
  v27[1] = v27;
  if (CFStringGetCString(a1, v26, 1024LL, 0x8000100u))
  {
    int v11 = 0;
    *a2 = 0;
    while (1)
    {
      if ((v11 & 0x7FFFFFFB) != 0xA && v11 != 12 && v11 != 9 && (v11 & 0x7FFFFFF9) != 1)
      {
        char v28 = v11;
        if (ioctl(dword_100010390, 0xCC204406uLL, v24))
        {
          int v23 = sub_100001CC0(3424666630LL);
          sub_100001B14((uint64_t)"%s: %m", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
          return 0LL;
        }

        *a2 += v25;
      }

      if (++v11 == 15) {
        return 1LL;
      }
    }
  }

  sub_100001B14((uint64_t)"%s: anchor name too long", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"PFDRuleGetNumberOfRules");
  return 0LL;
}

BOOL sub_1000060E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_1000103A0)
  {
    sub_100001B8C((uint64_t)"pf is already enabled", a2, a3, a4, a5, a6, a7, a8, v25);
    return 1LL;
  }

  if (!ioctl(dword_100010390, 0x40084408uLL)) {
    return 1LL;
  }
  int v16 = *__error();
  if (v16 == 17)
  {
    sub_100001B14((uint64_t)"pf already enabled", v9, v10, v11, v12, v13, v14, v15, (uint64_t)&qword_1000103A0);
    return 1LL;
  }

  uint64_t v17 = sub_100001CC0(1074283528LL);
  sub_100001B14((uint64_t)"%s: %m", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
  return v16 == 0;
}

xpc_object_t sub_10000618C(const __CFString *a1, _BYTE *a2)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0);
  snprintf(v119, 0x40uLL, "%s", CStringPtr);
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  int v5 = 0;
  char v113 = a2;
  while (1)
  {
    BOOL v6 = (v5 & 0x7FFFFFFB) == 0xA || v5 == 12;
    BOOL v7 = v6 || v5 == 9;
    if (!v7 && (v5 & 0x7FFFFFF9) != 1)
    {
      unsigned __int8 value_4 = v5;
      if (ioctl(dword_100010390, 0xCC204406uLL, v116))
      {
        uint64_t v94 = 3424666630LL;
LABEL_172:
        uint64_t v103 = sub_100001CC0(v94);
        sub_100001B14((uint64_t)"%s: %m", v104, v105, v106, v107, v108, v109, v110, (uint64_t)v103);
        xpc_release(v4);
        xpc_object_t v4 = 0LL;
        *a2 = 0;
        return v4;
      }

      int v115 = v118;
      if (v118 >= 1) {
        break;
      }
    }

LABEL_161:
    if (++v5 == 15)
    {
      if (!xpc_array_get_count(v4))
      {
        sub_100001B8C((uint64_t)"no rules in the anchor %s", v86, v87, v88, v89, v90, v91, v92, (uint64_t)CStringPtr);
        xpc_release(v4);
        xpc_object_t v4 = 0LL;
      }

      *a2 = 1;
      return v4;
    }
  }

  int v9 = 0;
  while (1)
  {
    int v118 = v9;
    if (ioctl(dword_100010390, 0xCC204407uLL, v116))
    {
      uint64_t v94 = 3424666631LL;
      goto LABEL_172;
    }

    int v10 = v117;
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v11) {
      goto LABEL_175;
    }
    uint64_t v19 = v11;
    xpc_dictionary_set_uint64(v11, off_100010188[0], value_4);
    if (value_4 > 0xEu || ((1 << value_4) & 0x6330) == 0) {
      xpc_dictionary_set_uint64(v19, off_100010198[0], value_5);
    }
    if (v130[0]) {
      xpc_dictionary_set_string(v19, off_1000101A0[0], v130);
    }
    if (v162) {
      xpc_dictionary_set_uint64(v19, off_1000101A8[0], v162);
    }
    if (value_4 == 1 && (value & 0xD) != 0) {
      break;
    }
LABEL_42:
    if (v163)
    {
      uint64_t v26 = getprotobynumber(v163);
      if (v26) {
        xpc_dictionary_set_string(v19, off_1000101B0[0], v26->p_name);
      }
      else {
        xpc_dictionary_set_uint64(v19, off_1000101B0[0], v163);
      }
    }

    if (v158) {
      xpc_dictionary_set_BOOL(v19, off_1000101B8[0], 1);
    }
    if (!value_4 && v161) {
      xpc_dictionary_set_uint64(v19, off_100010220[0], v161);
    }
    if (v169) {
      xpc_dictionary_set_BOOL(v19, off_100010228[0], 1);
    }
    if ((_DWORD)v143) {
      xpc_dictionary_set_uint64(v19, off_100010250[0], v143);
    }
    if (v160) {
      xpc_dictionary_set_BOOL(v19, off_100010258[0], 1);
    }
    if ((_DWORD)v144) {
      xpc_dictionary_set_uint64(v19, off_100010260[0], v144);
    }
    if (v138) {
      xpc_dictionary_set_uint64(v19, off_100010268[0], v138);
    }
    if (v139) {
      xpc_dictionary_set_uint64(v19, off_100010270[0], v139);
    }
    if (v140) {
      xpc_dictionary_set_uint64(v19, off_100010278[0], v140);
    }
    if (v141) {
      xpc_dictionary_set_uint64(v19, off_100010280[0], v141);
    }
    if (v142) {
      xpc_dictionary_set_uint64(v19, off_100010288[0], v142);
    }
    if (v166)
    {
      uint64_t v27 = 0LL;
      *(_OWORD *)uint64_t v177 = 0u;
      *(_OWORD *)uint64_t v176 = 0u;
      char v28 = v176;
      char v29 = 70;
      do
      {
        if (((v166 >> v27) & 1) != 0) {
          *v28++ = v29;
        }
        char v29 = aFsrpauew[++v27];
      }

      while (v27 != 8);
      if (!v167) {
        goto LABEL_86;
      }
    }

    else
    {
      if (!v167) {
        goto LABEL_87;
      }
      *(_OWORD *)uint64_t v177 = 0u;
      *(_OWORD *)uint64_t v176 = 0u;
      char v28 = v176;
    }

    uint64_t v30 = 0LL;
    *char v28 = 47;
    uint64_t v31 = v28 + 1;
    char v32 = 70;
    do
    {
      if (((v167 >> v30) & 1) != 0) {
        *v31++ = v32;
      }
      char v32 = aFsrpauew[++v30];
    }

    while (v30 != 8);
LABEL_86:
    xpc_dictionary_set_string(v19, off_1000101E8[0], v176);
LABEL_87:
    if (v150 && !sub_100007C7C(v150, v148, v149, off_1000101F8[0], v19)
      || v152 && !sub_100007C7C(v152, v151, v151, off_100010200[0], v19))
    {
      goto LABEL_170;
    }

    int v33 = value_4;
    if (value_4 == 2)
    {
      if (!value && !v168 && !v147) {
        goto LABEL_107;
      }
      xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v34) {
        goto LABEL_165;
      }
      uint64_t v35 = v34;
      if (value) {
        xpc_dictionary_set_uint64(v34, off_100010360[0], value);
      }
      if (v168) {
        xpc_dictionary_set_uint64(v35, off_100010368[0], v168);
      }
      if (v147) {
        xpc_dictionary_set_uint64(v35, off_100010370[0], v147);
      }
      xpc_dictionary_set_value(v19, off_100010218[0], v35);
      xpc_release(v35);
      int v33 = value_4;
    }

    if (v33 == 11 && v173)
    {
      xpc_object_t v36 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v36) {
        goto LABEL_165;
      }
      unsigned int v37 = v36;
      xpc_dictionary_set_uint64(v36, off_100010380[0], v174);
      xpc_dictionary_set_uint64(v37, off_100010378[0], v173);
      xpc_dictionary_set_value(v19, off_100010238[0], v37);
      xpc_release(v37);
    }

LABEL_107:
    if (value_6)
    {
      xpc_object_t v38 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v38) {
        goto LABEL_165;
      }
      uint64_t v39 = v38;
      if (value_6) {
        xpc_dictionary_set_uint64(v38, off_100010308[0], value_6);
      }
      if (value_7)
      {
        snprintf(v175, 0x40uLL, "pflog%d", value_7);
        xpc_dictionary_set_string(v39, off_100010310[0], v175);
      }

      xpc_dictionary_set_value(v19, off_100010208[0], v39);
      xpc_release(v39);
    }

    if ((v163 == 58 || v163 == 1) && v164)
    {
      xpc_object_t v40 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v40)
      {
        xpc_release(v19);
        xpc_object_t v93 = "subrule xpc_dictionary_create() failed %m";
        goto LABEL_176;
      }

      int v41 = v40;
      xpc_dictionary_set_uint64(v40, off_100010318[0], v164 - 1LL);
      if (v165) {
        xpc_dictionary_set_uint64(v41, off_100010320[0], v165 - 1);
      }
      xpc_dictionary_set_value(v19, off_100010210[0], v41);
      xpc_release(v41);
    }

    if (v131[0] | v132[0])
    {
      xpc_object_t v42 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v42)
      {
LABEL_165:
        xpc_release(v19);
        xpc_object_t v93 = "subrule xpc_dictionary_create failed %m";
        goto LABEL_176;
      }

      uint64_t v43 = v42;
      if (v131[0]) {
        xpc_dictionary_set_string(v42, off_100010348[0], v131);
      }
      if (v132[0]) {
        xpc_dictionary_set_string(v43, off_100010350[0], v132);
      }
      if (v159) {
        xpc_dictionary_set_BOOL(v43, off_100010358[0], 1);
      }
      xpc_dictionary_set_value(v19, off_100010230[0], v43);
      xpc_release(v43);
    }

    if (v121
      || (vmaxvq_u8((uint8x16_t)vmvnq_s8( vuzp1q_s8( (int8x16_t)vuzp1q_s16( (int16x8_t)vceqzq_s32(v120[0]),  (int16x8_t)vceqzq_s32(v120[1])),  (int8x16_t)vuzp1q_s16( (int16x8_t)vceqzq_s32(v125[0]),  (int16x8_t)vceqzq_s32(v125[1]))))) & 1) != 0 || v126 | v124 || v129)
    {
      if (!sub_100007EAC((uint64_t)v120, v162, v124, v122, v123, v163, v19, off_1000101C0[0]))
      {
        xpc_object_t v95 = "get source address/port failed";
LABEL_169:
        sub_100001B14((uint64_t)v95, v44, v45, v46, v47, v48, v49, v50, v112);
LABEL_170:
        xpc_release(v19);
        goto LABEL_177;
      }

      if ((sub_100007EAC((uint64_t)v125, v162, v129, v127, v128, v163, v19, off_1000101D8[0]) & 1) == 0)
      {
        xpc_object_t v95 = "get destination address/port failed";
        goto LABEL_169;
      }
    }

    unsigned __int8 v51 = value_4;
    if (value_4 <= 0xDu && ((1 << value_4) & 0x2110) != 0)
    {
      bzero(v176, 0x470uLL);
      memcpy(&v177[3], CStringPtr, 0x400uLL);
      v177[0] = v51;
      *(_DWORD *)&v176[12] = v9;
      *(_DWORD *)&v176[4] = v10;
      if (ioctl(dword_100010390, 0xC4704435uLL))
      {
        sub_100001B14((uint64_t)"DIOCGETADDRS %m", v52, v53, v54, v55, v56, v57, v58, (uint64_t)v176);
LABEL_137:
        xpc_object_t v66 = "get pool for nat/rdr failed";
LABEL_138:
        sub_100001B14((uint64_t)v66, v59, v60, v61, v62, v63, v64, v65, v112);
        char v67 = 0;
LABEL_139:
        xpc_object_t v68 = v133;
        if (v133)
        {
          do
          {
            xpc_object_t v69 = (void *)v68[6];
            free(v68);
            xpc_object_t v68 = v69;
          }

          while (v69);
        }

        a2 = v113;
        if ((v67 & 1) == 0) {
          goto LABEL_170;
        }
      }

      else
      {
        __int16 v133 = 0LL;
        __int16 v134 = &v133;
        int v70 = *(_DWORD *)&v176[8];
        if (*(_DWORD *)&v176[8])
        {
          int v71 = 0;
          while (1)
          {
            *(_DWORD *)&v176[8] = v71;
            if (ioctl(dword_100010390, 0xC4704436uLL, v176)) {
              break;
            }
            xpc_object_t v79 = (char *)calloc(1uLL, 0x58uLL);
            if (!v79)
            {
              xpc_object_t v83 = "calloc failed %m";
LABEL_158:
              sub_100001B14((uint64_t)v83, v72, v73, v74, v75, v76, v77, v78, v112);
              xpc_object_t v84 = v133;
              if (v133)
              {
                do
                {
                  xpc_object_t v85 = (void *)v84[6];
                  free(v84);
                  xpc_object_t v84 = v85;
                }

                while (v85);
              }

              goto LABEL_137;
            }

            xpc_object_t v80 = v79;
            memmove(v79, &v178, 0x58uLL);
            *((void *)v80 + 6) = 0LL;
            xpc_object_t v81 = v134;
            *((void *)v80 + 7) = v134;
            *xpc_object_t v81 = v80;
            __int16 v134 = (void **)(v80 + 48);
            if (v70 == ++v71)
            {
              a2 = v113;
              if (!v133) {
                goto LABEL_142;
              }
              char v82 = sub_100007EAC((uint64_t)v133, v162, v137, v135, v136, v163, v19, off_1000101E0[0]);
              xpc_object_t v66 = "get nat/rdr failed";
              if ((v82 & 1) != 0)
              {
                char v67 = 1;
                goto LABEL_139;
              }

              goto LABEL_138;
            }
          }

          xpc_object_t v83 = "DIOCGETADDR %m";
          goto LABEL_158;
        }
      }
    }

LABEL_142:
    xpc_array_append_value(v4, v19);
    xpc_release(v19);
    *a2 = 1;
    if (++v9 == v115) {
      goto LABEL_161;
    }
  }

  xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v21)
  {
    uint64_t v22 = v21;
    if ((value & 8) != 0)
    {
      uint64_t v25 = off_100010328[0];
      uint64_t v23 = 8LL;
    }

    else
    {
      if ((value & 1) != 0)
      {
        xpc_dictionary_set_uint64(v21, off_100010328[0], 1uLL);
        uint64_t v23 = v170;
        if (!v170)
        {
LABEL_41:
          xpc_dictionary_set_value(v19, off_100010190[0], v22);
          xpc_release(v22);
          goto LABEL_42;
        }

        uint64_t v24 = off_100010330;
      }

      else
      {
        if ((value & 4) == 0) {
          goto LABEL_41;
        }
        xpc_dictionary_set_uint64(v21, off_100010328[0], 4uLL);
        if (v145) {
          xpc_dictionary_set_uint64(v22, off_100010338[0], v145);
        }
        uint64_t v23 = v146;
        if (!v146) {
          goto LABEL_41;
        }
        uint64_t v24 = off_100010340;
      }

      uint64_t v25 = *v24;
      xpc_object_t v21 = v22;
    }

    xpc_dictionary_set_uint64(v21, v25, v23);
    goto LABEL_41;
  }

  xpc_release(v19);
LABEL_175:
  xpc_object_t v93 = "xpc_dictionary_create failed %m";
LABEL_176:
  sub_100001B14((uint64_t)v93, v12, v13, v14, v15, v16, v17, v18, v112);
LABEL_177:
  *a2 = 0;
  sub_100001B14((uint64_t)"creating xpc from pf rule failed", v96, v97, v98, v99, v100, v101, v102, v112);
  xpc_release(v4);
  return 0LL;
}

BOOL sub_100006E1C(const char *a1, const char *a2)
{
  int v2 = -1;
  if (a1)
  {
    if (a2)
    {
      uint64_t v28 = 0LL;
      memset(v27, 0, sizeof(v27));
      snprintf((char *)&v27[9] + 8, 0x40uLL, "%s%s", a1, a2);
      sub_100001B14((uint64_t)"clearing states for %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)&v27[9] + 8);
      if (!ioctl(dword_100010390, 0xC0D84412uLL, v27)
        || (int v2 = *__error(),
            uint64_t v18 = sub_100001CC0(3235398674LL),
            sub_100001B14((uint64_t)"%s: %m", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v18),
            !v2))
      {
        sub_100001B8C((uint64_t)"pf states cleared for %s(%s)", v11, v12, v13, v14, v15, v16, v17, (uint64_t)a1);
        int v2 = 0;
      }
    }
  }

  return v2 == 0;
}

uint64_t sub_100006F40(void *a1, void *a2)
{
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  int v73 = 0;
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100010198[0]);
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
  {
    HIBYTE(v73) = xpc_dictionary_get_uint64(a1, off_100010198[0]);
    xpc_dictionary_set_uint64(a2, off_100010198[0], HIBYTE(v73));
  }

  xpc_object_t v5 = xpc_dictionary_get_value(a1, off_1000101A8[0]);
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_uint64)
  {
    LOBYTE(v73) = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
    xpc_dictionary_set_uint64(a2, off_1000101A8[0], v73);
  }

  xpc_object_t v6 = xpc_dictionary_get_value(a1, off_1000101B0[0]);
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_uint64)
  {
    BYTE1(v73) = xpc_dictionary_get_uint64(a1, off_1000101B0[0]);
    xpc_dictionary_set_uint64(a2, off_1000101B0[0], BYTE1(v73));
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v7)
  {
    uint64_t v15 = v7;
    if (sub_1000073EC(&v68, a1, off_1000101C0[0], v7))
    {
LABEL_12:
      uint64_t v16 = 0LL;
LABEL_37:
      xpc_release(v15);
      return v16;
    }

    snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
    xpc_object_t v17 = xpc_dictionary_get_value(a1, __str);
    if (v17 && xpc_get_type(v17) == (xpc_type_t)&_xpc_type_uint64)
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(a1, __str);
      LOWORD(v72) = bswap32(uint64) >> 16;
      xpc_dictionary_set_uint64(v15, off_1000102B0[0], (unsigned __int16)uint64);
    }

    xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!v19)
    {
      sub_100001B14((uint64_t)"xpc_dictionary_create failed", v20, v21, v22, v23, v24, v25, v26, v66);
      goto LABEL_12;
    }

    uint64_t v27 = v19;
    if (!sub_1000073EC(&v69, a1, off_1000101D8[0], v19))
    {
      snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
      xpc_object_t v28 = xpc_dictionary_get_value(a1, __str);
      if (v28 && xpc_get_type(v28) == (xpc_type_t)&_xpc_type_uint64)
      {
        unsigned int v29 = xpc_dictionary_get_uint64(a1, __str);
        WORD2(v72) = bswap32(v29) >> 16;
        xpc_dictionary_set_uint64(v27, off_1000102B0[0], (unsigned __int16)v29);
      }

      if (ioctl(dword_100010390, 0xC0544417uLL, &v68) == -1)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_100010298[0]);
        snprintf(key, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        string = xpc_dictionary_get_string(a1, __str);
        xpc_dictionary_get_uint64(a1, key);
        sub_100001B14((uint64_t)"pf nat lookup failed %s:%hu (%m)", v56, v57, v58, v59, v60, v61, v62, (uint64_t)string);
      }

      else
      {
        xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
        if (v30)
        {
          xpc_object_t v38 = v30;
          if ((sub_100007528(&v70, v73, v30) & 1) != 0)
          {
            if (WORD4(v72)) {
              xpc_dictionary_set_uint64(v38, off_1000102B0[0], __rev16(WORD4(v72)));
            }
            xpc_object_t v46 = xpc_dictionary_create(0LL, 0LL, 0LL);
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v16 = sub_100007528(&v71, v73, v46);
              if ((v16 & 1) != 0)
              {
                if (WORD6(v72)) {
                  xpc_dictionary_set_uint64(v47, off_1000102B0[0], __rev16(WORD6(v72)));
                }
                xpc_dictionary_set_value(a2, off_1000101C0[0], v15);
                xpc_dictionary_set_value(a2, off_1000101D8[0], v27);
                xpc_dictionary_set_value(a2, off_1000101C8[0], v38);
                xpc_dictionary_set_value(a2, off_1000101D0[0], v47);
              }

              else
              {
                sub_100001B14( (uint64_t)"natlook getting internal destination address failed",  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v67);
              }

              xpc_release(v47);
              goto LABEL_44;
            }

            uint64_t v64 = "xpc_dictionary_create failed";
          }

          else
          {
            uint64_t v64 = "natlook getting internal source address failed";
          }

          sub_100001B14((uint64_t)v64, v39, v40, v41, v42, v43, v44, v45, v67);
          uint64_t v16 = 0LL;
LABEL_44:
          xpc_release(v38);
          goto LABEL_36;
        }

        sub_100001B14((uint64_t)"xpc_dictionary_create failed", v31, v32, v33, v34, v35, v36, v37, v67);
      }
    }

    uint64_t v16 = 0LL;
LABEL_36:
    xpc_release(v27);
    goto LABEL_37;
  }

  sub_100001B14((uint64_t)"xpc_dictionary_create failed", v8, v9, v10, v11, v12, v13, v14, v65);
  return 0LL;
}

uint64_t sub_1000073EC(_DWORD *a1, void *a2, const char *a3, void *a4)
{
  string = xpc_dictionary_get_string(a2, __str);
  if (!string) {
    return 22LL;
  }
  uint64_t v8 = string;
  int v13 = 0;
  xpc_dictionary_set_string(a4, off_100010298[0], string);
  if (inet_pton(2, v8, &v13) == 1)
  {
    uint64_t result = 0LL;
    *a1 = v13;
    return result;
  }

  memset(&v12.ai_socktype, 0, 40);
  v12.ai_sockxpc_type_t type = 2;
  *(void *)&v12.ai_flags = 0x1E00000004LL;
  if (getaddrinfo(v8, "0", &v12, &v11)) {
    return 22LL;
  }
  uint64_t v10 = v11;
  *(_OWORD *)a1 = *(_OWORD *)&v11->ai_addr->sa_data[6];
  freeaddrinfo(v10);
  return 0LL;
}

uint64_t sub_100007528(_DWORD *a1, int a2, void *a3)
{
  if (!*a1 && !a1[1] && !a1[2] && !a1[3]) {
    return 1LL;
  }
  memset(v12, 0, 46);
  if (inet_ntop(a2, a1, (char *)v12, 0x2Eu))
  {
    xpc_dictionary_set_string(a3, off_100010298[0], (const char *)v12);
    return 1LL;
  }

  sub_100001B14((uint64_t)"inet_ntop failed %m", v4, v5, v6, v7, v8, v9, v10, *(uint64_t *)&v12[0]);
  return 0LL;
}

uint64_t sub_1000075F0(int8x16_t *a1, void *a2, const char *a3)
{
  if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010290[0]) < 1 || (uint64_t v6 = xpc_dictionary_get_string(a2, __str)) == 0LL)
  {
    if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010298[0]) >= 1
      && (uint64_t v7 = xpc_dictionary_get_string(a2, __str)) != 0LL)
    {
      uint64_t v8 = v7;
      uint64_t v9 = strrchr(v7, 47);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = v9 + 1;
        uint64_t v12 = strtol(v9 + 1, &__endptr, 0);
        if (!__endptr || __endptr == v11 || *__endptr || (unsigned __int8 v20 = v12, v12 >= 129))
        {
          sub_100001B14((uint64_t)"invalid netmask '%s'\n", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v10);
          return 22LL;
        }

        size_t v21 = strlen(v8);
        size_t v22 = v21 - strlen(v10) + 1;
        uint64_t v23 = (char *)malloc(v22);
        if (v23)
        {
          uint64_t v31 = v23;
          strlcpy(v23, v8, v22);
          goto LABEL_32;
        }

        uint64_t v51 = "address: malloc";
      }

      else
      {
        xpc_object_t v46 = strdup(v8);
        if (v46)
        {
          uint64_t v31 = v46;
          unsigned __int8 v20 = 0x80;
LABEL_32:
          v98.ai_flags = 0;
          if (strrchr(v8, 47))
          {
            int v47 = inet_net_pton(2, v8, &v98, 4uLL);
            if (v47 == -1)
            {
              uint64_t v50 = "inet_net_pton failed for %s with %s";
LABEL_53:
              uint64_t v60 = __error();
              strerror(*v60);
              sub_100001B8C((uint64_t)v50, v61, v62, v63, v64, v65, v66, v67, (uint64_t)v8);
              memset(&v98.ai_socktype, 0, 40);
              v98.ai_sockxpc_type_t type = 2;
              *(void *)&v98.ai_flags = 0x1E00000004LL;
              int v68 = getaddrinfo(v31, "0", &v98, &v97);
              if (v68)
              {
                gai_strerror(v68);
                sub_100001B8C( (uint64_t)"getaddrinfo failed for %s with %s",  v70,  v71,  v72,  v73,  v74,  v75,  v76,  (uint64_t)v31);
                free(v31);
                sub_100001B14((uint64_t)"no IP address found for %s", v77, v78, v79, v80, v81, v82, v83, (uint64_t)v8);
                return 22LL;
              }

              xpc_object_t v84 = v97;
              int64x2_t v85 = *(int64x2_t *)&v97->ai_addr->sa_data[6];
              *a1 = (int8x16_t)v85;
              sub_100007B04(a1, v20, v85, v69);
              freeaddrinfo(v84);
LABEL_56:
              free(v31);
              return 0LL;
            }
          }

          else
          {
            if (inet_pton(2, v8, &v98) != 1)
            {
              uint64_t v50 = "inet_pton failed for %s with %s";
              goto LABEL_53;
            }

            LOBYTE(v47) = 32;
          }

          a1->i32[0] = v98.ai_flags;
          a1[2].i8[8] = 0;
          sub_100007B04(a1, v47, v48, v49);
          goto LABEL_56;
        }

        uint64_t v51 = "address: strdup";
      }
    }

    else
    {
      string = xpc_dictionary_get_string(a2, __str);
      if (!string) {
        return 0LL;
      }
      uint64_t v33 = strdup(string);
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = strrchr(v33, 58);
        if (v35)
        {
          uint64_t v43 = v35;
          __int8 v44 = 0;
          do
          {
            if (!strcmp(v43 + 1, "network"))
            {
              char v45 = 1;
            }

            else if (!strcmp(v43 + 1, "broadcast"))
            {
              char v45 = 2;
            }

            else if (!strcmp(v43 + 1, "peer"))
            {
              char v45 = 4;
            }

            else
            {
              if (strcmp(v43 + 1, "0")) {
                goto LABEL_62;
              }
              char v45 = 8;
            }

            v44 |= v45;
            *uint64_t v43 = 0;
            uint64_t v43 = strrchr(v34, 58);
          }

          while (v43);
        }

        else
        {
          __int8 v44 = 0;
        }

        if ((v44 & (v44 - 1) & 6) != 0)
        {
          uint64_t v52 = "illegal combination of interface modifiers\n";
        }

        else
        {
          *(void *)&v98.ai_flags = 0LL;
          if ((getifaddrs((ifaddrs **)&v98) & 0x80000000) == 0)
          {
            uint64_t v53 = &v98;
            do
            {
              uint64_t v53 = *(addrinfo **)&v53->ai_flags;
              if (!v53)
              {
                freeifaddrs(*(ifaddrs **)&v98.ai_flags);
                goto LABEL_60;
              }
            }

            while (strncmp(*(const char **)&v53->ai_socktype, v34, 0x10uLL));
            freeifaddrs(*(ifaddrs **)&v98.ai_flags);
            a1[2].i8[8] = 2;
            a1[2].i8[9] = v44;
            snprintf(a1->i8, 0x10uLL, "%s", v34);
            uint64_t uint64 = xpc_dictionary_get_uint64(a2, off_1000101A8[0]);
            if (uint64 == 30)
            {
              uint64_t v57 = a1;
              unsigned int v58 = 128;
            }

            else
            {
              uint64_t v57 = a1;
              unsigned int v58 = 32;
            }

            sub_100007B04(v57, v58, v55, v56);
            return 0LL;
          }

          uint64_t v86 = __error();
          uint64_t v87 = strerror(*v86);
          sub_100001B14((uint64_t)"getifaddrs failed %s", v88, v89, v90, v91, v92, v93, v94, (uint64_t)v87);
LABEL_60:
          uint64_t v95 = (uint64_t)v34;
          uint64_t v52 = "invalid interface name %s";
        }

        sub_100001B14((uint64_t)v52, v36, v37, v38, v39, v40, v41, v42, v95);
LABEL_62:
        free(v34);
        return 22LL;
      }

      uint64_t v51 = "dynamic address: strdup";
    }

    sub_100001B14((uint64_t)v51, v24, v25, v26, v27, v28, v29, v30, v95);
    return 12LL;
  }

  if (!strncmp(v6, off_100010388, 0x40uLL)) {
    return 0LL;
  }
  return 22LL;
}

int64x2_t sub_100007B04(int8x16_t *a1, unsigned int a2, int64x2_t result, int8x16_t a4)
{
  unsigned __int8 v4 = a2;
  a1[1].i64[0] = 0LL;
  a1[1].i64[1] = 0LL;
  uint64_t v6 = a1 + 1;
  unsigned __int8 v7 = a2 - 32;
  if (a2 < 0x20)
  {
    unint64_t v10 = 0LL;
  }

  else
  {
    unint64_t v8 = v7 >> 5;
    memset(&a1[1], 255, 4 * v8 + 4);
    uint64_t result = vdupq_n_s64(v8);
    a4.i8[4] = 0;
    a4.i8[5] = 0;
    a4.i8[6] = 0;
    a4.i8[7] = 0;
    a4.i8[8] = 0;
    a4.i8[9] = 0;
    a4.i8[10] = 0;
    a4.i8[11] = 0;
    a4.i8[12] = 0;
    a4.i8[13] = 0;
    a4.i8[14] = 0;
    a4.i8[15] = 0;
    v9.i8[1] = -32;
    v9.i16[1] = -7968;
    v9.i32[1] = -522133280;
    v9.i8[0] = v7;
    *(int8x8_t *)result.i8 = vbsl_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008990, (uint64x2_t)result),  (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008980, (uint64x2_t)result)),  (int16x8_t)vuzp1q_s32( (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008970, (uint64x2_t)result),  (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008960, (uint64x2_t)result)))),  (int8x8_t)v4,  v9);
    result.i8[0] = vaddv_s8(*(int8x8_t *)result.i8);
    unsigned __int8 v4 = result.i8[0];
    unint64_t v10 = v8 + 1;
  }

  if (v4)
  {
    int v11 = 0;
    unsigned int v12 = v4 ^ 0x1F;
    if (v12 >= 0x1E) {
      unsigned int v12 = 30;
    }
    int v13 = v12 ^ 0x1F;
    uint32x4_t v14 = (uint32x4_t)vdupq_n_s32(v13 - 1);
    int v15 = ((_BYTE)v13 + 3) & 0x3C;
    a4.i32[0] = v6->i32[v10];
    int32x4_t v16 = (int32x4_t)xmmword_1000089A0;
    v17.i64[0] = 0x100000001LL;
    v17.i64[1] = 0x100000001LL;
    v18.i64[0] = 0x300000003LL;
    v18.i64[1] = 0x300000003LL;
    do
    {
      int8x16_t v19 = a4;
      a4 = vorrq_s8(a4, (int8x16_t)vshlq_u32(v17, (uint32x4_t)v16));
      v11 += 4;
      int32x4_t v16 = vaddq_s32(v16, v18);
    }

    while (v15 != v11);
    uint64_t result = (int64x2_t)vbslq_s8( (int8x16_t)vcgtq_u32( (uint32x4_t)vorrq_s8( (int8x16_t)vdupq_n_s32(v11 - 4),  (int8x16_t)xmmword_1000089B0),  v14),  v19,  a4);
    *(int8x8_t *)result.i8 = vorr_s8( *(int8x8_t *)result.i8,  (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)result, (int8x16_t)result, 8uLL));
    v6->i32[v10] = bswap32(result.i32[0] | result.i32[1]);
  }

  if (!a1[2].i8[8])
  {
    uint64_t result = (int64x2_t)vandq_s8(a1[1], *a1);
    *a1 = (int8x16_t)result;
  }

  return result;
}

BOOL sub_100007C7C(unsigned int a1, unsigned int a2, int a3, const char *a4, void *a5)
{
  LODWORD(v7) = a3;
  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v17)
  {
    int32x4_t v18 = off_1000101F8[0];
    size_t v19 = strnlen(off_1000101F8[0], 0x40uLL);
    int v20 = strncmp(a4, v18, v19);
    if (a2 == 0x7FFFFFFF && (a1 & 0xFE) == 2)
    {
      uint64_t v7 = a1;
      if (v20)
      {
        xpc_dictionary_set_string(v17, off_1000102E8[0], "unknown");
        size_t v21 = off_100010300;
LABEL_10:
        xpc_dictionary_set_uint64(v17, *v21, v7);
        size_t v22 = off_100010200;
LABEL_16:
        xpc_dictionary_set_value(a5, *v22, v17);
        xpc_release(v17);
        return v17 != 0LL;
      }

      xpc_dictionary_set_string(v17, off_1000102C8[0], "unknown");
      uint64_t v23 = off_1000102E0[0];
      uint64_t v24 = v17;
      uint64_t v25 = a1;
    }

    else
    {
      if (v20)
      {
        xpc_dictionary_set_uint64(v17, off_1000102F0[0], a2);
        size_t v21 = off_1000102F8;
        uint64_t v7 = v7;
        xpc_dictionary_set_uint64(v17, off_1000102F8[0], v7);
        xpc_dictionary_set_uint64(v17, off_100010300[0], a1);
        size_t v22 = off_100010200;
        if (a1 > 9 || ((1 << a1) & 0x302) == 0) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }

      xpc_dictionary_set_uint64(v17, off_1000102D0[0], a2);
      xpc_dictionary_set_uint64(v17, off_1000102E0[0], a1);
      size_t v22 = off_1000101F8;
      if (a1 > 9 || ((1 << a1) & 0x302) == 0) {
        goto LABEL_16;
      }
      uint64_t v23 = off_1000102D8[0];
      uint64_t v25 = v7;
      uint64_t v24 = v17;
    }

    xpc_dictionary_set_uint64(v24, v23, v25);
    size_t v22 = off_1000101F8;
    goto LABEL_16;
  }

  sub_100001B14((uint64_t)"unable to create subrule dictionary for ugid %m", v10, v11, v12, v13, v14, v15, v16, v27);
  return v17 != 0LL;
}

uint64_t sub_100007EAC(uint64_t a1, int a2, unsigned int a3, int a4, int a5, int a6, void *a7, char *a8)
{
  LODWORD(v11) = a5;
  LODWORD(v12) = a4;
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v16)
  {
    uint64_t v24 = v16;
    if (*(_BYTE *)(a1 + 40))
    {
      if (*(_BYTE *)(a1 + 40) == 2)
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        *(_OWORD *)__str = 0u;
        __int128 v49 = 0u;
        char v25 = *(_BYTE *)(a1 + 41);
        if ((v25 & 1) != 0)
        {
          snprintf(__str, 0x40uLL, "%s:network", (const char *)a1);
          char v25 = *(_BYTE *)(a1 + 41);
          if ((v25 & 2) == 0)
          {
LABEL_6:
            if ((v25 & 4) == 0) {
              goto LABEL_7;
            }
            goto LABEL_31;
          }
        }

        else if ((*(_BYTE *)(a1 + 41) & 2) == 0)
        {
          goto LABEL_6;
        }

        snprintf(__str, 0x40uLL, "%s:broadcast", (const char *)a1);
        char v25 = *(_BYTE *)(a1 + 41);
        if ((v25 & 4) == 0)
        {
LABEL_7:
          if ((v25 & 8) == 0)
          {
LABEL_9:
            uint64_t v26 = off_1000102A0[0];
            uint64_t v27 = __str;
            goto LABEL_46;
          }

LABEL_8:
          snprintf(__str, 0x40uLL, "%s:0", (const char *)a1);
          goto LABEL_9;
        }

LABEL_31:
        snprintf(__str, 0x40uLL, "%s:peer", (const char *)a1);
        if ((*(_BYTE *)(a1 + 41) & 8) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      uint64_t v32 = "not supported address type";
LABEL_34:
      sub_100001B14((uint64_t)v32, v17, v18, v19, v20, v21, v22, v23, v46);
      uint64_t v28 = 0LL;
LABEL_64:
      xpc_release(v24);
      return v28;
    }

    if (*(_DWORD *)a1
      || *(_DWORD *)(a1 + 4)
      || *(_DWORD *)(a1 + 8)
      || *(_DWORD *)(a1 + 12)
      || *(_DWORD *)(a1 + 16)
      || *(_DWORD *)(a1 + 20)
      || *(_DWORD *)(a1 + 24)
      || *(_DWORD *)(a1 + 28))
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      *(_OWORD *)__str = 0u;
      __int128 v49 = 0u;
      if (!inet_ntop(a2, (const void *)a1, __str, 0x40u))
      {
        uint64_t v32 = "inet_ntop failed %m";
        goto LABEL_34;
      }

      if (!*(_DWORD *)(a1 + 16) && !*(_DWORD *)(a1 + 20) && !*(_DWORD *)(a1 + 24) && !*(_DWORD *)(a1 + 28)) {
        goto LABEL_44;
      }
      uint64_t v29 = 0LL;
      int v30 = 0;
      while (1)
      {
        unsigned int v31 = *(_DWORD *)(a1 + 16 + v29);
        if (v31 != -1) {
          break;
        }
        v30 += 32;
        v29 += 4LL;
        if (v29 == 16)
        {
          int v30 = 128;
          goto LABEL_39;
        }
      }

      unsigned int v33 = bswap32(v31);
      if ((v33 & 0x80000000) != 0)
      {
        int v34 = 0;
        do
          char v35 = v34-- + 30;
        while (((v33 >> v35) & 1) != 0);
        v30 -= v34;
      }

LABEL_39:
      int v36 = a2 == 2 ? 32 : 128;
      if (v30 == v36) {
        snprintf(string, 0x40uLL, "%s");
      }
      else {
LABEL_44:
      }
        snprintf(string, 0x40uLL, "%s/%d");
      uint64_t v26 = off_100010298[0];
      uint64_t v27 = string;
    }

    else
    {
      uint64_t v26 = off_100010290[0];
      uint64_t v27 = off_100010388;
    }

LABEL_46:
    xpc_dictionary_set_string(v24, v26, v27);
    if (a6 == 6) {
      uint64_t v37 = "tcp";
    }
    else {
      uint64_t v37 = "udp";
    }
    uint64_t v38 = getservbyport(v12, v37);
    unsigned int v39 = __rev16(v12);
    unsigned int v40 = __rev16(v11);
    if (off_1000101E0[0] == a8) {
      uint64_t v11 = v11;
    }
    else {
      uint64_t v11 = v40;
    }
    if (off_1000101E0[0] == a8) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v39;
    }
    if (v38 && ((p_s_name = (const char **)&v38->s_name, a3 - 2 < 6) || !a3))
    {
      xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
      xpc_dictionary_set_string(v24, off_1000102B0[0], *p_s_name);
    }

    else if ((_DWORD)v12)
    {
      if (a3 - 2 >= 6 && a3)
      {
        if (!(_DWORD)v11 || (_DWORD)v12 == (_DWORD)v11 || a3 > 9 || ((1 << a3) & 0x302) == 0) {
          goto LABEL_63;
        }
        xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
        xpc_dictionary_set_uint64(v24, off_1000102B0[0], v12);
        uint64_t v42 = off_1000102B8[0];
        uint64_t v43 = v24;
        uint64_t v44 = v11;
      }

      else
      {
        xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
        uint64_t v42 = off_1000102B0[0];
        uint64_t v43 = v24;
        uint64_t v44 = v12;
      }

      xpc_dictionary_set_uint64(v43, v42, v44);
    }

LABEL_63:
    xpc_dictionary_set_value(a7, a8, v24);
    uint64_t v28 = 1LL;
    goto LABEL_64;
  }

  sub_100001B14((uint64_t)"subrule xpc_dictionary_create failed %m", v17, v18, v19, v20, v21, v22, v23, v46);
  return 0LL;
}

void sub_1000082F4()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create os log object",  v0,  2u);
}

void sub_100008338()
{
  __assert_rtn("PFDClientNewConnection", "PFDClient.c", 1401, "__pfdnclients != 0");
}

void sub_100008360()
{
  __assert_rtn("__PFDClientRemoveConnection", "PFDClient.c", 1319, "__pfdnclients != 0");
}