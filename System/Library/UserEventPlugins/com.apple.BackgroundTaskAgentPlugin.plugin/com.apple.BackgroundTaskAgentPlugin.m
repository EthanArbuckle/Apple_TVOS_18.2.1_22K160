}

id sub_1FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeJob:a3 withToken:a2];
}

LABEL_74:
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 1LL);
    return 0;
  }

  v11 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowEndTime);
  if (v11 < v6)
  {
    v12 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      v13 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v12, 0LL, 3, "validateAndAddDefaults(%s): End Time (%.1f) < Start Time (%.1f)", v13, v11, v6);
    }

    v14 = (__asl_object_s *)bta_logfile_asl_handle;
    if (_logToFile) {
      v15 = bta_logfile_asl_handle == 0;
    }
    else {
      v15 = 1;
    }
    if (!v15)
    {
      xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v14, 0LL, 3, "validateAndAddDefaults(%s): End Time (%.1f) < Start Time (%.1f)");
    }

    goto LABEL_74;
  }

  if (v11 > v6 + 3024000.0 + 300.0)
  {
    v16 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      v17 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log( v16,  0LL,  3,  "validateAndAddDefaults(%s): End Time (%.1f) > Start Time (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_DURATION_ SEC (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)",  v17,  v11,  v6,  3024000.0,  300.0);
    }

    v18 = (__asl_object_s *)bta_logfile_asl_handle;
    if (_logToFile) {
      v19 = bta_logfile_asl_handle == 0;
    }
    else {
      v19 = 1;
    }
    if (!v19)
    {
      xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log( v18,  0LL,  3,  "validateAndAddDefaults(%s): End Time (%.1f) > Start Time (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_DURATION_ SEC (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)");
    }

    goto LABEL_74;
  }

  if (v11 > Current + 3024000.0 + 300.0)
  {
    v20 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      v21 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log( v20,  0LL,  3,  "validateAndAddDefaults(%s): End Time (%.1f) > now (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_TIME_FROM_NOW_SE C (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)",  v21,  v11,  Current,  3024000.0,  300.0);
    }

    if (_logToFile)
    {
      v22 = (__asl_object_s *)bta_logfile_asl_handle;
      if (bta_logfile_asl_handle)
      {
        xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log( v22,  0LL,  3,  "validateAndAddDefaults(%s): End Time (%.1f) > now (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_TIME_FROM_NOW_ SEC (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)");
      }
    }

    goto LABEL_74;
  }

  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 0);
  v23 = (const char *)kBackgroundTaskAgentJobWindowAdjustTime;
  if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowAdjustTime))
  {
    v24 = xpc_dictionary_get_BOOL(a3, v23);
  }

  else
  {
    v24 = 1;
    xpc_dictionary_set_BOOL(a3, v23, 1);
  }

  v25 = (const char *)kBackgroundTaskAgentNetworkRequired;
  v26 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  v27 = (const char *)kBackgroundTaskAgentCellularAllowed;
  v28 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentCellularAllowed);
  if (!v26)
  {
    xpc_dictionary_set_BOOL(a3, v25, 0);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, 1);
    if (v28)
    {
      v29 = (__asl_object_s *)bta_logconsole_asl_handle;
      if (bta_logconsole_asl_handle)
      {
        v30 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log( v29,  0LL,  3,  "validateAndAddDefaults(%s): kBackgroundTaskAgentCellularAllowed set to true even thoughkBackgroundTaskAgentNet workRequired is set to false",  v30);
      }

      if (_logToFile)
      {
        v31 = (__asl_object_s *)bta_logfile_asl_handle;
        if (bta_logfile_asl_handle)
        {
          xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
          asl_log( v31,  0LL,  3,  "validateAndAddDefaults(%s): kBackgroundTaskAgentCellularAllowed set to true even thoughkBackgroundTaskAgentN etworkRequired is set to false");
        }
      }

      goto LABEL_74;
    }

    goto LABEL_43;
  }

  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, 0);
  if (!v28) {
LABEL_43:
  }
    xpc_dictionary_set_BOOL(a3, v27, 0);
  v32 = (const char *)kBackgroundTaskAgentPowerOptLevel;
  int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  v34 = int64;
  if (int64)
  {
    if (int64 >= 3)
    {
      v35 = (__asl_object_s *)bta_logconsole_asl_handle;
      if (bta_logconsole_asl_handle)
      {
        v36 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log(v35, 0LL, 3, "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentPowerOptimization: %d", v36, v34);
      }

      if (_logToFile)
      {
        v37 = (__asl_object_s *)bta_logfile_asl_handle;
        if (bta_logfile_asl_handle)
        {
          xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
          asl_log(v37, 0LL, 3, "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentPowerOptimization: %d");
        }
      }

      goto LABEL_74;
    }
  }

  else
  {
    v34 = 2;
    xpc_dictionary_set_int64(a3, v32, 2LL);
  }

  v38 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  if (v38 < 0.0)
  {
    v39 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      v40 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v39, 0LL, 3, "validateAndAddDefaults(%s): screenBlankedTime (%.1f) < 0!!", v40, v38);
    }

    if (_logToFile)
    {
      v41 = (__asl_object_s *)bta_logfile_asl_handle;
      if (bta_logfile_asl_handle)
      {
        xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log(v41, 0LL, 3, "validateAndAddDefaults(%s): screenBlankedTime (%.1f) < 0!!");
      }
    }

    goto LABEL_74;
  }

  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusScreenBlanked, 0);
  v42 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  if (v42 < 0.0)
  {
    v43 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      v44 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v43, 0LL, 3, "validateAndAddDefaults(%s): powerPluggedinTime (%.1f) < 0!!", v44, v42);
    }

    if (_logToFile)
    {
      v45 = (__asl_object_s *)bta_logfile_asl_handle;
      if (bta_logfile_asl_handle)
      {
        xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log(v45, 0LL, 3, "validateAndAddDefaults(%s): powerPluggedinTime (%.1f) < 0!!");
      }
    }

    goto LABEL_74;
  }

  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusPowerPluggedin, 0);
  v46 = (const char *)kBackgroundTaskAgentRequiredBatteryLevel;
  v47 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentRequiredBatteryLevel);
  v48 = v47;
  if (v47 < 0.0 || v47 > 0.0)
  {
    if (v47 < 0.0 || v47 > 100.0)
    {
      v49 = (__asl_object_s *)bta_logconsole_asl_handle;
      if (bta_logconsole_asl_handle)
      {
        v50 = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
        asl_log( v49,  0LL,  3,  "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentRequiredBatteryLevel: %.1f",  v50,  v48);
      }

      if (_logToFile)
      {
        v51 = (__asl_object_s *)bta_logfile_asl_handle;
        if (bta_logfile_asl_handle)
        {
          xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
          asl_log(v51, 0LL, 3, "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentRequiredBatteryLevel: %.1f");
        }
      }

      goto LABEL_74;
    }
  }

  else
  {
    xpc_dictionary_set_double(a3, v46, 0.0);
  }

  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusBatteryLevel, v48 == 0.0);
  v53 = (const char *)kBackgroundTaskAgentAllowedDuringVoiceCall;
  v54 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  if (!v54) {
    xpc_dictionary_set_BOOL(a3, v53, 0);
  }
  v55 = (const char *)kBackgroundTaskAgentAllowedDuringRoaming;
  v56 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  if (v56)
  {
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 3LL);
    if (!v24) {
      goto LABEL_79;
    }
  }

  else
  {
    xpc_dictionary_set_BOOL(a3, v55, 0);
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 3LL);
    if (!v24)
    {
LABEL_79:
      if (!v26) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }

  -[BackgroundTaskAgentMonitor incrementNumAdjustTimeJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumAdjustTimeJobs");
  if (v26) {
LABEL_80:
  }
    -[BackgroundTaskAgentMonitor incrementNumNetworkJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumNetworkJobs");
LABEL_81:
  if (v38 >= 0.0) {
    -[BackgroundTaskAgentMonitor incrementNumScreenBlankedJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumScreenBlankedJobs");
  }
  if (v34 != 2 && v42 < 0.0)
  {
    if (v54) {
      goto LABEL_86;
    }
LABEL_93:
    -[BackgroundTaskAgentMonitor incrementNumJobsNotAllowedDuringVoiceCall]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumJobsNotAllowedDuringVoiceCall");
    if (v56) {
      return 1;
    }
    goto LABEL_87;
  }

  -[BackgroundTaskAgentMonitor incrementNumPowerPluggedinJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumPowerPluggedinJobs");
  if (!v54) {
    goto LABEL_93;
  }
LABEL_86:
  if (!v56) {
LABEL_87:
  }
    -[BackgroundTaskAgentMonitor incrementNumJobsNotAllowedWhileRoaming]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "incrementNumJobsNotAllowedWhileRoaming");
  return 1;
}

id sub_2D6C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) processJobListImmediately];
  byte_DA10 = 0;
  return result;
}

void sub_3128(_Unwind_Exception *a1)
{
}

id sub_3140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) hasJobStatusChanged:a3 withToken:a2 withCurrentDeviceState:a1 + 48 withPointerToExpiredJobs:*(void *)(*(void *)(a1 + 40) + 8) + 24];
}

id sub_315C(uint64_t a1, void *a2, xpc_object_t xdict)
{
  v6 = (__asl_object_s *)bta_logconsole_asl_handle;
  if (_logToConsole) {
    BOOL v7 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    string = xpc_dictionary_get_string(xdict, "BackgroundTaskAgentClientName");
    asl_log( v6,  0,  5,  "processJobList: Removing job (%s, %s): 0x%x",  string,  (const char *)objc_msgSend(objc_msgSend(a2, "description"), "UTF8String"),  (_DWORD)xdict);
  }

  v9 = (__asl_object_s *)bta_logfile_asl_handle;
  if (_logToFile) {
    BOOL v10 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v11 = xpc_dictionary_get_string(xdict, "BackgroundTaskAgentClientName");
    asl_log( v9,  0,  7,  "processJobList: Removing job (%s, %s): 0x%x",  v11,  (const char *)objc_msgSend(objc_msgSend(a2, "description"), "UTF8String"),  (_DWORD)xdict);
  }

  return [*(id *)(a1 + 32) removeJob:xdict withToken:a2];
}

void sub_41D0(uint64_t a1, int a2, xpc_object_t xdict)
{
  if (xpc_dictionary_get_BOOL(xdict, kBackgroundTaskAgentJobWindowAdjustTime))
  {
    v5 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
    double v6 = xpc_dictionary_get_double(xdict, kBackgroundTaskAgentJobWindowStartTime);
    xpc_dictionary_set_double(xdict, v5, v6 + *(double *)(a1 + 32));
    BOOL v7 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
    double v8 = xpc_dictionary_get_double(xdict, kBackgroundTaskAgentJobWindowEndTime) + *(double *)(a1 + 32);
    xpc_dictionary_set_double(xdict, v7, v8);
  }

LABEL_48:
        v19 = 0;
        v21 = 0;
        a5->var0 = 0;
        v20 = 1;
        a5->var5 = 1;
        a5->var6 = v16;
        a5->var7 = 0;
        v26 = -1.0;
        v27 = v16;
        goto LABEL_37;
      }
    }

LABEL_34:
    v19 = 0;
    v20 = 0;
    v21 = 0;
    a5->var0 = 0;
    goto LABEL_35;
  }

  if (var3 < v16) {
    goto LABEL_48;
  }
  v19 = 0;
  v20 = 0;
  v21 = 1;
  a5->var0 = 1;
LABEL_35:
  a5->var5 = 0;
  a5->var6 = 101.0;
  a5->var7 = 0;
  v26 = -1.0;
LABEL_36:
  v27 = 101.0;
LABEL_37:
  a5->var8 = v26;
  if (_logToConsole && bta_logconsole_asl_handle) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "evalJobConditions(%s): isSatisfied = %d, isNetworkSatisfied = %d, isScreenBlankedSatisfied = %d, isPowerPluggedinS atisfied = %d, isBatteryLevelSatisfied = %d, isBatteryLevelNotificationNeeded = %d, notificationBatteryLevel = %.1 f, isOnlyTimeWaitNeeded = %d, waitTime = %.1f",  string,  v21,  v18,  a5->var2,  a5->var3,  var3 >= v16,  v20,  v27,  v19,  v26);
  }
  if (_logToFile)
  {
    if (bta_logfile_asl_handle) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "evalJobConditions(%s): isSatisfied = %d, isNetworkSatisfied = %d, isScreenBlankedSatisfied = %d, isPowerPluggedi nSatisfied = %d, isBatteryLevelSatisfied = %d, isBatteryLevelNotificationNeeded = %d, notificationBatteryLevel = %.1f, isOnlyTimeWaitNeeded = %d, waitTime = %.1f",  string,  a5->var0,  a5->var1,  a5->var2,  a5->var3,  a5->var4,  a5->var5,  a5->var6,  a5->var7,  a5->var8);
    }
  }

id sub_487C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) printJob:a3 withToken:a2 withPrefix:*(void *)(a1 + 40) withLogLevel:*(unsigned int *)(a1 + 48) withJobStatus:*(unsigned __int8 *)(a1 + 52)];
}

void btaInstall()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ignoreRequests", kBTAPluginIdentifier, 0LL);
  initializeLogging();
  if (AppBooleanValue) {
    xpc_event_provider_create();
  }
  xpc_event_provider_create();
}

id sub_50B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  double v8 = objc_opt_new(&OBJC_CLASS___NSAutoreleasePool);
  if (a3) {
    v9 = xpc_copy_description(a3);
  }
  else {
    v9 = 0LL;
  }
  if (a1 == 2)
  {
    if (_logToConsole) {
      BOOL v12 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "userEventCallback: Remove Event - token = %llu", a2);
    }
    if (_logToFile) {
      BOOL v13 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13) {
      asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 5, "userEventCallback: Remove Event - token = %llu", a2);
    }
    [*(id *)(a4 + 8) cancelJobWithToken:a2];
  }

  else if (a1 == 1)
  {
    if (_logToConsole) {
      BOOL v10 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "userEventCallback: Add Event - token = %llu, jobRequest = %s",  a2,  v9);
    }
    if (_logToFile) {
      BOOL v11 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  5,  "userEventCallback: Add Event - token = %llu, jobRequest = %s",  a2,  v9);
    }
    if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      [*(id *)(a4 + 8) newJob:a3 withToken:a2];
    }

    else
    {
      if (bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "userEventCallback: jobRequest is not a dictionary: %s",  v9);
      }
      if (_logToFile && bta_logfile_asl_handle) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "userEventCallback: jobRequest is not a dictionary: %s",  v9);
      }
    }
  }

  free(v9);
  return -[NSAutoreleasePool drain](v8, "drain");
}

id sub_545C(uint64_t a1, int token)
{
  return [*(id *)(a1 + 32) setIsScreenBlanked:state64 != 0];
}

void sub_54A4(uint64_t a1)
{
  uint64_t v2 = ((uint64_t (*)(void))CTTelephonyCenterGetDefault)();
  CTTelephonyCenterAddObserver(v2, *(void *)(a1 + 32), sub_555C, kCTRegistrationStatusChangedNotification, 0LL, 4LL);
  uint64_t v3 = CTTelephonyCenterAddObserver(v2, *(void *)(a1 + 32), sub_55C0, kCTCallStatusChangeNotification, 0LL, 4LL);
  uint64_t Default = CTTelephonyCenterGetDefault(v3);
  CTTelephonyCenterAddObserver( Default,  *(void *)(a1 + 32),  sub_5624,  kCTTelephonyCenterDaemonRestartNotification,  0LL,  4LL);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  *(const void **)(a1 + 32),  (CFNotificationCallback)sub_5688,  @"SignificantTimeChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_555C(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_7638;
  block[3] = &unk_C4E0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

void sub_55C0(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_7604;
  block[3] = &unk_C4E0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

void sub_5624(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_760C;
  block[3] = &unk_C4E0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

id sub_5688(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = objc_opt_new(&OBJC_CLASS___NSAutoreleasePool);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_74B4;
  v7[3] = &unk_C5B0;
  v7[4] = a2;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)[a2 queue], v7);
  return -[NSAutoreleasePool drain](v5, "drain");
}

id sub_5710(id result, uint64_t a2, int a3, intptr_t a4)
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  double v6 = result;
  switch((v4 >> 4))
  {
    case 0u:
      [result setSystemWillSleep:1];
      if (objc_msgSend(objc_msgSend(v6, "networkStabilizationTimer"), "isValid"))
      {
        [v6 setShouldRescheduleTimer:1];
        [v6 cancelNetworkStabilizationTimer];
      }

      goto LABEL_7;
    case 1u:
LABEL_7:
      id result = (id)IOAllowPowerChange((io_connect_t)[v6 rootDomainConnect], a4);
      break;
    case 2u:
    case 9u:
      [result setSystemWillSleep:0];
      id result = [v6 shouldRescheduleTimer];
      if ((_DWORD)result)
      {
        [v6 setShouldRescheduleTimer:0];
        id result = [v6 rescheduleNetworkStabilizationTimer];
      }

      break;
    default:
      return result;
  }

  return result;
}

id sub_5D4C(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = objc_opt_new(&OBJC_CLASS___NSAutoreleasePool);
  [a3 rescheduleNetworkStabilizationTimer];
  return -[NSAutoreleasePool drain](v4, "drain");
}

id sub_5F28(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNetworkLinkQuality];
}

LABEL_64:
  -[BackgroundTaskAgentMonitor updateRoamingState](self, "updateRoamingState");
  -[BackgroundTaskAgentMonitor setPendingNetworkUpdate:](self, "setPendingNetworkUpdate:", 0LL);
  if (v15 != self->_primaryLinkQuality || self->_primaryLinkIsCellular != v14 || self->_roamStateChanged)
  {
    self->_primaryLinkQuality = v15;
    self->_primaryLinkIsCellular = v14;
    self->_roamStateChanged = 0;
    if (self->_numNetworkJobs >= 1) {
      [self->_target performSelector:self->_selector withObject:0];
    }
  }

  -[NSNotificationCenter postNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:",  @"kBTANetworkHasStabilized",  0LL);
  if (_logToConsole && bta_logconsole_asl_handle) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - primaryLinkQuality = %d, primaryLinkIsCellular = %d",  v15,  v14);
  }
  if (_logToFile && bta_logfile_asl_handle) {
    asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - primaryLinkQuality = %d, primaryLinkIsCellular = %d",  v15,  v14);
  }
  if (v12) {
    CFRelease(v12);
  }
}

id sub_6B04(id result, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    unint64_t v4 = result;
    [result updateBatteryLevel:a2];
    return [v4 updatePluggedinState:a2];
  }

  return result;
}

id sub_74B4(uint64_t a1)
{
  id result = (id)CFEqual(*(CFTypeRef *)(a1 + 40), @"SignificantTimeChangeNotification");
  if ((_DWORD)result)
  {
    [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
    double v4 = v3;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 32) getKernelMonotonicClock];
    double v7 = v6;
    [*(id *)(a1 + 32) setSystemToMonotonicTimeOffset:Current - v6];
    double v8 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (_logToConsole) {
      BOOL v9 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
      asl_log( v8,  0LL,  5,  "BackgroundTaskAgentMonitor SignificantTimeChangeNotification: Current Absolute Time = %.2f, Current Kernel Monot onic Time = %.2f, Old Offset = %.2f, New Offset = %.2f",  Current,  v7,  v4,  v10);
    }

    BOOL v11 = (__asl_object_s *)bta_logfile_asl_handle;
    if (_logToFile) {
      BOOL v12 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
      asl_log( v11,  0LL,  7,  "BackgroundTaskAgentMonitor SignificantTimeChangeNotification: Current Absolute Time = %.2f, Current Kernel Monot onic Time = %.2f, Old Offset = %.2f, New Offset = %.2f",  Current,  v7,  v4,  v13);
    }

    id result = [*(id *)(a1 + 32) numAdjustTimeJobs];
    if ((int)result >= 1)
    {
      [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
      double v15 = v14 - v4;
      return objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "target"),  "performSelector:withObject:",  objc_msgSend(*(id *)(a1 + 32), "selector"),  &v15);
    }
  }

  return result;
}

id sub_7604(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCallState];
}

id sub_760C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRoamingState];
}

id sub_7638(uint64_t a1)
{
  return [*(id *)(a1 + 32) processRegistrationNotification];
}

asl_object_t initializeLogging()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_7750,  @"BTALoggingSettingsDidChangeNotification",  0LL,  (CFNotificationSuspensionBehavior)0LL);
  sub_7780();
  bta_logfile_asl_handle = (uint64_t)asl_open(0LL, kBTAFileLogFacility, 1u);
  asl_set_filter((asl_object_t)bta_logfile_asl_handle, 255);
  asl_object_t result = asl_open(0LL, kBTAConsoleLogFacility, 1u);
  bta_logconsole_asl_handle = (uint64_t)result;
  return result;
}

NSString *stringFromCFAbsoluteTime(double a1)
{
  time_t v3 = (uint64_t)(kCFAbsoluteTimeIntervalSince1970 + a1);
  *(_OWORD *)double v4 = 0u;
  __int128 v5 = 0u;
  localtime_r(&v3, &v2);
  strftime(v4, 0x20uLL, "%Y-%m-%d %X %z", &v2);
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4);
}

void sub_7750()
{
}

void sub_7780()
{
  int v0 = _logToFile;
  uint64_t v1 = (const __CFBoolean *)CFPreferencesCopyValue( @"logToFile",  @"com.apple.BackgroundTaskAgentPlugin",  @"mobile",  kCFPreferencesCurrentHost);
  if (v1)
  {
    tm v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue(v2);
      _logToFile = Value != 0;
      if (Value && v0 != (Value != 0))
      {
        double v6 = asl_new(0);
        asl_set(v6, "ASLOption", "control");
        asl_log(0LL, v6, 5, "@ com.apple.BackgroundTaskAgentPlugin.conf checkpoint");
        asl_release(v6);
      }
    }

    CFRelease(v2);
  }

  double v7 = (const __CFBoolean *)CFPreferencesCopyValue( @"logToConsole",  @"com.apple.BackgroundTaskAgentPlugin",  @"mobile",  kCFPreferencesCurrentHost);
  if (v7)
  {
    double v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFBooleanGetTypeID()) {
      _logToConsole = CFBooleanGetValue(v8) != 0;
    }
    CFRelease(v8);
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

id objc_msgSend_validateAndAddDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAndAddDefaults:");
}