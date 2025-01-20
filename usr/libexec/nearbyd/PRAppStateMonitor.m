@interface PRAppStateMonitor
- (BOOL)isDaemon;
- (BOOL)isRunningBoardApp;
- (BOOL)isUIBackgroundModeEnabled;
- (BOOL)isXPCService;
- (NSArray)printableState;
- (NSString)launchdJobLabel;
- (NSString)monitoredProcessName;
- (PRAppStateMonitor)initWithPID:(int)a3;
- (id).cxx_construct;
- (int)currentAppState;
- (int)monitoredPID;
- (void)_process:(id)a3 didTerminate:(id)a4;
- (void)_process:(id)a3 didUpdateState:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation PRAppStateMonitor

- (PRAppStateMonitor)initWithPID:(int)a3
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PRAppStateMonitor;
  v4 = -[PRAppStateMonitor init](&v40, "init");
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    observers = v4->_observers;
    v4->_observers = v5;

    processNameInternal = v4->_processNameInternal;
    v4->_processNameInternal = 0LL;

    launchdJobLabelInternal = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = 0LL;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_monitoredPID = a3;
    objc_initWeak(&location, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v4->_monitoredPID));
    id v38 = 0LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v9,  &v38));
    id v11 = v38;
    processHandle = v4->_processHandle;
    v4->_processHandle = (RBSProcessHandle *)v10;

    if (v11)
    {
      v13 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100395BE0((uint64_t)v11, v13);
      }
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[RBSProcessHandle name](v4->_processHandle, "name"));
    v15 = v4->_processNameInternal;
    v4->_processNameInternal = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[RBSProcessHandle daemonJobLabel](v4->_processHandle, "daemonJobLabel"));
    v17 = v4->_launchdJobLabelInternal;
    v4->_launchdJobLabelInternal = (NSString *)v16;

    v4->_isDaemonInternal = -[RBSProcessHandle isDaemon](v4->_processHandle, "isDaemon");
    v4->_isRunningBoardAppInternal = -[RBSProcessHandle isApplication]( v4->_processHandle,  "isApplication");
    v4->_isXPCServiceInternal = -[RBSProcessHandle isXPCService](v4->_processHandle, "isXPCService");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v4->_processHandle, "bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleInfoValueForKey:@"UIBackgroundModes"]);
    v4->_isUIBackgroundModeEnabledInternal = [v19 containsObject:@"nearby-interaction"];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v4->_processHandle, "bundle"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 identifier]);
    bundleIdentifierInternal = v4->_bundleIdentifierInternal;
    v4->_bundleIdentifierInternal = (NSString *)v21;

    v4->_timeOfLatestAppState = sub_100023CC4();
    v23 = v4->_processHandle;
    if (v23) {
      -[RBSProcessHandle auditToken](v23, "auditToken");
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    v24 = (void *)xpc_copy_code_signing_identity_for_token(v37);
    if (v24)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v24));
      signingIdentityInternal = v4->_signingIdentityInternal;
      v4->_signingIdentityInternal = (NSString *)v25;

      free(v24);
    }

    v27 = v4->_processHandle;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10019405C;
    v35[3] = &unk_1007B38F8;
    objc_copyWeak(&v36, &location);
    -[RBSProcessHandle monitorForDeath:](v27, "monitorForDeath:", v35);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001940DC;
    v32[3] = &unk_1007B3948;
    id v28 = v9;
    id v33 = v28;
    objc_copyWeak(&v34, &location);
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v32));
    processMonitor = v4->_processMonitor;
    v4->_processMonitor = (RBSProcessMonitor *)v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PRAppStateMonitor;
  -[PRAppStateMonitor dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
}

- (NSString)monitoredProcessName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_processNameInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)launchdJobLabel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_launchdJobLabelInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isDaemon
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDaemonInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRunningBoardApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isRunningBoardAppInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isXPCService
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isXPCServiceInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUIBackgroundModeEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isUIBackgroundModeEnabledInternal;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)currentAppState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_latestState.__engaged_) {
    int appState = self->_latestState.var0.__val_.appState;
  }
  else {
    int appState = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return appState;
}

- (NSArray)printableState
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_autoreleasePoolPush();
  if (self->_isDaemonInternal)
  {
    v6 = @"Daemon";
  }

  else if (self->_isXPCServiceInternal)
  {
    v6 = @"XPC Service";
  }

  else if (self->_isRunningBoardAppInternal)
  {
    v6 = @"App";
  }

  else
  {
    v6 = @"Other";
  }

  v7 = v6;
  if (self->_latestState.__engaged_ && (unsigned int v8 = self->_latestState.var0.__val_.appState - 1, v8 <= 2)) {
    v9 = off_1007B39A0[v8];
  }
  else {
    v9 = @"Unknown";
  }
  if (self->_latestState.__engaged_)
  {
    unsigned int v10 = -[RBSProcessState isRunning](self->_latestState.var0.__val_.processState, "isRunning");
    id v11 = @"No";
    if (v10) {
      id v11 = @"Yes";
    }
  }

  else
  {
    id v11 = @"Unknown";
  }

  v12 = v11;
  if (self->_latestState.__engaged_) {
    id v13 = -[RBSProcessState taskState](self->_latestState.var0.__val_.processState, "taskState");
  }
  else {
    id v13 = 0LL;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%d: %@]",  self->_monitoredPID,  self->_processNameInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v14);

  v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Type: %@. State: running %@ [%d], app %@ [age: %.2f s]. Observers: %d",  v7,  v12,  v13,  v9,  sub_100023CC4() - self->_timeOfLatestAppState,  -[NSMutableSet count](self->_observers, "count"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Label: %@. Signing ID: %@",  self->_launchdJobLabelInternal,  self->_signingIdentityInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Bundle: ID %@, UIBackgroundModeNI %d",  self->_bundleIdentifierInternal,  self->_isUIBackgroundModeEnabledInternal));
  -[NSMutableArray addObject:](v3, "addObject:", v18);

  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v3;
}

- (void)_process:(id)a3 didUpdateState:(id)a4
{
  id v26 = a3;
  id v27 = a4;
  v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
    *(_DWORD *)buf = 138478339;
    v41 = (const char *)v26;
    __int16 v42 = 2113;
    *(void *)v43 = v7;
    *(_WORD *)&v43[8] = 2113;
    *(void *)&v43[10] = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PRAppStateMonitor] _process: %{private}@, name: %{private}@, didUpdateState: %{private}@",  buf,  0x20u);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v27 state]);
  id v37 = sub_100194CF0(v8);
  uint64_t v38 = v9;

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v27 previousState]);
  id v25 = sub_100194CF0(v10);
  int v12 = v11;

  int v13 = [v26 pid];
  p_monitoredPID = &self->_monitoredPID;
  if (v13 != self->_monitoredPID)
  {
    v22 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395C54(p_monitoredPID, v13, v22);
    }
    v23 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/AppState/PRAppStateMonitor.mm";
      __int16 v42 = 1024;
      *(_DWORD *)v43 = 250;
      *(_WORD *)&v43[4] = 2080;
      *(void *)&v43[6] = "-[PRAppStateMonitor _process:didUpdateState:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }

    abort();
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_processNameInternal)
  {
    v15 = (NSString *)objc_claimAutoreleasedReturnValue([v26 name]);
    processNameInternal = self->_processNameInternal;
    self->_processNameInternal = v15;
  }

  sub_100194D78((uint64_t)&self->_latestState, (uint64_t)&v37);
  os_unfair_lock_unlock(&self->_lock);
  if ((_DWORD)v38 != v12)
  {
    self->_timeOfLatestAppState = sub_100023CC4();
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    obj = self->_observers;
    id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
    if (v17)
    {
      uint64_t v18 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v20 updatesQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3321888768LL;
          block[2] = sub_100194DDC;
          block[3] = &unk_1007B3970;
          block[4] = v20;
          int v32 = v13;
          id v30 = v37;
          int v31 = v38;
          dispatch_async(v21, block);
        }

        id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
      }

      while (v17);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (void)_process:(id)a3 didTerminate:(id)a4
{
  id v14 = a3;
  unsigned int v5 = [v14 pid];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v7 = self->_observers;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  os_unfair_lock_t lock = p_lock;
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updatesQueue", lock));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100194FDC;
        block[3] = &unk_1007B2EE0;
        block[4] = v11;
        unsigned int v16 = v5;
        dispatch_async(v12, block);
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  os_unfair_lock_unlock(lock);
}

- (int)monitoredPID
{
  return self->_monitoredPID;
}

- (void).cxx_destruct
{
  if (self->_latestState.__engaged_) {

  }
  objc_storeStrong((id *)&self->_processHandle, 0LL);
  objc_storeStrong((id *)&self->_processMonitor, 0LL);
  objc_storeStrong((id *)&self->_observers, 0LL);
  objc_storeStrong((id *)&self->_signingIdentityInternal, 0LL);
  objc_storeStrong((id *)&self->_bundleIdentifierInternal, 0LL);
  objc_storeStrong((id *)&self->_launchdJobLabelInternal, 0LL);
  objc_storeStrong((id *)&self->_processNameInternal, 0LL);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 96) = 0;
  return self;
}

@end