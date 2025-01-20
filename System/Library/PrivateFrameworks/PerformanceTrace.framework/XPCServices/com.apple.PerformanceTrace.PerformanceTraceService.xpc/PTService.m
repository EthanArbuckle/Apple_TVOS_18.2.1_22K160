@interface PTService
- (BOOL)_appendLogContentToKtraceFile:(id)a3 withError:(id *)a4;
- (BOOL)_aspSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_configureKtraceSession:(id)a3 withError:(id *)a4;
- (BOOL)_connectionIsEntitled:(id)a3 toEntitlement:(id)a4;
- (BOOL)_faultSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_graphicsSamplingInit;
- (BOOL)_markPurgable:(id)a3 withUrgency:(unint64_t)a4;
- (BOOL)_postProcessKtraceFile:(id)a3 withError:(id *)a4;
- (BOOL)_sendNotification:(id)a3;
- (BOOL)_syscallSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_validSymbolicationPreferences;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDate)startTime;
- (NSXPCConnection)connection;
- (OS_dispatch_source)activeTimer;
- (PTService)init;
- (PTTraceConfig)activeConfig;
- (id)_generateToken:(id)a3;
- (id)_traceRecordArgsArrayFromConfig:(id)a3 outputFilePath:(id)a4 error:(id *)a5;
- (ktrace_recording)ktraceRecording;
- (ktrace_session)ktraceSession;
- (void)_graphicsSamplingTeardown;
- (void)_startPerformanceTrace:(id)a3;
- (void)_startPerformanceTraceLegacy:(id)a3;
- (void)_stopPerformanceTrace;
- (void)_stopPerformanceTraceLegacy;
- (void)_symbolicateKtraceFile:(id)a3;
- (void)applyConfig:(id)a3 withError:(id)a4;
- (void)getCurrentStoredConfig:(id)a3;
- (void)pingService:(id)a3;
- (void)resetConfig:(id)a3;
- (void)setActiveConfig:(id)a3;
- (void)setActiveTimer:(id)a3;
- (void)setKtraceRecording:(ktrace_recording *)a3;
- (void)setKtraceSession:(ktrace_session *)a3;
- (void)setStartTime:(id)a3;
- (void)startPerformanceTrace:(id)a3;
- (void)stopPerformanceTrace;
@end

@implementation PTService

- (PTService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PTService;
  result = -[PTService init](&v3, "init");
  if (result) {
    result->_ktraceSession = 0LL;
  }
  return result;
}

- (BOOL)_connectionIsEntitled:(id)a3 toEntitlement:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:a4]);
  if ((objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_sendNotification:(id)a3
{
  id v3 = a3;
  if (objc_opt_class(&OBJC_CLASS___UNUserNotificationCenter))
  {
    v4 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.PerformanceTrace.notifications");
    unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
    -[UNMutableNotificationContent setThreadIdentifier:]( v5,  "setThreadIdentifier:",  @"performanceTraceNotifications");
    -[UNMutableNotificationContent setTitle:](v5, "setTitle:", @"Performance Trace");
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
      v7 = (void *)objc_claimAutoreleasedReturnValue( [@"prefs:root=Privacy&path=PROBLEM_REPORTING/DIAGNOSTIC_USAGE_DATA/" stringByAppendingPathComponent:v6]);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Saved %@.", v9));
      -[UNMutableNotificationContent setBody:](v5, "setBody:", v10);

      -[UNMutableNotificationContent setDefaultActionURL:](v5, "setDefaultActionURL:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationActionIcon iconWithSystemImageName:]( &OBJC_CLASS___UNNotificationActionIcon,  "iconWithSystemImageName:",  @"doc.text.below.ecg"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAction actionWithIdentifier:title:url:options:icon:]( &OBJC_CLASS___UNNotificationAction,  "actionWithIdentifier:title:url:options:icon:",  @"viewAction",  @"View",  v8,  0LL,  v11));
      v30 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"performanceTraceNotifications",  v13,  &__NSArray0__struct,  0LL));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
      -[UNUserNotificationCenter setNotificationCategories:](v4, "setNotificationCategories:", v15);
    }

    else
    {
      -[UNMutableNotificationContent setBody:](v5, "setBody:", @"Performance Trace failed to complete.");
    }

    -[UNMutableNotificationContent setCategoryIdentifier:]( v5,  "setCategoryIdentifier:",  @"performanceTraceNotifications");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v18,  v5,  0LL));

    *(void *)buf = 0LL;
    v25 = buf;
    uint64_t v26 = 0x3032000000LL;
    v27 = sub_1000021D8;
    v28 = sub_1000021E8;
    id v29 = 0LL;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000021F0;
    v23[3] = &unk_1000145E8;
    v23[4] = buf;
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( v4,  "addNotificationRequest:withCompletionHandler:",  v19,  v23);
    uint64_t v20 = *((void *)v25 + 5);
    BOOL v16 = v20 == 0;
    if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Performance Trace completion notification sent",  v22,  2u);
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "UserNotifications.framework is weak-linked and unavailable; Performance Trace cannot post notifications",
        buf,
        2u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_syscallSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  if (kperf_kdebug_filter_add_class_subclass_fn(a3, 17563650LL))
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      sub_10000C908();
LABEL_7:
      LOBYTE(v7) = 0;
    }
  }

  else
  {
    if (!kperf_kdebug_filter_add_class_subclass_fn(a3, 67895298LL))
    {
      *a4 |= 8u;
      LOBYTE(v7) = 1;
      return v7;
    }

    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      sub_10000C8A0();
      goto LABEL_7;
    }
  }

  return v7;
}

- (BOOL)_faultSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  int v6 = kperf_kdebug_filter_add_class_subclass_fn(a3, 19922946LL);
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C970();
    }
  }

  else
  {
    *a4 |= 8u;
  }

  return v6 == 0;
}

- (BOOL)_graphicsSamplingInit
{
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    int v5 = 1;
    sysctlbyname(off_100014608[i], 0LL, 0LL, &v5, 4uLL);
  }

  ktrace_events_range(-[PTService ktraceSession](self, "ktraceSession"), 2231369728LL, 2248146944LL, 0LL);
  ktrace_events_range(-[PTService ktraceSession](self, "ktraceSession"), 101842944LL, 101908480LL, 0LL);
  return 1;
}

- (void)_graphicsSamplingTeardown
{
  for (uint64_t i = 0LL; i != 5; ++i)
    sysctlbyname(off_100014608[i], 0LL, 0LL, 0LL, 4uLL);
}

- (BOOL)_aspSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  return 1;
}

- (BOOL)_configureKtraceSession:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = ktrace_set_thread_groups_enabled(-[PTService ktraceSession](self, "ktraceSession"), 1LL);
  kperf_reset(v7);
  uint64_t v8 = kperf_action_count_set(2LL);
  uint64_t v9 = kperf_kdebug_filter_create(v8);
  if (!v9)
  {
    if (a4)
    {
      v19 = @"Unable to create kdebug filter for kperf";
      goto LABEL_51;
    }

    goto LABEL_69;
  }

  uint64_t v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
  unsigned int v12 = [v11 containsObject:&off_100016068];

  if (v12 && !-[PTService _graphicsSamplingInit](self, "_graphicsSamplingInit"))
  {
    if (a4)
    {
      v19 = @"Unable to init graphics sampling";
      goto LABEL_51;
    }

    goto LABEL_69;
  }

  unsigned int v56 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
  unsigned int v14 = [v13 containsObject:&off_100016080];

  if (v14
    && !-[PTService _syscallSamplingInitFilter:withSamplers:]( self,  "_syscallSamplingInitFilter:withSamplers:",  v10,  &v56))
  {
    if (a4)
    {
      v19 = @"Unable to init syscall sampling";
      goto LABEL_51;
    }

    goto LABEL_69;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
  unsigned int v16 = [v15 containsObject:&off_100016098];

  if (v16)
  {
    if (!-[PTService _faultSamplingInitFilter:withSamplers:](self, "_faultSamplingInitFilter:withSamplers:", v10, &v56))
    {
      if (a4)
      {
        v19 = @"Unable to init vmfault sampling";
        goto LABEL_51;
      }

      goto LABEL_69;
    }

    unsigned int v14 = 1;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
  unsigned int v18 = [v17 containsObject:&off_1000160B0];

  if (!v18)
  {
    if (!v14)
    {
LABEL_33:
      kperf_kdebug_filter_destroy(v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
      unsigned int v26 = [v25 containsObject:&off_1000160C8];

      if (v26)
      {
        for (uint64_t i = 0LL; i != 13; ++i)
          ktrace_events_range( -[PTService ktraceSession](self, "ktraceSession"),  (dword_10000FA90[i] << 24),  ((dword_10000FA90[i] << 24) + 0x1000000),  0LL);
        for (uint64_t j = 0LL; j != 24; j += 8LL)
        {
          id v29 = -[PTService ktraceSession](self, "ktraceSession");
          uint64_t v30 = (*(_DWORD *)((char *)&unk_10000FAC4 + j) << 24) | (*(_DWORD *)((char *)&unk_10000FAC4
                                                                                              + j
                                                                                              + 4) << 16);
          ktrace_events_range(v29, v30, (v30 + 0x10000), 0LL);
        }
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
        unsigned int v32 = [v31 containsObject:&off_1000160E0];

        if (v32)
        {
          for (uint64_t k = 0LL; k != 8; ++k)
            ktrace_events_range( -[PTService ktraceSession](self, "ktraceSession"),  (dword_10000FADC[k] << 24),  ((dword_10000FADC[k] << 24) + 0x1000000),  0LL);
          uint64_t v34 = 0LL;
          char v35 = 1;
          do
          {
            char v36 = v35;
            v37 = -[PTService ktraceSession](self, "ktraceSession");
            uint64_t v38 = (dword_10000FAFC[2 * v34] << 24) | (dword_10000FAFC[2 * v34 + 1] << 16);
            ktrace_events_range(v37, v38, (v38 + 0x10000), 0LL);
            char v35 = 0;
            uint64_t v34 = 1LL;
          }

          while ((v36 & 1) != 0);
        }
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue([v6 traceGroups]);
      unsigned int v40 = [v39 containsObject:&off_1000160F8];

      if (v40)
      {
        else {
          uint64_t v41 = 8LL;
        }
        if (kperf_action_samplers_set(2LL, v41))
        {
          if (a4)
          {
            v19 = @"Unable to set samplers for kperf timer action";
            goto LABEL_51;
          }

          goto LABEL_69;
        }

        kperf_timer_count_set(1LL);
        uint64_t v43 = 1000000 * (void)[v6 callstackSamplingRateMS];
        uint64_t v44 = kperf_ns_to_ticks(v43);
        uint64_t v45 = kperf_timer_period_set(0LL, v44);
        if ((_DWORD)v45)
        {
          if (!a4) {
            goto LABEL_69;
          }
          v46 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to set kperf timer period to %llu ns",  v43);
          goto LABEL_67;
        }

        uint64_t v55 = 0LL;
        if (kperf_timer_period_get(v45, &v55))
        {
          if (!a4) {
            goto LABEL_69;
          }
          v47 = @"Unable to retrieve kperf timer period";
LABEL_58:
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  v47));
          goto LABEL_69;
        }

        uint64_t v48 = kperf_ticks_to_ns(v55);
        if (v48 != v43)
        {
          if (!a4) {
            goto LABEL_69;
          }
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to set the callstack sampling rate requested.                            Kperf timer period could only be set to %llu ns",  v48));
          uint64_t v52 = 3LL;
          goto LABEL_68;
        }

        if (kperf_timer_action_set(0LL, 2LL))
        {
          if (!a4) {
            goto LABEL_69;
          }
          v47 = @"Unable to set kperf timer action";
          goto LABEL_58;
        }
      }

      v49 = -[PTService ktraceSession](self, "ktraceSession");
      BOOL v42 = 1;
      ktrace_set_vnode_paths_enabled(v49, 1LL);
      uint64_t v50 = kperf_sample_set(1LL);
      if (!(_DWORD)v50) {
        goto LABEL_70;
      }
      if (a4)
      {
        uint64_t v54 = v50;
        v22 = @"Could not enable sampling: %{errno}d";
LABEL_66:
        v46 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v54);
LABEL_67:
        v51 = (void *)objc_claimAutoreleasedReturnValue(v46);
        uint64_t v52 = 0LL;
LABEL_68:
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  v52,  v51));
      }

- (BOOL)_validSymbolicationPreferences
{
  v2 = (const __CFArray *)CFPreferencesCopyAppValue(@"DBGFileMappedPaths", @"com.apple.DebugSymbols");
  if (v2)
  {
    id v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFArrayGetTypeID() && CFArrayGetCount(v3) >= 1)
    {
      CFIndex v5 = 0LL;
      int v6 = 0;
      int v7 = 0;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v5);
        CFTypeID v9 = CFGetTypeID(ValueAtIndex);
        if (v9 == CFStringGetTypeID()) {
          v7 |= CFStringCompare( ValueAtIndex,  @"/Library/Caches/com.apple.bni.symbols/bursar.apple.com/uuids",  0LL) == kCFCompareEqualTo;
        }
        CFTypeID v10 = CFGetTypeID(ValueAtIndex);
        if (v10 == CFStringGetTypeID()) {
          v6 |= CFStringCompare( ValueAtIndex,  @"/Library/Caches/com.apple.bni.symbols/uuidsymmap.apple.com/uuids",  0LL) == kCFCompareEqualTo;
        }
        ++v5;
      }

      while (CFArrayGetCount(v3) > v5);
      CFRelease(v3);
      if ((v7 & v6 & 1) != 0)
      {
        LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"XBSCopyExecutable", @"com.apple.dsymForUUID", 0LL) != 0;
        return (char)v2;
      }
    }

    else
    {
      CFRelease(v3);
    }

    LOBYTE(v2) = 0;
  }

  return (char)v2;
}

- (void)_symbolicateKtraceFile:(id)a3
{
  id v3 = a3;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.PerformanceTrace");
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if ((has_internal_diagnostics & 1) != 0)
  {
    if (v5)
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Symbolicating Performance Trace",  (uint8_t *)&v18,  2u);
    }

    id v6 = objc_claimAutoreleasedReturnValue([v3 path]);
    uint64_t v7 = ktrace_file_open([v6 UTF8String], 1);

    if (v7)
    {
      Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
      CFArrayAppendValue(Mutable, @"/");
      unsigned int v18 = Mutable;
      char v19 = 1;
      uint64_t v9 = ktrace_create_dsym_search_configuration(&v18);
      ktrace_symbolicate_file(0LL, v9, v7);
      ktrace_free_dsym_search_configuration(v9);
      ktrace_file_close(v7);
      CFRelease(Mutable);
    }

    else
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_10000C9D8(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }

  else if (v5)
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Skipping symbolication because of OS variant.",  (uint8_t *)&v18,  2u);
  }
}

- (BOOL)_appendLogContentToKtraceFile:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
  unsigned int v8 = [v7 includeOSLogs];

  if (v8) {
    uint64_t v9 = 71LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
  unsigned int v11 = [v10 includeOSSignposts];

  if (v11) {
    uint64_t v12 = v9 | 0x20;
  }
  else {
    uint64_t v12 = v9;
  }
  if (!v12)
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      sub_10000CA0C(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!a4) {
        goto LABEL_27;
      }
    }

    else if (!a4)
    {
      goto LABEL_27;
    }

    v27 = @"Failed to append logs due to missing flags.";
    goto LABEL_23;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTService startTime](self, "startTime"));

  if (!v13)
  {
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      sub_10000CA40(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!a4) {
        goto LABEL_27;
      }
    }

    else if (!a4)
    {
      goto LABEL_27;
    }

    v27 = @"Unable to append logs due to missing startTime.";
LABEL_23:
    BOOL v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v27));
    goto LABEL_28;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Starting to append logs.",  buf,  2u);
  }

  id v14 = objc_claimAutoreleasedReturnValue([v6 path]);
  uint64_t v15 = ktrace_file_open([v14 UTF8String], 1);

  if (!v15)
  {
    uint64_t v37 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000CA74();
      if (!a4) {
        goto LABEL_27;
      }
    }

    else if (!a4)
    {
      goto LABEL_27;
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to open file to append logs: %{errno}d",  v37));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v38));

    goto LABEL_27;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTService startTime](self, "startTime"));
  uint64_t appended = ktrace_file_append_local_log_content(v15, v12, 0LL, v16);

  if ((_DWORD)appended)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000CADC();
      if (!a4) {
        goto LABEL_16;
      }
    }

    else if (!a4)
    {
LABEL_16:
      ktrace_file_close(v15);
LABEL_27:
      BOOL v36 = 0;
      goto LABEL_28;
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append logs: %{errno}d",  appended));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v18));

    goto LABEL_16;
  }

  ktrace_file_close(v15);
  BOOL v36 = 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v40 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Done appending logs.",  v40,  2u);
  }

- (BOOL)_postProcessKtraceFile:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_claimAutoreleasedReturnValue([v6 path]);
  uint64_t v8 = ktrace_file_open([v7 UTF8String], 1);

  if (v8)
  {
    ktrace_file_append_live_ariadne_signpost_specs(v8);
    uint64_t v9 = ktrace_file_close(v8);
    uint64_t v10 = ktrace_session_create(v9);
    if (v10)
    {
      uint64_t v11 = v10;
      ktrace_set_execnames_enabled(v10, 0LL);
      ktrace_session_set_event_names_enabled(v11, 0LL);
      uint64_t v33 = 0LL;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000LL;
      uint64_t v36 = 0LL;
      v31[0] = 0LL;
      v31[1] = v31;
      v31[2] = 0x2020000000LL;
      char v32 = 1;
      v30[0] = 0LL;
      v30[1] = v30;
      v30[2] = 0x2020000000LL;
      v30[3] = 0LL;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100003470;
      v29[3] = &unk_100014638;
      v29[4] = v31;
      v29[5] = &v33;
      v29[6] = v30;
      ktrace_events_all(v11, v29);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000034C8;
      v27[3] = &unk_100014660;
      uint64_t v12 = dispatch_semaphore_create(0LL);
      BOOL v28 = v12;
      ktrace_set_completion_handler(v11, v27);
      id v13 = objc_claimAutoreleasedReturnValue([v6 path]);
      uint64_t v14 = ktrace_set_file(v11, [v13 UTF8String]);

      if ((_DWORD)v14)
      {
        if (a4)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to open trace file for post-processing: %{errno}d",  v14));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v15));
LABEL_15:
          *a4 = v16;

          goto LABEL_16;
        }

        goto LABEL_16;
      }

      BOOL v19 = &_dispatch_main_q;
      uint64_t v20 = ktrace_start(v11, &_dispatch_main_q);

      if ((_DWORD)v20)
      {
        if (a4)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to parse trace file for post-processing: %{errno}d",  v20));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v15));
          goto LABEL_15;
        }

- (BOOL)_markPurgable:(id)a3 withUrgency:(unint64_t)a4
{
  unint64_t v9 = a4 | 0x10005;
  id v4 = objc_claimAutoreleasedReturnValue([a3 path]);
  int v5 = open((const char *)[v4 UTF8String], 0);

  if (v5 < 0)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    sub_10000CBAC();
    goto LABEL_6;
  }

  if (ffsctl(v5, 0xC0084A44uLL, &v9, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CB44();
    }
    close(v5);
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Marked file purgeable",  v8,  2u);
  }

  close(v5);
  LOBYTE(v6) = 1;
  return v6;
}

- (id)_generateToken:(id)a3
{
  id v4 = objc_claimAutoreleasedReturnValue([a3 path]);
  id v5 = [v4 UTF8String];
  uint64_t v6 = SANDBOX_EXTENSION_DEFAULT;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
  uint64_t v8 = (void *)sandbox_extension_issue_file_to_process_by_pid( "com.apple.app-sandbox.read-write",  v5,  v6,  [v7 ownerPID]);

  if (v8)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
    free(v8);
  }

  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_10000CC20(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (void)startPerformanceTrace:(id)a3
{
  id v4 = a3;
  else {
    -[PTService _startPerformanceTraceLegacy:](self, "_startPerformanceTraceLegacy:", v4);
  }
}

- (void)_startPerformanceTrace:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Starting PerformanceTrace",  buf,  2u);
  }

  if (-[PTService ktraceRecording](self, "ktraceRecording") || -[PTService ktraceSession](self, "ktraceSession"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ownerName]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Tracing is already in progress by another PerformanceTrace client: %@ [%i]",  v7,  [v8 ownerPID]));
      BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 2LL, v9));

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146A0]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    else
    {
      BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  2LL,  @"Tracing is already in progress by another PerformanceTrace client: Unknown"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146C0]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_9:
      }
        sub_10000CC54(v10);
    }

- (id)_traceRecordArgsArrayFromConfig:(id)a3 outputFilePath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", @"record"));
  id v45 = v8;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  [v9 addObjectsFromArray:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 planNameOrPath]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 planNameOrPath]);
    unsigned int v13 = [v12 isAbsolutePath];

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 planNameOrPath]);
    uint64_t v15 = (void *)v14;
    if (v13)
    {
      v44[0] = v14;
      v44[1] = @"--experimental";
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
      [v9 addObjectsFromArray:v16];
    }

    else
    {
      [v9 addObject:v14];
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 traceGroups]);
  unsigned int v18 = [v17 containsObject:&off_100016068];

  if (v18) {
    [v9 addObjectsFromArray:&off_1000162A8];
  }
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v7 traceGroups]);
  unsigned int v20 = [v19 containsObject:&off_100016080];

  if (v20) {
    [v9 addObjectsFromArray:&off_1000162C0];
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 traceGroups]);
  unsigned int v22 = [v21 containsObject:&off_100016098];

  if (v22) {
    [v9 addObjectsFromArray:&off_1000162D8];
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 traceGroups]);
  unsigned int v24 = [v23 containsObject:&off_1000160B0];

  if (v24) {
    [v9 addObjectsFromArray:&off_1000162F0];
  }
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v7 traceGroups]);
  unsigned int v26 = [v25 containsObject:&off_1000160F8];

  if (v26 && [v7 callstackSamplingRateMS] != (id)1)
  {
    if (a5)
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Callstack sampling rate other than 1ms not supported"));
      uint64_t v31 = 0LL;
LABEL_53:
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", v31, v30));

      a5 = 0LL;
      goto LABEL_54;
    }

    goto LABEL_54;
  }

  id v27 = [v7 traceType];
  if (v27 == (id)2)
  {
    if (![v7 traceDurationSecs])
    {
      if (a5)
      {
        uint64_t v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Non-zero traceDurationSecs must be specified when using ringbuffer mode",  v40);
        goto LABEL_52;
      }

      goto LABEL_54;
    }

    v42[0] = @"--trailing-duration";
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lus",  [v7 traceDurationSecs]));
    v42[1] = v28;
    uint64_t v29 = v42;
    goto LABEL_24;
  }

  if (v27 == (id)1)
  {
    if (![v7 traceDurationSecs]) {
      goto LABEL_25;
    }
    v43[0] = @"--end-after-duration";
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lus",  [v7 traceDurationSecs]));
    v43[1] = v28;
    uint64_t v29 = v43;
LABEL_24:
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
    [v9 addObjectsFromArray:v32];

LABEL_25:
    if ([v7 kernelBufferSizeMB])
    {
      if ((unint64_t)[v7 kernelBufferSizeMB] >= 0x401)
      {
        if (a5)
        {
          uint64_t v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as PerformanceTrace cannot have a kernel buffer size larger than %dMB.",  1024LL);
LABEL_52:
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v33);
          uint64_t v31 = 3LL;
          goto LABEL_53;
        }

        goto LABEL_54;
      }

      v41[0] = @"--unsafe";
      v41[1] = @"--kdebug-buffer-size";
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lumb",  [v7 kernelBufferSizeMB]));
      v41[2] = v34;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
      [v9 addObjectsFromArray:v35];
    }

    if ([v7 overrideIncludeOSLogs])
    {
      else {
        uint64_t v36 = &off_100016338;
      }
      [v9 addObjectsFromArray:v36];
    }

    if ([v7 overrideIncludeOSSignposts])
    {
      else {
        uint64_t v37 = &off_100016368;
      }
      [v9 addObjectsFromArray:v37];
    }

    if ([v7 overrideSymbolicate])
    {
      else {
        uint64_t v38 = &off_100016398;
      }
      [v9 addObjectsFromArray:v38];
    }

    [v9 addObjectsFromArray:&off_1000163B0];
    [v9 addObjectsFromArray:&off_1000163C8];
    a5 = (id *)[v9 copy];
    goto LABEL_54;
  }

  if (a5)
  {
    uint64_t v33 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Cannot start tracing as an unknown trace type is used: %lu",  [v7 traceType]);
    goto LABEL_52;
  }

- (void)_startPerformanceTraceLegacy:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Starting PerformanceTrace (legacy)",  buf,  2u);
  }

  if (!-[PTService ktraceRecording](self, "ktraceRecording") && !-[PTService ktraceSession](self, "ktraceSession"))
  {
    -[PTService setKtraceSession:](self, "setKtraceSession:", ktrace_session_create(0LL));
    if (!-[PTService ktraceSession](self, "ktraceSession"))
    {
      BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  @"Cannot start tracing as Performance Trace failed to create the ktrace session"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v23 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014918]);

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }

    ktrace_set_execnames_enabled(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
    uint64_t v14 = ktrace_session_set_event_names_enabled(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
    uint64_t current = ktrace_config_create_current(v14);
    if (current)
    {
      uint64_t v16 = current;
      if (ktrace_config_get_owner_kind() == 1)
      {
        owner_name = (const char *)ktrace_config_get_owner_name(v16);
        if (strncmp(owner_name, "com.apple.Perfor", 0x20uLL))
        {
          unsigned int v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as another process already owns foreground tracing: %s [%i]",  owner_name,  ktrace_config_get_owner_pid(v16));
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  2LL,  v19));

          ktrace_config_destroy(v16);
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

          if (v20) {
            -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
          }
          if (-[PTService ktraceSession](self, "ktraceSession"))
          {
            uint64_t v21 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
            kperf_reset(v21);
            -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
          }

          -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
          id v12 = (id)objc_claimAutoreleasedReturnValue([v22 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014978]);

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }

        BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
        if (v24) {
          sub_10000CCD0(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        uint64_t v32 = ktrace_reset_existing();
        if ((_DWORD)v32)
        {
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ktrace was left in a bad state and cannot be reset: %{errno}d",  v32));
          BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  v33));

          ktrace_config_destroy(v16);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

          if (v34) {
            -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
          }
          if (-[PTService ktraceSession](self, "ktraceSession"))
          {
            uint64_t v35 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
            kperf_reset(v35);
            -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
          }

          -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
          id v12 = (id)objc_claimAutoreleasedReturnValue([v36 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014938]);

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }

        uint64_t v37 = kperf_reset(v32);
        if ((_DWORD)v37)
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"kperf was left in a bad state and cannot be reset: %{errno}d",  v37));
          BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  v38));

          ktrace_config_destroy(v16);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

          if (v39) {
            -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
          }
          if (-[PTService ktraceSession](self, "ktraceSession"))
          {
            uint64_t v40 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
            kperf_reset(v40);
            -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
          }

          -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
          id v12 = (id)objc_claimAutoreleasedReturnValue([v41 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014958]);

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }

      ktrace_config_destroy(v16);
    }

    -[PTService setActiveConfig:](self, "setActiveConfig:", v4);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PTService setStartTime:](self, "setStartTime:", v42);

    BOOL v10 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v10, "setDateStyle:", 1LL);
    -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v4 traceName]);
    uint64_t v44 = v43;
    if (v43)
    {
      id v12 = v43;
    }

    else
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue(-[PTService startTime](self, "startTime"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v10, "stringFromDate:", v45));
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"trace_%@.ktrace",  v46));
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v4 traceDirectoryURL]);
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 path]);
    v49 = (void *)v48;
    uint64_t v50 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
    if (v48) {
      uint64_t v50 = (__CFString *)v48;
    }
    v51 = v50;

    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v128 = NSFilePosixPermissions;
    v129 = &off_100016110;
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v129,  &v128,  1LL));
    id v126 = 0LL;
    id v118 = v52;
    unsigned __int8 v54 = [v52 createDirectoryAtPath:v51 withIntermediateDirectories:1 attributes:v53 error:&v126];
    id v55 = v126;
    unsigned __int8 v56 = v55;
    if ((v54 & 1) == 0)
    {
      id v116 = v51;
      v67 = (void *)objc_claimAutoreleasedReturnValue([v55 localizedDescription]);
      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as Performance Trace cannot write to the target directory: %@",  v67));
      v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSError error:description:underlyingError:]( &OBJC_CLASS___NSError,  "error:description:underlyingError:",  3LL,  v68,  v56));

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      if (v70) {
        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }
      if (-[PTService ktraceSession](self, "ktraceSession"))
      {
        uint64_t v71 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
        kperf_reset(v71);
        -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      id v59 = (id)objc_claimAutoreleasedReturnValue([v72 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014998]);

      v51 = v116;
      v66 = v118;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CC54(v69);
      }
      [v59 performanceTraceDidStart:v69];
      goto LABEL_104;
    }

    uint64_t v57 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v51, "stringByAppendingPathComponent:", v12));
    id v125 = 0LL;
    unsigned __int8 v58 = -[PTService _configureKtraceSession:withError:](self, "_configureKtraceSession:withError:", v4, &v125);
    id v59 = v125;
    v114 = (void *)v57;
    if (v59 || (v58 & 1) == 0)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

      if (v73) {
        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }
      if (-[PTService ktraceSession](self, "ktraceSession"))
      {
        uint64_t v74 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
        kperf_reset(v74);
        -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v75 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149B8]);

      v66 = v118;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CC54(v59);
      }
      [v65 performanceTraceDidStart:v59];
      goto LABEL_103;
    }

    __int128 v111 = v56;
    if ((unint64_t)[v4 kernelBufferSizeMB] >= 0x401)
    {
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as PerformanceTrace cannot have a kernel buffer size larger than %dMB.",  1024LL));
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v60));

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      if (v61) {
        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }
      if (-[PTService ktraceSession](self, "ktraceSession"))
      {
        uint64_t v62 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
        kperf_reset(v62);
        -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149D8]);

      unsigned __int8 v56 = v111;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CC54(v112);
      }
      v65 = v112;
      [v64 performanceTraceDidStart:v112];

      v66 = v118;
      goto LABEL_103;
    }

    id v117 = v51;
    ktrace_set_buffer_size(-[PTService ktraceSession](self, "ktraceSession"), [v4 kernelBufferSizeMB]);
    ktrace_set_collection_qos( -[PTService ktraceSession](self, "ktraceSession"),  [v4 kernelBufferDrainQoS]);
    ktrace_set_collection_interval( -[PTService ktraceSession](self, "ktraceSession"),  [v4 kernelBufferDrainRateMS]);
    v76 = v53;
    v77 = (void *)v57;
    v78 = (void *)os_transaction_create("com.apple.PerformanceTrace.PerformanceTraceService");
    v79 = -[PTService ktraceSession](self, "ktraceSession");
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472LL;
    v120[2] = sub_100006930;
    v120[3] = &unk_100014A20;
    v120[4] = self;
    id v80 = v77;
    id v121 = v80;
    id v81 = v4;
    id v122 = v81;
    id v115 = v76;
    id v123 = v76;
    id v113 = v78;
    id v124 = v113;
    ktrace_set_completion_handler(v79, v120);
    id v82 = [v81 traceType];
    if (v82 == (id)2)
    {
      uint64_t started = ktrace_configure(-[PTService ktraceSession](self, "ktraceSession"));
    }

    else
    {
      if (v82 != (id)1)
      {
        uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Cannot start tracing as an unknown trace type is used: %lu",  [v81 traceType]));
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v90));

        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
        v53 = v76;
        v51 = v117;
        if (v91) {
          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }
        unsigned __int8 v56 = v111;
        if (-[PTService ktraceSession](self, "ktraceSession"))
        {
          uint64_t v92 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
          kperf_reset(v92);
          -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        signed int v93 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v89 = (void *)objc_claimAutoreleasedReturnValue([v93 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A40]);

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_88;
        }
LABEL_87:
        sub_10000CC54(v85);
LABEL_88:
        [v89 performanceTraceDidStart:v85];

        v66 = v118;
LABEL_102:

        v65 = v113;
LABEL_103:

        v69 = v114;
LABEL_104:

        goto LABEL_11;
      }

      uint64_t started = ktrace_start_writing_path( -[PTService ktraceSession](self, "ktraceSession"), [v80 UTF8String], 420);
    }

    v51 = v117;
    if ((_DWORD)started)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as Performance Trace failed to write to the expected output path: %{errno}d",  started));
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v84));

      v86 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      unsigned __int8 v56 = v111;
      if (v86) {
        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }
      if (-[PTService ktraceSession](self, "ktraceSession"))
      {
        uint64_t v87 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
        kperf_reset(v87);
        -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      v89 = (void *)objc_claimAutoreleasedReturnValue([v88 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A60]);

      v53 = v115;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      goto LABEL_87;
    }

    uint64_t v94 = (uint64_t)[v81 traceTimeoutS];
    if ([v81 traceTimeoutS] && (unint64_t)objc_msgSend(v81, "traceTimeoutS") < 0x1F
      || (uint64_t v95 = objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"))) != 0
      && (v96 = (void *)v95,
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection")),
          unsigned __int8 v98 = -[PTService _connectionIsEntitled:toEntitlement:]( self,  "_connectionIsEntitled:toEntitlement:",  v97,  @"com.apple.PerformanceTrace.OverrideTimeout"),  v97,  v96,  (v98 & 1) != 0))
    {
      v66 = v118;
      v53 = v115;
      unsigned __int8 v56 = v111;
      if (!v94) {
        goto LABEL_99;
      }
    }

    else
    {
      BOOL v99 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v99) {
        sub_10000CED8(v99, v100, v101, v102, v103, v104, v105, v106);
      }
      uint64_t v94 = 30LL;
      v66 = v118;
      v53 = v115;
      unsigned __int8 v56 = v111;
    }

    signed int v107 = v66;
    __int128 v108 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    dispatch_time_t v109 = dispatch_time(0LL, 1000000000 * v94);
    dispatch_source_set_timer(v108, v109, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006E0C;
    handler[3] = &unk_100014660;
    handler[4] = self;
    dispatch_source_set_event_handler(v108, handler);
    dispatch_activate(v108);
    -[PTService setActiveTimer:](self, "setActiveTimer:", v108);

    v66 = v107;
LABEL_99:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sucessfully started Performance Trace",  buf,  2u);
    }

    __int128 v110 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v110 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A80]);

    [v85 performanceTraceDidStart:0];
    v51 = v117;
    goto LABEL_102;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ownerName]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Tracing is already in progress by another PerformanceTrace client: %@ [%i]",  v7,  [v8 ownerPID]));
    BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 2LL, v9));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000148D8]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
  }

  else
  {
    BOOL v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  2LL,  @"Tracing is already in progress by another PerformanceTrace client: Unknown"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000148F8]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      sub_10000CC54(v10);
  }

- (void)stopPerformanceTrace
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    unsigned int v5 = [v4 useTraceRecord];

    if (v5) {
      -[PTService _stopPerformanceTrace](self, "_stopPerformanceTrace");
    }
    else {
      -[PTService _stopPerformanceTraceLegacy](self, "_stopPerformanceTraceLegacy");
    }
  }

- (void)_stopPerformanceTrace
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Stopping Performance Trace",  buf,  2u);
  }

  if (-[PTService ktraceRecording](self, "ktraceRecording"))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v3) {
      sub_10000D0DC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    if (notify_post("com.apple.PerformanceTrace.EndTraceRecord")
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000D074();
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Successfully stopped Performance Trace",  v23,  2u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AC0]);

    [v12 performanceTraceDidStop:0];
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_10000D040(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  4LL,  @"No current tracing session exists to stop."));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AA0]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CFC4(v12);
    }
    [v22 performanceTraceDidStop:v12];
  }
}

- (void)_stopPerformanceTraceLegacy
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Stopping PerformanceTrace (legacy)",  buf,  2u);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeTimer](self, "activeTimer"));
  BOOL v4 = v3 == 0LL;

  if (!v4)
  {
    uint64_t v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PTService activeTimer](self, "activeTimer"));
    dispatch_source_cancel(v5);

    -[PTService setActiveTimer:](self, "setActiveTimer:", 0LL);
  }

  if (!-[PTService ktraceSession](self, "ktraceSession"))
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_10000D040(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  4LL,  @"No current tracing session exists to stop."));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AE0]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D110(v16);
    }
    [v18 performanceTraceDidStop:v16];

    goto LABEL_54;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
  BOOL v7 = [v6 traceType] == (id)1;

  if (!v7)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    BOOL v20 = [v19 traceType] == (id)2;

    if (!v20) {
      goto LABEL_51;
    }
    *(void *)buf = 0LL;
    uint64_t v88 = buf;
    uint64_t v89 = 0x2020000000LL;
    uint64_t v90 = ktrace_session_create(v21);
    unsigned int v22 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v22, "setDateStyle:", 1LL);
    -[NSDateFormatter setDateFormat:](v22, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 traceName]);
    uint64_t v25 = v24;
    if (v24)
    {
      id v80 = v24;
    }

    else
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v22, "stringFromDate:", v26));
      id v80 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"trace_%@.ktrace",  v27));
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 traceDirectoryURL]);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 path]);
    uint64_t v31 = (void *)v30;
    uint64_t v32 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
    if (v30) {
      uint64_t v32 = (__CFString *)v30;
    }
    uint64_t v33 = v32;

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v91 = NSFilePosixPermissions;
    uint64_t v92 = &off_100016110;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    id v86 = 0LL;
    unsigned __int8 v36 = [v34 createDirectoryAtPath:v33 withIntermediateDirectories:1 attributes:v35 error:&v86];
    id v37 = v86;
    uint64_t v38 = v37;
    if ((v36 & 1) != 0)
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v33, "stringByAppendingPathComponent:", v80));
      uint64_t v40 = *((void *)v88 + 3);
      if (v40)
      {
        ktrace_set_execnames_enabled(v40, 0LL);
        ktrace_session_set_event_names_enabled(*((void *)v88 + 3), 0LL);
        uint64_t v41 = ktrace_set_use_existing(*((void *)v88 + 3));
        if (!(_DWORD)v41)
        {
          v67 = (void *)os_transaction_create("com.apple.PerformanceTrace.PerformanceTraceService");
          uint64_t v68 = *((void *)v88 + 3);
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472LL;
          v81[2] = sub_100007E04;
          v81[3] = &unk_100014B88;
          uint64_t v85 = buf;
          v81[4] = self;
          id v69 = v39;
          id v82 = v69;
          id v83 = v35;
          id v43 = v67;
          id v84 = v43;
          ktrace_set_completion_handler(v68, v81);
          ktrace_session_free(-[PTService ktraceSession](self, "ktraceSession"));
          -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
          uint64_t v70 = *((void *)v88 + 3);
          id v39 = v69;
          uint64_t started = ktrace_start_writing_path(v70, [v39 UTF8String], 420);
          if ((_DWORD)started)
          {
            uint64_t v72 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot write ringbuffer trace due to failure to start writing out buffer: %{errno}d",  started));
            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v72));

            v73 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
            LOBYTE(v72) = v73 == 0LL;

            if ((v72 & 1) == 0) {
              -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
            }
            if (-[PTService ktraceSession](self, "ktraceSession"))
            {
              ktrace_end(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
              uint64_t v74 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
              kperf_reset(v74);
              -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
            }

            uint64_t v75 = *((void *)v88 + 3);
            if (v75)
            {
              ktrace_end(v75, 0LL);
              ktrace_session_destroy(*((void *)v88 + 3));
              *((void *)v88 + 3) = 0LL;
            }

            -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
            v77 = (void *)objc_claimAutoreleasedReturnValue([v76 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BA8]);

            id v78 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue([v79 description]);
              sub_10000D190();
            }

            [v77 performanceTraceDidStop:v79];
            [v77 performanceTraceDidComplete:0 withToken:0 withError:v79];

            int v65 = 1;
          }

          else
          {
            int v65 = 0;
          }

LABEL_50:
          _Block_object_dispose(buf, 8);
          if (v65) {
            return;
          }
          goto LABEL_51;
        }

        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot write ringbuffer trace due to failure to find existing session: %{errno}d",  v41));
        id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v42));

        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
        BOOL v45 = v44 == 0LL;

        if (!v45) {
          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }
        if (-[PTService ktraceSession](self, "ktraceSession"))
        {
          ktrace_end(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
          uint64_t v46 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
          kperf_reset(v46);
          -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
        }

        uint64_t v47 = *((void *)v88 + 3);
        if (v47)
        {
          ktrace_end(v47, 0LL);
          ktrace_session_destroy(*((void *)v88 + 3));
          *((void *)v88 + 3) = 0LL;
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B40]);

        id v50 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue([v43 description]);
          sub_10000D190();
        }
      }

      else
      {
        id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  @"Cannot stop ringbuffer tracing as Performance Trace was unable to generate a ktrace session"));
        id v59 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
        BOOL v60 = v59 == 0LL;

        if (!v60) {
          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }
        if (-[PTService ktraceSession](self, "ktraceSession"))
        {
          ktrace_end(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
          uint64_t v61 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
          kperf_reset(v61);
          -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
        }

        uint64_t v62 = *((void *)v88 + 3);
        if (v62)
        {
          ktrace_end(v62, 0LL);
          ktrace_session_destroy(*((void *)v88 + 3));
          *((void *)v88 + 3) = 0LL;
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v49 = (void *)objc_claimAutoreleasedReturnValue([v63 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B20]);

        id v64 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue([v43 description]);
          sub_10000D190();
        }
      }

      [v49 performanceTraceDidStop:v43];
      [v49 performanceTraceDidComplete:0 withToken:0 withError:v43];
    }

    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot dump ringbuffer trace as Performance Trace cannot write to the target directory: %@",  v51));
      id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSError error:description:underlyingError:]( &OBJC_CLASS___NSError,  "error:description:underlyingError:",  3LL,  v52,  v38));

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      BOOL v54 = v53 == 0LL;

      if (!v54) {
        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }
      if (-[PTService ktraceSession](self, "ktraceSession"))
      {
        ktrace_end(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
        uint64_t v55 = ktrace_session_destroy(-[PTService ktraceSession](self, "ktraceSession"));
        kperf_reset(v55);
        -[PTService setKtraceSession:](self, "setKtraceSession:", 0LL);
      }

      uint64_t v56 = *((void *)v88 + 3);
      if (v56)
      {
        ktrace_end(v56, 0LL);
        ktrace_session_destroy(*((void *)v88 + 3));
        *((void *)v88 + 3) = 0LL;
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      id v43 = (id)objc_claimAutoreleasedReturnValue([v57 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B00]);

      id v58 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v39 description]);
        sub_10000D190();
      }

      [v43 performanceTraceDidStop:v39];
      [v43 performanceTraceDidComplete:0 withToken:0 withError:v39];
    }

    int v65 = 1;
    goto LABEL_50;
  }

  ktrace_end(-[PTService ktraceSession](self, "ktraceSession"), 0LL);
LABEL_51:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Successfully stopped Performance Trace",  buf,  2u);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v66 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BC8]);

  [v16 performanceTraceDidStop:0];
LABEL_54:
}

- (void)getCurrentStoredConfig:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Getting Current Config",  buf,  2u);
  }

  *(void *)buf = 0LL;
  uint64_t v18 = buf;
  uint64_t v19 = 0x3032000000LL;
  BOOL v20 = sub_1000021D8;
  uint64_t v21 = sub_1000021E8;
  id v22 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = [v5 fileExistsAtPath:@"/private/var/tmp/com.apple.PerformanceTrace"];

  if ((v6 & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000085C0;
    v16[3] = &unk_1000145E8;
    v16[4] = buf;
    -[PTService resetConfig:](self, "resetConfig:", v16);
  }

  BOOL v7 = (id *)(v18 + 40);
  if (*((void *)v18 + 5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D2AC();
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, *((void *)v18 + 5), 0LL);
  }

  else
  {
    obuint64_t j = 0LL;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/private/var/tmp/com.apple.PerformanceTrace",  1LL,  &obj));
    objc_storeStrong(v7, obj);
    if (*((void *)v18 + 5) || !v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000D1D4();
      }
      (*((void (**)(id, void, void))v4 + 2))(v4, *((void *)v18 + 5), 0LL);
    }

    else
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___PTTraceConfig);
      uint64_t v10 = (id *)(v18 + 40);
      id v14 = (id)*((void *)v18 + 5);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v9,  v8,  &v14));
      objc_storeStrong(v10, v14);
      if (*((void *)v18 + 5))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10000D240();
        }
        uint64_t v12 = 0LL;
        uint64_t v13 = *((void *)v18 + 5);
      }

      else
      {
        uint64_t v13 = 0LL;
        uint64_t v12 = v11;
      }

      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, v13, v12);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)applyConfig:(id)a3 withError:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = (void (**)(id, id))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Applying Config", buf, 2u);
  }

  [v5 setSource:3];
  id v12 = 0LL;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v12));
  id v8 = v12;
  if (v8)
  {
    id v9 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D380();
    }
LABEL_11:
    v6[2](v6, v9);

    goto LABEL_12;
  }

  id v11 = 0LL;
  unsigned __int8 v10 = [v7 writeToFile:@"/private/var/tmp/com.apple.PerformanceTrace" options:1 error:&v11];
  id v9 = v11;
  if (v9 || (v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D318();
    }
    goto LABEL_11;
  }

  v6[2](v6, 0LL);
LABEL_12:
}

- (void)resetConfig:(id)a3
{
  id v75 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resetting Config", buf, 2u);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PTTraceConfig configWithTemplate:](&OBJC_CLASS___PTTraceConfig, "configWithTemplate:", 1LL));
  [v3 setSource:0];
  id v4 = (void *)CFPreferencesCopyValue( @"selectedConfigName",  @"com.apple.internal.taptotrace",  @"mobile",  kCFPreferencesAnyHost);
  v92[0] = @"/Library/Managed Preferences/";
  v92[1] = @"mobile";
  id v5 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.internal.taptotrace" stringByAppendingString:@".plist"]);
  v92[2] = v5;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 3LL));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v8));

  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"selectedConfigName"]);

    if (v10)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 valueForKey:@"selectedConfigName"]);

      id v4 = (void *)v11;
    }
  }

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Device has a legacy configuration installed. Resolving config.",  buf,  2u);
    }

    [v3 setSymbolicate:0];
    [v3 setTraceType:2];
    [v3 setSource:1];
    if ([v4 isEqualToString:@"audio"])
    {
      [v3 setKernelBufferSizeMB:512];
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_1000160C8,  &off_1000160F8,  &off_100016080,  &off_100016098,  0LL));
      [v3 setTraceGroups:v12];
    }
  }

  v76 = v4;
  v77 = v3;
  CFDictionaryRef v13 = CFPreferencesCopyMultiple( 0LL,  @"com.apple.PerformanceTrace.config",  @"mobile",  kCFPreferencesAnyHost);
  v91[0] = @"/Library/Managed Preferences/";
  v91[1] = @"mobile";
  id v14 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.PerformanceTrace.config" stringByAppendingString:@".plist"]);
  v91[2] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 3LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v17));

  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
  id v20 = [v19 countByEnumeratingWithState:&v84 objects:v90 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v85;
    do
    {
      for (uint64_t i = 0LL; i != v21; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v85 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)i);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKey:v24]);

        if (v25)
        {
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKey:v24]);
          -[__CFDictionary setValue:forKey:](v13, "setValue:forKey:", v26, v24);
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v84 objects:v90 count:16];
    }

    while (v21);
  }

  uint64_t v27 = v77;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Device has a configuration installed. Resolving config.",  buf,  2u);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"symbolicate"));

    if (v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"symbolicate"));
      objc_msgSend(v77, "setSymbolicate:", objc_msgSend(v29, "BOOLValue"));

      [v77 setSource:2];
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"callstackSamplingRateMS"));

    if (v30)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"callstackSamplingRateMS"));
      objc_msgSend(v77, "setCallstackSamplingRateMS:", objc_msgSend(v31, "unsignedLongValue"));

      [v77 setSource:2];
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceName"));

    if (v32)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceName"));
      id v34 = [v33 copy];
      [v77 setTraceName:v34];

      [v77 setSource:2];
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"compressWhenFinished"));

    if (v35)
    {
      unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"compressWhenFinished"));
      objc_msgSend(v77, "setCompressWhenFinished:", objc_msgSend(v36, "BOOLValue"));

      [v77 setSource:2];
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeOSLogs"));

    if (v37)
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeOSLogs"));
      objc_msgSend(v77, "setIncludeOSLogs:", objc_msgSend(v38, "BOOLValue"));

      [v77 setSource:2];
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeOSSignposts"));

    if (v39)
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeOSSignposts"));
      objc_msgSend(v77, "setIncludeOSSignposts:", objc_msgSend(v40, "BOOLValue"));

      [v77 setSource:2];
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceTimeoutS"));

    if (v41)
    {
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceTimeoutS"));
      objc_msgSend(v77, "setTraceTimeoutS:", objc_msgSend(v42, "unsignedLongValue"));

      [v77 setSource:2];
    }

    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"skipNotification"));

    if (v43)
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"skipNotification"));
      objc_msgSend(v77, "setSkipNotification:", objc_msgSend(v44, "BOOLValue"));

      [v77 setSource:2];
    }

    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeKernelStacks"));

    if (v45)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"includeKernelStacks"));
      objc_msgSend(v77, "setIncludeKernelStacks:", objc_msgSend(v46, "BOOLValue"));

      [v77 setSource:2];
    }

    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferSizeMB"));

    if (v47)
    {
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferSizeMB"));
      objc_msgSend(v77, "setKernelBufferSizeMB:", objc_msgSend(v48, "unsignedLongValue"));

      [v77 setSource:2];
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferDrainQoS"));

    if (v49)
    {
      id v50 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferDrainQoS"));
      objc_msgSend(v77, "setKernelBufferDrainQoS:", objc_msgSend(v50, "unsignedIntValue"));

      [v77 setSource:2];
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferDrainRateMS"));

    if (v51)
    {
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"kernelBufferDrainRateMS"));
      objc_msgSend(v77, "setKernelBufferDrainRateMS:", objc_msgSend(v52, "unsignedLongValue"));

      [v77 setSource:2];
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceDirectoryURL"));

    if (v53)
    {
      BOOL v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceDirectoryURL"));
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v54));
      [v77 setTraceDirectoryURL:v55];

      [v77 setSource:2];
    }

    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceType"));

    if (v56)
    {
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceType"));
      [v77 setTraceType:traceTypeForString(v57)];

      [v77 setSource:2];
    }

    id v58 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceGroups"));

    if (v58)
    {
      uint64_t v74 = v16;
      id v59 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v13, "valueForKey:", @"traceGroups"));
      BOOL v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      id v61 = v59;
      id v62 = [v61 countByEnumeratingWithState:&v80 objects:v89 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v81;
        do
        {
          for (uint64_t j = 0LL; j != v63; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v81 != v64) {
              objc_enumerationMutation(v61);
            }
            v66 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)j);
            if (v66 && traceGroupForString(*(void **)(*((void *)&v80 + 1) + 8LL * (void)j)))
            {
              v67 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  traceGroupForString(v66));
              uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
              [v60 addObject:v68];
            }
          }

          id v63 = [v61 countByEnumeratingWithState:&v80 objects:v89 count:16];
        }

        while (v63);
      }

      uint64_t v27 = v77;
      if ([v60 count])
      {
        [v77 setTraceGroups:v60];
        [v77 setSource:2];
      }

      uint64_t v16 = v74;
    }
  }

  id v79 = 0LL;
  id v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v27,  1LL,  &v79));
  id v70 = v79;
  if (v70)
  {
    id v71 = v70;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D380();
    }
LABEL_73:
    v73 = v75;
    (*((void (**)(id, id))v75 + 2))(v75, v71);

    goto LABEL_74;
  }

  id v78 = 0LL;
  unsigned __int8 v72 = [v69 writeToFile:@"/private/var/tmp/com.apple.PerformanceTrace" options:1 error:&v78];
  id v71 = v78;
  if (v71 || (v72 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D318();
    }
    goto LABEL_73;
  }

  v73 = v75;
  (*((void (**)(id, void))v75 + 2))(v75, 0LL);
LABEL_74:
}

- (void)pingService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
  int v6 = [v5 processIdentifier];

  proc_name(v6, buffer, 0x21u);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  4LL));
  if (!v7) {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    int v11 = 138412802;
    id v12 = v4;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = [v8 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received Ping: %@ from Client: %{public}@ [%i]",  (uint8_t *)&v11,  0x1Cu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BE8]);

  [v10 _didPingService:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  BOOL v7 = -[PTService _connectionIsEntitled:toEntitlement:]( self,  "_connectionIsEntitled:toEntitlement:",  v6,  @"com.apple.PerformanceTrace.Tracing");
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PTServiceInterface));
    [v6 setExportedInterface:v8];

    [v6 setExportedObject:self];
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PTTraceSessionDelegatePrivate));
    [v6 setRemoteObjectInterface:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100009664;
    v12[3] = &unk_100014660;
    v12[4] = self;
    [v6 setInvalidationHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000096F4;
    v11[3] = &unk_100014660;
    v11[4] = self;
    [v6 setInterruptionHandler:v11];
    objc_storeStrong((id *)&self->_connection, a4);
    [v6 resume];
  }

  else
  {
    proc_name((int)[v6 processIdentifier], buffer, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D450();
    }
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (ktrace_session)ktraceSession
{
  return self->_ktraceSession;
}

- (void)setKtraceSession:(ktrace_session *)a3
{
  self->_ktraceSession = a3;
}

- (ktrace_recording)ktraceRecording
{
  return self->_ktraceRecording;
}

- (void)setKtraceRecording:(ktrace_recording *)a3
{
  self->_ktraceRecording = a3;
}

- (PTTraceConfig)activeConfig
{
  return (PTTraceConfig *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setActiveConfig:(id)a3
{
}

- (OS_dispatch_source)activeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setActiveTimer:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end