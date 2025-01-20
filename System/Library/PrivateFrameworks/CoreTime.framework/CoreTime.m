void TMSetSourceTime(void *a1, double a2, double a3)
{
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9;
  dispatch_queue_s *v10;
  int v11;
  os_activity_s *v12;
  xpc_object_t v13;
  double v14;
  double v15;
  _xpc_connection_s *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_activity_scope_state_s block;
  void (*v25)(uint64_t);
  void *v26;
  void *v27;
  double *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double *v34;
  uint64_t v35;
  char v36;
  v6 = mach_absolute_time();
  v7 = _TMGetKernelMonotonicClock();
  if ((v6 & 0x8000000000000000LL) != 0)
  {
    v17 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 147, @"Invalid parameter not satisfying: %@", @"machTimestamp <= INT64_MAX" file lineNumber description];
  }

  if (a3 <= 0.0)
  {
    v18 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v18 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 148, @"Invalid parameter not satisfying: %@", @"uncertainty > 0.0" file lineNumber description];
  }

  v8 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (a1)
  {
    v9 = 0x40D5180000000000LL;
    if (([a1 isEqualToString:@"LocationServer"] & 1) != 0
      || ([a1 isEqualToString:@"HarvestServer"] & 1) != 0
      || ([a1 isEqualToString:@"iTunesStoreServer"] & 1) != 0
      || ([a1 isEqualToString:@"GPS"] & 1) != 0
      || (v9 = 0x40AC200000000000, ([a1 isEqualToString:@"NITZ"] & 1) != 0)
      || ([a1 isEqualToString:@"CDMA"] & 1) != 0)
    {
      v33 = 0.0;
      v34 = &v33;
      v35 = 0x2020000000LL;
      v36 = 0;
      v10 = (dispatch_queue_s *)_TMConnectionQueue();
      block.opaque[0] = MEMORY[0x1895F87A8];
      block.opaque[1] = 3221225472LL;
      v25 = ___shouldThrottle_block_invoke;
      v26 = &unk_189FA8290;
      v29 = v7;
      v30 = a2;
      v31 = a3;
      v32 = v9;
      v27 = a1;
      v28 = &v33;
      dispatch_sync(v10, &block);
      v11 = *((unsigned __int8 *)v34 + 24);
      _Block_object_dispose(&v33, 8);
      if (v11) {
        goto LABEL_25;
      }
    }

    else
    {
      v33 = 0.0;
      v34 = &v33;
      v35 = 0x2020000000LL;
      v36 = 0;
      _Block_object_dispose(&v33, 8);
    }

    v12 = _os_activity_create(&dword_186F20000, "TMSetSourceTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v12, &block);
    v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v13, "TMCommand", "TMSetSourceTime");
    xpc_dictionary_set_string(v13, "TMSource", (const char *)[a1 UTF8String]);
    xpc_dictionary_set_double(v13, "TMCurrentTime", a2);
    xpc_dictionary_set_double(v13, "TMTimeError", a3);
    xpc_dictionary_set_int64(v13, "TMMachTime", v6);
    if (a2 >= 9223372040.0)
    {
      v19 = (void *)[MEMORY[0x1896077D8] currentHandler];
      objc_msgSend( v19,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a2);
    }

    if (a2 <= -9223372040.0)
    {
      v20 = (void *)[MEMORY[0x1896077D8] currentHandler];
      objc_msgSend( v20,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a2);
    }

    v14 = modf(a2, &v33);
    xpc_dictionary_set_int64(v13, "TMAbsoluteNanoTime", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)v33);
    if (a3 >= 9223372040.0)
    {
      v21 = (void *)[MEMORY[0x1896077D8] currentHandler];
      objc_msgSend( v21,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
    }

    if (a3 <= -9223372040.0)
    {
      v22 = (void *)[MEMORY[0x1896077D8] currentHandler];
      objc_msgSend( v22,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
    }

    v15 = modf(a3, &v33);
    xpc_dictionary_set_int64(v13, "TMNanoTimeError", llround(v15 * 1000000000.0) + 1000000000 * (uint64_t)v33);
    if (xpc_dictionary_get_value(v13, "TMRtcTime") && xpc_dictionary_get_double(v13, "TMRtcTime") <= 0.5)
    {
      v23 = (void *)[MEMORY[0x1896077D8] currentHandler];
      objc_msgSend( v23,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"),  @"TMClient.m",  169,  @"Invalid RTC bear trap.");
    }

    v16 = (_xpc_connection_s *)_TMCopyConnection(0LL);
    xpc_connection_send_message(v16, v13);
    xpc_release(v13);
    _TMReleaseConnection(v16);
    os_activity_scope_leave(&block);
  }

LABEL_25:
}

void sub_186F21BD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void TMSetAuthenticatedSourceTime(__CFString *a1, double a2, double a3)
{
  if (CFStringCompare(a1, @"APNS", 0LL) == kCFCompareEqualTo) {
    a3 = a3 + 5.0;
  }
  v6 = _os_activity_create( &dword_186F20000,  "TMSetAuthenticatedSourceTime",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetAuthenticatedSourceTime");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)-[__CFString UTF8String](a1, "UTF8String"));
  xpc_dictionary_set_double(v7, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v7, "TMTimeError", a3);
  uint64_t v8 = mach_absolute_time();
  xpc_dictionary_set_int64(v7, "TMMachTime", v8);
  if (a2 >= 9223372040.0)
  {
    v12 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v12,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }

  if (a2 <= -9223372040.0)
  {
    v13 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v13,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }

  double v9 = modf(a2, &v18);
  xpc_dictionary_set_int64(v7, "TMAbsoluteNanoTime", llround(v9 * 1000000000.0) + 1000000000 * (uint64_t)v18);
  if (a3 >= 9223372040.0)
  {
    v14 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v14,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }

  if (a3 <= -9223372040.0)
  {
    v15 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v15,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }

  double v10 = modf(a3, &v18);
  xpc_dictionary_set_int64(v7, "TMNanoTimeError", llround(v10 * 1000000000.0) + 1000000000 * (uint64_t)v18);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    v16 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v16,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "void TMSetAuthenticatedSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"),  @"TMClient.m",  188,  @"Invalid RTC bear trap.");
  }

  v11 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v11, v7);
  xpc_release(v7);
  _TMReleaseConnection(v11);
  os_activity_scope_leave(&state);
}

void TMSetTestSourceTime(void *a1, double a2, double a3, double a4)
{
  uint64_t v8 = mach_absolute_time();
  double v9 = _TMGetKernelMonotonicClock();
  if ((v8 & 0x8000000000000000LL) != 0)
  {
    v16 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), @"TMClient.m", 196, @"Invalid parameter not satisfying: %@", @"machTimestamp <= INT64_MAX" file lineNumber description];
  }

  if (a3 <= 0.0)
  {
    v17 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), @"TMClient.m", 197, @"Invalid parameter not satisfying: %@", @"uncertainty > 0.0" file lineNumber description];
  }

  id v10 = objc_alloc_init(MEMORY[0x1896077E8]);
  v11 = _os_activity_create(&dword_186F20000, "TMSetSourceTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v12, "TMCommand", "TMSetSourceTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v12, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v12, "TMTimeError", a3);
  xpc_dictionary_set_double(v12, "TMRtcTime", v9 + a4);
  if (a2 >= 9223372040.0)
  {
    double v18 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v18,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }

  if (a2 <= -9223372040.0)
  {
    v19 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v19,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }

  double v13 = modf(a2, &v24);
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)v24);
  if (a3 >= 9223372040.0)
  {
    v20 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v20,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }

  if (a3 <= -9223372040.0)
  {
    v21 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v21,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }

  double v14 = modf(a3, &v24);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)v24);
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v22 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v22,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"),  @"TMClient.m",  212,  @"Invalid RTC bear trap.");
  }

  v15 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v15, v12);
  xpc_release(v12);
  _TMReleaseConnection(v15);
  os_activity_scope_leave(&state);
}

void TMSetSourceAvailable(void *a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  v4 = (dispatch_queue_s *)_TMConnectionQueue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __TMSetSourceAvailable_block_invoke;
  block[3] = &unk_189FA80F8;
  block[4] = a1;
  dispatch_sync(v4, block);
  v5 = _os_activity_create(&dword_186F20000, "TMSetSourceAvailable", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceAvailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    uint64_t v8 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v8,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceAvailable(CFStringRef)"),  @"TMClient.m",  232,  @"Invalid RTC bear trap.");
  }

  xpc_object_t v7 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);
}

uint64_t __TMSetSourceAvailable_block_invoke(uint64_t result)
{
  if (_lastMessages) {
    return [(id)_lastMessages removeObjectForKey:*(void *)(result + 32)];
  }
  return result;
}

void TMSetSourceUnavailable(void *a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  v4 = (dispatch_queue_s *)_TMConnectionQueue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __TMSetSourceUnavailable_block_invoke;
  block[3] = &unk_189FA80F8;
  block[4] = a1;
  dispatch_sync(v4, block);
  v5 = _os_activity_create(&dword_186F20000, "TMSetSourceUnavailable", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceUnavailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    uint64_t v8 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v8,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceUnavailable(CFStringRef)"),  @"TMClient.m",  253,  @"Invalid RTC bear trap.");
  }

  xpc_object_t v7 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);
}

uint64_t __TMSetSourceUnavailable_block_invoke(uint64_t result)
{
  if (_lastMessages) {
    return [(id)_lastMessages removeObjectForKey:*(void *)(result + 32)];
  }
  return result;
}

void TMSetSourceTimeZone(void *a1, void *a2)
{
  double v4 = _TMGetKernelMonotonicClock();
  id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
  xpc_object_t v6 = _os_activity_create(&dword_186F20000, "TMSetSourceTimeZone", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v10);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetSourceTimeZone");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_string(v7, "TMTimeZone", (const char *)[a2 UTF8String]);
  xpc_dictionary_set_double(v7, "TMRtcTime", v4);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    double v9 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v9,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceTimeZone(CFStringRef, CFStringRef)"),  @"TMClient.m",  268,  @"Invalid RTC bear trap.");
  }

  uint64_t v8 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v10);
}

void TMSetManualTime(double a1)
{
  uint64_t v2 = mach_absolute_time();
  id v3 = _os_activity_create(&dword_186F20000, "TMSetManualTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetManualTime");
  xpc_dictionary_set_double(v4, "TMCurrentTime", a1);
  xpc_dictionary_set_int64(v4, "TMMachTime", v2);
  if (a1 >= 9223372040.0)
  {
    xpc_object_t v7 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v7,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a1);
  }

  if (a1 <= -9223372040.0)
  {
    uint64_t v8 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v8,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a1);
  }

  double v5 = modf(a1, &v11);
  xpc_dictionary_set_int64(v4, "TMAbsoluteNanoTime", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)v11);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    double v9 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v9,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetManualTime(CFAbsoluteTime)"),  @"TMClient.m",  279,  @"Invalid RTC bear trap.");
  }

  xpc_object_t v6 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v6, v4);
  xpc_release(v4);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&state);
}

void TMSetAutomaticTimeEnabled(int a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = _os_activity_create(&dword_186F20000, "TMSetAutomaticTimeEnabled", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    xpc_object_t v6 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v6,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetAutomaticTimeEnabled(Boolean)"),  @"TMClient.m",  289,  @"Invalid RTC bear trap.");
  }

  double v5 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);
}

void TMFetchNTP()
{
  v0 = _os_activity_create(&dword_186F20000, "TMFetchNTP", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v4);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMFetchNTP");
  if (xpc_dictionary_get_value(v1, "TMRtcTime") && xpc_dictionary_get_double(v1, "TMRtcTime") <= 0.5)
  {
    id v3 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMFetchNTP(void)"),  @"TMClient.m",  293,  @"Invalid RTC bear trap.");
  }

  double v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v4);
}

BOOL TMIsAutomaticTimeEnabled()
{
  v0 = _os_activity_create(&dword_186F20000, "TMIsAutomaticTimeEnabled", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeEnabled");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0LL;
  }
  BOOL v4 = MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeEnabled");
  xpc_release(v3);
  return v4;
}

void TMSetAutomaticTimeZoneEnabled(int a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  xpc_object_t v3 = _os_activity_create( &dword_186F20000,  "TMSetAutomaticTimeZoneEnabled",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeZoneEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeZoneEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    os_activity_scope_state_s v6 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v6,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetAutomaticTimeZoneEnabled(Boolean)"),  @"TMClient.m",  317,  @"Invalid RTC bear trap.");
  }

  double v5 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);
}

BOOL TMIsAutomaticTimeZoneEnabled()
{
  v0 = _os_activity_create( &dword_186F20000,  "TMIsAutomaticTimeZoneEnabled",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeZoneEnabled");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0LL;
  }
  BOOL v4 = MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeZoneEnabled");
  xpc_release(v3);
  return v4;
}

BOOL TMIsTimeZoneConfirmed()
{
  v0 = _os_activity_create(&dword_186F20000, "TMIsTimeZoneConfirmed", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsTimeZoneConfirmed");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0LL;
  }
  BOOL v4 = MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250] && xpc_dictionary_get_BOOL(v3, "TMTimeZoneConfirmed");
  xpc_release(v3);
  return v4;
}

void TMConfirmTimeZone()
{
  double v0 = _TMGetKernelMonotonicClock();
  xpc_object_t v1 = _os_activity_create(&dword_186F20000, "TMConfirmTimeZone", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v1, &v5);
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "TMCommand", "TMConfirmTimeZone");
  xpc_dictionary_set_double(v2, "TMRtcTime", v0);
  if (xpc_dictionary_get_value(v2, "TMRtcTime") && xpc_dictionary_get_double(v2, "TMRtcTime") <= 0.5)
  {
    BOOL v4 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v4,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void TMConfirmTimeZone(void)"),  @"TMClient.m",  357,  @"Invalid RTC bear trap.");
  }

  xpc_object_t v3 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v3, v2);
  xpc_release(v2);
  _TMReleaseConnection(v3);
  os_activity_scope_leave(&v5);
}

BOOL TMGetReferenceTime(double *a1, double *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = NAN;
  }
  if (a2) {
    *a2 = NAN;
  }
  if (a3) {
    *a3 = -1;
  }
  os_activity_scope_state_s v6 = _os_activity_create(&dword_186F20000, "TMGetReferenceTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v12);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "TMCommand", "TMGetReferenceTime");
  uint64_t v8 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v12);

  if (!v9) {
    return 0LL;
  }
  if (MEMORY[0x18959DC90](v9) != MEMORY[0x1895F9250]) {
    goto LABEL_9;
  }
  if (a1) {
    *a1 = xpc_dictionary_get_double(v9, "TMCurrentTime");
  }
  if (a2) {
    *a2 = xpc_dictionary_get_double(v9, "TMTimeError");
  }
  if (a3) {
    *a3 = xpc_dictionary_get_BOOL(v9, "TMReliability");
  }
  if (xpc_dictionary_get_value(v9, "TMCurrentTime") && xpc_dictionary_get_value(v9, "TMTimeError")) {
    BOOL v10 = xpc_dictionary_get_value(v9, "TMReliability") != 0LL;
  }
  else {
LABEL_9:
  }
    BOOL v10 = 0LL;
  xpc_release(v9);
  return v10;
}

double TMGetBAFinderTime()
{
  double v0 = 0.0;
  if (!TMIsAutomaticTimeEnabled())
  {
    xpc_object_t v1 = _os_activity_create(&dword_186F20000, "TMGetBAFinderTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v1, &v6);
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, "TMCommand", "TMGetBAFinderTime");
    xpc_object_t v3 = (_xpc_connection_s *)_TMCopyConnection(0LL);
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
    xpc_release(v2);
    _TMReleaseConnection(v3);
    os_activity_scope_leave(&v6);

    if (v4)
    {
      if (MEMORY[0x18959DC90](v4) == MEMORY[0x1895F9250]) {
        double v0 = xpc_dictionary_get_double(v4, "TMCurrentTime");
      }
      xpc_release(v4);
    }
  }

  return v0;
}

BOOL TMGetTrustedInterval(double *a1, double *a2)
{
  xpc_object_t v4 = _os_activity_create(&dword_186F20000, "TMGetTrustedInterval", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v12);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "TMCommand", "TMGetTrustedInterval");
  os_activity_scope_state_s v6 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);
  xpc_release(v5);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&v12);

  if (v7)
  {
    if (MEMORY[0x18959DC90](v7) == MEMORY[0x1895F9250])
    {
      double v10 = xpc_dictionary_get_double(v7, "TMCurrentTime");
      double v9 = xpc_dictionary_get_double(v7, "TMTimeError");
      if (xpc_dictionary_get_value(v7, "TMCurrentTime")) {
        BOOL v8 = xpc_dictionary_get_value(v7, "TMTimeError") != 0LL;
      }
      else {
        BOOL v8 = 0LL;
      }
    }

    else
    {
      BOOL v8 = 0LL;
      double v9 = NAN;
      double v10 = NAN;
    }

    xpc_release(v7);
    if (!a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  BOOL v8 = 0LL;
  double v9 = NAN;
  double v10 = NAN;
  if (a1) {
LABEL_10:
  }
    *a1 = v10;
LABEL_11:
  if (a2) {
    *a2 = v9;
  }
  return v8;
}

uint64_t TMGetRTCResetCount()
{
  double v0 = _os_activity_create(&dword_186F20000, "TMGetRTCResetCount", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetRTCResetCount");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0LL;
  }
  if (MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250]) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "TMRTCResetCount");
  }
  else {
    uint64_t uint64 = 0LL;
  }
  xpc_release(v3);
  return uint64;
}

BOOL TMIsBBTimeActive()
{
  double v0 = _os_activity_create(&dword_186F20000, "TMIsBBTimeActive", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsBBTimeActive");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0LL;
  }
  BOOL v4 = MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250] && xpc_dictionary_get_BOOL(v3, "TMBBTimeActive");
  xpc_release(v3);
  return v4;
}

void TMProvideBBTime(unint64_t a1, uint64_t a2, int64_t a3, int64_t a4, void *a5)
{
  double v10 = (void *)MEMORY[0x18959DAD4]();
  if (a1 > a2)
  {
    double v14 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v14 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 481, @"Invalid parameter not satisfying: %@", @"apMachTimeBefore <= apMachTimeAfter" file lineNumber description];
  }

  if (mach_absolute_time() < a2)
  {
    v15 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 482, @"Invalid parameter not satisfying: %@", @"apMachTimeAfter <= mach_absolute_time()" file lineNumber description];
    if ((a2 & 0x8000000000000000LL) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    v16 = (void *)[MEMORY[0x1896077D8] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend( NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 483, @"Invalid parameter not satisfying: %@", @"apMachTimeAfter <= INT64_MAX" file lineNumber description];
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  double v11 = _os_activity_create(&dword_186F20000, "TMProvideBBTime", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v12, "TMCommand", "TMProvideBBTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)[a5 UTF8String]);
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", a3);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", a4);
  xpc_dictionary_set_int64(v12, "TMMachTime", a1);
  xpc_dictionary_set_int64(v12, "TMMachTimeAfter", a2);
  xpc_dictionary_set_double(v12, "TMCurrentTime", (double)(a3 % 1000000000) / 1000000000.0 + (double)(a3 / 1000000000));
  xpc_dictionary_set_double(v12, "TMTimeError", (double)(a4 % 1000000000) / 1000000000.0 + (double)(a4 / 1000000000));
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v17 = (void *)[MEMORY[0x1896077D8] currentHandler];
    objc_msgSend( v17,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"),  @"TMClient.m",  498,  @"Invalid RTC bear trap.");
  }

  double v13 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_connection_send_message(v13, v12);
  xpc_release(v12);
  _TMReleaseConnection(v13);
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v10);
}

void TMSetupTime(dispatch_object_s *a1, uint64_t a2, double a3)
{
  os_activity_scope_state_s v6 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTime");
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  char v15 = 0;
  dispatch_retain(a1);
  BOOL v8 = (dispatch_queue_s *)_TMConnectionQueue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __TMSetupTime_block_invoke;
  handler[3] = &unk_189FA8148;
  handler[6] = a2;
  handler[7] = v14;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  double v11 = (dispatch_queue_s *)_TMConnectionQueue();
  block[0] = v9;
  block[1] = 3221225472LL;
  block[2] = __TMSetupTime_block_invoke_3;
  block[3] = &unk_189FA8198;
  void block[5] = a2;
  block[6] = v14;
  block[4] = a1;
  dispatch_after(v10, v11, block);
  _Block_object_dispose(v14, 8);
}

void sub_186F23E78(_Unwind_Exception *a1)
{
}

void __TMSetupTime_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    xpc_retain(object);
    BOOL v4 = *(dispatch_queue_s **)(a1 + 32);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __TMSetupTime_block_invoke_2;
    v6[3] = &unk_189FA8120;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = object;
    v6[5] = v5;
    dispatch_async(v4, v6);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }

  _TMReleaseConnection(*(xpc_object_t *)(a1 + 40));
}

void __TMSetupTime_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x18959DC90](*(void *)(a1 + 32)) != MEMORY[0x1895F9250])
  {
    xpc_object_t v2 = (void *)MEMORY[0x189607870];
    uint64_t v3 = [MEMORY[0x189603F68] dictionaryWithObject:@"Framework developer error" forKey:*MEMORY[0x1896075E0]];
    BOOL v4 = v2;
    uint64_t v5 = 2LL;
LABEL_6:
    [v4 errorWithDomain:@"com.apple.time" code:v5 userInfo:v3];
    os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    goto LABEL_7;
  }

  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "TMSetupSuccessful"))
  {
    xpc_object_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v3 = [MEMORY[0x189603F68] dictionaryWithObject:@"Error from timed" forKey:*MEMORY[0x1896075E0]];
    BOOL v4 = v7;
    uint64_t v5 = 1LL;
    goto LABEL_6;
  }

  os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_7:
  v6();
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void __TMSetupTime_block_invoke_3(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __TMSetupTime_block_invoke_4;
    block[3] = &unk_189FA8170;
    xpc_object_t v2 = *(dispatch_queue_s **)(a1 + 32);
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v2, block);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
}

uint64_t __TMSetupTime_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void TMSetupTimeZone(dispatch_object_s *a1, uint64_t a2, double a3)
{
  os_activity_scope_state_s v6 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTimeZone");
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  char v15 = 0;
  dispatch_retain(a1);
  BOOL v8 = (dispatch_queue_s *)_TMConnectionQueue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __TMSetupTimeZone_block_invoke;
  handler[3] = &unk_189FA8148;
  handler[6] = a2;
  handler[7] = v14;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  double v11 = (dispatch_queue_s *)_TMConnectionQueue();
  block[0] = v9;
  block[1] = 3221225472LL;
  block[2] = __TMSetupTimeZone_block_invoke_3;
  block[3] = &unk_189FA8198;
  void block[5] = a2;
  block[6] = v14;
  block[4] = a1;
  dispatch_after(v10, v11, block);
  _Block_object_dispose(v14, 8);
}

void sub_186F24260(_Unwind_Exception *a1)
{
}

void __TMSetupTimeZone_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    xpc_retain(object);
    BOOL v4 = *(dispatch_queue_s **)(a1 + 32);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __TMSetupTimeZone_block_invoke_2;
    v6[3] = &unk_189FA8120;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = object;
    v6[5] = v5;
    dispatch_async(v4, v6);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }

  _TMReleaseConnection(*(xpc_object_t *)(a1 + 40));
}

void __TMSetupTimeZone_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x18959DC90](*(void *)(a1 + 32)) != MEMORY[0x1895F9250])
  {
    xpc_object_t v2 = (void *)MEMORY[0x189607870];
    uint64_t v3 = [MEMORY[0x189603F68] dictionaryWithObject:@"Framework developer error" forKey:*MEMORY[0x1896075E0]];
    BOOL v4 = v2;
    uint64_t v5 = 2LL;
LABEL_6:
    [v4 errorWithDomain:@"com.apple.time" code:v5 userInfo:v3];
    os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    goto LABEL_7;
  }

  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "TMSetupSuccessful"))
  {
    xpc_object_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v3 = [MEMORY[0x189603F68] dictionaryWithObject:@"Error from timed" forKey:*MEMORY[0x1896075E0]];
    BOOL v4 = v7;
    uint64_t v5 = 1LL;
    goto LABEL_6;
  }

  os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_7:
  v6();
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void __TMSetupTimeZone_block_invoke_3(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __TMSetupTimeZone_block_invoke_4;
    block[3] = &unk_189FA8170;
    xpc_object_t v2 = *(dispatch_queue_s **)(a1 + 32);
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v2, block);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }

uint64_t __TMSetupTimeZone_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void TMProvideCellularTimeZone(void *a1, int a2, int a3, unsigned int a4, unsigned int a5, double a6)
{
  if (a4 <= 2)
  {
    v26[1] = v9;
    v26[2] = v8;
    v26[11] = v6;
    v26[12] = v7;
    if (a5 <= 0x3E7)
    {
      double v16 = _TMGetKernelMonotonicClock();
      id v17 = objc_alloc_init(MEMORY[0x1896077E8]);
      double v18 = _os_activity_create( &dword_186F20000,  "TMProvideCellularTimeZone",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v18, &state);
      xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v19, "TMCommand", "TMProvideCellularTimeZone");
      xpc_dictionary_set_string(v19, "TMSource", (const char *)[a1 UTF8String]);
      xpc_dictionary_set_double(v19, "TMCurrentTime", a6);
      if (a6 >= 9223372040.0)
      {
        v22 = (void *)[MEMORY[0x1896077D8] currentHandler];
        objc_msgSend( v22,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a6);
      }

      if (a6 <= -9223372040.0)
      {
        v23 = (void *)[MEMORY[0x1896077D8] currentHandler];
        objc_msgSend( v23,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a6);
      }

      double v20 = modf(a6, v26);
      xpc_dictionary_set_int64(v19, "TMAbsoluteNanoTime", llround(v20 * 1000000000.0) + 1000000000 * (uint64_t)v26[0]);
      xpc_dictionary_set_int64(v19, "TMTzOffset", a3);
      xpc_dictionary_set_int64(v19, "TMDstActive", a4);
      xpc_dictionary_set_int64(v19, "TMMcc", a5);
      xpc_dictionary_set_int64(v19, "TMCellSlot", a2);
      xpc_dictionary_set_double(v19, "TMRtcTime", v16);
      if (xpc_dictionary_get_value(v19, "TMRtcTime"))
      {
        if (xpc_dictionary_get_double(v19, "TMRtcTime") <= 0.5)
        {
          double v24 = (void *)[MEMORY[0x1896077D8] currentHandler];
          objc_msgSend( v24,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "void TMProvideCellularTimeZone(CFStringRef, int, CFAbsoluteTime, int, int, int)"),  @"TMClient.m",  638,  @"Invalid RTC bear trap.");
        }
      }

      v21 = (_xpc_connection_s *)_TMCopyConnection(0LL);
      xpc_connection_send_message(v21, v19);
      xpc_release(v19);
      _TMReleaseConnection(v21);
      os_activity_scope_leave(&state);
    }
  }

CFStringRef TMCopyComputedTimeZone()
{
  double v0 = _os_activity_create(&dword_186F20000, "TMGetComputedTimeZone", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v0, &v7);
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetComputedTimeZone");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0LL);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v7);

  if (!v3) {
    return 0LL;
  }
  if (MEMORY[0x18959DC90](v3) == MEMORY[0x1895F9250] && (string = xpc_dictionary_get_string(v3, "TMTimeZone")) != 0LL) {
    CFStringRef v4 = CFStringCreateWithCString(0LL, string, 0x8000100u);
  }
  else {
    CFStringRef v4 = 0LL;
  }
  xpc_release(v3);
  return v4;
}

uint64_t TMResetToFirstLaunch()
{
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  uint64_t v13 = 0LL;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  uint64_t v9 = 0LL;
  dispatch_time_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  double v0 = (dispatch_queue_s *)_TMConnectionQueue();
  mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", v0, 0LL);
  uint64_t v2 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __TMResetToFirstLaunch_block_invoke;
  handler[3] = &unk_189FA81C0;
  handler[4] = &v9;
  handler[5] = &v13;
  handler[6] = v17;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "TMCommand", "TMResetToFirstLaunch");
  CFStringRef v4 = (dispatch_queue_s *)_TMConnectionQueue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __TMResetToFirstLaunch_block_invoke_2;
  v7[3] = &unk_189FA81E8;
  v7[4] = mach_service;
  v7[5] = v3;
  v7[6] = v17;
  dispatch_async(v4, v7);
  while (!*((_BYTE *)v10 + 24) && !*((_BYTE *)v14 + 24))
    sleep(1u);
  xpc_release(mach_service);
  uint64_t v5 = *((unsigned __int8 *)v14 + 24) ^ 1u;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v5;
}

void sub_186F24AA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __TMResetToFirstLaunch_block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18959DC90](a2);
  if (result != MEMORY[0x1895F9268]) {
    goto LABEL_2;
  }
  if (a2 == MEMORY[0x1895F91A0])
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    goto LABEL_2;
  }

  if (a2 != MEMORY[0x1895F9198])
  {
LABEL_2:
    uint64_t v5 = a1[5];
    goto LABEL_3;
  }

  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }
  uint64_t v5 = a1[4];
LABEL_3:
  *(_BYTE *)(*(void *)(v5 + 8) + 24LL) = 1;
  return result;
}

void __TMResetToFirstLaunch_block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___shouldThrottle_block_invoke(uint64_t a1)
{
  if (_lastMessages)
  {
    uint64_t v2 = (void *)[(id)_lastMessages objectForKey:*(void *)(a1 + 32)];
    if (v2)
    {
      [v2 getValue:&v14];
      double v3 = *(double *)(a1 + 48) - *(double *)&v14;
      double v4 = TMPropagateError(v15, v3);
      double v5 = *((double *)&v14 + 1);
      double v6 = TMGetKernelMonotonicClockResolution();
      if (*(double *)(a1 + 48) >= *(double *)&v14)
      {
        double v7 = *(double *)(a1 + 64);
        BOOL v8 = v7 < v4 + -0.1 || v7 > v4 + 0.1;
        if (!v8 && v3 <= *(double *)(a1 + 72))
        {
          double v9 = *(double *)(a1 + 56);
          double v10 = vabdd_f64(v9, *((double *)&v14 + 1));
          BOOL v11 = v9 > v3 + v5 + v6 || v9 < v3 + v5 - v6;
          if (!v11 || v10 < 2.22044605e-16) {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
          }
        }
      }
    }
  }

  else
  {
    _lastMessages = (uint64_t)objc_alloc_init(MEMORY[0x189603FC8]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    TMCFNotificationCenterAddObserver( DarwinNotifyCenter,  @"TimedResetNotification",  0LL,  (CFNotificationSuspensionBehavior)0LL,  &__block_literal_global);
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    __int128 v14 = *(_OWORD *)(a1 + 48);
    double v15 = *(double *)(a1 + 64);
    objc_msgSend( (id)_lastMessages,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607B18], "value:withObjCType:", &v14, "{?=ddd}"),  *(void *)(a1 + 32));
  }

uint64_t ___shouldThrottle_block_invoke_2()
{
  double v0 = (dispatch_queue_s *)_TMConnectionQueue();
  dispatch_async(v0, &__block_literal_global_77);
  return 1LL;
}

uint64_t ___shouldThrottle_block_invoke_3()
{
  return [(id)_lastMessages removeAllObjects];
}

uint64_t type metadata for __ObjC(unint64_t a1)
{
  if (a1 >= 0x1C) {
    TMSourceNameFromSrc_cold_1();
  }
  return (uint64_t)*off_189FA8450[a1];
}

uint64_t type metadata for UnsafeMutableBufferPointer(uint64_t a1)
{
  if (TMSrcFromName_onceToken != -1) {
    dispatch_once(&TMSrcFromName_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = (void *)[(id)TMSrcFromName_sMap objectForKeyedSubscript:a1];
  if (v2) {
    return [v2 unsignedIntegerValue];
  }
  else {
    return 27LL;
  }
}

id __TMSrcFromName_block_invoke()
{
  v2[28] = *MEMORY[0x1895F89C0];
  v1[0] = @"NITZ";
  v1[1] = @"CDMA";
  v2[0] = &unk_189FA9C20;
  v2[1] = &unk_189FA9C38;
  v1[2] = @"GPS";
  v1[3] = @"LocationServer";
  v2[2] = &unk_189FA9C50;
  v2[3] = &unk_189FA9C68;
  v1[4] = @"HarvestServer";
  v1[5] = @"NTP";
  v2[4] = &unk_189FA9C80;
  v2[5] = &unk_189FA9C98;
  v1[6] = @"NTPLowConfidence";
  v1[7] = @"NTPPacket";
  v2[6] = &unk_189FA9CB0;
  v2[7] = &unk_189FA9CC8;
  v1[8] = @"MobileLockdown";
  v1[9] = @"iTunesStoreServer";
  v2[8] = &unk_189FA9CE0;
  v2[9] = &unk_189FA9CF8;
  v1[10] = @"Location";
  v1[11] = @"Computed";
  v2[10] = &unk_189FA9D10;
  v2[11] = &unk_189FA9D28;
  v1[12] = @"LocationAndNetwork";
  v1[13] = @"TimeSourceGnssValidPos";
  v2[12] = &unk_189FA9D40;
  v2[13] = &unk_189FA9D58;
  v1[14] = @"TimeSourceGnss";
  v1[15] = @"TimeSourceBBTimeTransfer";
  v2[14] = &unk_189FA9D70;
  v2[15] = &unk_189FA9D88;
  v1[16] = @"TimeSourceBBTimeTagging";
  v1[17] = @"TimeSourceUnknown";
  v2[16] = &unk_189FA9DA0;
  v2[17] = &unk_189FA9DB8;
  v1[18] = @"TMLSSourceComputed";
  v1[19] = @"TMLSSourceComputedReliable";
  v2[18] = &unk_189FA9DD0;
  v2[19] = &unk_189FA9DE8;
  v1[20] = @"TMLSSourceUser";
  v1[21] = @"TMLSSourceDevice";
  v2[20] = &unk_189FA9E00;
  v2[21] = &unk_189FA9E18;
  v1[22] = @"FilesystemTimestamp";
  v1[23] = @"AirPlaySendingDeviceTime";
  v2[22] = &unk_189FA9E30;
  v2[23] = &unk_189FA9E48;
  v1[24] = @"ProxBuddy";
  v1[25] = @"APNS";
  v2[24] = &unk_189FA9E60;
  v2[25] = &unk_189FA9E78;
  v1[26] = @"Accessory";
  v1[27] = @"Unknown";
  v2[26] = &unk_189FA9E90;
  v2[27] = &unk_189FA9EA8;
  id result = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v2 forKeys:v1 count:28];
  TMSrcFromName_sMap = (uint64_t)result;
  return result;
}

uint64_t TMCmdFromName(uint64_t a1)
{
  if (TMCmdFromName_onceToken != -1) {
    dispatch_once(&TMCmdFromName_onceToken, &__block_literal_global_86);
  }
  uint64_t v2 = (void *)[(id)TMCmdFromName_sMap objectForKeyedSubscript:a1];
  if (v2) {
    return [v2 unsignedIntegerValue];
  }
  else {
    return 23LL;
  }
}

id __TMCmdFromName_block_invoke()
{
  v2[24] = *MEMORY[0x1895F89C0];
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &unk_189FA9EC0;
  v2[1] = &unk_189FA9ED8;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &unk_189FA9EF0;
  v2[3] = &unk_189FA9F08;
  v1[4] = @"TMSetAutomaticTimeEnabled";
  v1[5] = @"TMIsAutomaticTimeEnabled";
  v2[4] = &unk_189FA9F20;
  v2[5] = &unk_189FA9F38;
  v1[6] = @"TMSetAutomaticTimeZoneEnabled";
  v1[7] = @"TMIsAutomaticTimeZoneEnabled";
  v2[6] = &unk_189FA9F50;
  v2[7] = &unk_189FA9F68;
  v1[8] = @"TMIsTimeZoneConfirmed";
  v1[9] = @"TMConfirmTimeZone";
  v2[8] = &unk_189FA9F80;
  v2[9] = &unk_189FA9F98;
  v1[10] = @"TMGetReferenceTime";
  v1[11] = @"TMSetReferenceUnreliable";
  v2[10] = &unk_189FA9FB0;
  v2[11] = &unk_189FA9FC8;
  v1[12] = @"TMIsLocationTimeZoneActive";
  v1[13] = @"TMIsBBTimeActive";
  v2[12] = &unk_189FA9FE0;
  v2[13] = &unk_189FA9FF8;
  v1[14] = @"TMProvideBBTime";
  v1[15] = @"TMReceiveNtpPacket";
  v2[14] = &unk_189FAA010;
  v2[15] = &unk_189FAA028;
  v1[16] = @"TMSetupTime";
  v1[17] = @"TMSetupTimeZone";
  v2[16] = &unk_189FAA040;
  v2[17] = &unk_189FAA058;
  v1[18] = @"TMProvideCellularTimeZone";
  v1[19] = @"TMResetTimeZone";
  v2[18] = &unk_189FAA070;
  v2[19] = &unk_189FAA088;
  v1[20] = @"TMSystemWillWake";
  v1[21] = @"TMFetchNTP";
  v2[20] = &unk_189FAA0A0;
  v2[21] = &unk_189FAA0B8;
  v1[22] = @"TMResetToFirstLaunch";
  v1[23] = @"TMUnknown";
  v2[22] = &unk_189FAA0D0;
  v2[23] = &unk_189FAA0E8;
  id result = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v2 forKeys:v1 count:24];
  TMCmdFromName_sMap = (uint64_t)result;
  return result;
}

uint64_t TMDeviceHasPMU()
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  }
  return TMDeviceHasPMU_hasPMU;
}

uint64_t __TMDeviceHasPMU_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  size_t v1 = 8LL;
  uint64_t result = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1);
  TMDeviceHasPMU_hasPMU = (_DWORD)result == 0;
  return result;
}

double TMGetKernelMonotonicClockResolution()
{
  if (TMGetKernelMonotonicClockResolution_onceToken != -1) {
    dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_162);
  }
  return *(double *)&TMGetKernelMonotonicClockResolution_sInterval;
}

double __TMGetKernelMonotonicClockResolution_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)double v9 = 8LL;
  size_t v10 = 8LL;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v0) {
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

  else if (sysctl(v12, v9[0], &v11, &v10, 0LL, 0LL))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_1();
    }
  }

  else
  {
    double result = (double)v11 / 1000000.0;
    *(double *)&TMGetKernelMonotonicClockResolution_sInterval = result;
  }

  return result;
}

double _TMGetKernelMonotonicClock()
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  }
  if (!TMDeviceHasPMU_hasPMU)
  {
    uint64_t v9 = mach_continuous_time();
    return TMConvertTicksToSeconds(v9);
  }

  if ((_TMGetKernelMonotonicClock_init & 1) != 0) {
    goto LABEL_12;
  }
  if (!sysctlnametomib( "kern.monotonicclock_usecs",  _TMGetKernelMonotonicClock_mib,  (size_t *)&_TMGetKernelMonotonicClock_miblen))
  {
    if (TMGetKernelMonotonicClockResolution_onceToken != -1) {
      dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_162);
    }
    *(double *)&_TMGetKernelMonotonicClock_halfResolution = *(double *)&TMGetKernelMonotonicClockResolution_sInterval
                                                          * 0.5;
    _TMGetKernelMonotonicClock_readScale = 0x412E848000000000LL;
    _TMGetKernelMonotonicClock_init = 1;
LABEL_12:
    size_t v11 = 8LL;
    if (!sysctl(_TMGetKernelMonotonicClock_mib, _TMGetKernelMonotonicClock_miblen, &v12, &v11, 0LL, 0LL)) {
      return (double)v12 / *(double *)&_TMGetKernelMonotonicClock_readScale
    }
           + *(double *)&_TMGetKernelMonotonicClock_halfResolution;
    double v8 = -1.0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _TMGetKernelMonotonicClock_cold_1();
    }
    return v8;
  }

  BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  double v8 = -1.0;
  if (v0) {
    _TMGetKernelMonotonicClock_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return v8;
}

double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&TMConvertTicksToSeconds_ticksPerSecond;
  if (*(double *)&TMConvertTicksToSeconds_ticksPerSecond == 0.0)
  {
    TMGetMachTimebase(&v8, &v7);
    uint32_t v3 = v8;
    unsigned int v4 = 1000000000;
    do
    {
      uint32_t v5 = v4;
      unsigned int v4 = v3 % v4;
      uint32_t v3 = v5;
    }

    while (v4);
    double v2 = (double)(v8 / v5) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v5));
    *(double *)&TMConvertTicksToSeconds_ticksPerSecond = v2;
  }

  return v2 * (double)a1;
}

double _TMSyncKernelMonotonicClock(uint64_t *a1, double *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  }
  if (TMDeviceHasPMU_hasPMU)
  {
    if (_TMSyncKernelMonotonicClock_onceToken != -1) {
      dispatch_once(&_TMSyncKernelMonotonicClock_onceToken, &__block_literal_global_164);
    }
    size_t v4 = 16LL;
    if (!a1) {
      size_t v4 = 8LL;
    }
    size_t v14 = v4;
    int v5 = 3;
    uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    while (sysctl((int *)&_TMSyncKernelMonotonicClock_mib, _TMSyncKernelMonotonicClock_miblen, &v18, &v14, 0LL, 0LL))
    {
      uint32_t v7 = __error();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = *v7;
        uint64_t v9 = strerror(v8);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v9;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl( &dword_186F20000,  v6,  OS_LOG_TYPE_ERROR,  "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n",  buf,  0x12u);
      }

      if (!--v5)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          _TMSyncKernelMonotonicClock_cold_1();
          if (a1) {
LABEL_26:
          }
            *a1 = 0LL;
        }

        else if (a1)
        {
          goto LABEL_26;
        }

        double v10 = -1.0;
        if (a2) {
          *a2 = -1.0;
        }
        return v10;
      }
    }

    double v11 = (double)v18;
    if (a2) {
      *a2 = 0.0005;
    }
    double v10 = v11 / 1000000.0;
    if (v14 != 16)
    {
      uint64_t v19 = mach_absolute_time();
      double v10 = v10 + *(double *)&_TMSyncKernelMonotonicClock_halfResolution;
      if (a2) {
        *a2 = *(double *)&_TMSyncKernelMonotonicClock_halfResolution + *a2;
      }
    }

    if (a1) {
      *a1 = v19;
    }
  }

  else
  {
    mach_get_times();
    if (a1) {
      *a1 = *(void *)buf;
    }
    return TMConvertTicksToSeconds(v18);
  }

  return v10;
}

unint64_t _TMKernelMonotonicClockOffset(uint64_t a1)
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_160);
  }
  if (!TMDeviceHasPMU_hasPMU)
  {
    mach_get_times();
    return v6[1] + 1000000000LL * v6[0] - TMConvertTicksToNanoTime(v7);
  }

  if (a1 < 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    _TMKernelMonotonicClockOffset_cold_3(a1);
  }
  v6[0] = a1 / 1000;
  if (_TMKernelMonotonicClockOffset_onceToken != -1) {
    dispatch_once(&_TMKernelMonotonicClockOffset_onceToken, &__block_literal_global_165);
  }
  unint64_t v7 = 0LL;
  uint64_t v5 = 8LL;
  else {
    double v2 = 0LL;
  }
  if (sysctl( (int *)&_TMKernelMonotonicClockOffset_mib,  _TMKernelMonotonicClockOffset_miblen,  &v7,  (size_t *)&v5,  v2,  8LL * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _TMKernelMonotonicClockOffset_cold_2();
    }
  }

  else
  {
    uint64_t v4 = v5;
    if (v5 == 8) {
      return 1000 * v7;
    }
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _TMKernelMonotonicClockOffset_cold_1(v4);
    }
  }

  return 0LL;
}

unint64_t TMConvertTicksToNanoTime(unint64_t a1)
{
  unsigned int v2 = TMConvertTicksToNanoTime_numer;
  if (!TMConvertTicksToNanoTime_numer)
  {
    TMGetMachTimebase((uint32_t *)&TMConvertTicksToNanoTime_numer, (uint32_t *)&TMConvertTicksToNanoTime_denom);
    unsigned int v2 = TMConvertTicksToNanoTime_numer;
    if (!TMConvertTicksToNanoTime_numer) {
      TMConvertTicksToNanoTime_cold_1();
    }
    if (!TMConvertTicksToNanoTime_denom) {
      TMConvertTicksToNanoTime_cold_2();
    }
  }

  if (is_mul_ok(v2, a1))
  {
    unint64_t v3 = v2 * a1 / TMConvertTicksToNanoTime_denom;
    if ((v3 & 0x8000000000000000LL) != 0) {
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( &dword_186F20000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio",  v5,  2u);
      unsigned int v2 = TMConvertTicksToNanoTime_numer;
    }

    return a1 / (TMConvertTicksToNanoTime_denom / v2);
  }

  return v3;
}

BOOL TMIsValidTime(double a1)
{
  if (a1 >= -1.0 && a1 <= 1.0) {
    return 0LL;
  }
  BOOL v2 = -1.0 - *MEMORY[0x189604DA8] > a1 || 1.0 - *MEMORY[0x189604DA8] < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10) {
    return 0LL;
  }
  if (1.0 - *MEMORY[0x189604DA0] < a1) {
    return 1LL;
  }
  return -1.0 - *MEMORY[0x189604DA0] > a1;
}

BOOL TMIsValidNetworkOffset(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL TMIsValidMcc(unsigned int a1)
{
  return a1 < 0x3E8;
}

double TMCFAbsoluteTimeToTimeval(uint64_t *a1, double a2)
{
  double result = *MEMORY[0x189604DA8] + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t TMCFTimeIntervalToTimeval(uint64_t a1, double a2)
{
  double v3 = modf(a2, &v7);
  uint64_t result = 0LL;
  if (fabs(v7) != INFINITY)
  {
    if (v7 < 9.22337204e18)
    {
      BOOL v6 = v7 == -9.22337204e18;
      BOOL v5 = v7 >= -9.22337204e18;
    }

    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }

    if (!v6 && v5)
    {
      *(void *)a1 = (uint64_t)v7;
      *(_DWORD *)(a1 + _Block_object_dispose((const void *)(v15 - 80), 8) = (int)(v3 * 1000000.0);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

double TMTimevalToCFAbsoluteTime(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)*MEMORY[0x189604DA8]);
}

double TMPropagateError(double a1, double a2)
{
  if (a2 < 0.0) {
    a2 = -a2;
  }
  return a1 + a2 * 0.00002;
}

uint64_t TMCalculateGCD(uint64_t a1, uint64_t a2)
{
  if (!(_DWORD)a2) {
    return a1;
  }
  do
  {
    uint64_t v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }

  while ((_DWORD)a2);
  return v2;
}

uint64_t TMGetMachTimebase(uint32_t *a1, uint32_t *a2)
{
  uint64_t result = mach_timebase_info(&info);
  if ((_DWORD)result) {
    TMGetMachTimebase_cold_1();
  }
  uint32_t denom = info.denom;
  if (info.denom)
  {
    uint32_t numer = info.numer;
    uint32_t v7 = info.denom;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = numer % v7;
      uint32_t numer = v8;
    }

    while (v7);
  }

  else
  {
    uint32_t v8 = info.numer;
  }

  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double TMElapsedIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 >= a1) {
    return TMConvertTicksToSeconds(a2 - a1);
  }
  else {
    return -TMConvertTicksToSeconds(a1 - a2);
  }
}

double TMCalculateMachTimeIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1) {
    return TMConvertTicksToSeconds(a1 - a2);
  }
  else {
    return TMConvertTicksToSeconds(a2 - a1);
  }
}

void TMCFNotificationCenterAddObserver( __CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  uint64_t v9 = _Block_copy(aBlock);
  double v10 = _Block_copy(v9);
  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)_notificationHandlerCallback, a2, a3, a4);
}

void _notificationHandlerCallback( __CFNotificationCenter *a1, uint64_t (**a2)(void, void), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(void, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

int *OUTLINED_FUNCTION_5()
{
  return __error();
}

int *OUTLINED_FUNCTION_6()
{
  return __error();
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

uint64_t _TMConnectionQueue()
{
  if (_TMConnectionQueue_sPred != -1) {
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  }
  return _TMConnectionQueue_sConnectionQueue;
}

uint64_t _TMCopyConnection(uint64_t a1)
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  uint32_t v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0LL;
  if (_TMConnectionQueue_sPred != -1) {
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___TMCopyConnection_block_invoke;
  v4[3] = &unk_189FA8778;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_TMConnectionQueue_sConnectionQueue, v4);
  uint64_t v2 = v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void TMSourceNameFromSrc_cold_1()
{
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_1()
{
  BOOL v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_186F20000, MEMORY[0x1895F8DA0], v1, "CoreTime: Error occurred %d %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _TMGetKernelMonotonicClock_cold_1()
{
  BOOL v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_186F20000, MEMORY[0x1895F8DA0], v1, "Error occurred %d %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _TMGetKernelMonotonicClock_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _TMSyncKernelMonotonicClock_cold_1()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl( &dword_186F20000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n",  (uint8_t *)v0,  8u);
  OUTLINED_FUNCTION_4();
}

void _TMKernelMonotonicClockOffset_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = 134218240;
  uint64_t v2 = 8LL;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_186F20000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n",  (uint8_t *)&v1,  0x16u);
}

void _TMKernelMonotonicClockOffset_cold_2()
{
  BOOL v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2( &dword_186F20000,  MEMORY[0x1895F8DA0],  v1,  "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

void _TMKernelMonotonicClockOffset_cold_3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_186F20000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Applying unlikely time offset: %lld",  (uint8_t *)&v1,  0xCu);
}

void TMConvertTicksToNanoTime_cold_1()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void TMConvertTicksToNanoTime_cold_2()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void TMGetMachTimebase_cold_1()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFNotificationCenterRemoveObserver( CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1895F8D40](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FBAC8]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

double modf(double a1, double *a2)
{
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void panic(const char *a1, ...)
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1895FD2C0](a1, a2, a3);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}