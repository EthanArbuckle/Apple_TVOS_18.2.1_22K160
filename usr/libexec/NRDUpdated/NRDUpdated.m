void logfunction( uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v10;
  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a3, &a9);
  NSLog(@"%s: %@", a1, v10);
  CFRelease(v10);
}

id nrdSharedLogger()
{
  if (nrdSharedLogger_pred != -1) {
    dispatch_once(&nrdSharedLogger_pred, &__block_literal_global);
  }
  return (id)nrdSharedLogger___instance;
}

void __nrdSharedLogger_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileSoftwareUpdate", "NRD");
  v2 = (void *)nrdSharedLogger___instance;
  nrdSharedLogger___instance = (uint64_t)v1;
}

uint64_t load_trust_cache_at_path(const char *a1, NSError **a2)
{
  char v3 = (char)a1;
  memset(&v66, 0, sizeof(v66));
  io_connect_t connect = 0;
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    uint64_t v16 = *__error();
    NSErrorUserInfoKey v78 = NSDebugDescriptionErrorKey;
    v17 = __error();
    v79 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"open() failed: %s",  strerror(*v17));
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v16,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
    v18 = __error();
    strerror(*v18);
    logfunction((uint64_t)"", 1LL, @"Could not open trust cache at path %s: %s.\n", v19, v20, v21, v22, v23, v3);
    v24 = (const __CFBoolean *)MGCopyAnswer(@"SigningFuse", 0LL);
    if (v24 == kCFBooleanFalse
      && (bzero(__big, 0x400uLL), size_t v64 = 1024LL, !sysctlbyname("kern.bootargs", __big, &v64, 0LL, 0LL))
      && strstr(__big, "msu_eng_brain=1"))
    {
      uint64_t v15 = 1LL;
      logfunction( (uint64_t)"",  1LL,  @"System policy for update brain is in effect.\n",  v53,  v54,  v55,  v56,  v57,  outputStructa);
      v8 = 0LL;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    CFRelease(v24);
    goto LABEL_9;
  }

  int v5 = v4;
  if (fstat(v4, &v66))
  {
    uint64_t v6 = *__error();
    NSErrorUserInfoKey v75 = NSDebugDescriptionErrorKey;
    v7 = __error();
    v76 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fstat() failed: %s",  strerror(*v7));
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
    v9 = __error();
    char outputStructb = strerror(*v9);
    logfunction((uint64_t)"", 1LL, @"Could not fstat trust cache: %s\n", v10, v11, v12, v13, v14, outputStructb);
LABEL_4:
    close(v5);
    uint64_t v15 = 0LL;
    goto LABEL_9;
  }

  v26 = mmap(0LL, v66.st_size, 1, 1026, v5, 0LL);
  if (v26 == (void *)-1LL)
  {
    uint64_t v39 = *__error();
    NSErrorUserInfoKey v73 = NSDebugDescriptionErrorKey;
    v40 = __error();
    v74 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mmap() failed: %s",  strerror(*v40));
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v39,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    v41 = __error();
    strerror(*v41);
    logfunction((uint64_t)"", 1LL, @"Could not map file %s: %s\n", v42, v43, v44, v45, v46, v3);
    goto LABEL_4;
  }

  v27 = v26;
  v28 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v28);
  io_object_t v30 = MatchingService;
  if (!MatchingService)
  {
    NSErrorUserInfoKey v71 = NSDebugDescriptionErrorKey;
    v72 = @"Could not find AppleMobileFileIntegrity service";
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
    v52 = @"Could not find AppleMobileFileIntegrity service\n";
LABEL_22:
    logfunction((uint64_t)"", 1LL, v52, v47, v48, v49, v50, v51, outputStruct);
    goto LABEL_23;
  }

  uint64_t v31 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  if (!(_DWORD)v31)
  {
    uint64_t v58 = IOConnectCallMethod(connect, 2u, 0LL, 0, v27, v66.st_size, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v58)
    {
      v8 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_24;
    }

    char v59 = v58;
    uint64_t v60 = (int)v58;
    NSErrorUserInfoKey v67 = NSDebugDescriptionErrorKey;
    v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOConnectCallMethod() failed: 0x%x",  v58);
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  v60,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
    char outputStruct = v59;
    v52 = @"Unable to load trust cache: 0x%x\n";
    goto LABEL_22;
  }

  char v32 = v31;
  uint64_t v33 = (int)v31;
  NSErrorUserInfoKey v69 = NSDebugDescriptionErrorKey;
  v70 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceOpen() failed: 0x%x",  v31);
  v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  v33,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
  logfunction((uint64_t)"", 1LL, @"Unable to open user client: 0x%x\n", v34, v35, v36, v37, v38, v32);
LABEL_23:
  uint64_t v15 = 0LL;
LABEL_24:
  close(v5);
  munmap(v27, v66.st_size);
  if (connect) {
    IOServiceClose(connect);
  }
  if (v30) {
    IOObjectRelease(v30);
  }
LABEL_9:
  if (a2) {
    *a2 = v8;
  }
  return v15;
}

void sub_100001DD8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, id a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking NRDUpdateBrain";
    a13 = [v14 description];
    (*(void (**)(uint64_t, NSError *))(v13 + 16))( v13,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  113LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &a12,  &a10,  2LL)));
    objc_end_catch();
    JUMPOUT(0x100001DACLL);
  }

  _Unwind_Resume(exception_object);
}
}

void sub_100001EFC(_Unwind_Exception *a1)
{
}

void sub_1000021A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1000023D0(_Unwind_Exception *a1)
{
}

void sub_100002764( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_100002ED0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100004590( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_21:
    goto LABEL_22;
  }

LABEL_4:
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int v5 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"EnableUpdateOnLaunch"]);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v8 = [v7 BOOLForKey:@"EnableUpdateOnLaunch"];

    if (!v8)
    {
      v9 = nrdSharedLogger();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Skipping RecoveryOSUpdateBrain launch on startup",  buf,  2u);
      }

      uint64_t v11 = nrdSharedLogger();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      uint64_t v13 = "To enable RecoveryOSUpdateBrain launch on startup set the following for the 'mobile' user: defaults write co"
            "m.apple.mobile.NRDUpdated EnableUpdateOnLaunch -BOOL YES";
      goto LABEL_20;
    }
  }

  else
  {
  }

  id v14 = nrdSharedLogger();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting RecoveryOSUpdateBrain download/launch on startup",  buf,  2u);
  }

  [*(id *)(a1 + 32) update:&__block_literal_global_198];
LABEL_22:
  if (*v3)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) core]);
    [v19 scheduleNRDUpdateBrainReScan:1];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) core]);
    [v20 scheduleNRDUpdateBrainPeriodicScan];
  }

  return [(id)__listener resume];
}

void sub_100006208( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_10:
  return v7;
}

LABEL_9:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  [v16 postEvent:@"LocalBrainFound"];
LABEL_10:

  return 0LL;
}

LABEL_15:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    uint64_t v15 = v14;
    uint64_t v16 = @"DeviceUnlocked";
    goto LABEL_16;
  }

  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "brain load requires unlock", buf, 2u);
  }

  uint64_t v10 = -[NRDUpdateDCore isPasscodeLocked](self, "isPasscodeLocked");
  uint64_t v11 = nrdSharedLogger();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) == 0)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      v17 = "device is unlocked";
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Need to wait for device unlock before loading brain",  buf,  2u);
  }

  -[NRDUpdateDCore setKeyBagStateChangedNotifyToken:](self, "setKeyBagStateChangedNotifyToken:", 0xFFFFFFFFLL);
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore keyBagQueue](self, "keyBagQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke;
  handler[3] = &unk_100014A10;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keyBagStateChangedNotifyToken, v13, handler);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  uint64_t v15 = v14;
  uint64_t v16 = @"DeviceLocked";
LABEL_16:
  [v14 postEvent:v16];

  return 0LL;
}

LABEL_11:
  uint64_t v15 = nrdSharedLogger();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trying to load update brain", buf, 2u);
  }

  uint64_t v58 = 0LL;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NRDUpdateBrainLoader brainAtPath:delegate:error:]( &OBJC_CLASS___NRDUpdateBrainLoader,  "brainAtPath:delegate:error:",  v7,  self,  &v58));
  v18 = v58;
  uint64_t v19 = v18;
  if (v18)
  {
    v59[0] = NSDebugDescriptionErrorKey;
    v59[1] = NSUnderlyingErrorKey;
    v60[0] = @"load brain failed";
    v60[1] = v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  602LL,  v20));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    [v22 postEvent:@"ErrorGeneric" withInfo:v21];
  }

  else
  {
    -[NRDUpdateDCore setBrain:](self, "setBrain:", v17);
    uint64_t v23 = nrdSharedLogger();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "update brain load succeeded", buf, 2u);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    [v21 postEvent:@"ProceedToNextUpdateStep"];
  }

LABEL_19:
  return 0LL;
}

void sub_100008F24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_26:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 8LL));
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = nrdSharedLogger();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "Nov 10 2024";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "01:38:24";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting NRDUpdated built %{public}s %{public}s",  buf,  0x16u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v6);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = __setupSignalHandlers_block_invoke;
  v17 = &__block_descriptor_36_e5_v8__0l;
  int v18 = 15;
  dispatch_source_set_event_handler(v7, buf);
  dispatch_resume(v7);
  v8 = (void *)setupSignalHandlers_signalSources_0;
  setupSignalHandlers_signalSources_0 = (uint64_t)v7;

  signal(15, (void (__cdecl *)(int))1);
  id v9 = nrdSharedLogger();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = 15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[SIGNAL_HANDLER] signal handler has been registered for signal: %d",  (uint8_t *)v15,  8u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NRDUpdateDaemonServerImpl sharedInstance](&OBJC_CLASS___NRDUpdateDaemonServerImpl, "sharedInstance"));
  [v11 runUntilExit];

  id v12 = nrdSharedLogger();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exiting NRDUpdated", buf, 2u);
  }

  return 0;
}

void __setupSignalHandlers_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v1 == 15)
  {
    if (v4)
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[SIGNAL_HANDLER] received SIGTERM, exiting",  (uint8_t *)v5,  2u);
    }

    exit(1);
  }

  if (v4)
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[SIGNAL_HANDLER] unhandled signal: %d (ignored)",  (uint8_t *)v5,  8u);
  }
}

id objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}