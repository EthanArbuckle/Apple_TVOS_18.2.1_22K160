@interface TVSSProfileUserGridViewController
- (TVSPPlatterBackgroundView)backgroundView;
- (TVSSProfileUserGridViewControllerDelegate)delegate;
- (TVSUIProfilePanelViewController)profileGridViewController;
- (double)desiredWidth;
- (void)loadView;
- (void)profilePanelViewController:(id)a3 didSelectItemWithType:(int64_t)a4 atIndex:(unint64_t)a5;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProfileGridViewController:(id)a3;
@end

@implementation TVSSProfileUserGridViewController

- (void)loadView
{
  v36 = self;
  SEL v35 = a2;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVSSProfileUserGridViewController;
  -[TVSSProfileUserGridViewController loadView](&v34, "loadView");
  id v33 = -[TVSSProfileUserGridViewController view](v36, "view");
  v2 = objc_alloc_init(&OBJC_CLASS___TVSPPlatterBackgroundView);
  backgroundView = v36->_backgroundView;
  v36->_backgroundView = v2;

  -[TVSPPlatterBackgroundView setTranslatesAutoresizingMaskIntoConstraints:]( v36->_backgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSPPlatterBackgroundView setCornerRadius:](v36->_backgroundView, "setCornerRadius:", 45.0);
  [v33 addSubview:v36->_backgroundView];
  v4 = objc_alloc_init(&OBJC_CLASS___TVSUIProfilePanelViewController);
  profileGridViewController = v36->_profileGridViewController;
  v36->_profileGridViewController = v4;

  -[TVSUIProfilePanelViewController setDelegate:](v36->_profileGridViewController, "setDelegate:", v36);
  -[TVSSProfileUserGridViewController addChildViewController:]( v36,  "addChildViewController:",  v36->_profileGridViewController);
  id v32 = -[TVSUIProfilePanelViewController view](v36->_profileGridViewController, "view");
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = -[TVSPPlatterBackgroundView contentView](v36->_backgroundView, "contentView");
  [v7 addSubview:v32];

  -[TVSUIProfilePanelViewController didMoveToParentViewController:]( v36->_profileGridViewController,  "didMoveToParentViewController:",  v36);
  id v28 = -[TVSPPlatterBackgroundView leadingAnchor](v36->_backgroundView, "leadingAnchor");
  id v27 = [v33 leadingAnchor];
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v37[0] = v26;
  id v25 = -[TVSPPlatterBackgroundView trailingAnchor](v36->_backgroundView, "trailingAnchor");
  id v24 = [v33 trailingAnchor];
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v37[1] = v23;
  id v22 = -[TVSPPlatterBackgroundView topAnchor](v36->_backgroundView, "topAnchor");
  id v21 = [v33 topAnchor];
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v37[2] = v20;
  id v19 = -[TVSPPlatterBackgroundView bottomAnchor](v36->_backgroundView, "bottomAnchor");
  id v18 = [v33 bottomAnchor];
  id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
  v37[3] = v17;
  id v16 = -[TVSPPlatterBackgroundView contentView](v36->_backgroundView, "contentView");
  id v15 = [v16 leadingAnchor];
  id v14 = [v32 leadingAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v37[4] = v13;
  id v12 = -[TVSPPlatterBackgroundView contentView](v36->_backgroundView, "contentView");
  id v11 = [v12 topAnchor];
  id v10 = [v32 topAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v37[5] = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 6LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSPPlatterBackgroundView layoutIfNeeded](v36->_backgroundView, "layoutIfNeeded");
  objc_msgSend(v32, "systemLayoutSizeFittingSize:", CGSizeZero.width, CGSizeZero.height);
  double v31 = v6;
  id v30 = [v33 heightAnchor];
  id v29 = [v30 constraintEqualToConstant:v31];
  [v29 setActive:1];

  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
}

- (double)desiredWidth
{
  if (self->_profileGridViewController) {
    -[TVSUIProfilePanelViewController desiredWidth](self->_profileGridViewController, "desiredWidth");
  }
  else {
    +[TVSPConstants defaultPlatterDesiredWidth](&OBJC_CLASS___TVSPConstants, "defaultPlatterDesiredWidth");
  }
  return result;
}

- (void)profilePanelViewController:(id)a3 didSelectItemWithType:(int64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = -[TVSSProfileUserGridViewController delegate](v7, "delegate");
  -[TVSSProfileUserGridViewControllerDelegate userGridViewControllerRequestsDismissal:]( v5,  "userGridViewControllerRequestsDismissal:",  v7);

  objc_storeStrong(location, 0LL);
}

- (TVSSProfileUserGridViewControllerDelegate)delegate
{
  return (TVSSProfileUserGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSUIProfilePanelViewController)profileGridViewController
{
  return self->_profileGridViewController;
}

- (void)setProfileGridViewController:(id)a3
{
}

- (TVSPPlatterBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end