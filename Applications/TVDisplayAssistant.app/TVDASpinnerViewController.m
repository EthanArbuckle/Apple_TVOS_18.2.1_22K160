@interface TVDASpinnerViewController
- (TVDALoadingStep)loadingStep;
- (TVDASpinnerViewController)initWithLoadingStep:(id)a3 completion:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)internalDescriptionLabel;
- (UILabel)titleLabel;
- (id)completionHandler;
- (void)_handleMenuPress:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVDASpinnerViewController

- (TVDASpinnerViewController)initWithLoadingStep:(id)a3 completion:(id)a4
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  v4 = v23;
  v23 = 0LL;
  v23 = -[TVDASpinnerViewController init](v4, "init");
  objc_storeStrong((id *)&v23, v23);
  if (v23)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    internalDescriptionLabel = v23->_internalDescriptionLabel;
    v23->_internalDescriptionLabel = v5;

    id v7 = objc_retainBlock(v21);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = v7;

    objc_initWeak(&v20, v23);
    id v11 = location[0];
    v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_100007958;
    v17 = &unk_100028A80;
    objc_copyWeak(&v19, &v20);
    id v18 = location[0];
    [v11 startWithCompletionHandler:&v13];
    objc_storeStrong((id *)&v23->_loadingStep, location[0]);
    objc_storeStrong(&v18, 0LL);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v20);
  }

  v10 = v23;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  return v10;
}

- (void)viewDidLoad
{
  v34 = self;
  SEL v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVDASpinnerViewController;
  -[TVDASpinnerViewController viewDidLoad](&v32, "viewDidLoad");
  v31 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
  id v18 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  -[UIActivityIndicatorView setColor:](v31, "setColor:");

  id v19 = -[TVDASpinnerViewController view](v34, "view");
  [v19 addSubview:v31];

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v31,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v23 = -[UIActivityIndicatorView centerXAnchor](v31, "centerXAnchor");
  id v22 = -[TVDASpinnerViewController view](v34, "view");
  id v21 = [v22 centerXAnchor];
  id v20 = objc_msgSend(v23, "constraintEqualToAnchor:");
  [v20 setActive:1];

  id v27 = -[UIActivityIndicatorView centerYAnchor](v31, "centerYAnchor");
  id v26 = -[TVDASpinnerViewController view](v34, "view");
  id v25 = [v26 centerYAnchor];
  id v24 = objc_msgSend(v27, "constraintEqualToAnchor:");
  [v24 setActive:1];

  v2 = -[TVDASpinnerViewController loadingStep](v34, "loadingStep");
  BOOL v28 = v2 == 0LL;

  if (!v28)
  {
    v30 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = v30;
    id v7 = -[TVDASpinnerViewController loadingStep](v34, "loadingStep");
    v6 = -[TVDALoadingStep title](v7, "title");
    -[UILabel setText:](v5, "setText:");

    v8 = v30;
    v9 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v8, "setTextColor:");

    -[UILabel setNumberOfLines:](v30, "setNumberOfLines:");
    -[UILabel setLineBreakMode:](v30, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v30, "setTextAlignment:", 1LL);
    id v10 = -[TVDASpinnerViewController view](v34, "view");
    [v10 addSubview:v30];

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    id v14 = -[UILabel centerXAnchor](v30, "centerXAnchor");
    id v13 = -[TVDASpinnerViewController view](v34, "view");
    id v12 = [v13 centerXAnchor];
    id v11 = objc_msgSend(v14, "constraintEqualToAnchor:");
    [v11 setActive:1];

    id v17 = -[UILabel topAnchor](v30, "topAnchor");
    id v16 = -[UIActivityIndicatorView bottomAnchor](v31, "bottomAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", 40.0);
    [v15 setActive:1];

    -[TVDASpinnerViewController setTitleLabel:](v34, "setTitleLabel:", v30);
    objc_storeStrong((id *)&v30, 0LL);
  }

  -[UIActivityIndicatorView startAnimating](v31, "startAnimating");
  -[TVDASpinnerViewController setSpinnerView:](v34, "setSpinnerView:", v31);
  v3 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v29 = -[UITapGestureRecognizer initWithTarget:action:](v3, "initWithTarget:action:", v34, "_handleMenuPress:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v29, "setAllowedPressTypes:", &off_10002B9A8);
  id v4 = -[TVDASpinnerViewController view](v34, "view");
  [v4 addGestureRecognizer:v29];

  sub_100007458(v34);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVDASpinnerViewController;
  -[TVDASpinnerViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  v3 = -[TVDASpinnerViewController loadingStep](v7, "loadingStep");
  -[TVDALoadingStep cancel](v3, "cancel");
}

- (void)_handleMenuPress:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v4 = -[TVDASpinnerViewController loadingStep](v9, "loadingStep");
  char v6 = 0;
  BOOL v5 = 0;
  if (!-[TVDALoadingStep menuBehavior](v4, "menuBehavior"))
  {
    id v7 = -[TVDASpinnerViewController completionHandler](v9, "completionHandler");
    char v6 = 1;
    BOOL v5 = v7 != 0LL;
  }

  if ((v6 & 1) != 0) {

  }
  if (v5)
  {
    v3 = (void (**)(id, void))-[TVDASpinnerViewController completionHandler](v9, "completionHandler");
    v3[2](v3, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (TVDALoadingStep)loadingStep
{
  return self->_loadingStep;
}

- (UILabel)internalDescriptionLabel
{
  return self->_internalDescriptionLabel;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end