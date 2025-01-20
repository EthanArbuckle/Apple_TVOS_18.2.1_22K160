@interface MRCompanionConnectionController
- (BOOL)_shouldAttemptToDiscoverAndConnectToCompanion;
- (MRAVEndpoint)companionEndpoint;
- (MRCompanionConnectionController)init;
- (MRCompanionConnectionControllerDelegate)delegate;
- (id)debugDescription;
- (void)_handleCompanionDeviceConnectedNotification:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_maybeAttemptToDiscoverAndConnectToCompanionWithReason:(id)a3;
- (void)setCompanionEndpoint:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRCompanionConnectionController

- (MRCompanionConnectionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRCompanionConnectionController;
  v2 = -[MRCompanionConnectionController init](&v7, "init");
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 2LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DC6E8;
    block[3] = &unk_100399250;
    v6 = v2;
    dispatch_after(v3, &_dispatch_main_q, block);
  }

  return v2;
}

- (void)setCompanionEndpoint:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  p_companionEndpoint = &v6->_companionEndpoint;
  if (v6->_companionEndpoint)
  {
    uint64_t v9 = _MRLogForCategory(9LL, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v11 = *p_companionEndpoint;
    *(_DWORD *)buf = 138544130;
    v25 = @"MRDCompanionConnectionController";
    __int16 v26 = 2114;
    v27 = @"companionEndpoint";
    __int16 v28 = 2112;
    v29 = v11;
    __int16 v30 = 2112;
    id v31 = v5;
    v12 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    v13 = v10;
    uint32_t v14 = 42;
  }

  else
  {
    uint64_t v15 = _MRLogForCategory(9LL, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    v25 = @"MRDCompanionConnectionController";
    __int16 v26 = 2114;
    v27 = @"companionEndpoint";
    __int16 v28 = 2112;
    v29 = (MRAVEndpoint *)v5;
    v12 = "Set: %{public}@ setting %{public}@ to <%@>";
    v13 = v10;
    uint32_t v14 = 32;
  }

  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_7:

  if (v5)
  {
    objc_storeStrong((id *)&v6->_companionEndpoint, a3);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000DCAF8;
    v20[3] = &unk_100398E60;
    v20[4] = v6;
    id v21 = v5;
    dispatch_async(&_dispatch_main_q, v20);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    unsigned int v17 = [v16 isConnected];

    if (v17)
    {
      dispatch_time_t v18 = dispatch_time(0LL, 30000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000DCAA8;
      block[3] = &unk_100399250;
      void block[4] = v6;
      dispatch_after(v18, &_dispatch_main_q, block);
    }

    if (*p_companionEndpoint)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000DCAB8;
      v22[3] = &unk_100399250;
      v22[4] = v6;
      dispatch_async(&_dispatch_main_q, v22);
    }

    v19 = *p_companionEndpoint;
    *p_companionEndpoint = 0LL;
  }

  objc_sync_exit(v6);
}

- (void)_handleCompanionDeviceConnectedNotification:(id)a3
{
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRCompanionConnectionController companionEndpoint](v5, "companionEndpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 externalDevice]);

  if (v8 == v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMRExternalDeviceConnectionStateUserInfoKey]);
    unsigned int v11 = [v10 intValue];

    if (v11 == 3)
    {
      uint64_t v13 = _MRLogForCategory(9LL, v12);
      uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRCompanionConnectionController] CompanionEndpoint disconnected because externalDevice connection state",  v17,  2u);
      }

      uint64_t v15 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 104LL);
      lastConnectionAttemptError = v5->_lastConnectionAttemptError;
      v5->_lastConnectionAttemptError = v15;

      -[MRCompanionConnectionController setCompanionEndpoint:](v5, "setCompanionEndpoint:", 0LL);
      -[MRCompanionConnectionController _maybeAttemptToDiscoverAndConnectToCompanionWithReason:]( v5,  "_maybeAttemptToDiscoverAndConnectToCompanionWithReason:",  @"Reconnect");
    }
  }

  objc_sync_exit(v5);
}

- (BOOL)_shouldAttemptToDiscoverAndConnectToCompanion
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  if (![v3 isConnected])
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_16;
  }

  companionEndpoint = self->_companionEndpoint;
  if (!companionEndpoint)
  {
    if (!self->_isDiscovering)
    {
      BOOL v7 = !self->_isConnecting;
      goto LABEL_16;
    }

    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint externalDevice](companionEndpoint, "externalDevice"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint externalDevice](self->_companionEndpoint, "externalDevice"));
    BOOL v7 = [v6 connectionState] == 3 && !self->_isDiscovering && !self->_isConnecting;
  }

  else
  {
    BOOL v7 = !self->_isDiscovering && !self->_isConnecting;
  }

LABEL_16:
  return v7;
}

- (void)_maybeAttemptToDiscoverAndConnectToCompanionWithReason:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (-[MRCompanionConnectionController _shouldAttemptToDiscoverAndConnectToCompanion]( v6,  "_shouldAttemptToDiscoverAndConnectToCompanion"))
  {
    objc_storeStrong((id *)&v6->_lastConnectionAttemptReason, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastConnectionAttemptDate = v6->_lastConnectionAttemptDate;
    v6->_lastConnectionAttemptDate = (NSDate *)v8;

    lastConnectionAttemptError = v6->_lastConnectionAttemptError;
    v6->_lastConnectionAttemptError = 0LL;

    v6->_isDiscovering = 1;
    uint64_t v12 = _MRLogForCategory(9LL, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRCompanionConnectionController] Attempting to discover and connect to companion because <%@>",  buf,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
    uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Persistent Companion Connection: %@",  v5);
    v16 = &_dispatch_main_q;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000DCFB8;
    v18[3] = &unk_10039EDC0;
    v18[4] = v6;
    id v19 = v5;
    [v14 searchEndpointsForCompanionWithTimeout:v15 reason:&_dispatch_main_q queue:v18 completion:30.0];
  }

  else
  {
    uint64_t v17 = _MRLogForCategory(9LL, v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG)) {
      sub_1002B8470((uint64_t)v5, (os_log_s *)v14);
    }
  }

  objc_sync_exit(v6);
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  dispatch_time_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v13.receiver = v2;
  v13.super_class = (Class)&OBJC_CLASS___MRCompanionConnectionController;
  id v4 = -[MRCompanionConnectionController description](&v13, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"%@\n { Endpoint = %@",  v5,  v2->_companionEndpoint);

  companionEndpoint = v2->_companionEndpoint;
  if (companionEndpoint)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint externalDevice](companionEndpoint, "externalDevice"));
    uint64_t v9 = (void *)MRExternalDeviceConnectionStateCopyDescription([v8 connectionState]);
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\nExternalDevice = %@", v9);
  }

  if (v2->_isDiscovering) {
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\nisDiscovering=YES");
  }
  if (v2->_isConnecting) {
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\nisConnecting=YES");
  }
  if (v2->_lastConnectionAttemptReason) {
    -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\nConnection Reason = %@",  v2->_lastConnectionAttemptReason);
  }
  if (v2->_lastConnectionAttemptDate)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceDate:v2->_lastConnectionAttemptDate];
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\nConnection attempted <%lf> seconds ago", v11);
  }

  if (v2->_lastConnectionAttemptError) {
    -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\nCnnection error = %@",  v2->_lastConnectionAttemptError);
  }
  objc_sync_exit(v2);

  return v6;
}

- (MRAVEndpoint)companionEndpoint
{
  return self->_companionEndpoint;
}

- (MRCompanionConnectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRCompanionConnectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end