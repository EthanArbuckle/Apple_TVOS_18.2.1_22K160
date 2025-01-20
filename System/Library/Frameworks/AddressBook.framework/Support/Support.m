void sub_100003168()
{
  byte_100008050 = 0;
}

BOOL sub_100003174()
{
  mach_error_t v0 = bootstrap_check_in(bootstrap_port, "com.apple.ABDatabaseDoctor", &sp);
  mach_error_t v1 = v0;
  if (v0)
  {
    v2 = mach_error_string(v0);
    syslog(3, "Couldn't register with bootstrap server %s (0x%x); failing...", v2, v1);
  }

  else
  {
    v3 = CFMachPortCreateWithPort(kCFAllocatorDefault, sp, (CFMachPortCallBack)sub_100003168, 0LL, 0LL);
    RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v3, 0LL);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 1u);
    CFRelease(RunLoopSource);
    CFRelease(v3);
  }

  return v1 == 0;
}

uint64_t start()
{
  mach_error_t v0 = objc_autoreleasePoolPush();
  if (sub_100003174() && (ABDeviceIsBeforeFirstUnlockWithDataProtected() & 1) == 0)
  {
    mach_error_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v2 = (void *)ABCAddressBookCopyDBDirectory();
    if (v2)
    {
      v3 = (void *)ABCAddressBookCopyDelegateDBDirectories([v1 addObject:v2]);
      if (v3) {
        [v1 addObjectsFromArray:v3];
      }
    }

    [v1 enumerateObjectsUsingBlock:&stru_1000041E8];
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100003308(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  v5 = kCFRunLoopDefaultMode;
  v6 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  v7 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  v8 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  id v39 = v4;
  do
  {
    byte_100008050 = 1;
    uint64_t v9 = getpid();
    proc_disable_cpumon(v9);
    v10 = (const void *)ABAddressBookCreateWithDatabaseDirectoryAndForceInProcessLinking(v4, 1LL);
    ABDatabaseIntegrityCheckWithAddressBook();
    buf[0] = 1;
    if ((ABCIsSortDataValid(v10, buf) & 1) == 0 && buf[0])
    {
      ABCRebuildSearchIndex(v10);
      ABCResetSortData(v10, 100LL);
    }

    ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded(v10);
    if ([v6[19] isLinkDataValidForAddressBook:v10])
    {
      v11 = os_log_create("com.apple.contacts.database-doctor", "autolinking");
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BEGIN autolinking", buf, 2u);
      }

      ABDiagnosticsEnabled(v12);
      _ABLog2( 5LL,  "void _performAutoLinking(ABAddressBookRef)",  117LL,  0LL,  @"[DatabaseDoctor] Starting autolinking...");
      id v13 = [objc_alloc((Class)v6[19]) initWithAddressBook:v10];
      int v14 = sub_100003804(@"ABAutolinkLimit", 200LL, @"limit");
      CFIndex v15 = sub_100003804(@"ABAutolinkSleepSeconds", 1LL, @"sleep time");
      os_signpost_id_t v16 = os_signpost_id_generate(v11);
      v17 = v11;
      v18 = v17;
      unint64_t v41 = v16 - 1;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "Autolinking",  (const char *)&unk_100003E5E,  buf,  2u);
      }

      os_signpost_id_t spid = v16;
      uint64_t v19 = v14;

      while (1)
      {
        os_signpost_id_t v20 = os_signpost_id_generate(v18);
        v21 = v18;
        v22 = v21;
        if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "Autolinking (batch)",  (const char *)&unk_100003E5E,  buf,  2u);
        }

        unsigned int v23 = [v13 linkRecentlyAddedPeopleWithLimit:v19];
        v24 = v22;
        v25 = v24;
        if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  v20,  "Autolinking (batch)",  (const char *)&unk_100003E5E,  buf,  2u);
        }

        if (!v23) {
          break;
        }
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
        if (v26)
        {
          *(_DWORD *)buf = 67109120;
          int v43 = v15;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Sleeping for %i seconds", buf, 8u);
        }

        ABDiagnosticsEnabled(v26);
        CFIndex v38 = v15;
        _ABLog2( 5LL,  "void _performAutoLinking(ABAddressBookRef)",  132LL,  0LL,  @"[DatabaseDoctor] Sleeping for %i seconds...");
        sleep(v15);
      }

      v27 = v25;
      v28 = v27;
      if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  spid,  "Autolinking",  (const char *)&unk_100003E5E,  buf,  2u);
      }

      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
      v6 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      v7 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      v8 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "END autolinking", buf, 2u);
      }

      ABDiagnosticsEnabled(v29);
      _ABLog2( 5LL,  "void _performAutoLinking(ABAddressBookRef)",  139LL,  0LL,  @"[DatabaseDoctor] Done autolinking.");

      v5 = kCFRunLoopDefaultMode;
      id v4 = v39;
    }

    id v30 = [objc_alloc((Class)v7[18]) initWithAddressBook:v10];
    [v30 performPendingMergeOrDeleteAction];

    CFRelease(v10);
    uint64_t v31 = getpid();
    proc_set_cpumon_defaults(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v8[20] date]);
    if (byte_100008050 == 1)
    {
      do
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[20], "date", v38));
        [v33 timeIntervalSinceDate:v32];
        double v35 = v34;

        if (v35 >= 10.0) {
          break;
        }
        unsigned __int32 v36 = CFRunLoopRunInMode(v5, 10.0 - v35, 1u) - 3;
      }

      while (byte_100008050 == 1 && v36 < 0xFFFFFFFE);
    }
  }

  while (byte_100008050 != 1);
}

CFIndex sub_100003804(const __CFString *a1, CFIndex a2, void *a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  id v5 = a3;
  v6 = (const __CFString *)ABPeoplePickerPrefs();
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(a1, v6, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CFIndex v8 = AppIntegerValue;
    ABDiagnosticsEnabled(AppIntegerValue);
    _ABLog2( 5LL,  "int _valueFromDefaults(CFStringRef, int, NSString *__strong)",  74LL,  0LL,  @"[DatabaseDoctor] Using %@ from defaults: %i");
    a2 = v8;
  }

  else
  {
    ABDiagnosticsEnabled(AppIntegerValue);
    _ABLog2( 5LL,  "int _valueFromDefaults(CFStringRef, int, NSString *__strong)",  77LL,  0LL,  @"[DatabaseDoctor] Using %@ from code: %i");
  }

  return a2;
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}