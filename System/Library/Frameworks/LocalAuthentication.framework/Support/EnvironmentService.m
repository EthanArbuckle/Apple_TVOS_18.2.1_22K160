@interface EnvironmentService
- (EnvironmentService)initWithDependencies:(id)a3 workQueue:(id)a4;
- (LACEnvironmentServiceXPC)xpcController;
- (void)_postNotification;
- (void)_startBiometryMonitoring;
- (void)_startMonitors;
- (void)_startUserPasswordMonitoring;
- (void)biometryAccessoriesDidChangeForHelper:(id)a3;
- (void)biometryEnrolledStateDidChangeForHelper:(id)a3;
- (void)biometryLockoutStateDidChangeForHelper:(id)a3;
- (void)onenessSessionMonitorDidUpdate:(id)a3;
- (void)passcodeSetDidChangeForHelper:(id)a3;
- (void)startServices;
@end

@implementation EnvironmentService

- (EnvironmentService)initWithDependencies:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___EnvironmentService;
  v8 = -[EnvironmentService init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dependencies, v6);
    v10 = (LACEnvironmentServiceXPC *)[[LACEnvironmentServiceXPCHost alloc] initWithDependencies:v6 workQueue:v7];
    xpcController = v9->_xpcController;
    v9->_xpcController = v10;

    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (void)startServices
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000057A4;
  v4[3] = &unk_100030A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_startMonitors
{
}

- (void)_startBiometryMonitoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependencies);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained biometryHelper]);
  [v3 addObserver:self];
}

- (void)_startUserPasswordMonitoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependencies);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained passcodeHelper]);
  [v3 addObserver:self];
}

- (void)passcodeSetDidChangeForHelper:(id)a3
{
  uint64_t v4 = LACLogEnvironment(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Environment has changed (user password)",  v6,  2u);
  }

  -[EnvironmentService _postNotification](self, "_postNotification");
}

- (void)biometryEnrolledStateDidChangeForHelper:(id)a3
{
  uint64_t v4 = LACLogEnvironment(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Environment has changed (biometric enrollment)",  v6,  2u);
  }

  -[EnvironmentService _postNotification](self, "_postNotification");
}

- (void)biometryLockoutStateDidChangeForHelper:(id)a3
{
  uint64_t v4 = LACLogEnvironment(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Environment has changed (biometric lockout state)",  v6,  2u);
  }

  -[EnvironmentService _postNotification](self, "_postNotification");
}

- (void)biometryAccessoriesDidChangeForHelper:(id)a3
{
  uint64_t v4 = LACLogEnvironment(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Environment has changed (biometric accessories)",  v6,  2u);
  }

  -[EnvironmentService _postNotification](self, "_postNotification");
}

- (void)onenessSessionMonitorDidUpdate:(id)a3
{
  uint64_t v4 = LACLogEnvironment(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Environment has changed (companion session state)",  v6,  2u);
  }

  -[EnvironmentService _postNotification](self, "_postNotification");
}

- (void)_postNotification
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[LACDarwinNotificationCenter sharedInstance](&OBJC_CLASS___LACDarwinNotificationCenter, "sharedInstance"));
  [v2 postNotification:LACDarwinNotificationEnvironmentStateDidChange];
}

- (LACEnvironmentServiceXPC)xpcController
{
  return self->_xpcController;
}

- (void).cxx_destruct
{
}

@end