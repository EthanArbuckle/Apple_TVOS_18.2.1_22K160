@interface ASServiceDaemon
- (ASServiceDaemon)initWithLaunchContext:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_loadExecutionService;
- (void)_setUpEventHandlersForNotifyd;
- (void)dealloc;
- (void)resume;
@end

@implementation ASServiceDaemon

- (ASServiceDaemon)initWithLaunchContext:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ASServiceDaemon;
  v3 = -[ASServiceDaemon init](&v18, "init", a3);
  if (v3)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistant.service.listener", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 createXPCListenerWithMachServiceName:kAssistantServiceServiceName]);
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v11;

    -[NSXPCListener _setQueue:](v3->_listener, "_setQueue:", v3->_queue);
    -[NSXPCListener setDelegate:](v3->_listener, "setDelegate:", v3);
    v13 = objc_alloc_init(&OBJC_CLASS___ASServicesMonitor);
    servicesMonitor = v3->_servicesMonitor;
    v3->_servicesMonitor = v13;

    -[ASServiceDaemon _setUpEventHandlersForNotifyd](v3, "_setUpEventHandlersForNotifyd");
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASServiceDaemon _loadExecutionService](v3, "_loadExecutionService"));
    executionService = v3->_executionService;
    v3->_executionService = (SKRExecutionListenerManager *)v15;

    -[ASServiceDaemon _setupAccessibility](v3, "_setupAccessibility");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASServiceDaemon;
  -[ASServiceDaemon dealloc](&v3, "dealloc");
}

- (void)resume
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = kAssistantServiceEntitlement;
  char HasEntitlement = AFConnectionHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    uint64_t v8 = AFProviderServiceDelegateXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 setRemoteObjectInterface:v9];

    uint64_t v10 = AFProviderServiceXPCInterface();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v5 setExportedInterface:v11];

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);

    dispatch_queue_t v16 = dispatch_queue_create(0LL, v15);
    [v5 _setQueue:v16];

    v17 = -[ASServiceClient initWithConnection:servicesMonitor:]( objc_alloc(&OBJC_CLASS___ASServiceClient),  "initWithConnection:servicesMonitor:",  v5,  self->_servicesMonitor);
    [v5 setExportedObject:v17];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    v24 = sub_100006E1C;
    v25 = &unk_100014680;
    v26 = v17;
    v27 = self;
    objc_super v18 = v17;
    [v5 setInvalidationHandler:&v22];
    ++self->_connectionCount;
    objc_msgSend(v5, "resume", v22, v23, v24, v25);
  }

  else
  {
    v19 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      v21 = v19;
      *(_DWORD *)buf = 136315650;
      v29 = "-[ASServiceDaemon listener:shouldAcceptNewConnection:]";
      __int16 v30 = 2048;
      uint64_t v31 = (int)[v5 processIdentifier];
      __int16 v32 = 2112;
      uint64_t v33 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Rejecting connection from pid %ld because it does not have entitlement %@",  buf,  0x20u);
    }
  }

  return HasEntitlement;
}

- (void)_setUpEventHandlersForNotifyd
{
}

- (id)_loadExecutionService
{
  executionService = self->_executionService;
  if (!executionService)
  {
    dispatch_queue_attr_t v4 = objc_alloc_init(&OBJC_CLASS___SKRExecutionListenerManager);
    id v5 = self->_executionService;
    self->_executionService = v4;

    executionService = self->_executionService;
  }

  return executionService;
}

- (void).cxx_destruct
{
}

@end