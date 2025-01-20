@interface DMDServer
+ (DMDServer)sharedServer;
- (CATTaskServer)taskServer;
- (DMDEmergencyModeListenerDelegate)emergencyModeListenerDelegate;
- (DMDEventStreamDispatcher)eventStreamDispatcher;
- (DMDPolicyServerListenerDelegate)policyServerListenerDelegate;
- (DMDServer)init;
- (DMDTaskServerDelegate)taskServerDelegate;
- (DMDTaskServerListenerDelegate)taskServerListenerDelegate;
- (NSXPCListener)emergencyModeListener;
- (NSXPCListener)policyServerListener;
- (NSXPCListener)taskOperationServiceListener;
- (void)invalidate;
- (void)run;
@end

@implementation DMDServer

- (DMDServer)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___DMDServer;
  v2 = -[DMDServer init](&v31, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___DMDActivationPredicateObserverManager);
    v4 = objc_opt_new(&OBJC_CLASS___DMDPolicyPersistence);
    v5 = (DMDTaskServerDelegate *)[objc_alloc((Class)objc_opt_class(DMDiPhoneOSTaskServerDelegate)) initWithPolicyPersistence:v4 activationManager:v3];
    taskServerDelegate = v2->_taskServerDelegate;
    v2->_taskServerDelegate = v5;

    v7 = objc_opt_new(&OBJC_CLASS___CATTaskServer);
    -[CATTaskServer setDelegate:](v7, "setDelegate:", v2->_taskServerDelegate);
    v8 = -[DMDTaskServerListenerDelegate initWithTaskServer:]( objc_alloc(&OBJC_CLASS___DMDTaskServerListenerDelegate),  "initWithTaskServer:",  v7);
    taskServerListenerDelegate = v2->_taskServerListenerDelegate;
    v2->_taskServerListenerDelegate = v8;

    v10 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v11 = -[NSXPCListener initWithMachServiceName:](v10, "initWithMachServiceName:", DMFMachServiceName);
    taskOperationServiceListener = v2->_taskOperationServiceListener;
    v2->_taskOperationServiceListener = v11;

    v13 = v2->_taskOperationServiceListener;
    uint64_t v14 = CATGetCatalystQueue();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NSXPCListener _setQueue:](v13, "_setQueue:", v15);

    -[NSXPCListener setDelegate:](v2->_taskOperationServiceListener, "setDelegate:", v2->_taskServerListenerDelegate);
    v16 = -[DMDPolicyServerListenerDelegate initWithPolicyPersistence:]( objc_alloc(&OBJC_CLASS___DMDPolicyServerListenerDelegate),  "initWithPolicyPersistence:",  v4);
    policyServerListenerDelegate = v2->_policyServerListenerDelegate;
    v2->_policyServerListenerDelegate = v16;

    v18 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v19 = -[NSXPCListener initWithMachServiceName:](v18, "initWithMachServiceName:", DMFPolicyMachServiceName);
    policyServerListener = v2->_policyServerListener;
    v2->_policyServerListener = v19;

    -[NSXPCListener setDelegate:](v2->_policyServerListener, "setDelegate:", v2->_policyServerListenerDelegate);
    v21 = -[DMDEmergencyModeListenerDelegate initWithPolicyPersistence:]( objc_alloc(&OBJC_CLASS___DMDEmergencyModeListenerDelegate),  "initWithPolicyPersistence:",  v4);
    emergencyModeListenerDelegate = v2->_emergencyModeListenerDelegate;
    v2->_emergencyModeListenerDelegate = v21;

    v23 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v24 = -[NSXPCListener initWithMachServiceName:](v23, "initWithMachServiceName:", DMFEmergencyModeMachServiceName);
    emergencyModeListener = v2->_emergencyModeListener;
    v2->_emergencyModeListener = v24;

    -[NSXPCListener setDelegate:](v2->_emergencyModeListener, "setDelegate:", v2->_emergencyModeListenerDelegate);
    v26 = objc_alloc(&OBJC_CLASS___DMDEventStreamDispatcher);
    v32[0] = v3;
    v32[1] = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
    v28 = -[DMDEventStreamDispatcher initWithListeners:](v26, "initWithListeners:", v27);
    eventStreamDispatcher = v2->_eventStreamDispatcher;
    v2->_eventStreamDispatcher = v28;
  }

  return v2;
}

+ (DMDServer)sharedServer
{
  if (qword_1000CCE48 != -1) {
    dispatch_once(&qword_1000CCE48, &stru_10009F2E0);
  }
  return (DMDServer *)(id)qword_1000CCE40;
}

- (void)run
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running Server", v7, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskServerDelegate](self, "taskServerDelegate"));
  [v3 run];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskOperationServiceListener](self, "taskOperationServiceListener"));
  [v4 resume];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer policyServerListener](self, "policyServerListener"));
  [v5 resume];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer emergencyModeListener](self, "emergencyModeListener"));
  [v6 resume];
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskServer](self, "taskServer"));
  [v3 invalidate];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer taskOperationServiceListener](self, "taskOperationServiceListener"));
  [v4 invalidate];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDServer policyServerListener](self, "policyServerListener"));
  [v5 invalidate];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DMDServer emergencyModeListener](self, "emergencyModeListener"));
  [v6 invalidate];
}

- (DMDTaskServerDelegate)taskServerDelegate
{
  return self->_taskServerDelegate;
}

- (NSXPCListener)taskOperationServiceListener
{
  return self->_taskOperationServiceListener;
}

- (DMDTaskServerListenerDelegate)taskServerListenerDelegate
{
  return self->_taskServerListenerDelegate;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (DMDPolicyServerListenerDelegate)policyServerListenerDelegate
{
  return self->_policyServerListenerDelegate;
}

- (NSXPCListener)policyServerListener
{
  return self->_policyServerListener;
}

- (DMDEmergencyModeListenerDelegate)emergencyModeListenerDelegate
{
  return self->_emergencyModeListenerDelegate;
}

- (NSXPCListener)emergencyModeListener
{
  return self->_emergencyModeListener;
}

- (DMDEventStreamDispatcher)eventStreamDispatcher
{
  return self->_eventStreamDispatcher;
}

- (void).cxx_destruct
{
}

@end