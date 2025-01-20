@interface NearbyDevicesRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (AXRNearbyDevicesViewController)rootViewController;
- (void)_menuPressed:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NearbyDevicesRemoteViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NearbyDevicesRemoteViewController;
  -[NearbyDevicesRemoteViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_100004178);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)_menuPressed:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  [v3 dismissWithResult:&__kCFBooleanTrue];
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ax_remote_general_log();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@ - viewServiceBeginPresentationWithOptions: %@",  (uint8_t *)&v13,  0x16u);
  }

  v10 = objc_opt_new(&OBJC_CLASS___AXRNearbyDevicesViewController);
  -[NearbyDevicesRemoteViewController setRootViewController:](self, "setRootViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController rootViewController](self, "rootViewController"));
  [v11 setModalPresentationStyle:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController rootViewController](self, "rootViewController"));
  -[NearbyDevicesRemoteViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
}

- (AXRNearbyDevicesViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end