@interface TVProfileMappingRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (UINavigationController)navigationController;
- (void)profileMappingViewController:(id)a3 didFinishWithMap:(id)a4;
- (void)setNavigationController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVProfileMappingRemoteViewController

- (void)profileMappingViewController:(id)a3 didFinishWithMap:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = -[TVProfileMappingRemoteViewController _remoteViewControllerProxy](v8, "_remoteViewControllerProxy");
  [v5 dismissWithResult:v6];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVProfileMappingRemoteViewController view](v15, "view");
  id v4 = [v5 window];
  [v4 makeKeyWindow];

  id v13 = [location[0] objectForKeyedSubscript:@"AppName"];
  id v12 = [location[0] objectForKeyedSubscript:@"AllProfiles"];
  id v11 = [location[0] objectForKeyedSubscript:@"Map"];
  id v10 = [location[0] objectForKeyedSubscript:@"UserNames"];
  if ([v12 count])
  {
    v7 = -[TVProfileMappingViewController initWithMap:allProfiles:allUsers:appName:]( objc_alloc(&OBJC_CLASS___TVProfileMappingViewController),  "initWithMap:allProfiles:allUsers:appName:",  v11,  v12,  v10,  v13);
    -[TVProfileMappingViewController setDelegate:](v7, "setDelegate:", v15);
    v3 = objc_alloc(&OBJC_CLASS___UINavigationController);
    id v6 = -[UINavigationController initWithRootViewController:](v3, "initWithRootViewController:", v7);
    -[UINavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 8LL);
    -[UINavigationController setNavigationBarHidden:](v6, "setNavigationBarHidden:", 1LL);
    -[TVProfileMappingRemoteViewController presentViewController:animated:completion:]( v15,  "presentViewController:animated:completion:",  v6,  1LL);
    objc_storeStrong((id *)&v6, 0LL);
    objc_storeStrong((id *)&v7, 0LL);
    int v8 = 0;
  }

  else
  {
    id v9 = -[TVProfileMappingRemoteViewController _remoteViewControllerProxy](v15, "_remoteViewControllerProxy");
    [v9 dismissWithResult:v11];
    int v8 = 1;
    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVProfileMappingRemoteViewController dismissViewControllerAnimated:completion:]( v7,  "dismissViewControllerAnimated:completion:",  1LL,  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v18[2] = a1;
  v18[1] = (id)a2;
  id v12 = v18;
  v18[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v8 = &OBJC_CLASS___NSSet;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v13 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v4,  v5,  v6,  objc_opt_class(&OBJC_CLASS___TVAppProfileDescriptor),  0LL);
  id v11 = (id *)&v17;
  v17 = v2;
  v16 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v9 = 0LL;
  int v10 = 0;
  objc_msgSend(v18[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  v15 = "viewServiceEndPresentationWithOptions:completion:";
  [v18[0] setClasses:v17 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v9 ofReply:v10 & 1];
  id v14 = v18[0];
  objc_storeStrong(v11, v13);
  objc_storeStrong(v12, v13);
  return v14;
}

+ (id)_remoteViewControllerInterface
{
  v10[2] = a1;
  v10[1] = (id)a2;
  uint64_t v6 = v10;
  v10[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___NSDictionary),  0LL);
  location = (id *)&v9;
  uint64_t v9 = v2;
  [v10[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v10[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end