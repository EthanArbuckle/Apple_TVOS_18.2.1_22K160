@interface MTSplashViewController
- (BOOL)visible;
- (UIActivityIndicatorView)spinner;
- (UILabel)label;
- (UIViewController)vc;
- (void)setLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setVc:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTSplashViewController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTSplashViewController;
  -[MTSplashViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = objc_opt_new(&OBJC_CLASS___UIViewController);
  -[MTSplashViewController setVc:](self, "setVc:", v3);

  v4 = objc_opt_new(&OBJC_CLASS___UITabBarController);
  v5 = objc_alloc(&OBJC_CLASS___UINavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
  v7 = -[UINavigationController initWithRootViewController:](v5, "initWithRootViewController:", v6);

  -[UITabBarController setTabBarHidden:animated:](v4, "setTabBarHidden:animated:", 1LL, 0LL);
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  -[UITabBarController setViewControllers:](v4, "setViewControllers:", v8);

  -[MTSplashViewController addChildViewController:](self, "addChildViewController:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](v4, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](v4, "view"));
  [v11 addSubview:v12];

  -[UITabBarController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
  [v13 setBackgroundColor:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTSplashViewController setVisible:](self, "setVisible:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTSplashViewController;
  -[MTSplashViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  dispatch_time_t v5 = dispatch_time(0LL, 1500000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F933C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_after(v5, &_dispatch_main_q, block);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTSplashViewController setVisible:](self, "setVisible:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTSplashViewController;
  -[MTSplashViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewDidLayoutSubviews
{
  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___MTSplashViewController;
  -[MTSplashViewController viewDidLayoutSubviews](&v77, "viewDidLayoutSubviews");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v76 = v12;

    if (-[MTSplashViewController isHorizontallyCompact](self, "isHorizontallyCompact"))
    {
      double v13 = v7 + 15.0;
      double v14 = v9 + 0.0;
      double v15 = v11 + -30.0;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
      [v17 bounds];
      double v13 = IMRectCenteredXInRectScale(v7, v9, 256.0, v76, v18, v19, v20, v21, 0.0);
      double v14 = v22;
      double v15 = v23;
      double v76 = v24;
    }

    double v72 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));
    [v25 frame];
    CGFloat v27 = v26;
    double v69 = v26;
    double v29 = v28;
    CGFloat v31 = v30;
    double v33 = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    [v34 frame];
    double v74 = v35;
    double v75 = v36;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    v78.origin.x = v13;
    v78.origin.y = v14;
    v78.size.width = v15;
    v78.size.height = v76;
    CGFloat Width = CGRectGetWidth(v78);
    v79.origin.y = v14;
    double v73 = v14;
    double v39 = Width;
    v79.origin.x = v13;
    v79.size.width = v15;
    v79.size.height = v76;
    double Height = CGRectGetHeight(v79);
    v80.origin.x = v27;
    v80.origin.y = v29;
    double v68 = v31;
    v80.size.width = v31;
    v80.size.height = v33;
    objc_msgSend(v37, "sizeThatFits:", v39, Height - CGRectGetHeight(v80) + -15.0);
    double v42 = v41;
    double v70 = v41;
    double v71 = v43;
    double v44 = v43;

    v81.origin.x = v27;
    v81.origin.y = v29;
    v81.size.width = v31;
    v81.size.height = v33;
    CGFloat v45 = CGRectGetHeight(v81);
    CGFloat v47 = IMRectCenteredYInRectScale(v46, v74, v75, v42, v44 + v45 + 15.0, v72, v73, v15, v76, 0.0);
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    double v54 = IMRectCenteredXInRectScale(v69, v29, v68, v33, v72, v73, v15, v76, 0.0);
    double v56 = v55;
    double v58 = v57;
    v82.origin.x = v47;
    v82.origin.y = v49;
    v82.size.width = v51;
    v82.size.height = v53;
    double MinY = CGRectGetMinY(v82);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));
    objc_msgSend(v60, "setFrame:", v54, MinY, v56, v58);

    double v61 = IMRectCenteredXInRectScale(v74, v75, v70, v71, v72, v73, v15, v76, 0.0);
    double v63 = v62;
    double v65 = v64;
    v83.origin.x = v54;
    v83.origin.y = MinY;
    v83.size.width = v56;
    v83.size.height = v58;
    CGFloat v66 = CGRectGetMaxY(v83) + 15.0;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    objc_msgSend(v67, "setFrame:", v61, v66, v63, v65);
  }

- (UIViewController)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
}

@end