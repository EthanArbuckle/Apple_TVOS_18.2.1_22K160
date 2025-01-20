__uint64_t sub_30EC()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
}

void sub_30F4(uint64_t a1)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v1 timeIntervalSinceReferenceDate];
  }

  else
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CFAbsoluteTimeGetCurrent();
  }
}

__uint64_t sub_3170(uint64_t a1)
{
  __uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    time_t v3 = time(0LL);
    return a1 - clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) + 1000000000 * v3;
  }

  return result;
}

uint64_t sub_3380(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, "random_initial_delay"))
  {
    uint32_t v2 = objc_msgSend(v1, "random_initial_delay");
    uint32_t v3 = arc4random_uniform(v2);
    v4 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67240448;
      v7[1] = v3;
      __int16 v8 = 1026;
      uint32_t v9 = v2;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "Adding random initial delay %{public}d/%{public}d",  (uint8_t *)v7,  0xEu);
    }

    uint64_t v5 = 1000000000LL * v3;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

void sub_3774(void *a1, uint64_t a2)
{
  id key = a1;
  sub_3F00();
  if (key)
  {
    sub_30F4(a2);
    CFDateRef v4 = CFDateCreate(0LL, v3);
    if (v4)
    {
      CFDateRef v5 = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_152F8, key, v4);
      CFRelease(v5);
    }

    CFPreferencesSetAppValue( @"ActivityBaseDates",  (CFPropertyListRef)qword_152F8,  @"com.apple.xpc.activity2");
  }
}

BOOL sub_3A34(void *a1, uint64_t a2)
{
  kern_return_t v9;
  os_log_s *v10;
  uint8_t v12[8];
  void handler[7];
  mach_port_name_t v14;
  mach_port_name_t v15;
  void v16[3];
  unint64_t v17;
  mach_port_t port[2];
  mach_port_t *v19;
  uint64_t v20;
  uint64_t v21;
  mach_port_name_t name;
  CFAbsoluteTime v3 = a1;
  if (qword_152E8) {
    sub_A5B0();
  }
  CFDateRef v4 = v3;
  mach_port_name_t v5 = mach_host_self();
  port[0] = 0;
  if (!host_get_special_port(v5, -1, 1, port))
  {
    mach_port_deallocate(mach_task_self_, v5);
    mach_port_name_t v5 = port[0];
  }

  name = 0;
  BOOL v6 = 0LL;
  if (!mach_port_allocate(mach_task_self_, 1u, &name))
  {
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0LL, v4);
    __int16 v8 = (void *)qword_152E8;
    qword_152E8 = (uint64_t)v7;

    if (!qword_152E8) {
      sub_A5B0();
    }
    *(void *)port = 0LL;
    v19 = port;
    v20 = 0x2020000000LL;
    v21 = 0LL;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    v17 = 0LL;
    v17 = sub_3C2C();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_3C94;
    handler[3] = &unk_10758;
    handler[4] = v16;
    handler[5] = port;
    handler[6] = a2;
    v14 = name;
    v15 = v5;
    dispatch_source_set_event_handler((dispatch_source_t)qword_152E8, handler);
    dispatch_activate((dispatch_object_t)qword_152E8);
    uint32_t v9 = host_request_notification(v5, 1, name);
    BOOL v6 = v9 == 0;
    if (!v9)
    {
      v10 = (os_log_s *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Time Change: Registered for time change notifications",  v12,  2u);
      }
    }

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(port, 8);
  }

  return v6;
}

void sub_3C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

unint64_t sub_3C2C()
{
  uint64_t v5 = 0LL;
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  int times = mach_get_times(0LL, &v5, &v3);
  if (times) {
    sub_A5C8(times);
  }
  mach_timebase_info v2 = 0LL;
  mach_timebase_info(&v2);
  return v4 - v5 * (unint64_t)v2.numer / v2.denom + 1000000000 * v3;
}

uint64_t sub_3C94(uint64_t a1)
{
  mach_msg_return_t v3;
  mach_msg_return_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  os_log_s *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  v13 = 0u;
  v14 = 0u;
  int v2 = *(_DWORD *)(a1 + 56);
  DWORD1(v13) = 24;
  HIDWORD(v13) = v2;
  uint64_t v3 = mach_msg_receive((mach_msg_header_t *)&v13);
  uint64_t v4 = v3;
  if (DWORD1(v14) == 951)
  {
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  _os_assumes_log(0LL);
  if (!v4) {
LABEL_3:
  }
    mach_msg_destroy((mach_msg_header_t *)&v13);
LABEL_4:
  uint64_t v5 = sub_3C2C();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v5
                                                               - *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL)
                                                                           + 24LL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v6 >= 0) {
    dispatch_source_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
  else {
    dispatch_source_t v7 = -v6;
  }
  __int16 v8 = (os_log_s *)qword_15398;
  uint32_t v9 = os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT);
  if (v7 < 0x6FC23AC01LL)
  {
    if (v9)
    {
      v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      *(_DWORD *)buf = 134218240;
      v16 = v11 / 1000000000;
      v17 = 2048;
      v18 = v11 % 1000000000 / 0xF4240uLL;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Time Change: have change of %lld.%03lld seconds, continuing to accumulate.",  buf,  0x16u);
    }
  }

  else
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      *(_DWORD *)buf = 134218240;
      v16 = v10 / 1000000000;
      v17 = 2048;
      v18 = v10 % 1000000000 / 0xF4240uLL;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Time Change: accumulated change of %lld.%03lld seconds, resetting activities.",  buf,  0x16u);
    }

    (*(void (**)(void))(a1 + 48))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

  __uint64_t result = host_request_notification(*(_DWORD *)(a1 + 60), 1, *(_DWORD *)(a1 + 56));
  if ((_DWORD)result) {
    return _os_assumes_log((int)result);
  }
  return result;
}

void sub_3F00()
{
  if (!qword_152F8)
  {
    v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"ActivityBaseDates", @"com.apple.xpc.activity2");
    if (v0)
    {
      id v1 = v0;
      qword_152F8 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v0);
      CFRelease(v1);
      sub_4038((const __CFDictionary *)qword_152F8);
    }

    else
    {
      qword_152F8 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }

    CFPreferencesSetAppValue(@"DateCompleted", 0LL, @"com.apple.xpc.activity2");
    CFPreferencesSetAppValue(@"DateSubmitted", 0LL, @"com.apple.xpc.activity2");
    dispatch_source_t v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_15390);
    uint64_t v3 = (void *)qword_152F0;
    qword_152F0 = (uint64_t)v2;

    dispatch_source_set_event_handler((dispatch_source_t)qword_152F0, &stru_10798);
    uint64_t v4 = (dispatch_source_s *)qword_152F0;
    dispatch_time_t v5 = dispatch_time(0LL, 86400000000000LL);
    dispatch_source_set_timer(v4, v5, 0x4E94914F0000uLL, 0x13A52453C000uLL);
    dispatch_activate((dispatch_object_t)qword_152F0);
  }

void sub_4038(const __CFDictionary *a1)
{
  if (a1)
  {
    size_t Count = CFDictionaryGetCount(a1);
    if (Count)
    {
      int64_t v3 = Count;
      uint64_t v4 = (const void **)calloc(Count, 8uLL);
      dispatch_time_t v5 = (const void **)calloc(v3, 8uLL);
      CFDictionaryGetKeysAndValues(a1, v4, v5);
      double Current = CFAbsoluteTimeGetCurrent();
      double v7 = CFAbsoluteTimeGetCurrent();
      if (v3 >= 1)
      {
        double v8 = v7 + -4838400.0;
        uint32_t v9 = v5;
        uint64_t v10 = v4;
        do
        {
          CFTypeID v11 = CFGetTypeID(*v9);
          CFTypeID TypeID = CFDateGetTypeID();
          CFTypeRef v13 = *v10;
          if (v11 == TypeID)
          {
            CFGetTypeID(*v10);
            CFStringGetTypeID();
            double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)*v9);
            if (AbsoluteTime >= v8)
            {
              if (AbsoluteTime > Current)
              {
                CFDateRef v15 = CFDateCreate(0LL, Current - kCFAbsoluteTimeIntervalSince1970);
                if (v15)
                {
                  CFDateRef v16 = v15;
                  CFDictionarySetValue(a1, *v10, v15);
                  CFRelease(v16);
                }
              }

              goto LABEL_9;
            }

            CFTypeRef v13 = *v10;
          }

          CFDictionaryRemoveValue(a1, v13);
LABEL_9:
          ++v10;
          ++v9;
          --v3;
        }

        while (v3);
      }

      free(v4);
      free(v5);
    }
  }

void sub_41AC(id a1)
{
}

CFMutableDictionaryRef sub_41B8(const char *a1)
{
  IOPMAssertionID AssertionID = 0;
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (result)
  {
    int64_t v3 = result;
    cStr = 0LL;
    asprintf(&cStr, "TEMP:%s", a1);
    if (cStr)
    {
      CFStringRef v4 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
      if (v4)
      {
        CFStringRef v5 = v4;
        CFDictionarySetValue(v3, @"AssertName", v4);
        CFRelease(v5);
        free(cStr);
        CFDictionarySetValue(v3, @"PlugInBundleID", @"com.apple.xpc.activity");
        CFDictionarySetValue(v3, @"AssertType", @"PreventUserIdleSystemSleep");
        CFDictionarySetValue(v3, @"TimeoutAction", @"TimeoutActionTurnOff");
        int valuePtr = 15;
        CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        if (v6)
        {
          CFNumberRef v7 = v6;
          CFDictionarySetValue(v3, @"TimeoutSeconds", v6);
          CFRelease(v7);
          int valuePtr = 255;
          CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          if (v8)
          {
            CFNumberRef v9 = v8;
            CFDictionarySetValue(v3, @"AssertLevel", v8);
            CFRelease(v9);
            if (IOPMAssertionCreateWithProperties(v3, &AssertionID)) {
              IOPMAssertionID AssertionID = 0;
            }
          }
        }
      }

      else
      {
        free(cStr);
      }
    }

    CFRelease(v3);
    return (CFMutableDictionaryRef)AssertionID;
  }

  return result;
}

void sub_4E6C(_Unwind_Exception *a1)
{
}

void sub_4E98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v5 = WeakRetained;
  if (WeakRetained)
  {
    CFNumberRef v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "scheduler_activity"));
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      objc_msgSend(v5, "setDas_eligible:", 1);
      objc_msgSend(v5, "setDas_started:", 1);
      if ([v5 state] == (char *)&dword_0 + 2)
      {
        CFNumberRef v8 = (os_log_s *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          CFNumberRef v9 = "DAS told us to run %{public}@, but it is already running";
LABEL_8:
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
        }
      }

      else
      {
        uint64_t v10 = (dispatch_source_s *)qword_15340;
        dispatch_time_t v11 = dispatch_time(0LL, 50000000LL);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
        CFNumberRef v8 = (os_log_s *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          CFNumberRef v9 = "DAS told us to run %{public}@";
          goto LABEL_8;
        }
      }
    }
  }
}

void sub_5018(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v5 = WeakRetained;
  if (WeakRetained)
  {
    CFNumberRef v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "scheduler_activity"));
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      if (objc_msgSend(v5, "das_eligible"))
      {
        objc_msgSend(v5, "setDas_eligible:", 0);
        if ([v5 state] == (char *)&dword_0 + 1 || objc_msgSend(v5, "state") == (char *)&dword_0 + 3)
        {
          sub_51B8(v5);
          sub_52E8(v5);
        }

        CFNumberRef v8 = (dispatch_source_s *)qword_15340;
        dispatch_time_t v9 = dispatch_time(0LL, 50000000LL);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
        uint64_t v10 = (os_log_s *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          dispatch_time_t v11 = "DAS told us to suspend %{public}@";
LABEL_11:
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0xCu);
        }
      }

      else
      {
        uint64_t v10 = (os_log_s *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          dispatch_time_t v11 = "DAS told us to suspend %{public}@, but it isn't eligible";
          goto LABEL_11;
        }
      }
    }
  }
}

void sub_51B8(void *a1)
{
  id v1 = a1;
  dispatch_source_t v2 = v1;
  if (byte_15300)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "scheduler_activity"));

    if (v3)
    {
      CFStringRef v4 = (void *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
      {
        CFStringRef v5 = v4;
        CFNumberRef v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheduler_activity"));
        int v9 = 138543618;
        uint64_t v10 = v6;
        __int16 v11 = 2048;
        int v12 = v2;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Canceling: %{public}@ (CTS Activity %p)", (uint8_t *)&v9, 0x16u);
      }

      unsigned int v7 = (void *)qword_153A8;
      CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheduler_activity"));
      [v7 activityCanceled:v8];

      objc_msgSend(v2, "setScheduler_activity:", 0);
    }
  }
}

void sub_52E8(void *a1)
{
  id v1 = a1;
  if (byte_15300)
  {
    dispatch_source_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithCTSActivity:](&OBJC_CLASS____DASActivity, "activityWithCTSActivity:", v1));
    objc_msgSend(v1, "setScheduler_activity:", v2);

    id v3 = (void *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      CFStringRef v4 = v3;
      CFStringRef v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "scheduler_activity"));
      int v12 = 138543618;
      CFTypeRef v13 = v5;
      __int16 v14 = 2048;
      id v15 = v1;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Submitting: %{public}@ (CTS Activity %p)", (uint8_t *)&v12, 0x16u);
    }

    CFNumberRef v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "group_name"));

    if (v6)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "group_name"));
      CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( _DASActivityGroup,  "groupWithName:maxConcurrent:",  v7,  objc_msgSend(v1, "group_concurrency_limit")));

      int v9 = (void *)qword_153A8;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "scheduler_activity"));
      [v9 submitActivity:v10 inGroup:v8];
    }

    else
    {
      __int16 v11 = (void *)qword_153A8;
      CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "scheduler_activity"));
      [v11 submitActivity:v8];
    }
  }
}

void init_cts(uint64_t a1)
{
  byte_15300 = objc_opt_class(&OBJC_CLASS____DASScheduler) != 0;
  qword_15308 = a1;
  os_log_t v2 = os_log_create("com.apple.xpc.activity", "Internal");
  id v3 = (void *)qword_15398;
  qword_15398 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.xpc.activity", "Activities");
  CFStringRef v5 = (void *)qword_153A0;
  qword_153A0 = (uint64_t)v4;

  CFNumberRef v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned int v7 = (void *)qword_15310;
  qword_15310 = (uint64_t)v6;

  ++dword_15350;
  xpc_event_provider_create();
}

void sub_565C(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (a1 == 2)
  {
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    id v9 = [(id)qword_15310 copy];
    id v13 = [v9 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v79;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v79 != v15) {
            objc_enumerationMutation(v9);
          }
          v17 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
          if ([v17 token] == a2)
          {
            v18 = (os_log_s *)qword_153A0;
            if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v17;
              _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Unregistered on XPC remove event: %{public}@",  buf,  0xCu);
            }

            [(id)qword_15310 removeObject:v17];
            if (byte_15300
              && (uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scheduler_activity"))) != 0
              && (v20 = (void *)v19, unsigned int v21 = [v17 repeating], v20, v21))
            {
              if (qword_15348) {
                sub_7770();
              }
              v22 = (os_log_s *)qword_15398;
              if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = v17;
                _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Creating zombie: %{public}@", buf, 0xCu);
              }

              objc_storeStrong((id *)&qword_15348, v17);
              __uint64_t v23 = sub_30EC();
              uint64_t v24 = v23 + 100000000;
              if ((uint64_t)(v23 + 100000000) < qword_152E0)
              {
                __uint64_t v25 = v23;
                qword_152E0 = v23 + 100000000;
                v26 = (os_log_s *)qword_15398;
                if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = qword_15348;
                  _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Set timer for zombie: %{public}@", buf, 0xCu);
                  uint64_t v24 = qword_152E0;
                }

                v27 = (dispatch_source_s *)qword_15330;
                dispatch_time_t v28 = dispatch_walltime(0LL, v24 - v25);
                dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
              }
            }

            else
            {
              sub_7B58(v17);
            }

            goto LABEL_95;
          }
        }

        id v14 = [v9 countByEnumeratingWithState:&v78 objects:v82 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    goto LABEL_95;
  }

  if (a1 == 1)
  {
    memset(v83, 0, sizeof(v83));
    if ((xpc_get_event_name("com.apple.xpc.activity", a2, v83) & 1) == 0) {
      __strlcpy_chk(v83, "<Unknown>", 128LL, 128LL);
    }
    CFNumberRef v6 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v83;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Creating on XPC add event: %{public}s", buf, 0xCu);
    }

    unsigned int v7 = sub_8BBC((uint64_t)v83, v5);
    CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (!v8)
    {
      uint64_t v29 = qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = v83;
        v30 = "Failed to create: %{public}s";
LABEL_93:
        v70 = (os_log_s *)v29;
LABEL_94:
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
      }

LABEL_95:
      goto LABEL_96;
    }

    [v8 setToken:a2];
    if ([v9 token])
    {
      id v10 = [v9 token];
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      memset(buf, 0, sizeof(buf));
      if (xpc_get_service_identifier_for_token(v10, buf))
      {
        __int16 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
        if (-[__CFString hasPrefix:](v11, "hasPrefix:", @"com.apple."))
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue( -[__CFString stringByReplacingOccurrencesOfString:withString:]( v11,  "stringByReplacingOccurrencesOfString:withString:",  @"com.apple.",  &stru_13BE0));

          __int16 v11 = (__CFString *)v12;
        }
      }

      else
      {
        __int16 v11 = &stru_13BE0;
      }

      if (-[__CFString length](v11, "length")) {
        [v9 setServiceName:v11];
      }
    }

    v31 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Created: %{public}@", buf, 0xCu);
    }

    if (!qword_15348)
    {
LABEL_91:
      [(id)qword_15310 addObject:v9];
      sub_52E8(v9);
      sub_8514(v9);
      uint64_t v29 = qword_153A0;
      if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v9;
        v30 = "Registered: %{public}@";
        goto LABEL_93;
      }

      goto LABEL_95;
    }

    id v32 = (id)qword_15348;
    id v33 = v9;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 name]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v33 name]);
    if ([v34 isEqualToString:v35])
    {
      unsigned int v36 = [v32 priority];
      if (v36 == [v33 priority])
      {
        unsigned int v37 = objc_msgSend(v32, "allow_battery");
        if (v37 == objc_msgSend(v33, "allow_battery"))
        {
          id v38 = [v32 interval];
          if (v38 == [v33 interval])
          {
            id v39 = objc_msgSend(v32, "grace_period");
            if (v39 == objc_msgSend(v33, "grace_period"))
            {
              id v40 = [v32 delay];
              if (v40 == [v33 delay])
              {
                id v41 = objc_msgSend(v32, "random_initial_delay");
                if (v41 == objc_msgSend(v33, "random_initial_delay"))
                {
                  unsigned int v42 = [v32 repeating];
                  if (v42 == [v33 repeating])
                  {
                    id v43 = objc_msgSend(v32, "expected_duration");
                    if (v43 == objc_msgSend(v33, "expected_duration"))
                    {
                      unsigned int v44 = objc_msgSend(v32, "requires_screen_sleep");
                      if (v44 == objc_msgSend(v33, "requires_screen_sleep"))
                      {
                        unsigned int v45 = objc_msgSend(v32, "requires_significant_user_inactivity");
                        if (v45 == objc_msgSend(v33, "requires_significant_user_inactivity"))
                        {
                          unsigned int v46 = objc_msgSend(v32, "power_nap");
                          if (v46 == objc_msgSend(v33, "power_nap"))
                          {
                            unsigned int v47 = objc_msgSend(v32, "app_refresh");
                            if (v47 == objc_msgSend(v33, "app_refresh"))
                            {
                              unsigned int v48 = objc_msgSend(v32, "memory_intensive");
                              if (v48 == objc_msgSend(v33, "memory_intensive"))
                              {
                                unsigned int v49 = objc_msgSend(v32, "cpu_intensive");
                                if (v49 == objc_msgSend(v33, "cpu_intensive"))
                                {
                                  unsigned int v50 = objc_msgSend(v32, "disk_intensive");
                                  if (v50 == objc_msgSend(v33, "disk_intensive"))
                                  {
                                    unsigned int v51 = objc_msgSend(v32, "requires_buddy_complete");
                                    if (v51 == objc_msgSend(v33, "requires_buddy_complete"))
                                    {
                                      unsigned int v52 = objc_msgSend(v32, "requires_inexpensive_network");
                                      if (v52 == objc_msgSend(v33, "requires_inexpensive_network"))
                                      {
                                        unsigned int v53 = objc_msgSend(v32, "requires_network_connectivity");
                                        if (v53 == objc_msgSend(v33, "requires_network_connectivity"))
                                        {
                                          id v54 = objc_msgSend(v32, "expected_network_download_size_bytes");
                                          if (v54 == objc_msgSend(v33, "expected_network_download_size_bytes"))
                                          {
                                            id v55 = objc_msgSend(v32, "expected_network_upload_size_bytes");
                                            if (v55 == objc_msgSend(v33, "expected_network_upload_size_bytes"))
                                            {
                                              unsigned int v56 = objc_msgSend(v32, "may_reboot_device");
                                              if (v56 == objc_msgSend(v33, "may_reboot_device"))
                                              {
                                                unsigned int v57 = objc_msgSend(v32, "duet_power_budgeted");
                                                if (v57 == objc_msgSend(v33, "duet_power_budgeted"))
                                                {
                                                  unsigned int v58 = objc_msgSend(v32, "schedule_rtc_wake");
                                                  if (v58 == objc_msgSend(v33, "schedule_rtc_wake"))
                                                  {
                                                    unsigned int v59 = objc_msgSend(v32, "requires_protection_class");
                                                    if (v59 == objc_msgSend( v33,  "requires_protection_class"))
                                                    {
                                                      id v77 = objc_claimAutoreleasedReturnValue( [v32 serviceName]);
                                                      v60 = (const char *)[v77 UTF8String];
                                                      id v76 = objc_claimAutoreleasedReturnValue( [v33 serviceName]);
                                                      v61 = (const char *)[v76 UTF8String];
                                                      if (v60 == v61 || v60 && v61 && !strcmp(v60, v61))
                                                      {
                                                        id v75 = objc_claimAutoreleasedReturnValue( objc_msgSend( v32, "group_name"));
                                                        v62 = (const char *)[v75 UTF8String];
                                                        id v74 = objc_claimAutoreleasedReturnValue( objc_msgSend( v33, "group_name"));
                                                        v63 = (const char *)[v74 UTF8String];
                                                        if (v62 == v63)
                                                        {

                                                          goto LABEL_79;
                                                        }

                                                        if (v62 && v63)
                                                        {
                                                          int v64 = strcmp(v62, v63);

                                                          if (!v64)
                                                          {
LABEL_79:
                                                            v65 = (os_log_s *)qword_15398;
                                                            if (os_log_type_enabled( (os_log_t)qword_15398,  OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              *(_DWORD *)buf = 138543618;
                                                              *(void *)&buf[4] = v33;
                                                              *(_WORD *)&buf[12] = 2114;
                                                              *(void *)&buf[14] = v32;
                                                              _os_log_impl( &dword_0,  v65,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ matches activity with name %{public}@",  buf,  0x16u);
                                                            }

                                                            if (byte_15300)
                                                            {
                                                              uint64_t v66 = objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_15348,  "scheduler_activity"));
                                                              if (v66)
                                                              {
                                                                v67 = (void *)v66;
                                                                unsigned __int8 v68 = objc_msgSend( (id)qword_15348,  "das_started");

                                                                if ((v68 & 1) == 0) {
                                                                  goto LABEL_98;
                                                                }
                                                              }
                                                            }

                                                            else if ((objc_msgSend( (id)qword_15348,  "das_started") & 1) == 0)
                                                            {
LABEL_98:
                                                              if (byte_15300)
                                                              {
                                                                v71 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_15348,  "scheduler_activity"));
                                                                objc_msgSend(v33, "setScheduler_activity:", v71);

                                                                objc_msgSend( (id)qword_15348,  "setScheduler_activity:",  0);
                                                                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "scheduler_activity"));
                                                                [v72 linkToCTSActivity:v33];
                                                              }

                                                              sub_7770();
                                                              [(id)qword_15310 addObject:v33];
                                                              sub_8514(v33);
                                                              uint64_t v73 = qword_153A0;
                                                              if (!os_log_type_enabled( (os_log_t)qword_153A0,  OS_LOG_TYPE_DEFAULT)) {
                                                                goto LABEL_95;
                                                              }
                                                              *(_DWORD *)buf = 138543362;
                                                              *(void *)&buf[4] = v33;
                                                              v30 = "Registered (with reuse): %{public}@";
                                                              v70 = (os_log_s *)v73;
                                                              goto LABEL_94;
                                                            }

                                                            goto LABEL_91;
                                                          }

LABEL_88:
                                                          v69 = (os_log_s *)qword_15398;
                                                          if (os_log_type_enabled( (os_log_t)qword_15398,  OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            *(_DWORD *)buf = 138543618;
                                                            *(void *)&buf[4] = v33;
                                                            *(_WORD *)&buf[12] = 2114;
                                                            *(void *)&buf[14] = v32;
                                                            _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ does not match activity with name %{public}@",  buf,  0x16u);
                                                          }

                                                          goto LABEL_91;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_88;
  }

LABEL_96:
}

void sub_614C()
{
  dispatch_source_t v0 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)qword_15390);
  id v1 = (void *)qword_15338;
  qword_15338 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15338, &stru_10868);
  dispatch_activate((dispatch_object_t)qword_15338);
  dispatch_source_t v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_15390);
  id v3 = (void *)qword_15340;
  qword_15340 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15340, &stru_10888);
  dispatch_source_set_timer((dispatch_source_t)qword_15340, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)qword_15340);
  dispatch_source_t v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_15390);
  id v5 = (void *)qword_15330;
  qword_15330 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15330, &stru_108A8);
  dispatch_activate((dispatch_object_t)qword_15330);
  notify_register_dispatch( "com.apple.xpc.activity.debug.trigger",  &dword_15354,  (dispatch_queue_t)qword_15390,  &stru_108E8);
  sub_3A34((void *)qword_15390, (uint64_t)sub_7968);
  int v6 = dword_15350;
  int v7 = dword_15350 - 1;
  if (dword_15350 >= 1)
  {
    --dword_15350;
    int v6 = v7;
  }

  if (!v6)
  {
    CFNumberRef v8 = (dispatch_source_s *)qword_15340;
    dispatch_time_t v9 = dispatch_time(0LL, 50000000LL);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  }

void sub_62E4(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_6384;
    handler[3] = &unk_10828;
    id v3 = v2;
    id v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_15390);
    xpc_connection_activate(v3);
  }
}

void sub_6384(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v5, "name");
    int v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    CFNumberRef v8 = v7;
    if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v8);
      __int16 v11 = sub_8BBC((uint64_t)string_ptr, v5);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        id v13 = (os_log_s *)qword_153A0;
        if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v18 = 138543362;
          *(void *)&v18[4] = v12;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Created unmanaged XPC Activity: %{public}@", v18, 0xCu);
        }

        [(id)qword_15310 addObject:v12];
        sub_52E8(v12);
        sub_8514(v12);
        id v14 = (os_log_s *)qword_153A0;
        if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v18 = 138543362;
          *(void *)&v18[4] = v12;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Registered unmanaged XPC Activity: %{public}@", v18, 0xCu);
        }

        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = (void *)xpc_copy_debug_description(v5);
          CFDateRef v16 = (os_log_s *)qword_15398;
          if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v18 = 136446466;
            *(void *)&v18[4] = string_ptr;
            *(_WORD *)&v18[12] = 2082;
            *(void *)&v18[14] = v15;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", v18, 0x16u);
          }

          free(v15);
        }

        [v12 setUnmanaged:1];
        [v12 setPeer:v4];
        *(void *)v18 = _NSConcreteStackBlock;
        *(void *)&v18[8] = 3221225472LL;
        *(void *)&v18[16] = sub_98D0;
        uint64_t v19 = &unk_10910;
        id v20 = v12;
        unsigned int v21 = (_xpc_connection_s *)v4;
        xpc_connection_set_event_handler(v21, v18);
      }

      else
      {
        v17 = (os_log_s *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_ERROR)) {
          sub_A620((uint64_t)string_ptr, v17);
        }
      }
    }

    else
    {
      dispatch_time_t v9 = (os_log_s *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_ERROR)) {
        sub_A5E0(v9);
      }
    }
  }
}

void sub_666C(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    id v3 = (void *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 67109120;
      pid_t pid = xpc_connection_get_pid(v2);
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Control channel connection: %d", buf, 8u);
    }

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_6798;
    handler[3] = &unk_10828;
    id v5 = v2;
    int v7 = v5;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_set_target_queue(v5, (dispatch_queue_t)qword_15390);
    xpc_connection_activate(v5);
  }
}

void sub_6798(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error) {
    goto LABEL_101;
  }
  string = xpc_dictionary_get_string(v2, "Command");
  id v4 = xpc_dictionary_get_string(v2, "Identifier");
  id v5 = (os_log_s *)qword_15398;
  if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v59 = string;
    __int16 v60 = 2082;
    v61 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Control Channel: %{public}s %{public}s", buf, 0x16u);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v2);
  if (!string) {
    goto LABEL_8;
  }
  if (strcmp(string, "Run"))
  {
    if (strcmp(string, "List"))
    {
      if (strcmp(string, "Debug"))
      {
LABEL_8:
        unsigned int v7 = 22;
        goto LABEL_98;
      }

      xpc_object_t xdict = reply;
      xpc_dictionary_get_uint64(v2, "Flags");
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id v9 = (id)qword_15310;
      id v40 = [v9 countByEnumeratingWithState:&v54 objects:buf count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v55;
        unsigned int v7 = 2;
        do
        {
          for (i = 0LL; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v55 != v42) {
              objc_enumerationMutation(v9);
            }
            if (v4)
            {
              unsigned int v44 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
              id v45 = objc_claimAutoreleasedReturnValue([v44 name]);
              int v46 = strcmp((const char *)[v45 UTF8String], v4);

              if (!v46)
              {
                objc_msgSend(v44, "setBgtask_debug:", 1);
                unsigned int v7 = 0;
              }
            }
          }

          id v41 = [v9 countByEnumeratingWithState:&v54 objects:buf count:16];
        }

        while (v41);
      }

      else
      {
        unsigned int v7 = 2;
      }

      goto LABEL_97;
    }

    id v51 = v2;
    xpc_object_t xdicta = reply;
    xpc_object_t v18 = xpc_array_create(0LL, 0LL);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v19 = (id)qword_15310;
    id v20 = [v19 countByEnumeratingWithState:&v54 objects:buf count:16];
    if (!v20) {
      goto LABEL_80;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v55;
LABEL_27:
    uint64_t v23 = 0LL;
    while (1)
    {
      if (*(void *)v55 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
      if (v4)
      {
        id v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v54 + 1)
                                                                                              + 8 * v23), "name")));
        int v26 = strcmp((const char *)[v25 UTF8String], v4);

        if (v26) {
          goto LABEL_78;
        }
      }

      xpc_object_t v27 = xpc_dictionary_create(0LL, 0LL, 0LL);
      id v28 = objc_claimAutoreleasedReturnValue([v24 name]);
      xpc_dictionary_set_string(v27, "Identifier", (const char *)[v28 UTF8String]);

      switch((unint64_t)[v24 state])
      {
        case 0uLL:
          uint64_t v29 = v27;
          v30 = "CheckIn";
          goto LABEL_39;
        case 1uLL:
          uint64_t v29 = v27;
          v30 = "Wait";
          goto LABEL_39;
        case 2uLL:
          xpc_dictionary_set_string(v27, "State", "Run");
          xpc_dictionary_set_BOOL(v27, "ConfirmedRun", (BOOL)objc_msgSend(v24, "confirmed_run"));
          break;
        case 3uLL:
          uint64_t v29 = v27;
          v30 = "Defer";
          goto LABEL_39;
        case 4uLL:
          uint64_t v29 = v27;
          v30 = "Continue";
          goto LABEL_39;
        case 5uLL:
          uint64_t v29 = v27;
          v30 = "Done";
LABEL_39:
          xpc_dictionary_set_string(v29, "State", v30);
          break;
        default:
          break;
      }

      int64_t v31 = sub_3170((uint64_t)objc_msgSend(v24, "baseTime", v51));
      xpc_dictionary_set_date(v27, "BaseTime", v31);
      if ([v24 state] == (char *)&dword_0 + 1 || objc_msgSend(v24, "state") == (char *)&dword_0 + 3)
      {
        int64_t v32 = sub_3170((uint64_t)[v24 eligibleTime]);
        xpc_dictionary_set_date(v27, "Eligible", v32);
        if (objc_msgSend(v24, "grace_period") != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v33 = sub_3170((uint64_t)[v24 deadlineTime]);
          xpc_dictionary_set_date(v27, "Deadline", v33);
        }
      }

      xpc_dictionary_set_uint64(v27, "ElapsedTime", (unint64_t)[v24 elapsedTime] / 0x3B9ACA00);
      xpc_dictionary_set_int64(v27, "SequenceNumber", (int64_t)[v24 seqno]);
      xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v34, "Interval", (int64_t)[v24 interval]);
      xpc_dictionary_set_int64(v34, "GracePeriod", (int64_t)objc_msgSend(v24, "grace_period"));
      xpc_dictionary_set_int64(v34, "Delay", (int64_t)[v24 delay]);
      unsigned int v35 = [v24 priority];
      if (!v35) {
        break;
      }
      if (v35 == 1)
      {
        unsigned int v36 = "Utility";
LABEL_48:
        xpc_dictionary_set_string(v34, "Priority", v36);
      }

      xpc_dictionary_set_BOOL(v34, "AllowBattery", (BOOL)objc_msgSend(v24, "allow_battery"));
      xpc_dictionary_set_BOOL(v34, "Repeating", (BOOL)[v24 repeating]);
      xpc_dictionary_set_BOOL(v34, "PowerNap", (BOOL)objc_msgSend(v24, "power_nap"));
      xpc_dictionary_set_BOOL(v34, "AppRefresh", (BOOL)objc_msgSend(v24, "app_refresh"));
      unsigned int v37 = objc_msgSend(v24, "requires_protection_class") - 1;
      if (v37 <= 2) {
        xpc_dictionary_set_string(v34, "RequireProtectionClass", off_10930[v37]);
      }
      if (objc_msgSend(v24, "requires_significant_user_inactivity")) {
        xpc_dictionary_set_BOOL( v34,  "RequiresSignificantUserInactivity",  (BOOL)objc_msgSend(v24, "requires_significant_user_inactivity"));
      }
      if (objc_msgSend(v24, "requires_network_connectivity")) {
        xpc_dictionary_set_BOOL( v34,  "RequiresNetworkConnectivity",  (BOOL)objc_msgSend(v24, "requires_network_connectivity"));
      }
      if (objc_msgSend(v24, "requires_inexpensive_network")) {
        xpc_dictionary_set_BOOL( v34,  "RequiresInexpensiveNetwork",  (BOOL)objc_msgSend(v24, "requires_inexpensive_network"));
      }
      xpc_dictionary_set_value(v27, "Effective Criteria", v34);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "group_name"));

      if (v38)
      {
        id v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "group_name"));
        xpc_dictionary_set_string(v27, "ActivityGroupName", (const char *)[v39 UTF8String]);

        xpc_dictionary_set_uint64(v27, "MaxConcurrencyLimit", (uint64_t)objc_msgSend(v24, "group_concurrency_limit"));
      }

      xpc_array_append_value(v18, v27);

LABEL_78:
      if (v21 == (id)++v23)
      {
        id v21 = [v19 countByEnumeratingWithState:&v54 objects:buf count:16];
        if (!v21)
        {
LABEL_80:

          xpc_object_t reply = xdicta;
          xpc_dictionary_set_value(xdicta, "List", v18);

          unsigned int v7 = 0;
          id v2 = v51;
          goto LABEL_98;
        }

        goto LABEL_27;
      }
    }

    unsigned int v36 = "Maintenance";
    goto LABEL_48;
  }

  xpc_object_t xdict = reply;
  CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  id v9 = v8;
  if (byte_15300 && ![v8 hasPrefix:@"com.apple.xpc.activity.test."])
  {
    unsigned int v47 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      unsigned int v59 = v4;
      _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_DEFAULT,  "Control Channel: 'ctsctl run' is unsupported, please use 'dastool run' instead for %{public}s",  buf,  0xCu);
    }

    unsigned int v7 = 78;
  }

  else
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v10 = objc_msgSend((id)qword_15310, "copy", v2);
    id v11 = [v10 countByEnumeratingWithState:&v54 objects:buf count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v55;
      unsigned int v7 = 2;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(v10);
          }
          if (v4)
          {
            uint64_t v15 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)j);
            id v16 = objc_claimAutoreleasedReturnValue([v15 name]);
            int v17 = strcmp((const char *)[v16 UTF8String], v4);

            if (!v17)
            {
              if ([v15 state] == (char *)&dword_0 + 1
                || [v15 state] == (char *)&dword_0 + 3)
              {
                [v15 setEligible:1];
                sub_7C08(v15, 2LL, 0LL);
                unsigned int v7 = 0;
              }

              else
              {
                unsigned int v7 = 16;
              }
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v54 objects:buf count:16];
      }

      while (v12);
    }

    else
    {
      unsigned int v7 = 2;
    }

    id v2 = v50;
  }

LABEL_97:
  xpc_object_t reply = xdict;
LABEL_98:
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Result", v7);
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(reply);
    unsigned int v49 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v49, reply);
  }

LABEL_101:
}

void sub_7274(id a1)
{
  if (!CFPreferencesAppSynchronize(@"com.apple.xpc.activity2")) {
    _os_assumes_log(0LL);
  }
}

void sub_72A0(id a1)
{
  id v1 = (os_log_s *)qword_15398;
  if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "evaluating activities", buf, 2u);
  }

  sub_7770();
  v31.tv_sec = 0LL;
  *(void *)&v31.tv_usec = 0LL;
  gettimeofday(&v31, 0LL);
  if (dword_15350 < 1)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v3 = [(id)qword_15310 copy];
    id v4 = [v3 countByEnumeratingWithState:&v27 objects:buf count:16];
    if (!v4) {
      goto LABEL_44;
    }
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    id key = (char *)XPC_ACTIVITY_SEQUENCE_NUMBER;
    while (1)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(v8, "das_eligible");
        id v10 = [v8 eligibleTime];
        if ((uint64_t)v10 <= (uint64_t)sub_30EC())
        {
          if (!byte_15300)
          {
            uint64_t v16 = qword_15398;
            id v9 = &dword_0 + 1;
            if (!os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO)) {
              goto LABEL_19;
            }
            *(_DWORD *)int64_t v33 = 138543362;
            id v34 = v8;
            id v14 = (os_log_s *)v16;
            uint64_t v15 = "Activity %{public}@ is eligible to run.";
            goto LABEL_18;
          }

          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
          unsigned int v12 = [v11 hasPrefix:@"com.apple.xpc.activity.test."];

          if (v12)
          {
            uint64_t v13 = qword_15398;
            id v9 = &dword_0 + 1;
            if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int64_t v33 = 138543362;
              id v34 = v8;
              id v14 = (os_log_s *)v13;
              uint64_t v15 = "Debug activity %{public}@ is eligible to run.";
LABEL_18:
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, v33, 0xCu);
            }
          }
        }

LABEL_19:
        int v17 = (char *)[v8 state];
        if (v17 == (_BYTE *)&dword_0 + 3) {
          goto LABEL_22;
        }
        if (v17 != (_BYTE *)&dword_0 + 2)
        {
          if (v17 != (_BYTE *)&dword_0 + 1) {
            goto LABEL_39;
          }
LABEL_22:
          if ((_DWORD)v9) {
            sub_7C08(v8, 2LL, 0LL);
          }
          goto LABEL_39;
        }

        if ((_DWORD)v9 != [v8 eligible])
        {
          xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);

          id v19 = (os_log_s *)qword_153A0;
          BOOL v20 = os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              *(_DWORD *)int64_t v33 = 138543618;
              id v21 = "false";
              if ((_DWORD)v9) {
                id v21 = "true";
              }
              id v34 = v8;
              __int16 v35 = 2080;
              unsigned int v36 = v21;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating: %{public}@ (eligible=%s)", v33, 0x16u);
            }

            xpc_object_t v22 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_BOOL(v22, "eligible", (BOOL)v9);
            if ([v8 unmanaged])
            {
              id v23 = objc_claimAutoreleasedReturnValue([v8 name]);
              xpc_dictionary_set_string(v22, "name", (const char *)[v23 UTF8String]);
            }

            if ([v8 seqno]) {
              xpc_dictionary_set_uint64(v22, key, (uint64_t)[v8 seqno]);
            }
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
            xpc_connection_send_notification(v24, v22);
          }

          else if (v20)
          {
            *(_DWORD *)int64_t v33 = 138543618;
            id v25 = "false";
            if ((_DWORD)v9) {
              id v25 = "true";
            }
            id v34 = v8;
            __int16 v35 = 2080;
            unsigned int v36 = v25;
            _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "Updating (deferred): %{public}@ (eligible=%s)",  v33,  0x16u);
          }
        }

LABEL_39:
        [v8 setEligible:v9];
      }

      id v5 = [v3 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (!v5)
      {
LABEL_44:

        return;
      }
    }
  }

  id v2 = (os_log_s *)qword_15398;
  if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "activities are suspended", buf, 2u);
  }

void sub_7770()
{
  dispatch_source_t v0 = (void *)qword_15348;
  if (qword_15348)
  {
    id v1 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      int v4 = 138543362;
      uint64_t v5 = qword_15348;
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Reaping zombie: %{public}@", (uint8_t *)&v4, 0xCu);
      dispatch_source_t v0 = (void *)qword_15348;
    }

    sub_7B58(v0);
    id v2 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      int v4 = 138543362;
      uint64_t v5 = qword_15348;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "REAPED zombie: %{public}@", (uint8_t *)&v4, 0xCu);
    }

    id v3 = (void *)qword_15348;
    qword_15348 = 0LL;
  }

void sub_7888(id a1)
{
  qword_152E0 = 0x7FFFFFFFFFFFFFFFLL;
  id v1 = (os_log_s *)qword_15398;
  if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "activity timer fired", v4, 2u);
  }

  id v2 = (dispatch_source_s *)qword_15340;
  dispatch_time_t v3 = dispatch_time(0LL, 50000000LL);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
}

void sub_7924(id a1, int a2)
{
  id v2 = (dispatch_source_s *)qword_15340;
  dispatch_time_t v3 = dispatch_time(0LL, 50000000LL);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
}

void sub_7968(uint64_t a1)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = (id)qword_15310;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    if (a1 >= 0) {
      unint64_t v7 = a1;
    }
    else {
      unint64_t v7 = -a1;
    }
    int64_t v8 = v7 / 0x3B9ACA00;
    *(void *)&__int128 v4 = 138543362LL;
    __int128 v13 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "state", v13, (void)v14) == (char *)&dword_0 + 1
          || [v10 state] == (char *)&dword_0 + 3)
        {
          id v11 = [v10 delay];
          if (v8 >= ((uint64_t)v11 + (uint64_t)objc_msgSend(v10, "grace_period")) / 100)
          {
            unsigned int v12 = (os_log_s *)qword_15398;
            if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v13;
              id v19 = v10;
              _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Time Change: resubmitting actiivty %{public}@",  buf,  0xCu);
            }

            sub_51B8(v10);
            sub_52E8(v10);
            sub_8514(v10);
          }
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v5);
  }
}

void sub_7B58(void *a1)
{
  id v5 = a1;
  sub_7C08(v5, -1LL, 0LL);
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v5 peer]);

  if (v1)
  {
    id v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 peer]);
    xpc_connection_cancel(v2);
  }

  [v5 setPeer:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 connection]);

  if (v3)
  {
    __int128 v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 connection]);
    xpc_connection_cancel(v4);
  }

  [v5 setConnection:0];
}

void sub_7C08(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)qword_15398;
  if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = v6;
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    *(_DWORD *)unsigned int v52 = 138543874;
    *(void *)&v52[4] = v8;
    *(_WORD *)&v52[12] = 2048;
    *(void *)&v52[14] = [v5 state];
    *(_WORD *)&v52[22] = 2048;
    unsigned int v53 = (void *)a2;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@ state change %ld -> %ld", v52, 0x20u);
  }

  switch(a2)
  {
    case -1LL:
      sub_51B8(v5);
      a2 = -1LL;
      goto LABEL_58;
    case 2LL:
      objc_msgSend(v5, "setConfirmed_run:", 0);
      id v9 = (os_log_s *)qword_153A0;
      if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v52 = 138543362;
        *(void *)&v52[4] = v5;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Initiating: %{public}@", v52, 0xCu);
      }

      [v5 markStarted:sub_30EC()];
      if (objc_msgSend(v5, "schedule_rtc_wake"))
      {
        unsigned int v10 = objc_msgSend(v5, "power_assertion");
        if (v10) {
          _os_assumes_log(v10);
        }
        signed int v11 = [v5 pid];
        if (v11) {
          _os_assumes_log(v11);
        }
        id v12 = objc_claimAutoreleasedReturnValue([v5 name]);
        objc_msgSend(v5, "setPower_assertion:", sub_41B8((const char *)objc_msgSend(v12, "UTF8String")));

        __int128 v13 = (void *)qword_15398;
        if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v14 = v13;
          unsigned int v15 = objc_msgSend(v5, "power_assertion");
          *(_DWORD *)unsigned int v52 = 138543618;
          *(void *)&v52[4] = v5;
          *(_WORD *)&v52[12] = 1024;
          *(_DWORD *)&v52[14] = v15;
          _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "Created temporary power assertion for %{public}@: %d",  v52,  0x12u);
        }
      }

      xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if ([v5 seqno]) {
        xpc_dictionary_set_uint64(v16, XPC_ACTIVITY_SEQUENCE_NUMBER, (uint64_t)[v5 seqno]);
      }
      if (![v5 unmanaged])
      {
        id v31 = v5;
        if (![v31 unmanaged])
        {
          int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 connection]);

          if (!v32)
          {
            xpc_connection_t v33 = xpc_connection_create(0LL, (dispatch_queue_t)qword_15390);
            [v31 setConnection:v33];

            id v34 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v31 connection]);
            *(void *)unsigned int v52 = _NSConcreteStackBlock;
            *(void *)&v52[8] = 3221225472LL;
            *(void *)&v52[16] = sub_867C;
            unsigned int v53 = &unk_10828;
            id v35 = v31;
            id v54 = v35;
            xpc_connection_set_event_handler(v34, v52);

            unsigned int v36 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v35 connection]);
            xpc_connection_activate(v36);
          }

          unsigned int v37 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v31 connection]);
          xpc_endpoint_t v38 = xpc_endpoint_create(v37);

          xpc_dictionary_set_value(v16, XPC_ACTIVITY_REPLY_ENDPOINT, v38);
          [v31 token];
          xpc_event_provider_token_fire();
        }

        sub_A5B0();
      }

      xpc_dictionary_set_BOOL(v16, "run", 1);
      id v17 = objc_claimAutoreleasedReturnValue([v5 name]);
      xpc_dictionary_set_string(v16, "name", (const char *)[v17 UTF8String]);

      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 peer]);
      xpc_connection_send_notification(v18, v16);

      a2 = 2LL;
      break;
    case 3LL:
      id v19 = (os_log_s *)qword_153A0;
      if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v52 = 138543362;
        *(void *)&v52[4] = v5;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Deferring: %{public}@", v52, 0xCu);
      }

      if (((objc_msgSend(v5, "power_nap") & 1) != 0 || objc_msgSend(v5, "app_refresh"))
        && IOPMIsADarkWake(0LL)
        && IOPMAllowsBackgroundTask(0LL))
      {
        [v5 resetBaseTime];
      }

      sub_8514(v5);
      sub_51B8(v5);
      sub_52E8(v5);
      a2 = 3LL;
      goto LABEL_58;
    case 5LL:
      BOOL v20 = (os_log_s *)qword_153A0;
      if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v52 = 138543362;
        *(void *)&v52[4] = v5;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Completed: %{public}@", v52, 0xCu);
      }

      if (byte_15300)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheduler_activity"));
        [v21 setCompletionStatus:a3];
      }

      id v22 = v5;
      id v23 = v22;
      if (byte_15300)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "scheduler_activity"));

        if (v24)
        {
          unsigned __int8 v25 = objc_msgSend(v23, "das_started");
          int v26 = (void *)qword_15398;
          if ((v25 & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
            {
              __int128 v27 = v26;
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheduler_activity"));
              *(_DWORD *)unsigned int v52 = 138543618;
              *(void *)&v52[4] = v28;
              *(_WORD *)&v52[12] = 2048;
              *(void *)&v52[14] = v23;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Completing: %{public}@ (CTS Activity %p)", v52, 0x16u);
            }

            __int128 v29 = (void *)qword_153A8;
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheduler_activity"));
            [v29 activityCompleted:v30];

            objc_msgSend(v23, "setScheduler_activity:", 0);
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
            {
              id v39 = v26;
              id v40 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
              *(_DWORD *)unsigned int v52 = 138543618;
              *(void *)&v52[4] = v40;
              *(_WORD *)&v52[12] = 2048;
              *(void *)&v52[14] = v23;
              _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  "Trying to complete DASActivity for %{public}@ (CTS Activity %p) but it never started, likely forced. Canceling instead.",  v52,  0x16u);
            }

            sub_51B8(v23);
          }
        }
      }

      [v23 advanceBaseTime];
      if (objc_msgSend(v23, "post_install"))
      {
        id v41 = v23;
        uint64_t v42 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.xpc.activity2");
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults arrayForKey:](v42, "arrayForKey:", @"VersionSpecificActivitiesRun"));
        unsigned int v44 = v43;
        if (v43) {
          id v45 = (NSMutableArray *)[v43 mutableCopy];
        }
        else {
          id v45 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
        }
        int v46 = v45;
        unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v41 name]);

        -[NSMutableArray addObject:](v46, "addObject:", v47);
        -[NSUserDefaults setObject:forKey:](v42, "setObject:forKey:", v46, @"VersionSpecificActivitiesRun");
      }

      if ([v23 repeating])
      {
        unsigned int v48 = (os_log_s *)qword_153A0;
        if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned int v52 = 138543362;
          *(void *)&v52[4] = v23;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Rescheduling: %{public}@", v52, 0xCu);
        }

        sub_8514(v23);
        [v23 setEligible:0];
        sub_52E8(v23);
        a2 = 1LL;
      }

      else
      {
        a2 = 5LL;
      }

LABEL_58:
      break;
    default:
      break;
  }

  [v5 setState:a2];
  if ([v5 state] != (char *)&dword_0 + 2 && objc_msgSend(v5, "power_assertion"))
  {
    unsigned int v49 = (void *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      unsigned int v50 = v49;
      unsigned int v51 = objc_msgSend(v5, "power_assertion");
      *(_DWORD *)unsigned int v52 = 67109378;
      *(_DWORD *)&v52[4] = v51;
      *(_WORD *)&v52[8] = 2114;
      *(void *)&v52[10] = v5;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "releasing power assertion: %d for %{public}@", v52, 0x12u);
    }

    j__IOPMAssertionRelease((IOPMAssertionID)objc_msgSend(v5, "power_assertion"));
    objc_msgSend(v5, "setPower_assertion:", 0);
  }
}

void sub_8514(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!byte_15300
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 name]),
        unsigned int v4 = [v3 hasPrefix:@"com.apple.xpc.activity.test."],
        v3,
        v4))
  {
    int64_t v5 = sub_30EC();
    id v6 = [v2 eligibleTime];
    BOOL v7 = (uint64_t)v6 - v5 < 1000000000 || (uint64_t)v6 < v5;
    uint64_t v8 = v5 + 1000000000;
    if (!v7) {
      uint64_t v8 = (uint64_t)v6;
    }
    if (v8 < qword_152E0)
    {
      qword_152E0 = v8;
      id v9 = (dispatch_source_s *)qword_15330;
      unint64_t v10 = v8 - v5;
      dispatch_time_t v11 = dispatch_walltime(0LL, v8 - v5);
      dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      id v12 = (os_log_s *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
      {
        int v13 = 138543618;
        __int128 v14 = v2;
        __int16 v15 = 2048;
        unint64_t v16 = v10 / 0x3B9ACA00;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Scheduling activity timer for [%{public}@] in %lld seconds",  (uint8_t *)&v13,  0x16u);
      }
    }
  }
}

void sub_867C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_15390);
    BOOL v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    id v9 = sub_8778;
    unint64_t v10 = &unk_10910;
    id v11 = *(id *)(a1 + 32);
    unsigned int v4 = v3;
    id v12 = v4;
    xpc_connection_set_event_handler(v4, &v7);
    xpc_connection_activate(v4);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer", v7, v8, v9, v10));

    if (v5)
    {
      id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peer]);
      xpc_connection_cancel(v6);
    }

    [*(id *)(a1 + 32) setPeer:v4];
  }
}

void sub_8778(uint64_t a1, void *a2)
{
}

void sub_8788(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7 == &_xpc_error_connection_invalid)
  {
    __int128 v14 = (os_log_s *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      int v27 = 138543362;
      *(void *)__int128 v28 = v5;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Client connection closed: %{public}@", (uint8_t *)&v27, 0xCu);
    }

    __int16 v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 peer]);

    if (v15 == v6)
    {
      unint64_t v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 peer]);
      xpc_connection_cancel(v16);

      [v5 setPeer:0];
    }

    if ([v5 unmanaged])
    {
      id v17 = (os_log_s *)qword_153A0;
      if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138543362;
        *(void *)__int128 v28 = v5;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "Unregistered unmanaged XPC Activity: %{public}@",  (uint8_t *)&v27,  0xCu);
      }

      [(id)qword_15310 removeObject:v5];
      sub_7B58(v5);
    }
  }

  else if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(v8, "state");
    int64_t v10 = xpc_dictionary_get_int64(v8, "completion_status");
    if (int64 == 2)
    {
      if ([v5 state] == (char *)&dword_0 + 2)
      {
        objc_msgSend(v5, "setConfirmed_run:", 1);
        [v5 setPid:xpc_connection_get_pid(v6)];
        xpc_object_t v18 = (void *)qword_153A0;
        if (os_log_type_enabled((os_log_t)qword_153A0, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = v18;
          int v27 = 67109378;
          *(_DWORD *)__int128 v28 = [v5 pid];
          *(_WORD *)&v28[4] = 2114;
          *(void *)&v28[6] = v5;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Running (PID %d): %{public}@", (uint8_t *)&v27, 0x12u);
        }

        if (byte_15300)
        {
          id v20 = [v5 pid];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheduler_activity"));
          [v21 setPid:v20];

          id v22 = (void *)qword_153A8;
          id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheduler_activity"));
          [v22 activityStarted:v23];
        }

        IOPMAssertionID v24 = objc_msgSend(v5, "power_assertion");
        if (v24)
        {
          IOPMAssertionID v25 = v24;
          j__IOPMAssertionRelease(v24);
          int v26 = (os_log_s *)qword_15398;
          if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
          {
            int v27 = 138543618;
            *(void *)__int128 v28 = v5;
            *(_WORD *)&v28[8] = 1024;
            *(_DWORD *)&v28[10] = v25;
            _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "releasing temporary power assertion: %{public}@: %d",  (uint8_t *)&v27,  0x12u);
          }

          objc_msgSend(v5, "setPower_assertion:", 0);
        }
      }
    }

    else if (int64 == 5 || int64 == 3)
    {
      sub_7C08(v5, int64, v10);
    }

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "state", (int64_t)[v5 state]);
      xpc_dictionary_set_BOOL(reply, "eligible", (BOOL)[v5 eligible]);
      if ([v5 seqno]) {
        xpc_dictionary_set_uint64(reply, XPC_ACTIVITY_SEQUENCE_NUMBER, (uint64_t)[v5 seqno]);
      }
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(reply);
      int v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v13, reply);
    }
  }
}

CTSActivity *sub_8BBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_A5B0();
  }
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___CTSActivity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[CTSActivity setName:](v4, "setName:", v5);

  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_POST_INSTALL))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v4, "name"));
    *(void *)__int128 v87 = 0LL;
    id v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.xpc.activity2");
    if (!qword_15358)
    {
      if (sysctlbyname_get_data_np("kern.osversion", v87, &qword_15358))
      {

        goto LABEL_21;
      }

      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *(void *)v87));
      free(*(void **)v87);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v7, "stringForKey:", @"ProductBuildVersion"));
      if (([v72 isEqualToString:v71] & 1) == 0)
      {
        -[NSUserDefaults removeObjectForKey:](v7, "removeObjectForKey:", @"VersionSpecificActivitiesRun");
        -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v71, @"ProductBuildVersion");
      }
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults arrayForKey:]( v7,  "arrayForKey:",  @"VersionSpecificActivitiesRun",  *(void *)v87));
    unsigned __int8 v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0)
    {
      -[CTSActivity setPost_install:](v4, "setPost_install:", 1LL);
      goto LABEL_6;
    }

LABEL_21:
    id v22 = 0LL;
    goto LABEL_112;
  }

LABEL_6:
  string = xpc_dictionary_get_string(v3, XPC_ACTIVITY_PRIORITY);
  if (!string || (id v11 = string, !strcmp(string, XPC_ACTIVITY_PRIORITY_MAINTENANCE)))
  {
    -[CTSActivity setPriority:](v4, "setPriority:", 0LL);
  }

  else
  {
    if (strcmp(v11, XPC_ACTIVITY_PRIORITY_UTILITY))
    {
      id v12 = (void *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_ERROR))
      {
        int v13 = v12;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v4, "name"));
        *(_DWORD *)__int128 v87 = 138543874;
        *(void *)&v87[4] = v14;
        __int16 v88 = 2080;
        __int128 v89 = XPC_ACTIVITY_PRIORITY_UTILITY;
        __int16 v90 = 2080;
        v91 = XPC_ACTIVITY_PRIORITY_MAINTENANCE;
        _os_log_error_impl( &dword_0,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: permissible values for priority are %s or %s",  v87,  0x20u);
      }

      goto LABEL_21;
    }

    -[CTSActivity setPriority:](v4, "setPriority:", 1LL);
    -[CTSActivity setAllow_battery:](v4, "setAllow_battery:", 1LL);
  }

  xpc_object_t value = xpc_dictionary_get_value(v3, XPC_ACTIVITY_ALLOW_BATTERY);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v17 = v16;
  if (v16) {
    -[CTSActivity setAllow_battery:](v4, "setAllow_battery:", xpc_BOOL_get_value(v16));
  }
  xpc_object_t v18 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_INTERVAL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[CTSActivity setInterval:](v4, "setInterval:", sub_98E0((uint64_t)v19));

  if (-[CTSActivity interval](v4, "interval") >= 1)
  {
    if (-[CTSActivity post_install](v4, "post_install"))
    {
      id v20 = (os_log_s *)(id)qword_15398;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v4, "name"));
        *(_DWORD *)__int128 v87 = 138543362;
        *(void *)&v87[4] = v21;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@: postinstall activites are not allowed to repeat; interval property ignored.",
          v87,
          0xCu);
      }
    }

    else
    {
      int64_t v23 = -[CTSActivity interval](v4, "interval");
      if (v23 >= 0) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v23 + 1;
      }
      -[CTSActivity setDelay:](v4, "setDelay:", v24 >> 1);
      int64_t v25 = -[CTSActivity interval](v4, "interval");
      if (v25 >= 0) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = v25 + 1;
      }
      uint64_t v27 = -[CTSActivity interval](v4, "interval");
      uint64_t v28 = v27 & 1;
      if (v27 < 0) {
        uint64_t v28 = -v28;
      }
      -[CTSActivity setGrace_period:](v4, "setGrace_period:", v28 + (v26 >> 1));
      -[CTSActivity setRepeating:](v4, "setRepeating:", 1LL);
    }
  }

  xpc_object_t v29 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DELAY);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (v30) {
    -[CTSActivity setDelay:](v4, "setDelay:", sub_98E0((uint64_t)v30));
  }
  xpc_object_t v31 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RANDOM_INITIAL_DELAY);
  int64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  if (v32) {
    -[CTSActivity setRandom_initial_delay:](v4, "setRandom_initial_delay:", sub_98E0((uint64_t)v32));
  }
  xpc_object_t v33 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GRACE_PERIOD);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  if (v34) {
    -[CTSActivity setGrace_period:](v4, "setGrace_period:", sub_98E0((uint64_t)v34));
  }
  xpc_object_t v35 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_REPEATING);
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

  if (v36)
  {
    if (-[CTSActivity post_install](v4, "post_install"))
    {
      unsigned int v37 = (os_log_s *)(id)qword_15398;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        xpc_endpoint_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v4, "name"));
        *(_DWORD *)__int128 v87 = 138543362;
        *(void *)&v87[4] = v38;
        _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@: postinstall activites are not allowed to repeat; repeating property ignored.",
          v87,
          0xCu);
      }
    }

    else
    {
      -[CTSActivity setRepeating:](v4, "setRepeating:", xpc_BOOL_get_value(v36));
    }
  }

  if (-[CTSActivity repeating](v4, "repeating") && !-[CTSActivity interval](v4, "interval"))
  {
    if (!-[CTSActivity delay](v4, "delay") && !-[CTSActivity grace_period](v4, "grace_period"))
    {
      id v39 = (void *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = v39;
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v4, "name"));
        *(_DWORD *)__int128 v87 = 138543362;
        *(void *)&v87[4] = v41;
        _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_DEFAULT,  "BUG IN %{public}@? None of interval, delay, grace period set for repeating task",  v87,  0xCu);
      }

      -[CTSActivity setGrace_period:](v4, "setGrace_period:", 172800LL);
    }

    -[CTSActivity setInterval:]( v4,  "setInterval:",  (char *)-[CTSActivity delay](v4, "delay") + -[CTSActivity grace_period](v4, "grace_period"));
  }

  -[CTSActivity setExpected_duration:]( v4,  "setExpected_duration:",  xpc_dictionary_get_int64(v3, XPC_ACTIVITY_EXPECTED_DURATION));
  xpc_object_t v42 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DUET_ATTRIBUTE_NAME);
  id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

  if (v43)
  {
    if (xpc_get_type(v43) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v43);
      if (string_ptr)
      {
        id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string_ptr));
        -[CTSActivity setBundle_id:](v4, "setBundle_id:", v45);
      }
    }
  }

  xpc_object_t array = xpc_dictionary_get_array(v3, XPC_ACTIVITY_DUET_RELATED_APPLICATIONS);
  unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue(array);
  unsigned int v48 = v47;
  if (v47 && xpc_get_type(v47) == (xpc_type_t)&_xpc_type_array)
  {
    unsigned int v49 = (void *)_CFXPCCreateCFObjectFromXPCObject(v48);
    -[CTSActivity setRelated_applications:](v4, "setRelated_applications:", v49);
  }

  xpc_object_t v50 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RUN_WHEN_APP_FOREGROUNDED);
  unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

  if (v51)
  {
    unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity related_applications](v4, "related_applications"));
    if ([v52 count])
    {
      xpc_type_t type = xpc_get_type(v51);

      if (type == (xpc_type_t)&_xpc_type_BOOL) {
        -[CTSActivity setRunOnAppForeground:](v4, "setRunOnAppForeground:", xpc_BOOL_get_value(v51));
      }
    }

    else
    {
    }
  }

  xpc_object_t v54 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_USER_REQUESTED_BACKUP_TASK);
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

  if (v55) {
    -[CTSActivity setUser_requested_backup_task:](v4, "setUser_requested_backup_task:", xpc_BOOL_get_value(v55));
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, XPC_ACTIVITY_NETWORK_TRANSFER_ENDPOINT);
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  unsigned int v58 = v57;
  if (v57 && xpc_get_type(v57) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned int v59 = (void *)nw_endpoint_create_from_dictionary(v58);
    -[CTSActivity setNetwork_endpoint:](v4, "setNetwork_endpoint:", v59);
  }

  xpc_object_t v60 = xpc_dictionary_get_dictionary(v3, XPC_ACTIVITY_NETWORK_TRANSFER_PARAMETERS);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = v61;
  if (v61 && xpc_get_type(v61) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v63 = (void *)nw_parameters_create_from_dictionary(v62);
    -[CTSActivity setNetwork_parameters:](v4, "setNetwork_parameters:", v63);
  }

  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_BUDDY_COMPLETE)) {
    -[CTSActivity setRequires_buddy_complete:](v4, "setRequires_buddy_complete:", 1LL);
  }
  xpc_object_t v64 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GROUP_NAME);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

  if (v65)
  {
    if (xpc_get_type(v65) == (xpc_type_t)&_xpc_type_string)
    {
      uint64_t v66 = xpc_string_get_string_ptr(v65);
      if (v66)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v66));
        -[CTSActivity setGroup_name:](v4, "setGroup_name:", v67);

        xpc_object_t v68 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT);
        uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);

        if (v69)
        {
          uint64_t v70 = sub_98E0(v69);
          v65 = (void *)v69;
        }

        else
        {
          v65 = 0LL;
          uint64_t v70 = 1LL;
        }

        -[CTSActivity setGroup_concurrency_limit:](v4, "setGroup_concurrency_limit:", v70);
      }
    }
  }

  -[CTSActivity setRequires_screen_sleep:]( v4,  "setRequires_screen_sleep:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP));
  -[CTSActivity setRequires_significant_user_inactivity:]( v4,  "setRequires_significant_user_inactivity:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY));
  -[CTSActivity setPower_nap:](v4, "setPower_nap:", xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_POWER_NAP));
  -[CTSActivity setApp_refresh:](v4, "setApp_refresh:", xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_APP_REFRESH));
  -[CTSActivity setPrevents_device_sleep:]( v4,  "setPrevents_device_sleep:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP));
  -[CTSActivity setMemory_intensive:]( v4,  "setMemory_intensive:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_MEMORY_INTENSIVE));
  -[CTSActivity setCpu_intensive:](v4, "setCpu_intensive:", xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_CPU_INTENSIVE));
  -[CTSActivity setDisk_intensive:](v4, "setDisk_intensive:", xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_DISK_INTENSIVE));
  -[CTSActivity setRequires_inexpensive_network:]( v4,  "setRequires_inexpensive_network:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY));
  BOOL v73 = xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY)
     || -[CTSActivity requires_inexpensive_network](v4, "requires_inexpensive_network");
  -[CTSActivity setRequires_network_connectivity:](v4, "setRequires_network_connectivity:", v73);
  id v74 = xpc_dictionary_get_string(v3, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION);
  BOOL v76 = 0;
  if (v74)
  {
    id v75 = v74;
    if (!strcmp(v74, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_UPLOAD)
      || !strcmp(v75, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL))
    {
      BOOL v76 = 1;
    }
  }

  int64_t int64 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_TRANSFER_SIZE);
  int64_t v78 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_DOWNLOAD_SIZE);
  int64_t v79 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_UPLOAD_SIZE);
  if (v76)
  {
    -[CTSActivity setExpected_network_download_size_bytes:](v4, "setExpected_network_download_size_bytes:", v78);
  }

  else
  {
    else {
      int64_t v80 = int64;
    }
    -[CTSActivity setExpected_network_download_size_bytes:](v4, "setExpected_network_download_size_bytes:", v80);
  }

  -[CTSActivity setExpected_network_upload_size_bytes:](v4, "setExpected_network_upload_size_bytes:", v79);
  -[CTSActivity setMay_reboot_device:]( v4,  "setMay_reboot_device:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_MAY_REBOOT_DEVICE));
  -[CTSActivity setDuet_power_budgeted:]( v4,  "setDuet_power_budgeted:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING));
  -[CTSActivity setSchedule_rtc_wake:]( v4,  "setSchedule_rtc_wake:",  xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_SHOULD_WAKE_DEVICE));
  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A))
  {
    uint64_t v81 = 1LL;
  }

  else if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B))
  {
    uint64_t v81 = 2LL;
  }

  else
  {
    xpc_object_t v82 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_REQUIRES_CLASS_C);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);

    if (v83)
    {
      uint64_t v81 = 3LL;
      if (xpc_get_type(v83) == (xpc_type_t)&_xpc_type_BOOL)
      {
        if (xpc_BOOL_get_value(v83)) {
          uint64_t v81 = 3LL;
        }
        else {
          uint64_t v81 = 4LL;
        }
      }
    }

    else
    {
      uint64_t v81 = 3LL;
    }

    v65 = v83;
  }

  -[CTSActivity setRequires_protection_class:](v4, "setRequires_protection_class:", v81);
  xpc_object_t v84 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA);
  __int128 v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
  -[CTSActivity setDas_data:](v4, "setDas_data:", v85);

  -[CTSActivity setSeqno:](v4, "setSeqno:", xpc_dictionary_get_uint64(v3, XPC_ACTIVITY_SEQUENCE_NUMBER));
  -[CTSActivity setState:](v4, "setState:", 1LL);
  -[CTSActivity loadBaseTime](v4, "loadBaseTime");
  id v22 = v4;

LABEL_112:
  return v22;
}

void sub_98D0(uint64_t a1, void *a2)
{
}

uint64_t sub_98E0(uint64_t result)
{
  if (result)
  {
    id v1 = (void *)result;
    xpc_type_t type = xpc_get_type((xpc_object_t)result);
    if (type == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t value = xpc_int64_get_value(v1);
      CFMutableDictionaryRef result = value & ~(value >> 63);
    }

    else if (type == (xpc_type_t)&_xpc_type_uint64)
    {
      CFMutableDictionaryRef result = xpc_uint64_get_value(v1);
    }

    else if (type == (xpc_type_t)&_xpc_type_double)
    {
      double v4 = xpc_double_get_value(v1);
      unint64_t v5 = llround(v4);
      if (v4 <= 0.0) {
        CFMutableDictionaryRef result = 0LL;
      }
      else {
        CFMutableDictionaryRef result = v5;
      }
    }

    else
    {
      CFMutableDictionaryRef result = 0LL;
    }
  }

  if (result >= 0x3FFFFFFFFFFFFFFFLL) {
    return 0x3FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void sub_9E98()
{
}

void sub_9EE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!qword_15378)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v7 = (void *)qword_15378;
    qword_15378 = (uint64_t)v6;
  }

  if (a1 == 2)
  {
    id v17 = (void *)qword_15378;
    xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
    uint64_t v8 = (CTSCalendarInterval *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v18]);

    id v19 = (void *)qword_15368;
    if (os_log_type_enabled((os_log_t)qword_15368, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      id v21 = objc_claimAutoreleasedReturnValue(-[CTSCalendarInterval identifier](v8, "identifier"));
      int v23 = 136315138;
      id v24 = [v21 UTF8String];
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Unregistered StartCalendarInterval: %s", (uint8_t *)&v23, 0xCu);
    }

    id v22 = (void *)qword_15378;
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a2));
    [v22 removeObjectForKey:v12];
    goto LABEL_10;
  }

  if (a1 == 1)
  {
    uint64_t v8 = -[CTSCalendarInterval initWithToken:andEvent:]( objc_alloc(&OBJC_CLASS___CTSCalendarInterval),  "initWithToken:andEvent:",  a2,  v5);
    unsigned __int8 v9 = (void *)qword_15378;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
    [v9 setObject:v8 forKey:v10];

    id v11 = (void *)qword_15368;
    if (!os_log_type_enabled((os_log_t)qword_15368, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }

    id v12 = v11;
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CTSCalendarInterval identifier](v8, "identifier"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CTSCalendarInterval fireDate](v8, "fireDate"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 descriptionWithLocale:v15]);
    int v23 = 138543618;
    id v24 = v13;
    __int16 v25 = 2114;
    uint64_t v26 = v16;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Registered StartCalendarInterval: %{public}@: %{public}@",  (uint8_t *)&v23,  0x16u);

LABEL_10:
    goto LABEL_11;
  }

LABEL_12:
  sub_A1AC();
}

void sub_A174(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  id v2 = (void *)qword_15380;
  qword_15380 = v1;
}

void sub_A1AC()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)qword_15378;
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  unint64_t v16 = v0;
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        id v6 = v0;
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_15378 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * (void)i)]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fireDate]);
        id v9 = [v8 compare:v1];

        if (v9 == (id)-1LL)
        {
          int64_t v10 = (void *)qword_15368;
          if (os_log_type_enabled((os_log_t)qword_15368, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = v10;
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            *(_DWORD *)buf = 138543362;
            int v23 = v12;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Running StartCalendarInterval: %{public}@", buf, 0xCu);
          }

          [v7 token];
          xpc_event_provider_token_set_state();
        }

        int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 fireDate]);
        id v0 = (id)objc_claimAutoreleasedReturnValue([v6 earlierDate:v13]);
      }

      id v3 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v3);
  }

  if (!qword_15370) {
    xpc_event_provider_get_queue();
  }
  if ([v0 compare:v16] == (id)-1)
  {
    [v0 timeIntervalSinceNow];
    dispatch_time_t v15 = dispatch_walltime(0LL, 1000000000 * (uint64_t)v14);
    dispatch_source_set_timer((dispatch_source_t)qword_15370, v15, 0xFFFFFFFFFFFFFFFFLL, 0x165A0BC00uLL);
  }
}

void sub_A5B0()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_A5C8(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_A5E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "No name in unmanaged activity request. Rejecting request.",  v1,  2u);
}

void sub_A620(uint64_t a1, os_log_s *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Failed to register unmanaged XPC Activity: %{public}s",  (uint8_t *)&v2,  0xCu);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}