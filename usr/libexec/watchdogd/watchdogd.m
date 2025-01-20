void wd_optin_service_register(void *a1, void *a2, void *a3)
{
  id v5;
  dispatch_queue_s *v6;
  id v7;
  void (**v8)(void, void);
  _xpc_connection_s *mach_service;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  void v13[4];
  _xpc_connection_s *v14;
  void (**v15)(void, void);
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5) {
    sub_10000D51C();
  }
  if (!v6) {
    sub_10000D51C();
  }
  v8 = (void (**)(void, void))v7;
  if (!v7) {
    sub_10000D51C();
  }
  if (sub_100003BB8())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0LL, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_1000149E8);
    xpc_connection_activate(mach_service);
    v10 = sub_100003CE8(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100003DFC;
    v13[3] = &unk_100014A10;
    v14 = mach_service;
    v15 = v8;
    v12 = mach_service;
    xpc_connection_send_message_with_reply(v12, v11, v6, v13);
  }

  else
  {
    *__error() = 45;
    v8[2](v8, 0LL);
  }
}

BOOL sub_100003BB8()
{
  if ((os_variant_is_darwinos("com.apple.watchdogd") & 1) != 0)
  {
    if (qword_1000202F8 != -1) {
      dispatch_once(&qword_1000202F8, &stru_100014A70);
    }
    if (byte_1000202F0)
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D564(result, v1, v2, v3, v4, v5, v6, v7);
        return 0LL;
      }
    }

    else
    {
      if (qword_100020300 != -1) {
        dispatch_once(&qword_100020300, &stru_100014A90);
      }
      if (byte_100020308 != 1) {
        return 1LL;
      }
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D530(result, v15, v16, v17, v18, v19, v20, v21);
        return 0LL;
      }
    }
  }

  else
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000D598(result, v8, v9, v10, v11, v12, v13, v14);
      return 0LL;
    }
  }

  return result;
}

void sub_100003CA4(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10000D5CC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

id sub_100003CE8(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "watchdogd_request_command", 0LL);
  if (!v1) {
    goto LABEL_4;
  }
  id v8 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v1,  200LL,  0LL,  &v8));
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
    xpc_dictionary_set_data( v2,  "watchdogd_optin_service_identifier",  [v5 bytes],  (size_t)objc_msgSend(v5, "length"));

LABEL_4:
    id v6 = v2;
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D600(v4);
  }

  id v6 = 0LL;
LABEL_8:

  return v6;
}

void sub_100003DFC(uint64_t a1, void *a2)
{
}

uint64_t sub_100003E34(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D690(v1);
    }
    uint64_t v3 = __error();
    uint64_t v2 = 0LL;
    int v4 = 61;
    goto LABEL_7;
  }

  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v2 = 0LL;
    goto LABEL_8;
  }

  int int64 = xpc_dictionary_get_int64(v1, "watchdogd_request_result");
  if (int64 != 1)
  {
    if (int64)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000D710(int64);
      }
      uint64_t v3 = __error();
      if ((int64 & 0xFFFFFFFE) == 2)
      {
        uint64_t v2 = 0LL;
        int v4 = 1;
      }

      else
      {
        uint64_t v2 = 0LL;
        int v4 = 22;
      }
    }

    else
    {
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_10000D788(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      uint64_t v3 = __error();
      uint64_t v2 = 0LL;
      int v4 = 94;
    }

LABEL_7:
    *uint64_t v3 = v4;
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "optin registration successful",  v15,  2u);
  }

  uint64_t v2 = 1LL;
LABEL_8:

  return v2;
}

uint64_t wd_optin_service_register_sync(void *a1)
{
  id v1 = a1;
  if (!v1) {
    sub_10000D51C();
  }
  uint64_t v2 = v1;
  if (sub_100003BB8())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0LL, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100014A30);
    xpc_connection_activate(mach_service);
    id v4 = sub_100003CE8(v2);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
    uint64_t v7 = sub_100003E34(v6);
    xpc_connection_cancel(mach_service);
  }

  else
  {
    uint64_t v7 = 0LL;
    *__error() = 45;
  }

  return v7;
}

void sub_100004054(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10000D5CC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

void sub_100004098(id a1)
{
  int v2 = 0;
  size_t v1 = 4LL;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL)) {
    byte_1000202F0 = v2 != 0;
  }
}

void sub_1000040F0(id a1)
{
  if (qword_100020310 != -1) {
    dispatch_once(&qword_100020310, &stru_100014AB0);
  }
  if (os_parse_boot_arg_from_buffer_int(&unk_100020318, "wdt", &v1)
    && (unint64_t)(v1 + 1) <= 9
    && ((1LL << (v1 + 1)) & 0x203) != 0)
  {
    byte_100020308 = 1;
  }

void sub_100004178(id a1)
{
  size_t v1 = 1024LL;
  if (sysctlbyname("kern.bootargs", &unk_100020318, &v1, 0LL, 0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D7BC();
    }
    _os_crash("could not retrieve device boot-args");
    __break(1u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v3 = &unk_100020318;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "retrieved current device boot-args: %s",  buf,  0xCu);
  }

void sub_100004268( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004278( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100004290()
{
  return _os_assert_log(0LL);
}

void sub_100004298()
{
  v0 = (const char *)sub_1000080A0();
  size_t v1 = strlen(v0);
  if (!strnstr(v0, "wdt_test=", v1)) {
    return;
  }
  size_t v2 = strlen(v0);
  uint64_t v3 = strnstr(v0, "wdt_controller", v2);
  size_t v4 = strlen(v0);
  uint64_t v5 = strnstr(v0, "wdt_ephemeral", v4);
  size_t v6 = strlen(v0);
  uint64_t v7 = strnstr(v0, "wdt_optin", v6);
  size_t v8 = strlen(v0);
  uint64_t v9 = strnstr(v0, "wdt_exclave", v8);
  bzero(buffer, 0x400uLL);
  bzero(__str, 0x400uLL);
  io_registry_entry_t v16 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v16) {
    sub_10000C470(2, "NVRAM is not supported on this system", v10, v11, v12, v13, v14, v15, v115);
  }
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v16, @"boot-args", 0LL, 0);
  if (!CFProperty) {
    sub_10000C470(2, "No boot-args NVRAM variable found", v17, v18, v19, v20, v21, v22, v115);
  }
  CFStringGetCString(CFProperty, buffer, 1024LL, 0x8000100u);
  sub_10000C470(0, "Retrieved current boot-args from NVRAM: %s\n", v24, v25, v26, v27, v28, v29, (char)buffer);
  CFRelease(CFProperty);
  sub_100004880(buffer, "wdt_test=");
  sub_100004880(buffer, "wdt_ephemeral=");
  sub_100004880(buffer, "wdt_controller=");
  sub_100004880(buffer, "wdt_optin=");
  sub_100004880(buffer, "wdt_exclave=");
  sub_100004880(buffer, "wdt=");
  sub_100004880(buffer, "-wdt_no_pmu");
  snprintf(__str, 0x400uLL, "%s wdt=-1 -wdt_no_pmu", buffer);
  CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
  mach_error_t v31 = IORegistryEntrySetCFProperty(v16, @"boot-args", v30);
  if (v31)
  {
    mach_error_string(v31);
    sub_10000C470( 2,  "Failed to set new boot-args to %s in NVRAM, IORegistryEntrySetCFProperty returned %s",  v32,  v33,  v34,  v35,  v36,  v37,  (char)__str);
  }

  CFRelease(v30);
  mach_error_t v38 = IORegistryEntrySetCFProperty( v16,  @"IONVRAM-FORCESYNCNOW-PROPERTY",  @"IONVRAM-FORCESYNCNOW-PROPERTY");
  if (v38)
  {
    char v45 = mach_error_string(v38);
    sub_10000C470( 2,  "Failed to flush new boot-args to in NVRAM, IORegistryEntrySetCFProperty returned %s",  v46,  v47,  v48,  v49,  v50,  v51,  v45);
  }

  sub_10000C470(0, "Updated and flushed new boot-args: %s", v39, v40, v41, v42, v43, v44, (char)__str);
  size_t v52 = strlen(v0);
  if (strnstr(v0, "wdt_test=healthy", v52)
    || (size_t v59 = strlen(v0), strnstr(v0, "wdt_test=tm_nopanic", v59))
    || (size_t v60 = strlen(v0), strnstr(v0, "wdt_test=tm_panic", v60)))
  {
    sub_10000C85C( 0,  "watchdogd detected testing boot-args for daemon (controller: %d) (ephemeral: %d) (optin: %d) (exclave :%d)",  v53,  v54,  v55,  v56,  v57,  v58,  v3 != 0LL);
    if (dword_1000202E0 <= 2) {
      sub_10000D838();
    }
    memcpy(&unk_10001A640, &unk_1000182A0, 0x720uLL);
    sub_1000049AC(off_10001A658[0], off_10001A660[0], "/usr/local/libexec/watchdogtestdaemon", 0LL);
    uint64_t v61 = 1LL;
    dword_1000202E0 = 1;
    if (v3)
    {
      memcpy(&unk_10001AD60, &unk_1000189C0, 0x720uLL);
      sub_1000049AC(off_10001AD78[0], off_10001AD80[0], "/usr/local/libexec/watchdogtestcontroller", "-c");
      uint64_t v61 = ++dword_1000202E0;
    }

    if (v5)
    {
      v62 = (const char **)((char *)&unk_10001A640 + 1824 * v61);
      memcpy(v62, &unk_1000190E0, 0x720uLL);
      sub_1000049AC(v62[3], v62[4], "/usr/local/libexec/watchdogtestephemeral", "-e");
      ++dword_1000202E0;
    }

    if (v7) {
      sub_1000049AC(off_100019818[0], off_100019820[0], "/usr/local/libexec/watchdogtestoptin", "-o");
    }
    if (v9)
    {
      memcpy((char *)&unk_10001A640 + 1824 * dword_1000202E0, &unk_100019F20, 0x720uLL);
      sub_1000049AC(off_100019F38[0], off_100019F40[0], "/usr/local/libexec/watchdogtestexclave", "-m");
      ++dword_1000202E0;
    }

    return;
  }

  size_t v63 = strlen(v0);
  if (strnstr(v0, "wdt_test=no_user_checkin", v63))
  {
    sub_10000C85C(0, "watchdogd detected testing boot-args to not run, exiting", v64, v65, v66, v67, v68, v69, v116);
    goto LABEL_32;
  }

  size_t v70 = strlen(v0);
  if (strnstr(v0, "wdt_test=cpu_hang", v70))
  {
    sub_10000C85C(0, "watchdogd detected testing boot-args to trigger CPU hang", v71, v72, v73, v74, v75, v76, v116);
    sub_1000056F8();
  }

  size_t v77 = strlen(v0);
  if (strnstr(v0, "wdt_test=soc_watchdog", v77))
  {
    sub_10000C85C(0, "triggering SoC watchdog", v78, v79, v80, v81, v82, v83, v116);
    sub_10000BEBC(v84, v85, v86, v87, v88, v89, v90, v91, v117);
    uint64_t v92 = 0LL;
LABEL_31:
    sub_100005748(v92);
LABEL_32:
    sub_100007CEC();
  }

  size_t v93 = strlen(v0);
  if (strnstr(v0, "wdt_test=panic_soc_watchdog", v93))
  {
    sub_10000C85C(0, "triggering panic SoC watchdog", v94, v95, v96, v97, v98, v99, v116);
    sub_10000BEBC(v100, v101, v102, v103, v104, v105, v106, v107, v118);
    uint64_t v92 = 1LL;
    goto LABEL_31;
  }

  size_t v108 = strlen(v0);
  if (strnstr(v0, "wdt_test=iokit_busy", v108))
  {
    sub_10000C85C(0, "triggering IOKit busy", v109, v110, v111, v112, v113, v114, v116);
    sub_100005798();
  }

void sub_100004880(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  if (v4 > v5)
  {
    __little = 0LL;
    size_t v6 = strnstr(a1, a2, v5);
    if (!v6)
    {
      asprintf(&__little, " %s", a2);
      uint64_t v7 = __little;
      size_t v8 = strstr(a1, __little);
      free(v7);
      if (!v8)
      {
        sub_10000C470(0, "No existing %s boot-arg to remove.\n", v9, v10, v11, v12, v13, v14, (char)a2);
        return;
      }

      size_t v6 = v8 + 1;
    }

    uint64_t v15 = &v6[strcspn(v6, " ")];
    io_registry_entry_t v16 = &v15[strspn(v15, " ")];
    do
      uint64_t v17 = v6--;
    while (v6 >= a1 && *v6 == 32);
    if (*v16)
    {
      uint64_t v18 = &v16[-(v17 != a1)];
      size_t v19 = strlen(v18);
      memmove(v17, v18, v19 + 1);
    }

    else
    {
      *uint64_t v17 = 0;
    }
  }

void sub_1000049AC(const char *a1, const char *a2, const char *a3, const char *a4)
{
  size_t v8 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v9 = objc_autoreleasePoolPush();
  uint64_t v10 = launch_data_new_string(a1);
  launch_data_dict_insert(v8, v10, "Label");
  uint64_t v11 = launch_data_alloc(LAUNCH_DATA_ARRAY);
  uint64_t v12 = launch_data_new_string(a3);
  launch_data_array_set_index(v11, v12, 0LL);
  if (a4)
  {
    uint64_t v13 = launch_data_new_string(a4);
    launch_data_array_set_index(v11, v13, 1uLL);
  }

  launch_data_dict_insert(v8, v11, "ProgramArguments");
  uint64_t v14 = launch_data_new_string("Interactive");
  launch_data_dict_insert(v8, v14, "POSIXSpawnType");
  uint64_t v15 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v15, "EnablePressuredExit");
  io_registry_entry_t v16 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v16, "EnableTransactions");
  uint64_t v17 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v18 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v17, v18, "SuccessfulExit");
  launch_data_dict_insert(v8, v17, "KeepAlive");
  size_t v19 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v20 = launch_data_new_BOOL(1);
  launch_data_dict_insert(v19, v20, a2);
  launch_data_dict_insert(v8, v19, "MachServices");
  objc_autoreleasePoolPop(v9);
  uint64_t v21 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  if (!v21) {
    sub_10000D838();
  }
  uint64_t v22 = v21;
  launch_data_dict_insert(v21, v8, "SubmitJob");
  v23 = launch_msg(v22);
  if (!v23)
  {
    if (!*__error()) {
      goto LABEL_9;
    }
LABEL_11:
    sub_10000D850((char)a2);
  }

  uint64_t v24 = v23;
  if (launch_data_get_type(v23) == LAUNCH_DATA_ERRNO && launch_data_get_errno(v24)) {
    goto LABEL_11;
  }
  launch_data_free(v22);
  uint64_t v22 = v24;
LABEL_9:
  launch_data_free(v22);
}

BOOL sub_100004BB0()
{
  v120[1] = 0LL;
  v120[0] = 0LL;
  v119[1] = 0LL;
  v119[0] = 0LL;
  char v113 = 0;
  uint64_t v118 = 0LL;
  *(void *)uu = 0LL;
  uint64_t v0 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (!qword_100020DE8) {
    sub_10000D51C();
  }
  size_t v1 = (void *)v0;
  if (statfs("/", &v121))
  {
    size_t v2 = __error();
    char v103 = strerror(*v2);
    uint64_t v9 = "failed to statfs root with error: %s";
LABEL_4:
    sub_10000C470(2, v9, v3, v4, v5, v6, v7, v8, v103);
LABEL_5:
    BOOL v10 = 0LL;
    goto LABEL_43;
  }

  sub_100005140(v121.f_mntfromname, (char *)v120, (char *)v119, (uint64_t)&v114);
  int v11 = APFSContainerVolumeGroupGet(v120, v114, uu);
  if (v11 == 49197) {
    goto LABEL_11;
  }
  __int16 v12 = v11;
  if (v11 == 49154) {
    goto LABEL_11;
  }
  if (v11) {
    goto LABEL_12;
  }
  if (uuid_is_null(uu))
  {
    if (uuid_is_null(uu))
    {
LABEL_11:
      size_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ss%d",  v119,  v114));
      [v1 addObject:v19];

      goto LABEL_13;
    }

LABEL_12:
    char v20 = strerror(v12 & 0x3FFF);
    sub_10000C470(2, "error looking up volume group: %s", v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_13;
  }

  sub_10000C470( 0,  "root volume is part of a volume group looking up volumes to monitor...",  v13,  v14,  v15,  v16,  v17,  v18,  v102);
  *(void *)&v116.f_bsize = 0LL;
  int Volumes = APFSContainerVolumeGroupGetVolumes(v120, uu, &v116);
  if (Volumes)
  {
    strerror(Volumes & 0x3FFF);
    sub_10000C470( 2,  "failed to get volume group from disk: %s with error: %s",  v56,  v57,  v58,  v59,  v60,  v61,  (char)v120);
    goto LABEL_5;
  }

  if (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) < 1) {
    sub_10000D51C();
  }
  if (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) >= 1)
  {
    CFIndex v99 = 0LL;
    do
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)&v116.f_bsize, v99);
      if (!CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &notification)) {
        sub_10000D51C();
      }
      uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ss%d",  v119,  notification));
      [v1 addObject:v101];

      ++v99;
    }

    while (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) > v99);
  }

  CFRelease(*(CFTypeRef *)&v116.f_bsize);
LABEL_13:
  bzero(&v116, 0x878uLL);
  __int16 v111 = 0;
  if (statfs("/private/var", &v116))
  {
    uint64_t v27 = __error();
    char v104 = strerror(*v27);
    sub_10000C470(2, "failed to statfs data volume with error: %s", v28, v29, v30, v31, v32, v33, v104);
  }

  else
  {
    mach_error_t v34 = APFSVolumeRole(v116.f_mntfromname, &v111, 0LL);
    if (v34 || v111 != 64)
    {
      mach_error_string(v34);
      sub_10000C470( 2,  "Failed to get role of %s, expected data volume, actual role 0x%x, error message: %s\n",  v49,  v50,  v51,  v52,  v53,  v54,  (char)v116.f_mntfromname);
    }

    else
    {
      sub_100005140(v116.f_mntfromname, (char *)v120, (char *)v119, (uint64_t)&v114);
      asprintf((char **)&qword_100020718, "%ss%d", (const char *)v119, v114);
      if (qword_100020718)
      {
        int v41 = APFSVolumeNeedsCryptoMigration(qword_100020718, &v113);
        if (v41)
        {
          char v113 = 0;
          uint64_t v106 = v41 & 0x3FFF;
          sub_10000C470( 2,  "Cannot determine whether crypto migration is needed for %s with error %d",  v42,  v43,  v44,  v45,  v46,  v47,  qword_100020718);
        }

        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  qword_100020718,  v106));
        [v1 addObject:v48];
      }

      else
      {
        sub_10000C470(2, "Failed to allocate data volume string", v35, v36, v37, v38, v39, v40, v105);
      }
    }
  }

  if (![v1 count])
  {
    uint64_t v9 = "No volumes watchdog needs to monitor are found\n";
    goto LABEL_4;
  }

  v62 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v62) {
    sub_10000D51C();
  }
  size_t v63 = v62;
  IONotificationPortSetDispatchQueue(v62, (dispatch_queue_t)qword_100020DE8);
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id v64 = v1;
  id v65 = [v64 countByEnumeratingWithState:&v107 objects:v115 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v108;
    do
    {
      for (i = 0LL; i != v66; i = (char *)i + 1)
      {
        if (*(void *)v108 != v67) {
          objc_enumerationMutation(v64);
        }
        uint64_t v69 = (const char *)[*(id *)(*((void *)&v107 + 1) + 8 * (void)i) UTF8String];
        size_t v70 = IOBSDNameMatching(kIOMainPortDefault, 0, v69);
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v70);
        if (MatchingService)
        {
          io_service_t v78 = MatchingService;
          if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
          {
            mach_error_t v85 = IOServiceAddInterestNotification( v63,  v78,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_100005228,  0LL,  &notification);
            if (v85)
            {
              mach_error_string(v85);
              sub_10000C470( 2,  "failed to register volume interest notification for: %s with error: %s",  v92,  v93,  v94,  v95,  v96,  v97,  (char)v69);
            }

            else
            {
              sub_10000C470( 0,  "registered volume interest notification for: %s",  v86,  v87,  v88,  v89,  v90,  v91,  (char)v69);
            }
          }

          else
          {
            sub_10000C470( 2,  "unable to monitor: %s for freeze notifications, not an APFS volume",  v79,  v80,  v81,  v82,  v83,  v84,  (char)v69);
          }

          IOObjectRelease(v78);
        }

        else
        {
          sub_10000C470(2, "failed to find IOKit object for volume: %s", v72, v73, v74, v75, v76, v77, (char)v69);
        }
      }

      id v66 = [v64 countByEnumeratingWithState:&v107 objects:v115 count:16];
    }

    while (v66);
  }

  BOOL v10 = v113 != 0;
LABEL_43:

  return v10;
}

void sub_100005140(const char *a1, char *a2, char *a3, uint64_t a4)
{
  size_t v8 = strlen(a1);
  uint64_t v9 = strnstr(a1, "/dev", v8);
  if (v9 && ((uint64_t v16 = v9, sscanf(v9, "/dev/disk%ds%d", &v17, a4) == 2) || sscanf(v16, "disk%ds%d", &v17, a4) == 2))
  {
    snprintf(a2, 0x10uLL, "/dev/disk%d", v17);
    snprintf(a3, 0x10uLL, "disk%d", v17);
  }

  else
  {
    sub_10000C470(2, "failed to parse disk information from root_disk_name: %s", v10, v11, v12, v13, v14, v15, (char)a1);
  }

void sub_100005228( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v20 = 0;
  switch(a3)
  {
    case 0xE0084006:
      int v9 = dword_100020720;
      if (!dword_100020720)
      {
        sub_100007C78((uint64_t)"volume freeze notification", a2, a3, a4, a5, a6, a7, a8);
        int v9 = dword_100020720;
      }

      dword_100020720 = v9 + 1;
      uint64_t v10 = "received volume freeze notification";
      goto LABEL_16;
    case 0xE0084007:
      if (!--dword_100020720) {
        sub_100007CB0((uint64_t)"volume unfreeze notification", a2, a3, a4, a5, a6, a7, a8, v18);
      }
      uint64_t v10 = "received volume unfreeze complete notification";
      goto LABEL_16;
    case 0xE008400A:
      if ((byte_100020724 & 1) != 0)
      {
        uint64_t v10 = "duplicated volume transcribe start notification!";
        goto LABEL_18;
      }

      byte_100020724 = 1;
      sub_100007C78((uint64_t)"volume transcribe start notification", a2, a3, a4, a5, a6, a7, a8);
      uint64_t v10 = "received volume transcribe start notification";
LABEL_16:
      int v17 = 0;
      goto LABEL_19;
    case 0xE008400B:
      if (byte_100020724 == 1)
      {
        byte_100020724 = 0;
        sub_100007CB0((uint64_t)"volume transcribe stop notification", a2, a3, a4, a5, a6, a7, a8, v18);
        if (qword_100020718)
        {
          if (APFSVolumeNeedsCryptoMigration(qword_100020718, &v20))
          {
            sub_10000C470( 2,  "Cannot determine whether crypto migration for %s is needed with error %d",  v11,  v12,  v13,  v14,  v15,  v16,  qword_100020718);
          }

          else if (!v20)
          {
            sub_10000C470(0, "crypto migration finished", v11, v12, v13, v14, v15, v16, v19);
            sub_100007A84(v20);
          }
        }

        sub_10000C470(0, "received volume transcribe stop notification", v11, v12, v13, v14, v15, v16, v19);
      }

      else
      {
        uint64_t v10 = "duplicated volume transcribe stop notification!";
LABEL_18:
        int v17 = 2;
LABEL_19:
        sub_10000C470(v17, v10, a3, a4, a5, a6, a7, a8, a9);
      }

      return;
    default:
      sub_10000C470(0, "ignoring interest notification of type: %u", a3, a4, a5, a6, a7, a8, a3);
      return;
  }

void sub_1000053C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char *v34;
  int v9 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v9);
  if (!MatchingService)
  {
    sub_10000C85C(2, "failed to discover watchdog KEXT service", v11, v12, v13, v14, v15, v16, v32);
    if (sub_1000081E0())
    {
      sub_10000C85C( 0,  "detected virtual machine environment and no watchdog KEXT found, exiting...",  v26,  v27,  v28,  v29,  v30,  v31,  v33);
      sub_100007CEC();
    }

    sub_10000D894();
  }

  io_object_t v17 = MatchingService;
  char v18 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_100020728);
  IOObjectRelease(v17);
  if (v18) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = dword_100020728 == 0;
  }
  if (v25) {
    sub_10000D8AC(&v34, v18);
  }
  sub_10000C470(0, "connected to watchdog KEXT", v19, v20, v21, v22, v23, v24, a9);
}

BOOL sub_1000054AC()
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100020728, 0, 0LL, 0, &output, &outputCnt);
  if ((_DWORD)v0) {
    sub_10000D8F4(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return output != 0;
}

BOOL sub_100005504()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100020728, 5u, 0LL, 0, &output, &outputCnt);
  if (v0) {
    sub_10000D920(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return output != 0;
}

void sub_10000555C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v9 = IOConnectCallScalarMethod(dword_100020728, 1u, 0LL, 0, 0LL, 0LL);
  if (v9) {
    sub_10000D950(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  sub_10000C470(1, "checked in with KEXT", v11, v12, v13, v14, v15, v16, a9);
}

void sub_1000055A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = IOConnectCallScalarMethod(dword_100020728, 3u, 0LL, 0, 0LL, 0LL);
  if ((_DWORD)v9) {
    sub_10000D980(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  sub_10000C470(0, "called into KEXT to disable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_1000055E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = IOConnectCallScalarMethod(dword_100020728, 4u, 0LL, 0, 0LL, 0LL);
  if ((_DWORD)v9) {
    sub_10000D9AC(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  sub_10000C470(0, "called into KEXT to re-enable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_100005620(const char *a1)
{
  char v1 = IOConnectCallStructMethod(dword_100020728, 2u, __str, 0x800uLL, 0LL, 0LL);
  sub_10000C470(2, "IOConnectCallStructMethod returned 0x%x", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("watchdogd failed to panic device");
  __break(1u);
}

uint64_t sub_10000568C(_BYTE *a1)
{
  __int16 outputStruct = 0;
  size_t v11 = 2LL;
  if (!a1) {
    sub_10000D838();
  }
  uint64_t v2 = IOConnectCallStructMethod(dword_100020728, 9u, 0LL, 0LL, &outputStruct, &v11);
  if ((_DWORD)v2) {
    sub_10000D9D8(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  *a1 = HIBYTE(outputStruct);
  return outputStruct;
}

void sub_1000056F8()
{
  char v0 = IOConnectCallScalarMethod(dword_100020728, 6u, 0LL, 0, 0LL, 0LL);
  sub_10000C85C(2, "Failed to call kIOWatchdogDaemonTestCPUHang method, returned : %d", v1, v2, v3, v4, v5, v6, v0);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestCPUHang, ...) failed");
  __break(1u);
}

uint64_t sub_100005748(uint64_t a1)
{
  uint64_t input = a1;
  uint64_t result = IOConnectCallScalarMethod(dword_100020728, 7u, &input, 1u, 0LL, 0LL);
  if (input) {
    sub_10000DA30(result, v2, v3, v4, v5, v6, v7, v8);
  }
  if ((_DWORD)result) {
    sub_10000DA04(result, v2, v3, v4, v5, v6, v7, v8);
  }
  return result;
}

uint64_t sub_100005798()
{
  uint64_t result = IOConnectCallScalarMethod(dword_100020728, 8u, 0LL, 0, 0LL, 0LL);
  if ((_DWORD)result) {
    sub_10000DA5C(result, v1, v2, v3, v4, v5, v6, v7);
  }
  return result;
}

void sub_1000057D0( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

id sub_1000057D8()
{
  if (qword_100020748 != -1) {
    dispatch_once(&qword_100020748, &stru_100014AD0);
  }
  return (id)qword_100020740;
}

void sub_100005818(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.watchdogd.service_diagnostics", v4);
  uint64_t v3 = (void *)qword_100020740;
  qword_100020740 = (uint64_t)v2;

  if (!qword_100020740) {
    sub_10000D51C();
  }
}

id sub_10000587C(int a1)
{
  qword_100020750 = (uint64_t)calloc(a1, 0x1D0uLL);
  if (!qword_100020750) {
    sub_10000D51C();
  }
  qword_100020758 = (uint64_t)calloc(2uLL, 0x10uLL);
  if (!qword_100020758) {
    sub_10000D51C();
  }
  dword_100020760 = a1;
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.watchdogd.enhanced_diags", 0LL);
    uint64_t v3 = (void *)qword_100020730;
    qword_100020730 = (uint64_t)v2;

    dispatch_group_t v4 = dispatch_group_create();
    uint64_t v5 = (void *)qword_100020738;
    qword_100020738 = (uint64_t)v4;
  }

  id v6 = (id)objc_opt_self(&OBJC_CLASS___NSObject);
  id v7 = (id)objc_opt_self(&OBJC_CLASS___NSString);
  id v8 = (id)objc_opt_self(&OBJC_CLASS___NSNumber);
  id v9 = (id)objc_opt_self(&OBJC_CLASS___NSUUID);
  id v10 = (id)objc_opt_self(&OBJC_CLASS___NSDictionary);
  id v11 = (id)objc_opt_self(&OBJC_CLASS___NSMutableData);
  id v12 = (id)objc_opt_self(&OBJC_CLASS___OSLaunchdJob);
  id v13 = (id)objc_opt_self(&OBJC_CLASS___OSLaunchdDomain);
  id v14 = (id)objc_opt_self(&OBJC_CLASS___OSLaunchdJobInfo);
  id v15 = (id)objc_opt_self(&OBJC_CLASS___OSLaunchdJobExitStatus);
  id v16 = (id)objc_opt_self(&OBJC_CLASS___NSObject);
  id v17 = (id)objc_opt_self(&OBJC_CLASS___NSObject);
  return (id)objc_opt_self(&OBJC_CLASS___NSObject);
}

uint64_t sub_100005A14(int a1)
{
  char v1 = a1;
  if (proc_pidinfo(a1, 13, 0LL, buffer, 64) == 64) {
    return (buffer[32] >> 1) & 1;
  }
  uint64_t v3 = __error();
  strerror(*v3);
  sub_10000C470(2, "failed to get PROC_PIDT_SHORTBSDINFO on pid %d with error: %s", v4, v5, v6, v7, v8, v9, v1);
  return 0LL;
}

uint64_t sub_100005AB0(uint64_t a1, char **a2)
{
  char v3 = a1;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  if (!v4) {
    sub_10000D51C();
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain currentDomain](&OBJC_CLASS___OSLaunchdDomain, "currentDomain"));
  id v7 = +[OSLaunchdJob copyJobWithLabel:domain:](&OBJC_CLASS___OSLaunchdJob, "copyJobWithLabel:domain:", v5, v6);

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 getCurrentJobInfo]);
    uint64_t v21 = v14;
    if (!v14)
    {
      sub_10000C470(2, "failed to get service info for launchd service %s", v15, v16, v17, v18, v19, v20, v3);
      if (a2) {
        asprintf(a2, "appears to have been unloaded");
      }
      goto LABEL_33;
    }

    if (!a2) {
      goto LABEL_29;
    }
    if ([v14 state] != (id)4 && objc_msgSend(v21, "state") != (id)2)
    {
      if ([v21 state] == (id)3)
      {
        [v21 lastSpawnError];
        strerror((int)[v21 lastSpawnError]);
        asprintf(a2, "failed to spawn with error %d (%s)");
      }

      else if ([v21 state] == (id)1)
      {
        asprintf(a2, "has not run since boot / load");
      }

      goto LABEL_29;
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lastExitStatus]);

    if (!v22)
    {
      if ([v21 state] != (id)2) {
        sub_10000D51C();
      }
      asprintf(a2, "has not exited since first loaded");
      goto LABEL_29;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 lastExitStatus]);
    id v24 = objc_msgSend(v23, "os_reason_namespace");

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 lastExitStatus]);
    unsigned __int8 v26 = [v25 wait4Status];

    if (!(_DWORD)v24)
    {
      if ((v26 & 0x7F) == 0) {
        asprintf(a2, "last exited with exit status : %d");
      }
      goto LABEL_29;
    }

    if ((_DWORD)v24 == 20)
    {
LABEL_29:
      if ([v21 state] == (id)2)
      {
        uint64_t v32 = (uint64_t)[v21 pid];
        goto LABEL_34;
      }

      [v21 state];
      sub_10000C470( 2,  "failed to get PID for launchd service %s, current OSLaunchdJobState is %d",  v36,  v37,  v38,  v39,  v40,  v41,  v3);
LABEL_33:
      uint64_t v32 = 0xFFFFFFFFLL;
LABEL_34:

      goto LABEL_35;
    }

    v43[0] = &off_1000159C0;
    v43[1] = &off_1000159D8;
    v44[0] = @"JETSAM";
    v44[1] = @"SIGNAL";
    v43[2] = &off_1000159F0;
    v43[3] = &off_100015A08;
    v44[2] = @"CODESIGNING";
    v44[3] = @"HANGTRACER";
    v43[4] = &off_100015A20;
    v43[5] = &off_100015A38;
    v44[4] = @"TEST";
    v44[5] = @"DYLD";
    v43[6] = &off_100015A50;
    v43[7] = &off_100015A68;
    v44[6] = @"LIBXPC";
    v44[7] = @"OBJC";
    v43[8] = &off_100015A80;
    v43[9] = &off_100015A98;
    v44[8] = @"EXEC";
    v44[9] = @"FRONTBOARD";
    v43[10] = &off_100015AB0;
    v43[11] = &off_100015AC8;
    v44[10] = @"TCC";
    v44[11] = @"REPORTCRASH";
    v43[12] = &off_100015AE0;
    v43[13] = &off_100015AF8;
    v44[12] = @"COREANIMATION";
    v44[13] = @"AGGREGATED";
    v43[14] = &off_100015B10;
    v43[15] = &off_100015B28;
    v44[14] = @"RUNNINGBOARD";
    v44[15] = @"SKYWALK";
    v43[16] = &off_100015B40;
    v43[17] = &off_100015B58;
    v44[16] = @"SETTINGS";
    v44[17] = @"LIBSYSTEM";
    v43[18] = &off_100015B70;
    v43[19] = &off_100015B88;
    v44[18] = @"FOUNDATION";
    v44[19] = @"WATCHDOG";
    v43[20] = &off_100015BA0;
    v43[21] = &off_100015BB8;
    v44[20] = @"METAL";
    v44[21] = @"WATCHKIT";
    v43[22] = &off_100015BD0;
    v43[23] = &off_100015BE8;
    v44[22] = @"GUARD";
    v44[23] = @"ANALYTICS";
    v43[24] = &off_100015C00;
    v43[25] = &off_100015C18;
    v44[24] = @"SANDBOX";
    v44[25] = @"SECURITY";
    v43[26] = &off_100015C30;
    v43[27] = &off_100015C48;
    v44[26] = @"ENDPOINTSECURITY";
    v44[27] = @"PAC_EXCEPTION";
    v43[28] = &off_100015C60;
    v43[29] = &off_100015C78;
    v44[28] = @"BLUETOOTH_CHIP";
    v44[29] = @"PORT_SPACE";
    v43[30] = &off_100015C90;
    v43[31] = &off_100015CA8;
    v44[30] = @"WEBKIT";
    v44[31] = @"BACKLIGHTSERVICES";
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  32LL));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v24));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v28]);

    if (v29)
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v24));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v30]);

      if (v31)
      {
LABEL_28:
        id v33 = v31;
        mach_error_t v34 = (const char *)[v33 UTF8String];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v21 lastExitStatus]);
        asprintf(a2, "last exited with reason namespace: %s, code %llu", v34, objc_msgSend(v35, "os_reason_code"));

        goto LABEL_29;
      }
    }

    else
    {
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v24));
    goto LABEL_28;
  }

  sub_10000C470(2, "did not find a launchd service %s", v8, v9, v10, v11, v12, v13, v3);
  if (a2) {
    asprintf(a2, "appears to not exist in launchd");
  }
  uint64_t v32 = 0xFFFFFFFFLL;
LABEL_35:

  return v32;
}

uint64_t sub_1000060E0()
{
  if (!pthread_getspecific(qword_100020E38)) {
    sub_10000D51C();
  }
  uint64_t v0 = 0LL;
  char v1 = 1;
  while (2)
  {
    char v2 = v1;
    char v3 = (unsigned __int8 *)(qword_100020758 + 16 * v0 + 8);
    while (!__ldaxr(v3))
    {
      if (!__stlxr(1u, v3))
      {
        if ((byte_100020764 & 1) == 0)
        {
          pid_t v6 = getpid();
          proc_set_dirty(v6, 1);
          byte_100020764 = 1;
        }

        return qword_100020758 + 16 * v0;
      }
    }

    char v1 = 0;
    __clrex();
    uint64_t v0 = 1LL;
    if ((v2 & 1) != 0) {
      continue;
    }
    break;
  }

  return 0LL;
}

unsigned __int8 *sub_10000618C(unsigned __int8 *result)
{
  if (result)
  {
    char v1 = result;
    uint64_t result = (unsigned __int8 *)stackshot_config_dealloc(*(void *)result);
    *(void *)char v1 = 0LL;
    atomic_store(0, v1 + 8);
  }

  return result;
}

void *sub_1000061BC()
{
  uint64_t result = pthread_getspecific(qword_100020E38);
  if (!result) {
    sub_10000D51C();
  }
  if (byte_100020764 == 1)
  {
    uint64_t v1 = 0LL;
    for (char i = 1; ; char i = 0)
    {
      char v3 = i;
      unsigned __int8 v4 = atomic_load((unsigned __int8 *)(qword_100020758 + 16 * v1 + 8));
      if ((v4 & 1) != 0) {
        break;
      }
      uint64_t v1 = 1LL;
      if ((v3 & 1) == 0)
      {
        pid_t v5 = getpid();
        uint64_t result = (void *)proc_set_dirty(v5, 0);
        byte_100020764 = 0;
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_10000623C(uint64_t *a1)
{
  if (!a1) {
    sub_10000D51C();
  }
  uint64_t v2 = stackshot_config_create();
  if (!v2) {
    sub_10000D51C();
  }
  uint64_t v3 = v2;
  int v4 = -6;
  while (1)
  {
    int v5 = stackshot_capture_with_config(v3);
    char v12 = v5;
    if (v5 != 16 && v5 != 60) {
      break;
    }
    if (__CFADD__(v4++, 1))
    {
      strerror(v5);
      sub_10000C470(2, "failed to capture stackshot, syscall returned %d (%s)", v14, v15, v16, v17, v18, v19, v12);
      goto LABEL_13;
    }
  }

  if (!v5)
  {
    char stackshot_size = stackshot_config_get_stackshot_size(v3);
    sub_10000C470(0, "watchdog captured stackshot (%u bytes)", v27, v28, v29, v30, v31, v32, stackshot_size);
    *a1 = v3;
    return 1LL;
  }

  sub_10000C470(2, "failed to capture stackshot, syscall returned %d", v6, v7, v8, v9, v10, v11, v5);
LABEL_13:
  *a1 = 0LL;
  sub_10000C470(2, "failed to capture stackshot", v20, v21, v22, v23, v24, v25, v34);
  return 0LL;
}

void sub_10000632C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  sub_10000C470(0, "writing diagnostics for %d services", a3, a4, a5, a6, a7, a8, a3);
  if (!a1) {
    sub_10000D51C();
  }
  if (dword_100020760 < v8) {
    sub_10000D51C();
  }
  if (v8 <= 0)
  {
    dword_100020768 = v8;
  }

  else
  {
    uint64_t v11 = 0LL;
    char v12 = (const unsigned __int8 *)(a2 + 48);
    do
    {
      uint64_t v13 = qword_100020750 + v11;
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      *(_OWORD *)(v13 + 48) = 0u;
      *(_OWORD *)(v13 + 64) = 0u;
      *(_OWORD *)(v13 + 80) = 0u;
      *(_OWORD *)(v13 + 96) = 0u;
      *(_OWORD *)(v13 + 112) = 0u;
      *(_OWORD *)(v13 + 128) = 0u;
      *(_OWORD *)(v13 + 144) = 0u;
      *(_OWORD *)(v13 + 160) = 0u;
      *(_OWORD *)(v13 + 176) = 0u;
      *(_OWORD *)(v13 + 192) = 0u;
      *(_OWORD *)(v13 + 208) = 0u;
      *(_OWORD *)(v13 + 224) = 0u;
      *(_OWORD *)(v13 + 240) = 0u;
      *(_OWORD *)(v13 + 256) = 0u;
      *(_OWORD *)(v13 + 272) = 0u;
      *(_OWORD *)(v13 + 288) = 0u;
      *(_OWORD *)(v13 + 304) = 0u;
      *(_OWORD *)(v13 + 320) = 0u;
      *(_OWORD *)(v13 + 336) = 0u;
      *(_OWORD *)(v13 + 352) = 0u;
      *(_OWORD *)(v13 + 368) = 0u;
      *(_OWORD *)(v13 + 384) = 0u;
      *(_OWORD *)(v13 + 400) = 0u;
      *(_OWORD *)(v13 + 416) = 0u;
      *(_OWORD *)(v13 + 432) = 0u;
      *(_OWORD *)(v13 + 448) = 0u;
      *(_OWORD *)uint64_t v13 = *((_OWORD *)v12 - 3);
      uint64_t v14 = (_BYTE *)*((void *)v12 - 3);
      *(void *)(v13 + 16) = *((void *)v12 - 4);
      *(void *)(v13 + 432) = *((void *)v12 - 2);
      if (*v14) {
        __strlcpy_chk(v13 + 32);
      }
      uuid_copy((unsigned __int8 *)(v13 + 444), v12);
      v12 += 64;
      v11 += 464LL;
    }

    while (464LL * v8 != v11);
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    dword_100020768 = v8;
    do
    {
      uint64_t v17 = qword_100020750 + v15;
      int v18 = sub_100005AB0(*(void *)(qword_100020750 + v15), (char **)(qword_100020750 + v15 + 24));
      if (v18 >= 1) {
        *(_DWORD *)(v17 + 440) = v18;
      }
      ++v16;
      v15 += 464LL;
    }

    while (v16 < dword_100020768);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006508;
  block[3] = &unk_100014AF0;
  block[4] = a1;
  block[5] = mach_absolute_time();
  dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  id v20 = sub_1000057D8();
  uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
  dispatch_async(v21, v19);
}

void sub_100006508(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (dword_100020768 >= 1)
  {
    double v3 = Current;
    uint64_t v4 = 0LL;
    uint64_t v5 = 444LL;
    uint64_t v30 = a1;
    do
    {
      uint64_t v6 = objc_autoreleasePoolPush();
      uint64_t v7 = qword_100020750;
      uint64_t v8 = qword_100020750 + v5;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"(%d monitored services unresponsive): %s",  dword_100020768,  qword_100020750 + v5 - 412));
      uint64_t v10 = v9;
      uint64_t v11 = (void **)(v8 - 420);
      if (*(void *)(v8 - 420))
      {
        objc_msgSend(v9, "appendFormat:", @", %s", *(void *)(v8 - 420));
        free(*v11);
        *uint64_t v11 = 0LL;
      }

      if (*(int *)(v8 - 4) < 1)
      {
        id v19 = objc_alloc(&OBJC_CLASS___OSAStackShotReport);
        id v20 = (const unsigned __int8 *)(v7 + v5);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(v20 - 436)));
        id v17 = [v19 initWithName:v21 reason:v10 exceptionCode:v20 - 12 exceptionCodeCount:1];

        else {
          int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
        }
        uint64_t v22 = v6;
        uuid_unparse(v20, out);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
        [v17 setIncidentID:v27];

        a1 = v30;
        uint64_t stackshot_buffer = stackshot_config_get_stackshot_buffer(**(void **)(v30 + 32));
        uint64_t stackshot_size = stackshot_config_get_stackshot_size(**(void **)(v30 + 32));
        if (!v18)
        {
LABEL_17:
          [v17 useStackshotBuffer:stackshot_buffer size:stackshot_size frontmostPids:&__NSArray0__struct atTime:*(void *)(a1 + 40) machTime:0xFFFFFFFFLL sequence:v3];
          goto LABEL_18;
        }

        id v33 = v18;
        unsigned __int8 v26 = &v33;
      }

      else
      {
        int v32 = 0;
        __int128 v31 = xmmword_10000F220;
        id v12 = objc_alloc(&OBJC_CLASS___OSACrackShotReport);
        uint64_t v13 = *(unsigned int *)(v8 - 4);
        uint64_t v14 = (const unsigned __int8 *)(v7 + v5);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(v14 - 436)));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(v14 - 428)));
        id v17 = [v12 initWithPid:v13 procName:v15 bundleID:v16 exitSnapshot:&v31 reason:v10];

        else {
          int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
        }
        uint64_t v22 = v6;
        uuid_unparse(v14, out);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
        [v17 setIncidentID:v23];

        a1 = v30;
        uint64_t stackshot_buffer = stackshot_config_get_stackshot_buffer(**(void **)(v30 + 32));
        uint64_t stackshot_size = stackshot_config_get_stackshot_size(**(void **)(v30 + 32));
        if (!v18) {
          goto LABEL_17;
        }
        char v34 = v18;
        unsigned __int8 v26 = &v34;
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 1LL));
      [v17 useStackshotBuffer:stackshot_buffer size:stackshot_size frontmostPids:v28 atTime:*(void *)(a1 + 40) machTime:0xFFFFFFFFLL sequence:v3];

LABEL_18:
      [v17 saveWithOptions:0];

      objc_autoreleasePoolPop(v22);
      ++v4;
      v5 += 464LL;
    }

    while (v4 < dword_100020768);
  }

  uint64_t v29 = *(void *)(a1 + 32);
  if (v29)
  {
    stackshot_config_dealloc(*(void *)v29);
    *(void *)uint64_t v29 = 0LL;
    atomic_store(0, (unsigned __int8 *)(v29 + 8));
  }

  sync();
}

uint64_t sub_1000068D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)sub_100005AB0(a1, 0LL) <= 0)
  {
    sub_10000C470(2, "failed to discover PID for job %s", v9, v10, v11, v12, v13, v14, a1);
    return 0LL;
  }

  uint64_t v15 = 1LL;
  if (terminate_with_reason())
  {
    uint64_t v16 = __error();
    strerror(*v16);
    sub_10000C470( 2,  "failed to terminate service %s, terminate_with_reason() returned %d (%s)",  v17,  v18,  v19,  v20,  v21,  v22,  a1);
    return 0LL;
  }

  return v15;
}

uint64_t sub_100006990( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  do
  {
    if (__ldaxr(byte_100020DD0))
    {
      uint64_t v9 = 0LL;
      __clrex();
      sub_10000C470( 2,  "skipping collecting enhanced diagnostics because outstanding diagnostics still in progress",  a3,  a4,  a5,  a6,  a7,  a8,  v11);
      return v9;
    }

    uint64_t v9 = 1LL;
  }

  while (__stlxr(1u, byte_100020DD0));
  if (!qword_100020738) {
    sub_10000D51C();
  }
  gettimeofday((timeval *)qword_100020DD8, 0LL);
  return v9;
}

void sub_100006A0C()
{
}

void sub_100006A28(id a1)
{
}

void sub_100006A48(uint64_t a1, int a2, void *a3)
{
  id v26 = a3;
  char v11 = &_DRSubmitLog;
  if (&_DRSubmitLog) {
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  else {
    uint64_t v27 = 0LL;
  }
  xmmword_10002084C = 0u;
  unk_10002085C = 0u;
  xmmword_10002082C = 0u;
  unk_10002083C = 0u;
  xmmword_10002080C = 0u;
  unk_10002081C = 0u;
  xmmword_1000207EC = 0u;
  unk_1000207FC = 0u;
  xmmword_1000207CC = 0u;
  unk_1000207DC = 0u;
  xmmword_1000207AC = 0u;
  unk_1000207BC = 0u;
  xmmword_10002078C = 0u;
  unk_10002079C = 0u;
  xmmword_10002076C = 0u;
  unk_10002077C = 0u;
  if (a2 >= 1)
  {
    int v12 = 0;
    uint64_t v13 = a2;
    uint64_t v14 = (const unsigned __int8 *)(a1 + 8);
    uint64_t v15 = ", %s";
    do
    {
      uint64_t v16 = (char *)&xmmword_10002076C + v12;
      size_t v17 = 256LL - v12;
      if (v12) {
        int v18 = snprintf(v16, v17, v15, *((void *)v14 - 1));
      }
      else {
        int v18 = snprintf(v16, v17, "%s");
      }
      if (v18 + v12 >= 256) {
        int v12 = 256;
      }
      else {
        v12 += v18;
      }
      if (v11)
      {
        uuid_unparse(v14, out);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
        uint64_t v20 = v15;
        uint64_t v21 = v11;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *((void *)v14 - 1)));
        -[NSMutableDictionary setValue:forKey:](v27, "setValue:forKey:", v19, v22);

        char v11 = v21;
        uint64_t v15 = v20;
      }

      v14 += 24;
      --v13;
    }

    while (v13);
  }

  sub_10000C470(0, "attempting to dump tailspin for: %s", v5, v6, v7, v8, v9, v10, (char)&xmmword_10002076C);
  dispatch_group_enter((dispatch_group_t)qword_100020738);
  uint64_t v23 = (dispatch_queue_s *)qword_100020730;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006C68;
  block[3] = &unk_100014B38;
  id v30 = v26;
  __int128 v31 = &xmmword_10002076C;
  uint64_t v29 = v27;
  uint64_t v24 = v27;
  id v25 = v26;
  dispatch_async(v23, block);
}

void sub_100006C68(uint64_t a1)
{
  if (!&_tailspin_dump_output_with_options_sync)
  {
    uint64_t v8 = "Tailspin SPI not found";
LABEL_8:
    sub_10000C470(2, v8, v2, v3, v4, v5, v6, v7, (char)v83);
    return;
  }

  uint64_t v9 = open(v98, 2562, 416LL);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v40 = __error();
    uint64_t v83 = v98;
    strerror(*v40);
    uint64_t v8 = "Could not create file, skip tailspin: %s %s";
    goto LABEL_8;
  }

  uint64_t v10 = v9;
  v97[0] = &__kCFBooleanFalse;
  v96[0] = UnsafePointer;
  v96[1] = UnsafePointer;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
  v97[1] = v11;
  v96[2] = UnsafePointer;
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", &_DRSubmitLog != 0LL));
  v97[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v97,  v96,  3LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));

  LOBYTE(v11) = tailspin_dump_output_with_options_sync(v10, v14);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ((v11 & 1) != 0)
  {
    close(v10);
    sub_10000C470(0, "%s created successfully", v21, v22, v23, v24, v25, v26, (char)v98);
    v91[0] = xmmword_10000F200;
    v91[1] = xmmword_10000F210;
    __uint64_t v92 = clock_gettime_nsec_np(_CLOCK_REALTIME) + 604800000000000LL;
    uint64_t v93 = 0LL;
    if (fsctl(v98, 0xC0304A6FuLL, v91, 0))
    {
      id v33 = __error();
      strerror(*v33);
      sub_10000C470(2, "Failed to mark %s as purgeable due to %s", v34, v35, v36, v37, v38, v39, (char)v98);
    }

    else
    {
      sub_10000C470(0, "Mark %s as purgeable succeeds", v27, v28, v29, v30, v31, v32, (char)v98);
    }

    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v94[0] = NSFileOwnerAccountName;
    v94[1] = NSFileGroupOwnerAccountName;
    v95[0] = @"root";
    v95[1] = @"_analyticsusers";
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  2LL));
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v98));
    id v89 = 0LL;
    [v52 setAttributes:v53 ofItemAtPath:v54 error:&v89];
    id v44 = v89;

    if (!v44)
    {
      if (&_DRSubmitLog)
      {
        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 48)));
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
        uint64_t v69 = *(void *)(a1 + 32);
        size_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v98));
        id v88 = 0LL;
        DRSubmitLog(@"com.apple.watchdogd", v67, v68, v69, @"Tailspin", v70, 0LL, &v88);
        id v44 = v88;

        if (v44)
        {
          id v45 = objc_claimAutoreleasedReturnValue([v44 localizedDescription]);
          char v87 = [v45 UTF8String];
          sub_10000C470(2, "DRSubmitLog: %s", v77, v78, v79, v80, v81, v82, v87);
          goto LABEL_14;
        }

        sub_10000C470(0, "submitted %s to DiagnosticPipeline", v71, v72, v73, v74, v75, v76, (char)v98);
        if ((sub_1000083DC() & 1) == 0) {
          sub_1000071E8();
        }
        dispatch_group_leave((dispatch_group_t)qword_100020738);
      }

      else
      {
        sub_10000C470(0, "DRSubmitLog is not available", v55, v56, v57, v58, v59, v60, v84);
      }

      id v44 = 0LL;
      goto LABEL_15;
    }

    id v45 = objc_claimAutoreleasedReturnValue([v44 localizedDescription]);
    char v86 = [v45 UTF8String];
    sub_10000C470(2, "setAttributes: %s", v61, v62, v63, v64, v65, v66, v86);
LABEL_14:

    goto LABEL_15;
  }

  sub_10000C470(2, "Failed to save tailspin to file: %s", v15, v16, v17, v18, v19, v20, (char)v98);
  close(v10);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v98));
  id v90 = 0LL;
  unsigned __int8 v43 = [v41 removeItemAtPath:v42 error:&v90];
  id v44 = v90;

  if ((v43 & 1) == 0)
  {
    id v45 = objc_claimAutoreleasedReturnValue([v44 localizedDescription]);
    char v85 = [v45 UTF8String];
    sub_10000C470(2, "Cannot remove failed tailspin: %s", v46, v47, v48, v49, v50, v51, v85);
    goto LABEL_14;
  }

LABEL_15:
}

uint64_t sub_100007180(char *a1)
{
  return snprintf( a1,  0x80uLL,  "%d-%02d-%02d.%02d.%02d.%02d",  v3.tm_year + 1900,  v3.tm_mon + 1,  v3.tm_mday,  v3.tm_hour,  v3.tm_min,  v3.tm_sec);
}

void sub_1000071E8()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 components:16 fromDate:qword_100020870 toDate:v0 options:0]);

  if ((uint64_t)[v2 day] >= 7)
  {
    id v59 = v0;
    sub_10000C470( 0,  "Prune the old tailspins in %s",  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/var/mobile/Library/Logs/CrashReporter");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
    v69[0] = NSURLNameKey;
    v69[1] = NSURLIsDirectoryKey;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
    int v12 = (void *)objc_claimAutoreleasedReturnValue( [v9 enumeratorAtURL:v10 includingPropertiesForKeys:v11 options:4 errorHandler:0]);

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v65;
      uint64_t v60 = *(void *)v65;
      do
      {
        uint64_t v16 = 0LL;
        id v61 = v14;
        do
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
          if ([v18 containsString:@".tailspin"])
          {
            id v19 = v18;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
            if (![v20 containsString:@".tailspin"]
              || (uint64_t v21 = (char *)[v19 rangeOfString:@".tailspin"],
                  v21 == (char *)0x7FFFFFFFFFFFFFFFLL))
            {
              sub_10000D51C();
            }

            uint64_t v22 = v21;
            uint64_t v23 = 0LL;
            do
            {
              uint64_t v24 = v23;
              unsigned int v25 = objc_msgSend(v20, "characterAtIndex:");
              uint64_t v23 = v24 + 1;
            }

            while (v22 != v24 && v25 != 45);
            if (v22 + 1 == v23)
            {
              char v26 = [v20 UTF8String];
              sub_10000C470(2, "unable to parse date from filename %s, skipping", v27, v28, v29, v30, v31, v32, v26);
              id v33 = 0LL;
            }

            else
            {
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v23, v22 - v23));
              uint64_t v35 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
              uint64_t v36 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
              -[NSDateFormatter setLocale:](v35, "setLocale:", v36);
              -[NSDateFormatter setDateFormat:](v35, "setDateFormat:", @"yyyy-MM-dd.HH.mm.ss");
              id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v35, "dateFromString:", v34));

              uint64_t v15 = v60;
            }

            if (v33)
            {
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 components:16 fromDate:v33 toDate:v59 options:0]);

              if ((uint64_t)[v38 day] >= 8)
              {
                id v39 = objc_claimAutoreleasedReturnValue([v17 absoluteString]);
                char v40 = [v39 UTF8String];
                sub_10000C470( 0,  "Deleting old tailspin %s that was generated %ld days ago",  v41,  v42,  v43,  v44,  v45,  v46,  v40);

                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                id v63 = 0LL;
                unsigned __int8 v48 = [v47 removeItemAtURL:v17 error:&v63];
                id v49 = v63;

                if ((v48 & 1) == 0)
                {
                  id v50 = objc_claimAutoreleasedReturnValue([v17 absoluteString]);
                  char v51 = [v50 UTF8String];
                  id v52 = objc_claimAutoreleasedReturnValue([v49 localizedDescription]);
                  [v52 UTF8String];
                  sub_10000C470(2, "Failed to delete old tailspin %s, error:%s", v53, v54, v55, v56, v57, v58, v51);
                }

                uint64_t v15 = v60;
              }
            }

            else
            {
              uint64_t v38 = v2;
            }

            uint64_t v2 = v38;
            id v14 = v61;
          }

          uint64_t v16 = (char *)v16 + 1;
        }

        while (v16 != v14);
        id v14 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      }

      while (v14);
    }

    uint64_t v0 = v59;
    objc_storeStrong((id *)&qword_100020870, v59);
  }
}

void sub_100007694(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007704;
  block[3] = &unk_100014B58;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_100020730, block);
}

void sub_100007704(uint64_t a1)
{
  __argv[0] = "ddt";
  __argv[1] = "--no-ports";
  uint64_t v2 = *(char **)(a1 + 32);
  __argv[2] = "--no-kevents";
  __argv[3] = v2;
  __argv[4] = "-o";
  __argv[5] = __str;
  __argv[6] = 0LL;
  *(_OWORD *)__envp = off_100014B78;
  int v3 = posix_spawnattr_init(&v54);
  if (v3) {
    sub_10000DAA0(v3);
  }
  int v4 = posix_spawnattr_setflags(&v54, 16396);
  if (v4) {
    sub_10000DAA0(v4);
  }
  int v5 = posix_spawnattr_setprocesstype_np(&v54, 1024LL);
  if (v5) {
    sub_10000DAA0(v5);
  }
  sigset_t v53 = 0;
  int v6 = posix_spawnattr_setsigmask(&v54, &v53);
  if (v6) {
    sub_10000DAA0(v6);
  }
  sigset_t v52 = -1;
  int v7 = posix_spawnattr_setsigdefault(&v54, &v52);
  if (v7) {
    sub_10000DAA0(v7);
  }
  if (posix_spawn_file_actions_init(&v51) == -1) {
    sub_10000DA88();
  }
  if (posix_spawn_file_actions_addopen(&v51, 1, "/dev/console", 131073, 0) == -1) {
    sub_10000DA88();
  }
  if (posix_spawn_file_actions_addopen(&v51, 2, "/dev/console", 131073, 0) == -1) {
    sub_10000DA88();
  }
  if (posix_spawn_file_actions_addopen(&v51, 0, "/dev/null", 0, 0) == -1) {
    sub_10000DA88();
  }
  pid_t v50 = 0;
  int v8 = posix_spawn(&v50, "/usr/local/bin/ddt", &v51, &v54, __argv, __envp);
  posix_spawn_file_actions_destroy(&v51);
  posix_spawnattr_destroy(&v54);
  if (v8)
  {
    strerror(v8);
    sub_10000C470(2, "failed to spawn %s with error: %s", v15, v16, v17, v18, v19, v20, (char)"/usr/local/bin/ddt");
    goto LABEL_12;
  }

  sub_10000C470(0, "%s spawned as %d", v9, v10, v11, v12, v13, v14, (char)"/usr/local/bin/ddt");
  int v49 = 0;
  pid_t v21 = waitpid(v50, &v49, 0);
  if (v21 != -1)
  {
LABEL_16:
    if (v21 != v50)
    {
      sub_10000C470( 2,  "waitpid on %s with PID %d returned %d",  v22,  v23,  v24,  v25,  v26,  v27,  (char)"/usr/local/bin/ddt");
      goto LABEL_12;
    }

    if ((v49 & 0x7F) != 0)
    {
      uint64_t v34 = "%s : did not exit? status : %d";
    }

    else
    {
      if (!BYTE1(v49))
      {
        sub_10000C470( 0,  "%s: exited with status %d, saved at %s",  v22,  v23,  v24,  v25,  v26,  v27,  (char)"/usr/local/bin/ddt");
        goto LABEL_24;
      }

      uint64_t v34 = "%s: exited with status %d";
    }

    sub_10000C470(2, v34, v22, v23, v24, v25, v26, v27, (char)"/usr/local/bin/ddt");
LABEL_24:
    int v42 = v49 & 0x7F;
    if ((v49 & 0x7F) != 0 && v42 != 127)
    {
      strsignal(v42);
      sub_10000C470(2, "%s: exited due to signal %s", v43, v44, v45, v46, v47, v48, (char)"/usr/local/bin/ddt");
    }

    goto LABEL_12;
  }

  while (*__error() == 4)
  {
    sub_10000C470( 2,  "waitpid on %s with PID %d returned EINTR, retrying",  v28,  v29,  v30,  v31,  v32,  v33,  (char)"/usr/local/bin/ddt");
    pid_t v21 = waitpid(v50, &v49, 0);
    if (v21 != -1) {
      goto LABEL_16;
    }
  }

  uint64_t v35 = __error();
  strerror(*v35);
  sub_10000C470( 2,  "waitpid on %s with PID %d failed with error %s",  v36,  v37,  v38,  v39,  v40,  v41,  (char)"/usr/local/bin/ddt");
LABEL_12:
  dispatch_group_leave((dispatch_group_t)qword_100020738);
}

uint64_t sub_100007A74(int a1)
{
  return _os_assert_log(a1);
}

uint64_t sub_100007A7C(int *a1)
{
  return _os_assert_log(*a1);
}

void sub_100007A84(char a1)
{
  if (byte_100020888 && (a1 & 1) == 0)
  {
    if (qword_100020880 != -1) {
      dispatch_once(&qword_100020880, &stru_100014B88);
    }
    if (!qword_100020DF0) {
      sub_10000D51C();
    }
    dispatch_async((dispatch_queue_t)qword_100020DF0, &stru_100014BA8);
  }

void sub_100007AEC(id a1)
{
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  uint64_t v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.watchdogd.monitoring_iokit", v11);
  uint64_t v9 = (void *)qword_100020DF0;
  qword_100020DF0 = (uint64_t)v8;
}

void sub_100007B54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = 60;
  mach_timespec_t waitTime = (mach_timespec_t)60LL;
  if (byte_100020890)
  {
    char v8 = 120;
    waitTime.tv_sec = 120;
  }

  sub_10000C470(0, "Wait for IOKit to quiesce in %ds", a3, a4, a5, a6, a7, a8, v8);
  id v9 = sub_10000CB98();
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WatchdogdWaitForIOKitQuiese",  (const char *)&unk_10001361F,  buf,  2u);
  }

  if (IOKitWaitQuietWithOptions(kIOMainPortDefault, &waitTime, 1u)) {
    sub_100005620("Timeout waiting for IOKit to quiesce in 60s");
  }
  id v11 = sub_10000CB98();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WatchdogdWaitForIOKitQuiese",  (const char *)&unk_10001361F,  v13,  2u);
  }
}

void sub_100007C78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = dword_10002088C;
  if (!dword_10002088C)
  {
    sub_1000055A0(a1, a2, a3, a4, a5, a6, a7, a8, v9);
    sub_100008494();
    int v8 = dword_10002088C;
  }

  dword_10002088C = v8 + 1;
}

void sub_100007CB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = dword_10002088C;
  if (dword_10002088C <= 0) {
    sub_10000D51C();
  }
  --dword_10002088C;
  if (v9 == 1)
  {
    sub_1000084E8(a1);
    sub_1000055E0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }

void sub_100007CEC()
{
}

void start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0LL, &stru_100014BC8);
  int v1 = pthread_key_create((pthread_key_t *)&qword_100020E38, 0LL);
  if (v1)
  {
    uint64_t v42 = _os_assert_log(v1);
    uint64_t v30 = _os_crash(v42);
    __break(1u);
LABEL_13:
    uint64_t v43 = _os_assert_log(v30);
    uint64_t v33 = _os_crash(v43);
    __break(1u);
    goto LABEL_14;
  }

  sub_10000C8AC();
  sub_1000053C4(v2, v3, v4, v5, v6, v7, v8, v9, v45);
  sub_10000BE20();
  if (!sub_1000054AC())
  {
    sub_10000C85C(0, "userspace monitoring disabled", v10, v11, v12, v13, v14, v15, v46);
    sub_10000BEBC(v34, v35, v36, v37, v38, v39, v40, v41, v48);
LABEL_11:
    sleep(2u);
    exit(0);
  }

  sub_10000C470(0, "userspace monitoring enabled", v10, v11, v12, v13, v14, v15, v46);
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.watchdogd");
  sub_10000555C(has_internal_diagnostics, v17, v18, v19, v20, v21, v22, v23, v47);
  byte_100020888 = sub_10000568C(&byte_100020890);
  dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
  dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_USER_INITIATED, 0);
  uint64_t v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);

  dispatch_queue_t v28 = dispatch_queue_create("com.apple.watchdogd.monitoring_transitions", v27);
  uint64_t v29 = (void *)qword_100020DE8;
  qword_100020DE8 = (uint64_t)v28;

  uint64_t v30 = qword_100020DE8;
  if (!qword_100020DE8) {
    goto LABEL_13;
  }
  dispatch_async((dispatch_queue_t)qword_100020DE8, &stru_100014BE8);
  dispatch_async((dispatch_queue_t)qword_100020DE8, &stru_100014C08);
  dispatch_async((dispatch_queue_t)qword_100020DE8, &stru_100014C28);
  sub_10000BF94();
  if (!os_variant_is_darwinos("com.apple.watchdogd"))
  {
LABEL_9:

    objc_autoreleasePoolPop(v0);
    CFRunLoopRun();
    goto LABEL_11;
  }

  sub_10000A334();
  dispatch_source_t v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  uint64_t v32 = (void *)qword_100020878;
  qword_100020878 = (uint64_t)v31;

  uint64_t v33 = qword_100020878;
  if (qword_100020878)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100020878, &stru_100014C48);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_resume((dispatch_object_t)qword_100020878);
    goto LABEL_9;
  }

LABEL_14:
  uint64_t v44 = _os_assert_log(v33);
  _os_crash(v44);
  __break(1u);
}

void sub_100007EE0(id a1)
{
}

void sub_100007EEC(id a1)
{
  dword_100020898 = IORegisterForSystemPower( 0LL,  &thePortRef,  (IOServiceInterestCallback)sub_100007F48,  &dword_100020894);
  if (!dword_100020898) {
    sub_10000D51C();
  }
  if (!thePortRef) {
    sub_10000D51C();
  }
  IONotificationPortSetDispatchQueue(thePortRef, (dispatch_queue_t)qword_100020DE8);
}

void sub_100007F48( int a1, int a2, uint64_t a3, intptr_t notificationID, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  switch((_DWORD)a3)
  {
    case 0xE0000300:
      sub_10000C470(0, "received system wake notification", a3, notificationID, a5, a6, a7, a8, v25);
      if (byte_10002089C == 1)
      {
        byte_10002089C = 0;
        if (qword_100020DF0) {
          dispatch_async((dispatch_queue_t)qword_100020DF0, &stru_100014C68);
        }
        sub_100007CB0((uint64_t)"wake", v10, v11, v12, v13, v14, v15, v16, a9);
      }

      break;
    case 0xE0000280:
      sub_10000C470(0, "received system sleep notification", a3, notificationID, a5, a6, a7, a8, v25);
      byte_10002089C = 1;
      sub_100007C78(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_11:
      IOAllowPowerChange(dword_100020898, notificationID);
      return;
    case 0xE0000270:
      goto LABEL_11;
  }

void sub_100008020(id a1)
{
  BOOL v1 = sub_100004BB0();
  char v8 = v1;
  uint64_t v9 = "No";
  if (v1) {
    uint64_t v9 = "Yes";
  }
  sub_10000C470(0, "crypto migration needed: %s", v2, v3, v4, v5, v6, v7, (char)v9);
  sub_100007A84(v8);
}

void sub_100008078(id a1)
{
}

void *sub_1000080A0()
{
  if (qword_1000208A0 != -1) {
    dispatch_once(&qword_1000208A0, &stru_100014C88);
  }
  return &unk_1000208A8;
}

void sub_1000080E0(id a1)
{
  size_t v7 = 1024LL;
  if (sysctlbyname("kern.bootargs", &unk_1000208A8, &v7, 0LL, 0LL)) {
    sub_10000DAB4();
  }
  sub_10000C470(0, "retrieved current device boot-args: %s", v1, v2, v3, v4, v5, v6, (char)&unk_1000208A8);
}

uint64_t sub_100008144()
{
  if (qword_100020CA8 != -1) {
    dispatch_once(&qword_100020CA8, &stru_100014CA8);
  }
  return byte_100020CB0;
}

void sub_100008184(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v1)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"stress-rack", 0LL, 0);
    if (!CFProperty)
    {
      char v3 = 0;
      goto LABEL_6;
    }

    CFRelease(CFProperty);
  }

  char v3 = 1;
LABEL_6:
  byte_100020CB0 = v3;
}

uint64_t sub_1000081E0()
{
  if (qword_100020CB8 != -1) {
    dispatch_once(&qword_100020CB8, &stru_100014CC8);
  }
  return byte_100020CB1;
}

void sub_100008220(id a1)
{
  int v2 = 0;
  size_t v1 = 4LL;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL)) {
    byte_100020CB1 = v2 != 0;
  }
}

uint64_t sub_100008278()
{
  if (qword_100020CC8 != -1) {
    dispatch_once(&qword_100020CC8, &stru_100014CE8);
  }
  return byte_100020CC0;
}

void sub_1000082B8(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v1)
  {
    CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, @"osenvironment", 0LL, 0);
    if (CFProperty)
    {
      uint64_t v9 = CFProperty;
      uint64_t Length = CFDataGetLength(CFProperty);
      if (Length > 64)
      {
        BOOL v12 = 0;
      }

      else
      {
        size_t v11 = Length;
        v15.location = 0LL;
        v15.length = Length;
        CFDataGetBytes(v9, v15, buffer);
        BOOL v12 = strncmp((const char *)buffer, "diagnostics", v11) == 0;
      }

      byte_100020CC0 = v12;
      CFRelease(v9);
    }

    else
    {
      byte_100020CC0 = 0;
      sub_10000C470(2, "Cannot locate osenvironment entry in IORegistry", v3, v4, v5, v6, v7, v8, v14);
    }
  }

  else
  {
    byte_100020CC0 = 0;
  }

uint64_t sub_1000083DC()
{
  if (qword_100020CD0 != -1) {
    dispatch_once(&qword_100020CD0, &stru_100014D08);
  }
  return byte_100020CD8;
}

void sub_10000841C(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (v1)
  {
    io_object_t v2 = v1;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"e-apfs", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      byte_100020CD8 = 1;
    }

    IOObjectRelease(v2);
  }

void sub_100008494()
{
  qword_100020CE0 = 0LL;
}

void sub_1000084E8(uint64_t a1)
{
  if (qword_100020CE0) {
    sub_10000D51C();
  }
  char v1 = a1;
  qword_100020CE0 = a1;
  if (qword_100020CE8 != -1) {
    dispatch_once(&qword_100020CE8, &stru_100014D28);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100020E30);
  sub_10000C470(0, "signaled service monitoring thread to resume for %s", v2, v3, v4, v5, v6, v7, v1);
}

void sub_100008568(id a1)
{
  char v1 = (char *)&unk_10001A640;
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    uint64_t v2 = sub_1000080A0();
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    uint64_t v71 = -1LL;
    if (os_parse_boot_arg_from_buffer_string(v2, "-wdt_panic_immediately", 0LL, 0LL))
    {
      dword_1000202E4 = 0;
      sub_10000C470( 0,  "monitoring for all daemons configured to panic on first timeout (per %s boot-arg)",  v3,  v4,  v5,  v6,  v7,  v8,  (char)"-wdt_panic_immediately");
    }

    else if (os_parse_boot_arg_from_buffer_string(v2, "wdt_panic_when_unresponsive", &v72, 128LL))
    {
      sub_10000C470( 0,  "detected boot-arg (%s) to panic on first timeout with value: %s",  v9,  v10,  v11,  v12,  v13,  v14,  (char)"wdt_panic_when_unresponsive");
      sub_100008A38((char)"wdt_panic_when_unresponsive", (char *)&v72, &stru_100014D68);
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
    }

    if (os_parse_boot_arg_from_buffer_string(v2, "wdt_capture_ddt_on_timeout", &v72, 128LL))
    {
      sub_10000C470( 0,  "detected boot-arg (%s) to capture ddt on timeout with value: %s",  v15,  v16,  v17,  v18,  v19,  v20,  (char)"wdt_capture_ddt_on_timeout");
      sub_100008A38((char)"wdt_capture_ddt_on_timeout", (char *)&v72, &stru_100014D88);
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
    }

    if (os_parse_boot_arg_from_buffer_string(v2, "-wdt_skip_crash_without_tailspin", 0LL, 0LL))
    {
      sub_10000C470( 0,  "Enable tailspin check before crashing service (per %s boot-arg)",  v21,  v22,  v23,  v24,  v25,  v26,  (char)"-wdt_skip_crash_without_tailspin");
      byte_100020E01 = 1;
    }

    if (os_parse_boot_arg_from_buffer_int(v2, "wdt_ext_ws_to", &v71) && (v71 & 0x8000000000000000LL) == 0)
    {
      sub_10000C470( 0,  "detected boot-arg (%s) for WindowServer timeout override: %lld",  v27,  v28,  v29,  v30,  v31,  v32,  (char)"wdt_ext_ws_to");
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472LL;
      v70[2] = sub_100008BD8;
      v70[3] = &unk_100014DA8;
      v70[4] = v71;
      sub_100008A38((char)"wdt_ext_ws_to", "WindowServer", v70);
    }

    int v33 = dword_1000202E0;
    if (dword_1000202E0 >= 1)
    {
      uint64_t v34 = 0LL;
      uint64_t v35 = off_10001A668;
      do
      {
        if (*((_BYTE *)v35 - 23))
        {
          sub_10000C470(0, "enabled monitoring for internal service : %s", v27, v28, v29, v30, v31, v32, (char)*v35);
          *((_BYTE *)v35 - 24) = 0;
          int v33 = dword_1000202E0;
        }

        v35 += 228;
        ++v34;
      }

      while (v34 < v33);
    }
  }

  if (sub_100008278())
  {
    int v42 = dword_1000202E0;
    if (dword_1000202E0 >= 1)
    {
      uint64_t v43 = 0LL;
      uint64_t v44 = off_10001A668;
      do
      {
        if (*((_BYTE *)v44 + 24))
        {
          sub_10000C470( 0,  "disable monitoring for service : %s at checkerboard mode",  v36,  v37,  v38,  v39,  v40,  v41,  (char)*v44);
          *((_BYTE *)v44 - 24) = 1;
          int v42 = dword_1000202E0;
        }

        v44 += 228;
        ++v43;
      }

      while (v43 < v42);
    }
  }

  dispatch_semaphore_t v45 = dispatch_semaphore_create(0LL);
  char v46 = (void *)qword_100020E20;
  qword_100020E20 = (uint64_t)v45;

  dispatch_semaphore_t v47 = dispatch_semaphore_create(0LL);
  char v48 = (void *)qword_100020E28;
  qword_100020E28 = (uint64_t)v47;

  dispatch_semaphore_t v49 = dispatch_semaphore_create(0LL);
  pid_t v50 = (void *)qword_100020E30;
  qword_100020E30 = (uint64_t)v49;

  sub_10000587C(dword_1000202E0);
  uint64_t v69 = dword_1000202E0;
  if (dword_1000202E0 < 1)
  {
    char v1 = 0LL;
  }

  else
  {
    uint64_t v51 = 0LL;
    do
    {
      sigset_t v52 = v1;
      sigset_t v53 = &v1[1824 * v51];
      if (*((_DWORD *)v53 + 17) == 2)
      {
        posix_spawnattr_t v54 = 0LL;
        uint64_t v55 = v52;
        uint64_t v56 = &v52[228 * v51];
        v56[9] = 0LL;
        uint64_t v57 = v56 + 9;
        uint64_t v58 = (const char **)(v57 - 4);
        uint64_t v59 = v69;
        do
        {
          if (*((_DWORD *)v55 + 17) == 3)
          {
            uint64_t v60 = (const char *)v55[9];
            if (!v60) {
              sub_10000D51C();
            }
            size_t v61 = strlen(*v58);
            if (!strncmp(*v58, v60, v61))
            {
              v55[12] = v54;
              *uint64_t v57 = v55;
              posix_spawnattr_t v54 = v55;
              v55[11] = v53;
            }
          }

          v55 += 228;
          --v59;
        }

        while (v59);
      }

      ++v51;
      char v1 = (char *)v52;
    }

    while (v51 != v69);
    uint64_t v62 = v52 + 11;
    uint64_t v63 = v69;
    do
    {
      if (*((_DWORD *)v62 - 5) == 3 && !*v62) {
        sub_10000D51C();
      }
      v62 += 228;
      --v63;
    }

    while (v63);
    __int128 v64 = 0LL;
    unint64_t v65 = v69 + 1;
    do
    {
      uint64_t v66 = (v65 - 2);
      __int128 v67 = &v52[228 * v66];
      *__int128 v67 = v64;
      v67[1] = v66;
      --v65;
      __int128 v64 = v67;
    }

    while (v65 > 1);
  }

  qword_100020DF8 = (uint64_t)v1;
  int v68 = pthread_create(&qword_100020E08, 0LL, (void *(__cdecl *)(void *))sub_100008C70, 0LL);
  if (v68) {
    sub_10000DAF0(v68);
  }
}

void sub_100008A38(char a1, char *a2, void *a3)
{
  __stringp = a2;
  uint64_t v4 = a3;
  uint64_t v5 = strsep(&__stringp, ",");
  if (v5)
  {
    uint64_t v12 = v5;
    while (*v12)
    {
      uint64_t v13 = dword_1000202E0;
      if (dword_1000202E0 < 1)
      {
LABEL_8:
        sub_10000C470( 2,  "%s boot-arg specified for daemon %s which cannot be found in services list",  v6,  v7,  v8,  v9,  v10,  v11,  a1);
      }

      else
      {
        uint64_t v14 = (const char **)&unk_10001A640;
        while (1)
        {
          size_t v15 = strlen(v14[5]);
          if (!strncasecmp(v14[5], v12, v15)) {
            break;
          }
          v14 += 228;
          if (!--v13) {
            goto LABEL_8;
          }
        }

        v4[2](v4, v14);
      }

      uint64_t v12 = strsep(&__stringp, ",");
      if (!v12) {
        goto LABEL_13;
      }
    }

    sub_10000C470(2, "%s boot-arg specified with empty daemon name", v6, v7, v8, v9, v10, v11, a1);
  }

LABEL_13:
}

void sub_100008B58(id a1, watchdog_service *a2)
{
  a2->var11 = 1;
  sub_10000C470( 0,  "monitoring for %s configured to panic on first timeout (per %s boot-arg)",  v2,  v3,  v4,  v5,  v6,  v7,  (char)a2->var6);
}

void sub_100008B98(id a1, watchdog_service *a2)
{
  a2->var12 = 1;
  sub_10000C470( 0,  "monitoring for %s configured to capture ddt on timeout (per %s boot-arg)",  v2,  v3,  v4,  v5,  v6,  v7,  (char)a2->var6);
}

void sub_100008BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = 1000000000LL * *(void *)(a1 + 32) / 0x2540BE400uLL;
  if (*(_DWORD *)(a2 + 56) >= (int)v8)
  {
    sub_10000C470( 2,  "Keep %s default timeout cause %lld seconds (per %s boot-arg) is too short",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 40));
  }

  else
  {
    *(_DWORD *)(a2 + 56) = v8;
    sub_10000C470( 0,  "%s configured to timeout in %lld seconds (per %s boot-arg)",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 40));
  }

uint64_t sub_100008C70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_100020CF0 = 0LL;
  sub_10000C470(0, "service monitoring thread created", a3, a4, a5, a6, a7, a8, v64);
  BOOLean_t get_default = 1;
  mach_msg_type_number_t policy_infoCnt = 4;
  unint64_t v8 = pthread_self();
  thread_inspect_t v9 = pthread_mach_thread_np(v8);
  if (thread_policy_get(v9, 2u, policy_info, &policy_infoCnt, &get_default)) {
    goto LABEL_52;
  }
  uint64_t v10 = pthread_self();
  thread_act_t v11 = pthread_mach_thread_np(v10);
  if (!thread_policy_set(v11, 2u, policy_info, 4u))
  {
    pthread_key_t v12 = qword_100020E38;
    pthread_t v13 = pthread_self();
    pthread_setspecific(v12, v13);
    uint64_t v14 = pthread_setname_np("watchdogd service monitoring thread");
    sub_10000B7D8(v14, v15, v16, v17, v18, v19, v20, v21);
    LOBYTE(policy_infoCnt) = 0;
    sub_10000B6C8(&policy_infoCnt, qword_100020CF0);
    if ((_BYTE)policy_infoCnt) {
      __uint64_t v66 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000LL;
    }
    else {
      __uint64_t v66 = 0LL;
    }
    qword_100020E10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    dispatch_time_t v22 = dispatch_time(0LL, 0LL);
    *(void *)policy_info = 0LL;
    uint64_t v23 = (dispatch_semaphore_t *)&unk_100020000;
    uint64_t v24 = &unk_100020000;
    uint64_t v25 = &unk_100020000;
    while (1)
    {
      dispatch_semaphore_wait(v23[454], 0xFFFFFFFFFFFFFFFFLL);
      if (!v24[412]) {
        goto LABEL_51;
      }
      sub_10000C470(0, "service monitoring thread resuming monitoring after %s", v26, v27, v28, v29, v30, v31, v24[412]);
      if (v25[3584]) {
        break;
      }
      if (*(void *)policy_info)
      {
        dispatch_time_t v22 = dispatch_time(0LL, *(int64_t *)policy_info);
        *(void *)policy_info = 0LL;
      }

      uint64_t v32 = sub_1000090E4(v22, (unint64_t *)policy_info);
      if ((_DWORD)v32)
      {
        do
        {
LABEL_18:
          sub_10000555C(v32, v33, v34, v35, v36, v37, v38, v39, v65);
          sub_1000091C4();
          context = objc_autoreleasePoolPush();
          int v43 = sub_10000B90C(qword_100020CF0);
          dispatch_time_t v22 = dispatch_time(0LL, 10000000000LL);
          __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          if (byte_100020CF8 == 1)
          {
            dispatch_semaphore_t v45 = (uint64_t *)sub_1000060E0();
            if (v45)
            {
              char v46 = (unsigned __int8 *)v45;
              if (sub_10000623C(v45))
              {
                qword_100020D00 = (uint64_t)v46;
              }

              else
              {
                sub_10000618C(v46);
                sub_1000061BC();
              }
            }
          }

          sub_10000BAE0(v43, v44 + 10000000000LL);
          for (uint64_t i = qword_100020DF8; i; uint64_t i = *(void *)i)
          {
            if (sub_10000B5CC(i) && *(_DWORD *)(i + 68) == 2)
            {
              if (*(_BYTE *)(i + 208))
              {
                for (uint64_t j = *(void *)(i + 72); j; uint64_t j = *(void *)(j + 96))
                {
                  if ((int)*(void *)(i + 1408) < 1)
                  {
LABEL_33:
                    if (sub_10000B5CC(j)) {
                      *(_BYTE *)(j + 80) = 0;
                    }
                  }

                  else
                  {
                    uint64_t v49 = *(void *)(i + 1408);
                    pid_t v50 = *(const char **)(j + 24);
                    size_t v51 = strlen(v50);
                    sigset_t v52 = (const char *)(i + 1248);
                    while (v51 != strlen(v52) || strcasecmp(v50, v52))
                    {
                      v52 += 32;
                      if (!--v49) {
                        goto LABEL_33;
                      }
                    }

                    if (*(_DWORD *)(j + 68) != 3)
                    {
                      uint64_t v61 = _os_assert_log(0LL);
                      _os_crash(v61);
                      __break(1u);
LABEL_51:
                      uint64_t v62 = _os_assert_log(0LL);
                      _os_crash(v62);
                      __break(1u);
LABEL_52:
                      _os_crash("thread_policy_get(thread_self, THREAD_TIME_CONSTRAINT_POLICY, ...) failed ");
                      __break(1u);
                      goto LABEL_53;
                    }

                    if (!sub_10000B5CC(j))
                    {
                      bzero((void *)(j + 112), 0x6B0uLL);
                      *(_BYTE *)(j + 80) = 1;
                      *(void *)(j + 120) = qword_100020CF0 + 1;
                      *(void *)(j + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
                    }
                  }
                }
              }
            }
          }

          if ((sub_1000093D8(v44) & 1) == 0) {
            sub_100009A94(v44);
          }
          sub_10000618C((unsigned __int8 *)qword_100020D08);
          qword_100020D08 = qword_100020D00;
          qword_100020D00 = 0LL;
          objc_autoreleasePoolPop(context);
          __uint64_t v53 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          uint64_t v23 = (dispatch_semaphore_t *)&unk_100020000;
          if (v53 - qword_100020E10 >= 0x1BF08EB001LL) {
            sub_10000BEBC(v53, v54, v55, v56, v57, v58, v59, v60, v65);
          }
          uint64_t v24 = (void *)&unk_100020000;
          uint64_t v25 = (_BYTE *)&unk_100020000;
          if ((_BYTE)policy_infoCnt && clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) > v66)
          {
            sub_10000B6C8(&policy_infoCnt, qword_100020CF0);
            if ((_BYTE)policy_infoCnt) {
              __uint64_t v66 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000LL;
            }
          }

          sub_1000061BC();
          uint64_t v32 = sub_1000090E4(v22, (unint64_t *)policy_info);
          ++qword_100020CF0;
        }

        while (((v32 ^ 1) & 1) == 0);
      }
    }

    uint64_t v32 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    uint64_t v40 = (void *)qword_100020DF8;
    if (qword_100020DF8)
    {
      uint64_t v41 = v32;
      do
      {
        bzero(v40 + 14, 0x6B0uLL);
        uint64_t v32 = sub_10000B5CC((uint64_t)v40);
        if ((_DWORD)v32)
        {
          uint64_t v42 = qword_100020CF0;
          v40[14] = v41;
          v40[15] = v42;
        }

        uint64_t v40 = (void *)*v40;
      }

      while (v40);
    }

    goto LABEL_18;
  }

LABEL_53:
  uint64_t result = _os_crash("thread_policy_set(thread_self, THREAD_TIME_CONSTRAINT_POLICY, ...) failed");
  __break(1u);
  return result;
}

BOOL sub_1000090E4(dispatch_time_t timeout, unint64_t *a2)
{
  if (!a2) {
    sub_10000D51C();
  }
  uint64_t v4 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_100020E20, timeout);
  if (!v4)
  {
    unint64_t v15 = 0LL;
    if ((dispatch_time_to_nsec(0LL, &v16, &v15) & 1) == 0) {
      sub_10000D51C();
    }
    if (v16 != 1) {
      sub_10000D51C();
    }
    unint64_t v14 = 0LL;
    if ((dispatch_time_to_nsec(timeout, &v16, &v14) & 1) == 0) {
      sub_10000D51C();
    }
    if (v16 != 1) {
      sub_10000D51C();
    }
    unint64_t v11 = v14 - v15;
    if (v14 < v15) {
      unint64_t v11 = 0LL;
    }
    *a2 = v11;
    sub_10000C470(0, "service monitoring thread pausing...", v5, v6, v7, v8, v9, v10, v13);
    qword_100020CE0 = 0LL;
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_100020E28);
  }

  return v4 != 0;
}

void sub_1000091C4()
{
  unsigned __int8 v0 = atomic_load(byte_100020E48);
  if ((v0 & 1) != 0)
  {
    char v1 = (char *)qword_100020E40;
    if (!qword_100020E40) {
      sub_10000D51C();
    }
    do
    {
      uint64_t v2 = (const char **)v1;
      char v1 = *(char **)v1;
      uint64_t v3 = &qword_100020DF8;
      while (1)
      {
        uint64_t v3 = (uint64_t *)*v3;
        if (!v3) {
          break;
        }
        if (!strcmp(v2[4], (const char *)v3[4]))
        {
          sub_10000C470( 0,  "Service %s:%s has already been enrolled, duplicated with %s:%s",  v4,  v5,  v6,  v7,  v8,  v9,  (char)v2[3]);
          uint64_t v10 = (uint64_t *)qword_100020E40;
          if ((const char **)qword_100020E40 == v2)
          {
            unint64_t v11 = &qword_100020E40;
          }

          else
          {
            do
            {
              unint64_t v11 = v10;
              uint64_t v10 = (uint64_t *)*v10;
            }

            while (v10 != (uint64_t *)v2);
          }

          *unint64_t v11 = (uint64_t)*v2;
          free((void *)v2[3]);
          free((void *)v2[5]);
          free((void *)v2[4]);
          free((void *)v2[6]);
          free(v2);
          break;
        }
      }
    }

    while (v1);
    if (!qword_100020E40) {
      goto LABEL_23;
    }
    if (os_unfair_lock_trylock((os_unfair_lock_t)&unk_100020E18))
    {
      pthread_key_t v12 = (uint64_t *)qword_100020E40;
      if (qword_100020E40)
      {
        do
        {
          char v13 = (uint64_t *)*v12;
          if (sub_10000B600((uint64_t)v12, qword_100020CF0))
          {
            int v20 = dword_1000202E0;
            v12[1] = dword_1000202E0;
            uint64_t v21 = (uint64_t *)qword_100020E40;
            if ((uint64_t *)qword_100020E40 == v12)
            {
              dispatch_time_t v22 = &qword_100020E40;
            }

            else
            {
              do
              {
                dispatch_time_t v22 = v21;
                uint64_t v21 = (uint64_t *)*v21;
              }

              while (v21 != v12);
            }

            *dispatch_time_t v22 = *v12;
            *pthread_key_t v12 = qword_100020DF8;
            qword_100020DF8 = (uint64_t)v12;
            dword_1000202E0 = v20 + 1;
            sub_10000C470(0, "service %s enroll succcessful", v14, v15, v16, v17, v18, v19, v12[5]);
          }

          pthread_key_t v12 = v13;
        }

        while (v13);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100020E18);
LABEL_23:
      atomic_store(0, byte_100020E48);
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_100020E50);
      return;
    }

    if (byte_100020D10 == 1) {
      sub_10000D51C();
    }
    byte_100020D10 = 1;
  }

uint64_t sub_1000093D8(uint64_t a1)
{
  byte_100020CF8 = 0;
  __chkstk_darwin();
  uint64_t v3 = qword_100020DF8;
  if (!qword_100020DF8)
  {
    char v67 = 1;
    return v67 & 1;
  }

  uint64_t v70 = (uint64_t)&v69 - ((v2 + 15) & 0x3FFFFFFFF0LL);
  uint64_t v72 = 0LL;
  int v71 = 0;
  int v73 = 0;
  int v74 = 1;
  do
  {
    if (!sub_10000B5CC(v3) || *(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) == qword_100020CF0 + 1) {
      goto LABEL_8;
    }
    if (*(_BYTE *)(v3 + 209))
    {
      uint64_t v10 = qword_100020CF0;
      ++*(void *)(v3 + 128);
      *(void *)(v3 + 136) = a1;
      *(void *)(v3 + 192) = 0LL;
      *(void *)(v3 + 152) = 0LL;
      *(void *)(v3 + 160) = 0LL;
      *(void *)(v3 + 144) = v10;
      uuid_clear((unsigned __int8 *)(v3 + 168));
      *(_BYTE *)(v3 + 188) = 0;
      *(_BYTE *)(v3 + 1416) = 0;
      atomic_store(0, (unsigned int *)(v3 + 184));
      sub_10000C470( 0,  "watchdog poll for service %s returned successfully, %lld successful checkins",  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)(v3 + 40));
      goto LABEL_8;
    }

    unint64_t v17 = *(void *)(v3 + 144);
    if (*(void *)(v3 + 120) > v17) {
      unint64_t v17 = *(void *)(v3 + 120);
    }
    if (*(void *)(v3 + 160)) {
      unint64_t v18 = *(void *)(v3 + 160);
    }
    else {
      unint64_t v18 = v17;
    }
    if (*(_DWORD *)(v3 + 192) != dword_1000202E4 && qword_100020CF0 + 2 == v18 + *(int *)(v3 + 56))
    {
      sub_10000C470(2, "marking diagnostic collection next round for %s", v4, v5, v6, v7, v8, v9, *(void *)(v3 + 40));
      byte_100020CF8 = 1;
    }

    uint64_t v19 = v3 + 1418;
    *(_OWORD *)(v3 + 1786) = 0u;
    *(_OWORD *)(v3 + 1802) = 0u;
    *(_OWORD *)(v3 + 1754) = 0u;
    *(_OWORD *)(v3 + 1770) = 0u;
    *(_OWORD *)(v3 + 1722) = 0u;
    *(_OWORD *)(v3 + 1738) = 0u;
    *(_OWORD *)(v3 + 1690) = 0u;
    *(_OWORD *)(v3 + 1706) = 0u;
    *(_OWORD *)(v3 + 1658) = 0u;
    *(_OWORD *)(v3 + 1674) = 0u;
    *(_OWORD *)(v3 + 1626) = 0u;
    *(_OWORD *)(v3 + 1642) = 0u;
    *(_OWORD *)(v3 + 1594) = 0u;
    *(_OWORD *)(v3 + 1610) = 0u;
    *(_OWORD *)(v3 + 1562) = 0u;
    *(_OWORD *)(v3 + 1578) = 0u;
    *(_OWORD *)(v3 + 1530) = 0u;
    *(_OWORD *)(v3 + 1546) = 0u;
    *(_OWORD *)(v3 + 1498) = 0u;
    *(_OWORD *)(v3 + 1514) = 0u;
    *(_OWORD *)(v3 + 1466) = 0u;
    *(_OWORD *)(v3 + 1482) = 0u;
    *(_OWORD *)(v3 + 1434) = 0u;
    *(_OWORD *)(v3 + 1450) = 0u;
    *(_OWORD *)(v3 + 1418) = 0u;
    int v20 = snprintf((char *)(v3 + 1418), 0x190uLL, "checkin with service: %s ", *(const char **)(v3 + 40));
    else {
      size_t v21 = 0LL;
    }
    unint64_t v22 = snprintf((char *)(v19 + v20), v21, "(%d induced crashes) ", *(_DWORD *)(v3 + 196)) + (uint64_t)v20;
    if (v22 <= 0x190) {
      size_t v23 = 400 - v22;
    }
    else {
      size_t v23 = 0LL;
    }
    mach_error_t v24 = *(_DWORD *)(v3 + 204);
    if (v24)
    {
      if (v24 == 268435460)
      {
        int v25 = snprintf( (char *)(v19 + v22),  v23,  "failed to send ping message, %s watchdog request handling code likely hung ");
      }

      else
      {
        mach_error_string(v24);
        int v25 = snprintf((char *)(v19 + v22), v23, "failed to send ping message with error %s ");
      }
    }

    else if (*(_BYTE *)(v3 + 208))
    {
      if (*(_BYTE *)(v3 + 209)) {
        sub_10000D51C();
      }
      int v25 = snprintf((char *)(v19 + v22), v23, "returned not alive ");
    }

    else
    {
      int v25 = snprintf((char *)(v19 + v22), v23, "didn't receive a reply from the service ");
    }

    unint64_t v26 = v22 + v25;
    if (v26 <= 0x190) {
      size_t v27 = 400 - v26;
    }
    else {
      size_t v27 = 0LL;
    }
    uint64_t v28 = *(void *)(v3 + 1240);
    if (*(_BYTE *)(v3 + 210))
    {
      uint64_t v29 = (char *)(v19 + v26);
      if (v28) {
        int v30 = snprintf(v29, v27, "with context:\n%s (code 0x%llx)\n");
      }
      else {
        int v30 = snprintf(v29, v27, "with context:\n%s\n");
      }
      goto LABEL_41;
    }

    if (v28)
    {
      int v30 = snprintf((char *)(v19 + v26), v27, "with code 0x%llx\n");
LABEL_41:
      v26 += v30;
    }

    if (v26 <= 0x190) {
      size_t v31 = 400 - v26;
    }
    else {
      size_t v31 = 0LL;
    }
    uint64_t v32 = *(void *)(v3 + 128);
    if (v32)
    {
      v26 += snprintf( (char *)(v19 + v26),  v31,  "%lld seconds since last successful checkin, %lld total successful checkins since ",  (a1 - *(void *)(v3 + 136)) / 0x3B9ACA00uLL,  v32);
      if (v26 <= 0x190) {
        size_t v33 = 400 - v26;
      }
      else {
        size_t v33 = 0LL;
      }
      if (*(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) != *(void *)(*(void *)(v3 + 88) + 120LL)) {
        int v34 = snprintf((char *)(v19 + v26), v33, "monitoring enabled by %s (%lld seconds ago)");
      }
      else {
        int v34 = snprintf((char *)(v19 + v26), v33, "%lld seconds ago");
      }
    }

    else if (*(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) != *(void *)(*(void *)(v3 + 88) + 120LL))
    {
      int v34 = snprintf( (char *)(v19 + v26),  v31,  "no successful checkins since monitoring enabled by %s (%lld seconds ago)");
    }

    else
    {
      int v34 = snprintf((char *)(v19 + v26), v31, "no successful checkins since %lld seconds ago");
    }

    uint64_t v35 = *(void *)(v3 + 152);
    if (v35)
    {
      unint64_t v36 = v26 + v34;
      if (v36 <= 0x190) {
        size_t v37 = 400 - v36;
      }
      else {
        size_t v37 = 0LL;
      }
      snprintf((char *)(v19 + v36), v37, ", %lld seconds since last crashed by watchdogd, ", (a1 - v35) / 0x3B9ACA00uLL);
    }

    if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
    {
      if (sub_100005504())
      {
        sub_10000C470( 2,  "skipping evaluating or taking action on service %s because watchdogd defanged",  v44,  v45,  v46,  v47,  v48,  v49,  *(void *)(v3 + 40));
        goto LABEL_8;
      }

      int v50 = sub_100005AB0(*(void *)(v3 + 24), 0LL);
      if (v50 >= 1)
      {
        if (sub_100005A14(v50))
        {
          sub_10000C470( 2,  "skipping evaluating or taking action on service %s because service being debugged",  v38,  v39,  v40,  v41,  v42,  v43,  *(void *)(v3 + 24));
          goto LABEL_8;
        }
      }
    }

    sub_10000C470(2, "%s", v38, v39, v40, v41, v42, v43, v3 - 118);
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.watchdogd");
    unint64_t v59 = 2863311532LL * *(_DWORD *)(v3 + 56);
    uint64_t v60 = (unsigned int *)(v3 + 184);
    while (!__ldaxr(v60))
    {
      int v62 = 1;
      if (!__stlxr(1u, v60)) {
        goto LABEL_75;
      }
    }

    int v62 = 0;
    __clrex();
LABEL_75:
    BOOL v63 = *(_BYTE *)(v3 + 63) && *(_BYTE *)(v3 + 188) == 0;
    if ((v62 | v63) != 1) {
      goto LABEL_91;
    }
    if ((v72 & 1) != 0)
    {
      if ((v72 & 0x100000000LL) != 0) {
        goto LABEL_83;
      }
    }

    else if ((sub_100006990(has_internal_diagnostics, v52, v53, v54, v55, v56, v57, v58) & 1) != 0)
    {
LABEL_83:
      sub_1000091C4();
      int v64 = v73;
      HIDWORD(v72) = 1;
      int v73 = v64;
      if (v63)
      {
        *(_BYTE *)(v3 + 188) = 1;
        sub_100007694(*(void *)(v3 + 40));
      }

      goto LABEL_87;
    }

    HIDWORD(v72) = 0;
LABEL_87:
    if ((v73 & 1) != 0 && v62)
    {
      int v65 = v71;
      uint64_t v66 = v70 + 24LL * v71;
      *(void *)uint64_t v66 = *(void *)(v3 + 40);
      uuid_generate((unsigned __int8 *)(v3 + 168));
      uuid_copy((unsigned __int8 *)(v66 + 8), (const unsigned __int8 *)(v3 + 168));
      int v71 = v65 + 1;
    }

    LODWORD(v72) = 1;
LABEL_91:
    if (qword_100020CF0 >= v18 + *(int *)(v3 + 56))
    {
      int v74 = 0;
      *(_BYTE *)(v3 + 1416) = 1;
    }

LABEL_8:
    uint64_t v3 = *(void *)v3;
  }

  while (v3);
  if ((v73 & 1) != 0) {
    sub_100006A48(v70, v71, &stru_100014DC8);
  }
  char v67 = v74;
  if ((v72 & 0x100000000LL) != 0) {
    sub_100006A0C();
  }
  return v67 & 1;
}

void sub_100009A94(uint64_t a1)
{
  uint64_t v1 = qword_100020DF8;
  if (!qword_100020DF8) {
    goto LABEL_75;
  }
  do
  {
    if (sub_10000B5CC(v1) && *(_BYTE *)(v1 + 1416) && (*(_BYTE *)(v1 + 62) || *(_DWORD *)(v1 + 192) >= dword_1000202E4))
    {
      bzero(v57, 0x800uLL);
      if (*(void *)(v1 + 128))
      {
        int v3 = snprintf(v57, 0x800uLL, "no successful checkins from %s (%d induced crashes) in %llu seconds\n");
      }

      else if (*(_DWORD *)(v1 + 68) == 3 && *(void *)(v1 + 120) != *(void *)(*(void *)(v1 + 88) + 120LL))
      {
        int v3 = snprintf( v57,  0x800uLL,  "no successful checkins from %s (%d induced crashes) since monitoring enabled by %s (%llu seconds ago)\n");
      }

      else
      {
        int v3 = snprintf( v57,  0x800uLL,  "no successful checkins from %s (%d induced crashes) \n",  *(const char **)(v1 + 40),  *(_DWORD *)(v1 + 196));
      }

      unint64_t v4 = v3;
      else {
        size_t v5 = 0LL;
      }
      if (*(_BYTE *)(v1 + 210))
      {
        uint64_t v6 = *(void *)(v1 + 1240);
        uint64_t v7 = &v57[v3];
        if (v6) {
          int v8 = snprintf( v7,  v5,  "%s returned not alive with context : %s (code: 0x%llx\n",  *(const char **)(v1 + 40),  (const char *)(v1 + 210),  v6);
        }
        else {
          int v8 = snprintf(v7, v5, "service returned not alive with context : %s\n", (const char *)(v1 + 210));
        }
        v4 += v8;
        if (v4 <= 0x800) {
          size_t v5 = 2048 - v4;
        }
        else {
          size_t v5 = 0LL;
        }
      }

      uint64_t v56 = 0LL;
      sub_100005AB0(*(void *)(v1 + 24), &v56);
      if (v56) {
        snprintf(&v57[v4], v5, "%s %s\n", *(const char **)(v1 + 40), v56);
      }
      bzero(v58, 0x800uLL);
      int v9 = snprintf(v58, 0x800uLL, "%s", v57);
      uint64_t v10 = qword_100020DF8;
      if (qword_100020DF8)
      {
        unint64_t v11 = v9;
        else {
          size_t v12 = 0LL;
        }
        do
        {
          if (sub_10000B5CC(v10))
          {
            uint64_t v13 = &v58[v11];
            if (*(_DWORD *)(v10 + 196)) {
              int v14 = snprintf(&v58[v11], v12, "service: %s (%d induced crashes), ");
            }
            else {
              int v14 = snprintf(&v58[v11], v12, "service: %s, ");
            }
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)(v10 + 136);
            size_t v17 = v12 - v14;
            if (v16)
            {
              int v18 = snprintf( &v13[v14],  v17,  "total successful checkins in %llu seconds: %llu, last successful checkin: %llu seconds ago\n",  (a1 - *(void *)(v10 + 112)) / 0x3B9ACA00uLL,  *(void *)(v10 + 128),  (a1 - v16) / 0x3B9ACA00uLL);
            }

            else if (*(_DWORD *)(v10 + 68) == 3 && *(void *)(v10 + 120) != *(void *)(*(void *)(v10 + 88) + 120LL))
            {
              int v18 = snprintf( &v13[v14],  v17,  "no successful checkins since monitoring enabled by %s (%llu seconds ago)\n");
            }

            else
            {
              int v18 = snprintf(&v13[v14], v17, "no successful checkins in %llu seconds\n");
            }

            v11 += v15 + v18;
            if (v11 <= 0x800) {
              size_t v12 = 2048 - v11;
            }
            else {
              size_t v12 = 0LL;
            }
          }

          uint64_t v10 = *(void *)v10;
        }

        while (v10);
      }

      sub_100005620(v58);
    }

    uint64_t v1 = *(void *)v1;
  }

  while (v1);
  uint64_t v19 = qword_100020DF8;
  __chkstk_darwin();
  unint64_t v26 = &v54[-8 * v25 - 1];
  if (!v19) {
LABEL_75:
  }
    sub_10000D51C();
  uint64_t v27 = 0LL;
  do
  {
    if (!*(_BYTE *)(v19 + 1416)) {
      goto LABEL_60;
    }
    if (*(_BYTE *)(v19 + 1417)) {
      sub_10000D51C();
    }
    uint64_t v28 = &v26[8 * (uint64_t)(int)v27];
    *uint64_t v28 = *(void *)(v19 + 24);
    *(_OWORD *)(v28 + 1) = *(_OWORD *)(v19 + 40);
    if (uuid_is_null((const unsigned __int8 *)(v19 + 168)))
    {
      sub_10000C470(0, "service %s incident_id is null", v29, v30, v31, v32, v33, v34, *(void *)(v19 + 40));
      uuid_generate((unsigned __int8 *)v28 + 48);
    }

    else
    {
      uuid_copy((unsigned __int8 *)v28 + 48, (const unsigned __int8 *)(v19 + 168));
    }

    int v36 = *(unsigned __int8 *)(v19 + 61);
    *(_BYTE *)(v19 + 1417) = v36;
    if (!byte_100020E01) {
      goto LABEL_56;
    }
    unsigned int v37 = atomic_load((unsigned int *)(v19 + 184));
    if (v37 != 1)
    {
      int v36 = *(unsigned __int8 *)(v19 + 1417);
LABEL_56:
      if (v36) {
        uint64_t v38 = 581827278LL;
      }
      else {
        uint64_t v38 = 313391822LL;
      }
      goto LABEL_59;
    }

    sub_10000C470( 0,  "skip crashing service %s due to pending tailspin",  v35,  v20,  v21,  v22,  v23,  v24,  *(void *)(v19 + 24));
    *(_BYTE *)(v19 + 1417) = 1;
    uint64_t v38 = 581827278LL;
LABEL_59:
    uint64_t v39 = &v26[8 * (uint64_t)(int)v27];
    v39[3] = v19 + 1418;
    v39[4] = v38;
    v39[5] = *(void *)(v19 + 8);
    uint64_t v27 = (v27 + 1);
LABEL_60:
    uint64_t v19 = *(void *)v19;
  }

  while (v19);
  uint64_t v40 = qword_100020D08;
  if (qword_100020D08)
  {
    sub_10000632C(qword_100020D08, (uint64_t)v26, v27, v20, v21, v22, v23, v24);
    qword_100020D08 = 0LL;
  }

  uint64_t v41 = v27;
  uint64_t v42 = v26 + 5;
  do
  {
    uint64_t v43 = *v42;
    v42 += 8;
    uint64_t v44 = sub_10000B5A8(v43);
    if (!v44) {
      sub_10000D51C();
    }
    int v50 = v44;
    if (!*((_BYTE *)v44 + 1417))
    {
      if (sub_1000068D4(v44[3], (uint64_t)v44 + 1418, v40 != 0, v45, v46, v47, v48, v49))
      {
        ++*((_DWORD *)v50 + 49);
        v50[19] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      }

      if (&_AnalyticsSendEventLazy)
      {
        id v51 = sub_1000057D8();
        uint64_t v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v51);
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472LL;
        v54[2] = sub_10000A168;
        v54[3] = &unk_100014E08;
        v54[4] = v50;
        BOOL v55 = v40 != 0;
        dispatch_async(v52, v54);
      }
    }

    *((_BYTE *)v50 + 1417) = 0;
    v50[20] = qword_100020CF0;
    ++*((_DWORD *)v50 + 48);
    atomic_store(0, (unsigned int *)v50 + 46);
    --v41;
  }

  while (v41);
}

void sub_10000A0B0(id a1)
{
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100020E18);
    uint64_t v7 = (void *)qword_100020DF8;
    if (qword_100020DF8)
    {
      do
      {
        int v8 = (unsigned int *)(v7 + 23);
        while (1)
        {
          unsigned int v9 = __ldaxr(v8);
          if (v9 != 1) {
            break;
          }
          if (!__stlxr(2u, v8))
          {
            sub_10000C470(0, "update service %s tailspin status to DONE", v1, v2, v3, v4, v5, v6, v7[5]);
            goto LABEL_8;
          }
        }

        __clrex();
LABEL_8:
        uint64_t v7 = (void *)*v7;
      }

      while (v7);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100020E18);
  }

uint64_t sub_10000A168(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000A1CC;
  v2[3] = &unk_100014DE8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(_BYTE *)(a1 + 40);
  return AnalyticsSendEventLazy(@"com.apple.Watchdog.ProcessCrashed", v2);
}

id sub_10000A1CC(uint64_t a1)
{
  v6[0] = @"crashedProcess";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(*(void *)(a1 + 32) + 40LL)));
  v6[1] = @"diagsCaptured";
  v7[0] = v2;
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v7[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

void sub_10000A2A0()
{
  id v0 = sub_10000A2D4();
  uint64_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  dispatch_async(v1, &stru_100014E28);
}

id sub_10000A2D4()
{
  if (qword_100020D28 != -1) {
    dispatch_once(&qword_100020D28, &stru_100014E70);
  }
  return (id)qword_100020D20;
}

void sub_10000A314(id a1)
{
}

void sub_10000A334()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v54 = (char)off_1000202E8;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s"));
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (!v3) {
    goto LABEL_8;
  }
  id v10 = sub_10000AEB4();
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (getxattr(off_1000202E8, "BootSessionUUID", value, 0x25uLL, 0, 0) == -1)
  {
    int v26 = *__error();
    uint64_t v27 = __error();
    strerror(*v27);
    sub_10000C470(2, "Cannot get boot session uuid xattr from file with error %d %s", v28, v29, v30, v31, v32, v33, v26);
  }

  else
  {
    size_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  value,  4LL));
    unsigned int v13 = [v12 isEqualToString:v11];

    if (v13)
    {
      uint64_t v20 = sub_10000A6C0();
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

      dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
      dispatch_queue_t v24 = dispatch_queue_create("com.apple.watchdogd.service_recovery", v23);
      uint64_t v25 = (void *)qword_100020D18;
      qword_100020D18 = (uint64_t)v24;

      if (!qword_100020D18) {
        sub_10000D51C();
      }

      id v0 = (NSMutableArray *)v21;
      goto LABEL_8;
    }
  }

  sub_10000C470( 0,  "Found stashed services info from different boot, try to remove it",  v14,  v15,  v16,  v17,  v18,  v19,  v54);
  if (unlink(off_1000202E8)) {
    sub_10000DB08();
  }
LABEL_8:
  sub_10000C470(0, "watchdogd sets up listener for opt-in service registration", v4, v5, v6, v7, v8, v9, v54);
  qword_100020E40 = 0LL;
  atomic_store(0, byte_100020E48);
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0LL);
  uint64_t v35 = (void *)qword_100020E50;
  qword_100020E50 = (uint64_t)v34;

  id v36 = sub_10000A2D4();
  unsigned int v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v36);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", v37, 1uLL);
  uint64_t v39 = (void *)qword_100020D40;
  qword_100020D40 = (uint64_t)mach_service;

  uint64_t v40 = (_xpc_connection_s *)qword_100020D40;
  if (!qword_100020D40) {
    sub_10000D51C();
  }
  value[0] = _NSConcreteStackBlock;
  value[1] = 3221225472LL;
  value[2] = sub_10000AF9C;
  value[3] = &unk_100014EB8;
  BOOL v63 = v37;
  uint64_t v41 = v37;
  xpc_connection_set_event_handler(v40, value);
  xpc_connection_activate((xpc_connection_t)qword_100020D40);
  sub_10000C470( 0,  "watchdogd starts listening incoming opt-in service registration message",  v42,  v43,  v44,  v45,  v46,  v47,  v55);

  if (-[NSMutableArray count](v0, "count"))
  {
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    uint64_t v48 = v0;
    id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v57,  v61,  16LL);
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v58;
      do
      {
        for (uint64_t i = 0LL; i != v50; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v58 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10000A99C;
          block[3] = &unk_100014E50;
          void block[4] = v53;
          dispatch_async((dispatch_queue_t)qword_100020D18, block);
        }

        id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v57,  v61,  16LL);
      }

      while (v50);
    }
  }
}

NSMutableArray *sub_10000A6C0()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  char v45 = (char)off_1000202E8;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s"));
  id v52 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v1,  0LL,  &v52));
  id v3 = v52;

  if (v2)
  {
    id v51 = 0LL;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  &v51));
    id v5 = v51;

    if (v4)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      {
        if ([v4 count])
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          char isKindOfClass = objc_opt_isKindOfClass(v13, v14);

          if ((isKindOfClass & 1) != 0)
          {
            -[NSMutableArray addObjectsFromArray:](v0, "addObjectsFromArray:", v4);
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            uint64_t v46 = v0;
            uint64_t v16 = v0;
            id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v47,  v53,  16LL);
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v48;
              do
              {
                uint64_t v20 = 0LL;
                do
                {
                  if (*(void *)v48 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  id v21 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v47 + 1) + 8 * (void)v20) objectForKeyedSubscript:@"watchdog_optin_service_launchd_job_label"]);
                  char v22 = [v21 UTF8String];
                  sub_10000C470(0, "Found previously stashed service %s", v23, v24, v25, v26, v27, v28, v22);

                  uint64_t v20 = (char *)v20 + 1;
                }

                while (v18 != v20);
                id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v47,  v53,  16LL);
              }

              while (v18);
            }

            id v0 = v46;
          }
        }
      }

      else
      {
        sub_10000C470(2, "Stashed data seems not compliant with expectation", v7, v8, v9, v10, v11, v12, v45);
      }
    }

    else
    {
      id v36 = objc_claimAutoreleasedReturnValue([v5 description]);
      char v37 = [v36 UTF8String];
      sub_10000C470(2, "Failed to parse plist with error : %s", v38, v39, v40, v41, v42, v43, v37);
    }
  }

  else
  {
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    char v29 = [v4 UTF8String];
    sub_10000C470(2, "Failed to read stashed service: %s", v30, v31, v32, v33, v34, v35, v29);
    id v5 = v3;
  }

  return v0;
}

uint64_t sub_10000A99C(uint64_t a1)
{
  return sub_10000A9A4(*(void **)(a1 + 32));
}

uint64_t sub_10000A9A4(void *a1)
{
  id v1 = a1;
  if (!v1) {
    sub_10000D51C();
  }
  uint64_t v2 = v1;

  id v3 = (uint64_t *)calloc(1uLL, 0x720uLL);
  if (v3)
  {
    uint64_t v10 = v3;
    *((_DWORD *)v3 + 17) = 1;
    *((_DWORD *)v3 + 14) = 6;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"watchdog_optin_service_launchd_job_label"]);
    if (v11 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      id v13 = v11;
      v10[3] = (uint64_t)strdup((const char *)[v13 UTF8String]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_bootstrap_service_name"]);

      if (v11 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v11, v14) & 1) != 0))
      {
        id v15 = v11;
        v10[4] = (uint64_t)strdup((const char *)[v15 UTF8String]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"watchdog_optin_service_process_name"]);

        if (v11 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v11, v16) & 1) != 0))
        {
          id v17 = v11;
          v10[5] = (uint64_t)strdup((const char *)[v17 UTF8String]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"watchdog_optin_service_bundle_id"]);

          if (v11 && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v11, v18) & 1) != 0))
          {
            id v19 = v11;
            v10[6] = (uint64_t)strdup((const char *)[v19 UTF8String]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"watchdog_optin_service_skip_crashing"]);
            if (v20)
            {
              uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
                *((_BYTE *)v10 + 61) = [v20 BOOLValue];
              }
            }

            char v22 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_late_first_checkin"]);

            if (v22)
            {
              uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
                *((_BYTE *)v10 + 60) = [v22 BOOLValue];
              }
            }

            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_internal_builds_only"]);

            if (v24)
            {
              uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
                *((_BYTE *)v10 + 17) = [v24 BOOLValue];
              }
            }

            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_num_rounds_to_timeout"]);

            if (v26)
            {
              uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
                *((_DWORD *)v10 + 14) = [v26 unsignedIntValue];
              }
            }

            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_panic_on_first_timeout"]);

            if (v28)
            {
              uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
                *((_BYTE *)v10 + 62) = [v28 BOOLValue];
              }
            }

            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"watchdog_optin_service_capture_ddt_on_timeout"]);

            if (v30)
            {
              uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v30, v37) & 1) != 0) {
                *((_BYTE *)v10 + 63) = [v30 BOOLValue];
              }
            }

            *uint64_t v10 = qword_100020E40;
            qword_100020E40 = (uint64_t)v10;
            atomic_store(1u, byte_100020E48);
            sub_10000C470(0, "wait for service %s to be enrolled", v31, v32, v33, v34, v35, v36, v10[3]);
            dispatch_semaphore_wait((dispatch_semaphore_t)qword_100020E50, 0xFFFFFFFFFFFFFFFFLL);
            unsigned __int8 v44 = atomic_load(byte_100020E48);
            if ((v44 & 1) != 0) {
              sub_10000D51C();
            }
            if (!qword_100020E40)
            {
              uint64_t v47 = 1LL;
              uint64_t v11 = v19;
              goto LABEL_44;
            }

            sub_10000C470(2, "watchdogd refuses to pick up opt-in service %s", v38, v39, v40, v41, v42, v43, v10[3]);
            char v45 = &qword_100020E40;
            *char v45 = *v10;
            free((void *)v10[6]);
            v10[6] = 0LL;
            uint64_t v47 = 6LL;
          }

          else
          {
            uint64_t v30 = 0LL;
            uint64_t v47 = 5LL;
          }

          free((void *)v10[5]);
          v10[5] = 0LL;
        }

        else
        {
          uint64_t v30 = 0LL;
          uint64_t v47 = 5LL;
        }

        free((void *)v10[4]);
        v10[4] = 0LL;
      }

      else
      {
        uint64_t v30 = 0LL;
        uint64_t v47 = 5LL;
      }

      free((void *)v10[3]);
    }

    else
    {
      uint64_t v30 = 0LL;
      uint64_t v47 = 5LL;
    }

    free(v10);
LABEL_44:

    goto LABEL_45;
  }

  sub_10000C470(2, "Failed to allocate new watchdog service", v4, v5, v6, v7, v8, v9, v49);
  uint64_t v47 = 4LL;
LABEL_45:

  return v47;
}

void sub_10000AE50(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.watchdogd.optin_listener", v4);
  id v3 = (void *)qword_100020D20;
  qword_100020D20 = (uint64_t)v2;

  if (!qword_100020D20) {
    sub_10000D51C();
  }
}

id sub_10000AEB4()
{
  if (qword_100020D38 != -1) {
    dispatch_once(&qword_100020D38, &stru_100014E90);
  }
  return (id)qword_100020D30;
}

void sub_10000AEF4(id a1)
{
  size_t v10 = 37LL;
  if (sysctlbyname("kern.bootsessionuuid", v11, &v10, 0LL, 0LL))
  {
    sub_10000C470(2, "Failed to get kern.bootsessionuuid", v1, v2, v3, v4, v5, v6, v9);
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL));
    uint64_t v8 = (void *)qword_100020D30;
    qword_100020D30 = v7;
  }

void sub_10000AF9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    size_t v10 = (void *)xpc_connection_copy_entitlement_value(v3, "com.apple.watchdogd.runtime-opt-in");
    id v17 = v10;
    if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v17))
    {
      sub_10000C470(0, "Client has correct entitlement", v11, v12, v13, v14, v15, v16, v25);
    }

    else
    {
      sub_10000C470(2, "Client doesn't have correct entitlement", v11, v12, v13, v14, v15, v16, v25);
      sub_10000B110(v3, 2u);
    }

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000B188;
    handler[3] = &unk_100014EB8;
    id v18 = v3;
    id v29 = v18;
    xpc_connection_set_event_handler((xpc_connection_t)v18, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v18, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v18);
  }

  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    char string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_10000C470(0, "watchdogd received error message %s", v19, v20, v21, v22, v23, v24, string);
  }

  else
  {
    char type = xpc_get_type(v3);
    sub_10000C470(0, "watchdogd received unknown event of type %p", v4, v5, v6, v7, v8, v9, type);
  }
}

void sub_10000B110(void *a1, unsigned int a2)
{
  xpc_object_t xdict = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    sub_10000D51C();
  }
  uint64_t v4 = reply;
  xpc_dictionary_set_int64(reply, "watchdogd_request_result", a2);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v6) {
    sub_10000D51C();
  }
  uint64_t v7 = v6;
  xpc_connection_send_message(v6, v4);
}

void sub_10000B188(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_uint64(v3, "watchdogd_request_command")
      || (size_t length = 0LL, (data = xpc_dictionary_get_data(v3, "watchdogd_optin_service_identifier", &length)) == 0LL))
    {
      id v10 = 0LL;
      goto LABEL_6;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length));
    if (v19)
    {
      id v92 = 0LL;
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v19,  0LL,  0LL,  &v92));
      if (v10) {
        goto LABEL_16;
      }
      id v20 = objc_claimAutoreleasedReturnValue([v92 description]);
      char v21 = [v20 UTF8String];
      sub_10000C470(2, "Failed to get the opt-in service identifier with error %s", v22, v23, v24, v25, v26, v27, v21);
    }

    id v10 = 0LL;
LABEL_16:

    if (v10)
    {
      unsigned int v28 = sub_10000A9A4(v10);
      if (v28 == 1)
      {
        id v10 = v10;
        sub_10000C470(0, "Try to stash service info into file", v29, v30, v31, v32, v33, v34, v87);
        uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  off_1000202E8));
        unsigned int v38 = [v36 fileExistsAtPath:v37];

        if (v38)
        {
          uint64_t v39 = sub_10000A6C0();
          uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

          uint64_t v35 = (NSMutableArray *)v40;
        }

        -[NSMutableArray addObject:](v35, "addObject:", v10);
        uint64_t v41 = off_1000202E8;
        uint64_t v42 = v35;
        if (!v41) {
          sub_10000D51C();
        }
        uint64_t v43 = v42;
        uint64_t v44 = open(v41, 513, 420LL);
        if ((v44 & 0x80000000) != 0)
        {
          __int128 v57 = __error();
          char v58 = strerror(*v57);
          sub_10000C470(2, "Failed to safely open file : %s", v59, v60, v61, v62, v63, v64, v58);
        }

        else
        {
          uint64_t v45 = v44;
          size_t length = 0LL;
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v43,  200LL,  0LL,  &length));
          id v47 = (id)length;
          if (v47)
          {
            __int128 v48 = v47;
            id v49 = objc_claimAutoreleasedReturnValue([v47 description]);
            char v50 = [v49 UTF8String];
            sub_10000C470(2, "Error parsing plist: %s", v51, v52, v53, v54, v55, v56, v50);

            close(v45);
          }

          else
          {
            int v65 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v45,  0LL);
            id v92 = 0LL;
            -[NSFileHandle writeData:error:](v65, "writeData:error:", v46, &v92);
            id v66 = v92;
            id v67 = v92;
            int v68 = v67;
            if (v66)
            {
              id v69 = objc_claimAutoreleasedReturnValue([v67 description]);
              char v90 = [v69 UTF8String];
              sub_10000C470(2, "Error persisting submission results: %s", v70, v71, v72, v73, v74, v75, v90);
            }

            else
            {
              id v76 = sub_10000AEB4();
              id v69 = (id)objc_claimAutoreleasedReturnValue(v76);
              id v77 = [v69 length];
              if (v69) {
                char v78 = v38;
              }
              else {
                char v78 = 1;
              }
              if ((v78 & 1) == 0)
              {
                size_t v79 = (size_t)v77;
                id v69 = v69;
                if (setxattr(v41, "BootSessionUUID", [v69 UTF8String], v79, 0, 0))
                {
                  uint64_t v80 = __error();
                  char v91 = strerror(*v80);
                  sub_10000C470(2, "setxattr failed with error %s", v81, v82, v83, v84, v85, v86, v91);
                }
              }
            }

            close(v45);
          }
        }

        unsigned int v11 = 1;
      }

      else
      {
        unsigned int v11 = v28;
      }

      goto LABEL_7;
    }

LABEL_6:
    unsigned int v11 = 4;
LABEL_7:
    sub_10000B110(v3, v11);

    goto LABEL_10;
  }

  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    char string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_10000C470(0, "watchdogd received error message %s", v12, v13, v14, v15, v16, v17, string);
  }

  else
  {
    char type = xpc_get_type(v3);
    sub_10000C470(0, "watchdogd received unknown request type %p", v4, v5, v6, v7, v8, v9, type);
  }

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
LABEL_10:
}

uint64_t *sub_10000B5A8(uint64_t a1)
{
  uint64_t result = &qword_100020DF8;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && result[1] != a1);
  return result;
}

BOOL sub_10000B5CC(uint64_t a1)
{
  return !*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 104) && (*(_DWORD *)(a1 + 68) != 3 || *(_BYTE *)(a1 + 80));
}

uint64_t sub_10000B600(uint64_t a1, uint64_t a2)
{
  kern_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  mach_port_t sp;
  if (!a1) {
    sub_10000D51C();
  }
  if (*(_BYTE *)(a1 + 16)) {
    sub_10000D51C();
  }
  if (*(_BYTE *)(a1 + 60)) {
    return 1LL;
  }
  sp = 0;
  uint64_t v5 = bootstrap_look_up(bootstrap_port, *(const char **)(a1 + 32), &sp);
  BOOL v3 = v5 == 0;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v5)
  {
    bootstrap_strerror(v5);
    sub_10000C470(2, "bootstrap_look_up service: %s failed with error: %s", v13, v14, v15, v16, v17, v18, v12);
  }

  else
  {
    sub_10000C470(0, "discovered port for service: %s", v6, v7, v8, v9, v10, v11, *(void *)(a1 + 32));
    *(_DWORD *)(a1 + 104) = sp;
    *(void *)(a1 + 120) = a2;
    *(void *)(a1 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v3;
}

uint64_t sub_10000B6C8(_BYTE *a1, uint64_t a2)
{
  kern_return_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t sp;
  if (!a1) {
    sub_10000D51C();
  }
  *a1 = 0;
  uint64_t v3 = qword_100020DF8;
  if (qword_100020DF8)
  {
    char v5 = 0;
    do
    {
      sp = 0;
      if (!*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 60))
      {
        uint64_t v6 = bootstrap_look_up(bootstrap_port, *(const char **)(v3 + 32), &sp);
        uint64_t v13 = *(void *)(v3 + 32);
        if (v6)
        {
          bootstrap_strerror(v6);
          sub_10000C470( 0,  "late checkin service discovery for service %s failed, returned: %s",  v14,  v15,  v16,  v17,  v18,  v19,  v13);
          *a1 = 1;
        }

        else
        {
          sub_10000C470(0, "found late checkin service: %s", v7, v8, v9, v10, v11, v12, *(void *)(v3 + 32));
          *(_DWORD *)(v3 + 104) = sp;
          *(_BYTE *)(v3 + 60) = 0;
          *(void *)(v3 + 120) = a2;
          *(void *)(v3 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          char v5 = 1;
        }
      }

      uint64_t v3 = *(void *)v3;
    }

    while (v3);
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

void sub_10000B7D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  mach_port_t sp;
  uint64_t v8 = qword_100020DF8;
  if (qword_100020DF8)
  {
    char v9 = 0;
    do
    {
      sp = 0;
      if (!*(_BYTE *)(v8 + 16))
      {
        if (!*(_DWORD *)(v8 + 68)) {
          sub_10000D51C();
        }
        if (!*(_DWORD *)(v8 + 56)) {
          sub_10000D51C();
        }
        id v10 = *(const char **)(v8 + 32);
        if (!*v10) {
          sub_10000D51C();
        }
        if (!**(_BYTE **)(v8 + 24)) {
          sub_10000D51C();
        }
        if (!**(_BYTE **)(v8 + 40)) {
          sub_10000D51C();
        }
        if (!**(_BYTE **)(v8 + 48)) {
          sub_10000D51C();
        }
        if (*(_DWORD *)(v8 + 104)) {
          sub_10000D51C();
        }
        unsigned int v11 = bootstrap_look_up(bootstrap_port, v10, &sp);
        id v18 = *(void *)(v8 + 32);
        if (v11)
        {
          bootstrap_strerror(v11);
          sub_10000C470(2, "bootstrap_look_up service: %s failed with error: %s", v19, v20, v21, v22, v23, v24, v18);
        }

        else
        {
          sub_10000C470(0, "discovered port for service: %s", v12, v13, v14, v15, v16, v17, *(void *)(v8 + 32));
          *(_DWORD *)(v8 + 104) = sp;
          ++v9;
        }
      }

      uint64_t v8 = *(void *)v8;
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  sub_10000C470(0, "found %d services to monitor", a3, a4, a5, a6, a7, a8, v9);
}

uint64_t sub_10000B90C(uint64_t a1)
{
  if (dword_100020E58) {
    sub_10000D51C();
  }
  if (mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_100020E58)) {
    sub_10000D51C();
  }
  uint64_t v8 = qword_100020DF8;
  if (qword_100020DF8)
  {
    uint64_t v9 = 0LL;
    do
    {
      bzero((void *)(v8 + 200), 0x658uLL);
      *(_DWORD *)(v8 + 204) = 14;
      *(_BYTE *)(v8 + 210) = 0;
      *(_BYTE *)(v8 + 1418) = 0;
      if (!*(_BYTE *)(v8 + 16) && *(_DWORD *)(v8 + 104) && (*(_DWORD *)(v8 + 68) != 3 || *(_BYTE *)(v8 + 80)))
      {
        mach_port_name_t name = 0;
        *(_OWORD *)&options.flags = xmmword_10000F238;
        options.reserved[1] = 0LL;
        mach_error_t v10 = sub_10000D43C(*(_DWORD *)(v8 + 104), *(void *)(v8 + 8), a1, name, 0);
        *(_DWORD *)(v8 + 204) = v10;
        if (v10)
        {
          if (v10 == 268435460)
          {
            sub_10000C470( 2,  "failed to kickoff alive request to service %s, %s watchdog request handling code likely hung",  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)(v8 + 40));
          }

          else
          {
            uint64_t v17 = *(void *)(v8 + 40);
            mach_error_string(v10);
            sub_10000C470( 2,  "failed to kickoff alive request to service %s with error: %s",  v18,  v19,  v20,  v21,  v22,  v23,  v17);
          }

          mach_port_mod_refs(mach_task_self_, name, 1u, -1);
        }

        else
        {
          if (mach_port_insert_member(mach_task_self_, name, dword_100020E58)) {
            sub_10000D51C();
          }
          *(_DWORD *)(v8 + 200) = name;
          uint64_t v9 = (v9 + 1);
        }
      }

      uint64_t v8 = *(void *)v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  sub_10000C470(0, "watchdogd sent %d pings for round %llu", v2, v3, v4, v5, v6, v7, v9);
  return v9;
}

void sub_10000BAE0(int a1, __uint64_t a2)
{
  mach_msg_return_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  mach_port_name_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE v29[1256];
  mach_msg_header_t msg;
  if (a1 < 1)
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    int v4 = 0;
    do
    {
      __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (a2 <= v5) {
        break;
      }
      unint64_t v6 = (a2 - v5) / 0xF4240;
      bzero(&msg, 0x4E8uLL);
      bzero(v29, 0x4E8uLL);
      uint64_t v7 = mach_msg(&msg, 1282, 0, 0x52Cu, dword_100020E58, v6, 0);
      if (v7 != 268451843)
      {
        if (v7)
        {
          unsigned int v28 = mach_error_string(v7);
          sub_10000C470(2, "failed to receive message with error: %s", v14, v15, v16, v17, v18, v19, v28);
        }

        else
        {
          ++v4;
          if (msg.msgh_id == 6009000) {
            sub_10000D2D8((uint64_t)&msg, (uint64_t)v29);
          }
          else {
            sub_10000C470( 0,  "received message with an unknown message id: %d (Reply ID should be: %d)",  v8,  v9,  v10,  v11,  v12,  v13,  msg.msgh_id);
          }
        }
      }
    }

    while (v4 < a1);
  }

  for (uint64_t i = qword_100020DF8; i; uint64_t i = *(void *)i)
  {
    uint64_t v21 = *(_DWORD *)(i + 200);
    if (v21)
    {
      mach_port_mod_refs(mach_task_self_, v21, 1u, -1);
      *(_DWORD *)(i + 200) = 0;
    }
  }

  mach_port_mod_refs(mach_task_self_, dword_100020E58, 3u, -1);
  dword_100020E58 = 0;
  sub_10000C470( 0,  "watchdogd_process_replies returning after processing %d replies (%d pings sent)",  v22,  v23,  v24,  v25,  v26,  v27,  v4);
}

uint64_t sub_10000BCB0( int a1, unint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5, uint64_t a6, const void *a7, uint64_t a8)
{
  if (dword_1000202E0 <= a2)
  {
    sub_10000C470( 2,  "received invalid client ID (%llu) in reply message, skipping message",  a3,  a4,  (uint64_t)a5,  a6,  (uint64_t)a7,  a8,  a2);
    return 5LL;
  }

  unsigned int v8 = a8;
  int v12 = a4;
  uint64_t v13 = &qword_100020DF8;
  do
    uint64_t v13 = (uint64_t *)*v13;
  while (v13 && v13[1] != a2);
  if (*((_DWORD *)v13 + 50) != a1)
  {
    sub_10000C470( 2,  "received message for client (with claimed client ID: %llu) doesn't match receive port, skipping message",  a3,  a4,  (uint64_t)a5,  a6,  (uint64_t)a7,  a8,  a2);
    return 5LL;
  }

  sub_10000C470( 1,  "received reply message from %s round: %llu is_alive: %d string: %s",  a3,  a4,  (uint64_t)a5,  a6,  (uint64_t)a7,  a8,  v13[5]);
  if (*((_DWORD *)v13 + 51)) {
    sub_10000D51C();
  }
  *((_BYTE *)v13 + 208) = 1;
  *((_BYTE *)v13 + 209) = v12 != 0;
  v13[155] = a6;
  if (*a5) {
    __strlcpy_chk((char *)v13 + 210);
  }
  if (*((_DWORD *)v13 + 17) != 2) {
    return 0LL;
  }
  sub_10000C470( 0,  "reply from controller %s for round: %llu includes %d ephemeral services",  v14,  v15,  v16,  v17,  v18,  v19,  v13[5]);
  if (!v8) {
    return 0LL;
  }
  if (v8 >= 6) {
    sub_10000D51C();
  }
  memcpy(v13 + 156, a7, 32LL * v8);
  uint64_t result = 0LL;
  v13[176] = v8;
  return result;
}

void sub_10000BE20()
{
  if (qword_100020D58 != -1) {
    dispatch_once(&qword_100020D58, &stru_100014F60);
  }
  if ((byte_100020D60 & 1) == 0)
  {
    id v0 = IOServiceMatching("IOService");
    if (!v0) {
      sub_10000D51C();
    }
    uint64_t v1 = v0;
    CFDictionarySetValue(v0, @"IOPropertyMatch", &off_100015CE8);
    dword_100020D48 = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    if (!dword_100020D48) {
      sub_10000D51C();
    }
  }

void sub_10000BEBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (qword_100020D58 != -1) {
    dispatch_once(&qword_100020D58, &stru_100014F60);
  }
  if (byte_100020D60 == 1)
  {
    sub_10000C470( 0,  "skipping setting PMU boot stage because -wdt_no_pmu found in boot-args or no-pmu found in EDT",  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  }

  else
  {
    if (!dword_100020D48) {
      sub_10000D51C();
    }
    if ((byte_100020D64 & 1) == 0)
    {
      if (IORegistryEntrySetCFProperty( dword_100020D48,  @"IOPMUBootStage",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 255LL)))
      {
        sub_10000C470( 2,  "Unable to set device boot stage to 0x%x, IORegistryEntrySetCFProperty returned 0x%x",  v9,  v10,  v11,  v12,  v13,  v14,  255);
      }

      byte_100020D64 = 1;
    }
  }

void sub_10000BF94()
{
  if (qword_100020D58 != -1) {
    dispatch_once(&qword_100020D58, &stru_100014F60);
  }
  if ((byte_100020D60 & 1) == 0)
  {
    if (!dword_100020D48) {
      sub_10000D51C();
    }
    if (!qword_100020D50)
    {
      if (objc_opt_class(&OBJC_CLASS___RBSProcessMonitor))
      {
        uint64_t v0 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  &stru_100014F00));
        uint64_t v1 = (void *)qword_100020D50;
        qword_100020D50 = v0;
      }

      id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.frontboard.visibility"));
      sub_10000C26C(0, 4, v2, @"com.apple.SpringBoard");
    }
  }

void sub_10000C07C(id a1, RBSProcessMonitorConfiguring *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
  [v3 setValues:1];
  unsigned int v8 = @"com.apple.frontboard.visibility";
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v3 setEndowmentNamespaces:v4];

  -[RBSProcessMonitorConfiguring setStateDescriptor:](v2, "setStateDescriptor:", v3);
  __uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingProcessTypeApplication]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingProcessTypeApplication"));
  uint64_t v7 = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  -[RBSProcessMonitorConfiguring setPredicates:](v2, "setPredicates:", v6);

  -[RBSProcessMonitorConfiguring setUpdateHandler:](v2, "setUpdateHandler:", &stru_100014F40);
}

void sub_10000C198(id a1, RBSProcessMonitor *a2, RBSProcessHandle *a3, RBSProcessStateUpdate *a4)
{
  __uint64_t v5 = a4;
  unint64_t v6 = a3;
  int v7 = -[RBSProcessHandle pid](v6, "pid");
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate state](v5, "state"));
  int v8 = [v13 taskState];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate state](v5, "state"));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endowmentNamespaces]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v6, "bundle"));

  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  sub_10000C26C(v7, v8, v10, v12);
}

void sub_10000C26C(int a1, int a2, void *a3, const __CFString *a4)
{
  id v7 = a3;
  int v8 = v7;
  switch(a2)
  {
    case 1:
    case 3:
      goto LABEL_6;
    case 2:
    case 4:
      id v11 = v7;
      unsigned int v9 = [v7 containsObject:@"com.apple.frontboard.visibility"];
      int v8 = v11;
      if (v9)
      {
        else {
          int v10 = a1;
        }
      }

      else
      {
LABEL_6:
        if (dword_100020D68 != a1) {
          goto LABEL_9;
        }
        id v11 = v8;
        sub_10000C3DC(@"com.apple.SpringBoard");
        int v10 = 0;
      }

      dword_100020D68 = v10;
      int v8 = v11;
LABEL_9:

      return;
    default:
      goto LABEL_9;
  }

void sub_10000C328(id a1)
{
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    uint64_t v1 = (const char *)sub_1000080A0();
    if (strnstr(v1, "-wdt_no_pmu", 0x400uLL))
    {
      byte_100020D60 = 1;
    }

    else
    {
      io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/arm-io/wdt");
      if (v2)
      {
        io_object_t v3 = v2;
        CFTypeRef v4 = IORegistryEntrySearchCFProperty(v2, "IODeviceTree", @"no-pmu", kCFAllocatorDefault, 3u);
        if (v4)
        {
          byte_100020D60 = 1;
          CFRelease(v4);
        }

        IOObjectRelease(v3);
      }
    }
  }

uint64_t sub_10000C3DC(const __CFString *a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = &stru_100015978;
  }
  uint64_t v2 = IORegistryEntrySetCFProperty(dword_100020D48, @"IOPMUBootAppName", v1);
  uint64_t v3 = v2;
  if ((_DWORD)v2)
  {
    char v17 = mach_error_string(v2);
    sub_10000C470(2, "failed to record foreground application with error %s", v4, v5, v6, v7, v8, v9, v17);
  }

  else
  {
    char CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    sub_10000C470(0, "set foreground app %s in PMU", v10, v11, v12, v13, v14, v15, CStringPtr);
  }

  return v3;
}

void sub_10000C470( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_10000C4C0(0, a1, v11, a2, &a9);
}

void sub_10000C4C0(char a1, int a2, uint64_t a3, const char *a4, va_list a5)
{
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  v45[3] = 0LL;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  int v44 = 0;
  if (a2 == 2) {
    char v10 = 16;
  }
  else {
    char v10 = 2 * (a2 == 1);
  }
  uint64_t v11 = a1 & 1;
  if (pthread_getspecific(qword_100020E38))
  {
    if (v11)
    {
      uint64_t v27 = _os_assert_log(!(a1 & 1));
      uint64_t v28 = _os_crash(v27);
      sub_10000DB44(v28);
    }

    if (!qword_100020D70)
    {
      uint64_t v29 = _os_assert_log(0LL);
      uint64_t v30 = _os_crash(v29);
      sub_10000DB44(v30);
    }

    bzero(&v47, 0x204uLL);
    *(void *)&data[4] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    *(_DWORD *)data = a2;
    int v12 = vsnprintf(v48, 0x200uLL, a4, a5);
    if (v12 >= 512) {
      int v13 = 512;
    }
    else {
      int v13 = v12;
    }
    int v47 = v13;
    IOReturn v14 = IODataQueueEnqueue((IODataQueueMemory *)qword_100020D70, data, v13 + 16);
    if (v14 != 268435460 && v14)
    {
      if (v14 != -536870168)
      {
        uint64_t v31 = _os_assert_log(v14 == 268435460);
        uint64_t v32 = _os_crash(v31);
        sub_10000DB44(v32);
      }

      do
        unsigned int v15 = __ldaxr(&dword_100020E5C);
      while (__stlxr(v15 + 1, &dword_100020E5C));
    }
  }

  else
  {
    if (qword_100020DB8 != -1) {
      dispatch_once(&qword_100020DB8, &stru_100014FC0);
    }
    if (dword_100020DC0 && qword_100020DC8 != -1) {
      dispatch_once(&qword_100020DC8, &stru_100014FE0);
    }
    *(void *)data = 0LL;
    int v16 = vasprintf((char **)data, a4, a5);
    if (*(void *)data && v16 >= 1)
    {
      unint64_t v17 = a1 & 2;
      uint64_t v18 = (void *)qword_100020DA8;
      if (!v17) {
        uint64_t v18 = &_os_log_default;
      }
      id v19 = v18;
      uint64_t v20 = v19;
      uint64_t v21 = (dispatch_queue_s *)qword_100020D98;
      if (v11)
      {
        unint64_t v25 = v17 >> 1;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_10000CDE8;
        v38[3] = &unk_100015070;
        uint64_t v23 = (id *)v39;
        id v26 = v19;
        char v41 = v10;
        v39[3] = a3;
        v39[4] = *(void *)data;
        v39[0] = v26;
        v39[1] = v43;
        int v40 = a2;
        char v42 = v25;
        v39[2] = v45;
        dispatch_sync(v21, v38);
      }

      else
      {
        unint64_t v22 = v17 >> 1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000D01C;
        block[3] = &unk_100015070;
        uint64_t v23 = (id *)v34;
        id v24 = v19;
        char v36 = v10;
        v34[3] = a3;
        v34[4] = *(void *)data;
        v34[0] = v24;
        v34[1] = v43;
        int v35 = a2;
        char v37 = v22;
        v34[2] = v45;
        dispatch_async(v21, block);
      }
    }
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

void sub_10000C828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

void sub_10000C85C( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_10000C4C0(1, a1, v11, a2, &a9);
}

void sub_10000C8AC()
{
  uint64_t v0 = malloc(0x8000uLL);
  qword_100020D70 = (uint64_t)v0;
  if (!v0) {
    sub_10000D51C();
  }
  uint64_t v1 = v0;
  bzero(v0 + 1, 0x7FFCuLL);
  *uint64_t v1 = 32728;
  mach_port_name_t NotificationPort = IODataQueueAllocateNotificationPort();
  dword_100020D78 = NotificationPort;
  if (!NotificationPort) {
    sub_10000D51C();
  }
  mach_port_insert_right(mach_task_self_, NotificationPort, NotificationPort, 0x14u);
  if (IODataQueueSetNotificationPort((IODataQueueMemory *)qword_100020D70, dword_100020D78)) {
    sub_10000D51C();
  }
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __uint64_t v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = dispatch_queue_create("com.apple.watchdogd.rt_log", v11);
  dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  dword_100020D78,  0LL,  v4);
  uint64_t v6 = (void *)qword_100020D80;
  qword_100020D80 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100020D80, &stru_100014F80);
  dispatch_activate((dispatch_object_t)qword_100020D80);
  uint64_t v7 = (const char *)sub_1000080A0();
  if (v7)
  {
    size_t v8 = strlen(v7);
    uint64_t v9 = strnstr(v7, "wdt_logging=", v8);
    if (v9)
    {
      char v10 = v9;
      if (strlen(v9) >= 0xD) {
        dword_100020DC0 = atoi(v10 + 12);
      }
    }
  }

  +[OSLaunchdJob setDisableLogging_4watchdogd:](&OBJC_CLASS___OSLaunchdJob, "setDisableLogging_4watchdogd:", 1LL);
}

void sub_10000CA28(id a1)
{
  if (IODataQueueWaitForAvailableData((IODataQueueMemory *)qword_100020D70, dword_100020D78)) {
    sub_10000D51C();
  }
  do
  {
    bzero(&data, 0x210uLL);
    uint32_t dataSize = 528;
    mach_error_t v1 = IODataQueueDequeue((IODataQueueMemory *)qword_100020D70, &data, &dataSize);
    mach_error_t v8 = v1;
    if (v1)
    {
      if (v1 == -536870169) {
        return;
      }
      char v22 = mach_error_string(v1);
      sub_10000C470(2, "LOGGING ERROR: IODataQueueDequeue returned %s", v9, v10, v11, v12, v13, v14, v22);
    }

    else
    {
      sub_10000CB5C(data, v25, v2, v3, v4, v5, v6, v7, (char)&v26);
      do
        unsigned int v21 = __ldaxr(&dword_100020E5C);
      while (__stlxr(0, &dword_100020E5C));
      if (v21) {
        sub_10000C470(2, "dropped %d messages from service monitoring thread", v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  while (v8 != -536870169);
}

void sub_10000CB5C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

id sub_10000CB98()
{
  if (qword_100020D90 != -1) {
    dispatch_once(&qword_100020D90, &stru_100014FA0);
  }
  return (id)qword_100020D88;
}

void sub_10000CBD8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.watchdogd", "signpost");
  uint64_t v2 = (void *)qword_100020D88;
  qword_100020D88 = (uint64_t)v1;
}

void sub_10000CC08(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.watchdogd.log", v6);
  uint64_t v3 = (void *)qword_100020D98;
  qword_100020D98 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.watchdogd", "service-monitoring-thread");
  uint64_t v5 = (void *)qword_100020DA8;
  qword_100020DA8 = (uint64_t)v4;
}

void sub_10000CC7C(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  qword_100020DB0 = (uint64_t)fopen("/dev/console", "w+");
  uint64_t v3 = __error();
  if (qword_100020DB0)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.watchdogd.serial_log", v2);
    uint64_t v5 = (void *)qword_100020DA0;
    qword_100020DA0 = (uint64_t)v4;

    uint64_t v6 = (dispatch_queue_s *)qword_100020D98;
    uint64_t v7 = &stru_100015020;
  }

  else
  {
    int v8 = *v3;
    uint64_t v6 = (dispatch_queue_s *)qword_100020D98;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CD54;
    block[3] = &unk_100015000;
    int v10 = v8;
    uint64_t v7 = (Block_layout *)block;
  }

  dispatch_async(v6, v7);
}

void sub_10000CD54(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000DB48(a1);
  }
}

void sub_10000CD90(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_attr_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "watchdogd logging to serial enabled",  v1,  2u);
  }

void sub_10000CDE8(uint64_t a1)
{
  dispatch_queue_t v2 = *(os_log_s **)(a1 + 32);
  os_log_type_t v3 = *(_BYTE *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }

  if (qword_100020DA0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = sub_10000CF28( *(const char **)(a1 + 64),  *(void *)(a1 + 56),  *(_DWORD *)(a1 + 72),  *(unsigned __int8 *)(a1 + 77),  (char **)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                            + 24LL));
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(void *)(*(void *)(v6 + 8) + 24LL))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000CFC8;
      v8[3] = &unk_100015048;
      uint64_t v7 = *(void *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_sync((dispatch_queue_t)qword_100020DA0, v8);
    }
  }

  free(*(void **)(a1 + 64));
}

uint64_t sub_10000CF28(const char *a1, uint64_t a2, int a3, int a4, char **a5)
{
  if (!a1) {
    sub_10000D51C();
  }
  if (a3 == 2)
  {
    uint64_t v5 = "ERROR";
    goto LABEL_10;
  }

  if (a3)
  {
    if (dword_100020DC0 >= 3)
    {
      uint64_t v5 = "DEBUG";
      goto LABEL_10;
    }

    return 0LL;
  }

  if (dword_100020DC0 < 2) {
    return 0LL;
  }
  uint64_t v5 = "INFO";
LABEL_10:
  uint64_t v7 = "";
  if (a4) {
    uint64_t v7 = "service-monitoring thread:";
  }
  return asprintf(a5, "watchdogd: %s %llu: %s: %s\n", v7, a2, v5, a1);
}

uint64_t sub_10000CFC8(uint64_t a1)
{
  return fflush((FILE *)qword_100020DB0);
}

void sub_10000D01C(uint64_t a1)
{
  dispatch_queue_t v2 = *(os_log_s **)(a1 + 32);
  os_log_type_t v3 = *(_BYTE *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }

  if (qword_100020DA0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = sub_10000CF28( *(const char **)(a1 + 64),  *(void *)(a1 + 56),  *(_DWORD *)(a1 + 72),  *(unsigned __int8 *)(a1 + 77),  (char **)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                            + 24LL));
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(void *)(*(void *)(v6 + 8) + 24LL))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000D15C;
      v8[3] = &unk_100015048;
      uint64_t v7 = *(void *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_async((dispatch_queue_t)qword_100020DA0, v8);
    }
  }

  free(*(void **)(a1 + 64));
}

uint64_t sub_10000D15C(uint64_t a1)
{
  return fflush((FILE *)qword_100020DB0);
}

_DWORD *(*sub_10000D1B0(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 6009000) {
    return sub_10000D1CC;
  }
  else {
    return 0LL;
  }
}

_DWORD *sub_10000D1CC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_15;
  }
  os_log_type_t v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[14];
  if (v5 > 0x400) {
    goto LABEL_15;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  int v8 = (char *)result + v6;
  uint64_t v9 = *((unsigned int *)v8 + 17);
  int v10 = v4 - v6;
  uint64_t result = memchr(result + 15, 0, v4 - 60);
  if (result)
  {
    uint64_t result = (_DWORD *)sub_10000BCB0( v3[3],  *((void *)v3 + 4),  *((void *)v3 + 5),  v3[12],  (_BYTE *)v3 + 60,  *(void *)(v8 + 60),  v8 + 72,  v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  else
  {
LABEL_15:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  return result;
}

uint64_t sub_10000D2D8(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v4 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (*(_DWORD *)(a1 + 20) == 6009000)
  {
    if ((*(_DWORD *)a1 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    uint64_t v6 = *(unsigned int *)(a1 + 4);
    unsigned int v7 = *(_DWORD *)(a1 + 56);
    if (v7 > 0x400) {
      goto LABEL_16;
    }
    unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
    uint64_t v10 = a1 + v8;
    uint64_t v11 = *(unsigned int *)(v10 + 68);
    int v12 = v6 - v8;
    if (memchr((const void *)(a1 + 60), 0, v6 - 60))
    {
      *(_DWORD *)(a2 + 32) = sub_10000BCB0( *(_DWORD *)(a1 + 12),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48),  (_BYTE *)(a1 + 60),  *(void *)(v10 + 60),  (const void *)(v10 + 72),  v11);
    }

    else
    {
LABEL_16:
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }

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

uint64_t sub_10000D43C(int a1, uint64_t a2, uint64_t a3, int a4, mach_msg_timeout_t timeout)
{
  int v10 = a4;
  int v11 = 1376256;
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  v8[0] = -2147483629;
  v8[2] = a1;
  *(_OWORD *)mach_port_name_t name = xmmword_10000F270;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)v8);
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)v8, 17, 0x40u, 0, 0, timeout, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((v8[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, name[0]);
    }
    mach_msg_destroy((mach_msg_header_t *)v8);
  }

  return v6;
}

void sub_10000D51C()
{
  uint64_t v0 = sub_100004290();
  _os_crash(v0);
  __break(1u);
}

void sub_10000D530( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D564( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D598( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D5CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D600(void *a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([a1 description]);
  [v1 UTF8String];
  sub_100004278( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Unable to create plist out of services - %s",  v3,  v4,  v5,  v6,  2u);
}

void sub_10000D690(void *a1)
{
}

void sub_10000D710(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "optin registration failed due to %d",  (uint8_t *)v1,  8u);
  sub_100004288();
}

void sub_10000D788( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004268( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "result doesn't have a valid return",  a5,  a6,  a7,  a8,  0);
  sub_100004288();
}

void sub_10000D7BC()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004278( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "could not retrieve device boot-args, failed with error: %s",  v2,  v3,  v4,  v5,  2u);
}

void sub_10000D838()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_10000D850(char a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000C470(2, "failed to submit launchd job for %s with error %s", v3, v4, v5, v6, v7, v8, a1);
  _os_crash("failed to submit launchd job for test service");
  __break(1u);
}

void sub_10000D894()
{
}

void sub_10000D8AC(char **a1, int a2)
{
  *a1 = 0LL;
  uint64_t v3 = asprintf(a1, "IOServiceOpen failed with error : 0x%x", a2);
  sub_1000057D0(v3, "%s", v4, v5, v6, v7, v8, v9, (char)*a1);
  _os_crash(*a1);
  __break(1u);
}

void sub_10000D8F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0(a1, "Failed to call kIOWatchdogDaemonCheckEnabled method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckEnabled, ...) failed");
  __break(1u);
}

void sub_10000D920( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C470( 2,  "Failed to call kIOWatchdogDaemonCheckUserspaceDefanged method, returned : 0x%x",  a3,  a4,  a5,  a6,  a7,  a8,  a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckUserspaceDefanged, ...) failed");
  __break(1u);
}

void sub_10000D950( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C470(2, "Failed to call kIOWatchdogDaemonCheckin method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckin, ...) failed");
  __break(1u);
}

void sub_10000D980( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0( a1,  "Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : 0x%x",  a3,  a4,  a5,  a6,  a7,  a8,  a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonDisableUserspaceMonitoring, ...) failed");
  __break(1u);
}

void sub_10000D9AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0( a1,  "Failed to call kIOWatchdogDaemonReenableUserspaceMonitoring method, returned : 0x%x",  a3,  a4,  a5,  a6,  a7,  a8,  a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonReenableUserspaceMonitoring, ...) failed");
  __break(1u);
}

void sub_10000D9D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0( a1,  "Failed to call kIOWatchdogDaemonCheckIOKitMonitoringEnabled method, returned : 0x%x",  a3,  a4,  a5,  a6,  a7,  a8,  a1);
  _os_crash("IOConnectCallStructMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckIOKitMonitoringEnabled, ...) failed");
  __break(1u);
}

void sub_10000DA04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0(a1, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestSocWatchdog, ...) failed");
  __break(1u);
}

void sub_10000DA30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0(a1, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestSocWatchdog (panic), ...) failed");
  __break(1u);
}

void sub_10000DA5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057D0(a1, "Failed to call kIOWatchdogDaemonTestIOKitBusy method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestIOKitBusy, ...) failed");
  __break(1u);
}

void sub_10000DA88()
{
  uint64_t v0 = __error();
  uint64_t v1 = sub_100007A7C(v0);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DAA0(int a1)
{
  uint64_t v1 = sub_100007A74(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DAB4()
{
  uint64_t v0 = __error();
  char v1 = strerror(*v0);
  sub_10000C85C(2, "could not retrieve device boot-args, failed with error: %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("could not retrieve device boot-args");
  __break(1u);
}

void sub_10000DAF0(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DB08()
{
  uint64_t v0 = __error();
  char v1 = strerror(*v0);
  sub_10000C470(0, "Failed to unlink prior stashed services info with error %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("unlink services stash file failed");
  __break(1u);
}

void sub_10000DB48(uint64_t a1)
{
  char v1 = strerror(*(_DWORD *)(a1 + 32));
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to open /dev/console with error : %s",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}