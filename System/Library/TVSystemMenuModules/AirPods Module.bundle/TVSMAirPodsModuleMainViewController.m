@interface TVSMAirPodsModuleMainViewController
- (BOOL)editingVolume;
- (BOOL)headsetsCollectionViewFocused;
- (NSLayoutConstraint)headsetsCollectionViewHeightConstraint;
- (NSString)foregroundAppBundleID;
- (TVNPGroupableRoutingController)routeController;
- (TVSMAirPodsModuleHeadsetSettingsCollectionViewController)headsetSettingsCollectionViewController;
- (TVSMAirPodsModuleHeadsetsCollectionViewController)headsetsCollectionViewController;
- (TVSMAirPodsModuleMainViewController)initWithRouteController:(id)a3;
- (TVSMAirPodsModuleMainViewControllerDelegate)delegate;
- (UILabel)hintView;
- (id)_headsetsLayout;
- (id)_hintTextForSetting:(int64_t)a3;
- (id)_selectedAppleHeadsets;
- (id)_selectedHeadsetTypes;
- (id)preferredFocusEnvironments;
- (void)_updateCollectionAndHintViewsWithRoute:(id)a3;
- (void)_updateHintTextForSpatialAudio;
- (void)_updateHintTextWithHeadsetName:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)headsetsViewController:(id)a3 didSetRouteForVolume:(id)a4;
- (void)headsetsViewControllerWillBeginEditingVolume:(id)a3;
- (void)headsetsViewControllerWillEndEditingVolume:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setEditingVolume:(BOOL)a3;
- (void)setForegroundAppBundleID:(id)a3;
- (void)setHeadsetSettingsCollectionViewController:(id)a3;
- (void)setHeadsetsCollectionViewController:(id)a3;
- (void)setHeadsetsCollectionViewFocused:(BOOL)a3;
- (void)setHeadsetsCollectionViewHeightConstraint:(id)a3;
- (void)setHintView:(id)a3;
- (void)setRouteController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSMAirPodsModuleMainViewController

- (TVSMAirPodsModuleMainViewController)initWithRouteController:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v18;
  v18 = 0LL;
  v16.receiver = v3;
  v16.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleMainViewController;
  v18 = -[TVSMAirPodsModuleMainViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v18->_routeController, location[0]);
    v10 = objc_alloc(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController);
    v11 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    v4 = -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController initWithCollectionViewLayout:]( v10,  "initWithCollectionViewLayout:");
    headsetSettingsCollectionViewController = v18->_headsetSettingsCollectionViewController;
    v18->_headsetSettingsCollectionViewController = v4;

    -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController addObserver:forKeyPath:options:context:]( v18->_headsetSettingsCollectionViewController,  "addObserver:forKeyPath:options:context:",  v18,  @"focusedSetting");
    v12 = objc_alloc(&OBJC_CLASS___TVSMAirPodsModuleHeadsetsCollectionViewController);
    id v13 = -[TVSMAirPodsModuleMainViewController _headsetsLayout](v18, "_headsetsLayout");
    v6 = -[TVSMAirPodsModuleHeadsetsCollectionViewController initWithCollectionViewLayout:routeController:]( v12,  "initWithCollectionViewLayout:routeController:");
    headsetsCollectionViewController = v18->_headsetsCollectionViewController;
    v18->_headsetsCollectionViewController = v6;

    -[TVSMAirPodsModuleHeadsetsCollectionViewController setDelegate:]( v18->_headsetsCollectionViewController,  "setDelegate:",  v18);
    -[TVSMAirPodsModuleHeadsetsCollectionViewController addObserver:forKeyPath:options:context:]( v18->_headsetsCollectionViewController,  "addObserver:forKeyPath:options:context:",  v18,  @"focusedRoute",  0LL,  off_5F388);
    -[TVNPGroupableRoutingController addObserver:forKeyPath:options:context:]( v18->_routeController,  "addObserver:forKeyPath:options:context:",  v18,  @"appleHeadsets",  0LL,  off_5F390);
    v14 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v14,  "addObserver:selector:name:object:",  v18->_headsetsCollectionViewController,  "handleVolumeUp",  _UIApplicationVolumeUpButtonUpNotification);

    v15 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v15,  "addObserver:selector:name:object:",  v18->_headsetsCollectionViewController,  "handleVolumeDown",  _UIApplicationVolumeDownButtonUpNotification,  0LL);
  }

  v9 = v18;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v9;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController removeObserver:forKeyPath:context:]( self->_headsetSettingsCollectionViewController,  "removeObserver:forKeyPath:context:",  self,  @"focusedSetting",  off_5F380);
  -[TVSMAirPodsModuleHeadsetsCollectionViewController removeObserver:forKeyPath:context:]( v5->_headsetsCollectionViewController,  "removeObserver:forKeyPath:context:",  v5,  @"focusedRoute",  off_5F388);
  -[TVNPGroupableRoutingController removeObserver:forKeyPath:context:]( v5->_routeController,  "removeObserver:forKeyPath:context:",  v5,  @"appleHeadsets",  off_5F390);
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleMainViewController;
  -[TVSMAirPodsModuleMainViewController dealloc](&v3, "dealloc");
}

- (void)setForegroundAppBundleID:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setForegroundAppBundleID:]( v4->_headsetSettingsCollectionViewController,  "setForegroundAppBundleID:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)viewDidLoad
{
  v52 = self;
  SEL v51 = a2;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleMainViewController;
  -[TVSMAirPodsModuleMainViewController viewDidLoad](&v50, "viewDidLoad");
  id v49 = -[TVSMAirPodsModuleMainViewController view](v52, "view");
  -[TVSMAirPodsModuleMainViewController addChildViewController:]( v52,  "addChildViewController:",  v52->_headsetsCollectionViewController);
  id v48 = -[TVSMAirPodsModuleHeadsetsCollectionViewController view](v52->_headsetsCollectionViewController, "view");
  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v49 addSubview:v48];
  -[TVSMAirPodsModuleHeadsetsCollectionViewController didMoveToParentViewController:]( v52->_headsetsCollectionViewController,  "didMoveToParentViewController:",  v52);
  -[TVSMAirPodsModuleMainViewController addChildViewController:]( v52,  "addChildViewController:",  v52->_headsetSettingsCollectionViewController);
  id v47 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController view]( v52->_headsetSettingsCollectionViewController,  "view");
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v49 addSubview:v47];
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController didMoveToParentViewController:]( v52->_headsetSettingsCollectionViewController,  "didMoveToParentViewController:",  v52);
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  hintView = v52->_hintView;
  v52->_hintView = v2;

  v6 = v52->_hintView;
  v7 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
  -[UILabel setFont:](v6, "setFont:");

  v8 = v52->_hintView;
  v9 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  -[UILabel setTextColor:](v8, "setTextColor:");

  -[UILabel setTextAlignment:](v52->_hintView, "setTextAlignment:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v52->_hintView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v49 addSubview:v52->_hintView];
  id v11 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView]( v52->_headsetsCollectionViewController,  "collectionView");
  id v10 = [v11 heightAnchor];
  SEL v4 = (NSLayoutConstraint *)[v10 constraintGreaterThanOrEqualToConstant:103.0];
  headsetsCollectionViewHeightConstraint = v52->_headsetsCollectionViewHeightConstraint;
  v52->_headsetsCollectionViewHeightConstraint = v4;

  v53[0] = v52->_headsetsCollectionViewHeightConstraint;
  id v40 = [v48 leadingAnchor];
  id v39 = [v49 leadingAnchor];
  id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
  v53[1] = v38;
  id v37 = [v48 trailingAnchor];
  id v36 = [v49 trailingAnchor];
  id v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v53[2] = v35;
  id v34 = [v48 topAnchor];
  id v33 = [v49 topAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", 176.0);
  v53[3] = v32;
  id v31 = [v47 leadingAnchor];
  id v30 = [v49 leadingAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v53[4] = v29;
  id v28 = [v47 trailingAnchor];
  id v27 = [v49 trailingAnchor];
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v53[5] = v26;
  id v25 = [v47 topAnchor];
  id v24 = [v48 bottomAnchor];
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v53[6] = v23;
  id v22 = [v47 heightAnchor];
  id v21 = [v22 constraintEqualToConstant:564.0];
  v53[7] = v21;
  id v20 = -[UILabel leadingAnchor](v52->_hintView, "leadingAnchor");
  id v19 = [v49 leadingAnchor];
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v53[8] = v18;
  id v17 = -[UILabel trailingAnchor](v52->_hintView, "trailingAnchor");
  id v16 = [v49 trailingAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v53[9] = v15;
  id v14 = -[UILabel bottomAnchor](v52->_hintView, "bottomAnchor");
  id v13 = [v49 bottomAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", -50.0);
  v53[10] = v12;
  v46 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 11LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v46);
  id v45 = -[TVSMAirPodsModuleMainViewController _selectedAppleHeadsets](v52, "_selectedAppleHeadsets");
  -[TVSMAirPodsModuleHeadsetsCollectionViewController setRoutes:]( v52->_headsetsCollectionViewController,  "setRoutes:",  v45);
  v41 = v52;
  id v42 = [v45 firstObject];
  -[TVSMAirPodsModuleMainViewController _updateCollectionAndHintViewsWithRoute:]( v41,  "_updateCollectionAndHintViewsWithRoute:");

  id v43 = (id)TVSMAnalyticsEventWithName(@"headset_module.opened");
  v44 = v52;
  AnalyticsSendEventLazy(v43);

  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
}

- (id)preferredFocusEnvironments
{
  v3[0] = self->_headsetsCollectionViewController;
  v3[1] = self->_headsetSettingsCollectionViewController;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 2LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleMainViewController;
  -[TVSMAirPodsModuleMainViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v9);
  id v7 = [location[0] nextFocusedView];
  id v6 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController collectionView]( v11->_headsetsCollectionViewController,  "collectionView");
  unsigned __int8 v4 = objc_msgSend(v7, "isDescendantOfView:");
  v11->_headsetsCollectionViewFocused = v4 & 1;

  -[TVSMAirPodsModuleMainViewController _updateHintTextForSpatialAudio](v11, "_updateHintTextForSpatialAudio");
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_headsetsLayout
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(&OBJC_CLASS___UICollectionViewCompositionalLayoutConfiguration);
  objc_msgSend(v6[0], "setScrollDirection:");
  [v6[0] setContentInsetsReference:1];
  v2 = objc_alloc(&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayout);
  v5 = -[TVNPRoutingRoutesCollectionViewLayout initWithSectionProvider:configuration:]( v2,  "initWithSectionProvider:configuration:",  &stru_50900,  v6[0]);
  unsigned __int8 v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v33 = 0LL;
  objc_storeStrong(&v33, a4);
  id v32 = 0LL;
  objc_storeStrong(&v32, a5);
  id v31 = a6;
  if (a6 == off_5F388)
  {
    id v30 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController focusedRoute]( v35->_headsetsCollectionViewController,  "focusedRoute");
    id v17 = [v30 routeUID];
    id v16 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController currentRoute]( v35->_headsetSettingsCollectionViewController,  "currentRoute");
    id v15 = -[TVNPRoute routeUID](v16, "routeUID");
    unsigned __int8 v18 = objc_msgSend(v17, "isEqualToString:");

    if ((v18 & 1) == 0) {
      -[TVSMAirPodsModuleMainViewController _updateCollectionAndHintViewsWithRoute:]( v35,  "_updateCollectionAndHintViewsWithRoute:",  v30);
    }
    objc_storeStrong(&v30, 0LL);
  }

  else if (v31 == off_5F390)
  {
    id v29 = -[TVSMAirPodsModuleMainViewController _selectedAppleHeadsets](v35, "_selectedAppleHeadsets");
    char v27 = 0;
    BOOL v14 = 0;
    if (![v29 count])
    {
      id v28 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController routes]( v35->_headsetsCollectionViewController,  "routes");
      char v27 = 1;
      BOOL v14 = -[NSArray count](v28, "count") != 0;
    }

    if ((v27 & 1) != 0) {

    }
    if (v14)
    {
      id v13 = -[TVSMAirPodsModuleMainViewController delegate](v35, "delegate");
      -[TVSMAirPodsModuleMainViewControllerDelegate viewControllerDidRequestDismissal:cancelled:]( v13,  "viewControllerDidRequestDismissal:cancelled:",  v35,  1LL);
    }

    id v26 = [v29 firstObject];
    id v25 = 0LL;
    if ((unint64_t)[v29 count] > 1)
    {
      id v12 = [v29 objectAtIndex:1];
      id v6 = [v12 routeUID];
      id v7 = v25;
      id v25 = v6;
    }

    objc_super v8 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController currentRoute]( v35->_headsetSettingsCollectionViewController,  "currentRoute");
    id v24 = -[TVNPRoute routeUID](v8, "routeUID");

    id v9 =  -[TVSMAirPodsModuleHeadsetsCollectionViewController focusedRoute]( v35->_headsetsCollectionViewController,  "focusedRoute");
    id v23 = -[TVNPRoute routeUID](v9, "routeUID");

    id v10 = [v26 routeUID];
    LOBYTE(v11) = 0;

    if ((v11 & 1) != 0)
    {
      -[TVSMAirPodsModuleHeadsetsCollectionViewController setRoutes:]( v35->_headsetsCollectionViewController,  "setRoutes:",  v29);
      -[TVSMAirPodsModuleMainViewController _updateCollectionAndHintViewsWithRoute:]( v35,  "_updateCollectionAndHintViewsWithRoute:",  v26);
    }

    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  else if (v31 == off_5F380)
  {
    -[TVSMAirPodsModuleMainViewController _updateHintTextForSpatialAudio](v35, "_updateHintTextForSpatialAudio");
  }

  else
  {
    v22.receiver = v35;
    v22.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModuleMainViewController;
    -[TVSMAirPodsModuleMainViewController observeValueForKeyPath:ofObject:change:context:]( &v22,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v33,  v32,  v31);
  }

  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateCollectionAndHintViewsWithRoute:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  headsetSettingsCollectionViewController = v10->_headsetSettingsCollectionViewController;
  id v4 = -[TVSMAirPodsModuleMainViewController _selectedAppleHeadsets](v10, "_selectedAppleHeadsets");
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setHeadsetRoutes:]( headsetSettingsCollectionViewController,  "setHeadsetRoutes:");

  v5 = v10->_headsetSettingsCollectionViewController;
  id v6 = -[TVNPGroupableRoutingController currentRoutes](v10->_routeController, "currentRoutes");
  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setIsSharingAudio:]( v5,  "setIsSharingAudio:",  -[NSArray count](v6, "count") > 1);

  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController setCurrentRoute:]( v10->_headsetSettingsCollectionViewController,  "setCurrentRoute:",  location[0]);
  id v7 = v10;
  id v8 = [location[0] title];
  -[TVSMAirPodsModuleMainViewController _updateHintTextWithHeadsetName:](v7, "_updateHintTextWithHeadsetName:");

  objc_storeStrong(location, 0LL);
}

- (void)_updateHintTextForSpatialAudio
{
  if (self->_headsetsCollectionViewFocused)
  {
    v5 =  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController currentRoute]( self->_headsetSettingsCollectionViewController,  "currentRoute");
    id v4 = -[TVNPRoute title](v5, "title");
    -[TVSMAirPodsModuleMainViewController _updateHintTextWithHeadsetName:](self, "_updateHintTextWithHeadsetName:");
  }

  else
  {
    hintView = self->_hintView;
    id v3 =  -[TVSMAirPodsModuleMainViewController _hintTextForSetting:]( self,  "_hintTextForSetting:",  -[TVSMAirPodsModuleHeadsetSettingsCollectionViewController focusedSetting]( self->_headsetSettingsCollectionViewController,  "focusedSetting"));
    -[UILabel setText:](hintView, "setText:");
  }

- (void)_updateHintTextWithHeadsetName:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v13->_editingVolume)
  {
    -[UILabel setText:](v13->_hintView, "setText:", 0LL);
  }

  else
  {
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_CFC0;
    id v10 = &unk_50698;
    unsigned int v11 = v13;
    id v15 = (dispatch_once_t *)&unk_5F8B8;
    id v14 = 0LL;
    objc_storeStrong(&v14, &v6);
    if (*v15 != -1) {
      dispatch_once(v15, v14);
    }
    objc_storeStrong(&v14, 0LL);
    id v5 =  +[NSAttributedString _localizedAttributedStringWithFormat:]( &OBJC_CLASS___NSAttributedString,  "_localizedAttributedStringWithFormat:",  qword_5F8B0,  location[0]);
    hintView = v13->_hintView;
    id v4 = [v5 copy];
    -[UILabel setAttributedText:](hintView, "setAttributedText:");

    objc_storeStrong(&v5, 0LL);
    objc_storeStrong((id *)&v11, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (id)_hintTextForSetting:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3) {
    __asm { BR              X8 }
  }

  return 0LL;
}

- (void)headsetsViewControllerWillBeginEditingVolume:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4->_editingVolume = 1;
  -[TVSMAirPodsModuleMainViewController _updateHintTextWithHeadsetName:](v4, "_updateHintTextWithHeadsetName:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)headsetsViewControllerWillEndEditingVolume:(id)a3
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7->_editingVolume = 0;
  id v3 = v7;
  id v5 = [location[0] focusedRoute];
  id v4 = [v5 title];
  -[TVSMAirPodsModuleMainViewController _updateHintTextWithHeadsetName:](v3, "_updateHintTextWithHeadsetName:");

  objc_storeStrong(location, 0LL);
}

- (void)headsetsViewController:(id)a3 didSetRouteForVolume:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  if (v14->_editingVolume) {
    double v4 = 200.0;
  }
  else {
    double v4 = 103.0;
  }
  v11[1] = *(id *)&v4;
  -[NSLayoutConstraint setConstant:](v14->_headsetsCollectionViewHeightConstraint, "setConstant:", v4);
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_DBB0;
  id v10 = &unk_50698;
  v11[0] = v14;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:]( &OBJC_CLASS___UIView,  "_animateUsingDefaultTimingWithOptions:animations:completion:",  0LL,  &v6);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_selectedAppleHeadsets
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  obj = -[TVNPGroupableRoutingController appleHeadsets](v13->_routeController, "appleHeadsets");
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v12[0];
  objc_storeStrong(v12, 0LL);
  return v3;
}

- (id)_selectedHeadsetTypes
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  id obj = -[TVSMAirPodsModuleMainViewController _selectedAppleHeadsets](v15, "_selectedAppleHeadsets");
  id v11 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v4 = v14[0];
      id v5 = [v13 deviceTypeDescription];
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0LL);
  return v3;
}

- (TVSMAirPodsModuleMainViewControllerDelegate)delegate
{
  return (TVSMAirPodsModuleMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)foregroundAppBundleID
{
  return self->_foregroundAppBundleID;
}

- (TVSMAirPodsModuleHeadsetSettingsCollectionViewController)headsetSettingsCollectionViewController
{
  return self->_headsetSettingsCollectionViewController;
}

- (void)setHeadsetSettingsCollectionViewController:(id)a3
{
}

- (TVSMAirPodsModuleHeadsetsCollectionViewController)headsetsCollectionViewController
{
  return self->_headsetsCollectionViewController;
}

- (void)setHeadsetsCollectionViewController:(id)a3
{
}

- (TVNPGroupableRoutingController)routeController
{
  return self->_routeController;
}

- (void)setRouteController:(id)a3
{
}

- (UILabel)hintView
{
  return self->_hintView;
}

- (void)setHintView:(id)a3
{
}

- (BOOL)editingVolume
{
  return self->_editingVolume;
}

- (void)setEditingVolume:(BOOL)a3
{
  self->_editingVolume = a3;
}

- (NSLayoutConstraint)headsetsCollectionViewHeightConstraint
{
  return self->_headsetsCollectionViewHeightConstraint;
}

- (void)setHeadsetsCollectionViewHeightConstraint:(id)a3
{
}

- (BOOL)headsetsCollectionViewFocused
{
  return self->_headsetsCollectionViewFocused;
}

- (void)setHeadsetsCollectionViewFocused:(BOOL)a3
{
  self->_headsetsCollectionViewFocused = a3;
}

- (void).cxx_destruct
{
}

@end