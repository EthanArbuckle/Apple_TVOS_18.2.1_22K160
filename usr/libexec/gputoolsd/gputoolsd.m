void sub_100002A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100002BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002CD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002DE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100002E20(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v1,  0LL));

  if (v2) {
    uint64_t v3 = (uint64_t)[v2 pid];
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

void sub_100002E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002EB8(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v5 description]);
    v8 = (const char *)[v7 UTF8String];
    DYLog(kDYLoggingLevelError, "Cannot bring app to foreground: error = %s", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  }

  [*(id *)(a1 + 32) setResult:v9];
}

void sub_100002F90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003554( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20, void *a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26)
{
  _Unwind_Resume(a1);
}

void sub_100003678(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) error]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  uint64_t v3 = v2;
  if (v2 != (void *)DYErrorDomain)
  {

LABEL_4:
    DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: helper transport error");
    [*(id *)(a1 + 32) terminate:1];
    goto LABEL_5;
  }

  id v4 = [v5 code];

  if (v4 != (id)6) {
    goto LABEL_4;
  }
LABEL_5:
}

void sub_100003728( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003748(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setError:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectPayload]);
  [*(id *)(a1 + 32) setResult:v7];

  return 0LL;
}

void sub_1000037B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_14:
      v24 = 0;
      goto LABEL_15;
    }
  }

  v24 = *((_DWORD *)v35 + 6);
LABEL_15:

  _Block_object_dispose(buf, 8);
  sub_100003DF4();

  return v24;
}

void sub_100003C14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, ...)
{
  _Block_object_dispose(va, 8);
  sub_100003DF4();

  _Unwind_Resume(a1);
}

void sub_100003CBC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v5 description]);
    v8 = (const char *)[v7 UTF8String];
    DYLog(kDYLoggingLevelError, "Cannot launch app: error = %s", v8);
  }

  else if (v9)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 pid];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003D6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003D90(void *a1)
{
  id v1 = a1;
  else {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:@"com.apple.MTLReplayer"];
  }

  return v2;
}

void sub_100003DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003DF4()
{
  v0 = (os_log_s *)g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)id v1 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v0,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Agent-LaunchInferior",  (const char *)&unk_10000BB12,  v1,  2u);
  }
}

void sub_100004178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004230(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) error]);
  uint64_t v3 = (void *)DYErrorDomain;
  id v4 = v2;
  id v5 = v3;
  if (!v5) {
    __assert_rtn("BOOL dy_error_eq(NSError *__strong, NSString *__strong, int)", "", 0, "domain");
  }
  if (!v4 || [v4 code] != (id)6)
  {

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  unsigned __int8 v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) error]);
    id v9 = objc_claimAutoreleasedReturnValue([v8 description]);
    id v10 = (const char *)[v9 UTF8String];
    DYLog(kDYLoggingLevelError, "helper transport error: %s", v10);

    [*(id *)(a1 + 32) terminate:1];
  }

void sub_100004380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000043B8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) BOOLResult] & 1) == 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
    id v2 = objc_claimAutoreleasedReturnValue([v9 description]);
    uint64_t v3 = (const char *)[v2 UTF8String];
    DYLog(kDYLoggingLevelError, "failed to connect to helper: %s", v3);

    [*(id *)(a1 + 40) terminate:1];
  }

  uint64_t v4 = kDYGuestAppLaunchEnvironmentKey;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = kDYGuestAppLaunchArgumentsKey;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKey:kDYGuestAppLaunchArgumentsKey]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  v4,  v7,  v6,  0LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  1287LL,  v10));
  if (!v8)
  {
    DYLog(kDYLoggingLevelError, "failed to serialize environment plist for helper");
    [*(id *)(a1 + 40) terminate:1];
  }

  if (([*(id *)(*(void *)(a1 + 40) + 32) send:v8 error:0] & 1) == 0)
  {
    DYLog(kDYLoggingLevelError, "failed to send reload UI server message to helper");
    [*(id *)(a1 + 40) terminate:1];
  }
}

void sub_100004538( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
}

LABEL_29:
    v34 = 0;
LABEL_45:

    return v34;
  }

  if ((sub_100003D90(v9) & 1) != 0) {
    v26 = 0LL;
  }
  else {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"GPUTOOLS_LOAD_GTMTLCAPTURE"]);
  }
  DYSetGTMTLCaptureMode([v26 intValue]);
  if (!-[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:]( self,  "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:",  v11,  0LL,  a5))
  {

    goto LABEL_29;
  }

  DYModifyEnvironmentForDualCaptureSupport(v11);

  if (v9)
  {
    if (sub_100003D90(v9))
    {
      v39 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"GPUTOOLS_LOAD_GTMTLREPLAYER2"]);
      v28 = v27;
      if (!v27 || [v27 BOOLValue])
      {
        v45 = 0LL;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
        v30 = [v29 canOpenApplication:@"com.apple.MTLReplayer" reason:&v45];
        if (v45 == 4) {
          v31 = v30;
        }
        else {
          v31 = 1;
        }

        if (v31 == 1)
        {

          id v9 = @"com.apple.MTLReplayer";
          v11 = v39;
          [v39 removeObjectForKey:@"METAL_LOAD_INTERPOSER"];
          v32 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"METAL_DEBUG_ERROR_MODE"]);
          v33 = v32;
        }

        else
        {
          v11 = v39;
        }
      }

      [v11 removeObjectForKey:@"DYLD_INSERT_LIBRARIES"];
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 dictionaryForKey:@"GPUDebugger.ReplayerEnvironment"]);

      v11 = v39;
      if (v36) {
        [v39 addEntriesFromDictionary:v36];
      }
    }

    -[DYEmbeddedDaemon setInferiorPid:]( self,  "setInferiorPid:",  -[DYEmbeddedDaemon launchInferiorWithIdentifer:environment:arguments:error:]( self,  "launchInferiorWithIdentifer:environment:arguments:error:",  v9,  v11,  v42,  a5));
    goto LABEL_40;
  }

  if (v44)
  {
    id v9 = 0LL;
    -[DYEmbeddedDaemon setInferiorPid:]( self,  "setInferiorPid:",  -[DYEmbeddedDaemon launchInferiorWithPath:arguments:environment:workingDirectory:error:]( self,  "launchInferiorWithPath:arguments:environment:workingDirectory:error:",  v44,  v42,  v11,  v41,  a5));
LABEL_40:
    if ((int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") >= 1)
    {
      if (a4) {
        *a4 = v11;
      }
      -[DYEmbeddedDaemon setOwnsInferior:](self, "setOwnsInferior:", 1LL);
      -[DYEmbeddedDaemon observeInferior](self, "observeInferior");
      kill((pid_t)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"), 19);
    }

    v34 = (int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") > 0;

    goto LABEL_45;
  }

  result = dy_abort("launch plist does not contain a bundle identifier or path");
  __break(1u);
  return result;
}

void sub_100004B1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100005130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000051B0(uint64_t a1, const void *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
  {
    uint64_t v5 = Value;
  }

void sub_100005374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000053C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___LSApplicationProxy);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processApplication:v5]);
    if (v4) {
      [*(id *)(a1 + 40) addObject:v4];
    }
  }
}

void sub_10000543C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

LABEL_47:
LABEL_48:
LABEL_49:
    }

    else
    {
LABEL_13:
      v53.receiver = self;
      v53.super_class = (Class)&OBJC_CLASS___DYEmbeddedDaemon;
      -[DYEmbeddedDaemon handleMessage:](&v53, "handleMessage:", v4);
    }
  }

  else
  {
    switch(v5)
    {
      case 1288:
        break;
      case 1289:
        uint64_t v6 = -[DYEmbeddedDaemon bringAppToForeground:](self, "bringAppToForeground:", self->_guestAppIdentifier);
        unsigned __int8 v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:attributes:objectPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:attributes:objectPayload:",  1289LL,  0LL,  v8));
        -[NSMutableDictionary send:inReplyTo:error:](v7, "send:inReplyTo:error:", v9, v4, 0LL);
        goto LABEL_47;
      case 1290:
        unsigned __int8 v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.GPUTools"));
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary URLForResource:withExtension:]( v7,  "URLForResource:withExtension:",  @"version",  @"plist"));
        if (v8) {
          v52 = -[NSDictionary initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:",  v8);
        }
        else {
          v52 = 0LL;
        }
        v39 = DYGetGLInterposeDylibPath();
        v40 = DYMachOGetDylibCompatibilityVersion(v39);
        if (v40) {
          v41 = v40;
        }
        else {
          v41 = 1572864LL;
        }
        v42 = DYGetMTLInterposeDylibPath();
        v43 = DYMachOGetDylibCompatibilityVersion(v42);
        v44 = DYCheckGLDispatchTableSize(@"com.apple.opengles");
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v43));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v41));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v44));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary infoDictionary](v7, "infoDictionary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v45,  @"interpose_version_metal",  v46,  @"interpose_version",  v47,  @"gl-dispatch-table-size-matches",  v48,  @"info",  v52,  @"version",  0LL));

        plist_filter(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  1290LL,  v49));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        [v51 send:v50 inReplyTo:v4 error:0];

        goto LABEL_48;
      case 1291:
      case 1293:
        goto LABEL_13;
      case 1292:
        unsigned __int8 v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
        v19 = -[NSMutableDictionary intValue](v7, "intValue");
        if ((_DWORD)v19 != -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid")
          && (int)-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid") > 0
          || !(_DWORD)v19)
        {
          DYLog(kDYLoggingLevelError, "invalid pid specified in register inferior message: %d", (_DWORD)v19);
          -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
        }

        if ((_DWORD)v19 == -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"))
        {
          if (!self->_guestAppIdentifier) {
            -[DYEmbeddedDaemon cacheInferiorAppIdentifier](self, "cacheInferiorAppIdentifier");
          }
        }

        else
        {
          v35 = task_for_pid(mach_task_self_, (int)v19, v56);
          if (v35)
          {
            v36 = mach_error_string(v35);
            DYLog(kDYLoggingLevelError, "failed to get task port for process %d: %s", (_DWORD)v19, v36);
          }

          -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", v19);
          -[DYEmbeddedDaemon observeInferior](self, "observeInferior");
          v37 = objc_alloc_init(&OBJC_CLASS___DYGPUStatsReport);
          statsReport = self->_statsReport;
          self->_statsReport = v37;

          -[DYGPUStatsReport setup](self->_statsReport, "setup");
          -[DYGPUStatsReport startCollectingStats](self->_statsReport, "startCollectingStats");
          if (!self->_guestAppIdentifier) {
            -[DYEmbeddedDaemon cacheInferiorAppIdentifier](self, "cacheInferiorAppIdentifier");
          }
        }

        goto LABEL_49;
      case 1294:
        unsigned __int8 v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        for (i = 0LL; i != 5; ++i)
        {
          v21 = off_10000C7A0[i];
          v22 = (void *)MGCopyAnswer(v21, 0LL);
          if (v22) {
            -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v22, v21);
          }
        }

        if (-[NSMutableDictionary count](v8, "count")) {
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, @"screen-dimensions");
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:@"enable-metal-info"]);
        v24 = [v23 BOOLValue];

        v25 = copy_metal_version(@"/");
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v26, @"metal_version");

        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v27 = 0LL;
        v28 = 1;
        do
        {
          v29 = v28;
          if (((v24 | v28) & 1) == 0) {
            break;
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue( -[DYEmbeddedDaemon captureAPISupportForAPI:]( self,  "captureAPISupportForAPI:",  *((unsigned int *)&unk_100009DA8 + v27)));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 graphicsAPIInfo]);
          if (v31) {
            [v9 addObjectsFromArray:v31];
          }

          v28 = 0;
          v27 = 1LL;
        }

        while ((v29 & 1) != 0);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, @"gputools.contexts-info");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10000D2C0,  @"nativePointerSize");
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:objectPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:objectPayload:",  1294LL,  v7));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        [v33 send:v32 inReplyTo:v4 error:0];

        goto LABEL_47;
      default:
        if (v5 == 264)
        {
          v14 = self->_statsReport;
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUStatsReport lastStatsReport](v14, "lastStatsReport"));
            v16 = [v15 copy];

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:objectPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:objectPayload:",  1296LL,  v16));
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
              [v18 send:v17 error:0];
            }
          }
        }

        goto LABEL_13;
    }
  }
}

void sub_100005BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005D30(uint64_t a1)
{
  if (CSIsNull(*(void *)(*(void *)(a1 + 32) + 8LL), *(void *)(*(void *)(a1 + 32) + 16LL)))
  {
    uint64_t v2 = CSSymbolicatorCreateWithPid([*(id *)(a1 + 32) inferiorPid]);
    uint64_t v3 = (uint64_t *)(*(void *)(a1 + 32) + 8LL);
    uint64_t *v3 = v2;
    v3[1] = v4;
  }

  if ((CSIsNull(*(void *)(*(void *)(a1 + 32) + 8LL), *(void *)(*(void *)(a1 + 32) + 16LL)) & 1) != 0) {
    id Signature = 0LL;
  }
  else {
    id Signature = (id)CSSymbolicatorCreateSignature( *(void *)(*(void *)(a1 + 32) + 8LL),  *(void *)(*(void *)(a1 + 32) + 16LL),  0LL);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transport]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:payload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:payload:",  1538LL,  Signature));
  [v5 send:v6 inReplyTo:*(void *)(a1 + 40) error:0];
}

void sub_100005E18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_source_s *sub_100006004(uint64_t a1, dispatch_queue_s *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, a2);
  if (v6)
  {
    uint64_t v7 = 1000000000 * a1;
    dispatch_time_t v8 = dispatch_time(0LL, v7);
    dispatch_source_set_timer(v6, v8, v7, 0x989680uLL);
    dispatch_source_set_event_handler(v6, v5);
    dispatch_resume(v6);
  }

  return v6;
}

void sub_100006128( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___DYGPUStatsReport;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100006154(void *a1)
{
}

CFComparisonResult sub_100006224(uint64_t a1, uint64_t a2)
{
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  if (CFStringCompare(Group, *(CFStringRef *)(a1 + 32), 1uLL)) {
    return 16LL;
  }
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  CFComparisonResult result = CFStringCompare(SubGroup, *(CFStringRef *)(a1 + 40), 1uLL);
  if (result) {
    return 16LL;
  }
  return result;
}

void sub_100006328(uint64_t a1)
{
  uint64_t Samples = IOReportCreateSamples( *(void *)(*(void *)(a1 + 32) + 24LL),  *(void *)(*(void *)(a1 + 32) + 16LL),  0LL);
  if (Samples)
  {
    uint64_t v3 = Samples;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
    if (v4)
    {
      uint64_t SamplesDelta = IOReportCreateSamplesDelta(v4, v3, 0LL);
      if (SamplesDelta)
      {
        uint64_t v6 = (const void *)SamplesDelta;
        uint64_t v10 = 0LL;
        v11 = &v10;
        uint64_t v12 = 0x3032000000LL;
        v13 = sub_100006460;
        v14 = sub_100006470;
        v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_100006478;
        v9[3] = &unk_10000C7F0;
        v9[4] = &v10;
        IOReportIterate(v6, v9);
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), (id)v11[5]);
        CFRelease(v6);
        _Block_object_dispose(&v10, 8);
      }
    }

    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_time_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v3;
  }

void sub_100006440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100006460(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006470(uint64_t a1)
{
}

uint64_t sub_100006478(uint64_t a1, uint64_t a2)
{
  int Count = IOReportStateGetCount(a2);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v5, "setNumberStyle:", 1LL);
  if (Count >= 1)
  {
    uint64_t v6 = 0LL;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      NameForIndex = (void *)IOReportStateGetNameForIndex(a2, v6);
      IOReportStateGetDutyCycle(a2, v6);
      if (NameForIndex)
      {
        double v11 = v10;
        if ([NameForIndex length])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11 * 100.0));
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12 forKeyedSubscript:NameForIndex];

          if (([NameForIndex isEqualToString:@"OFF"] & 1) == 0)
          {
            if ([NameForIndex hasPrefix:@"P"])
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue([NameForIndex substringFromIndex:1]);
              v14 = v13;
              if (v13 && [v13 length])
              {
                v15 = v5;
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v5, "numberFromString:", v14));
                v17 = v16;
                if (v16)
                {
                  [v16 doubleValue];
                  double v7 = v7 + v18 * v11;
                  double v8 = v8 + v11;
                }

                id v5 = v15;
              }
            }
          }
        }
      }

      uint64_t v6 = (v6 + 1);
    }

    while (Count != (_DWORD)v6);
    if (v8 > 2.22044605e-16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7 / v8));
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v19 forKeyedSubscript:kDYXPState];
    }
  }

  return 0LL;
}

void sub_100006670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_19:
  _Block_object_dispose(&v16, 8);
  return (int64_t)v7;
}

void sub_100006C14(_Unwind_Exception *a1)
{
}

uint64_t sub_100006C40(uint64_t a1)
{
  uint64_t result = SSLRead( *(SSLContextRef *)(*(void *)(a1 + 32) + 288LL),  *(void **)(a1 + 56),  *(void *)(a1 + 64),  (size_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

LABEL_17:
  _Block_object_dispose(&v15, 8);
  return (int64_t)v6;
}

void sub_100006E20(_Unwind_Exception *a1)
{
}

uint64_t sub_100006E4C(uint64_t a1)
{
  uint64_t result = SSLWrite( *(SSLContextRef *)(*(void *)(a1 + 32) + 288LL),  *(const void **)(a1 + 56),  *(void *)(a1 + 64),  (size_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_100006FC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*((_BYTE *)v2 + OBJC_IVAR___DYTransport__invalid))
  {
    if (![v2 connected])
    {
      unsigned int v10 = secure_lockdown_checkin(*(void *)(a1 + 32) + 272LL, 0LL, *(void *)(a1 + 32) + 280LL);
      uint64_t v11 = *(void *)(a1 + 32);
      if (v10)
      {
        signed int v12 = v10;
        uint64_t v13 = kDYLoggingLevelError;
        if (v10 > 0xB) {
          v14 = "unknown";
        }
        else {
          v14 = (&off_10000C860)[v10 - 1];
        }
        double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
        _DYOLog(v11, v13, @"failed to checkin with lockdownd: %@ (%d)");

        uint64_t v4 = v12;
        uint64_t v3 = @"LockdownErrorDomain";
        goto LABEL_3;
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 296LL) = lockdown_get_socket(*(void *)(v11 + 272));
      uint64_t v15 = *(void *)(a1 + 32);
      if (*(_DWORD *)(v15 + 296) == -1)
      {
        ((void (*)(void))_DYOLog)();
        uint64_t v9 = 0LL;
        goto LABEL_6;
      }

      *(void *)(*(void *)(a1 + 32) + 288LL) = lockdown_get_securecontext(*(void *)(v15 + 272));
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 288);
      if (v17 && *(_DWORD *)(v16 + 296) == *((_DWORD *)v17 + 8))
      {
        v17[2] = sub_1000071F8;
        v17[3] = sub_100007204;
        v17[4] = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 32);
      }

      [(id)v16 runWithSocket:*(unsigned int *)(v16 + 296)];
    }

    uint64_t v9 = 1LL;
LABEL_6:
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
    uint64_t v6 = (id *)(a1 + 40);
    goto LABEL_7;
  }

  uint64_t v3 = (const __CFString *)DYErrorDomain;
  uint64_t v4 = 32LL;
LABEL_3:
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[DYError errorWithDomain:code:userInfo:]( &OBJC_CLASS___DYError,  "errorWithDomain:code:userInfo:",  v3,  v4,  0LL));
  double v7 = *(void **)(a1 + 40);
  uint64_t v6 = (id *)(a1 + 40);
  [v7 setError:v5];

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
LABEL_7:
  id v19 = (id)v8;
  [*v6 setResult:v8];
}

id sub_1000071F8(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "_ssl_st_read:size:", a2, a3);
}

id sub_100007204(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "_ssl_st_write:size:", a2, a3);
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v1, &stru_10000C8D8);
  dispatch_resume(v1);
  signal(20, (void (__cdecl *)(int))1);
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___DYLockdownTransport);
  uint64_t v3 = -[DYEmbeddedDaemon initWithTransport:terminationHandler:]( objc_alloc(&OBJC_CLASS___DYEmbeddedDaemon),  "initWithTransport:terminationHandler:",  v2,  &stru_10000C918);
  -[DYEmbeddedDaemon run](v3, "run");

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

uint64_t sub_1000072D8()
{
  size_t v1 = 8LL;
  uint64_t v2 = 0LL;
  uint64_t result = sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v1, 0LL, 0LL);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000078B4();
    }
LABEL_8:
    exit(1);
  }

  if (v2 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007870();
    }
    goto LABEL_8;
  }

  return result;
}

void sub_100007360(id a1)
{
}

void sub_100007388(id a1, int a2)
{
}

void sub_1000074F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007870()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Service prohibited from running (developer mode not enabled)",  v0,  2u);
}

void sub_1000078B4()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to read developer mode status: %{darwin.errno}d",  (uint8_t *)v1,  8u);
}

id objc_msgSend_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:");
}

id objc_msgSend_initWithIdentifier_sharegroupIdentifier_renderers_currentRendererIndex_api_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:sharegroupIdentifier:renderers:currentRendererIndex:api:");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}