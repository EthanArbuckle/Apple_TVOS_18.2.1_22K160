@interface IMDebugViewController
- (NSURL)dataUrl;
- (UIButton)actionButton;
- (UIImage)screenShotImage;
- (UIImage)screenShotPreviewImage;
- (UIImageView)screenShotImageView;
- (UIProgressView)progressView;
- (UIStackView)stackView;
- (UIView)progressViewContainer;
- (void)dismiss;
- (void)gatherData;
- (void)setActionButton:(id)a3;
- (void)setDataUrl:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setProgressViewContainer:(id)a3;
- (void)setScreenShotImage:(id)a3;
- (void)setScreenShotImageView:(id)a3;
- (void)setScreenShotPreviewImage:(id)a3;
- (void)setStackView:(id)a3;
- (void)shareData;
- (void)viewDidLoad;
@end

@implementation IMDebugViewController

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___IMDebugViewController;
  -[IMDebugViewController viewDidLoad](&v65, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController navigationItem](self, "navigationItem"));
  [v3 setTitle:@"Debug"];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  [v5 setBackgroundColor:v4];

  v56 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "dismiss");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController navigationItem](self, "navigationItem"));
  [v6 setLeftBarButtonItem:v56];

  v61 = objc_alloc_init(&OBJC_CLASS___UIStackView);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v61,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setAxis:](v61, "setAxis:", 1LL);
  -[UIStackView setSpacing:](v61, "setSpacing:", 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIStackView setBackgroundColor:](v61, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  [v8 addSubview:v61];

  -[IMDebugViewController setStackView:](self, "setStackView:", v61);
  v9 = objc_alloc(&OBJC_CLASS___UIImageView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotPreviewImage](self, "screenShotPreviewImage"));
  v57 = -[UIImageView initWithImage:](v9, "initWithImage:", v10);

  -[UIImageView setContentMode:](v57, "setContentMode:", 1LL);
  LODWORD(v11) = 1132068864;
  -[UIImageView setContentCompressionResistancePriority:forAxis:]( v57,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v11);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v57,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  [v12 addArrangedSubview:v57];

  -[IMDebugViewController setScreenShotImageView:](self, "setScreenShotImageView:", v57);
  v60 = objc_alloc_init(&OBJC_CLASS___UIView);
  LODWORD(v13) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:]( v60,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v13);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UIView setHidden:](v60, "setHidden:", 1LL);
  v58 = -[UIProgressView initWithProgressViewStyle:]( objc_alloc(&OBJC_CLASS___UIProgressView),  "initWithProgressViewStyle:",  0LL);
  LODWORD(v14) = 1148846080;
  -[UIProgressView setContentCompressionResistancePriority:forAxis:]( v58,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v14);
  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:]( v58,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView addSubview:](v60, "addSubview:", v58);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  [v15 addArrangedSubview:v60];

  -[IMDebugViewController setProgressView:](self, "setProgressView:", v58);
  -[IMDebugViewController setProgressViewContainer:](self, "setProgressViewContainer:", v60);
  objc_initWeak(&location, self);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = __36__IMDebugViewController_viewDidLoad__block_invoke;
  v62[3] = &unk_C4B0;
  objc_copyWeak(&v63, &location);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v62));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIButtonConfiguration filledButtonConfiguration]( &OBJC_CLASS___UIButtonConfiguration,  "filledButtonConfiguration"));
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v16,  v55));

  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v17) = 1148846080;
  [v59 setContentCompressionResistancePriority:1 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [v59 setContentHuggingPriority:1 forAxis:v18];
  [v59 setTitle:@"Share Debug Data" forState:0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  [v19 addArrangedSubview:v59];

  -[IMDebugViewController setActionButton:](self, "setActionButton:", v59);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v61, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v54 safeAreaLayoutGuide]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v53 topAnchor]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToSystemSpacingBelowAnchor:v51 multiplier:1.0]);
  v66[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v49 safeAreaLayoutGuide]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v48 bottomAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v61, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:1.0]);
  v66[1] = v45;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v61, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v44 safeAreaLayoutGuide]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 leadingAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v41 constant:16.0]);
  v66[2] = v40;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v61, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v39 safeAreaLayoutGuide]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v38 trailingAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36 constant:-16.0]);
  v66[3] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v59 heightAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintGreaterThanOrEqualToConstant:44.0]);
  v66[4] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v60, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v59 heightAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v31]);
  v66[5] = v30;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView leadingAnchor](v58, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v60, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
  v66[6] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView trailingAnchor](v58, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v60, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
  v66[7] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView centerYAnchor](v58, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v60, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
  v66[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 9LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
}

void __36__IMDebugViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained gatherData];
}

- (void)gatherData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController progressViewContainer](self, "progressViewContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController progressView](self, "progressView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController actionButton](self, "actionButton"));
  LODWORD(v6) = 0;
  [v4 setProgress:v6];
  [v3 setHidden:0];
  [v5 setHidden:1];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __35__IMDebugViewController_gatherData__block_invoke;
  v14[3] = &unk_C4D8;
  id v7 = v4;
  id v15 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __35__IMDebugViewController_gatherData__block_invoke_2;
  v10[3] = &unk_C500;
  objc_copyWeak(&v13, &location);
  id v8 = v3;
  id v11 = v8;
  id v9 = v5;
  id v12 = v9;
  +[IMDebugDataManager writeDebugData:completion:]( &OBJC_CLASS___IMDebugDataManager,  "writeDebugData:completion:",  v14,  v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __35__IMDebugViewController_gatherData__block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return [*(id *)(a1 + 32) setProgress:a2];
}

void __35__IMDebugViewController_gatherData__block_invoke_2(id *a1, void *a2)
{
  v3 = a1 + 6;
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDataUrl:v4];

  [a1[4] setHidden:1];
  [a1[5] setHidden:0];
  id v6 = objc_loadWeakRetained(v3);
  [v6 shareData];
}

- (void)shareData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController dataUrl](self, "dataUrl"));

  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___UIActivityViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController dataUrl](self, "dataUrl"));
    v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v7 = -[UIActivityViewController initWithActivityItems:applicationActivities:]( v4,  "initWithActivityItems:applicationActivities:",  v6,  0LL);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController actionButton](self, "actionButton"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityViewController popoverPresentationController](v7, "popoverPresentationController"));
    [v9 setSourceView:v8];

    -[IMDebugViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
  }

- (void)dismiss
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IMDebugViewController presentingViewController](self, "presentingViewController"));
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)setScreenShotImage:(id)a3
{
  id v5 = a3;
  [v5 size];
  CGFloat v7 = v6 * 0.5;
  [v5 size];
  CGFloat v9 = v8 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v10 scale];
  CGFloat v12 = v11;
  v18.width = v7;
  v18.height = v9;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v12);

  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v9);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  double v14 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  screenShotPreviewImage = self->_screenShotPreviewImage;
  self->_screenShotPreviewImage = v14;

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotImageView](self, "screenShotImageView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotPreviewImage](self, "screenShotPreviewImage"));
  [v17 setImage:v16];
}

- (UIImage)screenShotImage
{
  return self->_screenShotImage;
}

- (UIImage)screenShotPreviewImage
{
  return self->_screenShotPreviewImage;
}

- (void)setScreenShotPreviewImage:(id)a3
{
}

- (NSURL)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIImageView)screenShotImageView
{
  return self->_screenShotImageView;
}

- (void)setScreenShotImageView:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIView)progressViewContainer
{
  return self->_progressViewContainer;
}

- (void)setProgressViewContainer:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end