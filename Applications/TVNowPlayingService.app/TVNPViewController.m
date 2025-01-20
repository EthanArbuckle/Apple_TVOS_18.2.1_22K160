@interface TVNPViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVNPMediaRemoteObserver)mediaRemoteObserver;
- (TVNPViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPMusicNowPlayingViewController)musicViewController;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)nowPlayingWallPaper;
- (void)_menuPressed:(id)a3;
- (void)setMediaRemoteObserver:(id)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setMusicViewController:(id)a3;
- (void)setNowPlayingWallPaper:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVNPViewController

- (TVNPViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = objc_alloc_init(&OBJC_CLASS___TVNPMediaRemoteObserver);
  v4 = v12;
  v12 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS___TVNPViewController;
  v12 = -[TVNPViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", location[0], v10);
  objc_storeStrong((id *)&v12, v12);
  if (v12) {
    objc_storeStrong((id *)&v12->_mediaRemoteObserver, v9);
  }
  v6 = v12;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v6;
}

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPViewController;
  -[TVNPViewController viewDidLoad](&v5, "viewDidLoad");
  v2 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v4 = -[UITapGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v7, "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_10005B5D0);
  id v3 = -[TVNPViewController view](v7, "view");
  [v3 addGestureRecognizer:v4];

  objc_storeStrong((id *)&v4, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = -[TVNPViewController view](v26, "view");
  id v9 = [v10 window];
  [v9 makeKeyWindow];

  objc_initWeak(&v24, v26);
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_100035C48;
  v21 = &unk_1000596B8;
  objc_copyWeak(&v22, &v24);
  id v23 = objc_retainBlock(&v17);
  id v7 = [location[0] objectForKeyedSubscript:PBSNowPlayingUIOptionShowActiveEndpoint];
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    dispatch_time_t when = dispatch_time(0LL, 1000000000LL);
    queue = &_dispatch_main_q;
    v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_1000360C8;
    v15 = &unk_100058B80;
    id v16 = v23;
    dispatch_after(when, queue, &v11);

    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    v4 = (void (**)(void))v23;
    id v3 =  +[MPAVRoutingController systemRouteWithContextUID:]( &OBJC_CLASS___MPAVRoutingController,  "systemRouteWithContextUID:",  0LL);
    v4[2]();
  }

  objc_storeStrong(&v23, 0LL);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  -[TVPMusicNowPlayingViewController willMoveToParentViewController:]( v23->_musicViewController,  "willMoveToParentViewController:",  0LL);
  id v20 = -[TVPMusicNowPlayingViewController view](v23->_musicViewController, "view");
  int v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_1000363FC;
  v17 = &unk_100058D38;
  id v18 = v20;
  int v19 = v23;
  objc_super v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  unsigned __int8 v8 = sub_100036458;
  id v9 = &unk_100059708;
  id v10 = v23;
  id v11 = v20;
  id v12 = v21;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  &v13,  0.3,  0.0);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v10 = v16;
  v16[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v15;
  int v15 = v2;
  int v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  int v13 = "viewServiceEndPresentationWithOptions:completion:";
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

- (void)_menuPressed:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVNPViewController _remoteViewControllerProxy](v5, "_remoteViewControllerProxy");
  [v3 dismissWithResult:0];
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVPMusicNowPlayingViewController)musicViewController
{
  return self->_musicViewController;
}

- (void)setMusicViewController:(id)a3
{
}

- (TVNPMediaRemoteObserver)mediaRemoteObserver
{
  return self->_mediaRemoteObserver;
}

- (void)setMediaRemoteObserver:(id)a3
{
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (UIView)nowPlayingWallPaper
{
  return self->_nowPlayingWallPaper;
}

- (void)setNowPlayingWallPaper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end