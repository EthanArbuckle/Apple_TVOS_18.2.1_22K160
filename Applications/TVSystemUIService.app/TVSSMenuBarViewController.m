@interface TVSSMenuBarViewController
- (BOOL)_shouldForceFocusToPanelDuringAnimationWithContext:(id)a3;
- (BOOL)environmentAllowsFocus;
- (BSInvalidatable)cameraPixelShifterActiveAssertion;
- (BSInvalidatable)microphonePixelShifterActiveAssertion;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSLayoutConstraint)barTopToCenterYConstraint;
- (NSLayoutConstraint)pillViewTrailingConstraint;
- (NSLayoutConstraint)privacyCenterXConstraint;
- (NSLayoutConstraint)privacyCenterYConstraint;
- (NSTimer)focusActivationTimer;
- (TVSPPillView)pillView;
- (TVSSMenuBarAnimationContext)currentRunningAnimationContext;
- (TVSSMenuBarViewController)initWithDataSourceControllerOverlord:(id)a3;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (TVSSMenuItem)activeMenuItem;
- (TVSSMenuItemPanelHostingViewController)panelHostingViewController;
- (TVSSMenuModeController)menuModeController;
- (TVSSPillContentViewProvider)contentViewProvider;
- (TVSSPrivacyController)privacyController;
- (TVSSPrivacyStateAdapterView)privacyStateAdapterView;
- (TVSSPrivacyViewPixelShifter)cameraIndicatorPixelShifter;
- (TVSSPrivacyViewPixelShifter)microphoneIndicatorPixelShifter;
- (TVSSerialTransactionManager)transactionManager;
- (UIFocusGuide)panelExitGuide;
- (UIView)dimmingOverlayView;
- (_TVSSMenuBarPendingPresentableRequest)pendingBannerPresentable;
- (id)_initialMenuItemForTransitionContext:(id)a3 focusInPanel:(BOOL *)a4;
- (id)pillContentViewWantsUpdateContext;
- (id)preferredFocusEnvironments;
- (id)scaledUINotificationToken;
- (void)_cleanUpDismissedBannerViewController:(id)a3;
- (void)_moveFocusToPanel;
- (void)_updateActiveItemTraits;
- (void)_updateBarYOffset;
- (void)_updatePrivacyStateAdapterView;
- (void)_updateWithMenuMode:(unint64_t)a3 previousMode:(unint64_t)a4 previousBannerContext:(id)a5 activeMenuItem:(id)a6 presentationReason:(unint64_t)a7 animated:(BOOL)a8;
- (void)actuallySetActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6;
- (void)dealloc;
- (void)didPerformPrimaryActionWithHostView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)pillContentViewConfigurationWillChange:(id)a3;
- (void)pillContentViewProviderWillUpdateCurrentContentView:(id)a3;
- (void)pixelShifter:(id)a3 didUpdateOffset:(CGPoint)a4;
- (void)privacyControllerStateDidChange:(id)a3;
- (void)setActiveMenuItem:(id)a3;
- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4;
- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5;
- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6;
- (void)setBarTopToCenterYConstraint:(id)a3;
- (void)setCameraIndicatorPixelShifter:(id)a3;
- (void)setCameraPixelShifterActiveAssertion:(id)a3;
- (void)setContentViewProvider:(id)a3;
- (void)setCurrentRunningAnimationContext:(id)a3;
- (void)setFocusActivationTimer:(id)a3;
- (void)setMicrophoneIndicatorPixelShifter:(id)a3;
- (void)setMicrophonePixelShifterActiveAssertion:(id)a3;
- (void)setPanelExitGuide:(id)a3;
- (void)setPanelHostingViewController:(id)a3;
- (void)setPendingBannerPresentable:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPillViewTrailingConstraint:(id)a3;
- (void)setPrivacyCenterXConstraint:(id)a3;
- (void)setPrivacyCenterYConstraint:(id)a3;
- (void)setScaledUINotificationToken:(id)a3;
- (void)setTransactionManager:(id)a3;
- (void)transactionManager:(id)a3 didCompleteTransaction:(id)a4;
- (void)updateOrthogonalDelegateOfActiveMenuItem:(id)a3;
- (void)viewDidLoad;
- (void)wantsOrthogonalMoveWithFocusHeading:(unint64_t)a3;
@end

@implementation TVSSMenuBarViewController

- (TVSSMenuBarViewController)initWithDataSourceControllerOverlord:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v38;
  v38 = 0LL;
  v36.receiver = v3;
  v36.super_class = (Class)&OBJC_CLASS___TVSSMenuBarViewController;
  v38 = -[TVSSMenuBarViewController initWithNibName:bundle:](&v36, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v38, v38);
  if (v38)
  {
    id v20 = objc_alloc(&OBJC_CLASS___TVSPSerialTransactionManager);
    v21 = objc_alloc_init(&OBJC_CLASS___TVSSSerialTransactionManagerPolicyMenuModeTransition);
    v4 = (TVSSerialTransactionManager *)objc_msgSend(v20, "initWithPolicy:");
    transactionManager = v38->_transactionManager;
    v38->_transactionManager = v4;

    -[TVSSerialTransactionManager addObserver:](v38->_transactionManager, "addObserver:", v38);
    objc_storeStrong((id *)&v38->_dataSourceControllerOverlord, location[0]);
    v6 = objc_alloc(&OBJC_CLASS___TVSSPillContentViewProvider);
    v7 = -[TVSSPillContentViewProvider initWithDataSourceControllerOverlord:]( v6,  "initWithDataSourceControllerOverlord:",  location[0]);
    contentViewProvider = v38->_contentViewProvider;
    v38->_contentViewProvider = v7;

    -[TVSSPillContentViewProvider setDelegate:](v38->_contentViewProvider, "setDelegate:", v38);
    v9 =  -[TVSSMenuDataSourceControllerOverlord menuModeController]( v38->_dataSourceControllerOverlord,  "menuModeController");
    menuModeController = v38->_menuModeController;
    v38->_menuModeController = v9;

    -[TVSSMenuModeController addControllerObserver:](v38->_menuModeController, "addControllerObserver:", v38);
    v11 =  -[TVSSMenuDataSourceControllerOverlord privacyController]( v38->_dataSourceControllerOverlord,  "privacyController");
    privacyController = v38->_privacyController;
    v38->_privacyController = v11;

    -[TVSSPrivacyController addControllerObserver:](v38->_privacyController, "addControllerObserver:", v38);
    objc_initWeak(&v35, v38);
    queue = dispatch_get_global_queue(0LL, 0LL);
    v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    v32 = sub_1000C98C0;
    v33 = &unk_1001B75D0;
    objc_copyWeak(&v34, &v35);
    dispatch_async(queue, &v29);

    v18 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v19 = kAXSAppleTVScaledUIEnabledNotification;
    v17 = +[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue");
    v23 = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    v26 = sub_1000C99DC;
    v27 = &unk_1001BA0C8;
    objc_copyWeak(&v28, &v35);
    id v13 =  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v18,  "addObserverForName:object:queue:usingBlock:",  v19,  0LL,  v17,  &v23);
    id scaledUINotificationToken = v38->_scaledUINotificationToken;
    v38->_id scaledUINotificationToken = v13;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v35);
  }

  v16 = v38;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v38, 0LL);
  return v16;
}

- (void)dealloc
{
  v9 = self;
  SEL v8 = a2;
  -[TVSSMenuModeController removeControllerObserver:](self->_menuModeController, "removeControllerObserver:", self);
  -[TVSSPrivacyController removeControllerObserver:](v9->_privacyController, "removeControllerObserver:", v9);
  -[TVSSPrivacyViewPixelShifter removeObserver:](v9->_microphoneIndicatorPixelShifter, "removeObserver:", v9);
  -[TVSSPrivacyViewPixelShifter removeObserver:](v9->_cameraIndicatorPixelShifter, "removeObserver:", v9);
  id v6 = -[TVSSMenuBarViewController scaledUINotificationToken](v9, "scaledUINotificationToken");

  if (v6)
  {
    v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    id v4 = -[TVSSMenuBarViewController scaledUINotificationToken](v9, "scaledUINotificationToken");
    -[NSNotificationCenter removeObserver:](v5, "removeObserver:");
  }

  -[BSInvalidatable invalidate]( v9->_cameraPixelShifterActiveAssertion,  "invalidate",  &OBJC_IVAR___TVSSNetworkController__configurationManager);
  -[BSInvalidatable invalidate](v9->_microphonePixelShifterActiveAssertion, "invalidate");
  objc_storeStrong((id *)((char *)&v9->super.super.super.isa + *(int *)(v2 + 1936)), 0LL);
  objc_storeStrong((id *)&v9->_microphonePixelShifterActiveAssertion, 0LL);
  v3 = -[TVSSMenuBarViewController focusActivationTimer](v9, "focusActivationTimer");
  -[NSTimer invalidate](v3, "invalidate");

  -[TVSSMenuBarViewController setFocusActivationTimer:](v9, "setFocusActivationTimer:", 0LL);
  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVSSMenuBarViewController;
  -[TVSSMenuBarViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  v121 = self;
  SEL v120 = a2;
  v119.receiver = self;
  v119.super_class = (Class)&OBJC_CLASS___TVSSMenuBarViewController;
  -[TVSSMenuBarViewController viewDidLoad](&v119, "viewDidLoad");
  id v118 = -[TVSSMenuBarViewController view](v121, "view");
  id v117 = [v118 safeAreaLayoutGuide];
  v64 = objc_alloc(&OBJC_CLASS___UIView);
  [v118 bounds];
  v116[1] = v2;
  v116[2] = v3;
  v116[3] = v4;
  v116[4] = v5;
  id v6 = -[UIView initWithFrame:](v64, "initWithFrame:", *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);
  dimmingOverlayView = v121->_dimmingOverlayView;
  v121->_dimmingOverlayView = v6;

  v65 = v121->_dimmingOverlayView;
  v66 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  -[UIView setBackgroundColor:](v65, "setBackgroundColor:");

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v121->_dimmingOverlayView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView setAlpha:](v121->_dimmingOverlayView, "setAlpha:", 0.0);
  [v118 addSubview:v121->_dimmingOverlayView];
  SEL v8 = objc_alloc_init(&OBJC_CLASS___TVSPPillView);
  pillView = v121->_pillView;
  v121->_pillView = v8;

  -[TVSPPillView setAccessibilityIdentifier:]( v121->_pillView,  "setAccessibilityIdentifier:",  @"com.apple.TVSSMenuBarViewController.pillView");
  -[TVSPPillView setTranslatesAutoresizingMaskIntoConstraints:]( v121->_pillView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v67 = v121->_pillView;
  v69 = -[TVSSMenuBarViewController contentViewProvider](v121, "contentViewProvider");
  v68 = -[TVSSPillContentViewProvider contentView](v69, "contentView");
  -[TVSPPillView setContentView:withTransition:](v67, "setContentView:withTransition:");

  [v118 addSubview:v121->_pillView];
  v10 = -[TVSSPrivacyStateAdapterView initWithDisplayLocation:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyStateAdapterView),  "initWithDisplayLocation:",  0LL);
  privacyStateAdapterView = v121->_privacyStateAdapterView;
  v121->_privacyStateAdapterView = v10;

  -[TVSSPrivacyStateAdapterView setTranslatesAutoresizingMaskIntoConstraints:]( v121->_privacyStateAdapterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v118 addSubview:v121->_privacyStateAdapterView];
  v12 = objc_alloc_init(&OBJC_CLASS___TVSSMenuItemPanelHostingViewController);
  panelHostingViewController = v121->_panelHostingViewController;
  v121->_panelHostingViewController = v12;

  -[TVSSMenuBarViewController addChildViewController:]( v121,  "addChildViewController:",  v121->_panelHostingViewController);
  v116[0] = -[TVSSMenuItemPanelHostingViewController view](v121->_panelHostingViewController, "view");
  [v118 addSubview:v116[0]];
  -[TVSSMenuItemPanelHostingViewController didMoveToParentViewController:]( v121->_panelHostingViewController,  "didMoveToParentViewController:",  v121);
  [v116[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  panelExitGuide = v121->_panelExitGuide;
  v121->_panelExitGuide = v14;

  -[UIFocusGuide setEnabled:](v121->_panelExitGuide, "setEnabled:", 0LL);
  v70 = v121->_panelExitGuide;
  v124 = v121->_pillView;
  v71 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v124, 1LL);
  -[UIFocusGuide setPreferredFocusEnvironments:](v70, "setPreferredFocusEnvironments:");

  [v118 addLayoutGuide:v121->_panelExitGuide];
  id v73 = -[TVSSPrivacyStateAdapterView centerXAnchor](v121->_privacyStateAdapterView, "centerXAnchor");
  id v72 = [v118 trailingAnchor];
  v16 = (NSLayoutConstraint *)objc_msgSend(v73, "constraintEqualToAnchor:constant:", -24.0);
  privacyCenterXConstraint = v121->_privacyCenterXConstraint;
  v121->_privacyCenterXConstraint = v16;

  id v75 = -[TVSSPrivacyStateAdapterView centerYAnchor](v121->_privacyStateAdapterView, "centerYAnchor");
  id v74 = [v118 topAnchor];
  +[TVSPConstants distanceFromScreenTopToPillCenter](&OBJC_CLASS___TVSPConstants, "distanceFromScreenTopToPillCenter");
  v18 = (NSLayoutConstraint *)objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74);
  privacyCenterYConstraint = v121->_privacyCenterYConstraint;
  v121->_privacyCenterYConstraint = v18;

  id v77 = -[TVSPPillView centerYAnchor](v121->_pillView, "centerYAnchor");
  id v76 = [v118 topAnchor];
  +[TVSPConstants distanceFromScreenTopToPillCenter](&OBJC_CLASS___TVSPConstants, "distanceFromScreenTopToPillCenter");
  id v20 = (NSLayoutConstraint *)objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76);
  barTopToCenterYConstraint = v121->_barTopToCenterYConstraint;
  v121->_barTopToCenterYConstraint = v20;

  LODWORD(v22) = 1132068864;
  -[NSLayoutConstraint setPriority:](v121->_barTopToCenterYConstraint, "setPriority:", v22);
  id v79 = -[TVSPPillView topAnchor](v121->_pillView, "topAnchor");
  id v78 = [v118 topAnchor];
  id v115 = objc_msgSend(v79, "constraintGreaterThanOrEqualToAnchor:constant:", 45.0);

  LODWORD(v23) = 1144750080;
  [v115 setPriority:v23];
  id v82 = -[TVSPPillView trailingAnchor](v121->_pillView, "trailingAnchor");
  id v81 = [v118 trailingAnchor];
  id v80 = objc_msgSend(v82, "constraintEqualToAnchor:constant:", -50.0);
  -[TVSSMenuBarViewController setPillViewTrailingConstraint:](v121, "setPillViewTrailingConstraint:");

  v123[0] = v121->_barTopToCenterYConstraint;
  v123[1] = v115;
  v107 = -[TVSSMenuBarViewController pillViewTrailingConstraint](v121, "pillViewTrailingConstraint");
  v123[2] = v107;
  v123[3] = v121->_privacyCenterXConstraint;
  v123[4] = v121->_privacyCenterYConstraint;
  id v106 = [v116[0] topAnchor];
  id v105 = -[TVSPPillView bottomAnchor](v121->_pillView, "bottomAnchor");
  id v104 = objc_msgSend(v106, "constraintEqualToAnchor:constant:", 16.0);
  v123[5] = v104;
  id v103 = [v116[0] trailingAnchor];
  id v102 = -[TVSPPillView trailingAnchor](v121->_pillView, "trailingAnchor");
  id v101 = objc_msgSend(v103, "constraintEqualToAnchor:");
  v123[6] = v101;
  id v100 = [v116[0] leadingAnchor];
  id v99 = [v117 leadingAnchor];
  id v98 = objc_msgSend(v100, "constraintEqualToAnchor:");
  v123[7] = v98;
  id v97 = [v116[0] bottomAnchor];
  id v96 = [v117 bottomAnchor];
  id v95 = objc_msgSend(v97, "constraintEqualToAnchor:");
  v123[8] = v95;
  id v94 = -[UIFocusGuide heightAnchor](v121->_panelExitGuide, "heightAnchor");
  id v93 = [v94 constraintEqualToConstant:1.0];
  v123[9] = v93;
  id v92 = -[UIFocusGuide leadingAnchor](v121->_panelExitGuide, "leadingAnchor");
  id v91 = [v118 leadingAnchor];
  id v90 = objc_msgSend(v92, "constraintEqualToAnchor:");
  v123[10] = v90;
  id v89 = -[UIFocusGuide trailingAnchor](v121->_panelExitGuide, "trailingAnchor");
  id v88 = [v118 trailingAnchor];
  id v87 = objc_msgSend(v89, "constraintEqualToAnchor:");
  v123[11] = v87;
  id v86 = -[UIFocusGuide topAnchor](v121->_panelExitGuide, "topAnchor");
  id v85 = -[TVSPPillView bottomAnchor](v121->_pillView, "bottomAnchor");
  id v84 = objc_msgSend(v86, "constraintEqualToAnchor:");
  v123[12] = v84;
  v83 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 13LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((TVSSDebugGuideLinesEnabled() & 1) != 0)
  {
    v114 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v114, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    [v118 addSubview:v114];
    v113 = -[UIView layer](v114, "layer");
    int v25 = v113;
    v26 = +[UIColor cyanColor](&OBJC_CLASS___UIColor, "cyanColor");
    -[CALayer setBorderColor:](v25, "setBorderColor:", -[UIColor CGColor](v26, "CGColor"));

    -[CALayer setBorderWidth:](v113, "setBorderWidth:");
    -[UIView setUserInteractionEnabled:](v114, "setUserInteractionEnabled:", 0LL);
    v112 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v112, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    v27 = v112;
    id v28 = +[UIColor redColor](&OBJC_CLASS___UIColor, "redColor");
    -[UIView setBackgroundColor:](v27, "setBackgroundColor:");

    [v118 addSubview:v112];
    v111 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v111, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    v29 = v111;
    int v30 = +[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor");
    -[UIView setBackgroundColor:](v29, "setBackgroundColor:");

    [v118 addSubview:v111];
    v63 = -[UIView leadingAnchor](v114, "leadingAnchor");
    id v62 = [v117 leadingAnchor];
    id v61 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v63, "constraintEqualToAnchor:");
    v122[0] = v61;
    v60 = -[UIView trailingAnchor](v114, "trailingAnchor");
    id v59 = [v117 trailingAnchor];
    id v58 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v60, "constraintEqualToAnchor:");
    v122[1] = v58;
    v57 = -[UIView topAnchor](v114, "topAnchor");
    id v56 = [v117 topAnchor];
    id v55 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v57, "constraintEqualToAnchor:");
    v122[2] = v55;
    v54 = -[UIView bottomAnchor](v114, "bottomAnchor");
    id v53 = [v117 bottomAnchor];
    id v52 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v54, "constraintEqualToAnchor:");
    v122[3] = v52;
    v51 = -[UIView widthAnchor](v112, "widthAnchor");
    id v50 = [v118 widthAnchor];
    id v49 = -[NSLayoutDimension constraintEqualToAnchor:](v51, "constraintEqualToAnchor:");
    v122[4] = v49;
    v48 = -[UIView heightAnchor](v112, "heightAnchor");
    v47 = -[NSLayoutDimension constraintEqualToConstant:](v48, "constraintEqualToConstant:", 1.0);
    v122[5] = v47;
    v46 = -[UIView topAnchor](v112, "topAnchor");
    id v45 = [v118 topAnchor];
    +[TVSPConstants distanceFromScreenTopToPillCenter](&OBJC_CLASS___TVSPConstants, "distanceFromScreenTopToPillCenter");
    id v44 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:](v46, "constraintEqualToAnchor:constant:", v45);
    v122[6] = v44;
    v43 = -[UIView leadingAnchor](v111, "leadingAnchor");
    id v42 = -[UIFocusGuide leadingAnchor](v121->_panelExitGuide, "leadingAnchor");
    id v41 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v43, "constraintEqualToAnchor:");
    v122[7] = v41;
    v40 = -[UIView trailingAnchor](v111, "trailingAnchor");
    id v39 = -[UIFocusGuide trailingAnchor](v121->_panelExitGuide, "trailingAnchor");
    id v38 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v40, "constraintEqualToAnchor:");
    v122[8] = v38;
    v37 = -[UIView topAnchor](v111, "topAnchor");
    id v36 = -[UIFocusGuide topAnchor](v121->_panelExitGuide, "topAnchor");
    id v35 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v37, "constraintEqualToAnchor:");
    v122[9] = v35;
    id v34 = -[UIView bottomAnchor](v111, "bottomAnchor");
    id v33 = -[UIFocusGuide bottomAnchor](v121->_panelExitGuide, "bottomAnchor");
    id v32 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v34, "constraintEqualToAnchor:");
    v122[10] = v32;
    int v31 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 11LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong((id *)&v111, 0LL);
    objc_storeStrong((id *)&v112, 0LL);
    objc_storeStrong((id *)&v113, 0LL);
    objc_storeStrong((id *)&v114, 0LL);
  }

  id v110 = -[TVSSMenuModeController mode](v121->_menuModeController, "mode");
  -[TVSSMenuBarViewController _updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:]( v121,  "_updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:",  v110,  0LL,  0LL,  0LL,  0LL,  0LL);
  -[TVSSMenuBarViewController _updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:]( v121,  "_updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:",  v110,  v110,  0LL,  0LL,  0LL,  0LL);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  int v24 = v121->_pillView;
  memcpy(v108, __dst, sizeof(v108));
  -[TVSPPillView setTransform:](v24, "setTransform:", v108);
  -[TVSSMenuBarViewController _updatePrivacyStateAdapterView](v121, "_updatePrivacyStateAdapterView");
  objc_storeStrong(&v115, 0LL);
  objc_storeStrong(v116, 0LL);
  objc_storeStrong(&v117, 0LL);
  objc_storeStrong(&v118, 0LL);
}

- (id)preferredFocusEnvironments
{
  char v4 = 0;
  unsigned __int8 v3 = 1;
  if (!self->_moveFocusToPanel)
  {
    v5 = -[TVSSMenuBarViewController currentRunningAnimationContext](self, "currentRunningAnimationContext");
    char v4 = 1;
    unsigned __int8 v3 = -[TVSSMenuBarViewController _shouldForceFocusToPanelDuringAnimationWithContext:]( self,  "_shouldForceFocusToPanelDuringAnimationWithContext:");
  }

  if ((v4 & 1) != 0) {

  }
  if ((v3 & 1) != 0)
  {
    panelHostingViewController = self->_panelHostingViewController;
    objc_super v7 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &panelHostingViewController,  1LL);
  }

  else
  {
    v8[0] = self->_pillView;
    v8[1] = self->_panelHostingViewController;
    objc_super v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL);
  }

  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)&OBJC_CLASS___TVSSMenuBarViewController;
  -[TVSSMenuBarViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v14,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v15);
  id v13 = [location[0] nextFocusedView];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSSMenuItemHostView);
  if ((objc_opt_isKindOfClass(v13, v4) & 1) != 0)
  {
    id v12 = v13;
    id v11 = [v12 item];
    -[TVSSMenuBarViewController setActiveMenuItem:presentationReason:focusHeading:]( v17,  "setActiveMenuItem:presentationReason:focusHeading:",  v11,  0,  [location[0] focusHeading]);
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    id v8 = -[TVSSMenuItemPanelHostingViewController view](v17->_panelHostingViewController, "view");
    unsigned __int8 v9 = objc_msgSend(v13, "isDescendantOfView:");

    if ((v9 & 1) != 0) {
      v17->_shouldHaveInitialFocusInPanel = 0;
    }
  }

  v5 = -[TVSSMenuBarViewController pillView](v17, "pillView");
  unsigned __int8 v6 = -[TVSPPillView containsView:](v5, "containsView:", v13);

  objc_super v7 = -[TVSSMenuBarViewController panelExitGuide](v17, "panelExitGuide");
  -[UIFocusGuide setEnabled:](v7, "setEnabled:", !(v6 & 1));

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGSize v13 = a4;
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = location[0];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIViewController);
  id v11 = sub_1000CB4FC(v9, v4);
  [v11 preferredContentSize];
  v10.double width = v5;
  v10.double height = v6;
  if (sub_1000CB5BC(v5, v6, CGSizeZero.width, CGSizeZero.height)) {
    CGSize v14 = v13;
  }
  else {
    CGSize v14 = v10;
  }
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  double height = v14.height;
  double width = v14.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)pillContentViewConfigurationWillChange:(id)a3
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] preferredLayoutMargins];
  double v4 = v3 + -50.0;
  double v5 = -[TVSSMenuBarViewController pillViewTrailingConstraint](v7, "pillViewTrailingConstraint");
  -[NSLayoutConstraint setConstant:](v5, "setConstant:", v4);

  objc_storeStrong(location, 0LL);
}

- (void)pillContentViewProviderWillUpdateCurrentContentView:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v5 = -[TVSSMenuBarViewController activeMenuItem](v20, "activeMenuItem");
  id v18 = -[TVSSMenuItem identifier](v5, "identifier");

  id v17 =  -[TVSSMenuDataSourceControllerOverlord controllerForMode:]( v20->_dataSourceControllerOverlord,  "controllerForMode:",  -[TVSSMenuModeController mode](v20->_menuModeController, "mode"));
  id v6 = [v17 dataSource];
  id v16 = [v6 items];

  id v7 = v16;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_1000CB91C;
  CGSize v13 = &unk_1001B8CF8;
  id v14 = v18;
  char v15 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &v9) & 1;
  if (v15 || !v18)
  {
    double v3 = v20;
    double v4 = -[TVSSMenuBarViewController activeMenuItem](v20, "activeMenuItem");
    -[TVSSMenuBarViewController updateOrthogonalDelegateOfActiveMenuItem:]( v3,  "updateOrthogonalDelegateOfActiveMenuItem:");
  }

  else
  {
    id v8 = objc_msgSend(v16, "bs_firstObjectPassingTest:", &stru_1001BA108);
    -[TVSSMenuBarViewController setActiveMenuItem:](v20, "setActiveMenuItem:", v8);
    -[TVSSMenuBarViewController setNeedsFocusUpdate](v20, "setNeedsFocusUpdate");
    -[TVSSMenuBarViewController updateFocusIfNeeded](v20, "updateFocusIfNeeded");
    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)pillContentViewWantsUpdateContext
{
  id v8 = self;
  v7[1] = (id)a2;
  double v3 = objc_alloc(&OBJC_CLASS___TVSSPillContentViewProviderUpdateContext);
  id v5 = -[TVSSMenuBarViewController view](v8, "view");
  double v4 = -[TVSSMenuBarViewController pillView](v8, "pillView");
  v7[0] = -[TVSSPillContentViewProviderUpdateContext initWithContainerView:pillView:]( v3,  "initWithContainerView:pillView:",  v5);

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  id v14 = [location[0] mode];
  if (v14 == (id)3)
  {
    char v13 = 0;
    id v4 =  -[TVSSMenuBarViewController _initialMenuItemForTransitionContext:focusInPanel:]( v18,  "_initialMenuItemForTransitionContext:focusInPanel:",  v16,  &v13);
    id v5 = v15;
    id v15 = v4;

    v18->_shouldHaveInitialFocusInPanel = v13 & 1;
  }

  id v9 = v18;
  id v7 = objc_msgSend(v16, "previousMenuMode", v14);
  id v11 = [v16 previousBannerContext];
  id v8 = v15;
  id v10 = [v16 interactivePresentationReason];
  -[TVSSMenuBarViewController _updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:]( v9,  "_updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:",  v6,  v7,  v11,  v8,  [v10 unsignedIntegerValue],  1);

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pixelShifter:(id)a3 didUpdateOffset:(CGPoint)a4
{
  CGPoint v6 = a4;
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController _updatePrivacyStateAdapterView](v5, "_updatePrivacyStateAdapterView");
  objc_storeStrong(location, 0LL);
}

- (void)setActiveMenuItem:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController setActiveMenuItem:presentationReason:]( v4,  "setActiveMenuItem:presentationReason:",  location[0],  0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4
{
  CGPoint v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController setActiveMenuItem:presentationReason:focusHeading:]( v6,  "setActiveMenuItem:presentationReason:focusHeading:",  location[0],  a4,  0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController setActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:]( v8,  "setActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:",  location[0],  a4,  a5,  0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6
{
  int v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v23 = (void *)a4;
  double v22 = (void *)a5;
  BOOL v21 = a6;
  if (v25->_activeMenuItem != location[0])
  {
    objc_storeStrong((id *)&v25->_activeMenuItem, location[0]);
    -[TVSSMenuBarViewController _updateActiveItemTraits](v25, "_updateActiveItemTraits");
    if (v23 || !location[0])
    {
      CGPoint v6 = -[TVSSMenuBarViewController focusActivationTimer](v25, "focusActivationTimer");
      -[NSTimer invalidate](v6, "invalidate");

      -[TVSSMenuBarViewController setFocusActivationTimer:](v25, "setFocusActivationTimer:", 0LL);
      -[TVSSMenuBarViewController actuallySetActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:]( v25,  "actuallySetActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:",  location[0],  v23,  v22,  v21);
    }

    else
    {
      id v8 = -[TVSSMenuBarViewController focusActivationTimer](v25, "focusActivationTimer");
      -[NSTimer invalidate](v8, "invalidate");

      objc_initWeak(&v20, v25);
      id v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = sub_1000CC110;
      id v16 = &unk_1001BA130;
      objc_copyWeak(v18, &v20);
      id v17 = location[0];
      v18[1] = v23;
      v18[2] = v22;
      BOOL v19 = v21;
      id v7 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v12,  0.1);
      -[TVSSMenuBarViewController setFocusActivationTimer:](v25, "setFocusActivationTimer:");

      objc_storeStrong(&v17, 0LL);
      objc_destroyWeak(v18);
      objc_destroyWeak(&v20);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)actuallySetActiveMenuItem:(id)a3 presentationReason:(unint64_t)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6
{
  BOOL v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v19 = a4;
  unint64_t v18 = a5;
  BOOL v17 = a6;
  id v16 = objc_alloc_init(&OBJC_CLASS___TVSSMutableMenuPresentationContext);
  -[TVSSMutableMenuPresentationContext setReason:](v16, "setReason:", a4);
  int v13 = -[TVSSMenuBarViewController panelHostingViewController](v21, "panelHostingViewController");
  id v9 = location[0];
  id v12 = -[TVSSMutableMenuPresentationContext copy](v16, "copy");
  unint64_t v10 = v18;
  BOOL v11 = v17;
  int v14 = v21;
  id v15 = location[0];
  -[TVSSMenuItemPanelHostingViewController setMenuItem:presentationContext:focusHeading:orthogonalNavigation:completion:]( v13,  "setMenuItem:presentationContext:focusHeading:orthogonalNavigation:completion:",  v9,  v12,  v10,  v11);

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateOrthogonalDelegateOfActiveMenuItem:(id)a3
{
  BOOL v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v3 = -[TVSSMenuBarViewController activeMenuItem](v21, "activeMenuItem");
  BOOL v8 = v3 == location[0];

  if (v8)
  {
    id v18 =  -[TVSSMenuDataSourceControllerOverlord controllerForMode:]( v21->_dataSourceControllerOverlord,  "controllerForMode:",  -[TVSSMenuModeController mode](v21->_menuModeController, "mode"));
    id v5 = [v18 dataSource];
    id v17 = [v5 items];

    CGPoint v6 = -[TVSSMenuBarViewController activeMenuItem](v21, "activeMenuItem");
    id v7 = (char *)objc_msgSend(v17, "indexOfObject:");

    id v16 = v7;
    unint64_t v15 = 0LL;
    queue = &_dispatch_main_q;
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_1000CC600;
    int v13 = &unk_1001B99A8;
    v14[0] = v21;
    v14[1] = (id)v15;
    dispatch_async(queue, &v9);

    objc_storeStrong(v14, 0LL);
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
    int v19 = 0;
  }

  else
  {
    int v19 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (void)didPerformPrimaryActionWithHostView:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController _moveFocusToPanel](v4, "_moveFocusToPanel");
  objc_storeStrong(location, 0LL);
}

- (BOOL)environmentAllowsFocus
{
  int v13 = self;
  SEL v12 = a2;
  id v7 = -[TVSSMenuBarViewController menuModeController](self, "menuModeController");
  BOOL v8 = (id)-[TVSSMenuModeController mode](v7, "mode") == (id)3;

  BOOL v11 = v8;
  id location = -[TVSSMenuBarViewController currentRunningAnimationContext](v13, "currentRunningAnimationContext");
  BOOL v14 = (!location
      || !v11
      || (BOOL v9 = [location presentationReason] == (id)2,
          id v5 = +[NSDate now](&OBJC_CLASS___NSDate, "now"),
          id v4 = [location creationDate],
          -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:"),
          double v6 = v2,
          v4,
          v5,
          !v9)
      || v6 >= 1.0)
     && v11;
  objc_storeStrong(&location, 0LL);
  return v14;
}

- (void)transactionManager:(id)a3 didCompleteTransaction:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v9 = v16;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction);
  id v15 = sub_1000CB4FC(v9, v4);
  char v13 = 0;
  char v11 = 0;
  BOOL v10 = 0;
  if ([v15 isBannerTransaction])
  {
    id v14 = [v15 animationContext];
    char v13 = 1;
    id v12 = [v14 currentBannerContext];
    char v11 = 1;
    BOOL v10 = [v12 bannerPresentationState] == (id)3;
  }

  if ((v11 & 1) != 0) {

  }
  if ((v13 & 1) != 0) {
  if (v10)
  }
  {
    id v5 = v18;
    id v7 = [v15 animationContext];
    id v6 = [v7 bannerViewController];
    -[TVSSMenuBarViewController _cleanUpDismissedBannerViewController:](v5, "_cleanUpDismissedBannerViewController:");
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)wantsOrthogonalMoveWithFocusHeading:(unint64_t)a3
{
  double v22 = self;
  SEL v21 = a2;
  unint64_t v20 = a3;
  id v19 =  -[TVSSMenuDataSourceControllerOverlord controllerForMode:]( self->_dataSourceControllerOverlord,  "controllerForMode:",  3LL);
  id v7 = [v19 dataSource];
  id v18 = [v7 items];

  id v17 = [v18 indexOfObject:v22->_activeMenuItem];
  if (v17 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
  {
    int v16 = 1;
  }

  else if (v17 == (_BYTE *)1 && v20 == 4)
  {
    id location = MenuBarOrthogonalNavigationLog();
    char v14 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v14;
      sub_100010524(v13);
      _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Orthogonal navigation should not request a movement left beyond menu items.",  v13,  2u);
    }

    objc_storeStrong(&location, 0LL);
    int v16 = 1;
  }

  else
  {
    if (v17 != (char *)[v18 count] - 1 || v20 != 8)
    {
      id v9 = v17;
      if (v20 == 4)
      {
        --v9;
      }

      else
      {
        if (v20 != 8)
        {
          int v16 = 1;
          goto LABEL_19;
        }

        ++v9;
      }

      id v8 = [v18 objectAtIndex:v9];
      -[TVSSMenuBarViewController setActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:]( v22,  "setActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:",  v8,  0LL,  v20,  1LL);
      objc_storeStrong(&v8, 0LL);
      int v16 = 0;
      goto LABEL_19;
    }

    id v12 = MenuBarOrthogonalNavigationLog();
    char v11 = 2;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    {
      double v3 = (os_log_s *)v12;
      os_log_type_t v4 = v11;
      sub_100010524(v10);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  v4,  "Orthogonal navigation should not request a movement right beyond menu items.",  v10,  2u);
    }

    objc_storeStrong(&v12, 0LL);
    int v16 = 1;
  }

- (void)_moveFocusToPanel
{
  self->_moveFocusToPanel = 1;
  -[TVSSMenuBarViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[TVSSMenuBarViewController updateFocusIfNeeded](self, "updateFocusIfNeeded");
  self->_moveFocusToPanel = 0;
}

- (void)_updateWithMenuMode:(unint64_t)a3 previousMode:(unint64_t)a4 previousBannerContext:(id)a5 activeMenuItem:(id)a6 presentationReason:(unint64_t)a7 animated:(BOOL)a8
{
  id v50 = self;
  SEL v49 = a2;
  unint64_t v48 = a3;
  unint64_t v47 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  id v45 = 0LL;
  objc_storeStrong(&v45, a6);
  id v44 = (void *)a7;
  BOOL v43 = a8;
  id v42 = -[TVSSMenuBarViewController menuModeController](v50, "menuModeController");
  id v41 = [v42 bannerContext];
  id v19 = objc_alloc(&OBJC_CLASS___TVSSMenuBarAnimationContext);
  unint64_t v17 = v48;
  unint64_t v18 = v47;
  id v16 = [v42 provider];
  id v14 = [v16 state];
  pillView = v50->_pillView;
  char v11 = -[TVSSMenuBarViewController contentViewProvider](v50, "contentViewProvider");
  panelHostingViewController = v50->_panelHostingViewController;
  id v13 = location;
  id v10 = [v41 transitioningBannerPresentable];
  id v9 = [location transitioningBannerPresentable];
  id v40 = -[TVSSMenuBarAnimationContext initWithMenuMode:previousMenuMode:menuModeState:pillView:pillContentViewProvider:panelHostingViewController:bannerContext:previousBannerContext:bannerViewController:previousBannerViewController:bannerContainerViewController:dimmingView:presentationReason:]( v19,  "initWithMenuMode:previousMenuMode:menuModeState:pillView:pillContentViewProvider:panelHostingViewController:ba nnerContext:previousBannerContext:bannerViewController:previousBannerViewController:bannerContainerViewControl ler:dimmingView:presentationReason:",  v17,  v18,  v14,  pillView,  v11,  panelHostingViewController,  v41,  v13,  v10,  v9,  v50,  v50->_dimmingOverlayView,  a7);

  id v39 =  +[TVSSMenuBarAnimationProvider animationTransactionForAnimationContext:animated:]( &OBJC_CLASS___TVSSMenuBarAnimationProvider,  "animationTransactionForAnimationContext:animated:",  v40,  a8);
  -[TVSSMenuBarViewController setCurrentRunningAnimationContext:](v50, "setCurrentRunningAnimationContext:", v40);
  if (v39)
  {
    BOOL v35 = v45 == 0LL;
    id v34 = v45;
    objc_initWeak(&from, v50);
    id v8 = v39;
    double v23 = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    v26 = sub_1000CD450;
    v27 = &unk_1001BA1F8;
    objc_copyWeak(v31, &from);
    BOOL v32 = v35;
    id v28 = v45;
    v31[1] = v44;
    id v29 = v34;
    id v30 = v40;
    [v8 registerBlockObserver:&v23];
    -[TVSSerialTransactionManager addTransaction:](v50->_transactionManager, "addTransaction:", v39);
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v29, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);
    objc_storeStrong(&v34, 0LL);
    int v36 = 0;
  }

  else
  {
    id v38 = MenuBarAnimationLog();
    os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
    {
      sub_10000D28C((uint64_t)v51, (uint64_t)v40);
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  v37,  "No transaction for animation context. {animationContext=%@}",  v51,  0xCu);
    }

    objc_storeStrong(&v38, 0LL);
    int v36 = 1;
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)_cleanUpDismissedBannerViewController:(id)a3
{
  os_log_type_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController removeChildViewController:](v4, "removeChildViewController:", location[0]);
  [location[0] didMoveToParentViewController:0];
  objc_storeStrong(location, 0LL);
}

- (id)_initialMenuItemForTransitionContext:(id)a3 focusInPanel:(BOOL *)a4
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v24 = a4;
  char v23 = 0;
  id v22 = 0LL;
  id v11 = [location[0] interactivePresentationReason];
  id v12 = [v11 unsignedIntegerValue];

  v21[1] = v12;
  if ((unint64_t)v12 <= 9) {
    __asm { BR              X8 }
  }

  objc_storeStrong(&v22, @"com.apple.status.controlCenterItem");
  v21[0] = 0LL;
  if (v22)
  {
    id v20 =  -[TVSSMenuDataSourceControllerOverlord controllerForMode:]( v26->_dataSourceControllerOverlord,  "controllerForMode:",  -[TVSSMenuModeController mode](v26->_menuModeController, "mode"));
    id v8 = [v20 dataSource];
    id v19 = [v8 items];

    id v9 = v19;
    id v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = sub_1000CDD70;
    unint64_t v17 = &unk_1001B8CF8;
    id v18 = v22;
    id v4 = objc_msgSend(v9, "bs_firstObjectPassingTest:", &v13);
    id v5 = v21[0];
    v21[0] = v4;

    if (v24) {
      *int v24 = v23 & 1;
    }
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
  }

  id v7 = v21[0];
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)_updateActiveItemTraits
{
  id v5 = self;
  v4[1] = (id)a2;
  double v2 = -[TVSSMenuBarViewController activeMenuItem](self, "activeMenuItem");
  v4[0] = -[TVSSMenuItem identifier](v2, "identifier");

  id v3 = -[TVSPPillView traitOverrides](v5->_pillView, "traitOverrides");
  [v3 setObject:v4[0] forTrait:objc_opt_class(TVSSMenuBarActiveItemIdentifierTrait)];

  -[TVSPPillView updateTraitsIfNeeded](v5->_pillView, "updateTraitsIfNeeded");
  objc_storeStrong(v4, 0LL);
}

- (void)_updateBarYOffset
{
  double v3 = v2;
  id v4 = -[TVSSMenuBarViewController barTopToCenterYConstraint](self, "barTopToCenterYConstraint");
  -[NSLayoutConstraint setConstant:](v4, "setConstant:", v3);

  id v5 = -[TVSSMenuBarViewController view](self, "view");
  [v5 layoutIfNeeded];
}

- (void)_updatePrivacyStateAdapterView
{
  id v33 = self;
  v32[1] = (id)a2;
  SEL v21 = -[TVSSMenuBarViewController privacyController](self, "privacyController");
  v32[0] = -[TVSSPrivacyController privacyState](v21, "privacyState");

  id location = -[TVSSMenuBarViewController privacyStateAdapterView](v33, "privacyStateAdapterView");
  [location setPrivacyState:v32[0]];
  BOOL v30 = 0;
  BOOL v29 = 0;
  char v27 = 0;
  BOOL v22 = 0;
  if ([v32[0] mode] == (id)4)
  {
    id v28 = [v32[0] recordingIndicator];
    char v27 = 1;
    BOOL v22 = v28 != 0LL;
  }

  if ((v27 & 1) != 0) {

  }
  if (v22)
  {
    id v19 = [v32[0] recordingIndicator];
    BOOL v30 = [v19 recordingType] == 0;

    id v20 = [v32[0] recordingIndicator];
    BOOL v29 = [v20 recordingType] == (id)1;
  }

  CGPoint v26 = CGPointZero;
  if (v29)
  {
    if (!v33->_cameraPixelShifterActiveAssertion)
    {
      cameraIndicatorPixelShifter = v33->_cameraIndicatorPixelShifter;
      double v2 = (objc_class *)objc_opt_class(v33);
      id v18 = NSStringFromClass(v2);
      double v3 = (BSInvalidatable *) -[TVSSPrivacyViewPixelShifter acquireAssertionWithReason:]( cameraIndicatorPixelShifter,  "acquireAssertionWithReason:");
      cameraPixelShifterActiveAssertion = v33->_cameraPixelShifterActiveAssertion;
      v33->_cameraPixelShifterActiveAssertion = v3;
    }

    -[TVSSPrivacyViewPixelShifter offset](v33->_cameraIndicatorPixelShifter, "offset");
    v25.x = v5;
    v25.y = v6;
    CGPoint v26 = v25;
    -[BSInvalidatable invalidate](v33->_microphonePixelShifterActiveAssertion, "invalidate");
    objc_storeStrong((id *)&v33->_microphonePixelShifterActiveAssertion, 0LL);
  }

  else if (v30)
  {
    if (!v33->_microphonePixelShifterActiveAssertion)
    {
      microphoneIndicatorPixelShifter = v33->_microphoneIndicatorPixelShifter;
      id v7 = (objc_class *)objc_opt_class(v33);
      id v16 = NSStringFromClass(v7);
      id v8 = (BSInvalidatable *) -[TVSSPrivacyViewPixelShifter acquireAssertionWithReason:]( microphoneIndicatorPixelShifter,  "acquireAssertionWithReason:");
      microphonePixelShifterActiveAssertion = v33->_microphonePixelShifterActiveAssertion;
      v33->_microphonePixelShifterActiveAssertion = v8;
    }

    -[TVSSPrivacyViewPixelShifter offset](v33->_microphoneIndicatorPixelShifter, "offset");
    v24.x = v10;
    v24.y = v11;
    CGPoint v26 = v24;
    -[BSInvalidatable invalidate](v33->_cameraPixelShifterActiveAssertion, "invalidate");
    objc_storeStrong((id *)&v33->_cameraPixelShifterActiveAssertion, 0LL);
  }

  else
  {
    -[BSInvalidatable invalidate](v33->_cameraPixelShifterActiveAssertion, "invalidate");
    -[BSInvalidatable invalidate](v33->_microphonePixelShifterActiveAssertion, "invalidate");
    objc_storeStrong((id *)&v33->_cameraPixelShifterActiveAssertion, 0LL);
    objc_storeStrong((id *)&v33->_microphonePixelShifterActiveAssertion, 0LL);
  }

  +[TVSPConstants distanceFromScreenTopToPillCenter]( &OBJC_CLASS___TVSPConstants,  "distanceFromScreenTopToPillCenter",  *(void *)&v26.y);
  double v23 = v13 + v12;
  -[NSLayoutConstraint setConstant:](v33->_privacyCenterXConstraint, "setConstant:", v26.x + -24.0);
  -[NSLayoutConstraint setConstant:](v33->_privacyCenterYConstraint, "setConstant:", v23);
  id v14 = -[TVSSMenuBarViewController view](v33, "view");
  [v14 layoutIfNeeded];

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v32, 0LL);
}

- (BOOL)_shouldForceFocusToPanelDuringAnimationWithContext:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    BOOL v8 = [location[0] menuMode] == (id)3;
    BOOL v7 = [location[0] presentationReason] == (id)2;
    BOOL v6 = [location[0] presentationReason] == (id)4;
    char v5 = 0;
    if (v8)
    {
      char v4 = 1;
      if (!v7) {
        char v4 = v6;
      }
      char v5 = v4;
    }

    char v10 = v5 & 1;
  }

  else
  {
    char v10 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v10 & 1;
}

- (void)privacyControllerStateDidChange:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuBarViewController _updatePrivacyStateAdapterView](v4, "_updatePrivacyStateAdapterView");
  objc_storeStrong(location, 0LL);
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (TVSPPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (TVSSPillContentViewProvider)contentViewProvider
{
  return self->_contentViewProvider;
}

- (void)setContentViewProvider:(id)a3
{
}

- (TVSSMenuItemPanelHostingViewController)panelHostingViewController
{
  return self->_panelHostingViewController;
}

- (void)setPanelHostingViewController:(id)a3
{
}

- (TVSSMenuItem)activeMenuItem
{
  return self->_activeMenuItem;
}

- (_TVSSMenuBarPendingPresentableRequest)pendingBannerPresentable
{
  return self->_pendingBannerPresentable;
}

- (void)setPendingBannerPresentable:(id)a3
{
}

- (TVSSerialTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (void)setTransactionManager:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (TVSSPrivacyStateAdapterView)privacyStateAdapterView
{
  return self->_privacyStateAdapterView;
}

- (UIView)dimmingOverlayView
{
  return self->_dimmingOverlayView;
}

- (TVSSPrivacyViewPixelShifter)microphoneIndicatorPixelShifter
{
  return self->_microphoneIndicatorPixelShifter;
}

- (void)setMicrophoneIndicatorPixelShifter:(id)a3
{
}

- (TVSSPrivacyViewPixelShifter)cameraIndicatorPixelShifter
{
  return self->_cameraIndicatorPixelShifter;
}

- (void)setCameraIndicatorPixelShifter:(id)a3
{
}

- (BSInvalidatable)microphonePixelShifterActiveAssertion
{
  return self->_microphonePixelShifterActiveAssertion;
}

- (void)setMicrophonePixelShifterActiveAssertion:(id)a3
{
}

- (BSInvalidatable)cameraPixelShifterActiveAssertion
{
  return self->_cameraPixelShifterActiveAssertion;
}

- (void)setCameraPixelShifterActiveAssertion:(id)a3
{
}

- (NSLayoutConstraint)barTopToCenterYConstraint
{
  return self->_barTopToCenterYConstraint;
}

- (void)setBarTopToCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)privacyCenterXConstraint
{
  return self->_privacyCenterXConstraint;
}

- (void)setPrivacyCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)privacyCenterYConstraint
{
  return self->_privacyCenterYConstraint;
}

- (void)setPrivacyCenterYConstraint:(id)a3
{
}

- (UIFocusGuide)panelExitGuide
{
  return self->_panelExitGuide;
}

- (void)setPanelExitGuide:(id)a3
{
}

- (TVSSMenuBarAnimationContext)currentRunningAnimationContext
{
  return self->_currentRunningAnimationContext;
}

- (void)setCurrentRunningAnimationContext:(id)a3
{
}

- (NSLayoutConstraint)pillViewTrailingConstraint
{
  return self->_pillViewTrailingConstraint;
}

- (void)setPillViewTrailingConstraint:(id)a3
{
}

- (NSTimer)focusActivationTimer
{
  return self->_focusActivationTimer;
}

- (void)setFocusActivationTimer:(id)a3
{
}

- (id)scaledUINotificationToken
{
  return self->_scaledUINotificationToken;
}

- (void)setScaledUINotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end