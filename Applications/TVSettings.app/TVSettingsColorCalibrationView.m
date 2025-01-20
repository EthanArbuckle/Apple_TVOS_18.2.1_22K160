@interface TVSettingsColorCalibrationView
- (BOOL)_isConfirmed;
- (NSArray)calibrationResult;
- (NSNumber)calibrationCodeword;
- (TVSettingsAVPlayer)videoPlayerView;
- (TVSettingsCAPackageView)playerView;
- (TVSettingsColorCalibrationView)initWithFrame:(CGRect)a3;
- (UIButton)viewResultsButton;
- (UILabel)resultLabel;
- (UISegmentedControl)modesControl;
- (id)_urlForResultsVideoForBundle:(id)a3;
- (id)dismissHandler;
- (unint64_t)currentState;
- (void)_animateInVideoPlayerView;
- (void)_hideBox;
- (void)_setBoxColor:(unint64_t)a3;
- (void)_setString:(id)a3 forObjectWithName:(id)a4;
- (void)_setString:(id)a3 forObjectWithName:(id)a4 bold:(BOOL)a5;
- (void)_showProgress:(double)a3;
- (void)applyPressed:(id)a3;
- (void)dealloc;
- (void)loadVideoAsset;
- (void)menuPressed:(id)a3;
- (void)setCalibrationCodeword:(id)a3;
- (void)setCalibrationState:(unint64_t)a3;
- (void)setDismissHandler:(id)a3;
- (void)setResult:(id)a3 targetWhitePoint:(id)a4;
- (void)showDetailsPressed:(id)a3;
- (void)toggleResults:(id)a3;
- (void)viewResultsPressed:(id)a3;
@end

@implementation TVSettingsColorCalibrationView

- (TVSettingsColorCalibrationView)initWithFrame:(CGRect)a3
{
  v98.receiver = self;
  v98.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationView;
  v3 = -[TVSettingsColorCalibrationView initWithFrame:]( &v98,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVSettingsColorCalibrationView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v3));
    v97 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v6 = objc_alloc(&OBJC_CLASS___TVSettingsCAPackageView);
    v7 = -[TVSettingsCAPackageView initWithPackageName:type:inBundle:]( v6,  "initWithPackageName:type:inBundle:",  @"ColorCalibration_tvOS",  kCAPackageTypeArchive,  v97);
    playerView = v3->_playerView;
    v3->_playerView = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    unsigned int v10 = [v9 usesMetricSystem];
    v11 = &stru_100195DD8;
    if (v10) {
      v11 = @"Metric";
    }
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentCalibrateTitle",  v13,  1LL,  0LL,  @"Localizable-Colorimeter");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:bold:]( v3,  "_setString:forObjectWithName:bold:",  v15,  @"Screen_01_Title",  1LL);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v17 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentCalibrateSubtext",  v16,  1LL,  0LL,  @"Localizable-Colorimeter");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:]( v3,  "_setString:forObjectWithName:",  v18,  @"Screen_01_Subtext");

    v19 = (void *)objc_claimAutoreleasedReturnValue([@"AVDisplayAdjustmentStep1Text" stringByAppendingString:v12]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v21 = TSKLocStringFromBundleCachingKey(v19, v20, 1LL, 0LL, @"Localizable-Colorimeter");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:bold:]( v3,  "_setString:forObjectWithName:bold:",  v22,  @"Screen_02_Text",  1LL);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v24 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentStep2Text",  v23,  1LL,  0LL,  @"Localizable-Colorimeter");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:]( v3,  "_setString:forObjectWithName:",  v25,  @"Screen_03_Text");

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v27 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentCompleteText",  v26,  1LL,  0LL,  @"Localizable-Colorimeter");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:]( v3,  "_setString:forObjectWithName:",  v28,  @"Screen_04_Text");

    v29 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    -[NSNumberFormatter setLocale:](v29, "setLocale:", v30);

    v96 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v29, "stringFromNumber:", &off_1001AD4B8));
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:bold:]( v3,  "_setString:forObjectWithName:bold:",  v31,  @"Screen_02_Number",  1LL);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v29, "stringFromNumber:", &off_1001AD4D0));
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:bold:]( v3,  "_setString:forObjectWithName:bold:",  v32,  @"Screen_03_Number",  1LL);

    v33 = v3->_playerView;
    -[TVSettingsColorCalibrationView bounds](v3, "bounds");
    -[TVSettingsCAPackageView setFrame:](v33, "setFrame:");
    -[TVSettingsColorCalibrationView addSubview:](v3, "addSubview:", v3->_playerView);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[AVSampleBufferDisplayLayer layer](&OBJC_CLASS___AVSampleBufferDisplayLayer, "layer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageView rootLayer](v3->_playerView, "rootLayer"));
    [v35 bounds];
    objc_msgSend(v34, "setFrame:");

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageView rootLayer](v3->_playerView, "rootLayer"));
    v95 = v34;
    [v36 insertSublayer:v34 atIndex:0];

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 currentDisplayMode]);
    uint64_t IsHDR = PBSDynamicRangeIsHDR([v38 dynamicRange]);

    TVLColorimeterSetLayerContentCodeword(v34, 4LL, 0LL, IsHDR);
    v40 = objc_alloc(&OBJC_CLASS___TVSettingsAVPlayer);
    -[TVSettingsColorCalibrationView bounds](v3, "bounds");
    v41 = -[TVSettingsAVPlayer initWithFrame:](v40, "initWithFrame:");
    videoPlayerView = v3->_videoPlayerView;
    v3->_videoPlayerView = v41;

    v43 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    resultLabel = v3->_resultLabel;
    v3->_resultLabel = v43;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_resultLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v45 = v3->_resultLabel;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v45, "setBackgroundColor:", v46);

    v47 = v3->_resultLabel;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
    -[UILabel setTextColor:](v47, "setTextColor:", v48);

    -[UILabel setHidden:](v3->_resultLabel, "setHidden:", 1LL);
    -[TVSettingsColorCalibrationView addSubview:](v3, "addSubview:", v3->_resultLabel);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_resultLabel,  5LL,  0LL,  v3,  5LL,  1.0,  40.0));
    v105[0] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_resultLabel,  4LL,  0LL,  v3,  4LL,  1.0,  -40.0));
    v105[1] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v105, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v51);

    uint64_t v52 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    viewResultsButton = v3->_viewResultsButton;
    v3->_viewResultsButton = (UIButton *)v52;

    v54 = v3->_viewResultsButton;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v56 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentViewResultsButton",  v55,  1LL,  0LL,  @"Localizable-Colorimeter");
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    -[UIButton setTitle:forState:](v54, "setTitle:forState:", v57, 0LL);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( v3->_viewResultsButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v58) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:]( v3->_viewResultsButton,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v58);
    -[UIButton addTarget:action:forControlEvents:]( v3->_viewResultsButton,  "addTarget:action:forControlEvents:",  v3,  "viewResultsPressed:",  0x2000LL);
    id v59 = +[_UIFloatingContentView appearanceWhenContainedIn:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedIn:",  objc_opt_class(&OBJC_CLASS___UISegmentedControl),  0LL);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](&OBJC_CLASS___UIColor, "systemDarkGrayColor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 colorWithAlphaComponent:0.85]);
    [v60 setBackgroundColor:v62 forState:0];

    id v63 = +[_UIFloatingContentView appearanceWhenContainedIn:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedIn:",  objc_opt_class(&OBJC_CLASS___UISegmentedControl),  0LL);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v64 setBackgroundColor:v65 forState:8];

    v66 = objc_alloc(&OBJC_CLASS___UISegmentedControl);
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v68 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentBeforeLabel",  v67,  1LL,  0LL,  @"Localizable-Colorimeter");
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v104[0] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v71 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentAfterLabel",  v70,  1LL,  0LL,  @"Localizable-Colorimeter");
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    v104[1] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 2LL));
    v74 = -[UISegmentedControl initWithItems:](v66, "initWithItems:", v73);
    modesControl = v3->_modesControl;
    v3->_modesControl = v74;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:]( v3->_modesControl,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UISegmentedControl setSelectedSegmentIndex:](v3->_modesControl, "setSelectedSegmentIndex:", 1LL);
    -[UISegmentedControl addTarget:action:forControlEvents:]( v3->_modesControl,  "addTarget:action:forControlEvents:",  v3,  "toggleResults:",  4096LL);
    v76 = v3->_modesControl;
    NSAttributedStringKey v102 = NSForegroundColorAttributeName;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v103 = v77;
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
    -[UISegmentedControl setTitleTextAttributes:forState:](v76, "setTitleTextAttributes:forState:", v78, 0LL);

    v79 = v3->_modesControl;
    NSAttributedStringKey v100 = NSForegroundColorAttributeName;
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v101 = v80;
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
    -[UISegmentedControl setTitleTextAttributes:forState:](v79, "setTitleTextAttributes:forState:", v81, 8LL);

    v82 = -[UIGraphicsImageRenderer initWithBounds:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithBounds:",  0.0,  0.0,  7.0,  7.0);
    uint64_t v83 = objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v82, "imageWithActions:", &stru_100191FB0));

    v94 = (void *)v83;
    -[UISegmentedControl setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:]( v3->_modesControl,  "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:",  v83,  0LL,  8LL,  0LL);
    -[UISegmentedControl setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:]( v3->_modesControl,  "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:",  v83,  8LL,  0LL,  0LL);
    v93 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v3,  "applyPressed:");
    -[UISegmentedControl addGestureRecognizer:](v3->_modesControl, "addGestureRecognizer:", v93);
    v84 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v3,  "menuPressed:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v84, "setAllowedPressTypes:", &off_1001AEF50);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v84, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[TVSettingsColorCalibrationView addGestureRecognizer:](v3, "addGestureRecognizer:", v84);
    v85 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v3,  "showDetailsPressed:");
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v85, "setNumberOfTapsRequired:", 4LL);
    -[UITapGestureRecognizer setAllowedPressTypes:](v85, "setAllowedPressTypes:", &off_1001AEF68);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v85, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[TVSettingsColorCalibrationView addGestureRecognizer:](v3, "addGestureRecognizer:", v85);
    -[UIButton setHidden:](v3->_viewResultsButton, "setHidden:", 1LL);
    -[UISegmentedControl setHidden:](v3->_modesControl, "setHidden:", 1LL);
    -[TVSettingsColorCalibrationView addSubview:](v3, "addSubview:", v3->_viewResultsButton);
    -[TVSettingsColorCalibrationView addSubview:](v3, "addSubview:", v3->_modesControl);
    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_viewResultsButton,  9LL,  0LL,  v3,  9LL,  1.0,  0.0));
    v99[0] = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_viewResultsButton,  4LL,  0LL,  v3,  4LL,  1.0,  -100.0));
    v99[1] = v87;
    v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_modesControl,  9LL,  0LL,  v3,  9LL,  1.0,  0.0));
    v99[2] = v88;
    v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_modesControl,  4LL,  0LL,  v3,  4LL,  1.0,  -100.0));
    v99[3] = v89;
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_modesControl,  7LL,  1LL,  v3,  7LL,  0.4,  0.0));
    v99[4] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v99, 5LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v91);

    v3->_currentState = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  id v3 = +[_UIFloatingContentView appearanceWhenContainedIn:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedIn:",  objc_opt_class(&OBJC_CLASS___UISegmentedControl),  0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 setBackgroundColor:0 forState:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationView;
  -[TVSettingsColorCalibrationView dealloc](&v5, "dealloc");
}

- (void)setCalibrationState:(unint64_t)a3
{
  if (a3 - 8 > 0xFFFFFFFFFFFFFFFBLL || self->_currentState != a3)
  {
    self->_currentState = a3;
    switch(a3)
    {
      case 1uLL:
      case 0xAuLL:
        sub_1000310EC();
        -[TVSettingsColorCalibrationView _hideBox](self, "_hideBox");
        -[TVSettingsCAPackageView setState:](self->_playerView, "setState:", 0LL);
        return;
      case 2uLL:
        sub_1000310EC();
        -[TVSettingsColorCalibrationView _hideBox](self, "_hideBox");
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
        unsigned int v8 = [v7 usesMetricSystem];
        v9 = &stru_100195DD8;
        if (v8) {
          v9 = @"Metric";
        }
        unsigned int v10 = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue([@"AVDisplayAdjustmentStep1Text" stringByAppendingString:v10]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v13 = TSKLocStringFromBundleCachingKey(v11, v12, 1LL, 0LL, @"Localizable-Colorimeter");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        -[TVSettingsColorCalibrationView _setString:forObjectWithName:bold:]( self,  "_setString:forObjectWithName:bold:",  v14,  @"Screen_02_Text",  1LL);
        -[TVSettingsCAPackageView setState:](self->_playerView, "setState:", @"State_02");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v16 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentStep1AppendText",  v15,  1LL,  0LL,  @"Localizable-Colorimeter");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v17]);

        objc_initWeak(&location, self);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100084018;
        v21[3] = &unk_100191FD8;
        objc_copyWeak(&v23, &location);
        id v19 = v18;
        id v22 = v19;
        id v20 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v21,  3.0);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        return;
      case 3uLL:
        sub_1000310EC();
        -[TVSettingsColorCalibrationView _hideBox](self, "_hideBox");
        -[TVSettingsCAPackageView setState:](self->_playerView, "setState:", @"State_03");
        -[TVSettingsColorCalibrationView _showProgress:](self, "_showProgress:", 0.0);
        return;
      case 4uLL:
        uint64_t v4 = 1LL;
        goto LABEL_14;
      case 5uLL:
        uint64_t v4 = 2LL;
        goto LABEL_14;
      case 6uLL:
        uint64_t v4 = 3LL;
        goto LABEL_14;
      case 7uLL:
        uint64_t v4 = 4LL;
LABEL_14:
        -[TVSettingsColorCalibrationView _setBoxColor:](self, "_setBoxColor:", v4);
        return;
      case 8uLL:
        -[TVSettingsColorCalibrationView _showProgress:](self, "_showProgress:", 1.0);
        -[TVSettingsColorCalibrationView loadVideoAsset](self, "loadVideoAsset");
        -[TVSettingsColorCalibrationView _hideBox](self, "_hideBox");
        -[TVSettingsCAPackageView setState:](self->_playerView, "setState:", @"State_04");
        uint64_t v6 = 4LL;
        goto LABEL_16;
      case 9uLL:
        -[TVSettingsAVPlayer setAlpha:](self->_videoPlayerView, "setAlpha:", 0.0);
        -[TVSettingsColorCalibrationView insertSubview:atIndex:]( self,  "insertSubview:atIndex:",  self->_videoPlayerView,  0LL);
        LODWORD(v5) = 0.75;
        -[TVSettingsAVPlayer playInLoopWithRate:crossfadeDuration:]( self->_videoPlayerView,  "playInLoopWithRate:crossfadeDuration:",  v5,  1.0);
        -[TVSettingsColorCalibrationView _animateInVideoPlayerView](self, "_animateInVideoPlayerView");
        -[TVSettingsCAPackageView setHidden:](self->_playerView, "setHidden:", 1LL);
        -[UIButton setHidden:](self->_viewResultsButton, "setHidden:", 1LL);
        uint64_t v6 = 5LL;
LABEL_16:
        -[objc_class setHidden:]((&self->super.super.super.isa)[v6], "setHidden:", 0LL);
        -[TVSettingsColorCalibrationView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        break;
      default:
        return;
    }
  }

- (BOOL)_isConfirmed
{
  return -[NSArray isEqualToArray:](self->_calibrationResult, "isEqualToArray:", &off_1001AEF80);
}

- (void)setResult:(id)a3 targetWhitePoint:(id)a4
{
  id v33 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_calibrationResult, a3);
  unsigned int v8 = -[TVSettingsColorCalibrationView _isConfirmed](self, "_isConfirmed");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v8)
  {
    uint64_t v10 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentConfirmedText",  v9,  1LL,  0LL,  @"Localizable-Colorimeter");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:]( self,  "_setString:forObjectWithName:",  v11,  @"Screen_04_Text");

    viewResultsButton = self->_viewResultsButton;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = @"AVDisplayAdjustmentDoneButton";
  }

  else
  {
    uint64_t v15 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentCompleteText",  v9,  1LL,  0LL,  @"Localizable-Colorimeter");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[TVSettingsColorCalibrationView _setString:forObjectWithName:]( self,  "_setString:forObjectWithName:",  v16,  @"Screen_04_Text");

    viewResultsButton = self->_viewResultsButton;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = @"AVDisplayAdjustmentViewResultsButton";
  }

  uint64_t v17 = TSKLocStringFromBundleCachingKey(v14, v13, 1LL, 0LL, @"Localizable-Colorimeter");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UIButton setTitle:forState:](viewResultsButton, "setTitle:forState:", v18, 0LL);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:0]);
  [v19 doubleValue];
  double v21 = v20;

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:1]);
  [v22 doubleValue];
  double v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:2]);
  [v25 doubleValue];
  double v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:3]);
  [v28 doubleValue];
  double v30 = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"R: %.5lf, G: %.5lf, B: %.5lf",  1.0 - v30 + v21 * v30,  1.0 - v30 + v24 * v30,  1.0 - v30 + v27 * v30));
  if (v7)
  {
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Target White Point: %lu  %@",  [v7 unsignedIntegerValue],  v31));

    v31 = (void *)v32;
  }

  -[UILabel setText:](self->_resultLabel, "setText:", v31);
}

- (void)loadVideoAsset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAVPlayer url](self->_videoPlayerView, "url"));

  if (!v3)
  {
    uint64_t v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsColorCalibrationView _urlForResultsVideoForBundle:]( self,  "_urlForResultsVideoForBundle:",  v6));
    -[TVSettingsAVPlayer setUrl:](self->_videoPlayerView, "setUrl:", v5);
  }

- (void)applyPressed:(id)a3
{
  if (self->_dismissHandler)
  {
    -[UISegmentedControl selectedSegmentIndex](self->_modesControl, "selectedSegmentIndex", a3);
    (*((void (**)(void))self->_dismissHandler + 2))();
  }

- (void)menuPressed:(id)a3
{
  if ((-[UISegmentedControl isHidden](self->_modesControl, "isHidden", a3) & 1) == 0)
  {
    if (self->_dismissHandler)
    {
      -[UISegmentedControl selectedSegmentIndex](self->_modesControl, "selectedSegmentIndex");
      (*((void (**)(void))self->_dismissHandler + 2))();
    }
  }

- (void)showDetailsPressed:(id)a3
{
}

- (void)viewResultsPressed:(id)a3
{
  if (-[TVSettingsColorCalibrationView _isConfirmed](self, "_isConfirmed", a3))
  {
    dismissHandler = (void (**)(id, uint64_t))self->_dismissHandler;
    if (dismissHandler) {
      dismissHandler[2](dismissHandler, 1LL);
    }
  }

  else
  {
    -[TVSettingsColorCalibrationView setCalibrationState:](self, "setCalibrationState:", 9LL);
  }

- (void)toggleResults:(id)a3
{
  if ([a3 selectedSegmentIndex] == (id)1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_calibrationResult, "objectAtIndexedSubscript:", 0LL));
    [v4 floatValue];
    float v6 = v5;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_calibrationResult, "objectAtIndexedSubscript:", 1LL));
    [v7 floatValue];
    float v9 = v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_calibrationResult, "objectAtIndexedSubscript:", 2LL));
    [v10 floatValue];
    float v12 = v11;

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_calibrationResult, "objectAtIndexedSubscript:", 3LL));
    [v13 floatValue];
    float v15 = v14;

    sub_100031024(v6, v9, v12, v15);
  }

  else
  {
    sub_1000310EC();
  }

- (void)_setString:(id)a3 forObjectWithName:(id)a4
{
}

- (void)_setString:(id)a3 forObjectWithName:(id)a4 bold:(BOOL)a5
{
  id v10 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageView publishedObjectWithName:](self->_playerView, "publishedObjectWithName:", a4));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CATextLayer);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    [v7 fontSize];
    float v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](&OBJC_CLASS___UIFont, "systemFontOfSize:weight:"));
    [v7 setFont:v9];
    [v7 setString:v10];
  }
}

- (void)_showProgress:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsCAPackageView publishedObjectWithName:]( self->_playerView,  "publishedObjectWithName:",  @"Progress_Mask"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 animationForKey:@"path"]);
  LODWORD(v5) = 0;
  [v7 setSpeed:v5];
  [v4 duration];
  [v7 setTimeOffset:v6 * a3];
}

- (void)_hideBox
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsCAPackageView publishedObjectWithName:]( self->_playerView,  "publishedObjectWithName:",  @"Phone"));
  LODWORD(v2) = 0;
  [v4 setOpacity:v2];
  id v3 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));
}

- (void)_setBoxColor:(unint64_t)a3
{
  id v13 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsCAPackageView publishedObjectWithName:]( self->_playerView,  "publishedObjectWithName:",  @"Phone"));
  id v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  LODWORD(v6) = 1.0;
  [v13 setOpacity:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 sublayers]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  if (!v8)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVSampleBufferDisplayLayer layer](&OBJC_CLASS___AVSampleBufferDisplayLayer, "layer"));
    [v13 bounds];
    objc_msgSend(v8, "setFrame:");
    [v13 addSublayer:v8];
    [v13 setMasksToBounds:1];
  }

  float v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentDisplayMode]);
  uint64_t IsHDR = PBSDynamicRangeIsHDR([v10 dynamicRange]);

  calibrationCodeword = self->_calibrationCodeword;
  if (calibrationCodeword) {
    TVLColorimeterSetLayerContentCodeword( v8,  a3,  -[NSNumber unsignedShortValue](calibrationCodeword, "unsignedShortValue"),  IsHDR);
  }
  else {
    TVLColorimeterSetLayerContent(v8, a3, IsHDR);
  }
}

- (id)_urlForResultsVideoForBundle:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
  int IsHDR = PBSDynamicRangeIsHDR([v5 dynamicRange]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentDisplayMode]);
  int v9 = PBSDisplayResolutionIs4K([v8 resolution]);

  if ((IsHDR & 1) != 0 || v9)
  {
    if (IsHDR) {
      float v11 = @"@2x_HDR";
    }
    else {
      float v11 = @"@2x";
    }
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([@"ColorCalibration" stringByAppendingFormat:v11]);
  }

  else
  {
    id v10 = @"ColorCalibration";
  }

  float v12 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForResource:v10 withExtension:@"mov"]);

  return v12;
}

- (void)_animateInVideoPlayerView
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100084B00;
  v2[3] = &unk_10018E440;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x10000LL,  v2,  0LL,  0.5,  0.0);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (NSNumber)calibrationCodeword
{
  return self->_calibrationCodeword;
}

- (void)setCalibrationCodeword:(id)a3
{
}

- (UIButton)viewResultsButton
{
  return self->_viewResultsButton;
}

- (UISegmentedControl)modesControl
{
  return self->_modesControl;
}

- (UILabel)resultLabel
{
  return self->_resultLabel;
}

- (TVSettingsCAPackageView)playerView
{
  return self->_playerView;
}

- (TVSettingsAVPlayer)videoPlayerView
{
  return self->_videoPlayerView;
}

- (NSArray)calibrationResult
{
  return self->_calibrationResult;
}

- (void).cxx_destruct
{
}

@end