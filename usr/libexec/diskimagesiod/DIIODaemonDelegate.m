@interface DIIODaemonDelegate
+ (id)requestsStatsToNSArrayWithArray:(DIRequestsStatsArray *)a3;
- (BOOL)createNotificationPortWithError:(id *)a3;
- (BOOL)handleRefCount;
- (BOOL)isRAM;
- (BOOL)setupNewConnection:(id)a3;
- (BOOL)setupTerminationNotificationWithError:(id *)a3;
- (BOOL)tryAttachWithParams:(id)a3 error:(id *)a4;
- (BOOL)validateDeserializationWithParams:(id)a3 reply:(id)a4;
- (DIDeviceHandle)deviceHandle;
- (DIDiskArb)diskArbDisappear;
- (DIIOClientDelegate)clientDelegate;
- (DIIODaemonDelegate)initWithIsRAM:(BOOL)a3;
- (IONotificationPort)notificationPort;
- (NSMutableSet)activeConnections;
- (OS_dispatch_source)sigtermHandler;
- (OS_os_transaction)attachedTransaction;
- (__CFRunLoopSource)runLoopSource;
- (id).cxx_construct;
- (id)sandboxProfile;
- (id)serviceName;
- (unsigned)notificationIterator;
- (void)attachToExistingDeviceWithParams:(id)a3 reply:(id)a4;
- (void)attachToNewDeviceWithParams:(id)a3 reply:(id)a4;
- (void)destroyNotificationPort;
- (void)exitDaemon;
- (void)exitWithUnmount;
- (void)onClientInvalidateWithConnection:(id)a3;
- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4;
- (void)setActiveConnections:(id)a3;
- (void)setAttachedTransaction:(id)a3;
- (void)setClientDelegate:(id)a3;
- (void)setDeviceHandle:(id)a3;
- (void)setDiskArbDisappear:(id)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setSigtermHandler:(id)a3;
- (void)setupExitDaemonWatchdog;
- (void)setupSigtermHandler;
- (void)unmountAll;
- (void)validateConnection;
- (void)validateInstance;
@end

@implementation DIIODaemonDelegate

- (DIIODaemonDelegate)initWithIsRAM:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DIIODaemonDelegate;
  v4 = -[DIBaseServiceDelegate init](&v12, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  atomic_store(0, (unsigned __int8 *)&v4->_unmountStarted);
  v4->_isRAM = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  activeConnections = v5->_activeConnections;
  v5->_activeConnections = v6;

  -[DIIODaemonDelegate validateInstance](v5, "validateInstance");
  if (!-[DIIODaemonDelegate createNotificationPortWithError:](v5, "createNotificationPortWithError:", 0LL)) {
    goto LABEL_5;
  }
  -[DIIODaemonDelegate setupSigtermHandler](v5, "setupSigtermHandler");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[DIDiskArb diskArbWithError:](&OBJC_CLASS___DIDiskArb, "diskArbWithError:", 0LL));
  diskArbDisappear = v5->_diskArbDisappear;
  v5->_diskArbDisappear = (DIDiskArb *)v8;

  if (v5->_diskArbDisappear) {
LABEL_4:
  }
    v10 = v5;
  else {
LABEL_5:
  }
    v10 = 0LL;

  return v10;
}

- (void)setupExitDaemonWatchdog
{
  dispatch_time_t v3 = dispatch_time(0LL, 8000000000LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  dispatch_after(v3, v4, &stru_1001655D8);
}

- (void)setupSigtermHandler
{
  dispatch_time_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  &_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  v5 = self->_sigtermHandler;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100009854;
  handler[3] = &unk_100165600;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (void)destroyNotificationPort
{
  if (-[DIIODaemonDelegate runLoopSource](self, "runLoopSource"))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, -[DIIODaemonDelegate runLoopSource](self, "runLoopSource"), kCFRunLoopDefaultMode);
    -[DIIODaemonDelegate setRunLoopSource:](self, "setRunLoopSource:", 0LL);
  }

  if (-[DIIODaemonDelegate notificationPort](self, "notificationPort"))
  {
    IONotificationPortDestroy(-[DIIODaemonDelegate notificationPort](self, "notificationPort"));
    -[DIIODaemonDelegate setNotificationPort:](self, "setNotificationPort:", 0LL);
  }

  io_object_t notificationIterator = self->_notificationIterator;
  if (notificationIterator)
  {
    IOObjectRelease(notificationIterator);
    self->_io_object_t notificationIterator = 0;
  }

- (BOOL)createNotificationPortWithError:(id *)a3
{
  if (-[DIIODaemonDelegate notificationPort](self, "notificationPort"))
  {
    -[DIIODaemonDelegate setRunLoopSource:]( self,  "setRunLoopSource:",  IONotificationPortGetRunLoopSource(self->_notificationPort));
    if (-[DIIODaemonDelegate runLoopSource](self, "runLoopSource"))
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, -[DIIODaemonDelegate runLoopSource](self, "runLoopSource"), kCFRunLoopDefaultMode);
      return 1;
    }

    -[DIIODaemonDelegate destroyNotificationPort](self, "destroyNotificationPort");
    v7 = @"Failed getting runloop source";
  }

  else
  {
    v7 = @"Failed creating notification port";
  }

  return +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  v7,  a3);
}

- (BOOL)setupTerminationNotificationWithError:(id *)a3
{
  v5 = IOServiceMatching("AppleDiskImageDevice");
  if (IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceTerminate",  v5,  (IOServiceMatchingCallback)sub_100009C04,  self,  &self->_notificationIterator))
  {
    return +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Failed adding matching notification",  a3);
  }

  sub_100009C04(self, self->_notificationIterator);
  return 1;
}

- (void)exitDaemon
{
  int v4 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v46 = 0LL;
    uint64_t v5 = sub_1000B85DC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
    if (v8)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 BSDName]);
    }

    else
    {
      v9 = @"an unprepared device";
    }

    *(_DWORD *)buf = 68158210;
    int v48 = 32;
    __int16 v49 = 2080;
    v50 = "-[DIIODaemonDelegate exitDaemon]";
    __int16 v51 = 2114;
    v52 = v9;
    v10 = (char *)_os_log_send_and_compose_impl( v7,  &v46,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: IO daemon of %{public}@ is shutting down, stopping IO channels",  buf,  28);
    if (v8)
    {
    }

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = sub_1000B85DC();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
      if (v13)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 BSDName]);
      }

      else
      {
        v14 = @"an unprepared device";
      }

      *(_DWORD *)buf = 68158210;
      int v48 = 32;
      __int16 v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      __int16 v51 = 2114;
      v52 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: IO daemon of %{public}@ is shutting down, stopping IO channels",  buf,  0x1Cu);
      if (v13)
      {
      }
    }
  }

  *__error() = v4;
  -[DIIODaemonDelegate setupExitDaemonWatchdog](self, "setupExitDaemonWatchdog");
  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate listener](v15, "listener"));
  [v16 invalidate];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](v15, "clientDelegate"));
  BOOL v18 = v17 == 0LL;

  if (!v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](v15, "clientDelegate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 listener]);
    [v27 invalidate];
  }

  int v19 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v46 = 0LL;
    uint64_t v20 = sub_1000B85DC();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v15, "activeConnections"));
    v24 = (__CFString *)[v23 count];
    *(_DWORD *)buf = 68158210;
    int v48 = 32;
    __int16 v49 = 2080;
    v50 = "-[DIIODaemonDelegate exitDaemon]";
    __int16 v51 = 2048;
    v52 = v24;
    LODWORD(v44) = 28;
    v25 = (char *)_os_log_send_and_compose_impl( v22,  &v46,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%.*s: # client connections at time of daemon termination: %lu",  (int)buf,  v44,  v45);

    if (v25)
    {
      fprintf(__stderrp, "%s\n", v25);
      free(v25);
    }
  }

  else
  {
    uint64_t v28 = sub_1000B85DC();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v15, "activeConnections"));
      v31 = (__CFString *)[v30 count];
      *(_DWORD *)buf = 68158210;
      int v48 = 32;
      __int16 v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      __int16 v51 = 2048;
      v52 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%.*s: # client connections at time of daemon termination: %lu",  buf,  0x1Cu);
    }
  }

  *__error() = v19;
  -[DIIODaemonDelegate destroyNotificationPort](v15, "destroyNotificationPort");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate diskArbDisappear](v15, "diskArbDisappear"));
  [v32 stop];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate sigtermHandler](v15, "sigtermHandler"));
  BOOL v34 = v33 == 0LL;

  if (!v34)
  {
    v41 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate sigtermHandler](v15, "sigtermHandler"));
    dispatch_source_cancel(v41);

    -[DIIODaemonDelegate setSigtermHandler:](v15, "setSigtermHandler:", 0LL);
  }

  uint64_t ioManager = (uint64_t)v15->_ioManager;
  if (!ioManager)
  {
    int v36 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v46 = 0LL;
      uint64_t v37 = sub_1000B85DC();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v39 = 3LL;
      }
      else {
        uint64_t v39 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v48 = 32;
      __int16 v49 = 2080;
      v50 = "-[DIIODaemonDelegate exitDaemon]";
      LODWORD(v44) = 18;
      v40 = (char *)_os_log_send_and_compose_impl( v39,  &v46,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "%.*s: _ioManager was not initialized yet, quitting immediately",  (int)buf,  v44);

      if (v40)
      {
        fprintf(__stderrp, "%s\n", v40);
        free(v40);
      }
    }

    else
    {
      uint64_t v42 = sub_1000B85DC();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v48 = 32;
        __int16 v49 = 2080;
        v50 = "-[DIIODaemonDelegate exitDaemon]";
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%.*s: _ioManager was not initialized yet, quitting immediately",  buf,  0x12u);
      }
    }

    *__error() = v36;
    exit(0);
  }

  sub_100010ED4(ioManager);
  while (1)
    sleep(0xAu);
}

- (void)validateInstance
{
  v2 = getenv("LaunchInstanceID");
  if (v2)
  {
    dispatch_time_t v3 = v2;
    int v4 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v12 = 0LL;
      uint64_t v5 = sub_1000B85DC();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v7 = 3LL;
      }
      else {
        uint64_t v7 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      int v14 = 38;
      __int16 v15 = 2080;
      v16 = "-[DIIODaemonDelegate validateInstance]";
      __int16 v17 = 2082;
      BOOL v18 = v3;
      int v11 = 28;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( v7,  &v12,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: Instance ID: %{public}s",  buf,  v11);

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }

    else
    {
      uint64_t v9 = sub_1000B85DC();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v14 = 38;
        __int16 v15 = 2080;
        v16 = "-[DIIODaemonDelegate validateInstance]";
        __int16 v17 = 2082;
        BOOL v18 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Instance ID: %{public}s", buf, 0x1Cu);
      }
    }

    *__error() = v4;
  }

- (id)serviceName
{
  if (!getuid()) {
    return @"com.apple.diskimagesiod.spb";
  }
  unsigned int v3 = -[DIIODaemonDelegate isRAM](self, "isRAM");
  int v4 = @"com.apple.diskimagesiod";
  if (v3) {
    int v4 = @"com.apple.diskimagesiod.ram";
  }
  return v4;
}

- (id)sandboxProfile
{
  return @"com.apple.diskimagesiod";
}

- (void)unmountAll
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = v2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v2, "deviceHandle"));
  if (!v4
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v2, "deviceHandle")),
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 BSDName]),
        v6,
        v5,
        v4,
        !v6))
  {
LABEL_50:
    objc_sync_exit(v3);
    goto LABEL_51;
  }

  uint64_t ioManager = v3->_ioManager;
  if (!ioManager || (ioManager[112] & 1) != 0)
  {
    int v42 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v58 = 0LL;
      uint64_t v43 = sub_1000B85DC();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v45 = 3LL;
      }
      else {
        uint64_t v45 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v60 = 32;
      __int16 v61 = 2080;
      v62 = "-[DIIODaemonDelegate unmountAll]";
      LODWORD(v51) = 18;
      uint64_t v46 = (char *)_os_log_send_and_compose_impl( v45,  &v58,  0LL,  0LL,  &_mh_execute_header,  v44,  0LL,  "%.*s: Device is already ejected, skipping unmount",  (int)buf,  v51);

      if (v46)
      {
        fprintf(__stderrp, "%s\n", v46);
        free(v46);
      }
    }

    else
    {
      uint64_t v47 = sub_1000B85DC();
      int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v60 = 32;
        __int16 v61 = 2080;
        v62 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%.*s: Device is already ejected, skipping unmount",  buf,  0x12u);
      }
    }

    *__error() = v42;
    goto LABEL_50;
  }

  objc_sync_exit(v3);

  uint64_t v8 = objc_alloc(&OBJC_CLASS___DIAttachedDeviceInfo);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v3, "deviceHandle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 BSDName]);
  unsigned int v3 = -[DIAttachedDeviceInfo initWithBSDName:error:](v8, "initWithBSDName:error:", v10, 0LL);

  if (v3)
  {
    v52 = v3;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = -[DIIODaemonDelegate copyEntitiesList](v3, "copyEntitiesList");
    id v11 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v55 != v12) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Mount Point"]);
          if (v15)
          {
            int v16 = *__error();
            if (sub_1000B8654())
            {
              uint64_t v58 = 0LL;
              uint64_t v17 = sub_1000B85DC();
              BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"BSD Name"]);
              *(_DWORD *)buf = 68158467;
              if (v19) {
                uint64_t v21 = 3LL;
              }
              else {
                uint64_t v21 = 2LL;
              }
              int v60 = 32;
              __int16 v61 = 2080;
              v62 = "-[DIIODaemonDelegate unmountAll]";
              __int16 v63 = 2113;
              id v64 = v15;
              __int16 v65 = 2114;
              v66 = v20;
              LODWORD(v51) = 38;
              uint64_t v22 = (char *)_os_log_send_and_compose_impl( v21,  &v58,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%.*s: Forcing unmount of %{private}@ (%{public}@)",  buf,  v51);

              if (v22)
              {
                fprintf(__stderrp, "%s\n", v22);
                free(v22);
              }
            }

            else
            {
              uint64_t v23 = sub_1000B85DC();
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"BSD Name"]);
                *(_DWORD *)buf = 68158467;
                int v60 = 32;
                __int16 v61 = 2080;
                v62 = "-[DIIODaemonDelegate unmountAll]";
                __int16 v63 = 2113;
                id v64 = v15;
                __int16 v65 = 2114;
                v66 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%.*s: Forcing unmount of %{private}@ (%{public}@)",  buf,  0x26u);
              }
            }

            *__error() = v16;
            id v26 = v15;
            if (unmount((const char *)[v26 fileSystemRepresentation], 0x80000))
            {
              int v27 = *__error();
              if (sub_1000B8654())
              {
                uint64_t v58 = 0LL;
                uint64_t v28 = sub_1000B85DC();
                v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
                int v31 = *__error();
                if (v30) {
                  uint64_t v32 = 3LL;
                }
                else {
                  uint64_t v32 = 2LL;
                }
                *(_DWORD *)buf = 68158467;
                int v60 = 32;
                __int16 v61 = 2080;
                v62 = "-[DIIODaemonDelegate unmountAll]";
                __int16 v63 = 2113;
                id v64 = v26;
                __int16 v65 = 1024;
                LODWORD(v66) = v31;
                LODWORD(v51) = 34;
                v33 = (char *)_os_log_send_and_compose_impl( v32,  &v58,  0LL,  0LL,  &_mh_execute_header,  v29,  16LL,  "%.*s: Force unmount of %{private}@ failed with errno %d",  buf,  v51);

                if (v33)
                {
                  fprintf(__stderrp, "%s\n", v33);
                  free(v33);
                }
              }

              else
              {
                uint64_t v34 = sub_1000B85DC();
                v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  int v36 = *__error();
                  *(_DWORD *)buf = 68158467;
                  int v60 = 32;
                  __int16 v61 = 2080;
                  v62 = "-[DIIODaemonDelegate unmountAll]";
                  __int16 v63 = 2113;
                  id v64 = v26;
                  __int16 v65 = 1024;
                  LODWORD(v66) = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%.*s: Force unmount of %{private}@ failed with errno %d",  buf,  0x22u);
                }
              }

              *__error() = v27;
            }
          }
        }

        id v11 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
      }

      while (v11);
    }

    int v37 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v58 = 0LL;
      uint64_t v38 = sub_1000B85DC();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v40 = 3LL;
      }
      else {
        uint64_t v40 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v60 = 32;
      __int16 v61 = 2080;
      v62 = "-[DIIODaemonDelegate unmountAll]";
      LODWORD(v51) = 18;
      v41 = (char *)_os_log_send_and_compose_impl( v40,  &v58,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "%.*s: Unmount done",  (int)buf,  v51);

      if (v41)
      {
        fprintf(__stderrp, "%s\n", v41);
        free(v41);
      }
    }

    else
    {
      uint64_t v49 = sub_1000B85DC();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v60 = 32;
        __int16 v61 = 2080;
        v62 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%.*s: Unmount done", buf, 0x12u);
      }
    }

    *__error() = v37;

    unsigned int v3 = v52;
  }

- (void)exitWithUnmount
{
  p_unmountStarted = &self->_unmountStarted;
  while (!__ldaxr((unsigned __int8 *)p_unmountStarted))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_unmountStarted))
    {
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
      if (!v5)
      {
        int v23 = *__error();
        if (sub_1000B8654())
        {
          uint64_t v33 = 0LL;
          uint64_t v24 = sub_1000B85DC();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            uint64_t v26 = 3LL;
          }
          else {
            uint64_t v26 = 2LL;
          }
          *(_DWORD *)buf = 68157954;
          int v35 = 37;
          __int16 v36 = 2080;
          int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
          LODWORD(v30) = 18;
          int v27 = (char *)_os_log_send_and_compose_impl( v26,  &v33,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%.*s: Failed creating unmount done semaphore",  (int)buf,  v30);

          if (v27)
          {
            fprintf(__stderrp, "%s\n", v27);
            free(v27);
          }
        }

        else
        {
          uint64_t v28 = sub_1000B85DC();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            int v35 = 37;
            __int16 v36 = 2080;
            int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%.*s: Failed creating unmount done semaphore",  buf,  0x12u);
          }
        }

        *__error() = v23;
        exit(0);
      }

      v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000B52C;
      block[3] = &unk_100165628;
      block[4] = self;
      uint64_t v7 = v5;
      uint64_t v32 = v7;
      dispatch_async(v6, block);

      dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
      if (dispatch_semaphore_wait(v7, v8))
      {
        int v9 = *__error();
        if (sub_1000B8654())
        {
          uint64_t v33 = 0LL;
          uint64_t v10 = sub_1000B85DC();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            uint64_t v12 = 3LL;
          }
          else {
            uint64_t v12 = 2LL;
          }
          *(_DWORD *)buf = 68157954;
          int v35 = 37;
          __int16 v36 = 2080;
          int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
          LODWORD(v30) = 18;
          v13 = (char *)_os_log_send_and_compose_impl( v12,  &v33,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%.*s: Unmount timeout occurred",  (int)buf,  v30);

          if (v13)
          {
            fprintf(__stderrp, "%s\n", v13);
            free(v13);
          }
        }

        else
        {
          uint64_t v21 = sub_1000B85DC();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            int v35 = 37;
            __int16 v36 = 2080;
            int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%.*s: Unmount timeout occurred",  buf,  0x12u);
          }
        }

        *__error() = v9;
      }

      -[DIIODaemonDelegate exitDaemon](self, "exitDaemon");

      return;
    }
  }

  __clrex();
  int v14 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v33 = 0LL;
    uint64_t v15 = sub_1000B85DC();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v35 = 37;
    __int16 v36 = 2080;
    int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
    LODWORD(v30) = 18;
    BOOL v18 = (char *)_os_log_send_and_compose_impl( v17,  &v33,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%.*s: Exit already in progress",  (int)buf,  v30);

    if (v18)
    {
      fprintf(__stderrp, "%s\n", v18);
      free(v18);
    }
  }

  else
  {
    uint64_t v19 = sub_1000B85DC();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v35 = 37;
      __int16 v36 = 2080;
      int v37 = "-[DIIODaemonDelegate exitWithUnmount]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Exit already in progress", buf, 0x12u);
    }
  }

  *__error() = v14;
}

- (void)onClientInvalidateWithConnection:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
  [v6 removeObject:v4];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v5, "deviceHandle"));
  if (!v7)
  {
    int v8 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v39 = 0LL;
      uint64_t v9 = sub_1000B85DC();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v41 = 55;
      __int16 v42 = 2080;
      uint64_t v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
      LODWORD(v37) = 18;
      uint64_t v12 = (char *)_os_log_send_and_compose_impl( v11,  &v39,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: Reached XPC invalidation/interruption before device initialization, quitting.",  (int)buf,  v37);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      uint64_t v13 = sub_1000B85DC();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v41 = 55;
        __int16 v42 = 2080;
        uint64_t v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%.*s: Reached XPC invalidation/interruption before device initialization, quitting.",  buf,  0x12u);
      }
    }

    *__error() = v8;
    -[DIIODaemonDelegate exitDaemon](v5, "exitDaemon");
  }

  if (!-[DIIODaemonDelegate handleRefCount](v5, "handleRefCount"))
  {
    int v17 = *__error();
    if (!sub_1000B8654())
    {
      uint64_t v29 = sub_1000B85DC();
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
        id v32 = [v31 count];
        *(_DWORD *)buf = 68158210;
        int v41 = 55;
        __int16 v42 = 2080;
        uint64_t v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        __int16 v44 = 2048;
        id v45 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%.*s: Unmanaged attach, ignoring XPC disconnection (# open connections left: %lu)",  buf,  0x1Cu);
      }

      goto LABEL_34;
    }

    uint64_t v39 = 0LL;
    uint64_t v24 = sub_1000B85DC();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = 3LL;
    }
    else {
      uint64_t v26 = 2LL;
    }
    int v27 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v5, "activeConnections"));
    id v28 = [v27 count];
    *(_DWORD *)buf = 68158210;
    int v41 = 55;
    __int16 v42 = 2080;
    uint64_t v43 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
    __int16 v44 = 2048;
    id v45 = v28;
    LODWORD(v37) = 28;
    int v23 = (char *)_os_log_send_and_compose_impl( v26,  &v39,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%.*s: Unmanaged attach, ignoring XPC disconnection (# open connections left: %lu)",  (int)buf,  v37,  v38);

    if (v23)
    {
LABEL_19:
      fprintf(__stderrp, "%s\n", v23);
      free(v23);
    }

- (BOOL)tryAttachWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  -[DIIODaemonDelegate setHandleRefCount:](self, "setHandleRefCount:", [v6 handleRefCount]);
  if (-[DIIODaemonDelegate handleRefCount](self, "handleRefCount"))
  {
    uint64_t v7 = -[DIIOClientDelegate initWithIODaemon:]( objc_alloc(&OBJC_CLASS___DIIOClientDelegate),  "initWithIODaemon:",  self);
    -[DIIODaemonDelegate setClientDelegate:](self, "setClientDelegate:", v7);

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](self, "clientDelegate"));
    [v8 startXPClistener];

    uint64_t v9 = objc_alloc(&OBJC_CLASS___DIDeviceHandle);
    id v10 = [v6 regEntryID];
    uint64_t v11 = (DIDeviceHandle *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate clientDelegate](self, "clientDelegate"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](v11, "xpcEndpoint"));
    uint64_t v13 = -[DIDeviceHandle initWithRegEntryID:xpcEndpoint:](v9, "initWithRegEntryID:xpcEndpoint:", v10, v12);
    -[DIIODaemonDelegate setDeviceHandle:](self, "setDeviceHandle:", v13);
  }

  else
  {
    uint64_t v11 = -[DIDeviceHandle initWithRegEntryID:]( [DIDeviceHandle alloc],  "initWithRegEntryID:",  [v6 regEntryID]);
    -[DIIODaemonDelegate setDeviceHandle:](self, "setDeviceHandle:", v11);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
  id v37 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:]( DIBlockDevice,  "copyUnmatchedDiskImageWithRegEntryID:error:",  [v14 regEntryID],  a4);

  if (v37
    && (id v15 = [v37 ioObj],
        IOObjectRetain((io_object_t)v15),
        -[DIIODaemonDelegate setupTerminationNotificationWithError:](self, "setupTerminationNotificationWithError:", a4)))
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate diskArbDisappear](self, "diskArbDisappear"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 inputStatFS]);
    if (v17)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 inputStatFS]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 mountedOnURL]);
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 shadowChain]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 mountPoints]);
    [v16 addDisappearedCallbackWithMountPoint:v18 shadowMountPoints:v21 delegate:self];

    if (v17)
    {
    }

    int v22 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v41 = 0LL;
      uint64_t v23 = sub_1000B85DC();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = 3LL;
      }
      else {
        uint64_t v25 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v44 = 48;
      __int16 v45 = 2080;
      uint64_t v46 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
      LODWORD(v36) = 18;
      uint64_t v26 = (char *)_os_log_send_and_compose_impl( v25,  &v41,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%.*s: Dispatching DIIOManager",  (int)buf,  v36);

      if (v26)
      {
        fprintf(__stderrp, "%s\n", v26);
        free(v26);
      }
    }

    else
    {
      uint64_t v27 = sub_1000B85DC();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v44 = 48;
        __int16 v45 = 2080;
        uint64_t v46 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%.*s: Dispatching DIIOManager", buf, 0x12u);
      }
    }

    *__error() = v22;
    uint64_t v29 = operator new(0x78uLL);
    sub_100010B28(v29, v15, v6);
    self->_uint64_t ioManager = v29;
    BOOL v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C748;
    block[3] = &unk_100165650;
    objc_copyWeak(&v40, &location);
    dispatch_async(v30, block);

    int v31 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](self, "deviceHandle"));
    LOBYTE(v30) = [v31 waitForDeviceWithError:a4];

    if ((v30 & 1) != 0)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[DIDiskArb diskArbWithError:](&OBJC_CLASS___DIDiskArb, "diskArbWithError:", a4));
      uint64_t v33 = v32;
      if (v32 && ([v32 waitForDAIdleWithError:a4] & 1) != 0)
      {
        uint64_t v34 = (void *)os_transaction_create("IO handling of attached disk image");
        -[DIIODaemonDelegate setAttachedTransaction:](self, "setAttachedTransaction:", v34);

        BOOL v19 = 1;
      }

      else
      {
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v19 = 0;
    }

    objc_destroyWeak(&v40);
  }

  else
  {
    BOOL v19 = 0;
  }

  objc_destroyWeak(&location);
  return v19;
}

- (BOOL)validateDeserializationWithParams:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v10 = 0LL;
  unsigned __int8 v7 = [v5 validateDeserializationWithError:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0) {
    v6[2](v6, 0LL, v8);
  }

  return v7;
}

- (void)attachToNewDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  objc_initWeak(&location, self);
  if (-[DIIODaemonDelegate validateDeserializationWithParams:reply:]( self,  "validateDeserializationWithParams:reply:",  v6,  v7))
  {
    int v8 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v26 = 0LL;
      uint64_t v9 = sub_1000B85DC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 instanceID]);
      id v13 = [v6 regEntryID];
      *(_DWORD *)buf = 68158466;
      int v29 = 56;
      __int16 v30 = 2080;
      int v31 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
      __int16 v32 = 2114;
      uint64_t v33 = v12;
      __int16 v34 = 2048;
      id v35 = v13;
      int v21 = 38;
      int v14 = (char *)_os_log_send_and_compose_impl( v11,  &v26,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx",  buf,  v21);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }

    else
    {
      uint64_t v15 = sub_1000B85DC();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 instanceID]);
        id v18 = [v6 regEntryID];
        *(_DWORD *)buf = 68158466;
        int v29 = 56;
        __int16 v30 = 2080;
        int v31 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
        __int16 v32 = 2114;
        uint64_t v33 = v17;
        __int16 v34 = 2048;
        id v35 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx",  buf,  0x26u);
      }
    }

    *__error() = v8;
    if (!getuid() && ([v6 requiresRootDaemon] & 1) == 0)
    {
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  1LL,  @"Root daemon connection denied"));
      v7[2](v7, 0LL, v19);
      -[DIIODaemonDelegate exitDaemon](self, "exitDaemon");
    }

    uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CBD4;
    block[3] = &unk_100165678;
    objc_copyWeak(&v25, &location);
    uint64_t v24 = v7;
    id v23 = v6;
    dispatch_async(v20, block);

    objc_destroyWeak(&v25);
  }

  objc_destroyWeak(&location);
}

- (void)attachToExistingDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  if (-[DIIODaemonDelegate validateDeserializationWithParams:reply:]( self,  "validateDeserializationWithParams:reply:",  v6,  v7))
  {
    int v8 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v48 = 0LL;
      uint64_t v9 = sub_1000B85DC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 instanceID]);
      *(_DWORD *)buf = 68158466;
      int v50 = 61;
      __int16 v51 = 2080;
      v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
      __int16 v53 = 2114;
      __int128 v54 = v12;
      __int16 v55 = 2048;
      id v56 = [v6 regEntryID];
      id v13 = (char *)_os_log_send_and_compose_impl( v11,  &v48,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx",  buf,  38);

      if (v13)
      {
        fprintf(__stderrp, "%s\n", v13);
        free(v13);
      }
    }

    else
    {
      uint64_t v14 = sub_1000B85DC();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v6 instanceID]);
        *(_DWORD *)buf = 68158466;
        int v50 = 61;
        __int16 v51 = 2080;
        v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
        __int16 v53 = 2114;
        __int128 v54 = v16;
        __int16 v55 = 2048;
        id v56 = [v6 regEntryID];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx",  buf,  0x26u);
      }
    }

    *__error() = v8;
    int v17 = self;
    objc_sync_enter(v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
    BOOL v19 = v18 == 0LL;

    if (v19)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  155LL,  @"A controller XPC service attempted to connect to an existing device, but this daemon instance has no such device yet"));
      v7[2](v7, 0LL, v28);
    }

    else
    {
      id v20 = [v6 regEntryID];
      int v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
      LOBYTE(v20) = v20 == [v21 regEntryID];

      if ((v20 & 1) != 0)
      {
        unsigned __int8 v22 = atomic_load((unsigned __int8 *)&v17->_unmountStarted);
        if ((v22 & 1) != 0)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  168LL,  @"Unmount already started, notifying controller to retry later"));
          v7[2](v7, 0LL, v28);
        }

        else
        {
          if ([v6 handleRefCount]
            && !-[DIIODaemonDelegate handleRefCount](v17, "handleRefCount"))
          {
            int v29 = *__error();
            if (sub_1000B8654())
            {
              uint64_t v48 = 0LL;
              uint64_t v30 = sub_1000B85DC();
              int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v32 = 3LL;
              }
              else {
                uint64_t v32 = 2LL;
              }
              *(_DWORD *)buf = 68157954;
              int v50 = 61;
              __int16 v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              LODWORD(v47) = 18;
              uint64_t v33 = (char *)_os_log_send_and_compose_impl( v32,  &v48,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%.*s: Ignoring client reference counting request as a previous attach was performed withou t reference counting",  (int)buf,  v47);

              if (v33)
              {
                fprintf(__stderrp, "%s\n", v33);
                free(v33);
              }
            }

            else
            {
              uint64_t v34 = sub_1000B85DC();
              id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                int v50 = 61;
                __int16 v51 = 2080;
                v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%.*s: Ignoring client reference counting request as a previous attach was performed without reference counting",  buf,  0x12u);
              }
            }

            *__error() = v29;
          }

          else if (([v6 handleRefCount] & 1) == 0 {
                 && -[DIIODaemonDelegate handleRefCount](v17, "handleRefCount"))
          }
          {
            int v23 = *__error();
            if (sub_1000B8654())
            {
              uint64_t v48 = 0LL;
              uint64_t v24 = sub_1000B85DC();
              id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v26 = 3LL;
              }
              else {
                uint64_t v26 = 2LL;
              }
              *(_DWORD *)buf = 68157954;
              int v50 = 61;
              __int16 v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              LODWORD(v47) = 18;
              uint64_t v27 = (char *)_os_log_send_and_compose_impl( v26,  &v48,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%.*s: Disabling reference counting",  (int)buf,  v47);

              if (v27)
              {
                fprintf(__stderrp, "%s\n", v27);
                free(v27);
              }
            }

            else
            {
              uint64_t v36 = sub_1000B85DC();
              id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                int v50 = 61;
                __int16 v51 = 2080;
                v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disabling reference counting",  buf,  0x12u);
              }
            }

            *__error() = v23;
            -[DIIODaemonDelegate setHandleRefCount:](v17, "setHandleRefCount:", 0LL);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
            [v38 setXpcEndpoint:0];
          }

          int v39 = *__error();
          if (sub_1000B8654())
          {
            uint64_t v48 = 0LL;
            uint64_t v40 = sub_1000B85DC();
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v42 = 3LL;
            }
            else {
              uint64_t v42 = 2LL;
            }
            *(_DWORD *)buf = 68157954;
            int v50 = 61;
            __int16 v51 = 2080;
            v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
            LODWORD(v47) = 18;
            uint64_t v43 = (char *)_os_log_send_and_compose_impl( v42,  &v48,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "%.*s: Got connection to an existing disk image, returning its handle",  (int)buf,  v47);

            if (v43)
            {
              fprintf(__stderrp, "%s\n", v43);
              free(v43);
            }
          }

          else
          {
            uint64_t v44 = sub_1000B85DC();
            __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68157954;
              int v50 = 61;
              __int16 v51 = 2080;
              v52 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%.*s: Got connection to an existing disk image, returning its handle",  buf,  0x12u);
            }
          }

          *__error() = v39;
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v17, "deviceHandle"));
          ((void (**)(id, void *, void *))v7)[2](v7, v46, 0LL);

          id v28 = 0LL;
        }
      }

      else
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  150LL,  @"Registry entry ID mismatch between controller and daemon"));
        v7[2](v7, 0LL, v28);
      }
    }

    objc_sync_exit(v17);
  }
}

- (void)validateConnection
{
  if (!getenv("LaunchInstanceID"))
  {
    int v2 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v10 = 0LL;
      uint64_t v3 = sub_1000B85DC();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v12 = 40;
      __int16 v13 = 2080;
      uint64_t v14 = "-[DIIODaemonDelegate validateConnection]";
      LODWORD(v9) = 18;
      id v6 = (char *)_os_log_send_and_compose_impl( v5,  &v10,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "%.*s: As we were launched without instance ID, rejecting the connection and killing the daemon.",  (int)buf,  v9);

      if (v6)
      {
        fprintf(__stderrp, "%s\n", v6);
        free(v6);
      }
    }

    else
    {
      uint64_t v7 = sub_1000B85DC();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v12 = 40;
        __int16 v13 = 2080;
        uint64_t v14 = "-[DIIODaemonDelegate validateConnection]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%.*s: As we were launched without instance ID, rejecting the connection and killing the daemon.",  buf,  0x12u);
      }
    }

    *__error() = v2;
    exit(1);
  }

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.diskimages.creator-uc"]);
  id v6 = (void *)v5;
  if (v5
    && (objc_opt_respondsToSelector(v5, "BOOLValue") & 1) != 0
    && ([v6 BOOLValue] & 1) != 0)
  {
    int v7 = *__error();
    if (sub_1000B8654())
    {
      id location = 0LL;
      uint64_t v8 = sub_1000B85DC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      id buf = (id)0x2904100202LL;
      __int16 v47 = 2080;
      uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
      LODWORD(v38) = 18;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl( v10,  &location,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Connected client is entitled to attach a disk image",  (int)&buf,  v38);

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      uint64_t v25 = sub_1000B85DC();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id buf = (id)0x2904100202LL;
        __int16 v47 = 2080;
        uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%.*s: Connected client is entitled to attach a disk image",  (uint8_t *)&buf,  0x12u);
      }
    }

    *__error() = v7;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIIODaemonProtocol));
    [v4 setExportedInterface:v27];

    [v4 setExportedObject:self];
    objc_initWeak(&buf, self);
    objc_initWeak(&location, v4);
    id v28 = self;
    objc_sync_enter(v28);
    unsigned __int8 v29 = atomic_load((unsigned __int8 *)&v28->_unmountStarted);
    if ((v29 & 1) == 0)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10000DF34;
      v42[3] = &unk_1001656A0;
      objc_copyWeak(&v43, &buf);
      objc_copyWeak(&v44, &location);
      [v4 setInterruptionHandler:v42];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10000E110;
      v39[3] = &unk_1001656A0;
      objc_copyWeak(&v40, &buf);
      objc_copyWeak(&v41, &location);
      [v4 setInvalidationHandler:v39];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v28, "activeConnections"));
      [v30 addObject:v4];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&v43);
    }

    objc_sync_exit(v28);

    objc_destroyWeak(&location);
    objc_destroyWeak(&buf);
    BOOL v23 = 1;
  }

  else
  {
    int v12 = *__error();
    if (sub_1000B8654())
    {
      id location = 0LL;
      uint64_t v13 = sub_1000B85DC();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      id buf = (id)0x2904100202LL;
      __int16 v47 = 2080;
      uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
      LODWORD(v38) = 18;
      BOOL v16 = (char *)_os_log_send_and_compose_impl( v15,  &location,  0LL,  0LL,  &_mh_execute_header,  v14,  16LL,  "%.*s: The connected client is not entitled to attach a disk image, rejecting",  (int)&buf,  v38);

      if (v16)
      {
        fprintf(__stderrp, "%s\n", v16);
        free(v16);
      }
    }

    else
    {
      uint64_t v17 = sub_1000B85DC();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id buf = (id)0x2904100202LL;
        __int16 v47 = 2080;
        uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%.*s: The connected client is not entitled to attach a disk image, rejecting",  (uint8_t *)&buf,  0x12u);
      }
    }

    *__error() = v12;
    BOOL v19 = self;
    objc_sync_enter(v19);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate deviceHandle](v19, "deviceHandle"));
    if (v20)
    {
    }

    else
    {
      int v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIIODaemonDelegate activeConnections](v19, "activeConnections"));
      BOOL v22 = [v21 count] == 0;

      if (v22)
      {
        int v31 = *__error();
        if (sub_1000B8654())
        {
          id location = 0LL;
          uint64_t v32 = sub_1000B85DC();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            uint64_t v34 = 3LL;
          }
          else {
            uint64_t v34 = 2LL;
          }
          id buf = (id)0x2904100202LL;
          __int16 v47 = 2080;
          uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
          LODWORD(v38) = 18;
          id v35 = (char *)_os_log_send_and_compose_impl( v34,  &location,  0LL,  0LL,  &_mh_execute_header,  v33,  16LL,  "%.*s: The rejected connection caused a daemon instance to wake up. Killing it",  (int)&buf,  v38);

          if (v35)
          {
            fprintf(__stderrp, "%s\n", v35);
            free(v35);
          }
        }

        else
        {
          uint64_t v36 = sub_1000B85DC();
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            id buf = (id)0x2904100202LL;
            __int16 v47 = 2080;
            uint64_t v48 = "-[DIIODaemonDelegate setupNewConnection:]";
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%.*s: The rejected connection caused a daemon instance to wake up. Killing it",  (uint8_t *)&buf,  0x12u);
          }
        }

        *__error() = v31;
        exit(0);
      }
    }

    objc_sync_exit(v19);

    BOOL v23 = 0;
  }

  return v23;
}

- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *, id))a4;
  id v16 = 0LL;
  unsigned int v8 = [v6 validateDeserializationWithError:&v16];
  uint64_t v9 = (NSNumber *)v16;
  if (v8)
  {
    if (sub_1000110AC((uint64_t)self->_ioManager, &v19, &v18) && sub_100011284((uint64_t)self->_ioManager, outputStruct))
    {
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSNumber);
      uint64_t v11 = -[NSNumber initWithUnsignedLongLong:](v10, "initWithUnsignedLongLong:", v19);
      int v12 = objc_alloc(&OBJC_CLASS___NSNumber);
      uint64_t v13 = -[NSNumber initWithUnsignedLongLong:](v12, "initWithUnsignedLongLong:", v18);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[DIIODaemonDelegate requestsStatsToNSArrayWithArray:]( &OBJC_CLASS___DIIODaemonDelegate,  "requestsStatsToNSArrayWithArray:",  outputStruct));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v11,  @"hit",  v13,  @"miss",  v14,  @"pending_requests",  0LL));
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v11 = v9;
      uint64_t v9 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  150LL,  @"Failed to fetch stats from driver"));
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  v7[2](v7, v15, v9);
}

+ (id)requestsStatsToNSArrayWithArray:(DIRequestsStatsArray *)a3
{
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v14 = a3;
  if (a3->var1)
  {
    unint64_t v4 = 0LL;
    p_var3 = &a3->var0[0].var3;
    do
    {
      id v6 = -[NSNumber initWithUnsignedInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInt:",  *((unsigned int *)p_var3 - 4));
      int v7 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(p_var3 - 1));
      unsigned int v8 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *p_var3);
      uint64_t v9 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  p_var3[1]);
      uint64_t v10 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  p_var3[2]);
      uint64_t v11 = -[NSNumber initWithUnsignedShort:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedShort:",  *((unsigned __int16 *)p_var3 - 6));
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  @"index",  v7,  @"offset",  v8,  @"absolute_offset",  v9,  @"size",  v10,  @"total_size",  v11,  @"cmd",  0LL));

      -[NSMutableArray addObject:](v15, "addObject:", v12);
      ++v4;
      p_var3 += 5;
    }

    while (v4 < v14->var1);
  }

  return v15;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (unsigned)notificationIterator
{
  return self->_notificationIterator;
}

- (DIDeviceHandle)deviceHandle
{
  return (DIDeviceHandle *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDeviceHandle:(id)a3
{
}

- (OS_os_transaction)attachedTransaction
{
  return self->_attachedTransaction;
}

- (void)setAttachedTransaction:(id)a3
{
}

- (BOOL)isRAM
{
  return self->_isRAM;
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
}

- (DIDiskArb)diskArbDisappear
{
  return self->_diskArbDisappear;
}

- (void)setDiskArbDisappear:(id)a3
{
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIIOClientDelegate)clientDelegate
{
  return self->_clientDelegate;
}

- (void)setClientDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end