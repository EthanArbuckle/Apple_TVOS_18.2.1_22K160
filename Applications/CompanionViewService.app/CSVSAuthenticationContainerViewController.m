@interface CSVSAuthenticationContainerViewController
- (CSVSAuthenticationContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSVSAuthenticationTransitioningViewController)deviceViewController;
- (UIViewController)contentViewController;
- (id)preferredFocusEnvironments;
- (void)_addContentViewController;
- (void)setContentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSVSAuthenticationContainerViewController

- (CSVSAuthenticationContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationContainerViewController;
  v4 = -[CSVSAuthenticationContainerViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationTransitioningViewController);
    deviceViewController = v4->_deviceViewController;
    v4->_deviceViewController = v5;

    -[CSVSAuthenticationContainerViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 8LL);
    -[CSVSAuthenticationContainerViewController setOverrideUserInterfaceStyle:]( v4,  "setOverrideUserInterfaceStyle:",  2LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController presentationController](v4, "presentationController"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS____UIProgressiveBlurPresentationController);
    id v9 = v7;
    v10 = v9;
    if (v8)
    {
      if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
        v11 = v10;
      }
      else {
        v11 = 0LL;
      }
    }

    else
    {
      v11 = 0LL;
    }

    id v12 = v11;

    [v12 setBlurStyle:4009];
  }

  return v4;
}

- (void)viewDidLoad
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationContainerViewController;
  -[CSVSAuthenticationContainerViewController viewDidLoad](&v44, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v3;

  -[UILayoutGuide setIdentifier:]( self->_contentLayoutGuide,  "setIdentifier:",  @"CSVSAuthenticationContainerViewController.contentLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  [v5 addLayoutGuide:self->_contentLayoutGuide];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  -[CSVSAuthenticationContainerViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_deviceViewController);
  -[CSVSAuthenticationContainerViewController _addContentViewController](self, "_addContentViewController");
  +[CSVSAuthenticationTransitioningViewController defaultSpecifiedWidth]( &OBJC_CLASS___CSVSAuthenticationTransitioningViewController,  "defaultSpecifiedWidth");
  double v8 = v7;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 trailingAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v42 trailingAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40 constant:-10.0]);
  v45[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v38 widthAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToConstant:v8]);
  v45[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 topAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 topAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v32]);
  v45[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 bottomAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 bottomAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v27]);
  v45[3] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 leadingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23 constant:190.0]);
  v45[4] = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self->_deviceViewController, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v21 leadingAnchor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19]);
  v45[5] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12 constant:120.0]);
  v45[6] = v13;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContainerViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bottomAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16 constant:-120.0]);
  v45[7] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 8LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
}

- (void)setContentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (self->_contentViewController != v5)
  {
    v6 = v5;
    -[CSVSAuthenticationContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    -[CSVSAuthenticationContainerViewController _addContentViewController](self, "_addContentViewController");
    v5 = v6;
  }
}

- (void)_addContentViewController
{
  if (-[CSVSAuthenticationContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    contentViewController = self->_contentViewController;
    if (contentViewController)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](contentViewController, "view"));
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

      -[CSVSAuthenticationContainerViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_contentViewController);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v21 leadingAnchor]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19]);
      v22[0] = v18;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v17 trailingAnchor]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v15]);
      v22[1] = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 centerYAnchor]);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_contentLayoutGuide, "centerYAnchor"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToAnchor:v8]);
      v22[2] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 heightAnchor]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_contentLayoutGuide, "heightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintLessThanOrEqualToAnchor:v12]);
      v22[3] = v13;
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
    }
  }

- (id)preferredFocusEnvironments
{
  deviceViewController = self->_deviceViewController;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &deviceViewController,  1LL));
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (CSVSAuthenticationTransitioningViewController)deviceViewController
{
  return self->_deviceViewController;
}

- (void).cxx_destruct
{
}

@end