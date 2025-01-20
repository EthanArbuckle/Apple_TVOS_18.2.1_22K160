@interface TVPPhotoLibraryLemonadeViewController
- (TVPPhotoLibraryLemonadeViewController)initWithPhotoLibrary:(id)a3;
- (UIViewController)lemonadeViewController;
- (int64_t)tabMode;
- (void)setLemonadeViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPPhotoLibraryLemonadeViewController

- (TVPPhotoLibraryLemonadeViewController)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryLemonadeViewController;
  v5 = -[TVPPhotoLibraryLemonadeViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    uint64_t v6 = PXLemonadeViewControllerFactory();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 viewControllerWithPhotoLibrary:v4]);
    lemonadeViewController = v5->_lemonadeViewController;
    v5->_lemonadeViewController = (UIViewController *)v8;
  }

  return v5;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryLemonadeViewController;
  -[TVPPhotoLibraryLemonadeViewController viewDidLoad](&v27, "viewDidLoad");
  -[TVPPhotoLibraryLemonadeViewController addChildViewController:]( self,  "addChildViewController:",  self->_lemonadeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryLemonadeViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  [v3 addSubview:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 leadingAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryLemonadeViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 leadingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
  v28[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v21 trailingAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryLemonadeViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v20 trailingAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v18]);
  v28[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v16 topAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryLemonadeViewController view](self, "view"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v6]);
  v28[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_lemonadeViewController, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryLemonadeViewController view](self, "view"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11]);
  v28[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);

  -[UIViewController didMoveToParentViewController:]( self->_lemonadeViewController,  "didMoveToParentViewController:",  self);
}

- (int64_t)tabMode
{
  return 4LL;
}

- (UIViewController)lemonadeViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLemonadeViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end