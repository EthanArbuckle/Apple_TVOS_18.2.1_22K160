@interface TVNPRoutingMainViewController
+ (id)_destinationLayout;
- (BOOL)editingVolume;
- (MPRouteLabel)titleView;
- (PBSAssertion)playPauseAssertion;
- (TVNPGroupableRoutingController)routingController;
- (TVNPRoutingDestinationsCollectionViewController)destinationsCollectionViewController;
- (TVNPRoutingMainViewController)initWithRoutingController:(id)a3 options:(id)a4;
- (TVNPRoutingMainViewControllerDelegate)delegate;
- (TVNPRoutingRoutesCollectionViewController)routesCollectionViewController;
- (UILabel)hintView;
- (id)_routesLayout;
- (id)preferredFocusEnvironments;
- (void)_updateHintText;
- (void)_updateTitleView;
- (void)dealloc;
- (void)didPressMenu:(id)a3;
- (void)didPressMute:(id)a3;
- (void)didPressPlayPause:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)routingViewController:(id)a3 shareAudioPresentationRequested:(id)a4;
- (void)routingViewControllerWillBeginEditingVolume:(id)a3;
- (void)routingViewControllerWillEndEditingVolume:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVNPRoutingMainViewController

- (TVNPRoutingMainViewController)initWithRoutingController:(id)a3 options:(id)a4
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v53 = 0LL;
  objc_storeStrong(&v53, a4);
  v4 = v55;
  v55 = 0LL;
  v52.receiver = v4;
  v52.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
  v27 = -[TVNPRoutingMainViewController init](&v52, "init");
  v55 = v27;
  objc_storeStrong((id *)&v55, v27);
  if (v27)
  {
    id v24 = objc_alloc(&OBJC_CLASS___PBSPlayPauseButtonEventAssertion);
    v5 = (objc_class *)objc_opt_class(v55);
    v25 = NSStringFromClass(v5);
    v6 = (PBSAssertion *)objc_msgSend(v24, "initWithIdentifier:");
    playPauseAssertion = v55->_playPauseAssertion;
    v55->_playPauseAssertion = v6;

    objc_storeStrong((id *)&v55->_routingController, location[0]);
    id v51 = &_os_log_default;
    os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v51;
      os_log_type_t type = v50;
      sub_E03C(v49);
      _os_log_impl(&dword_0, log, type, "ROUTING: Fetch Active Endpoint", v49, 2u);
    }

    objc_storeStrong(&v51, 0LL);
    v43[0] = 0LL;
    v43[1] = v43;
    int v44 = 838860800;
    int v45 = 48;
    v46 = sub_E058;
    v47 = sub_E0AC;
    id v48 = 0LL;
    id v42 = dispatch_semaphore_create(0LL);
    v21 = dispatch_get_global_queue(25LL, 0LL);
    v36 = _NSConcreteStackBlock;
    int v37 = -1073741824;
    int v38 = 0;
    v39 = sub_E0D8;
    v40 = &unk_50B00;
    v41[1] = v43;
    v41[0] = v42;
    MRAVEndpointResolveActiveSystemEndpointWithTimeout(v21, &v36, 3.0);

    id v35 = [(id)objc_opt_class(v55) _destinationLayout];
    v20 = objc_alloc(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewController);
    id v16 = v35;
    routingController = v55->_routingController;
    id v18 = v53;
    v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    v32 = sub_E1EC;
    v33 = &unk_50B28;
    v34[0] = v42;
    v34[1] = v43;
    v19 = -[TVNPRoutingDestinationsCollectionViewController initWithCollectionViewLayout:routingController:options:initialUIDProvider:]( v20,  "initWithCollectionViewLayout:routingController:options:initialUIDProvider:",  v16,  routingController,  v18,  &v29);
    destinationsCollectionViewController = v55->_destinationsCollectionViewController;
    v55->_destinationsCollectionViewController = v19;

    -[TVNPRoutingDestinationsCollectionViewController setViewControllerDelegate:]( v55->_destinationsCollectionViewController,  "setViewControllerDelegate:",  v55);
    id v28 = -[TVNPRoutingMainViewController _routesLayout](v55, "_routesLayout");
    v15 = objc_alloc(&OBJC_CLASS___TVNPRoutingRoutesCollectionViewController);
    v14 = -[TVNPRoutingRoutesCollectionViewController initWithCollectionViewLayout:routingController:]( v15,  "initWithCollectionViewLayout:routingController:",  v28,  v55->_routingController);
    routesCollectionViewController = v55->_routesCollectionViewController;
    v55->_routesCollectionViewController = v14;

    -[TVNPRoutingRoutesCollectionViewController setDelegate:](v55->_routesCollectionViewController, "setDelegate:", v55);
    -[TVNPRoutingMainViewController setModalPresentationStyle:](v55, "setModalPresentationStyle:", 8LL);
    -[TVNPGroupableRoutingController addObserver:forKeyPath:options:context:]( v55->_routingController,  "addObserver:forKeyPath:options:context:",  v55,  @"currentDestination.destinationName",  0LL,  off_5E7A8);
    -[TVNPRoutingRoutesCollectionViewController addObserver:forKeyPath:options:context:]( v55->_routesCollectionViewController,  "addObserver:forKeyPath:options:context:",  v55,  @"focusedRoute",  0LL,  off_5E7B0);
    v13 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v13,  "addObserver:selector:name:object:",  v55->_routesCollectionViewController,  "handleVolumeUp",  _UIApplicationVolumeUpButtonUpNotification,  0LL);

    v12 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v12,  "addObserver:selector:name:object:",  v55->_routesCollectionViewController,  "handleVolumeDown",  _UIApplicationVolumeDownButtonUpNotification,  0LL);

    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(v34, 0LL);
    objc_storeStrong(&v35, 0LL);
    objc_storeStrong(v41, 0LL);
    objc_storeStrong(&v42, 0LL);
    _Block_object_dispose(v43, 8);
    objc_storeStrong(&v48, 0LL);
  }

  v11 = v55;
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v55, 0LL);
  return v11;
}

- (void)dealloc
{
  v6 = self;
  SEL v5 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v6->_routesCollectionViewController,  _UIApplicationVolumeUpButtonUpNotification);

  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  v6->_routesCollectionViewController,  _UIApplicationVolumeDownButtonUpNotification,  0LL);

  -[PBSAssertion relinquish](v6->_playPauseAssertion, "relinquish");
  -[TVNPRoutingRoutesCollectionViewController removeObserver:forKeyPath:context:]( v6->_routesCollectionViewController,  "removeObserver:forKeyPath:context:",  v6,  @"focusedRoute",  off_5E7B0);
  -[TVNPGroupableRoutingController removeObserver:forKeyPath:context:]( v6->_routingController,  "removeObserver:forKeyPath:context:",  v6,  @"currentDestination.destinationName",  off_5E7A8);
  -[TVNPGroupableRoutingController setWantsVolumeUpdates:](v6->_routingController, "setWantsVolumeUpdates:", 0LL);
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
  -[TVNPRoutingMainViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v78 = self;
  SEL v77 = a2;
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
  -[TVNPRoutingMainViewController viewDidLoad](&v76, "viewDidLoad");
  id v75 = -[TVNPRoutingMainViewController view](v78, "view");
  v2 = objc_alloc_init(&OBJC_CLASS___MPRouteLabel);
  titleView = v78->_titleView;
  v78->_titleView = v2;

  id v13 = -[MPRouteLabel titleLabel](v78->_titleView, "titleLabel");
  v12 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2);
  objc_msgSend(v13, "setFont:");

  id v15 = -[MPRouteLabel titleLabel](v78->_titleView, "titleLabel");
  v14 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  objc_msgSend(v15, "setTextColor:");

  id v16 = -[MPRouteLabel titleLabel](v78->_titleView, "titleLabel");
  objc_msgSend(v16, "setTextAlignment:");

  -[MPRouteLabel setTranslatesAutoresizingMaskIntoConstraints:]( v78->_titleView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVNPRoutingMainViewController _updateTitleView](v78, "_updateTitleView");
  [v75 addSubview:v78->_titleView];
  objc_super v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  hintView = v78->_hintView;
  v78->_hintView = v4;

  v17 = v78->_hintView;
  id v18 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
  -[UILabel setFont:](v17, "setFont:");

  v19 = v78->_hintView;
  v20 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  -[UILabel setTextColor:](v19, "setTextColor:");

  -[UILabel setTextAlignment:](v78->_hintView, "setTextAlignment:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v78->_hintView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVNPRoutingMainViewController _updateHintText](v78, "_updateHintText");
  [v75 addSubview:v78->_hintView];
  -[TVNPRoutingMainViewController addChildViewController:]( v78,  "addChildViewController:",  v78->_routesCollectionViewController);
  id v74 = -[TVNPRoutingRoutesCollectionViewController view](v78->_routesCollectionViewController, "view");
  [v74 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v75 addSubview:v74];
  -[TVNPRoutingRoutesCollectionViewController didMoveToParentViewController:]( v78->_routesCollectionViewController,  "didMoveToParentViewController:",  v78);
  v73 = 0LL;
  -[TVNPRoutingMainViewController addChildViewController:]( v78,  "addChildViewController:",  v78->_destinationsCollectionViewController);
  id v72 = -[TVNPRoutingDestinationsCollectionViewController view](v78->_destinationsCollectionViewController, "view");
  [v72 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v75 addSubview:v72];
  -[TVNPRoutingDestinationsCollectionViewController didMoveToParentViewController:]( v78->_destinationsCollectionViewController,  "didMoveToParentViewController:",  v78);
  -[MPRouteLabel _baselineOffsetFromBottom](v78->_titleView, "_baselineOffsetFromBottom");
  double v71 = v6;
  id v64 = -[MPRouteLabel leadingAnchor](v78->_titleView, "leadingAnchor");
  id v63 = [v75 leadingAnchor];
  id v62 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", 90.0);
  v79[0] = v62;
  id v61 = -[MPRouteLabel trailingAnchor](v78->_titleView, "trailingAnchor");
  id v60 = [v75 trailingAnchor];
  id v59 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", -90.0);
  v79[1] = v59;
  id v58 = -[MPRouteLabel titleLabel](v78->_titleView, "titleLabel");
  id v57 = [v58 lastBaselineAnchor];
  id v56 = [v75 topAnchor];
  id v55 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v71 + 126.0);
  v79[2] = v55;
  id v54 = -[MPRouteLabel heightAnchor](v78->_titleView, "heightAnchor");
  id v53 = [v54 constraintEqualToConstant:100.0];
  v79[3] = v53;
  id v52 = [v72 leadingAnchor];
  id v51 = [v75 leadingAnchor];
  id v50 = objc_msgSend(v52, "constraintEqualToAnchor:");
  v79[4] = v50;
  id v49 = [v72 trailingAnchor];
  id v48 = [v75 trailingAnchor];
  id v47 = objc_msgSend(v49, "constraintEqualToAnchor:");
  v79[5] = v47;
  id v46 = [v72 topAnchor];
  id v45 = -[MPRouteLabel titleLabel](v78->_titleView, "titleLabel");
  id v44 = [v45 lastBaselineAnchor];
  id v43 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", 80.0 - v71);
  v79[6] = v43;
  id v42 = [v72 heightAnchor];
  id v41 = [v42 constraintEqualToConstant:200.0];
  v79[7] = v41;
  id v40 = [v74 leadingAnchor];
  id v39 = [v75 leadingAnchor];
  id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
  v79[8] = v38;
  id v37 = [v74 trailingAnchor];
  id v36 = [v75 trailingAnchor];
  id v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v79[9] = v35;
  id v34 = [v74 topAnchor];
  id v33 = [v72 bottomAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", 14.0);
  v79[10] = v32;
  id v31 = [v74 heightAnchor];
  id v30 = [v31 constraintEqualToConstant:564.0];
  v79[11] = v30;
  id v29 = -[UILabel leadingAnchor](v78->_hintView, "leadingAnchor");
  id v28 = [v75 leadingAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v79[12] = v27;
  id v26 = -[UILabel trailingAnchor](v78->_hintView, "trailingAnchor");
  id v25 = [v75 trailingAnchor];
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v79[13] = v24;
  id v23 = -[UILabel topAnchor](v78->_hintView, "topAnchor");
  id v22 = [v74 bottomAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 20.0);
  v79[14] = v21;
  v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 15LL);
  v8 = v73;
  v73 = v7;

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v73);
  v9 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v70 = -[UITapGestureRecognizer initWithTarget:action:](v9, "initWithTarget:action:", v78, "didPressMenu:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v70, "setAllowedPressTypes:", &off_52E78);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v70, "setNumberOfTapsRequired:", 1LL);
  id v65 = -[TVNPRoutingMainViewController view](v78, "view");
  [v65 addGestureRecognizer:v70];

  v10 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v69 = -[UITapGestureRecognizer initWithTarget:action:](v10, "initWithTarget:action:", v78, "didPressPlayPause:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v69, "setAllowedPressTypes:", &off_52E90);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v69, "setNumberOfTapsRequired:", 1LL);
  id v66 = -[TVNPRoutingMainViewController view](v78, "view");
  [v66 addGestureRecognizer:v69];

  v11 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v68 = -[UITapGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v78, "didPressMute:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v68, "setAllowedPressTypes:", &off_52EA8);
  id v67 = -[TVNPRoutingMainViewController view](v78, "view");
  [v67 addGestureRecognizer:v68];

  -[TVNPGroupableRoutingController setWantsVolumeUpdates:](v78->_routingController, "setWantsVolumeUpdates:", 1LL);
  objc_storeStrong((id *)&v68, 0LL);
  objc_storeStrong((id *)&v69, 0LL);
  objc_storeStrong((id *)&v70, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong((id *)&v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&v75, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  double v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
  -[TVNPRoutingMainViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  -[PBSAssertion acquire](v6->_playPauseAssertion, "acquire");
}

- (void)viewWillDisappear:(BOOL)a3
{
  double v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
  -[TVNPRoutingMainViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
  -[PBSAssertion relinquish](v6->_playPauseAssertion, "relinquish");
}

- (id)preferredFocusEnvironments
{
  destinationsCollectionViewController = self->_destinationsCollectionViewController;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &destinationsCollectionViewController,  1LL);
}

- (void)viewControllerDidRequestDismissal:(id)a3 cancelled:(BOOL)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v5 = -[TVNPRoutingMainViewController delegate](v7, "delegate");
  -[TVNPRoutingMainViewControllerDelegate viewControllerDidRequestDismissal:cancelled:]( v5,  "viewControllerDidRequestDismissal:cancelled:",  v7,  a4);

  objc_storeStrong(location, 0LL);
}

- (void)routingViewControllerWillBeginEditingVolume:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4->_editingVolume = 1;
  -[TVNPRoutingDestinationsCollectionViewController setVolumeEditingInProgress:]( v4->_destinationsCollectionViewController,  "setVolumeEditingInProgress:",  1LL);
  -[TVNPRoutingMainViewController _updateHintText](v4, "_updateHintText");
  objc_storeStrong(location, 0LL);
}

- (void)routingViewControllerWillEndEditingVolume:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4->_editingVolume = 0;
  -[TVNPRoutingDestinationsCollectionViewController setVolumeEditingInProgress:]( v4->_destinationsCollectionViewController,  "setVolumeEditingInProgress:",  0LL);
  -[TVNPRoutingMainViewController _updateHintText](v4, "_updateHintText");
  objc_storeStrong(location, 0LL);
}

- (void)routingViewController:(id)a3 shareAudioPresentationRequested:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVNPRoutingMainViewController presentViewController:animated:completion:]( v7,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didPressMenu:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 3)
  {
    objc_super v3 = -[TVNPRoutingMainViewController delegate](v5, "delegate");
    -[TVNPRoutingMainViewControllerDelegate viewControllerDidRequestDismissal:cancelled:]( v3,  "viewControllerDidRequestDismissal:cancelled:",  v5,  1LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)didPressPlayPause:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 3)
  {
    objc_super v3 = -[TVNPGroupableRoutingController currentDestination](v5->_routingController, "currentDestination");
    -[TVNPRoutingDestination togglePlayPause](v3, "togglePlayPause");
  }

  objc_storeStrong(location, 0LL);
}

- (void)didPressMute:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (char *)&dword_0 + 3)
  {
    id v17 =  -[TVNPRoutingRoutesCollectionViewController focusedRoute]( v19->_routesCollectionViewController,  "focusedRoute");
    id v16 = [v17 volumeLevel];
    double v6 = -[TVNPGroupableRoutingController currentDestination](v19->_routingController, "currentDestination");
    id v15 = -[TVNPRoutingDestination volumeLevel](v6, "volumeLevel");

    BOOL v14 = [v17 selectionState] == (char *)&dword_0 + 2;
    unsigned __int8 v13 = [v17 isMuted] & 1;
    v7 = -[TVNPGroupableRoutingController currentDestination](v19->_routingController, "currentDestination");
    unsigned __int8 v8 = -[TVNPRoutingDestination isMuted](v7, "isMuted");

    unsigned __int8 v12 = v8 & 1;
    if (v17 && (v16 || (v13 & 1) != 0) && v14)
    {
      [v17 setMuted:(v13 ^ 1) & 1];
    }

    else if (v15 || (v12 & 1) != 0)
    {
      id v5 = -[TVNPGroupableRoutingController currentDestination](v19->_routingController, "currentDestination");
      -[TVNPRoutingDestination setMuted:](v5, "setMuted:", (v12 ^ 1) & 1);
    }

    else
    {
      id v11 = &_os_log_default;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v11;
        os_log_type_t type = v10;
        sub_E03C(v9);
        _os_log_impl(&dword_0, log, type, "Mute not available", v9, 2u);
      }

      objc_storeStrong(&v11, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  os_log_type_t v10 = a6;
  if (a6 == off_5E7A8)
  {
    -[TVNPRoutingMainViewController _updateTitleView](v14, "_updateTitleView");
    -[TVNPRoutingMainViewController _updateHintText](v14, "_updateHintText");
  }

  else if (v10 == off_5E7B0)
  {
    -[TVNPRoutingMainViewController _updateHintText](v14, "_updateHintText");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewController;
    -[TVNPRoutingMainViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateTitleView
{
  BOOL v4 = self;
  v3[1] = (id)a2;
  if ((-[TVNPRoutingMainViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    v2 = -[TVNPGroupableRoutingController currentDestination](v4->_routingController, "currentDestination");
    v3[0] = -[TVNPRoutingDestination endpointRoute](v2, "endpointRoute");

    -[MPRouteLabel setRoute:](v4->_titleView, "setRoute:", v3[0]);
    objc_storeStrong(v3, 0LL);
  }

- (void)_updateHintText
{
  id v43 = self;
  SEL v42 = a2;
  id v16 = -[TVNPGroupableRoutingController currentDestination](self->_routingController, "currentDestination");
  v2 = -[TVNPRoutingDestination volumeLevel](v16, "volumeLevel");
  BOOL v17 = v2 != 0LL;

  BOOL v41 = v17;
  id v18 =  -[TVNPRoutingRoutesCollectionViewController focusedRoute]( v43->_routesCollectionViewController,  "focusedRoute");
  objc_super v3 = -[TVNPRoute volumeLevel](v18, "volumeLevel");
  BOOL v19 = v3 != 0LL;

  BOOL v40 = v19;
  v20 =  -[TVNPRoutingRoutesCollectionViewController focusedRoute]( v43->_routesCollectionViewController,  "focusedRoute");
  BOOL v21 = (char *)-[TVNPRoute selectionState](v20, "selectionState") == (char *)&dword_0 + 2;

  BOOL v39 = v21;
  BOOL editingVolume = v43->_editingVolume;
  char v37 = -[TVNPRoutingRoutesCollectionViewController isShareAudioFocused]( v43->_routesCollectionViewController,  "isShareAudioFocused");
  if ((v37 & 1) != 0)
  {
    hintView = v43->_hintView;
    id v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v43));
    BOOL v14 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"ShareAudioHintText",  &stru_51CA0,  0LL);
    -[UILabel setText:](hintView, "setText:");
  }

  else
  {
    char v35 = 0;
    BOOL v12 = 0;
    if (v41)
    {
      id v36 =  -[TVNPRoutingRoutesCollectionViewController focusedRoute]( v43->_routesCollectionViewController,  "focusedRoute");
      char v35 = 1;
      BOOL v12 = v36 == 0LL;
    }

    if ((v35 & 1) != 0) {

    }
    if (v12)
    {
      id v29 = _NSConcreteStackBlock;
      int v30 = -1073741824;
      int v31 = 0;
      id v32 = sub_10048;
      id v33 = &unk_50B50;
      id v34 = v43;
      id v47 = (dispatch_once_t *)&unk_5EDB0;
      id location = 0LL;
      objc_storeStrong(&location, &v29);
      if (*v47 != -1) {
        dispatch_once(v47, location);
      }
      objc_storeStrong(&location, 0LL);
      uint64_t v6 = qword_5EDA8;
      objc_super v9 = -[TVNPGroupableRoutingController currentDestination](v43->_routingController, "currentDestination");
      unsigned __int8 v8 = -[TVNPRoutingDestination routeNames](v9, "routeNames");
      v7 =  +[NSListFormatter localizedStringByJoiningStrings:]( &OBJC_CLASS___NSListFormatter,  "localizedStringByJoiningStrings:");
      id v28 =  +[NSAttributedString _localizedAttributedStringWithFormat:]( &OBJC_CLASS___NSAttributedString,  "_localizedAttributedStringWithFormat:",  v6,  v7);

      os_log_type_t v10 = v43->_hintView;
      id v11 = [v28 copy];
      -[UILabel setAttributedText:](v10, "setAttributedText:");

      objc_storeStrong(&v28, 0LL);
      objc_storeStrong((id *)&v34, 0LL);
    }

    else if (v40 && v39 && !editingVolume)
    {
      id v22 = _NSConcreteStackBlock;
      int v23 = -1073741824;
      int v24 = 0;
      id v25 = sub_10620;
      id v26 = &unk_50B50;
      id v27 = v43;
      id v45 = (dispatch_once_t *)&unk_5EDC0;
      id v44 = 0LL;
      objc_storeStrong(&v44, &v22);
      if (*v45 != -1) {
        dispatch_once(v45, v44);
      }
      objc_storeStrong(&v44, 0LL);
      BOOL v4 = v43->_hintView;
      id v5 = [(id)qword_5EDB8 copy];
      -[UILabel setAttributedText:](v4, "setAttributedText:");

      objc_storeStrong((id *)&v27, 0LL);
    }

    else
    {
      -[UILabel setText:](v43->_hintView, "setText:", 0LL);
    }
  }

+ (id)_destinationLayout
{
  v6[2] = a1;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(&OBJC_CLASS___UICollectionViewCompositionalLayoutConfiguration);
  objc_msgSend(v6[0], "setScrollDirection:");
  [v6[0] setContentInsetsReference:1];
  v2 = objc_alloc(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayout);
  id v5 = -[TVNPRoutingDestinationsCollectionViewLayout initWithSectionProvider:configuration:]( v2,  "initWithSectionProvider:configuration:",  &stru_50B90,  v6[0]);
  BOOL v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (id)_routesLayout
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  BOOL v4 = objc_alloc(&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayout);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  unsigned __int8 v8 = sub_1114C;
  objc_super v9 = &unk_50BB8;
  objc_copyWeak(v10, location);
  id v11 = -[TVNPRoutingRoutesCollectionViewLayout initWithSectionProvider:](v4, "initWithSectionProvider:", &v5);
  -[TVNPRoutingRoutesCollectionViewLayout setTopGradientHeight:](v11, "setTopGradientHeight:", 14.0);
  -[TVNPRoutingRoutesCollectionViewLayout setBottomGradientHeight:](v11, "setBottomGradientHeight:", 15.0);
  objc_super v3 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  return v3;
}

- (TVNPRoutingMainViewControllerDelegate)delegate
{
  return (TVNPRoutingMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)editingVolume
{
  return self->_editingVolume;
}

- (PBSAssertion)playPauseAssertion
{
  return self->_playPauseAssertion;
}

- (MPRouteLabel)titleView
{
  return self->_titleView;
}

- (UILabel)hintView
{
  return self->_hintView;
}

- (TVNPRoutingDestinationsCollectionViewController)destinationsCollectionViewController
{
  return self->_destinationsCollectionViewController;
}

- (TVNPRoutingRoutesCollectionViewController)routesCollectionViewController
{
  return self->_routesCollectionViewController;
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (void).cxx_destruct
{
}

@end