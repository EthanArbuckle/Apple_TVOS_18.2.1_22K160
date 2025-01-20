@interface DYEmbeddedDaemon
- (BOOL)bringAppToForeground:(id)a3;
- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5;
- (BOOL)launchUIServer:(id)a3 error:(id *)a4;
- (DYEmbeddedDaemon)initWithTransport:(id)a3 terminationHandler:(id)a4;
- (id)captureAPISupportForAPI:(unsigned int)a3;
- (id)getApplications;
- (id)processApplication:(id)a3;
- (int)launchInferiorWithIdentifer:(id)a3 environment:(id)a4 arguments:(id)a5 error:(id *)a6;
- (int)launchInferiorWithPath:(id)a3 arguments:(id)a4 environment:(id)a5 workingDirectory:(id)a6 error:(id *)a7;
- (void)cacheInferiorAppIdentifier;
- (void)handleMessage:(id)a3;
- (void)terminate:(int)a3;
@end

@implementation DYEmbeddedDaemon

- (DYEmbeddedDaemon)initWithTransport:(id)a3 terminationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DYEmbeddedDaemon;
  v8 = -[DYEmbeddedDaemon init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    -[DYEmbeddedDaemon setTransport:](v8, "setTransport:", v6);
    id v10 = objc_retainBlock(v7);
    id terminationHandler = v9->_terminationHandler;
    v9->_id terminationHandler = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](v9, "transport"));
    if (!v12) {
      __assert_rtn("-[DYEmbeddedDaemon initWithTransport:terminationHandler:]", ", 0, "self.transport"");
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](v9, "transport"));
    [v13 setPrioritizeOutgoingMessages:1];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("symbolicator", 0LL, v15);
    symbolicatorQueue = v9->_symbolicatorQueue;
    v9->_symbolicatorQueue = (OS_dispatch_queue *)v16;

    v18 = v9;
  }

  return v9;
}

- (id)captureAPISupportForAPI:(unsigned int)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      id v4 = 0LL;
      return v4;
    }

    v3 = &off_10000C1B8;
  }

  else
  {
    v3 = &off_10000C198;
  }

  id v4 = [objc_alloc(*v3) initWithAPI:*(void *)&a3];
  return v4;
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"METAL_LOAD_INTERPOSER"]);
  if ([v10 BOOLValue])
  {
    uint64_t v11 = 1LL;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"METAL_DIAGNOSTICS_ENABLED"]);
    uint64_t v11 = (uint64_t)[v12 BOOLValue];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon captureAPISupportForAPI:](self, "captureAPISupportForAPI:", 1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 interposeDylibPath]);
  [v8 setObject:v14 forKeyedSubscript:@"DYMTL_TOOLS_DYLIB_PATH"];

  unsigned __int8 v15 = -[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:withAPI:uniqueIdentifier:error:]( self,  "createInferiorTransportAndSetEnvironment:withAPI:uniqueIdentifier:error:",  v8,  v11,  v9,  a5);
  return v15;
}

- (void)cacheInferiorAppIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid")));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v3,  0LL));

  if (v8)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 bundle]);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    guestAppIdentifier = self->_guestAppIdentifier;
    self->_guestAppIdentifier = v5;
  }

  else
  {
    unsigned int v7 = -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid");
    DYLog(kDYLoggingLevelError, "failed to get display identifier for process %d", v7);
  }
}

- (BOOL)bringAppToForeground:(id)a3
{
  id v3 = a3;
  if (sub_100002E20((uint64_t)v3) == -1)
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](&OBJC_CLASS___DYFuture, "future"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100002EB8;
    v9[3] = &unk_10000C670;
    id v6 = v4;
    id v10 = v6;
    [v5 openApplication:v3 withOptions:0 completion:v9];
    unsigned __int8 v7 = [v6 BOOLResult];
  }

  return v7;
}

- (int)launchInferiorWithPath:(id)a3 arguments:(id)a4 environment:(id)a5 workingDirectory:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ((-[DYEmbeddedDaemon isAppleInternal](self, "isAppleInternal") & 1) == 0)
  {
    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
    int v32 = 0;
    goto LABEL_27;
  }

  if ([v15 length])
  {
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v17 = [v16 fileExistsAtPath:v15 isDirectory:&v48];

    unsigned __int8 v18 = v48 ? v17 : 0;
    if ((v18 & 1) == 0)
    {
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Working directory doesn't exist. %@",  v15));
      v52 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[DYError errorWithDomain:code:userInfo:]( &OBJC_CLASS___DYError,  "errorWithDomain:code:userInfo:",  DYErrorDomain,  1LL,  v36));

      goto LABEL_18;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v20 = [v19 fileExistsAtPath:v12];

  if ((v20 & 1) == 0)
  {
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Binary Launch Path doesn't exist. %@",  v12));
    v50 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[DYError errorWithDomain:code:userInfo:]( &OBJC_CLASS___DYError,  "errorWithDomain:code:userInfo:",  DYErrorDomain,  1LL,  v34));

LABEL_18:
    int v32 = -1;
    goto LABEL_27;
  }

  v21 = (DYTransport *)[[DYUNIXDomainSocketTransport alloc] initWithMode:1];
  helperTransport = self->_helperTransport;
  self->_helperTransport = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/run/gputoolsdhelper.sock",  0LL));
  -[DYTransport setUrl:](self->_helperTransport, "setUrl:", v23);

  id v24 = -[DYTransport newSourceWithQueue:](self->_helperTransport, "newSourceWithQueue:", &_dispatch_main_q);
  v25 = v24;
  if (v24)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100003678;
    v47[3] = &unk_10000C698;
    v47[4] = self;
    [v24 setCancellationHandler:v47];
    [v25 resume];
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport connect](self->_helperTransport, "connect"));
    [v44 timeoutAfter:0 label:500.0];
    if ([v44 BOOLResult])
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  kDYGuestAppLaunchPathKey,  v14,  kDYGuestAppLaunchEnvironmentKey,  v13,  kDYGuestAppLaunchArgumentsKey,  v15,  kDYGuestAppLaunchCurrentDirectoryKey,  0LL));
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  1291LL));
      if (v43)
      {
        uint64_t v26 = objc_claimAutoreleasedReturnValue(+[DYFuture future](&OBJC_CLASS___DYFuture, "future"));
        v27 = self->_helperTransport;
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100003748;
        v45[3] = &unk_10000C6C0;
        id v41 = (id)v26;
        id v46 = v41;
        LOBYTE(v26) = -[DYTransport send:error:replyQueue:timeout:handler:]( v27,  "send:error:replyQueue:timeout:handler:",  v43,  a7,  v29,  0LL,  v45);

        v30 = v44;
        if ((v26 & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v41 result]);
          if (a7) {
            *a7 = (id)objc_claimAutoreleasedReturnValue([v41 error]);
          }
          int v32 = [v31 intValue];
        }

        else
        {
          DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to send posix_spawn message");
          -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
          int v32 = 0;
        }
      }

      else
      {
        DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to serialize launch parameters");
        -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
        int v32 = 0;
        v30 = v44;
      }
    }

    else
    {
      DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to connect to helper");
      -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
      int v32 = 0;
      v30 = v44;
    }
  }

  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport error](self->_helperTransport, "error"));
    id v38 = objc_claimAutoreleasedReturnValue([v37 description]);
    v39 = (const char *)[v38 UTF8String];
    DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: failed to create transport source: %s", v39);

    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
    int v32 = 0;
  }

LABEL_27:
  return v32;
}

- (int)launchInferiorWithIdentifer:(id)a3 environment:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_s *)g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Agent-LaunchInferior",  (const char *)&unk_10000BB12,  buf,  2u);
  }

  *(void *)buf = 0LL;
  v35 = buf;
  uint64_t v36 = 0x2020000000LL;
  while (1)
  {
    pid_t v12 = sub_100002E20((uint64_t)v8);
    *((_DWORD *)v35 + 6) = v12;
    if (v12 == -1) {
      break;
    }
    kill(v12, 9);
    usleep(0x1E8480u);
  }

  v37[0] = FBSDebugOptionKeyWaitForDebugger;
  v37[1] = FBSDebugOptionKeyEnvironment;
  v38[0] = &__kCFBooleanTrue;
  v38[1] = v9;
  v37[2] = FBSDebugOptionKeyArguments;
  v38[2] = v10;
  v39[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
  v39[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v40[0] = v13;
  v40[1] = &__kCFBooleanTrue;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));

  dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v14));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100003CBC;
  v31[3] = &unk_10000C6E8;
  v33 = buf;
  unsigned __int8 v18 = v15;
  int v32 = v18;
  [v16 openApplication:v8 withOptions:v17 completion:v31];

  dispatch_time_t v19 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v18, v19);
  if (*((_DWORD *)v35 + 6) == -1)
  {
    id v25 = objc_claimAutoreleasedReturnValue([v8 description]);
    uint64_t v26 = (const char *)[v25 UTF8String];
    DYLog(kDYLoggingLevelError, "failed to get pid for '%s'", v26);

    if (a6)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Timed-out waiting for the application to launch.",  NSLocalizedDescriptionKey));
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[DYError errorWithDomain:code:userInfo:]( &OBJC_CLASS___DYError,  "errorWithDomain:code:userInfo:",  DYErrorDomain,  5LL,  v27));
    }

    goto LABEL_14;
  }

  if ((sub_100003D90(v8) & 1) == 0)
  {
    mach_error_t v20 = task_for_pid(mach_task_self_, *((_DWORD *)v35 + 6), &v30);
    if (v20)
    {
      int v21 = *((_DWORD *)v35 + 6);
      v22 = mach_error_string(v20);
      DYLog(kDYLoggingLevelError, "failed to get task port for process %d: %s", v21, v22);
      kill(*((_DWORD *)v35 + 6), 9);
      if (a6)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Failed to get the application's task port.",  NSLocalizedDescriptionKey));
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[DYError errorWithDomain:code:userInfo:]( &OBJC_CLASS___DYError,  "errorWithDomain:code:userInfo:",  DYErrorDomain,  29LL,  v23));
      }

- (BOOL)launchUIServer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kDYGuestAppLaunchEnvironmentKey]);
  if (v9) {
    [v8 addEntriesFromDictionary:v9];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kDYGuestAppLaunchReplayer]);
  if (v10)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kDYGuestAppLaunchCapture]);
    uint64_t v11 = (uint64_t)[v4 BOOLValue];
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  -[DYEmbeddedDaemon setShouldLoadCapture:](self, "setShouldLoadCapture:", v11);
  if (v10) {

  }
  pid_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kDYGuestAppLaunchDiagnostics]);
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", [v12 BOOLValue]);

  BOOL v13 = -[DYEmbeddedDaemon createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:]( self,  "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:",  v8,  0LL,  a4);
  if (v13)
  {
    id v14 = (DYTransport *)[[DYUNIXDomainSocketTransport alloc] initWithMode:1];
    helperTransport = self->_helperTransport;
    self->_helperTransport = v14;

    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/run/gputoolsdhelper.sock",  0LL));
    -[DYTransport setUrl:](self->_helperTransport, "setUrl:", v16);

    id v17 = -[DYTransport newSourceWithQueue:](self->_helperTransport, "newSourceWithQueue:", &_dispatch_main_q);
    if (!v17)
    {
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport error](self->_helperTransport, "error"));
      id v19 = objc_claimAutoreleasedReturnValue([v18 description]);
      mach_error_t v20 = (const char *)[v19 UTF8String];
      DYLog(kDYLoggingLevelError, "failed to create helper transport source: %s", v20);

      -[DYEmbeddedDaemon terminate:](self, "terminate:", 1LL);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100004230;
    v29[3] = &unk_10000C698;
    v29[4] = self;
    [v17 setCancellationHandler:v29];
    [v17 resume];
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[DYTransport connect](self->_helperTransport, "connect"));
    [v21 timeoutAfter:0 label:500.0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000043B8;
    v24[3] = &unk_10000C710;
    id v22 = v21;
    id v25 = v22;
    uint64_t v26 = self;
    id v27 = v8;
    id v28 = v7;
    [v22 notifyOnQueue:&_dispatch_main_q handler:v24];
  }

  return v13;
}

- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchBundleIdentifierKey]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchPathKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchEnvironmentKey]);
  id v11 = [v10 mutableCopy];

  pid_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchArgumentsKey]);
  id v42 = [v12 mutableCopy];

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchCurrentDirectoryKey]);
  id v41 = [v13 mutableCopy];

  unsigned int v14 = -[__CFString isEqualToString:](v9, "isEqualToString:", @"com.apple.gputools.ui-server");
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", @"com.apple.gputools.BinaryLaunch"))
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"BINARY_LAUNCH_PATH"]);

    id v9 = 0LL;
    v44 = v13;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kDYGuestAppLaunchReplayer]);
  if (v43)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kDYGuestAppLaunchCapture]);
    uint64_t v15 = (uint64_t)[v13 BOOLValue];
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  -[DYEmbeddedDaemon setShouldLoadCapture:](self, "setShouldLoadCapture:", v15);
  if (v43) {

  }
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kDYGuestAppLaunchDiagnostics]);
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", [v16 BOOLValue]);

  if (v14)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"GT_HOST_URL_MTL"]);
    if (v17)
    {
      id v38 = v11;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"GT_HOST_URL_MTL_DIAGNOSTICS"]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v40));
      mach_error_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
      id v21 = v18;
      id v22 = v19;
      id v23 = -[DYEmbeddedDaemon shouldLoadCapture](self, "shouldLoadCapture");
      id v24 = -[DYEmbeddedDaemon shouldLoadDiagnostics](self, "shouldLoadDiagnostics");
      if (v20)
      {
        self = (DYEmbeddedDaemon *)objc_msgSend( v20,  "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:",  v21,  v22,  0,  v23,  v24);
      }

      else
      {
      }

      BOOL v34 = 1;
      id v11 = v38;
      goto LABEL_45;
    }

- (id)processApplication:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleURL]);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 path]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"bundleIdentifier");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, @"title");

  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"fullpath");
  }
  if (!CFStringGetFileSystemRepresentation(v6, buffer, 1024LL) || stat(buffer, &v22) == -1)
  {
    id v11 = 0LL;
  }

  else
  {
    size_t v9 = strlen(buffer);
    id v10 = CFURLCreateFromFileSystemRepresentation( kCFAllocatorDefault,  (const UInt8 *)buffer,  v9,  (v22.st_mode & 0xF000) == 0x4000);
    id v11 = v10;
    if (v10)
    {
      CFDictionaryRef v12 = CFBundleCopyInfoDictionaryForURL(v10);
      if (v12)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000051B0;
        v21[3] = &unk_10000C730;
        v21[4] = v12;
        v21[5] = Mutable;
        unsigned int v14 = objc_retainBlock(v21);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleInfoDictionaryVersionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleExecutableKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleIdentifierKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleVersionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleDevelopmentRegionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleNameKey);
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"CFBundleDisplayName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"CFBundleSupportedPlatforms");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTCompiler");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformBuild");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformVersion");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTSDKName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTXcode");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTXcodeBuild");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"LSRequiresIPhoneOS");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"MinimumOSVersion");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"UIDeviceFamily");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"UIRequiredDeviceCapabilities");
        CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
        if (Data)
        {
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", Mutable, @"info plist");
          CFRelease(Data);
        }

        CFRelease(v12);
        CFRelease(Mutable);
      }

      PathComponent = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v11);
      id v17 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, PathComponent, @"iTunesMetadata.plist", 0);
      CFRelease(PathComponent);
      unsigned __int8 v18 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v17);
      CFRelease(v17);
      if (v18)
      {
        if (CFReadStreamOpen(v18))
        {
          CFPropertyListRef v19 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v18, 0LL, 0LL, 0LL, 0LL);
          CFReadStreamClose(v18);
          if (v19)
          {
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, @"itunes metadata");
            CFRelease(v19);
          }
        }

        CFRelease(v18);
      }

      CFRelease(v11);
      id v11 = v4;
    }
  }

  return v11;
}

- (id)getApplications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  CFDictionaryRef v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  unsigned int v14 = sub_1000053C8;
  uint64_t v15 = &unk_10000C758;
  dispatch_queue_t v16 = self;
  id v5 = v3;
  id v17 = v5;
  [v4 enumerateBundlesOfType:1 block:&v12];

  if (-[DYEmbeddedDaemon isAppleInternal](self, "isAppleInternal"))
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    [v5 addObject:v6];
    -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  @"com.apple.gputools.ui-server",  @"bundleIdentifier");
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", @"UI Server", @"title");
    id v7 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v8 = -[NSDictionary initWithObjectsAndKeys:]( v7,  "initWithObjectsAndKeys:",  @"Binary Launch",  @"title",  @"com.apple.gputools.BinaryLaunch",  @"bundleIdentifier",  0LL,  v12,  v13,  v14,  v15,  v16);
    [v5 addObject:v8];
  }

  size_t v9 = v17;
  id v10 = v5;

  return v10;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 kind];
  if (v5 > 1537)
  {
    if (v5 == 1538)
    {
      if (-[DYEmbeddedDaemon inferiorPid](self, "inferiorPid"))
      {
        symbolicatorQueue = (dispatch_queue_s *)self->_symbolicatorQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100005D30;
        block[3] = &unk_10000C780;
        block[4] = self;
        id v55 = v4;
        dispatch_async(symbolicatorQueue, block);
      }
    }

    else if (v5 == 2304)
    {
      uint64_t v10 = DYMobileArchivesDirectory();
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v11,  1LL));

      id v12 = objc_alloc(&OBJC_CLASS___DYFSStreamer);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
      id v8 = (NSMutableDictionary *)[v12 initWithURL:v7 transport:v13 asSender:0];

      if (v8)
      {
        -[NSMutableDictionary setOwner:](v8, "setOwner:", @"mobile");
        size_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary receiveTransfer:](v8, "receiveTransfer:", v4));
      }

      else
      {
        size_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
        +[DYFSStreamer denyTransfer:transport:](&OBJC_CLASS___DYFSStreamer, "denyTransfer:transport:", v4, v9);
      }

- (void)terminate:(int)a3
{
  pid_t v4 = -[DYEmbeddedDaemon inferiorPid](self, "inferiorPid");
  -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", 0LL);
  statsReport = self->_statsReport;
  if (statsReport)
  {
    -[DYGPUStatsReport stopCollectingStats](statsReport, "stopCollectingStats");
    BOOL v6 = self->_statsReport;
    self->_statsReport = 0LL;
  }

  if (v4 >= 1)
  {
  }

  -[DYTransport invalidate](self->_helperTransport, "invalidate");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
  [v7 destroySharedMemoryTransport];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYEmbeddedDaemon transport](self, "transport"));
  [v8 invalidate];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DYEmbeddedDaemon;
  -[DYEmbeddedDaemon invalidate](&v9, "invalidate");
  (*((void (**)(void))self->_terminationHandler + 2))();
}

- (void).cxx_destruct
{
}

@end