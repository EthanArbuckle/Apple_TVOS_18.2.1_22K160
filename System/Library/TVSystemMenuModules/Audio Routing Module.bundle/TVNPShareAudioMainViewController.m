@interface TVNPShareAudioMainViewController
- (BOOL)requiresOverlayAssertion;
- (BTShareAudioViewController)btShareAudioViewController;
- (PBSControlCenterOverlayAssertion)overlayAssertion;
- (TVNPShareAudioMainViewControllerDelegate)delegate;
- (void)dealloc;
- (void)setBtShareAudioViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVNPShareAudioMainViewController

- (void)viewDidLoad
{
  v33 = self;
  SEL v32 = a2;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVNPShareAudioMainViewController;
  -[TVNPShareAudioMainViewController viewDidLoad](&v31, "viewDidLoad");
  v20 = objc_alloc(&OBJC_CLASS___PBSControlCenterOverlayAssertion);
  v19 = (objc_class *)objc_opt_class(v33);
  v17 = NSStringFromClass(v19);
  v18 = -[PBSControlCenterOverlayAssertion initWithIdentifier:](v20, "initWithIdentifier:");
  overlayAssertion = v33->_overlayAssertion;
  v33->_overlayAssertion = v18;

  objc_initWeak(&location, v33);
  v3 = (BTShareAudioViewController *)[off_5EB70() instantiateViewController];
  btShareAudioViewController = v33->_btShareAudioViewController;
  v33->_btShareAudioViewController = v3;

  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  v27 = sub_2C28C;
  v28 = &unk_51170;
  objc_copyWeak(v29, &location);
  -[BTShareAudioViewController setCompletion:](v33->_btShareAudioViewController, "setCompletion:", &v24);
  id v23 = -[TVNPShareAudioMainViewController view](v33, "view");
  -[TVNPShareAudioMainViewController addChildViewController:]( v33,  "addChildViewController:",  v33->_btShareAudioViewController);
  id v22 = -[BTShareAudioViewController view](v33->_btShareAudioViewController, "view");
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 addSubview:v22];
  -[BTShareAudioViewController didMoveToParentViewController:]( v33->_btShareAudioViewController,  "didMoveToParentViewController:",  v33);
  id v16 = [v22 leadingAnchor];
  id v15 = [v23 leadingAnchor];
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v34[0] = v14;
  id v13 = [v22 trailingAnchor];
  id v12 = [v23 trailingAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v34[1] = v11;
  id v10 = [v22 topAnchor];
  id v9 = [v23 topAnchor];
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v34[2] = v8;
  id v7 = [v22 bottomAnchor];
  id v6 = [v23 bottomAnchor];
  id v5 = objc_msgSend(v7, "constraintEqualToAnchor:");
  v34[3] = v5;
  id v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v21);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BTShareAudioViewController setCompletion:](self->_btShareAudioViewController, "setCompletion:", 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPShareAudioMainViewController;
  -[TVNPShareAudioMainViewController dealloc](&v2, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPShareAudioMainViewController;
  -[TVNPShareAudioMainViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  if ((-[TVNPShareAudioMainViewController isBeingPresented](v6, "isBeingPresented") & 1) != 0
    && -[TVNPShareAudioMainViewController requiresOverlayAssertion](v6, "requiresOverlayAssertion"))
  {
    -[PBSControlCenterOverlayAssertion acquire](v6->_overlayAssertion, "acquire");
  }

- (void)viewWillDisappear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPShareAudioMainViewController;
  -[TVNPShareAudioMainViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
  if ((-[TVNPShareAudioMainViewController isBeingDismissed](v6, "isBeingDismissed") & 1) != 0
    && -[TVNPShareAudioMainViewController requiresOverlayAssertion](v6, "requiresOverlayAssertion"))
  {
    -[PBSControlCenterOverlayAssertion relinquish](v6->_overlayAssertion, "relinquish");
  }

- (BOOL)requiresOverlayAssertion
{
  BOOL v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  objc_super v3 = -[NSBundle bundleIdentifier](v4, "bundleIdentifier");
  unsigned __int8 v5 = -[NSString isEqualToString:](v3, "isEqualToString:", off_5EB68);

  return v5 & 1;
}

- (TVNPShareAudioMainViewControllerDelegate)delegate
{
  return (TVNPShareAudioMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBSControlCenterOverlayAssertion)overlayAssertion
{
  return self->_overlayAssertion;
}

- (BTShareAudioViewController)btShareAudioViewController
{
  return self->_btShareAudioViewController;
}

- (void)setBtShareAudioViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end