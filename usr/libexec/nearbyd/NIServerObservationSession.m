@interface NIServerObservationSession
- (BOOL)validateClientPermissions;
- (NIServerObservationSession)initWithClientInfo:(const NIServerClientInfo *)a3 connection:(id)a4;
- (NSString)sessionIdentifier;
- (id).cxx_construct;
- (id)signingIdentity;
- (int)pid;
- (void)_provideTruthTag:(id)a3;
- (void)activate:(id)a3;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)invalidate;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)pause:(id)a3;
- (void)runWithConfiguration:(id)a3 reply:(id)a4;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerObservationSession

- (NIServerObservationSession)initWithClientInfo:(const NIServerClientInfo *)a3 connection:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v23 handleFailureInMethod:a2, self, @"NIServerObservationSession.mm", 40, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NIServerObservationSession;
  v8 = -[NIServerObservationSession init](&v24, "init");
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned __int8 *)&v8->_shouldDeliverUpdates);
    atomic_store(0, (unsigned __int8 *)&v8->_activated);
    atomic_store(0, (unsigned __int8 *)&v8->_runOnce);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NIServerClient delegateProxyWithConnection:]( &OBJC_CLASS___NIServerClient,  "delegateProxyWithConnection:",  v7));
    remote = v10->_remote;
    v10->_remote = (NIServerClient *)v11;

    v13 = (id *)operator new(0x10uLL);
    id *v13 = a3->var0;
    *((_DWORD *)v13 + 2) = a3->var1;
    p_clientInfo = &v9->_clientInfo;
    sub_100182FE0((id **)&v9->_clientInfo, v13);
    v15 = objc_opt_new(&OBJC_CLASS___NSUUID);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v15, "UUIDString"));
    sessionIdentifier = v10->_sessionIdentifier;
    v10->_sessionIdentifier = (NSString *)v16;

    v18 = -[PRAppStateMonitor initWithPID:]( objc_alloc(&OBJC_CLASS___PRAppStateMonitor),  "initWithPID:",  p_clientInfo->__ptr_.__value_->var1);
    appStateMonitor = v10->_appStateMonitor;
    v10->_appStateMonitor = v18;
  }

  if (-[NIServerObservationSession validateClientPermissions](v10, "validateClientPermissions"))
  {
    v20 = v10;
  }

  else
  {
    v21 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394510(v21);
    }
    v20 = 0LL;
  }

  return v20;
}

- (BOOL)validateClientPermissions
{
  BOOL v3 = -[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  unsigned int v5 = [v4 isEqualToString:@"com.apple.locationd"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  unsigned __int8 v7 = [v6 isEqualToString:@"com.apple.intelligentroutingd"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.milod"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
  unsigned int v11 = [v10 isEqualToString:@"proxtool"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
  unsigned int v13 = [v12 isEqualToString:@"Hello UWB"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  unsigned int v15 = [v14 isEqualToString:@"com.apple.WirelessStress"];

  if (os_variant_allows_internal_security_policies("com.apple.nearbyd") && v11 | v13 | v15)
  {
    uint64_t v16 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#obsrvr, Internal tool permitted to be an obervation client.",  v18,  2u);
    }

    return 1;
  }

  else if (!v3 | v5)
  {
    return v3;
  }

  else
  {
    return v7 | v9;
  }

- (void)invalidate
{
  BOOL v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v4;
    __int16 v10 = 2113;
    unsigned int v11 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#obsrvr, Invalidate: %{private}@ [%{private}@]",  (uint8_t *)&v8,  0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](&OBJC_CLASS___NIServerHomeDeviceService, "sharedInstance"));
  [v6 removeServiceClientWithIdentifier:self->_sessionIdentifier];

  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  remote = self->_remote;
  self->_remote = 0LL;
}

- (void)dealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](&OBJC_CLASS___NIServerHomeDeviceService, "sharedInstance"));
  [v3 removeServiceClientWithIdentifier:self->_sessionIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerObservationSession;
  -[NIServerObservationSession dealloc](&v4, "dealloc");
}

- (int)pid
{
  value = self->_clientInfo.__ptr_.__value_;
  if (value) {
    return value->var1;
  }
  else {
    return 0;
  }
}

- (id)signingIdentity
{
  value = self->_clientInfo.__ptr_.__value_;
  if (value) {
    return value->var0;
  }
  else {
    return @"(null)";
  }
}

- (void)activate:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v6;
    __int16 v10 = 2113;
    unsigned int v11 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#obsrvr, Activate: %{private}@ [%{private}@]",  (uint8_t *)&v8,  0x16u);
  }

  v4[2](v4, &__NSDictionary0__struct, 0LL);
  atomic_store(1u, (unsigned __int8 *)&self->_activated);
}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void))a4;
  int v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138478339;
    v21 = v9;
    __int16 v22 = 2113;
    v23 = sessionIdentifier;
    __int16 v24 = 2113;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#obsrvr, Run: %{private}@ [%{private}@]. Config: %{private}@",  buf,  0x20u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v11);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerHomeDeviceService sharedInstance]( &OBJC_CLASS___NIServerHomeDeviceService,  "sharedInstance"));
    v14 = self->_sessionIdentifier;
    id v15 = [v6 copy];
    [v13 addServiceClient:self identifier:v14 configuration:v15];

    atomic_store(1u, (unsigned __int8 *)&self->_shouldDeliverUpdates);
    atomic_store(1u, (unsigned __int8 *)&self->_runOnce);
    v7[2](v7, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = @"This NIConfiguration subclass does not support observation.";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v16));

    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)pause:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerObservationSession signingIdentity](self, "signingIdentity"));
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v6;
    __int16 v10 = 2113;
    uint64_t v11 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#obsrvr, Pause: %{private}@ [%{private}@]",  (uint8_t *)&v8,  0x16u);
  }

  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  v4[2](v4, 0LL);
}

- (void)_provideTruthTag:(id)a3
{
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v4 & 1) != 0) {
    -[NIServerClient didDiscoverNearbyObject:](self->_remote, "didDiscoverNearbyObject:", v5);
  }
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v7 = a3;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v6 & 1) != 0) {
    -[NIServerClient didRemoveNearbyObjects:withReason:](self->_remote, "didRemoveNearbyObjects:withReason:", v7, a4);
  }
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v4 & 1) != 0) {
    -[NIServerClient didUpdateNearbyObjects:](self->_remote, "didUpdateNearbyObjects:", v5);
  }
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v10 & 1) != 0) {
    -[NIServerClient object:didUpdateRegion:previousRegion:]( self->_remote,  "object:didUpdateRegion:previousRegion:",  v11,  v8,  v9);
  }
}

- (void)didUpdateMotionState:(int64_t)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v3 & 1) != 0) {
    -[NIServerClient didUpdateMotionState:](self->_remote, "didUpdateMotionState:", a3);
  }
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v4 & 1) != 0)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if ((v5 & 1) != 0) {
      -[NIServerClient uwbSessionInterruptedWithReason:timestamp:]( self->_remote,  "uwbSessionInterruptedWithReason:timestamp:",  a3,  a4);
    }
  }

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v4 & 1) != 0)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if ((v5 & 1) != 0) {
      -[NIServerClient uwbSessionInterruptionReasonEnded:timestamp:]( self->_remote,  "uwbSessionInterruptionReasonEnded:timestamp:",  a3,  a4);
    }
  }

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v7 & 1) != 0) {
    -[NIServerClient didUpdateAlgorithmState:forObject:](self->_remote, "didUpdateAlgorithmState:forObject:", v8, v6);
  }
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if ((v3 & 1) != 0) {
    -[NIServerClient didUpdateHomeDeviceUWBRangingAvailability:]( self->_remote,  "didUpdateHomeDeviceUWBRangingAvailability:",  a3);
  }
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  return self;
}

@end