@interface TVNPShareAudioHostViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVNPShareAudioMainViewController)shareAudioViewController;
- (void)setShareAudioViewController:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation TVNPShareAudioHostViewController

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPShareAudioHostViewController;
  -[TVNPShareAudioHostViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVNPShareAudioHostViewController view](v7, "view");
  id v3 = [v4 window];
  [v3 makeKeyWindow];

  v5 = objc_alloc_init(&OBJC_CLASS___TVNPShareAudioMainViewController);
  -[TVNPShareAudioMainViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
  -[TVNPShareAudioMainViewController setDelegate:](v5, "setDelegate:", v7);
  objc_storeStrong((id *)&v7->_shareAudioViewController, v5);
  -[TVNPShareAudioHostViewController presentViewController:animated:completion:]( v7,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
  objc_storeStrong((id *)&v5, 0LL);
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
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v5 = v14;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100006A7C;
  v10 = &unk_100058B80;
  id v11 = v12;
  -[TVNPShareAudioHostViewController dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v10 = v16;
  v16[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  objc_super v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v15;
  v15 = v2;
  v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  v13 = "viewServiceEndPresentationWithOptions:completion:";
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
  id v5 = -[TVNPShareAudioHostViewController _remoteViewControllerProxy](v8, "_remoteViewControllerProxy");
  [v5 dismissWithResult:0];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVNPShareAudioMainViewController)shareAudioViewController
{
  return self->_shareAudioViewController;
}

- (void)setShareAudioViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end