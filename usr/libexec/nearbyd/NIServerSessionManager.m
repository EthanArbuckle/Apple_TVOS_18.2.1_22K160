@interface NIServerSessionManager
- (BOOL)_registerObserverSessionWithConnection:(id)a3;
- (BOOL)_registerSessionWithConnection:(id)a3;
- (BOOL)isSessionAllowedToActivate:(id)a3;
- (BOOL)registerSessionWithConnection:(id)a3 observerSession:(BOOL)a4;
- (NIServerSessionManager)initWithQueue:(id)a3;
- (id)allSessionsPrintableState;
- (id)updatesQueue;
- (void)_handleObserverSessionXPCDisconnection:(id)a3;
- (void)_handleXPCDisconnection:(id)a3;
- (void)_startObserving:(id)a3;
- (void)_stopObserving:(id)a3;
- (void)enableInternalObserverSession;
- (void)monitoredApp:(int)a3 didChangeState:(int)a4;
- (void)registerObserversForSession:(id)a3;
@end

@implementation NIServerSessionManager

- (NIServerSessionManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NIServerSessionManager;
  v6 = -[NIServerSessionManager init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_sessionsLock._os_unfair_lock_opaque = 0;
    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    sessions = v7->_sessions;
    v7->_sessions = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    observerSessions = v7->_observerSessions;
    v7->_observerSessions = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    processMonitors = v7->_processMonitors;
    v7->_processMonitors = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NIPrivacyAuthorizationManager);
    authManager = v7->_authManager;
    v7->_authManager = v14;

    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
          unsigned int v17 = [v16 BOOLForKey:@"EnableStateDump"],
          v16,
          v17))
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10016D48C;
      v19[3] = &unk_1007B1E00;
      v20 = v7;
      os_state_add_handler(&_dispatch_main_q, v19);
    }
  }

  return v7;
}

- (void)enableInternalObserverSession
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,Enabling internal observer session.",  v7,  2u);
  }

  if (!self->_recentlyObservedObjectsCache)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NIRecentlyObservedObjectsCache);
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    self->_recentlyObservedObjectsCache = v5;
  }

  os_unfair_lock_unlock(p_sessionsLock);
}

- (BOOL)registerSessionWithConnection:(id)a3 observerSession:(BOOL)a4
{
  id v6 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (a4) {
    unsigned __int8 v8 = -[NIServerSessionManager _registerObserverSessionWithConnection:]( self,  "_registerObserverSessionWithConnection:",  v6);
  }
  else {
    unsigned __int8 v8 = -[NIServerSessionManager _registerSessionWithConnection:](self, "_registerSessionWithConnection:", v6);
  }
  BOOL v9 = v8;
  os_unfair_lock_unlock(p_sessionsLock);

  return v9;
}

- (BOOL)_registerSessionWithConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  id v5 = [v4 processIdentifier];
  id v6 = sub_100294100();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 setRemoteObjectInterface:v7];

  id v8 = sub_1002932F0();
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setExportedInterface:v9];

  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v59, 0, sizeof(v59));
  }
  v10 = (void *)xpc_copy_code_signing_identity_for_token(v59);
  if (v10)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    uint64_t v53 = 0LL;
    v54 = &v53;
    uint64_t v55 = 0x3032000000LL;
    v56 = sub_10016DC48;
    v57 = sub_10016DC58;
    id v58 = 0LL;
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 _queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768LL;
    block[2] = sub_10016DC60;
    block[3] = &unk_1007B21C0;
    v50 = &v53;
    id v12 = v4;
    id v48 = v12;
    int v52 = (int)v5;
    id v34 = v36;
    id v51 = v34;
    v49 = self;
    dispatch_sync(v11, block);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13));
    BOOL v15 = v14 == 0LL;

    if (v15)
    {
      v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessions,  "setObject:forKeyedSubscript:",  v16,  v13,  v34);
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessions,  "objectForKeyedSubscript:",  v13,  v34));
    [v17 addObject:v54[5]];

    v18 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13));
      id v20 = [v19 count];
      *(_DWORD *)buf = 138478595;
      v61 = @"Adding session to ";
      __int16 v62 = 1025;
      int v63 = (int)v5;
      __int16 v64 = 2113;
      v65 = @"pid dict. Current count:";
      __int16 v66 = 2048;
      id v67 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,%{private}@ %{private}d %{private}@ %lu",  buf,  0x26u);
    }

    objc_super v21 = (PRAppStateMonitor *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processMonitors, "objectForKey:", v13));
    if (!v21)
    {
      objc_super v21 = -[PRAppStateMonitor initWithPID:](objc_alloc(&OBJC_CLASS___PRAppStateMonitor), "initWithPID:", v5);
      processMonitors = self->_processMonitors;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
      -[NSMutableDictionary setObject:forKey:](processMonitors, "setObject:forKey:", v21, v23);

      -[PRAppStateMonitor addObserver:](v21, "addObserver:", self);
    }

    objc_initWeak((id *)buf, self);
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 _queue]);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10016DD2C;
    v43[3] = &unk_1007B21F8;
    v46 = &v53;
    v25 = v21;
    v44 = v25;
    v45 = self;
    dispatch_sync(v24, v43);

    [v12 setExportedObject:v54[5]];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10016DD9C;
    v40[3] = &unk_1007B2220;
    int v42 = (int)v5;
    objc_copyWeak(&v41, (id *)buf);
    v40[4] = &v53;
    [v12 setInterruptionHandler:v40];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10016DE78;
    v37[3] = &unk_1007B2220;
    int v39 = (int)v5;
    objc_copyWeak(&v38, (id *)buf);
    v37[4] = &v53;
    [v12 setInvalidationHandler:v37];
    [v12 resume];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v41);

    objc_destroyWeak((id *)buf);
    _Block_object_dispose(&v53, 8);
  }

  else
  {
    v26 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100392678((uint64_t)v5, v26, v27, v28, v29, v30, v31, v32);
    }
  }

  return v10 != 0LL;
}

- (BOOL)_registerObserverSessionWithConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  id v5 = [v4 processIdentifier];
  id v6 = sub_100294100();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 setRemoteObjectInterface:v7];

  id v8 = sub_1002932F0();
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setExportedInterface:v9];

  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v44, 0, sizeof(v44));
  }
  v10 = (void *)xpc_copy_code_signing_identity_for_token(v44);
  if (v10)
  {
    id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL));
    int v43 = (int)v5;
    free(v10);
    v11 = -[NIServerObservationSession initWithClientInfo:connection:]( objc_alloc(&OBJC_CLASS___NIServerObservationSession),  "initWithClientInfo:connection:",  &v42,  v4);
    [v4 setExportedObject:v11];
    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      -[NIServerSessionManager _startObserving:](self, "_startObserving:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observerSessions,  "objectForKeyedSubscript:"));
      BOOL v14 = v13 == 0LL;

      if (v14)
      {
        BOOL v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_observerSessions,  "setObject:forKeyedSubscript:",  v15,  v33);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observerSessions,  "objectForKeyedSubscript:",  v33));
      [v16 addObject:v11];

      unsigned int v17 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_observerSessions,  "objectForKeyedSubscript:",  v33));
        id v19 = [v18 count];
        *(_DWORD *)buf = 138478595;
        v46 = @"Adding observer session to ";
        __int16 v47 = 1025;
        int v48 = (int)v5;
        __int16 v49 = 2113;
        v50 = @"pid dict. Current count:";
        __int16 v51 = 2048;
        id v52 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,%{private}@ %{private}d %{private}@ %lu",  buf,  0x26u);
      }

      id v20 = (PRAppStateMonitor *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processMonitors, "objectForKey:", v33));
      if (!v20)
      {
        id v20 = -[PRAppStateMonitor initWithPID:](objc_alloc(&OBJC_CLASS___PRAppStateMonitor), "initWithPID:", v5);
        processMonitors = self->_processMonitors;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
        -[NSMutableDictionary setObject:forKey:](processMonitors, "setObject:forKey:", v20, v22);

        -[PRAppStateMonitor addObserver:](v20, "addObserver:", self);
      }

      objc_initWeak((id *)buf, self);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10016E494;
      v38[3] = &unk_1007A2648;
      int v41 = (int)v5;
      objc_copyWeak(&v40, (id *)buf);
      v23 = v11;
      int v39 = v23;
      [v4 setInterruptionHandler:v38];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10016E568;
      v34[3] = &unk_1007A2648;
      int v37 = (int)v5;
      objc_copyWeak(&v36, (id *)buf);
      v35 = v23;
      [v4 setInvalidationHandler:v34];
      [v4 resume];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      uint64_t v31 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003926DC(v31);
      }
    }
  }

  else
  {
    v24 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100392678((uint64_t)v5, v24, v25, v26, v27, v28, v29, v30);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_handleXPCDisconnection:(id)a3
{
  id v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"NIServerSessionManager.mm", 221, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }

  v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,disconnection for session %{private}@.",  buf,  0xCu);
  }

  id v8 = [v5 pid];
  [v5 invalidate];
  sessions = self->_sessions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v10));
  [v11 removeObject:v5];

  BOOL v12 = self->_sessions;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  BOOL v15 = [v14 count] == 0;

  if (v15)
  {
    v16 = self->_sessions;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);
  }

  v18 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,removed session object from retained sessions.",  buf,  2u);
  }

  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)_handleObserverSessionXPCDisconnection:(id)a3
{
  id v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"NIServerSessionManager.mm", 238, @"Invalid parameter not satisfying: %@", @"observationSession" object file lineNumber description];
  }

  v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,disconnection for observer session %{private}@.",  buf,  0xCu);
  }

  -[NIServerSessionManager _stopObserving:](self, "_stopObserving:", v5);
  id v8 = [v5 pid];
  [v5 invalidate];
  observerSessions = self->_observerSessions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](observerSessions, "objectForKeyedSubscript:", v10));
  [v11 removeObject:v5];

  BOOL v12 = self->_observerSessions;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  BOOL v15 = [v14 count] == 0;

  if (v15)
  {
    v16 = self->_observerSessions;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);
  }

  v18 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,removed observer session object from retained sessions.",  buf,  2u);
  }

  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_sessionsLock);
  v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001948A8(a4);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v16 = 67109378;
    int v17 = v5;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,SessionManager got update for pid: %d state: %@",  (uint8_t *)&v16,  0x12u);
  }

  if (a4 == 1)
  {
    processMonitors = self->_processMonitors;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](processMonitors, "objectForKey:", v11));

    [v12 invalidate];
    v13 = self->_processMonitors;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

    BOOL v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,pid %d is gone. Clearing auth manager state.",  (uint8_t *)&v16,  8u);
    }

    -[NIPrivacyAuthorizationManager clearStateForPid:](self->_authManager, "clearStateForPid:", v5);
  }

  os_unfair_lock_unlock(&self->_sessionsLock);
}

- (id)updatesQueue
{
  return self->_queue;
}

- (BOOL)isSessionAllowedToActivate:(id)a3
{
  id v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (v4)
  {
    id v6 = [v4 pid];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v7));
    id v9 = [v8 count];

    v10 = (os_log_s *)qword_1008000A0;
    BOOL v11 = (unint64_t)v9 < 0x15;
    if ((unint64_t)v9 >= 0x15)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100392798((int)v6, v10);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138478595;
      BOOL v15 = @"Session for pid is allowed to activate";
      __int16 v16 = 1025;
      int v17 = (int)v6;
      __int16 v18 = 2113;
      id v19 = @"current count: ";
      __int16 v20 = 2048;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#nisessmgr,%{private}@ %{private}d %{private}@ %lu",  (uint8_t *)&v14,  0x26u);
    }
  }

  else
  {
    BOOL v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100392718(v12);
    }
    BOOL v11 = 0;
  }

  os_unfair_lock_unlock(p_sessionsLock);

  return v11;
}

- (id)allSessionsPrintableState
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_autoreleasePoolPush();
  v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  processMonitors = self->_processMonitors;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10016F428;
  v37[3] = &unk_1007B2248;
  id v8 = v24;
  id v38 = v8;
  id v9 = v5;
  int v39 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](processMonitors, "enumerateKeysAndObjectsUsingBlock:", v37);
  v10 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  self->_sessions,  1LL);
  BOOL v11 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  self->_observerSessions,  1LL);

  os_unfair_lock_unlock(p_sessionsLock);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d clients with sessions",  -[NSDictionary count](v10, "count"),  v3,  v24));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10016F528;
  v34[3] = &unk_1007B2270;
  v13 = v3;
  v35 = v13;
  int v14 = v8;
  id v36 = v14;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v34);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d clients with observers",  -[NSDictionary count](v11, "count")));
  -[NSMutableArray addObject:](v13, "addObject:", v15);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10016F640;
  v31[3] = &unk_1007B2270;
  __int16 v16 = v13;
  uint64_t v32 = v16;
  int v17 = v14;
  v33 = v17;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v31);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d processes being tracked",  -[NSMutableDictionary count](v9, "count")));
  -[NSMutableArray addObject:](v16, "addObject:", v18);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10016F758;
  v29[3] = &unk_1007B22C0;
  id v19 = v16;
  uint64_t v30 = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10016F840;
  v26[3] = &unk_1007B2270;
  __int16 v20 = v25;
  uint64_t v27 = v20;
  id v21 = v17;
  uint64_t v28 = v21;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v26);

  objc_autoreleasePoolPop(v4);
  v40[0] = @"NI Server Summary";
  v40[1] = @"NI Server Details";
  v41[0] = v19;
  v41[1] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));

  return v22;
}

- (void)registerObserversForSession:(id)a3
{
  id v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (self->_recentlyObservedObjectsCache)
  {
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &recentlyObservedObjectsCache,  1LL));
    [v4 addObservers:v6];
  }

  observerSessions = self->_observerSessions;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10016FD64;
  v9[3] = &unk_1007B2310;
  id v8 = v4;
  id v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observerSessions, "enumerateKeysAndObjectsUsingBlock:", v9);

  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)_startObserving:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016FE10;
  v7[3] = &unk_1007B2310;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (void)_stopObserving:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100170020;
  v7[3] = &unk_1007B2310;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (void).cxx_destruct
{
}

@end