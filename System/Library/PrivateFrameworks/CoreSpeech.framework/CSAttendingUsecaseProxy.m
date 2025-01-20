@interface CSAttendingUsecaseProxy
- (CSAttendingAnnounceHandler)announceHandler;
- (CSAttendingService)usecaseController;
- (CSAttendingServiceDelegate)delegate;
- (CSAttendingServiceDelegate)listenerDelegate;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingUsecaseManager)usecaseManager;
- (CSAttendingUsecaseProxy)initWithConnection:(id)a3 usecaseManager:(id)a4 attendingStatesProvidingProxy:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)errorHandler;
- (void)_invokeHandler;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)setAnnounceHandler:(id)a3;
- (void)setAttendingStatesProvidingProxy:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setListenerDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUsecaseController:(id)a3;
- (void)setUsecaseManager:(id)a3;
- (void)setupConnectionErrorHandler:(id)a3;
- (void)setupListenerDelegate:(id)a3;
- (void)speechStartDetectedWithEventInfo:(id)a3;
- (void)startAttendingWithOptions:(id)a3 completion:(id)a4;
- (void)stopAttendingWithReason:(int64_t)a3;
@end

@implementation CSAttendingUsecaseProxy

- (CSAttendingUsecaseProxy)initWithConnection:(id)a3 usecaseManager:(id)a4 attendingStatesProvidingProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CSAttendingUsecaseProxy;
  v12 = -[CSAttendingUsecaseProxy init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_usecaseManager, v10);
    v14 = objc_alloc_init(&OBJC_CLASS___CSAttendingAnnounceHandler);
    announceHandler = v13->_announceHandler;
    v13->_announceHandler = v14;

    objc_storeStrong((id *)&v13->_attendingStatesProvidingProxy, a5);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingUsecaseProxy Queue",  33LL));
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSAttendingUsecaseProxy initWithConnection:usecaseManager:attendingStatesProvidingProxy:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v13;
}

- (void)setupListenerDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007374;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setupConnectionErrorHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006FEC;
  block[3] = &unk_10022EB58;
  block[4] = self;
  id v6 = v4;
  id v18 = v6;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_connection);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000701C;
  v12[3] = &unk_10022DF50;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  -[NSXPCConnection setInterruptionHandler:](connection, "setInterruptionHandler:", v12);
  id v8 = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000071A0;
  v9[3] = &unk_10022DF50;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_invokeHandler
{
  errorHandler = (void (**)(id, SEL))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, a2);
    id v4 = self->_errorHandler;
    self->_errorHandler = 0LL;
  }

- (void)dealloc
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSAttendingUsecaseProxy dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc: %@", buf, 0x16u);
  }

  usecaseController = self->_usecaseController;
  self->_usecaseController = 0LL;

  -[CSAttendingAnnounceHandler setDelegate:](self->_announceHandler, "setDelegate:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAttendingUsecaseProxy;
  -[CSAttendingUsecaseProxy dealloc](&v5, "dealloc");
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006D98;
  block[3] = &unk_10022E7D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)stopAttendingWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006CE4;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006CB4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006B90;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006A8C;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttendingServiceDelegate)delegate
{
  return (CSAttendingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (CSAttendingUsecaseManager)usecaseManager
{
  return (CSAttendingUsecaseManager *)objc_loadWeakRetained((id *)&self->_usecaseManager);
}

- (void)setUsecaseManager:(id)a3
{
}

- (CSAttendingService)usecaseController
{
  return self->_usecaseController;
}

- (void)setUsecaseController:(id)a3
{
}

- (CSAttendingServiceDelegate)listenerDelegate
{
  return self->_listenerDelegate;
}

- (void)setListenerDelegate:(id)a3
{
}

- (CSAttendingAnnounceHandler)announceHandler
{
  return self->_announceHandler;
}

- (void)setAnnounceHandler:(id)a3
{
}

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  return self->_attendingStatesProvidingProxy;
}

- (void)setAttendingStatesProvidingProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end