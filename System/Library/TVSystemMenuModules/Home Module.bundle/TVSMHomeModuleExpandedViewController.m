@interface TVSMHomeModuleExpandedViewController
- (TVSMHomeModuleExpandedViewController)init;
- (TVSMHomeModuleFavoritesViewController)favoritesViewController;
- (TVSMModuleExpandedContentViewControllerDelegate)delegate;
- (TVSMPlatterView)effectView;
- (id)preferredFocusEnvironments;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setFavoritesViewController:(id)a3;
- (void)viewDidLoad;
- (void)willEnterPictureInPicture:(id)a3;
@end

@implementation TVSMHomeModuleExpandedViewController

- (TVSMHomeModuleExpandedViewController)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleExpandedViewController;
  v8 = -[TVSMHomeModuleExpandedViewController init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSMHomeModuleFavoritesViewController);
    favoritesViewController = v8->_favoritesViewController;
    v8->_favoritesViewController = v2;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)viewDidLoad
{
  v29 = self;
  SEL v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleExpandedViewController;
  -[TVSMHomeModuleExpandedViewController viewDidLoad](&v27, "viewDidLoad");
  id v26 = -[TVSMHomeModuleExpandedViewController view](v29, "view");
  v2 = objc_alloc_init(&OBJC_CLASS___TVSMPlatterView);
  effectView = v29->_effectView;
  v29->_effectView = v2;

  -[TVSMPlatterView setTranslatesAutoresizingMaskIntoConstraints:]( v29->_effectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSMPlatterView _setContinuousCornerRadius:](v29->_effectView, "_setContinuousCornerRadius:", 60.0);
  [v26 addSubview:v29->_effectView];
  v25 = 0LL;
  id v21 = -[TVSMPlatterView leadingAnchor](v29->_effectView, "leadingAnchor");
  id v20 = [v26 leadingAnchor];
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v30[0] = v19;
  id v18 = -[TVSMPlatterView trailingAnchor](v29->_effectView, "trailingAnchor");
  id v17 = [v26 trailingAnchor];
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v30[1] = v16;
  id v15 = -[TVSMPlatterView topAnchor](v29->_effectView, "topAnchor");
  id v14 = [v26 topAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v30[2] = v13;
  id v12 = -[TVSMPlatterView bottomAnchor](v29->_effectView, "bottomAnchor");
  id v11 = [v26 bottomAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v30[3] = v10;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL);
  v5 = v25;
  v25 = v4;

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v25);
  -[TVSMHomeModuleExpandedViewController addChildViewController:]( v29,  "addChildViewController:",  v29->_favoritesViewController);
  id v24 = -[TVSMHomeModuleFavoritesViewController view](v29->_favoritesViewController, "view");
  id v22 = v24;
  [v26 bounds];
  objc_msgSend(v22, "setFrame:", v6, v7, v8, v9);
  [v26 addSubview:v24];
  -[TVSMHomeModuleFavoritesViewController didMoveToParentViewController:]( v29->_favoritesViewController,  "didMoveToParentViewController:",  v29);
  v23 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v23,  "addObserver:selector:name:object:",  v29,  "willEnterPictureInPicture:",  TVHMWillEnterPictureInPictureNotification,  0LL);

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMHomeModuleExpandedViewController;
  -[TVSMHomeModuleExpandedViewController dealloc](&v3, "dealloc");
}

- (id)preferredFocusEnvironments
{
  favoritesViewController = self->_favoritesViewController;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &favoritesViewController,  1LL);
}

- (void)willEnterPictureInPicture:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  id v7 = [location[0] object];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0)
  {
    id v4 = [[PBSSystemMenuServiceStartCameraPiPResult alloc] initWithCameraIdentifier:v7];
    id v5 = v8;
    id v8 = v4;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  [WeakRetained contentModuleViewControllerDidRequestSystemDismissal:v10 animated:1 result:v8];

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleExpandedContentViewControllerDelegate)delegate
{
  return (TVSMModuleExpandedContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSMHomeModuleFavoritesViewController)favoritesViewController
{
  return self->_favoritesViewController;
}

- (void)setFavoritesViewController:(id)a3
{
}

- (TVSMPlatterView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
}

@end