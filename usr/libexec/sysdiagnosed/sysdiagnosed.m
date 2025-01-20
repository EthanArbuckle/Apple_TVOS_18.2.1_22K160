void sub_1000085BC(id a1)
{
  SystemDiagnosticBT *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticBT);
  v2 = (void *)qword_1000A5168;
  qword_1000A5168 = (uint64_t)v1;
}
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

id sub_1000087C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceDeregisterBTSession];
}

void sub_1000088AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000088C4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) btSession];
  if (result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return result;
}

void sub_100008B90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100008BA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btSession];
  v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 triggerAirPodLogsIfConnected];
  }
  id result = [v3 setWaitingToCaptureAirPodLogs:1];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

void sub_100008EC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100008EDC(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CBUserController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008F74;
  v5[3] = &unk_100088EF8;
  v5[4] = *(void *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  __int128 v6 = v4;
  [v2 appleAudioAccessoryLimitedLoggingWithCompletion:v5];
}

void sub_100008F74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryLogSubsystem]);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CBUserController returned error for limited logging check, assuming not enabled: %@",  buf,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v9,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    [v10 stdoutWrite:@"CBUserController returned error for limited logging check, assuming not enabled: %@", v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    [v12 logWithSubsystem:"remoteSysdiagnose", "AccessoryLogSubsystem", @"CBUserController returned error for limited logging check, assuming not enabled: %@", v13 category msg];
  }

  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v1_Block_object_dispose(va, 8) = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CBUserController returned limited logging value: %d",  buf,  8u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v14,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v15, "stdoutWrite:", @"CBUserController returned limited logging value: %d", a2);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v16,  "logWithSubsystem:category:msg:",  "remoteSysdiagnose",  "AccessoryLogSubsystem",  @"CBUserController returned limited logging value: %d",  a2);

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100009998(uint64_t a1)
{
  return [*(id *)(a1 + 32) markAirpodLogsDone:1];
}

id sub_100009CC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) attachToBTSession];
}

LABEL_24:
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100053940();
    }
    goto LABEL_26;
  }

  if (v6)
  {
    if (v6 == 2)
    {
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100053A24();
      }
      goto LABEL_26;
    }

    goto LABEL_24;
  }

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully registered AirPod logs dump with BTAccessoryManager, waiting for accessory logs callback.",  v9,  2u);
  }
}

LABEL_15:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT airpodsGroup](self, "airpodsGroup"));
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticBT accessoryLogSubsystem](self, "accessoryLogSubsystem"));
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "AirPod logs dumped, file(s) received in callback: %@",  (uint8_t *)&v19,  0xCu);
      }

      v18 = -[os_log_s copy](v10, "copy");
      -[SystemDiagnosticBT setAccessoryLogs:](self, "setAccessoryLogs:", v18);

      -[SystemDiagnosticBT markAirpodLogsDone:](self, "markAirpodLogsDone:", 0LL);
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100053BE0((uint64_t)v10, v17);
      }
    }
  }
}

  objc_sync_exit(v7);

  return v11;
}
}

void sub_10000A53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](&OBJC_CLASS___SystemDiagnosticBT, "sharedInstance"));
  [v6 sessionEvent:a1 event:a2 result:a3];
}

void sub_10000A598(id a1)
{
  if (&_BTAccessoryManagerDeregisterCustomMessageClient) {
    BOOL v1 = &_BTSessionDetachWithQueue == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1
    && &_BTSessionAttachWithQueue != 0LL
    && &BTLocalDeviceDumpExposureNotificationDatabase != 0LL
    && &_BTAccessoryManagerRegisterCustomMessageClient != 0LL
    && &BTLocalDeviceGetDefault != 0LL
    && &_BTAccessoryManagerGetDefault != 0LL)
  {
    byte_1000A5178 = 1;
  }

void sub_10000A600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](&OBJC_CLASS___SystemDiagnosticBT, "sharedInstance"));
  [v7 logCompletionHandler:a4 size:a5];
}

void sub_10000A64C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000A664( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

BOOL sub_10000A7E4(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  [v5 log:@"%@\n", v6];

  return 1;
}

LABEL_35:
        v12 = 0;
LABEL_36:

        goto LABEL_7;
      }

      *a4 = 6LL;
      v65 = sub_1000241E4();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      [v19 timeIntervalSince1970];
      v67 = (int)v66;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil"));
      [v59 timeIntervalSince1970];
      *(_DWORD *)buf = 138412802;
      v72 = v56;
      v73 = 1024;
      *(_DWORD *)v74 = v67;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = (int)v68;
      v61 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }

    v63 = v55;
    v64 = 24;
    goto LABEL_34;
  }

  v12 = 0;
  v13 = 9LL;
LABEL_6:
  *a4 = v13;
LABEL_7:

  return v12;
}

BOOL sub_10000CB80(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  __int128 v4 = sub_1000241E4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Error expanding user home directories: %@\n",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error expanding user home directories: %@\n", v8 category msg];

  return 1;
}

int sub_10000DF40(id a1, const char *a2, int a3)
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_1000241E4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v10 = v3;
    __int16 v11 = 2080;
    v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Glob Error (%d) %s ", buf, 0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend( v7,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Glob Error (%d) %s ",  v3,  a2);

  return v3;
}

void sub_10000EE08(id a1)
{
  BOOL v1 = objc_alloc_init(&OBJC_CLASS___SDResourceManager);
  id v2 = (void *)qword_1000A5188;
  qword_1000A5188 = (uint64_t)v1;

  if (qword_1000A5188)
  {
    uint64_t v3 = sub_100040124();
    [(id)qword_1000A5188 setIsDaemon:v3];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create SDResourceManager singleton.",  v4,  2u);
  }

void sub_10000F060(_Unwind_Exception *a1)
{
}

void sub_10000F0E0(_Unwind_Exception *a1)
{
}

void sub_10000F334(_Unwind_Exception *a1)
{
}

void sub_10000F6A8(_Unwind_Exception *a1)
{
}

void sub_10000F75C(_Unwind_Exception *a1)
{
}

void sub_10000F7B0(_Unwind_Exception *a1)
{
}

void sub_10000F8E4(_Unwind_Exception *a1)
{
}

void sub_10000F994(_Unwind_Exception *a1)
{
}

void sub_10000FB40(_Unwind_Exception *a1)
{
}

void sub_10000FBCC(_Unwind_Exception *a1)
{
}

void sub_10000FCD4(_Unwind_Exception *a1)
{
}

void sub_10000FEFC(_Unwind_Exception *a1)
{
}

void sub_1000100B4(_Unwind_Exception *a1)
{
}

void sub_1000102AC(_Unwind_Exception *a1)
{
}

void sub_1000104E0(_Unwind_Exception *a1)
{
}

void sub_1000105F8(_Unwind_Exception *a1)
{
}

LABEL_14:
  return v11;
}

  return v10;
}

void sub_1000109FC(_Unwind_Exception *a1)
{
}

void sub_100010C90(_Unwind_Exception *a1)
{
}

void sub_100010DF8(_Unwind_Exception *a1)
{
}

void sub_100010F20(_Unwind_Exception *a1)
{
}

void sub_100011024(_Unwind_Exception *a1)
{
}

void sub_10001118C(_Unwind_Exception *a1)
{
}

void sub_100011230(_Unwind_Exception *a1)
{
}

void sub_1000114B0(_Unwind_Exception *a1)
{
}

void sub_1000115EC(_Unwind_Exception *a1)
{
}

void sub_1000116F0(_Unwind_Exception *a1)
{
}

void sub_1000117A8(_Unwind_Exception *a1)
{
}

LABEL_18:
}

  return v9;
}

void sub_1000119EC(_Unwind_Exception *a1)
{
}

void sub_100011B20(_Unwind_Exception *a1)
{
}

void sub_100011D14(_Unwind_Exception *a1)
{
}

void sub_100011DB8(_Unwind_Exception *a1)
{
}

NSArray *__cdecl sub_10001310C(id a1, NSDate *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/root/Library/Caches/hangtracerd/spool/*.tailspin*",  v2,  0LL,  0LL,  @"spool",  0LL));
  v7[0] = v3;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/*.tailspin*",  v2,  0LL,  0LL,  @"HangTracer",  0LL));

  v7[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return (NSArray *)v5;
}

void sub_100015EAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100015EC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015ED4(uint64_t a1)
{
}

char *sub_100015EDC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id result = (char *)[*(id *)(a1 + 40) count];
  if ((unint64_t)(result - 1) > a3) {
    return (char *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:@" AND "];
  }
  return result;
}

void sub_100016060( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

char *sub_100016078(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id result = (char *)[*(id *)(a1 + 40) count];
  return result;
}

void sub_1000163F8(id a1)
{
  BOOL v1 = objc_alloc_init(&OBJC_CLASS___CSCoordinator);
  id v2 = (void *)qword_1000A5198;
  qword_1000A5198 = (uint64_t)v1;
}

void sub_100016680(_Unwind_Exception *a1)
{
}

void sub_1000167F4(_Unwind_Exception *a1)
{
}

void sub_100016934(_Unwind_Exception *a1)
{
}

void sub_100016A88(_Unwind_Exception *a1)
{
}

void sub_100016BCC(_Unwind_Exception *a1)
{
}

void sub_100016D34(_Unwind_Exception *a1)
{
}

void sub_100016E78(_Unwind_Exception *a1)
{
}

void sub_100016FD4(_Unwind_Exception *a1)
{
}

void sub_100017098(_Unwind_Exception *a1)
{
}

void sub_100017144(_Unwind_Exception *a1)
{
}

void sub_10001756C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

LABEL_4:
  v8 = 0;
LABEL_11:
  objc_sync_exit(v5);

  return v8;
}

  v8 = v6;
  v9 = strndup((const char *)-[__CFString UTF8String](v8, "UTF8String"), (size_t)-[__CFString length](v8, "length"));
  if (!v9)
  {
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_100054D40(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v22 stderrWrite:@"Unable to allocate temporary directory template"];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v23 log:@"Unable to allocate temporary directory template"];

    goto LABEL_15;
  }

  int v10 = v9;
  if (!mkdtemp(v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054D74();
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v25 = __error();
    [v24 stderrWrite:@"Unable to create user temporary directory %@: %s", v8, strerror(*v25)];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v27 = __error();
    [v26 log:@"Unable to create user temporary directory %@: %s", v8, strerror(*v27)];

    free(v10);
LABEL_15:
    v13 = 0LL;
    goto LABEL_16;
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v12 = [v11 stringWithFileSystemRepresentation:v10 length:strlen(v10)];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  free(v10);
LABEL_16:

  return v13;
}

void sub_1000178B4(_Unwind_Exception *a1)
{
}

void sub_100017954( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_22:
  return v17;
}
}

void sub_1000180C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000180F8(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getProxiesForDiagnosticID:*(void *)(a1 + 40)]);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
        {
          id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logSubsystem]);

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Timed out waiting on proxies. Skipping remaining",  v9,  2u);
          }

          goto LABEL_13;
        }

        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) waitToReceiveCoSysdiagnose];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

LABEL_13:
}

  return (char)v3;
}

void sub_1000187B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000187C8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000197D8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputDirectory]);
  v48[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) destination]);
  v48[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stdoutPath]);
  v48[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 3LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v5));

  if ([*(id *)(a1 + 40) terminationStatus])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [*(id *)(a1 + 40) terminationStatus];
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Baseband: exited with termination status %d",  buf,  8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v8,  "log:",  @"Baseband: exited with termination status %d",  objc_msgSend(*(id *)(a1 + 40), "terminationStatus"));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if ([v8 fileExistsAtPath:v6]
      && ([v8 isReadableFileAtPath:v6] & 1) != 0)
    {
      id v40 = 0LL;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:usedEncoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:usedEncoding:error:",  v6,  v41,  &v40));
      id v10 = v40;
      if (v9)
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@"\n"]);
        __int128 v12 = v11;
        if (v11)
        {
          if ((unint64_t)[v11 count] >= 3)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
            id v14 = [v13 rangeOfString:@"Path ="];

            if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
              v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "substringFromIndex:",  (char *)objc_msgSend(v16, "rangeOfString:", @"=") + 1));

              v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByRemovingWhitespace]);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                else {
                  v19 = "NO";
                }
                *(_DWORD *)buf = 138412546;
                v45 = v18;
                __int16 v46 = 2080;
                v47 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Baseband: File found at location %@? %s",  buf,  0x16u);
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              unsigned int v21 = [v18 isAbsolutePath];
              v22 = "YES";
              if (!v21) {
                v22 = "NO";
              }
              [v20 log:@"Baseband: File found at location %@? %s", v18, v22];

              if (v18)
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:@"index.plist"]);
                v43[0] = v37;
                v35 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:@"info.csv"]);
                v43[1] = v35;
                v23 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:@"info.txt"]);
                v43[2] = v23;
                v24 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:@"Default.dmc"]);
                v43[3] = v24;
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v43,  4LL));

                v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) destination]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
                v36 = v18;
                uint64_t v27 = objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:v26]);

                v38 = (void *)v27;
                uint64_t v28 = v27;
                v18 = v36;
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"basebandMeta collection",  v28,  *(void *)(a1 + 32)));
                v30 = v29;
                if (v29)
                {
                  [v29 setRuntimeChecks:0];
                  [v30 setMaximumSizeMB:128];
                  v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  v39));
                  v42[0] = v34;
                  v31 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  v36));
                  v42[1] = v31;
                  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v42,  2LL));
                  [v30 addRules:v32];

                  [v30 execute];
                }
              }
            }
          }
        }
      }

      else
      {
        __int128 v12 = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Baseband: File %@ was not generated or unreadable",  buf,  0xCu);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v33 log:@"Baseband: File %@ was not generated or unreadable", v6];
    }
  }
}

NSMutableArray *__cdecl sub_100019ECC(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"StateDumpFrequency", @"com.apple.soundautoconfig");
  CFPreferencesSetAppValue(@"StateDumpFrequency", @"1", @"com.apple.soundautoconfig");
  sleep(3u);
  if (v1)
  {
    CFPreferencesSetAppValue(@"StateDumpFrequency", v1, @"com.apple.soundautoconfig");
    CFRelease(v1);
  }

  else
  {
    CFPreferencesSetAppValue(@"StateDumpFrequency", 0LL, @"com.apple.soundautoconfig");
  }

  return 0LL;
}

void sub_10001E180( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001E1AC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "replyDictionary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054868(v4);
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v5 log:@"CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@", xpc_get_type(v4), v10];
LABEL_9:

    goto LABEL_10;
  }

  if (xpc_dictionary_get_BOOL(v4, "wiFiVelocityMegaProfile"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskContainer]);
    [v6 setTimeout:36.0];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) collectionContainer]);
    [v7 setMaximumSizeMB:100];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(_DWORD *)buf = 134218240;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB",  buf,  0x16u);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v5 log:@"Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    goto LABEL_9;
  }

LABEL_10:
  [*(id *)(a1 + 32) executeFromCallback];
}

    -[CSRemoteXPCProxy safeLeaveRemoteGroup](self, "safeLeaveRemoteGroup");
    goto LABEL_11;
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSProxy diagnosticID](self, "diagnosticID"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002B990;
  v20[3] = &unk_100088EA8;
  v20[4] = self;
  +[CSRemoteXPCProxy receiveFileFromRemote:forDiagnosticID:withCompletionBlock:]( &OBJC_CLASS___CSRemoteXPCProxy,  "receiveFileFromRemote:forDiagnosticID:withCompletionBlock:",  v4,  v13,  v20);

LABEL_11:
}

  return v6;
}

void sub_10001F61C(id a1)
{
  CFPropertyListRef v1 = (void *)qword_1000A51A8;
  qword_1000A51A8 = (uint64_t)&off_10009A168;
}

id sub_10001F89C()
{
  if (qword_1000A51B8 != -1) {
    dispatch_once(&qword_1000A51B8, &stru_100089200);
  }
  return (id)qword_1000A51C0;
}

BOOL sub_10001F8DC(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10001F89C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000548E8(v3, v5);
  }

  return 1;
}

LABEL_11:
  return (char)v5;
}

  return v10;
}

  return (char)v6;
}

LABEL_20:
  return v14;
}

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      __int16 v13 = v28;
    }

    while (v28);
  }

  return v5;
}

void sub_10002007C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");
  id v2 = (void *)qword_1000A51C0;
  qword_1000A51C0 = (uint64_t)v1;
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v2) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Launching daemon not from DDCSI",  (uint8_t *)&v2,  2u);
  }

  v0 = objc_autoreleasePoolPush();
  if ((sub_100040124() & 1) != 0)
  {
    int v1 = setiopolicy_np(0, 0, 2);
    if (v1) {
      _os_assumes_log(v1);
    }
    sub_10002019C();
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v2 = 136315138;
    id v3 = "Error: sysdiagnosed should only be invoked by launchd";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s",  (uint8_t *)&v2,  0xCu);
  }

  puts("Error: sysdiagnosed should only be invoked by launchd");
  exit(1);
}

void sub_10002019C()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting server",  buf,  2u);
  }

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v0 stdoutWrite:@"Starting server"];

  int v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v1 log:@"Starting server"];

  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  [v2 initRemoteServers];

  if (sub_10002E1D4())
  {
    uint64_t v12 = 0LL;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v3 = 3LL;
    }
    else {
      uint64_t v3 = 2LL;
    }
    uint64_t v4 = _os_log_send_and_compose_impl(v3, &v12, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v12, v4);
    __break(1u);
  }

  else if (!sub_1000307D0())
  {
    +[SDCacheDeleter registerCallbacks](&OBJC_CLASS___SDCacheDeleter, "registerCallbacks");
    dispatch_main();
  }

  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)buf = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = _os_log_send_and_compose_impl(v5, &v12, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(v12, v6);
  __break(1u);
}

CFStringRef sub_100020398(unint64_t a1)
{
  if (a1 > 0xF) {
    return @"Unknown server error";
  }
  else {
    return off_100089588[a1];
  }
}

BOOL sub_1000203BC()
{
  uid_t v0 = geteuid();
  int v1 = getpwnam("mobile");
  if (v1) {
    uid_t pw_uid = v1->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  if (seteuid(pw_uid))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = __error();
      uint64_t v4 = strerror(*v3);
      int buf = 136315138;
      v39 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not drop to mobile with error: %s",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v6 = __error();
    objc_msgSend(v5, "log:", @"Could not drop to mobile with error: %s", strerror(*v6));
LABEL_38:

    return 0;
  }

  uid_t v25 = v0;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v27 = [&off_10009A660 countByEnumeratingWithState:&v34 objects:v43 count:16];
  BOOL v7 = 0;
  if (v27)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(&off_10009A660);
        }
        uint64_t v28 = v8;
        __int128 v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([&off_10009A660 objectForKeyedSubscript:v9]);
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
              BOOL v29 = 0;
              if (sub_100040418(v15, v9, &v29))
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  int buf = 138412546;
                  v39 = v9;
                  __int16 v40 = 2112;
                  v41 = v15;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "A preference was found! Domain %@ with variable %@",  (uint8_t *)&buf,  0x16u);
                }

                v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                [v16 log:@"A preference was found! Domain %@ with variable %@", v9, v15];

                BOOL v7 = v29 || v7;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }

          while (v12);
        }

        uint64_t v8 = v28 + 1;
      }

      while ((id)(v28 + 1) != v27);
      id v27 = [&off_10009A660 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }

    while (v27);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      v17 = "YES";
    }
    else {
      v17 = "NO";
    }
    int buf = 136315138;
    v39 = (void *)v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nShould run full idstool dump: %s\n\n",  (uint8_t *)&buf,  0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  v19 = v18;
  if (v7) {
    v20 = "YES";
  }
  else {
    v20 = "NO";
  }
  objc_msgSend(v18, "log:", @"\nShould run full idstool dump: %s\n\n", v20);

  if (seteuid(v25))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = __error();
      v22 = strerror(*v21);
      int buf = 136315138;
      v39 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not return to original euid with error: %s",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v23 = __error();
    objc_msgSend(v5, "log:", @"Could not return to original euid with error: %s", strerror(*v23));
    goto LABEL_38;
  }

  return v7;
}

uint64_t sub_1000207FC()
{
  uid_t v0 = getpwnam("mobile");
  if (v0) {
    return v0->pw_uid;
  }
  else {
    return 501LL;
  }
}

void sub_100020828()
{
  uid_t v0 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v0)
  {
    int v1 = v0;
    Value = CFDictionaryGetValue(v0, _kCFSystemVersionProductNameKey);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
    uint64_t v4 = CFDictionaryGetValue(v1, _kCFSystemVersionProductVersionKey);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (__CFString *)v7;
    if (v3) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v5 == 0LL;
    }
    if (!v9 || v7 != 0)
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v3) {
        id v12 = v3;
      }
      else {
        id v12 = @"UNKNOWN";
      }
      if (v11)
      {
        if (v5) {
          uint64_t v13 = v5;
        }
        else {
          uint64_t v13 = @"UNKNOWN";
        }
        *(_DWORD *)int buf = 138412802;
        v20 = v12;
        __int16 v21 = 2112;
        v22 = v13;
        if (v8) {
          uint64_t v14 = v8;
        }
        else {
          uint64_t v14 = @"UNKNOWN";
        }
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ %@ (Build %@)",  buf,  0x20u);
      }

      else
      {
        if (v5) {
          uint64_t v13 = v5;
        }
        else {
          uint64_t v13 = @"UNKNOWN";
        }
        if (v8) {
          uint64_t v14 = v8;
        }
        else {
          uint64_t v14 = @"UNKNOWN";
        }
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v15 log:@"%@ %@ (Build %@)", v12, v13, v14];
    }

    CFRelease(v1);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    else {
      v16 = @"Customer";
    }
    *(_DWORD *)int buf = 138412290;
    v20 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose mode: %@",  buf,  0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  else {
    v18 = @"Customer";
  }
  [v17 log:@"Sysdiagnose mode: %@", v18];
}

id sub_100020A70(uint64_t a1, uint64_t a2)
{
  if (!objc_opt_class(&OBJC_CLASS___SDSeedProgramManager, a2))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_100054984(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    return 0LL;
  }

  if ((objc_opt_respondsToSelector(&OBJC_CLASS___SDSeedProgramManager, "canFileFeedback") & 1) == 0)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_1000549B8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return 0LL;
  }

  id v2 = +[SDSeedProgramManager canFileFeedback](&OBJC_CLASS___SDSeedProgramManager, "canFileFeedback");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = (_DWORD)v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Seed check: canFileFeedback: %d",  (uint8_t *)v20,  8u);
  }

  return v2;
}

uint64_t sub_100020B7C()
{
  if (qword_1000A51D0 != -1) {
    dispatch_once(&qword_1000A51D0, &stru_100089220);
  }
  return byte_1000A51C8;
}

void sub_100020BBC(id a1)
{
  byte_1000A51C8 = os_variant_is_darwinos("com.apple.sysdiagnose");
}

uint64_t sub_100020BE0()
{
  if (qword_1000A51E0 != -1) {
    dispatch_once(&qword_1000A51E0, &stru_100089240);
  }
  return byte_1000A51D8;
}

void sub_100020C20(id a1)
{
  byte_1000A51D8 = os_variant_has_factory_content("com.apple.sysdiagnose");
}

uint64_t sub_100020C44()
{
  if (qword_1000A51F0 != -1) {
    dispatch_once(&qword_1000A51F0, &stru_100089260);
  }
  return byte_1000A51E8;
}

void sub_100020C84(id a1)
{
  int v1 = (const void *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (v1)
  {
    id v2 = v1;
    byte_1000A51E8 = CFEqual(v1, @"Desense") != 0;
    CFRelease(v2);
  }

uint64_t sub_100020CE0()
{
  if (qword_1000A5200 != -1) {
    dispatch_once(&qword_1000A5200, &stru_100089280);
  }
  return byte_1000A51F8;
}

void sub_100020D20(id a1)
{
  byte_1000A51F8 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL) == 7;
}

id sub_100020D50()
{
  if (qword_1000A5210 != -1) {
    dispatch_once(&qword_1000A5210, &stru_1000892A0);
  }
  return (id)qword_1000A5208;
}

void sub_100020D90(id a1)
{
  int v1 = (void *)MGCopyAnswer(@"UniqueDeviceID", 0LL);
  if (v1) {
    objc_storeStrong((id *)&qword_1000A5208, v1);
  }
}

void sub_100020DC8()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Screen flash requested",  v3,  2u);
  }

  uid_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v0 log:@"Screen flash requested"];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v2, &stru_1000892C0);
}

CFStringRef sub_100020E74(int a1)
{
  if (a1 > 11)
  {
    switch(a1)
    {
      case '0':
        return @"PlayPause + Volume Down";
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
        return @"?";
      case '6':
        return @"Cmd-Opt-Ctrl-Shift-Comma";
      case '7':
        return @"Cmd-Opt-Ctrl-Shift-Period";
      case '8':
        return @"Cmd-Opt-Ctrl-Shift-Slash";
      default:
        if (a1 == 12)
        {
          id result = @"Crown + Pill";
        }

        else
        {
          if (a1 != 36) {
            return @"?";
          }
          id result = @"Legacy: Menu + Volume Down";
        }

        break;
    }
  }

  else
  {
    if (a1 <= -2147483637)
    {
      if (a1 == 0x80000000) {
        return @"Full Diagnostic from Driver";
      }
      if (a1 == -2147483641) {
        return @"Power + Volume Up + Volume Down";
      }
    }

    else
    {
      switch(a1)
      {
        case -2147483636:
          return @"Hold Crown + Pill";
        case 3:
          return @"Power + Volume Up";
        case 6:
          return @"Legacy: Menu + Volume Up";
      }
    }

    return @"?";
  }

  return result;
}

CFStringRef sub_100020F88(int a1)
{
  else {
    return off_100089608[(__int16)(a1 - 1)];
  }
}

CFStringRef sub_100020FB4(unsigned int a1)
{
  if (a1 > 0xC) {
    return @"?";
  }
  else {
    return off_100089630[(__int16)a1];
  }
}

CFStringRef sub_100020FDC(unsigned int a1)
{
  if (a1 > 2) {
    return @"?";
  }
  else {
    return off_100089698[(__int16)a1];
  }
}

id sub_100021004()
{
  uid_t v0 = getpwnam("mobile");
  if (v0) {
    return sub_100021030(v0->pw_uid);
  }
  else {
    return sub_100021030(501LL);
  }
}

id sub_100021030(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Getting home dir for uid %d",  buf,  8u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", @"Getting home dir for uid %d", a1);

  BOOL v3 = getpwuid(a1);
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3->pw_dir));
    if (!v4)
    {
      uint64_t v7 = 0LL;
      return v7;
    }

    uint64_t v5 = v4;
    id v6 = sub_10004D36C(v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = __error();
      uint64_t v9 = strerror(*v8);
      *(_DWORD *)int buf = 136315138;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "getpwuid failed, err: %s",  buf,  0xCu);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v10 = __error();
    objc_msgSend(v5, "log:", @"getpwuid failed, err: %s", strerror(*v10));
    uint64_t v7 = 0LL;
  }

  return v7;
}

id sub_1000211D4()
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v1));
}

void sub_100021250(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = fopen((const char *)[v4 fileSystemRepresentation], "wx");
  if (v5)
  {
    id v6 = v5;
    fputs((const char *)[v3 UTF8String], v5);
    fclose(v6);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "File %@ could not be created",  buf,  0xCu);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v7 log:@"File %@ could not be created", v4];
  }
}

id sub_100021370(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLNameKey,  NSURLPathKey,  NSURLCreationDateKey,  0LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:7 errorHandler:&stru_1000892E0]);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v26 = v4;
      uint64_t v28 = *(void *)v31;
      NSURLResourceKey v11 = NSURLIsDirectoryKey;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_autoreleasePoolPush();
          id v29 = 0LL;
          [v13 getResourceValue:&v29 forKey:v11 error:0];
          id v15 = v29;
          if ([v15 BOOLValue] == (_DWORD)a2)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
            id v17 = [v16 rangeOfString:v3];

            if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ((a2 & 1) != 0) {
                goto LABEL_16;
              }
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
              uint64_t v20 = a2;
              id v21 = v3;
              id v22 = [v19 rangeOfString:@".tar"];

              BOOL v23 = v22 == (id)0x7FFFFFFFFFFFFFFFLL;
              id v3 = v21;
              a2 = v20;
              NSURLResourceKey v11 = NSURLIsDirectoryKey;
              if (!v23)
              {
LABEL_16:
                v24 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);

                objc_autoreleasePoolPop(v14);
                goto LABEL_17;
              }
            }
          }

          objc_autoreleasePoolPop(v14);
        }

        id v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      v24 = 0LL;
LABEL_17:
      id v4 = v26;
    }

    else
    {
      v24 = 0LL;
    }
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

BOOL sub_10002165C(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v4 log:@"%@\n", v3];

  return 1;
}

id sub_10002172C(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v1)
  {
    if (xpc_array_get_count(v1))
    {
      size_t v3 = 0LL;
      do
      {
        string = xpc_array_get_string(v1, v3);
        if (string)
        {
          uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
          [v2 addObject:v5];
        }

        ++v3;
      }

      while (xpc_array_get_count(v1) > v3);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not a valid xpc array",  v8,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v6 log:@"Not a valid xpc array"];
  }

  return v2;
}

uint64_t sub_100021848(uint64_t a1)
{
  id v1 = sub_100021940(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      id v4 = *(__CFString **)((char *)&off_100089300 + v3);
      if ((-[__CFString containsString:](v4, "containsString:", v2) & 1) != 0
        || [v2 containsString:v4])
      {
        break;
      }

      v3 += 8LL;
      if (v3 == 200) {
        goto LABEL_6;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Matched approved path",  v8,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v6 log:@"Matched approved path"];

    uint64_t v5 = 1LL;
  }

  else
  {
LABEL_6:
    uint64_t v5 = 0LL;
  }

  return v5;
}

id sub_100021940(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  4LL));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v6) = a1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get client proc path for pid %d",  buf,  8u);
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v3, "log:", @"Failed to get client proc path for pid %d", a1);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412546;
    id v6 = v2;
    __int16 v7 = 1024;
    int v8 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got path %@ for pid %d",  buf,  0x12u);
  }

  return v2;
}

id sub_100021A94(uint64_t a1)
{
  id v1 = sub_100021940(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2) {
    id v3 = [@"/AppleInternal/Library/Frameworks/TapToRadarDaemon.framework/Support/taptoradard" isEqualToString:v2];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_100021AE0(void *a1)
{
  v8[0] = 0LL;
  v8[1] = 0LL;
  id v1 = a1;
  if ((dirstat_np([v1 fileSystemRepresentation], 0, v8, 16) & 0x80000000) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = __error();
      id v3 = strerror(*v2);
      *(_DWORD *)int buf = 138412546;
      id v10 = v1;
      __int16 v11 = 2080;
      uint64_t v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Directory sizing for %@ failed with error %s",  buf,  0x16u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v5 = __error();
    [v4 log:@"Directory sizing for %@ failed with error %s", v1, strerror(*v5)];
  }

  uint64_t v6 = v8[0];

  return v6;
}

_xpc_connection_s *sub_100021BFC(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Trying to create a sysdiagnose_helper connection",  buf,  2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 log:@"Trying to create a sysdiagnose_helper connection"];

  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose_helper", 0LL, 2uLL);
  id v4 = mach_service;
  if (mach_service)
  {
    if (!v1) {
      id v1 = &stru_1000893E8;
    }
    xpc_connection_set_event_handler(mach_service, v1);
    uuid_generate_random(buf);
    xpc_connection_set_oneshot_instance(v4, buf);
    xpc_connection_activate(v4);
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "taskType", 24LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending HANDSHAKE to sysdiagnose_helper",  v16,  2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v6 log:@"Sending HANDSHAKE to sysdiagnose_helper"];

    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v4, v5);
    int v8 = v7;
    if (v7)
    {
      if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v8, "result"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_helper connection success",  v16,  2u);
        }

        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v9 log:@"sysdiagnose_helper connection success"];

        id v10 = v4;
        goto LABEL_24;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't connect to sysdiagnose_helper",  v16,  2u);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v13 = v12;
      uint64_t v14 = @"Couldn't connect to sysdiagnose_helper";
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_helper returned empty for a HANDSHAKE",  v16,  2u);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v13 = v12;
      uint64_t v14 = @"sysdiagnose_helper returned empty for a HANDSHAKE";
    }

    [v12 log:v14];

    id v10 = 0LL;
LABEL_24:

    goto LABEL_25;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No connection with sysdiagnose_helper",  buf,  2u);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v11 log:@"No connection with sysdiagnose_helper"];

  id v10 = 0LL;
LABEL_25:

  return v10;
}

void sub_100021F88(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = 5LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Dumping stackshot with timeout of %ld seconds",  (uint8_t *)&v4,  0xCu);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  v2,  a1,  0LL,  0LL,  0LL,  5.0));

  if (v3)
  {
    [v3 setName:@"standalone-stackshot"];
    [v3 setRuntimeChecks:0];
    [v3 setBlockUntilFinished:1];
    [v3 execute];
  }
}

void sub_1000220B0(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "tailspin key chord pressed",  (uint8_t *)&buf,  2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 log:@"tailspin key chord pressed"];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  unsigned __int8 v4 = [v3 setUpDiagnosticID:v1];

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set up tailspinDiagnosticID with SDResourceManager.",  (uint8_t *)&buf,  2u);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v5 log:@"Failed to set up tailspinDiagnosticID with SDResourceManager."];
  }

  CFPreferencesAddSuitePreferencesToApp(kCFPreferencesCurrentApplication, @"com.apple.tailspin");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"TailspinKeychordTimeoutSeconds",  kCFPreferencesCurrentApplication,  0LL);
  if (AppIntegerValue) {
    uint64_t v7 = AppIntegerValue;
  }
  else {
    uint64_t v7 = 40LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Dumping tailspin with timeout of %ld seconds",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100022498;
  uint64_t v18 = sub_1000224A8;
  id v19 = 0LL;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000224B0;
  v12[3] = &unk_100089410;
  v12[4] = &buf;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  v8,  47LL,  0LL,  0LL,  v12,  (double)v7));

  if (v9)
  {
    [v9 setName:@"tailspin-keychord"];
    [v9 setBlockUntilFinished:1];
    [v9 setRuntimeChecks:0];
    [v9 execute];
  }

  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)uint64_t v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Done dumping tailspin to path '%@'",  v13,  0xCu);
    }

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Done dumping tailspin to path '%@'", *(void *)(*((void *)&buf + 1) + 40)];
LABEL_22:

    goto LABEL_23;
  }

  unlink((const char *)[0 fileSystemRepresentation]);
  if (sub_10004024C())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Tailspin keychord failed",  v13,  2u);
    }

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Tailspin keychord failed"];
    goto LABEL_22;
  }

LABEL_23:
  _Block_object_dispose(&buf, 8);
}

  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    [v38 closeArchive];
  }
}

    int v8 = v30;
  }
}

void sub_100022478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100022498(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000224A8(uint64_t a1)
{
}

void sub_1000224B0(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "resultPaths");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = sub_10002172C(v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 count];
    if (v8 == (id)1)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 firstObject]);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      __int16 v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }

    else
    {
      id v12 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        id v14 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "tailspin keychord task returned wrong number of paths (%ld)",  (uint8_t *)&v13,  0xCu);
      }
    }
  }
}

unint64_t sub_1000225C0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (!a1) {
    unint64_t v1 = sub_1000226D8();
  }
  if (v1 <= 0xC7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134218240;
      unint64_t v4 = v1;
      __int16 v5 = 2048;
      unint64_t v1 = 200LL;
      uint64_t v6 = 200LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Tailspin buffer size is %lu. Rounding up to minimum size cap of %lu",  (uint8_t *)&v3,  0x16u);
    }

    else
    {
      unint64_t v1 = 200LL;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    unint64_t v4 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Tailspin save size cap requested. Returning %lu",  (uint8_t *)&v3,  0xCu);
  }

  return v1;
}

uint64_t sub_1000226D8()
{
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v28 = 0LL;
  if (&_tailspin_config_free) {
    BOOL v0 = &_tailspin_buffer_size_get == 0LL;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || &_tailspin_config_create_with_current_state == 0LL)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_1000549EC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    uint64_t v10 = v26[3];
  }

  else
  {
    __int16 v11 = dispatch_group_create();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100024CA0;
    block[3] = &unk_100089568;
    block[4] = &v25;
    dispatch_group_async(v11, v13, block);

    dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_group_wait(v11, v14))
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_100054A20(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    uint64_t v10 = v26[3];
  }

  _Block_object_dispose(&v25, 8);
  return v10;
}

unint64_t sub_100022820(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (!a2)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_100054A90(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    unint64_t v2 = 1LL;
  }

  if (v2 <= a1)
  {
    unint64_t v12 = a1;
  }

  else
  {
    unint64_t v12 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a1;
      __int16 v16 = 2048;
      unint64_t v17 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got small tailspin buffer size of %lu. Rounding to minimum %lu",  (uint8_t *)&v14,  0x16u);
      unint64_t v12 = v2;
    }
  }

  if (!(v12 % v2)) {
    return v12;
  }
  if (v2 + v2 * (v12 / v2) >= v12) {
    v2 += v2 * (v12 / v2);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    unint64_t v15 = v12;
    __int16 v16 = 2048;
    unint64_t v17 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got non-standard tailspin buffer size of %lu. Rounding up to %lu",  (uint8_t *)&v14,  0x16u);
  }

  return v2;
}

unint64_t sub_10002298C(unint64_t a1)
{
  if (!a1) {
    a1 = sub_1000226D8();
  }
  return 10 * (sub_100022820(a1, 0x32uLL) / 0x32);
}

SDArchive *sub_1000229D4(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v9 = a2;
  if (a5) {
    unsigned int v10 = 3;
  }
  else {
    unsigned int v10 = 1;
  }
  if (a5) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = 0;
  }
  if (a4) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  id v13 = a3;
  int v14 = objc_alloc(&OBJC_CLASS___SDArchive);
  if ((a1 & 0x80000000) != 0) {
    unint64_t v15 = -[SDArchive initWithPath:withOptions:withName:](v14, "initWithPath:withOptions:withName:", v9, v12, v13);
  }
  else {
    unint64_t v15 = -[SDArchive initWithFD:withOptions:withName:](v14, "initWithFD:withOptions:withName:", a1, v12, v13);
  }
  __int16 v16 = v15;

  return v16;
}

id sub_100022A9C(int a1)
{
  if (a1 < 0)
  {
LABEL_7:
    unint64_t v2 = 0LL;
    return v2;
  }

  bzero(v6, 0x400uLL);
  if (fcntl(a1, 50, v6) == -1)
  {
    int v3 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054AC4(v3);
    }
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v4, "log:", @"Failed to get path from FD: %s", strerror(v3));

    goto LABEL_7;
  }

  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  return v2;
}

uint64_t sub_100022B98(int a1)
{
  if (a1 < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return fcntl(a1, 63);
  }
}

uint64_t sub_100022BAC(int a1, int a2)
{
  id v4 = sub_100022A9C(a1);
  id v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];

  id v7 = sub_100022A9C(a2);
  id v8 = objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 fileSystemRepresentation];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Falling back to creating new tarball at final location '%s'",  buf,  0xCu);
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "log:", @"Falling back to creating new tarball at final location '%s'", v9);

  if (lseek(a1, 0LL, 0) == -1)
  {
    int v12 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054B34((uint64_t)v6, (uint64_t)v9, v12);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v13,  "log:",  @"Failed to copy tarball '%s' to final location '%s'. Unable to lseek to start: %s",  v6,  v9,  strerror(v12));
    goto LABEL_13;
  }

  if (fcopyfile(a1, a2, 0LL, 0xFu) < 0)
  {
    int v14 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054BA8((uint64_t)v6, (uint64_t)v9, v14);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", @"Failed to copy tarball '%s' to final location '%s': %s", v6, v9, strerror(v14));
LABEL_13:
    uint64_t v11 = 0LL;
LABEL_14:

    goto LABEL_15;
  }

  if (unlink(v6) == -1)
  {
    int v16 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054C1C((int)v6, v16);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", @"Failed to unlink tarball '%s' after copy': %s", v6, strerror(v16));
    uint64_t v11 = 1LL;
    goto LABEL_14;
  }

  uint64_t v11 = 1LL;
LABEL_15:
  close(a2);
  return v11;
}

uint64_t sub_100022E38(const char *a1, int a2)
{
  if (a2) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      id v5 = "YES";
    }
    else {
      id v5 = "NO";
    }
    *(_DWORD *)__int128 buf = 136315394;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device unlocked since boot? %s. Will use protection class %d",  buf,  0x12u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v7 = v6;
  if (a2) {
    id v8 = "YES";
  }
  else {
    id v8 = "NO";
  }
  objc_msgSend(v6, "log:", @"Device unlocked since boot? %s. Will use protection class %d", v8, v4);

  uint64_t v9 = open_dprotected_np(a1, 536873474, v4, 0, 416LL);
  if ((_DWORD)v9 == -1)
  {
    int v10 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054C9C((uint64_t)a1, v10, v4);
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v11,  "log:",  @"Opening tarball file descriptor at %s with protection class %d failed: %s",  a1,  v4,  strerror(v10));
  }

  return v9;
}

uint64_t sub_100022FE4(void *a1, void *a2, unsigned int a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v35 = 0;
  [v10 fileExistsAtPath:v7 isDirectory:&v35];
  if (v35
    && ((id v11 = v9, (v12 = v11) != 0LL)
     || (id v13 = sub_1000229D4(0xFFFFFFFFLL, v8, &stru_10008D288, a3 & 1, (a3 >> 2) & 1),
         (int v12 = (void *)objc_claimAutoreleasedReturnValue(v13)) != 0LL)))
  {
    uint64_t v32 = 0LL;
    __int128 v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 tarQueue]);
    BOOL v15 = v11 == 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000233C0;
    block[3] = &unk_100089438;
    id v16 = v12;
    id v28 = v16;
    id v17 = v7;
    id v29 = v17;
    __int128 v30 = &v32;
    BOOL v31 = v15;
    dispatch_sync(v14, block);

    if ([v16 archiveStatus] == (id)1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Results written to %@",  buf,  0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v18 log:@"Results written to %@", v8];

      if ((a3 & 0x10) != 0) {
        [v10 removeItemAtPath:v17 error:0];
      }
    }

    else
    {
      id v20 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v16 archiveStatus];
        *(_DWORD *)__int128 buf = 134218242;
        id v37 = v21;
        __int16 v38 = 2112;
        id v39 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive failed with status %zd, output at %@",  buf,  0x16u);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v22 stdoutWrite:@"SDArchive failed with status %zd, output at %@", objc_msgSend(v16, "archiveStatus"), v17];

      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v23 log:@"SDArchive failed with status %zd, output at %@", objc_msgSend(v16, "archiveStatus"), v17];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 436LL));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  NSFileOwnerAccountName,  @"mobile",  NSFileGroupOwnerAccountName,  v24,  NSFilePosixPermissions,  0LL));

    [v10 setAttributes:v25 ofItemAtPath:v8 error:0];
    uint64_t v19 = *((unsigned int *)v33 + 6);

    _Block_object_dispose(&v32, 8);
  }

  else
  {
    uint64_t v19 = 0xFFFFFFFFLL;
  }

  return v19;
}

void sub_100023398( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

id sub_1000233C0(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  [v2 addDirectoryToArchive:v3 withDirName:v4];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) getProtectionClass];
  return [*(id *)(a1 + 32) finalizeArchiveAndClose:*(unsigned __int8 *)(a1 + 56)];
}

off_t sub_100023428(uint64_t a1)
{
  unint64_t v2 = (stat *)malloc(0x90uLL);
  int v3 = __error();
  if (v2)
  {
    uint64_t v4 = fstat(a1, v2);
    id v5 = __error();
    if ((_DWORD)v4)
    {
      int v6 = *v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109634;
        *(_DWORD *)id v13 = a1;
        *(_WORD *)&uint8_t v13[4] = 1024;
        *(_DWORD *)&v13[6] = v4;
        __int16 v14 = 2080;
        BOOL v15 = strerror(v6);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to stat %d with return code: %d, errno: %s",  buf,  0x18u);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v7, "log:", @"Failed to stat %d with return code: %d, errno: %s", a1, v4, strerror(v6));

      off_t st_size = 0LL;
    }

    else
    {
      off_t st_size = v2->st_size;
    }

    free(v2);
  }

  else
  {
    int v9 = *v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)id v13 = strerror(v9);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to malloc stat struct with errno: %s",  buf,  0xCu);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "log:", @"Failed to malloc stat struct with errno: %s", strerror(v9));

    return 0LL;
  }

  return st_size;
}

BOOL sub_100023608(FILE *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = sub_10002386C(a2);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_10002386C(v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:v14]);

  id v16 = [v15 count];
  BOOL v17 = (unint64_t)v16 > 1;
  if ((unint64_t)v16 < 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Non-matching paths passed to addFileToOutputSummary %@ - %@",  buf,  0x16u);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v19 log:@"Non-matching paths passed to addFileToOutputSummary %@ - %@", v11, v13];
  }

  else
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
    if (!v18)
    {
      BOOL v17 = 0LL;
      goto LABEL_9;
    }

    uint64_t v19 = (void *)v18;
    if (a1)
    {
      id v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"File: %@ -- size: %lld -- compressed: %lld\n", v18, a4, a5));
      fputs((const char *)[v20 UTF8String], a1);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218498;
        v24 = a4;
        __int16 v25 = 2048;
        uint64_t v26 = a5;
        __int16 v27 = 2112;
        id v28 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resource Usage: %lld bytes original and %lld compressed for '%@'",  buf,  0x20u);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v22 log:@"Resource Usage: %lld bytes original and %lld compressed for '%@'", a4, a5, v19];
    }
  }

LABEL_9:
  return v17;
}

id sub_10002386C(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"IN_PROGRESS_"]) {
    id v2 = (id)objc_claimAutoreleasedReturnValue( [v1 stringByReplacingOccurrencesOfString:@"IN_PROGRESS_" withString:&stru_10008D288]);
  }
  else {
    id v2 = v1;
  }
  int v3 = v2;

  return v3;
}

void sub_1000238CC(CFTimeInterval a1)
{
  if (dword_1000A5218)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempting to take sysdiagnose power assertion but an assertion is already held.",  buf,  2u);
    }

    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v1 log:@"Attempting to take sysdiagnose power assertion but an assertion is already held."];
  }

  else
  {
    IOPMAssertionID AssertionID = 0;
    uint64_t v3 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  @"com.apple.sysdiagnose",  @"sysdiagnose gathering diagnostics",  0LL,  0LL,  a1,  @"TimeoutActionTurnOff",  &AssertionID);
    if ((_DWORD)v3)
    {
      uint64_t v4 = v3;
      dword_1000A5218 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218240;
        CFTimeInterval v10 = a1;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d",  buf,  0x12u);
      }

      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v5,  "stdoutWrite:",  @"Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d",  *(void *)&a1,  v4);

      int v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v6,  "log:",  @"Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d",  *(void *)&a1,  v4);
    }

    else
    {
      dword_1000A5218 = AssertionID;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        CFTimeInterval v10 = a1;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Took power assertion for %.0f secs",  buf,  0xCu);
      }

      int v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v6, "log:", @"Took power assertion for %.0f secs", *(void *)&a1, v7);
    }
  }

void sub_100023B04(double a1)
{
  if (qword_1000A5220 != -1) {
    dispatch_once(&qword_1000A5220, &stru_100089458);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023BBC;
  block[3] = &unk_100089478;
  *(double *)&void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000A5228, block);
}

void sub_100023B90(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.sysdiagnose.power-assertions-queue", 0LL);
  id v2 = (void *)qword_1000A5228;
  qword_1000A5228 = (uint64_t)v1;
}

void sub_100023BBC(uint64_t a1)
{
}

void sub_100023BC4()
{
  if (dword_1000A5218)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v2 = dword_1000A5218;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Releasing sysdiagnose power assertion %u",  buf,  8u);
    }

    BOOL v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v0, "log:", @"Releasing sysdiagnose power assertion %u", dword_1000A5218);

    IOPMAssertionRelease(dword_1000A5218);
    dword_1000A5218 = 0;
  }

uint64_t sub_100023CA4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
  [v7 writeData:v11];

  return 1LL;
}

void sub_100023D7C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 reason]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Hit exception %@ %@. Error was %@."));

    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v19 log:@"%@"];
    }

    else if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@",  (uint8_t *)&buf,  0xCu);
    }

    if (v13)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
      [v13 writeData:v20];
    }

    objc_end_catch();
    JUMPOUT(0x100023D28LL);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_100023F2C()
{
  if (qword_1000A5238 != -1) {
    dispatch_once(&qword_1000A5238, &stru_100089498);
  }
  return byte_1000A5230;
}

void sub_100023F6C(id a1)
{
  byte_1000A5230 = OSAInMultiUserMode(a1);
}

id sub_100023F88(void *a1)
{
  id v1 = a1;
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pathSubmission]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v1]);

  return v4;
}

void sub_100023FF4(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 67109120;
    int v8 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sending SoundBoard notification: %d",  buf,  8u);
  }

  if (objc_opt_class(&OBJC_CLASS___SBSSysdiagnoseInterface, v2))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100024134;
    block[3] = &unk_1000894B8;
    char v6 = a1;
    dispatch_async(v4, block);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SBSSysdiagnoseInterface missing. Not invoking sysdiagnoseHasStarted",  buf,  2u);
  }

void sub_100024134(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SBSSysdiagnoseInterface);
  [v2 sysdiagnoseHasStarted:*(unsigned __int8 *)(a1 + 32)];
}

void *sub_100024174()
{
  if (qword_1000A5240 != -1) {
    dispatch_once(&qword_1000A5240, &stru_1000894D8);
  }
  return off_1000A4F60;
}

void sub_1000241B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose", "signpost");
  id v2 = off_1000A4F60;
  off_1000A4F60 = v1;
}

void *sub_1000241E4()
{
  if (qword_1000A5248 != -1) {
    dispatch_once(&qword_1000A5248, &stru_1000894F8);
  }
  return off_1000A4F68;
}

void sub_100024224(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose", "containers");
  id v2 = off_1000A4F68;
  off_1000A4F68 = v1;
}

uint64_t sub_100024254()
{
  return 0LL;
}

id sub_10002425C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    char v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"sysdiagnose_temp.XXXXXX"]);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  char v6 = @"sysdiagnose_temp.XXXXXX";
  if (v3)
  {
LABEL_3:
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v6]);

    char v6 = (__CFString *)v7;
  }

id sub_10002447C(void *a1)
{
  uint64_t v6 = 1LL;
  id v1 = a1;
  uint64_t v2 = container_system_group_path_for_identifier(0, [v1 UTF8String], &v6);
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
    free(v3);
  }

  else
  {
    container_get_error_description(v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054DF8();
    }
    id v4 = 0LL;
  }

  return v4;
}

id sub_100024534(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = container_query_create();
  uint64_t v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054E60((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_20;
  }

  container_query_set_class(v4, 7LL);
  container_query_operation_set_flags(v5, 0x100000002LL);
  id v6 = v3;
  xpc_object_t v7 = xpc_string_create((const char *)[v6 UTF8String]);
  container_query_set_group_identifiers(v5, v7);

  if (a2)
  {
    int v8 = getpwnam("mobile");
    if (v8) {
      uint64_t pw_uid = v8->pw_uid;
    }
    else {
      uint64_t pw_uid = 501LL;
    }
    if (!getpwuid(pw_uid))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100054ECC((uint64_t)v6, pw_uid);
      }
      goto LABEL_20;
    }

    container_query_set_uid(v5, pw_uid);
  }

  if (!container_query_get_single_result(v5))
  {
    uint64_t last_error = container_query_get_last_error(v5);
    uint64_t v20 = (void *)container_error_copy_unlocalized_description(last_error);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054F50();
    }
    goto LABEL_17;
  }

  uint64_t path = container_get_path();
  if (!path)
  {
    uint64_t v21 = container_query_get_last_error(v5);
    uint64_t v20 = (void *)container_error_copy_unlocalized_description(v21);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054FB8();
    }
LABEL_17:
    free(v20);
LABEL_20:
    uint64_t v18 = 0LL;
    goto LABEL_21;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", path));
LABEL_21:
  container_query_free(v5);

  return v18;
}

uint64_t sub_1000246EC(uint64_t a1)
{
  if (qword_1000A5250 != -1) {
    dispatch_once(&qword_1000A5250, &stru_100089518);
  }
  return qword_1000A5258 * a1;
}

void sub_10002473C(id a1)
{
  if (!mach_timebase_info(&info)) {
    qword_1000A5258 = info.numer / info.denom;
  }
}

char *sub_100024770(int a1)
{
  if (a1 == -1) {
    return 0LL;
  }
  proc_pid_rusage(a1, 5, buffer);
  return (char *)buffer[3] + (unint64_t)buffer[2];
}

unint64_t sub_1000247E0(uint64_t a1, uint64_t a2)
{
  unint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)a2 + *(void *)a1;
    int v5 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(a1 + 8);
    if (v5 > 0xF423F)
    {
      ++v4;
      v5 -= 1000000;
    }

    return (unint64_t)(float)((float)(unint64_t)(1000000000 * v4) + (float)(unint64_t)(1000LL * v5));
  }

  return result;
}

double sub_10002484C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v1[2](v1);

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:v2];
  double v5 = v4;

  return v5;
}

dispatch_source_s *sub_1000248CC(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = a2;
  double v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  (int)[v3 processIdentifier],  0x80000000uLL,  v4);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100024984;
  handler[3] = &unk_100088EA8;
  id v9 = v3;
  id v6 = v3;
  dispatch_source_set_registration_handler(v5, handler);

  return v5;
}

void sub_100024984(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v_Block_object_dispose(va, 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resuming process",  (uint8_t *)&v8,  2u);
  }

  if ([*(id *)(a1 + 32) resume])
  {
    uint64_t v2 = sub_100024174();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    double v4 = v3;
    double v5 = *(void **)(a1 + 32);
    if ((unint64_t)v5 + 1 >= 2 && os_signpost_enabled(v3))
    {
      xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 executionLine]);
      int v8 = 138412290;
      id v9 = v7;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v5,  "CLI Task",  "%@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) executionLine]);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error resuming process %@",  (uint8_t *)&v8,  0xCu);
  }

id sub_100024B10(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a2 stringByReplacingOccurrencesOfString:@" " withString:@"_"]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_task_failures.txt",  v4));

  v9[0] = v3;
  v9[1] = @"errors";
  v9[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 3LL));
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

  return v7;
}

id sub_100024C0C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  else {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

id sub_100024C88(void *a1, const char *a2)
{
  return [a1 stringByAppendingString:@" task"];
}

id sub_100024C94(void *a1, const char *a2)
{
  return [a1 stringByAppendingString:@" collection"];
}

void sub_100024CA0(uint64_t a1)
{
  uint64_t v2 = tailspin_config_create_with_current_state();
  if (v2)
  {
    uint64_t v3 = v2;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = tailspin_buffer_size_get();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stored system tailspin buffer size is %lu",  (uint8_t *)&v5,  0xCu);
    }

    tailspin_config_free(v3);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100055020();
  }

void sub_100024DEC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

char *sub_100024DFC@<X0>(int __errnum@<W2>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return strerror(__errnum);
}

void sub_1000250BC()
{
}

__CFString *sub_1000250D4()
{
  if ((sub_10004024C() & 1) != 0)
  {
    id v1 = (void *)MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
    if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString, v0), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    {
      uint64_t v3 = v1;
    }

    else
    {
      int v5 = (__CFString *)MGCopyAnswer(@"DeviceName", 0LL);

      if (!v5 || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6), (objc_opt_isKindOfClass(v5, v7) & 1) == 0))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9[0] = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Both kMGQUserAssignedDeviceName and kMGQDeviceName failed to get name. Returning empty device name",  (uint8_t *)v9,  2u);
        }

        int v8 = &stru_10008D288;
        goto LABEL_15;
      }

      uint64_t v3 = v5;
    }

    int v5 = v3;
    int v8 = v3;
LABEL_15:

    return v8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not AppleInternal. Returning empty device name",  buf,  2u);
  }

  return &stru_10008D288;
}

CFStringRef sub_100025220(uint64_t a1, uint64_t a2)
{
  if (objc_opt_class(&OBJC_CLASS___RPCompanionLinkClient, a2))
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    *(void *)uint64_t v18 = 0LL;
    uint64_t v19 = v18;
    uint64_t v20 = 0x2020000000LL;
    int v21 = 0;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    char v17 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100025528;
    v12[3] = &unk_1000896B8;
    uint64_t v14 = v16;
    uint64_t v15 = v18;
    uint64_t v3 = dispatch_semaphore_create(0LL);
    uint64_t v13 = v3;
    [v2 setLocalDeviceUpdatedHandler:v12];
    [v2 activateWithCompletion:&stru_1000896F8];
    dispatch_time_t v4 = dispatch_time(0LL, 500000000LL);
    if (dispatch_semaphore_wait(v3, v4) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for Rapport to fetch device role",  buf,  2u);
    }

    [v2 invalidate];
    int v5 = *((_DWORD *)v19 + 6);
    switch(v5)
    {
      case 1:
        uint64_t v6 = @"_L";
        goto LABEL_22;
      case 3:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          uint64_t v7 = "Found Rapport device role of RPMediaSystemRoleSolo: returning empty string";
          uint32_t v8 = 2;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
        }

        break;
      case 2:
        uint64_t v6 = @"_R";
LABEL_22:

        _Block_object_dispose(v16, 8);
        _Block_object_dispose(v18, 8);

        return v6;
      default:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v9 = *((_DWORD *)v19 + 6);
          if (v9 > 3) {
            uint64_t v10 = "?";
          }
          else {
            uint64_t v10 = off_100089770[v9];
          }
          *(_DWORD *)__int128 buf = 136315394;
          BOOL v23 = v10;
          __int16 v24 = 1024;
          unsigned int v25 = v9;
          uint64_t v7 = "Unexpected Rapport device role: '%s', %d";
          uint32_t v8 = 18;
          goto LABEL_20;
        }

        break;
    }

    uint64_t v6 = &stru_10008D288;
    goto LABEL_22;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPCompanionLinkClient SPI not found. Returning nothing for device role",  v18,  2u);
  }

  return &stru_10008D288;
}

void sub_1000254FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21)
{
}

uint64_t sub_100025528(uint64_t result, void *a2)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = result;
    *(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) = [a2 mediaSystemRole];
    *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 32));
  }

  return result;
}

id sub_10002558C(int a1)
{
  uint64_t v2 = sub_1000250D4();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @" /\\?%*|<>()"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByCharactersInSet:v4]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:&stru_10008D288]);

  else {
    id v7 = (id)a1;
  }
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:v7]);

  uint64_t v11 = sub_100025220(v9, v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:v12]);

  return v13;
}

id sub_100025678(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  a1));
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 open];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v2,  0LL,  0LL,  0LL));
    [v2 close];
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

id sub_1000256F0()
{
  return sub_100025678((uint64_t)@"/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist");
}

uint64_t sub_1000256FC()
{
  if (qword_1000A5268 != -1) {
    dispatch_once(&qword_1000A5268, &stru_100089718);
  }
  return byte_1000A5270;
}

void sub_10002573C(id a1)
{
  if (byte_1000A5270)
  {
    id v1 = 0LL;
    uint64_t v2 = 0LL;
  }

  else
  {
    id v3 = sub_100025678((uint64_t)@"/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist");
    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v2 = v4;
    if (v4)
    {
      id v1 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sysdiagnoseIgnoreKeychords"]);
      if (v1)
      {
        uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
        if ((objc_opt_isKindOfClass(v1, v6) & 1) != 0)
        {
          unsigned int v7 = [v1 BOOLValue];
          byte_1000A5270 = v7;
          if (v7)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v9 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnoseIgnoreKeychords is on",  v9,  2u);
            }

            uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v8 log:@"sysdiagnoseIgnoreKeychords is on"];
          }
        }
      }
    }

    else
    {
      id v1 = 0LL;
    }
  }
}

uint64_t sub_100025850()
{
  uint64_t result = sub_100020BE0();
  if ((_DWORD)result)
  {
    BOOL v1 = 0;
    sub_100040418(@"factoryDisable", @"com.apple.sysdiagnose", &v1);
    return v1;
  }

  return result;
}

void sub_100025898(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v9 = v1;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localGroupDictionary]);
    [v3 removeObjectForKey:v9];

    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 executionGroupDictionary]);
    uint64_t v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v9]);

    if (v6)
    {
      dispatch_group_leave(v6);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](&OBJC_CLASS___SystemDiagnosticIDS, "sharedInstance"));
      uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 executionGroupDictionary]);
      [v8 removeObjectForKey:v9];
    }

    id v1 = v9;
  }
}

void sub_100025974(void *a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([a1 diagnosticID]);
  sub_100025898(v1);
}

id sub_100025C9C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 tmpOutputDirectory]);

    if (v5) {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 tmpOutputDirectory]);
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"_"]);
  id v7 = sub_10002425C(v5, v6);
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = v8;
  if (sub_10004D6F4((const char *)[v9 fileSystemRepresentation], 0x1EDu))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000551AC((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v17 stderrWrite:@"Unable to set attributes on task temporary directory %@", v9];

    id v18 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v18 log:@"Unable to set attributes on task temporary directory %@", v9];
    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v4]);

    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v30 = NSFilePosixPermissions;
    BOOL v31 = &off_10009A468;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    id v29 = 0LL;
    unsigned __int8 v23 = [v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v22 error:&v29];
    id v18 = v29;

    if ((v23 & 1) != 0)
    {
      id v9 = v20;
      uint64_t v19 = v9;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055104((uint64_t)v20, v18);
      }
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
      [v24 stderrWrite:@"Could not create target location %@ with error %@", v20, v25];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
      [v26 log:@"Could not create target location %@ with error %@", v20, v27];

      uint64_t v19 = 0LL;
      id v9 = v20;
    }
  }

  return v19;
}

id sub_100025F78(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result execute];
  }
  return result;
}

id sub_100026258(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    [result addRulesFromHelperReply:a2];
    return [*(id *)(a1 + 32) execute];
  }

  return result;
}

void *sub_100026510(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = (void *)result[4];
    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithMutablePaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithMutablePaths:",  a2));
      uint64_t v6 = v4;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
      [v3 addRules:v5];

      return [(id)v2[4] execute];
    }
  }

  return result;
}

id sub_100027DF4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Collecting MultiTouch diagnostics",  buf,  2u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 stdoutWrite:@"Collecting MultiTouch diagnostics"];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v3 log:@"Collecting MultiTouch diagnostics"];

  if ([*(id *)(a1 + 32) pidForProcessName:@"mtrecorder.internal"] != -1
    || [*(id *)(a1 + 32) pidForProcessName:@"mtrecorder"] != -1)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MultiTouchDiagnostic);
    if (!-[MultiTouchDiagnostic runWithTimeout:](v4, "runWithTimeout:", 5.0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Timed out.",  buf,  2u);
      }

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v5 stdoutWrite:@"Timed out."];

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v6 log:@"Timed out."];
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v25 = [&off_10009A330 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint32_t v8 = 0LL;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(&off_10009A330);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v9,  1LL));
        NSURLResourceKey v37 = NSURLNameKey;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 enumeratorAtURL:v11 includingPropertiesForKeys:v12 options:6 errorHandler:&stru_1000897E0]);

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v14 = v13;
        id v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            id v18 = 0LL;
            do
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v18);
              uint64_t v20 = objc_autoreleasePoolPush();
              uint64_t v26 = 0LL;
              [v19 getResourceValue:&v26 forKey:NSURLNameKey error:0];
              if (v26)
              {
                int v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:"));
                [v7 addObject:v21];
              }

              objc_autoreleasePoolPop(v20);
              id v18 = (char *)v18 + 1;
            }

            while (v16 != v18);
            id v16 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }

          while (v16);
        }

        uint32_t v8 = (char *)v8 + 1;
      }

      while (v8 != v25);
      id v25 = [&off_10009A330 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }

    while (v25);
  }

  if ([v7 count]) {
    id v22 = v7;
  }
  else {
    id v22 = 0LL;
  }

  return v22;
}

BOOL sub_1000281E8(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)__int128 buf = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MultiTouch error %@",  buf,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  [v5 log:@"MultiTouch error %@", v6];

  return 1;
}

void sub_100028830(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"tailspin-save-ts-collection",  &stru_10008D288,  *(void *)(a1 + 32)));
  if (v2)
  {
    [v2 setMaximumSizeMB:sub_1000225C0(0)];
    uint64_t v6 = *(void *)(a1 + 40);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v3));
    id v7 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    [v2 addRules:v5];

    [v2 execute];
  }
}

void sub_100028D08(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"spindump-meta-collection",  &stru_10008D288,  *(void *)(a1 + 32)));
  id v3 = v2;
  if (v2)
  {
    [v2 setMaximumSizeMB:200];
    uint64_t v7 = *(void *)(a1 + 40);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v4));
    uint32_t v8 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [v3 addRules:v6];

    [v3 execute];
  }
}

  ;
}

void sub_1000291F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_19:
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v20 = [v19 tryStartRemoteInitiatedFlowForMsg:v8];

  if ((v20 & 1) == 0)
  {
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logSubsystem]);

    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
LABEL_25:

      xpc_remote_connection_cancel(v7);
      goto LABEL_26;
    }

    *(_DWORD *)__int128 buf = 138412290;
    __int128 v31 = v8;
    id v25 = "CSRemoteXPCProxy: Failed to start remote initiated flow. Cancelling connection for message: %@";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    goto LABEL_25;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100029BC4;
  v27[3] = &unk_100089138;
  __int128 v28 = v8;
  __int128 v29 = v7;
  dispatch_async(v22, v27);

LABEL_26:
}
}

void sub_100029BC4(uint64_t a1)
{
  id v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 gatherLocalSysdiagnoseForMsg:*(void *)(a1 + 32) withReply:v7]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  unsigned __int8 v5 = [v4 isHost];

  if ((v5 & 1) == 0)
  {
    if (v3) {
      +[CSRemoteXPCProxy remoteSendFile:toPeer:withTimeoutTarget:]( &OBJC_CLASS___CSRemoteXPCProxy,  "remoteSendFile:toPeer:withTimeoutTarget:",  v3,  *(void *)(a1 + 40),  0LL);
    }
    else {
      xpc_remote_connection_send_message(*(void *)(a1 + 40), v7);
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  [v6 endRemoteInitiatedFlow];
}

void sub_100029EF0(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  [v1 safeLeaveHostWaitGroup];
}

void sub_100029FF8(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if ((sub_10004024C() & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    void v8[2] = sub_10002A158;
    v8[3] = &unk_100089798;
    id v3 = v2;
    id v9 = v3;
    xpc_remote_connection_set_event_handler(v3, v8);
    xpc_remote_connection_activate(v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logSubsystem]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Connection started.",  buf,  2u);
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logSubsystem]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Current configuration prevents device from accepting RemoteXPC requests. Cancelling remote connection",  buf,  2u);
    }

    xpc_remote_connection_cancel(v2);
  }
}

void sub_10002A158(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logSubsystem]);

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Initiating remote connection",  buf,  2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:forMsg:isTrusted:]( &OBJC_CLASS___CSRemoteXPCProxy,  "handleRemoteConnection:forMsg:isTrusted:",  *(void *)(a1 + 32),  v3,  0LL);
  }

  else
  {
    if (v7)
    {
      *(_WORD *)uint32_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Cancelling remote connection",  v8,  2u);
    }

    xpc_remote_connection_cancel(*(void *)(a1 + 32));
  }
}

BOOL sub_10002A92C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 lowercaseString]);
  id v2 = [v1 rangeOfString:@"bridge"];

  return v2 != (id)0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_10002A970(uint64_t a1, int a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logSubsystem]);

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) fileSystemRepresentation];
      int v16 = 136315650;
      id v17 = v7;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2080;
      int v21 = strerror(a2);
      uint32_t v8 = "CSRemoteXPCProxy: File transfer failed to %s with error %d:%s";
      id v9 = v5;
      uint32_t v10 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, v10);
    }
  }

  else if (v6)
  {
    id v11 = [*(id *)(a1 + 32) fileSystemRepresentation];
    int v16 = 136315138;
    id v17 = v11;
    uint32_t v8 = "CSRemoteXPCProxy: File transfer succeeded to %s";
    id v9 = v5;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v12,  v13,  v14);
}

void sub_10002ADE4(uint64_t a1, int a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logSubsystem]);

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v10[0] = 67109378;
      v10[1] = a2;
      __int16 v11 = 2080;
      uint64_t v12 = strerror(a2);
      id v7 = "CSRemoteXPCProxy: File transfer failed with error %d:%s";
      uint32_t v8 = v5;
      uint32_t v9 = 18;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v10, v9);
    }
  }

  else if (v6)
  {
    LOWORD(v10[0]) = 0;
    id v7 = "CSRemoteXPCProxy: File transfer succeeded";
    uint32_t v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002B4FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v5 = type;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logSubsystem]);

    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == (const _xpc_type_s *)&_xpc_type_error)
    {
      if (v8)
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = 136315394;
        uint64_t v13 = v11;
        __int16 v14 = 2080;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        uint32_t v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with error: %s";
        goto LABEL_8;
      }
    }

    else if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 136315394;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      string = xpc_type_get_name(v5);
      uint32_t v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with event type: %s";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) safeLeaveRemoteGroup];
    [*(id *)(a1 + 32) cancelConnection];
    goto LABEL_10;
  }

  [*(id *)(a1 + 32) handleRemoteResponse:v3];
LABEL_10:
}

id sub_10002B990(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeLeaveRemoteGroup];
}

void sub_10002BCB4(id a1)
{
  dword_1000A5278 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

void sub_10002C358(void *a1)
{
  id v3 = 0LL;
  unsigned __int8 v1 = [a1 seekToOffset:0 error:&v3];
  id v2 = v3;
  if ((v1 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000556C8();
  }
}

void sub_10002CA40(_Unwind_Exception *a1)
{
}

void sub_10002CA84(uint64_t a1, char *a2)
{
  id v3 = *(FILE **)(a1 + 32);
  if (v3)
  {
    fputs(a2, v3);
    fputc(10, *(FILE **)(a1 + 32));
  }

  else
  {
    unsigned __int8 v5 = sub_1000241E4();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000557C0();
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v7,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"OSLOGCREATE Error: %s",  a2);
  }

uint64_t sub_10002CB38(uint64_t a1, uint64_t a2, const char *a3)
{
  BOOL v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([@"/" stringByAppendingString:v7]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingPathComponent:v8]);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    uint32_t v10 = sub_1000241E4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10005592C(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v19 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"logarchive block timedout."];

    LODWORD(v20) = 60;
    goto LABEL_16;
  }

  memset(&v62, 0, sizeof(v62));
  bzero(v63, 0x400uLL);
  if (fstat(a2, &v62))
  {
    uint64_t v20 = *__error();
    if (fcntl(a2, 50, v63) == -1) {
      sub_100055888();
    }
    int v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to stat temp fd: %s: %s (%d)",  v63,  strerror(v20),  v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = *(void *)(a1 + 56);
    goto LABEL_15;
  }

  if (sub_10004D508((uint64_t)&v62))
  {
    LODWORD(v20) = *__error();
    if (fcntl(a2, 50, v63) == -1) {
      sub_100055888();
    }
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to construct archive block for suspicious file: %s",  v63));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055820();
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v25 stderrWrite:@"%@", v24];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v26 log:@"%@", v24];

    uint64_t v23 = *(void *)(a1 + 56);
    id v22 = (void *)v24;
    goto LABEL_15;
  }

  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 72), 0LL, 4u))
    {
      uint64_t v30 = *(void *)(a1 + 56);
      __int128 v33 = __error();
      v54 = strerror(*v33);
      v55 = (char *)*__error();
      __int128 v32 = @"failed to copyfile on root node: %s (%d)";
      goto LABEL_26;
    }

    if (*(void *)(a1 + 76) && fchown(*(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1) {
      sub_100055888();
    }
    goto LABEL_51;
  }

  if ((v62.st_mode & 0xF000) == 0x4000)
  {
    if (mkdirat(*(_DWORD *)(a1 + 72), a3, 0x1FFu))
    {
      uint64_t v30 = *(void *)(a1 + 56);
      __int128 v31 = __error();
      v55 = strerror(*v31);
      uint64_t v56 = *__error();
      v54 = (char *)a3;
      __int128 v32 = @"failed to mkdir: %s: %s (%d)";
LABEL_26:
      uint64_t v20 = (uint64_t) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", v32, v54, v55, v56));
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, [(id)v20 UTF8String]);

      LODWORD(v20) = *__error();
      goto LABEL_16;
    }

    int v42 = sub_10004D644(*(_DWORD *)(a1 + 72), a3, 0);
    if (v42 == -1)
    {
      uint64_t v30 = *(void *)(a1 + 56);
      v53 = __error();
      v55 = strerror(*v53);
      uint64_t v56 = *__error();
      v54 = (char *)a3;
      __int128 v32 = @"failed to open: %s: %s (%d)";
      goto LABEL_26;
    }

    int v43 = v42;
    if (fcopyfile(a2, v42, 0LL, 4u))
    {
      v44 = __error();
      uint64_t v45 = *v44;
      uint64_t v46 = *(void *)(a1 + 56);
      v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to copyfile: %s: %s (%d)",  a3,  strerror(*v44),  v45);
      uint64_t v20 = (uint64_t) objc_claimAutoreleasedReturnValue(v47);
      (*(void (**)(uint64_t, id))(v46 + 16))(v46, [(id)v20 UTF8String]);

      close(v43);
      int v28 = 1;
      LODWORD(v20) = v45;
      goto LABEL_17;
    }

    if (*(void *)(a1 + 76) && fchown(v43, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1) {
      sub_100055888();
    }
    close(v43);
LABEL_51:
    LODWORD(v20) = 0;
    goto LABEL_16;
  }

  if (!strcmp(a3, "Info.plist")) {
    [*(id *)(a1 + 40) extractMetricsFromInfoPlist:a2];
  }
  uint64_t v34 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) archive]);
  if (v34
    && (char v35 = (void *)v34,
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) archive]),
        NSURLResourceKey v37 = (void *)objc_claimAutoreleasedReturnValue([v36 tarQueue]),
        v37,
        v36,
        v35,
        v37))
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) archive]);
    __int16 v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)v20 tarQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002D274;
    block[3] = &unk_100089950;
    id v39 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v58 = v39;
    id v59 = v8;
    id v60 = v9;
    int v61 = a2;
    dispatch_sync(v38, block);
  }

  else
  {
    id v40 = v9;
    int v41 = sub_10004D5C8((const char *)[v40 fileSystemRepresentation], 2, 0x1B6u);
    if (v41 == -1)
    {
      LODWORD(v20) = *__error();
      uint64_t v48 = *(void *)(a1 + 56);
      id v49 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"failed to open %@", v40));
      (*(void (**)(uint64_t, id))(v48 + 16))(v48, [v49 UTF8String]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000558A0((uint64_t)v40, v20);
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v50 stderrWrite:@"Unable to create file %@: %s", v40, strerror(v20)];

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v51 log:@"Unable to create file %@: %s", v40, strerror(v20)];

      goto LABEL_16;
    }

    LODWORD(v20) = v41;
    if (fcopyfile(a2, v41, 0LL, 0xEu) < 0)
    {
      LODWORD(v20) = *__error();
      uint64_t v23 = *(void *)(a1 + 56);
      v52 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"error writing file %@ - %s",  v40,  strerror(v20));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v52);
LABEL_15:
      id v27 = v22;
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, [v27 UTF8String]);

LABEL_16:
      int v28 = 1;
      goto LABEL_17;
    }

    close(v20);
  }

  int v28 = 0;
LABEL_17:

  objc_autoreleasePoolPop(v6);
  if (v28) {
    return v20;
  }
  else {
    return 0LL;
  }
}

void sub_10002D274(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) destination]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:*(void *)(a1 + 40)]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:*(void *)(a1 + 48)]);
  unsigned __int8 v5 = -[SDArchiveFile initWithPath:target:ofType:]( objc_alloc(&OBJC_CLASS___SDArchiveFile),  "initWithPath:target:ofType:",  *(void *)(a1 + 56),  v4,  NSFileTypeRegular);
  -[SDArchiveFile setFd:](v5, "setFd:", *(unsigned int *)(a1 + 64));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archive]);
  [v6 addArchiveFile:v5];
}

uint64_t sub_10002D340(void *a1)
{
  uint64_t result = OSLogConstructArchive(a1[5], a1[6], a1[7]);
  *(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10002D374(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t sub_10002D638(int *a1)
{
  return _os_assumes_log(*a1);
}

void sub_10002D640(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_10002D64C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = sub_100020E74(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a1;
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received keycode: %x with name: %@",  buf,  0x12u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  unsigned __int8 v5 = sub_100020E74(a1);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 stdoutWrite:@"Received keycode: %x with name: %@", a1, v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  BOOL v8 = sub_100020E74(a1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 log:@"Received keycode: %x with name: %@", a1, v9];

  kdebug_trace(27525122LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)a1 == 48)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v10 = sub_100020E74(48);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "sysdiagnose (stackshot only)";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "request: %s keychord: %@",  buf,  0x16u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v13 = sub_100020E74(48);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v12 stdoutWrite:@"request: %s keychord: %@", "sysdiagnose (stackshot only)", v14];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v16 = sub_100020E74(48);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v15 log:@"request: %s keychord: %@", "sysdiagnose (stackshot only)", v17];

    if (sub_1000256FC())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Keychord ignored due to settings.",  buf,  2u);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v18 stdoutWrite:@"Keychord ignored due to settings."];

      int v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      -[dispatch_semaphore_s log:](v19, "log:", @"Keychord ignored due to settings.");
    }

    else
    {
      if (!sub_100025850())
      {
        __int128 v36 = (dispatch_semaphore_s *)os_transaction_create("sysdiagnose (stackshot only)");
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
        __int16 v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        *(void *)__int128 buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100030B8C;
        v72 = &unk_100089A08;
        v73 = v36;
        LODWORD(v74) = 48;
        int v19 = v36;
        dispatch_async(v38, buf);

        uint64_t v23 = 0LL;
        goto LABEL_28;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE",  buf,  2u);
      }

      int v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      -[dispatch_semaphore_s log:]( v19,  "log:",  @"Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE");
    }

    uint64_t v23 = 5LL;
LABEL_28:

    return v23;
  }

  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((a1 & 0x80000000) != 0)
  {
    if (v20)
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "default case hit for keycode: %x. Running full diagnostic",  buf,  8u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v24, "stdoutWrite:", @"default case hit for keycode: %x. Running full diagnostic", a1);

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v25, "log:", @"default case hit for keycode: %x. Running full diagnostic", a1);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = sub_100020E74(a1);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "sysdiagnose (full)";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "request: %s keychord: %@",  buf,  0x16u);
    }

    int v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    __int128 v29 = sub_100020E74(a1);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    [v28 stdoutWrite:@"request: %s keychord: %@", "sysdiagnose (full)", v30];

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    __int128 v32 = sub_100020E74(a1);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    [v31 log:@"request: %s keychord: %@", "sysdiagnose (full)", v33];

    if (sub_1000256FC())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Keychord ignored due to settings.",  buf,  2u);
      }

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v34 stdoutWrite:@"Keychord ignored due to settings."];

      char v35 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      -[SystemDiagnosticiOS log:](v35, "log:", @"Keychord ignored due to settings.");
    }

    else
    {
      if (!sub_100025850())
      {
        if (sub_10004024C())
        {
          if (objc_opt_class(&OBJC_CLASS___TapToRadarService, v39))
          {
            *(void *)v67 = 0LL;
            v68 = v67;
            uint64_t v69 = 0x2020000000LL;
            char v70 = 0;
            dispatch_semaphore_t v40 = dispatch_semaphore_create(0LL);
            int v41 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
            *(void *)__int128 buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 3221225472LL;
            *(void *)&uint8_t buf[16] = sub_100030E8C;
            v72 = &unk_100089A30;
            v74 = v67;
            int v42 = v40;
            v73 = v42;
            [v41 performSysdiagnoseKeychordEventWithCompletionHandler:buf];

            dispatch_time_t v43 = dispatch_time(0LL, 3500000000LL);
            if (dispatch_semaphore_wait(v42, v43))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v66 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord",  v66,  2u);
              }

              v44 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v44 stdoutWrite:@"Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"];

              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v45 log:@"Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"];
            }

            BOOL v46 = v68[24] == 0;

            _Block_object_dispose(v67, 8);
            if (!v46)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Keychord is being handled by ttr. Terminating and waiting to be invoked through DE",  buf,  2u);
              }

              v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v47 stdoutWrite:@"Keychord is being handled by ttr. Terminating and waiting to be invoked through DE"];

              char v35 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              -[SystemDiagnosticiOS log:]( v35,  "log:",  @"Keychord is being handled by ttr. Terminating and waiting to be invoked through DE");
              uint64_t v23 = 0LL;
              goto LABEL_53;
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v67 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TapToRadarKit framework is not available",  v67,  2u);
            }

            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v48 stdoutWrite:@"TapToRadarKit framework is not available"];

            id v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v49 log:@"TapToRadarKit framework is not available"];
          }
        }

        char v35 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticiOS);
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v35, "diagnosticID"));
        unsigned int v52 = [v50 checkAndIncreaseDiagnosticCountForDiagnosticID:v51 collectingLocalLogs:1];

        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v53 setCurrentClient:@"KEYCHORD"];

          v54 = (dispatch_semaphore_s *)os_transaction_create("sysdiagnose (full)");
          dispatch_queue_global_t v55 = dispatch_get_global_queue(25LL, 0LL);
          uint64_t v56 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v55);
          *(void *)__int128 buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&uint8_t buf[16] = sub_100030D7C;
          v72 = &unk_100089138;
          v73 = v54;
          v74 = v35;
          v57 = v54;
          dispatch_async(v56, buf);

          uint64_t v23 = 0LL;
          id v58 = v73;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v59 = sub_100020E74(a1);
            id v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v60;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose already in progress - ignoring keychord %@",  buf,  0xCu);
          }

          int v61 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          stat v62 = sub_100020E74(a1);
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          [v61 stdoutWrite:@"sysdiagnose already in progress - ignoring keychord %@", v63];

          v57 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v64 = sub_100020E74(a1);
          id v58 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v64);
          -[dispatch_semaphore_s log:]( v57,  "log:",  @"sysdiagnose already in progress - ignoring keychord %@",  v58);
          uint64_t v23 = 5LL;
        }

        goto LABEL_53;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE",  buf,  2u);
      }

      char v35 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      -[SystemDiagnosticiOS log:]( v35,  "log:",  @"Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE");
    }

    uint64_t v23 = 5LL;
LABEL_53:

    return v23;
  }

  if (v20)
  {
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unexpected keycode: %x. Not running full diagnostic",  buf,  8u);
  }

  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v21, "stdoutWrite:", @"unexpected keycode: %x. Not running full diagnostic", a1);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v22, "log:", @"unexpected keycode: %x. Not running full diagnostic", a1);

  return 4LL;
}

void sub_10002E184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

uint64_t sub_10002E1A4(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 | a3[1] | a3[2] | a3[3]) {
    return 5LL;
  }
  else {
    return sub_10002D64C(a2);
  }
}

uint64_t sub_10002E1CC()
{
  return 46LL;
}

uint64_t sub_10002E1D4()
{
  kern_return_t v0;
  dispatch_queue_attr_t v1;
  dispatch_queue_attr_s *v2;
  dispatch_queue_s *v3;
  dispatch_source_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  integer_t port_info[20];
  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port)) {
    sub_1000559DC(&v9, port_info);
  }
  if (bootstrap_check_in(bootstrap_port, "com.apple.sysdiagnose.kernel.ipc", (mach_port_t *)&dword_1000A5290)) {
    sub_100055960(&v9, port_info);
  }
  port_info[0] = 16;
  uint64_t v0 = mach_port_set_attributes(mach_task_self_, dword_1000A5290, 1, port_info, 1u);
  if (v0) {
    _os_assumes_log(v0);
  }
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = dispatch_queue_create("Sysdiagnose MIG RECV Queue", v2);
  id v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  dword_1000A5290,  0LL,  v3);
  unsigned __int8 v5 = (void *)qword_1000A5288;
  qword_1000A5288 = (uint64_t)v4;

  dispatch_source_set_cancel_handler((dispatch_source_t)qword_1000A5288, &stru_1000899C0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000A5288, &stru_1000899E0);
  dispatch_resume((dispatch_object_t)qword_1000A5288);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MIG server initialized.",  (uint8_t *)&v9,  2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v6 stdoutWrite:@"MIG server initialized."];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v7 log:@"MIG server initialized."];

  return 0LL;
}

void sub_10002E3D0(id a1)
{
  kern_return_t v1;
  uint64_t v1 = mach_port_mod_refs(mach_task_self_, dword_1000A5290, 1u, -1);
  if (v1) {
    _os_assumes_log(v1);
  }
}

void sub_10002E410(id a1)
{
  int v1 = dispatch_mig_server(qword_1000A5288, 36LL, sub_100053790);
  if (v1) {
    _os_assumes_log(v1);
  }
}

void sub_10002E448(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v3 = (id)objc_claimAutoreleasedReturnValue([v2 diagnosticObjectForDiagnosticID:v1]);

    [v3 waitUntilComplete:2400];
  }

void sub_10002E4B8(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Remote XPC Stackshot: stackshot only",  buf,  2u);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v9 = v8;
    uint32_t v10 = @"Remote XPC Stackshot: stackshot only";
  }

  else
  {
    if (v7)
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC: stackshot only",  v12,  2u);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v9 = v8;
    uint32_t v10 = @"XPC: stackshot only";
  }

  [v8 stdoutWrite:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v11 log:v10];

  sub_100021F88(40LL);
  xpc_dictionary_set_uint64(v6, "RESPONSE_TYPE", 1uLL);
}

id sub_10002E5FC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_100055BB0(v259, buf);
  }
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v6, "REQUEST_TYPE");
  uint64_t v9 = sub_100020FB4(uint64);
  uint32_t v10 = (char *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v252 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received request of type '%@'",  buf,  0xCu);
  }

  if (!v5)
  {
    uint64_t v11 = xpc_copy_description(v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v252 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received Remote request: %s",  buf,  0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "log:", @"Received Remote request: %s", v11);

    free(v11);
  }

  xpc_dictionary_set_uint64(v7, "REQUEST_TYPE", uint64);
  xpc_dictionary_set_uint64(v7, "MSG_TYPE", 2uLL);
  switch(uint64)
  {
    case 1u:
      uint64_t v13 = (_xpc_connection_s *)v5;
      id v220 = v6;
      id v14 = v6;
      id v15 = v7;
      id v223 = v5;
      xdict = v14;
      if (!v5)
      {
        v108 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v108 setPossibleClient:@"REMOTE"];

        unsigned __int16 v109 = 5;
        goto LABEL_121;
      }

      uint64_t v16 = v10;
      id v17 = v7;
      if (xpc_dictionary_get_BOOL(v14, "SDRequestSourceShell")) {
        __int16 v18 = 2;
      }
      else {
        __int16 v18 = 3;
      }
      unsigned __int16 obj = v18;
      uint64_t pid = xpc_connection_get_pid(v13);
      unsigned int v20 = proc_pidinfo(pid, 3, 0LL, buf, 136);
      int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v255));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v22 setPossibleClient:v21];

      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v20 > 0x87)
      {
        if (v23)
        {
          *(_DWORD *)v259 = 136446466;
          *(void *)&v259[4] = v255;
          *(_WORD *)&v259[12] = 1024;
          *(_DWORD *)&v259[14] = pid;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose request from %{public}s (%d)",  v259,  0x12u);
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend(v24, "log:", @"Sysdiagnose request from %{public}s (%d)", v255, pid);
      }

      else
      {
        if (v23)
        {
          *(_DWORD *)v259 = 67109120;
          *(_DWORD *)&v259[4] = pid;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to obtain requestor process name. Pid is %d",  v259,  8u);
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend(v24, "log:", @"Failed to obtain requestor process name. Pid is %d", pid, v216);
      }

      id v7 = v17;

      v114 = xdict;
      xpc_dictionary_set_int64(xdict, "clientPID", (int)pid);
      uint32_t v10 = v16;
      if ((sub_100021848(pid) & 1) != 0
        || (sub_10003FFAC(v13, @"com.apple.private.sysdiagnose.internal") & 1) != 0)
      {
        unsigned __int16 v109 = obj;
        goto LABEL_121;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v259 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Peer is not allowed",  v259,  2u);
      }

      v165 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v165 log:@"Peer is not allowed"];

      xpc_dictionary_set_string(xdict, "warnProcAllowlist", v255);
      unsigned __int16 v109 = obj;
      if (sub_10004024C())
      {
LABEL_121:
        id v226 = v7;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v115 = (const char *)[@"XPC: sysdiagnose (full)" UTF8String];
          *(_DWORD *)__int128 buf = 136315138;
          v252 = v115;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }

        v116 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend(v116, "stdoutWrite:", @"%s", objc_msgSend(@"XPC: sysdiagnose (full)", "UTF8String"));

        v117 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend(v117, "log:", @"%s", objc_msgSend(@"XPC: sysdiagnose (full)", "UTF8String"));

        BOOL v118 = xpc_dictionary_get_BOOL(xdict, "getMetrics");
        *(void *)&__int128 v247 = 0LL;
        *(void *)&__int128 v243 = 0LL;
        if (v118)
        {
          *(void *)v256 = 0LL;
          v119 = (id *)v256;
          id v120 = sub_100030FF4(v109, xdict, (id *)&v243, (uint64_t *)&v247, v256);
          v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
          id v122 = (id)v243;
        }

        else
        {
          v119 = (id *)&v243;
          id v123 = sub_100030FF4(v109, xdict, 0LL, (uint64_t *)&v247, &v243);
          v121 = (void *)objc_claimAutoreleasedReturnValue(v123);
          id v122 = 0LL;
        }

        id v124 = *v119;
        unint64_t v125 = v247;
        if ((unint64_t)v247 <= 0xE)
        {
          if (((1LL << v247) & 0x7252) != 0)
          {
            v126 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v126 decreaseDiagnosticCountForDiagnosticID:v124];
          }

          else if (!(void)v247)
          {
            id v111 = v121;
            xpc_dictionary_set_string(v15, "path", (const char *)[v111 cStringUsingEncoding:4]);
            if (v122) {
              BOOL v168 = v118;
            }
            else {
              BOOL v168 = 0;
            }
            if (v168)
            {
              objb = v13;
              v231 = v10;
              v169 = (void *)objc_claimAutoreleasedReturnValue([v122 allKeys]);
              memset(v259, 0, sizeof(v259));
              __int128 v260 = 0u;
              __int128 v261 = 0u;
              id v170 = [v169 countByEnumeratingWithState:v259 objects:buf count:16];
              if (v170)
              {
                id v171 = v170;
                uint64_t v172 = **(void **)&v259[16];
                do
                {
                  for (i = 0LL; i != v171; i = (char *)i + 1)
                  {
                    if (**(void **)&v259[16] != v172) {
                      objc_enumerationMutation(v169);
                    }
                    v174 = *(void **)(*(void *)&v259[8] + 8LL * (void)i);
                    v175 = (void *)objc_claimAutoreleasedReturnValue([v122 objectForKey:v174]);
                    v176 = (const char *)[v174 UTF8String];
                    [v175 doubleValue];
                    xpc_dictionary_set_double(v15, v176, v177);
                  }

                  id v171 = [v169 countByEnumeratingWithState:v259 objects:buf count:16];
                }

                while (v171);
              }

              uint32_t v10 = v231;
              uint64_t v13 = objb;
            }

            xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 1uLL);

            goto LABEL_130;
          }
        }

        xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 2uLL);
        v127 = sub_100020398(v125);
        id v128 = objc_claimAutoreleasedReturnValue(v127);
        xpc_dictionary_set_string(v15, "error", (const char *)[v128 UTF8String]);

        id v111 = 0LL;
LABEL_130:
        id v7 = v226;
        v114 = xdict;
        goto LABEL_131;
      }

      v166 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v166 decreaseDiagnosticCount];

      xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 2uLL);
      v167 = sub_100020398(0xFuLL);
      id v124 = objc_claimAutoreleasedReturnValue(v167);
      xpc_dictionary_set_string(v15, "error", (const char *)[v124 UTF8String]);
      id v111 = 0LL;
LABEL_131:

      id v6 = v220;
      id v5 = v223;
      goto LABEL_105;
    case 2u:
      sub_10002E4B8(v6, v7, v5 == 0LL);
      goto LABEL_104;
    case 4u:
      v228 = v10;
      uint64_t v26 = (_xpc_connection_s *)v5;
      id v27 = v7;
      if (v5)
      {
        int v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unsigned __int8 v29 = [v28 areDiagnosticsInFlight];

        if ((v29 & 1) != 0)
        {
          uint64_t v30 = xpc_connection_get_pid(v26);
          int v31 = v30;
          unsigned int v32 = sub_100021A94(v30);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 67109120;
            LODWORD(v252) = v31;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Server received programmatic cancel request from peer with pid %d.",  buf,  8u);
          }

          if (v32 && sub_10004024C())
          {
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue([v33 getCurrentInflightLocalDiagnostic]);

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              v252 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Peer is TTR - using in-flight diagnostic with ID %@",  buf,  0xCu);
            }
          }

          else
          {
            v156 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v31));
            uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue([v156 getDiagnosticIDForPid:v157]);
          }

          if (v34)
          {
            v158 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v158 registerActivityWithID:v34];

            v159 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v159 cancelAll:v34];

            +[SDTaskDepot signalStopTasks](&OBJC_CLASS___SDTaskDepot, "signalStopTasks");
            v160 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v160 closeSysdiagnoseLog];

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Waiting for sysdiagnose to cleanup",  buf,  2u);
            }

            v161 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v161 stdoutWrite:@"Waiting for sysdiagnose to cleanup"];

            v162 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v162 log:@"Waiting for sysdiagnose to cleanup"];

            v163 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            v164 = (void *)objc_claimAutoreleasedReturnValue([v163 diagnosticObjectForDiagnosticID:v34]);

            if ([v164 waitUntilComplete:60])
            {
              xpc_dictionary_set_uint64(v27, "RESPONSE_TYPE", 1uLL);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose took too long to cancel.",  buf,  2u);
              }

              v185 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v185 stdoutWrite:@"Sysdiagnose took too long to cancel."];

              v186 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v186 log:@"Sysdiagnose took too long to cancel."];

              sub_10003077C(v27, 8uLL);
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Goodbye!",  buf,  2u);
            }

            v187 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v187 stdoutWrite:@"Goodbye!"];

            v188 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v188 log:@"Goodbye!"];
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No diagnostic is associated with client - abort cancellation.",  buf,  2u);
            }

            sub_10003077C(v27, 0xAuLL);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Server received programmatic cancel request when no sysdiagnose in flight.",  buf,  2u);
          }

          sub_10003077C(v27, 7uLL);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancel operation not implemented",  buf,  2u);
        }

        v110 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v110 log:@"Cancel operation not implemented"];

        sub_10003077C(v27, 9uLL);
      }

      id v111 = 0LL;
      uint32_t v10 = v228;
      goto LABEL_105;
    case 5u:
      id v35 = v7;
      BOOL v36 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (!v5)
      {
        if (v36)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CancelAll operation not implemented",  buf,  2u);
        }

        BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v47 = v46;
        uint64_t v48 = @"CancelAll operation not implemented";
        goto LABEL_100;
      }

      if (v36)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Server received cancelAll request.",  buf,  2u);
      }

      NSURLResourceKey v37 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v37 clearAllResources];

      +[SDTaskDepot signalStopTasks](&OBJC_CLASS___SDTaskDepot, "signalStopTasks");
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v39 = [v38 numberDiagnosticsInflight];

      if (!v39)
      {
        xpc_dictionary_set_uint64(v35, "RESPONSE_TYPE", 1uLL);
        goto LABEL_103;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "There are still sysdiagnoses in-flight after cancellation.",  buf,  2u);
      }

      dispatch_semaphore_t v40 = v35;
      uint64_t v41 = 3LL;
      goto LABEL_102;
    case 6u:
      id v42 = v7;
      id v35 = v42;
      if (v5)
      {
        xpc_dictionary_set_uint64(v42, "RESPONSE_TYPE", 1uLL);
        +[SDTaskDepot signalInterrupt](&OBJC_CLASS___SDTaskDepot, "signalInterrupt");
        goto LABEL_103;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "UserInterrupt operation not implemented",  buf,  2u);
      }

      BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v47 = v46;
      uint64_t v48 = @"UserInterrupt operation not implemented";
LABEL_100:
      [v46 log:v48];

      goto LABEL_101;
    case 7u:
      id v35 = v7;
      if (v5)
      {
        dispatch_time_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unsigned int v44 = [v43 areDiagnosticsInFlight];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109120;
          LODWORD(v252) = v44;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Polling sysdiagnose status: %d",  buf,  8u);
        }

        xpc_dictionary_set_uint64(v35, "RESPONSE_TYPE", 1uLL);
        if (v44) {
          uint64_t v45 = "Running";
        }
        else {
          uint64_t v45 = "Idle";
        }
        xpc_dictionary_set_string(v35, "status", v45);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Status Poll not implemented",  buf,  2u);
        }

LABEL_101:
        dispatch_semaphore_t v40 = v35;
        uint64_t v41 = 9LL;
LABEL_102:
        sub_10003077C(v40, v41);
      }

LABEL_103:
      goto LABEL_104;
    case 8u:
      id v35 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Airdrop not implemented",  buf,  2u);
      }

      BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v47 = v46;
      uint64_t v48 = @"Airdrop not implemented";
      goto LABEL_100;
    case 9u:
      id v35 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "watchlist not implemented",  buf,  2u);
      }

      BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v47 = v46;
      uint64_t v48 = @"watchlist not implemented";
      goto LABEL_100;
    case 0xAu:
      id v49 = v6;
      id v50 = v7;
      unsigned int v52 = v50;
      if (v5)
      {
        id v218 = v50;
        id v225 = v7;
        v229 = v10;
        uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v51);
        uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSArray, v54);
        uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString, v56);
        uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSNull, v58);
        int v61 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v53,  v55,  v57,  v59,  objc_opt_class(&OBJC_CLASS___NSNumber, v60),  0LL);
        uint64_t v62 = objc_claimAutoreleasedReturnValue(v61);
        *(void *)v259 = 0LL;
        data = xpc_dictionary_get_data(v49, "detail", (size_t *)v259);
        v219 = (void *)v62;
        if (data
          && (uint64_t v64 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  data,  *(void *)v259))) != 0)
        {
          v65 = (void *)v64;
          id v241 = 0LL;
          v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v62,  v64,  &v241));
          id v67 = v241;
          v68 = v67;
          if (!v66)
          {
            unsigned int v52 = v218;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v189 = (void *)objc_claimAutoreleasedReturnValue([v68 localizedDescription]);
              *(_DWORD *)__int128 buf = 136315394;
              v252 = "detail";
              __int16 v253 = 2112;
              id v254 = v189;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error fetching key '%s': %@",  buf,  0x16u);
            }

            v190 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            v191 = (void *)objc_claimAutoreleasedReturnValue([v68 localizedDescription]);
            [v190 log:@"Error fetching key '%s': %@", "detail", v191];

            v66 = 0LL;
            uint32_t v10 = v229;
            goto LABEL_85;
          }

          uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSArray, v69);
          uint32_t v10 = v229;
          if ((objc_opt_isKindOfClass(v66, v70) & 1) != 0)
          {
            id v71 = v66;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315394;
              v252 = "detail";
              __int16 v253 = 2112;
              id v254 = v71;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting %s to %@",  buf,  0x16u);
            }

            id v217 = v49;
            id v221 = v6;
            id v224 = v5;
            v72 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v72 log:@"Setting %s to %@", "detail", v71];

            id v73 = v71;
            v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            v74 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v247 = 0u;
            __int128 v248 = 0u;
            __int128 v249 = 0u;
            __int128 v250 = 0u;
            id v75 = v73;
            id v76 = [v75 countByEnumeratingWithState:&v247 objects:buf count:16];
            id obja = v75;
            if (v76)
            {
              id v77 = v76;
              v78 = 0LL;
              uint64_t v79 = *(void *)v248;
              do
              {
                v80 = 0LL;
                v81 = v78;
                do
                {
                  if (*(void *)v248 != v79) {
                    objc_enumerationMutation(obja);
                  }
                  v82 = *(void **)(*((void *)&v247 + 1) + 8LL * (void)v80);
                  v83 = (void *)objc_claimAutoreleasedReturnValue( +[SDCacheEnumerator sysdiagnoseDirectory]( &OBJC_CLASS___SDCacheEnumerator,  "sysdiagnoseDirectory"));
                  v84 = (void *)objc_claimAutoreleasedReturnValue([v82 lastPathComponent]);
                  v78 = (void *)objc_claimAutoreleasedReturnValue([v83 stringByAppendingPathComponent:v84]);

                  -[NSMutableArray addObject:](v74, "addObject:", v78);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v256 = 138412290;
                    *(void *)&v256[4] = v78;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "File to delete: %@",  v256,  0xCu);
                  }

                  v85 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v85 log:@"File to delete: %@", v78];

                  v80 = (char *)v80 + 1;
                  v81 = v78;
                }

                while (v77 != v80);
                id v75 = obja;
                id v77 = [obja countByEnumeratingWithState:&v247 objects:buf count:16];
              }

              while (v77);
            }

            else
            {
              v78 = 0LL;
            }

            __int128 v245 = 0u;
            __int128 v246 = 0u;
            __int128 v243 = 0u;
            __int128 v244 = 0u;
            v192 = v74;
            id v193 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v192,  "countByEnumeratingWithState:objects:count:",  &v243,  v259,  16LL);
            if (v193)
            {
              id v194 = v193;
              id v195 = 0LL;
              uint64_t xdictb = *(void *)v244;
              char v196 = 1;
              v197 = v232;
              v234 = v192;
              do
              {
                v198 = 0LL;
                v199 = v195;
                do
                {
                  if (*(void *)v244 != xdictb) {
                    objc_enumerationMutation(v234);
                  }
                  uint64_t v200 = *(void *)(*((void *)&v243 + 1) + 8LL * (void)v198);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v256 = 138412290;
                    *(void *)&v256[4] = v200;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deleting element: %@",  v256,  0xCu);
                  }

                  v201 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v201 log:@"Deleting element: %@", v200];

                  id v242 = v199;
                  unsigned __int8 v202 = [v197 removeItemAtPath:v200 error:&v242];
                  id v195 = v242;

                  if ((v202 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      v203 = (void *)objc_claimAutoreleasedReturnValue([v195 localizedDescription]);
                      *(_DWORD *)v256 = 138412546;
                      *(void *)&v256[4] = v200;
                      __int16 v257 = 2112;
                      v258 = v203;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error deleting element at %@ for reason %@",  v256,  0x16u);
                    }

                    v204 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                    v205 = (void *)objc_claimAutoreleasedReturnValue([v195 localizedDescription]);
                    [v204 log:@"Error deleting element at %@ for reason %@", v200, v205];

                    v197 = v232;
                  }

                  v196 &= v202;
                  v198 = (char *)v198 + 1;
                  v199 = v195;
                }

                while (v194 != v198);
                id v194 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v234,  "countByEnumeratingWithState:objects:count:",  &v243,  v259,  16LL);
              }

              while (v194);

              id v49 = v217;
              if ((v196 & 1) == 0)
              {
                id v6 = v221;
                id v5 = v224;
                id v7 = v225;
                uint32_t v10 = v229;
                unsigned int v52 = v218;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deletion failed",  buf,  2u);
                }

                v106 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                [v106 log:@"Deletion failed"];
                uint64_t v107 = 2LL;
                goto LABEL_89;
              }

              id v6 = v221;
              id v5 = v224;
              id v7 = v225;
              uint32_t v10 = v229;
            }

            else
            {

              id v6 = v221;
              id v5 = v224;
              id v7 = v225;
              uint32_t v10 = v229;
              id v49 = v217;
            }

            unsigned int v52 = v218;
LABEL_86:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deletion succeeded",  buf,  2u);
            }

            v106 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v106 log:@"Deletion succeeded"];
            uint64_t v107 = 1LL;
LABEL_89:

            xpc_dictionary_set_uint64(v52, "RESPONSE_TYPE", v107);
            goto LABEL_111;
          }
        }

        else
        {
          v66 = 0LL;
          uint32_t v10 = v229;
        }

        unsigned int v52 = v218;
LABEL_85:

        id obja = 0LL;
        id v7 = v225;
        goto LABEL_86;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Delete Archive not implemented",  buf,  2u);
      }

      v113 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v113 log:@"Delete Archive not implemented"];

      sub_10003077C(v52, 9uLL);
LABEL_111:

      goto LABEL_104;
    case 0xBu:
      v86 = v10;
      id v87 = v6;
      id v88 = v7;
      if (v5)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v90 = (void *)objc_claimAutoreleasedReturnValue([v89 getCurrentInflightLocalDiagnostic]);

        if (v90)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v91 registerActivityWithID:v90];

          sub_10002E448(v90);
          BOOL v92 = xpc_dictionary_get_BOOL(v87, "compress");
          id v93 = sub_100021370(v90, !v92);
          v94 = (char *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v252 = v94;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Getting in-progress archive %@",  buf,  0xCu);
          }

          xpc_dictionary_set_uint64(v88, "RESPONSE_TYPE", 1uLL);
          if (v94)
          {
            v95 = v94;
            xpc_dictionary_set_string(v88, "path", (const char *)[v95 UTF8String]);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No in-progress archive found",  buf,  2u);
          }

          xpc_dictionary_set_uint64(v88, "RESPONSE_TYPE", 1uLL);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Get in-progress archive not implemented",  buf,  2u);
        }

        sub_10003077C(v88, 9uLL);
      }

      id v111 = 0LL;
      uint32_t v10 = v86;
      goto LABEL_105;
    case 0xCu:
      id v96 = v6;
      id v97 = v7;
      if ((sub_10003FFAC(v5, @"com.apple.private.sysdiagnose.cli") & 1) != 0)
      {
        v98 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v96, "CLI_REQUEST_TYPE"));
        v99 = (char *)objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v100 = sub_100020FB4(0xCu);
          v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
          *(_DWORD *)__int128 buf = 138412546;
          v252 = v99;
          __int16 v253 = 2112;
          id v254 = v101;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Handling '%@' for '%@'",  buf,  0x16u);
        }

        if ([@"isAutomaticCoSysdiagnosePossible" isEqualToString:v99])
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          unsigned int v103 = [v102 isAutomaticCoSysdiagnosePossible];

          xpc_dictionary_set_uint64(v97, "RESPONSE_DATA", v103);
LABEL_79:
          xpc_dictionary_set_uint64(v97, "RESPONSE_TYPE", 1uLL);
LABEL_227:

          goto LABEL_228;
        }

        if (![@"validateRemoteUUIDs" isEqualToString:v99])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100055B44((uint64_t)v99, v178, v179, v180, v181, v182, v183, v184);
          }
          sub_10003077C(v97, 0xBuLL);
          goto LABEL_227;
        }

        id v222 = v6;
        uint64_t v130 = objc_opt_class(&OBJC_CLASS___NSSet, v129);
        v132 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v130,  objc_opt_class(&OBJC_CLASS___NSString, v131),  0LL);
        v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
        *(void *)v259 = 0LL;
        v134 = xpc_dictionary_get_data(v96, "REQUEST_DATA", (size_t *)v259);
        id v227 = v7;
        if (v134
          && (uint64_t v135 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v134,  *(void *)v259))) != 0)
        {
          v136 = (void *)v135;
          *(void *)&__int128 v247 = 0LL;
          xdicta = v133;
          v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v133,  v135,  &v247));
          id v138 = (id)v247;
          v139 = v138;
          if (v137)
          {

            uint64_t v141 = objc_opt_class(&OBJC_CLASS___NSSet, v140);
            if ((objc_opt_isKindOfClass(v137, v141) & 1) != 0)
            {
              v233 = v99;
              v230 = v10;
              id v142 = v137;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 136315394;
                v252 = "REQUEST_DATA";
                __int16 v253 = 2112;
                id v254 = v142;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting %s to %@",  buf,  0x16u);
              }

              v143 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v143 log:@"Setting %s to %@", "REQUEST_DATA", v142];

              v144 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              memset(v259, 0, sizeof(v259));
              __int128 v260 = 0u;
              __int128 v261 = 0u;
              id v145 = v142;
              id v146 = [v145 countByEnumeratingWithState:v259 objects:buf count:16];
              if (v146)
              {
                id v147 = v146;
                uint64_t v148 = **(void **)&v259[16];
                do
                {
                  for (j = 0LL; j != v147; j = (char *)j + 1)
                  {
                    if (**(void **)&v259[16] != v148) {
                      objc_enumerationMutation(v145);
                    }
                    uint64_t v150 = *(void *)(*(void *)&v259[8] + 8LL * (void)j);
                    v151 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[CSRemoteXPCProxy isDeviceWithUUIDAvailable:]( &OBJC_CLASS___CSRemoteXPCProxy,  "isDeviceWithUUIDAvailable:",  v150)));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v144,  "setObject:forKeyedSubscript:",  v151,  v150);
                  }

                  id v147 = [v145 countByEnumeratingWithState:v259 objects:buf count:16];
                }

                while (v147);
              }

              id v152 = -[NSMutableDictionary copy](v144, "copy");
              *(void *)&__int128 v243 = 0LL;
              v153 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v152,  1LL,  &v243));
              id v154 = (id)v243;

              if (v153)
              {
                id v155 = v153;
                xpc_dictionary_set_data( v97,  "RESPONSE_DATA",  [v155 bytes],  (size_t)objc_msgSend(v155, "length"));
                id v7 = v227;
                uint32_t v10 = v230;
              }

              else
              {
                uint32_t v10 = v230;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100055AC4(v154);
                }
                sub_10003077C(v97, 4uLL);
                id v7 = v227;
              }

              id v6 = v222;
              v99 = v233;
              if (!v153) {
                goto LABEL_227;
              }
              goto LABEL_79;
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v206 = (void *)objc_claimAutoreleasedReturnValue([v139 localizedDescription]);
              *(_DWORD *)__int128 buf = 136315394;
              v252 = "REQUEST_DATA";
              __int16 v253 = 2112;
              id v254 = v206;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error fetching key '%s': %@",  buf,  0x16u);
            }

            v207 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            v208 = (void *)objc_claimAutoreleasedReturnValue([v139 localizedDescription]);
            [v207 log:@"Error fetching key '%s': %@", "REQUEST_DATA", v208];

            v137 = 0LL;
          }

          id v6 = v222;
          v133 = xdicta;
        }

        else
        {
          v137 = 0LL;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100055A58((uint64_t)v99, v209, v210, v211, v212, v213, v214, v215);
        }
        sub_10003077C(v97, 0xBuLL);

        id v7 = v227;
        goto LABEL_227;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v104 = sub_100020FB4(0xCu);
        v105 = (char *)objc_claimAutoreleasedReturnValue(v104);
        *(_DWORD *)__int128 buf = 138412290;
        v252 = v105;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error: %@ invoked by unentitled client",  buf,  0xCu);
      }

      sub_10003077C(v97, 0xFuLL);
LABEL_228:

LABEL_104:
      id v111 = 0LL;
LABEL_105:

      return v111;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Request not implemented",  buf,  2u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v25 log:@"Request not implemented"];

      sub_10003077C(v7, 0xBuLL);
      goto LABEL_104;
  }

void sub_10003077C(void *a1, uint64_t a2)
{
  xpc_object_t xdict = a1;
  xpc_dictionary_set_uint64(xdict, "RESPONSE_TYPE", 2uLL);
  xpc_dictionary_set_uint64(xdict, "FAILURE_REASON", a2);
}

uint64_t sub_1000307D0()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v1, 1uLL);
  id v3 = (void *)qword_1000A5298;
  qword_1000A5298 = (uint64_t)mach_service;

  id v4 = (_xpc_connection_s *)qword_1000A5298;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100030914;
  handler[3] = &unk_100089798;
  id v5 = v1;
  uint64_t v11 = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume((xpc_connection_t)qword_1000A5298);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC server initialized.",  (uint8_t *)&v9,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v6 stdoutWrite:@"XPC server initialized."];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v7 log:@"XPC server initialized."];

  return 0LL;
}

void sub_100030914(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    __int16 v9 = *(void **)(a1 + 32);
    uint32_t v10 = (_xpc_connection_s *)v3;
    uint64_t v11 = v9;
    uint64_t v12 = (void *)os_transaction_create("incoming xpc request");
    xpc_connection_set_target_queue(v10, v11);

    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    id v17 = sub_1000364C0;
    __int16 v18 = &unk_100089830;
    id v19 = v12;
    unsigned int v20 = v10;
    id v13 = v12;
    BOOL v8 = v10;
    xpc_connection_set_event_handler(v8, &buf);
    xpc_connection_resume(v8);

LABEL_7:
    goto LABEL_11;
  }

  xpc_type_t v5 = type;
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5 != (xpc_type_t)&_xpc_type_error)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unrecognized connection event",  (uint8_t *)&buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v7 stdoutWrite:@"unrecognized connection event"];

    BOOL v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    -[_xpc_connection_s log:](v8, "log:", @"unrecognized connection event");
    goto LABEL_7;
  }

  if (v6)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "connection error: %s",  (uint8_t *)&buf,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend( v14,  "stdoutWrite:",  @"connection error: %s",  xpc_dictionary_get_string(v3, _xpc_error_key_description));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v15, "log:", @"connection error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description));

LABEL_11:
}

void sub_100030B8C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = sub_100020E74(*(_DWORD *)(a1 + 40));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    *(_DWORD *)__int128 buf = 136315394;
    id v13 = "sysdiagnose (stackshot only)";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s trigger: %@",  buf,  0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  xpc_type_t v5 = sub_100020E74(*(_DWORD *)(a1 + 40));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 stdoutWrite:@"%s trigger: %@", "sysdiagnose (stackshot only)", v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  BOOL v8 = sub_100020E74(*(_DWORD *)(a1 + 40));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 log:@"%s trigger: %@", "sysdiagnose (stackshot only)", v9];

  sub_100021F88(41LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v13 = "sysdiagnose (stackshot only)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }

  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "stdoutWrite:", @"%s complete", "sysdiagnose (stackshot only)");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", @"%s complete", "sysdiagnose (stackshot only)");
}

void sub_100030D7C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    xpc_type_t v5 = "sysdiagnose (full)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", @"%s complete", "sysdiagnose (full)");

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", @"%s complete", "sysdiagnose (full)");
}

void sub_100030E8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      *(_DWORD *)__int128 buf = 138412290;
      uint32_t v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Tap-to-Radar failed to handle the keychord event with error: %@",  buf,  0xCu);
    }

    xpc_type_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    [v5 stdoutWrite:@"Tap-to-Radar failed to handle the keychord event with error: %@", v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    [v7 log:@"Tap-to-Radar failed to handle the keychord event with error: %@", v8];
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100030FF4(uint64_t a1, void *a2, id *a3, uint64_t *a4, void *a5)
{
  id v8 = a2;
  *a4 = 0LL;
  if (!sub_100025850())
  {
    v565 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    if (!v8)
    {
      uint64_t v16 = 0LL;
      goto LABEL_13;
    }

    xpc_object_t value = xpc_dictionary_get_value(v8, "diagnosticID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v12 = v11;
    if (v11)
    {
      if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_string)
      {
        id v17 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "diagnosticID"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_12;
      }

      id v13 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
      }

      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v14 stdoutWrite:@"Invalid flag argument type."];

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v15 log:@"Invalid flag argument type."];
    }

    uint64_t v16 = 0LL;
LABEL_12:

LABEL_13:
    id v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v16 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)v584 = "diagnosticID";
      *(_WORD *)&v584[8] = 2080;
      id v585 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
    }

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v21 = v16;
    objc_msgSend( v20,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "diagnosticID",  objc_msgSend(v21, "UTF8String"));

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v23 = v21;
    objc_msgSend( v22,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "diagnosticID",  objc_msgSend(v23, "UTF8String"));

    v564 = v23;
    [0 isEqualToString:v23];
    if (!v8)
    {
      BOOL v30 = 1LL;
      goto LABEL_25;
    }

    xpc_object_t v24 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = v25;
    if (v25)
    {
      if (xpc_get_type(v25) == (xpc_type_t)&_xpc_type_BOOL)
      {
        BOOL v30 = xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall");
        goto LABEL_24;
      }

      id v27 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
      }

      int v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v28 stdoutWrite:@"Invalid flag argument type."];

      unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v29 log:@"Invalid flag argument type."];
    }

    BOOL v30 = 1LL;
LABEL_24:

LABEL_25:
    id v31 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)v584 = "shouldCreateTarBall";
      *(_WORD *)&v584[8] = 1024;
      LODWORD(v585) = v30;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
    }

    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v32,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldCreateTarBall",  v30);

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v33, "log:", @"sysdiagnose XPC dictionary: Set %s to BOOL %d", "shouldCreateTarBall", v30);

    if (!v30)
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldCreateTarBall",  1LL,  0LL));
      [v565 appendString:v34];
    }

    v566 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticiOS);
    if (!v566)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055C54();
      }
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v50 stderrWrite:@"Failed to allocate diagnostic object. Failing early from do_sysdiagnose"];

      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v51 log:@"Failed to allocate diagnostic object. Failing early from do_sysdiagnose"];

      id v9 = 0LL;
      unsigned int v52 = 0LL;
      uint64_t v53 = v564;
      goto LABEL_437;
    }

    v563 = a4;
    id v35 = v566;
    if (a5
      && (BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID")),
          v36,
          v36))
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
    }

    else
    {
      id v37 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055C94((uint64_t)a5, v566);
      }

      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
      [v38 stderrWrite:@"Error setting diagnosticIDOut: trying to set '%p' to '%@'", a5, v39];

      dispatch_semaphore_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
      id v35 = v566;
      [v40 log:@"Error setting diagnosticIDOut: trying to set '%p' to '%@'", a5, v41];
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    dispatch_time_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v35, "diagnosticID"));
    unsigned int v44 = [v42 checkAndIncreaseDiagnosticCountForDiagnosticID:v43 collectingLocalLogs:1];

    uint64_t v45 = v564;
    if (v564)
    {
      if (([v564 isEqualToString:@"waitIfAny"] & v44 & 1) == 0)
      {
        unsigned int v46 = [v564 isEqualToString:@"waitIfAny"];
        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 getCurrentInflightLocalDiagnostic]);

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v584 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Selected the following diagnostic %@",  buf,  0xCu);
          }

          id v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v49 log:@"Selected the following diagnostic %@", v48];
        }

        else
        {
          uint64_t v48 = v564;
        }

        id v67 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unsigned int v68 = [v67 registerActivityWithID:v48];

        unsigned int v52 = v566;
        if (((v46 | v68 ^ 1) & 1) == 0)
        {
          xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v8);
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
          id v71 = v70;
          if (v70)
          {
            if (xpc_get_type(v70) == (xpc_type_t)&_xpc_type_connection)
            {
              v72 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              unsigned __int8 v73 = [v72 initConnectionWithPeer:v71 forDiagnosticID:v48];

              if ((v73 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)v584 = v48;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't set progressHandler for sysdiagnose with the diagnostcID %@",  buf,  0xCu);
              }
            }
          }
        }

        sub_10002E448(v48);
        id v74 = sub_100021370(v48, v30 ^ 1);
        id v66 = (id)objc_claimAutoreleasedReturnValue(v74);
        if (v66)
        {
          uint64_t v75 = 0LL;
          id v76 = &OBJC_IVAR___SDCacheEnumerator__enumerators;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v584 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't get an archive with the diagnostcID %@",  buf,  0xCu);
          }

          id v76 = &OBJC_IVAR___SDCacheEnumerator__enumerators;
          id v77 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v77 log:@"Couldn't get an archive with the diagnostcID %@", v48];

          uint64_t v75 = 2LL;
        }

        uint64_t *v563 = v75;
        v78 = (void *)objc_claimAutoreleasedReturnValue([v76 + 424 sharedResourceManager]);
        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
        [v78 decreaseDiagnosticCountForDiagnosticID:v79];

        goto LABEL_436;
      }
    }

    else if (!v44)
    {
      id v66 = 0LL;
      uint64_t v48 = 0LL;
      uint64_t *v563 = 3LL;
      unsigned int v52 = v566;
LABEL_436:
      id v9 = v66;
      uint64_t v53 = v48;
      goto LABEL_437;
    }

    uint64_t v54 = sub_100024174();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_signpost_enabled(v55))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "doSDSetup",  "[do_sysdiagnose] Setup/Parsing begins",  buf,  2u);
    }

    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 possibleClient]);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v58 setCurrentClient:v57];

    unsigned int v52 = v566;
    -[SystemDiagnostic setRequestSource:](v566, "setRequestSource:", a1);
    if (!v8)
    {
LABEL_395:
      v509 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v52, "diagnosticID"));

      if (v8 && v509)
      {
        int int64 = xpc_dictionary_get_int64(v8, "clientPID");
        v511 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v512 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v52, "diagnosticID"));
        v513 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", int64));
        [v511 setUpSysdiagnoseSession:v512 clientPid:v513];

        unsigned int v52 = v566;
        proc_pidpath(int64, buf, 0x400u);
        v514 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buf,  4LL));
        -[SystemDiagnostic setIsTestingMode:]( v566,  "setIsTestingMode:",  [v514 rangeOfString:@"dt_sysdiagnose"] != (id)0x7FFFFFFFFFFFFFFFLL);
      }

      if (-[SystemDiagnostic requestSource](v52, "requestSource") == 2)
      {
        uint64_t v515 = xpc_dictionary_dup_fd(v8, "stdout");
        uint64_t v516 = xpc_dictionary_dup_fd(v8, "stderr");
        uint64_t v517 = v516;
        if ((_DWORD)v515 == -1 || (_DWORD)v516 == -1)
        {
          id v518 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 67109376;
            *(_DWORD *)v584 = v515;
            *(_WORD *)&v584[4] = 1024;
            *(_DWORD *)&v584[6] = v517;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Server received invalid CLI descriptors: stdout %d, stderr %d",  buf,  0xEu);
          }

          v519 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          objc_msgSend(v519, "log:", @"Server received invalid CLI descriptors: stdout %d, stderr %d", v515, v517);
        }

        v520 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v521 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
        unsigned __int8 v522 = [v520 setUpCLI:v521 stdoutfd:v515 stderrfd:v517];

        unsigned int v52 = v566;
        if ((v522 & 1) == 0)
        {
          id v523 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v524 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v584 = v524;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "setUpCli failed for diagnostic ID :%@.",  buf,  0xCu);
          }

          v525 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v526 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
          [v525 log:@"setUpCli failed for diagnostic ID :%@.", v526];
        }
      }

      v527 = v563;
      if (!-[SystemDiagnostic verbose](v52, "verbose"))
      {
        xpc_connection_t v528 = xpc_dictionary_get_remote_connection(v8);
        v529 = (void *)objc_claimAutoreleasedReturnValue(v528);
        v530 = v529;
        if (v529 && xpc_get_type(v529) == (xpc_type_t)&_xpc_type_connection)
        {
          v531 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v531 initProgressTrackerWithConnection:v530];
        }
      }

      -[SystemDiagnostic setChangedDiagnosticProperties:](v52, "setChangedDiagnosticProperties:", v565);
      v532 = sub_100024174();
      v533 = (os_log_s *)objc_claimAutoreleasedReturnValue(v532);
      if (os_signpost_enabled(v533))
      {
        *(_WORD *)__int128 buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v533,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "doSDSetup",  "[do_sysdiagnose] setup/parse input ended!",  buf,  2u);
      }

      -[SystemDiagnosticiOS run](v52, "run");
      unsigned int v534 = -[SystemDiagnostic requestSource](v52, "requestSource");
      if (a3 && v534 == 3)
      {
        id v562 = v8;
        id v535 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Getting a copy of metrics",  buf,  2u);
        }

        v536 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v536 stdoutWrite:@"Getting a copy of metrics"];

        v537 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v537 log:@"Getting a copy of metrics"];

        v538 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](v52, "metricsDict"));
        *a3 = [v538 copy];

        __int128 v573 = 0u;
        __int128 v574 = 0u;
        __int128 v571 = 0u;
        __int128 v572 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue([*a3 allKeys]);
        id v539 = [obja countByEnumeratingWithState:&v571 objects:v582 count:16];
        if (v539)
        {
          id v540 = v539;
          uint64_t v541 = *(void *)v572;
          do
          {
            for (i = 0LL; i != v540; i = (char *)i + 1)
            {
              if (*(void *)v572 != v541) {
                objc_enumerationMutation(obja);
              }
              v543 = *(void **)(*((void *)&v571 + 1) + 8LL * (void)i);
              id v544 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v545 = v543;
                id v546 = [v545 UTF8String];
                v547 = (void *)objc_claimAutoreleasedReturnValue([*a3 objectForKey:v545]);
                [v547 doubleValue];
                *(_DWORD *)__int128 buf = 136315394;
                *(void *)v584 = v546;
                *(_WORD *)&v584[8] = 2048;
                id v585 = v548;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Key: %s, Val: %f",  buf,  0x16u);
              }

              v549 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v550 = v543;
              id v551 = [v550 UTF8String];
              v552 = (void *)objc_claimAutoreleasedReturnValue([*a3 objectForKey:v550]);
              [v552 doubleValue];
              objc_msgSend(v549, "stdoutWrite:", @"Key: %s, Val: %f", v551, v553);

              v554 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v555 = v550;
              id v556 = [v555 UTF8String];
              v557 = (void *)objc_claimAutoreleasedReturnValue([*a3 objectForKey:v555]);
              [v557 doubleValue];
              objc_msgSend(v554, "log:", @"Key: %s, Val: %f", v556, v558);
            }

            id v540 = [obja countByEnumeratingWithState:&v571 objects:v582 count:16];
          }

          while (v540);
        }

        id v8 = v562;
        v527 = v563;
        unsigned int v52 = v566;
        uint64_t v45 = v564;
      }

      if (-[SystemDiagnostic didComplete](v52, "didComplete"))
      {
        if (-[SystemDiagnostic shouldCreateTarBall](v52, "shouldCreateTarBall")) {
          v559 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](v52, "tarballPath"));
        }
        else {
          v559 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](v52, "outputDirectory"));
        }
        id v66 = v559;
      }

      else
      {
        id v66 = 0LL;
        uint64_t *v527 = 6LL;
      }

      uint64_t v48 = v45;
      goto LABEL_436;
    }

    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
    xpc_object_t v60 = xpc_dictionary_get_value(v8, "pidOrProcess");
    int v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    uint64_t v62 = v61;
    if (v61)
    {
      if (xpc_get_type(v61) == (xpc_type_t)&_xpc_type_string)
      {
        v80 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "pidOrProcess"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(v80);
        -[SystemDiagnostic setProvidedPIDorProcess:](v566, "setProvidedPIDorProcess:", v65);
      }

      else
      {
        id v63 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
        }

        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v64 stdoutWrite:@"Invalid flag argument type."];

        v65 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v65 log:@"Invalid flag argument type."];
        unsigned int v52 = v566;
      }
    }

    id v81 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v82 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v52, "providedPIDorProcess"));
      id v83 = [v82 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)v584 = "pidOrProcess";
      *(_WORD *)&v584[8] = 2080;
      id v585 = v83;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
    }

    v84 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v85 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v52, "providedPIDorProcess"));
    objc_msgSend( v84,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "pidOrProcess",  objc_msgSend(v85, "UTF8String"));

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v87 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
    objc_msgSend( v86,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "pidOrProcess",  objc_msgSend(v87, "UTF8String"));

    id v88 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
    if (([v59 isEqualToString:v88] & 1) == 0 && v59)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));

      if (!v89) {
        goto LABEL_78;
      }
      v90 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
      id v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %@ to %@\n",  "pidOrProcess",  v59,  v90));

      [v565 appendString:v88];
    }

LABEL_78:
    uint64_t v91 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
    uint64_t v53 = v564;
    if (!v91) {
      goto LABEL_103;
    }
    BOOL v92 = (void *)v91;
    id v93 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
    if ([v93 rangeOfString:@"Mail" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
      id v95 = [v94 rangeOfString:@"Safari" options:1];

      if (v95 != (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_103;
      }
      -[SystemDiagnostic populateProcessInfoForInput](v566, "populateProcessInfoForInput");
      uint64_t v96 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v566, "targetPIDs"));
      if (!v96
        || (id v97 = (void *)v96,
            v98 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v566, "targetPIDs")),
            id v99 = [v98 count],
            v98,
            v97,
            !v99))
      {
        uint64_t *v563 = 12LL;
        v108 = sub_100024174();
        unsigned __int16 v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
        if (os_signpost_enabled(v109))
        {
          *(_WORD *)__int128 buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v109,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "doSDSetup",  "[do_sysdiagnose] setup/parse input ended!",  buf,  2u);
        }

        goto LABEL_356;
      }

      v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet"));
      BOOL v92 = (void *)objc_claimAutoreleasedReturnValue([v100 invertedSet]);

      v101 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
      id v102 = [v101 rangeOfCharacterFromSet:v92];

      if (v102 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v103 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
        id v104 = [v103 intValue];

        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v104));
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v566, "targetPIDs"));
        unsigned __int8 v107 = [v106 containsObject:v105];

        if ((v107 & 1) != 0) {
          goto LABEL_102;
        }
LABEL_98:
        uint64_t *v563 = 12LL;
        v116 = sub_100024174();
        v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
        if (os_signpost_enabled(v117))
        {
          *(_WORD *)__int128 buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v117,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "doSDSetup",  "[do_sysdiagnose] setup/parse input ended!",  buf,  2u);
        }

        goto LABEL_356;
      }

      __int128 v580 = 0u;
      __int128 v581 = 0u;
      __int128 v578 = 0u;
      __int128 v579 = 0u;
      id v93 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v566, "targetPIDs"));
      id v110 = [v93 countByEnumeratingWithState:&v578 objects:v588 count:16];
      if (!v110)
      {
LABEL_97:

        goto LABEL_98;
      }

      id v111 = v110;
      uint64_t v112 = *(void *)v579;
LABEL_91:
      v113 = 0LL;
      while (1)
      {
        if (*(void *)v579 != v112) {
          objc_enumerationMutation(v93);
        }
        v114 = *(void **)(*((void *)&v578 + 1) + 8LL * (void)v113);
        v115 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v566, "providedPIDorProcess"));
        LOBYTE(v114) = sub_10004061C(v114, v115);

        v113 = (char *)v113 + 1;
        uint64_t v53 = v564;
        if (v111 == v113)
        {
          id v111 = [v93 countByEnumeratingWithState:&v578 objects:v588 count:16];
          if (v111) {
            goto LABEL_91;
          }
          goto LABEL_97;
        }
      }
    }

LABEL_102:
LABEL_103:
    xpc_object_t v118 = xpc_dictionary_get_value(v8, "commandLineArgs");
    v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
    id v120 = v119;
    if (v119)
    {
      if (xpc_get_type(v119) == (xpc_type_t)&_xpc_type_string)
      {
        unint64_t v125 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "commandLineArgs"));
        id v124 = (void *)objc_claimAutoreleasedReturnValue(v125);
LABEL_110:

        id v126 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v127 = [v124 UTF8String];
          *(_DWORD *)__int128 buf = 136315394;
          *(void *)v584 = "commandLineArgs";
          *(_WORD *)&v584[8] = 2080;
          id v585 = v127;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
        }

        id v128 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v129 = v124;
        objc_msgSend( v128,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "commandLineArgs",  objc_msgSend(v129, "UTF8String"));

        uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v131 = v129;
        objc_msgSend( v130,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "commandLineArgs",  objc_msgSend(v131, "UTF8String"));

        id obj = v131;
        [0 isEqualToString:v131];
        v132 = v566;
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));
        xpc_object_t v134 = xpc_dictionary_get_value(v8, "baseDirectory");
        uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
        v136 = v135;
        if (v135)
        {
          if (xpc_get_type(v135) == (xpc_type_t)&_xpc_type_string)
          {
            uint64_t v140 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "baseDirectory"));
            v139 = (void *)objc_claimAutoreleasedReturnValue(v140);
            -[SystemDiagnostic setBaseDirectory:](v566, "setBaseDirectory:", v139);
          }

          else
          {
            id v137 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
            }

            id v138 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v138 stdoutWrite:@"Invalid flag argument type."];

            v139 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v139 log:@"Invalid flag argument type."];
            v132 = v566;
          }
        }

        id v141 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v142 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v132, "baseDirectory"));
          id v143 = [v142 UTF8String];
          *(_DWORD *)__int128 buf = 136315394;
          *(void *)v584 = "baseDirectory";
          *(_WORD *)&v584[8] = 2080;
          id v585 = v143;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
        }

        v144 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v145 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v132, "baseDirectory"));
        objc_msgSend( v144,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "baseDirectory",  objc_msgSend(v145, "UTF8String"));

        id v146 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v147 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));
        uint64_t v148 = v566;
        objc_msgSend( v146,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "baseDirectory",  objc_msgSend(v147, "UTF8String"));

        v149 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));
        if (([v133 isEqualToString:v149] & 1) == 0 && v133)
        {
          uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));

          if (!v150)
          {
LABEL_126:

            if (!xpc_dictionary_get_string(v8, "baseDirectory")) {
              goto LABEL_132;
            }
            id v152 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS defaultBaseDirectory](v566, "defaultBaseDirectory"));
            v153 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v152,  1LL));

            id v154 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));
            id v155 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v154,  1LL));
            v156 = (void *)objc_claimAutoreleasedReturnValue([v155 URLByResolvingSymlinksInPath]);

            v157 = (void *)objc_claimAutoreleasedReturnValue([v153 absoluteString]);
            v158 = (void *)objc_claimAutoreleasedReturnValue([v156 absoluteString]);
            unsigned __int8 v159 = [v157 isEqualToString:v158];

            if ((v159 & 1) != 0)
            {
LABEL_131:

              uint64_t v148 = v566;
LABEL_132:
              unsigned int v164 = -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback");
              xpc_object_t v165 = xpc_dictionary_get_value(v8, "shouldDisplayBannerUI");
              v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
              v167 = v166;
              if (v166)
              {
                if (xpc_get_type(v166) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setDeShowFeedback:]( v148,  "setDeShowFeedback:",  xpc_dictionary_get_BOOL(v8, "shouldDisplayBannerUI"));
                }

                else
                {
                  id v168 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                  }

                  v169 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v169 stdoutWrite:@"Invalid flag argument type."];

                  id v170 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v170 log:@"Invalid flag argument type."];

                  uint64_t v148 = v566;
                }
              }

              id v171 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v172 = -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback");
                *(_DWORD *)__int128 buf = 136315394;
                *(void *)v584 = "shouldDisplayBannerUI";
                *(_WORD *)&v584[8] = 1024;
                LODWORD(v585) = v172;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
              }

              v173 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              objc_msgSend( v173,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldDisplayBannerUI",  -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback"));

              v174 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              objc_msgSend( v174,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldDisplayBannerUI",  -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback"));

              if (v164 != -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback"))
              {
                v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldDisplayBannerUI",  v164,  -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback")));
                [v565 appendString:v175];
              }

              id v176 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v177 = -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback");
                *(_DWORD *)__int128 buf = 67109120;
                *(_DWORD *)v584 = v177;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "should show UI banner? %d",  buf,  8u);
              }

              uint64_t v178 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              objc_msgSend( v178,  "log:",  @"should show UI banner? %d",  -[SystemDiagnostic deShowFeedback](v148, "deShowFeedback"));

              uint64_t v179 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v148, "rootPath"));
              xpc_object_t v180 = xpc_dictionary_get_value(v8, "rootPath");
              uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue(v180);
              uint64_t v182 = v181;
              if (v181)
              {
                if (xpc_get_type(v181) == (xpc_type_t)&_xpc_type_string)
                {
                  v186 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "rootPath"));
                  v185 = (void *)objc_claimAutoreleasedReturnValue(v186);
                  -[SystemDiagnostic setRootPath:](v148, "setRootPath:", v185);
                }

                else
                {
                  id v183 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                  }

                  uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v184 stdoutWrite:@"Invalid flag argument type."];

                  v185 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v185 log:@"Invalid flag argument type."];
                  uint64_t v148 = v566;
                }
              }

              id v187 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v188 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v148, "rootPath"));
                id v189 = [v188 UTF8String];
                *(_DWORD *)__int128 buf = 136315394;
                *(void *)v584 = "rootPath";
                *(_WORD *)&v584[8] = 2080;
                id v585 = v189;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
              }

              v190 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v191 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v148, "rootPath"));
              objc_msgSend( v190,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "rootPath",  objc_msgSend(v191, "UTF8String"));

              v192 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v193 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v566, "rootPath"));
              id v194 = v566;
              objc_msgSend( v192,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "rootPath",  objc_msgSend(v193, "UTF8String"));

              id v195 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v566, "rootPath"));
              if (([v179 isEqualToString:v195] & 1) == 0 && v179)
              {
                char v196 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v566, "rootPath"));

                if (!v196) {
                  goto LABEL_158;
                }
                v197 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v566, "rootPath"));
                id v195 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %@ to %@\n",  "rootPath",  v179,  v197));

                [v565 appendString:v195];
              }

LABEL_158:
              v198 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v566, "archiveName"));
              xpc_object_t v199 = xpc_dictionary_get_value(v8, "archiveName");
              uint64_t v200 = (void *)objc_claimAutoreleasedReturnValue(v199);
              v201 = v200;
              if (v200)
              {
                if (xpc_get_type(v200) == (xpc_type_t)&_xpc_type_string)
                {
                  v205 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "archiveName"));
                  v204 = (void *)objc_claimAutoreleasedReturnValue(v205);
                  -[SystemDiagnostic setArchiveName:](v566, "setArchiveName:", v204);
                }

                else
                {
                  id v202 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                  }

                  v203 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v203 stdoutWrite:@"Invalid flag argument type."];

                  v204 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v204 log:@"Invalid flag argument type."];
                  id v194 = v566;
                }
              }

              id v206 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v207 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v194, "archiveName"));
                id v208 = [v207 UTF8String];
                *(_DWORD *)__int128 buf = 136315394;
                *(void *)v584 = "archiveName";
                *(_WORD *)&v584[8] = 2080;
                id v585 = v208;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
              }

              uint64_t v209 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v210 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v194, "archiveName"));
              objc_msgSend( v209,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "archiveName",  objc_msgSend(v210, "UTF8String"));

              uint64_t v211 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              id v212 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v566, "archiveName"));
              uint64_t v213 = v566;
              objc_msgSend( v211,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "archiveName",  objc_msgSend(v212, "UTF8String"));

              uint64_t v214 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v566, "archiveName"));
              if (([v198 isEqualToString:v214] & 1) == 0 && v198)
              {
                uint64_t v215 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v566, "archiveName"));

                if (!v215) {
                  goto LABEL_172;
                }
                uint64_t v216 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v566, "archiveName"));
                uint64_t v214 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %@ to %@\n",  "archiveName",  v198,  v216));

                [v565 appendString:v214];
              }

LABEL_172:
              xpc_object_t v217 = xpc_dictionary_get_value(v8, "shouldCollectAllTrusted");
              id v218 = (void *)objc_claimAutoreleasedReturnValue(v217);

              if (v218)
              {
                BOOL v220 = xpc_dictionary_get_BOOL(v8, "shouldCollectAllTrusted");
                id v221 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
                id v222 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v566, "diagnosticID"));
                [v221 setCollectAllTrusted:v220 forDiagnosticID:v222];

                uint64_t v213 = v566;
              }

              uint64_t v223 = objc_opt_class(&OBJC_CLASS___NSSet, v219);
              id v225 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v223,  objc_opt_class(&OBJC_CLASS___NSString, v224),  0LL);
              uint64_t v226 = objc_claimAutoreleasedReturnValue(v225);
              size_t length = 0LL;
              data = xpc_dictionary_get_data(v8, "remoteUUIDs", &length);
              v567 = (void *)v226;
              if (data
                && (uint64_t v228 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  data,  length))) != 0)
              {
                v229 = (void *)v228;
                id v576 = 0LL;
                v230 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v226,  v228,  &v576));
                id v231 = v576;
                v232 = v231;
                if (!v230)
                {
                  id v465 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v466 = (void *)objc_claimAutoreleasedReturnValue([v232 localizedDescription]);
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "remoteUUIDs";
                    *(_WORD *)&v584[8] = 2112;
                    id v585 = v466;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error fetching key '%s': %@",  buf,  0x16u);
                  }

                  v467 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  v468 = (void *)objc_claimAutoreleasedReturnValue([v232 localizedDescription]);
                  [v467 log:@"Error fetching key '%s': %@", "remoteUUIDs", v468];

                  v230 = 0LL;
                  v561 = 0LL;
                  uint64_t v213 = v566;
LABEL_183:

                  unsigned int v239 = -[SystemDiagnostic generatePlist](v213, "generatePlist");
                  xpc_object_t v240 = xpc_dictionary_get_value(v8, "generatePlist");
                  id v241 = (void *)objc_claimAutoreleasedReturnValue(v240);
                  id v242 = v241;
                  if (v241)
                  {
                    if (xpc_get_type(v241) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setGeneratePlist:]( v213,  "setGeneratePlist:",  xpc_dictionary_get_BOOL(v8, "generatePlist"));
                    }

                    else
                    {
                      id v243 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      __int128 v244 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v244 stdoutWrite:@"Invalid flag argument type."];

                      __int128 v245 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v245 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v246 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v247 = -[SystemDiagnostic generatePlist](v213, "generatePlist");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "generatePlist";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v247;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  __int128 v248 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v248,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "generatePlist",  -[SystemDiagnostic generatePlist](v213, "generatePlist"));

                  __int128 v249 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v249,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "generatePlist",  -[SystemDiagnostic generatePlist](v213, "generatePlist"));

                  if (v239 != -[SystemDiagnostic generatePlist](v213, "generatePlist"))
                  {
                    __int128 v250 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "generatePlist",  v239,  -[SystemDiagnostic generatePlist](v213, "generatePlist")));
                    [v565 appendString:v250];
                  }

                  unsigned int v251 = -[SystemDiagnostic quickMode](v213, "quickMode");
                  xpc_object_t v252 = xpc_dictionary_get_value(v8, "quickMode");
                  __int16 v253 = (void *)objc_claimAutoreleasedReturnValue(v252);
                  id v254 = v253;
                  if (v253)
                  {
                    if (xpc_get_type(v253) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setQuickMode:](v213, "setQuickMode:", xpc_dictionary_get_BOOL(v8, "quickMode"));
                    }

                    else
                    {
                      id v255 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v256 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v256 stdoutWrite:@"Invalid flag argument type."];

                      __int16 v257 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v257 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v258 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v259 = -[SystemDiagnostic quickMode](v213, "quickMode");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "quickMode";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v259;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  __int128 v260 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v260,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "quickMode",  -[SystemDiagnostic quickMode](v213, "quickMode"));

                  __int128 v261 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v261,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "quickMode",  -[SystemDiagnostic quickMode](v213, "quickMode"));

                  if (v251 != -[SystemDiagnostic quickMode](v213, "quickMode"))
                  {
                    v262 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "quickMode",  v251,  -[SystemDiagnostic quickMode](v213, "quickMode")));
                    [v565 appendString:v262];
                  }

                  unsigned int v263 = -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall");
                  xpc_object_t v264 = xpc_dictionary_get_value(v8, "shouldDisplayTarBall");
                  v265 = (void *)objc_claimAutoreleasedReturnValue(v264);
                  v266 = v265;
                  if (v265)
                  {
                    if (xpc_get_type(v265) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldDisplayTarBall:]( v213,  "setShouldDisplayTarBall:",  xpc_dictionary_get_BOOL(v8, "shouldDisplayTarBall"));
                    }

                    else
                    {
                      id v267 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v268 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v268 stdoutWrite:@"Invalid flag argument type."];

                      v269 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v269 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v270 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v271 = -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldDisplayTarBall";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v271;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v272 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v272,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldDisplayTarBall",  -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall"));

                  v273 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v273,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldDisplayTarBall",  -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall"));

                  if (v263 != -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall"))
                  {
                    v274 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldDisplayTarBall",  v263,  -[SystemDiagnostic shouldDisplayTarBall](v213, "shouldDisplayTarBall")));
                    [v565 appendString:v274];
                  }

                  unsigned int v275 = -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall");
                  xpc_object_t v276 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
                  v277 = (void *)objc_claimAutoreleasedReturnValue(v276);
                  v278 = v277;
                  if (v277)
                  {
                    if (xpc_get_type(v277) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldCreateTarBall:]( v213,  "setShouldCreateTarBall:",  xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall"));
                    }

                    else
                    {
                      id v279 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v280 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v280 stdoutWrite:@"Invalid flag argument type."];

                      v281 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v281 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v282 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v283 = -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldCreateTarBall";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v283;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v284 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v284,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldCreateTarBall",  -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall"));

                  v285 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v285,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldCreateTarBall",  -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall"));

                  if (v275 != -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall"))
                  {
                    v286 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldCreateTarBall",  v275,  -[SystemDiagnostic shouldCreateTarBall](v213, "shouldCreateTarBall")));
                    [v565 appendString:v286];
                  }

                  unsigned int v287 = -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks");
                  xpc_object_t v288 = xpc_dictionary_get_value(v8, "shouldRunLogCopyTasks");
                  v289 = (void *)objc_claimAutoreleasedReturnValue(v288);
                  v290 = v289;
                  if (v289)
                  {
                    if (xpc_get_type(v289) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldRunLogCopyTasks:]( v213,  "setShouldRunLogCopyTasks:",  xpc_dictionary_get_BOOL(v8, "shouldRunLogCopyTasks"));
                    }

                    else
                    {
                      id v291 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v292 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v292 stdoutWrite:@"Invalid flag argument type."];

                      v293 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v293 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v294 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v295 = -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldRunLogCopyTasks";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v295;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v296 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v296,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunLogCopyTasks",  -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks"));

                  v297 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v297,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunLogCopyTasks",  -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks"));

                  if (v287 != -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks"))
                  {
                    v298 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldRunLogCopyTasks",  v287,  -[SystemDiagnostic shouldRunLogCopyTasks](v213, "shouldRunLogCopyTasks")));
                    [v565 appendString:v298];
                  }

                  unsigned int v299 = -[SystemDiagnostic shouldRunLogGenerationTasks](v213, "shouldRunLogGenerationTasks");
                  xpc_object_t v300 = xpc_dictionary_get_value(v8, "shouldRunLogGenerationTasks");
                  v301 = (void *)objc_claimAutoreleasedReturnValue(v300);
                  v302 = v301;
                  if (v301)
                  {
                    if (xpc_get_type(v301) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldRunLogGenerationTasks:]( v213,  "setShouldRunLogGenerationTasks:",  xpc_dictionary_get_BOOL(v8, "shouldRunLogGenerationTasks"));
                    }

                    else
                    {
                      id v303 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v304 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v304 stdoutWrite:@"Invalid flag argument type."];

                      v305 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v305 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v306 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v307 = -[SystemDiagnostic shouldRunLogGenerationTasks](v213, "shouldRunLogGenerationTasks");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldRunLogGenerationTasks";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v307;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v308 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v308,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunLogGenerationTasks",  -[SystemDiagnostic shouldRunLogGenerationTasks](v213, "shouldRunLogGenerationTasks"));

                  v309 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v309,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunLogGenerationTasks",  -[SystemDiagnostic shouldRunLogGenerationTasks](v213, "shouldRunLogGenerationTasks"));

                  if (v299 != -[SystemDiagnostic shouldRunLogGenerationTasks](v213, "shouldRunLogGenerationTasks"))
                  {
                    v310 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldRunLogGenerationTasks",  v299,  -[SystemDiagnostic shouldRunLogGenerationTasks]( v213,  "shouldRunLogGenerationTasks")));
                    [v565 appendString:v310];
                  }

                  unsigned int v311 = -[SystemDiagnostic shouldRunTimeSensitiveTasks](v213, "shouldRunTimeSensitiveTasks");
                  xpc_object_t v312 = xpc_dictionary_get_value(v8, "shouldRunTimeSensitiveTasks");
                  v313 = (void *)objc_claimAutoreleasedReturnValue(v312);
                  v314 = v313;
                  if (v313)
                  {
                    if (xpc_get_type(v313) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldRunTimeSensitiveTasks:]( v213,  "setShouldRunTimeSensitiveTasks:",  xpc_dictionary_get_BOOL(v8, "shouldRunTimeSensitiveTasks"));
                    }

                    else
                    {
                      id v315 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v316 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v316 stdoutWrite:@"Invalid flag argument type."];

                      v317 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v317 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v318 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v319 = -[SystemDiagnostic shouldRunTimeSensitiveTasks](v213, "shouldRunTimeSensitiveTasks");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldRunTimeSensitiveTasks";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v319;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v320 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v320,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunTimeSensitiveTasks",  -[SystemDiagnostic shouldRunTimeSensitiveTasks](v213, "shouldRunTimeSensitiveTasks"));

                  v321 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v321,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunTimeSensitiveTasks",  -[SystemDiagnostic shouldRunTimeSensitiveTasks](v213, "shouldRunTimeSensitiveTasks"));

                  if (v311 != -[SystemDiagnostic shouldRunTimeSensitiveTasks](v213, "shouldRunTimeSensitiveTasks"))
                  {
                    v322 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldRunTimeSensitiveTasks",  v311,  -[SystemDiagnostic shouldRunTimeSensitiveTasks]( v213,  "shouldRunTimeSensitiveTasks")));
                    [v565 appendString:v322];
                  }

                  unsigned int v323 = -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive");
                  xpc_object_t v324 = xpc_dictionary_get_value(v8, "shouldRunOSLogArchive");
                  v325 = (void *)objc_claimAutoreleasedReturnValue(v324);
                  v326 = v325;
                  if (v325)
                  {
                    if (xpc_get_type(v325) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldRunOSLogArchive:]( v213,  "setShouldRunOSLogArchive:",  xpc_dictionary_get_BOOL(v8, "shouldRunOSLogArchive"));
                    }

                    else
                    {
                      id v327 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v328 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v328 stdoutWrite:@"Invalid flag argument type."];

                      v329 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v329 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v330 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v331 = -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldRunOSLogArchive";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v331;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v332 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v332,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunOSLogArchive",  -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive"));

                  v333 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v333,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRunOSLogArchive",  -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive"));

                  if (v323 != -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive"))
                  {
                    v334 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldRunOSLogArchive",  v323,  -[SystemDiagnostic shouldRunOSLogArchive](v213, "shouldRunOSLogArchive")));
                    [v565 appendString:v334];
                  }

                  unsigned int v335 = -[SystemDiagnostic shouldRemoveTemporaryDirectory](v213, "shouldRemoveTemporaryDirectory");
                  xpc_object_t v336 = xpc_dictionary_get_value(v8, "shouldRemoveTemporaryDirectory");
                  v337 = (void *)objc_claimAutoreleasedReturnValue(v336);
                  v338 = v337;
                  if (v337)
                  {
                    if (xpc_get_type(v337) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldRemoveTemporaryDirectory:]( v213,  "setShouldRemoveTemporaryDirectory:",  xpc_dictionary_get_BOOL(v8, "shouldRemoveTemporaryDirectory"));
                    }

                    else
                    {
                      id v339 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v340 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v340 stdoutWrite:@"Invalid flag argument type."];

                      v341 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v341 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v342 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v343 = -[SystemDiagnostic shouldRemoveTemporaryDirectory](v213, "shouldRemoveTemporaryDirectory");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldRemoveTemporaryDirectory";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v343;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v344 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v344,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRemoveTemporaryDirectory",  -[SystemDiagnostic shouldRemoveTemporaryDirectory](v213, "shouldRemoveTemporaryDirectory"));

                  v345 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v345,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldRemoveTemporaryDirectory",  -[SystemDiagnostic shouldRemoveTemporaryDirectory](v213, "shouldRemoveTemporaryDirectory"));

                  if (v335 != -[SystemDiagnostic shouldRemoveTemporaryDirectory]( v213,  "shouldRemoveTemporaryDirectory"))
                  {
                    v346 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldRemoveTemporaryDirectory",  v335,  -[SystemDiagnostic shouldRemoveTemporaryDirectory]( v213,  "shouldRemoveTemporaryDirectory")));
                    [v565 appendString:v346];
                  }

                  unsigned int v347 = -[SystemDiagnostic verbose](v213, "verbose");
                  xpc_object_t v348 = xpc_dictionary_get_value(v8, "verbose");
                  v349 = (void *)objc_claimAutoreleasedReturnValue(v348);
                  v350 = v349;
                  if (v349)
                  {
                    if (xpc_get_type(v349) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setVerbose:](v213, "setVerbose:", xpc_dictionary_get_BOOL(v8, "verbose"));
                    }

                    else
                    {
                      id v351 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v352 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v352 stdoutWrite:@"Invalid flag argument type."];

                      v353 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v353 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v354 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v355 = -[SystemDiagnostic verbose](v213, "verbose");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "verbose";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v355;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v356 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v356,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "verbose",  -[SystemDiagnostic verbose](v213, "verbose"));

                  v357 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v357,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "verbose",  -[SystemDiagnostic verbose](v213, "verbose"));

                  if (v347 != -[SystemDiagnostic verbose](v213, "verbose"))
                  {
                    v358 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "verbose",  v347,  -[SystemDiagnostic verbose](v213, "verbose")));
                    [v565 appendString:v358];
                  }

                  unsigned int v359 = -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression");
                  xpc_object_t v360 = xpc_dictionary_get_value(v8, "useParallelCompression");
                  v361 = (void *)objc_claimAutoreleasedReturnValue(v360);
                  v362 = v361;
                  if (v361)
                  {
                    if (xpc_get_type(v361) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setUseParallelCompression:]( v213,  "setUseParallelCompression:",  xpc_dictionary_get_BOOL(v8, "useParallelCompression"));
                    }

                    else
                    {
                      id v363 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v364 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v364 stdoutWrite:@"Invalid flag argument type."];

                      v365 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v365 log:@"Invalid flag argument type."];

                      uint64_t v213 = v566;
                    }
                  }

                  id v366 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v367 = -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "useParallelCompression";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v367;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v368 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v368,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "useParallelCompression",  -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression"));

                  v369 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v369,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "useParallelCompression",  -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression"));

                  if (v359 != -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression"))
                  {
                    v370 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "useParallelCompression",  v359,  -[SystemDiagnostic useParallelCompression](v213, "useParallelCompression")));
                    [v565 appendString:v370];
                  }

                  v371 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                  unsigned int v372 = [v371 shouldGatherBTLogs];

                  xpc_object_t v373 = xpc_dictionary_get_value(v8, "shouldGatherBTLogs");
                  v374 = (void *)objc_claimAutoreleasedReturnValue(v373);
                  v375 = v374;
                  if (v374)
                  {
                    if (xpc_get_type(v374) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      BOOL v379 = xpc_dictionary_get_BOOL(v8, "shouldGatherBTLogs");
                      v378 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                      [v378 setShouldGatherBTLogs:v379];
                    }

                    else
                    {
                      id v376 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v377 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v377 stdoutWrite:@"Invalid flag argument type."];

                      v378 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v378 log:@"Invalid flag argument type."];
                    }
                  }

                  id v380 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v381 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                    unsigned int v382 = [v381 shouldGatherBTLogs];
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldGatherBTLogs";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v382;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v383 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  v384 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                  objc_msgSend( v383,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldGatherBTLogs",  objc_msgSend(v384, "shouldGatherBTLogs"));

                  v385 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  v386 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                  objc_msgSend( v385,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldGatherBTLogs",  objc_msgSend(v386, "shouldGatherBTLogs"));

                  v387 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                  LODWORD(v386) = [v387 shouldGatherBTLogs];

                  if (v372 != (_DWORD)v386)
                  {
                    v388 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticBT sharedInstance]( &OBJC_CLASS___SystemDiagnosticBT,  "sharedInstance"));
                    v389 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldGatherBTLogs",  v372,  [v388 shouldGatherBTLogs]));

                    [v565 appendString:v389];
                  }

                  string = xpc_dictionary_get_string(v8, "onlyRunContainersWithNames");
                  v391 = v566;
                  if (string)
                  {
                    v392 = string;
                    v393 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  string));
                    -[SystemDiagnostic createOnlyRunContainersWithNamesArray:]( v566,  "createOnlyRunContainersWithNamesArray:",  v393);

                    id v394 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)__int128 buf = 136315138;
                      *(void *)v584 = v392;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s",  buf,  0xCu);
                    }

                    v395 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                    objc_msgSend( v395,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s",  v392);

                    v396 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                    objc_msgSend( v396,  "log:",  @"sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s",  v392);

                    v391 = v566;
                  }

                  if (!-[SystemDiagnostic shouldRemoveTemporaryDirectory](v391, "shouldRemoveTemporaryDirectory"))
                  {
                    id v397 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)__int128 buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disabling streaming as we are not removing the temporary directory",  buf,  2u);
                    }

                    v398 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                    [v398 log:@"Disabling streaming as we are not removing the temporary directory"];

                    -[SystemDiagnostic setDisableStreamTar:](v391, "setDisableStreamTar:", 1LL);
                  }

                  unsigned int v399 = -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData");
                  xpc_object_t v400 = xpc_dictionary_get_value(v8, "shouldGetFeedbackData");
                  v401 = (void *)objc_claimAutoreleasedReturnValue(v400);
                  v402 = v401;
                  if (v401)
                  {
                    if (xpc_get_type(v401) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setShouldGetFeedbackData:]( v391,  "setShouldGetFeedbackData:",  xpc_dictionary_get_BOOL(v8, "shouldGetFeedbackData"));
                    }

                    else
                    {
                      id v403 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v404 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v404 stdoutWrite:@"Invalid flag argument type."];

                      v405 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v405 log:@"Invalid flag argument type."];

                      v391 = v566;
                    }
                  }

                  id v406 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v407 = -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "shouldGetFeedbackData";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v407;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v408 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v408,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldGetFeedbackData",  -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData"));

                  v409 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v409,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "shouldGetFeedbackData",  -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData"));

                  if (v399 != -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData"))
                  {
                    v410 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "shouldGetFeedbackData",  v399,  -[SystemDiagnostic shouldGetFeedbackData](v391, "shouldGetFeedbackData")));
                    [v565 appendString:v410];
                  }

                  unsigned int v411 = -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar");
                  xpc_object_t v412 = xpc_dictionary_get_value(v8, "disableStreamTar");
                  v413 = (void *)objc_claimAutoreleasedReturnValue(v412);
                  v414 = v413;
                  if (v413)
                  {
                    if (xpc_get_type(v413) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setDisableStreamTar:]( v391,  "setDisableStreamTar:",  xpc_dictionary_get_BOOL(v8, "disableStreamTar"));
                    }

                    else
                    {
                      id v415 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v416 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v416 stdoutWrite:@"Invalid flag argument type."];

                      v417 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v417 log:@"Invalid flag argument type."];

                      v391 = v566;
                    }
                  }

                  id v418 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v419 = -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "disableStreamTar";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v419;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v420 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v420,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "disableStreamTar",  -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar"));

                  v421 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v421,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "disableStreamTar",  -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar"));

                  if (v411 != -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar"))
                  {
                    v422 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "disableStreamTar",  v411,  -[SystemDiagnostic disableStreamTar](v391, "disableStreamTar")));
                    [v565 appendString:v422];
                  }

                  unsigned int v423 = -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback");
                  xpc_object_t v424 = xpc_dictionary_get_value(v8, "disableUIFeedback");
                  v425 = (void *)objc_claimAutoreleasedReturnValue(v424);
                  v426 = v425;
                  if (v425)
                  {
                    if (xpc_get_type(v425) == (xpc_type_t)&_xpc_type_BOOL)
                    {
                      -[SystemDiagnostic setDisableUIFeedback:]( v391,  "setDisableUIFeedback:",  xpc_dictionary_get_BOOL(v8, "disableUIFeedback"));
                    }

                    else
                    {
                      id v427 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                      }

                      v428 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v428 stdoutWrite:@"Invalid flag argument type."];

                      v429 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      [v429 log:@"Invalid flag argument type."];

                      v391 = v566;
                    }
                  }

                  id v430 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v431 = -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback");
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "disableUIFeedback";
                    *(_WORD *)&v584[8] = 1024;
                    LODWORD(v585) = v431;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                  }

                  v432 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v432,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "disableUIFeedback",  -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback"));

                  v433 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  objc_msgSend( v433,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "disableUIFeedback",  -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback"));

                  if (v423 != -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback"))
                  {
                    v434 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "disableUIFeedback",  v423,  -[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback")));
                    [v565 appendString:v434];
                  }

                  if (-[SystemDiagnostic disableUIFeedback](v391, "disableUIFeedback")) {
                    -[SystemDiagnostic setShouldDisplayTarBall:](v391, "setShouldDisplayTarBall:", 0LL);
                  }
                  v435 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
                  objc_msgSend(v435, "setNoTimeout:", xpc_dictionary_get_BOOL(v8, "setNoTimeOut"));

                  uint64_t v437 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v436);
                  uint64_t v439 = objc_opt_class(&OBJC_CLASS___NSArray, v438);
                  uint64_t v441 = objc_opt_class(&OBJC_CLASS___NSString, v440);
                  uint64_t v443 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v442);
                  uint64_t v445 = objc_opt_class(&OBJC_CLASS___NSDictionary, v444);
                  uint64_t v447 = objc_opt_class(&OBJC_CLASS___NSNumber, v446);
                  v449 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v437,  v439,  v441,  v443,  v445,  v447,  objc_opt_class(&OBJC_CLASS___NSNull, v448),  0LL);
                  v450 = (void *)objc_claimAutoreleasedReturnValue(v449);

                  size_t length = 0LL;
                  v451 = xpc_dictionary_get_data(v8, "capOverride", &length);
                  if (v451)
                  {
                    uint64_t v452 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v451,  length));
                    if (v452)
                    {
                      v453 = (void *)v452;
                      id v575 = 0LL;
                      v454 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v450,  v452,  &v575));
                      id v455 = v575;
                      v456 = v455;
                      if (v454)
                      {

                        uint64_t v458 = objc_opt_class(&OBJC_CLASS___NSDictionary, v457);
                        if ((objc_opt_isKindOfClass(v454, v458) & 1) != 0)
                        {
                          id v459 = v454;
                          id v460 = &_os_log_default;
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)__int128 buf = 136315394;
                            *(void *)v584 = "capOverride";
                            *(_WORD *)&v584[8] = 2112;
                            id v585 = v459;
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting %s to %@",  buf,  0x16u);
                          }

                          v461 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                          [v461 log:@"Setting %s to %@", "capOverride", v459];

                          -[SystemDiagnostic setCapOverride:](v566, "setCapOverride:", v459);
LABEL_365:
                          xpc_object_t v473 = xpc_dictionary_get_value(v8, "capOverrideFullLogarchive");
                          v474 = (void *)objc_claimAutoreleasedReturnValue(v473);
                          v475 = v474;
                          if (v474)
                          {
                            if (xpc_get_type(v474) == (xpc_type_t)&_xpc_type_BOOL)
                            {
                              BOOL v479 = xpc_dictionary_get_BOOL(v8, "capOverrideFullLogarchive");
LABEL_372:

                              id v480 = &_os_log_default;
                              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)__int128 buf = 136315394;
                                *(void *)v584 = "capOverrideFullLogarchive";
                                *(_WORD *)&v584[8] = 1024;
                                LODWORD(v585) = v479;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to BOOL %d",  buf,  0x12u);
                              }

                              v481 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                              objc_msgSend( v481,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "capOverrideFullLogarchive",  v479);

                              v482 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                              objc_msgSend( v482,  "log:",  @"sysdiagnose XPC dictionary: Set %s to BOOL %d",  "capOverrideFullLogarchive",  v479);

                              if (v479)
                              {
                                v483 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %d to %d\n",  "capOverrideFullLogarchive",  0LL,  1LL));
                                [v565 appendString:v483];

                                v484 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic capOverride](v566, "capOverride"));
                                if (v484)
                                {
                                  v485 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic capOverride](v566, "capOverride"));
                                  v486 = (NSMutableDictionary *)[v485 mutableCopy];
                                }

                                else
                                {
                                  v486 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                                }

                                v586[0] = @"filename";
                                v586[1] = OSLogConstructPersistSizeLimit;
                                v587[0] = @"system_logs_full.logarchive";
                                v587[1] = &off_10009A4B0;
                                v586[2] = OSLogConstructSpecialSizeLimit;
                                v586[3] = OSLogConstructSignpostSizeLimit;
                                v587[2] = &off_10009A4B0;
                                v587[3] = &off_10009A4B0;
                                v586[4] = OSLogConstructHighVolumeSizeLimit;
                                v586[5] = OSLogConstructPersistAgeLimit;
                                v587[4] = &off_10009A4B0;
                                v587[5] = &off_10009A4B0;
                                v586[6] = OSLogConstructSpecialAgeLimit;
                                v586[7] = OSLogConstructSignpostAgeLimit;
                                v587[6] = &off_10009A4B0;
                                v587[7] = &off_10009A4B0;
                                v586[8] = OSLogConstructHighVolumeAgeLimit;
                                v586[9] = @"timeout";
                                v587[8] = &off_10009A4B0;
                                v587[9] = &off_10009A4C8;
                                v487 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v587,  v586,  10LL));
                                -[NSMutableDictionary setObject:forKeyedSubscript:]( v486,  "setObject:forKeyedSubscript:",  v487,  @"logarchive");
                                id v488 = -[NSMutableDictionary copy](v486, "copy");
                                -[SystemDiagnostic setCapOverride:](v566, "setCapOverride:", v488);
                              }

                              v489 = v566;
                              v490 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v566, "warnProcessAllowlist"));
                              xpc_object_t v491 = xpc_dictionary_get_value(v8, "warnProcAllowlist");
                              v492 = (void *)objc_claimAutoreleasedReturnValue(v491);
                              v493 = v492;
                              if (v492)
                              {
                                if (xpc_get_type(v492) == (xpc_type_t)&_xpc_type_string)
                                {
                                  v497 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v8, "warnProcAllowlist"));
                                  v496 = (void *)objc_claimAutoreleasedReturnValue(v497);
                                  -[SystemDiagnostic setWarnProcessAllowlist:](v566, "setWarnProcessAllowlist:", v496);
                                }

                                else
                                {
                                  id v494 = &_os_log_default;
                                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_WORD *)__int128 buf = 0;
                                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                                  }

                                  v495 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                                  [v495 stdoutWrite:@"Invalid flag argument type."];

                                  v496 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                                  [v496 log:@"Invalid flag argument type."];
                                  v489 = v566;
                                }
                              }

                              id v498 = &_os_log_default;
                              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                              {
                                id v499 = objc_claimAutoreleasedReturnValue( -[SystemDiagnostic warnProcessAllowlist]( v489, "warnProcessAllowlist"));
                                id v500 = [v499 UTF8String];
                                *(_DWORD *)__int128 buf = 136315394;
                                *(void *)v584 = "warnProcAllowlist";
                                *(_WORD *)&v584[8] = 2080;
                                id v585 = v500;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose XPC dictionary: Set %s to string %s",  buf,  0x16u);
                              }

                              v501 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                              id v502 = objc_claimAutoreleasedReturnValue( -[SystemDiagnostic warnProcessAllowlist]( v489, "warnProcessAllowlist"));
                              objc_msgSend( v501,  "stdoutWrite:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "warnProcAllowlist",  objc_msgSend(v502, "UTF8String"));

                              v503 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                              id v504 = objc_claimAutoreleasedReturnValue( -[SystemDiagnostic warnProcessAllowlist]( v566, "warnProcessAllowlist"));
                              unsigned int v52 = v566;
                              objc_msgSend( v503,  "log:",  @"sysdiagnose XPC dictionary: Set %s to string %s",  "warnProcAllowlist",  objc_msgSend(v504, "UTF8String"));

                              v505 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v566, "warnProcessAllowlist"));
                              if ([v490 isEqualToString:v505])
                              {
                                v506 = obj;
                              }

                              else
                              {
                                v506 = obj;
                                if (v490)
                                {
                                  v507 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic warnProcessAllowlist]( v566,  "warnProcessAllowlist"));

                                  if (!v507)
                                  {
LABEL_394:

                                    uint64_t v45 = v564;
                                    goto LABEL_395;
                                  }

                                  v508 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic warnProcessAllowlist]( v566,  "warnProcessAllowlist"));
                                  v505 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %@ to %@\n",  "warnProcAllowlist",  v490,  v508));

                                  [v565 appendString:v505];
                                }
                              }

                              goto LABEL_394;
                            }

                            id v476 = &_os_log_default;
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)__int128 buf = 0;
                              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
                            }

                            v477 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                            [v477 stdoutWrite:@"Invalid flag argument type."];

                            v478 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                            [v478 log:@"Invalid flag argument type."];
                          }

                          BOOL v479 = 0LL;
                          goto LABEL_372;
                        }

LABEL_364:
                        id v459 = 0LL;
                        goto LABEL_365;
                      }

                      id v469 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        v470 = (void *)objc_claimAutoreleasedReturnValue([v456 localizedDescription]);
                        *(_DWORD *)__int128 buf = 136315394;
                        *(void *)v584 = "capOverride";
                        *(_WORD *)&v584[8] = 2112;
                        id v585 = v470;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error fetching key '%s': %@",  buf,  0x16u);
                      }

                      v471 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                      v472 = (void *)objc_claimAutoreleasedReturnValue([v456 localizedDescription]);
                      [v471 log:@"Error fetching key '%s': %@", "capOverride", v472];
                    }
                  }

                  v454 = 0LL;
                  goto LABEL_364;
                }

                uint64_t v234 = objc_opt_class(&OBJC_CLASS___NSSet, v233);
                if ((objc_opt_isKindOfClass(v230, v234) & 1) != 0)
                {
                  id v235 = v230;
                  id v236 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int128 buf = 136315394;
                    *(void *)v584 = "remoteUUIDs";
                    *(_WORD *)&v584[8] = 2112;
                    id v585 = v235;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting %s to %@",  buf,  0x16u);
                  }

                  v237 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
                  [v237 log:@"Setting %s to %@", "remoteUUIDs", v235];

                  v230 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
                  v238 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v213, "diagnosticID"));
                  v561 = v235;
                  [v230 setRemoteUUIDs:v235 forDiagnosticID:v238];

                  goto LABEL_183;
                }
              }

              else
              {
                v230 = 0LL;
              }

              v561 = 0LL;
              goto LABEL_183;
            }

            v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            LOBYTE(length) = 0;
            v161 = (void *)objc_claimAutoreleasedReturnValue([v156 path]);
            unsigned int v162 = [v160 fileExistsAtPath:v161 isDirectory:&length];
            int v163 = length;

            if (v162 && v163)
            {

              goto LABEL_131;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Specified output directory does not exist.",  buf,  2u);
            }

            v462 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v462 log:@"Specified output directory does not exist."];

            uint64_t *v563 = 1LL;
            v463 = sub_100024174();
            v464 = (os_log_s *)objc_claimAutoreleasedReturnValue(v463);
            uint64_t v53 = v564;
            if (os_signpost_enabled(v464))
            {
              *(_WORD *)__int128 buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v464,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "doSDSetup",  "[do_sysdiagnose] setup/parse input ended!",  buf,  2u);
            }

LABEL_356:
            id v9 = 0LL;
            unsigned int v52 = v566;
LABEL_437:

            goto LABEL_438;
          }

          v151 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v566, "baseDirectory"));
          v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property %s changed from default %@ to %@\n",  "baseDirectory",  v133,  v151));

          [v565 appendString:v149];
        }

        goto LABEL_126;
      }

      id v121 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid flag argument type.",  buf,  2u);
      }

      id v122 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v122 stdoutWrite:@"Invalid flag argument type."];

      id v123 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v123 log:@"Invalid flag argument type."];
    }

    id v124 = 0LL;
    goto LABEL_110;
  }

  id v9 = 0LL;
  *a4 = 5LL;
LABEL_438:

  return v9;
}

void sub_1000364C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  unsigned int v5 = proc_pidinfo(pid, 3, 0LL, &buffer, 136);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v5 > 0x87)
  {
    if (v6) {
      sub_100055DA8();
    }
  }

  else if (v6)
  {
    sub_100055D30();
  }

  if ((sub_10004024C() & 1) != 0)
  {
LABEL_8:
    xpc_type_t type = xpc_get_type(v3);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      if (reply)
      {
        uint64_t v12 = reply;
        id v13 = sub_10002E5FC(*(void **)(a1 + 40), v3, reply);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v12);
LABEL_24:

        goto LABEL_25;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ignoring message: unable to create reply",  (uint8_t *)&buffer,  2u);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v9 = v8;
      uint32_t v10 = @"Ignoring message: unable to create reply";
LABEL_23:
      [v8 stdoutWrite:v10];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v12, "log:", v10, v16);
      goto LABEL_24;
    }

    if (type != (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unexpected peer event",  (uint8_t *)&buffer,  2u);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v9 = v8;
      uint32_t v10 = @"unexpected peer event";
      goto LABEL_23;
    }

    if (v3 != &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        int buffer = 136315138;
        id v18 = string;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "peer error: %s",  (uint8_t *)&buffer,  0xCu);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v15,  "stdoutWrite:",  @"peer error: %s",  xpc_dictionary_get_string(v3, _xpc_error_key_description));

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v12, "log:", @"peer error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description));
      goto LABEL_24;
    }
  }

  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }

LABEL_25:
}

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
    *(_DWORD *)__int128 buf = 138412290;
    id v27 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nOutput available at '%@'.",  buf,  0xCu);
  }

  xpc_object_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
  [v24 log:@"\nOutput available at '%@'.", v25];
}

uint64_t sub_1000367D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

BOOL sub_1000367E8(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

  ;
}

double sub_1000367FC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100036820(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

void sub_10003686C(id a1)
{
  id v10 = 0LL;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[LWCR withVersion:withConstraintCategory:withRequirements:withError:]( &OBJC_CLASS___LWCR,  "withVersion:withConstraintCategory:withRequirements:withError:",  1LL,  17LL,  0LL,  &v10));
  id v2 = v10;
  id v3 = (void *)qword_1000A52A0;
  qword_1000A52A0 = v1;

  if (!qword_1000A52A0)
  {
    id v4 = sub_1000241E4();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_claimAutoreleasedReturnValue([v2 description]);
      id v7 = [v6 UTF8String];
      *(_DWORD *)__int128 buf = 136315138;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to generate launch constraint: %s",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v9 = objc_claimAutoreleasedReturnValue([v2 description]);
    objc_msgSend( v8,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Failed to generate launch constraint: %s",  objc_msgSend(v9, "UTF8String"));

    if (!qword_1000A52A0) {
      sub_100055E2C();
    }
  }
}

void sub_100036F1C(id a1)
{
  uint64_t v1 = open("/dev/null", 2);
  if ((_DWORD)v1 == -1) {
    sub_100055E54();
  }
  id v2 = -[NSFileHandle initWithFileDescriptor:](objc_alloc(&OBJC_CLASS___NSFileHandle), "initWithFileDescriptor:", v1);
  id v3 = (void *)qword_1000A52B8;
  qword_1000A52B8 = (uint64_t)v2;

  if (!qword_1000A52B8) {
    sub_100055E7C();
  }
}

void sub_100038748( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    id v19 = sub_1000241E4();
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v23 = (id)objc_claimAutoreleasedReturnValue([v18 name]);
      xpc_object_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 executionLine]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 reason]);
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v24;
      a16 = 2112;
      a17 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error '%@' while attempting to run '%@': '%@'",  (uint8_t *)&buf,  0x20u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v17 executionLine]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 reason]);
    [v21 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Error '%@' while attempting to run '%@': '%@'"];

    objc_end_catch();
    JUMPOUT(0x10003873CLL);
  }

  _Unwind_Resume(a1);
}

void sub_10003968C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, __int128 buf, int a22, __int16 a23, __int16 a24, id a25, __int128 a26)
{
  if (a2 == 1)
  {
    id v42 = objc_begin_catch(a1);
    id v27 = sub_1000241E4();
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v42 name]);
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v26 launchPath]);
      id v31 = (id)objc_claimAutoreleasedReturnValue([v30 lastPathComponent]);
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v26 stdoutPath]);
      id v33 = (id)objc_claimAutoreleasedReturnValue([v32 lastPathComponent]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v42 reason]);
      LODWORD(buf) = 138413058;
      *(void *)((char *)&buf + 4) = v29;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v31;
      a24 = 2112;
      a25 = v33;
      LOWORD(a26) = 2112;
      *(void *)((char *)&a26 + 2) = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Error '%@' while attempting to terminate '%@|%@': %@'",  (uint8_t *)&buf,  0x2Au);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v42 name]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v26 launchPath]);
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 lastPathComponent]);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v26 stdoutPath]);
    dispatch_semaphore_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lastPathComponent]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v42 reason]);
    [v35 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Error '%@' while attempting to terminate '%@|%@': %@'"];

    objc_end_catch();
    JUMPOUT(0x1000395C4LL);
  }

  _Unwind_Resume(a1);
}

id sub_100039884(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRunning];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) stop:(*(_DWORD *)(a1 + 40) + 1)];
  }
  return result;
}

void sub_100039E20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100039E34(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100039E40( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100039E7C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100039ED0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SDTaskDepot);
  id v2 = (void *)qword_1000A52C0;
  qword_1000A52C0 = (uint64_t)v1;

  [(id)qword_1000A52C0 setOutputDirectory:0];
  [(id)qword_1000A52C0 setMayStartExecuting:1];
  [(id)qword_1000A52C0 setNoTimeout:0];
  [(id)qword_1000A52C0 setTotalTasks:0];
  [(id)qword_1000A52C0 setTotalFailedTasks:0];
  [(id)qword_1000A52C0 setTotalTimeouts:0];
  [(id)qword_1000A52C0 setPushBufferDelegate:0];
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepot.taskQueue", v4);
  [(id)qword_1000A52C0 setTaskQueue:v5];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  [(id)qword_1000A52C0 setDefaultAllTasksFinishedSemaphore:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [(id)qword_1000A52C0 setAllTasksFinishedSemaphoresArray:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [(id)qword_1000A52C0 setRunningTaskContainers:v8];

  [(id)qword_1000A52C0 setNumRunningBlocks:0];
  [(id)qword_1000A52C0 setNumRunningTaskContainers:0];
  [(id)qword_1000A52C0 setMinimumTimeBeforeTimeouts:0.0];
  [(id)qword_1000A52C0 setTaskCompletionBlock:0];
}

void sub_10003A458(_Unwind_Exception *a1)
{
}

void sub_10003A7DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_10003A81C(uint64_t a1)
{
  uint64_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(void *)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result != 0;
  return result;
}

void sub_10003AAB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_10003AAE0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) reapTasks];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += result;
  return result;
}

id sub_10003AC68(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMayStartExecuting:0];
}

void sub_10003B590( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_10003B5C4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _execute];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_10003B5FC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _execute];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_10003B7EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10003B804(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend( *(id *)(a1 + 32),  "setBlockUntilFinished:",  objc_msgSend(*(id *)(a1 + 32), "runByItself") | objc_msgSend( *(id *)(a1 + 32),  "blockUntilFinished"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [*v2 updateContainerWithOverride];
  if (([*v2 evaluateCollectionFlags] & 1) == 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 taskCompletionBlock]);

    if (!v16) {
      goto LABEL_19;
    }
    id v17 = (void (**)(void))objc_claimAutoreleasedReturnValue([v3 taskCompletionBlock]);
    v17[2]();
LABEL_18:

    goto LABEL_19;
  }

  if ([*v2 runByItself])
  {
    id v4 = sub_1000241E4();
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue([*v2 name]);
      *(_DWORD *)__int128 buf = 138412290;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting for other containers to finish before starting %@",  buf,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*v2 name]);
    [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Waiting for other containers to finish before starting %@", v8 category msg];

    [v3 waitUntilAllTasksComplete:0];
  }

  id v9 = *v2;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(v9) = [v9 setStartDate:v10 AndExecuteFromCallback:0];

  if ((v9 & 1) == 0)
  {
    id v18 = sub_1000241E4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000568FC(v2);
    }

    id v17 = (void (**)(void))objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*v2 name]);
    [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to execute %@", v20 category msg];

    goto LABEL_18;
  }

  if ([*v2 blockUntilFinished] && objc_msgSend(v3, "mayStartExecuting"))
  {
    uint64_t v11 = sub_1000241E4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*v2 name]);
      *(_DWORD *)__int128 buf = 138412290;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Waiting for container %@ to finish",  buf,  0xCu);
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*v2 name]);
    [v14 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Waiting for container %@ to finish", v15 category msg];

    [v3 waitUntilAllTasksComplete:0];
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
LABEL_19:
}

void sub_10003C460(uint64_t a1)
{
  id v2 = (os_activity_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) executionActivity]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C4E4;
  v5[3] = &unk_100089138;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  os_activity_apply(v2, v5);
}

id sub_10003C4E4(uint64_t a1)
{
  id v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) exitSource]);
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) childExitHandler];
  return [*(id *)(a1 + 40) markTaskAsDone:*(void *)(a1 + 32)];
}

void sub_10003C524(uint64_t a1)
{
  id v2 = (os_activity_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) executionActivity]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C5A8;
  v5[3] = &unk_100089138;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  os_activity_apply(v2, v5);
}

id sub_10003C5A8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRunning];
  if ((_DWORD)result)
  {
    [*(id *)(a1 + 32) finishChild];
    return [*(id *)(a1 + 40) markTaskAsDone:*(void *)(a1 + 32)];
  }

  return result;
}

void sub_10003CA58(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionBlock]);
  v1[2]();
}

void sub_10003D040(uint64_t a1)
{
  id v2 = (os_activity_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) executionActivity]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D0B4;
  block[3] = &unk_100088EA8;
  void block[4] = *(void *)(a1 + 32);
  os_activity_apply(v2, block);
}

void sub_10003D0B4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setNumTimeouts:", (char *)objc_msgSend(*(id *)(a1 + 32), "numTimeouts") + 1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v3 = [*v1 countCPUTimeUsedNS];
  if (([*v1 isRunningAlone] & 1) != 0
    || ([*v1 ranForMaximumTime] & 1) != 0
    || [*v1 ranForMinimumTime]
    && [*v1 exceededAllowedCPUTime:v3])
  {
    uint64_t v4 = sub_1000241E4();
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000569F8(v1);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*v1 timeoutMetricsString]);
    [v6 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Task(s) timed out: %@", v7, v8 category msg];

    objc_msgSend( *v1,  "setNumReapedTasks:",  (char *)objc_msgSend(*v1, "reapTasks") + (void)objc_msgSend(*v1, "numReapedTasks"));
    objc_msgSend(v2, "setTotalTimeouts:", objc_msgSend(v2, "totalTimeouts") + 1);
  }

  else
  {
    [*v1 timeout];
    if (v9 > 5.0) {
      double v9 = 5.0;
    }
    uint64_t v10 = v9;
    uint64_t v11 = sub_1000241E4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([*v1 timeoutMetricsString]);
      *(_DWORD *)__int128 buf = 138412802;
      id v19 = v13;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@",  buf,  0x1Cu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*v1 timeoutMetricsString]);
    [v15 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@", v16, v10, v17 category msg];

    [*v1 resetTimeout:v10];
  }
}

LABEL_29:
    if (v11) {
      return 1;
    }
  }

  else
  {
  }

  dispatch_semaphore_t v40 = sub_1000241E4();
  uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    sub_100056AA0(self);
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  dispatch_time_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  [v42 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"No tasks were created for %@", v43 category msg];

  unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
  if (v44)
  {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    unsigned int v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v45 taskQueue]);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10003DC24;
    v47[3] = &unk_100088EA8;
    v47[4] = self;
    dispatch_sync(v46, v47);
  }

  else
  {
    -[SDTaskDepotContainer endExecution](self, "endExecution");
  }

  return 0;
}

id sub_10003DBDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) endExecution];
}

void sub_10003DBE4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) runningTasks]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

id sub_10003DC24(uint64_t a1)
{
  return [*(id *)(a1 + 32) endExecution];
}

id sub_10003DD00(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTasks];
}

id sub_10003E404(uint64_t a1)
{
  id v2 = sub_1000241E4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100056C2C(a1);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  [v4 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing.", v5 category msg];

  return [*(id *)(a1 + 32) end];
}

void sub_10003E548(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) startTimeout];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003E7E4;
  v18[3] = &unk_100088EA8;
  v18[4] = *v1;
  double v2 = sub_10002484C(v18);
  id v3 = sub_1000241E4();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
    *(_DWORD *)__int128 buf = 138412546;
    __int16 v20 = v5;
    __int16 v21 = 2048;
    double v22 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ block container executed in %.1f seconds",  buf,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
  [v6 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ block container executed in %.1f seconds", v7, *(void *)&v2 category msg];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*v1 completionBlock]);
  if (v8)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003E83C;
    v17[3] = &unk_100088EA8;
    v17[4] = *v1;
    double v9 = sub_10002484C(v17);
    if (v9 > 1.0)
    {
      uint64_t v10 = sub_1000241E4();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100056CA8(v1);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
      [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v13, *(void *)&v9, 0x3FF0000000000000 category msg];
    }
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 taskQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E898;
  block[3] = &unk_100088EA8;
  void block[4] = *v1;
  dispatch_sync(v15, block);
}

void sub_10003E7E4(uint64_t a1)
{
  uint64_t v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) block]);
  uint64_t v2 = v4[2]();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [*(id *)(a1 + 32) setPaths:v3];
}

void sub_10003E83C(uint64_t a1)
{
  id v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionBlock]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) paths]);
  v3[2](v3, v2);
}

id sub_10003E898(uint64_t a1)
{
  return [*(id *)(a1 + 32) end];
}

void sub_10003EB48(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v10 = sub_1000241E4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
      id v12 = _xpc_error_key_description;
      *(_DWORD *)__int128 buf = 138412546;
      id v39 = v34;
      __int16 v40 = 2080;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Helper connection error for task %@: %s",  buf,  0x16u);
    }

    else
    {
      id v12 = _xpc_error_key_description;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
    [v8 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: %s", v9, xpc_dictionary_get_string(v3, v12) category msg];
  }

  else
  {
    dispatch_queue_t v5 = type;
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (xpc_dictionary_get_BOOL(v3, "result"))
      {
        int v13 = 1;
        goto LABEL_15;
      }

      __int16 v14 = sub_1000241E4();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100056E2C(a1);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
      [v8 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: failure while running task.", v9, v35 category msg];
    }

    else
    {
      id v6 = sub_1000241E4();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100056EA8(a1, v5);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
      [v8 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: Received unexpected reply with type: %s", v9, xpc_type_get_name(v5) category msg];
    }
  }

  int v13 = 0;
LABEL_15:
  id v17 = *(void **)(a1 + 32);
  uint64_t v16 = (id *)(a1 + 32);
  [v17 setReply:v3];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([*v16 replyBlock]);

  if (v18)
  {
    if (!v13)
    {
      xpc_object_t v24 = sub_1000241E4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100056DB0(v16);
      }

      double v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([*v16 taskName]);
      [v22 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: not calling reply block due to failure", v23, v35, v36 category msg];
      goto LABEL_24;
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10003F020;
    v37[3] = &unk_100088EA8;
    v37[4] = *v16;
    double v19 = sub_10002484C(v37);
    if (v19 > 1.0)
    {
      __int16 v20 = sub_1000241E4();
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100056D2C(v16);
      }

      double v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([*v16 taskName]);
      [v22 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)", v23, *(void *)&v19, 0x3FF0000000000000 category msg];
LABEL_24:
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v26 recordHelperTaskEnd];

  id v27 = sub_100024174();
  int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  id v29 = v28;
  id v30 = *v16;
  if ((unint64_t)*v16 + 1 >= 2 && os_signpost_enabled(v28))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v30,  "Helper Task",  (const char *)&unk_100084B66,  buf,  2u);
  }

  xpc_object_t v31 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned int v32 = v31;
  if (v31)
  {
    xpc_dictionary_set_int64(v31, "taskType", -1LL);
    id v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*v16 logAgentConnection]);
    xpc_connection_send_message(v33, v32);
  }
}

void sub_10003F020(uint64_t a1)
{
  id v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) replyBlock]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) reply]);
  v3[2](v3, v2);
}

void sub_10003F4A0(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    id v3 = sub_1000241E4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "XPC connection with sysdiagnose_helper failed with error: %s",  buf,  0xCu);
    }

    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v5,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"XPC connection with sysdiagnose_helper failed with error: %s",  xpc_dictionary_get_string(v2, _xpc_error_key_description));
  }
}

void sub_10003F74C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10003F760( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

__CFString *sub_10003F784(int a1)
{
  uint64_t v2 = 0LL;
  switch(a1)
  {
    case -1:
      return @"END_HELPER";
    case 1:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ACCESSIBILITY_PREFERENCES";
      goto LABEL_64;
    case 2:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_AC_LOGS";
      goto LABEL_64;
    case 3:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ASPTOOL";
      goto LABEL_64;
    case 4:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ASPTOOL_MAGAZINE";
      goto LABEL_64;
    case 5:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ASPTOOL_SNAP";
      goto LABEL_64;
    case 6:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ASPTOOL_TRACE";
      goto LABEL_64;
    case 7:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_AWD";
      goto LABEL_64;
    case 8:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_BACKGROUND_POWER_LOGS";
      goto LABEL_64;
    case 9:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_BATTERY_HEALTH";
      goto LABEL_64;
    case 10:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_BATTERY_UI";
      goto LABEL_64;
    case 11:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_BTPHY";
      goto LABEL_64;
    case 12:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_CLOUDKIT_PREFERENCES";
      goto LABEL_64;
    case 13:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_CORECAPTURE_BT";
      goto LABEL_64;
    case 14:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_CORECAPTURE_CONFIG";
      goto LABEL_64;
    case 15:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_CORECAPTURE_WIFI";
      goto LABEL_64;
    case 16:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_COREREPAIR_DIAGNOSTIC";
      goto LABEL_64;
    case 17:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_DATACACHE";
      goto LABEL_64;
    case 18:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_DSCSYM";
      goto LABEL_64;
    case 19:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_ENDPOINT_SECURITY";
      goto LABEL_64;
    case 20:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_EXC_RESOURCE";
      goto LABEL_64;
    case 21:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_FDR_DIAGNOSTIC";
      goto LABEL_64;
    case 22:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_FILE_COORDINATION";
      goto LABEL_64;
    case 23:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_GE_AVAILABILITY";
      goto LABEL_64;
    case 24:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_HANDSHAKE";
      goto LABEL_64;
    case 25:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_HID_CRASHLOGS";
      goto LABEL_64;
    case 26:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_KEYBOARD_PREFERENCES";
      goto LABEL_64;
    case 27:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_LIBNOTIFY";
      goto LABEL_64;
    case 28:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_MEMORY_EXCEPTIONS";
      goto LABEL_64;
    case 29:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_MEMORY_EXCEPTIONS_LIST_LOGS";
      goto LABEL_64;
    case 30:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_NETWORK_RELAY";
      goto LABEL_64;
    case 31:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_OS_ELIGIBILITY";
      goto LABEL_64;
    case 32:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PERSONALIZATION";
      goto LABEL_64;
    case 33:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_POWER_LOGS";
      goto LABEL_64;
    case 34:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PREFERENCES";
      goto LABEL_64;
    case 35:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PREFERENCES_INTERNAL";
      goto LABEL_64;
    case 36:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PROACTIVE_INPUT";
      goto LABEL_64;
    case 37:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PROMPT";
      goto LABEL_64;
    case 38:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_PROXIMITY";
      goto LABEL_64;
    case 39:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_RUNNING_BOARD";
      goto LABEL_64;
    case 40:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_STACKSHOT_TAKE_AND_RETRIEVE";
      goto LABEL_64;
    case 41:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_STACKSHOT_RETRIEVE_EXISTING";
      goto LABEL_64;
    case 42:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_SYSMON";
      goto LABEL_64;
    case 43:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_SYSTEM_EXP";
      goto LABEL_64;
    case 44:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_SYSTEM_STATS";
      goto LABEL_64;
    case 45:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_AUGMENT_LG";
      goto LABEL_64;
    case 46:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_INFO";
      goto LABEL_64;
    case 47:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_KEYCHORD";
      goto LABEL_64;
    case 48:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_LOGARCHIVE_TIMEOUT";
      goto LABEL_64;
    case 49:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_OUTPUTDIR_TIMEOUT";
      goto LABEL_64;
    case 50:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TAILSPIN_SAVE_NO_SYMBOLICATE_TS";
      goto LABEL_64;
    case 51:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TIMEZONE";
      goto LABEL_64;
    case 52:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TRIAL";
      goto LABEL_64;
    case 53:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_TRIGGER_CORETHREAD_TOPOLOGY";
      goto LABEL_64;
    case 54:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_UNIFIED_ASSET";
      goto LABEL_64;
    case 55:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_INTELLIGENCE_PLATFORM";
      goto LABEL_64;
    case 56:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_POLARIS";
      goto LABEL_64;
    case 57:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_BASEBAND_TS_TRIGGER";
      goto LABEL_64;
    case 58:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_UID";
      goto LABEL_64;
    case 59:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_SPRING_BOARD_STATE_DUMP";
      goto LABEL_64;
    case 60:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_APPLECV3D";
      goto LABEL_64;
    case 61:
      id v4 = [@"TASK_TYPE_" length];
      dispatch_queue_t v5 = @"TASK_TYPE_SIRI_ENROLLMENT";
LABEL_64:
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v5, "substringFromIndex:", v4));
      break;
    default:
      return (__CFString *)v2;
  }

  return (__CFString *)v2;
}

uint64_t sub_10003FE7C(char *a1, size_t a2, const char *a3, const char *a4, const char *a5)
{
  time_t v19 = time(0LL);
  if (!localtime_r(&v19, &v18) || !strftime(__str, 0x40uLL, "%Y.%m.%d_%H-%M-%S%z", &v18))
  {
    uint32_t v10 = arc4random();
    snprintf(__str, 0x40uLL, "UNKNOWN-%u", v10);
  }

  uint64_t v11 = "";
  id v12 = "_";
  if (a3) {
    int v13 = a3;
  }
  else {
    int v13 = "";
  }
  if (!a3) {
    id v12 = "";
  }
  __int16 v14 = "-";
  if (a4)
  {
    id v15 = a4;
  }

  else
  {
    __int16 v14 = "";
    id v15 = "";
  }

  uint64_t v16 = ".";
  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v16 = "";
  }
  return snprintf(a1, a2, "%s%s%s%s%s%s%s", v13, v12, __str, v14, v15, v16, v11);
}

uint64_t sub_10003FFAC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  dispatch_queue_t v5 = (void *)xpc_connection_copy_entitlement_value(v4, [v3 UTF8String]);

  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v5))
    {
      uint64_t v6 = 1LL;
      goto LABEL_10;
    }

    uint64_t v6 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 1024;
    int v13 = 0;
    uint64_t v7 = "Peer has entitlement '%@' set, but value is %d";
    uint32_t v8 = 18;
    goto LABEL_5;
  }

  uint64_t v6 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    uint64_t v7 = "Peer does not have entitlement '%@' set, returning default NO for check";
    uint32_t v8 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
    uint64_t v6 = 0LL;
  }

uint64_t sub_100040124()
{
  if (qword_1000A52D8 != -1) {
    dispatch_once(&qword_1000A52D8, &stru_100089B20);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000A52D0) {
      uint64_t v0 = "launchd";
    }
    else {
      uint64_t v0 = "shell";
    }
    int v2 = 136315138;
    id v3 = v0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "started by %s",  (uint8_t *)&v2,  0xCu);
  }

  return byte_1000A52D0;
}

void sub_100040208(id a1)
{
  uint64_t v1 = 0LL;
  vproc_swap_integer(0LL, 5LL, 0LL, &v1);
  byte_1000A52D0 = v1 != 0;
}

uint64_t sub_10004024C()
{
  if (qword_1000A52E8 != -1) {
    dispatch_once(&qword_1000A52E8, &stru_100089B40);
  }
  return byte_1000A52E0;
}

void sub_10004028C(id a1)
{
  else {
    char has_internal_content = os_variant_has_internal_content("com.apple.sysdiagnose");
  }
  byte_1000A52E0 = has_internal_content;
  BOOL v3 = 0;
  if (sub_100040418(@"customer-mode", @"com.apple.sysdiagnose", &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Customer-mode enabled. Forcing external behavior.",  buf,  2u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }

    byte_1000A52E0 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000A52E0) {
      int v2 = "YES";
    }
    else {
      int v2 = "NO";
    }
    *(_DWORD *)__int128 buf = 136315138;
    dispatch_queue_t v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Apple Internal: %s",  buf,  0xCu);
  }

BOOL sub_100040418(void *a1, void *a2, BOOL *a3)
{
  dispatch_queue_t v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    int v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat) {
      *a3 = AppBooleanValue != 0;
    }
    BOOL v10 = v9 != 0;
  }

  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_100056FBC(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0LL;
  }

  return v10;
}

uint64_t sub_1000404C4(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a1;
  uint32_t v8 = a2;
  int v9 = a3;
  BOOL v10 = (__CFString *)v9;
  if (!v7 || !v8 || !v9 || !a4)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_100057030(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_11;
  }

  CFPropertyListRef v11 = CFPreferencesCopyValue(v7, v8, v9, kCFPreferencesAnyHost);
  if (!v11)
  {
LABEL_11:
    uint64_t v14 = 0LL;
    goto LABEL_12;
  }

  uint64_t v12 = (void *)v11;
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFNumberGetTypeID())
  {
    CFRelease(v12);
    goto LABEL_11;
  }

  *a4 = [v12 longValue];

  uint64_t v14 = 1LL;
LABEL_12:

  return v14;
}

BOOL sub_1000405A8(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  size_t v6 = v5;
  if (v5 >= v4) {
    size_t v7 = v4;
  }
  else {
    size_t v7 = v5;
  }
  if (!strncasecmp(a2, a1, v7)) {
    return 1LL;
  }
  if (v6 <= v4) {
    uint32_t v8 = a1;
  }
  else {
    uint32_t v8 = a2;
  }
  if (v6 <= v4) {
    int v9 = a2;
  }
  else {
    int v9 = a1;
  }
  return strcasestr(v8, v9) != 0LL;
}

BOOL sub_10004061C(void *a1, void *a2)
{
  id v3 = a2;
  if (proc_pidpath((int)[a1 intValue], buffer, 0x1000u) < 1)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    BOOL v5 = sub_1000405A8( (const char *)[v4 fileSystemRepresentation], (const char *)objc_msgSend(v3, "fileSystemRepresentation"));
  }

  return v5;
}

uint64_t sub_100040704()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not macOS or iOS; returning NO for isComputeModuleB check",
      v1,
      2u);
  }

  return 0LL;
}

uint64_t sub_100040760()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not macOS or iOS; returning NO for isComputeModuleC check",
      v1,
      2u);
  }

  return 0LL;
}

NSString *sub_1000407BC()
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sysdiagnose version %d.%d",  3LL,  0LL);
}

uint64_t sub_1000419E8(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v12 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Skipping forwarding %s key",  buf,  0xCu);
    }

    size_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", @"Skipping forwarding %s key", a2);
  }

  else
  {
    uint32_t v8 = *(void **)(a1 + 40);
    xpc_object_t v9 = xpc_copy(v5);
    xpc_dictionary_set_value(v8, a2, v9);
  }

  return 1LL;
}

LABEL_16:
        goto LABEL_23;
      }

      if (v8)
      {
        unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        *(_DWORD *)__int128 buf = 138412290;
        id v42 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose was cancelled. Remove tarball at %@.",  buf,  0xCu);
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      [v33 log:@"Sysdiagnose was cancelled. Remove tarball at %@.", v34];

      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      __int16 v40 = 0LL;
      [v3 removeItemAtPath:v35 error:&v40];
      uint64_t v36 = v40;

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        *(_DWORD *)__int128 buf = 138412290;
        id v42 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Tarball at %@ doesn't exist. Something's wrong",  buf,  0xCu);
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      xpc_object_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      [v30 log:@"Tarball at %@ doesn't exist. Something's wrong", v31];

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0LL);
    }
  }

void sub_1000437BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, os_activity_scope_state_s state)
{
}

void sub_100043808(uint64_t a1)
{
  if ([*(id *)(a1 + 32) prepareOutput])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to create the output directory.",  v4,  2u);
    }

    int v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v2 stdoutWrite:@"Unable to create the output directory."];

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v3 log:@"Unable to create the output directory."];
  }

uint64_t sub_100045370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100045450(_Unwind_Exception *a1)
{
}

void sub_100045E94(uint64_t a1, void *a2, char a3)
{
  id v14 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SDLogArchiveContainer, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v6);
  if ((a3 & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
    {
      id v8 = v14;
      xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 durationMetrics]);

      if (v9)
      {
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metricsDict]);
        CFPropertyListRef v11 = (void *)objc_claimAutoreleasedReturnValue([v8 durationMetrics]);
        [v10 addEntriesFromDictionary:v11];
      }

LABEL_8:
    }
  }

  else if ((isKindOfClass & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  48LL,  &stru_10008D288,  *(void *)(a1 + 32),  10.0));
    id v8 = v12;
    if (v12)
    {
      CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue([v12 collectionContainer]);
      [v13 setMaximumSizeMB:200];

      [v8 setRuntimeChecks:64];
      [v8 setName:@"tailspin-save-logarchive-timeout"];
      [v8 execute];
    }

    goto LABEL_8;
  }
}

id sub_1000464D8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100047688(_Unwind_Exception *a1)
{
}

void sub_1000477BC(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) diagnosticID]);
  [v2 registerActivityWithID:v3];

  [*(id *)(a1 + 40) finishedItemForPhaseAndUpdatePeer:*(unsigned int *)(a1 + 56)];
  os_activity_scope_leave(&v4);
}

void sub_100047828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id sub_100048B58(uint64_t a1)
{
  return [*(id *)(a1 + 32) prompt];
}

void sub_10004A2B8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archive]);
  [v2 addArchiveFile:*(void *)(a1 + 40)];
}

void sub_10004AB08(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10004AC24(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004AD04;
  v6[3] = &unk_100089798;
  size_t v7 = v2;
  xpc_remote_connection_set_event_handler(v2, v6);
  xpc_remote_connection_activate(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  os_activity_scope_state_s v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logSubsystem]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Connection started.", v5, 2u);
  }
}

void sub_10004AD04(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logSubsystem]);

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Initiating remote connection",  buf,  2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:forMsg:isTrusted:]( &OBJC_CLASS___CSRemoteXPCProxy,  "handleRemoteConnection:forMsg:isTrusted:",  *(void *)(a1 + 32),  v3,  1LL);
  }

  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Cancelling remote connection",  v8,  2u);
    }

    xpc_remote_connection_cancel(*(void *)(a1 + 32));
  }
}

void sub_10004B1BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004B1F4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logSubsystem]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Found device %@",  (uint8_t *)&v12,  0xCu);
  }

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else if (v5)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSRemoteXPCProxy getService:forDevice:]( &OBJC_CLASS___CSRemoteXPCProxy,  "getService:forDevice:",  "com.apple.sysdiagnose.remote.trusted",  v5));

    if (v8)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      id v9 = -[CSRemoteXPCProxy _initWithDevice:forDiagnosticID:]( objc_alloc(&OBJC_CLASS___CSCoreDeviceProxy),  "_initWithDevice:forDiagnosticID:",  v5,  *(void *)(a1 + 40));
      [*(id *)(a1 + 48) addObject:v9];
    }
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    CFPropertyListRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logSubsystem]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100057908(v11);
    }
  }
}

void sub_10004B7C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004B7DC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) evaluateCollectionFlags])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);

    if (v2)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
      id v4 = [v3 shouldStreamToTar];

      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
      id v2 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDirectory]);
    }

    else
    {
      id v4 = 0LL;
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "units", 0));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CFPropertyListRef v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          [*(id *)(a1 + 32) applyRule:v11];
          if ([v11 pipelineFlush])
          {
            [*(id *)(a1 + 32) writeToSummary:@"Flushing the LogCollection Pipeline\n"];
            [*(id *)(a1 + 32) enforceContainerSizeLimit];
            [*(id *)(a1 + 32) copyFilesForDirectory:v2 withStreaming:v4];
            [*(id *)(a1 + 32) clearLogs];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    [*(id *)(a1 + 32) enforceContainerSizeLimit];
    [*(id *)(a1 + 32) copyFilesForDirectory:v2 withStreaming:v4];
    [*(id *)(a1 + 32) closeSummary];
    [*(id *)(a1 + 32) clearLogs];
    int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) units]);
    [v12 removeAllObjects];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

id sub_10004D36C(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var",  @"/tmp",  @"/etc",  0LL));
  id v3 = v1;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    id v5 = v3;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)])
        {
          v16[0] = @"/private";
          v16[1] = v3;
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
          uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v9));

          id v5 = (void *)v10;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v6);
  }

  return v5;
}

uint64_t sub_10004D508(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  *__error() = 9;
  return 1LL;
}

uint64_t sub_10004D558(int a1)
{
  if (fstat(a1, &v3) != -1)
  {
    if ((v3.st_mode & 0xF000) != 0x8000 || v3.st_nlink < 2u) {
      return 0LL;
    }
    *__error() = 9;
  }

  return 1LL;
}

uint64_t sub_10004D5C8(const char *a1, int a2, unsigned int a3)
{
  return open(a1, a2 | 0x20000A00, a3);
}

uint64_t sub_10004D5F8(const char *a1, int a2)
{
  if ((a2 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = open(a1, a2 | 0x20000000);
  uint64_t v3 = v2;
  if ((_DWORD)v2 != -1 && sub_10004D558(v2))
  {
    close(v3);
    return 0xFFFFFFFFLL;
  }

  return v3;
}

uint64_t sub_10004D644(int a1, const char *a2, int a3)
{
  if ((a3 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = openat(a1, a2, a3 | 0x20000000);
  uint64_t v4 = v3;
  if ((_DWORD)v3 != -1 && sub_10004D558(v3))
  {
    close(v4);
    return 0xFFFFFFFFLL;
  }

  return v4;
}

uint64_t sub_10004D690(const char *a1, uid_t a2, gid_t a3)
{
  int v5 = sub_10004D5F8(a1, 0);
  if (v5 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  if (fchown(v5, a2, a3) == -1) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  close(v6);
  return v7;
}

uint64_t sub_10004D6F4(const char *a1, mode_t a2)
{
  int v3 = sub_10004D5F8(a1, 0);
  if (v3 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v3;
  if (fchmod(v3, a2) == -1) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  close(v4);
  return v5;
}

uint64_t sub_10004D748(const char *a1, const char *a2, copyfile_flags_t a3)
{
  int v5 = sub_10004D5F8(a1, 0);
  if (v5 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  int v7 = open(a2, 536873473, 420LL);
  if (v7 == -1)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  else
  {
    int v8 = v7;
    uint64_t v9 = fcopyfile(v6, v7, 0LL, a3);
    close(v6);
    int v6 = v8;
  }

  close(v6);
  return v9;
}

id sub_10004DC5C()
{
  if (qword_1000A52F0 != -1) {
    dispatch_once(&qword_1000A52F0, &stru_100089D98);
  }
  return (id)qword_1000A52F8;
}

void sub_10004DDB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10004DDCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004DDDC(uint64_t a1)
{
}

__CFDictionary *__cdecl sub_10004DDE4(id a1, int a2, __CFDictionary *a3)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( a3,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  id v4 = sub_10004DC5C();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received request to report purgeable for volume '%{public}@. Skipping",  (uint8_t *)&v7,  0xCu);
  }

  return 0LL;
}

__CFDictionary *__cdecl sub_10004DEA0(id a1, int a2, __CFDictionary *a3)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( a3,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  id v4 = sub_10004DC5C();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received purge request for volume '%{public}@. Skipping",  (uint8_t *)&v7,  0xCu);
  }

  return 0LL;
}

void sub_10004DF5C(id a1)
{
  id v1 = sub_10004DC5C();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Received purge cancel request. Skipping",  v3,  2u);
  }
}

id sub_10004DFC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  id v5 = sub_10004DC5C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received periodic purge request for volume '%{public}@",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) periodicAPFSMarkAsPurgeable:v4];
  return v7;
}

void sub_10004E0C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "deleter");
  uint64_t v2 = (void *)qword_1000A52F8;
  qword_1000A52F8 = (uint64_t)v1;
}

int64_t sub_10004E558(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0LL;
  id v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0LL);
  id v8 = 0LL;
  id v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0LL);

  id v6 = [v8 compare:v5];
  return (int64_t)v6;
}

void sub_10004EF44(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Launching Settings ...",  v5,  2u);
  }

  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v1 stdoutWrite:@"Launching Settings ..."];

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 log:@"Launching Settings ..."];

  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=INTERNAL_SETTINGS&path=sysdiagnose"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v4 openSensitiveURL:v3 withOptions:0];
}

LABEL_21:
  CFPropertyListRef v11 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"earlyPrompt"]);
  if (v11) {
    -[SystemDiagnostic setEarlyPrompt:](self, "setEarlyPrompt:", [v11 BOOLValue]);
  }
  if (-[SystemDiagnostic disableUIFeedback](self, "disableUIFeedback"))
  {
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", 0LL);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0LL);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"maxHistory"]);

  if (v12) {
    -[SystemDiagnosticiOS setMaxHistory:](self, "setMaxHistory:", [v12 integerValue]);
  }
}

LABEL_28:
}

uint64_t sub_10004FF08(int *a1, char *a2, size_t a3)
{
  size_t v3 = a3;
  id v4 = a2;
  int v5 = *a1;
  unint64_t v6 = write(*a1, a2, a3);
  uint64_t v7 = 0LL;
  if (v6)
  {
    while (v6 != v3)
    {
      if (v6 >= v3) {
        unint64_t v8 = 0LL;
      }
      else {
        unint64_t v8 = v6;
      }
      v3 -= v8;
      v7 += v8;
      v4 += v8;
      unint64_t v6 = write(v5, v4, v3);
      if (!v6) {
        return v7;
      }
    }

    v7 += v6;
  }

  return v7;
}

LABEL_27:
  uint64_t v35 = 0LL;
LABEL_32:

  return v35;
}

LABEL_62:
        compressed_size = self->_compressed_size;
        uint64_t v48 = sub_100023428(self->_archiveFD);
        self->_compressed_size = v48;
        sub_100023608(self->_summaryFD, v7, self->_basePath, (void *)buf.st_size, (void *)(v48 - compressed_size));
        -[SDArchive _disposeEntry:](self, "_disposeEntry:", v50);
        self->_uncompressed_size += buf.st_size;
        id v9 = v51;
        int v5 = v52;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v55 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: creating entry for header failed",  v55,  2u);
      }

      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v32 log:@"SDArchive: creating entry for header failed"];
    }
  }

BOOL sub_100051C64(id a1, NSURL *a2, NSError *a3)
{
  size_t v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)__int128 buf = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive error %@",  buf,  0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  [v5 log:@"SDArchive error %@", v6];

  return 1;
}

void sub_100052510(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticIDS);
  uint64_t v2 = (void *)qword_1000A5308;
  qword_1000A5308 = (uint64_t)v1;

  [(id)qword_1000A5308 setTransferIdentifier:&stru_10008D288];
}

void sub_100052780(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v2 setProtobufAction:"SDStart:" forIncomingRequestsOfType:1];

  size_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v3 setProtobufAction:"SDStart:" forIncomingResponsesOfType:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v4 setProtobufAction:"SDStop" forIncomingRequestsOfType:2];

  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v5 setProtobufAction:"SDStop" forIncomingResponsesOfType:2];

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v6 setProtobufAction:"SDComplete:" forIncomingRequestsOfType:3];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v7 setProtobufAction:"SDComplete:" forIncomingResponsesOfType:3];

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v8 setProtobufAction:"SDTargetFilename:" forIncomingRequestsOfType:5];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v9 setProtobufAction:"SDTargetFilename:" forIncomingResponsesOfType:5];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v10 setProtobufAction:"SDTransfer_Size:" forIncomingRequestsOfType:4];

  CFPropertyListRef v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v11 setProtobufAction:"SDTransfer_Size:" forIncomingResponsesOfType:4];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v12 setProtobufAction:"SDWatch_List:" forIncomingRequestsOfType:6];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v13 setProtobufAction:"SDWatch_List:" forIncomingResponsesOfType:6];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v14 setProtobufAction:"SDList_Complete:" forIncomingRequestsOfType:7];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v15 setProtobufAction:"SDList_Complete:" forIncomingResponsesOfType:7];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v16 setProtobufAction:"SDTransfer_Remote:" forIncomingRequestsOfType:8];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v17 setProtobufAction:"SDTransfer_Remote:" forIncomingResponsesOfType:8];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v18 setProtobufAction:"SDRemote_Complete:" forIncomingRequestsOfType:9];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v19 setProtobufAction:"SDRemote_Complete:" forIncomingResponsesOfType:9];

  id v22 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  uint64_t v20 = *(void **)(a1 + 32);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "run_queue"));
  [v22 addDelegate:v20 queue:v21];
}

LABEL_5:
    int v5 = 0LL;
  }

LABEL_6:
  return v5;
}

void sub_100052FAC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stringFromProtobuf:*(void *)(a1 + 48)]);
  size_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
  id v4 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticiOS);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057AD8();
    }
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v12 stderrWrite:@"Failed to allocate diagnostic object. Failing early from SDStart"];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v13 log:@"Failed to allocate diagnostic object. Failing early from SDStart"];
    goto LABEL_16;
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v4, "diagnosticID"));
  unsigned int v7 = [v5 checkAndIncreaseDiagnosticCountForDiagnosticID:v6 collectingLocalLogs:1];

  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v8 setCurrentClient:@"IDS"];

    objc_msgSend(*(id *)(a1 + 40), "setTransfer_size:", 0);
    -[SystemDiagnostic setRequestSource:](v4, "setRequestSource:", 4LL);
    -[SystemDiagnosticiOS setIdsCase:](v4, "setIdsCase:", 4LL);
    -[SystemDiagnostic setShouldCreateTarBall:](v4, "setShouldCreateTarBall:", 1LL);
    -[SystemDiagnostic setShouldRemoveTemporaryDirectory:](v4, "setShouldRemoveTemporaryDirectory:", 1LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticIDS getIDSCaseString:]( &OBJC_CLASS___SystemDiagnosticIDS,  "getIDSCaseString:",  -[SystemDiagnosticiOS idsCase](v4, "idsCase")));
      *(_DWORD *)__int128 buf = 138412290;
      xpc_object_t v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IDS SDStart idsCase: %@",  buf,  0xCu);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    CFPropertyListRef v11 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticIDS getIDSCaseString:]( &OBJC_CLASS___SystemDiagnosticIDS,  "getIDSCaseString:",  -[SystemDiagnosticiOS idsCase](v4, "idsCase")));
    [v10 log:@"IDS SDStart idsCase: %@", v11];

    if (v2) {
      -[SystemDiagnostic setRemoteSysdiagnoseID:](v4, "setRemoteSysdiagnoseID:", v2);
    }
    -[SystemDiagnosticiOS run](v4, "run");
    goto LABEL_17;
  }

  if (!v2)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"no-location.log"]);
    sub_100021250(@"Incoming co-sysdiagnose request with no target location specified.", v13);
LABEL_16:

    goto LABEL_17;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([@"error" stringByAppendingString:@"-"]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v2]);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathExtension:@"log"]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v16]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Current request %@ could not be completed because there is an inflight sysdiagnose.\n",  v2));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    xpc_object_t v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error %@", buf, 0xCu);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v19 log:@"Error %@", v18];

  sub_100021250(v18, v17);
  uint64_t v20 = *(void **)(a1 + 40);
  v22[0] = v15;
  v22[1] = v2;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  [v20 sendFilenamePair:v21];

LABEL_17:
}

uint64_t sub_10005365C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

_DWORD *sub_100053698(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    id result = (_DWORD *)sub_10002E1CC();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_1000536F8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      __int128 v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      id result = sub_10002E1A4(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100053790(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 31339) >= 0xFFFFFFFE
    && (uint64_t v5 = (void (*)(void))*(&off_100089EB8 + 5 * (v4 - 31337) + 5)) != 0LL)
  {
    v5();
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

void sub_100053820()
{
}

void sub_100053880()
{
}

void sub_1000538AC(void *a1, os_log_s *a2)
{
  __int16 v4 = 1024;
  int v5 = 3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Attempt (%d/%d) to attach to BTSession failed. Giving up.",  v3,  0xEu);
}

void sub_100053940()
{
  sub_10000A664( (void *)&_mh_execute_header,  v0,  v1,  "Registration for AirPod logs trigger callback with bluetooth returned error %d",  v2,  v3,  v4,  v5,  v6);
  sub_10000A65C();
}

void sub_1000539A0()
{
}

void sub_1000539CC()
{
}

void sub_1000539F8()
{
}

void sub_100053A24()
{
}

void sub_100053A50()
{
}

void sub_100053AB0()
{
}

void sub_100053B1C()
{
}

void sub_100053B7C()
{
}

void sub_100053BA8()
{
}

void sub_100053BE0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error: Received callback without dispatch group in SystemDiagnosticBT, reporting AirPod logs %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100053C54()
{
}

void sub_100053C80()
{
}

void sub_100053CAC(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)__int128 buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Count is 0 but local log collection ID is: %@ - resetting to nil for caller: %@",  buf,  0x16u);
}

void sub_100053D10(uint8_t *buf, uint64_t a2)
{
  *(_DWORD *)__int128 buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Atomic count did not match. Resetting to dictionary count %ld",  buf,  0xCu);
}

void sub_100053D58()
{
  __assert_rtn("-[SDResourceManager setUpFH:]", "SDResourceManager.m", 442, "fd != -1");
}

void sub_100053D80()
{
}

void sub_100053DA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053DDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053E10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053E44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100053EB4()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100053F20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100053F90()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100053FFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_10005406C()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_1000540D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100054148()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_1000541B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100054224()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100054290( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100054300()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_10005436C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_1000543DC()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100054448( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_1000544B8()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100054524( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054558( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000545D0()
{
  sub_1000187C8( (void *)&_mh_execute_header,  v0,  v1,  "Error: CSCoordinator: %s: config not found for '%@', returning default result",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_10005463C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_1000546AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000546E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_100054750( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000187B8( (void *)&_mh_execute_header,  a1,  a3,  "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result",  a5,  a6,  a7,  a8,  2u);
  sub_1000187EC();
}

void sub_1000547C0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100054868(void *a1)
{
  int v1 = 138412290;
  xpc_type_t type = xpc_get_type(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@",  (uint8_t *)&v1,  0xCu);
}

void sub_1000548E8(void *a1, os_log_s *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 136446210;
  id v5 = [v3 UTF8String];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "CacheEnumerator error: %{public}s",  (uint8_t *)&v4,  0xCu);
}

void sub_100054984( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000549B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000549EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054A20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054A90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054AC4(int a1)
{
}

void sub_100054B34(uint64_t a1, uint64_t a2, int a3)
{
}

void sub_100054BA8(uint64_t a1, uint64_t a2, int a3)
{
}

void sub_100054C1C(int a1, int __errnum)
{
}

void sub_100054C9C(uint64_t a1, int __errnum, int a3)
{
  int v3 = 136315650;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a3;
  __int16 v7 = 2080;
  uint8_t v8 = strerror(__errnum);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Opening tarball file descriptor at %s with protection class %d failed: %s",  (uint8_t *)&v3,  0x1Cu);
  sub_100024DE0();
}

void sub_100054D40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054D74()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100024DB0();
  sub_1000187C8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Unable to create user temporary directory %@: %s",  v2,  v3,  v4,  v5,  2u);
  sub_100024DA4();
}

void sub_100054DF8()
{
}

void sub_100054E60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054ECC(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Active UID '%d' user doesn't exist. Returning nil for container path '%@'",  (uint8_t *)v2,  0x12u);
  sub_1000187EC();
}

void sub_100054F50()
{
}

void sub_100054FB8()
{
}

void sub_100055020()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Error: failed to fetch tailspin config with error: '%s'. Returning 0 for buffer size",  v2,  v3,  v4,  v5,  2u);
  sub_1000187EC();
}

void sub_100055098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055104(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not create target location %@ with error %@",  (uint8_t *)&v4,  0x16u);
}

void sub_1000551AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055218( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055284()
{
}

void sub_1000552F0()
{
}

void sub_10005535C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005538C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create co-sysdiagnose directory at: %@ with error: %@",  (uint8_t *)&v4,  0x16u);
}

void sub_100055434( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055464( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055494( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000554C8()
{
}

void sub_100055528(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 durationMetrics]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:metricPersistLookback]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 durationMetrics]);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:metricSpecialLookback]);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 durationMetrics]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:metricSignpostLookback]);
  int v10 = 138412802;
  CFPropertyListRef v11 = v5;
  __int16 v12 = 2112;
  __int128 v13 = v7;
  __int16 v14 = 2112;
  __int128 v15 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Log archive metrics: Persist %@ Special %@ Signpost %@",  (uint8_t *)&v10,  0x20u);
}

void sub_100055668()
{
}

void sub_1000556C8()
{
}

void sub_100055730(uint64_t a1, int __errnum, os_log_s *a3)
{
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint8_t v8 = strerror(__errnum);
  sub_10002D640((void *)&_mh_execute_header, a3, v4, "Failed to open log archive %@: %s", (uint8_t *)&v5);
  sub_100024DA4();
}

void sub_1000557C0()
{
}

void sub_100055820()
{
}

uint64_t sub_100055888()
{
  uint64_t v0 = __error();
  return sub_10002D638(v0);
}

void sub_1000558A0(uint64_t a1, int __errnum)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = strerror(__errnum);
  sub_10002D640( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Unable to create file %@: %s",  (uint8_t *)&v3);
  sub_100024DA4();
}

void sub_10005592C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055960(void *a1, _OWORD *a2)
{
  if (sub_1000367E8((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_1000367D0(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100036820(v6);
  __break(1u);
}

void sub_1000559DC(void *a1, _OWORD *a2)
{
  if (sub_1000367E8((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_1000367D0(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100036820(v6);
  __break(1u);
}

void sub_100055A58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055AC4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Error writing remote UUIDs to response dict: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100024DA4();
}

void sub_100055B44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055BB0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000367E8((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100055C54()
{
}

void sub_100055C94(uint64_t a1, void *a2)
{
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([a2 diagnosticID]);
  sub_1000367F0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

  sub_100024DA4();
}

void sub_100055D30()
{
}

void sub_100055DA8()
{
}

void sub_100055E2C()
{
  __assert_rtn("+[SDTask createLaunchConstraintData]_block_invoke", "SDTask.m", 62, "launchConstraint != nil");
}

void sub_100055E54()
{
  __assert_rtn("-[SDTask init]_block_invoke", "SDTask.m", 140, "fd != -1");
}

void sub_100055E7C()
{
}

void sub_100055EA4()
{
}

void sub_100055F08()
{
}

void sub_100055F68(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 stderrPath]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "Failed to create error file for writing at path: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100024DA4();
}

void sub_100055FE0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100056088(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 objectAtIndex:1]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "File '%@' does not exist; will not execute %@.",
    (uint8_t *)&v6,
    0x16u);

  sub_100039E54();
}

void sub_100056130()
{
}

void sub_100056194()
{
}

void sub_1000561F4()
{
}

void sub_100056258()
{
}

void sub_1000562BC()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10002D62C();
  sub_100039E20((void *)&_mh_execute_header, v1, v2, "Failed to malloc arg array with errno: %s", v3, v4, v5, v6, v7);
  sub_100024DA4();
}

void sub_100056330(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not get spawn attributes. Skipping this task",  v1,  2u);
}

void sub_100056370(int a1)
{
}

void sub_1000563DC(int a1)
{
}

void sub_100056448(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 executionLine]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "Task '%@' has already been started; will not execute",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_100024DA4();
}

void sub_1000564C4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 launchPath]);
  sub_100039E64();
  sub_100039E40( (void *)&_mh_execute_header,  v2,  v3,  "Child process '%@' terminated due to signal %d",  v4,  v5,  v6,  v7,  v8);

  sub_100039E54();
}

void sub_100056544(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 launchPath]);
  sub_10002D62C();
  sub_100039E40( (void *)&_mh_execute_header,  v2,  v3,  "Child process '%@' exited with nonzero status %d",  v4,  v5,  v6,  v7,  v8);

  sub_100039E54();
}

void sub_1000565D4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 launchPath]);
  sub_100039E64();
  sub_100039E40( (void *)&_mh_execute_header,  v2,  v3,  "Unknown state of child process '%@' with wstatus %04x",  v4,  v5,  v6,  v7,  v8);

  sub_100039E54();
}

void sub_100056654(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 launchPath]);
  sub_100039E64();
  sub_100039E40( (void *)&_mh_execute_header,  v2,  v3,  "Child process '%@' stopped (but did not terminate) due to signal %d",  v4,  v5,  v6,  v7,  v8);

  sub_100039E54();
}

void sub_1000566D4()
{
}

void sub_1000566FC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown task stop state: %u",  (uint8_t *)v2,  8u);
}

void sub_100056770( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000567A8(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Timed out waiting for all tasks to complete. Timeout: %llus",  (uint8_t *)&v1,  0xCu);
}

void sub_100056824( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005685C()
{
}

void sub_100056884(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_10002D62C();
  sub_100039E20((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);

  sub_100024DA4();
}

void sub_1000568FC(id *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  sub_10002D62C();
  sub_100039E20((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);

  sub_100024DA4();
}

void sub_100056978(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_10003F728();
  sub_10003F760( (void *)&_mh_execute_header,  v2,  v3,  "Completion block for %@ took too long: %.1fs (allowed: %.1fs)",  v4,  v5,  v6,  v7,  v8);

  sub_10003F774();
}

void sub_1000569F8(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*a1 timeoutMetricsString]);
  sub_10003F74C((void *)&_mh_execute_header, v3, v4, "[%@ container] Task(s) timed out: %@", v5, v6, v7, v8, 2u);

  sub_100039E54();
}

void sub_100056AA0(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_10002D62C();
  sub_100039E20((void *)&_mh_execute_header, v2, v3, "No tasks were created for %@", v4, v5, v6, v7, v8);

  sub_100024DA4();
}

void sub_100056B18(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_10003F74C( (void *)&_mh_execute_header,  v2,  v3,  "Container %@ shouldn't be marked as not concurrent because it only has %lu task",  v4,  v5,  v6,  v7,  2u);

  sub_100039E54();
}

void sub_100056BA8()
{
  __int16 v1 = 2112;
  uint64_t v2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Can't create a block container with nil block %@, block : %@",  v0,  0x16u);
}

void sub_100056C2C(uint64_t a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing.",  v4,  v5,  v6,  v7,  v8);

  sub_100024DA4();
}

void sub_100056CA8(id *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  sub_10003F728();
  sub_10003F760( (void *)&_mh_execute_header,  v2,  v3,  "Completion block for %@ took too long: %.1fs (allowed: %.1fs)",  v4,  v5,  v6,  v7,  v8);

  sub_10003F774();
}

void sub_100056D2C(id *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 taskName]);
  sub_10003F728();
  sub_10003F760( (void *)&_mh_execute_header,  v2,  v3,  "Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)",  v4,  v5,  v6,  v7,  v8);

  sub_10003F774();
}

void sub_100056DB0(id *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 taskName]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "Helper connection error for task %@: not calling reply block due to failure",  v4,  v5,  v6,  v7,  v8);

  sub_100024DA4();
}

void sub_100056E2C(uint64_t a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "Helper connection error for task %@: failure while running task.",  v4,  v5,  v6,  v7,  v8);

  sub_100024DA4();
}

void sub_100056EA8(uint64_t a1, const _xpc_type_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskName]);
  xpc_type_get_name(a2);
  sub_10003F74C( (void *)&_mh_execute_header,  v4,  v5,  "Helper connection error for task %@: Received unexpected reply with type: %s",  v6,  v7,  v8,  v9,  2u);

  sub_100039E54();
}

void sub_100056F44(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([a1 taskName]);
  sub_10002D62C();
  sub_100039E20( (void *)&_mh_execute_header,  v2,  v3,  "No connection with sysdiagnose_helper. Cannot execute task: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100024DA4();
}

void sub_100056FBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057030( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000570A4(void *a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 tarballPath]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 completedTarballPath]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v7 = 138412802;
  uint8_t v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to move tarball '%@' to final location '%@': %@",  (uint8_t *)&v7,  0x20u);
}

void sub_100057184(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([a1 archiveName]);
  sub_10002D62C();
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Archive name invalid: %@",  v3,  v4,  v5,  v6,  v7);

  sub_100024DA4();
}

void sub_100057200(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([a1 outputDirectory]);
  sub_10002D62C();
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Internal output directory already exists: %@\n",  v3,  v4,  v5,  v6,  v7);

  sub_100024DA4();
}

void sub_10005727C(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([a1 completedTarballPath]);
  sub_10002D62C();
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Output archive already exists: %@\n",  v3,  v4,  v5,  v6,  v7);

  sub_100024DA4();
}

void sub_1000572F8(void *a1)
{
  __int16 v1 = (void *)objc_claimAutoreleasedReturnValue([a1 baseDirectory]);
  sub_10002D62C();
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Failed to set attributes on %@",  v3,  v4,  v5,  v6,  v7);

  sub_100024DA4();
}

void sub_100057374()
{
}

void sub_1000573DC()
{
}

void sub_100057444(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 completedOutputDirectory]);
  sub_10002D62C();
  sub_1000187B8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Output directory already exists: %@\n",  v3,  v4,  v5,  v6,  v7);

  sub_100024DA4();
}

void sub_1000574C0()
{
}

void sub_100057528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10004AB08( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Nil names string passed to setOnlyRunContainersWithNames",  v3);
}

void sub_100057564(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10004AB08( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Invalid name passed to onlyRunContainersWithNames",  a1);
}

void sub_10005759C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10004AB08( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Resetting only run containers with names array",  v3);
}

void sub_1000575D8()
{
}

void sub_100057640()
{
  int v0 = *__error();
  uint64_t v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint8_t v5 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Got return value of 0 from clock_gettime_nsec_np with error (%d): %s",  (uint8_t *)v3,  0x12u);
  sub_100024DA4();
}

void sub_1000576DC()
{
}

void sub_100057744(uint64_t a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint8_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create %@: %s",  (uint8_t *)&v4,  0x16u);
  sub_100024DA4();
}

void sub_1000577DC(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 sourcePath]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 targetPath]);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint8_t v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Tar streaming from: %@, to: %@",  (uint8_t *)&v4,  0x16u);

  sub_100024DA4();
}

void sub_10005788C(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 5LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error: CSCoreDeviceProxy: timed out (%lus) waiting for browsing to finish",  (uint8_t *)&v1,  0xCu);
}

void sub_100057908(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error: CSCoreDeviceProxy: got nil device from from browsing SPI with canceling == false",  v1,  2u);
}

void sub_100057948(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_1000579F0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "SDArchive: not going to add file to archive, as its source path is nil",  v0,  2u);
}

void sub_100057A34(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "SDArchive: not going to add source file %@ to archive, as its target path is nil",  (uint8_t *)&v1,  0xCu);
}

void sub_100057AB0()
{
}

void sub_100057AD8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to allocate diagnostic object. Failing early from SDStart",  v0,  2u);
}

id objc_msgSend_complexContainerWithSPITask_withTimeout_atDestination_withDelegate_withIntermediateDirectory_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:");
}

id objc_msgSend_complexContainerWithTasks_withTimeout_withRules_atDestination_withDelegate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:");
}

id objc_msgSend_complexContainerWithTasks_withTimeout_withRules_atDestination_withDelegate_isConcurrent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:");
}

id objc_msgSend_containerAtLocation_forTaskType_withTimeout_withDelegate_withMsgContents_withReplyBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:");
}

id objc_msgSend_containerWithName_destination_withTimeout_withConcurrency_withDelegate_withCompletionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:");
}

id objc_msgSend_containerWithName_destination_withTimeout_withTargetArchive_withDelegate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withTimeout:withTargetArchive:withDelegate:");
}

id objc_msgSend_getSimplePathArrayContainer_withContainerName_andDestination_withOffsets_sizes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:");
}

id objc_msgSend_initWithDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logRuleWithDirectory_withDepth_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logRuleWithGlob_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logRuleWithPaths_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_writeToSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToSummary:");
}