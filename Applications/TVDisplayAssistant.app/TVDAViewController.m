@interface TVDAViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)initialize;
- (PBSDisplayAssistantPresentationRequest)presentationRequest;
- (void)navigationControllerDidComplete:(id)a3;
- (void)setPresentationRequest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVDAViewController

+ (void)initialize
{
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___TVDAViewController))
  {
    +[TVSWiFiInterface enableNetworkManagement](&OBJC_CLASS___TVSWiFiInterface, "enableNetworkManagement");
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  }

- (void)viewDidAppear:(BOOL)a3
{
  v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVDAViewController;
  -[TVDAViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v3 = objc_alloc(&OBJC_CLASS___TVDANavigationController);
  v4 = -[TVDAViewController presentationRequest](v10, "presentationRequest");
  v6 = -[TVDANavigationController initWithPresentationRequest:](v3, "initWithPresentationRequest:");

  -[TVDANavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 8LL);
  -[TVDANavigationController setDelegate:](v6, "setDelegate:", v10);
  -[TVDAViewController presentViewController:animated:completion:]( v10,  "presentViewController:animated:completion:",  v6,  1LL);
  v5 = -[TVDAViewController presentationRequest](v10, "presentationRequest");
  +[TVDADisplayUpdater notifyDisplayAssistantStartForKind:]( &OBJC_CLASS___TVDADisplayUpdater,  "notifyDisplayAssistantStartForKind:",  -[PBSDisplayAssistantPresentationRequest kind](v5, "kind"));

  objc_storeStrong((id *)&v6, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = sub_10001A69C();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v14;
    os_log_type_t v11 = v13;
    sub_100002910(v12);
    _os_log_impl((void *)&_mh_execute_header, log, v11, "Presenting Display Assistant VC", v12, 2u);
  }

  objc_storeStrong(&v14, 0LL);
  id v4 = -[TVDAViewController view](v16, "view");
  id v3 = [v4 window];
  [v3 makeKeyWindow];

  v6 = v16;
  id v5 = location[0];
  SEL v9 = (objc_class *)(id)objc_opt_self(&OBJC_CLASS___PBSDisplayAssistantPresentationRequest);
  BOOL v8 = NSStringFromClass(v9);
  id v7 = objc_msgSend(v5, "objectForKeyedSubscript:");
  -[TVDAViewController setPresentationRequest:](v6, "setPresentationRequest:");

  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = sub_10001A69C();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v9;
    os_log_type_t type = v8;
    sub_100002910(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Ending Display Assistant VC", v7, 2u);
  }

  objc_storeStrong(&v9, 0LL);
  if (v10) {
    (*((void (**)(void))v10 + 2))();
  }
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v17[2] = a1;
  v17[1] = (id)a2;
  os_log_type_t v11 = v17;
  v17[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  id v7 = &OBJC_CLASS___NSSet;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBSDisplayAssistantPresentationRequest);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v12 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v10 = (id *)&v16;
  v16 = v2;
  v15 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v8 = 0LL;
  int v9 = 0;
  objc_msgSend(v17[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  id v14 = "viewServiceEndPresentationWithOptions:completion:";
  [v17[0] setClasses:v16 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v8 ofReply:v9 & 1];
  id v13 = v17[0];
  objc_storeStrong(v10, v12);
  objc_storeStrong(v11, v12);
  return v13;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface,  a2,  a1);
}

- (void)navigationControllerDidComplete:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVDAViewController presentationRequest](v12, "presentationRequest");
  +[TVDADisplayUpdater notifyDisplayAssistantCompletionForKind:]( &OBJC_CLASS___TVDADisplayUpdater,  "notifyDisplayAssistantCompletionForKind:",  -[PBSDisplayAssistantPresentationRequest kind](v3, "kind"));

  uint64_t v4 = v12;
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = sub_10001B5D8;
  int v9 = &unk_1000297C8;
  id v10 = v12;
  -[TVDAViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (PBSDisplayAssistantPresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (void)setPresentationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end