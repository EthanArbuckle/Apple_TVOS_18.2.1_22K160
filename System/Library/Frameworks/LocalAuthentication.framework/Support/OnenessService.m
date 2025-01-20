@interface OnenessService
- (BOOL)canProcessRequest:(id)a3;
- (LACOnenessControlling)controller;
- (OnenessService)initWithUIController:(id)a3 sessionMonitor:(id)a4 workQueue:(id)a5;
- (void)cancelAllRequests;
- (void)cancelRequestsForContextID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)startServices;
@end

@implementation OnenessService

- (OnenessService)initWithUIController:(id)a3 sessionMonitor:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OnenessService;
  v11 = -[OnenessService init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a5);
    v13 = (LACClientInfoProviding *)objc_alloc_init(&OBJC_CLASS___LACClientInfoProvider);
    infoProvider = v12->_infoProvider;
    v12->_infoProvider = v13;

    v15 = (LACOnenessAuthenticating *)[[LACOnenessAuthenticator alloc] initWithClientInfoProvider:v12->_infoProvider replyQueue:v12->_workQueue];
    authenticator = v12->_authenticator;
    v12->_authenticator = v15;

    objc_storeStrong((id *)&v12->_sessionMonitor, a4);
    id v17 = [[LACUserInterfacePresenter alloc] initWithReplyQueue:v12->_workQueue uiController:v8];
    v18 = (LACOnenessControlling *)[[LACOnenessController alloc] initWithSessionMonitor:v9 authenticator:v12->_authenticator uiPresenter:v17 replyQueue:v12->_workQueue];
    controller = v12->_controller;
    v12->_controller = v18;
  }

  return v12;
}

- (void)startServices
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000B418;
  v4[3] = &unk_100030A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelAllRequests
{
}

- (void)cancelRequestsForContextID:(id)a3
{
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
}

- (BOOL)canProcessRequest:(id)a3
{
  return -[LACOnenessControlling canProcessRequest:](self->_controller, "canProcessRequest:", a3);
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
}

- (LACOnenessControlling)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
}

@end