@interface TVSSDictationViewController
- (BOOL)shouldPerformSearchAction;
- (NSString)dictationDeviceIdentifier;
- (NSString)focusedAppIdentifier;
- (TVSSDictationViewController)init;
- (TVSSDictationViewControllerDelegate)delegate;
- (UISearchBar)searchBar;
- (UIView)contentContainerView;
- (UIView)dictationPlatterView;
- (UIView)dimmingView;
- (void)_cleanup;
- (void)_performSearchAndDismiss;
- (void)_startDictation;
- (void)_stopDictation;
- (void)alignView:(id)a3 inside:(id)a4;
- (void)alignView:(id)a3 inside:(id)a4 withConstantInset:(double)a5;
- (void)alignView:(id)a3 inside:(id)a4 withInsets:(UIEdgeInsets)a5;
- (void)animateIn;
- (void)animateOut;
- (void)dealloc;
- (void)dismissDictationPlatter;
- (void)handleDictationDidFinish:(id)a3;
- (void)handleSelectGesture:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDictationDeviceIdentifier:(id)a3;
- (void)setFocusedAppIdentifier:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setShouldPerformSearchAction:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSSDictationViewController

- (TVSSDictationViewController)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  v6 = -[TVSSDictationViewController init](&v4, "init");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (void)viewDidLoad
{
  v103 = self;
  SEL v102 = a2;
  v101.receiver = self;
  v101.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  -[TVSSDictationViewController viewDidLoad](&v101, "viewDidLoad");
  v2 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  id v100 = -[UITapGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v103, "handleSelectGesture:");
  [v100 setAllowedPressTypes:&off_1001C8708];
  id v61 = -[TVSSDictationViewController view](v103, "view");
  [v61 addGestureRecognizer:v100];

  id v99 = objc_alloc_init(&OBJC_CLASS___UIView);
  [v99 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v99, "_setContinuousCornerRadius:");
  objc_storeStrong((id *)&v103->_dictationPlatterView, v99);
  id v98 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5002LL);
  id v97 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v98);
  [v97 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v97 _setContinuousCornerRadius:48.0];
  id v63 = [v97 layer];
  id v62 = +[TVSPConstants menuBarBorderColor](&OBJC_CLASS___TVSPConstants, "menuBarBorderColor");
  objc_msgSend(v63, "setBorderColor:", objc_msgSend(v62, "CGColor"));

  id v64 = [v97 layer];
  +[TVSPConstants menuBarBorderWidth](&OBJC_CLASS___TVSPConstants, "menuBarBorderWidth");
  objc_msgSend(v64, "setBorderWidth:");

  -[UIView addSubview:](v103->_dictationPlatterView, "addSubview:", v97);
  id v96 = objc_alloc_init(&OBJC_CLASS___UIView);
  [v96 setUserInteractionEnabled:0];
  [v96 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v96 _setContinuousCornerRadius:48.0];
  id v65 = [v96 layer];
  [v65 setShadowPathIsBounds:1];

  id v67 = [v96 layer];
  v66 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  objc_msgSend(v67, "setShadowColor:", -[UIColor CGColor](v66, "CGColor"));

  id v68 = [v96 layer];
  LODWORD(v3) = 1045220557;
  [v68 setShadowOpacity:v3];

  id v69 = [v96 layer];
  [v69 setShadowRadius:48.0];

  id v70 = [v96 layer];
  sub_1000C1520();
  v95[5] = v4;
  v95[6] = v5;
  objc_msgSend(v70, "setShadowOffset:", *(double *)&v4, *(double *)&v5);

  v71 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  objc_msgSend(v96, "setBackgroundColor:");

  id v73 = [v96 layer];
  v72 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterMultiplyBlendMode);
  objc_msgSend(v73, "setCompositingFilter:");

  -[UIView addSubview:](v103->_dictationPlatterView, "addSubview:", v96);
  [v97 setClipsToBounds:1];
  v6 = objc_alloc_init(&OBJC_CLASS___UIView);
  contentContainerView = v103->_contentContainerView;
  v103->_contentContainerView = v6;

  -[UIView setClipsToBounds:](v103->_contentContainerView, "setClipsToBounds:", 1LL);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v103->_contentContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v74 = [v97 layer];
  [v74 setCornerCurve:kCACornerCurveContinuous];

  id v75 = [v97 layer];
  [v75 setCornerRadius:48.0];

  -[UIView addSubview:](v103->_dictationPlatterView, "addSubview:", v103->_contentContainerView);
  -[TVSSDictationViewController alignView:inside:](v103, "alignView:inside:", v97, v103->_dictationPlatterView);
  -[TVSSDictationViewController alignView:inside:withConstantInset:]( v103,  "alignView:inside:withConstantInset:",  v96,  v103->_dictationPlatterView,  1.0);
  v76 = v103;
  v77 = v103->_contentContainerView;
  dictationPlatterView = v103->_dictationPlatterView;
  sub_1000C154C();
  v95[1] = v8;
  v95[2] = v9;
  v95[3] = v10;
  v95[4] = v11;
  -[TVSSDictationViewController alignView:inside:withInsets:]( v76,  "alignView:inside:withInsets:",  v77,  dictationPlatterView,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10,  *(double *)&v11);
  v95[0] = objc_alloc_init(&OBJC_CLASS___UISearchBar);
  [v95[0] _setShowDictationDisplayInSearchBar:1];
  [v95[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v94 = 0LL;
  v79 = -[TVSSDictationViewController focusedAppIdentifier](v103, "focusedAppIdentifier");
  unsigned __int8 v80 = -[NSString isEqualToString:](v79, "isEqualToString:", @"com.apple.HeadBoard");

  if ((v80 & 1) != 0)
  {
    id v12 = TVSSLocString(@"TVSSDictationPlaceholderGlobal");
    id v13 = v94;
    id v94 = v12;
  }

  else
  {
    v59 = -[TVSSDictationViewController focusedAppIdentifier](v103, "focusedAppIdentifier");
    char v92 = 0;
    BOOL v60 = 0;
    if (v59)
    {
      v93 = -[TVSSDictationViewController focusedAppIdentifier](v103, "focusedAppIdentifier");
      char v92 = 1;
      BOOL v60 = -[NSString length](v93, "length") != 0;
    }

    if ((v92 & 1) != 0) {

    }
    if (v60)
    {
      v57 = -[TVSSDictationViewController focusedAppIdentifier](v103, "focusedAppIdentifier");
      id v56 =  +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:");
      id v91 = [v56 localizedName];

      id v58 = TVSSLocString(@"TVSSDictationPlaceholderInApp");
      v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v91);
      id v15 = v94;
      id v94 = v14;

      objc_storeStrong(&v91, 0LL);
    }

    else
    {
      id v16 = TVSSLocString(@"TVSSDictationPlaceholderInAppFallback");
      id v17 = v94;
      id v94 = v16;
    }
  }

  [v95[0] setPlaceholder:v94];
  [v95[0] _setDisableDictationButton:0];
  id v54 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"mic.circle.fill");
  id v90 = [v54 imageWithRenderingMode:2];

  id v89 = +[NSTextAttachment textAttachmentWithImage:](&OBJC_CLASS___NSTextAttachment, "textAttachmentWithImage:", v90);
  v55 =  +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v89);
  id v88 = -[NSAttributedString mutableCopy](v55, "mutableCopy");

  id v87 = TVSSLocString(@"TVSSDictationHelperPlaceholder");
  id v85 = [v87 rangeOfString:@"%@"];
  uint64_t v86 = v18;
  v84 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v87);
  if (v85 != (id)0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v84,  "replaceCharactersInRange:withAttributedString:",  v85,  v86,  v88);
  }
  v83 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
  v24 = v84;
  NSAttributedStringKey v110 = NSFontAttributeName;
  v111 = v83;
  v25 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v111,  &v110,  1LL);
  id v19 = -[NSMutableAttributedString length](v84, "length");
  uint64_t v105 = 0LL;
  id v104 = v19;
  uint64_t v106 = 0LL;
  id v107 = v19;
  v82[1] = 0LL;
  v82[2] = v19;
  -[NSMutableAttributedString addAttributes:range:](v24, "addAttributes:range:", v25, 0LL, v19);

  [v95[0] _setHelperPlaceholderOverride:v84];
  v82[0] = v103->_contentContainerView;
  [v82[0] addSubview:v95[0]];
  -[TVSSDictationViewController alignView:inside:](v103, "alignView:inside:", v95[0], v103->_contentContainerView);
  -[TVSSDictationViewController setSearchBar:](v103, "setSearchBar:", v95[0]);
  id v26 = -[TVSSDictationViewController view](v103, "view");
  [v26 addSubview:v103->_dictationPlatterView];

  v39 = -[UIView topAnchor](v103->_dictationPlatterView, "topAnchor");
  id v38 = -[TVSSDictationViewController view](v103, "view");
  id v37 = [v38 topAnchor];
  id v36 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:](v39, "constraintEqualToAnchor:constant:", 60.0);
  v109[0] = v36;
  v35 = -[UIView leadingAnchor](v103->_dictationPlatterView, "leadingAnchor");
  id v34 = -[TVSSDictationViewController view](v103, "view");
  id v33 = [v34 leadingAnchor];
  id v32 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v35, "constraintEqualToAnchor:constant:", 80.0);
  v109[1] = v32;
  v31 = -[UIView trailingAnchor](v103->_dictationPlatterView, "trailingAnchor");
  id v30 = -[TVSSDictationViewController view](v103, "view");
  id v29 = [v30 trailingAnchor];
  id v28 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v31, "constraintEqualToAnchor:constant:", -80.0);
  v109[2] = v28;
  v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v109, 3LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  v40 = objc_alloc(&OBJC_CLASS___UIView);
  id v41 = -[TVSSDictationViewController view](v103, "view");
  [v41 bounds];
  id v81 = -[UIView initWithFrame:](v40, "initWithFrame:", v20, v21, v22, v23);

  id v42 = v81;
  v43 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
  objc_msgSend(v42, "setBackgroundColor:");

  id v44 = -[TVSSDictationViewController view](v103, "view");
  [v44 insertSubview:v81 atIndex:0];

  id v53 = -[TVSSDictationViewController view](v103, "view");
  id v52 = [v53 leadingAnchor];
  id v51 = [v81 leadingAnchor];
  id v50 = objc_msgSend(v52, "constraintEqualToAnchor:");
  v108[0] = v50;
  id v49 = -[TVSSDictationViewController view](v103, "view");
  id v48 = [v49 topAnchor];
  id v47 = [v81 topAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:");
  v108[1] = v46;
  v45 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong((id *)&v103->_dimmingView, v81);
  objc_storeStrong(&v81, 0LL);
  objc_storeStrong(v82, 0LL);
  objc_storeStrong((id *)&v83, 0LL);
  objc_storeStrong((id *)&v84, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v94, 0LL);
  objc_storeStrong(v95, 0LL);
  objc_storeStrong(&v96, 0LL);
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(&v99, 0LL);
  objc_storeStrong(&v100, 0LL);
}

  ;
}

  ;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  -[TVSSDictationViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  -[TVSSDictationViewController animateIn](v6, "animateIn");
}

- (void)viewDidAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  -[TVSSDictationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  objc_super v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v7,  "handleDictationDidFinish:",  UIDictationControllerDictationDidFinish,  0LL);

  if ((sub_1000C16B8() & 1) != 0) {
    -[TVSSDictationViewController _startDictation](v7, "_startDictation");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  -[TVSSDictationViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  id location = -[TVSSDictationViewController delegate](v7, "delegate");
  if ((objc_opt_respondsToSelector(location, "dictationViewControllerDidFinishDictating:") & 1) != 0) {
    [location dictationViewControllerDidFinishDictating:v7];
  }
  objc_storeStrong(&location, 0LL);
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  -[TVSSDictationViewController _cleanup](self, "_cleanup");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
  -[TVSSDictationViewController dealloc](&v2, "dealloc");
}

- (void)animateIn
{
  id v33 = self;
  v32[1] = (id)a2;
  v7 = -[TVSSDictationViewController dictationPlatterView](self, "dictationPlatterView");
  SEL v6 = -[UIView layer](v7, "layer");
  -[CALayer setValue:forKeyPath:](v6, "setValue:forKeyPath:", &off_1001C8F40);

  v32[0] =  +[CASpringAnimation animationWithKeyPath:]( &OBJC_CLASS___CASpringAnimation,  "animationWithKeyPath:",  @"transform.scale");
  [v32[0] setFromValue:&off_1001C8F50];
  objc_msgSend(v32[0], "setMass:");
  [v32[0] setStiffness:155.0];
  [v32[0] setDamping:50.0];
  objc_msgSend(v32[0], "setInitialVelocity:");
  [v32[0] settlingDuration];
  objc_msgSend(v32[0], "setDuration:");
  v9 = -[TVSSDictationViewController dictationPlatterView](v33, "dictationPlatterView");
  v8 = -[UIView layer](v9, "layer");
  -[CALayer addAnimation:forKey:](v8, "addAnimation:forKey:", v32[0], 0LL);

  -[TVSSDictationViewController beginAppearanceTransition:animated:]( v33,  "beginAppearanceTransition:animated:",  1LL,  1LL);
  v10 = -[TVSSDictationViewController dictationPlatterView](v33, "dictationPlatterView");
  -[UIView setAlpha:](v10, "setAlpha:", 0.0);

  v11 = -[TVSSDictationViewController dimmingView](v33, "dimmingView");
  -[UIView setAlpha:](v11, "setAlpha:", 0.0);

  id v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000C1BAC();
  double v29 = v2;
  double v30 = v3;
  sub_1000C1BAC();
  double v27 = v4;
  double v28 = v5;
  double v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_1000C1BD8;
  v25 = &unk_1001B5A60;
  id v26 = v33;
  id v31 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v12,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v21,  0.25,  v29,  v30,  v27,  v28);
  objc_initWeak(&location, v33);
  id v13 = v31;
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_1000C1C60;
  uint64_t v18 = &unk_1001B5A88;
  objc_copyWeak(&v19, &location);
  [v13 addCompletion:&v14];
  [v31 startAnimation];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong(v32, 0LL);
}

- (void)animateOut
{
  id v26 = self;
  v25[1] = (id)a2;
  -[TVSSDictationViewController beginAppearanceTransition:animated:]( self,  "beginAppearanceTransition:animated:",  0LL,  1LL);
  SEL v6 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000C1BAC();
  double v23 = v2;
  double v24 = v3;
  sub_1000C1BAC();
  double v21 = v4;
  double v22 = v5;
  int v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  uint64_t v18 = sub_1000C1ED8;
  id v19 = &unk_1001B5A60;
  double v20 = v26;
  v25[0] = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v6,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v15,  0.2,  v23,  v24,  v21,  v22);
  objc_initWeak(&location, v26);
  id v7 = v25[0];
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_1000C1FAC;
  id v12 = &unk_1001B5A88;
  objc_copyWeak(&v13, &location);
  [v7 addCompletion:&v8];
  [v25[0] startAnimation];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_storeStrong(v25, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
}

- (void)dismissDictationPlatter
{
}

- (void)handleSelectGesture:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = DictationControllerLog();
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Recognized Select gesture on PineBoardViewServices TVSSDictationViewController.",  v5,  2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVSSDictationViewController _performSearchAndDismiss](v9, "_performSearchAndDismiss");
  objc_storeStrong(location, 0LL);
}

- (void)handleDictationDidFinish:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = DictationControllerLog();
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Received dictationDidFinish notification on PineBoardViewServices TVSSDictationViewController.",  v5,  2u);
  }

  objc_storeStrong(&v7, 0LL);
  if (-[TVSSDictationViewController shouldPerformSearchAction](v9, "shouldPerformSearchAction"))
  {
    -[TVSSDictationViewController setShouldPerformSearchAction:](v9, "setShouldPerformSearchAction:", 0LL);
    -[TVSSDictationViewController _performSearchAndDismiss](v9, "_performSearchAndDismiss");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_performSearchAndDismiss
{
  double v22 = self;
  v21[1] = (id)a2;
  id v7 = -[TVSSDictationViewController searchBar](self, "searchBar");
  v21[0] = -[UISearchBar text](v7, "text");

  id v20 = objc_alloc_init(&OBJC_CLASS____TtC17TVSystemUIService47TVSSShowInAppStringSearchResultsIntentPrototype);
  id location = 0LL;
  v8 = -[TVSSDictationViewController focusedAppIdentifier](v22, "focusedAppIdentifier");
  unsigned __int8 v9 = -[NSString isEqualToString:](v8, "isEqualToString:", @"com.apple.HeadBoard");

  if ((v9 & 1) != 0)
  {
    objc_storeStrong(&location, @"com.apple.TVSearch");
  }

  else
  {
    double v2 = -[TVSSDictationViewController focusedAppIdentifier](v22, "focusedAppIdentifier");
    id v3 = location;
    id location = v2;
  }

  if (location)
  {
    id v18 = DictationControllerLog();
    os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
    {
      sub_10000D540((uint64_t)v23, (uint64_t)location, (uint64_t)v21[0]);
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  v17,  "Performing PlayVideoIntentPrototype with target: %@, term: %@",  v23,  0x16u);
    }

    objc_storeStrong(&v18, 0LL);
    id v6 = v20;
    id v4 = location;
    id v5 = v21[0];
    int v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = sub_1000C24A8;
    v14 = &unk_1001B9F80;
    id v15 = location;
    id v16 = v21[0];
    [v6 performWithBundleIdentifier:v4 term:v5 completionHandler:&v10];
    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  -[TVSSDictationViewController animateOut](v22, "animateOut");
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v21, 0LL);
}

- (void)_startDictation
{
  id v32 = self;
  SEL v31 = a2;
  -[TVSSDictationViewController setShouldPerformSearchAction:](self, "setShouldPerformSearchAction:", 1LL);
  v14 = +[UIKeyboardImpl sharedInstance](&OBJC_CLASS___UIKeyboardImpl, "sharedInstance");
  id v15 = -[UIKeyboardImpl delegate](v14, "delegate");
  char v29 = 0;
  char v27 = 0;
  char v25 = 0;
  char v23 = 0;
  BOOL v16 = 1;
  if (v15)
  {
    double v30 = +[UIKeyboardImpl sharedInstance](&OBJC_CLASS___UIKeyboardImpl, "sharedInstance");
    char v29 = 1;
    id v28 = -[UIKeyboardImpl delegate](v30, "delegate");
    char v27 = 1;
    id v26 = -[TVSSDictationViewController searchBar](v32, "searchBar");
    char v25 = 1;
    id v24 = -[UISearchBar searchField](v26, "searchField");
    char v23 = 1;
    BOOL v16 = v28 != v24;
  }

  if ((v23 & 1) != 0) {

  }
  if ((v25 & 1) != 0) {
  if ((v27 & 1) != 0)
  }

  if ((v29 & 1) != 0) {
  if (v16)
  }
  {
    id v13 = +[UIKeyboardImpl sharedInstance](&OBJC_CLASS___UIKeyboardImpl, "sharedInstance");
    int v12 = -[TVSSDictationViewController searchBar](v32, "searchBar");
    id v11 = -[UISearchBar searchField](v12, "searchField");
    -[UIKeyboardImpl setDelegate:](v13, "setDelegate:");
  }

  unsigned __int8 v9 = +[UIKeyboardImpl sharedInstance](&OBJC_CLASS___UIKeyboardImpl, "sharedInstance");
  -[UIKeyboardImpl handleClear](v9, "handleClear");

  int v10 = -[TVSSDictationViewController searchBar](v32, "searchBar");
  -[UISearchBar becomeFirstResponder](v10, "becomeFirstResponder");

  id location = DictationControllerLog();
  char v21 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v21;
    sub_100010524(v20);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Starting dictation on PineBoardViewServices TVSSDictationViewController.",  v20,  2u);
  }

  objc_storeStrong(&location, 0LL);
  id v3 = +[UIDictationController sharedInstance](&OBJC_CLASS___UIDictationController, "sharedInstance");
  double v2 = -[TVSSDictationViewController dictationDeviceIdentifier](v32, "dictationDeviceIdentifier");
  -[UIDictationController setActivationIdentifier:](v3, "setActivationIdentifier:");

  id v19 = +[TVCSPreferredLanguagesManager sharedInstance](&OBJC_CLASS___TVCSPreferredLanguagesManager, "sharedInstance");
  id v4 = -[TVCSPreferredLanguagesManager preferredInputModeList](v19, "preferredInputModeList");
  id v18 = [v4 firstObject];

  os_log_type_t v17 =  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:]( &OBJC_CLASS___UIKeyboardInputMode,  "keyboardInputModeWithIdentifier:",  v18);
  id v5 =  +[UIKeyboardInputModeController sharedInputModeController]( &OBJC_CLASS___UIKeyboardInputModeController,  "sharedInputModeController");
  [v5 setCurrentInputMode:v17];

  id v6 = +[UIDictationController sharedInstance](&OBJC_CLASS___UIDictationController, "sharedInstance");
  -[UIDictationController switchToDictationInputMode](v6, "switchToDictationInputMode");

  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
}

- (void)_stopDictation
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = DictationControllerLog();
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Stopping dictation on PineBoardViewServices TVSSDictationViewController.",  v5,  2u);
  }

  objc_storeStrong(location, 0LL);
  double v2 = +[UIDictationController sharedInstance](&OBJC_CLASS___UIDictationController, "sharedInstance");
  -[UIDictationController stopDictation:](v2, "stopDictation:", 0LL);
}

- (void)_cleanup
{
  if ((+[UIDictationController isRunning](&OBJC_CLASS___UIDictationController, "isRunning") & 1) != 0)
  {
    id v3 = +[UIDictationController sharedInstance](&OBJC_CLASS___UIDictationController, "sharedInstance");
    -[UIDictationController stopDictation](v3, "stopDictation");
  }

  double v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", self);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  unsigned __int8 v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_1000C2D74(location[0]) & 1) != 0)
  {
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
    -[TVSSDictationViewController pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  unsigned __int8 v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_1000C2D74(location[0]) & 1) != 0)
  {
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
    -[TVSSDictationViewController pressesEnded:withEvent:](&v5, "pressesEnded:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  unsigned __int8 v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((sub_1000C2D74(location[0]) & 1) != 0)
  {
    -[TVSSDictationViewController _stopDictation](v9, "_stopDictation");
    int v6 = 1;
  }

  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)&OBJC_CLASS___TVSSDictationViewController;
    -[TVSSDictationViewController pressesCancelled:withEvent:](&v5, "pressesCancelled:withEvent:", location[0], v7);
    int v6 = 0;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)alignView:(id)a3 inside:(id)a4 withInsets:(UIEdgeInsets)a5
{
  UIEdgeInsets v24 = a5;
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  BOOL v21 = [location[0] effectiveUserInterfaceLayoutDirection] == (id)1;
  id v19 = [v22 leadingAnchor];
  id v20 = [location[0] leadingAnchor];
  if (v21) {
    double v17 = -v24.right;
  }
  else {
    double v17 = -v24.left;
  }
  id v14 = [v19 constraintEqualToAnchor:v20 constant:v17];
  v25[0] = v14;
  id v15 = [v22 trailingAnchor];
  id v16 = [location[0] trailingAnchor];
  if (v21) {
    double left = v24.left;
  }
  else {
    double left = v24.right;
  }
  id v12 = [v15 constraintEqualToAnchor:v16 constant:left];
  v25[1] = v12;
  id v11 = [v22 topAnchor];
  id v10 = [location[0] topAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -v24.top);
  id v25[2] = v9;
  id v8 = [v22 bottomAnchor];
  id v7 = [location[0] bottomAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v24.bottom);
  v25[3] = v6;
  objc_super v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)alignView:(id)a3 inside:(id)a4 withConstantInset:(double)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v10 = v15;
  id v11 = location[0];
  id v12 = v13;
  sub_1000C154C();
  -[TVSSDictationViewController alignView:inside:withInsets:]( v10,  "alignView:inside:withInsets:",  v11,  v12,  v5,  v6,  v7,  v8);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)alignView:(id)a3 inside:(id)a4
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSDictationViewController alignView:inside:withConstantInset:]( v7,  "alignView:inside:withConstantInset:",  location[0],  v5,  0.0);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSString)dictationDeviceIdentifier
{
  return self->_dictationDeviceIdentifier;
}

- (void)setDictationDeviceIdentifier:(id)a3
{
}

- (NSString)focusedAppIdentifier
{
  return self->_focusedAppIdentifier;
}

- (void)setFocusedAppIdentifier:(id)a3
{
}

- (TVSSDictationViewControllerDelegate)delegate
{
  return (TVSSDictationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIView)dictationPlatterView
{
  return self->_dictationPlatterView;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (BOOL)shouldPerformSearchAction
{
  return self->_shouldPerformSearchAction;
}

- (void)setShouldPerformSearchAction:(BOOL)a3
{
  self->_shouldPerformSearchAction = a3;
}

- (void).cxx_destruct
{
}

@end