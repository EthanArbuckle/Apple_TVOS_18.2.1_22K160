uint64_t sub_100002E10()
{
  uint64_t result;
  if (&_lockdown_checkin_xpc)
  {
    lockdown_checkin_xpc("com.apple.syslog_relay", 0LL, 0LL, &stru_10000C7F0);
    return lockdown_checkin_xpc("com.apple.os_trace_relay", 0LL, 0LL, &stru_10000C830);
  }

  return result;
}

void sub_100002E64(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v5 = calloc(1uLL, 0x30uLL);
  void *v5 = a2;
  v5[1] = sub_10000406C(a3);
  v5[4] = sub_100004140;
  v5[5] = sub_10000492C;
  v6 = objc_autoreleasePoolPush();
  *(void *)&__int128 cf = 0LL;
  unsigned int v11 = lockdown_receive_message(*v5, &cf);
  TypeID = (const void *)cf;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = (void)cf == 0LL;
  }
  if (v13)
  {
    if (v11 < 2) {
      goto LABEL_13;
    }
    sub_10000495C( cf,  (uint64_t)"secure_receive_message",  127LL,  @"lockdown_receive_message returned error %x",  v7,  v8,  v9,  v10,  v11);
LABEL_12:
    TypeID = (const void *)cf;
LABEL_13:
    if (TypeID) {
      CFRelease(TypeID);
    }
    goto LABEL_15;
  }

  CFTypeID v14 = CFGetTypeID((CFTypeRef)cf);
  TypeID = (const void *)CFDictionaryGetTypeID();
  id v15 = (id)cf;
  if (!(void)cf)
  {
LABEL_15:
    sub_10000495C( (uint64_t)TypeID,  (uint64_t)"handle_os_trace_connection",  982LL,  @"Failed to receive initial message from client %s",  v7,  v8,  v9,  v10,  v5[1]);
    sub_100004A7C((uint64_t)v5, (uint64_t)@"NoInitialMessage");
    id v15 = 0LL;
    id v20 = 0LL;
    goto LABEL_16;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([(id)cf objectForKeyedSubscript:@"Request"]);
  v17 = &CFArrayCreate_ptr;
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
  id v19 = v16;
  if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0LL;
  }

  if (v20)
  {
    if ([v20 isEqualToString:@"StartActivity"])
    {
      id v26 = v15;
      v27 = objc_opt_new(&OBJC_CLASS___StreamContext);
      id v15 = v26;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"MessageFilter"]);
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v31 = v29;
      if ((objc_opt_isKindOfClass(v31, v30) & 1) != 0) {
        id v32 = v31;
      }
      else {
        id v32 = 0LL;
      }

      int v51 = [v32 unsignedShortValue];
      v52 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"StreamFlags"]);

      uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v54 = v52;
      if ((objc_opt_isKindOfClass(v54, v53) & 1) != 0) {
        id v55 = v54;
      }
      else {
        id v55 = 0LL;
      }

      id v64 = [v55 unsignedIntValue];
      -[StreamContext setStreamFlags:](v28, "setStreamFlags:", v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"Pid"]);
      uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v67 = v65;
      if ((objc_opt_isKindOfClass(v67, v66) & 1) != 0) {
        id v68 = v67;
      }
      else {
        id v68 = 0LL;
      }

      if (v68)
      {
        id v74 = [v68 intValue];
        uint64_t socket = lockdown_get_socket(*v5);
        if ((socket & 0x80000000) == 0)
        {
          sub_100005144((uint64_t)v5);
          sub_100007028((uint64_t)v74, v64 & 0x3F, v51, (uint64_t)v5);

          objc_autoreleasePoolPop(v6);
          goto LABEL_17;
        }

        sub_10000495C( socket,  (uint64_t)"set_up_activity",  700LL,  @"Failed to get socket for connection from client %s",  v76,  v77,  v78,  v79,  v5[1]);
        v80 = @"NoSocket";
      }

      else
      {
        sub_10000495C( v69,  (uint64_t)"set_up_activity",  688LL,  @"Missing pid in initial message from client %s: %@",  v70,  v71,  v72,  v73,  v5[1]);
        v80 = @"MalformedSetupMessage";
      }

      sub_100004A7C((uint64_t)v5, (uint64_t)v80);

      goto LABEL_96;
    }

    if ([v20 isEqualToString:@"PidList"])
    {
      *(void *)&__int128 cf = 0x600000001LL;
      LODWORD(v137) = 0;
      v135[0] = 4LL;
      v33 = &CFArrayCreate_ptr;
      if (sysctl((int *)&cf, 2u, &v137, v135, 0LL, 0LL) < 0)
      {
        v81 = __error();
        v82 = strerror(*v81);
        sub_10000495C( (uint64_t)v82,  (uint64_t)"get_max_proc",  281LL,  @"Failed to get max proc count (%s)",  v83,  v84,  v85,  v86,  (char)v82);
        v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }

      else
      {
        uint64_t v34 = v137;
        v35 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v36 = v35;
        if ((int)v34 >= 1)
        {
          v133 = v35;
          v132 = calloc(1uLL, 4 * v34);
          int v37 = proc_listallpids(v132, 4 * v34);
          pid_t v38 = getpid();
          if (v37 >= 1)
          {
            pid_t v39 = v38;
            uint64_t v40 = v37;
            v41 = (int *)v132;
            do
            {
              bzero(&cf, 0x400uLL);
              int v43 = *v41++;
              int v42 = v43;
              if (v43) {
                BOOL v44 = v42 == v39;
              }
              else {
                BOOL v44 = 1;
              }
              if (!v44)
              {
                proc_name(v42, &cf, 0x400u);
                if (((void)cf != 0x756563617274736FLL || *(void *)((char *)&cf + 3) != 0x6C69747565636172LL)
                  && ((void)cf != 0x74736F6E67616964LL || *(void *)((char *)&cf + 3) != 0x64636974736F6E67LL)
                  && ((void)cf != 0x725F676F6C737973LL || DWORD2(cf) != 2036427877))
                {
                  char v129 = v42;
                  v48 = (void *)objc_claimAutoreleasedReturnValue([v17[19] stringWithFormat:@"%d"]);
                  v49 = (void *)objc_claimAutoreleasedReturnValue([v17[19] stringWithUTF8String:&cf]);
                  v136 = @"ProcessName";
                  v137 = v49;
                  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v137,  &v136,  1LL));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v133, "setObject:forKeyedSubscript:", v50, v48);

                  v17 = &CFArrayCreate_ptr;
                }
              }

              --v40;
            }

            while (v40);
          }

          free(v132);
          v33 = &CFArrayCreate_ptr;
          v36 = v133;
        }
      }

      v135[0] = (size_t)@"Status";
      v135[1] = (size_t)@"Payload";
      *(void *)&__int128 cf = @"RequestSuccessful";
      *((void *)&cf + 1) = v36;
      v87 = (void *)objc_claimAutoreleasedReturnValue([v33[14] dictionaryWithObjects:&cf forKeys:v135 count:2]);
      uint64_t v88 = sub_100004B38(v5, v87);
      if ((v88 & 1) == 0) {
        sub_10000495C(v88, (uint64_t)"send_pid_list", 326LL, @"Failed to send PID list", v89, v90, v91, v92, v129);
      }

      goto LABEL_16;
    }

    id v56 = [v20 isEqualToString:@"CreateArchive"];
    if ((_DWORD)v56)
    {
      id v15 = v15;
      v61 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"SizeLimit"]);
      uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v63 = v61;
      if ((objc_opt_isKindOfClass(v63, v62) & 1) != 0) {
        v28 = (StreamContext *)v63;
      }
      else {
        v28 = 0LL;
      }

      v93 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"AgeLimit"]);
      uint64_t v94 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v95 = v93;
      if ((objc_opt_isKindOfClass(v95, v94) & 1) != 0) {
        id v96 = v95;
      }
      else {
        id v96 = 0LL;
      }

      v97 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"StartTime"]);
      uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v99 = v97;
      if ((objc_opt_isKindOfClass(v99, v98) & 1) != 0) {
        id v100 = v99;
      }
      else {
        id v100 = 0LL;
      }

      sub_100004C10( 5,  "CreateArchive request: max_size %llu, max_age %ld, start %ld",  -[StreamContext unsignedLongLongValue](v28, "unsignedLongLongValue"),  [v96 longValue],  objc_msgSend(v100, "longValue"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if (-[StreamContext unsignedLongLongValue](v28, "unsignedLongLongValue"))
      {
        [v101 setObject:v28 forKeyedSubscript:OSLogConstructPersistSizeLimit];
        [v101 setObject:v28 forKeyedSubscript:OSLogConstructSpecialSizeLimit];
        [v101 setObject:v28 forKeyedSubscript:OSLogConstructSignpostSizeLimit];
        [v101 setObject:v28 forKeyedSubscript:OSLogConstructHighVolumeSizeLimit];
      }

      v134 = v100;
      if ([v96 longValue])
      {
        [v101 setObject:v96 forKeyedSubscript:OSLogConstructPersistAgeLimit];
        [v101 setObject:v96 forKeyedSubscript:OSLogConstructSpecialAgeLimit];
        [v101 setObject:v96 forKeyedSubscript:OSLogConstructSignpostAgeLimit];
        uint64_t v102 = OSLogConstructHighVolumeAgeLimit;
        v103 = v101;
        v104 = (_UNKNOWN **)v96;
      }

      else if ([v100 longValue])
      {
        [v101 setObject:v100 forKeyedSubscript:_OSLogConstructPersistStart];
        [v101 setObject:v100 forKeyedSubscript:_OSLogConstructSpecialStart];
        [v101 setObject:v100 forKeyedSubscript:_OSLogConstructSignpostStart];
        uint64_t v102 = _OSLogConstructHighVolumeStart;
        v103 = v101;
        v104 = (_UNKNOWN **)v100;
      }

      else
      {
        [v101 setObject:&off_10000D738 forKeyedSubscript:OSLogConstructPersistAgeLimit];
        [v101 setObject:&off_10000D738 forKeyedSubscript:OSLogConstructSpecialAgeLimit];
        [v101 setObject:&off_10000D738 forKeyedSubscript:OSLogConstructSignpostAgeLimit];
        uint64_t v102 = OSLogConstructHighVolumeAgeLimit;
        v103 = v101;
        v104 = &off_10000D738;
      }

      [v103 setObject:v104 forKeyedSubscript:v102];
      v109 = malloc(0x8000uLL);
      if (!v109)
      {
        sub_10000495C(0LL, (uint64_t)"create_archive", 838LL, @"malloc() failed", v105, v106, v107, v108, v130);
        sub_100004A7C((uint64_t)v5, (uint64_t)@"SetupFailed");
        id v122 = 0LL;
        uint64_t v115 = 0LL;
LABEL_94:
        v127 = "failed";
LABEL_95:
        sub_100004C10(5LL, "CreateArchive request: %s", v127);
        archive_write_free(v115);
        free(v109);

LABEL_96:
        goto LABEL_16;
      }

      uint64_t v110 = archive_write_new();
      uint64_t v115 = v110;
      if (v110)
      {
        int v116 = archive_write_set_format_pax(v110);
        if (v116)
        {
          char v117 = v116;
          archive_error_string(v115);
          uint64_t v131 = archive_errno(v115);
          sub_10000495C( v131,  (uint64_t)"create_archive",  853LL,  @"archive_write_set_format_pax() returned %d: %s (%d)",  v118,  v119,  v120,  v121,  v117);
LABEL_93:
          sub_100004A7C((uint64_t)v5, (uint64_t)@"SetupFailed");
          id v122 = 0LL;
          goto LABEL_94;
        }

        int v125 = archive_write_open(v115, v5, 0LL, sub_100004C90, 0LL);
        if (!v125)
        {
          *(void *)&__int128 cf = _NSConcreteStackBlock;
          *((void *)&cf + 1) = 3221225472LL;
          v139 = sub_100004E2C;
          v140 = &unk_10000C890;
          v141 = v5;
          uint64_t v142 = v115;
          v143 = v109;
          id v122 = objc_retainBlock(&cf);
          sub_100005144((uint64_t)v5);
          int v128 = OSLogConstructArchive(v101, &stru_10000C870, v122);
          v127 = "failed";
          if (!v128) {
            v127 = "complete";
          }
          goto LABEL_95;
        }

        char v126 = v125;
        archive_error_string(v115);
        uint64_t v110 = archive_errno(v115);
        char v130 = v126;
        v123 = @"archive_write_open() returned %d: %s (%d)";
        uint64_t v124 = 861LL;
      }

      else
      {
        v123 = @"archive_write_new() failed";
        uint64_t v124 = 845LL;
      }

      sub_10000495C(v110, (uint64_t)"create_archive", v124, v123, v111, v112, v113, v114, v130);
      goto LABEL_93;
    }

    sub_10000495C( (uint64_t)v56,  (uint64_t)"handle_os_trace_connection",  1004LL,  @"Invalid initial message from client %s: %@",  v57,  v58,  v59,  v60,  v5[1]);
  }

  else
  {
    sub_10000495C( v21,  (uint64_t)"handle_os_trace_connection",  989LL,  @"Invalid initial message from client %s: %@",  v22,  v23,  v24,  v25,  v5[1]);
  }

  sub_100004A7C((uint64_t)v5, (uint64_t)@"MalformedSetupMessage");
LABEL_16:
  objc_autoreleasePoolPop(v6);
  lockdown_disconnect(*v5);
  free((void *)v5[1]);
  free(v5);
LABEL_17:
}

void sub_100003A6C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v5 = calloc(1uLL, 0x30uLL);
  void *v5 = a2;
  v5[1] = sub_10000406C(a3);
  v5[4] = sub_100003AFC;
  v5[5] = sub_100003F84;
  v6 = funopen(v5, 0LL, (int (__cdecl *)(void *, const char *, int))sub_100003FBC, 0LL, 0LL);
  v5[2] = v6;
  setlinebuf(v6);
  sub_100007028(0xFFFFFFFFLL, 140, 6, (uint64_t)v5);
}

BOOL sub_100003AFC(uint64_t a1, uint64_t a2)
{
  v3 = *(FILE **)(a1 + 16);
  char v77 = 0;
  __int128 v76 = 0u;
  __int128 v75 = 0u;
  __int128 v74 = 0u;
  __int128 v73 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  *(_OWORD *)v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v30 = 0u;
  *(void *)id v26 = 0LL;
  uint64_t v27 = 0LL;
  *(void *)((char *)v28 + 6) = 0LL;
  v28[0] = 0LL;
  gethostname(v61, 0x100uLL);
  memcpy(__dst, "<unknown>", sizeof(__dst));
  v4 = v24;
  if (v23 && uu2 && !uuid_compare(v23, uu2))
  {
    if (v4 || (v4 = __s) != 0LL) {
      strrchr(v4, 47);
    }
    snprintf(__str, 0x200uLL, "%s");
  }

  else
  {
    if (__s && v4)
    {
      v5 = __s;
LABEL_10:
      strrchr(v5, 47);
      strrchr(v4, 47);
      snprintf(__str, 0x200uLL, "%s(%s)");
      goto LABEL_11;
    }

    if (v4)
    {
      proc_name(v19, __dst, 0x400u);
      v5 = __dst;
      goto LABEL_10;
    }

    if (__s)
    {
      strrchr(__s, 47);
    }

    else
    {
      proc_name(v19, __dst, 0x400u);
      strrchr(__dst, 47);
    }

    snprintf(__str, 0x200uLL, "%s(<unknown>)");
  }

LABEL_11:
  if (v18 == 1024)
  {
    localtime_r(&v25, (tm *)__dst);
    strftime(v26, 0x1EuLL, "%b %e %T", (const tm *)__dst);
    int type = os_log_get_type(v22);
    if (type <= 1)
    {
      if (!type)
      {
        uint64_t v7 = "Notice";
        goto LABEL_46;
      }

      if (type == 1)
      {
        uint64_t v7 = "Info";
        goto LABEL_46;
      }
    }

    else
    {
      switch(type)
      {
        case 2:
          uint64_t v7 = "Debug";
          goto LABEL_46;
        case 16:
          uint64_t v7 = "Error";
          goto LABEL_46;
        case 17:
          uint64_t v7 = "Fault";
LABEL_46:
          uint64_t v9 = (const char *)os_log_copy_formatted_message(v22);
          goto LABEL_47;
      }
    }

    uint64_t v7 = 0LL;
    goto LABEL_46;
  }

  if (v18 != 768) {
    return *(_BYTE *)(a1 + 25) == 0;
  }
  localtime_r(&v25, (tm *)__dst);
  strftime(v26, 0x1EuLL, "%b %e %T", (const tm *)__dst);
  int v6 = os_trace_get_type(v22);
  if (v6 <= 3)
  {
    if (v6 == 1)
    {
      uint64_t v7 = "Notice";
      goto LABEL_43;
    }

    if (v6 == 2)
    {
      uint64_t v7 = "Debug";
      goto LABEL_43;
    }

LABEL_42:
    uint64_t v7 = 0LL;
    goto LABEL_43;
  }

  if (v6 == 4)
  {
    uint64_t v7 = "Info";
    goto LABEL_43;
  }

  if (v6 == 65)
  {
    uint64_t v7 = "Error";
    goto LABEL_43;
  }

  if (v6 != 193) {
    goto LABEL_42;
  }
  uint64_t v7 = "Fault";
LABEL_43:
  uint64_t v9 = (const char *)os_trace_copy_formatted_message(v22);
LABEL_47:
  uint64_t v10 = (char *)v9;
  if (v9)
  {
    size_t v11 = (4 * strlen(v9)) | 1;
    v12 = (char *)calloc(1uLL, v11);
    int v13 = strnvis(v12, v11, v10, 32);
    if (v13 >= 1)
    {
      unint64_t v14 = v13 + 1LL;
      do
      {
        uint64_t v15 = (v14 - 2);
        __darwin_ct_rune_t v16 = v12[v15];
        if (v16 < 0)
        {
          if (!__maskrune(v16, 0x4000uLL)) {
            break;
          }
        }

        else if ((_DefaultRuneLocale.__runetype[v16] & 0x4000) == 0)
        {
          break;
        }

        v12[v15] = 0;
        --v14;
      }

      while (v14 > 1);
    }

    free(v10);
  }

  else
  {
    v12 = strdup("Failed to get message");
  }

  fprintf(v3, "%s %s %s[%d] <%s>: %s\n%c", v26, v61, __str, v19, v7, v12, 0LL);
  free(v12);
  return *(_BYTE *)(a1 + 25) == 0;
}

void sub_100003F84(void *a1)
{
}

uint64_t sub_100003FBC(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 25)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = lockdown_send(*(void *)a1, a2, a3);
  if (result != a3) {
    *(_BYTE *)(a1 + 25) = 1;
  }
  return result;
}

char *sub_10000406C(const void *a1)
{
  if (!a1) {
    return strdup("<unknown>");
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID()) {
    return strdup("<unknown>");
  }
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, kLockdownCheckinClientNameKey);
  if (!Value) {
    return strdup("<unknown>");
  }
  v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID()) {
    return strdup("<unknown>");
  }
  if (!CFStringGetCString(v4, buffer, 255LL, 0x8000100u)) {
    return strdup("<unknown>");
  }
  uint64_t result = strdup(buffer);
  if (!result) {
    return strdup("<unknown>");
  }
  return result;
}

BOOL sub_100004140(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (!_os_activity_stream_entry_decode(v3, v112))
  {
    v128.tv_sec = 0LL;
    *(void *)&v128.tv_usec = 0LL;
    if (__s)
    {
      size_t v9 = strlen(__s);
      size_t v10 = v9 + 1;
      if (v9 + 1 >= 0x10000)
      {
        sub_10000495C( v9,  (uint64_t)"serialize_and_send_stream_entry",  467LL,  @"proc_imagepath length was longer than UINT16_MAX: %zu",  v5,  v6,  v7,  v8,  v9 + 1);
LABEL_26:
        uint64_t v15 = 0LL;
        goto LABEL_27;
      }
    }

    else
    {
      size_t v10 = 0LL;
    }

    size_t v11 = (__int128 *)v121;
    if (v121)
    {
      size_t v11 = (__int128 *)strlen(v121);
      v12 = (char *)v11 + 1;
    }

    else
    {
      v12 = 0LL;
    }

    int v13 = &v12[v10 + 129];
    if (v112[0] <= 514)
    {
      if (v112[0] != 513)
      {
        if (v112[0] == 514)
        {
          unsigned int v107 = 0;
          int v108 = 0;
          LODWORD(v22) = 0;
          unsigned int v105 = 0;
          unsigned int v106 = 0;
          id v110 = 0LL;
          __src = 0LL;
          size_t __n = 0LL;
          goto LABEL_54;
        }

        goto LABEL_25;
      }
    }

    else if (v112[0] != 515)
    {
      size_t v11 = &v118;
      if (v112[0] != 768)
      {
        if (v112[0] == 1024)
        {
          unint64_t v14 = (const char *)os_log_copy_formatted_message(&v118);
          uint64_t v15 = (char *)v14;
          if (v14)
          {
            size_t v16 = strlen(v14);
            size_t v21 = v16 + 1;
            if ((v16 + 1) >> 32)
            {
              sub_10000495C( v16,  (uint64_t)"serialize_and_send_stream_entry",  507LL,  @"Message buffer was longer than UINT32_MAX: %zu",  v17,  v18,  v19,  v20,  v16 + 1);
LABEL_27:
              __int128 v31 = 0LL;
              __int128 v32 = 0LL;
LABEL_107:
              free(v32);
              free(v15);

              goto LABEL_108;
            }
          }

          else
          {
            size_t v21 = 0LL;
          }

          __int128 v33 = &v13[v21];
          if (v126) {
            size_t v22 = strlen(v126) + 1;
          }
          else {
            LODWORD(v22) = 0;
          }
          __int128 v51 = &v33[v22];
          __src = v15;
          size_t __n = v21;
          if (v127) {
            size_t v52 = strlen(v127) + 1;
          }
          else {
            LODWORD(v52) = 0;
          }
          unsigned int v105 = 0;
          unsigned int v106 = v22;
          id v110 = 0LL;
          unsigned int v107 = v52;
          int v108 = v52;
          int v13 = &v51[v52];
LABEL_54:
          unsigned __int8 v58 = [0 streamFlags];
          if ((v58 & 0x80) == 0) {
            gettimeofday(&v128, 0LL);
          }
          __int128 v59 = v13 + 5;
          __int128 v60 = (char *)calloc(1uLL, (size_t)(v13 + 5));
          __int128 v32 = v60;
          int v65 = 2;
          *__int128 v60 = 2;
          *(_DWORD *)(v60 + 1) = (_DWORD)v13;
          v60[5] = 2;
          if (v112[0] <= 514)
          {
            if (v112[0] == 513) {
              goto LABEL_67;
            }
            if (v112[0] == 514)
            {
              int v65 = 32;
              goto LABEL_67;
            }
          }

          else
          {
            switch(v112[0])
            {
              case 0x203:
                int v65 = 16;
                goto LABEL_67;
              case 0x400:
                int v65 = 8;
                goto LABEL_67;
              case 0x300:
                int v65 = 4;
                goto LABEL_67;
            }
          }

          sub_10000495C( (uint64_t)v60,  (uint64_t)"convert_stream_types",  400LL,  @"Unknown os_activity_stream_type: %u",  v61,  v62,  v63,  v64,  v112[0]);
          int v65 = 0;
LABEL_67:
          int v66 = v22;
          *(_DWORD *)(v32 + 6) = v65;
          *(_DWORD *)(v32 + 10) = 129;
          *(_DWORD *)(v32 + 14) = v112[1];
          *(void *)(v32 + 18) = v113;
          if (v114) {
            *(_OWORD *)(v32 + 26) = *v114;
          }
          *((_WORD *)v32 + 21) = v10;
          *(void *)(v32 + 44) = v116;
          *(void *)(v32 + 52) = v117;
          if ((v58 & 0x80) == 0) {
            *(timeval *)(v32 + 60) = v128;
          }
          *(_DWORD *)(v32 + 130) = 0;
          memcpy(v32 + 134, __s, v10);
          *(_OWORD *)(v32 + 72) = v118;
          __int128 v67 = v120;
          *((void *)v32 + 11) = v119;
          if (v67) {
            *((_OWORD *)v32 + 6) = *v67;
          }
          __int128 v68 = v121;
          if (v121)
          {
            size_t v69 = strlen(v121);
            size_t v74 = v69 + 1;
            if (v69 + 1 >= 0x10000)
            {
              sub_10000495C( v69,  (uint64_t)"serialize_and_send_stream_entry",  583LL,  @"Activity image path was longer than UINT16_MAX: %zu",  v70,  v71,  v72,  v73,  v69 + 1);
LABEL_76:
              __int128 v31 = v110;
              uint64_t v15 = __src;
              goto LABEL_107;
            }
          }

          else
          {
            size_t v74 = 0LL;
          }

          __int128 v75 = &v32[v10 + 134];
          *((_WORD *)v32 + 56) = v74;
          __int128 v76 = memcpy(v75, v68, v74);
          v81 = &v75[v74];
          if (v112[0] <= 514)
          {
            if (v112[0] == 513)
            {
              __int128 v31 = v110;
              uint64_t v15 = __src;
              if (v123)
              {
                size_t v88 = strlen(v123);
                size_t v93 = v88 + 1;
                if (v88 + 1 >= 0x10000)
                {
                  sub_10000495C( v88,  (uint64_t)"serialize_and_send_stream_entry",  595LL,  @"Activity name length was longer than UINT16_MAX: %zu",  v89,  v90,  v91,  v92,  v88 + 1);
                  goto LABEL_107;
                }
              }

              else
              {
                size_t v93 = 0LL;
              }

              *((_WORD *)v32 + 57) = v93;
              __int128 v76 = memcpy(v81, v123, v93);
              *(void *)(v32 + 116) = v124;
              *((_DWORD *)v32 + 31) = v122;
            }

            else
            {
              __int128 v31 = v110;
              uint64_t v15 = __src;
              if (v112[0] != 514) {
                goto LABEL_85;
              }
            }
          }

          else if (v112[0] == 515)
          {
            if (v123)
            {
              size_t v82 = strlen(v123);
              size_t v87 = v82 + 1;
              if (v82 + 1 >= 0x10000)
              {
                sub_10000495C( v82,  (uint64_t)"serialize_and_send_stream_entry",  644LL,  @"Action length was longer than UINT16_MAX: %zu",  v83,  v84,  v85,  v86,  v82 + 1);
                goto LABEL_76;
              }
            }

            else
            {
              size_t v87 = 0LL;
            }

            __int128 v31 = v110;
            uint64_t v15 = __src;
            *((_WORD *)v32 + 57) = v87;
            __int128 v76 = memcpy(v81, v123, v87);
            *((_DWORD *)v32 + 29) = v122;
          }

          else
          {
            if (v112[0] != 768)
            {
              __int128 v31 = v110;
              uint64_t v15 = __src;
              if (v112[0] == 1024)
              {
                *(_DWORD *)(v32 + 114) = __n;
                memcpy(v81, __src, __n);
                *(_DWORD *)(v32 + 118) = v122;
                *(_DWORD *)(v32 + 122) = v66;
                memcpy(&v81[__n], v126, v106);
                *(_DWORD *)(v32 + 126) = v108;
                __int128 v76 = memcpy(&v81[__n + v106], v127, v107);
                goto LABEL_100;
              }

LABEL_85:
              sub_10000495C( (uint64_t)v76,  (uint64_t)"serialize_and_send_stream_entry",  659LL,  @"Unknown stream entry type %u",  v77,  v78,  v79,  v80,  v112[0]);
              goto LABEL_107;
            }

            *(_DWORD *)(v32 + 114) = __n;
            uint64_t v15 = __src;
            __int128 v76 = memcpy(v81, __src, __n);
            __int128 v31 = v110;
            if (v110)
            {
              *(_DWORD *)(v32 + 118) = v105;
              __int128 v76 = memcpy(&v81[__n], [v110 bytes], v105);
            }

            *(_DWORD *)(v32 + 122) = v122;
          }

LABEL_100:
          if (a1)
          {
            if ((unint64_t)v59 >> 31)
            {
              sub_10000495C( (uint64_t)v76,  (uint64_t)"secure_send_activity_stream_message",  147LL,  @"Cannot send buffer > INT32_MAX: %zu",  v77,  v78,  v79,  v80,  (char)v59);
              goto LABEL_106;
            }

            uint64_t v94 = lockdown_send(*(void *)a1, v32, v59);
            char v95 = v94;
            id v96 = __error();
            v104 = strerror(*v96);
            sub_10000495C( (uint64_t)v104,  (uint64_t)"secure_send_activity_stream_message",  153LL,  @"Failed to stream message; lockdown_send returned %zd, expected %zu: %s",
              v97,
              v98,
              v99,
              v100,
              v95);
          }

          if (!v59) {
            goto LABEL_107;
          }
LABEL_106:
          sub_10000495C( (uint64_t)v76,  (uint64_t)"serialize_and_send_stream_entry",  664LL,  @"Failed to send buffer to client",  v77,  v78,  v79,  v80,  v103);
          *(_BYTE *)(a1 + 25) = 1;
          goto LABEL_107;
        }

LABEL_25:
        sub_10000495C( (uint64_t)v11,  (uint64_t)"serialize_and_send_stream_entry",  523LL,  @"Unknown os_activity_stream_type type %d",  v5,  v6,  v7,  v8,  v112[0]);
        goto LABEL_26;
      }

      uint64_t v24 = (const char *)os_trace_copy_formatted_message(&v118);
      uint64_t v15 = (char *)v24;
      if (v24)
      {
        size_t v25 = strlen(v24);
        size_t v30 = v25 + 1;
        if ((v25 + 1) >> 32)
        {
          sub_10000495C( v25,  (uint64_t)"serialize_and_send_stream_entry",  484LL,  @"Message buffer was longer than UINT32_MAX: %zu",  v26,  v27,  v28,  v29,  v25 + 1);
          goto LABEL_27;
        }
      }

      else
      {
        size_t v30 = 0LL;
      }

      v13 += v30;
      __src = v15;
      size_t __n = v30;
      if (!v125)
      {
LABEL_53:
        unsigned int v107 = 0;
        int v108 = 0;
        LODWORD(v22) = 0;
        unsigned int v105 = 0;
        unsigned int v106 = 0;
        id v110 = 0LL;
        goto LABEL_54;
      }

      id v34 = v125;
      if (!xpc_dictionary_get_count(v34))
      {

        goto LABEL_53;
      }

      __int128 v35 = (void *)_CFXPCCreateCFObjectFromXPCObject(v34);
      __int128 v40 = v35;
      if (v35)
      {
        if ([v35 count] != (id)1
          || (__int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"__STRINGS"]),
              v41,
              !v41))
        {
          id v42 = [v40 mutableCopy];
          [v42 removeObjectForKey:@"__STRINGS"];
          id v43 = v42;

          uint64_t v129 = 0LL;
          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v43,  200LL,  0LL,  &v129));

          if (!v44) {
            sub_10000495C( v45,  (uint64_t)"copy_payload_data",  438LL,  @"Failed to serialize payload data: %@",  v46,  v47,  v48,  v49,  v129);
          }
          id v50 = v44;
          __int128 v40 = v43;
LABEL_50:

          if (v50)
          {
            unint64_t v53 = (unint64_t)[v50 length];
            if (!HIDWORD(v53))
            {
              id v110 = v50;
              unsigned int v107 = 0;
              int v108 = 0;
              LODWORD(v22) = 0;
              unsigned int v105 = v53;
              unsigned int v106 = 0;
              v13 += v53;
              goto LABEL_54;
            }

            sub_10000495C( v53,  (uint64_t)"serialize_and_send_stream_entry",  494LL,  @"Message payload was too large to send at %ld bytes",  v54,  v55,  v56,  v57,  v53);
          }

          goto LABEL_53;
        }
      }

      else
      {
        sub_10000495C( 0LL,  (uint64_t)"copy_payload_data",  421LL,  @"Failed to create CFDictionary from XPC payload object",  v36,  v37,  v38,  v39,  v103);
      }

      id v50 = 0LL;
      goto LABEL_50;
    }

    if (v123) {
      size_t v23 = strlen(v123) + 1;
    }
    else {
      size_t v23 = 0LL;
    }
    unsigned int v107 = 0;
    int v108 = 0;
    LODWORD(v22) = 0;
    unsigned int v105 = 0;
    unsigned int v106 = 0;
    id v110 = 0LL;
    __src = 0LL;
    size_t __n = 0LL;
    v13 += v23;
    goto LABEL_54;
  }

LABEL_108:
  objc_autoreleasePoolPop(v4);
  BOOL v101 = *(_BYTE *)(a1 + 25) == 0;

  return v101;
}

void sub_10000492C(void **a1)
{
}

void sub_10000495C( uint64_t a1, uint64_t a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v12 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a4, &a9);
  int v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s:%d %@", a2, a3, v12);
  CFRelease(v12);
  if (v13)
  {
    CFStringGetCString(v13, buffer, 1024LL, 0x8000100u);
    sub_100004C10(3LL, "%s", buffer);
    CFRelease(v13);
  }

  else
  {
    sub_100004C10(3LL, "Failed to construct log string");
  }
}

void sub_100004A7C(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 24))
  {
    CFTypeID v2 = (void *)a1;
    *(_BYTE *)(a1 + 24) = 1;
    size_t v10 = @"Error";
    uint64_t v11 = a2;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    LOBYTE(v2) = sub_100004B38(v2, v3);

    if ((v2 & 1) == 0) {
      sub_10000495C( v4,  (uint64_t)"secure_send_error",  220LL,  @"Could not send error response to host",  v5,  v6,  v7,  v8,  v9);
    }
  }

uint64_t sub_100004B38(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
LABEL_7:
    uint64_t v4 = 0LL;
    goto LABEL_8;
  }

  uint64_t v4 = 1LL;
  if (!*((_BYTE *)a1 + 25))
  {
    char v19 = 1;
    uint64_t v5 = lockdown_send(*a1, &v19, 1LL);
    if (v5 == 1)
    {
      uint64_t v6 = lockdown_send_message(*a1, v3, 200LL);
      if (!(_DWORD)v6)
      {
        uint64_t v4 = 1LL;
        goto LABEL_8;
      }

      sub_10000495C( v6,  (uint64_t)"secure_send_message",  186LL,  @"Got error %x from lockdown_send_message",  v7,  v8,  v9,  v10,  v6);
    }

    else
    {
      char v11 = v5;
      CFStringRef v12 = __error();
      uint64_t v18 = strerror(*v12);
      sub_10000495C( (uint64_t)v18,  (uint64_t)"secure_send_message",  180LL,  @"Failed to send message type; lockdown_send returned %zd, expected %zu: %s",
        v13,
        v14,
        v15,
        v16,
        v11);
    }

    goto LABEL_7;
  }

LABEL_8:
  return v4;
}

uint64_t sub_100004C10(uint64_t a1, char *__format, ...)
{
  return _simple_asl_log(a1, "com.apple.diagnosticd", __str);
}

uint64_t sub_100004C90( uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_BYTE *)a2 + 25))
  {
    strerror(32);
    archive_set_error(a1, 32LL, "%s");
  }

  else if (a4 >> 31)
  {
    sub_10000495C( a1,  (uint64_t)"_archive_write",  758LL,  @"Cannot send buffer > INT32_MAX: %zu",  a5,  a6,  a7,  a8,  a4);
    strerror(22);
    archive_set_error(a1, 22LL, "%s");
  }

  else
  {
    char v32 = 3;
    int v33 = a4;
    uint64_t v14 = lockdown_send(*a2, &v32, 5LL);
    if (v14 == 5)
    {
      unint64_t v10 = 0LL;
      if (!a4) {
        return v10;
      }
      while (1)
      {
        uint64_t v15 = lockdown_send(*a2, a3, a4 - v10);
        char v16 = v15;
        if (v15 < 0) {
          break;
        }
        v10 += v15;
        a3 += v15;
        if (v10 >= a4) {
          return v10;
        }
      }

      uint64_t v24 = __error();
      uint64_t v19 = *v24;
      size_t v30 = strerror(*v24);
      sub_10000495C( (uint64_t)v30,  (uint64_t)"_archive_write",  781LL,  @"lockdown_send returned %zd: %s",  v25,  v26,  v27,  v28,  v16);
    }

    else
    {
      char v17 = v14;
      uint64_t v18 = __error();
      uint64_t v19 = *v18;
      __int128 v31 = strerror(*v18);
      sub_10000495C( (uint64_t)v31,  (uint64_t)"_archive_write",  771LL,  @"lockdown_send returned %zd, expected %zu: %s",  v20,  v21,  v22,  v23,  v17);
    }

    uint64_t v29 = strerror(v19);
    archive_set_error(a1, v19, "%s", v29);
    *((_BYTE *)a2 + 25) = 1;
  }

  return -1LL;
}

uint64_t sub_100004E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 25LL))
  {
    if (fcntl(a2, 50) == -1 || fstat(a2, &v55) == -1)
    {
      __int128 v31 = __error();
      _os_assumes_log(*v31);
      return *__error();
    }

    uint64_t disk_new = archive_read_disk_new();
    if (disk_new)
    {
      uint64_t v12 = archive_entry_new();
      uint64_t v17 = v12;
      if (v12)
      {
        archive_entry_copy_pathname(v12, a3);
        archive_entry_copy_sourcepath(v17, v56);
        int v18 = archive_read_disk_entry_from_file(disk_new, v17, a2, &v55);
        uint64_t v19 = *(void *)(a1 + 40);
        if (v18)
        {
          uint64_t v3 = archive_errno(v19);
          archive_error_string(*(void *)(a1 + 40));
          uint64_t v51 = archive_errno(*(void *)(a1 + 40));
          sub_10000495C( v51,  (uint64_t)"create_archive_block_invoke_2",  910LL,  @"archive_read_disk_entry_from_file() returned %d: %s (%d)",  v20,  v21,  v22,  v23,  v18);
        }

        else
        {
          int v24 = archive_write_header(v19, v17);
          if (v24)
          {
            char v25 = v24;
            uint64_t v3 = archive_errno(*(void *)(a1 + 40));
            archive_error_string(*(void *)(a1 + 40));
            uint64_t v52 = archive_errno(*(void *)(a1 + 40));
            sub_10000495C( v52,  (uint64_t)"create_archive_block_invoke_2",  918LL,  @"archive_write_header() returned %d: %s (%d)",  v26,  v27,  v28,  v29,  v25);
          }

          else
          {
            if ((v55.st_mode & 0xF000) == 0x4000) {
              goto LABEL_22;
            }
            while (1)
            {
              ssize_t v32 = read(a2, *(void **)(a1 + 48), 0x8000uLL);
              char v33 = v32;
              if (v32 < 1) {
                break;
              }
              int v34 = archive_write_data(*(void *)(a1 + 40), *(void *)(a1 + 48), v32);
              if (v34 < 0)
              {
                uint64_t v3 = archive_errno(*(void *)(a1 + 40));
                archive_error_string(*(void *)(a1 + 40));
                uint64_t v53 = archive_errno(*(void *)(a1 + 40));
                sub_10000495C( v53,  (uint64_t)"create_archive_block_invoke_2",  929LL,  @"archive_write_data() returned %d: %s (%d)",  v35,  v36,  v37,  v38,  v34);
                goto LABEL_14;
              }
            }

            if (v32 < 0)
            {
              uint64_t v3 = *__error();
              uint64_t v45 = __error();
              strerror(*v45);
              uint64_t v46 = __error();
              sub_10000495C( (uint64_t)v46,  (uint64_t)"create_archive_block_invoke_2",  937LL,  @"read() returned %zd: %s (%d)",  v47,  v48,  v49,  v50,  v33);
            }

            else
            {
LABEL_22:
              int v39 = archive_write_finish_entry(*(void *)(a1 + 40));
              if (v39)
              {
                char v40 = v39;
                uint64_t v3 = archive_errno(*(void *)(a1 + 40));
                archive_error_string(*(void *)(a1 + 40));
                uint64_t v54 = archive_errno(*(void *)(a1 + 40));
                sub_10000495C( v54,  (uint64_t)"create_archive_block_invoke_2",  946LL,  @"archive_write_finish_entry() returned %d: %s (%d)",  v41,  v42,  v43,  v44,  v40);
              }

              else
              {
                uint64_t v3 = 0LL;
              }
            }
          }
        }

        goto LABEL_14;
      }

      sub_10000495C( 0LL,  (uint64_t)"create_archive_block_invoke_2",  900LL,  @"archive_entry_new() failed",  v13,  v14,  v15,  v16,  (char)v56);
    }

    else
    {
      sub_10000495C( 0LL,  (uint64_t)"create_archive_block_invoke_2",  893LL,  @"archive_read_disk_new() failed",  v7,  v8,  v9,  v10,  (char)v56);
      uint64_t v17 = 0LL;
    }

    uint64_t v3 = 12LL;
LABEL_14:
    archive_read_free(disk_new);
    archive_entry_free(v17);
    return v3;
  }

  return 32LL;
}

void sub_100005144(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
  {
    v1 = (void *)a1;
    uint64_t v9 = @"Status";
    uint64_t v10 = @"RequestSuccessful";
    CFTypeID v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    LOBYTE(v1) = sub_100004B38(v1, v2);

    if ((v1 & 1) == 0) {
      sub_10000495C( v3,  (uint64_t)"secure_send_status",  205LL,  @"Could not send error response to host",  v4,  v5,  v6,  v7,  v8);
    }
  }

void sub_100005200(id a1, const char *a2)
{
}

NSMutableDictionary *sub_100005238(void *a1, uint64_t a2)
{
  id v2 = a1;
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"logicalExp"]);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"operator"]);
    if (v6
      && ((uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
       || (unint64_t)[v6 unsignedIntegerValue] > 2))
    {
      uint64_t v20 = 0LL;
    }

    else
    {
      char v40 = v3;
      char v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"subfilters"]);
      if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
      {
        uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        id v11 = v8;
        id v12 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v52 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
              if (v16)
              {
                uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                {
                  int v18 = (void *)sub_100005238(v16, a2);
                  if (v18) {
                    -[NSMutableArray addObject:](v10, "addObject:", v18);
                  }
                }
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
          }

          while (v13);
        }

        if (-[NSMutableArray count](v10, "count"))
        {
          uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v10,  @"subfilters");
          if (v6) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v6,  @"operator");
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v19,  @"logicalExp");
          uint64_t v20 = v40;
        }

        else
        {
          uint64_t v20 = 0LL;
        }
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      uint64_t v3 = v40;
    }
  }

  else
  {
    uint64_t v41 = v3;
    uint64_t v21 = 0LL;
    uint64_t v22 = &CFArrayCreate_ptr;
    id v42 = v2;
    do
    {
      uint64_t v23 = off_10000C8B0[v21];
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v23]);
      if (v24)
      {
        uint64_t v25 = objc_opt_class(v22[14]);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
        {
          uint64_t v44 = v23;
          uint64_t v45 = v21;
          uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          uint64_t v43 = v24;
          id v27 = v24;
          id v28 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v48;
            do
            {
              for (j = 0LL; j != v29; j = (char *)j + 1)
              {
                if (*(void *)v48 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)j);
                if (v32)
                {
                  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
                  if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
                  {
                    uint64_t v34 = objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
                    uint64_t v35 = (void *)v34;
                    if (v34)
                    {
                      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber);
                      if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0) {
                        uint64_t v34 = (uint64_t)[v35 unsignedLongLongValue];
                      }
                      else {
                        uint64_t v34 = 0LL;
                      }
                    }

                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v34 | a2));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v37, v32);
                  }
                }
              }

              id v29 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
            }

            while (v29);
          }

          uint64_t v23 = v44;
          if (-[NSMutableDictionary count](v26, "count")) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v26, v44);
          }

          id v2 = v42;
          int v24 = v43;
          uint64_t v21 = v45;
          uint64_t v22 = &CFArrayCreate_ptr;
        }
      }

      ++v21;
    }

    while (v21 != 6);
    uint64_t v3 = v41;
    if (-[NSMutableDictionary count](v41, "count")) {
      uint64_t v38 = v41;
    }
    else {
      uint64_t v38 = 0LL;
    }
    uint64_t v20 = v38;
    uint64_t v5 = 0LL;
  }

  return v20;
}

uint64_t sub_1000056D0(void *a1, void *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = objc_autoreleasePoolPush();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"logicalExp"]);
  if (!v14)
  {
    char v19 = sub_1000059D8(v11, v12, a3, a4, a5, a6);
    goto LABEL_41;
  }

  id v15 = v12;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"subfilters"]);
  if (![v32 count]) {
    goto LABEL_34;
  }
  id v29 = v12;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"operator"]);
  uint64_t v17 = v16;
  if (v16) {
    uint64_t v18 = (uint64_t)[v16 unsignedIntegerValue];
  }
  else {
    uint64_t v18 = 2LL;
  }
  id v30 = v11;
  __int128 v31 = v14;
  id v28 = v13;

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v32;
  id v20 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v20)
  {
    char v33 = 0;
    char v34 = 1;
    goto LABEL_31;
  }

  id v21 = v20;
  uint64_t v22 = *(void *)v38;
  if (a5) {
    uint64_t v23 = &v36;
  }
  else {
    uint64_t v23 = 0LL;
  }
  char v33 = 0;
  char v34 = 1;
  while (2)
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v38 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
      int8x16_t v36 = 0uLL;
      char v26 = sub_1000056D0(v25, v15, a3, a4, v23, a6);
      switch(v18)
      {
        case 1LL:
          if (a5)
          {
            v34 &= v26;
LABEL_23:
            *a5 = vorrq_s8(*a5, v36);
            continue;
          }

          if ((v26 & 1) != 0) {
            continue;
          }
          char v19 = 0;
LABEL_39:
          id v12 = v29;
          id v11 = v30;
          id v13 = v28;
          uint64_t v14 = v31;

          goto LABEL_40;
        case 2LL:
          if (a5)
          {
            v33 |= v26;
            goto LABEL_23;
          }

          if ((v26 & 1) == 0) {
            continue;
          }
          char v19 = 1;
          goto LABEL_39;
        case 0LL:
          if (a5) {
            *a5 = vorrq_s8(*a5, vextq_s8(v36, v36, 8uLL));
          }
          char v19 = v26 ^ 1;
          goto LABEL_39;
      }
    }

    id v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21) {
      continue;
    }
    break;
  }

LABEL_31:
  uint64_t v14 = v31;
  if (v18)
  {
    id v12 = v29;
    id v11 = v30;
    id v13 = v28;
    char v19 = v34;
    if (v18 != 1)
    {
      char v19 = v33;
      if (v18 != 2) {
LABEL_34:
      }
        char v19 = 0;
    }
  }

  else
  {
    char v19 = 0;
    id v12 = v29;
    id v11 = v30;
    id v13 = v28;
  }

LABEL_40:
LABEL_41:
  objc_autoreleasePoolPop(v13);

  return v19 & 1;
}

uint64_t sub_1000059D8(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v10 = a1;
  id v11 = a2;
  id v90 = v10;
  xpc_object_t xdict = v11;
  if ((_DWORD)a3 == -1)
  {
    LOBYTE(v26) = 0;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"pid"]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);

      if (a5)
      {
        __int128 v121 = 0u;
        __int128 v122 = 0u;
        __int128 v119 = 0u;
        __int128 v120 = 0u;
        size_t v93 = v12;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
        if (v16)
        {
          id v17 = v16;
          char v18 = 0;
          uint64_t v19 = *(void *)v120;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v120 != v19) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = *(void *)(*((void *)&v119 + 1) + 8LL * (void)i);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v21]);
              unsigned int v23 = [v14 isEqualToString:v21];
              unint64_t v24 = (unint64_t)[v22 unsignedLongLongValue];
              if (v23) {
                uint64_t v25 = 0LL;
              }
              else {
                uint64_t v25 = 1LL;
              }
              if (v23) {
                char v18 = 1;
              }
              a5[v25] |= v24;
            }

            id v17 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
          }

          while (v17);
        }

        else
        {
          char v18 = 0;
        }

        id v11 = xdict;
        id v12 = v93;
        a4 = a4;
      }

      else
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v14]);

        if (v27)
        {

          uint64_t v26 = 1LL;
          goto LABEL_114;
        }

        char v18 = 0;
      }

      id v10 = v90;
    }

    else
    {
      char v18 = 0;
    }

    LOBYTE(v26) = v18 & 1;
  }

  if ((_DWORD)a4 != -1)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"uid"]);
    if (v28)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringValue]);

      if (a5)
      {
        __int128 v117 = 0u;
        __int128 v118 = 0u;
        __int128 v115 = 0u;
        __int128 v116 = 0u;
        id v96 = v28;
        id v31 = v28;
        id v32 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v116;
          do
          {
            for (j = 0LL; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v116 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v115 + 1) + 8LL * (void)j);
              __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v36]);
              unsigned int v38 = [v30 isEqualToString:v36];
              unint64_t v39 = (unint64_t)[v37 unsignedLongLongValue];
              if (v38) {
                uint64_t v40 = 0LL;
              }
              else {
                uint64_t v40 = 1LL;
              }
              LOBYTE(v26) = v38 | v26;
              a5[v40] |= v39;
            }

            id v33 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
          }

          while (v33);
        }

        id v10 = v90;
        id v11 = xdict;
        id v28 = v96;
      }

      else
      {
        uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v30]);

        if (v86)
        {

          uint64_t v26 = 1LL;
          goto LABEL_114;
        }
      }
    }
  }

  string = xpc_dictionary_get_string(v11, "procpath");
  id v42 = (char *)string;
  if (string) {
    string = strrchr(string, 47);
  }
  uint64_t v94 = v42;
  if (string) {
    uint64_t v43 = (char *)(string + 1);
  }
  else {
    uint64_t v43 = v42;
  }
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"process"]);
  uint64_t v89 = v44;
  if (v44)
  {
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id v45 = v44;
    id v46 = [v45 countByEnumeratingWithState:&v111 objects:v126 count:16];
    if (!v46) {
      goto LABEL_60;
    }
    id v47 = v46;
    uint64_t v48 = *(void *)v112;
    while (1)
    {
      for (k = 0LL; k != v47; k = (char *)k + 1)
      {
        if (*(void *)v112 != v48) {
          objc_enumerationMutation(v45);
        }
        __int128 v50 = *(void **)(*((void *)&v111 + 1) + 8LL * (void)k);
        __int128 v51 = v45;
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v50]);
        unint64_t v53 = (unint64_t)[v52 unsignedLongLongValue];

        if (v43 && sub_1000062BC(v43, (char *)[v50 UTF8String], v53, a6))
        {
          uint64_t v26 = 1LL;
          __int128 v54 = a5;
          if (!a5)
          {
            id v10 = v90;
            id v11 = xdict;
            goto LABEL_113;
          }
        }

        else
        {
          __int128 v54 = a5 + 1;
          if (!a5) {
            goto LABEL_58;
          }
        }

        *v54 |= v53;
LABEL_58:
        id v45 = v51;
      }

      id v47 = [v51 countByEnumeratingWithState:&v111 objects:v126 count:16];
      if (!v47)
      {
LABEL_60:

        id v10 = v90;
        break;
      }
    }
  }

  stat v55 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"processImagePath"]);
  __int128 v51 = v55;
  id v11 = xdict;
  size_t v88 = v55;
  if (!v55) {
    goto LABEL_76;
  }
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id v56 = v55;
  id v57 = [v56 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (!v57) {
    goto LABEL_75;
  }
  id v58 = v57;
  uint64_t v59 = *(void *)v108;
  uint64_t v97 = v56;
  do
  {
    for (m = 0LL; m != v58; m = (char *)m + 1)
    {
      if (*(void *)v108 != v59) {
        objc_enumerationMutation(v56);
      }
      uint64_t v61 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)m);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v61, v88, v89));
      unint64_t v63 = (unint64_t)[v62 unsignedLongLongValue];

      if (v94 && sub_1000062BC(v94, (char *)[v61 UTF8String], v63, a6))
      {
        uint64_t v26 = 1LL;
        uint64_t v64 = a5;
        if (!a5)
        {
          id v10 = v90;
          __int128 v51 = v88;
          goto LABEL_112;
        }
      }

      else
      {
        uint64_t v64 = a5 + 1;
        if (!a5) {
          goto LABEL_73;
        }
      }

      *v64 |= v63;
LABEL_73:
      id v56 = v97;
    }

    id v58 = [v97 countByEnumeratingWithState:&v107 objects:v125 count:16];
  }

  while (v58);
LABEL_75:

  id v10 = v90;
  __int128 v51 = v88;
LABEL_76:
  int v65 = (char *)xpc_dictionary_get_string(xdict, "subsystem");
  int v66 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"subsystem"]);
  uint64_t v97 = v66;
  if (!v66) {
    goto LABEL_91;
  }
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id v67 = v66;
  id v68 = [v67 countByEnumeratingWithState:&v103 objects:v124 count:16];
  if (!v68) {
    goto LABEL_90;
  }
  id v69 = v68;
  uint64_t v70 = *(void *)v104;
  char v95 = v67;
  while (2)
  {
    uint64_t v71 = 0LL;
    while (2)
    {
      if (*(void *)v104 != v70) {
        objc_enumerationMutation(v67);
      }
      uint64_t v72 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)v71);
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", v72, v88));
      unint64_t v74 = (unint64_t)[v73 unsignedLongLongValue];

      if (v65 && sub_1000062BC(v65, (char *)[v72 UTF8String], v74, a6))
      {
        uint64_t v26 = 1LL;
        __int128 v75 = a5;
        if (!a5)
        {
          id v10 = v90;
          id v11 = xdict;
LABEL_110:
          __int128 v51 = v88;
          goto LABEL_111;
        }

LABEL_87:
        *v75 |= v74;
      }

      else
      {
        __int128 v75 = a5 + 1;
        if (a5) {
          goto LABEL_87;
        }
      }

      uint64_t v71 = (char *)v71 + 1;
      id v67 = v95;
      if (v69 != v71) {
        continue;
      }
      break;
    }

    id v69 = [v95 countByEnumeratingWithState:&v103 objects:v124 count:16];
    if (v69) {
      continue;
    }
    break;
  }

LABEL_90:
  id v10 = v90;
  id v11 = xdict;
  __int128 v51 = v88;
LABEL_91:
  __int128 v76 = (char *)xpc_dictionary_get_string(v11, "category");
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"category"]);
  char v95 = v77;
  if (!v77) {
    goto LABEL_106;
  }
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id v78 = v77;
  id v79 = [v78 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (!v79) {
    goto LABEL_105;
  }
  id v80 = v79;
  xpc_object_t xdicta = *(xpc_object_t *)v100;
  while (2)
  {
    uint64_t v81 = 0LL;
    while (2)
    {
      if (*(xpc_object_t *)v100 != xdicta) {
        objc_enumerationMutation(v78);
      }
      size_t v82 = *(void **)(*((void *)&v99 + 1) + 8 * v81);
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", v82, v88));
      unint64_t v84 = (unint64_t)[v83 unsignedLongLongValue];

      if (v76 && sub_1000062BC(v76, (char *)[v82 UTF8String], v84, a6))
      {
        if (!a5)
        {

          uint64_t v26 = 1LL;
          id v10 = v90;
          goto LABEL_110;
        }

        LOBYTE(v26) = 1;
        uint64_t v85 = a5;
LABEL_102:
        *v85 |= v84;
      }

      else
      {
        uint64_t v85 = a5 + 1;
        if (a5) {
          goto LABEL_102;
        }
      }

      if (v80 != (id)++v81) {
        continue;
      }
      break;
    }

    id v80 = [v78 countByEnumeratingWithState:&v99 objects:v123 count:16];
    if (v80) {
      continue;
    }
    break;
  }

LABEL_105:
  id v10 = v90;
  __int128 v51 = v88;
LABEL_106:
  uint64_t v26 = (a5 != 0LL) & v26;
LABEL_111:

LABEL_112:
LABEL_113:

LABEL_114:
  return v26;
}

BOOL sub_1000062BC(char *__s1, char *__s2, char a3, int a4)
{
  uint64_t v4 = __s2;
  uint64_t v5 = __s1;
  if (a4)
  {
    if (strcasestr(__s1, __s2)) {
      return 1LL;
    }
    __s1 = v4;
    __s2 = v5;
  }

  else if ((a3 & 1) == 0)
  {
    return strcmp(__s1, __s2) == 0;
  }

  return strcasestr(__s1, __s2) != 0LL;
}

void sub_100006328(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = &StreamContext__metaData;
  uint64_t v7 = (void *)qword_100010480;
  if (!qword_100010480)
  {
    char v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v9 = (void *)qword_100010480;
    qword_100010480 = (uint64_t)v8;

    uint64_t v7 = (void *)qword_100010480;
    if (!qword_100010480)
    {
      uint64_t v46 = _os_assert_log();
      _os_crash(v46);
      __break(1u);
    }
  }

  uint64_t v10 = (a3 << 16) | (unint64_t)(a2 << 32);
  if (v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"logicalExp"]);
    if (v11)
    {
      id v12 = sub_100005238(v5, v10);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"operator"]);
      if (!v13 || (uint64_t v14 = v13, v15 = [v13 unsignedIntegerValue], v14, v15 == (id)2))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"subfilters"]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12,  "objectForKeyedSubscript:",  @"logicalExp"));
        char v18 = v17;
        if (v17
          && ((uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"operator"])) == 0
           || (id v20 = v19, v21 = [v19 unsignedIntegerValue], v20, v21 == (id)2)))
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"subfilters"]);
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v16 arrayByAddingObjectsFromArray:v22]);
          [v11 setObject:v23 forKeyedSubscript:@"subfilters"];
        }

        else
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 arrayByAddingObject:v12]);
          [v11 setObject:v22 forKeyedSubscript:@"subfilters"];
        }

        goto LABEL_20;
      }

LABEL_14:
      id v16 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100010480 objectForKeyedSubscript:@"global"]);
      [(id)qword_100010480 setObject:0 forKeyedSubscript:@"global"];
      if ([(id)qword_100010480 count])
      {
        id v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        id v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v28,  @"logicalExp");
        v56[0] = qword_100010480;
        v56[1] = v12;
        id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v29,  @"subfilters");

        id v30 = (void *)qword_100010480;
        qword_100010480 = (uint64_t)v27;
      }

      else
      {
        objc_storeStrong((id *)&qword_100010480, v12);
      }

      [(id)qword_100010480 setObject:v16 forKeyedSubscript:@"global"];
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"logicalExp"]);

    if (v26)
    {
      id v12 = sub_100005238(v5, v10);
      goto LABEL_14;
    }

    uint64_t v31 = 0LL;
    id v47 = v5;
    do
    {
      id v32 = off_10000C8B0[v31];
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v32]);
      if (v33)
      {
        uint64_t v50 = v31;
        uint64_t v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*(id *)&v6[16].flags objectForKeyedSubscript:v32]);
        if (!v34)
        {
          uint64_t v34 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          [*(id *)&v6[16].flags setObject:v34 forKeyedSubscript:v32];
        }

        uint64_t v48 = v33;
        __int128 v49 = v32;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v35 = v33;
        id v36 = [v35 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v52 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v40]);
              unint64_t v42 = (unint64_t)[v41 unsignedLongLongValue];

              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v40));
              unint64_t v44 = (unint64_t)[v43 unsignedLongLongValue];

              id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v42 | v44 | v10));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v45, v40);
            }

            id v37 = [v35 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }

          while (v37);
        }

        id v11 = 0LL;
        id v5 = v47;
        uint64_t v6 = &StreamContext__metaData;
        id v32 = v49;
        uint64_t v31 = v50;
        id v33 = v48;
      }

      ++v31;
    }

    while (v31 != 6);
  }

  else
  {
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"global"]);
    unint64_t v25 = (unint64_t)[v24 unsignedLongLongValue];

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v25 | v10));
    [(id)qword_100010480 setObject:v11 forKeyedSubscript:@"global"];
  }

LABEL_21:
}

void sub_100006820()
{
  id v0 = (id)qword_100010480;
  if (qword_100010480)
  {
    id v0 = [(id)qword_100010480 count];
    if (v0)
    {
      id v1 = objc_claimAutoreleasedReturnValue([(id) qword_100010480 description]);
      id v2 = (const char *)[v1 UTF8String];
      sub_100006B10((uint64_t)v2, "Posting stream filter: %s", v2);

      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  qword_100010480,  200LL,  0LL,  0LL));
      uint64_t v4 = (const char *)_os_trace_prefsdir_path(v3);
      uint64_t v5 = snprintf(__str, 0x400uLL, "%s/%s.plist", v4, "com.apple.diagnosticd.filter");
      uint64_t v6 = (const char *)_os_trace_prefsdir_path(v5);
      uint64_t v7 = snprintf(path, 0x400uLL, "%s/%s.XXXXXXXX", v6, "com.apple.diagnosticd.filter");
      else {
        uint64_t v8 = mkstemp(path);
      }
      uint64_t v11 = v8;
      if ((_DWORD)v8 != -1)
      {
        if (fchmod(v8, 0x1A4u) == -1
          || (id v12 = v3,
              _os_trace_write(v11, [v12 bytes], objc_msgSend(v12, "length")) == -1)
          || fsync(v11) == -1)
        {
          uint64_t v14 = __error();
          _os_assumes_log(*v14);
          if (close(v11) != -1)
          {
LABEL_20:
            unlink(path);
            unlink(__str);
            goto LABEL_21;
          }

          int v15 = *__error();
          uint64_t v16 = *__error();
          if (v15 != 9)
          {
LABEL_19:
            _os_assumes_log(v16);
            goto LABEL_20;
          }

          qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_100010470 = v16;
          __break(1u);
        }

        else
        {
          if (close(v11) == -1)
          {
            int v17 = *__error();
            uint64_t v18 = *__error();
            if (v17 == 9)
            {
              qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_100010470 = v18;
              __break(1u);
              return;
            }

            _os_assumes_log(v18);
            uint64_t v19 = __error();
            _os_assumes_log(*v19);
          }

          if (rename(path, __str) != -1)
          {
            id v13 = v12;
            [v13 bytes];
            [v13 length];
LABEL_21:
            notify_post("com.apple.system.logging.prefschanged");

            return;
          }
        }
      }

      uint64_t v16 = *__error();
      goto LABEL_19;
    }
  }

  uint64_t v9 = sub_100006B10((uint64_t)v0, "Posting empty stream filter");
  uint64_t v10 = (const char *)_os_trace_prefsdir_path(v9);
  snprintf(__str, 0x400uLL, "%s/%s.plist", v10, "com.apple.diagnosticd.filter");
  if (!unlink(__str)) {
    notify_post("com.apple.system.logging.prefschanged");
  }
}

uint64_t sub_100006B10(uint64_t a1, char *__format, ...)
{
  return _simple_asl_log(5LL, "com.apple.diagnosticd", __str);
}

uint64_t sub_100006B8C(uint64_t a1)
{
  return 1LL;
}

void sub_100006BA4(uint64_t a1)
{
  if (qword_100010488 != -1) {
    dispatch_once_f(&qword_100010488, 0LL, (dispatch_function_t)sub_100006C44);
  }
  if (!dispatch_get_specific(off_100010290))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100006DB8;
    block[3] = &unk_10000C8E0;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_100010490, block);
  }

int *sub_100006C44()
{
  if (!qword_100010498)
  {
    uint64_t v1 = *__error();
    qword_100010440 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_100010470 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_100010440 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_100010470 = v2;
    __break(1u);
    return result;
  }

  qword_100010490 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_100010498, 0LL, 0LL);
  dispatch_queue_set_specific((dispatch_queue_t)qword_100010490, off_100010290, (void *)qword_100010490, 0LL);
  if (qword_100010638 != -1) {
    dispatch_once(&qword_100010638, &stru_10000CDC0);
  }
  asprintf((char **)&qword_1000104A0, "%s/%s.0.log", (const char *)qword_100010628, "diagnosticd");
  if (qword_100010638 != -1) {
    dispatch_once(&qword_100010638, &stru_10000CDC0);
  }
  uint64_t result = (int *)asprintf((char **)&qword_1000104A8, "%s/%s.1.log", (const char *)qword_100010628, "diagnosticd");
  if (!qword_1000104A0 || !qword_1000104A8) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_100006DB8(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010490);
  time_t v6 = time(0LL);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  uint64_t v2 = getprogname();
  pid_t v3 = getpid();
  uint64_t result = snprintf(__str, 0x400uLL, "%s %s[%d]: %s\n", v8, v2, v3, v1);
  if ((int)result >= 1)
  {
    unsigned int v5 = result;
    if (result >= 0x400)
    {
      __str[1022] = 10;
      unsigned int v5 = 1023;
    }

    dispatch_assert_queue_V2((dispatch_queue_t)qword_100010490);
    sub_100006EC8();
    uint64_t result = dword_100010298;
    if ((dword_100010298 & 0x80000000) == 0)
    {
      _os_trace_write(dword_100010298, __str, v5);
      return sub_100006F10();
    }
  }

  return result;
}

void sub_100006EC8()
{
  if (dword_100010298 < 0)
  {
    sub_100006FD4();
    if ((dword_100010298 & 0x80000000) == 0) {
      sub_100006F10();
    }
  }

uint64_t sub_100006F10()
{
  off_t v0 = lseek(dword_100010298, 0LL, 2);
  uint64_t result = fsync(dword_100010298);
  if (v0 >= 0x100000)
  {
    if (close(dword_100010298) != -1)
    {
LABEL_3:
      rename((const char *)qword_1000104A0, (const char *)qword_1000104A8);
      return sub_100006FD4();
    }

    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }

    qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100010470 = result;
    __break(1u);
  }

  return result;
}

uint64_t sub_100006FD4()
{
  uint64_t result = open((const char *)qword_1000104A0, 778, 420LL);
  dword_100010298 = result;
  if ((result & 0x80000000) == 0) {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

void sub_100007028(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v8 = _os_trace_calloc(1LL, 104LL);
  *(_DWORD *)(v8 + 80) = 2;
  *(_DWORD *)(v8 + 16) = a2;
  *(_DWORD *)(v8 + 20) = a3;
  *(_DWORD *)(v8 + 56) = getpid();
  *(void *)(v8 + 96) = a4;
  if ((_DWORD)a1 != -1)
  {
    uint64_t v19 = @"pid";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
    int v17 = v10;
    uint64_t v18 = &off_10000D750;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v20 = v11;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

    *(void *)(v8 + 64) = v12;
  }

  int v13 = *(_DWORD *)(v8 + 16);
  if ((v13 & 0x100) != 0) {
    int v14 = 9;
  }
  else {
    int v14 = 8;
  }
  if ((v13 & 0x20) != 0) {
    int v15 = 11;
  }
  else {
    int v15 = v14;
  }
  *(void *)(v8 + 72) = os_transaction_create("com.apple.diagnosticd.relay-stream");
  sub_1000071F0(v8, v15);
  if (qword_100010618 != -1) {
    dispatch_once(&qword_100010618, &stru_10000CD20);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000LL;
  v16[2] = sub_1000072D4;
  v16[3] = &unk_10000C940;
  v16[4] = v8;
  dispatch_barrier_sync((dispatch_queue_t)qword_100010620, v16);
}

void sub_1000071F0(uint64_t a1, int a2)
{
  uint64_t v4 = _os_trace_calloc(1LL, 96LL);
  *(void *)(v4 + 16) = a1;
  *(_DWORD *)(v4 + 24) = a2;
  int v5 = *(_DWORD *)(a1 + 56);
  *(_DWORD *)(v4 + 28) = v5;
  uint64_t v6 = *(void *)(a1 + 96);
  if (v6) {
    strlcpy((char *)(v4 + 32), *(const char **)(v6 + 8), 0x40uLL);
  }
  else {
    proc_name(v5, (void *)(v4 + 32), 0x40u);
  }
  if (qword_1000104C8 != -1) {
    dispatch_once(&qword_1000104C8, &stru_10000CA40);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000732C;
  block[3] = &unk_10000CA00;
  block[4] = v4;
  dispatch_sync((dispatch_queue_t)qword_1000104D0, block);
}

uint64_t sub_1000072D4(uint64_t result)
{
  **(void **)(result + 32) = 0LL;
  *(void *)(*(void *)(result + 32) + 8LL) = off_1000102A8;
  *off_1000102A8 = *(_UNKNOWN **)(result + 32);
  off_1000102A8 = *(_UNKNOWN ***)(result + 32);
  return result;
}

void sub_100007304(id a1)
{
  qword_100010620 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.stream", 0LL);
}

void sub_10000732C(uint64_t a1)
{
  **(void **)(a1 + 32) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 8LL) = off_1000102B8;
  *off_1000102B8 = *(_UNKNOWN **)(a1 + 32);
  off_1000102B8 = *(_UNKNOWN ***)(a1 + 32);
  sub_100007484();
  sub_1000074AC();
  id v2 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 64) description]);
  pid_t v3 = (const char *)[v2 UTF8String];
  if (!v3) {
    pid_t v3 = "<empty>";
  }
  uint64_t v4 = (char *)_os_trace_strdup(v3);

  sub_100004C10( 5LL,  "System mode client started - %s (%d) - mode: 0x%x, filter: %s",  (const char *)(*(void *)(a1 + 32) + 32LL),  *(_DWORD *)(*(void *)(a1 + 32) + 28LL),  *(_DWORD *)(*(void *)(a1 + 32) + 24LL),  v4);
  snprintf( __str,  0x400uLL,  "System mode client started - %s (%d) - mode: 0x%x, filter: %s",  (const char *)(*(void *)(a1 + 32) + 32LL),  *(_DWORD *)(*(void *)(a1 + 32) + 28LL),  *(_DWORD *)(*(void *)(a1 + 32) + 24LL),  v4);
  sub_100006BA4((uint64_t)__str);
  free(v4);
}

uint64_t sub_100007484()
{
  uint64_t result = _os_trace_set_diagnostic_flags();
  if ((_DWORD)result) {
    errx(74, "Unable to set global diagnostic flag");
  }
  return result;
}

uint64_t sub_1000074AC()
{
  if (qword_1000104C8 != -1) {
    dispatch_once(&qword_1000104C8, &stru_10000CA40);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104D0);
  if (qword_100010480 && [(id)qword_100010480 count])
  {
    off_t v0 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100010480 objectForKeyedSubscript:@"global"]);
    uint64_t v1 = v0;
    if (v0 && ([v0 unsignedLongLongValue] & 0x40000) != 0)
    {

      int v4 = 1;
    }

    else
    {

      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "procpath", "kernel");
      int8x16_t v21 = 0uLL;
      unsigned __int8 v3 = sub_1000056D0((void *)qword_100010480, empty, 0LL, 0LL, &v21, 1LL);
      int v4 = v3 & ((v21.i64[0] & 0x40000) != 0);
    }
  }

  else
  {
    int v4 = 0;
  }

  if (qword_1000105B8 != -1) {
    dispatch_once(&qword_1000105B8, &stru_10000CA80);
  }
  if (!v4)
  {
    if (qword_1000105A8)
    {
      dispatch_source_cancel((dispatch_source_t)qword_1000105A8);
      qword_1000105A8 = 0LL;
      int v5 = "Stopped kernel streaming";
    }

    else
    {
      int v5 = "Kernel streaming already stopped";
    }

    goto LABEL_27;
  }

  if (qword_1000105A8)
  {
    int v5 = "Kernel streaming is already enabled";
LABEL_27:
    uint64_t v16 = 7LL;
    return sub_100004C10(v16, v5);
  }

  int v6 = open("/dev/oslog_stream", 4, 0LL);
  if (v6 < 0)
  {
    int v5 = "failed to open kernel stream";
    uint64_t v16 = 3LL;
    return sub_100004C10(v16, v5);
  }

  unsigned int v7 = v6;
  uint64_t v26 = 0LL;
  uint64_t v24 = 0LL;
  __int128 v25 = 0u;
  int8x16_t v21 = 0u;
  uint64_t v22 = 0LL;
  __int128 v23 = xmmword_1000105C0;
  uint64_t kernel_cache_uuid = _os_trace_kic_mode();
  if ((_DWORD)kernel_cache_uuid) {
    uint64_t kernel_cache_uuid = _os_trace_uuiddb_make_kernel_cache_uuid(&v24, &xmmword_1000105C0);
  }
  if ((_os_trace_is_kernel_64_bit(kernel_cache_uuid) & 1) == 0) {
    v21.i16[1] |= 1u;
  }
  uint64_t v9 = _catalog_create();
  qword_1000103C8 = v9;
  qword_1000103D8 = _catalog_procinfo_create();
  _catalog_subchunk_procinfo_add(v9, qword_1000103D8);
  CFArrayRef v10 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_100010410, 4LL, &kCFTypeArrayCallBacks);
  if (v10)
  {
    CFArrayRef v11 = v10;
    uint64_t v12 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, v10);
    if (v12)
    {
      int v13 = v12;
      CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_10000787C, &unk_1000103A0);
      CFRelease(v13);
    }

    CFRelease(v11);
  }

  int v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v7,  0LL,  (dispatch_queue_t)qword_1000105B0);
  qword_1000105A8 = (uint64_t)v14;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100007980;
  handler[3] = &unk_10000CAA0;
  unsigned int v20 = v7;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_set_context(v14, &unk_1000103A0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 0x40000000LL;
  v17[2] = sub_100007CE0;
  v17[3] = &unk_10000CAC0;
  unsigned int v18 = v7;
  v17[4] = v14;
  dispatch_source_set_cancel_handler(v14, v17);
  dispatch_activate(v14);
  return sub_100004C10(7LL, "Started kernel streaming");
}

uint64_t sub_10000787C(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadAddress");
  int v6 = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"OSBundleExecLoadSize");
  if (Value)
  {
    if (v6)
    {
      uint64_t v8 = (const __CFNumber *)result;
      if (result)
      {
        uint64_t result = CFNumberGetValue(Value, kCFNumberSInt64Type, &v10);
        if ((_DWORD)result)
        {
          int v13 = v10;
          __int16 v14 = v11;
          BytePtr = CFDataGetBytePtr(v6);
          uuid_copy(v15, BytePtr);
          CFNumberGetValue(v8, kCFNumberSInt64Type, valuePtr);
          return _catalog_procinfo_uuidinfo_add(*(void *)(a3 + 40), *(void *)(a3 + 56), valuePtr);
        }
      }
    }
  }

  return result;
}

void sub_100007980(uint64_t a1)
{
  qword_1000104E8 = v9;
  dword_1000104F0 = (int)v10 / 1000;
  time_t v14 = v9;
  localtime_r(&v14, &v18);
  unint64_t v2 = ((unsigned __int128)(v18.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v18.tm_gmtoff;
  dword_1000103B0 = (v2 >> 5) + (v2 >> 63) + 60 * v18.tm_isdst;
  *(_DWORD *)algn_1000103B4 = v18.tm_isdst;
  ssize_t v3 = read(*(_DWORD *)(a1 + 32), &v18, 0x1000uLL);
  if (v3 <= 31)
  {
    int v4 = __error();
    strerror(*v4);
    sub_100004C10(3LL, "Error reading from kernel channel %s");
    return;
  }

  ssize_t v5 = v3;
  uint64_t v13 = *(void *)&v18.tm_sec;
  _catalog_update_earliest_fhbuf_ts(qword_1000103C8);
  if ((char *)&v18 + v5 < (char *)&v18.tm_isdst + HIWORD(*(void *)&v18.tm_wday))
  {
    snprintf( (char *)&v14,  0x400uLL,  "Invalid kernel tracepoint size (%d) for read length (%zd)",  HIWORD(*(void *)&v18.tm_wday),  v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100007D64;
    block[3] = &unk_10000CAE0;
    block[4] = &v14;
    if (qword_1000105D0 != -1) {
      dispatch_once(&qword_1000105D0, block);
    }
    sub_100004C10(3LL, "%s");
    return;
  }

  if (*(void *)&v18.tm_hour == -1LL)
  {
    sub_100004C10(7LL, "Received dropped message count from the kernel: %u");
    return;
  }

  if (LOBYTE(v18.tm_hour) == 5LL)
  {
    if (BYTE1(v18.tm_hour) == 5)
    {
      if (v18.tm_mday != 1) {
        return;
      }
      int tm_zone = (int)v18.tm_zone;
      __int16 v16 = WORD2(v18.tm_zone);
      time_t v14 = v19;
      uuid_copy(v17, (const unsigned __int8 *)&v18.tm_isdst);
      _catalog_procinfo_uuidinfo_add(qword_1000103C8, qword_1000103D8, &v14);
      unsigned int v6 = 1024;
LABEL_21:
      sub_100007E38((const unsigned __int8 *)&v18.tm_isdst, v6);
      return;
    }

    if (BYTE1(v18.tm_hour) == 3)
    {
      if (v18.tm_mday == 2)
      {
        _catalog_procinfo_uuidinfo_remove(qword_1000103C8, qword_1000103D8, v18.tm_zone);
        return;
      }

      if (v18.tm_mday == 1)
      {
        int tm_zone = (int)v18.tm_zone;
        __int16 v16 = WORD2(v18.tm_zone);
        time_t v14 = v19;
        uuid_copy(v17, (const unsigned __int8 *)&v18.tm_isdst);
        _catalog_procinfo_uuidinfo_add(qword_1000103C8, qword_1000103D8, &v14);
        unsigned int v6 = 2;
        goto LABEL_21;
      }
    }
  }

  else if (_chunk_support_convert_tracepoint(&v18.tm_hour, v12, &unk_1000103A0))
  {
    unsigned int v7 = (void *)_os_activity_stream_entry_encode(v12);
    if (v7)
    {
      uint64_t v8 = v7;
      xpc_dictionary_set_uint64(v7, "action", 6uLL);
      sub_100007D80(0LL, (uint64_t)v8);
      xpc_release(v8);
    }
  }

void sub_100007CE0(uint64_t a1)
{
  if (close(*(_DWORD *)(a1 + 40)) != -1) {
    goto LABEL_2;
  }
  int v2 = *__error();
  uint64_t v3 = *__error();
  if (v2 != 9)
  {
    _os_assumes_log(v3);
LABEL_2:
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    return;
  }

  qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100010470 = v3;
  __break(1u);
}

uint64_t sub_100007D64(uint64_t a1)
{
  return os_fault_with_payload(18LL, 2LL, 0LL, 0LL, *(void *)(a1 + 32), 0LL);
}

void sub_100007D80(uint64_t a1, uint64_t a2)
{
  if (qword_1000105D8 != -1) {
    dispatch_once(&qword_1000105D8, &stru_10000CB20);
  }
  if (qword_100010618 != -1) {
    dispatch_once(&qword_100010618, &stru_10000CD20);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_100007FF0;
  v4[3] = &unk_10000CBC0;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100010620, v4);
}

void sub_100007E38(const unsigned __int8 *a1, unsigned int a2)
{
  if (qword_100010610 != -1) {
    dispatch_once(&qword_100010610, &stru_10000CCA0);
  }
  if (qword_100010608)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_100010608, &stru_10000CCE0);
    xpc_connection_activate((xpc_connection_t)qword_100010608);
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "operation", 9uLL);
    xpc_dictionary_set_uuid(v4, "uuid", a1);
    xpc_dictionary_set_int64(v4, "source", a2);
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)qword_100010608, v4);
    xpc_release(v4);
    xpc_type_t type = xpc_get_type(v5);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      int int64 = xpc_dictionary_get_int64(v5, "st");
      if (!int64)
      {
LABEL_11:
        xpc_release(v5);
        return;
      }

      string = strerror(int64);
LABEL_10:
      sub_100004C10(3LL, "error harvesting kernel uuid text: %s", string);
      goto LABEL_11;
    }

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
      goto LABEL_10;
    }

    qword_100010440 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_100010470 = (uint64_t)type;
    __break(1u);
  }

void sub_100007FC4(id a1)
{
  qword_100010608 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd.admin", 0LL, 2uLL);
}

void sub_100007FF0(uint64_t a1)
{
  uint64_t v1 = (char *)off_1000102A0;
  if (off_1000102A0)
  {
    while (1)
    {
      int v3 = *((_DWORD *)v1 + 20);
      switch(v3)
      {
        case 1:
          if (!*((void *)v1 + 11)) {
            goto LABEL_47;
          }
          break;
        case 2:
          if (!*((void *)v1 + 12)) {
            goto LABEL_47;
          }
          break;
        case 0:
          uint64_t v24 = _os_assert_log(0LL);
          _os_crash(v24);
          __break(1u);
          return;
      }

      xpc_object_t v5 = *(_xpc_connection_s **)(a1 + 32);
      xpc_object_t v4 = *(void **)(a1 + 40);
      if (*((void *)v1 + 3))
      {
        string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "SIMULATOR_UDID");
      }

      uint int64 = xpc_dictionary_get_uint64(v4, "traceid");
      int v8 = *((_DWORD *)v1 + 5);
      if (!v8) {
        break;
      }
      if ((v8 & 1) != 0 && uint64 == 2 || (v8 & 8) != 0 && uint64 == 6)
      {
LABEL_28:
        time_t v9 = (void *)*((void *)v1 + 8);
        if (!v9
          || (!v5
            ? (void *)(uint64_t pid = 0LL, euid = 0LL)
            : (pid = xpc_connection_get_pid(v5), euid = xpc_connection_get_euid(v5), time_t v9 = (void *)*((void *)v1 + 8)),
              sub_1000056D0(v9, v4, pid, euid, 0LL, 0LL)))
        {
          if (*((_DWORD *)v1 + 13) >= dword_100010430)
          {
            ++*((void *)v1 + 5);
            if (!v1[48] && *((_DWORD *)v1 + 20) == 1)
            {
              int v17 = (_xpc_connection_s *)*((void *)v1 + 11);
              xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
              xpc_dictionary_set_uint64(v18, "action", 0xCuLL);
              xpc_connection_send_message(v17, v18);
              xpc_release(v18);
              v1[48] = 1;
            }
          }

          else
          {
            uint64_t v12 = (unsigned int *)(v1 + 52);
            v1[48] = 0;
            int v13 = *((_DWORD *)v1 + 20);
            if (v13 == 2)
            {
              uint64_t v19 = *((void *)v1 + 4) + 1LL;
              *((void *)v1 + 4) = v19;
              uint64_t v20 = v19 & 0x7F;
              BOOL v21 = v20 == 0;
              if (!v20)
              {
                do
                  unsigned int v22 = __ldxr(v12);
                while (__stxr(v22 + 1, v12));
              }

              xpc_retain(*(xpc_object_t *)(a1 + 40));
              if (qword_1000105F8 != -1) {
                dispatch_once(&qword_1000105F8, &stru_10000CC00);
              }
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 0x40000000LL;
              v25[2] = sub_100008358;
              v25[3] = &unk_10000CBA0;
              uint64_t v23 = *(void *)(a1 + 40);
              v25[4] = v1;
              v25[5] = v23;
              BOOL v26 = v21;
              dispatch_async((dispatch_queue_t)qword_100010600, v25);
            }

            else if (v13 == 1)
            {
              xpc_connection_send_message(*((xpc_connection_t *)v1 + 11), *(xpc_object_t *)(a1 + 40));
              uint64_t v14 = *((void *)v1 + 4) + 1LL;
              *((void *)v1 + 4) = v14;
              if ((v14 & 0x7F) == 0)
              {
                do
                  unsigned int v15 = __ldxr(v12);
                while (__stxr(v15 + 1, v12));
                __int16 v16 = (_xpc_connection_s *)*((void *)v1 + 11);
                barrier[0] = _NSConcreteStackBlock;
                barrier[1] = 0x40000000LL;
                barrier[2] = sub_10000833C;
                barrier[3] = &unk_10000CB80;
                barrier[4] = v1;
                xpc_connection_send_barrier(v16, barrier);
              }
            }
          }
        }

        goto LABEL_47;
      }

LABEL_47:
      uint64_t v1 = *(char **)v1;
      if (!v1) {
        return;
      }
    }

LABEL_23:
    if (HIBYTE(uint64) == 2)
    {
      if ((v1[16] & 0x20) != 0) {
        goto LABEL_28;
      }
    }

    else if (HIBYTE(uint64) != 1 || (*((_WORD *)v1 + 8) & 0x120) != 0)
    {
      goto LABEL_28;
    }

    goto LABEL_47;
  }

uint64_t sub_10000833C(uint64_t result)
{
  uint64_t v1 = (unsigned int *)(*(void *)(result + 32) + 52LL);
  do
    unsigned int v2 = __ldxr(v1);
  while (__stxr(v2 - 1, v1));
  return result;
}

void sub_100008358(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96LL);
  if (!*(_BYTE *)(v2 + 25)
    && ((*(uint64_t (**)(uint64_t, void))(v2 + 32))(v2, *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (qword_100010618 != -1) {
      dispatch_once(&qword_100010618, &stru_10000CD20);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100008498;
    block[3] = &unk_10000CC20;
    block[4] = v3;
    dispatch_sync((dispatch_queue_t)qword_100010620, block);
    if (qword_1000105F8 != -1) {
      dispatch_once(&qword_1000105F8, &stru_10000CC00);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_1000084C8;
    v6[3] = &unk_10000CC40;
    v6[4] = v3;
    dispatch_async((dispatch_queue_t)qword_100010600, v6);
  }

  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    xpc_object_t v4 = (unsigned int *)(*(void *)(a1 + 32) + 52LL);
    do
      unsigned int v5 = __ldxr(v4);
    while (__stxr(v5 - 1, v4));
  }

uint64_t sub_100008498(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *v1;
  if (*v1)
  {
    *(void *)(v2 + 8) = v1[1];
    uint64_t v1 = *(uint64_t **)(result + 32);
    uint64_t v2 = *v1;
  }

  else
  {
    off_1000102A8 = (_UNKNOWN **)v1[1];
  }

  *(void *)v1[1] = v2;
  return result;
}

uint64_t sub_1000084C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  sub_100008544(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 40);
  if (v5)
  {
    sub_100004C10( 5LL,  "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.",  *(_DWORD *)(v4 + 56),  v5,  *(void *)(v4 + 32) + v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  os_release(*(void **)(v4 + 72));
  sub_1000085D0(*(void ***)(a1 + 32));
  return (*(uint64_t (**)(uint64_t))(v3 + 40))(v3);
}

void sub_100008544(uint64_t a1)
{
  if (qword_1000104C8 != -1) {
    dispatch_once(&qword_1000104C8, &stru_10000CA40);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100008600;
  block[3] = &unk_10000CC60;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_1000104D0, block);
}

void sub_1000085D0(void **a1)
{
  free(a1);
}

uint64_t sub_100008600(uint64_t a1)
{
  uint64_t v1 = (void **)off_1000102B0;
  if (!off_1000102B0) {
    goto LABEL_17;
  }
  uint64_t v2 = 0LL;
  int v3 = 0;
  do
  {
    else {
      v3 |= *((_DWORD *)v1 + 6);
    }
    uint64_t v1 = (void **)*v1;
  }

  while (v1);
  if (!v2)
  {
LABEL_17:
    uint64_t v11 = _os_assert_log(0LL);
    _os_crash(v11);
    __break(1u);
  }

  int v4 = *((_DWORD *)v2 + 6);
  int v5 = v4 & ~(dword_1000104C0 | v3);
  if (v5)
  {
    sub_100004C10( 5LL,  "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x",  (const char *)v2 + 32,  *((_DWORD *)v2 + 7),  v4 & ~(dword_1000104C0 | v3),  v3);
    snprintf( __str,  0x400uLL,  "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x",  (const char *)v2 + 32,  *((_DWORD *)v2 + 7),  v5,  v3);
    sub_100006BA4((uint64_t)__str);
    sub_100007484();
  }

  else
  {
    sub_100004C10( 5LL,  "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x",  (const char *)v2 + 32,  *((_DWORD *)v2 + 7),  v3);
    snprintf( __str,  0x400uLL,  "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x",  (const char *)v2 + 32,  *((_DWORD *)v2 + 7),  v3);
    sub_100006BA4((uint64_t)__str);
  }

  unsigned int v6 = *v2;
  if (*v2) {
    unsigned int v7 = (_UNKNOWN **)*v2;
  }
  else {
    unsigned int v7 = &off_1000102B0;
  }
  v7[1] = v2[1];
  *(void *)v2[1] = v6;
  free(v2);
  int v8 = (void *)qword_100010480;
  qword_100010480 = 0LL;

  time_t v9 = off_1000102B0;
  if (off_1000102B0)
  {
    do
    {
      sub_100006328(*(void **)(v9[2] + 64LL), *((unsigned int *)v9 + 6), *(_DWORD *)(v9[2] + 20LL));
      time_t v9 = (void *)*v9;
    }

    while (v9);
  }

  sub_100006820();
  return sub_1000074AC();
}

void sub_1000087C4(id a1)
{
  qword_100010600 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.relay", 0LL);
}

void sub_1000087EC(id a1)
{
  qword_1000105E8 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.memory-pressure", 0LL);
  qword_1000105F0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_memorypressure,  0LL,  7uLL,  (dispatch_queue_t)qword_1000105E8);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000105F0, &stru_10000CB60);
}

void sub_100008848(id a1)
{
  unint64_t data = dispatch_source_get_data((dispatch_source_t)qword_1000105F0);
  _os_trace_log_simple("Memory pressure 0x%lx", data);
  switch(data)
  {
    case 1uLL:
      int v2 = 16;
      break;
    case 4uLL:
      int v2 = 4;
      break;
    case 2uLL:
      int v2 = 8;
      break;
    default:
      return;
  }

  dword_100010430 = v2;
}

void sub_1000088BC(id a1)
{
  size_t v4 = 37LL;
  if (!sysctlbyname("kern.uuid", in, &v4, 0LL, 0LL))
  {
    uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    qword_1000105B0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.klog", v1);
    uuid_parse(in, (unsigned __int8 *)&xmmword_1000105C0);
    if (qword_100010638 != -1) {
      dispatch_once(&qword_100010638, &stru_10000CDC0);
    }
    dword_1000103A4 = open((const char *)qword_100010630, 0x100000);
    if (dword_1000103A4 == -1)
    {
      int v2 = __error();
      int v3 = strerror(*v2);
      sub_100004C10(3LL, "Error opening uuiddb: %s", v3);
    }
  }

void sub_1000089C8(id a1)
{
  qword_1000104D0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.mode_clients", 0LL);
}

void start()
{
  if (qword_100010488 != -1) {
    dispatch_once_f(&qword_100010488, 0LL, (dispatch_function_t)sub_100006C44);
  }
  dispatch_sync((dispatch_queue_t)qword_100010490, &stru_10000C920);
  if ((MEMORY[0xFFFFFC104] & 8) != 0)
  {
    sub_100004C10(5LL, "Startup - clearing mode: 0x%x", 8);
    snprintf(__str, 0x400uLL, "Startup - clearing mode: 0x%x", 8);
    sub_100006BA4((uint64_t)__str);
    sub_100007484();
  }

  off_t v0 = (void *)qword_100010480;
  qword_100010480 = 0LL;

  sub_100006820();
  dword_1000104C0 = MEMORY[0xFFFFFC104];
  os_trace_set_mode(256LL);
  sub_100004C10(6LL, "diagnosticd starting");
  strcpy(__str, "diagnosticd starting");
  sub_100006BA4((uint64_t)__str);
  qword_1000104B0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  0LL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000104B0, &stru_10000C980);
  dispatch_activate((dispatch_object_t)qword_1000104B0);
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", 0LL, 1uLL);
  qword_1000104B8 = (uint64_t)mach_service;
  if (!mach_service) {
    errx(70, "failed to create mach service com.apple.diagnosticd");
  }
  xpc_connection_set_event_handler(mach_service, &stru_10000C9C0);
  xpc_connection_activate((xpc_connection_t)qword_1000104B8);
  sub_100002E10();
  dispatch_main();
}

void sub_100008B6C(id a1, void *a2)
{
  int v3 = (void *)voucher_adopt(0LL);
  os_release(v3);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100008C48;
    handler[3] = &unk_10000C9E0;
    void handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)a2);
    sub_100004C10(6LL, "New connection from peer %d", pid);
    xpc_connection_activate((xpc_connection_t)a2);
  }

  else
  {
    size_t v4 = xpc_copy_description(a2);
    sub_100004C10(3LL, "Strange connection with %s", v4);
    free(v4);
  }

void sub_100008C48(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  size_t v4 = *(_xpc_connection_s **)(a1 + 32);
  uint int64 = xpc_dictionary_get_uint64(object, "action");
  uint64_t v6 = uint64;
  if (uint64 == 6)
  {
    BOOL v21 = (void *)voucher_adopt(0LL);
    os_release(v21);
    sub_100007D80((uint64_t)v4, (uint64_t)object);
    return;
  }

  if (uint64 != 3)
  {
    unsigned int v22 = xpc_copy_description(object);
    sub_100004C10(3LL, "Unimplemented action %lld [%s]", v6, v22);
    free(v22);
    return;
  }

  string = xpc_dictionary_get_string(object, "simulator_device");
  uint64_t pid = xpc_connection_get_pid(v4);
  memset(buffer, 0, 64);
  proc_name(pid, buffer, 0x40u);
  unint64_t data = xpc_dictionary_get_data(object, "stream_filter", v34);
  uint64_t v10 = 0LL;
  if (!data || !v34[0]) {
    goto LABEL_19;
  }
  uint64_t v11 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", data, v34[0]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  0LL,  0LL,  0LL));
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {

    uint64_t v10 = 0LL;
LABEL_17:

    goto LABEL_19;
  }

  uint64_t v14 = sub_100005238(v12, 0LL);

  if (!v14)
  {
    uint64_t v10 = 0LL;
    goto LABEL_19;
  }

  uint64_t v10 = v14;
  uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", @"pid"));
  id v15 = -[NSMutableDictionary count](v10, "count");

  if (v15 != (id)1 || -[NSData count](v11, "count") != (id)1) {
    goto LABEL_17;
  }
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringValue]);
  xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v17));

  if (v18)
  {
    uint64_t v19 = pid;
    uint64_t v20 = "allowing peer %s (%d) to see itself";
    sub_100004C10(5LL, "allowing peer %s (%d) to see itself");
LABEL_24:
    snprintf(__str, 0x400uLL, v20, buffer, v19);
    sub_100006BA4((uint64_t)__str);
    uint64_t v23 = _os_trace_calloc(1LL, 104LL);
    *(_DWORD *)(v23 + 80) = 1;
    *(_DWORD *)(v23 + 16) = xpc_dictionary_get_uint64(object, "flags");
    *(void *)(v23 + 88) = v4;
    *(void *)(v23 + 64) = v10;
    *(_DWORD *)(v23 + 20) = xpc_dictionary_get_uint64(object, "types");
    *(_DWORD *)(v23 + 56) = xpc_connection_get_pid(v4);
    if (string) {
      uint64_t v24 = strdup(string);
    }
    else {
      uint64_t v24 = 0LL;
    }
    *(void *)(v23 + 24) = v24;
    int v25 = *(_DWORD *)(v23 + 16);
    if ((v25 & 0x100) != 0) {
      int v26 = 9;
    }
    else {
      int v26 = 8;
    }
    if ((v25 & 0x20) != 0) {
      int v27 = 11;
    }
    else {
      int v27 = v26;
    }
    xpc_connection_set_context(v4, (void *)v23);
    xpc_connection_set_finalizer_f(v4, (xpc_finalizer_t)sub_1000085D0);
    xpc_retain(v4);
    *(void *)__str = _NSConcreteStackBlock;
    v34[0] = 0x40000000LL;
    v34[1] = (size_t)sub_10000929C;
    v34[2] = (size_t)&unk_10000CD60;
    v34[3] = v23;
    v34[4] = (size_t)v4;
    xpc_connection_set_event_handler(v4, __str);
    if (qword_100010618 != -1) {
      dispatch_once(&qword_100010618, &stru_10000CD20);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_1000093C4;
    block[3] = &unk_10000CD80;
    block[4] = v23;
    dispatch_barrier_sync((dispatch_queue_t)qword_100010620, block);
    sub_1000071F0(v23, v27);
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      id v29 = reply;
      xpc_connection_send_message(v4, reply);
      xpc_release(v29);
    }

    return;
  }

LABEL_19:
  if ((_os_trace_peer_is_admin(v4) & 1) != 0 || string)
  {
    uint64_t v19 = pid;
    uint64_t v20 = "allowing %s (%d) access to stream due to admin status";
    sub_100004C10(5LL, "allowing %s (%d) access to stream due to admin status");
    goto LABEL_24;
  }

  if (sub_100009214())
  {
    uint64_t v19 = pid;
    uint64_t v20 = "allowing %s (%d) entitled access to stream";
    sub_100004C10(5LL, "allowing %s (%d) entitled access to stream");
    goto LABEL_24;
  }

  if (os_variant_is_darwinos("com.apple.diagnosticd") && sub_100009214())
  {
    uint64_t v19 = pid;
    uint64_t v20 = "allowing %s (%d) darwinOS entitled access to stream";
    sub_100004C10(5LL, "allowing %s (%d) darwinOS entitled access to stream");
    goto LABEL_24;
  }

  sub_100004C10(5LL, "streaming limited to admin group %s (%d)", buffer, pid);
  snprintf(__str, 0x400uLL, "streaming limited to admin group %s (%d)", buffer, pid);
  sub_100006BA4((uint64_t)__str);
  sub_100004C10(3LL, "denying stream client (insufficient access) %s (%d)", buffer, pid);
  xpc_object_t v30 = xpc_dictionary_create_reply(object);
  if (v30)
  {
    uint64_t v31 = v30;
    xpc_dictionary_set_uint64(v30, "error", 1uLL);
    xpc_connection_send_message(v4, v31);
    xpc_release(v31);
  }

  xpc_connection_cancel(v4);
}

BOOL sub_100009214()
{
  off_t v0 = (void *)xpc_connection_copy_entitlement_value();
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0;
  if (xpc_get_type(v0) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v1);
  }

  else
  {
    sub_100004C10(3LL, "non-BOOLean entitlements unsupported @%s:%d", "_diagd_peer_is_entitled", 573);
    BOOL value = 0LL;
  }

  xpc_release(v1);
  return value;
}

void sub_10000929C(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      sub_100008544(*(void *)(a1 + 32));
      if (qword_100010618 != -1) {
        dispatch_once(&qword_100010618, &stru_10000CD20);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_100009420;
      block[3] = &unk_10000CD40;
      block[4] = *(void *)(a1 + 32);
      dispatch_barrier_sync((dispatch_queue_t)qword_100010620, block);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 40);
      if (v5) {
        sub_100004C10( 5LL,  "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.",  *(_DWORD *)(v4 + 56),  v5,  *(void *)(v4 + 32) + v5);
      }
      xpc_release(*(xpc_object_t *)(a1 + 40));
      os_release(*(void **)(*(void *)(a1 + 32) + 72LL));
    }

    else
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    }
  }

uint64_t sub_1000093C4(uint64_t a1)
{
  uint64_t result = os_transaction_create("com.apple.diagnosticd.stream");
  *(void *)(*(void *)(a1 + 32) + 72LL) = result;
  **(void **)(a1 + 32) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 8LL) = off_1000102A8;
  *off_1000102A8 = *(_UNKNOWN **)(a1 + 32);
  off_1000102A8 = *(_UNKNOWN ***)(a1 + 32);
  return result;
}

uint64_t sub_100009420(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *v1;
  if (*v1)
  {
    *(void *)(v2 + 8) = v1[1];
    uint64_t v1 = *(uint64_t **)(result + 32);
    uint64_t v2 = *v1;
  }

  else
  {
    off_1000102A8 = (_UNKNOWN **)v1[1];
  }

  *(void *)v1[1] = v2;
  return result;
}

void sub_100009450(id a1)
{
}

void sub_100009460(id a1)
{
  qword_100010628 = (uint64_t)"/private/var/db/diagnostics";
  qword_100010630 = (uint64_t)"/private/var/db/uuidtext";
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}