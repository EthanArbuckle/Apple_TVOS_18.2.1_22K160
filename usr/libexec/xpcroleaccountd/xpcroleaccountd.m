void *sub_10000417C(int a1, uint64_t a2, void *a3, ssize_t *a4)
{
  void *v8;
  ssize_t v9;
  ssize_t v10;
  void *v11;
  void *v12;
  v8 = sub_100004414(*(void *)(a2 + 96));
  v9 = read(a1, v8, *(void *)(a2 + 96));
  v10 = v9;
  if (v9 != *(void *)(a2 + 96))
  {
    if (v9)
    {
      if (v9 != -1 || (v9 = *__error(), (_DWORD)v9)) {
        _os_assumes_log(v9);
      }
    }

    goto LABEL_8;
  }

  v11 = (void *)xpc_create_from_plist(v8, v9);
  v12 = v11;
  if (v11)
  {
    if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_release(v12);
LABEL_8:
      v12 = 0LL;
      goto LABEL_9;
    }

    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }

LABEL_9:
  free(v8);
  return v12;
}

int *sub_100004260(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      uint64_t v1 = *__error();
      if ((_DWORD)v1) {
        _os_assumes_log(v1);
      }
      result = __error();
      if (*result == 9) {
        sub_100005D24();
      }
    }
  }

  return result;
}

void *sub_1000042A4(const char *a1)
{
  return sub_1000042B0(a1, 0LL, 0LL);
}

void *sub_1000042B0(const char *a1, void *a2, ssize_t *a3)
{
  if (!a1) {
    return 0LL;
  }
  v5 = (int *)open(a1, 0);
  if ((_DWORD)v5 == -1) {
    return 0LL;
  }
  v6 = v5;
  memset(&v10, 0, sizeof(v10));
  int v7 = fstat((int)v5, &v10);
  if (v7 | v10.st_uid || (v10.st_mode & 0x12) != 0) {
    v8 = 0LL;
  }
  else {
    v8 = sub_10000417C((int)v6, (uint64_t)&v10, a2, a3);
  }
  sub_100004260(v6);
  return v8;
}

uint64_t sub_100004368()
{
  return _os_assert_log(0LL);
}

uint64_t xpc_support_relax_roleaccount_policy()
{
  if (qword_10000C030 != -1) {
    dispatch_once(&qword_10000C030, &stru_1000083A0);
  }
  return byte_10000C038;
}

void sub_1000043B0(id a1)
{
  uint64_t v1 = sub_1000042A4("/Library/Preferences/com.apple.security.xpc.plist");
  if (v1)
  {
    v2 = v1;
    if (xpc_dictionary_get_value(v1, "RestrictRoleAccountServices") == &_xpc_BOOL_false) {
      byte_10000C038 = 1;
    }
    xpc_release(v2);
  }
}

void *sub_100004414(size_t __size)
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
        sub_100005D38(v3);
      }
    }
  }

  while (sub_100005CB0());
  return v2;
}

void start(int a1, uint64_t a2)
{
  if (a1 == 2)
  {
    int v3 = *(const char **)(a2 + 8);
    if (!strcmp(v3, "-launchd"))
    {
      sub_100004590();
      sub_100004628();
    }

    if (!strcmp(v3, "-boot")) {
      sub_100004664();
    }
    sub_100004590();
    id v7 = sub_1000045E8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a2 + 8);
      int v10 = 136446210;
      uint64_t v11 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "invoked with unknown argument: %{public}s",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    sub_100004590();
    id v5 = sub_1000045E8();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 67109120;
      LODWORD(v11) = a1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "unexpected argument count, exiting: %d",  (uint8_t *)&v10,  8u);
    }
  }

  exit(64);
}

uint64_t sub_100004590()
{
  uint64_t result = isatty(1);
  if ((_DWORD)result)
  {
    uint64_t v1 = __stdoutp;
    v2 = getprogname();
    fprintf(v1, "%s cannot be run directly.\n", v2);
    exit(78);
  }

  return result;
}

id sub_1000045E8()
{
  if (qword_10000C048 != -1) {
    dispatch_once(&qword_10000C048, &stru_1000083E0);
  }
  return (id)qword_10000C040;
}

void sub_100004628()
{
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0LL, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100008420);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_100004664()
{
  v8[0] = "/private/var/db/com.apple.xpc.roleaccountd.staging";
  v8[1] = 0LL;
  v0 = fts_open(v8, 0, 0LL);
  if (!v0)
  {
    uint64_t v1 = *__error();
    if ((_DWORD)v1) {
      _os_assumes_log(v1);
    }
    exit(74);
  }

  v2 = v0;
  int v3 = fts_read(v0);
  if (v3)
  {
    id v5 = v3;
    do
    {
      if (v5->fts_level && v5->fts_info != 1)
      {
        if (lchflags(v5->fts_path, 0) == -1)
        {
          v6 = __error();
          _os_assumes_log(*v6);
        }

        if (remove(v5->fts_path) == -1)
        {
          id v7 = __error();
          _os_assumes_log(*v7);
        }
      }

      id v5 = fts_read(v2);
    }

    while (v5);
  }

  if (fts_close(v2) == -1)
  {
    v4 = __error();
    _os_assumes_log(*v4);
  }

  exit(0);
}

void sub_10000475C(id a1)
{
  os_log_t v1 = os_log_create("xpcroleaccountd", "default");
  v2 = (void *)qword_10000C040;
  qword_10000C040 = (uint64_t)v1;
}

void sub_10000478C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v6 = v2;
    pid_t pid = xpc_connection_get_pid(v6);
    v8 = (void *)xpc_connection_copy_entitlement_value(v6, "com.apple.private.xpc.is.xpcproxy");

    id v9 = sub_1000045E8();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v8 == &_xpc_BOOL_true)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "pid[%d]: accepting incoming conncection",  buf,  8u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000049A0;
      handler[3] = &unk_100008448;
      v12 = v6;
      v14 = v12;
      xpc_connection_set_event_handler(v12, handler);
      xpc_connection_activate(v12);
    }

    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "pid[%d]: refusing incoming connection - process doesn't have xpcproxy entitlements",  buf,  8u);
      }

      xpc_connection_cancel(v6);
    }
  }

  else
  {
    int v3 = xpc_copy_description(v2);
    id v4 = sub_1000045E8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connection error: %s", buf, 0xCu);
    }

    free(v3);
  }
}

void sub_1000049A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  v6 = v4;
  pid_t pid = xpc_connection_get_pid(v6);
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      id v9 = reply;
      id v10 = v5;
      string = xpc_dictionary_get_string(v10, "Path");
      if (string)
      {
        v12 = string;
        if (xpc_dictionary_get_string(v10, "Token"))
        {
          uint64_t v13 = sandbox_extension_consume();
          if (v13 == -1)
          {
            id v31 = sub_1000045E8();
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100005E20();
            }

            goto LABEL_18;
          }

          uint64_t v14 = v13;
          id v15 = (id)xpc_bundle_create(v12, 2LL);
          uint64_t v16 = ((uint64_t (*)(void))xpc_bundle_get_property)();
          uint64_t v117 = v14;
          if (v16)
          {
            from = (char *)v16;
            uint64_t property = xpc_bundle_get_property(v15, 3LL);
            if (property)
            {
              v18 = (const char *)property;
              v19 = (void *)xpc_bundle_copy_info_dictionary(v15);
              v20 = v19;
              if (!v19
                || xpc_get_type(v19) != (xpc_type_t)&_xpc_type_dictionary
                || xpc_dictionary_get_string(v20, "CFBundleIdentifier"))
              {

                int v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging");
                if (v37
                  || (int v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging/exec")) != 0
                  || (int v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging/tmp")) != 0)
                {
LABEL_38:
                  v36 = 0LL;
                  *__error() = v37;
                  goto LABEL_39;
                }

                bzero(__str, 0x400uLL);
                memset(buf, 0, 144);
                if (lstat(v18, buf))
                {
                  id v45 = sub_1000045E8();
                  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                    sub_100006538();
                  }

                  int v37 = *__error();
                  if (v37) {
                    goto LABEL_38;
                  }
                }

                else
                {
                  __darwin_ino64_t st_ino = buf[0].st_ino;
                  dev_t st_dev = buf[0].st_dev;
                  int v48 = xpc_support_relax_roleaccount_policy();
                  v49 = (const char *)&unk_100006FCF;
                  if (v48) {
                    v49 = "-relaxed";
                  }
                  snprintf( __str,  0x400uLL,  "%s/%d.%lld%s.xpc",  "/private/var/db/com.apple.xpc.roleaccountd.staging/exec",  st_dev,  st_ino,  v49);
                }

                memset(&v118, 0, sizeof(v118));
                if (!lstat(__str, &v118))
                {
                  v57 = &v18[strlen(from) + 1];
                  id v58 = sub_1000045E8();
                  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    buf[0].dev_t st_dev = 67109378;
                    *(_DWORD *)&buf[0].st_mode = pid;
                    LOWORD(buf[0].st_ino) = 2082;
                    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)__str;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "pid[%d]: secured service bundle exists: [%{public}s]",  (uint8_t *)buf,  0x12u);
                  }

                  bzero(buf, 0x400uLL);
                  snprintf((char *)buf, 0x400uLL, "%s/%s", __str, v57);
                  id v60 = sub_1000045E8();
                  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    v123.dev_t st_dev = 67109378;
                    *(_DWORD *)&v123.st_mode = pid;
                    LOWORD(v123.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v123.st_ino + 2) = (__darwin_ino64_t)buf;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "pid[%d]: secured service bundle executable: %s",  (uint8_t *)&v123,  0x12u);
                  }

                  memset(&v123, 0, sizeof(v123));
                  if (lstat((const char *)buf, &v123))
                  {
                    id v62 = sub_1000045E8();
                    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                      sub_100006070();
                    }

                    v36 = 0LL;
                  }

                  else if (!v123.st_uid && (v123.st_mode & 0x40) != 0)
                  {
                    v36 = (void *)xpc_bundle_create(buf, 2LL);
                  }

                  else
                  {
                    id v72 = sub_1000045E8();
                    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                      sub_100005FEC();
                    }

                    v36 = 0LL;
                    *__error() = 1;
                  }

LABEL_39:
                  int v38 = *__error();
                  if (sandbox_extension_release(v117) == -1)
                  {
                    id v39 = sub_1000045E8();
                    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                      sub_100005EAC();
                    }
                  }

                  *__error() = v38;
                  if (v36)
                  {
                    executable_path = (const char *)xpc_bundle_get_executable_path(v36);
                    v30 = sub_100005CCC(executable_path);

                    if (v30)
                    {
                      xpc_dictionary_set_string(v9, "Path", v30);
                      xpc_dictionary_set_uint64(v9, "Retval", 0LL);
                      id v42 = sub_1000045E8();
                      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                      {
                        buf[0].dev_t st_dev = 67109378;
                        *(_DWORD *)&buf[0].st_mode = pid;
                        LOWORD(buf[0].st_ino) = 2082;
                        *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)v30;
                        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "pid[%d]: successfully staged: %{public}s",  (uint8_t *)buf,  0x12u);
                      }

LABEL_22:
                      xpc_connection_send_message(v6, v9);
                      free(v30);

                      goto LABEL_23;
                    }

LABEL_19:
                    v26 = __error();
                    xpc_dictionary_set_uint64(v9, "Retval", *v26);
                    id v27 = sub_1000045E8();
                    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      int v29 = *__error();
                      buf[0].dev_t st_dev = 67109376;
                      *(_DWORD *)&buf[0].st_mode = pid;
                      LOWORD(buf[0].st_ino) = 1024;
                      *(_DWORD *)((char *)&buf[0].st_ino + 2) = v29;
                      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "pid[%d]: failed: %{errno}d",  (uint8_t *)buf,  0xEu);
                    }

                    v30 = 0LL;
                    goto LABEL_22;
                  }

LABEL_18:
                  goto LABEL_19;
                }

                bzero(buf, 0x400uLL);
                memset(out, 0, sizeof(out));
                uuid_generate(out);
                memset(&v123, 0, 37);
                uuid_unparse(out, (char *)&v123);
                snprintf( (char *)buf,  0x400uLL,  "%s/%s",  "/private/var/db/com.apple.xpc.roleaccountd.staging/tmp",  (const char *)&v123);
                id v50 = sub_1000045E8();
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v121 = 136315138;
                  *(void *)&v121[4] = buf;
                  _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "staging area for bundle: %s",  v121,  0xCu);
                }

                v52 = copyfile_state_alloc();
                copyfile_state_set(v52, 6u, sub_100005A80);
                int v53 = copyfile(from, (const char *)buf, v52, 0xC800Fu);
                copyfile_state_free(v52);
                if (v53)
                {
                  id v54 = sub_1000045E8();
                  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
                    sub_100006498(pid, v53, v55);
                  }

                  int v56 = *__error();
                  if (v56) {
                    int v37 = v56;
                  }
                  else {
                    int v37 = 79;
                  }
                  goto LABEL_38;
                }

                id v114 = (id)xpc_bundle_create(buf, 1LL);
                path = (const char *)xpc_bundle_get_path();
                *(void *)v121 = 0LL;
                CFStringRef v65 = CFStringCreateWithCString(0LL, path, 0x8000100u);
                if (v65)
                {
                  *(void *)&v123.dev_t st_dev = kMISValidationOptionAllowAdHocSigning;
                  v123.__darwin_ino64_t st_ino = kMISValidationOptionTrustCacheOnly;
                  *(void *)uuid_t out = kCFBooleanTrue;
                  *(void *)&out[8] = kCFBooleanTrue;
                  CFDictionaryRef v66 = CFDictionaryCreate( 0LL,  (const void **)&v123,  (const void **)out,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                  if (v66)
                  {
                    v109 = v65;
                    CFDictionaryRef cf = v66;
                    int v67 = MISValidateSignatureAndCopyInfo(v65, v66, v121);
                    if (v67)
                    {
                      int v68 = v67;
                      id v69 = sub_1000045E8();
                      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                        sub_100006430(v68, v70, v71);
                      }
                    }

                    else
                    {
                      Value = (const __CFDictionary *)CFDictionaryGetValue( *(CFDictionaryRef *)v121,  kMISValidationInfoEntitlements);
                      if (Value && (v77 = Value, CFTypeID v78 = CFGetTypeID(Value), v78 == CFDictionaryGetTypeID()))
                      {
                        v79 = (const __CFBoolean *)CFDictionaryGetValue( v77,  @"com.apple.private.xpc.role-account");
                        if (v79 && v79 == kCFBooleanTrue)
                        {
                          uint64_t info_dictionary = xpc_bundle_get_info_dictionary(v114);
                          v111 = (void *)objc_claimAutoreleasedReturnValue(info_dictionary);
                          if (v111)
                          {
                            uint64_t v81 = _CFXPCCreateCFObjectFromXPCObject(v111);
                            if (v81)
                            {
                              v82 = (void *)v81;
                              CFStringRef v65 = v109;
                              goto LABEL_103;
                            }

                            id v108 = sub_1000045E8();
                            v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
                            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                              sub_1000063D8();
                            }
                            goto LABEL_101;
                          }

                          id v107 = sub_1000045E8();
                          v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                            sub_1000063AC();
                          }
                        }

                        else
                        {
                          id v102 = sub_1000045E8();
                          v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                            sub_100006404();
                          }
                        }
                      }

                      else
                      {
                        id v83 = sub_1000045E8();
                        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                          sub_100006380();
                        }
                      }
                    }

                    v111 = 0LL;
LABEL_101:
                    CFStringRef v65 = v109;
                    goto LABEL_102;
                  }

                  id v75 = sub_1000045E8();
                  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                    sub_100006354();
                  }
                }

                else
                {
                  id v74 = sub_1000045E8();
                  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                    sub_100006328();
                  }
                }

                CFDictionaryRef cf = 0LL;
                v111 = 0LL;
LABEL_102:

                v82 = 0LL;
LABEL_103:
                if (*(void *)v121) {
                  CFRelease(*(CFTypeRef *)v121);
                }
                if (cf) {
                  CFRelease(cf);
                }
                if (v65) {
                  CFRelease(v65);
                }
                if (v82)
                {
                  CFTypeID v84 = CFGetTypeID(v82);
                  if (v84 != CFDictionaryGetTypeID())
                  {
                    id v85 = sub_1000045E8();
                    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                      sub_1000062FC();
                    }

                    CFRelease(v82);
                    v82 = 0LL;
                  }
                }

                v87 = v114;
                if (v82)
                {
                  v88 = v82;
                  v89 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"XPCService"]);
                  if (v89
                    && (uint64_t v90 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v89, v90) & 1) != 0))
                  {
                    v91 = v89;
                    v92 = (void *)objc_claimAutoreleasedReturnValue([v89 objectForKeyedSubscript:@"_RoleAccount"]);
                    if (v92
                      && (uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v92, v93) & 1) != 0))
                    {
                      v112 = (void *)objc_claimAutoreleasedReturnValue([v91 objectForKeyedSubscript:@"ServiceType"]);
                      if (!v112) {
                        goto LABEL_122;
                      }
                      uint64_t v94 = objc_opt_class(&OBJC_CLASS___NSString);
                      if ((objc_opt_isKindOfClass(v112, v94) & 1) != 0)
                      {
                        if ([v112 isEqualToString:@"Application"])
                        {
LABEL_122:

                          id v95 = sub_1000045E8();
                          v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
                          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                          {
                            v123.dev_t st_dev = 136315138;
                            *(void *)&v123.st_mode = __str;
                            _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_INFO,  "moving staging area to secured destination: %s",  (uint8_t *)&v123,  0xCu);
                          }

                          if (*__error() == 66)
                          {
                            memset(&v123, 0, sizeof(v123));
                            if (!lstat(from, &v123) && (v123.st_mode & 0xF000) == 0x4000 && !v123.st_uid)
                            {
                              sub_100005A28((const char *)buf);
LABEL_156:
                              v36 = (void *)xpc_bundle_create(__str, 1LL);
                              goto LABEL_157;
                            }

                            id v97 = sub_1000045E8();
                            v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
                              sub_1000061A0();
                            }

                            int v99 = 1;
                          }

                          else
                          {
                            id v104 = sub_1000045E8();
                            v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
                            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                              sub_1000061CC();
                            }

                            int v99 = *__error();
                            if (!v99) {
                              goto LABEL_156;
                            }
                          }

                          sub_100005A28((const char *)buf);
                          v36 = 0LL;
                          *__error() = v99;
LABEL_157:
                          v87 = v114;
                          goto LABEL_137;
                        }

                        id v106 = sub_1000045E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue(v106);
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR)) {
                          sub_10000623C();
                        }
                      }

                      else
                      {
                        id v103 = sub_1000045E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue(v103);
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR)) {
                          sub_10000629C();
                        }
                      }
                    }

                    else
                    {
                      id v101 = sub_1000045E8();
                      v112 = (void *)objc_claimAutoreleasedReturnValue(v101);
                      if (os_log_type_enabled((os_log_t)v112, OS_LOG_TYPE_ERROR)) {
                        sub_100006140();
                      }
                    }
                  }

                  else
                  {
                    v91 = v89;
                    id v100 = sub_1000045E8();
                    v92 = (void *)objc_claimAutoreleasedReturnValue(v100);
                    if (os_log_type_enabled((os_log_t)v92, OS_LOG_TYPE_ERROR)) {
                      sub_1000060E0();
                    }
                  }

                  v87 = v114;
                }

                sub_100005A28((const char *)buf);
                v36 = 0LL;
                *__error() = 79;
LABEL_137:

                goto LABEL_39;
              }

              id v43 = sub_1000045E8();
              v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                sub_1000065A8();
              }

              int v34 = 109;
            }

            else
            {
              id v35 = sub_1000045E8();
              v20 = (void *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
                sub_100005F84();
              }
              int v34 = 2;
            }
          }

          else
          {
            id v33 = sub_1000045E8();
            v20 = (void *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
              sub_100005F1C();
            }
            int v34 = 2;
          }

          v36 = 0LL;
          *__error() = v34;
          goto LABEL_39;
        }

        id v24 = sub_1000045E8();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100005DB8();
        }
      }

      else
      {
        id v21 = sub_1000045E8();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100005D50(pid, v22, v23);
        }
      }

      *__error() = 22;
      goto LABEL_18;
    }
  }

LABEL_23:
}

uint64_t sub_10000584C(const char *a1)
{
  if ((mkdir(a1, 0x1C0u) & 0x80000000) == 0) {
    return 0LL;
  }
  if (*__error() == 17)
  {
    memset(&v13, 0, sizeof(v13));
    int v3 = lstat(a1, &v13);
    BOOL v4 = (v13.st_mode & 0xF000) != 0x4000 && v3 == 0;
    BOOL v5 = (v13.st_mode & 0xFFF) != 0x1C0 && v3 == 0;
    if (v13.st_uid) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v4 || v5 || v6)
    {
      id v10 = sub_1000045E8();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = strrchr(a1, 47);
        *(_DWORD *)buf = 136315906;
        id v15 = v12;
        __int16 v16 = 1024;
        BOOL v17 = v4;
        __int16 v18 = 1024;
        BOOL v19 = v5;
        __int16 v20 = 1024;
        BOOL v21 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "bad ownership/permissions on staging area (%s) (%d,%d,%d)",  buf,  0x1Eu);
      }

      *__error() = 1;
      return *__error();
    }

    if ((v3 & 0x80000000) == 0) {
      return 0LL;
    }
    id v7 = sub_1000045E8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006610(a1, v8);
    }
  }

  else
  {
    id v9 = sub_1000045E8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000668C(a1, v8);
    }
  }

  return *__error();
}

void sub_100005A28(const char *a1)
{
  if (removefile(a1, 0LL, 1u))
  {
    id v2 = sub_1000045E8();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100006708((uint64_t)a1, v3);
    }
  }

uint64_t sub_100005A80(int a1, int a2, int a3, int a4, char *a5)
{
  if (a2 != 2) {
    return 0LL;
  }
  uint64_t v14 = v5;
  uint64_t v15 = v6;
  memset(&v13, 0, sizeof(v13));
  if (lchown(a5, 0, 0))
  {
    id v8 = sub_1000045E8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000681C();
    }
LABEL_12:

    return 2LL;
  }

  if (lstat(a5, &v13))
  {
    id v11 = sub_1000045E8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000067AC();
    }
    goto LABEL_12;
  }

  if ((v13.st_mode & 0xF000) == 0xA000)
  {
    id v12 = sub_1000045E8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100006780();
    }
    goto LABEL_12;
  }

  return 0LL;
}

void sub_100005B7C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005B94(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100005BA0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005BCC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100005BF0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100005C00( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

int *sub_100005C5C()
{
  return __error();
}

  ;
}

  ;
}

  ;
}

int *sub_100005C8C()
{
  return __error();
}

char *sub_100005C94(const char *a1)
{
  return strrchr(a1, 47);
}

  ;
}

uint64_t sub_100005CB0()
{
  return 1LL;
}

char *sub_100005CCC(const char *a1)
{
  for (i = a1; ; a1 = i)
  {
    uint64_t result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_10000688C(v3);
      }
    }

    sub_100005CB0();
  }

  return result;
}

uint64_t sub_100005D1C(int a1)
{
  return _os_assert_log(a1);
}

void sub_100005D24()
{
  uint64_t v0 = sub_100004368();
  _os_crash(v0);
  __break(1u);
}

void sub_100005D38(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100005D50(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100005BCC((void *)&_mh_execute_header, a2, a3, "pid[%d]: received incoming message with no path", (uint8_t *)v3);
  sub_100005BD8();
}

void sub_100005DB8()
{
}

void sub_100005E20()
{
}

void sub_100005EAC()
{
}

void sub_100005F1C()
{
}

void sub_100005F84()
{
}

void sub_100005FEC()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "bad ownership/permissions on existing RoleAccount executable (mode/uid): %u/%u",  v2,  0xEu);
  sub_100005B8C();
}

void sub_100006070()
{
}

void sub_1000060E0()
{
}

void sub_100006140()
{
}

void sub_1000061A0()
{
}

void sub_1000061CC()
{
}

void sub_10000623C()
{
}

void sub_10000629C()
{
}

void sub_1000062FC()
{
}

void sub_100006328()
{
}

void sub_100006354()
{
}

void sub_100006380()
{
}

void sub_1000063AC()
{
}

void sub_1000063D8()
{
}

void sub_100006404()
{
}

void sub_100006430(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100005BCC((void *)&_mh_execute_header, a2, a3, "bundle code signature not valid: %d", (uint8_t *)v3);
  sub_100005BD8();
}

void sub_100006498(int a1, int a2, os_log_s *a3)
{
  int v6 = *sub_100005C5C();
  v7[0] = 67109632;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "pid[%d]: copyfile(3) failed on service: %d, (errno %{errno}d)",  (uint8_t *)v7,  0x14u);
  sub_100005BE0();
}

void sub_100006538()
{
}

void sub_1000065A8()
{
}

void sub_100006610(const char *a1, os_log_s *a2)
{
}

void sub_10000668C(const char *a1, os_log_s *a2)
{
}

void sub_100006708(uint64_t a1, os_log_s *a2)
{
}

void sub_100006780()
{
}

void sub_1000067AC()
{
}

void sub_10000681C()
{
}

void sub_10000688C(int a1)
{
  uint64_t v1 = sub_100005D1C(a1);
  uint64_t v2 = (const __CFAllocator *)_os_crash(v1);
  __break(1u);
  CFDictionaryCreate(v2, v3, v4, v5, v6, v7);
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}