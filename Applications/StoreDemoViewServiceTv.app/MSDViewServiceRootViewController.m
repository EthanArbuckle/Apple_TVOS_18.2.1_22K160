@interface MSDViewServiceRootViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)observerAdded;
- (MSDViewServiceRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)displayString;
- (NSTimer)showErrorTimer;
- (NSTimer)timer;
- (UIButton)cancelButton;
- (UILabel)mainLabel;
- (UILabel)statusLabel;
- (UIProgressView)progressBar;
- (UITapGestureRecognizer)secretGestureRecogniser;
- (UITapGestureRecognizer)stopButtonGestureRecogniser;
- (UITextView)errorView;
- (void)doCancelInstall;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationFailed:(id)a3;
- (void)presentConfirmationAlert:(id)a3;
- (void)quit;
- (void)renderViewWithOptions:(id)a3;
- (void)respondToGesture:(id)a3;
- (void)restartTimerWithTimeInterval:(double)a3;
- (void)setCancelButton:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setMainLabel:(id)a3;
- (void)setObserverAdded:(BOOL)a3;
- (void)setProgressBar:(id)a3;
- (void)setSecretGestureRecogniser:(id)a3;
- (void)setShowErrorTimer:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStopButtonGestureRecogniser:(id)a3;
- (void)setTimer:(id)a3;
- (void)showErrorTimeout:(id)a3;
- (void)timeout:(id)a3;
- (void)updateErrorState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSDViewServiceRootViewController

- (MSDViewServiceRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDViewServiceRootViewController;
  v4 = -[MSDViewServiceRootViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"IN_PROGRESS" value:&stru_10000C558 table:0]);
    displayString = v4->_displayString;
    v4->_displayString = (NSString *)v6;
  }

  return v4;
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v20 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v12);

  -[UIView setOpaque:](v20, "setOpaque:", 0LL);
  -[MSDViewServiceRootViewController setView:](self, "setView:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
  v14 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  [v15 bounds];
  -[UIVisualEffectView setFrame:](v14, "setFrame:");

  -[UIVisualEffectView setAutoresizingMask:](v14, "setAutoresizingMask:", 18LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v13));
  v17 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v16);
  -[UIView bounds](v20, "bounds");
  -[UIVisualEffectView setFrame:](v17, "setFrame:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v14, "contentView"));
  [v18 addSubview:v17];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  [v19 insertSubview:v14 atIndex:0];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MSDViewServiceRootViewController;
  -[MSDViewServiceRootViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "respondToGesture:");
  -[MSDViewServiceRootViewController setSecretGestureRecogniser:](self, "setSecretGestureRecogniser:", v3);

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v4 setAllowedPressTypes:&off_10000C8B0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v5 setNumberOfTapsRequired:3];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v6 addGestureRecognizer:v7];

  double v8 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "presentConfirmationAlert:");
  -[MSDViewServiceRootViewController setStopButtonGestureRecogniser:](self, "setStopButtonGestureRecogniser:", v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v9 setAllowedPressTypes:&off_10000C8C8];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v10 setNumberOfTapsRequired:3];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v11 addGestureRecognizer:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v13 setEnabled:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  if (!-[MSDViewServiceRootViewController observerAdded](self, "observerAdded", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
    [v4 addObserver:self forKeyPath:@"errorMessage" options:3 context:0];
    [v4 addObserver:self forKeyPath:@"errorToReport" options:3 context:0];
    [v4 addObserver:self forKeyPath:@"progress" options:3 context:0];
    -[MSDViewServiceRootViewController setObserverAdded:](self, "setObserverAdded:", 1LL);
  }

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance", a3));
  [v3 checkInBlockingUI];
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = sub_100003834();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "StoreDemoViewService disappeared.", v8, 2u);
  }

  if (-[MSDViewServiceRootViewController observerAdded](self, "observerAdded"))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
    [v6 removeObserver:self forKeyPath:@"errorMessage"];

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
    [v7 removeObserver:self forKeyPath:@"errorToReport"];

    -[MSDViewServiceRootViewController setObserverAdded:](self, "setObserverAdded:", 0LL);
  }

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  double v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v2 setClasses:v7 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v7 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface));
  uint64_t v3 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setClasses:v4 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003834();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "StoreDemoView invoked through remote view notification:%{public}@",  (uint8_t *)&v8,  0xCu);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AppleTvBlockingUIOption"]);
  -[MSDViewServiceRootViewController renderViewWithOptions:](self, "renderViewWithOptions:", v7);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v4 = sub_100003834();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "StoreDemoViewClosing through remote view notification.",  v6,  2u);
  }
}

- (void)doCancelInstall
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v3 setEnabled:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v4 setEnabled:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
  [v5 cancelOperation];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v6 dismissWithResult:0];
}

- (void)timeout:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  [v4 setHidden:1];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v5 setEnabled:1];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v6 setEnabled:0];
}

- (void)showErrorTimeout:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView", a3));
  [v4 setHidden:1];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController mainLabel](self, "mainLabel"));
  [v5 setHidden:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 errorMessage]);

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
    [v8 setHidden:0];
  }

- (void)renderViewWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DisplayString"]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_10000C558 table:0]);
  -[MSDViewServiceRootViewController setDisplayString:](self, "setDisplayString:", v7);

  v140 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CancelButton"]);
  id v8 = [v140 BOOLValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
  [v9 setShowCancelButton:v8];

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController displayString](self, "displayString"));
  double v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
  double v11 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont fontWithName:size:]( &OBJC_CLASS___UIFont,  "fontWithName:size:",  @"HelveticaNeue-Thin",  40.0));
  -[UILabel setFont:](v10, "setFont:", v139);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v10, "setTextColor:", v12);

  -[NSMutableParagraphStyle setMinimumLineHeight:](v11, "setMinimumLineHeight:", 45.0);
  -[NSMutableParagraphStyle setMaximumLineHeight:](v11, "setMaximumLineHeight:", 45.0);
  v138 = v11;
  -[NSMutableParagraphStyle setLineSpacing:](v11, "setLineSpacing:", 15.0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 0LL);
  -[UILabel setAdjustsFontSizeToFitWidth:](v10, "setAdjustsFontSizeToFitWidth:", 1LL);
  -[NSMutableParagraphStyle setAlignment:](v11, "setAlignment:", 1LL);
  NSAttributedStringKey v141 = NSParagraphStyleAttributeName;
  v142 = v11;
  v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));
  v13 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v137,  v136);
  -[UILabel setAttributedText:](v10, "setAttributedText:", v13);

  -[UILabel sizeToFit](v10, "sizeToFit");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  [v14 addSubview:v10];

  -[MSDViewServiceRootViewController setMainLabel:](self, "setMainLabel:", v10);
  v15 = objc_alloc_init(&OBJC_CLASS___UIButton);
  -[MSDViewServiceRootViewController setCancelButton:](self, "setCancelButton:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  [v16 setHidden:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:@"STOP_INSTALL" value:&stru_10000C558 table:0]);
  [v18 setTitle:v20 forState:0];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  [v21 sizeToFit];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  [v22 addSubview:v23];

  v24 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[MSDViewServiceRootViewController setStatusLabel:](self, "setStatusLabel:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"ITEM_FAILED" value:&stru_10000C558 table:0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v28 setText:v27];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v29 setLineBreakMode:0];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v30 setNumberOfLines:0];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 14.0));
  [v31 setFont:v32];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v33 setTextAlignment:2];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v34 sizeToFit];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  [v35 addSubview:v36];

  v37 = objc_alloc_init(&OBJC_CLASS___UITextView);
  -[MSDViewServiceRootViewController setErrorView:](self, "setErrorView:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  [v38 setHidden:1];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  [v39 setUserInteractionEnabled:0];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 14.0));
  [v41 setFont:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  [v43 setTextAlignment:0];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  [v44 addSubview:v45];

  v46 = -[UIProgressView initWithProgressViewStyle:]( objc_alloc(&OBJC_CLASS___UIProgressView),  "initWithProgressViewStyle:",  0LL);
  -[MSDViewServiceRootViewController setProgressBar:](self, "setProgressBar:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v48 setHidden:0];

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](&OBJC_CLASS___UIColor, "lightGrayColor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v50 setTrackTintColor:v49];

  v51 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.3,  0.3,  0.75,  0.8));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v52 setTintColor:v51];

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.5,  0.5,  0.5,  0.5));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v54 setTrackTintColor:v53];

  v55 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  0.5));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v56 setTintColor:v55];

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  [v57 addSubview:v58];

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  9LL,  0LL,  v60,  9LL,  1.0,  0.0));
  [v59 addConstraint:v61];

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  10LL,  0LL,  v63,  10LL,  1.0,  0.0));
  [v62 addConstraint:v64];

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  5LL,  0LL,  v66,  5LL,  1.0,  10.0));
  [v65 addConstraint:v67];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  5LL,  0LL,  v69,  5LL,  1.0,  10.0));
  [v68 addConstraint:v70];

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v72,  9LL,  0LL,  v73,  9LL,  1.0,  0.0));
  [v71 addConstraint:v74];

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v76,  10LL,  0LL,  v77,  10LL,  1.0,  0.0));
  [v75 addConstraint:v78];

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v80,  5LL,  0LL,  v81,  5LL,  1.0,  20.0));
  [v79 addConstraint:v82];

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v84,  6LL,  0LL,  v85,  6LL,  1.0,  -20.0));
  [v83 addConstraint:v86];

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v88,  3LL,  0LL,  v89,  3LL,  1.0,  20.0));
  [v87 addConstraint:v90];

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v92,  4LL,  0LL,  v93,  4LL,  1.0,  -20.0));
  [v91 addConstraint:v94];

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v96,  6LL,  0LL,  v97,  6LL,  1.0,  -20.0));
  [v95 addConstraint:v98];

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v100,  4LL,  0LL,  v101,  4LL,  1.0,  -20.0));
  [v99 addConstraint:v102];

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v104,  5LL,  0LL,  v105,  5LL,  1.0,  20.0));
  [v103 addConstraint:v106];

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v108,  9LL,  0LL,  v109,  9LL,  1.0,  0.0));
  [v107 addConstraint:v110];

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v112,  10LL,  0LL,  v113,  10LL,  1.6,  0.0));
  [v111 addConstraint:v114];

  v115 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v117 = (void *)objc_claimAutoreleasedReturnValue([v116 centerXAnchor]);
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v119 = (void *)objc_claimAutoreleasedReturnValue([v118 safeAreaLayoutGuide]);
  v120 = (void *)objc_claimAutoreleasedReturnValue([v119 centerXAnchor]);
  v121 = (void *)objc_claimAutoreleasedReturnValue([v117 constraintEqualToAnchor:v120]);
  [v115 addConstraint:v121];

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v124 = (void *)objc_claimAutoreleasedReturnValue([v123 widthAnchor]);
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v126 = (void *)objc_claimAutoreleasedReturnValue([v125 safeAreaLayoutGuide]);
  v127 = (void *)objc_claimAutoreleasedReturnValue([v126 widthAnchor]);
  v128 = (void *)objc_claimAutoreleasedReturnValue([v124 constraintEqualToAnchor:v127]);
  [v122 addConstraint:v128];

  v129 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController progressBar](self, "progressBar"));
  v131 = (void *)objc_claimAutoreleasedReturnValue([v130 bottomAnchor]);
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController view](self, "view"));
  v133 = (void *)objc_claimAutoreleasedReturnValue([v132 safeAreaLayoutGuide]);
  v134 = (void *)objc_claimAutoreleasedReturnValue([v133 bottomAnchor]);
  v135 = (void *)objc_claimAutoreleasedReturnValue([v131 constraintEqualToAnchor:v134]);
  [v129 addConstraint:v135];

  -[MSDViewServiceRootViewController updateErrorState](self, "updateErrorState");
}

- (void)respondToGesture:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
    if ([v4 showCancelButton])
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
      unsigned __int8 v6 = [v5 isHidden];

      if ((v6 & 1) != 0)
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
        [v7 setEnabled:0];

        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDViewServiceRootViewController stopButtonGestureRecogniser]( self,  "stopButtonGestureRecogniser"));
        [v8 setEnabled:1];

        -[MSDViewServiceRootViewController restartTimerWithTimeInterval:](self, "restartTimerWithTimeInterval:", 10.0);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
        id v11 = v9;
        uint64_t v10 = 0LL;
LABEL_8:
        [v9 setHidden:v10];

        return;
      }
    }

    else
    {
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController cancelButton](self, "cancelButton"));
    id v11 = v9;
    uint64_t v10 = 1LL;
    goto LABEL_8;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  if ([v9 isEqualToString:@"errorToReport"])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000681C;
    v20[3] = &unk_10000C430;
    v12 = &v21;
    objc_copyWeak(&v21, &location);
    v13 = v20;
LABEL_7:
    dispatch_async(&_dispatch_main_q, v13);
    objc_destroyWeak(v12);
    goto LABEL_8;
  }

  if ([v9 isEqualToString:@"errorMessage"])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100006914;
    v18[3] = &unk_10000C430;
    v12 = &v19;
    objc_copyWeak(&v19, &location);
    v13 = v18;
    goto LABEL_7;
  }

  if ([v9 isEqualToString:@"progress"])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100006940;
    v16[3] = &unk_10000C430;
    v12 = &v17;
    objc_copyWeak(&v17, &location);
    v13 = v16;
    goto LABEL_7;
  }

  id v14 = sub_100003834();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100007250(v15);
  }

LABEL_8:
  objc_destroyWeak(&location);
}

- (void)updateErrorState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 errorMessage]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController statusLabel](self, "statusLabel"));
  if (v8)
  {
    [v4 setHidden:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
    unsigned __int8 v6 = v5;
    double v7 = v8;
  }

  else
  {
    [v4 setHidden:1];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController errorView](self, "errorView"));
    unsigned __int8 v6 = v5;
    double v7 = @"<no error>";
  }

  [v5 setText:v7];
}

- (void)operationFailed:(id)a3
{
  if ([a3 code] == (id)3727741088) {
    id v4 = @"CONNECTION_FAILED";
  }
  else {
    id v4 = @"GENERIC_FAILUARE";
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Demo Setup" value:&stru_10000C558 table:0]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v4 value:&stru_10000C558 table:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"OK" value:&stru_10000C558 table:0]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100006C68;
  v13[3] = &unk_10000C458;
  v13[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  v13));
  [v9 addAction:v12];

  -[MSDViewServiceRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (void)restartTimerWithTimeInterval:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController timer](self, "timer"));

  if (v5)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController timer](self, "timer"));
    [v6 invalidate];

    -[MSDViewServiceRootViewController setTimer:](self, "setTimer:", 0LL);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "timeout:",  0LL,  0LL,  a3));
  -[MSDViewServiceRootViewController setTimer:](self, "setTimer:", v7);
}

- (void)presentConfirmationAlert:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController timer](self, "timer", a3));
  [v4 invalidate];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController secretGestureRecogniser](self, "secretGestureRecogniser"));
  [v5 setEnabled:0];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceRootViewController stopButtonGestureRecogniser](self, "stopButtonGestureRecogniser"));
  [v6 setEnabled:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"CONFIRMATION_ALERT_TITLE" value:&stru_10000C558 table:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"CONFIRMATION_ALERT_MESSAGE" value:&stru_10000C558 table:0]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v10,  1LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"STOP" value:&stru_10000C558 table:0]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100006F7C;
  v19[3] = &unk_10000C458;
  v19[4] = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v19));
  [v11 addAction:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"CANCEL" value:&stru_10000C558 table:0]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006F84;
  v18[3] = &unk_10000C458;
  void v18[4] = self;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  v18));
  [v11 addAction:v17];

  -[MSDViewServiceRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
  -[MSDViewServiceRootViewController restartTimerWithTimeInterval:](self, "restartTimerWithTimeInterval:", 30.0);
}

- (void)quit
{
  id v2 = sub_100003834();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting from StoreDemoViewController.", v4, 2u);
  }

  exit(-1);
}

- (NSString)displayString
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDisplayString:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (UITextView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSTimer)showErrorTimer
{
  return self->_showErrorTimer;
}

- (void)setShowErrorTimer:(id)a3
{
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
}

- (BOOL)observerAdded
{
  return self->_observerAdded;
}

- (void)setObserverAdded:(BOOL)a3
{
  self->_observerAdded = a3;
}

- (UITapGestureRecognizer)secretGestureRecogniser
{
  return self->_secretGestureRecogniser;
}

- (void)setSecretGestureRecogniser:(id)a3
{
}

- (UITapGestureRecognizer)stopButtonGestureRecogniser
{
  return self->_stopButtonGestureRecogniser;
}

- (void)setStopButtonGestureRecogniser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end