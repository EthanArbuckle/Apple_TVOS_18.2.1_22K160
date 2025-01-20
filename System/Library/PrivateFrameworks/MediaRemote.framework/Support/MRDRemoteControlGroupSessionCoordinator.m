@interface MRDRemoteControlGroupSessionCoordinator
- (BOOL)isJoiningSession;
- (BOOL)isStartingSession;
- (BOOL)isThrottled;
- (MRDGroupSessionManager)sessionManager;
- (MRDRemoteControlGroupSessionCoordinator)initWithSessionManager:(id)a3 eligibilityMonitor:(id)a4;
- (MRGroupSessionEligibilityStatus)eligibilityStatus;
- (NSString)description;
- (NSString)hostedSessionIdentifier;
- (NSString)rotatingSessionIdentifier;
- (OS_dispatch_queue)queue;
- (id)diagnosticDescription;
- (unint64_t)clusterStatus;
- (void)clearHostedSessionState;
- (void)clusterController:(id)a3 clusterStatusDidChange:(unint64_t)a4;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)initializeObserversAndState;
- (void)reevaluateAfterInterval:(double)a3 withReason:(id)a4;
- (void)reevaluateSystemStateWithReason:(id)a3;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)sessionDidRemoveAllParticipants:(id)a3;
- (void)setClusterStatus:(unint64_t)a3;
- (void)setEligibilityStatus:(id)a3;
- (void)setHostedSessionIdentifier:(id)a3;
- (void)setJoiningSession:(BOOL)a3;
- (void)setRotatingSessionIdentifier:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setStartingSession:(BOOL)a3;
- (void)setThrottled:(BOOL)a3;
@end

@implementation MRDRemoteControlGroupSessionCoordinator

- (MRDRemoteControlGroupSessionCoordinator)initWithSessionManager:(id)a3 eligibilityMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned __int8 v10 = [v9 supportGroupSessionHome];

  if ((v10 & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___MRDRemoteControlGroupSessionCoordinator;
    v12 = -[MRDRemoteControlGroupSessionCoordinator init](&v29, "init");
    if (v12)
    {
      dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
      dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);
      v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
      dispatch_queue_t v17 = dispatch_queue_create("com.apple.MRDRemoteControlGroupSessionCoordinator.queue", v16);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v17;

      objc_storeStrong((id *)&v12->_sessionManager, a3);
      [v8 addObserver:v12];
      v19 = (dispatch_queue_s *)v12->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100055B38;
      block[3] = &unk_100399250;
      v28 = v12;
      dispatch_async(v19, block);
      uint64_t v21 = _MRLogForCategory(12LL, v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Initialized",  buf,  2u);
      }
    }

    self = v12;
    v23 = self;
  }

  else
  {
    uint64_t v24 = _MRLogForCategory(12LL, v11);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Cannot be initialized: feature not enabled",  buf,  2u);
    }

    v23 = 0LL;
  }

  return v23;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Dealloc",  buf,  2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDRemoteControlGroupSessionCoordinator;
  -[MRDRemoteControlGroupSessionCoordinator dealloc](&v5, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator hostedSessionIdentifier](self, "hostedSessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator rotatingSessionIdentifier](self, "rotatingSessionIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDRemoteControlGroupSessionCoordinator isThrottled](self, "isThrottled")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: hostedSessionIdentifier=%@, rotatingSessionIdentifier=%@, throttled=%@>",  v4,  v5,  v6,  v8);

  return v9;
}

- (id)diagnosticDescription
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator description](self, "description"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator eligibilityStatus](self, "eligibilityStatus"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ state=%@>", v4, v5);

  return v6;
}

- (void)initializeObserversAndState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleDeviceInfoChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  [v4 registerObserver:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  -[MRDRemoteControlGroupSessionCoordinator setClusterStatus:]( self,  "setClusterStatus:",  [v5 clusterStatus]);
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v6 = MRGetDeviceInfoFromUserInfo(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100055E98;
  v10[3] = &unk_100398E60;
  id v11 = v7;
  v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)reevaluateSystemStateWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = _MRLogForCategory(12LL, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v51 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Re-evaluating because: %{public}@",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator rotatingSessionIdentifier](self, "rotatingSessionIdentifier"));
  if (!-[MRDRemoteControlGroupSessionCoordinator isStartingSession](self, "isStartingSession")
    && !-[MRDRemoteControlGroupSessionCoordinator isJoiningSession](self, "isJoiningSession")
    && !-[MRDRemoteControlGroupSessionCoordinator isThrottled](self, "isThrottled")
    && !v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator sessionManager](self, "sessionManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 session]);

    id v13 = [v12 isHosted];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator eligibilityStatus](self, "eligibilityStatus"));
    id v15 = [v14 idsAccountIsValid];
    id v16 = [v14 isManateeEnabled];
    id v18 = v16;
    if ((v15 & 1) != 0 || (v13 & 1) != 0)
    {
      if (((v16 | v13) & 1) != 0)
      {
        unsigned int v48 = [v14 routeType];
        unsigned int v27 = [v14 routeIsValidForHosting];
        if ((id)-[MRDRemoteControlGroupSessionCoordinator clusterStatus](self, "clusterStatus") == (id)2) {
          unsigned int v28 = 0;
        }
        else {
          unsigned int v28 = v27;
        }
        unsigned int v29 = v28 & v15 & v18;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"validRoute=%@,validIDS=%@,validManatee=%@",  v30,  v31,  v32));

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
        [v20 appendFormat:@",existingHostedSession=%@", v33];

        if (((v29 ^ 1 | v13) & 1) != 0
          || (id v35 = [v14 mediaAccountHostingState],
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v35 == (id)6)),
              [v20 appendFormat:@",mediaStateValid=%@", v36],
              v36,
              v35 != (id)6))
        {
          char v41 = v29 | v13 ^ 1;
          uint64_t v42 = _MRLogForCategory(12LL, v34);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
          if ((v41 & 1) != 0)
          {
            if (v44)
            {
              uint64_t v45 = MRGroupSessionRouteTypeDescription(v48);
              v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
              *(_DWORD *)buf = 138543874;
              *(void *)v51 = v46;
              *(_WORD *)&v51[8] = 1024;
              *(_DWORD *)v52 = 0;
              *(_WORD *)&v52[4] = 2114;
              v53 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] No action. Rationale: route=%{public}@, canStart=%{BOOL}u (reason=%{public}@)",  buf,  0x1Cu);
            }
          }

          else
          {
            if (v44)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Ending group session.",  buf,  2u);
            }

            -[MRDRemoteControlGroupSessionCoordinator clearHostedSessionState](self, "clearHostedSessionState");
            -[MRDRemoteControlGroupSessionCoordinator reevaluateAfterInterval:withReason:]( self,  "reevaluateAfterInterval:withReason:",  @"Ended group session",  5.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator sessionManager](self, "sessionManager"));
            [v47 finishRemoteControlGroupSession:v12];
          }
        }

        else
        {
          uint64_t v37 = _MRLogForCategory(12LL, v34);
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Starting group session.",  buf,  2u);
          }

          -[MRDRemoteControlGroupSessionCoordinator setStartingSession:](self, "setStartingSession:", 1LL);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator sessionManager](self, "sessionManager"));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_100056490;
          v49[3] = &unk_10039BB58;
          v49[4] = self;
          [v39 startRemoteControlGroupSessionWithRouteType:v48 completion:v49];
        }

        goto LABEL_32;
      }

      uint64_t v40 = _MRLogForCategory(12LL, v17);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "[MRDRemoteControlGroupSessionCoordinator] Returning. Rationale: validManatee=NO, existing=NO.";
        goto LABEL_24;
      }
    }

    else
    {
      uint64_t v19 = _MRLogForCategory(12LL, v17);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "[MRDRemoteControlGroupSessionCoordinator] Returning. Rationale: validIDSAccount=NO, existing=NO.";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      }
    }

- (void)reevaluateAfterInterval:(double)a3 withReason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (!-[MRDRemoteControlGroupSessionCoordinator isThrottled](self, "isThrottled"))
  {
    uint64_t v9 = _MRLogForCategory(12LL, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlGroupSessionCoordinator] Applying throttle: %.2f s.",  buf,  0xCu);
    }

    -[MRDRemoteControlGroupSessionCoordinator setThrottled:](self, "setThrottled:", 1LL);
    objc_initWeak((id *)buf, self);
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000568AC;
    v13[3] = &unk_10039B590;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v6;
    dispatch_after(v11, v12, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)clearHostedSessionState
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[MRDRemoteControlGroupSessionCoordinator setHostedSessionIdentifier:](self, "setHostedSessionIdentifier:", 0LL);
  -[MRDRemoteControlGroupSessionCoordinator setRotatingSessionIdentifier:](self, "setRotatingSessionIdentifier:", 0LL);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000569F8;
  block[3] = &unk_100398E60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100056ADC;
  block[3] = &unk_100399030;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sessionDidRemoveAllParticipants:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100056D28;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100056ED4;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)clusterController:(id)a3 clusterStatusDidChange:(unint64_t)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlGroupSessionCoordinator queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100056F7C;
  v7[3] = &unk_100399B70;
  v7[4] = self;
  void v7[5] = a4;
  dispatch_async(v6, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)clusterStatus
{
  return self->_clusterStatus;
}

- (void)setClusterStatus:(unint64_t)a3
{
  self->_clusterStatus = a3;
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void)setEligibilityStatus:(id)a3
{
}

- (BOOL)isThrottled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (BOOL)isStartingSession
{
  return self->_startingSession;
}

- (void)setStartingSession:(BOOL)a3
{
  self->_startingSession = a3;
}

- (BOOL)isJoiningSession
{
  return self->_joiningSession;
}

- (void)setJoiningSession:(BOOL)a3
{
  self->_joiningSession = a3;
}

- (NSString)hostedSessionIdentifier
{
  return self->_hostedSessionIdentifier;
}

- (void)setHostedSessionIdentifier:(id)a3
{
}

- (NSString)rotatingSessionIdentifier
{
  return self->_rotatingSessionIdentifier;
}

- (void)setRotatingSessionIdentifier:(id)a3
{
}

- (MRDGroupSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end