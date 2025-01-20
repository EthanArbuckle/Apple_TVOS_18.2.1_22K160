@interface TVNPRoutingHostViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)presentationEnded;
- (OS_dispatch_group)initialFetchGroup;
- (TVNPGroupableRoutingController)routingController;
- (TVNPRoutingHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setInitialFetchGroup:(id)a3;
- (void)setPresentationEnded:(BOOL)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation TVNPRoutingHostViewController

- (TVNPRoutingHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  v4 = v29;
  v29 = 0LL;
  v26.receiver = v4;
  v26.super_class = (Class)&OBJC_CLASS___TVNPRoutingHostViewController;
  v15 = -[TVNPRoutingHostViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", location[0], v27);
  v29 = v15;
  objc_storeStrong((id *)&v29, v15);
  if (v15)
  {
    dispatch_group_t v5 = dispatch_group_create();
    initialFetchGroup = v29->_initialFetchGroup;
    v29->_initialFetchGroup = (OS_dispatch_group *)v5;

    id v25 = &_os_log_default;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v25;
      os_log_type_t type = v24;
      sub_100005DD0(v23);
      _os_log_impl((void *)&_mh_execute_header, log, type, "ROUTING: Fetching initial endpoints (begin)", v23, 2u);
    }

    objc_storeStrong(&v25, 0LL);
    objc_initWeak(&from, v29);
    dispatch_group_enter((dispatch_group_t)v29->_initialFetchGroup);
    v11 = objc_alloc(&OBJC_CLASS___TVNPGroupableRoutingController);
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_100005DEC;
    v20 = &unk_1000589C8;
    objc_copyWeak(&v21, &from);
    v10 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:]( v11,  "initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:",  0LL,  1LL,  &v16);
    routingController = v29->_routingController;
    v29->_routingController = v10;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
  }

  v9 = v29;
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  return v9;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = -[TVNPRoutingHostViewController view](v22, "view");
  id v7 = [v8 window];
  [v7 makeKeyWindow];

  id v9 = [location[0] objectForKeyedSubscript:PBSRoutingUIOptionInitiatedByPicker];
  unsigned __int8 v10 = [v9 BOOLValue];

  char v20 = v10 & 1;
  if ((v10 & 1) != 0)
  {
    id v5 = [location[0] objectForKeyedSubscript:PBSRoutingUIOptionSupportsSharedQueue];
    unsigned __int8 v6 = [v5 BOOLValue];

    char v19 = v6 & 1;
    -[TVNPGroupableRoutingController setAllowsRetargeting:](v22->_routingController, "setAllowsRetargeting:", v6 & 1);
  }

  v22->_presentationEnded = 0;
  objc_initWeak(&v18, v22);
  group = (dispatch_group_s *)v22->_initialFetchGroup;
  queue = &_dispatch_main_q;
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_10000611C;
  v15 = &unk_1000589F0;
  objc_copyWeak(&v17, &v18);
  id v16 = location[0];
  dispatch_group_notify(group, queue, &v11);

  objc_storeStrong(&v16, 0LL);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v18);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v15->_presentationEnded = 1;
  id v5 = v15;
  unsigned __int8 v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_1000063C8;
  unsigned __int8 v10 = &unk_100058A18;
  id v12 = v13;
  v11 = v15;
  -[TVNPRoutingHostViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v16[2] = a1;
  v16[1] = (id)a2;
  unsigned __int8 v10 = v16;
  v16[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  unsigned __int8 v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v15;
  v15 = v2;
  v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  id v13 = "viewServiceEndPresentationWithOptions:completion:";
  [v16[0] setClasses:v15 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v7 ofReply:v8 & 1];
  id v12 = v16[0];
  objc_storeStrong(location, v11);
  objc_storeStrong(v10, v11);
  return v12;
}

+ (id)_remoteViewControllerInterface
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  id v5 = -[TVNPRoutingHostViewController _remoteViewControllerProxy](v8, "_remoteViewControllerProxy");
  [v5 dismissWithResult:0];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (OS_dispatch_group)initialFetchGroup
{
  return self->_initialFetchGroup;
}

- (void)setInitialFetchGroup:(id)a3
{
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (BOOL)presentationEnded
{
  return self->_presentationEnded;
}

- (void)setPresentationEnded:(BOOL)a3
{
  self->_presentationEnded = a3;
}

- (void).cxx_destruct
{
}

@end