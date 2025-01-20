@interface TVPContextMenuContainerViewController
- (TVPContextMenuBackgroundView)backgroundView;
- (TVPContextMenuContainerViewController)init;
- (TVPContextMenuContainerViewController)initWithCoder:(id)a3;
- (TVPContextMenuContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPContextMenuContainerViewController)initWithViewController:(id)a3;
- (UIViewController)contentViewController;
- (void)viewDidLoad;
@end

@implementation TVPContextMenuContainerViewController

- (TVPContextMenuContainerViewController)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPContextMenuContainerViewController;
  v6 = -[TVPContextMenuContainerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
  }

  return v7;
}

- (TVPContextMenuContainerViewController)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuContainerViewController.m",  35,  @"%s is not available as initializer",  "-[TVPContextMenuContainerViewController init]");

  abort();
}

- (TVPContextMenuContainerViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuContainerViewController.m",  39,  @"%s is not available as initializer",  "-[TVPContextMenuContainerViewController initWithCoder:]");

  abort();
}

- (TVPContextMenuContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPContextMenuContainerViewController.m",  43,  @"%s is not available as initializer",  "-[TVPContextMenuContainerViewController initWithNibName:bundle:]");

  abort();
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVPContextMenuContainerViewController;
  -[TVPContextMenuContainerViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuContainerViewController view](self, "view"));
  v4 = objc_alloc_init(&OBJC_CLASS___TVPContextMenuBackgroundView);
  -[TVPContextMenuBackgroundView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVPContextMenuBackgroundView _setContinuousCornerRadius:]( v4,  "_setContinuousCornerRadius:",  *(double *)&qword_100101B70);
  [v3 addSubview:v4];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
  v6 = v4;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuContainerViewController contentViewController](self, "contentViewController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v35 view]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVPContextMenuContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView leadingAnchor](v6, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
  v37[0] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView trailingAnchor](v6, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29]);
  v37[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView topAnchor](v6, "topAnchor"));
  v31 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26]);
  v37[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView bottomAnchor](v6, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v22]);
  v37[3] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 leadingAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView leadingAnchor](v6, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19]);
  v37[4] = v18;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 trailingAnchor]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView trailingAnchor](v6, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
  v37[5] = v10;
  v23 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView topAnchor](v6, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v37[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView bottomAnchor](v6, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
  v37[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 8LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (TVPContextMenuBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
}

@end